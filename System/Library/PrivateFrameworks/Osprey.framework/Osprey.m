void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_1B97C3D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_4(uint64_t a1, void *a2)
{
  return a2;
}

id LengthPrefixedMessageFromData(void *a1, char a2)
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v7;
  char v8;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a1;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a2;
  objc_msgSend(v5, "appendBytes:length:", &v8, 1);
  v7 = bswap32(objc_msgSend(v4, "length"));
  objc_msgSend(v5, "appendBytes:length:", &v7, 4);
  objc_msgSend(v5, "appendData:", v4);

  return v5;
}

BOOL OspreyEntitlementBoolValue()
{
  void *v0;
  void *v1;
  _BOOL8 value;

  v0 = (void *)xpc_copy_entitlement_for_self();
  v1 = v0;
  if (v0)
    value = xpc_BOOL_get_value(v0);
  else
    value = 0;

  return value;
}

uint64_t OspreyIsEntitledForMPTCP()
{
  NSObject *v0;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (OspreyIsEntitledForMPTCP_onceToken != -1)
    dispatch_once(&OspreyIsEntitledForMPTCP_onceToken, &__block_literal_global_0);
  OspreyLoggingInit();
  v0 = OspreyLogContextNetwork;
  if (os_log_type_enabled((os_log_t)OspreyLogContextNetwork, OS_LOG_TYPE_INFO))
  {
    v2 = 136315394;
    v3 = "OspreyIsEntitledForMPTCP";
    v4 = 1024;
    v5 = OspreyIsEntitledForMPTCP_entitled;
    _os_log_impl(&dword_1B97C2000, v0, OS_LOG_TYPE_INFO, "%s mptcp: %d", (uint8_t *)&v2, 0x12u);
  }
  return OspreyIsEntitledForMPTCP_entitled;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

id AbsintheErrorForState(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyAbsintheAuthenticationErrorDomain"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

CFPropertyListRef _OspreyPreferencesValueForKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.osprey"));
}

void _OspreyPreferencesSetValueForKey(CFPropertyListRef value, CFStringRef key)
{
  CFPreferencesSetAppValue(key, value, CFSTR("com.apple.osprey"));
}

void _OspreyPreferencesDeleteValueForKey(const __CFString *a1)
{
  CFPreferencesSetAppValue(a1, 0, CFSTR("com.apple.osprey"));
}

uint64_t _OspreyPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.osprey"));
}

id ospreyDeviceName()
{
  return (id)MGCopyAnswer();
}

id ospreyProductName()
{
  return (id)MGCopyAnswer();
}

id ospreyProductType()
{
  return (id)MGCopyAnswer();
}

id ospreyBuildVersion()
{
  return (id)MGCopyAnswer();
}

id ospreyProductVersion()
{
  return (id)MGCopyAnswer();
}

double OspreyTimeIntervalToNanoseconds(double a1)
{
  return a1 * 1000000000.0;
}

unint64_t OspreyMachAbsoluteTimeGetNanoseconds(unint64_t a1)
{
  if (_OspreyMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_OspreyMachAbsoluteTimeRate_onceToken, &__block_literal_global_1);
  return (unint64_t)(*(double *)&_OspreyMachAbsoluteTimeRate_rate * (double)a1);
}

void sub_1B97C7EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B97C8228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OspreyLoggingInit()
{
  if (OspreyLoggingInit_once != -1)
    dispatch_once(&OspreyLoggingInit_once, &__block_literal_global_4);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B97C9824(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B97C9A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a7);

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t flatbuffers::FlatBufferBuilder::GetBufferPointer(flatbuffers::FlatBufferBuilder *this)
{
  uint64_t result;

  if (!*((_BYTE *)this + 71))
    flatbuffers::FlatBufferBuilder::GetBufferPointer();
  result = *((_QWORD *)this + 6);
  if (!result)
    flatbuffers::FlatBufferBuilder::GetBufferPointer();
  return result;
}

void sub_1B97C9C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B97C9F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, ...)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  va_list va;

  va_start(va, a8);

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  v15 = *(void **)(v13 - 104);
  if (v15)
  {
    *(_QWORD *)(v13 - 96) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

void sub_1B97CA238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void flatbuffers::vector_downward::~vector_downward(flatbuffers::vector_downward *this)
{
  flatbuffers::vector_downward::clear_buffer(this);
  if (*((_BYTE *)this + 8) && *(_QWORD *)this)
    (*(void (**)(_QWORD))(**(_QWORD **)this + 8))(*(_QWORD *)this);
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
}

_QWORD *flatbuffers::vector_downward::clear_buffer(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = this;
  v2 = this[5];
  if (v2)
  {
    v3 = *this;
    if (*v1)
      this = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    else
      this = (_QWORD *)MEMORY[0x1BCCC4D90](v2, 0x1000C8077774924);
  }
  v1[5] = 0;
  return this;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void flatbuffers::DefaultAllocator::deallocate(flatbuffers::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2)
    JUMPOUT(0x1BCCC4D90);
}

void flatbuffers::DefaultAllocator::~DefaultAllocator(flatbuffers::DefaultAllocator *this)
{
  JUMPOUT(0x1BCCC4DA8);
}

uint64_t flatbuffers::DefaultAllocator::allocate(flatbuffers::DefaultAllocator *this)
{
  return operator new[]();
}

char *flatbuffers::Allocator::reallocate_downward(flatbuffers::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  char *v12;

  if (a4 <= a3)
    flatbuffers::Allocator::reallocate_downward();
  v12 = (char *)(*(uint64_t (**)(flatbuffers::Allocator *, unint64_t))(*(_QWORD *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(flatbuffers::Allocator *, unsigned __int8 *, unint64_t))(*(_QWORD *)this + 24))(this, a2, a3);
  return v12;
}

uint64_t flatbuffers::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(_BYTE *)(this + 70))
    flatbuffers::FlatBufferBuilder::NotNested();
  if (*(_DWORD *)(this + 64))
    flatbuffers::FlatBufferBuilder::NotNested();
  return this;
}

uint64_t flatbuffers::FlatBufferBuilder::EndTable(flatbuffers::FlatBufferBuilder *this, int a2)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int16 v7;
  unsigned __int16 *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  size_t v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;
  _DWORD *v22;

  if (!*((_BYTE *)this + 70))
    flatbuffers::FlatBufferBuilder::EndTable();
  v4 = flatbuffers::FlatBufferBuilder::PushElement<int>((uint64_t)this, 0);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u)
    v5 = 4;
  else
    v5 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  *((_WORD *)this + 34) = v5;
  v6 = (void *)(*((_QWORD *)this + 6) - flatbuffers::vector_downward::ensure_space(this, v5));
  *((_QWORD *)this + 6) = v6;
  bzero(v6, v5);
  v7 = v4 - a2;
  if ((v4 - a2) >= 0x10000)
    flatbuffers::FlatBufferBuilder::EndTable();
  v8 = (unsigned __int16 *)*((_QWORD *)this + 6);
  if (!v8)
    flatbuffers::FlatBufferBuilder::GetBufferPointer();
  v8[1] = v7;
  *v8 = *((_WORD *)this + 34);
  v9 = *((_QWORD *)this + 7);
  if (!v9)
    flatbuffers::FlatBufferBuilder::EndTable();
  v10 = *((unsigned int *)this + 16);
  v11 = v9 - 8 * v10;
  if ((_DWORD)v10)
  {
    v12 = (int *)(v9 - 8 * v10);
    do
    {
      v13 = *((unsigned __int16 *)v12 + 2);
      if (*(unsigned __int16 *)((char *)v8 + v13))
        flatbuffers::FlatBufferBuilder::EndTable();
      v14 = *v12;
      v12 += 2;
      *(unsigned __int16 *)((char *)v8 + v13) = v4 - v14;
    }
    while ((unint64_t)v12 < v9);
  }
  *((_QWORD *)this + 7) = v11;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  v16 = *((_QWORD *)this + 4);
  v15 = *((_QWORD *)this + 5);
  v17 = v16 - (_DWORD)v8 + v15;
  if (*((_BYTE *)this + 81))
  {
    if (!v15)
      flatbuffers::FlatBufferBuilder::EndTable();
    if (v15 < v11)
    {
      v18 = *v8;
      v19 = v15 + v16;
      v20 = (unsigned int *)*((_QWORD *)this + 5);
      while (1)
      {
        v21 = *v20;
        if ((_DWORD)v18 == *(unsigned __int16 *)(v19 - v21) && !memcmp((const void *)(v19 - v21), v8, v18))
          break;
        if ((unint64_t)++v20 >= v11)
        {
          v17 = v16 - (_DWORD)v8 + v15;
          goto LABEL_21;
        }
      }
      v8 = (unsigned __int16 *)((char *)v8 + (v16 - (_DWORD)v8 + v15 - v4));
      *((_QWORD *)this + 6) = v8;
      v17 = v21;
    }
  }
LABEL_21:
  if (v17 == (_DWORD)v16 + (_DWORD)v15 - (_DWORD)v8)
  {
    flatbuffers::vector_downward::ensure_space(this, 4uLL);
    v22 = (_DWORD *)*((_QWORD *)this + 7);
    *v22 = v17;
    *((_QWORD *)this + 7) = v22 + 1;
    v16 = *((_QWORD *)this + 4);
    v15 = *((_QWORD *)this + 5);
  }
  *(_DWORD *)(v15 + v16 - v4) = v17 - v4;
  *((_BYTE *)this + 70) = 0;
  return v4;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<int>(uint64_t a1, int a2)
{
  _DWORD *v4;

  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 4uLL);
  v4 = (_DWORD *)(*(_QWORD *)(a1 + 48)
                - flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a1, 4uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

unint64_t flatbuffers::FlatBufferBuilder::Align(flatbuffers::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((_QWORD *)this + 9) < a2)
    *((_QWORD *)this + 9) = a2;
  return flatbuffers::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

unint64_t flatbuffers::vector_downward::fill(flatbuffers::vector_downward *this, unint64_t a2)
{
  unint64_t result;
  uint64_t v5;

  result = flatbuffers::vector_downward::ensure_space(this, a2);
  *((_QWORD *)this + 6) -= result;
  if (a2)
  {
    v5 = 0;
    do
      *(_BYTE *)(*((_QWORD *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t flatbuffers::vector_downward::ensure_space(flatbuffers::vector_downward *this, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;

  v2 = *((_QWORD *)this + 6);
  v3 = *((_QWORD *)this + 7);
  if (v2 < v3 || (v5 = *((_QWORD *)this + 5), v3 < v5))
    flatbuffers::vector_downward::ensure_space();
  if (v2 - v3 < a2)
  {
    flatbuffers::vector_downward::reallocate(this, a2);
    v5 = *((_QWORD *)this + 5);
    v2 = *((_QWORD *)this + 6);
  }
  if ((*((_DWORD *)this + 8) - v2 + v5) >= 0x7FFFFFFF)
    flatbuffers::vector_downward::ensure_space();
  return a2;
}

uint64_t flatbuffers::vector_downward::reallocate(flatbuffers::vector_downward *this, unint64_t a2)
{
  unsigned __int8 *v4;
  unint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void *v13;

  v5 = *((_QWORD *)this + 4);
  v4 = (unsigned __int8 *)*((_QWORD *)this + 5);
  v6 = &v4[v5 - *((_QWORD *)this + 6)];
  v7 = *((_QWORD *)this + 7) - (_QWORD)v4;
  if (v5)
    v8 = v5 >> 1;
  else
    v8 = *((_QWORD *)this + 2);
  if (v8 > a2)
    a2 = v8;
  v9 = (*((_QWORD *)this + 3) + v5 + a2 - 1) & -*((_QWORD *)this + 3);
  *((_QWORD *)this + 4) = v9;
  v10 = *(_QWORD *)this;
  if (v4)
  {
    if (v10)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
    }
    else
    {
      v13 = &unk_1E7097E38;
      result = (uint64_t)flatbuffers::Allocator::reallocate_downward((flatbuffers::Allocator *)&v13, v4, v5, v9, v6, v7);
    }
  }
  else if (v10)
  {
    result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v10 + 16))(v10, v9);
  }
  else
  {
    result = operator new[]();
  }
  v12 = result + *((_QWORD *)this + 4) - v6;
  *((_QWORD *)this + 5) = result;
  *((_QWORD *)this + 6) = v12;
  *((_QWORD *)this + 7) = result + v7;
  return result;
}

void flatbuffers::FlatBufferBuilder::~FlatBufferBuilder(flatbuffers::FlatBufferBuilder *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 11);
  if (v2)
  {
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(*((_QWORD *)this + 11), *(_QWORD **)(v2 + 8));
    MEMORY[0x1BCCC4DA8](v2, 0x1060C40C2B13FB5);
  }
  flatbuffers::vector_downward::~vector_downward(this);
}

void std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(a1, *a2);
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(flatbuffers::FlatBufferBuilder *result, uint64_t a2, unsigned int a3)
{
  unint64_t v4;
  int v5;

  if (a3)
  {
    v4 = (unint64_t)result;
    v5 = flatbuffers::FlatBufferBuilder::ReferTo(result, a3);
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v4, a2, v5, 0);
  }
  return result;
}

unint64_t flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(unint64_t result, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  unsigned int v6;
  unsigned int v7;

  v5 = result;
  if (a3 != a4 || *(_BYTE *)(result + 80))
  {
    v6 = flatbuffers::FlatBufferBuilder::PushElement<int>(result, a3);
    result = flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)v5, 8uLL);
    **(_QWORD **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(_QWORD *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    v7 = *(unsigned __int16 *)(v5 + 68);
    if (v7 <= a2)
      LOWORD(v7) = a2;
    *(_WORD *)(v5 + 68) = v7;
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::ReferTo(flatbuffers::FlatBufferBuilder *this, unsigned int a2)
{
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  flatbuffers::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    flatbuffers::FlatBufferBuilder::ReferTo();
  }
  return v6 + 4;
}

uint64_t flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(flatbuffers::FlatBufferBuilder *a1, const void *a2, unint64_t a3)
{
  void *v6;

  flatbuffers::FlatBufferBuilder::StartVector(a1, a3, 1uLL);
  if (a3)
  {
    v6 = (void *)(*((_QWORD *)a1 + 6) - flatbuffers::vector_downward::ensure_space(a1, a3));
    *((_QWORD *)a1 + 6) = v6;
    memcpy(v6, a2, a3);
  }
  return flatbuffers::FlatBufferBuilder::EndVector(a1, a3);
}

unint64_t flatbuffers::FlatBufferBuilder::StartVector(flatbuffers::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)this);
  *((_BYTE *)this + 70) = 1;
  v6 = a3 * a2;
  flatbuffers::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return flatbuffers::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t flatbuffers::FlatBufferBuilder::EndVector(flatbuffers::FlatBufferBuilder *this, int a2)
{
  if (!*((_BYTE *)this + 70))
    flatbuffers::FlatBufferBuilder::EndVector();
  *((_BYTE *)this + 70) = 0;
  return flatbuffers::FlatBufferBuilder::PushElement<int>((uint64_t)this, a2);
}

unint64_t flatbuffers::FlatBufferBuilder::PreAlign(flatbuffers::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((_QWORD *)this + 9) < a3)
    *((_QWORD *)this + 9) = a3;
  return flatbuffers::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

uint64_t flatbuffers::FlatBufferBuilder::Finish(flatbuffers::FlatBufferBuilder *this, unsigned int a2, const char *a3, int a4)
{
  _BOOL4 v8;
  uint64_t v9;
  _DWORD *v10;
  int v11;
  uint64_t result;

  v8 = a3 != 0;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)this);
  *((_QWORD *)this + 7) = *((_QWORD *)this + 5);
  v9 = 4;
  if (a4)
    v9 = 8;
  flatbuffers::FlatBufferBuilder::PreAlign(this, v9 + 4 * v8, *((_QWORD *)this + 9));
  if (a3)
  {
    if (strlen(a3) != 4)
      flatbuffers::FlatBufferBuilder::Finish();
    v10 = (_DWORD *)(*((_QWORD *)this + 6) - flatbuffers::vector_downward::ensure_space(this, 4uLL));
    *((_QWORD *)this + 6) = v10;
    *v10 = *(_DWORD *)a3;
  }
  v11 = flatbuffers::FlatBufferBuilder::ReferTo(this, a2);
  result = flatbuffers::FlatBufferBuilder::PushElement<int>((uint64_t)this, v11);
  if (a4)
    result = flatbuffers::FlatBufferBuilder::PushElement<int>((uint64_t)this, *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
  *((_BYTE *)this + 71) = 1;
  return result;
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B97CACA0(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E7097A00, MEMORY[0x1E0DE42D0]);
}

void sub_1B97CAD4C(_Unwind_Exception *a1)
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

void OUTLINED_FUNCTION_3_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void sub_1B97CB3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_1B97CC0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
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

void sub_1B97CE674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B97CE930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1B97CF9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B97CFEB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t sub_1B97D0968(mach_port_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t *a5, _QWORD *a6, unsigned int *a7)
{
  mach_port_t reply_port;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  int v24;

  v18 = 1;
  v19 = a3;
  v20 = 16777472;
  v21 = a4;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = __PAIR64__(a4, a2);
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 3, 0x3Cu, 0x48u, reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if ((_DWORD)v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    v15 = 4294966988;
  }
  else if (msg.msgh_id == 1300)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      v15 = 4294966996;
      if (v18 == 1 && msg.msgh_size == 64 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
      {
        v16 = v21;
        if (v21 == v24)
        {
          *a5 = v23;
          *a6 = v19;
          *a7 = v16;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      v15 = 4294966996;
      if (HIDWORD(v19))
      {
        if (msg.msgh_remote_port)
          v15 = 4294966996;
        else
          v15 = HIDWORD(v19);
      }
    }
    else
    {
      v15 = 4294966996;
    }
  }
  else
  {
    v15 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v15;
}

uint64_t sub_1B97D0B5C(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t msg;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = 1;
  v12 = a4;
  v13 = 16777472;
  v14 = a5;
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a2;
  v17 = a3;
  v18 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3, 0x44u, 0x2Cu, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }
  if ((_DWORD)v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    v8 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id != 1301)
  {
    v8 = 4294966995;
    goto LABEL_17;
  }
  v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v8 = HIDWORD(v12);
  if (HIDWORD(v12))
    goto LABEL_17;
  return v8;
}

uint64_t sub_1B97D0CD4(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;

  v17 = 1;
  v18 = a4;
  v19 = 16777472;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a2;
  v23 = a3;
  v24 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x44u, 0x40u, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }
  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (msg.msgh_id == 71)
  {
    v14 = 4294966988;
  }
  else if (msg.msgh_id == 1302)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      v14 = 4294966996;
      if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
      {
        v15 = v20;
        if (v20 == v22)
        {
          *a6 = v18;
          *a7 = v15;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      v14 = 4294966996;
      if (HIDWORD(v18))
      {
        if (msg.msgh_remote_port)
          v14 = 4294966996;
        else
          v14 = HIDWORD(v18);
      }
    }
    else
    {
      v14 = 4294966996;
    }
  }
  else
  {
    v14 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v14;
}

uint64_t sub_1B97D0EC4(mach_port_t a1, unsigned int a2, uint64_t a3)
{
  mach_port_t reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t msg;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v9 = *MEMORY[0x1E0C804E8];
  v10 = a2;
  v11 = a3;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v5 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v6;
  }
  if ((_DWORD)v5)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v6;
  }
  else
  {
    if (msg.msgh_id == 71)
    {
      v6 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      v6 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        v6 = v10;
        if (!v10)
          return v6;
      }
    }
    else
    {
      v6 = 4294966995;
    }
    mach_msg_destroy(&msg);
    return v6;
  }
}

void sub_1B97D1014(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1B97D10CC()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8
                                             * (((((v1 + 121702045) & 0x856FEF6) - 4) * (v2 == 0)) ^ (v0 + v1 + 2)))
                            - 8))();
}

uint64_t sub_1B97D110C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t))(a1 + 8 * (v1 - 3)))(v3);
  *(_DWORD *)(v2 + 24) = 0;
  return result;
}

void KxmB0CKvgWt(uint64_t a1, int a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = v2;
  __asm { BR              X9 }
}

uint64_t sub_1B97D12E4()
{
  return 4294923273;
}

void sub_1B97D1414(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[23];

  *(_QWORD *)&v5[15] = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 ^ (646995413 * ((((2 * a1) | 0x8F18737E) - a1 + 947111489) ^ 0x534DB4D5));
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned int *)off_1E7098A50[v1 - 36];
  strcpy(v5, "com.apple.absd");
  v4 = *(_QWORD *)((char *)off_1E7098A50[v1 - 46]
                 + 8
                 * ((123
                   * (((unsigned int (*)(uint64_t, _BYTE *, uint64_t))off_1E7098A50[v1 - 40])(v3, v5, v2) == 0)) ^ v1)
                 - 12)
     - ((v1 + 23) ^ 0x41);
  __asm { BR              X9 }
}

void sub_1B97D1518()
{
  uint64_t v0;
  int v1;

  *(_DWORD *)(v0 + 4) = v1;
}

void nDYmeMqvWb(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v3;
  int v5;

  if (a1)
    v3 = a2 == 0;
  else
    v3 = 1;
  v5 = v3 || a3 == 0;
  __asm { BR              X9 }
}

uint64_t sub_1B97D1614()
{
  return 4294923273;
}

void sub_1B97D1738(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B97D17E4()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, uint64_t (*)()))(v2 + 8 * (v0 & 0x40188)))(*(_QWORD *)(v2 + 8 * (v0 & 0x40000402)), nullsub_1);
  *v1 = -1133814153;
  return result;
}

void t1BoNctgaUu66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  int v5;

  if (a1)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  __asm { BR              X9 }
}

uint64_t sub_1B97D2868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  void (*v11)(int *);
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD *v19;
  unsigned int v20;

  v14[0] = *(_QWORD *)(v6 + 16);
  v20 = 1829790799 * (((&v18 | 0xDC543C92) - (&v18 & 0xDC543C92)) ^ 0x1E9D9CD9) + 463207035;
  v19 = v14;
  v11 = *(void (**)(int *))(a6 + 48);
  v11(&v18);
  v14[0] = *(_QWORD *)(v6 + 248);
  v14[1] = a1;
  v14[2] = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v19 = v14;
  v20 = 1829790799 * (&v18 ^ 0xC2C9A04B) + 463207035;
  v11(&v18);
  return (v18 - 955058042);
}

uint64_t sub_1B97D29A8(char a1, unsigned int a2)
{
  return byte_1B981C140[(byte_1B981BE40[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B97D29D4(unsigned int a1)
{
  return byte_1B981C140[byte_1B981BE40[a1] ^ 0xCE] ^ a1;
}

uint64_t sub_1B97D2A00(char a1, unsigned int a2)
{
  return byte_1B981C240[(byte_1B981BF40[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B97D2A2C(unsigned int a1)
{
  return byte_1B981C240[byte_1B981BF40[a1] ^ 0xE2] ^ a1;
}

uint64_t sub_1B97D2A58(char a1, unsigned int a2)
{
  return byte_1B981C040[(byte_1B981C540[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B97D2A84(unsigned int a1)
{
  return byte_1B981C040[byte_1B981C540[a1] ^ 0xD6] ^ a1;
}

uint64_t sub_1B97D2AB0(char a1, unsigned int a2)
{
  return byte_1B981C440[(byte_1B981C340[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B97D2ADC(unsigned int a1)
{
  return byte_1B981C440[byte_1B981C340[a1] ^ 0x34] ^ a1;
}

uint64_t Be81a395Bf0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  qword_1EF22F180 = 1681628227 * ((qword_1EF22F180 - (_QWORD)&v4 + qword_1EF22F170) ^ 0x68EECD5B1F580389);
  qword_1EF22F170 = qword_1EF22F180;
  v1 = *(_QWORD *)((char *)off_1E7098A50[((67 * ((2 * qword_1EF22F180) ^ 0x89)) ^ byte_1B981C440[byte_1B981C340[(67 * ((2 * qword_1EF22F180) ^ 0x89))] ^ 0x34])
                                       - 49]
                 + 140)
     - 4;
  v2 = 942846689 * ((unint64_t)&v5 ^ 0x2DF4282E8CBBA516);
  v5 = v2 ^ 0xF067FA72;
  v6 = a1;
  v7 = v1 ^ v2;
  sub_1B97D1014((uint64_t)&v5);
  return v8;
}

uint64_t IW1PcFszqNK(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  qword_1EF22F178 = 1681628227 * ((qword_1EF22F170 + qword_1EF22F178) ^ (unint64_t)&v4 ^ 0x68EECD5B1F580389);
  qword_1EF22F170 = qword_1EF22F178;
  v1 = *(_QWORD *)((char *)off_1E7098A50[((67 * ((2 * qword_1EF22F178) ^ 0x89)) ^ byte_1B981C040[byte_1B981C540[(67 * ((2 * qword_1EF22F178) ^ 0x89))] ^ 0xD6])
                                       - 8]
                 + 28)
     - 4;
  v2 = 942846689
     * ((((unint64_t)&v5 | 0xDBD392286209E2F0)
       - ((unint64_t)&v5 | 0x242C6DD79DF61D0FLL)
       + 0x242C6DD79DF61D0FLL) ^ 0xF627BA06EEB247E6);
  v5 = v2 ^ 0xF067FA72;
  v6 = a1;
  v7 = v1 ^ v2;
  sub_1B97D1014((uint64_t)&v5);
  return v8;
}

_QWORD *sub_1B97D2DD0(_QWORD *result)
{
  *result = ++qword_1EF22FDF8;
  return result;
}

uint64_t sub_1B97D2DEC(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, _QWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v17;
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  mach_msg_header_t msg;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v30 = 1;
  v31 = a4;
  v32 = 16777472;
  v33 = a5;
  v34 = *MEMORY[0x1E0C804E8];
  v17 = *a3;
  v35 = a2;
  v36 = v17;
  v37 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            v21 = v33;
            if (v33 == v47)
            {
              v20 = 0;
              v22 = v34;
              *a3 = v38;
              v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v31);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_1B97D3044(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_msg_header_t msg;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3[5];
  v19 = a3[4];
  v20 = v4;
  v5 = a3[7];
  v21 = a3[6];
  v22 = v5;
  v6 = a3[1];
  v15 = *a3;
  v16 = v6;
  v7 = a3[3];
  v17 = a3[2];
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a2;
  v18 = v7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    v10 = 4294966995;
    goto LABEL_17;
  }
  v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v10 = v14;
  if (v14)
    goto LABEL_17;
  return v10;
}

uint64_t sub_1B97D31D0(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE v23[28];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 1;
  v19 = a6;
  v20 = 16777472;
  v21 = a7;
  v22 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  v24 = a7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_1B97D33BC(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  int v16;
  mach_msg_header_t msg;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            v12 = v18;
            if (!v18)
            {
              v15 = v20;
              *a2 = v19;
              *a3 = v15;
              v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = v18 == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = v18;
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

uint64_t sub_1B97D3534(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((((2 * a1) | 0x340440B2) - a1 + 1711136679) ^ 0xF7F63850);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + (v1 ^ 0x5EF))
                              + (((*(_QWORD *)a1 == *(_QWORD *)(a1 + 8)) * ((51 * (v1 ^ 0x5DA)) ^ 0x630)) ^ v1)
                              - 1)
                            - 8))();
}

uint64_t sub_1B97D35BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v4 = *(_DWORD *)(v2 - 0xC7F991DE6408E19);
  v5 = v4 - 159353952;
  if (v4 - 159353952 < 0)
    v5 = 159353952 - v4;
  *(_DWORD *)(v1 - 0xC7F991DE6408E19) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((93
                                * ((v5 ^ 0xF9CB9BF3) + 1459613664 + ((v5 << (v3 - 44)) & 0xF39737E6) != ((v3 - 104) ^ 0x50CB8E16))) ^ v3)))();
}

uint64_t sub_1B97D3650@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(v2 - 0xC7F991DE6408E15) + 4 * (v5 - 1355516884)) = *(_DWORD *)(*(_QWORD *)(v3 - 0xC7F991DE6408E15)
                                                                                           + 4 * (v5 - 1355516884));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((425 * (v5 - 1 == v1)) ^ (v4 - 444)))
                            - ((211 * ((v4 - 444) ^ 0x476u)) ^ 0x5CDLL)))();
}

void sub_1B97D36C8()
{
  JUMPOUT(0x1B97D3690);
}

void sub_1B97D36D4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }
}

uint64_t sub_1B97D37B0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067 * (((&a4 | 0xA509F51) - (&a4 & 0xA509F51)) ^ 0xD496228A);
  a7 = &STACK[0x37021DA48139155A];
  a4 = &STACK[0x42E48BBDD224DE3D];
  a5 = v10;
  a8 = v12 ^ 0x64BC49B;
  a6 = (v11 + 172) ^ v12;
  v13 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v11 - 1)) - 8))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v10 - 0x27681A84B35EB0EDLL) == v8)
                                                        * (37 * (((v11 + 211) | 0x418) ^ 0x51C) + 1560)) ^ v11))
                                          - 4))(v13);
}

uint64_t sub_1B97D38A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  unsigned int v11;
  uint64_t v12;
  int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((((a11 ^ v11) < 0x15) * (((v13 - 1296) | 0xB0) - 125)) ^ v13))
                            - 12))();
}

uint64_t sub_1B97D38D8()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  int v4;

  *v1 = v0;
  v4 = v0 - ((2 * v0) & 0x317341DE) + 414818497 + ((2 * (v3 - 11)) ^ 0xA32);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((602
                                          * ((((3 * ((v3 - 11) ^ 0x52B)) ^ 0x1DFFFFC3) & (2 * v4) ^ 0x1173418C)
                                           + (v4 ^ 0x96465F39)
                                           + 2010721788 != 114896338)) ^ (v3 - 11)))
                            - 8))();
}

uint64_t sub_1B97D3974(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((244
                                          * ((((a1 + 1147) ^ (v2 + v1 + ((a1 + 1212) ^ 0x71000501u) < 8)) & 1) == 0)) ^ a1))
                            - 12))();
}

uint64_t sub_1B97D39CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;

  v7 = v4 - v5 - (unint64_t)(6 * (a4 ^ 0x5DCu)) + 1478 > 0x1F;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((4 * v7) | (16 * v7)) ^ a4)) - 8))();
}

uint64_t sub_1B97D3A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v6
                                                     + 8
                                                     * (((((v5 < 0x20) ^ (a5 - 17)) & 1)
                                                       * (((a5 - 1401) | 0x2AA) - 723)) ^ a5))
                                         - 12))(0);
}

uint64_t sub_1B97D3A68(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;

  v9 = v6 + v5 + v7;
  v10.i64[0] = 0x3232323232323232;
  v10.i64[1] = 0x3232323232323232;
  v11 = v2 + v9;
  v12 = v3 + v9;
  v13 = veorq_s8(*(int8x16_t *)(v11 - 31), v10);
  *(int8x16_t *)(v12 - 15) = veorq_s8(*(int8x16_t *)(v11 - 15), v10);
  *(int8x16_t *)(v12 - 31) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (int)((((v4 & 0xFFFFFFE0) == 32) * (((a2 & 0xC12997FF) + 440) ^ 0x74E)) ^ ((a2 & 0xC12997FF) + 796)))
                            - 4))();
}

void sub_1B97D3AD8()
{
  JUMPOUT(0x1B97D3A8CLL);
}

void sub_1B97D3AE4()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_1B97D3D2C(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  BOOL v6;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x27681A84B35EB0F9) + 503480823;
  v4 = *(_DWORD *)a1 + v1 + 380801153;
  v5 = (v4 < 0x41F83143) ^ (v3 < 0x41F83143);
  v6 = v3 < v4;
  if (v5)
    v6 = v4 < 0x41F83143;
  v2 = *(_DWORD *)(a1 + 16) + v1;
  __asm { BR              X11 }
}

uint64_t sub_1B97D3E2C()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1 + 8 * (((v0 + 34 + 14 * (v0 ^ 0xD1) - 361) * (v2 == 1236742230)) ^ v0)))();
}

uint64_t sub_1B97D3E64()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((*(_DWORD *)(v1 - 0x27681A84B35EB0F5) == 310716794) ^ (v0 + 26)) & 1)
                                     * (((v0 + 697466275) & 0xD66D8371) + 507)) ^ v0)))();
}

uint64_t sub_1B97D3EC0@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *(_BYTE *)(*(_QWORD *)(v3 - 0x27681A84B35EB105) + (v5 - 1547459025 + v2)) = *(_BYTE *)(*(_QWORD *)(v3 - 0x27681A84B35EB105) + v2 - 310717355 + ((v1 + 707075844) & 0xD5DADBF6));
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((189 * (v2 - 1 == a1)) ^ v1)) - 12))();
}

void sub_1B97D3F3C()
{
  JUMPOUT(0x1B97D3F04);
}

uint64_t sub_1B97D3F44()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v3 = ((v0 - 1119) & *(_DWORD *)(v1 - 0x27681A84B35EB0F1)) == 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((2 * (((v0 - 71) ^ v3) & 1)) & 0xEF | (16
                                                                                       * (((v0 - 71) ^ v3) & 1)) | v0)))();
}

void sub_1B97D3F84()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 0x27681A84B35EB0EDLL) = -1645193683;
}

void sub_1B97D4494(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1225351577
            * ((-1431559688 - (a1 ^ 0x637B64C4 | 0xAAAC21F8) + (a1 ^ 0x637B64C4 | 0x5553DE07)) ^ 0x15B262D5));
  __asm { BR              X15 }
}

void sub_1B97D45C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;

  *(_DWORD *)(a4 + v5) = v4;
}

uint64_t sub_1B97D54C4(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  v1 = 1224239923 * (((a1 | 0x8C9528F6) - (_DWORD)a1 + (a1 & 0x736AD709)) ^ 0x7E26D521);
  v2 = a1[4] - v1;
  v3 = *a1 ^ v1;
  v5 = v3 - 1051670498;
  v4 = v3 - 1051670498 < 0;
  LODWORD(v6) = 1051670498 - v3;
  if (v4)
    v6 = v6;
  else
    v6 = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + (int)(v2 ^ 0xF4))
                              + (int)((484 * (v6 != ((2 * (_DWORD)v6) & 0xD0B90CAE))) ^ v2)
                              - 1)
                            - 4))();
}

void sub_1B97D557C(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  **(_DWORD **)(v1 - 0xC7F991DE6408E15) = (v2 + 1750894167) ^ 0xD7B70E58;
  *(_DWORD *)(v1 - 0xC7F991DE6408E19) = a1 + 1;
}

void sub_1B97D55D4(uint64_t a1)
{
  int v1;

  v1 = (628203409 * ((1303688841 - (a1 | 0x4DB4B689) + (a1 | 0xB24B4976)) ^ 0x30C34545)) ^ *(_DWORD *)(a1 + 16) ^ 0x43C;
  __asm { BR              X7 }
}

uint64_t sub_1B97D578C(int a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, unsigned int a7)
{
  int v7;
  unint64_t v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((v7 + a1) & a2 ^ (1022 * (v9 == 31))))
                            - ((5 * ((((v7 + a1) & a2) + a5) & a6 ^ a7)) ^ v8)))();
}

void sub_1B97D57F0()
{
  JUMPOUT(0x1B97D5758);
}

uint64_t sub_1B97D57F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  *(_DWORD *)(a11 - 0x7542B2AE5773787) = 1292221340 - v16;
  v22 = 1224239923 * (((v21 - 136) & 0x8278F9B6 | ~((v21 - 136) | 0x8278F9B6)) ^ 0x8F34FB9E);
  *(_DWORD *)(v21 - 120) = v22 + v20 - 620;
  *(_QWORD *)(v21 - 128) = a15;
  *(_DWORD *)(v21 - 136) = v22 ^ 0x3EAF37E3;
  sub_1B97D54C4((_DWORD *)(v21 - 136));
  v23 = 1759421093 * ((2 * ((v21 - 136) & 0x4FEBF750) - (v21 - 136) - 1340864343) ^ 0x369B8FD);
  *(_DWORD *)(v21 - 136) = ((v20 ^ 0x1BF9F000) & (v17 << 6))
                         - v23
                         + ((v17 << ((v20 + 53) & 0xB7 ^ 0x32)) ^ 0x8DFCF9B9)
                         + 2069626752;
  *(_QWORD *)(v21 - 128) = a15;
  *(_DWORD *)(v21 - 120) = v20 - v23 + 636;
  sub_1B97F56C0(v21 - 136);
  *(_DWORD *)(v21 - 120) = v20 + 1374699841 * ((v21 - 136) ^ 0x6DF41809) + 635;
  *(_QWORD *)(v21 - 136) = a16;
  *(_QWORD *)(v21 - 128) = &STACK[0xC7F991DE6408E5D];
  sub_1B97D3534(v21 - 136);
  *(_DWORD *)(v21 - 120) = v20
                         + 1178560073
                         * ((((v21 - 136) ^ 0xFBA47593 | 0x3D05B776)
                           - ((v21 - 136) ^ 0xFBA47593)
                           + (((v21 - 136) ^ 0xFBA47593) & 0xC2FA4889)) ^ 0x7C35BA87)
                         + 775;
  *(_QWORD *)(v21 - 128) = a16;
  *(_QWORD *)(v21 - 112) = a15;
  v24 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v20 ^ 0x3F7)))(v21 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((31 * (*(_DWORD *)(v21 - 136) > 0xFF9D8B2u)) ^ v20))
                                          - 4))(v24);
}

uint64_t sub_1B97D5A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)(v17 - 120) = a14 + 1374699841 * ((v17 - 136) ^ 0x6DF41809) + 142;
  *(_QWORD *)(v17 - 136) = v16;
  *(_QWORD *)(v17 - 128) = v14;
  v18 = sub_1B97D3534(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((914 * (a11 < ((a14 + 199) ^ (a14 - 118) ^ 0x13E))) ^ a14)))(v18);
}

uint64_t sub_1B97D5AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  *(_DWORD *)(v20 - 120) = v19
                         + 1374699841 * ((2 * ((v20 - 136) & 0xB04ADC0) - (v20 - 136) + 1962627641) ^ 0x190F4A30)
                         - 57;
  *(_QWORD *)(v20 - 136) = a16;
  *(_QWORD *)(v20 - 128) = a14;
  sub_1B97D3534(v20 - 136);
  v21 = 1759421093 * (((v20 - 136) & 0x61219070 | ~((v20 - 136) | 0x61219070)) ^ 0x2DA3DFDB);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 56;
  *(_QWORD *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 136) = 156825914 - v21;
  sub_1B97F56C0(v20 - 136);
  *(_DWORD *)(v20 - 120) = v19
                         + 1178560073
                         * ((((v20 - 136) | 0xECCF7CEC) - (v20 - 136) + ((v20 - 136) & 0x13308310)) ^ 0x565B048E)
                         + 83;
  *(_QWORD *)(v20 - 112) = v16;
  *(_QWORD *)(v20 - 128) = a16;
  v22 = v17(v20 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((*(_DWORD *)(v20 - 136) <= 0xFF9D8B2u) | ((*(_DWORD *)(v20 - 136) <= 0xFF9D8B2u) << 7)) ^ (v19 - 472)))
                                          - (((v19 ^ 0x95u) - 1236) ^ 0x93)))(v22);
}

uint64_t sub_1B97D5C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  int v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8
                                        * ((27
                                          * (((2 * a13) & 0xB7F5F7DE)
                                           + (a13 ^ 0x5BFAFBEF)
                                           + (((v14 ^ 0x4F4) + 1119) ^ 0xF77FBBFE)
                                           - 1400551921 > 0x7FFFFFFD)) ^ v14))
                            - 4))();
}

void sub_1B97D686C()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[1200];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (unint64_t)&v2[qword_1EF22FD70 ^ qword_1EF22FDD8];
  qword_1EF22FDD8 = 536075833 * (v0 + 0x793AB71194CDC804);
  qword_1EF22FD70 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  *(_DWORD *)*(&off_1E709D0C0
             + ((57 * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC)) ^ byte_1B981F650[byte_1B982B9F0[(57 * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC))] ^ 0x1B])
             - 206) = 1645153785;
  v1 = ((uint64_t (*)(uint64_t))*(&off_1E709D0C0
                                         + ((57
                                                                          * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC)) ^ byte_1B9822CB0[byte_1B981F450[(57 * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC))] ^ 0x85])
                                         + 22))(512);
  *(_QWORD *)*(&off_1E709D0C0
             + ((57 * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC)) ^ byte_1B982BAF0[byte_1B9826E00[(57 * ((qword_1EF22FD70 + qword_1EF22FDD8) ^ 0xFC))] ^ 0x53])
             - 107) = v1;
  __asm { BR              X8 }
}

void sub_1B97D6A18()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_1B97DE124(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0xC7F991DE6408E19) - 1369292382;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19) - 1369292382;
  v4 = (v2 < 937545218) ^ (v3 < 937545218);
  v5 = v2 > v3;
  if (v4)
    v6 = v2 < 937545218;
  else
    v6 = v5;
  v1 = *(_DWORD *)(a1 + 16) - 1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~(_DWORD)a1 | 0xA6CF00E4))) ^ 0x1C5B7886);
  __asm { BR              X15 }
}

uint64_t sub_1B97DE218()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = ((147 * (v2 ^ 0x3F2)) ^ 0xA12D6B27) + v3;
  v5 = v1 - 1590858969 + ((v2 - 1009) | 0xD0) + 375;
  v6 = v5 < 715979222;
  v7 = v4 < v5;
  if (v4 < 715979222 != v6)
    v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1605 * !v7) ^ v2)) - 4))();
}

uint64_t sub_1B97DE2A0(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  if (((v3 + 801) ^ 0x76807059) + v2 >= 0)
    v2 = 318707904 - v2;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1
                                                                                 + 8
                                                                                 * ((1132
                                                                                   * (v2
                                                                                    - 159354951
                                                                                    + ((v3 - 1476574434) & 0x5802BFEF) > (int)((77 * ((v3 + 801) ^ 0x3EC)) ^ 0xFFFFF9AE))) ^ (v3 + 801)))
                                                                     - 4))(a1, 1476575215, 4135612345, 4294965678);
}

uint64_t sub_1B97DE384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  uint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  _QWORD *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((31
                                          * ((*(_DWORD *)(*v11 + 4 * v14) ^ (v13 + a6) & a7 ^ (v9
                                                                                               + ((v13 + a8) & v12)
                                                                                               + 1399)) > (*(_DWORD *)(*v10 + 4 * v14) ^ v9))) ^ v13))
                            - 4))();
}

uint64_t sub_1B97DE3E0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;

  return (*(uint64_t (**)(void))(v0 + 8 * ((((((v3 + v1) & v2) + 61) ^ (v3 + 801)) * (v4 < v5)) ^ v3)))();
}

void sub_1B97DE40C()
{
  JUMPOUT(0x1B97DE348);
}

_DWORD *sub_1B97DE414(_DWORD *result)
{
  int v1;
  int v2;

  *result = ((v2 + 600) ^ 0x1FF3B737) - v1;
  return result;
}

uint64_t sub_1B97DE444(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;

  v1 = 1759421093 * ((~(_DWORD)a1 & 0xA201450D | a1 & 0x5DFEBAF2) ^ 0x117CF559);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = *((_DWORD *)*(&off_1E709D0C0 + (v2 ^ 0x769)) + 83);
  v4 = (*(_DWORD *)(a1 + 16) ^ v1) - 16856931;
  v5 = v3 + 402133936 > v4;
  if (v4 < 0x17F813B0 != v3 > 0xE807EC4F)
    v5 = v3 > 0xE807EC4F;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + (v2 ^ 0x724)) + ((v5 * ((v2 ^ 0x25B) - 1303)) ^ v2) - 1)
                            - 12))();
}

uint64_t sub_1B97DE52C()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = v2 + 749603472;
  v5 = v4 < 0x45A755A3;
  v6 = v1 + 1168594339 < v4;
  if (v5 != v1 > 0xBA58AA5C)
    v7 = v5;
  else
    v7 = v6;
  return (*(uint64_t (**)(void))(v0 + 8 * ((54 * ((((v3 - 1361) ^ v7) & 1) == 0)) ^ v3)))();
}

uint64_t sub_1B97DE59C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;

  v5 = v4 | 0x182;
  v6 = *(_DWORD *)(v3 + 336);
  v7 = (*(_DWORD *)(a1 + 4) ^ v1) + 354516975;
  if (v6 > 0x73C32EE1 != v7 < (((v5 + 1152) | 0x108) ^ 0x8C3CD610))
    v8 = v6 > 0x73C32EE1;
  else
    v8 = v6 - 1942171362 > v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1528 * !v8) ^ v5)) - ((v5 + 1152) ^ 0x60ELL)))();
}

uint64_t sub_1B97DE63C()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v2 + 80333165;
  v5 = v4 < 0x7BE51A9C;
  v6 = v3 + (v1 ^ 0x25B) + 2078610318 < v4;
  if (v5 != v3 > (v1 ^ 0x841AE036))
    v6 = v5;
  return (*(uint64_t (**)(void))(v0 + 8 * ((944 * !v6) ^ v1)))();
}

uint64_t sub_1B97DE6B4(_DWORD *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _BOOL4 v7;

  v5 = *(_DWORD *)(v3 + 352);
  v6 = (*a1 ^ v1) + 237531176;
  v7 = v5 + 2 * (v4 ^ 0x6D2) - 1915799556 > v6;
  if (v5 > 0x7230C0F5 != v6 < ((184 * (v4 ^ 0x55F)) ^ 0x8DCF383A))
    v7 = v5 > 0x7230C0F5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((253 * v7) ^ v4 ^ 0x42E)) - 8))();
}

uint64_t sub_1B97DE74C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;

  v5 = v2 - 2132719391;
  v6 = v5 < 0x8817C3;
  v7 = v3 + 8918979 < v5;
  if (v6 != v3 > v4 - 8920820)
    v7 = v6;
  if (v7)
    v8 = a2;
  else
    v8 = a2 + 1;
  *(_DWORD *)(result + 12) = v8;
  return result;
}

uint64_t sub_1B97DE7A0(uint64_t a1, uint64_t a2)
{
  return off_1E7098AD0[(16 * (*(_DWORD *)(a2 + 4) == 1206753096)) | 0xA5u](4294925278);
}

uint64_t sub_1B97DE7DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 448) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return (*(uint64_t (**)(_QWORD))(v2 + 3096))(0);
}

void sub_1B97DE848()
{
  JUMPOUT(0x1B97DE818);
}

void sub_1B97DE854(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0xB19902B9219B199) + 604313364;
  v3 = *(_DWORD *)(a1 + 20) + v1 - 316474524;
  v4 = v2 < 0x39B10190;
  v5 = v2 > v3;
  if (v3 < 0x39B10190 != v4)
    v5 = v4;
  __asm { BR              X9 }
}

uint64_t sub_1B97DE934(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((196
                                * (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + (v2 - 363588221))
                                   - ((2 * *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + (v2 - 363588221))) & 0xFFDF)
                                   + 1155520751) & 0x1F) != (v3 ^ 0x712))) ^ v3)))();
}

uint64_t sub_1B97DE988()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;

  v4 = v3 ^ 0x6FC;
  v5 = ((v4 - 77) ^ 0xBB970340) + v0;
  v6 = v2 - 226943326 > v5;
  if (v2 - 226943326 < (v4 + 136644383) != v5 < 0x825091D)
    v6 = v2 - 226943326 < (v4 + 136644383);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((8 * !v6) | (!v6 << 10)) ^ v4)) - 8))();
}

uint64_t sub_1B97DEA08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v5 = *(char *)(v1 + (v4 + 1));
  v6 = *(unsigned __int8 *)(v1 + (v4 + 1));
  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 8 * ((1688 * (((v3 ^ 0x4F ^ (v5 >= 0)) & 1) == 0)) ^ v3)))(a1, ((v6 << ((v3 - 102) & 0xB6 ^ 3)) & 0x7E) + (v6 ^ 0xF7FDDF3F) + 1341110268);
}

uint64_t sub_1B97DEA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  char v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1910
                                          * (((((v6 + 65) & 0x7F ^ 0xFCDBFBFF) + 2 * ((v6 + 65) & 0x7F)) & 0xFCDBFFFC) == ((299 * (a5 ^ 0x1F8)) ^ 0xFCDBFB02))) ^ a5))
                            - ((a5 ^ 0x1F8u)
                             + 1788)
                            + 1786))();
}

uint64_t sub_1B97DEB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v11 = v9 + a7 + ((v10 - 1633) | 0x110) - 211221332;
  v12 = v11 < 0x5F0ECD7;
  v13 = v11 > v7 - 1184700757;
  if ((v7 - 1184700757) < 0x5F0ECD7 != v12)
    v13 = v12;
  return (*(uint64_t (**)(void))(v8 + 8 * ((156 * !v13) | v10)))();
}

uint64_t sub_1B97DEB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v7 + (v10 + v9 + 2));
  return (*(uint64_t (**)(uint64_t, _QWORD))(v8 + 8 * (v11 ^ (958 * (a7 != -52691968)))))(a1, (v12 ^ 0x47EFBFBB) - 141440 + ((((v11 + 1361) ^ 0x5D9) - 357) & (2 * v12)));
}

uint64_t sub_1B97DEBF0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v8 + (a5 + v11 + 1794));
  return (*(uint64_t (**)(uint64_t, _QWORD))(v9 + 8 * ((1557 * (v10 - 1 == a6)) ^ a8)))(a1, ((v12 | ((((a8 + 807) | 0x100) ^ 0x1268C202) + (a2 << 8))) ^ 0xFFFFD7FB)+ 1206763328+ ((2 * (v12 | ((((a8 + 807) | 0x100) ^ 0x1268C202) + (a2 << 8)))) & 0xFFFFAFF6));
}

uint64_t sub_1B97DEC5C(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;

  v8 = v5 + v6 + v7 + 1599204958;
  v9 = (a3 + 1448515837) & 0xA9A961FE;
  v10 = a3 - 1284;
  v11 = a2 + v8 + 121046671;
  v12 = v3 + 1953524854;
  v13 = (v12 < 0xC0FE72A2) ^ (v11 < 0xC0FE72A2);
  v14 = v11 > v12;
  if (v13)
    v14 = v11 < 0xC0FE72A2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1247 * !v14) ^ v10)) - v9 + 502))();
}

uint64_t *sub_1B97DECFC@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = result[6];
  v10 = *result;
  v9 = result[1];
  *a3 = v5 + 1541701226;
  *(_DWORD *)(v10 - 0x5F8E90DD494572B7) = v4;
  *(_DWORD *)(v8 - 0x56530F603BC303ACLL) = a2;
  *(_QWORD *)(v9 - 0x4FF3ADA337C70005) = v3 + v7 - 1910103002 + ((v6 + 4) | 0x500u);
  *((_DWORD *)result + 8) = 1645153785;
  return result;
}

void sub_1B97DED84(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 1374699841 * (((_DWORD)a1 - 1542394297 - 2 * (a1 & 0xA410EE47)) ^ 0xC9E4F64E);
  v2 = *a1 + v1;
  __asm { BR              X13 }
}

uint64_t sub_1B97DEE3C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  _DWORD v7[2];
  uint64_t v8;

  v5 = 1755732067 * ((v7 & 0x9095DB2C | ~(v7 | 0x9095DB2C)) ^ 0xB1AC9908);
  v8 = v2;
  v7[0] = (v3 - (((v1 + 43) ^ 0xB54A6CA2) & (v4 + 1853089944)) + 299838324) ^ v5;
  v7[1] = (v1 + 7) ^ v5;
  return ((uint64_t (*)(_DWORD *))(*(_QWORD *)(a1 + 8 * (v1 ^ 0x245)) - 8))(v7);
}

void IPaI1oem5iL(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B97DEFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  a13 = 108757529 * (((&a12 | 0x956C4C34) - (&a12 & 0x956C4C34)) ^ 0x75F02E1F) + 1695027452;
  v15 = sub_1B9816CD4(&a12);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((275 * (a12 == 1645153785)) ^ v13)))(v15);
}

uint64_t sub_1B97DF064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a12 = &STACK[0x4BD26FD1213425B1];
  a14 = 1307 - 460628867 * ((2 * (&a12 & 0x44AF77C8) - &a12 - 1152350160) ^ 0xF7C60A4D);
  sub_1B97F2874((uint64_t)&a12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14
                                                                                + 8
                                                                                * ((23
                                                                                  * (((a13 == 1645153785) ^ 0x2F) & 1)) ^ 0x2A6u)))(v15, v16, v17, v18, v19);
}

uint64_t sub_1B97DF124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13, uint64_t a14, int a15)
{
  int v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v19 = 1178560073 * ((2 * (&a12 & 0x1E6864C8) - &a12 - 510158029) ^ 0x5B03E351);
  a13 = v19
      + (v15 ^ 0xD57F7D4A ^ (53 * (v17 & 0x9F3 ^ 0x12E)))
      + (((((v17 & 0x9F3) - 2) | 0xC) ^ 0xAAFEFEDA) & (2 * v15))
      + 2063454782;
  a15 = ((v17 & 0x9F3) + 709) ^ v19;
  a14 = a11;
  sub_1B9802920((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18
                                                                                          + 8
                                                                                          * ((14 * (a12 != v16 + 689)) ^ v17 & 0x9F3u))
                                                                              - 8))(v20, v21, v22, v23, v24);
}

uint64_t sub_1B97DF214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, uint64_t a13, unsigned int a14, unsigned int a15, unsigned int a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  v21 = (((&a12 | 0xFB74E5AA) - (&a12 & 0xFB74E5AA)) ^ 0xB7E267D7) * v20;
  a15 = v21 + v19 + 2138963059;
  a16 = 635686783 - v21;
  a12 = &STACK[0x58A7AA08624568E6];
  a13 = a11;
  a14 = v21 - 279984296;
  v22 = sub_1B98170A4((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((1580 * (a17 == ((v19 - 1118674286) & 0x42AD9EF1) + v17)) ^ v19))
                                          - 8))(v22);
}

uint64_t sub_1B97DF2DC()
{
  void (*v0)(unsigned int *);
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unint64_t *v8;
  int v9;
  unint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t *v13;
  unint64_t *v14;

  v5 = 53 * (v4 ^ 0x120);
  v13 = &STACK[0x384B062F076094AC];
  v14 = v8;
  v11 = (v4 + 44) ^ (1374699841 * (&v11 ^ 0x6DF41809));
  ((void (*)(unsigned int *))(*(_QWORD *)(v2 + 8 * (v4 ^ 0x198)) - 8))(&v11);
  v13 = v8;
  v11 = (v4 + 545) ^ (1755732067 * (((&v11 | 0x68EC43F5) - (&v11 & 0x68EC43F5)) ^ 0xB62AFE2E));
  sub_1B9812F54((uint64_t)&v11);
  if ((_DWORD)v14 == v5 + v1)
    v6 = v9;
  else
    v6 = (int)v14;
  v12 = v4 + ((&v11 & 0x85FB557C | ~(&v11 | 0x85FB557C)) ^ 0x70F0A4AC) * v3 + 728;
  v13 = v8;
  v0(&v11);
  v12 = v5 + ((2 * (&v11 & 0x2037FE78) - &v11 + 1606943108) ^ 0x553C0FAB) * v3 + 340;
  v13 = v10;
  v0(&v11);
  return v6 ^ (v1 + 689);
}

void sub_1B97DF484(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = qword_1EF22FD78 - (_QWORD)&v3 + qword_1EF22FD70;
  qword_1EF22FD78 = 536075833 * (v2 + 0x793AB71194CDC804);
  qword_1EF22FD70 = 536075833 * (v2 ^ 0x86C548EE6B3237FCLL);
  ((void (*)(char *, void (*)()))*(&off_1E709D0C0
                                            + ((57
                                                                             * ((qword_1EF22FD70 - qword_1EF22FD78) ^ 0xFC)) ^ byte_1B9822DB0[byte_1B981F550[(57 * ((qword_1EF22FD70 - qword_1EF22FD78) ^ 0xFC))] ^ 0xF7])
                                            + 47))((char *)*(&off_1E709D0C0+ ((57 * (qword_1EF22FD78 ^ 0xFC ^ qword_1EF22FD70)) ^ byte_1B982BAF0[byte_1B9826E00[(57 * (qword_1EF22FD78 ^ 0xFC ^ qword_1EF22FD70))] ^ 0xB6])+ 19)- 4, sub_1B981723C);
  __asm { BR              X9 }
}

uint64_t sub_1B97DF5A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))(a1 + 8 * ((41 * (**(_QWORD **)(v1 + 1616) != 0)) ^ 0x3D1u)))();
}

uint64_t sub_1B97DF5C8()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(v1 + 1608))(v0);
}

uint64_t sub_1B97DF5F0(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 535753261 * ((a1 - 1922189914 - 2 * (a1 & 0x8D6DB5A6)) ^ 0x8799BB89);
  v2 = *(_DWORD *)(a1 + 16) + v1;
  v3 = *(_DWORD *)a1 ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0xC7F991DE6408E19);
  v6 = v4 - 159353952;
  v5 = v4 - 159353952 < 0;
  v7 = 159353952 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + v2 - 386)
                              + ((30 * ((v3 - 843402718) < 4 * (unint64_t)v7)) ^ v2)
                              - 1)
                            - (v2 ^ 0x51Fu)
                            + 1191))();
}

uint64_t sub_1B97DF6C0()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (v2 ^ (67 * (v0 != 843402718))))
                            - (((v2 + 110787148) & 0xF9658379)
                             - 205)
                            + 424))();
}

uint64_t sub_1B97DF710()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1884 * (((v1 - 361) | 0xA2) == 434)) ^ (v1 - 245))) - 4))();
}

uint64_t sub_1B97DF788@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 8) + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((971 * (((a2 - 863) ^ (a2 - 6)) + a4 != v6)) ^ a2)) - 12))();
}

uint64_t sub_1B97DF7D4(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1884 * (v3 + 8 == ((a2 - 162) | 0xA2) - 402)) ^ (a2 - 46))) - 4))();
}

uint64_t sub_1B97DF810(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v7 = v3 > 0x7CA4B262;
  if (v7 == v6 - 1136057856 < -2091168355)
    v7 = v6 - 1136057856 < v5;
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v4 + 8 * (((a3 + 1107) * v7) ^ a3)) - 4))(a1, (a3 + 46));
}

uint64_t sub_1B97DF87C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  int v3;
  _QWORD *v4;
  int v5;

  return sub_1B97DF788(a1, a2, *(_DWORD *)(*v4 + 4 * (v5 - 1192373149)), v3, a3);
}

uint64_t sub_1B97DF8A8(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 32) = a3;
  return result;
}

void sub_1B97DF8B0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 16) - 3804331 * ((a1 - 2 * (a1 & 0xF3A65B02) - 207201534) ^ 0x8D737EF4);
  v2 = (*(_BYTE *)a1 ^ (-85 * ((a1 - 2 * (a1 & 2) + 2) ^ 0xF4)));
  ((void (*)(char *, void (*)()))*(&off_1E709D0C0 + v1 - 1289))((char *)*(&off_1E709D0C0 + v1 - 1458) - 4, sub_1B9817780);
  v3 = *(_QWORD *)*(&off_1E709D0C0 + v1 - 1503);
  v5 = v1 + 1755732067 * (((&v4 | 0x1283C73D) - (&v4 & 0x1283C73D)) ^ 0xCC457AE6) - 580;
  v4 = v3;
  sub_1B9814154((uint64_t)&v4);
  __asm { BR              X9 }
}

uint64_t sub_1B97DFA00()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1541
                                          * (**(_DWORD **)(v2 + 8 * (v0 ^ 0x3C2)) == ((v0 + 725) ^ 0x34B) - 1698)) ^ v0))
                            - 8))();
}

uint64_t sub_1B97DFABC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t (*v13)(uint64_t, _BYTE *, _DWORD *);
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  unsigned int v19;
  uint64_t result;
  uint64_t v21;
  _BYTE v22[30];
  _BYTE v23[140];

  v8 = *(unsigned int **)(v6 + 8 * (a1 - 1290));
  v9 = *v8;
  v10 = *(_QWORD *)(v6 + 8 * (a1 - 1323));
  v11 = *(_BYTE **)(v10 - 4);
  v22[0] = *v11 - 71;
  v22[1] = v11[1] - 71;
  v22[2] = v11[2] - 71;
  v22[3] = v11[3] - 71;
  v22[4] = v11[4] - 71;
  v22[5] = v11[5] - 71;
  v22[6] = v11[6] - 71;
  v22[7] = v11[7] - 71;
  v22[8] = v11[8] - 71;
  v22[9] = v11[9] - 71;
  v22[10] = v11[10] - 71;
  v22[11] = v11[11] - 71;
  v22[12] = v11[12] - 71;
  v22[13] = v11[13] - 71;
  v22[14] = v11[14] - 71;
  v22[15] = v11[15] - 71;
  v22[16] = v11[16] - 71;
  v22[17] = v11[17] - 71;
  v22[18] = v11[18] - 71;
  v22[19] = v11[19] - 71;
  v22[20] = v11[20] - 71;
  v22[21] = v11[21] - 71;
  v12 = *(_BYTE **)(v10 - 4);
  v22[22] = v12[22] - 71;
  v22[23] = v12[23] - 71;
  v22[24] = v12[24] - 71;
  v22[25] = v12[25] - 71;
  v22[26] = v12[26] - 71;
  v22[27] = v12[27] - 71;
  v22[28] = v12[28] - 71;
  v22[29] = v12[29] - 71;
  v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8 * (a1 ^ 0x525));
  v14 = v13(v9, v22, v2);
  v15 = ((2 * v14) & 0xBFCFF7EE) + (v14 ^ 0x5FE7FBF7);
  if (v15 != 1609038839)
  {
    if (v15 == 1609039941)
    {
      v16 = *v8;
      v17 = *(_BYTE **)(*(_QWORD *)(v6 + 8 * (v4 - 1349)) - 4);
      v23[0] = *v17 - 70;
      v23[1] = v17[1] - 70;
      v23[2] = v17[2] - 70;
      v23[3] = v17[3] - 70;
      v23[4] = v17[4] - 70;
      v23[5] = v17[5] - 70;
      v23[6] = v17[6] - 70;
      v23[7] = v17[7] - 70;
      v23[8] = v17[8] - 70;
      v23[9] = v17[9] - 70;
      v23[10] = v17[10] - 70;
      v23[11] = v17[11] - 70;
      v23[12] = v17[12] - 70;
      v23[13] = v17[13] - 70;
      v23[14] = v17[14] - 70;
      v23[15] = v17[15] - 70;
      v23[16] = v17[16] - 70;
      v23[17] = v17[17] - 70;
      v23[18] = v17[18] - 70;
      v23[19] = v17[19] - 70;
      v18 = v13(v16, v23, v2);
      v19 = (2 * v18) & 0xB1CDF7BE;
      v15 = (v18 ^ 0x58E6FBDF) - 2359306;
    }
    else
    {
      v19 = -119865378;
    }
    __asm { BR              X8 }
  }
  *(_DWORD *)(v7 + 344) |= (3 * (v4 ^ 0x7DF)) ^ 0x6A8;
  *(_DWORD *)(v7 + 44) = 746457987;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8 * (v4 - 1406)))(*v2, v7 + 332, v7 + 336, v7 + 340, v3);
  v21 = *(_QWORD *)(v1 + 8);
  *(_DWORD *)(*(_QWORD *)(v1 + 24) - 0x705CCB0086AF2A86) = *v2;
  *(_DWORD *)(v21 - 0x4CAF57822185BF99) = *v3;
  *(_DWORD *)(v1 + 20) = 1645153785;
  return result;
}

void sub_1B97DFEE0(uint64_t a1)
{
  int v1;

  v1 = 1225351577 * (((a1 | 0xD0007703) - a1 + (a1 & 0x2FFF88FC)) ^ 0xF39AAF15);
  __asm { BR              X11 }
}

uint64_t sub_1B97DFF98@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 != 0) * (a1 ^ 0x102)) ^ a1)))();
}

uint64_t sub_1B97DFFCC@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  unsigned int *v4;
  int v5;
  uint64_t v6;

  v5 = 3 * (a1 ^ 0x91);
  v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((205 * (*v1 != 0)) ^ v5)) - 12))(v6);
}

uint64_t sub_1B97E0004()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int *v3;
  uint64_t result;

  result = v2(*v3);
  *v1 = 0;
  *(_DWORD *)v0 = 0;
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 352) = 0;
  *(_DWORD *)(v0 + 360) = 521138062;
  *(_DWORD *)(v0 + 56) = 746457987;
  return result;
}

uint64_t sub_1B97E0044@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((205 * (*v1 != 0)) ^ a1 ^ 0x1B1)) - 12))();
}

void sub_1B97E0070(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 3804331 * (((a1 | 0x51A664) - (a1 & 0x51A664)) ^ 0x7E848392);
  __asm { BR              X9 }
}

uint64_t sub_1B97E013C@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  v14 = *(_DWORD *)(v8 - 0x27681A84B35EB0F5) + *a1 - v12 + ((v13 + 2132657639) & 0x80E23D37 ^ 0xBD783FD5);
  v15 = 1759421093 * (&a5 ^ 0xB37DB054);
  a8 = v13 - v15 + 40;
  a7 = v8;
  a5 = v14 - v15 + 415266632;
  a6 = v15 + 1236742230;
  v16 = ((uint64_t (*)(int *))(*(_QWORD *)(a2 + 8 * (v13 - 509)) - 4))(&a5);
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * ((502 * (*v10 == v9)) ^ v13)))(v16);
}

uint64_t sub_1B97E0210()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8
                                             * (((*(_QWORD *)(v0 + 8) == 0x58C2F3F47EC954F5) * (v1 - 1298)) ^ v1))
                            - ((v1 + 202) ^ 0x5F9)))();
}

uint64_t sub_1B97E0258()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1004 * ((((v0 + 1) ^ (v1 == 1116194070)) & 1) == 0)) ^ v0)))();
}

void sub_1B97E028C()
{
  _DWORD *v0;

  *v0 = -1645193696;
}

void sub_1B97E04C4(uint64_t a1)
{
  _BYTE v2[8];

  qword_1EF22FD08 = 536075833 * ((unint64_t)&v2[qword_1EF22FD70 - qword_1EF22FD08] ^ 0x86C548EE6B3237FCLL);
  qword_1EF22FD70 = qword_1EF22FD08;
  MEMORY[0x1DEE39758](0x1EF22FD58, sub_1B981723C);
  __asm { BR              X9 }
}

uint64_t sub_1B97E05B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((240 * ((((**(_QWORD **)(v1 + 1616) == 0) ^ 0xE1F45F16) & 1) == 0)) ^ 0x25Fu))
                            - 8))();
}

uint64_t sub_1B97E05F0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(v1 + 1176))(v0);
}

uint64_t sub_1B97E0618(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(_DWORD *)result + 26185 * ((2 * (result & 0x1A68) - result - 6761) ^ 0x9DF5);
  *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDALL) = v2 & 0x1FF ^ 0xB31524D1;
  *(_QWORD *)(v1 - 0x5C6940C6B1BC6FFALL) = 0x6731FE5437D4814ALL;
  *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDELL) = 369984849;
  v3 = v2 ^ 0x8E;
  if (v3 == 1)
  {
    v4 = 369984865;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x5C6940C6B1BC6FE2) = -1830205819;
    v4 = 369984869;
LABEL_5:
    *(_QWORD *)(v1 - 0x5C6940C6B1BC6FF2) = 0xBEF60CFC367E8474;
    *(_QWORD *)(v1 - 0x5C6940C6B1BC6FEALL) = 0x4109F303C9817B8BLL;
    *(_DWORD *)(v1 - 0x5C6940C6B1BC6FDELL) = v4;
  }
  *(_DWORD *)(result + 4) = 1284260520;
  return result;
}

uint64_t sub_1B97E0760(uint64_t a1, uint64_t a2)
{
  return off_1E7098AD8[((194 * (*(_DWORD *)(a2 + 4) != 1206753084)) ^ 0x24Au) - 1]();
}

uint64_t sub_1B97E079C()
{
  return 4294925278;
}

uint64_t sub_1B97E07A4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0x1EEBF92F)
                       - 148926504
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0x5E);
  return 0;
}

void sub_1B97E07DC(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19);
  v4 = v2 - 159353952;
  v3 = v2 - 159353952 < 0;
  v5 = 159353952 - v2;
  if (!v3)
    v5 = v4;
  v1 = (*(_DWORD *)a1 - 235795823 * ((a1 + 1658036232 - 2 * (a1 & 0x62D3A008)) ^ 0xF67EE951) - 345) | 0x109;
  __asm { BR              X10 }
}

uint64_t sub_1B97E090C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, int a7, unsigned int a8)
{
  int v8;
  _QWORD *v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((*(_DWORD *)(*v9 + 4 * a8) != v8) * a6) ^ a7))
                            - ((a7 - 80) ^ a5)
                            + 713))();
}

void sub_1B97E0940()
{
  JUMPOUT(0x1B97E08D4);
}

uint64_t sub_1B97E0948(uint64_t result)
{
  *(_DWORD *)(result + 4) = 313388984;
  return result;
}

void sub_1B97E09EC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 - 2 * (a1 & 0x7A08EF3) + 127962867) ^ 0xD9663328));
  __asm { BR              X10 }
}

uint64_t sub_1B97E0A78@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((*(_DWORD *)(v2 - 0x27681A84B35EB0EDLL) == 1645153785) * ((856 * (v1 ^ 0xD8)) ^ 0x7D5)) ^ v1)))();
}

uint64_t sub_1B97E0AC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x27681A84B35EB0F5) - 1309758810;
  v4 = *(_DWORD *)(v1 - 0x27681A84B35EB0F9) - 1602345780;
  v5 = v3 < ((v2 - 112831669) & 0x6B9A6DEu) - 999042242;
  v6 = v3 > v4;
  if (v5 == v4 < 0xC473D418)
    v5 = v6;
  return (*(uint64_t (**)(void))(a1 + 8 * ((13 * v5) ^ v2)))();
}

uint64_t sub_1B97E0B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;

  v7 = 11 * (v6 ^ 0x6D5);
  v8 = *(_QWORD *)(v4 - 0x27681A84B35EB105);
  v9 = *(unsigned __int8 *)(v8 + (v3 - 310716791)) ^ 0x32;
  v10 = ((*(unsigned __int8 *)(v8 + (v3 - 310716794)) ^ 0x32) << 24) | ((*(unsigned __int8 *)(v8 + (v3 - 310716793)) ^ 0x32) << 16) | ((*(unsigned __int8 *)(v8 + v3 - 310717010 + 2 * ((v7 + 936947223) & 0xC8274FF9 ^ 0x205)) ^ 0x32) << 8) | v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((203
                                          * (((v2 + v10 - 2 * (v10 & (v2 + 6) ^ v9 & 6) + 0x1000000) & 0xFFFFFF ^ 0xF0DF9)
                                           - (*(_DWORD *)(a1 + 32) ^ v5) != -96652631)) ^ v7))
                            - 8))();
}

void sub_1B97E0C64()
{
  _DWORD *v0;

  *v0 = -1645193524;
}

uint64_t sub_1B97E0E14@<X0>(_QWORD *a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)(*a1 - 0x42E48BBDD224DE3DLL) = v6 + v5 + 8;
  return (*(uint64_t (**)(void))(a3
                              + 8
                              * ((19 * (*v3 != (((a2 - 641) | 0x42) ^ v4 ^ (((a2 - 592) ^ 0xCB) * v7)))) ^ (a2 - 592))))();
}

uint64_t sub_1B97E0E88@<X0>(_QWORD *a1@<X0>, int a2@<W4>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;

  *(_QWORD *)(*a1 - 0x42E48BBDD224DE3DLL) = 0;
  return (*(uint64_t (**)(void))(a3
                              + 8
                              * ((19 * (*v3 != ((((a2 ^ 0x3D0) - 49) | 0x42) ^ v4 ^ (109 * (a2 ^ 0x31B))))) ^ a2 ^ 0x3D0)))();
}

void sub_1B97E0EF8(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x37021DA48139154ELL) = v3;
  *v1 = v2;
  JUMPOUT(0x1B97E0E0CLL);
}

void gLg1CWr7p()
{
  int v0[10];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  v0[1] = 108757529 * ((v0 + 70320331 - 2 * (v0 & 0x43100CB)) ^ 0xE4AD62E0) + 1695027452;
  sub_1B9816CD4(v0);
  __asm { BR              X8 }
}

uint64_t sub_1B97E0FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21,int a22)
{
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v25 = 1759421093 * (&a19 ^ 0xB37DB054);
  HIDWORD(a19) = v25 ^ 0x771B5177;
  a20 = v25 + 1806;
  a22 = v25 ^ 0x18F94B49;
  LODWORD(a19) = v25 ^ 0x7FA6CEE2;
  ((void (*)(unint64_t **))(*(_QWORD *)(v24 + 392) - 12))(&a19);
  LODWORD(a12) = a21;
  a21 = 1307
      - 460628867
      * (((&a19 | 0x79CC505F) - &a19 + (&a19 & 0x8633AFA0)) ^ 0x355AD222);
  a19 = &STACK[0x4BD26FD1213425D9];
  sub_1B97F2874((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8 * (v22 | ((a20 == 1645153785) << 8))) - 4))(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12);
}

uint64_t sub_1B97E10F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,unsigned int a21,uint64_t a22,unsigned int a23,uint64_t a24)
{
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  void (*v31)(int *);
  unsigned int v32;
  uint64_t v33;

  v29 = 1178560073
      * (((&a20 | 0x2DEBD9B6) - &a20 + (&a20 & 0xD2142648)) ^ 0x977FA1D4);
  a23 = v29 ^ 0x3E8;
  a22 = a17;
  a21 = ((2 * v26) & 0xBCFBBE7E) + (v26 ^ 0x5E7DDF3F) - 234917126 + v29;
  sub_1B9802920((uint64_t)&a20);
  v30 = 1178560073
      * (((&a20 | 0xA44E095A) - &a20 + (&a20 & 0x5BB1F6A0)) ^ 0x1EDA7138);
  a23 = (((2 * v25) & 0xFF9AFFFE) + (v25 ^ 0xFFCD7FFF) + 196320555) ^ v30;
  a21 = v30 + 1289;
  a22 = a17;
  a24 = v24;
  v31 = (void (*)(int *))(*(_QWORD *)(v28 + 1024) - 8);
  v31(&a20);
  v32 = 1178560073 * ((&a20 - 791991911 - 2 * (&a20 & 0xD0CB2999)) ^ 0x6A5F51FB);
  a22 = a17;
  a24 = a14;
  a23 = v32 ^ ((a13 ^ 0x3FB7BDBB) - 875995281 + ((2 * a13) & 0x7F6F7B76));
  a21 = v32 + 1289;
  v33 = ((uint64_t (*)(int *))v31)(&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * ((2034 * (a20 == 1645153785)) ^ 0x35Du)) - 12))(v33);
}

uint64_t sub_1B97E12E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, uint64_t a20,int a21,int a22,int a23,int a24)
{
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;

  if (a12 >= 0x608FEDF6)
    v27 = 1010542952;
  else
    v27 = 635686783;
  v28 = 460628867 * ((&a19 + 663701623 - 2 * ((unint64_t)&a19 & 0x278F4877)) ^ 0x6B19CA0A);
  a23 = v27 - v28;
  a21 = v28 - 628183178;
  a22 = v28 + v25 + 2138962536;
  a19 = &STACK[0x58A7AA0862456916];
  a20 = a16;
  v29 = sub_1B98170A4((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26
                                                      + 8
                                                      * ((101
                                                        * (a24 != v24 + ((v25 + 2122744248) & 0x81797F1F) - 545 - 495)) ^ v25))
                                          - 12))(v29);
}

uint64_t sub_1B97E13D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  int v12;
  uint64_t v13;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13
                                                                        + 8
                                                                        * (int)(((v12
                                                                                + 24
                                                                                + ((v12 + 1527559566) & 0xA4F349EE)
                                                                                + 117)
                                                                               * (a12 > 0x608FEDF5)) ^ v12))
                                                            - 4))(a1, a2, a3);
}

uint64_t sub_1B97E1488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned int a23)
{
  int v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(unsigned int *);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  a23 = (v23 - 10) ^ (1225351577
                    * ((2 * (&a19 & 0x486B7D40) - &a19 + 932479672) ^ 0x140E5AAE));
  a20 = a15;
  a21 = v28;
  a22 = v24;
  ((void (*)(unsigned int *))(*(_QWORD *)(v27 + 8 * (v23 - 299)) - 8))(&a19);
  a19 = (v23 - 19) ^ (1374699841 * (((&a19 | 0x5275727) + (~&a19 | 0xFAD8A8D8)) ^ 0x68D34F2F));
  a21 = a15;
  a20 = a10;
  v26(&a19);
  a20 = a15;
  a19 = (v23 + 482) ^ (1755732067
                     * (((&a19 | 0xA2C01B31) - &a19 + (&a19 & 0x5D3FE4C8)) ^ 0x7C06A6EA));
  v29 = sub_1B9812F54((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25
                                                      + 8
                                                      * ((1216 * ((_DWORD)a21 == 123 * (v23 ^ 0x16B) + 1645152924)) ^ v23))
                                          - 8))(v29);
}

uint64_t sub_1B97E1660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  int v17;
  int v18;
  int v19;
  uint64_t v20;

  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * ((607 * (a17 == v18)) ^ v17))
                            - (((251 * v19) - 904) ^ (v17 - 199685485) & 0xBE6F75D)))();
}

uint64_t sub_1B97E16AC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8, int a9)
{
  unsigned int v9;
  uint64_t v10;

  return (*(uint64_t (**)(void))(v10 + 8 * ((387 * ((((a9 ^ v9) > a6) ^ (a1 - 115) ^ 0x37) & 1)) ^ a1)))();
}

uint64_t sub_1B97E16F0()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  _BOOL4 v4;

  v3 = v0 - ((v0 << (((v1 + 19) & 0xDF) - 92)) & 0x82B34678) - 1051090116;
  v4 = ((v1 ^ 0xECF2B880) & (2 * v3) ^ 0x80B20068) + (v3 ^ 0x3720FFC9) + 1845473215 == 1685654708;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((2 * v4) | (4 * v4)) ^ v1)) - 8))();
}

uint64_t sub_1B97E1794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;

  v12 = v10 + v9 + 159818507 >= ((31 * (v8 ^ 0x165)) ^ (a8 + 1068)) - 928899231;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((v12 | (4 * v12)) ^ v8 ^ 0x7B9)) - 12))();
}

uint64_t sub_1B97E1800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((61 * (v7 - a7 < (unint64_t)(v8 + 486) - 919)) ^ v8))
                            + 928899231
                            - ((v8 + 2002648558) & 0xBFFFE0E7)))();
}

uint64_t sub_1B97E1854(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  unsigned int v9;
  uint64_t v10;

  return (*(uint64_t (**)(void))(v10 + 8 * (((v9 >= 3 * (a2 ^ 0x284u) - 889) * ((a2 - v8) ^ (a8 + 888))) ^ a2)))();
}

uint64_t sub_1B97E188C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v15 = (v12 + v10);
  v16 = *(_OWORD *)(v9 + v15 - 15);
  v17 = *(_OWORD *)(v9 + v15 - 31);
  v18 = a7 + v15;
  *(_OWORD *)(v18 - 15) = v16;
  *(_OWORD *)(v18 - 31) = v17;
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * ((303 * (929 * (v13 ^ (a8 + 859)) - 1826 == (v11 & 0xFFFFFFE0))) ^ (v8 + v13 + 309))))(929);
}

uint64_t sub_1B97E18F4(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (a3 | (v3 != v4))) - ((a3 - 997) ^ 0x359)))();
}

uint64_t sub_1B97E1920(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  char v9;
  uint64_t v10;

  return (*(uint64_t (**)(void))(v10 + 8 * ((1843 * ((v9 & 0x18) == ((a2 - v8) ^ (a8 + 1524) ^ 0x399))) ^ a2)))();
}

uint64_t sub_1B97E1958(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  *(_QWORD *)(a7 - 7 + (v10 + v8 - v11)) = *(_QWORD *)(v7 - 7 + (v10 + v8 - v11));
  return (*(uint64_t (**)(void))(v12 + 8 * ((1414 * ((a1 ^ 0x2F5) + v11 - 356 == (v9 & 0xFFFFFFF8))) ^ a1)))();
}

uint64_t sub_1B97E19A4(int a1, int a2, uint64_t a3, int a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(a3 + (a4 - v6)) = *(_QWORD *)(v7 + (a4 - v6));
  return (*(uint64_t (**)(void))(v8 + 8 * (((v5 + v6 - 356 == a2) * a5) ^ a1)))();
}

uint64_t sub_1B97E19D0(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v4 | ((((v2 == a2) ^ (v4 - 23)) & 1) << 7)))
                            - ((v4 - 142744005) & 0x3FDFF8FF ^ (unint64_t)(v3 + 16))))();
}

uint64_t sub_1B97E1A18@<X0>(uint64_t a1@<X6>, int a2@<W7>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  *(_BYTE *)(a1 + (v7 ^ (a2 + 1712) ^ (v5 - 821)) + v6) = *(_BYTE *)(v4
                                                                                 + (v7 ^ (a2 + 1712) ^ (v5 - 821))
                                                                                 + v6);
  return (*(uint64_t (**)(void))(v8 + 8 * ((853 * (v6 - 1 == a3)) ^ (v3 + v7 + 465))))();
}

uint64_t sub_1B97E1A5C()
{
  unsigned int v0;
  void (*v1)(_BYTE *);
  int v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[4];
  unsigned int v8;
  uint64_t v9;

  v8 = v2
     + 535753261
     * ((2 * ((v7 ^ 0x7401F681) & 0x44CCC51) - (v7 ^ 0x7401F681) + 2075341740) ^ 0x546CB02)
     + 168;
  v9 = v5;
  v1(v7);
  v9 = v6;
  v8 = ((v2 - 744574573) & 0x2C614F1F)
     + 535753261 * ((((2 * v7) | 0xAEBB6136) - v7 + 681725797) ^ 0xDDA9BEB4)
     - 11;
  v1(v7);
  return v3 ^ v0;
}

void sub_1B97E1B64(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD v13[2];
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  int32x4_t v24;
  unint64_t *v25;
  int32x4_t v26;
  int32x4_t v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  int v39;
  uint64_t v40;
  unsigned int v41;
  unint64_t *v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = 3804331 * (((a1 | 0xD29CC998) - (a1 | 0x2D633667) + 761476711) ^ 0xAC49EC6E);
  v3 = *(_DWORD *)(a1 + 4);
  v4 = *(_DWORD *)a1 ^ v2;
  v5 = 1178560073
     * ((((&v41 | 0x135B03A) ^ 0xFFFFFFFE) - (~&v41 | 0xFECA4FC5)) ^ 0x445E37A7);
  v6 = *(_DWORD *)(a1 + 8) ^ v2;
  v17 = 3804331
      * (((a1 | 0xF8BBF308D29CC998) - (a1 | 0x7440CF72D633667) + 0x7440CF72D633667) ^ 0x3712930CAC49EC6ELL);
  v7 = v3 + v2;
  v41 = 1076023948 - v5;
  v43 = v4 - v5 + 1172345383;
  v25 = &STACK[0x5C6940C6B1BC7126];
  v42 = &STACK[0x5C6940C6B1BC7126];
  sub_1B97E0618((uint64_t)&v41);
  v8 = v6;
  v32 = v7 - 1515316656;
  v16 = v7 + 1773184230;
  v19 = v7 - 829826358;
  v18 = v7 - 119409945;
  v13[1] = (char *)&v13[-147572436] + 1;
  v20 = 55 * (v4 ^ 0x27u);
  v28 = v4 ^ 0x666u;
  v29 = &v40;
  v26 = vdupq_n_s32(0xC41E1BF2);
  v27 = vdupq_n_s32(0x620F0DFFu);
  v22 = (v4 + 271127083) & 0xEFD6EFF9;
  v15 = v4 + 1037830021;
  v14 = v4 - 1343287479;
  v34 = (v4 - 1343287479);
  v30 = 622 * (v4 ^ 0x36);
  v31 = v4;
  v24 = vdupq_n_s32(0x620F0DF9u);
  v21 = a1;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = (char *)*(&off_1E709D0C0 + (v4 ^ 0x1E)) - 8;
  v23 = v20 + *(_QWORD *)&v10[8 * v4] - 1049;
  v11 = v8 - 176919824 + ~(((v8 + 690444800) & 0x4C4D10FF ^ v8 & 0x10) << ((v4 + 64) ^ 0x75));
  v35 = (HIBYTE(v11) ^ 0x4C) - ((v11 >> 23) & 0x64) + 50;
  v36 = (BYTE2(v11) ^ 0x4D) - ((v11 >> 15) & 0x64) + 50;
  v37 = (BYTE1(v11) ^ 0x10) - ((2 * (BYTE1(v11) ^ 0x10)) & 0x64) + 50;
  v38 = (v8 - 16 + ~((v8 ^ v8 & 0x10) << ((v4 + 64) ^ 0x75))) ^ 0xDD;
  v12 = *(_QWORD *)&v10[8
                      * ((26 * (((2 * v39) & 0xA ^ 8) + (v39 & 0x3F ^ 0x6F3FFFD1u) - 1866465281 < 0xFFFFFFC0)) ^ (v4 + 58))]
      - 8;
  v33 = v9;
  __asm { BR              X13 }
}

uint64_t sub_1B97E1F70@<X0>(int a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, int a4@<W8>)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  *(_BYTE *)(a3 + (a4 + v7)) = *(_BYTE *)(a2 + ((5 * (v4 ^ a1)) ^ (v6 + 1341)) + v5);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((419 * ((a4 & 0xFFFFFFC0) != v8)) ^ v4)) - 8))();
}

uint64_t sub_1B97E1FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48,int a49,int a50,int a51,int a52,int a53,unsigned int a54,int a55,unsigned __int8 a56)
{
  int v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  int v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t, uint64_t, char *);
  uint64_t v63;
  uint64_t v64;
  int v65;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, _QWORD, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _BOOL4 v72;

  v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *))(v58 + 8 * v56);
  HIDWORD(a12) = v57;
  v63 = a56 ^ 0x5Fu;
  if ((_DWORD)v63 == 2)
  {
    v72 = (unint64_t)&a39 < a30 && v59 < (unint64_t)&a48;
    return ((uint64_t (*)(_QWORD, _QWORD))(*(_QWORD *)(v58
                                                               + 8
                                                               * (int)(((((a2 + 972) | 0x112) ^ 0x505) * v72) ^ (a2 + 1233)))
                                                   - (a29 ^ 0x65A)))(a54, a54);
  }
  else if ((_DWORD)v63 == 1)
  {
    v64 = ((_DWORD)a2 + 40) | 0x81u;
    v65 = a2 + 169;
    v67 = (unint64_t)&a39 >= a30 || v59 >= (unint64_t)&a48;
    v68 = (v64 + 637);
    v69 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 + 8 * (int)((v68 * v67) ^ v65)) - 4);
    return v69(v64, 1075421723, v69, v68, &a39, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26);
  }
  else
  {
    a50 = v60 + 2 * (a50 ^ v60) - (v61 & (4 * (a50 ^ v60)));
    a51 = 2 * (a51 ^ v60) + v60 - (v61 & (4 * (a51 ^ v60)));
    a52 = 2 * (a52 ^ v60) + v60 - (v61 & (4 * (a52 ^ v60)));
    a53 = 2 * (a53 ^ v60) + v60 - (v61 & (4 * (a53 ^ v60)));
    return v62(v63, a2, 3005633205, a4, &a39);
  }
}

uint64_t sub_1B97E2F48(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,unsigned int a32,uint64_t a33,uint64_t a34,int a35)
{
  uint64_t v35;
  unsigned int v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;

  v36 = a35 + 2117096340 + a7;
  v37 = v36 < 0xCB0A057B;
  v38 = v36 > a32;
  if (a32 < 0xCB0A057B != v37)
    v39 = v37;
  else
    v39 = v38;
  return ((uint64_t (*)(void))(*(_QWORD *)(v35 + 8 * ((634 * !v39) ^ (a2 + 1022))) - 12))();
}

uint64_t sub_1B97E2FCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a7 ^ (47 * (v7 + a3 + 63 < (v7 + a3)))))
                            - ((26 * (a7 ^ 0x4DEu)) ^ 0x38)))();
}

uint64_t sub_1B97E3028(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  *(_BYTE *)(a4 + v9) = *(_BYTE *)(v12 + (v8 + a3))
                      - ((*(_BYTE *)(v12 + (v8 + a3)) << (((v10 + 113) | a8) - 30)) & a6)
                      + 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v9 != 63) * v13) ^ v10)) - 12))();
}

uint64_t sub_1B97E307C(uint64_t a1, uint64_t a2, int a3, int8x16_t *a4)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;

  *a4 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v7 + (v4 + a3)), vandq_s8(vaddq_s8(*(int8x16_t *)(v7 + (v4 + a3)), *(int8x16_t *)(v7 + (v4 + a3))), v9)), v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (v5 + 317)) - 12))();
}

uint64_t sub_1B97E30D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13
                                                                       + 8
                                                                       * ((984
                                                                         * (((((_DWORD)a2 + 528) ^ (a13 - 1998991134 + (((_DWORD)a2 - 52) | 0x44u) + 1317 < 0xFFFFFFFB)) & 1) == 0)) ^ ((int)a2 + 441))))(a1, a2, a3, a4);
}

void sub_1B97E314C()
{
  JUMPOUT(0x1B97E22CCLL);
}

uint64_t sub_1B97E316C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  int v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;

  v19 = a16 < 0xF3E5C5F5;
  if (v19 == (v16 - 1492379478) < 0xF3E5C5F5)
    LOBYTE(v19) = v16 - 1492379478 < a16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * (((16 * ((v17 ^ 0x3F ^ v19) & 1)) & 0xDF | (32 * ((v17 ^ 0x3F ^ v19) & 1))) ^ v17))
                            - 4))();
}

uint64_t sub_1B97E31EC@<X0>(int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, char a5@<W5>, int a6@<W8>)
{
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v12 = a2 < v9;
  *(_BYTE *)(a4 + (a6 + v8)) = *(_BYTE *)(v11 + (v6 + a3))
                                           - (a5 & (2 * *(_BYTE *)(v11 + (v6 + a3))))
                                           + 50;
  v13 = a1 + v6 + 1;
  v14 = v12 ^ (v13 < v9);
  v15 = v13 < a2;
  if (!v14)
    v12 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((16 * !v12) | (32 * !v12)) ^ v7)) - 4))();
}

uint64_t sub_1B97E3264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,unint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,unsigned int a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;

  v52 = 628203409 * ((-671978737 - ((v51 - 168) | 0xD7F26B0F) + ((v51 - 168) | 0x280D94F0)) ^ 0xAA8598C3);
  *(_DWORD *)(v51 - 160) = v52 + v49 - 646;
  *(_DWORD *)(v51 - 156) = a15 - v52;
  STACK[0x358] = a24;
  v53 = sub_1B97F4E54(v51 - 168);
  v54 = a49 & 0x3F;
  *(&a40 + (v54 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v50
                                                                       + 8
                                                                       * ((105 * ((v54 ^ 0x14) < 0x38)) ^ v49))
                                                           - ((v49 + 2049300052) & 0x85DA233C)
                                                           + 48))(v53, a32, 3005633205);
}

uint64_t sub_1B97E3364()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((((v0 - 1180579210) < 0x38) * (3 * (v2 ^ 0x1ED) - 42)) ^ (v2 + 461))))(50);
}

uint64_t sub_1B97E33AC@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v1;
  v5 = v2 + v1;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((a1 - 905) ^ 0x68C) - 1039)
                                          * ((unint64_t)(v6 - v4 + 1180579210) < 8)) ^ a1))
                            - 8))();
}

uint64_t sub_1B97E3404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(a10 + v12 + (v10 ^ 0x68F)) = v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (int)((624 * ((v11 & 0xFFFFFFFFFFFFFFF8) == 8)) | v10)) - 8))();
}

uint64_t sub_1B97E344C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v7 + (v5 ^ a5)) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (int)(((v6 == 0) * v8) | v5)) - 8))();
}

uint64_t sub_1B97E3478()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 - 1) | 2) - 509) * (v0 != v1)) ^ v2)))();
}

uint64_t sub_1B97E34A0@<X0>(char a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = a3 + v4;
  *(_BYTE *)(a2 + v6) = a1;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((((unint64_t)(v6 + 1) < 0x38) | (2 * ((unint64_t)(v6 + 1) < 0x38))) ^ v3 ^ 3)))();
}

uint64_t sub_1B97E34D4(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(a4 + v5 + v6) = a1;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((unint64_t)(v5 + v6 + 1) < 0x38) | (2
                                                                            * ((unint64_t)(v5 + v6 + 1) < 0x38))) ^ v4)))();
}

void sub_1B97E3500()
{
  JUMPOUT(0x1B97E22C8);
}

uint64_t sub_1B97E383C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v1 != v0) * ((v2 - 1209) ^ 0x27D)) ^ v2)) - 12))();
}

uint64_t sub_1B97E3884@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v7 = v2 + v4;
  *(_BYTE *)(a1 + v7) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((unint64_t)(v7 + 1) < 0x40) * v3) ^ (a2 + 1209))) - 12))();
}

void sub_1B97E38C4()
{
  JUMPOUT(0x1B97E22C8);
}

uint64_t sub_1B97E38D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37)
{
  int v37;
  int v38;
  uint64_t v39;
  BOOL v40;

  v40 = (v38 & 0xFFFFFFFC) == ((v37 | 0x92) ^ 0x2E1) + 1998989753;
  return (*(uint64_t (**)(uint64_t, uint64_t, char *))(v39
                                                             + 8
                                                             * (((2
                                                                * (((19 * ((v37 | 0x92) ^ 0xE1)) ^ v40) & 1)) & 0xF7 | (8 * (((19 * ((v37 | 0x92) ^ 0xE1)) ^ v40) & 1))) ^ (v37 | 0x92))))(a1, a2, &a37);
}

uint64_t sub_1B97E3938@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>)
{
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(a2 + (a3 + v5)) = *(_BYTE *)(a1 + v3 - 1998989808);
  return (*(uint64_t (**)(void))(v7 + 8 * ((1737 * (((v3 + 1) & 0xFFFFFFFCLL) == v6)) ^ (v4 - 313))))();
}

uint64_t sub_1B97E399C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t (*a20)(uint64_t),uint64_t a21,uint64_t a22,uint64_t a23,unint64_t a24)
{
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v26 = 628203409 * ((~((v25 - 168) | 0x9F6F2C5F) + ((v25 - 168) & 0x9F6F2C5F)) ^ 0xE218DF93);
  *(_DWORD *)(v25 - 160) = v26 + v24 + 1001;
  *(_DWORD *)(v25 - 156) = 507371030 - v26;
  STACK[0x358] = a24;
  v27 = sub_1B97F4E54(v25 - 168);
  return a20(v27);
}

uint64_t sub_1B97E3A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,int a53)
{
  uint64_t v53;
  uint64_t v55;
  unint64_t v56;

  if (BYTE4(a32) == 2)
    return ((uint64_t (*)(void))(*(_QWORD *)(v53
                                          + 8
                                          * ((140 * (a53 != 62 * (a2 ^ 0x26) + 369983733)) ^ ((int)a2 + 1064)))
                              - 12))();
  if (BYTE4(a32) == 1)
    return ((uint64_t (*)(void))(*(_QWORD *)(v53
                                          + 8
                                          * (((2 * (a53 == 369984849)) | (16 * (a53 == 369984849))) ^ ((int)a2 + 1050)))
                              - ((2 * (_DWORD)a2) ^ 0x426u)
                              + 1090))();
  v55 = 103 * (a2 ^ 0x31);
  v56 = ((unint64_t)&a37 ^ 0x7DFFFDE1BDDDED78 ^ v55)
      + ((2 * (_QWORD)&a37) & 0xFBFFFBC37BBBDEF0)
      - 0x601C90400009019ELL;
  a52 = ((v56 + 35) ^ 0xBA) * (v56 + 103 * (a2 ^ 0x31) + 49);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 + 8 * (int)v55) - 4))(a1, a2, a19, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

void sub_1B97E3D50()
{
  JUMPOUT(0x1B97E3D20);
}

uint64_t sub_1B97E3D58@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  uint64_t result;
  uint64_t v4;

  memset((void *)(v1 - 204), 50, 16);
  v2 = 235795823 * ((((v1 - 168) | 0xEB9F054C) - ((v1 - 168) & 0xEB9F054C)) ^ 0x7F324C15);
  *(_DWORD *)(v1 - 160) = v2 + 1596901039;
  *(_DWORD *)(v1 - 132) = (a1 + 1809) ^ v2;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_1E709D0C0 + a1 - 11) - 4))(v1 - 168);
  *(_DWORD *)(v4 + 12) = *(_DWORD *)(v1 - 136);
  return result;
}

void cp2g1b9ro(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_1B97E3EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;

  a15 = 108757529
      * (((&a14 | 0x7488BE6A) - &a14 + (&a14 & 0x8B774190)) ^ 0x9414DC41)
      + 1695027452;
  v17 = sub_1B9816CD4(&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16 + 8 * ((924 * (a14 == 1645153785)) ^ v15)) - 4))(v17);
}

uint64_t sub_1B97E3F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, int a15, unsigned int a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  a16 = 1307 - 460628867 * ((&a14 & 0x9E53D03D | ~(&a14 | 0x9E53D03D)) ^ 0x2D3AADBF);
  a14 = &STACK[0x4BD26FD1213425B9];
  sub_1B97F2874((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * ((17 * (a15 == v16)) ^ 0x4AD))
                                                                                                - 4))(v18, v19, v20, v21, v22, v23, v24);
}

uint64_t sub_1B97E4010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  a16 = v19 + 1224239923 * ((&a14 & 0xD2B4AA2E | ~(&a14 | 0xD2B4AA2E)) ^ 0xDFF8A806) + 1201;
  a17 = v17;
  a15 = a12;
  v23 = ((uint64_t (*)(int *))(*(_QWORD *)(v21 + 8 * (v19 ^ 0xB0)) - 12))(&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20
                                                      + 8 * (((a14 == v18) * (v22 + v19 + 840366501 + 600)) ^ v19))
                                          - 4))(v23);
}

uint64_t sub_1B97E40C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, unsigned int a16, unsigned int a17, unsigned int a18, int a19)
{
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;

  v23 = 460628867 * (&a14 ^ 0x4C96827D);
  a18 = 635686783 - v23;
  a14 = &STACK[0x58A7AA08624568F6];
  a15 = a12;
  a16 = v23 - 910010299;
  a17 = v23 + v20 + 2138963185;
  v24 = sub_1B98170A4((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22
                                                      + 8
                                                      * (((a19 == v19) * (((v20 ^ (v21 + 602)) - v21 + 300) ^ 0x789)) ^ v20))
                                          - 4))(v24);
}

uint64_t sub_1B97E4178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, unsigned int a14, unint64_t *a15, unint64_t *a16)
{
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(unsigned int *);
  uint64_t v22;

  a14 = (v20 - 390) ^ (1374699841
                     * ((&a14 - 762734092 - 2 * (&a14 & 0xD28999F4)) ^ 0xBF7D81FD));
  a15 = &STACK[0x384B062F07609560];
  a16 = a11;
  v21 = (void (*)(unsigned int *))(*(_QWORD *)(v19 + 8 * (v20 ^ 0x26A)) - 8);
  v21(&a14);
  a14 = (v20 - 390) ^ (1374699841
                     * ((&a14 + 2125390926 - 2 * (&a14 & 0x7EAEE44E)) ^ 0x135AFC47));
  a15 = &STACK[0x384B062F07609564];
  a16 = a11;
  v21(&a14);
  a14 = (v20 + 111) ^ (1755732067
                     * ((791046139 - (&a14 | 0x2F2667FB) + (&a14 | 0xD0D99804)) ^ 0xE1F25DF));
  a15 = a11;
  v22 = sub_1B9812F54((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((((v20 - v16 - 1) ^ ((_DWORD)a16 == v17)) & 1)
                                                        * (v20 ^ 0x2F5)) ^ v20))
                                          - 4))(v22);
}

uint64_t sub_1B97E42E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  unsigned int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * (int)((1534 * (a14 == v14)) ^ v16 ^ 0x2A)) - (v16 ^ 0x2DBLL)))();
}

uint64_t sub_1B97E4324()
{
  _QWORD *v0;
  int v1;
  int v2;
  void (*v4)(_BYTE *);
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BYTE v8[4];
  int v9;
  uint64_t v10;

  *v0 = v2 ^ v7 ^ 0x5019F7ADu;
  v10 = v5;
  v9 = 535753261 * (((v8 | 0x7AAA3359) + (~v8 | 0x8555CCA6)) ^ 0x705E3D77) - 840365647 + v2;
  v4(v8);
  v9 = 535753261 * ((v8 - 1904952353 - 2 * ((unint64_t)v8 & 0x8E74BBDF)) ^ 0x8480B5F0)
     - 840365647
     + v2;
  v10 = v6;
  v4(v8);
  return v1 ^ 0x620F0DF9u;
}

uint64_t sub_1B97E4434(uint64_t a1)
{
  int v1;
  signed int v2;

  v1 = *(_DWORD *)a1 - 628203409 * (a1 ^ 0x82880C33) + 2;
  v2 = (v1 ^ 0xF680737B) + *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19);
  if (v2 < 0)
    v2 = -v2;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + v1 - 177)
                              + ((((v2 ^ 0xBDEDFFF6) + 1108475913 + ((2 * v2) & 0x7BDBFFEC) < 0x7FFFFFFF)
                                * ((v1 - 1262923266) & 0x4B46ADFF ^ 0x60E)) ^ v1)
                              - 1)
                            - (((v1 - 18) | 0x10u) ^ 0xD5)))();
}

uint64_t sub_1B97E4538(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  _QWORD *v5;
  unsigned int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8 * (((*(_DWORD *)(*v5 + 4 * v6) != a2) * (((a4 - 22) | 0x18) ^ a3)) ^ a4))
                            - 12))();
}

void sub_1B97E4570()
{
  JUMPOUT(0x1B97E44F4);
}

uint64_t sub_1B97E4578(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)(result + 4) = a6;
  return result;
}

void sub_1B97E4580()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  char v3;

  v0 = MEMORY[0x1E0C80A78]();
  if (*(_QWORD *)(v0 + 24))
    v2 = *(_QWORD *)(v0 + 8) == 0x58A7AA08624568E6;
  else
    v2 = 1;
  v3 = v2;
  v1 = *(_DWORD *)(v0 + 16) ^ (1755732067 * ((2 * (v0 & 0x47DE7202) - v0 - 1205760515) ^ 0x66E73026));
  __asm { BR              X8 }
}

uint64_t sub_1B97E46AC()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  int v8;

  LODWORD(STACK[0x468]) = v0;
  v5 = v4 - 200;
  *(_BYTE *)v5 = (-85 * ((2 * ((v4 + 56) & 0x38) - (v4 + 56) - 57) ^ 0x31)) ^ 0x2E;
  STACK[0x2A8] = (unint64_t)&STACK[0x4CAF57822185C49D];
  *(_QWORD *)(v5 + 8) = &STACK[0x4CAF57822185C49D];
  STACK[0x2B0] = (unint64_t)&STACK[0x705CCB0086AF2F6E];
  *(_QWORD *)(v5 + 24) = &STACK[0x705CCB0086AF2F6E];
  *(_DWORD *)(v4 - 184) = 3804331 * ((2 * ((v4 - 200) & 0x59AF7138) - (v4 - 200) - 1504670009) ^ 0xD885AB31) + v2 + 856;
  v6 = *(uint64_t (**)(uint64_t))(v1 + 8 * (v2 ^ 0x2CE));
  STACK[0x2A0] = (unint64_t)v6;
  v7 = v6(v4 - 200);
  v8 = *(_DWORD *)(v4 - 180);
  LODWORD(STACK[0x618]) = v8;
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (((v8 == 1645153785) * ((((v2 + 592) | 4) + 556) ^ (v2 - 231))) ^ v2)))(v7);
}

#error "1B97E4FE0: call analysis failed (funcsize=363)"

uint64_t sub_1B97E4FE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;

  STACK[0x2C8] = v1;
  STACK[0x4D8] = 0;
  v6 = 235795823 * ((565679011 - ((v5 - 200) | 0x21B793A3) + ((v5 - 200) | 0xDE486C5C)) ^ 0x4AE52505);
  v4[1] = 0x15C2A15CF2725D85;
  v7 = STACK[0x2B8];
  *(_DWORD *)(v5 - 200) = v6 ^ 0xE4EF48AC;
  *(_DWORD *)(v5 - 164) = v3 - v6 - 440;
  v8 = STACK[0x2C0];
  v4[2] = v7;
  v4[3] = v8;
  v9 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v0 + 8 * (v3 - 626)) - 12);
  STACK[0x2D0] = (unint64_t)v9;
  v10 = v9(v5 - 200);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((22 * (*(_DWORD *)(v5 - 168) != 1645153785)) ^ v3))
                                          - ((v3 ^ 0x14Du)
                                           + 676)
                                          + 1249))(v10);
}

uint64_t sub_1B97E50C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  LODWORD(STACK[0x4AC]) = v4;
  STACK[0x620] = STACK[0x460];
  LODWORD(STACK[0x618]) = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                       + 8
                                                                       * ((((179 * (((v3 - 1197) | 0x44) ^ 0x7B)
                                                                           - 1018159216) & 0x3CAFDFCB ^ 0x597)
                                                                         * (v4 == v6)) ^ ((v3 - 1197) | 0x44))))(a1, a2, a3, 2649773600);
}

void sub_1B97EA35C()
{
  JUMPOUT(0x1B97E4F3CLL);
}

uint64_t sub_1B97EA3F4(unint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 304) = v2 - 176;
  *(_QWORD *)(v5 + 96) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 | (2 * (v4 > a1)))) - ((v1 - 22) ^ 0x33FLL)))();
}

uint64_t sub_1B97EA498@<X0>(uint64_t a1@<X0>, char a2@<W3>, int a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(a1 + (v6 + v7)) = *(_BYTE *)(v9 + (v6 + v7)) ^ *(_BYTE *)(v4
                                                                                                 + ((v6 + v7) & 0xFLL)) ^ *(_BYTE *)(v5 + ((v6 + v7) & 0xFLL)) ^ *(_BYTE *)(((v6 + v7) & 0xFLL) + v3 + 2) ^ (((v6 + v7) & 0xF) * (a3 ^ 0x80)) ^ a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((120 * ((v6 + 1 + v7) < 0x150)) ^ a3)) - 8))();
}

uint64_t sub_1B97EA500@<X0>(uint64_t a1@<X0>, char a2@<W3>, int a3@<W5>, char a4@<W6>, int a5@<W7>, int a6@<W8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = (v9 + a3);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(v12 + v13) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ *(_BYTE *)(v8 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + v6 + 2) ^ ((v13 & 0xF) * a4) ^ a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v9 - 1 != v10) * a5) ^ a6)) - 8))();
}

uint64_t sub_1B97EA560@<X0>(int8x16_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int8x16_t *a14)
{
  int v14;
  uint64_t v15;
  _QWORD *v16;
  int8x16_t *v17;
  uint64_t v18;

  v17 = (int8x16_t *)((char *)&STACK[0x6C0] + STACK[0x3D0] + (a7 ^ 0x991D124D801601E0));
  *v17 = veorq_s8(*a14, (int8x16_t)xmmword_1B981C640);
  v18 = v16[47];
  v16[48] = a1;
  v16[49] = a1;
  v16[47] = 435 * (v14 ^ 0x662u) + v18 - 1708;
  return ((uint64_t (*)(int8x16_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * (v14 ^ ((v17 == a1) | ((v17 == a1) << 8))))
                                                                                           - 8))(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1B97EA5E4@<X0>(unsigned __int8 *a1@<X0>, int a2@<W4>, char a3@<W7>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 *v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  int v69;
  uint64_t v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  int v83;
  unsigned __int8 v84;
  int v85;
  uint64_t v86;
  int v87;
  int v88;
  unint64_t v89;
  unint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  char v95;
  int v96;
  unsigned int v97;
  int v98;
  int v99;
  int v100;
  unsigned int v101;
  char v102;
  int v103;
  char v104;
  unsigned int v105;
  int v106;
  char v107;
  uint64_t v108;
  int v109;
  unint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  uint64_t v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  int v126;
  int v127;
  unsigned int v128;
  unsigned int v129;
  int v130;
  int v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  int v136;
  int v137;
  int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  int v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  unsigned int v160;
  int v161;
  int v162;
  int v163;
  unsigned int v164;
  int v165;
  int v166;
  unsigned int v167;
  int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  unsigned int v173;
  int v174;
  int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  int v179;
  unsigned int v180;
  int v181;
  int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  int v189;
  unint64_t v190;
  int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  int v195;
  unsigned int v196;
  unsigned int v197;
  int v198;
  int v199;
  unsigned int v200;
  unsigned int v201;
  int v202;
  int v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  int v207;
  unsigned int v208;
  int v209;
  int v210;
  int v211;
  unsigned int v212;
  int v213;
  unsigned int v214;
  unsigned int v215;
  int v216;
  int v217;
  unsigned int v218;
  int v219;
  int v220;
  int v221;
  unsigned int v222;
  int v223;
  int v224;
  int v225;
  unsigned int v226;
  int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  int v231;
  int v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  int v236;
  unsigned int v237;
  unsigned int v238;
  int v239;
  int v240;
  unsigned int v241;
  unsigned int v242;
  int v243;
  int v244;
  unsigned int v245;
  int v246;
  int v247;
  unsigned int v248;
  int v249;
  int v250;
  unsigned int v251;
  int v252;
  int v253;
  int v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  int v258;
  int v259;
  BOOL v260;
  unsigned int v261;
  int v262;
  int v263;
  unsigned int v264;
  unsigned int v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  int v269;
  unint64_t v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  int v274;
  int v275;
  unsigned int v276;
  char *v277;
  char *v278;
  char *v279;
  unsigned int v280;
  unsigned int v281;
  char *v282;
  int v283;
  unsigned int v284;
  unsigned int v285;
  unsigned int v286;
  int v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  unsigned int v294;
  uint64_t v295;
  unsigned int v296;
  uint64_t v297;
  unsigned int v298;
  uint64_t v299;
  char *v300;
  char *v301;
  int v302;
  int v303;
  unsigned int v304;
  uint64_t v305;
  char *v306;
  int v307;
  unint64_t v308;
  unint64_t v309;
  int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  unsigned int v314;
  int v315;
  unsigned int v316;
  int v317;
  unint64_t v318;
  unsigned int v319;
  int v320;
  _BYTE *v322;
  unsigned __int8 *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  unint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  int v336;
  uint64_t v337;
  int v338;
  int v339;
  uint64_t v340;

  v61 = (unsigned __int8 *)&STACK[0x19C0] + a4;
  *v61 = *a1;
  *(_QWORD *)(v61 + 1) = *(_QWORD *)(a1 + 1);
  *(_DWORD *)(v61 + 9) = *(_DWORD *)(a1 + 9);
  *(_WORD *)(v61 + 13) = *(_WORD *)(a1 + 13);
  v61[15] = a1[15];
  v62 = *((_QWORD *)a1 + 1);
  *((_QWORD *)v61 + 2) = *(_QWORD *)a1;
  *((_QWORD *)v61 + 3) = v62;
  v63 = (v57 - 589705933) & 0x23262F86;
  v64 = *(_QWORD *)(v59 + 8 * (v57 - 1560)) - 12;
  v65 = *(_QWORD *)(v59 + 8 * (v57 - 1531));
  v66 = *(_QWORD *)(v59 + 8 * (v57 - 1546)) - 12;
  v67 = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 14) ^ 0x86));
  v68 = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 10) ^ 0xCBLL));
  LODWORD(v62) = (((*(unsigned __int8 *)(v65 + (v61[8] ^ 0x65)) + (v61[8] ^ a2) - 123) ^ 0xF5) << 24) | (((v68 ^ (16 * v68)) ^ 0x25) << 8);
  v69 = ((v61[7] ^ 0x90) + *(_BYTE *)(v64 + (v61[7] ^ 0x7CLL)) - 85) | ((((v61[4] ^ 0x13)
                                                                                         + *(unsigned __int8 *)(v65 + ((((v57 + 51) & 0x86) - 68) ^ v61[4]))
                                                                                         - 123) ^ 0xE6) << 24);
  v70 = *(_QWORD *)(v59 + 8 * (v57 - 1733));
  v71 = *(unsigned __int8 *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 1) ^ 0x1ALL));
  v72 = (v71 >> 1) ^ (((((v71 ^ 0xA7) + (v71 & 0xD5 ^ a3) + 1) ^ v71 & 0xDF) & 0xF0) >> 4) ^ 0x3C;
  v73 = ((v61[3] ^ 0xB8) + *(_BYTE *)(v64 + (v61[3] ^ 0x54)) - 85) | ((v71 ^ 0x37 ^ (v72 - ((2 * v72) & 0xA6) + 83)) << 16);
  LOBYTE(v71) = *(_BYTE *)(v66 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 6) ^ 0x2ELL));
  v74 = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 13) ^ 0x5BLL)) ^ 0x72;
  v75 = v69 & 0xFFFF00FF | (((v71 ^ (16 * v71)) ^ 0x39) << 8);
  v76 = *(unsigned __int8 *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 13) ^ 0x5BLL)) ^ 0x72 ^ (v74 >> 4) ^ (v74 >> 1);
  v77 = (((v67 ^ (16 * v67)) ^ 0xE9) << 8) | ((v76 - ((2 * v76) & 0x2E) + 23) << 16);
  LOBYTE(v72) = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x19C0] + a4 + 5) ^ 0xEDLL));
  v78 = ((v72 ^ 0x72) >> 4) ^ ((v72 ^ 0x72) >> 1);
  v324 = v70;
  v326 = v65;
  v327 = v64;
  LODWORD(v62) = v62 & 0xFF00FF00 | ((v61[11] ^ 0x3E) + *(_BYTE *)(v64 + (v61[11] ^ 0xD2)) - 85) | (((*(_BYTE *)(v70 + (v61[9] ^ 0x38)) ^ ((*(_BYTE *)(v70 + (v61[9] ^ 0x38)) ^ 0x72) >> 4) ^ ((*(_BYTE *)(v70 + (v61[9] ^ 0x38)) ^ 0x72) >> 1)) ^ 0xD9) << 16);
  v325 = v66;
  v79 = v73 & 0xFFFF00FF | (((*(unsigned __int8 *)(v65 + (*v61 ^ 0x81)) + (*v61 ^ 0xD0) - 123) ^ 0x3C) << 24) | (((*(_BYTE *)(v66 + (v61[2] ^ 0x22)) ^ (16 * *(_BYTE *)(v66 + (v61[2] ^ 0x22)))) ^ 0x17) << 8);
  LODWORD(STACK[0x428]) = (v77 & 0xFFFFFF00 | ((((v61[12] ^ 0x13) + *(unsigned __int8 *)(v65 + (v61[12] ^ 0x42)) - 123) ^ 0xE6) << 24) | (*(_BYTE *)(v64 + (v61[15] ^ 0x38)) + (v61[15] ^ 0xD4) - 85)) ^ 0x5DA22AEE;
  LODWORD(STACK[0x3D8]) = v79 ^ 0x29843879;
  LODWORD(STACK[0x300]) = (v75 & 0xFF00FFFF | ((v72 ^ 0x6C ^ (v78
                                                                                              - ((2 * v78) & 0x62)
                                                                                              + 49)) << 16)) ^ HIDWORD(a34);
  LODWORD(STACK[0x408]) = v62 ^ 0x18D17C97;
  v322 = *(_BYTE **)(v60 + 384);
  v323 = *(unsigned __int8 **)(v60 + 392);
  STACK[0x420] = 14;
  HIDWORD(v333) = (v63 ^ 0x619) + 301;
  v80 = v66;
  LODWORD(v61) = *(unsigned __int8 *)(v66 + (BYTE4(v333) ^ 0x15u ^ v323[14]));
  STACK[0x320] = 4;
  v81 = v323[4];
  v82 = (((16 * (_DWORD)v61) ^ 0xFFFFFFA0) - ((2 * ((16 * (_DWORD)v61) ^ 0xFFFFFFA0)) & 0x60) + 58) ^ v61;
  LOBYTE(v61) = *(_BYTE *)(v65 + (v81 ^ 0xE6));
  STACK[0x460] = 15;
  v83 = v323[15];
  v84 = ((_BYTE)v61 + (v81 ^ 0xB7) - 123) ^ 0xE5;
  if ((v83 & 0x20) != 0)
    v85 = -32;
  else
    v85 = 32;
  v86 = (v85 + v83);
  v87 = *(unsigned __int8 *)(v64 + (v86 ^ 0xDD));
  STACK[0x418] = 6;
  v88 = *(unsigned __int8 *)(v66 + (v323[6] ^ 0x51));
  v339 = v87 + (v86 ^ 0x31);
  STACK[0x328] = 12;
  STACK[0x2D0] = 0;
  HIDWORD(v89) = v88 ^ (((16 * v88) ^ 0xFFFFFFA0) - ((2 * ((16 * v88) ^ 0xFFFFFFA0)) & 0x60) + 58) ^ 0x3F;
  LODWORD(v89) = BYTE4(v89) & 0xF8;
  v90 = ((v89 >> 3) | ((unint64_t)v84 << 13)) ^ 0x58F620A6;
  v91 = (v90 >> 21) | ((_DWORD)v90 << 11);
  v338 = *(unsigned __int8 *)(v65 + (v323[12] ^ 0xF7) - 2 * ((v323[12] ^ 0xF7) & 0xAEu) + 174) - (v323[12] ^ 0xF7);
  v92 = *v323;
  STACK[0x3D0] = 3;
  v93 = v323[3];
  v94 = *(unsigned __int8 *)(v65 + (v92 ^ 0xD8)) + (v92 ^ 0x76) - 2 * (v92 ^ 0x76);
  STACK[0x400] = 8;
  v336 = (v93 ^ 0xFFFFFFBB) + *(unsigned __int8 *)(v64 + (v93 ^ 0x57));
  v95 = (v323[8] ^ 0xA7) + *(_BYTE *)(v65 + (v323[8] ^ 0xF6));
  STACK[0x3C0] = 7;
  LOBYTE(v93) = (v323[7] ^ 0xE9) + *(_BYTE *)(v64 + (v323[7] ^ 5)) - 85;
  STACK[0x298] = 13;
  v96 = *(unsigned __int8 *)(v70 + (v323[13] ^ 0x12));
  v97 = v96 ^ ((((v96 ^ 0x72u) >> 3) & 4 ^ v96 & 0xA4 | ((v96 ^ 0x72u) >> 3) & 0xFFFFFFFB ^ (v96 ^ 0x72) & 0x5A) >> 1);
  LOBYTE(v96) = *(_BYTE *)(v70 + (v323[5] ^ 0x9CLL));
  v98 = ((v96 ^ 0x72) >> 4) ^ ((v96 ^ 0x72) >> 1);
  v99 = v93 | ((v96 ^ 0xE6 ^ (v98 - ((2 * v98) & 0x62) + 49)) << 16);
  STACK[0x290] = 9;
  v100 = *(unsigned __int8 *)(v70 + (v323[9] ^ 0x76));
  v101 = (v100 ^ 0x72u) >> 3;
  v102 = v100 & 8 | 0x37;
  if ((v101 & v100 & 8) != 0)
    v102 = 110 - v102;
  v103 = v100 ^ ((((v101 + v102 - 55) ^ (v100 ^ 0x72) & 0xF7) & 0xFE) >> 1);
  STACK[0x228] = 1;
  v104 = *(_BYTE *)(v64 + (v323[11] ^ 0x12)) + (v323[11] ^ 0xFE);
  v105 = *(_BYTE *)(v70 + (v323[1] ^ 0xCFLL)) ^ 0x72;
  v106 = *(unsigned __int8 *)(v70 + (v323[1] ^ 0xCFLL)) ^ 0x72 ^ (v105 >> 4) ^ (v105 >> 1);
  STACK[0x258] = 10;
  v107 = *(_BYTE *)(v80 + (v323[10] ^ 0xFBLL));
  v108 = *(_QWORD *)(v59 + 8 * (v63 - 769)) - 4;
  HIDWORD(v331) = (v107 ^ (16 * v107)) ^ 0x23;
  v109 = *(_DWORD *)(v108 + 4 * ((v107 ^ (16 * v107)) ^ 0xACu));
  HIDWORD(v110) = v109 ^ 0x7763;
  LODWORD(v110) = v109 ^ 0x55D90000;
  v111 = *(_QWORD *)(v59 + 8 * (v63 - 704)) - 8;
  LODWORD(v333) = v97;
  v112 = *(_DWORD *)(v111 + 4 * (v97 ^ 0x17));
  HIDWORD(v340) = v63;
  LODWORD(v331) = v94 - 124;
  v113 = *(_QWORD *)(v59 + 8 * (v63 - 734)) - 4;
  v114 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4 * ((v94 - 124) ^ 0xF9u)) ^ (16 * (v112 ^ 0xB4C82AC9)
                                                                                          + 1452181747
                                                                                          - ((32 * (v112 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  v115 = v112 ^ (v114 - 905743237 - ((2 * v114) & 0x9406E8F6));
  HIDWORD(v330) = v99 ^ v91;
  v116 = v99 ^ v91 ^ 0xDD03A24B;
  v117 = (v99 ^ v91) ^ 0x78;
  v118 = *(_QWORD *)(v59 + 8 * (v63 ^ 0x394)) - 8;
  LODWORD(v334) = v82;
  v119 = *(_DWORD *)(v108 + 4 * (v82 ^ 0x71u));
  v120 = *(_DWORD *)(v118 + 4 * v117) ^ v115;
  HIDWORD(v110) = v119 ^ 0x7763;
  LODWORD(v110) = v119 ^ 0x55D90000;
  v332 = __PAIR64__(v103, v106);
  v121 = *(_DWORD *)(v111 + 4 * (v106 ^ 0xBFu)) ^ 0xB4C82AC9;
  v122 = (v110 >> 16) ^ (16 * v121 + 1452181747 - ((32 * v121) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * HIBYTE(v116));
  HIDWORD(v329) = (v104 - 85);
  v123 = *(_DWORD *)(v118 + 4 * (HIDWORD(v329) ^ 0xB9u)) ^ v121 ^ (v122 - 905743237 - ((2 * v122) & 0x9406E8F6));
  v124 = *(_DWORD *)(v111 + 4 * BYTE2(v116)) ^ 0xB4C82AC9;
  v125 = *(unsigned __int8 *)(v80 + (v323[2] ^ 0x26)) ^ 0xFFFFFF82;
  LODWORD(v329) = v125 ^ (16 * v125);
  v126 = *(_DWORD *)(v108 + 4 * (v329 ^ 0xFBu));
  HIDWORD(v110) = v126 ^ 0x7763;
  LODWORD(v110) = v126 ^ 0x55D90000;
  HIDWORD(v328) = (v95 - ((2 * v95 + 10) & 0x4E) - 84);
  v127 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4 * (HIDWORD(v328) ^ 0x40u)) ^ (16 * v124
                                                                           + 1452181747
                                                                           - ((32 * v124) & 0xAD1D11E0));
  LODWORD(v330) = v339 - 85;
  v128 = *(_DWORD *)(v118 + 4 * ((v339 - 85) ^ 0xEBu)) ^ v124 ^ (v127
                                                                                  - 905743237
                                                                                  - ((2 * v127) & 0x9406E8F6));
  v129 = *(_DWORD *)(v111 + 4 * (v103 ^ 0xEu)) ^ 0xB4C82AC9;
  v130 = *(_DWORD *)(v108 + 4 * (BYTE1(v91) ^ 0x31u));
  HIDWORD(v110) = v130 ^ 0x7763;
  LODWORD(v110) = v130 ^ 0x55D90000;
  v131 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4 * ((v338 - 124) ^ 0xF7u)) ^ (16 * v129
                                                                                           + 1452181747
                                                                                           - ((32 * v129) & 0xAD1D11E0));
  HIDWORD(a20) = v336 - 85;
  LODWORD(v328) = v338 - 124;
  v132 = *(_DWORD *)(v118 + 4 * ((v336 - 85) ^ 0x33u)) ^ v129 ^ (v131
                                                                                  - 905743237
                                                                                  - ((2 * v131) & 0x9406E8F6));
  v133 = *(_DWORD *)(v111 + 4 * (BYTE2(v132) ^ 0xBBu)) ^ 0xB4C82AC9;
  v134 = *(_DWORD *)(v108 + 4 * (BYTE1(v128) ^ 0xF4u));
  HIDWORD(v110) = v134 ^ 0x7763;
  LODWORD(v110) = v134 ^ 0x55D90000;
  BYTE1(v134) = BYTE1(v123) ^ 0xAD;
  v135 = v133 ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v120) ^ 0xE3)) ^ *(_DWORD *)(v118
                                                                            + 4 * (v123 ^ 0xDBu)) ^ (16 * v133 + 1452181747 - ((32 * v133) & 0xAD1D11E0)) ^ (v110 >> 16);
  v136 = *(_DWORD *)(v111 + 4 * (BYTE2(v120) ^ 0x24u));
  v137 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v132 ^ 0x22E) >> 8));
  HIDWORD(v110) = v137 ^ 0x7763;
  LODWORD(v110) = v137 ^ 0x55D90000;
  v138 = (16 * (v136 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v136 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v123 ^ 0xF15ADDB) >> 24)) ^ (v110 >> 16);
  v139 = v138 - 905743237 - ((2 * v138) & 0x9406E8F6);
  v140 = *(_DWORD *)(v118 + 4 * (v128 ^ 0x80u)) ^ v136;
  v141 = *(_DWORD *)(v111 + 4 * (BYTE2(v123) ^ 0xD6u)) ^ 0xB4C82AC9;
  v142 = (16 * v141 + 1452181747 - ((32 * v141) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v128) ^ 0x19));
  v143 = *(_DWORD *)(v108 + 4 * (BYTE1(v120) ^ 0xCCu));
  HIDWORD(v110) = v143 ^ 0x7763;
  LODWORD(v110) = v143 ^ 0x55D90000;
  v144 = *(_DWORD *)(v118 + 4 * (v132 ^ 0x2Eu)) ^ v141 ^ (v110 >> 16) ^ (v142
                                                                                          - 905743237
                                                                                          - ((2 * v142) & 0x9406E8F6));
  v145 = *(_DWORD *)(v111 + 4 * (BYTE2(v128) ^ 0x32u));
  v146 = *(_DWORD *)(v108 + 4 * BYTE1(v134));
  HIDWORD(v110) = v146 ^ 0x7763;
  LODWORD(v110) = v146 ^ 0x55D90000;
  v147 = (v110 >> 16) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v132) ^ 0xBD)) ^ (16 * (v145 ^ 0xB4C82AC9)
                                                                         + 1452181747
                                                                         - ((32 * (v145 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  v148 = v145 ^ *(_DWORD *)(v118 + 4 * (v120 ^ 0x69u)) ^ 0xC501FC0D ^ (v147
                                                                                        - 905743237
                                                                                        - ((2 * v147) & 0x9406E8F6));
  v149 = v148
       - ((2 * v148) & 0x5F186BF6)
       + 797718011
       - ((2 * (v148 - ((2 * v148) & 0x5F186BF6) + 797718011)) & 0xFCE7E61C)
       - 25955570;
  v150 = *(_DWORD *)(v111 + 4 * (BYTE2(v149) ^ 0xB0u));
  BYTE2(v132) = BYTE2(v144) ^ 0xEB;
  v151 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v144 ^ 0xDFF9) >> 8));
  v152 = (16 * (v150 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v150 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v135) ^ 0x5C)) ^ (((v151 ^ 0x55D97763u) >> (v135 & 0x10 ^ 0x10) >> (v135 & 0x10)) + ((v151 << 16) ^ 0x77630000));
  v153 = *(_DWORD *)(v118 + 4 * ((v140 ^ v139) ^ 0x10u)) ^ v150 ^ (v152
                                                                                    - 905743236
                                                                                    + ~((2 * v152) & 0x9406E8F6));
  LOWORD(v150) = v135 ^ 0xA05B;
  v154 = *(_DWORD *)(v111 + 4 * ((v135 ^ 0xB559A05B) >> 16)) ^ 0xB4C82AC9;
  v155 = (16 * v154 + 1452181747 - ((32 * v154) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v140 ^ ~v139) >> 24));
  v156 = *(_DWORD *)(v108 + 4 * (BYTE1(v149) ^ 0x60u));
  HIDWORD(v110) = v156 ^ 0x7763;
  LODWORD(v110) = v156 ^ 0x55D90000;
  v157 = *(_DWORD *)(v118 + 4 * (v144 ^ 0xF9u)) ^ v154 ^ ((v155 ^ (v110 >> 16))
                                                                           - 905743237
                                                                           - ((2 * (v155 ^ (v110 >> 16))) & 0x9406E8F6));
  v158 = *(_DWORD *)(v113 + 4 * (HIBYTE(v144) ^ 5));
  HIDWORD(v110) = v158 ^ 0xF3;
  LODWORD(v110) = v158 ^ 0x568E8800;
  v159 = *(_DWORD *)(v111 + 4 * (((v140 ^ v139) >> 16) ^ 0xFDu)) ^ 0xB4C82AC9;
  v160 = (((v110 >> 10) ^ 0x25EB099C) << 10) ^ (16 * v159) ^ (((v110 >> 10) ^ 0x25EB099C) >> 22);
  v161 = *(_DWORD *)(v108 + 4 * BYTE1(v150));
  HIDWORD(v110) = v161 ^ 0x7763;
  LODWORD(v110) = v161 ^ 0x55D90000;
  v162 = *(_DWORD *)(v118
                   + 4
                   * ((v148
                                      - ((2 * v148) & 0xF6)
                                      - 5
                                      - ((2 * (v148 - ((2 * v148) & 0xF6) - 5)) & 0x1C)
                                      + 14) ^ 0x3Du)) ^ v159 ^ (v110 >> 16) ^ (v160
                                                                             - 905743237
                                                                             - ((2 * v160) & 0x9406E8F6));
  v163 = *(_DWORD *)(v108 + 4 * (((unsigned __int16)(v140 ^ v139) >> 8) ^ 0xE7u));
  HIDWORD(v110) = v163 ^ 0x7763;
  LODWORD(v110) = v163 ^ 0x55D90000;
  v164 = *(_DWORD *)(v111 + 4 * BYTE2(v132)) ^ 0xB4C82AC9;
  v165 = (v110 >> 16) ^ (16 * v164 + 1452181747 - ((32 * v164) & 0xAD1D11E0)) ^ *(_DWORD *)(v113
                                                                                          + 4 * (HIBYTE(v149) ^ 0x17));
  v166 = *(_DWORD *)(v118 + 4 * (v150 ^ 0x33u)) ^ v164;
  v167 = v162 ^ 0xF1F7E4A6;
  v168 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v162 ^ 0xE4A6) >> 8));
  v169 = v166 ^ (v165 - 905743237 - ((2 * v165) & 0x9406E8F6));
  HIDWORD(v110) = v168 ^ 0x7763;
  LODWORD(v110) = v168 ^ 0x55D90000;
  v170 = *(_DWORD *)(v111 + 4 * (BYTE2(v169) ^ 0x62u)) ^ 0xB4C82AC9;
  v171 = (16 * v170 + 1452181747 - ((32 * v170) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v153) ^ 0x69));
  v172 = *(_DWORD *)(v118 + 4 * (v157 ^ 0x68u)) ^ v170 ^ (v110 >> 16) ^ (v171
                                                                                          - 905743237
                                                                                          - 2
                                                                                          * (v171 & 0x4A03747F ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v153) ^ 0x69)) & 4));
  v173 = *(_DWORD *)(v111 + 4 * (BYTE2(v153) ^ 0x93u)) ^ 0xB4C82AC9;
  v174 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v169 ^ 0x2957) >> 8));
  HIDWORD(v110) = v174 ^ 0x7763;
  LODWORD(v110) = v174 ^ 0x55D90000;
  v175 = (16 * v173 + 1452181747 - ((32 * v173) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v157) ^ 0xCE)) ^ (v110 >> 16);
  v176 = *(_DWORD *)(v118 + 4 * (v162 ^ 0x15u)) ^ v173 ^ (v175 - 905743237 - ((2 * v175) & 0x9406E8F6));
  v177 = *(_DWORD *)(v111 + 4 * (BYTE2(v157) ^ 0x60u)) ^ 0xB4C82AC9;
  v178 = *(_DWORD *)(v108 + 4 * (BYTE1(v153) ^ 0xB1u));
  HIDWORD(v110) = v178 ^ 0x7763;
  LODWORD(v110) = v178 ^ 0x55D90000;
  v179 = (16 * v177 + 1452181747 - ((32 * v177) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * HIBYTE(v167)) ^ (v110 >> 16);
  v180 = *(_DWORD *)(v118 + 4 * (v169 ^ 0x57u)) ^ v177 ^ (v179 - 905743237 - ((2 * v179) & 0x9406E8F6));
  if ((v157 & 0x1000) != 0)
    v181 = -16;
  else
    v181 = 16;
  v182 = (BYTE1(v157) ^ 0xC) + v181;
  v183 = *(_DWORD *)(v111 + 4 * BYTE2(v167)) ^ 0xB4C82AC9;
  v184 = *(_DWORD *)(v108 + 4 * (v182 ^ 0x83u));
  v185 = *(_DWORD *)(v113 + 4 * (HIBYTE(v169) ^ 0xA1)) ^ HIWORD(v184) ^ (v184 << 16) ^ (16 * v183
                                                                                        + 1452181747
                                                                                        - ((32 * v183) & 0xAD1D11E0)) ^ 0x776355D9;
  v186 = *(_DWORD *)(v118 + 4 * (v153 ^ 0xAAu)) ^ v183 ^ (v185 - 905743237 - ((2 * v185) & 0x9406E8F6));
  v187 = v186 ^ 0xEFBC3B44;
  v188 = *(_DWORD *)(v111 + 4 * ((v186 ^ 0xEFBC3B44) >> 16)) ^ 0xB4C82AC9;
  v189 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v180 ^ 0x8D48) >> 8));
  HIDWORD(v190) = v189 ^ 0x7763;
  LODWORD(v190) = v189 ^ 0x55D90000;
  v191 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v172) ^ 0xCC)) ^ (16 * v188
                                                                         + 1452181747
                                                                         - ((32 * v188) & 0xAD1D11E0));
  v192 = *(_DWORD *)(v118 + 4 * (v176 ^ 0xA9u)) ^ v188 ^ (v191 - 905743237 - ((2 * v191) & 0x9406E8F6));
  LOWORD(v188) = v172 ^ 0xD583;
  v193 = *(_DWORD *)(v111 + 4 * (((v172 ^ 0x255FD583) >> 16) ^ 0xC3u)) ^ 0xB4C82AC9;
  v194 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v186 ^ 0x3B44) >> 8));
  HIDWORD(v190) = v194 ^ 0x7763;
  LODWORD(v190) = v194 ^ 0x55D90000;
  v195 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * HIBYTE(v176)) ^ (16 * v193 + 1452181747 - ((32 * v193) & 0xAD1D11E0));
  v196 = *(_DWORD *)(v118 + 4 * (v180 ^ 0x48u)) ^ v193 ^ (v195 - 905743237 - ((2 * v195) & 0x9406E8F6));
  v197 = *(_DWORD *)(v111 + 4 * ((v176 ^ 0xE93411A9) >> 16)) ^ 0xB4C82AC9;
  v198 = *(_DWORD *)(v108 + 4 * BYTE1(v188));
  HIDWORD(v190) = v198 ^ 0x7763;
  LODWORD(v190) = v198 ^ 0x55D90000;
  v199 = (16 * v197 + 1452181747 - ((32 * v197) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v180 ^ 0x807D8D48) >> 24)) ^ (v190 >> 16);
  v200 = *(_DWORD *)(v118 + 4 * (v186 ^ 0x77u)) ^ v197 ^ (v199 - 905743237 - ((2 * v199) & 0x9406E8F6));
  v201 = *(_DWORD *)(v111 + 4 * (BYTE2(v180) ^ 0xBEu)) ^ 0xB4C82AC9;
  v202 = *(_DWORD *)(v108 + 4 * (BYTE1(v176) ^ 0x82u));
  HIDWORD(v190) = v202 ^ 0x7763;
  LODWORD(v190) = v202 ^ 0x55D90000;
  v203 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * HIBYTE(v187)) ^ (16 * v201 + 1452181747 - ((32 * v201) & 0xAD1D11E0));
  v204 = *(_DWORD *)(v118 + 4 * v188) ^ v201 ^ (v203 - 905743237 - ((2 * v203) & 0x9406E8F6));
  v205 = *(_DWORD *)(v111 + 4 * ((v204 ^ 0x950DA39D) >> 16)) ^ 0xB4C82AC9;
  v206 = (16 * v205 + 1452181747 - ((32 * v205) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v192 ^ 0x11521BCA) >> 24));
  v207 = *(_DWORD *)(v108 + 4 * (BYTE1(v200) ^ 0x89u));
  HIDWORD(v190) = v207 ^ 0x7763;
  LODWORD(v190) = v207 ^ 0x55D90000;
  v208 = v206 - 905743237 - ((2 * v206) & 0x9406E8F6);
  BYTE1(v206) = BYTE1(v196) ^ 0xD1;
  v209 = v205 ^ *(_DWORD *)(v118 + 4 * (v196 ^ 0x88u)) ^ (v190 >> 16) ^ v208;
  v210 = *(_DWORD *)(v111 + 4 * ((v192 ^ 0x11521BCA) >> 16));
  v211 = *(_DWORD *)(v108 + 4 * (BYTE1(v204) ^ 0x30u));
  HIDWORD(v190) = v211 ^ 0x7763;
  LODWORD(v190) = v211 ^ 0x55D90000;
  v212 = (v209 ^ 0x71C9D6C4) - 2 * ((v209 ^ 0x71C9D6C4) & 0x3A5692AD ^ v209 & 9);
  v213 = (16 * (v210 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v210 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v196) ^ 0xDF)) ^ (v190 >> 16);
  v200 ^= 0x7A851A70u;
  v214 = *(_DWORD *)(v118 + 4 * (v200 ^ 0x33u)) ^ v210 ^ (v213 - 905743237 - ((2 * v213) & 0x9406E8F6));
  v215 = *(_DWORD *)(v111 + 4 * (BYTE2(v196) ^ 0xA7u)) ^ 0xB4C82AC9;
  v216 = *(_DWORD *)(v108 + 4 * (BYTE1(v192) ^ 0x88u));
  HIDWORD(v190) = v216 ^ 0x7763;
  LODWORD(v190) = v216 ^ 0x55D90000;
  v217 = (16 * v215 + 1452181747 - ((32 * v215) & 0xAD1D11E0)) ^ (v190 >> 16) ^ *(_DWORD *)(v113
                                                                                          + 4
                                                                                          * ((HIBYTE(v200) ^ -HIBYTE(v200) ^ ((HIBYTE(v200) ^ 0xFFFFFF16) + 234))
                                                                                           + 233));
  v218 = *(_DWORD *)(v118 + 4 * (v204 ^ 0x9Du)) ^ v215 ^ (v217 - 905743237 - ((2 * v217) & 0x9406E8F6));
  v219 = *(_DWORD *)(v111 + 4 * BYTE2(v200));
  v220 = *(_DWORD *)(v108 + 4 * BYTE1(v206));
  HIDWORD(v190) = v220 ^ 0x7763;
  LODWORD(v190) = v220 ^ 0x55D90000;
  v221 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v204) ^ 0x7C)) ^ (16 * (v219 ^ 0xB4C82AC9)
                                                                         + 1452181747
                                                                         - ((32 * (v219 ^ 0xB4C82AC9)) & 0xAD1D11E0));
  v222 = *(_DWORD *)(v118 + 4 * (v192 ^ 0xF9u)) ^ v219 ^ (v221 - 905743237 - ((2 * v221) & 0x9406E8F6));
  v223 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v218 ^ 0xDE69) >> 8));
  HIDWORD(v190) = v223 ^ 0x7763;
  LODWORD(v190) = v223 ^ 0x55D90000;
  v224 = *(_DWORD *)(v111 + 4 * (BYTE2(v222) ^ 0x4Fu));
  v212 -= 1168731484;
  v225 = (v190 >> 16) ^ (16 * (v224 ^ 0xB4C82AC9) + 1452181747 - ((32 * (v224 ^ 0xB4C82AC9)) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v212) ^ 0xD3));
  v226 = *(_DWORD *)(v118 + 4 * (v214 ^ 0x1Au)) ^ v224 ^ (v225 - 905743237 - ((2 * v225) & 0x9406E8F6));
  v227 = *(_DWORD *)(v108 + 4 * (BYTE1(v222) ^ 0x15u));
  HIDWORD(v190) = v227 ^ 0x7763;
  LODWORD(v190) = v227 ^ 0x55D90000;
  v228 = *(_DWORD *)(v111 + 4 * (BYTE2(v212) ^ 0x3Cu)) ^ 0xB4C82AC9;
  v229 = v228 ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v214) ^ 0x69)) ^ *(_DWORD *)(v118
                                                                            + 4 * (v218 ^ 0x69u)) ^ ((v190 >> 16) - 905743237 - ((2 * (v190 >> 16)) & 0x9406E8F6)) ^ (16 * v228 + 1452181747 - ((32 * v228) & 0xAD1D11E0));
  v230 = *(_DWORD *)(v111 + 4 * (BYTE2(v214) ^ 0x32u)) ^ 0xB4C82AC9;
  v231 = *(_DWORD *)(v108 + 4 * (BYTE1(v212) ^ 0xF9u));
  HIDWORD(v190) = v231 ^ 0x7763;
  LODWORD(v190) = v231 ^ 0x55D90000;
  v232 = (16 * v230 + 1452181747 - ((32 * v230) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v218 ^ 0x5FEEDE69) >> 24)) ^ (v190 >> 16);
  v233 = *(_DWORD *)(v118
                   + 4
                   * ((((v222 ^ 0x86) + (v222 ^ 0xFFFFFF4A) + 1) ^ 0xFFFFFFFE)
                    + (v222 ^ 0x86))) ^ v230 ^ (v232 - 905743237 - ((2 * v232) & 0x9406E8F6));
  v234 = *(_DWORD *)(v111 + 4 * (BYTE2(v218) ^ 0x2Du)) ^ 0xB4C82AC9;
  v235 = *(_DWORD *)(v108 + 4 * (BYTE1(v214) ^ 0xF5u));
  HIDWORD(v190) = v235 ^ 0x7763;
  LODWORD(v190) = v235 ^ 0x55D90000;
  v236 = (v190 >> 16) ^ (16 * v234 + 1452181747 - ((32 * v234) & 0xAD1D11E0)) ^ *(_DWORD *)(v113
                                                                                          + 4
                                                                                          * ((HIBYTE(v222) ^ 0xA1) & 0x90 ^ 0x86u ^ (~(2 * (HIBYTE(v222) ^ 0xA1 | 0x90)) + (HIBYTE(v222) ^ 0xA1 | 0x90))));
  v237 = *(_DWORD *)(v118 + 4 * ~(_BYTE)v212) ^ v234 ^ (v236 - 905743236 + ~((2 * v236) & 0x9406E8F6));
  v238 = *(_DWORD *)(v111 + 4 * ((v237 ^ 0x59A5F4B7) >> 16)) ^ 0xB4C82AC9;
  v239 = *(_DWORD *)(v108 + 4 * ((unsigned __int16)(v233 ^ 0x872B) >> 8));
  HIDWORD(v190) = v239 ^ 0x7763;
  LODWORD(v190) = v239 ^ 0x55D90000;
  v240 = (16 * v238 + 1452181747 - ((32 * v238) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v226) ^ 0x66)) ^ (v190 >> 16);
  v241 = *(_DWORD *)(v118 + 4 * (v229 ^ 0xEEu)) ^ v238 ^ (v240 - 905743237 - ((2 * v240) & 0x9406E8F6));
  v242 = *(_DWORD *)(v111 + 4 * (BYTE2(v226) ^ 0xEDu)) ^ 0xB4C82AC9;
  v243 = *(_DWORD *)(v108 + 4 * (BYTE1(v237) ^ 0x67u));
  HIDWORD(v190) = v243 ^ 0x7763;
  LODWORD(v190) = v243 ^ 0x55D90000;
  v244 = v242 ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v229) ^ 0xD6)) ^ *(_DWORD *)(v118
                                                                            + 4 * (v233 ^ 0x18u)) ^ (16 * v242 + 1452181747 - ((32 * v242) & 0xAD1D11E0)) ^ ((v190 >> 16) - 905743237 - ((2 * (v190 >> 16)) & 0x9406E8F6));
  v245 = *(_DWORD *)(v111 + 4 * (BYTE2(v229) ^ 0x56u)) ^ 0xB4C82AC9;
  v246 = *(_DWORD *)(v108 + 4 * (BYTE1(v226) ^ 0x91u));
  HIDWORD(v190) = v246 ^ 0x7763;
  LODWORD(v190) = v246 ^ 0x55D90000;
  v247 = *(_DWORD *)(v113 + 4 * ((v233 ^ 0x911B872B) >> 24)) ^ v245 ^ 0x6D41727E ^ (16 * v245
                                                                                    + 1452181747
                                                                                    - ((32 * v245) & 0xAD1D11E0)) ^ (v190 >> 16);
  v248 = *(_DWORD *)(v111 + 4 * (BYTE2(v233) ^ 0xD8u)) ^ 0xB4C82AC9;
  v249 = *(_DWORD *)(v108 + 4 * (BYTE1(v229) ^ 0xE4u));
  HIDWORD(v190) = v249 ^ 0x7763;
  LODWORD(v190) = v249 ^ 0x55D90000;
  v250 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v237) ^ 0xB0)) ^ (16 * v248
                                                                         + 1452181747
                                                                         - ((32 * v248) & 0xAD1D11E0));
  v251 = *(_DWORD *)(v118 + 4 * (v226 ^ 0x6Fu)) ^ v248 ^ (v250 - 905743237 - ((2 * v250) & 0x9406E8F6));
  v252 = *(_DWORD *)(v108
                   + 4
                   * (((unsigned __int16)(*(_WORD *)(v118 + 4 * (v226 ^ 0x6Fu)) ^ v248 ^ (v250 + 29819 - ((2 * v250) & 0xE8F6))) >> 8) ^ 0x66u));
  HIDWORD(v190) = v252 ^ 0x7763;
  LODWORD(v190) = v252 ^ 0x55D90000;
  v253 = v190 >> 16;
  HIDWORD(v190) = *(_DWORD *)(v118 + 4 * (v237 ^ 0xB7u)) ^ 0xD68BD0C1;
  LODWORD(v190) = HIDWORD(v190);
  v254 = v244 ^ 0x177CD9D9;
  v255 = *(_DWORD *)(v111 + 4 * (BYTE2(v241) ^ 0x74u)) ^ 0xB4C82AC9;
  v256 = *(_DWORD *)(v113 + 4 * ((v244 ^ 0x177CD9D9u) >> 24)) ^ 0x6D41727E ^ v255 ^ (16 * v255
                                                                                     + 1452181747
                                                                                     - ((32 * v255) & 0xAD1D11E0)) ^ v253;
  v257 = (v256 & 0x200 ^ 0xE7FEFFBE) + 2 * (v256 & 0x200);
  LODWORD(v190) = (v190 >> 21) ^ __ROR4__(v247, 21) ^ 0x549BF9D9;
  HIDWORD(v190) = v190;
  v258 = v190 >> 11;
  v259 = *(_DWORD *)(v118 + 4 * ((v190 >> 11) ^ 0xEFu));
  v260 = ((v257 + 402718786) & (v259 ^ 0xCA03747B)) == 0;
  v261 = *(_DWORD *)(v111 + 4 * (BYTE2(v251) ^ 0x72u)) ^ 0xB4C82AC9;
  v262 = *(_DWORD *)(v108 + 4 * (BYTE1(v258) ^ 0xA0u));
  HIDWORD(v190) = v262 ^ 0x7763;
  LODWORD(v190) = v262 ^ 0x55D90000;
  v263 = (v190 >> 16) ^ *(_DWORD *)(v113 + 4 * ((v241 ^ 0xD4B73D47) >> 24)) ^ (16 * v261
                                                                               + 1452181747
                                                                               - ((32 * v261) & 0xAD1D11E0));
  v264 = *(_DWORD *)(v118 + 4 * (v244 ^ 0xEAu)) ^ v261 ^ (v263 - 905743237 - ((2 * v263) & 0x9406E8F6));
  v265 = v257 + 1003347924;
  v266 = 197910352 - v257;
  if (v260)
    v266 = v265;
  v267 = ((v259 ^ 0xD68BD0C1) - 600629138 + v266) ^ v256 & 0xFFFFFDFF;
  v268 = *(_DWORD *)(v111 + 4 * BYTE2(v254)) ^ 0xB4C82AC9;
  v269 = *(_DWORD *)(v108 + 4 * (BYTE1(v241) ^ 0xAEu));
  HIDWORD(v270) = v269 ^ 0x7763;
  LODWORD(v270) = v269 ^ 0x55D90000;
  v271 = (16 * v268 + 1452181747 - ((32 * v268) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * ((v258 ^ 0x1EA133EFu) >> 24));
  v272 = *(_DWORD *)(v118 + 4 * (v251 ^ 0xDu)) ^ v268 ^ (v270 >> 16) ^ (v271
                                                                                         - 905743237
                                                                                         - 2
                                                                                         * (v271 & 0x4A03747F ^ *(_DWORD *)(v113 + 4 * ((v258 ^ 0x1EA133EFu) >> 24)) & 4));
  v273 = *(_DWORD *)(v111 + 4 * (BYTE2(v258) ^ 0x62u)) ^ 0xB4C82AC9;
  v274 = *(_DWORD *)(v108 + 4 * BYTE1(v254));
  HIDWORD(v270) = v274 ^ 0x7763;
  LODWORD(v270) = v274 ^ 0x55D90000;
  v275 = (16 * v273 + 1452181747 - ((32 * v273) & 0xAD1D11E0)) ^ *(_DWORD *)(v113 + 4 * (HIBYTE(v251) ^ 0x32)) ^ (v270 >> 16);
  v276 = *(_DWORD *)(v118 + 4 * (v241 ^ 0x74u)) ^ v273 ^ (v275 - 905743237 - ((2 * v275) & 0x9406E8F6));
  v277 = (char *)*(&off_1E709D0C0 + v63 - 726) - 4;
  v278 = (char *)*(&off_1E709D0C0 + v63 - 686) - 12;
  v279 = (char *)*(&off_1E709D0C0 + v63 - 677) - 12;
  v280 = *(_DWORD *)&v278[4 * (BYTE2(v264) ^ 0x99)] ^ 0x858E78B5;
  v281 = v280 ^ (*(_DWORD *)&v277[4 * (((v267 ^ 0xF137909F) >> 24) ^ 0xB4)]
               + (((v267 ^ 0xF137909F) >> 24) ^ 0x9FD52929)
               - 1891546004) ^ (v280 >> 2) ^ *(_DWORD *)&v279[4 * (v272 ^ 0x79)] ^ (v280 >> 4);
  v282 = (char *)*(&off_1E709D0C0 + (v63 ^ 0x32D)) - 8;
  v283 = *(_DWORD *)&v282[4 * ((unsigned __int16)(v276 ^ 0x7C9C) >> 8)] ^ 0x44850E66;
  v284 = ((v272 ^ 0x7B)
        - 162178079
        + ((2 * (((v272 ^ 0x7B) + 112) & 0x17E ^ (v272 ^ 0xBC37B | 0x7FFFFFF1))) ^ 0xF0C3001D)) ^ v283 ^ (1515496080 * v283);
  v285 = HIBYTE(v272);
  v286 = v264 ^ 0x6792B6A6;
  v287 = *(_DWORD *)&v277[4 * (((v264 ^ 0x6792B6A6) >> 24) ^ 0xB4)];
  LODWORD(v335) = *(_DWORD *)&v277[4 * (HIBYTE(v272) ^ 0xB4)];
  LODWORD(v340) = (v276 ^ 0x250E7C9C) >> 24;
  HIDWORD(v337) = *(_DWORD *)&v277[4 * (v340 ^ 0xB4)];
  v288 = *(_DWORD *)&v278[4 * (BYTE2(v276) ^ 5)];
  v289 = *(_DWORD *)&v278[4 * ((v267 ^ 0xF137909F) >> 16)];
  HIDWORD(v335) = *(_DWORD *)&v278[4 * ((v272 ^ 0xBC37B) >> 16)];
  v290 = *(_DWORD *)&v282[4 * ((unsigned __int16)(v272 ^ 0xC37B) >> 8)];
  HIDWORD(v334) = *(_DWORD *)&v282[4 * ((unsigned __int16)(v264 ^ 0xB6A6) >> 8)];
  v291 = *(_DWORD *)&v282[4 * (BYTE1(v267) ^ 0x5E)];
  v292 = *(_DWORD *)&v279[4 * (v267 ^ 0x9D)];
  v293 = *(_DWORD *)&v279[4 * (v276 ^ 0x9E)];
  LODWORD(v337) = *(_DWORD *)&v279[4 * (v264 ^ 0xA4)];
  v294 = ((v281 ^ v284) - 1180827501 - ((2 * (v281 ^ v284)) & 0x733C0126)) ^ LODWORD(STACK[0x300]);
  v295 = (uint64_t)*(&off_1E709D0C0 + v63 - 849);
  v322[5] = *(_BYTE *)(v295 + (((v294 ^ 0x5244C6B3) >> 16) ^ 0x5ELL)) ^ ((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A ^ ((((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A) - ((2 * (((v294 ^ 0x5244C6B3) >> 16) ^ 0x8A) - 18) & 0xF7) - 14) ^ 0xB9;
  v296 = v288 ^ 0x858E78B5 ^ ((HIBYTE(v286) ^ 0x9FD52929) - 1891546004 + v287) ^ ((v288 ^ 0x858E78B5) >> 2) ^ ((v288 ^ 0x858E78B5) >> 4) ^ v290 ^ 0x44850E66 ^ v292 ^ (1515496080 * (v290 ^ 0x44850E66)) ^ ((v267 ^ 0x9F) - 162178079 + ((2 * (((v267 ^ 0x9F) + 112) & 0x17E ^ (v267 ^ 0xF137909F | 0x7FFFFFF1))) ^ 0xF0C3001D));
  v297 = (v296 + 696531065 - ((2 * v296) & 0x53087184) + 73) ^ LODWORD(STACK[0x3D8]);
  v298 = v297 ^ 0x22A932A6;
  v299 = (BYTE1(v298) | 0x88) ^ (v298 >> 8) & 0x88;
  v300 = (char *)*(&off_1E709D0C0 + (v63 ^ 0x3E4)) - 12;
  v322[2] = (((unsigned __int16)(v297 ^ 0x32A6) >> 8) | 0x88) ^ ((unsigned __int16)(v297 ^ 0x32A6) >> 8) & 0x88 ^ 0x35 ^ ((v300[v299 ^ 0x14] ^ 3) - ((2 * v300[v299 ^ 0x14]) & 0x20) - 112);
  v301 = (char *)*(&off_1E709D0C0 + v63 - 844) - 4;
  LODWORD(v299) = v301[HIBYTE(v294) ^ 0xEFLL];
  HIDWORD(v270) = v299 ^ 0x1B;
  LODWORD(v270) = (v299 ^ 0x40) << 24;
  v322[STACK[0x320]] = (v270 >> 29) ^ 0x83;
  v302 = v289 ^ 0x858E78B5 ^ ((v285 ^ 0x9FD52929) - 1891546004 + v335) ^ ((v289 ^ 0x858E78B5) >> 2) ^ ((v289 ^ 0x858E78B5) >> 4);
  v303 = v302 & 0x1000000 | 0x287B5FB3;
  if ((v302 & 0x1000000 & ~v293) != 0)
    v303 = 1358348134 - v303;
  v304 = v302 & 0xFEFFFFFF ^ (1515496080 * (HIDWORD(v334) ^ 0x44850E66)) ^ ((((v276 ^ 0x9C)
                                                                            - 162178079
                                                                            + ((2
                                                                              * (((v276 ^ 0x9C) + 112) & 0xFFFFFF7F ^ (v276 ^ 0x250E7C9C | 0x7FFFFFF0))) ^ 0xF0C3001F)) ^ v293)
                                                                          - 679174067
                                                                          + v303);
  v305 = HIDWORD(v334) ^ 0x44850E66 ^ LODWORD(STACK[0x408]) ^ (v304 + 416382103 - ((2 * v304) & 0x31A2F9A2) + 58);
  v306 = (char *)*(&off_1E709D0C0 + (v63 ^ 0x3D4)) - 4;
  LOBYTE(v304) = v306[BYTE4(v334) ^ 0x66u ^ LOBYTE(STACK[0x408]) ^ (v304
                                                                                   - 105
                                                                                   - ((2 * v304) & 0xA2)
                                                                                   + 58) ^ 0x28];
  v322[11] = v304 & 0xFB ^ ((v304 | 0xFB) + 24) ^ 0x38;
  v307 = v301[BYTE3(v297) ^ 0xF9];
  HIDWORD(v308) = v307 ^ 0x1B;
  LODWORD(v308) = (v307 ^ 0x40) << 24;
  v309 = STACK[0x2D0];
  v322[STACK[0x2D0]] = (v308 >> 29) ^ 0xFB;
  v322[STACK[0x228]] = BYTE2(v298) ^ 0x61 ^ ((BYTE2(v298) ^ 0x61) + ((16 - 2 * (BYTE2(v298) ^ 0x61)) | 9) - 13) ^ 0xB8 ^ *(_BYTE *)(v295 + (BYTE2(v298) ^ 0xB5));
  v310 = (v340 ^ 0x9FD52929) - 1891546004 + HIDWORD(v337);
  v311 = HIDWORD(v335) ^ 0x858E78B5 ^ ((HIDWORD(v335) ^ 0x858E78B5) >> 4) ^ ((HIDWORD(v335) ^ 0x858E78B5) >> 2);
  v312 = (v311 & 0x80000 ^ 0xBF5FFADD) + 2 * (v311 & 0x80000);
  v260 = ((v312 + 1084228899) & v310) == 0;
  v313 = v312 + 1929342327;
  v314 = -239115471 - v312;
  if (v260)
    v314 = v313;
  v315 = v337 ^ (v286 + 2096205936) ^ (((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF ^ (1515496080 * (v291 ^ 0x44850E66)))
                                                      + 2036583281
                                                      + ~(2
                                                        * (((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF ^ (1515496080 * (v291 ^ 0x44850E66))) & 0x7963CB7A ^ ((v310 - 845113428 + v314) ^ v311 & 0xFFF7FFFF) & 0xA)));
  v316 = v291 ^ LODWORD(STACK[0x428]) ^ (v315 + 1570908894 - ((2 * v315) & 0xBB4455BC));
  v322[STACK[0x298]] = *(_BYTE *)(v295 + (BYTE2(v316) ^ 0x1E) + ((v316 >> 15) & 0x1A8 ^ 0xFFFFFFD7) + 213) ^ BYTE2(v316) ^ ((BYTE2(v316) ^ 0x1E) + ((16 - 2 * (BYTE2(v316) ^ 0x1E)) | 9) - 13) ^ 0x98;
  v317 = v301[HIBYTE(v316) ^ 0xBELL];
  HIDWORD(v318) = v317 ^ 0x1B;
  LODWORD(v318) = (v317 ^ 0x40) << 24;
  v322[STACK[0x328]] = (v318 >> 29) ^ 0x50;
  v322[STACK[0x290]] = ((v305 ^ 0xCFDDD967) >> 16) ^ 0x94 ^ ((((v305 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                         + ((16
                                                                           - 2
                                                                           * (((v305 ^ 0xCFDDD967) >> 16) ^ 0x94)) | 9)
                                                                         - 13) ^ *(_BYTE *)(v295
                                                                                          + (((v305 ^ 0xCFDDD967) >> 16) ^ 0x40)) ^ 0xC;
  v319 = (((v316 ^ 0x1BB09C49) >> 4) & 0xF0 | ((unsigned __int16)(v316 ^ 0x9C49) >> 12)) ^ 0xE6;
  v322[STACK[0x420]] = v300[((v319 >> 4) & 0xFFFFFF0F | (16 * (v319 & 0xF))) ^ 0xAELL] ^ (((v319 >> 4) & 0xF | (16 * (v319 & 0xF)))
                                                                                        - ((v319 >> 3) & 6)
                                                                                        + 3) ^ 0x2B;
  v322[STACK[0x258]] = (((unsigned __int16)(v305 ^ 0xD967) >> 8) - (((v305 ^ 0xCFDDD967) >> 7) & 6) + 3) ^ 0xDB ^ v300[((unsigned __int16)(v305 ^ 0xD967) >> 8) ^ 0xA0];
  v322[STACK[0x418]] = (((unsigned __int16)(v294 ^ 0xC6B3) >> 8) - (((v294 ^ 0x5244C6B3) >> 7) & 6) + 3) ^ v300[((unsigned __int16)(v294 ^ 0xC6B3) >> 8) ^ 0x75] ^ 0x80;
  v322[STACK[0x3D0]] = v306[v297 ^ 0x95] ^ 0x86;
  v322[STACK[0x3C0]] = v306[v294 ^ 0x7FLL] ^ 0x17;
  v322[STACK[0x460]] = v306[v316 ^ 0xE6] ^ 0xB8;
  v320 = v301[BYTE3(v305) ^ 0x49];
  HIDWORD(v318) = v320 ^ 0x1B;
  LODWORD(v318) = (v320 ^ 0x40) << 24;
  v322[STACK[0x400]] = (v318 >> 29) ^ 0x2E;
  HIDWORD(a13) = v63 ^ 0x619;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, unint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 + 8 * ((56 * ((((_DWORD)v309 - 699207985 - ((2 * (_DWORD)v309 + 32) & 0xACA5DD9E) + 16) ^ 0xD652EEC0) < 0x150)) | v63)) - 8))(9, v305, v297, 230, v306, v309, v300, 1149570662, a5, a6, a7, a8, a9, a10, a11, a12, a13, v322, v323,
           v324,
           v325,
           v326,
           v327,
           a20,
           v328,
           v329,
           v330,
           v331,
           v332,
           v333,
           v334,
           v335,
           v337,
           v340,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           2,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

void sub_1B97EC888(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,unsigned __int8 a25,int a26,int a27,unsigned __int8 a28,int a29,unsigned __int8 a30,int a31,int a32,int a33,unsigned __int8 a34,int a35,int a36,int a37,char a38)
{
  LODWORD(STACK[0x3D8]) = (a25 | ((((a37 ^ 0x54A) - 122) ^ a32) << 24) | ((a28 ^ 0xEF) << 8) | ((a34 ^ 0x92) << 16)) ^ 0xB104EBA2;
  LODWORD(STACK[0x300]) = a31 ^ 0xBE1F7410;
  LODWORD(STACK[0x408]) = ((a33 << 8) | (a27 << 24) | ((a35 ^ 0x77) << 16) | a29) ^ 0x310F566E;
  LODWORD(STACK[0x428]) = ((((a36 ^ 0xBC) << 16) + ((a26 ^ 0x1A) << 24)) | a30 | ((a38 ^ a4) << 8)) ^ 0x4E33834F;
  JUMPOUT(0x1B97EA970);
}

uint64_t sub_1B97EC974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  unint64_t v19;

  v19 = STACK[0x550];
  STACK[0x668] -= 32;
  *(_BYTE *)(v19 + 335) = *(_BYTE *)(a14 + 335) ^ 0xCD ^ *((_BYTE *)*(&off_1E709D0C0 + (a18 ^ 0x526)) + 3) ^ *((_BYTE *)*(&off_1E709D0C0 + (a18 ^ 0x586)) + 13) ^ *((_BYTE *)*(&off_1E709D0C0 + a18 - 1220) + (((a18 - 1437) | 0x441u) ^ 0x440) + 11) ^ 0x32;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * a18) - 4))();
}

void sub_1B97ECA4C()
{
  JUMPOUT(0x1B97EC9BCLL);
}

uint64_t sub_1B97ECA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  int v8;
  uint64_t v9;

  STACK[0x3B0] = a8;
  *(_QWORD *)(a2 + 304) -= 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((7 * (v8 ^ 0x4F0)) ^ v8 ^ 0x786))
                            - (v8 + 162)
                            + 1245))();
}

uint64_t sub_1B97ECA9C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;

  v10 = *(_BYTE **)(v9 + 344);
  a8[12] = ((-93 * (a1 ^ 0xE6)) ^ 0xE9) + 50;
  a8[13] = 50;
  a8[14] = 50;
  a8[15] = 51;
  v10[16] ^= *a8 ^ 0x32;
  v10[17] ^= a8[1] ^ 0x32;
  v10[18] ^= a8[2] ^ 0x32;
  v10[19] ^= a8[3] ^ 0x32;
  v10[20] ^= a8[4] ^ 0x32;
  v10[21] ^= a8[5] ^ 0x32;
  v10[22] ^= a8[6] ^ 0x32;
  v10[23] ^= a8[7] ^ 0x32;
  v10[24] ^= a8[8] ^ 0x32;
  v10[25] ^= a8[9] ^ 0x32;
  v10[26] ^= a8[10] ^ 0x32;
  v10[27] ^= a8[11] ^ 0x32;
  v10[28] ^= a8[12] ^ 0x32;
  v10[29] ^= a8[13] ^ 0x32;
  v10[30] ^= a8[14] ^ 0x32;
  v10[31] ^= a8[15] ^ 0x32;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * (a1 - 395)) - 4))(1254, 50);
}

void sub_1B97ECCA8()
{
  JUMPOUT(0x1B97ECAD4);
}

uint64_t sub_1B97ECCB0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((60 * (LODWORD(STACK[0x46C]) != ((v4 - 225) | 0x451) + 1206751714)) ^ ((v4 - 225) | 0x451)))
                            - ((((v4 - 225) | 0x451u) - 895) ^ a4)))();
}

uint64_t sub_1B97ECD30@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((51 * (*(_BYTE *)(v2 + (a1 + 1252)) == 50)) ^ v1))
                            - ((v1 ^ 0x483u)
                             - 278)
                            + 1083))();
}

uint64_t sub_1B97ECD78(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((60 * (v5 != v4 + 1206751714)) ^ v4))
                            - ((v4 - 895) ^ a4)))();
}

uint64_t sub_1B97ECDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;
  int v40;
  unint64_t v41;

  LODWORD(STACK[0x46C]) = 1206753083;
  v41 = STACK[0x648];
  STACK[0x4C0] = 335;
  *(_BYTE *)(v41 + 335) = (a39 ^ 0xBA) * (a39 + 17);
  return (*(uint64_t (**)(void))(v39
                              + 8
                              * (int)(((STACK[0x4C0] == 0) * (((v40 + 1002725785) & 0xC43B9DD9) - 1065)) ^ (v40 + 1002725785) & 0xC43B9DD9)))();
}

void sub_1B97ED0FC()
{
  JUMPOUT(0x1B97ED0C4);
}

uint64_t sub_1B97ED104@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  v3 = a1 - 430;
  v4 = a1 + 141;
  v5 = ((uint64_t (*)(void))STACK[0x310])();
  LODWORD(STACK[0x688]) = v1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (((v1 == v4 + 1645152532) * (v3 - 581)) ^ v3)) - 8))(v5);
}

uint64_t sub_1B97ED148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v7 = LODWORD(STACK[0x468]);
  v8 = STACK[0x3C8];
  v9 = STACK[0x2C8];
  v10 = STACK[0x448];
  v11 = *(_QWORD *)(v6 + 8 * (v5 - 1210));
  STACK[0x428] = STACK[0x2C8] + 2353;
  STACK[0x420] = v10 + 49;
  STACK[0x418] = v9 + 2333;
  STACK[0x410] = v10 + 29;
  STACK[0x408] = v9 + 2313;
  STACK[0x400] = v10 + 9;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v11 - 8))(a1, a2, v7, 2649773600, a5, v8);
}

void sub_1B97EDB24()
{
  int v0;

  LODWORD(STACK[0x680]) = v0;
  JUMPOUT(0x1B97EDAA4);
}

uint64_t sub_1B97EDB50(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  STACK[0x460] = v3;
  v7 = STACK[0x49C];
  *(_DWORD *)(*(_QWORD *)(v6 + 448) + ((a3 - 1133293923 + v7 - 1188) & 0xFFFFFFFC)) = v4;
  LODWORD(STACK[0x49C]) = v7 + 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((99
                                          * ((((v7 - 1133293854) < 0x40) ^ (a3 - 66)) & 1)) ^ (a3 - 65)))
                            - 8))();
}

uint64_t sub_1B97EF248@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;

  v9 = v5 + v3;
  v10 = *(_DWORD *)(a1 + 4 * (v9 - 8)) ^ *(_DWORD *)(a1 + 4 * (v9 - 3));
  v11 = *(_DWORD *)(a1 + 4 * (v9 - 16)) ^ *(_DWORD *)(a1 + 4 * (v9 - 14)) ^ (v10 + v8 - (v6 & (2 * v10)));
  HIDWORD(v12) = (v1 - 335) ^ (v8 + 136) ^ v11;
  LODWORD(v12) = v11;
  *(_DWORD *)(a1 + 4 * (v2 + v5)) = (v12 >> 31) + v8 - (v6 & (2 * (v12 >> 31)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((v2 + 1 + v5) > 0x4F) * v4) ^ v1)) - 8))();
}

uint64_t sub_1B97EF2D4()
{
  int v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

void sub_1B97EF3D0()
{
  JUMPOUT(0x1B97EF2FCLL);
}

uint64_t sub_1B97EF3E8(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((121 * ((a2 + 1 + v4) > 0x27)) ^ v2)) - 8))();
}

uint64_t sub_1B97EF4AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5 + 8 * ((((a3 + 1 + v7) > 0x3B) * v6) ^ v4))
                                          - 8))(a4);
}

uint64_t sub_1B97EF580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;
  int v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((241 * ((a6 + 1 + v8) > 0x4F)) ^ v6)) - 4))();
}

void sub_1B97EF644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;

  LODWORD(STACK[0x57C]) = v8;
  LODWORD(STACK[0x498]) = v12;
  LODWORD(STACK[0x544]) = v9;
  LODWORD(STACK[0x614]) = v11;
  LODWORD(STACK[0x5C8]) = v10;
  v17 = *(_QWORD *)(v16 + 432);
  v18 = *(_DWORD *)(v17 - 0x5C6940C6B1BC6FE2);
  LODWORD(STACK[0x49C]) = v15 + 80;
  v19 = ((v13 - 452) ^ (v14 - 997) ^ v18) + (v10 ^ v14);
  *(_DWORD *)(v17 - 0x5C6940C6B1BC6FE2) = v19 + v14 - (a8 & (2 * v19));
  JUMPOUT(0x1B97EF6C8);
}

uint64_t sub_1B97EF7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  uint64_t v65;
  unint64_t v66;
  int v67;
  uint64_t v69;

  v66 = STACK[0x488];
  v67 = *(unsigned __int8 *)(STACK[0x488] - 0x5C6940C6B1BC6FDALL) ^ 0x5F;
  if (v67 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v65
                                                                 + 8
                                                                 * ((562
                                                                   * (((a55 ^ (*(_DWORD *)(v66 - 0x5C6940C6B1BC6FDELL) == 369984849)) & 1) == 0)) ^ ((int)a3 + 74)))
                                                     - 8))(a1, 25);
  if (v67 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 + 8 * ((111 * (*(_DWORD *)(v66 - 0x5C6940C6B1BC6FDELL) != (((LODWORD(STACK[0x468]) - 469) | 0xA0) ^ 0x160D86E1))) ^ (LODWORD(STACK[0x468]) + 74))) - 8))(a1, 25, a3, a4, 1099626267, 1695, 26919485, 858949875);
  v69 = LODWORD(STACK[0x468]);
  STACK[0x480] = 91;
  *(_BYTE *)(v66 - 0x5C6940C6B1BC6FDFLL) = (a65 + 7 * ((a3 - 71) ^ 0x2D)) * ((a65 - 44) ^ 0xBA);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v65
                                                               + 8 * ((932 * (STACK[0x480] == 0)) ^ ((int)a3 - 839)))
                                                   - 12))(v69, 25);
}

void sub_1B97F017C()
{
  JUMPOUT(0x1B97F0134);
}

uint64_t sub_1B97F0184()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_1B97F01B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;

  *(_DWORD *)(a6 + 52) = (((((v8 + a3 - 1089 - 164) ^ v6) + (LODWORD(STACK[0x684]) ^ v8)) % 0x2710) ^ 0xEFFFDBB9)
                       + 1006630752
                       + ((2 * ((((v8 + a3 - 1089 - 164) ^ v6) + (LODWORD(STACK[0x684]) ^ v8)) % 0x2710)) & 0x3772);
  v9 = STACK[0x68C];
  LODWORD(STACK[0x4AC]) = STACK[0x68C];
  return (*(uint64_t (**)(void))(v7 + 8 * ((1169 * (v9 == v8)) ^ (a3 - 1089))))();
}

void sub_1B97F0240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  *a6 = STACK[0x52C];
  a6[85] = STACK[0x4E4];
  a6[86] = STACK[0x61C];
  a6[87] = STACK[0x60C];
  a6[88] = STACK[0x4EC];
  JUMPOUT(0x1B97E9950);
}

void sub_1B97F0270(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 304) -= 1616;
  LODWORD(STACK[0x4AC]) = a4 + 174;
  JUMPOUT(0x1B97E9950);
}

void sub_1B97F028C()
{
  JUMPOUT(0x1B97E9950);
}

void sub_1B97F0294()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 36) = v0 | 4;
}

uint64_t sub_1B97F029C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v4;
  uint64_t v5;
  int v6;

  STACK[0x3B0] = v4;
  LODWORD(STACK[0x618]) = a4 - 10;
  return (*(uint64_t (**)(void))(v5
                              + 8 * ((1443 * (((STACK[0x3B0] == 0) ^ (v6 - 84)) & 1)) ^ (v6 - 596))))();
}

uint64_t sub_1B97F0430()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((v0 - 521138063 + ((v2 + 1098251017) & 0xBE8A07F7) - 1253 >= (v2 ^ 0x344u) - 670) ^ v2)))();
}

uint64_t sub_1B97F047C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;

  LODWORD(STACK[0x618]) = v1 - 10;
  v4 = STACK[0x530];
  v5 = LODWORD(STACK[0x5F4]);
  STACK[0x508] = v5;
  return ((uint64_t (*)(uint64_t, unint64_t))(*(_QWORD *)(v2
                                                                        + 8
                                                                        * ((1625
                                                                          * ((_DWORD)v5 != ((v3 - 35477226) & 0x21D537C ^ 0x178))) ^ (v3 - 711)))
                                                            - ((v3 - 1045827046) & 0x3E5609CB)
                                                            + 199))(a1, v4);
}

void sub_1B97F048C()
{
  JUMPOUT(0x1B97F0494);
}

void sub_1B97F04C8(uint64_t a1@<X1>, int a2@<W8>)
{
  void (*v2)(_QWORD, uint64_t, _QWORD);
  uint64_t v3;
  int v4;

  v4 = a2 ^ 0x674;
  v2(*(unsigned int *)STACK[0x318], a1, LODWORD(STACK[0x334]) - 1862247496 + (a2 ^ 0x674u) - 1253);
  *(_DWORD *)(v3 - 200) = (v4 + 426521764) ^ (535753261
                                            * ((1828448706 - ((v3 - 200) | 0x6CFBE9C2) + ((v3 - 200) | 0x9304163D)) ^ 0x99F01812));
  sub_1B98179A8((_DWORD *)(v3 - 200));
  JUMPOUT(0x1B97F0558);
}

uint64_t sub_1B97F059C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;

  v49 = STACK[0x530];
  v50 = LODWORD(STACK[0x5F4]) ^ ((v47 ^ 0x26B) - 1099358560);
  v51 = (2 * LODWORD(STACK[0x5F4])) & 0x7CF23ED6;
  v52 = 235795823 * ((((2 * (v48 - 200)) | 0x7ACDC568) - (v48 - 200) - 1030152884) ^ 0xA9CBABED);
  v53 = v48 - 200;
  *(_QWORD *)(v53 + 8) = v44;
  *(_QWORD *)(v53 + 16) = a42;
  *(_QWORD *)(v53 + 32) = v45;
  *(_DWORD *)(v48 - 136) = v52 + v50 + v51 + 1307043736;
  *(_BYTE *)(v53 + 24) = 111 * ((((2 * (v48 + 56)) | 0x68) - (v48 + 56) + 76) ^ 0xED) - 30;
  *(_QWORD *)(v53 + 56) = v49;
  *(_QWORD *)(v53 + 48) = a43;
  *(_DWORD *)(v48 - 160) = (v47 - 485) ^ v52;
  *(_DWORD *)(v48 - 200) = (v43 + 760079447) ^ v52;
  v54 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E709D0C0 + v47 - 642) - 8))(v48 - 200);
  v55 = *(_DWORD *)(v48 - 132);
  LODWORD(STACK[0x618]) = v55;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v46 + 8 * ((1847 * (v55 == 1645153785)) ^ v47))
                                          - (((v47 + 389) | 0xC0u) ^ 0x4E9)))(v54);
}

uint64_t sub_1B97F06BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  int v38;
  uint64_t v39;
  int v40;

  return ((uint64_t (*)(void))(*(_QWORD *)(v39
                                        + 8
                                        * (int)((((LODWORD(STACK[0x590]) ^ v38) != a38 - 1368499268)
                                               * (((v40 + 445943596) & 0xE56B74ED) - 678)) ^ v40))
                            - 4))();
}

uint64_t sub_1B97F0710@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  LODWORD(STACK[0x618]) = v1 + 391;
  v5 = LODWORD(STACK[0x618]);
  v6 = 235795823 * (((v3 | 0x68728E509914D92ELL) - (v3 & 0x68728E509914D92ELL)) ^ 0x60C234AE0DB99077);
  v7 = a1 - 976199517 + v6;
  *(_DWORD *)(v4 - 192) = -235795823 * (((v3 | 0x9914D92E) - (v3 & 0x9914D92E)) ^ 0xDB99077);
  *(_DWORD *)(v4 - 188) = v6 ^ (a1 - 976199517) ^ 0x73;
  v8 = (uint64_t *)(v4 - 200);
  v8[2] = v6 ^ 0x9DF05623;
  *v8 = v5 ^ v6;
  *(_DWORD *)(v4 - 176) = a1 - v6 - 1501687097;
  *(_DWORD *)(v4 - 172) = v7 + 106;
  *(_DWORD *)(v4 - 168) = v7;
  v9 = ((uint64_t (*)(uint64_t))STACK[0x3B8])(v4 - 200);
  STACK[0x3B0] = 0;
  v10 = *(uint64_t (**)(uint64_t))(v2 + 8 * *(int *)(v4 - 164));
  LODWORD(STACK[0x334]) = 1862247496;
  return v10(v9);
}

uint64_t sub_1B97F0790@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v5 = ((unint64_t)&STACK[0x508] ^ 0xF3F3F9DFAFEB7F9FLL)
     + 0x5D9F8EE7FE9CD861
     + ((2 * (_QWORD)&STACK[0x508]) & 0xE7E7F3BF5FD6FF30);
  v6 = v2 - 1;
  *(_QWORD *)(v4 + 24) = v6;
  *(_BYTE *)(a1 + v6) = (a2 ^ 0x66 ^ v5 ^ 0xA4) * (v5 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1814 * (*(_QWORD *)(v4 + 24) == 0)) ^ a2)) - 8))();
}

void sub_1B97F0820()
{
  JUMPOUT(0x1B97F07E4);
}

void sub_1B97F0828(uint64_t a1, uint64_t a2)
{
  void (*v2)(_QWORD, uint64_t, _QWORD);

  v2(*(unsigned int *)STACK[0x318], a2, 0);
  JUMPOUT(0x1B97F0868);
}

uint64_t sub_1B97F0938()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t (*v3)(void);

  STACK[0x3B0] = 0;
  v2 = *(_DWORD *)(STACK[0x3C8] + 56);
  *(_DWORD *)(STACK[0x3C8] + 56) = v2 + 1;
  v3 = *(uint64_t (**)(void))(v1 + 8 * ((1804 * ((v0 ^ 0xD381F09D) + v2 < 0xFFFFFFFA)) ^ (v0 - 1129)));
  LODWORD(STACK[0x334]) = 1862247496;
  return v3();
}

void sub_1B97F098C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  v3 = v0 ^ 0x499;
  *(_DWORD *)(v2 - 200) = ((v0 ^ 0x499) + 426522893) ^ (535753261
                                                      * ((v2 + 1931614134 - 2 * ((v2 - 200) & 0x7322187E)) ^ 0x79D61651));
  sub_1B98179A8((_DWORD *)(v2 - 200));
  *(_BYTE *)v1 = (-85 * ((v2 + 56) ^ 0xF6)) ^ 0x2F;
  *(_QWORD *)(v1 + 24) = STACK[0x2B0];
  *(_QWORD *)(v1 + 8) = STACK[0x2A8];
  *(_DWORD *)(v2 - 184) = 3804331 * ((v2 - 200) ^ 0x7ED525F6) + v3 + 1389;
  ((void (*)(uint64_t))STACK[0x2A0])(v2 - 200);
  STACK[0x3B0] = 0;
  LODWORD(STACK[0x334]) = 1862247496;
  JUMPOUT(0x1B97F0498);
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1B97F0A9C@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 208))();
  return 0;
}

uint64_t sub_1B97F0AB0()
{
  return 4294925273;
}

void sub_1B97F0ABC(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = 235795823 * (((a1 | 0x1A7DF74B) - (a1 | 0xE58208B4) - 444462924) ^ 0x8ED0BE12);
  v2 = *(_DWORD *)(a1 + 40) ^ v1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = 1374699841 * ((2 * (&v8 & 0x59A7A858) - &v8 + 643323809) ^ 0x4BAC4FA8);
  v7 = *(_DWORD *)(a1 + 64) - v1 - v6;
  v13 = v6 ^ ((*(_DWORD *)a1 ^ v1) - 757538690);
  v14 = v3;
  v15 = v7 + 1047456190;
  v9 = v6 ^ (v2 + 368399990);
  v8 = v5;
  v12 = v4;
  v10 = v5;
  sub_1B9817668((uint64_t)&v8);
  __asm { BR              X8 }
}

uint64_t sub_1B97F0C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unint64_t *a11, char a12, int a13, uint64_t a14, int a15)
{
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;

  v24 = *(unsigned __int8 *)(v16 + 24) - v17;
  v25 = 1759421093 * (&a10 ^ 0xB37DB054);
  a11 = &STACK[0x17594DE9181849F3];
  a14 = v22;
  a12 = ((v24 ^ 0xFE) + ((v24 << (v23 - 120)) & ((v23 ^ 0xC2) + 127) ^ 2) - 5) ^ (-91 * (&a10 ^ 0x54));
  a13 = v25 + 395618377 + v21;
  a15 = v23 - v25 + 906;
  v26 = ((uint64_t (*)(int *))(*(_QWORD *)(v15 + 8 * (v23 ^ 0x5A)) - 4))(&a10);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * (((a10 != v19) * v18) ^ v23)) - 8))(v26);
}

uint64_t sub_1B97F0D18()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((v2 + 25) | 0x29) ^ 0xAD) * ((v0 - 1281217511) > 0xFFFFFFFD)) ^ (v2 + 366)))
                            - 8))();
}

void sub_1B97F0D5C(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(a1 - 0x384B062F07609540) = v2 - 1;
  *(_DWORD *)(v1 + 68) = 1645153785;
}

void Fc3vhtJDvr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v6;

  if (a4)
    v5 = a5 == 0;
  else
    v5 = 1;
  v6 = !v5;
  __asm { BR              X8 }
}

uint64_t sub_1B97F0F68(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  *a4 = 0;
  *a5 = 0;
  a18 = 108757529 * ((&a17 & 0xA7DA3C6 | ~(&a17 | 0xA7DA3C6)) ^ 0x151E3E12) + 1695027452;
  v21 = sub_1B9816CD4(&a17);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * ((1110 * (a17 == v20)) ^ v18)))(v21);
}

uint64_t sub_1B97F0FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, unsigned int a19, int a20)
{
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v23 = 1759421093 * ((&a17 - 826825291 - 2 * (&a17 & 0xCEB7A5B5)) ^ 0x7DCA15E1);
  HIDWORD(a17) = v23 ^ 0x771B5177;
  a18 = v23 + 1806;
  a20 = v23 ^ 0x18F94B49;
  LODWORD(a17) = v23 ^ 0x7FA6CEE2;
  ((void (*)(unint64_t **))(*(_QWORD *)(v22 + 392) - 12))(&a17);
  a17 = &STACK[0x4BD26FD1213425D9];
  a19 = 1307 - 460628867 * ((((2 * &a17) | 0x9D678C32) - &a17 + 827079143) ^ 0x82254464);
  sub_1B97F2874((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8 * ((11 * (a18 == v21)) ^ 0x296u)))(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10);
}

uint64_t sub_1B97F10F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18, uint64_t a19, unsigned int a20,uint64_t a21)
{
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;

  v26 = 1178560073 * ((((2 * &a17) | 0x572E13FC) - &a17 + 1416164866) ^ 0x1103719C);
  a18 = ((2 * v23) & 0xE6FBE672) + (v23 ^ 0x737DF339) - 587243776 + v26;
  a20 = v26 ^ 0x3E8;
  a19 = a16;
  sub_1B9802920((uint64_t)&a17);
  v27 = 1178560073 * (((~&a17 & 0x8CEF827A) - (~&a17 | 0x8CEF827B)) ^ 0x367BFA19);
  a21 = v21;
  a20 = v27 ^ ((v22 ^ 0x5BFF7F7E) - 1350459988 + ((2 * v22) & 0xB7FEFEFC));
  a19 = a16;
  a18 = v27 + 1289;
  v28 = ((uint64_t (*)(int *))(*(_QWORD *)(v25 + 1024) - 8))(&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((1916 * (a17 == 1645153785)) ^ 0x323u)))(v28);
}

uint64_t sub_1B97F1258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, unsigned int a19, unsigned int a20,unsigned int a21,int a22)
{
  int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  uint64_t v27;

  if (a12 >= 0x608FEDF6)
    v25 = 1010542952;
  else
    v25 = 635686783;
  v26 = 460628867
      * ((((&a17 | 0x2AEB2E12) ^ 0xFFFFFFFE) - (~&a17 | 0xD514D1ED)) ^ 0x99825390);
  a17 = &STACK[0x58A7AA0862456906];
  a18 = a16;
  a19 = v26 - 1703100402;
  a20 = v26 + v23 + 2138962557;
  a21 = v25 - v26;
  v27 = sub_1B98170A4((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * ((22 * (a22 == v22 + v23 - 141 + ((v23 + 367) | 0x160) - 2184)) ^ v23)))(v27);
}

uint64_t sub_1B97F134C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  int v12;
  unsigned int v13;
  uint64_t v14;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v14
                                                     + 8 * (((((v12 + 466728956) & 0x71D) - 699) * (a12 < v13)) ^ v12)))(a1, a2);
}

uint64_t sub_1B97F13E4@<X0>(uint64_t a1@<X8>, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, _BYTE *a6, int a7, char a8, uint64_t a9, uint64_t a10, unsigned int a11, char *a12, _BYTE *a13, uint64_t a14, unsigned int a15)
{
  _BYTE *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void (*v20)(unsigned int *);
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;

  v22 = v15;
  a12 = &a8 + a1;
  a13 = a6;
  a11 = (v18 - 1177) ^ (((2 * (&a11 & 0x7F331FB0) - &a11 - 2134056888) ^ 0xED38F841) * v16);
  v20(&a11);
  a13 = v22;
  a14 = v17;
  a15 = ((v18 ^ 0xFE) - 938) ^ (1225351577 * (&a11 ^ 0x239AD816));
  a12 = a6;
  ((void (*)(unsigned int *))(*(_QWORD *)(v21 + 8 * (v18 ^ 0x5B3u)) - 8))(&a11);
  a12 = a3;
  a13 = a6;
  a11 = ((v18 ^ 0xFE) - 947) ^ (1374699841
                              * ((-1001333016 - (&a11 | 0xC450DEE8) + (&a11 | 0x3BAF2117)) ^ 0x565B391E));
  v20(&a11);
  a11 = ((v18 ^ 0xFE) - 446) ^ (1755732067
                              * ((((&a11 | 0x3445A058) ^ 0xFFFFFFFE) - (~&a11 | 0xCBBA5FA7)) ^ 0x157CE27C));
  a12 = a6;
  v23 = sub_1B9812F54((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * ((27
                                                        * ((_DWORD)a13 != (((v18 ^ 0xFE) - 45646309) & 0x7FFB)
                                                                        + 1645152982)) ^ v18 ^ 0xFEu))
                                          - (v18 ^ 0x114u)
                                          + 1246))(v23);
}

uint64_t sub_1B97F15A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * (((a14 != v14) * ((v16 - 532) ^ (v16 - 451))) ^ v16)) - 8))();
}

uint64_t sub_1B97F15D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * (((a13 != ((v15 + 1678211847) & 0x87B7 ^ (v13 - 925)))
                                          * ((v15 + 1678211847) ^ 0x64077FB4)) ^ (v15 + 49)))
                            - 8))();
}

uint64_t sub_1B97F162C@<X0>(int a1@<W8>)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = (*(uint64_t (**)(_QWORD))(v4 + 8 * (v1 - 1731)))(a1 ^ v2) == 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((v5 * (((v1 - 1412) | 0x102) ^ 0x336)) ^ v1)))();
}

uint64_t sub_1B97F1674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  int v16;

  v16 = a13 ^ (v14 - 1291) ^ (v13 - 1656909894) & 0x62C26DB7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15
                                        + 8
                                        * ((232
                                          * (((2 * (v16 - ((2 * v16) & 0xEDAA0BF4) + 1993672186)) & 0xDFDBFDDA ^ (((v13 - 901) | 0x308) - 846593368))
                                           + ((v16 - ((2 * v16) & 0xEDAA0BF4) + 1993672186) ^ 0x1938FB17)
                                           - 1610946564 != 266921705)) ^ (v13 - 1333)))
                            - 12))();
}

uint64_t sub_1B97F1730()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = v1 + v0 + ((v2 - 874430325) & 0x341EBEEDu) - 1877869966 < (((v2 + 8993113) | 0xA8160008) ^ 0xA89F4081);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((2 * v4) | (4 * v4) | v2)) - 8))();
}

uint64_t sub_1B97F17B4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (((((a4 - 1904335010) ^ 0x26E16D76 ^ v5) + ((a4 - 1904335010) & 0x7181D2F1))
                                          * ((unint64_t)(v4 - a1) > 0x1F)) ^ a4))
                            - 4))();
}

uint64_t sub_1B97F1804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (((v7 < ((a5 - v6 - 213) ^ (v5 + 1686))) * ((a5 + 21) ^ 0x100)) ^ a5)))();
}

uint64_t sub_1B97F1838(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v10 = v8 + v7 + v6 + 1696;
  v11 = v3 + v10;
  v12 = *(_OWORD *)(v11 - 31);
  v13 = a1 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return (*(uint64_t (**)(void))(v9 + 8 * ((((v5 & 0xFFFFFFE0) != 32) * ((a2 - v2) ^ 0x604)) ^ (v4 + a2 + 410))))();
}

void sub_1B97F1894()
{
  JUMPOUT(0x1B97F1858);
}

uint64_t sub_1B97F18A0(uint64_t a1)
{
  int v1;
  int v2;
  _QWORD *v3;
  int v4;
  _DWORD *v6;
  void (*v7)(_BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[4];
  unsigned int v11;
  uint64_t v12;

  *v3 = a1;
  *v6 = v2;
  v4 = (v1 - 1155) | 0x202;
  v12 = v8;
  v11 = v1
      - 500
      + 535753261
      * (((v10 | 0x252138E8) - v10 + (v10 & 0xDADEC710)) ^ 0x2FD536C7)
      + 226;
  v7(v10);
  v12 = v9;
  v11 = v4
      + 535753261 * ((992398163 - (v10 | 0x3B26CB53) + (v10 | 0xC4D934AC)) ^ 0xCE2D3A83)
      + 367;
  v7(v10);
  return 0;
}

void sub_1B97F1B58(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B97F1BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a66;
  uint64_t v66;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, unint64_t *))(*(_QWORD *)(v66 + 3744) - 8))(a1, a2, a3, a4, a5, a6, a7, 3102982430, a9, &a66, a11, &STACK[0x4FF3ADA337C70055]);
}

uint64_t sub_1B97F1D28()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (int)(((((v0 - 338895378) & 0xDFBFE7EB) + 879966575) * (v2 == v3)) ^ v0))
                            - ((v0 + 1645) ^ 0x738)))();
}

uint64_t sub_1B97F1D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;

  return (*(uint64_t (**)(void))(v18 + 8 * ((107 * ((((v17 - 1641) ^ 0xFFFFFF2F) & v19) - a17 == -3)) ^ v17)))();
}

uint64_t sub_1B97F1DB8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * (((((a1 - 880016978) | 0xC428) + 879967018) * (v1 == 369238551)) ^ a1))
                            - 8))();
}

uint64_t sub_1B97F1E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  _BOOL4 v27;

  v25 = 2 * (v21 ^ (v22 + 125) ^ 0x10F);
  v26 = v21 + 879967956;
  v27 = a21 - 94734047 < (v24 - 937898909);
  if ((a21 - 94734047) < 0x1006639E != (v24 - 937898909) < 0x1006639E)
    v27 = (v24 - 937898909) < 0x1006639E;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((v27 * (v25 ^ 0x1C0)) ^ v26)) - 8))();
}

uint64_t sub_1B97F1FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v21 = 628203409 * ((v20 - 152) ^ 0x82880C33);
  *(_DWORD *)(v20 - 136) = v17 - v21 + 1538;
  *(_DWORD *)(v20 - 132) = v19 - v21 + 77623025;
  *(_QWORD *)(v20 - 152) = a14;
  *(_QWORD *)(v20 - 144) = a12;
  *(_QWORD *)(v20 - 112) = a17;
  *(_QWORD *)(v20 - 104) = a13;
  *(_QWORD *)(v20 - 128) = a15;
  v22 = (*(uint64_t (**)(uint64_t))(a6 + 8 * (v17 ^ 0x19D)))(v20 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((*(_DWORD *)(v20 - 120) == (((v17 + 134791456) | 0xC3840489) ^ 0xA983CB50))
                                                        * ((355 * (v17 ^ 0x105)) ^ 0x58D)) ^ v17))
                                          - 8))(v22);
}

uint64_t sub_1B97F20B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8 * (((*(_DWORD *)(v11 + 48 * (v13 + a8)) == 470551612) * (((16 * v8) ^ 0x6FF0 ^ (v9 + 256)) + 879967002)) ^ v8))
                                                                                       - 4))(a1, a2, a3, a4, a5, v12);
}

uint64_t sub_1B97F2114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;

  if ((v5 - 1155520739) <= 0x19 && ((1 << (v5 + 29)) & 0x3014001) != 0)
    __asm { BR              X10 }
  return a5 ^ 0x9DF05627;
}

void sub_1B97F2874(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  v2 = *((_QWORD *)*(&off_1E709D0C0 + v1 - 1265)
       + ((61 * (((uint64_t (*)(uint64_t))*(&off_1E709D0C0 + v1 - 1081))(32) != 0)) ^ v1)
       - 1)
     - 8;
  __asm { BR              X8 }
}

uint64_t sub_1B97F2904(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0x23F5AF4C23F5AF4CLL;
  *(_QWORD *)(result + 16) = 0xA94A23B81285297ALL;
  *(_DWORD *)(result + 24) = 1645153785;
  *(_QWORD *)(v2 - 0x4BD26FD1213425A1) = result + 0x27681A84B35EB105;
  *((_DWORD *)v1 + 2) = 1645153785;
  return result;
}

void sub_1B97F2984(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B97F29C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1906 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0x13Eu)))();
}

uint64_t sub_1B97F29F4()
{
  uint64_t v0;
  int v1;
  unsigned int v2;

  v2 = v1 - ((2 * v1 + 1881461128) & 0x82B34678) + 2037124096;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((912
                                          * (((2 * v2) & 0xECF2B9EA ^ 0x80B20068) + (v2 ^ 0x3720FFC9) + 1845473215 != 1685654708)) ^ 0x4AAu))
                            - 4))();
}

uint64_t sub_1B97F2AA8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  unsigned int v5;

  return (*(uint64_t (**)(void))(v4 + 8 * ((26 * (a4 + a3 + v5 + 973 + (v5 ^ 0x9869E38) > 7)) ^ v5)))();
}

uint64_t sub_1B97F2AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * (a8 ^ (207 * ((unint64_t)(v9 - a5 - 1167) > 0x1F))))
                            - 4))();
}

uint64_t sub_1B97F2B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  unsigned int v9;

  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (int)((((((a8 + 2059979559) & 0x33F0) + 118) ^ 0xC21B0EF2 ^ ((((a8 + 2059979559) & 0x33F0)
                                                                                            + 118) | 0x38) ^ 0xC21B0EC4)
                                     * (v9 < 0x20)) ^ (a8 + 2059979559) & 0x33F0)))();
}

uint64_t sub_1B97F2B90(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v12 = a7 + a3 + a4 + 2015;
  v13 = v10 + v12;
  v14 = *(_OWORD *)(v13 - 31);
  v15 = v9 + v12;
  *(_OWORD *)(v15 - 15) = *(_OWORD *)(v13 - 15);
  *(_OWORD *)(v15 - 31) = v14;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((v11 & 0xFFFFFFE0) != 32) * (((v8 + a6 + 1315) | 0xC) - 1540)) ^ (v8 + a6 + 124))))();
}

void sub_1B97F2BEC()
{
  JUMPOUT(0x1B97F2BA8);
}

uint64_t sub_1B97F2BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;

  *(_DWORD *)(a5 + 1424) = v6 + ((v7 - v5) ^ 0x2D86C0A4);
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 520) = *(_QWORD *)(a2 + 8) + 1;
  return 0;
}

uint64_t sub_1B97F2D50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W5>, int a4@<W8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  *(_BYTE *)(v5 + (v8 + v7)) = *(_BYTE *)(v6 + (v8 + v7));
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v4
                                                                       + 8
                                                                       * ((41
                                                                         * (((v8 - 1 == a4) ^ (((a3 - 31) & 0xF7) - 104)) & 1)) ^ (a3 - 86405151) & 0x5266FF7u))
                                                           - 8))(a1, a2, (((a3 - 86405151) & 0x5266FF7) - 1385) | 0x482u);
}

void sub_1B97F2DB4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }
}

uint64_t sub_1B97F2E3C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((((*(_BYTE *)(v2 - 0x27681A84B35EB0F1) & 1) == 0) ^ (a1 - 1)) & 1)
                                * (a1 ^ 0x218)) ^ a1)))();
}

void sub_1B97F2E7C(int a1@<W8>)
{
  uint64_t v2;
  _BYTE v3[80];

  *(_BYTE *)(v2 - 0x27681A84B35EB0E6) = ((((unint64_t)v3 ^ 0xFFFFEE7FFFDAFB87) + 121) ^ 0xBA)
                                        * (((unint64_t)v3 ^ 0xFFFFEE7FFFDAFB87) - 118);
  __asm { BR              X15 }
}

void sub_1B97F30A8()
{
  JUMPOUT(0x1B97F3078);
}

void sub_1B97F30B0()
{
  int v0;
  uint64_t v1;

  (*(void (**)(void))(v1 + 8 * (v0 - 1003)))();
  JUMPOUT(0x1B97F30C8);
}

uint64_t sub_1B97F30E4(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)off_1E7098AD0[((8 * (*(_DWORD *)(a2 + 4) != 1206753096)) | ((*(_DWORD *)(a2 + 4) != 1206753096) << 6)) ^ 0x99u]
                                          - 12))(4294925278);
}

uint64_t sub_1B97F312C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 468) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2 + 9208) - 12))(0);
}

uint64_t sub_1B97F3184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v5)) = *(_BYTE *)(v4 + (v7 + v5));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v1 + 8 * (((v7 - 1 != v2) * v6) ^ v3)) - 12))(0);
}

void sub_1B97F31B8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) ^ (3804331 * ((2 * (a1 & 0x520CC9FF) - a1 - 1376569856) ^ 0xD32613F6));
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_1E709D0C0 + (v1 ^ 0x1C2)))((char *)*(&off_1E709D0C0 + v1 - 229) - 4, sub_1B981723C);
  __asm { BR              X11 }
}

uint64_t sub_1B97F3274()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((883 * (**(_QWORD **)(v1 + 8 * (v2 ^ 0x1E8)) == 0)) ^ v2))
                            - ((v2 - 1332780451) & 0x4F709ED1)
                            + 585))();
}

uint64_t sub_1B97F32D0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x2C2)))(v1);
}

void sub_1B97F32F0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B97F3340@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((19 * (v1 == 1206753083)) ^ 0x58Du)) - 8))();
}

uint64_t sub_1B97F3378(_DWORD *a1)
{
  int v1;
  int v2;
  int v3;

  *((_BYTE *)a1 + (v3 ^ (v2 + 687)) + v1 + 4) = 79;
  *a1 = v1;
  return 0;
}

uint64_t sub_1B97F33AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  _BOOL4 v7;

  *(_BYTE *)(a1 + (v3 + v4) + 4) = ((2 * **(_BYTE **)(a2 + 8)) & 0x9F) + (**(_BYTE **)(a2 + 8) ^ 0x4F);
  v5 = *(_DWORD *)(a2 + 4) - 650652805;
  v6 = v5 < 0x21256AB6;
  v7 = v5 > 0x21256AB7;
  if (v6)
    v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * ((1572 * !v7) ^ 0x3BAu)) - 8))();
}

void sub_1B97F345C()
{
  JUMPOUT(0x1B97F33E0);
}

void sub_1B97F3464(uint64_t a1)
{
  int v1;
  BOOL v3;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19) == 159353952
    || *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0xC7F991DE6408E19) == 159353952;
  v1 = *(_DWORD *)a1 - 1225351577 * ((-1557536513 - (a1 | 0xA329E0FF) + (a1 | 0x5CD61F00)) ^ 0x7F4CC716);
  __asm { BR              X14 }
}

uint64_t sub_1B97F3574@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((a1 + v3 + 71 * (v2 ^ 0xEAu) - 1056 >= 0x7FFFFF7D)
                                     * (((v2 + 301361902) & 0xEE0995EF) + 49)) ^ v2)))();
}

uint64_t sub_1B97F35D4(int a1)
{
  uint64_t v1;
  int v2;
  uint64_t (*v3)(_QWORD, uint64_t, uint64_t);

  v3 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1
                                                                    + 8
                                                                    * ((1868 * (v2 > ((a1 - 776) | 0x444) - 1239)) ^ a1))
                                                        - 8);
  return v3(v3, 136689414, 1868);
}

uint64_t sub_1B97F364C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  _BOOL4 v20;

  v20 = v17 > v19;
  *(_DWORD *)(a14 + 4 * (a2 - 136689414)) = v15;
  if (v20 == a2 - 912297563 < ((v16 - 598) | 0x11A) + 1371874575)
    v20 = a2 - 912297563 < v18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((977 * !v20) ^ v16)) - 8))();
}

uint64_t sub_1B97F36C8(int a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (a1 ^ (46 * (v2 == 0)))) - ((a1 + 118) ^ 0x419)))();
}

uint64_t sub_1B97F36FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  uint64_t v10;
  int v11;
  int v12;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8 * (int)((((v12 + 1694736606) & 0x9AFC5BF7 ^ 0x26B) * (v11 > a10)) ^ v12))
                            - ((v12 - 2048383028) & 0x7A17D5E7)
                            + 441))();
}

uint64_t sub_1B97F3780(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  int v16;
  int v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * ((925 * (*(_DWORD *)(a14 + 4 * (v16 + v17 + 1)) == v15)) ^ (a1 + 588)))
                            - ((23 * (a1 ^ 0x1C8) - 265) | 0xC5u)
                            + 219))();
}

uint64_t sub_1B97F37DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v11 + v10 >= (v9 - 68 + a5)) * v7) ^ v9))
                            - (((v9 - 43) | v6) ^ v8)))();
}

void sub_1B97F3818()
{
  JUMPOUT(0x1B97F379CLL);
}

void sub_1B97F3820()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_1B97F3C18(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  _DWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 24) - 1225351577 * ((2 * (a1 & 0x2B9C6F1D) - a1 + 1415811298) ^ 0x77F948F4);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19) - 159353952 >= 0)
    v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19) - 159353952;
  else
    v2 = 159353952 - *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) - 0xC7F991DE6408E19) - 159353952 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0xC7F991DE6408E19) - 159353952;
  else
    v3 = 159353952 - *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0xC7F991DE6408E19);
  v6 = *(_QWORD *)(a1 + 8);
  v5[1] = (460628867 * ((1088039055 - (v5 | 0x40DA288F) + (v5 | 0xBF25D770)) ^ 0xF3B3550D)) ^ (v1 + 290);
  sub_1B98032C4((uint64_t)v5);
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  __asm { BR              X16 }
}

uint64_t sub_1B97F3DA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  _BOOL4 v15;

  v11 = v4 - 413931738;
  v12 = 4 * (v7 + v5);
  v13 = (*(_DWORD *)(*(_QWORD *)(v10 - 0xC7F991DE6408E15) + v12) ^ v6)
      - (*(_DWORD *)(*(_QWORD *)(v9 - 0xC7F991DE6408E15) + v12) ^ v6);
  *(_DWORD *)(*(_QWORD *)(a1 - 0xC7F991DE6408E15) + v12) = v13
                                                           + v6
                                                           - ((((v3 - 387) | 0x140) ^ (v8 + 434)) & (2 * v13));
  v15 = v7 - 1538539199 < 1733551910 && v7 - 1538539199 >= v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v15 * v2) ^ v3)) - 12))();
}

uint64_t sub_1B97F3EB8()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 + 141438039 < (int)(v3 + 1266045501);
  if (v3 > 0x3489ADC2 != v2 + 141438039 < -881438147)
    v4 = v3 > 0x3489ADC2;
  return (*(uint64_t (**)(void))(v0 + 8 * ((!v4 * (((v1 - 453) | 0x320) ^ 0x90)) ^ v1)))();
}

uint64_t sub_1B97F3F30()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 + 773424304 < (int)(v3 + 1898030669 + v1 + 903);
  if (v3 > 0xEDE5569 != v2 + 773424304 < (int)(((v1 + 27859501) & 0xFE56E7FA) - 249452628))
    v4 = v3 > 0xEDE5569;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((57 * v4) | v1)) - 4))();
}

uint64_t sub_1B97F3FB8@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v14 = v7 - 903;
  v15 = v12 > v6;
  v16 = 4 * (v10 + v8);
  v17 = v3 + 404716728 + (*(_DWORD *)(*(_QWORD *)(v13 - 0xC7F991DE6408E15) + v16) ^ 0x401477F0);
  *(_DWORD *)(*(_QWORD *)(a2 - 0xC7F991DE6408E15) + v16) = v17 + v9 - (v11 & (2 * v17));
  LODWORD(v16) = v10 + 1 + v4;
  v18 = v15 ^ ((int)v16 < a1 + 746);
  v19 = (int)v16 < v5;
  if (!v18)
    v15 = v19;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1163 * v15) ^ v14)) - 4))();
}

uint64_t sub_1B97F40B4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((v1 == (v2 - 202) + 0x5BD59A0E7E08128) * ((v2 ^ 0x338) - 444)) ^ v2))
                            - 4))();
}

uint64_t sub_1B97F40F8()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v0 + 8 * ((691 * (v2 + v3 + ((v1 - 466) | 0x220u) + 538 - 1083 < 0x7FFFFFFF)) ^ v1)))();
}

uint64_t sub_1B97F4134@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v8;
  int v9;
  signed int v10;
  int v11;
  _BOOL4 v12;

  v6 = a1 - 1515627297;
  v7 = a1 - 321;
  v8 = v4 - 179107018 < -1201983204;
  v9 = (**(_DWORD **)(a2 - 0xC7F991DE6408E15) ^ 0x401477F0) + 1;
  **(_DWORD **)(a2 - 0xC7F991DE6408E15) = v9 + v3 - (v5 & (2 * v9));
  v10 = (v6 & 0x5A56A53A ^ 0xBEA6F4D2) + 2041856053;
  v11 = v8 ^ (v10 < -1201983204);
  v12 = v10 < v4 - 179107018;
  if (!v11)
    v8 = v12;
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((269 * !v8) ^ v7)))(1515627834);
}

void sub_1B97F4208()
{
  JUMPOUT(0x1B97F419CLL);
}

uint64_t sub_1B97F4214@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  int v18;
  _BOOL4 v19;

  v14 = (a1 - 229) | 0x33;
  v15 = 4 * (v10 + v8);
  v16 = v3 + 404716727 + (*(_DWORD *)(*(_QWORD *)(v13 - 0xC7F991DE6408E15) + v15) ^ v9);
  *(_DWORD *)(*(_QWORD *)(a2 - 0xC7F991DE6408E15) + v15) = v16 + v9 - ((v16 << ((v14 + 84) & 0xF6 ^ 0xC3)) & v11);
  v17 = v12 > v7;
  LODWORD(v15) = v10 + 1 + v5;
  v18 = v17 ^ ((int)v15 < v4);
  v19 = (int)v15 < v6;
  if (!v18)
    v17 = v19;
  return (*(uint64_t (**)(void))(v2 + 8 * ((350 * v17) ^ v14)))();
}

uint64_t sub_1B97F431C()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((247 * (v2 + v3 - 1 < ((v1 + 393399162) & 0xE88D367D ^ 0x7FFFFBE7))) ^ (v1 + 596)))
                            - 8))();
}

uint64_t sub_1B97F4394@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((197
                                          * (*(_DWORD *)(*(_QWORD *)(a1 - 0xC7F991DE6408E15)
                                                       + 4 * (v3 + v5 + ((v2 + 12) | 0x50u) - 1141)) == v4 + 262 * (((v2 + 12) | 0x50) ^ 0x470) - 1048)) ^ ((v2 + 12) | 0x50)))
                            - 8))();
}

uint64_t sub_1B97F4400()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((108 * (((v1 ^ ((v3 + v2 - 2) < 0x7FFFFFFF)) & 1) == 0)) ^ v1))
                            - ((v1 - 1178509359) & 0x463E9E36)
                            + 536))();
}

uint64_t sub_1B97F4458()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (int)((197
                                               * (*(_DWORD *)(v1 + 4 * (v4 + (v2 ^ v3) + v6 - 1141)) == v5 + 262 * (v2 ^ v3 ^ 0x470) - 1048)) ^ v2 ^ v3))
                            - 8))();
}

void sub_1B97F44A8(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0xC7F991DE6408E19) = (((v3 + v2) * (v1 - 1901766679)) ^ 0x5DFFADE4)
                                        - 1417683332
                                        + ((2 * (v3 + v2) * (v1 - 1901766679)) & 0xBBFF5BC8);
}

void sub_1B97F4534(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 1178560073 * (a1 ^ 0xBA947862);
  __asm { BR              X9 }
}

uint64_t sub_1B97F45E0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((a1 - 527) ^ 0x348 ^ ((a1 + 4) | 0x108)) * (v1 != 0)) ^ a1))
                            - 8))();
}

uint64_t sub_1B97F4628()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v6;

  v6 = (*(_BYTE *)(v3 - 0x27681A84B35EB0F1) & 1) == 0
    && (*(_DWORD *)(v2 + 16) ^ v0) - 193011051 < ((v1 - 478) | 0x100u) - 337;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((v6 | (16 * v6)) ^ v1)) - 4))();
}

uint64_t sub_1B97F4694@<X0>(uint64_t (*a1)(unsigned int *)@<X8>, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  uint64_t v12;

  v11 = 3804331 * (((&a3 | 0xCAC897F1) - (&a3 & 0xCAC897F1)) ^ 0xB41DB207);
  a7 = v11 + 384812048;
  a3 = v11 + 1116194082;
  a4 = v11 + v10 + 248;
  a5 = v7;
  a6 = v8;
  v12 = a1(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v8 - 0x27681A84B35EB0EDLL) != ((v10 + 369513487) & 0xE9F9ABF9) + 1645153504)
                                                        * ((v10 + 1017) ^ 0x500)) | v10))
                                          - 12))(v12);
}

void sub_1B97F4764()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  _BYTE *v7;

  v5 = v3 - (((v4 + 1008) ^ 0x989A24D6) & (2 * v3 - 386021972)) + 1087108037;
  *v7 = (HIBYTE(v5) ^ 0x4C) - ((v5 >> 23) & 0x64) + 50;
  v7[1] = (BYTE2(v5) ^ 0x4D) - ((v5 >> 15) & 0x64) + 50;
  v7[2] = (BYTE1(v5) ^ 0x10) - ((2 * (BYTE1(v5) ^ 0x10)) & 0x64) + 50;
  v7[3] = (v3 - (((v4 - 16) ^ 0xD6) & (2 * v3 - 84)) - 59) ^ 0xDD;
  v6 = v2 - ((2 * v2) & 0x3749B0E77A16C552) + 0x1BA4D873BD0B62A9;
  v7[4] = (HIBYTE(v6) ^ 0x1B) - ((2 * (HIBYTE(v6) ^ 0x1B)) & 0x64) + 50;
  v7[5] = (BYTE6(v6) ^ 0xA4) - ((2 * (BYTE6(v6) ^ 0xA4)) & 0x64) + 50;
  v7[6] = (BYTE5(v6) ^ 0xD8) + (~(2 * (BYTE5(v6) ^ 0xD8)) | 0x9B) + 51;
  v7[7] = (BYTE4(v6) ^ 0x73) - 2 * ((BYTE4(v6) ^ 0x73) & 0x36 ^ BYTE4(v6) & 4) + 50;
  v7[8] = (((v2 - ((2 * (_DWORD)v2) & 0x7A16C552) - 1123327319) >> 24) ^ 0xBD)
        - ((2 * (((v2 - ((2 * (_DWORD)v2) & 0x7A16C552) - 1123327319) >> 24) ^ 0xBD)) & 0x64)
        + 50;
  v7[9] = (BYTE2(v6) ^ 0xB) - ((2 * (BYTE2(v6) ^ 0xB)) & 0x64) + 50;
  v7[10] = (BYTE1(v6) ^ 0x62) - 2 * ((BYTE1(v6) ^ 0x62) & 0x36 ^ BYTE1(v6) & 4) + 50;
  v7[11] = (v2 - ((2 * v2) & 0x52) - 87) ^ 0x9B;
  *v0 = *(_DWORD *)(v1 - 0x27681A84B35EB0EDLL);
}

uint64_t sub_1B97F4E54(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v1 = 628203409 * (((a1 | 0xC21FEC2B) - (a1 & 0xC21FEC2B)) ^ 0x4097E018);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = v1 + *(_DWORD *)(a1 + 12) - 507371026;
  v4 = (*(_DWORD *)(*(_QWORD *)a1 - 0x5C6940C6B1BC6FF6) ^ 0x6731FE54) + v3;
  v5 = v4 - ((2 * v4) & 0xCE63FCA8) + 1731329620;
  *(_DWORD *)(*(_QWORD *)a1 - 0x5C6940C6B1BC6FF6) = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + (v2 ^ 0x437)) + ((277 * ((v5 ^ 0x6731FE54) < v3)) ^ v2) - 1)
                            - 8))();
}

void sub_1B97F4F1C(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) = (*(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) ^ 0x37D4814A)
                                         + 936673610
                                         - ((2 * (*(_DWORD *)(a1 - 0x5C6940C6B1BC6FFALL) ^ 0x37D4814A) + 2) & 0x6FA90294)
                                         + 1;
}

void sub_1B97F4F64(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  _BOOL4 v5;

  v1 = 235795823 * (((_DWORD)a1 - 1876425126 - 2 * (a1 & 0x9028065A)) ^ 0x4854F03);
  v2 = a1[9] + v1;
  v3 = *a1 ^ v1;
  v5 = (v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 603979776;
  __asm { BR              X11 }
}

uint64_t sub_1B97F5034@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, unsigned int a5, uint64_t a6, unint64_t *a7, int a8, unint64_t *a9, char a10, int a11)
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;

  v15 = *(_QWORD *)(v12 + 8);
  v16 = 1755732067
      * (((&a4 | 0xA5876138) - &a4 + (&a4 & 0x5A789EC0)) ^ 0x7B41DCE3);
  a8 = v16 + v14 + 301;
  a9 = &STACK[0xF250A47131524F5];
  a6 = v15;
  a7 = &STACK[0x4B30070DAA05F9E0];
  a10 = (99 * (((&a4 | 0x38) - &a4 + (&a4 & 0xC0)) ^ 0xE3)) ^ 0xC5;
  a5 = ((v11 ^ 0x1B729855) + 394248036 + ((v11 << ((v14 - 29) ^ 0x36)) & 0xFD3BA1FE ^ 0xC91A8154)) ^ v16;
  a4 = &STACK[0x330904BA72E93EC4];
  v17 = (*(uint64_t (**)(unint64_t **))(a1 + 8 * (v14 ^ 0x12F)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * ((1381 * (a11 == 1645153785)) ^ v14)) - 8))(v17);
}

uint64_t sub_1B97F516C()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (int)((((v2 + 724978375) & 0xD4C9B7A7 ^ 0x45A) * (v1 == 603979776)) ^ v2))
                            - ((v2 - 618880059) & 0x24E35BBB ^ 0x3B4)))();
}

uint64_t sub_1B97F51CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11 + 8 * ((29 * (a10 + 4 >= a10)) ^ v10))
                                          - (v10 ^ 0x291 ^ (13 * (v10 ^ 0x6F5u)) ^ 0xCLL)))(a1);
}

uint64_t sub_1B97F5248()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 ^ (692 * (v1 != 0xD86A8E34)))) - 12))();
}

uint64_t sub_1B97F529C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = v4 > 0x13057B94;
  *(_BYTE *)(a1 + (v7 - 281128576)) = *(_BYTE *)(v1 + (v7 - 281128576));
  if (v9 == v7 - 600254996 < v3)
    v9 = v7 - 600254996 < v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((v9 * v6) ^ v2)) - 12))();
}

uint64_t sub_1B97F5320()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((15
                                          * (((2 * v1) & 0xDF59FFDE ^ 0x90511C48)
                                           + (v1 ^ 0xB7C671DB)
                                           + ((v0 - 808) ^ 0xF7DF7F8F) != 1737260655)) ^ v0))
                            - 12))();
}

uint64_t sub_1B97F538C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((2015
                                          * ((((v0 - 1873608687) < 0xC) ^ (-83 * (v1 ^ 4))) & 1)) ^ v1))
                            - (v1 + 69)
                            + 336))();
}

uint64_t sub_1B97F53E8(int a1, int a2, int a3)
{
  char v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((28
                                          * (((a3 + a1 + v4 - (v3 & 3) + 1486) & 0xFFFFFFFC) <= a1
                                                                                              + v4
                                                                                              + ((((a2 - 878) | 0x304)
                                                                                                + a3) ^ (20 * (a2 ^ 0x77Eu))))) ^ a2))
                            - 12))();
}

uint64_t sub_1B97F5450@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (v6 - 519);
  a3.i32[0] = *(_DWORD *)(a2 + (v8 ^ 0x4FF) + a1);
  *(_DWORD *)(a2 - 3 + (v3 + v4 + v8 - 1007 - 271)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)((1019 * (v5 != 4)) ^ v8)) - 8))();
}

uint64_t sub_1B97F54B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(a1 - 3 + (v3 + v2)) = *(_DWORD *)(v1 - 3 + (v3 + v2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 4) * (((v4 - 71) | 2) ^ 0x77A)) ^ (v4 + 311))) - 8))();
}

uint64_t sub_1B97F5508(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((((a1 - 660417817) & 0x275D2D5D ^ 0x127) * (v1 == v2)) ^ a1)) - 4))();
}

uint64_t sub_1B97F5548@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + (v4 + v3)) = *(_BYTE *)(v1 + (v4 + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((529 * (v4 - 1 != v2)) ^ (v5 + 40))) - (v5 ^ 0x2ECu) + 948))();
}

uint64_t sub_1B97F5588()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1570
                                          * ((((v0 - 696) ^ (*(_QWORD *)(v1 + 16) == 0x2E91F1FE0AA58417)) & 1) == 0)) ^ v0))
                            - 12))();
}

uint64_t sub_1B97F55CC@<X0>(uint64_t a1@<X8>, int a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(a1 - 0x2E91F1FE0AA58417) = a3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8 * ((980 * (*(_QWORD *)(v4 + 24) != 0x5412677448247A30)) ^ (v3 - 612)))
                            - 8))();
}

void sub_1B97F5624(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 0x5412677448247A30) = v2;
  *(_DWORD *)(v1 + 32) = 1645153785;
}

void sub_1B97F56C0(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  v2 = *(_DWORD *)(a1 + 16) + v1;
  __asm { BR              X14 }
}

uint64_t sub_1B97F5788@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v7;
  uint64_t v8;
  unsigned int v9;

  v5 = 108757529 * ((1436736608 - (&v7 | 0x55A2DC60) + (&v7 | 0xAA5D239F)) ^ 0x4AC141B4);
  v8 = v1;
  v7 = v5 + v3 + 163;
  v9 = (v2 - ((((739 * (v3 ^ 0x312)) ^ 0xED4E0848) + v4) & 0xC39B409E) + 1484039958) ^ v5;
  return ((uint64_t (*)(int *))(*(_QWORD *)(a1 + 8 * (v3 ^ 0x38E)) - 8))(&v7);
}

void sub_1B97F58FC(uint64_t a1, uint64_t a2)
{
  int v3;
  int v5;
  unint64_t *v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  v3 = 1178560073 * ((&v5 - 1556789680 - 2 * ((unint64_t)&v5 & 0xA3354650)) ^ 0x19A13E32);
  v5 = 1076023948 - v3;
  v6 = &STACK[0x5C6940C6B1BC70A6];
  v7 = 1172345435 - v3;
  sub_1B97E0618((uint64_t)&v5);
  __asm { BR              X9 }
}

uint64_t sub_1B97F5AA0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;

  v5 = v1 - 2147479261;
  if (v5 <= 0x40)
    v5 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((659 * (v4 - v0 - v2 + v5 > 0xE)) ^ 0x492u)) - 12))();
}

uint64_t sub_1B97F5B0C(unsigned int a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  v7 = v2 + v1;
  v8 = v7 - 2147479261;
  if ((v7 - 2147479261) <= 0x40)
    v8 = v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((11 * (v6 - v7 >= (v4 + v8))) ^ a1)) - 12))();
}

uint64_t sub_1B97F5B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  int v23;
  int v24;
  uint64_t v25;

  return ((uint64_t (*)(void))(*(_QWORD *)(v25
                                        + 8
                                        * ((46
                                          * ((unint64_t)(&a23 + a14 + (v23 + v24 + 1975)) > 0xF)) | 0x581u))
                            - 4))();
}

uint64_t sub_1B97F5BBC@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int8x16_t *v6;
  int v7;
  int8x16_t v8;
  int8x16_t v9;

  v7 = 638 * (v4 ^ 0x517);
  v8.i64[0] = 0x6464646464646464;
  v8.i64[1] = 0x6464646464646464;
  v9.i64[0] = 0x3232323232323232;
  v9.i64[1] = 0x3232323232323232;
  *(int8x16_t *)(v2 + a1 + (v7 ^ 0x17D ^ (v1 + 897))) = vaddq_s8(vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v8)), v9);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((489 * (((v3 + 1) & 0x1FFFFFFF0) != 16)) ^ v7))
                            - 8))();
}

void sub_1B97F5C40()
{
  JUMPOUT(0x1B97F5C00);
}

uint64_t sub_1B97F5C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4
                                                               + 8
                                                               * (((((v3 - 1867562114) & 0x50B70A) + 879) * (v1 == v2)) ^ v3))
                                                   - (v3
                                                    - 735)
                                                   + 670))(a1, 2427853056);
}

uint64_t sub_1B97F5C9C@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  *(&a17 + (a2 + v17)) = *(_BYTE *)(v18 + v21 - 1473562207)
                                     - ((*(unsigned __int8 *)(v18 + v21 - 1473562207) << ((v19 + 104) ^ 0xB)) & 0x64)
                                     + 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * ((107 * ((a1 + a2 + 49) > 0x3F)) ^ v19)) - 12))();
}

uint64_t sub_1B97F5D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int32x4_t a41,int32x4_t a42,int32x4_t a43,int32x4_t a44)
{
  int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t (*v52)(__n128, __n128, __n128, __n128, __n128);
  __n128 v53;
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint8x16_t v62;
  uint16x8_t v63;
  int8x16_t v64;
  uint16x8_t v65;
  int8x16_t v66;
  uint8x16_t v67;
  uint16x8_t v68;
  uint16x8_t v69;
  int8x16_t v70;
  int8x16_t v71;
  int8x16_t v72;
  int8x16_t v73;
  uint8x16_t v74;
  int8x16_t v77;
  int8x16_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int v86;
  int v87;
  char *v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(char *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v94;
  uint8x16_t v95;
  uint16x8_t v96;
  uint16x8_t v97;
  uint8x16_t v98;
  uint8x16_t v103;
  uint16x8_t v104;
  uint16x8_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  uint64_t v110;
  _DWORD *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  int8x16x4_t v124;
  int8x16x4_t v125;

  v120 = v45;
  v52 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v46 + 8 * v44) - 4);
  v53.n128_u64[0] = 0x3232323232323232;
  v53.n128_u64[1] = 0x3232323232323232;
  v54 = (__n128)vdupq_n_s32(0x620F0DFFu);
  v55 = (__n128)vdupq_n_s32(0x620F0DF9u);
  v123 = v51 - 16;
  v56.n128_u64[0] = 0x6464646464646464;
  v56.n128_u64[1] = 0x6464646464646464;
  v57 = (__n128)vdupq_n_s32(0xC41E1BF2);
  HIDWORD(a13) = a13 + 972540699;
  v58 = HIDWORD(a31);
  v59 = a33;
  v60 = BYTE4(a34) ^ 0x5F;
  HIDWORD(a16) = BYTE4(a34) ^ 0x5F;
  if (v60 == 2)
  {
    v121 = __PAIR64__(a32, HIDWORD(a31));
    v122 = __PAIR64__(a33, HIDWORD(a32));
    v125 = vld4q_s8((const char *)&a22 + 4);
    v94 = a6 + a5 + 337;
    LODWORD(a16) = HIDWORD(a33);
    v95 = (uint8x16_t)veorq_s8(v125.val[0], (int8x16_t)v53);
    v96 = vmovl_u8(*(uint8x8_t *)v95.i8);
    v97 = vmovl_high_u8(v95);
    v98 = (uint8x16_t)veorq_s8(v125.val[1], (int8x16_t)v53);
    _Q22 = vmovl_u8(*(uint8x8_t *)v98.i8);
    _Q21 = vmovl_high_u8(v98);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v103 = (uint8x16_t)veorq_s8(v125.val[2], (int8x16_t)v53);
    v104 = vmovl_high_u8(v103);
    v105 = vmovl_u8(*(uint8x8_t *)v103.i8);
    v125.val[0] = veorq_s8(v125.val[3], (int8x16_t)v53);
    v125.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v125.val[0]);
    v125.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v125.val[1]);
    v125.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v125.val[1].i8);
    v125.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v125.val[0].i8);
    v125.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v125.val[0]);
    v125.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v125.val[0].i8);
    v106 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v105.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.i8), 0x18uLL)), v125.val[0]);
    v107 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v105, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v96), 0x18uLL)), v125.val[3]);
    v108 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v104.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.i8), 0x18uLL)), v125.val[1]);
    v109 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v104, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v97), 0x18uLL)), v125.val[2]);
    v125.val[0] = veorq_s8(vandq_s8((int8x16_t)v106, (int8x16_t)v54), (int8x16_t)(*(_OWORD *)v125.val & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v125.val[3] = veorq_s8(vandq_s8((int8x16_t)v107, (int8x16_t)v54), (int8x16_t)(*(_OWORD *)&v125.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v125.val[1] = veorq_s8(vandq_s8((int8x16_t)v108, (int8x16_t)v54), (int8x16_t)(*(_OWORD *)&v125.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v125.val[2] = veorq_s8(vandq_s8((int8x16_t)v109, (int8x16_t)v54), (int8x16_t)(*(_OWORD *)&v125.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    a43 = vaddq_s32(vsubq_s32(v108, vaddq_s32((int32x4_t)v125.val[1], (int32x4_t)v125.val[1])), (int32x4_t)v55);
    a44 = vaddq_s32(vsubq_s32(v109, vaddq_s32((int32x4_t)v125.val[2], (int32x4_t)v125.val[2])), (int32x4_t)v55);
    a41 = vaddq_s32(vsubq_s32(v106, vaddq_s32((int32x4_t)v125.val[0], (int32x4_t)v125.val[0])), (int32x4_t)v55);
    a42 = vaddq_s32(vsubq_s32(v107, vaddq_s32((int32x4_t)v125.val[3], (int32x4_t)v125.val[3])), (int32x4_t)v55);
    v110 = v94 ^ 0x184u;
    v111 = (_DWORD *)&a41 + v49 + 1580584629;
    v112 = *(v111 - 8) ^ *(v111 - 3);
    v113 = v110 ^ (v50 + 340);
    v114 = *(v111 - 16);
    v115 = v114 ^ *(v111 - 14) ^ (v112 + v113 - ((2 * v112) & 0xC41E1BF2));
    HIDWORD(v117) = v115 ^ v50;
    LODWORD(v117) = v115;
    v116 = v117 >> 31;
    v118 = (v50 + v116);
    *v111 = v118 - ((2 * v116) & 0xC41E1BF2);
    v119 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 + 8 * ((1617 * (v51 != 1580584566)) ^ v94)) - 12);
    return v119(v110, 1580584630, v58, v59, v119, v118, v114, v113, a9, a10, a11, a12, a13, a14, v120, a16, v121, v122, v52,
             v123,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40);
  }
  else if (v60 == 1)
  {
    v124 = vld4q_s8((const char *)&a22 + 4);
    v61 = 41 * (a5 ^ (a5 - 13));
    v62 = (uint8x16_t)veorq_s8(v124.val[0], (int8x16_t)v53);
    v63 = vmovl_high_u8(v62);
    v64 = (int8x16_t)vmovl_high_u16(v63);
    v65 = vmovl_u8(*(uint8x8_t *)v62.i8);
    v66 = (int8x16_t)vmovl_high_u16(v65);
    v67 = (uint8x16_t)veorq_s8(v124.val[1], (int8x16_t)v53);
    v68 = vmovl_u8(*(uint8x8_t *)v67.i8);
    v69 = vmovl_high_u8(v67);
    v70 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v68.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v65.i8));
    v71 = vorrq_s8((int8x16_t)vshll_high_n_u16(v68, 8uLL), v66);
    v72 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v69.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v63.i8));
    v73 = vorrq_s8((int8x16_t)vshll_high_n_u16(v69, 8uLL), v64);
    v74 = (uint8x16_t)veorq_s8(v124.val[2], (int8x16_t)v53);
    _Q22 = (int8x16_t)vmovl_high_u8(v74);
    _Q21 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v74.i8);
    v77 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }
    v82 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }
    v124.val[0] = veorq_s8(v124.val[3], (int8x16_t)v53);
    v124.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v124.val[0].i8);
    v124.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v124.val[0]);
    v83 = (int32x4_t)vorrq_s8(vorrq_s8(v70, v77), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v124.val[1].i8), 0x18uLL));
    v124.val[1] = vorrq_s8(vorrq_s8(v71, _Q21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v124.val[1]), 0x18uLL));
    v84 = (int32x4_t)vorrq_s8(vorrq_s8(v72, v82), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v124.val[0].i8), 0x18uLL));
    v85 = (int32x4_t)vorrq_s8(vorrq_s8(v73, _Q22), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v124.val[0]), 0x18uLL));
    a43 = vaddq_s32(vsubq_s32(v84, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v84, v84), (int8x16_t)v57)), (int32x4_t)v55);
    a44 = vaddq_s32(vsubq_s32(v85, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v85, v85), (int8x16_t)v57)), (int32x4_t)v55);
    a41 = vaddq_s32(vsubq_s32(v83, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v83, v83), (int8x16_t)v57)), (int32x4_t)v55);
    a42 = vaddq_s32(vsubq_s32((int32x4_t)v124.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v124.val[1], (int32x4_t)v124.val[1]), (int8x16_t)v57)), (int32x4_t)v55);
    v86 = (HIDWORD(a31) ^ (v47 + (v61 ^ 0x3FF) - 490))
        + ((a33 ^ v47) & (a32 ^ 0xAEC4588A) | (a32 ^ v47) & (HIDWORD(a32) ^ v47))
        - 2059938322
        + *((_DWORD *)*(&off_1E709D0C0 + (int)v61 - 387) + v123 + v49 - 1)
        + (a41.i32[(*((_BYTE *)*(&off_1E709D0C0 + (int)(v61 ^ 0x235)) + v123 + v49 - 4) - 31)] ^ v50);
    v87 = v86 + v47 - (v48 & (2 * v86));
    v88 = (char *)*(&off_1E709D0C0 + (int)(v61 ^ 0x278)) - 4;
    v89 = (((v87 ^ v47) << (v88[v123 + v49] - 98)) | ((v87 ^ v47) >> (98 - v88[v123 + v49]))) + (a32 ^ v47);
    v90 = v48 & (2 * v89);
    v91 = v89 + v47 - v90;
    v92 = *(uint64_t (**)(char *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * (int)(v61 | 0xEA));
    return v92(v88, v61, v92, a33, v90, 1580584629, HIDWORD(a32), v91, a9, a10, a11, a12, a13, a14, v45, a16, __PAIR64__(a32, HIDWORD(a31)), __PAIR64__(a33, HIDWORD(a32)), v52,
             v123,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40);
  }
  else
  {
    HIDWORD(a31) = 2 * (HIDWORD(a31) ^ v47) + v47 - (v48 & (4 * (HIDWORD(a31) ^ v47)));
    LODWORD(a32) = 2 * (a32 ^ v47) + v47 - (v48 & (4 * (a32 ^ v47)));
    HIDWORD(a32) = 2 * (HIDWORD(a32) ^ v47) + v47 - (v48 & (4 * (HIDWORD(a32) ^ v47)));
    LODWORD(a33) = 2 * (a33 ^ v47) + v47 - (v48 & (4 * (a33 ^ v47)));
    return v52(v53, v54, v55, v56, v57);
  }
}

uint64_t sub_1B97F6844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  unsigned int v15;
  uint64_t v16;
  _BOOL4 v17;

  if (v15 < 0x9BE37C17 != (a15 + 1141814776) < 0x9BE37C17)
    v17 = (a15 + 1141814776) < 0x9BE37C17;
  else
    v17 = a15 + 1141814776 > v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((!v17 * (((a6 + a5 - 187) | 0x210) - 511)) ^ (a6 + a5 + 1100)))
                            - 8))();
}

uint64_t sub_1B97F68D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((1951 * (v5 - 152100823 + v6 - 60 + a5 + v6 - 820 >= (v5 + a4))) ^ v6))
                            - 4))();
}

uint64_t sub_1B97F6920(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * ((460
                                          * (a14
                                           + v15
                                           - (unint64_t)(v14 - 152100823 + a5 + a1 - 760 + 697) < 0x10)) ^ a1))
                            - 4))();
}

uint64_t sub_1B97F696C@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W5>, int a4@<W8>)
{
  char v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v6 + v8) = *(_BYTE *)(v10 + (v5 + a1))
                      - (v4 & (2 * *(_BYTE *)(v10 + (v5 + a1))))
                      + 50;
  return (*(uint64_t (**)(void))(v9 + 8 * (((v8 + 1 == (a4 ^ (a2 - 57)) + 7) * v7) ^ (a3 + a4 + 371))))();
}

uint64_t sub_1B97F69BC@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W5>, int a4@<W6>, int a5@<W7>, int a6@<W8>, int8x16_t a7@<Q0>, int8x16_t a8@<Q3>)
{
  int v8;
  int8x16_t *v9;
  uint64_t v10;
  uint64_t v11;
  int8x16_t v12;

  v12 = *(int8x16_t *)(v11 + v8 + (((a6 ^ (a2 - 3)) * a4) ^ (a1 - 9)));
  *v9 = vaddq_s8(vsubq_s8(v12, vandq_s8(vaddq_s8(v12, v12), a8)), a7);
  return (*(uint64_t (**)(void))(v10 + 8 * (a5 ^ (a3 + a6 + 393))))();
}

uint64_t sub_1B97F6A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  unsigned int v14;
  uint64_t v15;
  _BOOL4 v16;

  v16 = v13 + 1674314577 < (a13 + 1505040564);
  if ((a13 + 1505040564) < 0xBBA0C9B0 != (v13 + 1674314577) < 0xBBA0C9B0)
    v16 = (a13 + 1505040564) < 0xBBA0C9B0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * (int)((v16 | (2 * v16)) ^ v14)) - (v14 ^ 0x2B1)))();
}

uint64_t sub_1B97F6A90(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v39;

  v34 = (a2 - 113401905) & 0xB7FE76BF;
  v35 = 628203409 * ((~((v33 - 120) | 0xCC5631E2) + ((v33 - 120) & 0xCC5631E2)) ^ 0xB121C22E);
  v39 = (a2 + 415) | 0x10;
  *(_QWORD *)(v33 - 120) = a11;
  *(_DWORD *)(v33 - 112) = v35 + a2 + 1005;
  *(_DWORD *)(v33 - 108) = a13 - v35 - 1135465194;
  v36 = sub_1B97F4E54(v33 - 120);
  v37 = a32 & 0x3F;
  *(&a23 + (v37 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v32
                                                      + 8 * ((223 * ((v37 ^ 0x14) > v39 - 424)) ^ a2))
                                          - (v34 ^ 0xB13C16B3)))(v36);
}

uint64_t sub_1B97F6BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((44 * (((v6 == 63) ^ (v7 - a6)) & 1)) ^ v7))
                            - ((v7 + 202) ^ 0x2ADLL)))();
}

uint64_t sub_1B97F6BE0()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((27 * ((((v1 ^ 0x6B0) - 1006) ^ v0) < 8)) ^ v1)) - 4))();
}

uint64_t sub_1B97F6C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  int v23;
  unsigned int v24;
  char v25;
  uint64_t v26;

  *(_QWORD *)(&a23 + v24 + 1) = 0x3232323232323232;
  return ((uint64_t (*)(void))(*(_QWORD *)(v26 + 8 * ((342 * ((v25 & 0x38) == 8)) ^ v23))
                            - ((v23 - 570) ^ 0x1DBLL)))();
}

uint64_t sub_1B97F6C64(double a1)
{
  double *v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v1 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 0) * v4) ^ v2)) - (v3 ^ 0x1DB)))();
}

uint64_t sub_1B97F6C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (v6 ^ (877 * (v8 != v7))))
                            + 2973505203
                            - (v6 - a6)
                            + 8))();
}

void sub_1B97F6CC4()
{
  JUMPOUT(0x1B97F5D14);
}

uint64_t sub_1B97F6CD4@<X0>(int a1@<W0>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, char a18)
{
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  unsigned int v26;
  int v27;
  _BOOL4 v28;

  v25 = v18 < v20;
  *(&a18 + 12 * (v21 ^ 0x2BDu) + a3 + v22) = *(_BYTE *)(v24 + (v19 + a2))
                                           - ((2 * *(_BYTE *)(v24 + (v19 + a2))) & 0x64)
                                           + 50;
  v26 = v19 + 1 + a1;
  v27 = v25 ^ (v26 < v20);
  v28 = v26 < v18;
  if (!v27)
    v25 = v28;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((v25 | (2 * v25)) ^ v21)) - 8))();
}

uint64_t sub_1B97F6D50@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W8>)
{
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1039 * (a3 - 1370612763 < ((277 * (v4 ^ (a1 - 5))) ^ 0x551u))) ^ (a2 + v4 + 233)))
                            - 12))();
}

uint64_t sub_1B97F6D9C@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a1 - 1370612763;
  if ((unint64_t)(v4 + 1) > 0x38)
    v5 = v4 + 1;
  else
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)((((unint64_t)(v5 - v3 + 1370612763) > 7)
                                               * ((v1 + 1837422910) & 0x927B23FB ^ 0xB5)) | v1))
                            - 12))();
}

uint64_t sub_1B97F6E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  *(_QWORD *)(&a23 + v24 - 1370612763) = 0x3232323232323232;
  return ((uint64_t (*)(void))(*(_QWORD *)(v26
                                        + 8
                                        * ((863 * ((v23 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ ((v25 - 1837423955) | 0x29)))
                            - ((((v25 - 1837423955) | 0x29u) + 331) ^ 0x2C4)))();
}

uint64_t sub_1B97F6E78(double a1)
{
  int v1;
  uint64_t v2;
  double *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v3 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 0) * v4) ^ v1)) - (v2 ^ 0x2C4)))();
}

uint64_t sub_1B97F6EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v7 ^ (1953 * (v5 != v6))))
                            - ((a5 + ((v7 - 581) | 0x220u) - 675) ^ 0xB13C16B3)))();
}

void sub_1B97F6EE4()
{
  JUMPOUT(0x1B97F5D14);
}

uint64_t sub_1B97F7394@<X0>(uint64_t a1@<X2>, char a2@<W4>, char a3@<W5>, unsigned int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  int v35;
  _BOOL4 v36;

  v35 = *((_DWORD *)&a19 + ((v33 + v31) >> (a3 + a2 + v32 + 13 + 35)) + 18);
  *(_BYTE *)(a1 + (v33 + v31 + 1)) = (BYTE2(v35) ^ 0x3B) - ((2 * (BYTE2(v35) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a1 + (v33 + v31)) = (HIBYTE(v35) ^ 0x51) - ((2 * (HIBYTE(v35) ^ 0x51)) & 0x64) + 50;
  *(_BYTE *)(a1 + (v33 + v31 + 3)) = v35 ^ 0x47;
  *(_BYTE *)(a1 + (v33 + v31 + 2)) = (BYTE1(v35) ^ 0xA7) - ((2 * (BYTE1(v35) ^ 0xA7)) & 0x64) + 50;
  if (v33 + 1230102376 < a4 != a31 - 1338440525 < a4)
    v36 = a31 - 1338440525 < a4;
  else
    v36 = v33 + 1230102376 < (a31 - 1338440525);
  return ((uint64_t (*)(void))(*(_QWORD *)(v34 + 8 * ((496 * !v36) ^ v32)) - 8))();
}

void sub_1B97F7518()
{
  JUMPOUT(0x1B97F74DCLL);
}

uint64_t sub_1B97F7524()
{
  return 0;
}

void sub_1B97F7564(uint64_t a1)
{
  int v1;

  v1 = 1178560073 * ((-2 - ((a1 | 0xAE85A791) + (~(_DWORD)a1 | 0x517A586E))) ^ 0xEBEE200C);
  __asm { BR              X10 }
}

uint64_t sub_1B97F7600@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v2 != ((v1 + 1075) ^ 0x5A312C9E)) * (v1 - 253)) ^ (v1 + 363)))
                            - 4))();
}

uint64_t sub_1B97F7654@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((v1 + 939) ^ 0x26)) - 4))();
}

uint64_t sub_1B97F777C@<X0>(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * ((127 * (((v5 - 36) ^ (v4 == ((v5 + a1) & a2) + v3)) & 1)) ^ v5))
                            - 4))();
}

uint64_t sub_1B97F77B8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1465 * (v1 != 461 * (v2 ^ 0x29C) - 1383)) ^ v2)) - 4))();
}

uint64_t sub_1B97F77EC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_DWORD *)(*(_QWORD *)(v3 - 0xC7F991DE6408E15) + 4 * (v2 + v1)) = v4;
  v6 = v2 + v5 + 712 - 1382;
  *(_DWORD *)(v3 - 0xC7F991DE6408E19) = v6;
  v7 = v6 + v1;
  if (v6 + v1 < 0)
    v7 = -v7;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((69
                                * ((v7 ^ 0x3D7FACEB)
                                 + (((v5 + 712) ^ 0x7AFF5CB1) & (2 * v7))
                                 - 1031777824
                                 + ((((v5 + 712) ^ 0x5F2) + 123) | 0x24) >= 0)) ^ (v5 + 712) ^ 0x5F2)))();
}

uint64_t sub_1B97F78C4@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  _QWORD *v4;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * (int)(((*(_DWORD *)(*v4 + 4 * a1) == v2) * ((v3 + 1043585895) & 0xC1CC2537 ^ 0x4C6)) ^ v3)))();
}

uint64_t sub_1B97F7904@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(a1 + 8 * ((69 * (v2 - 1 + ((v1 + 123) | 0x24) >= 0)) ^ v1)))();
}

uint64_t sub_1B97F793C(uint64_t result)
{
  int v1;
  int v2;
  int v3;
  int *v4;
  int v5;
  int v6;

  if ((v1 + v2 - 1) >= 0x7FFFFFFF)
    v6 = -v3;
  else
    v6 = v5;
  *v4 = v6;
  *(_DWORD *)(result + 24) = 1261507126;
  return result;
}

void sub_1B97F7980(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = 1178560073 * ((-2 - ((a1 | 0x5A50E64C) + (~(_DWORD)a1 | 0xA5AF19B3))) ^ 0x1F3B61D1);
  v2 = *(_DWORD *)(a1 + 40) ^ v1;
  if (*(_QWORD *)(a1 + 48) | *(_QWORD *)(a1 + 64))
    v3 = *(_DWORD *)(a1 + 24) + v1 == 1354219139;
  else
    v3 = 1;
  v4 = !v3;
  __asm { BR              X9 }
}

uint64_t sub_1B97F7AD8@<X0>(int a1@<W8>)
{
  _QWORD *v1;
  uint64_t v2;
  BOOL v4;

  v4 = v1[1] == 0x1171F84DB0CF5C20 || (v1[7] | v1[4]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1402 * (((a1 + 56) ^ v4) & 1)) ^ a1)) - 8))();
}

uint64_t sub_1B97F7B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32)
{
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *(_QWORD *)(v35 + 72);
  *(_DWORD *)(v33 - 0x1171F84DB0CF5C20) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * ((2043 * (v37 != 0xC7F991DE6408E1DLL)) ^ v32)))(v37, 0x7542B2AE5773797, &a25, &a30, &a32, &a28, &a20, 0xC7F991DE6408E1DLL, a9, a10, v34);
}

uint64_t sub_1B97F7BCC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8 * (((a8 - 925) * (v10 == 0)) ^ (a8 - 363))) - ((a8 + 1873335829) & 0x905726BF ^ 0x86)))(a3 + a7, a1, a2, a3, a4, a5, a6, a7, a9, a10);
}

uint64_t sub_1B97F7D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;

  v27 = v18 ^ 0x6A4;
  v28 = ((v26 - 1956630864 - 2 * ((v26 - 144) & 0x8B602F40)) ^ 0x31F45722) * v19;
  *(_DWORD *)(v26 - 116) = v28 + v21 + (v18 ^ 0x9796BF8);
  *(_QWORD *)(v26 - 136) = v20;
  *(_QWORD *)(v26 - 128) = a1;
  *(_DWORD *)(v26 - 144) = v28 + v18 + 166;
  ((void (*)(uint64_t))(*(_QWORD *)(v22 + 8 * (v18 - 21)) - 12))(v26 - 144);
  *(_QWORD *)(v26 - 144) = v23;
  *(_QWORD *)(v26 - 136) = a16;
  *(_DWORD *)(v26 - 128) = (v27 - 44) ^ (628203409
                                       * ((((2 * (v26 - 144)) | 0x6174B83A) - (v26 - 144) + 1329964003) ^ 0x3232502E));
  ((void (*)(uint64_t))(*(_QWORD *)(v22 + 8 * (v27 - 1446)) - 12))(v26 - 144);
  *(_QWORD *)(v26 - 144) = a17;
  *(_QWORD *)(v26 - 136) = a16;
  *(_DWORD *)(v26 - 128) = v27
                         + 1374699841 * (((~(v26 - 144) & 0xF8095E0E) - (~(v26 - 144) | 0xF8095E0F)) ^ 0x95FD4606)
                         - 507;
  *(_QWORD *)(v26 - 112) = a15;
  *(_QWORD *)(v26 - 104) = v23;
  *(_QWORD *)(v26 - 120) = a18;
  v29 = (*(uint64_t (**)(uint64_t))(v22 + 8 * (v27 - 1361)))(v26 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v24
                                                      + 8
                                                      * (int)(((((v27 + 870714261) & 0xCC19EECB) - 135) * (v25 == 0)) | v27))
                                          - 4))(v29);
}

uint64_t sub_1B97F7F18()
{
  _DWORD *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  _DWORD *v10;

  v6 = 535753261 * (((((v5 - 144) | 0x615B03DC) ^ 0xFFFFFFFE) - (~(v5 - 144) | 0x9EA4FC23)) ^ 0x9450F20C);
  *(_DWORD *)(v5 - 144) = (v2 - 1439 + v1 - 510816560) ^ v6;
  *(_DWORD *)(v5 - 128) = v2 - 1439 - v6 + 289;
  *(_QWORD *)(v5 - 120) = v3;
  *(_QWORD *)(v5 - 136) = v8;
  result = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4 + 8 * (v2 - 1462)) - 8))(v5 - 144);
  *v10 = v9;
  *v0 = 1645153785;
  return result;
}

void sub_1B97F806C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 4) ^ (1755732067 * (((a1 | 0x83D72B3C) - (a1 & 0x83D72B3C)) ^ 0x5D1196E7));
  v2 = *(_QWORD *)(a1 + 8);
  v3[0] = v1 + 628203409 * (((v3 | 0xF56E3C19) + (~v3 | 0xA91C3E6)) ^ 0x77E6302B) - 501;
  v4 = v2;
  sub_1B97E4434((uint64_t)v3);
  __asm { BR              X9 }
}

uint64_t sub_1B97F81A4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v7;

  v5 = (((v4 ^ v3) >> 4) & 0xFFF6EF8 ^ 0x5AA4270) + (((v4 ^ v3) >> 5) ^ 0x6D2A9EC5) - 375855535;
  v7 = v5 > v1 + 1503173062 && v5 < v2 + 1503174093;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((948 * v7) ^ v1)) - (((v1 - 882) | 0xAu) ^ 0x92)))();
}

uint64_t sub_1B97F822C@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)((((v1 & 0x1F) != 8) * ((v2 + 1656200023) & 0x9D4866EF ^ 0x28F)) ^ v2))
                            - 8))();
}

uint64_t sub_1B97F8274@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(a1
                                                     + 8
                                                     * (((((v2 ^ 0x2B) + 325) ^ (v2 + 289))
                                                       * ((v1 + 1879029626) > 0x7FFFFFFE)) ^ v2))
                                         - 8))((((v2 ^ 0x2B) + 325) ^ (v2 + 289)) * ((v1 + 1879029626) > 0x7FFFFFFE));
}

void sub_1B97F82D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  char v6;
  int v7;
  int v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  int v18;

  v13 = v5 + 1879029627;
  v14 = *(_QWORD *)(v11 - 0xC7F991DE6408E15);
  v15 = (*(_DWORD *)(v14 + 4 * (v12 - 1)) ^ (a5 + v7 - 1030)) >> v6;
  v16 = 4 * v13;
  *(_DWORD *)(v14 + v16) = v15 + v7 - (v8 & (2 * v15));
  v17 = v18 - (*(_DWORD *)(*(_QWORD *)(v11 - 0xC7F991DE6408E15) + v16) == v7);
  if ((*v9 + v10) >= 0x7FFFFFFF)
    v17 = 318707904 - v17;
  *v9 = v17;
}

void sub_1B97F8594(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1B97F8608@<X0>(int a1@<W8>)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((2
                                          * (((a1 - 1206753083) ^ 0x7FFF75CFFFFAEFB9)
                                           - 0x7FFF75CF03D79510
                                           + ((2 * (a1 - 1206753083)) & 0x1FFF5DF72) == 4230175401)) | 0x14Cu))
                            - 8))();
}

uint64_t sub_1B97F869C()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v6 = *(unsigned __int8 *)(v4 + v3 - 0x2500E162B343AFF1) - *(unsigned __int8 *)(v1 + v3 - 0x2500E162B343AFF1);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5
                                                      + 8
                                                      * (((((((2 * v2) ^ 0x61E) - 1769999280) & (2 * v6)) + (v6 ^ v0) == v0)
                                                        * (v2 ^ 0x41C)) ^ v2))
                                          - 8))(4294925278);
}

uint64_t sub_1B97F8704()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = v1 < v0;
  if (v5 == v2 - 0x2500E161B7205547 < v0)
    v5 = v2 - 0x2500E161B7205547 < v1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (v3 ^ (2 * !v5))) - (v3 ^ 0x2E5u) + 929))();
}

uint64_t sub_1B97F876C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v1 ^ (1203 * (a1 == 1206753092))))
                                          - (((v1 ^ 0x251u) + 1267140013) ^ 0x4B8707ADLL)))(4294925278);
}

uint64_t sub_1B97F87C0()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1697
                                          * (((2 * (*v0 - 42)) & 0xEDBE4FCE) + ((*v0 - 42) ^ 0x76DF27E7) == 1994336231)) ^ v1))
                            - ((v1 - 38) | 0x25u)
                            + 491))();
}

uint64_t sub_1B97F8828()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1010
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0 + v3 - 1 - 503)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8878()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1360
                                          * ((((*(unsigned __int8 *)(v2 + 2) - 72) << (v3 + 9)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F88D8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2015
                                          * (((((v3 - 257) | 0x100) ^ (v1 - 405)) & (2
                                                                                   * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8928()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1473
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << (v3 + 9)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8974(int a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2026
                                          * (((((v3 - 115) | 0x72) ^ a1) & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v1) == v1)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F89C4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == v0)
                                          * (((v3 - 152) | 0x97) + 908)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8A10()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1901
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0 + v4 - 503)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8A5C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 4) ^ v0) == v0)
                                          * (((v3 - 4) | 3) ^ 0x383)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8AA8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 + 96) + 1428) = 527506314;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((*(_DWORD *)(a2 + 4) == v2) * (v3 - 333)) ^ (v3 - 165)))
                            - ((v3 - 2031810561) & 0x791AF7FF ^ 0x1FBLL)))();
}

uint64_t sub_1B97F8B0C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((11
                                          * ((v3 & (2 * (**(unsigned __int8 **)(a2 + 8) - 42)))
                                           + ((**(unsigned __int8 **)(a2 + 8) - 42) ^ v2) == v2)) ^ v4))
                            - ((v4 - 239) ^ 0x104)))();
}

uint64_t sub_1B97F8B54()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((907
                                          * ((((*(unsigned __int8 *)(v3 + 1) - 134) << (v2 ^ 0xF6)) & v1)
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8B98()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)
                                          * ((66 * (v2 ^ 0x1F3)) ^ 0x2E3)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8BE0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1925
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)) ^ v2))
                            - ((v2 + 1802593605) & 0x948E99CB ^ 0x104)))();
}

uint64_t sub_1B97F8C34()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)
                                          * (v2 + 1339)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8C6C()
{
  int v0;
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((1627
                                               * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                                + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == v0)) ^ v2))
                            - (v2 ^ 0x1FBLL)))();
}

uint64_t sub_1B97F8CB0(int a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1809
                                          * ((v2 & (2 * (*(unsigned __int8 *)(v4 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v4 + 6) - 1) ^ v1) == v1 + a1 - 264)) ^ v3))
                            - 12))();
}

uint64_t sub_1B97F8CF0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1896
                                          * (((v2 ^ 0xFF ^ (v1 - 264)) & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 7) - 1) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8D30()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((637
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 8) - 5)))
                                           + ((*(unsigned __int8 *)(v3 + 8) - 5) ^ v0) == v0
                                                                                        + ((v2 + 340298752) & 0xEBB7735B)
                                                                                        - 339)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8D88(int a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 527506318;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((*(_DWORD *)(a2 + 4) == v2) * (((a1 - 337) | 0x290) - 494)) | a1))
                            - 12))();
}

uint64_t sub_1B97F8DD8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((((v6 << (31 * (v4 ^ 1) - 22)) & v3) + (v6 ^ v2) != v2) * ((v4 ^ 0x101) + 22)) ^ v4))
                            - 12))();
}

uint64_t sub_1B97F8E2C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1370
                                          * (((v1 + ((v2 + 1269073064) & 0xB45B7B7F) - 319) & (2
                                                                                             * (*(unsigned __int8 *)(v3 + 1)
                                                                                              - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8E80()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((177
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)) ^ v2))
                            - (v2 + 40)
                            + 307))();
}

uint64_t sub_1B97F8EBC()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1410
                                          * (((v1 + v3 - 319) & (2 * (*(unsigned __int8 *)(v4 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v4 + 3) - 134) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8EF8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1878
                                          * ((((*(unsigned __int8 *)(v3 + 4) - 247) << (((v2 + 104) & 0xBF) - 62)) & v1)
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8F4C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((203
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == ((v2 + 40) ^ (v0 - 271)))) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8F8C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((828
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v4 + 6) + (v3 ^ 0xFFFFFEC0))))
                                           + ((*(unsigned __int8 *)(v4 + 6) + (v3 ^ 0xFFFFFEC0)) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F8FC8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1128
                                          * (((v1 + (v2 ^ 0x28) - 319) & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 7) - 1) ^ v0) == v0)) | v2))
                            - 12))();
}

uint64_t sub_1B97F900C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1792
                                          * ((((11 * (v2 ^ 0x10A)) ^ (v1 - 221)) & (2
                                                                                  * (*(unsigned __int8 *)(v3 + 8) - 11)))
                                           + ((*(unsigned __int8 *)(v3 + 8) - 11) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B97F9058@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  int v7;
  uint64_t v8;

  v5 = (v1 ^ 0x44) + 319;
  *(_DWORD *)(*(_QWORD *)(v3 + 96) + 1428) = 527506330;
  v6 = (v1 ^ 0x44) - 54;
  v7 = 1178560073 * ((2 * ((v4 - 120) & 0x128615B8) - (v4 - 120) - 310777277) ^ 0x57ED9221);
  *(_QWORD *)(v4 - 112) = v4 + 0x5C6940C6B1BC6F5ELL;
  *(_DWORD *)(v4 - 120) = (((v5 ^ 0x583) + 776745519) ^ (a1 - 1)) - v7;
  *(_DWORD *)(v4 - 104) = v5 - v7 + 1172344777;
  v8 = sub_1B97E0618(v4 - 120);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8
                                                     * ((1410
                                                       * (*(_DWORD *)v3
                                                        - 165236985
                                                        + ((*(_DWORD *)(v4 - 152) << (v6 ^ 0x1C)) & 0x7A ^ 0x28)
                                                        + (*(_DWORD *)(v4 - 152) & 0x3F ^ 0xA7ED9FA9) < 0xFFFFFFC0)) ^ v5)))(v8, 313836798);
}

uint64_t sub_1B97F9230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;

  v26 = v22 + 1477599300;
  if (v26 <= 0x40)
    v26 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v24
                                        + 8 * (a21 ^ (8 * (-v21 - v23 + ((a21 - 1020) ^ (a8 - 787)) + v26 > 0xE))))
                            + 1267140513
                            - (a21 ^ (v25 - 1777))))();
}

uint64_t sub_1B97F92B0(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;

  v13 = v9 + v8;
  v14 = v13 + a2;
  if ((v13 + a2) <= 0x40)
    v14 = a3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12
                                        + 8
                                        * (int)(((((a1 + 757975018) & 0xD2D235E5) - 167)
                                               * (a8 - v13 >= (v10 + a8 + v11 + v14))) ^ a1))
                            - (((a1 + 1207959791) | 0x38703A1u) ^ (unint64_t)(a6 + 8))))();
}

uint64_t sub_1B97F9328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  return (*(uint64_t (**)(void))(v15
                              + 8
                              * ((19
                                * (a13
                                 + v16
                                 - 220
                                 + (unint64_t)(v13 + ((v14 - 275302696) & 0x5BEFCFE7 ^ 0x139567E6u)) > 0xF)) ^ v14)))();
}

uint64_t sub_1B97F937C@<X0>(int a1@<W4>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  int8x16_t v8;
  int8x16_t v9;

  v8.i64[0] = 0x6464646464646464;
  v8.i64[1] = 0x6464646464646464;
  v9.i64[0] = 0x3232323232323232;
  v9.i64[1] = 0x3232323232323232;
  *(int8x16_t *)(v4 + a2 + ((a1 + v3 + 708) ^ (v2 + 787))) = vaddq_s8(vsubq_s8(*v7, vandq_s8(vaddq_s8(*v7, *v7), v8)), v9);
  return (*(uint64_t (**)(int8x16_t *))(v6
                                                + 8 * ((105 * (((v5 + 1) & 0x1FFFFFFF0) == 16)) ^ (a1 + v3 + 1588))))(v7 + 1);
}

void sub_1B97F93E8()
{
  JUMPOUT(0x1B97F93A0);
}

uint64_t sub_1B97F93F4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((((a2 - 763) | 4) ^ 0x6D6) * (v6 == v7)) ^ a2))
                            - ((a2 - a5 - 708) ^ (unint64_t)(a6 + 8))))();
}

uint64_t sub_1B97F9438@<X0>(int a1@<W4>, int a2@<W6>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  *(_BYTE *)(v8 - 220 + (((v5 - v9 + 30) ^ 0xFFFFFFE1) & (a3 + v3))) = *(_BYTE *)(v4 + v7 - 313836798)
                                                                                     - ((2
                                                                                       * *(_BYTE *)(v4 + v7 - 313836798)) & 0x64)
                                                                                     + 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((767 * ((a2 + a3 + 1) < 0x40)) ^ (a1 + v5 + 1420)))
                            - 12))();
}

uint64_t sub_1B97F94B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19, int a20,int a21,int a22,int a23,uint64_t (*a24)(_QWORD, __n128, __n128, __n128, __n128, __n128, __n128),int a25,int a26,uint64_t a27,uint64_t a28,int32x4_t a29,int32x4_t a30,int32x4_t a31,int32x4_t a32)
{
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t (*v42)(_QWORD, __n128, __n128, __n128, __n128, __n128, __n128);
  const char *v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint8x16_t v56;
  uint16x8_t v57;
  int8x16_t v58;
  uint16x8_t v59;
  int8x16_t v60;
  uint8x16_t v61;
  uint16x8_t v62;
  uint16x8_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16_t v67;
  uint8x16_t v68;
  int8x16_t v71;
  int8x16_t v76;
  int32x4_t v77;
  int32x4_t v78;
  uint8x16_t v80;
  uint16x8_t v81;
  uint16x8_t v82;
  uint8x16_t v83;
  uint8x16_t v88;
  uint16x8_t v89;
  uint16x8_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  _DWORD *v95;
  int v96;
  unsigned int v97;
  unint64_t v98;
  int8x16x4_t v99;
  int8x16x4_t v100;

  v42 = *(uint64_t (**)(_QWORD, __n128, __n128, __n128, __n128, __n128, __n128))(v33 + 8 * v32);
  a19 = a13 - 1361199332;
  a18 = ((v32 + 184812002) | v37) ^ 0x5B4E77BD;
  v43 = (const char *)(v40 - 220);
  v44 = (__n128)vdupq_n_s32(0x620F0DFFu);
  v45.n128_u64[0] = 0x3232323232323232;
  v45.n128_u64[1] = 0x3232323232323232;
  v46 = (__n128)vdupq_n_s32(0x620F0DF9u);
  a27 = v36 - 16;
  v47.n128_u64[0] = 0x6464646464646464;
  v47.n128_u64[1] = 0x6464646464646464;
  v48.n128_u64[0] = 0x3333333333333333;
  v48.n128_u64[1] = 0x3333333333333333;
  v49 = (__n128)vdupq_n_s32(0xC41E1BF2);
  v50 = (v41 + 1997669178) & 0x3D66F774;
  a25 = v50 ^ 0x239;
  a26 = v35 - 374;
  v51 = *(_DWORD *)(v40 - 148);
  v52 = *(_DWORD *)(v40 - 144);
  v54 = *(_DWORD *)(v40 - 140);
  v53 = *(_DWORD *)(v40 - 136);
  v55 = *(_BYTE *)(v40 - 124) ^ 0x5F;
  a17 = *(unsigned __int8 *)(v40 - 124) ^ 0x5F;
  if (v55 == 2)
  {
    a20 = v51;
    a21 = v52;
    a22 = v54;
    a23 = v53;
    a24 = v42;
    v100 = vld4q_s8(v43);
    a16 = *(_DWORD *)(v40 - 132);
    v80 = (uint8x16_t)veorq_s8(v100.val[0], (int8x16_t)v45);
    v81 = vmovl_u8(*(uint8x8_t *)v80.i8);
    v82 = vmovl_high_u8(v80);
    v83 = (uint8x16_t)veorq_s8(v100.val[1], (int8x16_t)v45);
    _Q23 = vmovl_u8(*(uint8x8_t *)v83.i8);
    _Q22 = vmovl_high_u8(v83);
    __asm
    {
      SHLL2           V24.4S, V22.8H, #0x10
      SHLL2           V25.4S, V23.8H, #0x10
    }
    v88 = (uint8x16_t)veorq_s8(v100.val[2], (int8x16_t)v45);
    v89 = vmovl_high_u8(v88);
    v90 = vmovl_u8(*(uint8x8_t *)v88.i8);
    v100.val[0] = veorq_s8(v100.val[3], (int8x16_t)v45);
    v100.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v100.val[0]);
    v100.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[1]);
    v100.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v100.val[1].i8);
    v100.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v100.val[0].i8);
    v100.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[0]);
    v100.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v100.val[0].i8);
    v91 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q23.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v90.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v81.i8), 0x18uLL)), v100.val[0]);
    v92 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q25, (int8x16_t)vshll_high_n_u16(v90, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v81), 0x18uLL)), v100.val[3]);
    v93 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v89.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v82.i8), 0x18uLL)), v100.val[1]);
    v94 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v89, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v82), 0x18uLL)), v100.val[2]);
    v100.val[0] = veorq_s8(vandq_s8((int8x16_t)v91, (int8x16_t)v44), (int8x16_t)(*(_OWORD *)v100.val & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v100.val[3] = veorq_s8(vandq_s8((int8x16_t)v92, (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v100.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v100.val[1] = veorq_s8(vandq_s8((int8x16_t)v93, (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v100.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v100.val[2] = veorq_s8(vandq_s8((int8x16_t)v94, (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v100.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    a31 = vaddq_s32(vsubq_s32(v93, vaddq_s32((int32x4_t)v100.val[1], (int32x4_t)v100.val[1])), (int32x4_t)v46);
    a32 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v100.val[2], (int32x4_t)v100.val[2])), (int32x4_t)v46);
    a29 = vaddq_s32(vsubq_s32(v91, vaddq_s32((int32x4_t)v100.val[0], (int32x4_t)v100.val[0])), (int32x4_t)v46);
    a30 = vaddq_s32(vsubq_s32(v92, vaddq_s32((int32x4_t)v100.val[3], (int32x4_t)v100.val[3])), (int32x4_t)v46);
    v95 = (_DWORD *)&a29 + v39 + 1485875768;
    v96 = *(v95 - 8) ^ *(v95 - 3);
    v97 = *(v95 - 16) ^ *(v95 - 14) ^ (v96 + v34 - ((2 * v96) & 0xC41E1BF2));
    HIDWORD(v98) = v97 ^ v34;
    LODWORD(v98) = v97;
    *v95 = (v98 >> 31) + v34 - ((2 * (v98 >> 31)) & 0xC41E1BF2);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v33
                                                        + 8
                                                        * (((4 * (v36 != 1485875705)) | (16 * (v36 != 1485875705))) ^ (a5 + v41 + 950)))
                                            - 8))(150);
  }
  else if (v55 == 1)
  {
    a20 = v51;
    a21 = v52;
    a22 = v54;
    a23 = v53;
    a24 = v42;
    v99 = vld4q_s8(v43);
    v56 = (uint8x16_t)veorq_s8(v99.val[0], (int8x16_t)v45);
    v57 = vmovl_high_u8(v56);
    v58 = (int8x16_t)vmovl_high_u16(v57);
    v59 = vmovl_u8(*(uint8x8_t *)v56.i8);
    v60 = (int8x16_t)vmovl_high_u16(v59);
    v61 = (uint8x16_t)veorq_s8(v99.val[1], (int8x16_t)v45);
    v62 = vmovl_u8(*(uint8x8_t *)v61.i8);
    v63 = vmovl_high_u8(v61);
    v64 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v59.i8));
    v65 = vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v60);
    v66 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8));
    v67 = vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v58);
    v68 = (uint8x16_t)veorq_s8(v99.val[2], (int8x16_t)v45);
    _Q23 = (int8x16_t)vmovl_high_u8(v68);
    _Q22 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v68.i8);
    v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }
    v76 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q23.i8, 0x10uLL);
    __asm { SHLL2           V23.4S, V23.8H, #0x10 }
    v99.val[0] = veorq_s8(v99.val[3], (int8x16_t)v45);
    v99.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v99.val[0].i8);
    v99.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v99.val[0]);
    v77 = (int32x4_t)vorrq_s8(vorrq_s8(v64, v71), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v99.val[1].i8), 0x18uLL));
    v99.val[1] = vorrq_s8(vorrq_s8(v65, _Q22), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v99.val[1]), 0x18uLL));
    v78 = (int32x4_t)vorrq_s8(vorrq_s8(v66, v76), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v99.val[0].i8), 0x18uLL));
    v99.val[0] = vorrq_s8(vorrq_s8(v67, _Q23), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v99.val[0]), 0x18uLL));
    a31 = vaddq_s32(vsubq_s32(v78, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v78, v78), (int8x16_t)v49)), (int32x4_t)v46);
    a32 = vaddq_s32(vsubq_s32((int32x4_t)v99.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v99.val[0], (int32x4_t)v99.val[0]), (int8x16_t)v49)), (int32x4_t)v46);
    a29 = vaddq_s32(vsubq_s32(v77, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v77, v77), (int8x16_t)v49)), (int32x4_t)v46);
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v99.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v99.val[1], (int32x4_t)v99.val[1]), (int8x16_t)v49)), (int32x4_t)v46);
    return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(v33
                                                                + 8 * ((1059 * (a27 + 1 == v36)) ^ v50))
                                                    - 12))(150, v44);
  }
  else
  {
    *(_DWORD *)(v40 - 148) = 2 * (v51 ^ v35) + v35 - (v38 & (4 * (v51 ^ v35)));
    *(_DWORD *)(v40 - 144) = 2 * (v52 ^ v35) + v35 - (v38 & (4 * (v52 ^ v35)));
    *(_DWORD *)(v40 - 140) = 2 * (v54 ^ v35) + v35 - (v38 & (4 * (v54 ^ v35)));
    *(_DWORD *)(v40 - 136) = 2 * (v53 ^ v35) + v35 - (v38 & (4 * (v53 ^ v35)));
    return v42(150, v44, v45, v46, v47, v48, v49);
  }
}

uint64_t sub_1B97FA04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, unsigned int a17)
{
  uint64_t v17;
  int v18;
  _BOOL4 v19;

  if (a17 < a16 != (a14 - 32199846) < 0x10C97018)
    v19 = (a14 - 32199846) < 0x10C97018;
  else
    v19 = a14 - 32199846 > a17;
  return (*(uint64_t (**)(void))(v17
                              + 8 * ((!v19 * (((95 * (v18 ^ (v18 + 1)) - 219) | 0x680) ^ 0x6F1)) ^ (a5 + v18 + 577))))();
}

uint64_t sub_1B97FA0E8(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((((v4 + 1208417726) | 0x3800325) ^ (v6 - 32))
                                          * (a2 + a4 + 63 >= (a2 + a4))) | v4))
                            - 4))();
}

uint64_t sub_1B97FA134(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15
                                        + 8
                                        * ((477
                                          * (a13
                                           + v13
                                           - (unint64_t)(a2
                                                              + (v14 ^ (v16 - 1598))
                                                              + ((v14 - 71884507) & 0x4FCFDFBDu)
                                                              + 1446849464) > 0xF)) ^ v14))
                            - 4))();
}

uint64_t sub_1B97FA198(double a1, double a2, double a3, int8x16_t a4, int8x16_t a5, uint64_t a6, int a7, uint64_t a8, int a9, int a10)
{
  int8x16_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *v10 = vaddq_s8(vaddq_s8(*(int8x16_t *)(v13 + (a7 + a9)), a5), vmvnq_s8(vandq_s8(vaddq_s8(*(int8x16_t *)(v13 + (a7 + a9)), *(int8x16_t *)(v13 + (a7 + a9))), a4)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (a10 + v11 + 269)) - 8))();
}

uint64_t sub_1B97FA1FC@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, uint64_t a5@<X8>)
{
  int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  *(_BYTE *)(v6 + a5) = *(_BYTE *)(v9 + (a2 + a3))
                      + (v7 | ~(2 * *(_BYTE *)(v9 + (a2 + a3))))
                      + 51;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * (((a5 + (v5 - v10 + 60) != 123) * a1) ^ (a4 + v5 + 1309)))
                            - 8))();
}

uint64_t sub_1B97FA250(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  int v14;
  _BOOL4 v15;

  v15 = a2 + 1583058440 < (a13 + 254059018);
  if ((a13 + 254059018) < 0x71105306 != (a2 + 1583058440) < 0x71105306)
    v15 = (a13 + 254059018) < 0x71105306;
  return (*(uint64_t (**)(void))(v13 + 8 * (int)((v15 * (((v14 + 220361917) & 0xF2DD8B2F) - 214)) ^ v14)))();
}

uint64_t sub_1B97FA2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v16 = 628203409 * ((((v15 - 120) | 0x96D41AAA) - ((v15 - 120) & 0x96D41AAA)) ^ 0x145C1699);
  *(_QWORD *)(v15 - 120) = a10;
  *(_DWORD *)(v15 - 112) = v16 + v14 + 787;
  *(_DWORD *)(v15 - 108) = a13 - v16 + ((v14 - a5 - 185) ^ 0xF7D52AB3);
  v17 = sub_1B97F4E54(v15 - 120);
  v18 = *(_DWORD *)(v15 - 152) & 0x3F;
  *(_BYTE *)(v15 - 220 + (v18 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13
                                                      + 8
                                                      * ((38
                                                        * ((v18 ^ 0x14) > ((v14 + 918) | 0x215u) - 1662)) ^ v14))
                                          - 4))(v17);
}

uint64_t sub_1B97FA3C4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3
                                                               + 8
                                                               * (((((v1 == 63) ^ (v2 - 116)) & 1)
                                                                 * ((v2 ^ 0x18) - 1252)) ^ v2))
                                                   - 4))(a1, -560347418);
}

uint64_t sub_1B97FA3FC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (396 * ((v0 ^ 0x2Bu) > 7))))
                            - ((v1 + 1809836352) & 0xDFA717B7)
                            - ((v1 + 8585172) | 0x4B040124u)
                            + 2534281030))();
}

uint64_t sub_1B97FA460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v9 - 220 + v5 + 1) = 0x3232323232323232;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8
                                                      + 8
                                                      * (int)((((v6 & 0x38) == 8)
                                                             * ((v7 - 189157558) & 0xBFBF4FBD ^ 0x756)) ^ (a5 + v7 + 1558)))
                                          - 12))(1267140513);
}

void sub_1B97FA4CC()
{
  JUMPOUT(0x1B97FA4A4);
}

uint64_t sub_1B97FA4D4@<X0>(int a1@<W1>, int a2@<W3>, int a3@<W8>)
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _BOOL4 v10;
  unsigned int v11;
  int v12;
  _BOOL4 v13;

  v10 = v3 < v4;
  *(_BYTE *)(v9 - 220 + (a3 - 98667421)) = *(_BYTE *)(v7 + (a1 + a2))
                                                       + (v8 ^ 0x2F)
                                                       - ((2 * *(_BYTE *)(v7 + (a1 + a2))) & 0x64);
  v11 = a1 + 1 + v5;
  v12 = v10 ^ (v11 < v4);
  v13 = v11 < v3;
  if (!v12)
    v10 = v13;
  return (*(uint64_t (**)(void))(v6 + 8 * ((52 * v10) ^ v8)))();
}

uint64_t sub_1B97FA554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W4>, int a4@<W8>)
{
  uint64_t v4;
  int v5;
  int v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * ((195
                                                                          * (a4 + ((48 * (v5 ^ (v6 + 8))) ^ 0xDE99C766) < 0x38)) ^ (v5 + a3)))
                                                            - 4))(a1, a2, -560347418);
}

uint64_t sub_1B97FA5A0@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unint64_t v3;

  v3 = a1 - 1827487934 + ((v1 + 1804562031) & 0xDFF797B5);
  if (v3 <= 0x38)
    v3 = 56;
  return (*(uint64_t (**)(void))(v2 + 8
                                   * ((1762 * (v3 - a1 + ((v1 + 1337421373) & 0xFBCF97E7) - 706793099 > 7)) ^ v1)))();
}

uint64_t sub_1B97FA620@<X0>(uint64_t a1@<X2>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 220 + a3 + a1) = 0x3232323232323232;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((824
                                          * (((v3 - 1963967430) & 0x2988BD7D ^ 0x155) == (v4 & 0xFFFFFFFFFFFFFFF8))) ^ (a2 + v3 + 1312)))
                            - 12))();
}

uint64_t sub_1B97FA690()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  char v4;

  return (*(uint64_t (**)(void))(v3 + 8 * ((221 * (((v0 == v1) ^ (v4 + v2 - 93)) & 1)) ^ v2)))();
}

void sub_1B97FA6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  char v6;
  int v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;

  v7 = *(unsigned __int8 *)(v5 - 124) ^ 0x5F;
  if (v7 == 1)
  {
    v14 = *(_DWORD *)(v5 - 156);
    v13 = *(_DWORD *)(v5 - 152);
    *(_BYTE *)(v5 - 164) = ((8 * v13) ^ 0xA0) - ((2 * ((8 * v13) ^ 0xA0)) & 0x60) + 50;
    *(_BYTE *)(v5 - 163) = ((v13 >> 5) ^ (a5 + v6 - 95))
                         - 2 * (((v13 >> 5) ^ (a5 + v6 - 95)) & 0x33 ^ ((v13 & 0x20) != 0))
                         + 50;
    v11 = 100;
    *(_BYTE *)(v5 - 162) = ((v13 >> 13) ^ 0x8F) - ((2 * ((v13 >> 13) ^ 0x8F)) & 0x64) + 50;
    HIDWORD(v15) = v14 ^ 0xA;
    LODWORD(v15) = v13 ^ 0x60000000;
    *(_BYTE *)(v5 - 161) = ((v13 >> 21) ^ 0x39) - ((2 * ((v13 >> 21) ^ 0x39)) & 0x64) + 50;
    *(_BYTE *)(v5 - 160) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v5 - 159) = ((v14 >> 5) ^ 0xA) - 2 * (((v14 >> 5) ^ 0xA) & 0x37 ^ (v14 >> 5) & 5) + 50;
    *(_BYTE *)(v5 - 158) = ((v14 >> 13) ^ 0xA4) - ((2 * ((v14 >> 13) ^ 0xA4)) & 0x64) + 50;
    v8 = a5 + v6 + 5;
    v12 = (v14 >> 21) ^ 0xFFFFFFBE;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_6;
    v8 = -34 * (v6 ^ (v6 - 5));
    v9 = *(_DWORD *)(v5 - 156);
    v12 = *(_DWORD *)(v5 - 152);
    *(_BYTE *)(v5 - 164) = (v8 ^ (v9 >> 21) ^ 0xE8)
                         - 2 * ((v8 ^ (v9 >> 21) ^ 0xE8) & 0x33 ^ ((v9 & 0x200000) != 0))
                         + 50;
    *(_BYTE *)(v5 - 163) = ((v9 >> 13) ^ 0xA4) - 2 * (((v9 >> 13) ^ 0xA4) & 0x3A ^ (v9 >> 13) & 8) + 50;
    *(_BYTE *)(v5 - 162) = ((v9 >> 5) ^ 0xA) + (~(2 * ((v9 >> 5) ^ 0xA)) | 0x9B) + 51;
    HIDWORD(v10) = v9 ^ 0xA;
    LODWORD(v10) = v12 ^ 0x60000000;
    *(_BYTE *)(v5 - 161) = (v10 >> 29) - ((2 * (v10 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v5 - 160) = ((v12 >> 21) ^ 0x39) - 2 * (((v12 >> 21) ^ 0x39) & 0x36 ^ (v12 >> 21) & 4) + 50;
    *(_BYTE *)(v5 - 159) = ((v12 >> 13) ^ 0x8F) - ((2 * ((v12 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v5 - 158) = ((v12 >> 5) ^ 0xF2) - ((2 * ((v12 >> 5) ^ 0xF2)) & 0x64) + 50;
    v11 = 96;
    LOBYTE(v12) = (8 * v12) ^ 0xA0;
  }
  *(_BYTE *)(v5 - 157) = v12 - (v11 & (2 * v12)) + ((v8 + 105) & 0xE5 ^ 0x97);
LABEL_6:
  JUMPOUT(0x1B97F94C0);
}

uint64_t sub_1B97FAADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v5 ^ ((8 * (v7 == v6)) | (16 * (v7 == v6)))))
                            + a1
                            - (((v5 - 1645) | 1u)
                             - a5
                             + 16)))();
}

void sub_1B97FAB14()
{
  JUMPOUT(0x1B97F94C0);
}

uint64_t sub_1B97FAB28@<X0>(uint64_t a1@<X1>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  *(_BYTE *)(v5 - 220 + a3 + a1) = 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1565
                                          * ((((unint64_t)(a3 + 1 + a1) < 0x40) ^ (13 * (v3 ^ (v6 - 5)))) & 1)) ^ (a2 + v3 + 87)))
                            - 4))();
}

uint64_t sub_1B97FABD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  _BOOL4 v13;
  _BOOL4 v14;

  v10 = v7 - 1734423542 + ((v5 + 1115685440) | 0x9070300);
  v11 = *(_DWORD *)(v9 - 220 + (v10 & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a3 + v10) = (HIBYTE(v11) ^ 0x51) - ((2 * (HIBYTE(v11) ^ 0x51)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3)) = (BYTE2(v11) ^ 0x3B) - ((2 * (BYTE2(v11) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3 + 1)) = (BYTE1(v11) ^ 0xA7) - ((2 * (BYTE1(v11) ^ 0xA7)) & 0x64) + 50;
  *(_BYTE *)(a3 + (v7 + v3 + 2)) = v11 ^ 0x47;
  v12 = *(_DWORD *)(v9 - 128) + 364390470;
  v13 = v12 < v4;
  v14 = v7 + 267092298 < v12;
  if (v7 + 267092298 < v4 != v13)
    v14 = v13;
  return (*(uint64_t (**)(void))(v8 + 8 * ((v14 * v6) ^ v5)))();
}

void sub_1B97FAD78()
{
  JUMPOUT(0x1B97FAD38);
}

void sub_1B97FADBC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v7[2];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((2 * (a1 & 0x5E99CC2A) - a1 - 1587137579) ^ 0xAB923DFA);
  v2 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0xC7F991DE6408E19) - 159353952 >= 0)
    v4 = *(_DWORD *)(*(_QWORD *)a1 - 0xC7F991DE6408E19) - 159353952;
  else
    v4 = 159353952 - *(_DWORD *)(*(_QWORD *)a1 - 0xC7F991DE6408E19);
  v3 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)(v3 - 0xC7F991DE6408E19) - 159353952 >= 0)
    v5 = *(_DWORD *)(v3 - 0xC7F991DE6408E19) - 159353952;
  else
    v5 = 159353952 - *(_DWORD *)(v3 - 0xC7F991DE6408E19);
  v7[1] = (460628867 * (((v7 | 0xE042447A) - (v7 & 0xE042447A)) ^ 0xACD4C607)) ^ (v1 + 693);
  v8 = v2;
  sub_1B98032C4((uint64_t)v7);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  __asm { BR              X14 }
}

uint64_t sub_1B97FAF50@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;

  v11 = v9 - 27;
  v12 = (2 * (v9 - 27)) ^ 0x596;
  v13 = v3 > 0x34F7BADB;
  v14 = 4 * (v6 + v4);
  v15 = v7
      + 966000769
      + (*(_DWORD *)(*(_QWORD *)(v10 - 0xC7F991DE6408E15) + v14) ^ (v8 + v12 - 1394))
      + (*(_DWORD *)(*(_QWORD *)(a2 - 0xC7F991DE6408E15) + v14) ^ v8);
  *(_DWORD *)(*(_QWORD *)(a1 - 0xC7F991DE6408E15) + v14) = v15 + v8 - (v5 & (2 * v15));
  if (v13 == v6 - 619284429 < -888650460)
    v13 = v6 - 619284429 < (int)(v3 + 1258833188);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((255 * !v13) ^ v11)) - 12))();
}

uint64_t sub_1B97FB080()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v5 = v3 - 2010637295 > 2014963970 || v3 - 2010637295 < v2 - 132519677;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((212 * v5) ^ v1)) - ((v1 - 152439432) & 0x91605FF) + 230))();
}

uint64_t sub_1B97FB0E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  _BOOL4 v18;

  v13 = v3 - 1253;
  v14 = 4 * (v9 + v7);
  v15 = v2 + v10 + (*(_DWORD *)(*(_QWORD *)(v12 - 0xC7F991DE6408E15) + v14) ^ (v11 + v13 + 93 - 234));
  *(_DWORD *)(*(_QWORD *)(a1 - 0xC7F991DE6408E15) + v14) = v15 + v11 - (v8 & (2 * v15));
  v16 = v9 + 1 + v4;
  v18 = v16 > v5 || v16 < v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((233 * v18) ^ (v13 + 1253))) - 4))();
}

uint64_t sub_1B97FB1A8()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v5 = v2 + 1086776997 > 817410966 || v2 + 1086776997 < v3 - 1330072681;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v5 * ((v1 + 2) ^ 0x66 ^ (5 * (v1 ^ 0x1F1)))) ^ v1)) - 12))();
}

uint64_t sub_1B97FB204@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  _BOOL4 v17;

  v13 = 4 * (v10 + v8);
  v14 = v3 + v11 + (*(_DWORD *)(*(_QWORD *)(a2 - 0xC7F991DE6408E15) + v13) ^ v12);
  *(_DWORD *)(*(_QWORD *)(a1 - 0xC7F991DE6408E15) + v13) = v14 + v12 - ((v14 << ((v7 ^ 6) + 23)) & v9);
  v15 = v10 + 1 + v4;
  v17 = v15 > v5 || v15 < v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((2 * v17) | (4 * v17)) ^ v7 ^ 6)) - 12))();
}

uint64_t sub_1B97FB2CC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((85 * (v1 == ((v2 + 75) ^ 0x49CCCEB039940553))) ^ v2))
                            - (v2 ^ 0x50Au)
                            + 133))();
}

void sub_1B97FB314(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0xC7F991DE6408E19) = (((v3 + v2) * (v1 - 1901766679)) ^ 0x2D7FCE79)
                                        - 603996697
                                        + ((2 * (v3 + v2) * (v1 - 1901766679)) & 0x5AFF9CF2);
}

void sub_1B97FB3F4(uint64_t a1)
{
  int v1;

  v1 = 1178560073 * ((-2 - ((a1 | 0x20C3A6CC) + (~(_DWORD)a1 | 0xDF3C5933))) ^ 0x65A82151);
  __asm { BR              X9 }
}

uint64_t sub_1B97FB4A8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1696 * (v2 != (v1 ^ 0x7D6) + 100575459)) ^ v1)) - 8))();
}

uint64_t sub_1B97FB4FC@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((59 * (v1 ^ 0xC3)) ^ 0x36)) - 4))();
}

uint64_t sub_1B97FB624@<X0>(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((v4 == ((v5 + 702) ^ a1 ^ (v3 + 731))) * a2) ^ v5)) - 8))();
}

uint64_t sub_1B97FB650@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((((v2 + 214) ^ 0x74) * (v1 != 0)) ^ v2)) - 8))();
}

uint64_t sub_1B97FB678@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v6 = v3 + v2;
  v7 = (v5 ^ 0x389) + v3;
  *(_DWORD *)(*(_QWORD *)(v4 - 0xC7F991DE6408E15) + 4 * v6) = a1;
  *(_DWORD *)(v4 - 0xC7F991DE6408E19) = v7;
  v8 = v7 + v2;
  if (v7 + v2 < 0)
    v8 = -v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (int)(((v5 ^ 0x7D6) + 1808758879) & 0x943083EF ^ (((int)((v8 ^ 0xBDFFAD62)
                                                                                                 + ((v8 << ((((v5 ^ 0xD6) + 95) & 0xEF) + 84)) & 0x7BFF5AC4)
                                                                                                 + 1107317405) > (int)(((((v5 ^ 0x7D6) + 1808758879) & 0x943083EF) - 802879662) & 0x2FDAF8FD ^ 0xFFFFFF02)) << 6)))
                            - 8))();
}

uint64_t sub_1B97FB774@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  _QWORD *v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((*(_DWORD *)(*v3 + 4 * v4) == v1) * ((v2 - 15499184) & 0xEC7FFF ^ 0x40E)) ^ v2))
                            - 8))();
}

uint64_t sub_1B97FB7B8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (v1 ^ ((v2 - 1 > (int)((v1 - 802879662) & 0x2FDAF8FD ^ 0xFFFFFF02)) << 6)))
                            - 8))();
}

_DWORD *sub_1B97FB7FC(_DWORD *result)
{
  int v1;
  int v2;
  int v3;
  int *v4;
  int v5;
  int v6;

  if ((v1 + v2 - 1) >= 0x7FFFFFFF)
    v6 = -v3;
  else
    v6 = v5;
  *v4 = v6;
  *result = 85258470;
  return result;
}

uint64_t sub_1B97FB840(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unsigned __int8 v4;
  char *v5;
  int v6;
  char v8;

  v2 = qword_1EF22FD70 - qword_1EF22FDE0 - (_QWORD)&v8;
  qword_1EF22FDE0 = 536075833 * v2 + 0x793AB71194CDC804;
  qword_1EF22FD70 = 536075833 * (v2 ^ 0x86C548EE6B3237FCLL);
  v3 = *(_DWORD *)(a2 + 4);
  v4 = 57 * ((qword_1EF22FD70 + 57 * v2 + 4) ^ 0xFC);
  v5 = (char *)*(&off_1E709D0C0 + (v4 ^ byte_1B9826F00[byte_1B9822EB0[v4] ^ 0x84]) - 54) - 8;
  if (v3 == 1206753086)
    __asm { BR              X17 }
  if (v3 == 1206753093)
  {
    v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X1 }
  }
  return 4294925278;
}

void sub_1B97FBF04(unint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  _QWORD *v7;
  char *v8;
  unsigned int v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t v21;
  _QWORD *v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  uint64_t v26;
  unint64_t *v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  int v31;
  char v32;
  char v33;
  char v34;
  char v35;
  unsigned int v37;
  unint64_t *v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 44) - 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v3 = *(_DWORD *)(a1 + 16) + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v4 = 1178560073 * ((1588112264 - (&v37 | 0x5EA8AB88) + (&v37 | 0xA1575477)) ^ 0x1BC32C15);
  v5 = *(_DWORD *)(a1 + 36);
  v21 = 1755732067
      * (((a1 | 0xDEEEE61CC66703ELL) - (a1 | 0xF211119E33998FC1) - 0xDEEEE61CC66703FLL) ^ 0xD045495E12A0CDE5);
  v6 = v5 + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v39 = v2 - v4 + 1172345356;
  v37 = 1076023948 - v4;
  v27 = &STACK[0x5C6940C6B1BC7306];
  v38 = &STACK[0x5C6940C6B1BC7306];
  sub_1B97E0618((uint64_t)&v37);
  v7 = (_QWORD *)a1;
  v8 = (char *)*(&off_1E709D0C0 + (int)(v2 - 37)) - 8;
  v20 = ((v2 + 177) | 0x4E8) + v6 + 206677213;
  v19 = 1484105499;
  v18 = v6 - 857971597;
  v12 = v6 + 1138537797;
  v11 = v6 - 770055748;
  v10 = (char *)&v10 - 250415509;
  v17 = 143 * (v2 ^ 0x46);
  v16 = v17 ^ 0x5875A21C;
  v13 = (v2 - 1913092366) & 0x72077DBF;
  v15 = v13 ^ 0x52C;
  v31 = v2 ^ 0x6F;
  v30 = v2 ^ 0x22;
  v14 = v2 ^ 0x22;
  v29 = v14;
  v28 = v2;
  v24 = vdupq_n_s32(0x620F0DF9u);
  v25 = vdupq_n_s32(0x620F0DFFu);
  v23 = vdupq_n_s32(0xC41E1BF2);
  v22 = v7;
  v26 = *v7;
  v9 = v3
     - (((v3 << (((((v2 - 79) | 0xE8) + 48) | 0xE0) ^ 0x52 ^ (((v2 - 79) | 0xE8) + 3) & 0xBF)) + 655359252) & 0x989A21DE)
     - 539684999;
  v32 = (HIBYTE(v9) ^ 0x4C) - ((v9 >> 23) & 0x64) + 50;
  v33 = (BYTE2(v9) ^ 0x4D) - ((v9 >> 15) & 0x64) + 50;
  v34 = (BYTE1(v9) ^ 0x10) - ((2 * (BYTE1(v9) ^ 0x10)) & 0x64) + 50;
  v35 = (v3
       - ((((_BYTE)v3 << (((((v2 - 79) | 0xE8) + 48) | 0xE0) ^ 0x52 ^ (((v2 - 79) | 0xE8) + 3) & 0xBF)) + 20) & 0xDE)
       + 121) ^ 0xDD;
  __asm { BR              X15 }
}

uint64_t sub_1B97FC308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  char v21;
  int v22;
  uint64_t v23;

  *(_BYTE *)(a4 + (v22 + v20 - 921 - 352)) = v21;
  *(_BYTE *)(a4 + (a9 - 1862623871)) = *(_BYTE *)(a6 + 1);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8 * ((1627 * ((((v20 - 1194) | 1) ^ 0x4Bu) > 2)) ^ (v20 - 921))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_1B97FD6A8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, int a3@<W8>)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + (a3 - 1862623870)) = *(_BYTE *)(a2 + (v5 - 1900496073));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((1595 * ((v4 & 0xFFFFFFFC) == ((v3 - 272) ^ 0x71474487))) ^ v3))
                            - 4))();
}

uint64_t sub_1B97FD704@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t (*a22)(uint64_t))
{
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;

  v25 = (v22 - 1690666352) & 0x64C5845F;
  *(_BYTE *)(a1 + (a3 + 2)) = *(_BYTE *)(a2 + (v23 - 1900496151 + v25));
  v26 = 628203409 * ((-420577316 - ((v24 - 160) | 0xE6EE7FDC) + ((v24 - 160) | 0x19118023)) ^ 0x9B998C10);
  *(_DWORD *)(v24 - 152) = v26 + v25 + 974;
  *(_DWORD *)(v24 - 148) = 507371030 - v26;
  *(_QWORD *)(v24 - 160) = a21;
  v27 = sub_1B97F4E54(v24 - 160);
  return a22(v27);
}

uint64_t sub_1B97FD7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11)
{
  int v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;

  v14 = a11 < 0x9000B19B;
  if (v14 == (v11 + 938535170) < 0x9000B19B)
    v14 = v11 + 938535170 < a11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((v14 * (((v12 - 1221) | 0x19) ^ 0x41)) ^ v12)) - 12))();
}

uint64_t sub_1B97FD82C@<X0>(int a1@<W0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, int a6@<W8>)
{
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = a3 < v9;
  *(_BYTE *)(a4 + (a6 + a2)) = *(_BYTE *)(v12 + (v6 + v8))
                                           - (a5 & (2 * *(_BYTE *)(v12 + (v6 + v8))))
                                           + 50;
  v14 = a1 + v6 + 1;
  v15 = v13 ^ (v14 < v9);
  v16 = v14 < a3;
  if (!v15)
    v13 = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((v13 * v11) ^ v7)) - 12))();
}

uint64_t sub_1B97FD89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v29 = 628203409 * ((((v28 - 160) | 0x8BCD2C81) + (~(v28 - 160) | 0x7432D37E)) ^ 0x94520B3);
  *(_DWORD *)(v28 - 152) = v29 + v26 + 962;
  *(_DWORD *)(v28 - 148) = a10 - v29;
  *(_QWORD *)(v28 - 160) = a26;
  v30 = sub_1B97F4E54(v28 - 160);
  v31 = STACK[0x310] & 0x3F ^ ((v26 ^ 0x39Au) - 941);
  *((_BYTE *)&STACK[0x2CC] + v31) = -78;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * ((968 * (v31 > 0x37)) ^ v26)) - 4))(v30);
}

uint64_t sub_1B97FD994()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((((v1 - 247) ^ (v0 == 63)) & 1) == 0) * (7 * (v1 ^ 0x3CC) - 86)) ^ v1))
                            - 4))();
}

uint64_t sub_1B97FD9EC@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((477 * ((a1 ^ 0x2Bu) > 7)) ^ (v1 | 0x10))))();
}

uint64_t sub_1B97FDA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(a9 + v10) = v13;
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * ((409 * ((v11 & 0x38) - (unint64_t)(v9 + 322) == -393)) ^ (v9 + 623))))();
}

uint64_t sub_1B97FDA70(int a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + v4) = v6;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 == v4) * a1) ^ v1)))();
}

uint64_t sub_1B97FDA90()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 ^ 0x1DE) + ((v1 - 392) | 0x52) + 673) * (v2 != v0)) ^ v1)))();
}

uint64_t sub_1B97FDAD8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  uint64_t v7;

  *(_BYTE *)(a1 + a2 + v3) = v6;
  return (*(uint64_t (**)(void))(v7 + 8 * (((a2 + v3 + (unint64_t)(v2 ^ v5) - 90 > 0x3F) * v4) ^ (v2 + 299))))();
}

void sub_1B97FDB0C()
{
  JUMPOUT(0x1B97FC8ACLL);
}

uint64_t sub_1B97FDB34()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1556 * (((v2 - 1967077713) & 0x753F3BC7u) + v0 - 250416935 < 0x38)) ^ (v2 + 663)))
                            - 12))();
}

uint64_t sub_1B97FDB94@<X0>(unsigned int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v4 = ((v2 + ((a1 - 2076846039) & 0x7BCA27FD) - 669) ^ (a1 - 1511176519) & 0x5A12B6CF) + v1;
  if (v4 <= 0x38)
    v4 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((2000 * (v4 - v1 + 250416225 > 7)) ^ a1)) - 12))();
}

uint64_t sub_1B97FDC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(a9 + v10) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12
                                        + 8
                                        * (int)((14
                                               * ((((((v11 + 1227796478) & 0xB6D14FF7) - 29) ^ (((((v11 + 1227796478) & 0xB6D14FF7)
                                                                                                - 747) & v9) == 8)) & 1) == 0)) ^ (v11 + 1227796478) & 0xB6D14FF7))
                            - 8))();
}

uint64_t sub_1B97FDC88(int a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + v5) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((14 * (a1 & ~(v3 ^ (v4 == v5)))) ^ v1)) - 8))();
}

uint64_t sub_1B97FDCB8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 | (32 * (v0 == v1))))
                            - ((v2 - 1315803975) & 0x4E6D90CF ^ 0x43)))();
}

uint64_t sub_1B97FDD00@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + a2 + v3) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((unint64_t)(a2 + 1 + v3) < 0x38) * v5) ^ (v2 + 663)))
                            - 12))();
}

void sub_1B97FDD30()
{
  char v0;
  int v1;
  unsigned int v2;
  int v3;
  unint64_t v4;
  char v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  char v11;
  char v12;
  char v13;
  int v14;
  unint64_t v15;

  v1 = LOBYTE(STACK[0x32C]) ^ 0x5F;
  if (v1 == 1)
  {
    v8 = STACK[0x310];
    v9 = STACK[0x30C];
    v10 = LODWORD(STACK[0x310]) >> 5;
    v11 = v10 ^ 0xF2;
    v12 = (v10 ^ 0xF2) & 0x37 ^ v10 & 5;
    v5 = v0 ^ 0x26;
    v13 = v11 - 2 * v12;
    v14 = LODWORD(STACK[0x310]) >> 13;
    LOBYTE(STACK[0x304]) = (v0 ^ 0x26)
                         + ((8 * LOBYTE(STACK[0x310])) ^ 0xA0)
                         - ((2 * ((8 * LOBYTE(STACK[0x310])) ^ 0xA0)) & 0x60)
                         - 55;
    LOBYTE(STACK[0x305]) = v13 + 50;
    LOBYTE(STACK[0x306]) = (v14 ^ 0x8F) + (~(2 * (v14 ^ 0x8F)) | 0x9B) + 51;
    LOBYTE(STACK[0x307]) = ((v8 >> 21) ^ 0x39) - 2 * (((v8 >> 21) ^ 0x39) & 0x36 ^ (v8 >> 21) & 4) + 50;
    HIDWORD(v15) = v9 ^ 0xA;
    LODWORD(v15) = v8 ^ 0x60000000;
    v6 = 100;
    LOBYTE(STACK[0x308]) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0x64) + 50;
    LOBYTE(STACK[0x309]) = ((v9 >> 5) ^ 0xA) - ((2 * ((v9 >> 5) ^ 0xA)) & 0x64) + 50;
    LOBYTE(STACK[0x30A]) = ((v9 >> 13) ^ 0xA4) - ((2 * ((v9 >> 13) ^ 0xA4)) & 0x64) + 50;
    v7 = (v9 >> 21) ^ 0xFFFFFFBE;
  }
  else
  {
    if (v1 != 2)
      goto LABEL_6;
    v2 = STACK[0x30C];
    v7 = STACK[0x310];
    v3 = LODWORD(STACK[0x30C]) >> 13;
    LOBYTE(STACK[0x304]) = ((LODWORD(STACK[0x30C]) >> 21) ^ 0xBE)
                         - 2 * (((LODWORD(STACK[0x30C]) >> 21) ^ 0xBE) & 0x33 ^ ((STACK[0x30C] & 0x200000) != 0))
                         + 50;
    LOBYTE(STACK[0x305]) = (v3 ^ (v0 + 85)) - 2 * ((v3 ^ (v0 + 85)) & 0x33 ^ ((v2 & 0x2000) != 0)) + 50;
    LOBYTE(STACK[0x306]) = ((v2 >> 5) ^ 0xA) - 2 * (((v2 >> 5) ^ 0xA) & 0x37 ^ (v2 >> 5) & 5) + 50;
    HIDWORD(v4) = v2 ^ 0xA;
    LODWORD(v4) = v7 ^ 0x60000000;
    LOBYTE(STACK[0x307]) = (v4 >> 29) - ((2 * (v4 >> 29)) & 0x64) + 50;
    LOBYTE(STACK[0x308]) = ((v7 >> 21) ^ 0x39) - ((2 * ((v7 >> 21) ^ 0x39)) & 0x64) + 50;
    LOBYTE(STACK[0x309]) = ((v7 >> 13) ^ 0x8F) - ((2 * ((v7 >> 13) ^ 0x8F)) & 0x64) + 50;
    LOBYTE(STACK[0x30A]) = ((v7 >> 5) ^ 0xF2) - 2 * (((v7 >> 5) ^ 0xF2) & 0x36 ^ (v7 >> 5) & 4) + 50;
    v5 = v0 + 26;
    v6 = 96;
    LOBYTE(v7) = (8 * v7) ^ 0xA0;
  }
  LOBYTE(STACK[0x30B]) = v7 + ((v5 - 10) & 0xEF) - (v6 & (2 * v7)) - 29;
LABEL_6:
  JUMPOUT(0x1B97FC8ACLL);
}

uint64_t sub_1B97FDF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  int v36;
  uint64_t v37;
  int v39;
  unint64_t v40;

  if (a31 == 2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v37
                                                       + 8
                                                       * ((961
                                                         * (((LODWORD(STACK[0x328]) == 369984849) ^ (v36 - 34)) & 1)) ^ (v36 + 1245))))(a1, a11);
  if (a31 == 1)
    return (*(uint64_t (**)(void))(v37 + 8 * ((56 * (LODWORD(STACK[0x328]) == v36 + 369984770)) ^ (v36 + 1221))))();
  v39 = (16 * v36) ^ 0x560;
  v40 = ((unint64_t)&a36 ^ 0x3B7E7DF27E694F73)
      - 0x18019002680273
      + (((_QWORD)&a36 << (((16 * v36) ^ 0x60u) + 113)) & 0x76FCFBE4FCD29EE0);
  LOBYTE(STACK[0x327]) = ((((v39 - 81) & 0xFE) + 124) ^ v40) * (v40 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v37 + 8 * v39) - 8))();
}

void sub_1B97FE2D0()
{
  JUMPOUT(0x1B97FE29CLL);
}

uint64_t sub_1B97FE2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37)
{
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;

  v42 = *(_QWORD *)(a18 + 24);
  memset((void *)(v40 - 176), 50, 16);
  v43 = 235795823 * (((v40 - 160) & 0xA61497F7 | ~((v40 - 160) | 0xA61497F7)) ^ 0xCD462151);
  *(_DWORD *)(v40 - 152) = v43 + 1596901039;
  *(_QWORD *)(v40 - 160) = v40 - 192;
  *(_DWORD *)(v40 - 124) = (v37 + 1799) ^ v43;
  *(_QWORD *)(v40 - 144) = &a37;
  *(_QWORD *)(v40 - 136) = v42;
  *(_QWORD *)(v40 - 120) = v40 + 0x3EAB24E7EEDAAD1ALL;
  v44 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v41 + 8 * (v37 - 21)) - 4))(v40 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v38
                                                      + 8
                                                      * ((1117
                                                        * (*(_DWORD *)(v40 - 128) == v39 + ((v37 + 34) | 0x403) - 1123)) ^ v37))
                                          - 4))(v44);
}

uint64_t sub_1B97FE3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 8) + v0 - 0x7A12F6E83BCD2E84)
     - *(unsigned __int8 *)(v5 + v0 - 0x7A12F6E83BCD2E84);
  v7 = v0 + 1;
  v9 = (v6 ^ 0xFD6C6FCF) + ((v4 - 1044) ^ 0x73FFF5B2) + ((2 * v6) & 0xFAD8DF9E) != 1902929356 || v7 == v2 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((473 * v9) ^ v4)) - 4))();
}

uint64_t sub_1B97FE468@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v4 = 1178560073 * ((v3 - 160 - 2 * ((v3 - 160) & 0xDE8BE26CF99EC706) - 0x21741D93066138FALL) ^ 0xC577B284430ABF64);
  *(_QWORD *)(v3 - 144) = v4 + 1902929356;
  *(_DWORD *)(v3 - 132) = v4;
  *(_DWORD *)(v3 - 128) = v4 + a1 + 2104632311;
  *(_QWORD *)(v3 - 120) = v1 - v4;
  *(_DWORD *)(v3 - 156) = ((a1 + 1671359681) ^ 0x6B) + v4;
  *(_DWORD *)(v3 - 152) = ((a1 + 1671359681) ^ 0x3E) + v4;
  *(_DWORD *)(v3 - 136) = a1 + 1671359681 + v4;
  v5 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E709D0C0 + a1 - 8) - 8))(v3 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * *(int *)(v3 - 160)) - 4))(v5);
}

void sub_1B97FE538()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 32) = 1645153785;
}

void sub_1B97FE584(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B97FE5E4()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((7 * (v1 == 1206753083)) ^ 0x47Au)) - 4))();
}

uint64_t sub_1B97FE618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;

  v4 = v3 + 1013;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 800) = 1612862051;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 804) = 159353952;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 808) = *(_QWORD *)(a1 + 96) + 816;
  v5 = *(_QWORD *)(a1 + 96) + 0xC7F991DE640913DLL;
  v6 = 1178560073
     * (((&v8 ^ 0xF4D518DC | 0xA372392C)
       - (&v8 ^ 0xF4D518DC)
       + ((&v8 ^ 0xF4D518DC) & 0x5C8DC6D0)) ^ 0xED335992);
  v9 = *(_QWORD *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v4);
  v10 = v5;
  v12 = v6 + v4 + 306418366;
  v8 = v6 + 308;
  ((void (*)(unsigned int *))(*(_QWORD *)(a3 + 968) - 12))(&v8);
  return (1279786127 * v11 - 1666208810);
}

void sub_1B97FE77C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (235795823 * ((-127693918 - (a1 | 0xF8638BA2) + (a1 | 0x79C745D)) ^ 0x93313D04));
  __asm { BR              X10 }
}

uint64_t sub_1B97FE848(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((*(_DWORD *)(*(_QWORD *)(a1 + 8) + v3) == 45 * (v4 ^ 0x29C) + v1)
                                          * (((v4 ^ 0x29C) + 1940) ^ 0x792)) ^ v4))
                            - 12))();
}

uint64_t sub_1B97FE88C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v4 = a1;
  v5 = v1;
  v6 = v2 + 1374699841 * ((2 * (&v4 & 0x37738180) - &v4 - 930316676) ^ 0xA5786675) + 1072;
  return sub_1B97D3534((uint64_t)&v4);
}

void sub_1B97FEA0C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1224239923 * ((a1 & 0x9A8552A9 | ~(a1 | 0x9A8552A9)) ^ 0x97C95081);
  __asm { BR              X9 }
}

void sub_1B97FEAE0()
{
  _DWORD *v0;

  *v0 = -1645193696;
}

uint64_t sub_1B97FF0D0(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 1178560073 * ((2 * (a1 & 0x7B1A53C3) - (_DWORD)a1 - 2065322948) ^ 0x3E71D45E);
  v2 = a1[1] + v1;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + (int)(v2 ^ 0x753))
                              + (int)(((((*a1 - v1) ^ 0x620F0DF9) - 1 < 0x63) * (v2 - 1751 + (v2 ^ 0x7DB) - 322)) ^ v2)
                              - 1)
                            - 12))();
}

uint64_t sub_1B97FF16C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;

  *(_DWORD *)(*(_QWORD *)(result + 8) - 0x67843F9A1244BACBLL) = (a2 ^ 0x9DF0F206)
                                                              - ((v2 - 1004659888) & (2 * (a2 ^ 0x9DF0F206) - 85198))
                                                              + 1645111186;
  return result;
}

uint64_t sub_1B97FF20C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)off_1E7098AD8[((109 * (*(_DWORD *)(a2 + 4) != 1206753084)) ^ 0x3A7u) - 1] - 8))();
}

uint64_t sub_1B97FF24C()
{
  return 4294925278;
}

uint64_t sub_1B97FF254(uint64_t a1, uint64_t a2)
{
  BOOL v2;

  v2 = **(_BYTE **)(a2 + 8) != 0;
  *(_BYTE *)(a1 + 88) = (v2 ^ 0x2F) + 2 * v2;
  return 0;
}

void sub_1B97FF28C(uint64_t a1)
{
  int v1;
  int v2;
  _BYTE v3[4];
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 - 108757529 * ((-2 - ((a1 | 0x1E625E8E) + (~(_DWORD)a1 | 0xE19DA171))) ^ 0x101C35A);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19);
  v5 = *(_QWORD *)(a1 + 8);
  v4 = (460628867 * ((((v3 | 0xC87E0ECA) ^ 0xFFFFFFFE) - (~v3 | 0x3781F135)) ^ 0x7B177348)) ^ (v1 - 113);
  sub_1B98032C4((uint64_t)v3);
  __asm { BR              X9 }
}

uint64_t sub_1B97FF3CC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((((131 * ((v1 - 877) ^ 0x182)) ^ 0x191) * (((v3 ^ v2) & 0x1F) == 0xF)) ^ v1))
                            - 4))();
}

uint64_t sub_1B97FF43C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;

  v4 = ((v2 + 892) ^ 0xB0240DD2) + (v3 ^ 0xCFFFFFD5) + 2145122043 + (v1 & 0x9FFFFFAA) < 0x7FFFFFFF;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((8 * (((v2 ^ 0x29 ^ v4) & 1) == 0)) & 0xDF | (32 * ((v2 ^ 0x229 ^ ~v4) & 1))) ^ v2))
                            - 12))();
}

uint64_t sub_1B97FF4C0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((511 * (v1 + 287788292 < ((v2 - 2113754378) & 0x7DFD53BFu) + 2147482700)) ^ v2))
                            - 4))();
}

uint64_t sub_1B97FF520@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  unsigned __int8 v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 - 0xC7F991DE6408E15) + 4 * (v1 + v2 + 1)) = -1075083249;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1884 * ((v4 ^ ((v1 + v2) < 0x7FFFFFFF)) & 1)) ^ (v3 - 18)))
                            - 4))();
}

uint64_t sub_1B97FF580@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3;
  char v4;
  int v5;
  _QWORD *v6;
  int v7;
  unsigned int v8;

  *(_DWORD *)(*v6 + 4 * (a2 + v3 + 1)) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((((v4 - 122) ^ (a2 + v3 < v8)) & 1) * a1) ^ v7))
                            - 4))();
}

void sub_1B97FF5BC()
{
  int v0;
  int v1;
  int v2;
  int v3;
  _DWORD *v4;
  int v5;
  int v6;

  v5 = 963203894 - v0;
  if (*v4 + 1988129696 >= ((v3 - 390) ^ 0x3B3))
    v6 = v5;
  else
    v6 = v1;
  *v4 += v2 + v6 + 2;
}

void sub_1B97FF908(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B97FF970()
{
  return 4294925278;
}

void sub_1B97FFAF8(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 40) != 0x27681A84B35EB105
    && *(_QWORD *)(a1 + 16) != 0x3EEC7284B8A20CABLL
    && *(_QWORD *)a1 != 0x66706D739F962A92;
  v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((((2 * a1) | 0xD63BF148) - a1 - 1797126308) ^ 0x61E9F68B);
  __asm { BR              X9 }
}

uint64_t sub_1B97FFC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  int v19;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * ((1069 * (*(_DWORD *)(a18 - 0x27681A84B35EB0EDLL) == 1645153785)) ^ v19)) - (((v19 - 564) | 0x51Cu) ^ 0x516)))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1B97FFC6C(__n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  int v22;
  uint64_t v23;
  __n128 v24;
  __n128 v25;
  unsigned int v26;
  _BOOL4 v27;

  v24.n128_u64[0] = 0x6464646464646464;
  v24.n128_u64[1] = 0x6464646464646464;
  v25.n128_u64[0] = 0x3232323232323232;
  v25.n128_u64[1] = 0x3232323232323232;
  v26 = *(_DWORD *)(a22 - 0x27681A84B35EB0F5) - 1184605341;
  v27 = v26 < 0xCBE984DD;
  if (v26 >= 0xCBE984DD)
    v27 = v26 > 0xCBE984DD;
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v23
                                                                                             + 8
                                                                                             * ((v27
                                                                                               * ((149 * (v22 ^ 0x512)
                                                                                                 - 1222) ^ 0x3FC)) ^ (149 * (v22 ^ 0x512))))
                                                                                 - ((5 * ((149 * (v22 ^ 0x512)) ^ 0x691u)) ^ 0x22DLL)))(a1, a2, a3, a4, v24, v25);
}

uint64_t sub_1B97FFEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,unsigned int a27)
{
  int v27;
  uint64_t v28;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v28 + 8 * (v27 - 559)) - 8))((((((v27 ^ 0x3A2) + 242) | 0x119) ^ 0x25F)
                                                                                       + 536870464) & a27);
}

uint64_t sub_1B9800BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  int v18;
  _QWORD *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;

  *(_BYTE *)(*v19 + (v17 + a8)) = -78;
  v21 = (((v18 - 888) | 0x20) ^ 0x2FE47CEB) + v17;
  v22 = ((a17 - 504887143) < 0x50E7ACE1) ^ (v21 < 0x50E7ACE1);
  v23 = v21 < a17 - 504887143;
  if (v22)
    v24 = (a17 - 504887143) < 0x50E7ACE1;
  else
    v24 = v23;
  return (*(uint64_t (**)(void))(v20 + 8 * ((23 * v24) ^ v18)))();
}

uint64_t sub_1B9800C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  _BOOL4 v16;
  unsigned int v17;
  int v18;
  _BOOL4 v19;

  v16 = v12 < v8;
  *(_BYTE *)(*v14 + (v9 + 1 + a8)) = 50;
  v17 = v10 + v9 + 499;
  v18 = v16 ^ (v17 < v8 + v11 - 1422);
  v19 = v17 < v12;
  if (!v18)
    v16 = v19;
  return (*(uint64_t (**)(void))(v15 + 8 * ((v16 * v13) ^ v11)))();
}

void sub_1B9800CA4(int a1@<W8>)
{
  _QWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 - 0x3EEC7284B8A20CABLL) = *v1;
  *(_DWORD *)(v4 - 0x66706D739F962A92) = a1;
  *v1 = 0;
  *(_QWORD *)(v7 - 0x27681A84B35EB0FDLL) = 0x23F5AF4C23F5AF4CLL;
  *v2 = 310716794;
  *(_DWORD *)(v7 - 0x27681A84B35EB0F1) = ((*(_DWORD *)(v7 - 0x27681A84B35EB0F1) & 0xFFFFFFFE ^ 0x42D83F58 | 0x95997BD8)
                                          - (*(_DWORD *)(v7 - 0x27681A84B35EB0F1) & 0xFFFFFFFE ^ 0x42D83F58 | 0x6A668427)
                                          + 1785103399) ^ 0xD7414481;
  *(_DWORD *)(v6 + 28) = *v5;
}

void jfkdDAjba3jd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _DWORD *a6)
{
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  *a6 = 0;
  v6[1] = 108757529
        * (((v6 | 0x51085D1D) - v6 + (v6 & 0xAEF7A2E0)) ^ 0xB1943F36)
        + 1695027452;
  sub_1B9816CD4(v6);
  __asm { BR              X8 }
}

uint64_t sub_1B9800E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, int a16, unsigned int a17)
{
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  a15 = &STACK[0x4BD26FD1213425B9];
  a17 = 1307 - 460628867 * ((&a15 & 0xA1039BA5 | ~(&a15 | 0xA1039BA5)) ^ 0x126AE627);
  sub_1B97F2874((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * ((16 * (a16 == 1645153785)) | v17)) - 12))(v19, v20, v21, v22, v23, v24, v25, v26);
}

uint64_t sub_1B9800F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17, unsigned int a18, uint64_t a19)
{
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v26 = 1178560073 * ((&a15 & 0x443E359C | ~(&a15 | 0x443E359C)) ^ 0x155B201);
  a17 = a12;
  a18 = v26 ^ 0x3E8;
  a16 = (v22 ^ 0xF3FDF27D) + ((2 * v22) & 0xE7FBE4FA) + 1551851452 + v26;
  sub_1B9802920((uint64_t)&a15);
  v27 = 1178560073 * (((&a15 | 0xFEB9F472) - (&a15 & 0xFEB9F472)) ^ 0x442D8C10);
  a17 = a12;
  a18 = v27 ^ 0x3E8;
  a16 = ((2 * v21) & 0xECFABD76) + 1098 + (v21 ^ 0xF67D5EBB) + 1509945140 + v27;
  sub_1B9802920((uint64_t)&a15);
  v28 = 1178560073 * ((1638435589 - (&a15 | 0x61A88B05) + (&a15 | 0x9E5774FA)) ^ 0x24C30C98);
  a18 = v28 ^ ((v20 ^ 0x4BF17F7E) - 1081107028 + ((2 * v20) & 0x97E2FEFC));
  a19 = v19;
  a17 = a12;
  a16 = v28 + 1289;
  sub_1B97F4534((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 + 8 * ((750 * (a15 == 1645153785)) ^ 0x451u)) - 12))(v29, v30, v31, v32, v33, v34, v35, v36, v25, v23);
}

uint64_t sub_1B9801130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, uint64_t a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
{
  int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  v22 = 460628867 * ((&a15 & 0x289C561E | ~(&a15 | 0x289C561E)) ^ 0x9BF52B9C);
  a19 = 635686783 - v22;
  a17 = v22 + 1697367587;
  a18 = v22 + v20 + 2138962262;
  a15 = &STACK[0x58A7AA08624568F6];
  a16 = a12;
  v23 = sub_1B98170A4((uint64_t)&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21
                                                      + 8
                                                      * ((27
                                                        * (((v20 + 101) ^ (a20 == ((v20 - 1363541339) & 0x5145FBB7 ^ 0x620F0F5E))) & 1)) ^ v20))
                                          - 12))(v23);
}

uint64_t sub_1B9801220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, unint64_t *a16, unint64_t *a17, unint64_t *a18, unsigned int a19)
{
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v22 = v19 & 0x70D0B2DF;
  a16 = a11;
  a17 = &STACK[0x72E1645BEBB64033];
  a19 = (v22 + 211) ^ (1225351577 * (&a15 ^ 0x239AD816));
  a18 = &STACK[0x1E6EF7153090DEA];
  ((void (*)(unsigned int *))(*(_QWORD *)(v20 + 8 * (v22 - 78)) - 8))(&a15);
  a16 = &STACK[0x384B062F07609564];
  a17 = a11;
  a15 = (v22 + 202) ^ (1374699841 * (&a15 ^ 0x6DF41809));
  ((void (*)(unsigned int *))(*(_QWORD *)(v20 + 8 * (v22 ^ 0x3Au)) - 8))(&a15);
  a16 = a11;
  a15 = (v22 + 703) ^ (1755732067
                     * ((2 * (&a15 & 0x22973738) - &a15 + 1567148230) ^ 0x83AE751D));
  v23 = sub_1B9812F54((uint64_t)&a15);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * ((((_DWORD)a17 == 1645153785) * (((v22 - 677531922) & 0x286254D3) + 369)) ^ v22)))(v23);
}

uint64_t sub_1B9801394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  unsigned int v14;
  uint64_t v15;

  return (*(uint64_t (**)(void))(v15 + 8 * ((910 * (a14 == ((221 * (v14 ^ 0x8A)) ^ 0x620F09A8))) ^ v14)))();
}

uint64_t sub_1B98013D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  unsigned int v13;
  uint64_t v14;

  return (*(uint64_t (**)(void))(v14
                              + 8
                              * ((691 * (a13 != ((((v13 + 756930384) & 0xD2E22C71) + 1645152037) ^ (v13 + 1536)))) ^ v13)))();
}

uint64_t sub_1B980142C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = (*(uint64_t (**)(_QWORD))(v2 + 8 * (v1 - 1453)))(a1 ^ 0x620F0DF9u) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v4 * ((v1 - 1207) ^ 0x5C7 ^ (5 * (v1 ^ 0x652)))) ^ v1)) - 8))();
}

uint64_t sub_1B9801484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  uint64_t v14;
  unsigned int v15;

  v15 = (a13 ^ 0x620F0DF9) + ((v13 + 494461987) & 0xE2871B56 ^ 0x76D504A8) - ((2 * (a13 ^ 0x620F0DF9)) & 0xEDAA0BF4);
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * ((1615
                                          * (((2 * v15) & 0xDFDBFDDA ^ 0xCD8A09D0)
                                           + ((v13 - 329) ^ 0x1938FB98 ^ v15)
                                           - 1610946564 != 266921705)) ^ v13))
                            - 12))();
}

uint64_t sub_1B9801530()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 + v0 + v2 - 1877868607) > 7) * (v2 - 334)) | v2)))();
}

uint64_t sub_1B980157C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  _BOOL4 v5;

  v4 = v2 + 761;
  v5 = v1 - a1 < (v4 ^ 0x46BuLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((v5 | (16 * v5)) ^ v4)) - 12))();
}

uint64_t sub_1B98015BC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  char v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v6
                                                              + 8
                                                              * (((((v4 < 0x20) ^ (a4 - v5 - 99)) & 1)
                                                                * (a4 - 812)) ^ a4))
                                                  - 4))(a1, (a4 - 146));
}

uint64_t sub_1B98015FC(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v10 = v4 + v5 + v6;
  v11 = v1 + v10;
  v12 = *(_OWORD *)(v11 - 31);
  v13 = a1 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((((v2 & 0xFFFFFFE0) == 32) * ((38 * (v7 ^ (v3 + 1095))) ^ 0x44D)) ^ (v8 + v7 + 734)))
                            - 8))();
}

void sub_1B9801664()
{
  JUMPOUT(0x1B9801614);
}

uint64_t sub_1B9801670(uint64_t a1)
{
  int v1;
  int v2;
  void (*v3)(_BYTE *);
  int v4;
  int v5;
  _QWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[4];
  unsigned int v12;
  uint64_t v13;

  *v7 = a1;
  *v8 = v2;
  v5 = (v1 ^ 0x4DE) - 426;
  v13 = v9;
  v12 = (v1 ^ 0x4DE) + (v11 ^ 0xAF40E2F) * v4 - 76;
  v3(v11);
  v13 = v10;
  v12 = v5 + ((((2 * v11) | 0xC2DB3190) - v11 + 512911160) ^ 0xEB9996E7) * v4 + 350;
  v3(v11);
  return 0;
}

void sub_1B9801900(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1224239923 * ((-2 - ((a1 | 0xAACC30C4) + (~(_DWORD)a1 | 0x5533CF3B))) ^ 0xA78032EC);
  __asm { BR              X14 }
}

void sub_1B9801A18(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 + a1) = 159353952;
}

void sub_1B9802920(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((2 * (a1 & 0x878F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8));
  __asm { BR              X10 }
}

uint64_t sub_1B98029F8@<X0>(uint64_t a1@<X8>, uint64_t a2, unsigned int a3, int a4, unint64_t *a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v10 = 3804331 * (((&a3 | 0x81ADAAE9) + (~&a3 | 0x7E525516)) ^ 0xFF788F1E);
  a5 = &STACK[0x58C2F3F47EC954F5];
  a6 = v8;
  a7 = v10 + 910892480;
  a3 = v10 + 1116194074;
  a4 = v10 + v7 - 480;
  v11 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(a1 + 8 * (v7 - 818)) - 12))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((1204 * (*(_DWORD *)(v8 - 0x27681A84B35EB0EDLL) == 1645153785)) ^ v7)))(v11);
}

void sub_1B9802AC4(_DWORD *a1@<X8>)
{
  _DWORD *v1;
  int v2;
  unsigned int v3;
  _BYTE *v4;

  v3 = v1[1] - v2 - ((2 * (v1[1] - v2) + 1594186638) & 0x989A21DE) - 70271306;
  *v4 = (HIBYTE(v3) ^ 0x4C) - ((v3 >> 23) & 0x64) + 50;
  v4[1] = (BYTE2(v3) ^ 0x4D) - ((v3 >> 15) & 0x64) + 50;
  v4[2] = (BYTE1(v3) ^ 0x10) - ((2 * (BYTE1(v3) ^ 0x10)) & 0x64) + 50;
  v4[3] = v3 ^ 0xDD;
  *v1 = *a1;
}

void sub_1B9802B88(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B9802BCC()
{
  return 4294925273;
}

void zxcm2Qme0x(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X8 }
}

uint64_t sub_1B9802CC0(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  if (a1)
    v3 = a2 == 0;
  else
    v3 = 0;
  v4 = v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((7 * v4) ^ 0x2D2u)) - 4))();
}

uint64_t sub_1B9802D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v14;
  int v15;
  uint64_t v16;

  a14 = v15
      + 108757529 * ((-1250741474 - (&a13 | 0xB573331E) + (&a13 | 0x4A8CCCE1)) ^ 0xAA10AECA)
      + 1695026727;
  v16 = sub_1B9816CD4(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v14
                                                      + 8
                                                      * ((1788 * (a13 == ((239 * (v15 ^ 0x2D6)) ^ 0x620F0F34))) ^ v15))
                                          - ((v15 - 1689052227) ^ 0x9B531E96)))(v16);
}

uint64_t sub_1B9802DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  a15 = v16 - 460628867 * (((&a13 | 0x8BDC4BD5) + (~&a13 | 0x7423B42A)) ^ 0xC74AC9A9) + 590;
  a13 = &STACK[0x4BD26FD1213425B9];
  sub_1B97F2874((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * (int)(((a14 != v15) * ((v16 - 76030703) ^ 0xFB77DFC6)) ^ v16))
                                                                                       - ((v16 - 76030703) & 0x9FDB3EB3 ^ 0x9B531E96)))(v18, v19, v20, v21, v22, v23);
}

uint64_t sub_1B9802E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = 1178560073 * (&a13 ^ 0xBA947862);
  a17 = v17;
  a14 = v23 + v22 - 128;
  a16 = (((v22 + 1974771810) & 0x8A4B5F9E ^ 0x1FF95825)
       + ((2 * v18) & 0xD70F7EF6)
       + (v18 ^ 0xEB87BDAE ^ ((v22 - 884) | 0xC0))) ^ v23;
  a15 = a12;
  v24 = ((uint64_t (*)(int *))(*(_QWORD *)(v20 + 8 * (v22 ^ 0x509)) - 8))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * (((a13 != v19) | (2 * (a13 != v19))) ^ v22)) - 12))(v24);
}

uint64_t sub_1B9802F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, int a15, int a16, int a17, int a18)
{
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  v21 = 460628867 * ((&a13 - 1886733488 - 2 * ((unint64_t)&a13 & 0x8F8ABB50)) ^ 0xC31C392D);
  a13 = &STACK[0x58A7AA08624568EE];
  a14 = a12;
  a15 = v21 - 1370370129;
  a16 = v21 + 2138961942 + v20;
  a17 = 635686783 - v21;
  v22 = sub_1B98170A4((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (((a18 == ((v20 - 693) ^ (v18 + 307)))
                                                        * (((v20 - 1146) | 0x4A0) - 748)) ^ v20))
                                          - 12))(v22);
}

uint64_t sub_1B9803040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, unsigned int a14, unint64_t *a15, uint64_t a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a14 = (v16 - 1111) ^ (1374699841
                      * ((((&a14 | 0x21ACE69C) ^ 0xFFFFFFFE) - (~&a14 | 0xDE531963)) ^ 0xB3A7016A));
  a15 = &STACK[0x384B062F07609554];
  a16 = a10;
  v19 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v17 + 8 * (v16 - 1275)) - 8))(&a14);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * ((121 * (a12 == ((v16 - 1710155678) | 0x1420080) - 960762009)) ^ v16)))(v19);
}

uint64_t sub_1B9803100()
{
  uint64_t v0;
  void (*v1)(unsigned int *);
  unsigned int v2;
  int v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  v14 = 1689051594
      - 108757529 * ((2 * (&v9 & 0x4A6220) - &v9 + 2142608861) ^ 0x9F29FFF6)
      + v3
      + 93;
  v11 = v0;
  v12 = v6;
  v13 = 0x3B4E8EE293AAEC8ALL;
  (*(void (**)(unsigned int *))(v4 + 8 * (v3 + 1689051594)))(&v9);
  v9 = (v3 + 1689052348) ^ (1755732067
                          * (((&v9 | 0x7744F355) - (&v9 & 0x7744F355)) ^ 0xA9824E8E));
  v11 = v6;
  sub_1B9812F54((uint64_t)&v9);
  v10 = v3
      + 1689051594
      + 535753261 * ((((2 * &v9) | 0xA365A42A) - &v9 + 776809963) ^ 0xDB46DC3A)
      + 937;
  v11 = v6;
  v1(&v9);
  v11 = v8;
  v10 = v3
      + 1689052227
      + 535753261 * ((&v9 & 0x5FB4813F | ~(&v9 | 0x5FB4813F)) ^ 0xAABF70EF)
      + 304;
  v1(&v9);
  return v7 ^ v2;
}

void sub_1B98032C4(uint64_t a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 4) ^ (460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86));
  v3 = *(_QWORD *)(a1 + 8);
  v2[0] = v1 + 628203409 * (((v2 | 0xF7CBF79) + (~v2 | 0xF0834086)) ^ 0x8DF4B34B) - 617;
  sub_1B97E4434((uint64_t)v2);
  __asm { BR              X8 }
}

void sub_1B98033C0()
{
  _DWORD *v0;
  int v1;
  uint64_t v2;
  int v3;

  if ((*(_DWORD *)(v2 - 0xC7F991DE6408E19) - 159353953) >= 0x7FFFFFFF)
    v3 = v1;
  else
    v3 = v1 + 2;
  *v0 = v3;
}

void sub_1B980342C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 1755732067 * (((a1 | 0xFD508F6) - (_DWORD)a1 + (a1 & 0xF02AF709)) ^ 0xD113B52D);
  __asm { BR              X14 }
}

uint64_t sub_1B980354C()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  int v4;

  v4 = v0 + 295202885 < (int)((v1 ^ 0x1B17FF6C) + v3);
  if (v3 > 0x64E8035A != v0 + 295202885 < -1692926811)
    v4 = v3 > 0x64E8035A;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((v4 << 9) | (v4 << 10) | v1 ^ 0x2EC)) - 12))(0x5795C76E21738119);
}

uint64_t sub_1B9803684@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, int a4@<W3>, _QWORD *a5@<X6>, unsigned int a6@<W7>, int a7@<W8>)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v19;

  v17 = a1 + a3 + (*(_DWORD *)(v7 + 4 * v12) ^ v9) + a6 * (unint64_t)(*(_DWORD *)(*a5 + 4 * a2) ^ v9);
  *(_DWORD *)(v7 + 4 * v12) = v17
                            + (((((v11 - 1990494502) & 0x76A48BC9) - 708) | 0x20) ^ (v9 + 283))
                            - (((_DWORD)v17 << (((v11 - 38) & 0xC9 ^ v13) - 69)) & 0x7FD7101E);
  v19 = a2 - 1793570764 < a7 && a2 - 1793570764 >= a4;
  return ((uint64_t (*)(unint64_t))(*(_QWORD *)(v8
                                                               + 8 * ((v11 - 1990494502) & 0x76A48BC9 ^ (v19 * v10)))
                                                   - 4))((v14 ^ HIDWORD(v17)) + (v15 & (v17 >> 31)) + v16);
}

uint64_t sub_1B9803744(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((57 * (a1 != ((v2 + 866) | 0x101u) + 0x5795C76E21737B70)) | v2))
                            - 8))();
}

uint64_t sub_1B98037A8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  _BOOL4 v5;

  v4 = a1 - 1211;
  v5 = v1 + 77641432 < (int)(v3 + 236995384);
  if (v3 > ((a1 - 1211) ^ 0x71DFBC29u) != v1 + 77641432 < (int)((a1 - 1381569963) & 0x52591147 ^ 0x8E20427E))
    v5 = v3 > (v4 ^ 0x71DFBC29u);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1310 * v5) ^ v4)) - 4))();
}

uint64_t sub_1B98038A0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;

  v14 = a1 - 0x5795C76E21738119 + (*(_DWORD *)(v2 + 4 * v4) ^ v5);
  *(_DWORD *)(v2 + 4 * v4) = v14 + v5 - ((2 * v14) & 0x7FD7101E);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((v8 + 88 + v6) & v7 ^ a2 ^ (v14 >> (((v8 + 88) ^ v9)
                                                                                * v10
                                                                                - 86)))
                                           + v12
                                           + (v11 & (2 * (v14 >> (((v8 + 88) ^ v9) * v10 - 86)))) != 0x5795C76E21738119)
                                          * v13) ^ (v8 + 88)))
                            - 8))();
}

uint64_t sub_1B9803948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10)
{
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;

  v13 = *a10 - 176105989;
  v14 = v10 - 176105989 < v12 + 2130730981;
  v15 = v14 ^ (v13 < ((v12 - 630) | 0x146) + 2130731285);
  v16 = v10 - 176105989 > v13;
  if (!v15)
    v14 = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1483 * v14) ^ v12)) - 8))();
}

void sub_1B98039BC()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t sub_1B98039E0(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 1374699841 * ((((2 * a1) | 0x4FD35BAC) - a1 + 1477857834) ^ 0xCA1DB5DF);
  v2 = *(_DWORD *)a1 ^ v1;
  v3 = *(_DWORD *)(a1 + 16) + v1;
  if (v3 < 0)
    v3 = -v3;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0xC7F991DE6408E19);
  v6 = v4 - 159353952;
  v5 = v4 - 159353952 < 0;
  v7 = 159353952 - v4;
  if (!v5)
    v7 = v6;
  return (*((uint64_t (**)(void))*(&off_1E709D0C0 + v2 - 1300) + ((573 * (v3 >> 5 < v7)) ^ v2) - 1))();
}

uint64_t sub_1B9803A90@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;

  v4 = ((*(_DWORD *)(*(_QWORD *)(v2 - 0xC7F991DE6408E15) + 4 * v3) ^ 0xBFEB880F) >> a2) ^ 0xE0F36651;
  *(_DWORD *)(result + 4) = v4 & 0xC4EA2BA4 ^ 0x3264FBF1 ^ ((v4 & 0xC4822281 | 0x12788964)
                                                          - (v4 & 0x680924 | 0xED87769B)
                                                          - 309889381);
  return result;
}

uint64_t sub_1B9803B10(uint64_t result)
{
  *(_DWORD *)(result + 4) = 538735252;
  return result;
}

void sub_1B9803B20()
{
  uint64_t v0;
  int v1;

  v0 = MEMORY[0x1E0C80A78]();
  v1 = *(_DWORD *)(v0 + 24) - 1225351577 * ((-2 - ((v0 | 0x64CFEAB8) + (~(_DWORD)v0 | 0x9B301547))) ^ 0xB8AACD51);
  __asm { BR              X13 }
}

uint64_t sub_1B9803C98@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,char a35,uint64_t a36,char a37,uint64_t a38,char a39)
{
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
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
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;

  v46 = &a39 + v39;
  v65 = &a29 + v39;
  v64 = &a31 + v39;
  v63 = &a35 + v39;
  v62 = &a37 + v39;
  v61 = &a33 + v39;
  v59 = v40;
  v60 = &a25 + v39;
  v66 = &a23 + v39;
  v47 = *a1;
  v48 = a1[5];
  v68 = a1[4];
  LODWORD(a13) = v42 + 380;
  *(_QWORD *)(v45 - 104) = *(_QWORD *)(*a1 - 0x7542B2AE577378FLL);
  *(_QWORD *)(v45 - 128) = &a39 + v39;
  *(_QWORD *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x3BB37F04 | ~((v45 - 144) | 0x3BB37F04)) ^ 0x36FF7D2C);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = a3;
  v67 = *(void (**)(uint64_t))(a2 + 8 * ((int)v42 - 1378));
  v69 = v41;
  v67(v45 - 144);
  *(_QWORD *)(v45 - 136) = v48;
  *(_QWORD *)(v45 - 128) = v66;
  *(_DWORD *)(v45 - 144) = (v42 - 453) ^ (((2 * ((v45 - 144) & 0x7323D130) - (v45 - 144) + 215756489) ^ 0x2F46F6DF) * v43);
  *(_QWORD *)(v45 - 120) = v46;
  *(_QWORD *)(v45 - 112) = v47;
  ((void (*)(uint64_t))((char *)*(&off_1E709D0C0 + (int)v42 - 1504) - 4))(v45 - 144);
  *(_QWORD *)(v45 - 104) = v46;
  *(_DWORD *)(v45 - 112) = v42 + 380 + 1224239923 * ((v45 + 460286470 - 2 * ((v45 - 144) & 0x1B6F6A96)) ^ 0xE9DC9741);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v65;
  *(_QWORD *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(_QWORD *)(v45 - 104) = v65;
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v64;
  *(_QWORD *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0xFA6987D9 | ~((v45 - 144) | 0xFA6987D9)) ^ 0xF72585F1);
  v67(v45 - 144);
  *(_QWORD *)(v45 - 104) = v64;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923
                         * ((((v45 - 144) | 0x89678349) - (v45 - 144) + ((v45 - 144) & 0x76987CB0)) ^ 0x7BD47E9E);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v63;
  *(_QWORD *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(_QWORD *)(v45 - 104) = v63;
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v62;
  *(_QWORD *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923
                         * ((((v45 - 144) | 0xA3105CC4) - (v45 - 144) + ((v45 - 144) & 0x5CEFA338)) ^ 0x51A3A113);
  v67(v45 - 144);
  *(_QWORD *)(v45 - 104) = v62;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x9B210A30 | ~((v45 - 144) | 0x9B210A30)) ^ 0x966D0818);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v61;
  *(_QWORD *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(_QWORD *)(v45 - 104) = v61;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * ((((v45 - 144) | 0x95C539CC) - ((v45 - 144) & 0x95C539CC)) ^ 0x6776C41B);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 128) = v60;
  *(_QWORD *)(v45 - 120) = v48;
  v67(v45 - 144);
  *(_QWORD *)(v45 - 144) = v47;
  *(_QWORD *)(v45 - 136) = v66;
  *(_QWORD *)(v45 - 104) = v60;
  *(_QWORD *)(v45 - 128) = v66;
  *(_QWORD *)(v45 - 120) = v48;
  *(_DWORD *)(v45 - 112) = v42
                         + 380
                         + 1224239923 * (((v45 - 144) & 0x8BC4ED51 | ~((v45 - 144) | 0x8BC4ED51)) ^ 0x8688EF79);
  v67(v45 - 144);
  v49 = *(_QWORD *)(v47 - 0x7542B2AE5773797);
  *(_DWORD *)(v45 - 128) = v42
                         + 1374699841
                         * ((-1520606683 - ((v45 - 144) | 0xA55D6225) + ((v45 - 144) | 0x5AA29DDA)) ^ 0x375685D3)
                         - 79;
  *(_QWORD *)(v45 - 144) = v49;
  *(_QWORD *)(v45 - 136) = v44;
  sub_1B97D3534(v45 - 144);
  *(_QWORD *)(v45 - 136) = v68;
  *(_DWORD *)(v45 - 144) = v42 + 235795823 * ((v45 - 862440077 - 2 * ((v45 - 144) & 0xCC983603)) ^ 0x58357F5A) - 1147;
  sub_1B97E07DC(v45 - 144);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t))(v69 + 8 * (int)((((*(_DWORD *)(v45 - 140) - 313388985) < 0x7FFFFFFF) * (((v42 - 1428) | 0x54) + ((v42 - 1051) ^ 0xFFFFFEC0))) ^ v42)))(v50, v51, v52, v53, v54, v55, v56, v57, v59, v60, v61, v62, v63, v64, v65, v66, a12, a13, v42);
}

uint64_t sub_1B980419C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);

  v5 = 1224239923 * ((v4 - 144) ^ 0xF2B3FDD7);
  *(_DWORD *)(v4 - 128) = v5 + v0 + 10;
  *(_DWORD *)(v4 - 144) = v5 ^ 0x3EAF37E3;
  *(_QWORD *)(v4 - 136) = v8;
  sub_1B97D54C4((_DWORD *)(v4 - 144));
  *(_QWORD *)(v4 - 104) = v1;
  *(_DWORD *)(v4 - 112) = v0
                        + 1224239923 * ((2 * ((v4 - 144) & 0x53DB0AB8) - (v4 - 144) + 740619589) ^ 0xDE970892)
                        + 1724;
  *(_QWORD *)(v4 - 128) = v1;
  *(_QWORD *)(v4 - 120) = v2;
  *(_QWORD *)(v4 - 144) = v3;
  *(_QWORD *)(v4 - 136) = v8;
  v9(v4 - 144);
  *(_DWORD *)(v4 - 128) = ((v0 + 556) | 0x98)
                        + 1374699841 * ((((v4 - 144) | 0xF444FDE1) + (~(v4 - 144) | 0xBBB021E)) ^ 0x99B0E5E9)
                        + 557;
  *(_QWORD *)(v4 - 144) = v1;
  *(_QWORD *)(v4 - 136) = v7;
  return sub_1B97D3534(v4 - 144);
}

void sub_1B980520C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((((2 * a1) | 0xD7F3130A) - a1 + 335967867) ^ 0x516DF1E7));
  __asm { BR              X14 }
}

uint64_t sub_1B980533C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;

  v14 = v11 > 0x21B7F2B0;
  *(_DWORD *)(a9 + 4 * (v9 + a1)) = *(_DWORD *)(*(_QWORD *)(v12 - 0xC7F991DE6408E15) + 4 * (v9 + a1));
  if (v14 == v9 + 985134360 < -565703345)
    v14 = v9 + 985134360 < (int)(v11 + 1581780303);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * ((510 * !v14) ^ (v10 - 799))) - 8))(3729263951);
}

uint64_t sub_1B98053E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v18;

  v16 = v14 - 963 + v13 - 986969928;
  v18 = v16 > 1757160217 || v16 < a13 - 390323430;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((23 * v18) ^ v14)) - 12))();
}

uint64_t sub_1B9805454@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  _BOOL4 v19;

  *(_DWORD *)(a10 + 4 * (v10 + a2)) = a1;
  v17 = v12 + v10 + 555;
  v19 = v17 > ((v11 - 1139021551) & 0x43E4132B) + v13 || v17 < v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((v19 * v15) ^ v11)) - 12))();
}

uint64_t sub_1B98054A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                          + 8
                                                                                          * ((((2 * v6) ^ 0x40A)
                                                                                            * (v5 == 0)) ^ v6))
                                                                              - ((v6 - 480591215) & 0x1CA53FFF ^ 0x4B7)))(a1, a2, a3, a4, a5);
}

uint64_t sub_1B9805500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, int a12, int a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = 1374699841 * ((2 * ((v16 - 128) & 0x66A9F4B8) - (v16 - 128) + 425069377) ^ 0x74A21348);
  *(_DWORD *)(v16 - 128) = v15 - v17 - 188;
  *(_DWORD *)(v16 - 124) = v17 + ((a13 << 6) & 0xDB9F1FC0) + ((32 * a13) ^ 0x6DCF8FF5) - 621380673;
  *(_QWORD *)(v16 - 120) = a14;
  sub_1B97DED84((_DWORD *)(v16 - 128));
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * ((1972 * (*a10 + ((v15 - 159355000) ^ v15 ^ 0x307u) > 0x7FFFFFFE)) ^ v15))
                            - 4))();
}

uint64_t sub_1B98055E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_DWORD *)(v18 - 112) = v14
                         + 1374699841 * (((~(v18 - 128) & 0x2D3D96EC) - (~(v18 - 128) | 0x2D3D96ED)) ^ 0x40C98EE4)
                         + 427;
  *(_QWORD *)(v18 - 128) = a14;
  *(_QWORD *)(v18 - 120) = &STACK[0xC7F991DE6408E5D];
  sub_1B97D3534(v18 - 128);
  *(_QWORD *)(v18 - 120) = a14;
  *(_DWORD *)(v18 - 112) = v14
                         + ((((v18 - 128) ^ 0x5F497C76) & 0x2F4F9D48 | ~((v18 - 128) ^ 0x5F497C76 | 0x2F4F9D48)) ^ 0x356D66A3)
                         * v16
                         + 567;
  *(_QWORD *)(v18 - 104) = v17;
  v19 = ((uint64_t (*)(uint64_t))*(&off_1E709D0C0 + (v14 ^ 0x4A7)))(v18 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15
                                                      + 8
                                                      * (int)(((*(_DWORD *)(v18 - 128) > ((v14 + 1618980239) ^ 0x607FB2C9u)
                                                                                       + 268031314)
                                                             * (((v14 + 1618980239) & 0x9F804EFF) + 405)) ^ v14))
                                          - 4))(v19);
}

uint64_t sub_1B9805704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  uint64_t v16;
  int v17;
  int v18;
  int v19;

  v18 = (v17 + 888) | 0x12;
  v19 = 1075 - (a16 - 159353952 + v18);
  if (a16 - 159353952 + v18 - 1075 >= 0)
    v19 = a16 - 159353952 + v18 - 1075;
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * ((((int)((v19 ^ 0x9BFFDFF5) + ((2 * v19) & 0x37FFBFEA) + 1677729802) > (int)((v18 - 906) ^ 0xFFFFFF56))
                                              * ((v18 + 778) ^ 0x4BB)) ^ v18)))(3219884047);
}

uint64_t sub_1B98057B0(int a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4 + 8 * (((*(_DWORD *)(v1 + 4 * v2) != a1) * ((v3 + 906) ^ 0xA9)) ^ v3)))();
}

uint64_t sub_1B98057E0()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 - 1 > (int)((v1 - 906) ^ 0xFFFFFF56)) * ((v1 + 778) ^ 0x4BB)) ^ v1)))();
}

uint64_t sub_1B980581C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(v5 + 32);
  *(_DWORD *)(v2 - 112) = v0 + 1374699841 * ((v2 - 128) ^ 0x6DF41809) - 376;
  *(_QWORD *)(v2 - 128) = v1;
  *(_QWORD *)(v2 - 120) = v3;
  return sub_1B97D3534(v2 - 128);
}

uint64_t sub_1B9805CD0(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v1 = 535753261 * (((a1 | 0xB4CC401E) - a1 + (a1 & 0x4B33BFE1)) ^ 0xBE384E31);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  v3 = *(_DWORD *)(a1 + 24) - v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0xC7F991DE6408E19);
  v6 = v4 - 159353952;
  v5 = v4 - 159353952 < 0;
  v7 = 159353952 - v4;
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + v2 - 1195)
                              + ((944 * ((v3 - 2129462123) >= 4 * (unint64_t)v8)) ^ v2)
                              - 1)
                            - 12))();
}

uint64_t sub_1B9805D98()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (int)((v2 + 632557832) & 0xDA4BEEEA ^ (29 * (v1 == 2129462123))))
                            - (((v2 + 632557832) & 0xDA4BEEEA)
                             - 4)
                            + 1208))();
}

uint64_t sub_1B9805DE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 28) = v1;
  return result;
}

uint64_t sub_1B9805DF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;

  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 + 8 * (int)((v3 - 173) ^ 0x4A))
                                                                    - v3
                                                                    + 1216))(a1, v3, 3219884047, v2);
}

uint64_t sub_1B9805E64@<X0>(_QWORD *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*a1 + (a4 + a5)) = ((a3 ^ v7) >> v8)
                                            - (((a3 ^ v7) >> v8 << ((a2 + 49) ^ 0xD4)) & (a2 - 96))
                                            + 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (a2 | (a4 - 1 == v6) | (16 * (a4 - 1 == v6)))) - 12))();
}

uint64_t sub_1B9805EC0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                                + 8
                                                                                * (int)((74 * (v5 == 24)) ^ (a2 - 173)))
                                                                    - a2
                                                                    + 1216))(a1, a2, a3, v4);
}

uint64_t sub_1B9805EF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v7;

  v7 = v4 - 1798686946 > 2047817217 || v4 - 1798686946 < v3;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 + 8 * (v5 ^ (193 * v7)))
                                                                    - 5 * (v5 ^ 0x4E3u)
                                                                    + 1216))(a1, 5 * (v5 ^ 0x4E3u), 3219884047, v2);
}

uint64_t sub_1B9805F4C@<X0>(_QWORD *a1@<X0>, int a2@<W8>)
{
  int v2;
  _QWORD *v3;
  int v4;
  int v5;

  return sub_1B9805E64(a1, v5 + 173, *(_DWORD *)(*v3 + 4 * (v4 - 1699021736 + v5 + 173)), v2, a2);
}

void sub_1B9805F78(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X13 }
}

uint64_t sub_1B9806094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5
                                                                                + 8
                                                                                * (v3 ^ (1928 * (v4 != 0xEB8F3DED))))
                                                                    - 12))(a1, a2, a3, (v3 + 69));
}

uint64_t sub_1B98060E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;

  v15 = v7 > v9;
  *(_BYTE *)(v13 + (v11 - 271286987)) = *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v5 ^ 0x1E3))
                                                               + (((_BYTE)v11 + 53) & 0xF)
                                                               - 4) ^ *(_BYTE *)(v4 + (v11 - 271286987)) ^ (23 * ((v11 + 53) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v5 - 321)) + (((_BYTE)v11 + 53) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v5 - 314)) + (((_BYTE)v11 + 53) & 0xF) + (a4 ^ 0x1F3) - 8);
  if (v15 == v11 - 1983323350 < v6)
    v15 = v11 - 1983323350 < v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((v15 * v10) ^ v5)) - 12))();
}

uint64_t sub_1B9806198()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((52
                                * ((((v0 + 753702940) & 0xD313674B ^ 0xE6FAFFEC) & (2 * v1) ^ 0xC61A79CA)
                                 + (v1 ^ 0x18F2411A)
                                 + ((v0 - 1193) ^ 0x3EE3DA49) != 845240498)) ^ v0)))();
}

uint64_t sub_1B9806214()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((98 * (v2 + v1 + v0 + 209878278 >= (v0 - 1531))) ^ v0)))();
}

uint64_t sub_1B980627C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((30
                                          * ((((a3 + a7 - 350 + a8 + 333) < 0xFFFFFFF0) ^ (81 * (a7 ^ 0xC7))) & 1)) ^ a7))
                            - 8))();
}

uint64_t sub_1B98062C8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v21;

  v12 = (a3 + v9 + v8 + 1227);
  v13 = v12 + v10;
  v14 = v12 & 0xF;
  v15 = v14 - v13 + v6;
  v16 = (v7 | v14) - v13;
  v17 = (v5 | v14) - v13;
  v21 = v15 > 0xF && v4 - v10 >= (((a4 ^ 0x15u) + 575) ^ 0x5BDuLL) && (unint64_t)(v16 + 1) > 0xF && v17 > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((248 * v21) ^ a4)) - 12))();
}

uint64_t sub_1B980634C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                       + 8
                                                                       * ((788
                                                                         * (((v7 < 0x10) ^ ((a7 ^ 0x37) - 1)) & 1)) ^ a7))
                                                           - 8))(a1, a2, 0);
}

uint64_t sub_1B9806384(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  char v63;
  unsigned int v64;
  int8x16_t v65;
  uint64_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16x4_t v70;
  int8x16x4_t v71;

  v63 = a4 + 2;
  v64 = (a4 + 1289949719) & 0xB31CEFDF;
  v70.val[1].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v70.val[1].i64[1] = ((_BYTE)a2 + v63 + 21 + 121) & 0xF;
  v70.val[2].i64[0] = ((_BYTE)a2 + 9) & 0xF;
  v70.val[2].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v65.i64[0] = 0x8787878787878787;
  v65.i64[1] = 0x8787878787878787;
  v66 = a2 + ((v64 - 527) ^ (v57 - 126));
  v70.val[0].i64[0] = ((_BYTE)a2 + ((v64 - 15) ^ (v57 - 126))) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v67.i64[0] = vqtbl4q_s8(v70, (int8x16_t)xmmword_1B981C650).u64[0];
  v71.val[0].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v71.val[1].i64[1] = ((_BYTE)a2 + 2) & 0xF;
  v71.val[2].i64[1] = a2 & 0xF;
  v71.val[3].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v71.val[0].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v71.val[1].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v71.val[2].i64[0] = ((_BYTE)a2 + 1) & 0xF;
  v71.val[3].i64[0] = ((_BYTE)a2 - 1) & 0xF;
  v67.i64[1] = vqtbl4q_s8(v71, (int8x16_t)xmmword_1B981C650).u64[0];
  v68 = vrev64q_s8(vmulq_s8(v67, v65));
  *(int8x16_t *)(*(_QWORD *)(v62 - 120) - 15 + v66) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v59 + (v66 & 0xF) - 15), *(int8x16_t *)(v56 - 15 + v66)), veorq_s8(*(int8x16_t *)((v66 & 0xF) + v60 - 14), *(int8x16_t *)(v58 + (v66 & 0xF) - 15))), vextq_s8(v68, v68, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a56 + 8 * (int)((13 * ((v61 & 0xFFFFFFF0) != 16)) ^ v64)) - 12))();
}

void sub_1B98064FC()
{
  JUMPOUT(0x1B9806488);
}

uint64_t sub_1B9806508(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((a7 ^ 0x70) + 614 * (a7 ^ 0x180) - 1679) * (v7 == a3)) ^ a7))
                            - 12))();
}

uint64_t sub_1B9806544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((353 * ((((a8 - 350) ^ (((a8 - 1220) & v8) == 0)) & 1) == 0)) ^ a8))
                                          - 8))(a1);
}

uint64_t sub_1B9806588@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  int8x16x4_t v63;

  v60 = v58 + a3 + v57;
  v61 = v60 + v52 - a1;
  v63.val[0].i64[0] = v61 & 0xF;
  v63.val[0].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 12) & 0xF;
  v63.val[1].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 11) & 0xF;
  v63.val[1].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + ((102 * (a2 ^ 0x98)) ^ 6)) & 0xF;
  v63.val[2].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 9) & 0xF;
  v63.val[2].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 8) & 0xF;
  v63.val[3].i64[0] = ((_BYTE)v60 - (_BYTE)a1 + 7) & 0xF;
  v63.val[3].i64[1] = ((_BYTE)v60 - (_BYTE)a1 + 6) & 0xF;
  *(int8x8_t *)(v59 - 7 + v61) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v54 + v63.val[0].i64[0] - 7), *(int8x8_t *)(v51 - 7 + v61)), veor_s8(*(int8x8_t *)(v63.val[0].i64[0] + v55 - 6), *(int8x8_t *)(v53 + v63.val[0].i64[0] - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v63, (int8x16_t)xmmword_1B981C660), (int8x8_t)0x8787878787878787)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a51 + 8 * ((1531 * (a1 - (v56 & 0xFFFFFFF8) == -8)) ^ a2))
                                         - 12))((__n128)xmmword_1B981C660);
}

void sub_1B98066A8()
{
  JUMPOUT(0x1B98065D8);
}

uint64_t sub_1B98066B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v24;
  int v25;
  uint64_t v26;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v26
                                                                                + 8
                                                                                * ((((v25 - 350) ^ 0x120) * (v24 == a7)) ^ v25))
                                                                    - 8))(a24, a2, a3, (v25 - 350) ^ 0x29Cu);
}

uint64_t sub_1B98066F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)(v12 + (a6 + v8)) = *(_BYTE *)(v10 + ((a6 + v8) & 0xFLL)) ^ *(_BYTE *)(v6
                                                                                               + (a6 + v8)) ^ *(_BYTE *)((((_BYTE)a6 + (_BYTE)v8) & 0xF) + v11 + 1) ^ *(_BYTE *)(v9 + (((_BYTE)a6 + (_BYTE)v8) & 0xF)) ^ (((a6 + v8) & 0xF) * ((a5 ^ 0x9C) - 107));
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((1008 * (a6 - 1 != v7)) ^ (a5 + 622))) - 4))();
}

uint64_t sub_1B9806758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  int v52;

  v50 = *(_QWORD *)(a1 + 24);
  *(int8x16_t *)(v48 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(a1 + 16) - 0x2CB40BEC8D7CDE9DLL), (int8x16_t)xmmword_1B981C670);
  if (v47)
    v51 = v50 == 0x39E8CCF6252BBBF8;
  else
    v51 = 1;
  v52 = v51;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * (int)(((((((_DWORD)a4 - 16) ^ v52) & 1) == 0) * (a4 + 763)) ^ a4)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_1B98067D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  uint64_t v48;
  _BOOL4 v50;

  v50 = (_DWORD)a25 == v47 + 547374634 || (((_BYTE)a25 + 4) & 0xF) != 11 * (v47 ^ 0x1D3) - 539;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (v47 ^ (16 * v50))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_1B9806824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55,int a56,int a57)
{
  uint64_t v57;

  return ((uint64_t (*)(void))(*(_QWORD *)(v57
                                        + 8
                                        * (a57 ^ (1830
                                                * (((2 * (a25 - ((2 * a55) & 0x73F15AF2) + 425223533)) & 0xF7EFFEEE ^ 0x73E15AE2)
                                                 + ((a25 - ((2 * a55) & 0x73F15AF2) + 425223533) ^ 0x420F520E)
                                                 - 277165155 != 1802685204))))
                            - 12))();
}

uint64_t sub_1B98068EC(int a1, int a2)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * (((a2 + a1 + 13 * (v2 ^ 0x20Fu) - 2079850918 > 7) * (v2 + 872)) ^ v2))
                            - 12))();
}

uint64_t sub_1B9806964(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((((2 * a3) ^ 0x442) * ((v6 + a6 - 16) > 0xFFFFFFEF)) ^ a3))
                            - 8))();
}

uint64_t sub_1B98069A0(int a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v23;

  v9 = (a2 + a1 + v6);
  v10 = v9 + v7 + 1;
  v11 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v6) & 0xF;
  v12 = v11 - v9;
  v13 = v4 + v12;
  ++v11;
  v14 = v4 + v11;
  v15 = v5 + v12;
  v16 = v5 + v11;
  v17 = v3 + v12;
  v18 = v3 + v11;
  v20 = v14 > v7 && v13 < v10;
  if (v16 > v7 && v15 < v10)
    v20 = 1;
  v23 = v18 > v7 && v17 < v10 || v20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a3 ^ (1455 * (v23 ^ 1))))
                            - (((a3 + 727) - 416) ^ a3 ^ 0x141u)))();
}

uint64_t sub_1B9806A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * ((((a6 - 2008942240) & 0x77BE03DF ^ 0x253)
                                                                         * (v6 < 0x10)) ^ a6))
                                                           - ((a6 + 1710980831) & 0x9A047FFE ^ 0x3E0)))(a1, a2, 0);
}

uint64_t sub_1B9806A88(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16x4_t v19;
  int8x16x4_t v20;

  v19.val[1].i64[0] = ((_BYTE)v8 + 9) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v8 + 8) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v8 + 7) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v8 + 6) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v8 + 5) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v8 + 4) & 0xF;
  v20.val[0].i64[0] = ((_BYTE)v8 + 3) & 0xF;
  v20.val[0].i64[1] = ((_BYTE)v8 + 2) & 0xF;
  v20.val[1].i64[0] = (v8 + 1) & 0xF;
  v20.val[1].i64[1] = v8 & 0xF;
  v20.val[2].i64[0] = (v8 - 1) & 0xF;
  v20.val[2].i64[1] = (v8 + 14) & 0xF;
  v20.val[3].i64[0] = ((_BYTE)v8 + 13) & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v8 + 12) & 0xF;
  v12.i64[0] = 0x505050505050505;
  v12.i64[1] = 0x505050505050505;
  v13.i64[0] = 0x3232323232323232;
  v13.i64[1] = 0x3232323232323232;
  v14 = v9 + a2 + a1 - 539 + (a4 ^ 0x1FFu);
  v19.val[0].i64[0] = ((_BYTE)v9 + (_BYTE)a2 + (_BYTE)a1 - 27 + ~(_BYTE)a4) & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v8 + 10) & 0xF;
  v15.i64[0] = vqtbl4q_s8(v19, (int8x16_t)xmmword_1B981C650).u64[0];
  v15.i64[1] = vqtbl4q_s8(v20, (int8x16_t)xmmword_1B981C650).u64[0];
  v16 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v10 - 15 + v14), *(int8x16_t *)(v6 + (v14 & 0xF) - 15)), veorq_s8(*(int8x16_t *)(v7 + (v14 & 0xF) - 15), *(int8x16_t *)(v5 + (v14 & 0xF) - 15))));
  v17 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v16, v16, 8uLL), v13), vmulq_s8(v15, v12)));
  *(int8x16_t *)(v10 - 15 + v14) = vextq_s8(v17, v17, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1673 * ((v4 & 0xFFFFFFF0) == 16)) ^ a4)) - 8))();
}

void sub_1B9806BE4()
{
  JUMPOUT(0x1B9806B60);
}

uint64_t sub_1B9806BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,unsigned int a55,uint64_t a56,uint64_t a57)
{
  unsigned __int8 *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  int v69;
  unsigned __int8 v70;
  unint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  int v103;
  unsigned int v104;
  int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  int v116;
  int v117;
  unsigned int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  int v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  char *v140;
  char *v141;
  int v142;
  char *v143;
  int v144;
  char *v145;
  int v146;
  int v147;
  int v148;
  int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  int v154;
  int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  int v176;
  int v177;
  int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  unsigned int v188;
  int v189;
  unsigned int v190;
  int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  int v196;
  unsigned int v197;
  int v198;
  int v199;
  unsigned int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  unsigned int v212;
  int v213;
  unsigned int v214;
  int v215;
  int v216;
  unsigned int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  unsigned int v224;
  unsigned int v225;
  int v226;
  int v227;
  int v228;
  unsigned int v229;
  int v230;
  int v231;
  char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  unsigned int v236;
  int v237;
  unsigned int v238;
  unsigned __int8 *v239;
  unsigned int v240;
  int v241;
  int v242;
  unsigned __int8 v243;
  uint64_t v244;
  uint64_t v245;
  int v246;
  uint64_t v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  uint64_t v258;
  unsigned int v259;
  unsigned int v260;
  unsigned int v261;
  uint64_t v262;
  unsigned int v263;
  unsigned int v264;
  unsigned int v265;
  uint64_t v266;
  int v267;
  int v268;
  unint64_t v269;
  int v270;
  char *v271;
  int v272;
  int v273;
  int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  int v283;
  int v284;
  unsigned int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  int v289;
  int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  int v294;
  unsigned int v295;
  int v296;
  int v297;
  int v298;
  unsigned int v299;
  unsigned int v300;
  int v301;
  int v302;
  int v303;
  unsigned int v304;
  unsigned int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  unsigned int v312;
  unsigned int v313;
  unsigned int v314;
  unsigned int v315;
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
  unsigned int v326;
  unsigned int v327;
  int v328;
  int v329;
  int v330;
  int v331;
  unsigned int v332;
  int v333;
  int v334;
  unsigned int v335;
  int v336;
  int v337;
  unsigned int v338;
  int v339;
  int v340;
  int v341;
  unsigned int v342;
  unsigned int v343;
  unsigned int v344;
  int v345;
  unsigned int v346;
  int v347;
  unsigned int v348;
  unsigned int v349;
  int v350;
  int v351;
  unsigned int v352;
  unsigned int v353;
  int v354;
  unsigned int v355;
  int v356;
  int v357;
  int v358;
  unsigned int v359;
  unsigned int v360;
  unsigned int v361;
  int v362;
  int v363;
  int v364;
  unsigned int v365;
  int v366;
  unsigned int v367;
  unsigned int v368;
  unsigned int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  unsigned int v375;
  int v376;
  int v377;
  unsigned int v378;
  unsigned int v379;
  int v380;
  int v381;
  int v382;
  int v383;
  int v384;
  unsigned int v385;
  int v386;
  int v387;
  unsigned int v388;
  unsigned int v389;
  int v390;
  int v391;
  unsigned int v392;
  unsigned int v393;
  unsigned int v394;
  unsigned int v395;
  int v396;
  int v397;
  int v398;
  unsigned int v399;
  int v400;
  int v401;
  int v402;
  unsigned int v403;
  unsigned int v404;
  int v405;
  int v406;
  int v407;
  int v408;
  unsigned int v409;
  int v410;
  int v411;
  unsigned int v412;
  unsigned int v413;
  int v414;
  char *v415;
  char *v416;
  int v417;
  char *v418;
  int v419;
  int v420;
  int v421;
  int v422;
  char *v423;
  int v424;
  uint64_t v425;
  uint64_t v426;
  int v427;
  char *v428;
  char *v429;
  char *v430;
  int v431;
  int v432;
  unsigned int v433;
  unsigned int v434;
  int v435;
  char *v436;
  int v437;
  unsigned int v438;
  unsigned int v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  int v447;
  uint64_t v448;
  unsigned int v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  unsigned int v453;
  unsigned int v454;
  uint64_t v455;
  unsigned int v456;
  uint64_t v457;
  unsigned __int8 v458;
  int v459;
  unsigned int v460;
  uint64_t v461;
  int v462;
  __int16 v463;
  uint64_t v464;
  int v465;
  unsigned int v466;
  uint64_t v467;
  unsigned int v468;
  unsigned int v469;
  unsigned int v470;
  uint64_t v471;
  unsigned int v472;
  int v473;
  unsigned int v474;
  uint64_t v475;
  int v476;
  unsigned int v477;
  unsigned int v478;
  int v479;
  uint64_t v480;
  int v481;
  int v482;
  int v483;
  unsigned int v484;
  unsigned int v485;
  uint64_t v486;
  int v487;
  unsigned int v488;
  int v489;
  int v490;
  unsigned int v491;
  int v492;
  uint64_t v493;
  unsigned int v494;
  unsigned int v495;
  __int16 v496;
  unsigned int v497;
  int v498;
  uint64_t v499;
  unsigned int v500;
  int v501;
  unsigned __int8 v502;
  unsigned int v503;
  uint64_t v504;
  int v505;
  int v506;
  unsigned int v507;
  unsigned int v508;
  uint64_t v509;
  unsigned int v510;
  int v511;
  unsigned int v512;
  uint64_t v513;
  int v514;
  unsigned int v515;
  int v516;
  int v517;
  uint64_t v518;
  unsigned int v519;
  int v520;
  int v521;
  int v522;
  uint64_t v523;
  int v524;
  unsigned int v525;
  int v526;
  unsigned int v527;
  int v528;
  uint64_t v529;
  int v530;
  int v531;
  unsigned int v532;
  int v533;
  unsigned int v534;
  uint64_t v535;
  int v536;
  int v537;
  unsigned int v538;
  int v539;
  int v540;
  uint64_t v541;
  int v542;
  unsigned int v543;
  int v544;
  uint64_t v545;
  unsigned int v546;
  unsigned int v547;
  unsigned int v548;
  int v549;
  int v550;
  uint64_t v551;
  int v552;
  unsigned int v553;
  int v554;
  unsigned int v555;
  uint64_t v556;
  int v557;
  unsigned int v558;
  int v559;
  unsigned int v560;
  int v561;
  uint64_t v562;
  int v563;
  int v564;
  int v565;
  uint64_t v566;
  int v567;
  unsigned int v568;
  int v569;
  int v570;
  uint64_t v571;
  __int16 v572;
  int v573;
  uint64_t v574;
  int v575;
  unsigned int v576;
  unsigned int v577;
  uint64_t v578;
  int v579;
  uint64_t v580;
  int v581;
  uint64_t v582;
  unsigned int v583;
  char *v584;
  uint64_t v585;
  uint64_t v586;
  unint64_t v587;
  unsigned int v588;
  int v589;
  int v590;
  unsigned int v591;
  unsigned int v592;
  unsigned int v593;
  int v594;
  int v595;
  int v596;
  unsigned int v597;
  int v598;
  unsigned int v599;
  int v600;
  int v601;
  unsigned int v602;
  int v603;

  v62 = v59 - 326;
  v63 = (2 * (v59 - 326)) ^ 0x256;
  *(_DWORD *)(v61 - 124) = v63;
  v64 = *(_QWORD *)(v60 + 8 * (v59 - 479)) - 4;
  v65 = *(_QWORD *)(v60 + 8 * ((v59 - 326) ^ 0xA7));
  v66 = (*(unsigned __int8 *)(v65 + (*v57 ^ 0xB1)) ^ 0xA7) << (v63 - 86);
  v67 = *(_QWORD *)(v60 + 8 * ((v59 - 326) ^ 0x24));
  v68 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEBLL) ^ 0x49));
  v69 = v66 | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF6) ^ 0xD7)) ^ 0x96) << 8);
  HIDWORD(v71) = v68 ^ 2;
  LODWORD(v71) = (v68 ^ 0xFFFFFF9F) << 24;
  v70 = v71 >> 26;
  v72 = *(_QWORD *)(v60 + 8 * (v62 - 127));
  v73 = *(unsigned __int8 *)(v65 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBECLL) ^ 0xB8));
  v74 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEFLL) ^ 0x6BLL));
  HIDWORD(v71) = v74 ^ 2;
  LODWORD(v71) = (v74 ^ 0xFFFFFF9F) << 24;
  v75 = ((v71 >> 26) ^ 0x53) << 16;
  LOBYTE(v68) = *(_BYTE *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEALL) ^ 0x2ELL));
  v76 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF7) ^ 0x47));
  HIDWORD(v71) = v76 ^ 2;
  LODWORD(v71) = (v76 ^ 0xFFFFFF9F) << 24;
  v77 = v69 | (*(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF5) ^ 0xECLL)) + 119) ^ 9 | (((v71 >> 26) ^ 0x1E) << 16);
  v78 = v75 | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEELL) ^ 0x77)) ^ 0x59) << 8);
  v79 = (*(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF1) ^ 0xA9)) + 119) | ((*(unsigned __int8 *)(v64 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF2) ^ 0x30)) ^ 0xA3) << 8);
  v80 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF3) ^ 0xCBLL));
  LOBYTE(v67) = *(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBE9) ^ 0x36)) + 119;
  HIDWORD(v71) = v80 ^ 2;
  LODWORD(v71) = (v80 ^ 0xFFFFFF9F) << 24;
  v81 = ((v70 ^ 0xFB) << 16) | ((v73 ^ 0x1F) << 24) | ((v68 ^ 0x53) << 8);
  LOBYTE(v64) = *(_BYTE *)(v72 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBEDLL) ^ 0xB5));
  v82 = v79 & 0xFF00FFFF | (((v71 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v65
                                                                                                + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF4) ^ 0x35)) ^ 0x68) << 24);
  v83 = *(_QWORD *)(v60 + 8 * (v62 ^ 0xCD)) - 8;
  v84 = v78 | ((*(unsigned __int8 *)(v65 + (*(unsigned __int8 *)(v58 - 0x39E8CCF6252BBBF0) ^ 0xBFLL)) ^ 0x71) << 24);
  v85 = v70 ^ 0x61u;
  v86 = *(_QWORD *)(v60 + 8 * (v62 ^ 0x40)) - 8;
  LODWORD(v65) = *(_DWORD *)(v83 + 4 * (v67 ^ 0xFDu)) ^ 0x5859772F ^ *(_DWORD *)(v86 + 4 * v85);
  v87 = v73 ^ 0x8Au;
  v88 = *(_QWORD *)(v60 + 8 * (v62 ^ 3)) - 12;
  LODWORD(v65) = (v65 - 1142355399 + (~(2 * v65) | 0x882DEB8D) + 1) ^ *(_DWORD *)(v88 + 4 * v87);
  LODWORD(v85) = v65 - ((2 * v65) & 0xFEC65660);
  v89 = *(_QWORD *)(v60 + 8 * (int)(v62 & 0x8524C8B7)) - 4;
  LOBYTE(v67) = v67 ^ 0x2A;
  v588 = v81 & 0xFFFFFF00 | v67;
  LOBYTE(v64) = (v64 + 119) ^ 0xA8;
  v90 = v84 & 0xFFFFFF00 | v64;
  v587 = __PAIR64__(v77, v82);
  v473 = *(_DWORD *)(v89 + 4 * (v68 ^ 0x6Bu)) ^ v77 ^ (v85 - 10278096);
  *(_DWORD *)(v61 - 176) = v473 ^ v82;
  v91 = v473 ^ v82 ^ 0x4D;
  v502 = v473 ^ v82 ^ 0x4D;
  *(_DWORD *)(v61 - 168) = v91 ^ v90;
  v92 = v91 ^ v90 ^ (v588 - 2 * ((v81 & 0x4D356500 | v67 & 0xD7) ^ v67 & 0x10) - 852138553);
  v516 = ((unsigned __int16)(v91 ^ v90 ^ ((v81 & 0xFF00 | v67)
                                                         - 2 * ((v81 & 0x6500 | v67 & 0xD7) ^ v67 & 0x10)
                                                         + 26055)) >> 8);
  v505 = BYTE2(v92);
  LODWORD(v87) = *(_DWORD *)(v89 + 4 * (v516 ^ 0x9Fu)) ^ *(_DWORD *)(v86 + 4 * (BYTE2(v92) ^ 0x8Bu));
  v93 = v92 ^ 0x77C2486E;
  v514 = v92;
  v94 = ((v87 ^ 0xF8092AD9) - ((2 * (v87 ^ 0xF8092AD9)) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83
                                                                                                + 4
                                                                                                * (v92 ^ 0xEEu));
  v510 = HIBYTE(v93);
  v95 = v473 ^ *(_DWORD *)(v88 + 4 * (HIBYTE(v93) ^ 0x65)) ^ (v94 - ((2 * v94) & 0x77D21472) - 1142355399);
  HIDWORD(v586) = v90;
  v96 = v90 - 2 * (v90 & 0x33FC9F2E ^ v64 & 4) - 1275289814;
  LODWORD(v64) = v95 ^ 0xB3FC9F2A;
  v97 = v95;
  *(_DWORD *)(v61 - 160) = v95;
  v98 = v95 ^ 0xB3FC9F2A ^ v96;
  v99 = v98 ^ v93;
  LODWORD(v87) = v98;
  *(_DWORD *)(v61 - 128) = v98;
  v530 = BYTE2(v99);
  v533 = BYTE1(v99);
  v100 = *(_DWORD *)(v86 + 4 * (BYTE2(v99) ^ 0x2Eu)) ^ *(_DWORD *)(v89 + 4 * (BYTE1(v99) ^ 0x9Bu)) ^ 0xF8092AD9;
  v601 = v99;
  v101 = (v100 - ((2 * v100) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4 * (v99 ^ 0xD2u));
  v102 = v99 ^ 0xB978221C;
  *(_DWORD *)(v61 - 192) = HIBYTE(v99);
  v103 = (v101 - ((2 * v101) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4 * (HIBYTE(v99) ^ 0x69));
  v104 = v103 ^ v91 ^ 0xD520653E;
  v557 = v103 ^ v91;
  *(_DWORD *)(v61 - 152) = v104 ^ v98;
  v105 = ((v104 ^ v87 ^ 0x4FA668D4) - ((2 * (v104 ^ v87 ^ 0x4FA668D4)) & 0x9BBF06AA) - 840989867) ^ v102;
  v106 = v105 ^ 0x9547167F;
  v567 = ((v105 ^ 0x9547167F) >> 16);
  v589 = ((unsigned __int16)(v105 ^ 0x167F) >> 8);
  v107 = *(_DWORD *)(v86 + 4 * (v567 ^ 0x89u)) ^ *(_DWORD *)(v89 + 4 * (v589 ^ 0x3Au)) ^ 0xF8092AD9;
  v575 = (((v104 ^ v87 ^ 0xD4) - ((2 * (v104 ^ v87 ^ 0xD4)) & 0xAA) + 85) ^ v102);
  v108 = (v107 - ((2 * v107) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4 * (v575 ^ 0xE4u));
  v592 = HIBYTE(v106);
  v109 = (v108 - ((2 * v108) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4 * (HIBYTE(v106) ^ 0x1D));
  v538 = v103 ^ v97;
  v599 = (v109 - ((2 * v109) & 0xA38B4F64) - 775575630) ^ v103 ^ v97;
  v110 = v599 ^ 0xD1C5A7B2 ^ v103 ^ v91;
  *(_DWORD *)(v61 - 224) = v599 ^ 0xD1C5A7B2;
  *(_DWORD *)(v61 - 256) = v110;
  v111 = ((v110 ^ 0xFE25CD6D) - ((2 * (v110 ^ 0xFE25CD6D)) & 0x9BBF06AA) - 840989867) ^ v102;
  *(_DWORD *)(v61 - 200) = BYTE1(v111);
  v112 = *(_DWORD *)(v89 + 4 * (BYTE1(v111) ^ 0x6Fu));
  *(_DWORD *)(v61 - 208) = BYTE2(v111);
  v113 = *(_DWORD *)(v86 + 4 * (BYTE2(v111) ^ 0xA8u));
  v524 = v64 ^ ((v473 ^ v82 ^ 0xBAF72DE4) - ((2 * (v473 ^ v82 ^ 0xBAF72DE4)) & 0x67F93E54) - 1275289814);
  *(_DWORD *)(v61 - 232) = HIBYTE(v111);
  LODWORD(v67) = ((v112 ^ v113 ^ 0xF8092AD9) - ((2 * (v112 ^ v113 ^ 0xF8092AD9)) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4 * (HIBYTE(v111) ^ 0x85));
  *(_DWORD *)(v61 - 248) = v111;
  LODWORD(v67) = (v67 - ((2 * v67) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4 * (v111 ^ 0x25u));
  v602 = v110 ^ v104 ^ v98;
  v114 = (v67 - ((2 * v67) & 0xDFAE912E) + 1876379799) ^ v104 ^ v602;
  v115 = (v67 - ((2 * v67) & 0xDFAE912E) + 1876379799) ^ v104;
  *(_DWORD *)(v61 - 132) = v114;
  LODWORD(v64) = v111 ^ v114 ^ 0x355EFF67;
  v116 = v114 ^ 0x355EFF67;
  v463 = v114 ^ 0xFF67;
  *(_DWORD *)(v61 - 240) = v111;
  v500 = (v64 ^ 0x6D8C20B0) >> 24;
  v490 = ((v64 ^ 0x6D8C20B0) >> 16);
  v117 = *(_DWORD *)(v86 + 4 * (v490 ^ 0x89u)) ^ *(_DWORD *)(v88 + 4 * (v500 ^ 0x1D));
  v487 = ((unsigned __int16)(v64 ^ 0x20B0) >> 8);
  v118 = ((v117 ^ 0xBC830BD0) - 2 * ((v117 ^ 0xBC830BD0) & 0x7F632B32 ^ v117 & 2) - 10278096) ^ *(_DWORD *)(v89 + 4 * (v487 ^ 0x3Au));
  *(_DWORD *)(v61 - 184) = v599 ^ 0xD1C5A7B2 ^ v67;
  v481 = v64;
  LODWORD(v64) = v599 ^ 0xD1C5A7B2 ^ v67 ^ *(_DWORD *)(v83 + 4 * (v64 ^ 0x2Bu)) ^ (v118 - ((2 * v118) & 0xBE66ED8C) + 1597208262);
  v119 = v64 ^ v115 ^ 0x7C166C11;
  v120 = v64;
  v579 = v64;
  LODWORD(v67) = (v119 ^ v111) >> 24;
  *(_DWORD *)(v61 - 216) = v67;
  v569 = (v119 ^ v111);
  LODWORD(v67) = *(_DWORD *)(v88 + 4 * (v67 ^ 0x9B)) ^ *(_DWORD *)(v83 + 4 * (v569 ^ 0x31u)) ^ 0xE4DA7CFF;
  v546 = ((v119 ^ v111) >> 8) ^ 0x86839A;
  v554 = ((unsigned __int16)(v119 ^ v111) >> 8) ^ 0x9A;
  v121 = (v67 - ((2 * v67) & 0xFEC65660) - 10278096) ^ *(_DWORD *)(v89
                                                                 + 4
                                                                 * (((unsigned __int16)(v119 ^ v111) >> 8) ^ 0xA0u));
  LODWORD(v67) = v119 ^ v111 ^ 0xE42FE6B3;
  v552 = ((v119 ^ v111) >> 16);
  LODWORD(v64) = (v121 - ((2 * v121) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4 * (v552 ^ 0xAu));
  v122 = (v64 - ((2 * v64) & 0xD4DD4916) - 361847669) ^ v120;
  *(_DWORD *)(v61 - 136) = v122;
  v123 = v122 ^ 0x17ED3E21;
  v124 = v122 ^ 0x17ED3E21 ^ v119;
  v496 = v122 ^ 0x3E21;
  v560 = v119 ^ v116;
  LODWORD(v85) = v119;
  v536 = v119;
  v125 = v119 ^ v116 ^ 0x4158620E;
  *(_DWORD *)(v61 - 140) = v125;
  v126 = ((v124 ^ 0x5A137D54) - ((2 * (v124 ^ 0x5A137D54)) & 0xACCAC996) - 697998133) ^ v125;
  v127 = ((v126 ^ 0xB97FFD6F) - 2 * ((v126 ^ 0x3EE0256F) & 4 ^ (v126 ^ 0xB97FFD6F) & 0x62AC7C1D) + 1655471129) ^ v67 ^ 0x479AB031;
  v581 = (((v126 ^ 0x6F) - 2 * ((v126 ^ 0x6F) & 4 ^ (v126 ^ 0x6F) & 0x1D) + 25) ^ v67);
  v128 = *(_DWORD *)(v89 + 4 * (BYTE1(v127) ^ 0x3Au)) ^ *(_DWORD *)(v83 + 4 * (v581 ^ 0xAAu)) ^ 0xA0505DF6;
  v129 = (v128 - ((2 * v128) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4 * (BYTE2(v127) ^ 0x89u));
  v130 = (v129 - ((2 * v129) & 0x77D21472) - 1142355399) ^ *(_DWORD *)(v88 + 4 * (HIBYTE(v127) ^ 0x1D));
  v131 = v130 ^ v85;
  v132 = ((v130 ^ v85 ^ 0xA6C48CD5) - ((2 * (v130 ^ v85 ^ 0xA6C48CD5)) & 0xC558F832) + 1655471129) ^ v67;
  v133 = *(_DWORD *)(v88 + 4 * (HIBYTE(v132) ^ 5)) ^ *(_DWORD *)(v89 + 4 * (BYTE1(v132) ^ 0x6Fu)) ^ 0x448A2109;
  v565 = (((v130 ^ v85 ^ 0xD5) - ((2 * (v130 ^ v85 ^ 0xD5)) & 0x32) + 25) ^ v67);
  v134 = (v133 - ((2 * v133) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83 + 4 * (v565 ^ 0x25u));
  v135 = v123 ^ v130;
  v136 = v123 ^ v130 ^ *(_DWORD *)(v86 + 4 * (BYTE2(v132) ^ 0xA8u)) ^ (v134 - ((2 * v134) & 0xED403D2) + 124387817);
  v137 = v126 ^ 0x3EE0256F ^ v136;
  v583 = v137;
  v595 = ((unsigned __int16)(v137 ^ v132) >> 8);
  v469 = (v137 ^ v132) >> 24;
  LODWORD(v88) = *(_DWORD *)(v89 + 4 * (v595 ^ 0x44u)) ^ *(_DWORD *)(v88 + 4 * (v469 ^ 0x47));
  v476 = (v137 ^ v132);
  v138 = ((v88 ^ 0x448A2109) - ((2 * (v88 ^ 0x448A2109)) & 0xBE66ED8C) + 1597208262) ^ *(_DWORD *)(v83
                                                                                                 + 4 * (v476 ^ 0xD5u));
  v459 = ((v137 ^ v132) >> 16);
  v139 = (v138 - ((2 * v138) & 0xED403D2) + 124387817) ^ *(_DWORD *)(v86 + 4 * (v459 ^ 0xCBu));
  LODWORD(v586) = v136 ^ 0x29F34BD1 ^ (v139 - ((2 * v139) & 0x5208CCF0) - 1459329416);
  v465 = v136 ^ v131;
  v466 = v136;
  v458 = BYTE2(v137) ^ 0x63;
  HIDWORD(v585) = v136 ^ v131 ^ 0xBC788024 ^ (v586 - ((2 * v586) & 0x31B49E60) - 1730523344);
  LODWORD(v585) = HIDWORD(v585) ^ v137 ^ 0x42632BF0 ^ 0x4662A266;
  HIDWORD(a49) = (v585 - 2 * (v585 & 0x60991DD ^ (HIDWORD(v585) ^ v137 ^ 0x42632BF0) & 9) + 101290452) ^ v137 ^ v132;
  v140 = (char *)*(&off_1E709D0C0 + (v62 ^ 0x39)) - 12;
  LODWORD(v86) = (((v135 ^ 0x1B9155BDu) >> 16)
                + 441139960
                + ((2 * ((v135 ^ 0x1B9155BDu) >> 16) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (((v135 ^ 0x1B9155BDu) >> 16) ^ 0x2D)];
  LODWORD(v88) = ((BYTE2(v132) ^ 0x89) + 441139959 - ((2 * (BYTE2(v132) ^ 0x89) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v132) ^ 0xA4)];
  v141 = (char *)*(&off_1E709D0C0 + v62 + 40) - 4;
  v142 = (v86 - ((2 * v86) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v135) ^ 0x47)];
  LODWORD(v89) = v88 - ((2 * v88) & 0xB6BB4012);
  v594 = v62;
  v143 = (char *)*(&off_1E709D0C0 + v62 + 14) - 4;
  v144 = (v89 - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v132) ^ 0xCC)];
  v572 = v126 ^ 0x256F ^ v131;
  v145 = (char *)*(&off_1E709D0C0 + v62 + 55) - 12;
  LODWORD(v67) = *(_DWORD *)&v145[4 * (v126 ^ 0x6F ^ v131 ^ 0x53)];
  v146 = ((v126 ^ 0x3EE0256F ^ v131) >> 16);
  LODWORD(v67) = *(_DWORD *)&v140[4 * (v146 ^ 0xAA)] ^ *(_DWORD *)&v143[4 * (((v126 ^ 0x3EE0256F ^ v131) >> 24) ^ 0x3E)] ^ ((v146 ^ 0x87) + 441139960 + ((2 * (v146 ^ 0x87) + 88) & 0x196 ^ 0xF6F76FFF)) ^ (181304767 * v67 - ((362609534 * v67 - 27765796) & 0xB6BB4012) + 1518979575);
  v147 = *(_DWORD *)&v145[4 * (v131 ^ 0x74)];
  v148 = (181304767 * v147 - ((362609534 * v147 + 2119717852) & 0x5C4753DE) + 760206301) ^ *(_DWORD *)&v141[4 * (BYTE1(v131) ^ 0x5A)];
  v577 = v148 - ((2 * v148) & 0xB6BB4012);
  v543 = BYTE1(v132) ^ 0xB0;
  v563 = v144 - ((2 * v144) & 0x5C4753DE);
  v549 = v67 - ((2 * v67) & 0x5C4753DE);
  v591 = (v142 - ((2 * v142) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * ((v135 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)&v145[4 * (v135 ^ 0x7D)] + 2133600750);
  v149 = *(_DWORD *)&v140[4 * (((v524 ^ 0xE9B45E6C) >> 16) ^ 0xF5)] ^ ((((v524 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                      + 441139959
                                                                                      - ((2
                                                                                        * (((v524 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                        + 160207960) & 0x9089196));
  v150 = *(_DWORD *)(v61 - 128) ^ 0x31676F78;
  v151 = *(_DWORD *)&v140[4 * (BYTE2(v150) ^ 0x7B)] ^ ((BYTE2(v150) ^ 0x56)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v150) ^ 0x56) + 88) & 0x196 ^ 0xF6F76FFF));
  v152 = (v151 - 614621175 + (~(2 * v151) | 0x4944BFED) + 1) ^ *(_DWORD *)&v143[4 * HIBYTE(v150)];
  v153 = *(_DWORD *)&v140[4 * (v530 ^ 0x34)] ^ ((v530 ^ 0x19)
                                              + 441139960
                                              + ((2 * (v530 ^ 0x19) + 88) & 0x196 ^ 0xF6F76FFF));
  v154 = (v153 - ((2 * v153) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v533 ^ 5)];
  v531 = v152 - ((2 * v152) & 0x5C4753DE);
  v534 = v154 - ((2 * v154) & 0xB6BB4012);
  v155 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 160) ^ 0xDF)];
  v156 = *(_DWORD *)(v61 - 160) ^ 0x5A18571F;
  v157 = *(_DWORD *)&v143[4 * HIBYTE(v156)] ^ ((BYTE2(v156) ^ 0xC1)
                                             + 441139960
                                             + ((2 * (BYTE2(v156) ^ 0xC1) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (BYTE2(v156) ^ 0xEC)] ^ ((~(362609534 * v155 - 27765796) | 0x4944BFED) + 181304767 * v155 + 1518979576);
  v527 = v157 - ((2 * v157) & 0x5C4753DE);
  LODWORD(v67) = *(_DWORD *)&v143[4 * ((v524 ^ 0xE9B45E6C) >> 24)] ^ (v149 - ((2 * v149) & 0xB6BB4012) - 614621175);
  v468 = v524 ^ 0xAC;
  v519 = BYTE1(v524) ^ 0xB4;
  v521 = v67 - ((2 * v67) & 0x5C4753DE);
  LOWORD(v89) = v124 ^ 0x8EA4;
  v158 = v124 ^ 0x35C48CD5;
  v159 = v126 ^ 0x5C7FFD6F;
  v525 = HIBYTE(v126) ^ 0x2B;
  v160 = *(_DWORD *)&v140[4 * (BYTE2(v127) ^ 0xDE)] ^ ((BYTE2(v127) ^ 0xF3)
                                                     + 441139959
                                                     - ((2 * (BYTE2(v127) ^ 0xF3) + 160207960) & 0x9089196));
  v161 = *(_DWORD *)&v140[4 * (BYTE2(v158) ^ 0xFE)] ^ ((BYTE2(v158) ^ 0xD3)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v158) ^ 0xD3) + 88) & 0x196 ^ 0xF6F76FFF));
  v162 = *(_DWORD *)&v145[4 * (v126 ^ 0xAA)];
  v163 = (v160 - ((2 * v160) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v127) ^ 0x36)];
  v164 = BYTE2(*(_DWORD *)(v61 - 136));
  v165 = *(_DWORD *)&v140[4 * (v164 ^ 0xC1)] ^ ((v164 ^ 0xEC)
                                              + 441139960
                                              + ((2 * (v164 ^ 0xEC) + 88) & 0x196 ^ 0xF6F76FFF));
  v166 = (v165 - ((2 * v165) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (HIBYTE(v496) ^ 0x8B)];
  v507 = v163 - ((2 * v163) & 0x5C4753DE);
  v512 = v166 - ((2 * v166) & 0xB6BB4012);
  v167 = *(_DWORD *)&v141[4 * (BYTE1(v159) ^ 0x20)] ^ ((BYTE2(v159) ^ 0xD7)
                                                     + 441139959
                                                     - ((2 * (BYTE2(v159) ^ 0xD7) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v159) ^ 0xFA)] ^ (181304767 * v162 - ((362609534 * v162 + 2119717852) & 0x5C4753DE) + 760206301);
  v168 = (v161 - ((2 * v161) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * HIBYTE(v158)] ^ (181304767
                                                                                              * *(_DWORD *)&v145[4 * (v89 ^ 0x99)]
                                                                                              + 2133600750);
  v477 = BYTE1(v89) ^ 0x14;
  v456 = v496 ^ 0xA3;
  v484 = v168 - ((2 * v168) & 0x5C4753DE);
  v497 = v167 - ((2 * v167) & 0xB6BB4012);
  v478 = v473 ^ 0x2BEAE26B;
  LODWORD(v67) = *(_DWORD *)&v140[4 * (((v473 ^ 0x2BEAE26Bu) >> 16) ^ 0xEC)] ^ ((((v473 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                               + 441139960
                                                                                               + ((2
                                                                                                 * (((v473 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                                 + 88) & 0x196 ^ 0xF6F76FFF)) ^ (181304767 * *(_DWORD *)&v145[4 * (v473 ^ 0x1E)] + 2133600750);
  LODWORD(v67) = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v473) ^ 8)];
  v169 = *(_DWORD *)&v140[4 * (v505 ^ 0x15)] ^ ((v505 ^ 0x38)
                                              + 441139960
                                              + ((2 * (v505 ^ 0x38) + 88) & 0x196 ^ 0xF6F76FFF));
  v170 = *(_DWORD *)&v145[4 * (v502 ^ 0x55)];
  v506 = v67 - ((2 * v67) & 0xB6BB4012);
  v462 = BYTE2(*(_DWORD *)(v61 - 168));
  v503 = (v462 ^ 0xA7) + 441139960 + ((2 * (v462 ^ 0xA7) + 88) & 0x196 ^ 0xF6F76FFF);
  LODWORD(v67) = (v169 - ((2 * v169) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v516 ^ 0xF5)] ^ (181304767 * *(_DWORD *)&v145[4 * (v514 ^ 0x9D)] + 2133600750);
  v517 = v67 - ((2 * v67) & 0xB6BB4012);
  v171 = *(_DWORD *)(v61 - 176);
  v172 = (181304767 * v170 - ((362609534 * v170 - 27765796) & 0xB6BB4012) + 1518979575) ^ ((BYTE2(v171) ^ 0xBA)
                                                                                         + 441139960
                                                                                         + ((2 * (BYTE2(v171) ^ 0xBA)
                                                                                           + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v143[4 * (HIBYTE(v171) ^ 0x2F)] ^ *(_DWORD *)&v140[4 * (BYTE2(v171) ^ 0x97)];
  v474 = v172 - ((2 * v172) & 0x5C4753DE);
  v173 = BYTE2(*(_DWORD *)(v61 - 132));
  v174 = *(_DWORD *)&v140[4 * (v173 ^ 0x25)] ^ ((v173 ^ 8) + 441139960 + ((2 * (v173 ^ 8) + 88) & 0x196 ^ 0xF6F76FFF));
  LODWORD(v89) = *(_DWORD *)(v61 - 184);
  v175 = *(_DWORD *)&v140[4 * (BYTE2(v89) ^ 0x56)] ^ ((BYTE2(v89) ^ 0x7B)
                                                    + 441139960
                                                    + ((2 * (BYTE2(v89) ^ 0x7B) + 88) & 0x196 ^ 0xF6F76FFF));
  v176 = *(_DWORD *)&v145[4 * (v115 ^ 0xFB)];
  v177 = (v174 - ((2 * v174) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (HIBYTE(v463) ^ 0x60)] ^ (181304767 * *(_DWORD *)&v145[4 * (v463 ^ 0xC3)] + 2133600750);
  v178 = (181304767 * v176 - ((362609534 * v176 + 2119717852) & 0x5C4753DE) + 760206301) ^ *(_DWORD *)&v141[4 * (BYTE1(v115) ^ 0xEF)];
  LODWORD(v464) = v177 - ((2 * v177) & 0xB6BB4012);
  LODWORD(v457) = v178 - ((2 * v178) & 0xB6BB4012);
  v179 = (v175 - ((2 * v175) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (BYTE3(v89) ^ 0xD9)] ^ (181304767 * *(_DWORD *)&v145[4 * (v89 ^ 0x79)] + 2133600750);
  v180 = *(_DWORD *)&v140[4 * (v490 ^ 0x86)] ^ ((v490 ^ 0xAB)
                                              + 441139960
                                              + ((2 * (v490 ^ 0xAB) + 88) & 0x196 ^ 0xF6F76FFF));
  v181 = (v180 - ((2 * v180) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * v500];
  v454 = v487 ^ 0xEE;
  v453 = v481 ^ 0x8D;
  v491 = v181 - ((2 * v181) & 0x5C4753DE);
  v488 = v179 - ((2 * v179) & 0x5C4753DE);
  v482 = BYTE2(v115) ^ 0x16;
  v515 = (BYTE2(v115) ^ 0x73) + 441139960 + ((2 * (BYTE2(v115) ^ 0x73) + 88) & 0x196 ^ 0xF6F76FFF);
  v182 = *(_DWORD *)&v140[4 * (v459 ^ 0x8B)] ^ ((v459 ^ 0xA6)
                                              + 441139960
                                              + ((2 * (v459 ^ 0xA6) + 88) & 0x196 ^ 0xF6F76FFF));
  v501 = (v458 ^ 0xEC) + 441139959 - ((2 * (v458 ^ 0xEC) + 160207960) & 0x9089196);
  v183 = v469 ^ 0x22;
  v494 = HIBYTE(v115) ^ 0xE8;
  v184 = *(_DWORD *)&v140[4 * (BYTE2(v466) ^ 0xE8)] ^ ((BYTE2(v466) ^ 0xC5)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v466) ^ 0xC5) + 88) & 0x196 ^ 0xF6F76FFF));
  v185 = (181304767 * *(_DWORD *)&v145[4 * (v466 ^ 0xCA)] + 2133600750) ^ *(_DWORD *)&v143[4 * (HIBYTE(v466) ^ 0x8E)] ^ (v184 - ((2 * v184) & 0xB6BB4012) - 614621175);
  v472 = v465 ^ 0x44039AAA;
  v186 = (181304767 * *(_DWORD *)&v145[4 * (v465 ^ 0xDB)] + 2133600750) ^ (((v465 ^ 0x44039AAAu) >> 16)
                                                                                          + 441139960
                                                                                          + ((2
                                                                                            * ((v465 ^ 0x44039AAAu) >> 16)
                                                                                            + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (((v465 ^ 0x44039AAAu) >> 16) ^ 0x2D)];
  v470 = v185 - ((2 * v185) & 0x5C4753DE);
  v187 = (v186 - ((2 * v186) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v465) ^ 0xC0)];
  v188 = *(_DWORD *)&v143[4 * v183] ^ (181304767 * *(_DWORD *)&v145[4 * (v476 ^ 0xFE)] + 2133600750) ^ (v182 - ((2 * v182) & 0xB6BB4012) - 614621175);
  HIDWORD(v475) = v187 - ((2 * v187) & 0xB6BB4012);
  HIDWORD(v464) = v188 - ((2 * v188) & 0x5C4753DE);
  v189 = *(_DWORD *)&v145[4 * ((v103 ^ v97) ^ 0xEC)];
  v190 = *(_DWORD *)&v140[4 * (v567 ^ 0x32)] ^ ((v567 ^ 0x1F)
                                              + 441139960
                                              + ((2 * (v567 ^ 0x1F) + 88) & 0x196 ^ 0xF6F76FFF));
  v191 = *(_DWORD *)&v145[4 * (v557 ^ 0xE6)];
  LODWORD(v67) = *(_DWORD *)&v143[4 * (HIBYTE(v538) ^ 0xCA)] ^ ((BYTE2(v538) ^ 0x2F)
                                                              + 441139960
                                                              + ((2 * (BYTE2(v538) ^ 0x2F) + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (BYTE2(v538) ^ 2)] ^ (181304767 * v189 - ((362609534 * v189 - 27765796) & 0xB6BB4012) + 1518979575);
  v192 = (v190 - ((2 * v190) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (v589 ^ 0x8C)] ^ (181304767
                                                                                                * *(_DWORD *)&v145[4 * (v575 ^ 0xD9)]
                                                                                                + 2133600750);
  v193 = *(_DWORD *)&v143[4 * ((v557 ^ 0x49A657C7u) >> 24)] ^ ((((v557 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                             + 441139960
                                                             + ((2
                                                               * (((v557 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                               + 88) & 0x196 ^ 0xF6F76FFF)) ^ *(_DWORD *)&v140[4 * (((v557 ^ 0x49A657C7u) >> 16) ^ 0x18)] ^ (181304767 * v191 - ((362609534 * v191 - 27765796) & 0xB6BB4012) + 1518979575);
  v194 = *(_DWORD *)&v140[4 * (((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) ^ 0x2D)] ^ (((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) + 441139960 + ((2 * ((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 16) + 88) & 0x196 ^ 0xF6F76FFF));
  v576 = v592 ^ 0xAA;
  v590 = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4
                                                                        * (((unsigned __int16)(v103 ^ v97) >> 8) ^ 0x2E)];
  v568 = v192 - ((2 * v192) & 0xB6BB4012);
  v460 = BYTE1(v557) ^ 0xB9;
  LODWORD(v67) = (v194 - ((2 * v194) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4
                                                                                 * ((*(_DWORD *)(v61 - 152) ^ 0x715B7EABu) >> 24)] ^ (181304767 * *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 152) ^ 0x3B)] + 2133600750);
  v558 = v193 - ((2 * v193) & 0x5C4753DE);
  v539 = v67 - ((2 * v67) & 0x5C4753DE);
  v195 = *(_DWORD *)&v140[4 * (v552 ^ 0xC1)] ^ ((v552 ^ 0xEC)
                                              + 441139960
                                              + ((2 * (v552 ^ 0xEC) + 88) & 0x196 ^ 0xF6F76FFF));
  LODWORD(v67) = (v195 - ((2 * v195) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4
                                                                                  * ((v554 - ((2 * v546) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v145[4 * (v569 ^ 0xE2)] + 2133600750);
  v196 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 140) ^ 0xF0)];
  v197 = (181304767 * v196 - ((362609534 * v196 - 27765796) & 0xB6BB4012) + 1518979575) ^ *(_DWORD *)&v143[4 * (HIBYTE(v560) ^ 0x3E)];
  v570 = v67 - ((2 * v67) & 0xB6BB4012);
  v547 = v197 - ((2 * v197) & 0x5C4753DE);
  v555 = v536 ^ 0xEEA2BFA8;
  v198 = *(_DWORD *)&v140[4 * (((v536 ^ 0xEEA2BFA8) >> 16) ^ 0x86)] ^ ((((v536 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                      + 441139959
                                                                                      - ((2
                                                                                        * (((v536 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                        + 160207960) & 0x9089196));
  LODWORD(v67) = (181304767 * *(_DWORD *)&v145[4 * (v536 ^ 0x68)] + 2133600750) ^ *(_DWORD *)&v141[4 * (BYTE1(v536) ^ 0x55)] ^ (v198 - ((2 * v198) & 0x5C4753DE) - 1373394449);
  v449 = v458 ^ 0xC1;
  v199 = ((v579 ^ 0x231B9DB5u) >> 16);
  v593 = (v199 ^ 0xC1) + 441139960 + ((2 * (v199 ^ 0xC1) + 88) & 0x196 ^ 0xF6F76FFF);
  LODWORD(v452) = v67 - ((2 * v67) & 0xB6BB4012);
  v447 = BYTE2(v560);
  v553 = (BYTE2(v560) ^ 0xC8) + 441139960 + ((2 * (BYTE2(v560) ^ 0xC8) + 88) & 0x196 ^ 0xF6F76FFF);
  v200 = v599 ^ 0x406768A6;
  v201 = *(_DWORD *)&v145[4 * (v565 ^ 0x60)];
  v202 = *(_DWORD *)&v145[4 * (v601 ^ 0xFB)];
  v203 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 128) ^ 0xB8)];
  v204 = *(_DWORD *)&v145[4 * v468];
  v205 = *(_DWORD *)&v145[4 * v456];
  v206 = *(_DWORD *)&v145[4 * (v581 ^ 0xF0)];
  LODWORD(v85) = *(_DWORD *)(v61 - 168);
  v207 = *(_DWORD *)&v145[4 * (v85 ^ 0x57)];
  v208 = *(_DWORD *)&v145[4 * v453];
  v209 = *(_DWORD *)&v145[4 * (v583 ^ 0x78)];
  LODWORD(v67) = *(_DWORD *)&v145[4 * (v579 ^ 0x75)];
  v210 = *(_DWORD *)&v145[4 * (*(_DWORD *)(v61 - 248) ^ 0x74)];
  v211 = *(_DWORD *)&v145[4 * (v602 ^ 0x96)];
  v212 = *(_DWORD *)(v61 - 256);
  v213 = *(_DWORD *)&v145[4 * (v212 ^ 0x2A)];
  LODWORD(v145) = *(_DWORD *)&v145[4 * (v599 ^ 0x9F)];
  *(_DWORD *)(v61 - 248) = 181304767 * v201 + 2133600750;
  v600 = 181304767 * v202 + 2133600750;
  HIDWORD(v457) = 181304767 * v203 + 2133600750;
  HIDWORD(v467) = 181304767 * v204 + 2133600750;
  v561 = 181304767 * v205 + 2133600750;
  HIDWORD(v455) = 181304767 * v208 + 2133600750;
  LODWORD(v451) = 181304767 * v206 + 2133600750;
  HIDWORD(v451) = 181304767 * v67 + 2133600750;
  HIDWORD(v452) = 181304767 * (_DWORD)v145 + 2133600750;
  LODWORD(v145) = (181304767 * v210 - ((362609534 * v210 - 27765796) & 0xB6BB4012) + 1518979575) ^ *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 232) ^ 0x7B)];
  LODWORD(v67) = *(_DWORD *)&v140[4 * (BYTE2(v602) ^ 0x7B)] ^ ((BYTE2(v602) ^ 0x56)
                                                             + 441139960
                                                             + ((2 * (BYTE2(v602) ^ 0x56) + 88) & 0x196 ^ 0xF6F76FFF)) ^ (181304767 * v211 + 2133600750);
  LODWORD(v89) = (v67 - ((2 * v67) & 0x5C4753DE) - 1373394449) ^ *(_DWORD *)&v141[4 * (BYTE1(v602) ^ 0xCC)];
  v214 = *(_DWORD *)&v140[4 * (BYTE2(v200) ^ 0x3C)] ^ ((BYTE2(v200) ^ 0x11)
                                                     + 441139960
                                                     + ((2 * (BYTE2(v200) ^ 0x11) + 88) & 0x196 ^ 0xF6F76FFF));
  v215 = (181304767 * v213 + 2133600750) ^ ((BYTE2(v212) ^ 0x37)
                                          + 441139959
                                          - ((2 * (BYTE2(v212) ^ 0x37) + 160207960) & 0x9089196)) ^ *(_DWORD *)&v140[4 * (BYTE2(v212) ^ 0x1A)];
  v216 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0x5C4753DE);
  LODWORD(v145) = (v215 - ((2 * v215) & 0xB6BB4012) - 614621175) ^ *(_DWORD *)&v143[4 * (HIBYTE(v212) ^ 0xF9)];
  LODWORD(v67) = *(_DWORD *)(v61 - 208);
  HIDWORD(v448) = *(_DWORD *)&v140[4 * (BYTE2(v131) ^ 0x61)];
  *(_DWORD *)(v61 - 232) = *(_DWORD *)&v140[4 * (v462 ^ 0x8A)];
  v542 = *(_DWORD *)&v140[4 * (v482 ^ 0x48)];
  LODWORD(v450) = *(_DWORD *)&v140[4 * v449];
  v483 = *(_DWORD *)&v140[4 * (v199 ^ 0xEC)];
  HIDWORD(v461) = *(_DWORD *)&v140[4 * (v447 ^ 0xE5)];
  v598 = *(_DWORD *)&v140[4 * (v67 ^ 0x1A)];
  LODWORD(v140) = ((*(_DWORD *)(v61 - 240) >> 15) & 0x58 ^ 0x48) + (v67 ^ 0x4C64A1B);
  *(_DWORD *)(v61 - 240) = (_DWORD)v140 + 361035980 + ((2 * (_DWORD)v140) & 0x196 ^ 0xF6F76FFF);
  v217 = HIBYTE(v602) ^ 0xE5;
  *(_DWORD *)(v61 - 208) = *(_DWORD *)&v141[4 * v543];
  v544 = *(_DWORD *)&v141[4 * (HIBYTE(v572) ^ 0x8E)];
  v603 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 128)) ^ 0x85)];
  HIDWORD(v450) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 160)) ^ 0xBD)];
  *(_DWORD *)(v61 - 160) = *(_DWORD *)&v141[4 * v519];
  HIDWORD(v446) = *(_DWORD *)&v141[4 * v477];
  LODWORD(v448) = *(_DWORD *)&v141[4 * (BYTE1(v127) ^ 0x1A)];
  *(_DWORD *)(v61 - 256) = *(_DWORD *)&v141[4 * (BYTE1(v85) ^ 0xF5)];
  *(_DWORD *)(v61 - 176) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 176)) ^ 0xD6)];
  v520 = *(_DWORD *)&v141[4 * v454];
  HIDWORD(a25) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 184)) ^ 0xD7)];
  v573 = *(_DWORD *)&v141[4 * (BYTE1(v583) ^ 0x76)];
  v218 = *(_DWORD *)&v141[4 * (BYTE1(v466) ^ 0x16)];
  LODWORD(v445) = *(_DWORD *)&v141[4 * (v595 ^ 0xBE)];
  *(_DWORD *)(v61 - 184) = *(_DWORD *)&v141[4 * v460];
  v596 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 152)) ^ 0xFE)];
  LODWORD(v446) = *(_DWORD *)&v141[4 * (BYTE1(v579) ^ 0x77)];
  HIDWORD(v445) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 140)) ^ 0x95)];
  *(_DWORD *)(v61 - 200) = *(_DWORD *)&v141[4 * (*(_DWORD *)(v61 - 200) ^ 0x84)];
  LODWORD(v467) = *(_DWORD *)&v141[4 * (BYTE1(v212) ^ 0x2E)];
  v219 = v89 - ((2 * v89) & 0xB6BB4012);
  LODWORD(v89) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v61 - 224)) ^ 0xC8)];
  LODWORD(v444) = *(_DWORD *)&v143[4 * (HIBYTE(v131) ^ 0xB2)];
  *(_DWORD *)(v61 - 152) = v563 - 1373394449;
  v564 = v549 - 1373394449;
  *(_DWORD *)(v61 - 192) = *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 192) ^ 7)];
  *(_DWORD *)(v61 - 224) = v531 - 1373394449;
  LODWORD(v455) = v527 - 1373394449;
  LODWORD(v461) = v521 - 1373394449;
  v550 = *(_DWORD *)&v143[4 * (HIBYTE(*(_DWORD *)(v61 - 136)) ^ 0xFB)];
  HIDWORD(v443) = v507 - 1373394449;
  LODWORD(v443) = v484 - 1373394449;
  v485 = v474 - 1373394449;
  v532 = v491 - 1373394449;
  HIDWORD(v444) = v488 - 1373394449;
  LODWORD(v67) = v470 - 1373394449;
  v508 = v558 - 1373394449;
  LODWORD(v475) = v539 - 1373394449;
  v548 = v547 - 1373394449;
  v522 = v216 - 1373394449;
  v528 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0x5C4753DE) - 1373394449;
  v559 = *(_DWORD *)&v143[4 * v525];
  v489 = *(_DWORD *)&v143[4 * (BYTE3(v85) ^ 0xB8)];
  v492 = *(_DWORD *)&v143[4 * HIBYTE(v478)];
  v479 = *(_DWORD *)&v143[4 * (v510 ^ 0x4B)];
  v540 = *(_DWORD *)&v143[4 * (HIBYTE(*(_DWORD *)(v61 - 132)) ^ 0x17)];
  v526 = *(_DWORD *)&v143[4 * v494];
  v220 = *(_DWORD *)&v143[4 * (HIBYTE(v583) ^ 0xA6)];
  v221 = *(_DWORD *)&v143[4 * HIBYTE(v472)];
  v511 = *(_DWORD *)&v143[4 * v576];
  LODWORD(v145) = v89 ^ (v214 - ((2 * v214) & 0x5C4753DE) - 1373394449);
  v222 = *(_DWORD *)&v143[4 * ((v579 ^ 0x231B9DB5u) >> 24)];
  v537 = *(_DWORD *)&v143[4 * (*(_DWORD *)(v61 - 216) ^ 0x38)];
  v223 = *(_DWORD *)&v143[4 * HIBYTE(v555)];
  HIDWORD(v471) = *(_DWORD *)&v143[4 * v217];
  LODWORD(v471) = *(_DWORD *)&v143[4 * HIBYTE(v200)];
  v224 = v577 - 614621175;
  v495 = v534 - 614621175;
  v225 = v497 - 614621175;
  *(_DWORD *)(v61 - 216) = v506 - 614621175;
  v498 = v517 - 614621175;
  *(_DWORD *)(v61 - 168) = v568 - 614621175;
  v226 = v570 - 614621175;
  v227 = v452 - 614621175;
  v228 = v219 - 614621175;
  v229 = (_DWORD)v145 - ((2 * (_DWORD)v145) & 0xB6BB4012) - 614621175;
  v230 = v591 ^ v590 ^ 0x6285F181;
  v231 = v67 ^ v218 ^ v230;
  v232 = (char *)*(&off_1E709D0C0 + v594 + 23) - 4;
  v233 = (uint64_t)*(&off_1E709D0C0 + (v594 ^ 0xA5));
  v234 = (uint64_t)*(&off_1E709D0C0 + v594 + 21);
  v235 = (uint64_t)*(&off_1E709D0C0 + v594 - 141);
  v236 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 109) ^ 0x41)) ^ 5) & 0xFF00FFFF | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 111) ^ 0x40)) - 106) ^ 0x5A) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 110) ^ 0xBBLL)) ^ 0xD0) << 8) | ((v232[*(unsigned __int8 *)(v61 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v61 - 112) - ((2 * *(unsigned __int8 *)(v61 - 112)) & 0xCA) - 27) ^ 0x84) << 24);
  v584 = v232;
  v237 = *(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 97) ^ 0x74)) ^ 0xA2 | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 99) ^ 0xF3)) - 106) ^ 2) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 98) ^ 0x20)) ^ 0x3A) << 8) | ((v232[*(unsigned __int8 *)(v61 - 100) ^ 0xF3] ^ (*(unsigned __int8 *)(v61 - 100) - ((2 * *(unsigned __int8 *)(v61 - 100)) & 0xCA) - 27) ^ 0x85) << 24);
  v578 = v235;
  v580 = v234;
  v238 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 105) ^ 0xE4)) ^ 0x33) & 0xFF00FFFF | ((v232[*(unsigned __int8 *)(v61 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v61 - 108) - ((2 * *(unsigned __int8 *)(v61 - 108)) & 0xCA) - 27) ^ 0xFFFFFFE1) << 24) | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 107) ^ 0x27)) - 106) ^ 0x96) << 16) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 106) ^ 9)) ^ 0xD5) << 8);
  v239 = *(unsigned __int8 **)(v61 - 120);
  v582 = v233;
  v240 = (*(unsigned __int8 *)(v235 + (*(unsigned __int8 *)(v61 - 101) ^ 0xF2)) ^ 0x8A) & 0xFF00FFFF | ((v232[*(unsigned __int8 *)(v61 - 104) ^ 0xD3] ^ (*(unsigned __int8 *)(v61 - 104) - ((2 * *(unsigned __int8 *)(v61 - 104)) & 0xCA) - 27) ^ 0xE0) << 24) | ((*(unsigned __int8 *)(v234 + (*(unsigned __int8 *)(v61 - 102) ^ 0xBELL)) ^ 0x72) << 8) & 0xFF00FFFF | (((*(_BYTE *)(v233 + (*(unsigned __int8 *)(v61 - 103) ^ 0xE9)) - 106) ^ 0x8A) << 16);
  if ((v231 & 0x80) != 0)
    v241 = -128;
  else
    v241 = 128;
  *(_DWORD *)(v61 - 128) = v237 ^ 0xC71C9E0F;
  *(_DWORD *)(v61 - 132) = v236 ^ 0x653F3C3B;
  *(_DWORD *)(v61 - 136) = v238 ^ 0xEFEB9384;
  *(_DWORD *)(v61 - 140) = v240 ^ 0x14CE96FF;
  HIDWORD(v574) = (HIDWORD(v464) - 1373394449) ^ v445;
  LODWORD(v574) = v220 ^ v501 ^ v573 ^ v450 ^ (181304767 * v209 + 2133600750);
  HIDWORD(v571) = (HIDWORD(v475) - 614621175) ^ v221;
  LODWORD(v571) = v564 ^ v544;
  HIDWORD(v566) = v444 ^ ((BYTE2(v131) ^ 0x4C) + 441139959 - ((2 * (BYTE2(v131) ^ 0x4C) + 160207960) & 0x9089196)) ^ HIDWORD(v448) ^ v224;
  LODWORD(v566) = v443 ^ HIDWORD(v446);
  HIDWORD(v562) = HIDWORD(v443) ^ v448 ^ v451;
  LODWORD(v562) = (v512 - 614621175) ^ v550 ^ v561;
  HIDWORD(v556) = v225 ^ v559;
  LODWORD(v556) = v446 ^ v222 ^ v593 ^ v483 ^ HIDWORD(v451);
  HIDWORD(v551) = HIDWORD(v445) ^ v553 ^ HIDWORD(v461) ^ v548;
  LODWORD(v551) = v227 ^ v223;
  HIDWORD(v545) = v226 ^ v537;
  LODWORD(v545) = HIDWORD(v444) ^ HIDWORD(a25);
  HIDWORD(v541) = v526 ^ v515 ^ v542 ^ (v457 - 614621175);
  LODWORD(v541) = (v464 - 614621175) ^ v540;
  HIDWORD(v535) = HIDWORD(v455) ^ v520 ^ v532;
  LODWORD(v535) = HIDWORD(v452) ^ v471 ^ v229;
  HIDWORD(v529) = v528 ^ v467;
  LODWORD(v529) = v228 ^ HIDWORD(v471);
  HIDWORD(v523) = *(_DWORD *)(v61 - 200) ^ *(_DWORD *)(v61 - 240) ^ v598 ^ v522;
  LODWORD(v523) = *(_DWORD *)(v61 - 168) ^ v511;
  HIDWORD(v518) = *(_DWORD *)(v61 - 184) ^ v508;
  LODWORD(v518) = v475 ^ v596;
  HIDWORD(v513) = v455 ^ HIDWORD(v450);
  LODWORD(v513) = *(_DWORD *)(v61 - 224) ^ v603 ^ HIDWORD(v457);
  HIDWORD(v509) = HIDWORD(v467) ^ *(_DWORD *)(v61 - 160) ^ v461;
  LODWORD(v509) = v600 ^ *(_DWORD *)(v61 - 192) ^ v495;
  HIDWORD(v504) = v485 ^ *(_DWORD *)(v61 - 176);
  LODWORD(v504) = *(_DWORD *)(v61 - 256) ^ v503 ^ v489 ^ *(_DWORD *)(v61 - 232) ^ (181304767 * v207 + 2133600750);
  HIDWORD(v499) = v498 ^ v479;
  LODWORD(v499) = *(_DWORD *)(v61 - 216) ^ v492;
  HIDWORD(v493) = (v241 + (v231 ^ 0x2497E332)) ^ v230;
  LODWORD(v493) = *(_DWORD *)(v61 - 152) ^ *(_DWORD *)(v61 - 208) ^ *(_DWORD *)(v61 - 248);
  v242 = *(_DWORD *)(v61 - 124);
  HIDWORD(v486) = v242 & 0x39CF440F;
  LODWORD(v486) = v242 ^ 0x3A0;
  HIDWORD(v480) = v242 ^ 0x3BC;
  LODWORD(v480) = v242 ^ 0x333;
  HIDWORD(a25) = v242 ^ 0x379;
  *(_QWORD *)(v61 - 176) = 13;
  v243 = *(_BYTE *)(v233 + (v239[13] ^ (((v242 - 100) | 0x11) - 40))) - 106;
  *(_QWORD *)(v61 - 152) = 1;
  v244 = v239[1] ^ 0x57;
  *(_QWORD *)(v61 - 160) = 10;
  v245 = v239[10] ^ 0xB6;
  LODWORD(v244) = ((*(_BYTE *)(v233 + v244) - 106) ^ 0xF6) << 16;
  *(_QWORD *)(v61 - 192) = 4;
  v246 = (*(unsigned __int8 *)(v234 + v245) ^ 0x5F) << 8;
  v247 = v239[4];
  v248 = v584[v247 ^ 0x9A];
  *(_QWORD *)(v61 - 224) = 7;
  LODWORD(v247) = v248 ^ (v247 - ((2 * v247) & 0xCA) - 27) ^ 0xFFFFFFCF;
  v249 = *(unsigned __int8 *)(v578 + (v239[7] ^ 0xD6));
  *(_QWORD *)(v61 - 216) = 2;
  LODWORD(v247) = v249 ^ 0x60 | ((_DWORD)v247 << 24);
  v250 = *(unsigned __int8 *)(v234 + v239[2]) ^ 0x4D;
  *(_QWORD *)(v61 - 184) = 3;
  LODWORD(v244) = v244 | (v250 << 8);
  v251 = *(unsigned __int8 *)(v578 + (v239[3] ^ 0x74));
  *(_QWORD *)(v61 - 168) = 12;
  LODWORD(v244) = v244 | v251 ^ 0xA2;
  v252 = v584[v239[12] ^ 0x6ELL] ^ (v239[12] + (~(2 * v239[12]) | 0x35) - 26) ^ 0x51;
  *(_QWORD *)(v61 - 208) = 0;
  v253 = ((v243 ^ 2) << 16) | (v252 << 24);
  v254 = v244 | ((v584[*v239 ^ 0x15] ^ (*v239 - ((2 * *v239) & 0xCA) - 27) ^ 0xAE) << 24);
  LODWORD(v244) = v246 | ((v584[v239[8] ^ 0x46] ^ (v239[8] - ((2 * v239[8]) & 0xCA) - 27) ^ 0xFFFFFFE7) << 24);
  *(_QWORD *)(v61 - 200) = 14;
  v255 = *(unsigned __int8 *)(v234 + (v239[14] ^ 0xD5)) ^ 0xC5;
  *(_QWORD *)(v61 - 232) = 5;
  LODWORD(v247) = v247 & 0xFF00FFFF | (((*(_BYTE *)(v582 + (v239[5] ^ 0x9DLL)) - 106) ^ 0xF7) << 16);
  LODWORD(v244) = *(unsigned __int8 *)(v578 + (v239[11] ^ 0xC2)) ^ 0x87 | v244;
  *(_QWORD *)(v61 - 256) = 9;
  *(_QWORD *)(v61 - 248) = 11;
  LODWORD(v244) = v244 & 0xFF00FFFF | (((*(_BYTE *)(v582 + (v239[9] ^ 0x3ELL)) - 106) ^ 0xDF) << 16);
  v256 = *(unsigned __int8 *)(v234 + (v239[6] ^ 0xA4));
  *(_QWORD *)(v61 - 240) = 15;
  v257 = *(unsigned __int8 *)(v578 + (v239[15] ^ 0x47)) ^ 0xA2 | v253 | (v255 << 8);
  v597 = v247 | ((v256 ^ 0x95) << 8);
  v258 = (uint64_t)*(&off_1E709D0C0 + (v242 ^ 0x3A0));
  v259 = ((((unsigned __int16)(v597 ^ WORD2(v585)) >> 8) ^ 0x4C)
        - 1101829684
        - 2 * ((((v597 ^ HIDWORD(v585)) >> 8) ^ 0xB71C4C) & 0xDC ^ ((v597 ^ HIDWORD(v585)) >> 8) & 0x10)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v597 ^ WORD2(v585)) >> 8) ^ 0x21u));
  v260 = v254 ^ v586;
  v261 = v254 ^ v586 ^ 0x730032AA;
  v262 = (uint64_t)*(&off_1E709D0C0 + (v242 & 0x39CF440F));
  v263 = (v259 - 747033579 - ((2 * v259) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                    + 4 * ((v254 ^ v586) ^ 0xAAu));
  v264 = ((((unsigned __int16)(WORD2(a49) ^ v257) >> 8) ^ 0xF0)
        - 1101829684
        - 2
        * ((((HIDWORD(a49) ^ v257) >> 8) ^ 0x50F9F0) & 0xCF ^ ((HIDWORD(a49) ^ v257) >> 8) & 3)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(WORD2(a49) ^ v257) >> 8) ^ 0x9Du));
  v265 = v264 - 367616239 - ((2 * v264) & 0xD42D3E22);
  v266 = (uint64_t)*(&off_1E709D0C0 + v242 - 859);
  v267 = *(_DWORD *)(v266 + 4 * (((v244 ^ v585) >> 16) ^ 0x68u));
  HIDWORD(v269) = v267 ^ 0xEA2;
  LODWORD(v269) = v267 ^ 0xBEBBE000;
  v268 = v269 >> 12;
  v270 = *(_DWORD *)(v266 + 4 * BYTE2(v260));
  HIDWORD(v269) = v270 ^ 0xEA2;
  LODWORD(v269) = v270 ^ 0xBEBBE000;
  v271 = (char *)*(&off_1E709D0C0 + (v242 ^ 0x3BC)) - 12;
  v272 = v265 ^ *(_DWORD *)&v271[4 * (((v597 ^ HIDWORD(v585)) >> 24) ^ 0xB7)] ^ (v269 >> 12);
  v273 = *(_DWORD *)(v266 + 4 * (((HIDWORD(a49) ^ v257) >> 16) ^ 0xF9u));
  HIDWORD(v269) = v273 ^ 0xEA2;
  LODWORD(v269) = v273 ^ 0xBEBBE000;
  v274 = *(_DWORD *)(v262 + 4 * ((v247 ^ BYTE4(v585)) ^ 0xFBu)) ^ ((unsigned __int16)(v244 ^ v585) >> 8) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v244 ^ v585) >> 8) ^ 0x23u)) ^ 0x6D2A4597 ^ (v269 >> 12);
  LODWORD(v247) = *(_DWORD *)(v266 + 4 * (((v597 ^ HIDWORD(v585)) >> 16) ^ 0x1Cu));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  LODWORD(v247) = *(_DWORD *)&v271[4 * (((v244 ^ v585) >> 24) ^ 0xF6)] ^ (BYTE1(v261) - 1101829684 - ((v260 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v261) ^ 0x6Du)) ^ ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22));
  v275 = HIDWORD(v574) ^ v268 ^ *(_DWORD *)&v271[4 * (((HIDWORD(a49) ^ v257) >> 24) ^ 0x50)] ^ (v263 - 367616239 - ((2 * v263) & 0xD42D3E22));
  v276 = v574 ^ *(_DWORD *)(v262 + 4 * ((BYTE4(a49) ^ v257) ^ 0x9Bu)) ^ (v247
                                                                                          - 747033579
                                                                                          - ((2 * v247) & 0xA6F2582A));
  LODWORD(v247) = HIDWORD(v571) ^ *(_DWORD *)(v262 + 4 * ((v244 ^ v585) ^ 0x5Fu)) ^ (v272 - 747033579 - ((2 * v272) & 0xA6F2582A));
  v277 = HIDWORD(v493) ^ *(_DWORD *)&v271[4 * HIBYTE(v261)] ^ (v274 - 367616239 - ((2 * v274) & 0xD42D3E22));
  v278 = v275 ^ 0xF9388C2F;
  v279 = *(_DWORD *)(v266 + 4 * ((v275 ^ 0xF9388C2F) >> 16));
  HIDWORD(v269) = v279 ^ 0xEA2;
  LODWORD(v269) = v279 ^ 0xBEBBE000;
  v280 = v269 >> 12;
  v281 = *(_DWORD *)(v266 + 4 * (BYTE2(v276) ^ 6u));
  HIDWORD(v269) = v281 ^ 0xEA2;
  LODWORD(v269) = v281 ^ 0xBEBBE000;
  v282 = v269 >> 12;
  v283 = *(_DWORD *)(v266 + 4 * (BYTE2(v247) ^ 0x66u));
  HIDWORD(v269) = v283 ^ 0xEA2;
  LODWORD(v269) = v283 ^ 0xBEBBE000;
  v284 = (v269 >> 12) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v277) ^ 5u)) ^ ((BYTE1(v277) ^ 0x68)
                                                                      - 1101829684
                                                                      - 2
                                                                      * (((v277 >> 8) ^ 0x42BD68) & 0xDD ^ (v277 >> 8) & 0x11));
  v285 = (v280 - 747033579 - ((2 * v280) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v247 ^ 0xB6u));
  v286 = (v284 - 747033579 - ((2 * v284) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v275 ^ 0x61u));
  v287 = (BYTE1(v278) - 1101829684 - ((v278 >> 7) & 0x198)) ^ 0xD678EAEF ^ *(_DWORD *)(v258 + 4
                                                                                            * (BYTE1(v278) ^ 0x6Du));
  v288 = *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x43)] ^ 0x480CC4AF;
  v289 = v287 + v288 - 2 * (v287 & v288);
  v290 = *(_DWORD *)(v266 + 4 * (BYTE2(v277) ^ 0xBDu));
  HIDWORD(v269) = v290 ^ 0xEA2;
  LODWORD(v269) = v290 ^ 0xBEBBE000;
  v291 = *(_DWORD *)&v271[4 * HIBYTE(v278)] ^ (v282 - 367616239 - ((2 * v282) & 0xD42D3E22));
  v292 = (v291 - 747033579 - ((2 * v291) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v277 ^ 0xABu));
  v293 = *(_DWORD *)&v271[4 * (HIBYTE(v277) ^ 0x42)] ^ v591 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v276) ^ 0xFFu)) ^ ((BYTE1(v276) ^ 0x92) - 1101829684 - ((2 * ((v276 >> 8) ^ 0xA00692)) & 0x198)) ^ (v285 - 367616239 - ((2 * v285) & 0xD42D3E22));
  LOBYTE(v277) = BYTE1(v247) ^ 0x54;
  LODWORD(v247) = v493 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v247) ^ 0x39u)) ^ (v292 - 1101829684 - ((2 * v292) & 0x7CA6D398));
  v294 = v571 ^ *(_DWORD *)&v271[4 * (HIBYTE(v276) ^ 0xA0)] ^ (v286 - 367616239 - ((2 * v286) & 0xD42D3E22));
  v295 = HIDWORD(v566) ^ *(_DWORD *)(v262 + 4 * (v276 ^ 0x8Eu)) ^ ((v289 ^ (v269 >> 12))
                                                                                    - 747033579
                                                                                    - ((2 * (v289 ^ (v269 >> 12))) & 0xA6F2582A));
  v296 = *(_DWORD *)(v266 + 4 * (BYTE2(v295) ^ 0x79u));
  HIDWORD(v269) = v296 ^ 0xEA2;
  LODWORD(v269) = v296 ^ 0xBEBBE000;
  BYTE1(v276) = BYTE1(v294) ^ 0x68;
  v297 = ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4
                                                                                         * ((v294 ^ 0x2261685Eu) >> 24)];
  v298 = ((BYTE1(v295) ^ 0xD0) - 1101829684 - 2 * (((v295 >> 8) ^ 0x679D0) & 0xCD ^ (v295 >> 8) & 1)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v295) ^ 0xBDu));
  v299 = (v298 - 747033579 - ((2 * v298) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v293 ^ 0x76u));
  v300 = ((BYTE1(v247) ^ 0xEC)
        - 1101829684
        - 2 * (((v247 >> 8) ^ 0xE5FEC) & 0xCD ^ (v247 >> 8) & 1)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v247) ^ 0x81u));
  v301 = *(_DWORD *)(v266 + 4 * (BYTE2(v247) ^ 0x5Fu));
  HIDWORD(v269) = v301 ^ 0xEA2;
  LODWORD(v269) = v301 ^ 0xBEBBE000;
  v302 = v269 >> 12;
  HIDWORD(v269) = *(_DWORD *)(v262 + 4 * (v294 ^ 0x5Eu)) ^ 0x3A6E0B9D;
  LODWORD(v269) = HIDWORD(v269);
  v303 = (v269 >> 28) ^ __ROR4__(*(_DWORD *)&v271[4 * (HIBYTE(v295) ^ 6)] ^ 0x7462B151 ^ (v300- 367616239- ((2 * v300) & 0xD42D3E22)), 28);
  v304 = (v302 - 367616239 - ((2 * v302) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v293) ^ 0xD2)];
  v305 = (v304 - 747033579 - ((2 * v304) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v295 ^ 0x4Cu));
  v306 = *(_DWORD *)(v266 + 4 * (BYTE2(v294) ^ 0x1Bu));
  HIDWORD(v269) = v306 ^ 0xEA2;
  LODWORD(v269) = v306 ^ 0xBEBBE000;
  v307 = v269 >> 12;
  v308 = ((v293 >> 8) ^ 0xD2CCC0) & 0xCE ^ (v293 >> 8) & 2;
  v309 = BYTE1(v293) ^ 0xC0;
  v310 = *(_DWORD *)(v266 + 4 * (BYTE2(v293) ^ 0xCCu));
  HIDWORD(v269) = v310 ^ 0xEA2;
  LODWORD(v269) = v310 ^ 0xBEBBE000;
  v311 = v443 ^ HIDWORD(v446) ^ (v269 >> 12) ^ __ROR4__(v303 ^ 0x78071371, 4);
  LOBYTE(v310) = v247 ^ v277;
  v312 = HIDWORD(v562) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0xE)] ^ v307 ^ (v299 - 367616239 - ((2 * v299) & 0xD42D3E22));
  v313 = v562 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v276) ^ 0x6Du)) ^ (v305 - 1101829684 - ((2 * v305) & 0x7CA6D398));
  v314 = HIDWORD(v556) ^ (v309 - 1101829684 - 2 * v308) ^ *(_DWORD *)(v262 + 4 * (v310 ^ 0xCAu)) ^ *(_DWORD *)(v258 + 4 * (v309 ^ 0x6Du)) ^ (v297 - 747033579 - ((2 * v297) & 0xA6F2582A));
  v315 = BYTE1(v276) ^ 0x4552953C ^ v313;
  LODWORD(v247) = *(_DWORD *)(v266 + 4 * BYTE2(v315));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  v316 = v269 >> 12;
  BYTE1(v247) = BYTE1(v311) ^ 0xE7;
  v317 = *(_DWORD *)(v266 + 4 * ((v311 ^ 0x99FEE750) >> 16));
  HIDWORD(v269) = v317 ^ 0xEA2;
  LODWORD(v269) = v317 ^ 0xBEBBE000;
  v318 = (v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A);
  v319 = BYTE1(v312) ^ 0x29;
  v320 = v319 - 1101829684 - 2 * (((v312 >> 8) ^ 0xA73B29) & 0xCE ^ (v312 >> 8) & 2);
  v321 = *(_DWORD *)(v266 + 4 * (BYTE2(v314) ^ 2u));
  HIDWORD(v269) = v321 ^ 0xEA2;
  LODWORD(v269) = v321 ^ 0xBEBBE000;
  v322 = (BYTE1(v315) - 1101829684 - ((v315 >> 7) & 0x198)) ^ *(_DWORD *)(v262 + 4 * (v312 ^ 0x72u)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v315) ^ 0x6Du)) ^ v318;
  v323 = *(_DWORD *)&v271[4 * (HIBYTE(v312) ^ 0xA7)] ^ (v269 >> 12);
  v324 = *(_DWORD *)(v266 + 4 * (BYTE2(v312) ^ 0x3Bu));
  v325 = v323 ^ *(_DWORD *)(v262 + 4 * v315);
  HIDWORD(v269) = v324 ^ 0xEA2;
  LODWORD(v269) = v324 ^ 0xBEBBE000;
  v326 = v556 ^ ((BYTE1(v314) ^ 0xD9) - 1101829684 - ((2 * ((v314 >> 8) ^ 0x9802D9)) & 0x198)) ^ *(_DWORD *)(v262 + 4 * (v311 ^ 0x1Eu)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v314) ^ 0xB4u)) ^ (v269 >> 12) ^ *(_DWORD *)&v271[4 * (HIBYTE(v313) ^ 0x61)];
  v327 = HIDWORD(v551) ^ *(_DWORD *)&v271[4 * (HIBYTE(v314) ^ 0x98)] ^ (v322 - 367616239 - ((2 * v322) & 0xD42D3E22));
  v328 = v227 ^ v223 ^ *(_DWORD *)(v262 + 4 * (v314 ^ 0x3Du)) ^ v320 ^ *(_DWORD *)&v271[4 * ((v311 ^ 0x99FEE750) >> 24)] ^ *(_DWORD *)(v258 + 4 * (v319 ^ 0x6Du));
  v329 = *(_DWORD *)(v266 + 4 * (BYTE2(v326) ^ 0xF7u));
  HIDWORD(v269) = v329 ^ 0xEA2;
  LODWORD(v269) = v329 ^ 0xBEBBE000;
  v330 = v269 >> 12;
  v331 = *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v311 ^ 0xE750) >> 8) ^ 0x6Du));
  v332 = v328 ^ v316;
  v333 = HIDWORD(v545) ^ v331;
  v334 = *(_DWORD *)(v266 + 4 * (BYTE2(v332) ^ 0x87u));
  v335 = v333 ^ ((v325 ^ 0x396FB304) - 1101829684 - 2 * ((v325 ^ 0x396FB304) & 0x3E5369CE ^ v325 & 2));
  HIDWORD(v269) = v334 ^ 0xEA2;
  LODWORD(v269) = v334 ^ 0xBEBBE000;
  v336 = BYTE1(v332) ^ 0x4C;
  v337 = v336 - 1101829684 - 2 * (((v332 >> 8) ^ 0xEC874C) & 0xDE ^ (v332 >> 8) & 0x12);
  v338 = v326 ^ 0xDA8D2242;
  v339 = *(_DWORD *)(v262 + 4 * ((v335 ^ BYTE1(v247)) ^ 0x41u)) ^ (((unsigned __int16)(v326 ^ 0x2242) >> 8)
                                                                                    - 1101829684
                                                                                    - ((v326 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v326 ^ 0x2242) >> 8) ^ 0x6Du)) ^ ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A));
  v340 = *(_DWORD *)(v266 + 4 * (BYTE2(v335) ^ 0x81u));
  HIDWORD(v269) = v340 ^ 0xEA2;
  LODWORD(v269) = v340 ^ 0xBEBBE000;
  v341 = ((v269 >> 12) - 367616239 - ((2 * (v269 >> 12)) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * HIBYTE(v338)];
  v342 = (v341 - 747033579 - ((2 * v341) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v332 ^ 1u));
  LODWORD(v247) = *(_DWORD *)(v262 + 4 * (v327 ^ 0xFCu)) ^ (v330
                                                                             - 747033579
                                                                             - ((2 * v330) & 0xA6F2582A)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v335) ^ 0xCDu)) ^ ((BYTE1(v335) ^ 0xA0) - 1101829684 - 2 * (((v335 >> 8) ^ 0x6881A0) & 0xDE ^ (v335 >> 8) & 0x12));
  v343 = *(_DWORD *)(v266 + 4 * (BYTE2(v327) ^ 0xC6u));
  LODWORD(v269) = __ROR4__((v343 >> 12) ^ 0x266369C, 17) ^ 0xEE910136;
  HIDWORD(v269) = v269;
  v344 = v545 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v327) ^ 0x75u)) ^ (v342 - 1101829684 - ((2 * v342) & 0x7CA6D398));
  LODWORD(v247) = HIDWORD(v541) ^ *(_DWORD *)&v271[4 * (HIBYTE(v332) ^ 0xEC)] ^ (v247
                                                                               - 367616239
                                                                               - ((2 * v247) & 0xD42D3E22));
  v345 = v541 ^ *(_DWORD *)&v271[4 * (HIBYTE(v327) ^ 0x5A)] ^ (v339 - 367616239 - ((2 * v339) & 0xD42D3E22));
  v346 = HIDWORD(v535) ^ v337 ^ *(_DWORD *)(v262 + 4 * v338) ^ *(_DWORD *)(v258 + 4 * (v336 ^ 0x6Du)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v335) ^ 0x68)] ^ ((v269 >> 15) + (v343 << 20));
  v347 = ((BYTE1(v344) ^ 0x9D) - 1101829684 - 2 * (((v344 >> 8) ^ 0xC2489D) & 0xCE ^ (v344 >> 8) & 2)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v344) ^ 0xF0u));
  v348 = *(_DWORD *)(v266 + 4 * (BYTE2(v247) ^ 0x8Fu));
  v349 = *(_DWORD *)(v262 + 4 * (v346 ^ 0x8Eu)) ^ (v348 << 20) ^ (v348 >> 12) ^ 0xEA2BEBBE ^ (v347 - 747033579 - ((2 * v347) & 0xA6F2582A));
  v350 = *(_DWORD *)(v266 + 4 * ((v345 ^ 0xCFB8D782) >> 16));
  HIDWORD(v269) = v350 ^ 0xEA2;
  LODWORD(v269) = v350 ^ 0xBEBBE000;
  v351 = ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                                    + 4
                                                                                    * ((v344 ^ BYTE1(v327)) ^ 0x3Fu));
  v352 = v349 - 367616239 - ((2 * v349) & 0xD42D3E22);
  v353 = v351 - 367616239 - ((2 * v351) & 0xD42D3E22);
  v354 = BYTE1(v247) ^ 0xD9;
  v355 = v354 - 1101829684 - 2 * (((v247 >> 8) ^ 0xC78FD9) & 0xCE ^ (v247 >> 8) & 2);
  v356 = *(_DWORD *)(v266 + 4 * (BYTE2(v344) ^ 0x48u));
  HIDWORD(v269) = v356 ^ 0xEA2;
  LODWORD(v269) = v356 ^ 0xBEBBE000;
  v357 = ((BYTE1(v346) ^ 0xD3) - 1101829684 - ((2 * ((v346 >> 8) ^ 0xF5C4D3)) & 0x198)) ^ *(_DWORD *)(v262 + 4 * (v345 ^ 0xCCu)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v346) ^ 0xBEu)) ^ ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A));
  v358 = *(_DWORD *)(v266 + 4 * (BYTE2(v346) ^ 0xC4u));
  HIDWORD(v269) = v358 ^ 0xEA2;
  LODWORD(v269) = v358 ^ 0xBEBBE000;
  v359 = v535 ^ (((unsigned __int16)(v345 ^ 0xD782) >> 8)
               - 1101829684
               - (((v345 ^ 0xCFB8D782) >> 7) & 0x198)) ^ *(_DWORD *)(v262 + 4 * (v247 ^ 0x50u)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v345 ^ 0xD782) >> 8) ^ 0x6Du)) ^ (v269 >> 12) ^ *(_DWORD *)&v271[4 * (HIBYTE(v344) ^ 0xC2)];
  LODWORD(v247) = HIDWORD(v529) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0xC7)] ^ (v357
                                                                              - 367616239
                                                                              - ((2 * v357) & 0xD42D3E22));
  v360 = v529 ^ *(_DWORD *)&v271[4 * ((v345 ^ 0xCFB8D782) >> 24)] ^ v352;
  v361 = HIDWORD(v523) ^ v355 ^ *(_DWORD *)&v271[4 * (HIBYTE(v346) ^ 0xF5)] ^ *(_DWORD *)(v258 + 4 * (v354 ^ 0x6Du)) ^ v353;
  v362 = *(_DWORD *)(v266 + 4 * (BYTE2(v247) ^ 0xE6u));
  HIDWORD(v269) = v362 ^ 0xEA2;
  LODWORD(v269) = v362 ^ 0xBEBBE000;
  v363 = v269 >> 12;
  v364 = *(_DWORD *)(v266 + 4 * (BYTE2(v360) ^ 0x1Cu));
  v365 = (((unsigned __int16)(v361 ^ 0xCCA2) >> 8) - 1101829684 - (((v361 ^ 0x33C8CCA2) >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v361 ^ 0xCCA2) >> 8) ^ 0x6Du));
  HIDWORD(v269) = v364 ^ 0xEA2;
  LODWORD(v269) = v364 ^ 0xBEBBE000;
  v366 = (v269 >> 12) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v247) ^ 0xD9u)) ^ ((BYTE1(v247) ^ 0xB4)
                                                                         - 1101829684
                                                                         - 2
                                                                         * (((v247 >> 8) ^ 0x4FE6B4) & 0xCD ^ (v247 >> 8) & 1));
  v367 = (v366 - 747033579 - ((2 * v366) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v359 ^ 0xEEu));
  v368 = (v365 - 747033579 - ((2 * v365) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                    + 4
                                                                    * ((v529 ^ v271[4 * ((v345 ^ 0xCFB8D782) >> 24)] ^ v352) ^ 0x3Au));
  v369 = *(_DWORD *)(v262 + 4 * (v361 ^ 0xA2u)) ^ (((unsigned __int16)(v359 ^ 0xA7EE) >> 8)
                                                                    - 1101829684
                                                                    - (((v359 ^ 0x205CA7EE) >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v359 ^ 0xA7EE) >> 8) ^ 0x6Du)) ^ (v363 - 747033579 - ((2 * v363) & 0xA6F2582A));
  v370 = *(_DWORD *)(v262 + 4 * (v247 ^ 0x96u));
  HIDWORD(v269) = v370 ^ 0x13792C15;
  LODWORD(v269) = v370 ^ 0xC0000000;
  HIDWORD(v269) = (v269 >> 29) ^ 0x6615DA09;
  LODWORD(v269) = HIDWORD(v269);
  v371 = (v269 >> 3) - 1101829684 - ((2 * (v269 >> 3)) & 0x7CA6D398);
  v372 = *(_DWORD *)(v266 + 4 * ((v359 ^ 0x205CA7EE) >> 16));
  HIDWORD(v269) = v372 ^ 0xEA2;
  LODWORD(v269) = v372 ^ 0xBEBBE000;
  v373 = v269 >> 12;
  v374 = *(_DWORD *)(v266 + 4 * ((v361 ^ 0x33C8CCA2) >> 16));
  HIDWORD(v269) = v374 ^ 0xEA2;
  LODWORD(v269) = v374 ^ 0xBEBBE000;
  v375 = v523 ^ *(_DWORD *)&v271[4 * (HIBYTE(v361) ^ 0x17)] ^ (v367 - 367616239 - ((2 * v367) & 0xD42D3E22));
  v376 = BYTE1(v360);
  v377 = v371 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v360) ^ 0xD1u)) ^ (v269 >> 12);
  v378 = *(_DWORD *)&v271[4 * (HIBYTE(v359) ^ 4)] ^ v590 ^ (v377 - 367616239 - ((2 * v377) & 0xD42D3E22));
  v379 = HIDWORD(v518) ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x4F)] ^ v373 ^ (v368
                                                                            - 367616239
                                                                            - ((2 * v368) & 0xD42D3E22));
  LODWORD(v247) = v518 ^ *(_DWORD *)&v271[4 * (HIBYTE(v360) ^ 0x1B)] ^ (v369 - 367616239 - ((2 * v369) & 0xD42D3E22));
  v380 = *(_DWORD *)(v266 + 4 * (BYTE2(v247) ^ 0x7Eu));
  HIDWORD(v269) = v380 ^ 0xEA2;
  LODWORD(v269) = v380 ^ 0xBEBBE000;
  v381 = v269 >> 12;
  v382 = *(_DWORD *)(v266 + 4 * (BYTE2(v379) ^ 1u));
  HIDWORD(v269) = v382 ^ 0xEA2;
  LODWORD(v269) = v382 ^ 0xBEBBE000;
  v383 = ((v269 >> 12) - 747033579 - ((2 * (v269 >> 12)) & 0xA6F2582A)) ^ *(_DWORD *)(v262
                                                                                    + 4
                                                                                    * (v375 ^ 0xC6u));
  v384 = ((BYTE1(v375) ^ 0x71) - 1101829684 - ((2 * ((v375 >> 8) ^ 0xF25B71)) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v375) ^ 0x1Cu));
  v385 = (v384 - 367616239 - ((2 * v384) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v379) ^ 0x1F)];
  v386 = *(_DWORD *)(v266 + 4 * (BYTE2(v375) ^ 0x5Bu));
  HIDWORD(v269) = v386 ^ 0xEA2;
  LODWORD(v269) = v386 ^ 0xBEBBE000;
  v387 = v269 >> 12;
  v388 = v385 - 747033579 - ((2 * v385) & 0xA6F2582A);
  v389 = v376 ^ 0x73F4E0AF ^ v378;
  v390 = *(_DWORD *)(v266 + 4 * BYTE2(v389));
  HIDWORD(v269) = v390 ^ 0xEA2;
  LODWORD(v269) = v390 ^ 0xBEBBE000;
  v391 = v269 >> 12;
  HIDWORD(v269) = v381 ^ ((BYTE1(v379) ^ 0x81) - 1101829684 - ((2 * ((v379 >> 8) ^ 0x1F0181)) & 0x198)) ^ 0xD678EAEF ^ *(_DWORD *)(v258 + 4 * (BYTE1(v379) ^ 0xECu));
  LODWORD(v269) = HIDWORD(v269);
  LODWORD(v269) = (v269 >> 11) ^ __ROR4__(*(_DWORD *)&v271[4 * (HIBYTE(v375) ^ 0xF2)] ^ 0x480CC4AF, 11) ^ 0xD490839A;
  HIDWORD(v269) = v269;
  v392 = v455 ^ HIDWORD(v450) ^ *(_DWORD *)(v262 + 4 * (v379 ^ 0xB8u)) ^ ((BYTE1(v247) ^ 0xAA)
                                                                                           - 1101829684
                                                                                           - 2
                                                                                           * (((v247 >> 8) ^ 0x967EAA) & 0xCD ^ (v247 >> 8) & 1)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v378) ^ 0x57)] ^ v387 ^ *(_DWORD *)(v258 + 4 * (BYTE1(v247) ^ 0xC7u));
  v393 = v513 ^ *(_DWORD *)&v271[4 * (BYTE3(v247) ^ 0x96)] ^ (BYTE1(v389) - 1101829684 - ((v389 >> 7) & 0x198)) ^ *(_DWORD *)(v258 + 4 * (BYTE1(v389) ^ 0x6Du)) ^ (v383 - 367616239 - ((2 * v383) & 0xD42D3E22));
  v394 = HIDWORD(v509) ^ *(_DWORD *)(v262 + 4 * (v247 ^ 0x88u)) ^ v391 ^ v388;
  v395 = v509 ^ *(_DWORD *)(v262 + 4 * v389) ^ ((v269 >> 21)
                                                                 - 747033579
                                                                 - ((2 * (v269 >> 21)) & 0xA6F2582A));
  v396 = *(_DWORD *)(v266 + 4 * (BYTE2(v392) ^ 0x84u));
  HIDWORD(v269) = v396 ^ 0xEA2;
  LODWORD(v269) = v396 ^ 0xBEBBE000;
  v397 = v269 >> 12;
  v398 = *(_DWORD *)(v258 + 4 * (BYTE1(v393) ^ 0x96u)) ^ ((BYTE1(v393) ^ 0xFB)
                                                          - 1101829684
                                                          - ((2 * ((v393 >> 8) ^ 0x3EA2FB)) & 0x198));
  v399 = (v398 - 747033579 - ((2 * v398) & 0xA6F2582A)) ^ *(_DWORD *)(v262 + 4 * (v394 ^ 0x75u));
  v400 = *(_DWORD *)(v266 + 4 * (BYTE2(v393) ^ 0xA2u));
  HIDWORD(v269) = v400 ^ 0xEA2;
  LODWORD(v269) = v400 ^ 0xBEBBE000;
  v401 = (((unsigned __int16)(v394 ^ 0xF075) >> 8) - 1101829684 - (((v394 ^ 0xB54AF075) >> 7) & 0x198)) ^ (v269 >> 12) ^ *(_DWORD *)(v258 + 4 * (((unsigned __int16)(v394 ^ 0xF075) >> 8) ^ 0x6Du));
  v402 = *(_DWORD *)&v271[4 * (HIBYTE(v392) ^ 0xFE)];
  v403 = (v401 - 367616239 - ((2 * v401) & 0xD42D3E22)) ^ *(_DWORD *)&v271[4 * (HIBYTE(v395) ^ 0xED)];
  v404 = v399 - 367616239 - ((2 * v399) & 0xD42D3E22);
  v395 ^= 0xC9AF1D8F;
  v405 = BYTE1(v395);
  v406 = BYTE1(v395) - 1101829684 - ((v395 >> 7) & 0x198);
  v407 = *(_DWORD *)(v262 + 4 * v395);
  v408 = *(_DWORD *)(v262 + 4 * (v392 ^ 0x6Bu));
  v409 = *(_DWORD *)(v266 + 4 * BYTE2(v395));
  LODWORD(v247) = *(_DWORD *)(v266 + 4 * (BYTE2(v394) ^ 0x4Au));
  HIDWORD(v269) = v247 ^ 0xEA2;
  LODWORD(v269) = v247 ^ 0xBEBBE000;
  LODWORD(v266) = *(_DWORD *)(v258 + 4 * (v405 ^ 0x6Du));
  v410 = (v392 >> 8) ^ 0xFE8473;
  LODWORD(v258) = *(_DWORD *)(v258 + 4 * (v410 ^ 0x6Du));
  v411 = v410 - 1101829684 - ((2 * v410) & 0x198);
  v412 = HIDWORD(v504) ^ *(_DWORD *)(v262 + 4 * (v393 ^ 0x9Au)) ^ v397 ^ *(_DWORD *)&v271[4 * (HIBYTE(v394) ^ 0x91)] ^ v406 ^ v266;
  LODWORD(v266) = v504 ^ v411 ^ *(_DWORD *)&v271[4 * (HIBYTE(v393) ^ 0x3E)] ^ v258 ^ v407 ^ (v269 >> 12);
  v413 = HIDWORD(v499) ^ v408 ^ (v403 - 747033579 - ((2 * v403) & 0xA6F2582A));
  LODWORD(v258) = v499 ^ v402 ^ (v409 >> 12) ^ (v409 << 20) ^ v404;
  v414 = *(_DWORD *)(v61 - 124);
  v415 = (char *)*(&off_1E709D0C0 + v414 - 809) - 4;
  v416 = (char *)*(&off_1E709D0C0 + v414 - 792) - 4;
  LODWORD(v247) = *(_DWORD *)&v416[4
                                 * (((unsigned __int16)(v499 ^ v402 ^ (v409 >> 12) ^ v404) >> 8) ^ 0xC8)] ^ *(_DWORD *)&v415[4 * (v413 ^ 7)];
  v417 = (v247 ^ 0x2636AA21) - 1507977308 - 2 * ((v247 ^ 0x2636AA21) & 0x261E17B4 ^ v247 & 0x10);
  LODWORD(v247) = *(_DWORD *)&v416[4 * (BYTE1(v412) ^ 0xC2)];
  v418 = (char *)*(&off_1E709D0C0 + (int)v480) - 4;
  v419 = *(_DWORD *)&v416[4 * ((unsigned __int16)(v413 ^ 0x6F07) >> 8)];
  v420 = v417 ^ *(_DWORD *)&v418[4 * (BYTE3(v266) ^ 0xB2)];
  LODWORD(v271) = *(_DWORD *)&v416[4 * ~(v266 >> 8)];
  v421 = *(_DWORD *)&v418[4 * (HIBYTE(v413) ^ 0xEF)];
  LODWORD(v262) = *(_DWORD *)&v418[4 * (BYTE3(v258) ^ 0x77)];
  v422 = *(_DWORD *)&v418[4 * (HIBYTE(v412) ^ 8)];
  v423 = (char *)*(&off_1E709D0C0 + v414 - 759) - 12;
  v424 = *(_DWORD *)&v423[4 * (BYTE2(v258) ^ 0x97)];
  v425 = *(unsigned int *)&v423[4 * (BYTE2(v413) ^ 0x2A)];
  v426 = *(unsigned int *)&v423[4 * (BYTE2(v266) ^ 0x9B)];
  LODWORD(v423) = *(_DWORD *)&v423[4 * (BYTE2(v412) ^ 0xE4)] ^ (v420 + 1430988054 - ((2 * v420) & 0xAA964A2C));
  v427 = *(_DWORD *)&v415[4 * (v412 ^ 0xD8)];
  LODWORD(v418) = *(_DWORD *)&v415[4 * (v266 ^ 0xC5)];
  LODWORD(v415) = *(_DWORD *)&v415[4 * (v258 ^ 0x65)];
  LODWORD(v258) = *(_DWORD *)(v61 - 140) ^ HIDWORD(v586) ^ ((_DWORD)v423 - ((2 * (_DWORD)v423) & 0x2C9828FA) - 1773398915);
  v428 = (char *)*(&off_1E709D0C0 + v414 - 651) - 8;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + 8) = v428[BYTE3(v258) ^ 0xD7] ^ 0xC2;
  LODWORD(v423) = ((v424 ^ 0x5C323448 ^ v419) - 1507977308 - ((2 * (v424 ^ 0x5C323448 ^ v419)) & 0x4C3C2F48)) ^ v422;
  LODWORD(v423) = ((_DWORD)v423 + 793754495 - ((2 * (_DWORD)v423) & 0x5E9F76FE)) ^ v418;
  LODWORD(v423) = *(_DWORD *)(v61 - 136) ^ v587 ^ ((_DWORD)v423 - ((2 * (_DWORD)v423) & 0xDAD2220C) + 1835602182);
  v429 = (char *)*(&off_1E709D0C0 + v414 - 760) - 12;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 224)) = (v429[v423 ^ 0xC7] - 63) ^ 0x5F;
  v430 = (char *)*(&off_1E709D0C0 + SHIDWORD(a25)) - 12;
  v431 = v430[BYTE1(v423) ^ 0x13];
  HIDWORD(v269) = v431 ^ 0x2A;
  LODWORD(v269) = (v431 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + 6) = (v269 >> 30) ^ 0x40;
  v432 = ((v427 ^ 0x7A049E69 ^ v425) - 1507977308 - ((2 * (v427 ^ 0x7A049E69 ^ v425)) & 0x4C3C2F48)) ^ v262;
  v433 = (v432 - ((2 * v432) & 0x12F222BC) + 158929246) ^ v271;
  v434 = *(_DWORD *)(v61 - 132) ^ HIDWORD(v587) ^ (v433 - ((2 * v433) & 0xCF7B7D72) - 406995271);
  v435 = v430[BYTE1(v434)];
  HIDWORD(v269) = v435 ^ 0x2A;
  LODWORD(v269) = (v435 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 216)) = (v269 >> 30) ^ 0x7E;
  v436 = (char *)*(&off_1E709D0C0 + v414 - 650) - 8;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 256)) = v436[BYTE2(v258) ^ 0xFBLL] ^ 0xDD;
  v437 = ((v247 ^ 0xAF6706FA ^ v421) + 1430988054 - ((2 * (v247 ^ 0xAF6706FA ^ v421)) & 0xAA964A2C)) ^ v426;
  v438 = v415 ^ (v437 + 793754495 - ((2 * v437) & 0x5E9F76FE));
  v439 = *(_DWORD *)(v61 - 128) ^ v588 ^ (v438 - ((2 * v438) & 0x8B3C385C) + 1167989806);
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 176)) = v436[BYTE2(v439) ^ 0xB8] ^ 0xE;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 248)) = (v429[v258 ^ 0x1BLL] - 63) ^ 0x7D;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 232)) = v436[BYTE2(v423) ^ 3] ^ 0x70;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 192)) = v428[(v423 >> 24) ^ 0x6DLL] ^ 0x3A;
  LODWORD(v423) = v430[BYTE1(v258) ^ 0x92];
  HIDWORD(v269) = v423 ^ 0x2A;
  LODWORD(v269) = (v423 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 160)) = (v269 >> 30) ^ 0xD2;
  v440 = *(_QWORD *)(v61 - 208);
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + v440) = v428[HIBYTE(v434) ^ 0x53] ^ 0xD6;
  *(_BYTE *)(*(_QWORD *)(v61 - 120) + *(_QWORD *)(v61 - 184)) = (v429[v434 ^ 0x95] - 63) ^ 0xAF;
  LOBYTE(v423) = v429[v439 ^ 0x64];
  v441 = *(_QWORD *)(v61 - 120);
  *(_BYTE *)(v441 + *(_QWORD *)(v61 - 240)) = ((_BYTE)v423 - 63) ^ 0x27;
  *(_BYTE *)(v441 + *(_QWORD *)(v61 - 168)) = v428[HIBYTE(v439) ^ 0x6ELL] ^ 0x40;
  LODWORD(v423) = v430[BYTE1(v439) ^ 0x1FLL];
  HIDWORD(v269) = v423 ^ 0x2A;
  LODWORD(v269) = (v423 ^ 0x40) << 24;
  *(_BYTE *)(v441 + *(_QWORD *)(v61 - 200)) = (v269 >> 30) ^ 0x58;
  *(_BYTE *)(v441 + *(_QWORD *)(v61 - 152)) = v436[BYTE2(v434) ^ 0xC8] ^ 0x5F;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, unint64_t))(a57 + 8 * ((1692 * ((((_DWORD)v440 - 1210073429 - 2 * (((_DWORD)v440 + 16) & 0x37DFBE9F)) ^ 0xB7DFBE9B) < a55)) ^ (v414 - 380))))(v430, 793754495, 42, 2861976108, v426, 1430988054, 1587508990, v425, v443, v444, v445, v446, v448, v450, v451, v452, v455, v457, v461,
           v464,
           v467,
           v471,
           v475,
           a24,
           a25,
           v480,
           v486,
           v493,
           v499,
           v504,
           v509,
           v513,
           v518,
           v523,
           v529,
           v535,
           v541,
           v545,
           v551,
           v556,
           v562,
           v566,
           v571,
           v574,
           v578,
           v580,
           v582,
           v584,
           a49,
           v585,
           v586,
           v587);
}

void sub_1B980B3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,int a59,int a60)
{
  uint64_t v60;

  *(_DWORD *)(v60 - 128) = a57 ^ 0x9EAC4702;
  *(_DWORD *)(v60 - 140) = a59 ^ 0x2D1575D2;
  *(_DWORD *)(v60 - 132) = a60 ^ 0x93AB7741;
  *(_DWORD *)(v60 - 136) = a58 ^ 0x94358E1A;
  JUMPOUT(0x1B98096E0);
}

uint64_t sub_1B980B44C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a7 ^ (1816 * (v7 != a3))))
                            - ((a7 + 1721561428) & 0x99630FFE)
                            + 866))();
}

uint64_t sub_1B980B488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9
                                                                      + 8
                                                                      * (int)((((((a7 + 1714580835) ^ 0x66326F76) & v7) != 0)
                                                                             * ((a7 + 1714580835) & 0x99CD93EF ^ 0x362)) | (a7 + 389))))(a1, a2, a3, (v8 - a3));
}

uint64_t sub_1B980B4D8(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  int v68;
  char v69;
  uint64_t v70;
  int8x16x4_t v72;

  *(_DWORD *)(v65 - 128) = v56;
  *(_DWORD *)(v65 - 124) = v63;
  v66 = (a7 - 193) | 0x50;
  v67 = (v66 ^ 0xFFFFFE2D) & v56;
  v68 = -a3;
  *(_DWORD *)(v65 - 132) = v67;
  v69 = v61 + a2 + a1;
  v70 = (v68 + a2 + a1 + v62);
  v72.val[0].i64[0] = ((_BYTE)v68 + (_BYTE)a2 + (_BYTE)a1 + (_BYTE)v62) & 0xF;
  v72.val[0].i64[1] = ((_BYTE)v68 + v69 + 10) & 0xF;
  v72.val[1].i64[0] = ((_BYTE)v68 + v69 + 9) & 0xF;
  v72.val[1].i64[1] = ((_BYTE)v68 + v60 + ((((a7 + 63) | 0x50) + 70) ^ 3)) & 0xF;
  v72.val[2].i64[0] = ((_BYTE)v68 + v69 + 7) & 0xF;
  v72.val[2].i64[1] = ((_BYTE)v68 + v69 + 6) & 0xF;
  v72.val[3].i64[0] = ((_BYTE)v68 + v69 + 5) & 0xF;
  v72.val[3].i64[1] = ((_BYTE)v68 + v69 + 4) & 0xF;
  *(int8x8_t *)(v64 - 7 + v70) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v64 - 7 + v70), *(int8x8_t *)(v58 + (v70 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v59 + (v70 & 0xF) - 7), *(int8x8_t *)(v57 + (v70 & 0xF) - 7)))), (int8x8_t)0x3232323232323232), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v72, (int8x16_t)xmmword_1B981C660), (int8x8_t)0x505050505050505)));
  return (*(uint64_t (**)(__n128))(a56 + 8 * ((915 * (v68 != 8 - v67)) ^ v66)))((__n128)xmmword_1B981C660);
}

void sub_1B980B61C()
{
  JUMPOUT(0x1B980B544);
}

uint64_t sub_1B980B644()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)(v0 ^ (63 * (*(_DWORD *)(v1 - 128) != *(_DWORD *)(v1 - 132)))))
                            - (v0 ^ 0x217)))();
}

uint64_t sub_1B980B680(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a4 - 1802685205);
  *(_BYTE *)(v9 + v11) ^= *(_BYTE *)(v7 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)(v6 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0x32;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((998 * (a4 - 1 == v5)) ^ (a5 - 369))) - 12))();
}

void sub_1B980B6E8()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 2010122275)
    v1 = 1645153785;
  else
    v1 = -1645193695;
  *(_DWORD *)(v2 + 40) = v1;
}

void Mib5yocT(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  int v12;

  if (a2)
    v8 = a3 == 0;
  else
    v8 = 1;
  v12 = !v8 && a6 != 0 && a7 != 0 && a8 != 0;
  __asm { BR              X8 }
}

uint64_t sub_1B980B7E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _DWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,unsigned int a22)
{
  uint64_t v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t v27;

  *a6 = 0;
  *a7 = 0;
  a22 = 108757529
      * ((((&a21 | 0xC8548EC6) ^ 0xFFFFFFFE) - (~&a21 | 0x37AB7139)) ^ 0xD7371312)
      + 1695027452;
  v27 = v22;
  v25 = sub_1B9816CD4(&a21);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * ((1797 * (a21 == v24)) ^ v23)) - 4))(v25);
}

uint64_t sub_1B980B888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t *a21,unsigned int a22,unsigned int a23,int a24)
{
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v24 = 1759421093 * ((&a21 + 2130158787 - 2 * (&a21 & 0x7EF7A4C3)) ^ 0xCD8A1497);
  a24 = v24 ^ 0x18F94B49;
  HIDWORD(a21) = v24 ^ 0x771B5177;
  a22 = v24 + 1806;
  LODWORD(a21) = v24 ^ 0x7FA6CEE2;
  sub_1B97DE444((uint64_t)&a21);
  LODWORD(a11) = a23;
  a23 = 1307 - 460628867 * ((((2 * &a21) | 0x5259E7E8) - &a21 + 1456671756) ^ 0xE5BA7189);
  a21 = &STACK[0x4BD26FD1213425D9];
  sub_1B97F2874((uint64_t)&a21);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a14 + 8 * ((27 * (a22 != 1645153785)) ^ 0x16Fu)) - 4))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1B980B9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,unsigned int a24,uint64_t a25)
{
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;

  v32 = 87 * v25;
  v33 = 1178560073
      * ((-1996209345 - (&a21 | 0x8904433F) + (&a21 | 0x76FBBCC0)) ^ 0xCC6FC4A2);
  a23 = a16;
  a24 = (87 * v25 + 43) ^ v33;
  a22 = (v30 ^ 0xDBFDF3FD) + v33 + 1954504252 + ((((87 * v25 - 937) | 0x160) - 1208228218) & (2 * v30));
  sub_1B9802920((uint64_t)&a21);
  a24 = 87 * v25
      + 1224239923 * ((&a21 - 1409295590 - 2 * (&a21 & 0xABFFDB1A)) ^ 0x594C26CD)
      + 419;
  a23 = a16;
  a25 = v29;
  ((void (*)(int *))((char *)*(&off_1E709D0C0 + 87 * v25 - 926) - 12))(&a21);
  v34 = 1178560073 * (&a21 ^ 0xBA947862);
  a23 = a16;
  a24 = (v32 + 43) ^ v34;
  a22 = (v28 ^ 0x7D7D52F9) + v34 - 754974912 + ((v28 << (68 * (v32 ^ 0xB2) + 5)) & 0xFAFAA5F2);
  sub_1B9802920((uint64_t)&a21);
  a25 = v26;
  a22 = v34 + v32 + 332;
  a24 = v34 ^ ((v27 ^ 0xBFEF9D6F) + 1267826619 + ((2 * v27) & 0x7FDF3ADE));
  a23 = a16;
  v35 = ((uint64_t (*)(int *))((char *)*(&off_1E709D0C0 + (v32 ^ 0x33Du)) - 8))(&a21);
  return (*(uint64_t (**)(uint64_t))(a14 + 8 * (((a21 != v31) | ((a21 != v31) << 6)) ^ v32)))(v35);
}

uint64_t sub_1B980BBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unint64_t *a22,uint64_t a23,int a24,unsigned int a25,int a26,int a27)
{
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;

  if (a12 + (v27 ^ 0xBEFFE260) >= 0x1F8FCFD3)
    v29 = 1010542952;
  else
    v29 = 635686783;
  v30 = 460628867 * ((&a22 - 68604818 - 2 * ((unint64_t)&a22 & 0xFBE92C6E)) ^ 0xB77FAE13);
  a26 = v29 - v30;
  a24 = v30 - 982147079;
  a25 = v30 + 2138962340 + a10;
  a22 = &STACK[0x58A7AA086245692E];
  a23 = a17;
  v31 = sub_1B98170A4((uint64_t)&a22);
  return (*(uint64_t (**)(uint64_t))(a15
                                            + 8
                                            * ((1183 * (a27 == ((((a10 + 1611586287) & 0xF125FF) - 887) ^ (v28 - 364)))) ^ a10)))(v31);
}

uint64_t sub_1B980BCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,unint64_t *a23,unint64_t *a24,unsigned int a25)
{
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;

  a23 = &STACK[0x72E1645BEBB64067];
  a24 = &STACK[0x1E6EF7153090E02];
  a22 = a18;
  a25 = (v27 - 905) ^ (1225351577
                     * ((((2 * &a21) | 0xE5132B40) - &a21 + 225864288) ^ 0xD1134DB6));
  v29 = v25;
  v30 = ((uint64_t (*)(char *))((char *)*(&off_1E709D0C0 + (v27 & 0xF9F055)) - 8))(&a21);
  return (*(uint64_t (**)(uint64_t))(v29 + 8 * (((((v27 + 37624584) & 0x1C1E0EF) + 490) * (v26 < v28)) ^ v27)))(v30);
}

uint64_t sub_1B980BDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _BYTE *a18, uint64_t a19, int a20,char a21,unsigned int a22,char *a23,_BYTE *a24)
{
  char *v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  void (*v29)(unsigned int *);
  int v30;
  uint64_t v31;
  int v32;

  a22 = (v27 - 914) ^ ((&a22 ^ 0x6DF41809) * v25);
  a23 = &a21 + v26;
  a24 = a18;
  v29(&a22);
  a22 = (v27 - 914) ^ (1374699841 * ((&a22 & 0x80170750 | ~(&a22 | 0x80170750)) ^ 0x121CE0A6));
  a23 = v28;
  a24 = a18;
  v29(&a22);
  a23 = v24;
  a24 = a18;
  a22 = (v27 - 914) ^ (1374699841
                     * ((&a22 - 1703598249 - 2 * (&a22 & 0x9A752757)) ^ 0xF7813F5E));
  v29(&a22);
  a23 = a18;
  a22 = (v27 - 413) ^ (1755732067
                     * ((2 * (&a22 & 0x6B25E860) - &a22 + 349837213) ^ 0xCA1CAA46));
  v31 = sub_1B9812F54((uint64_t)&a22);
  v32 = (_DWORD)a24 == v30 + ((v27 - 109820142) & 0x68BB7FE) - 1020;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a14 + 8 * (((8 * v32) | (v32 << 9)) ^ (v27 - 1032))) - 8))(v31);
}

uint64_t sub_1B980BF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  uint64_t v20;
  int v21;
  int v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v20
                                        + 8 * (int)(((a20 == v22) * (((v21 + 1980706585) & 0x89F0D3FF) + 296)) ^ v21))
                            - ((v21 - 2065801700) & 0x7B21A19F)
                            + 151))();
}

uint64_t sub_1B980BFC4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  _BYTE *v15;
  int v16;

  *v15 = a9 ^ 0xF9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * (int)(((a14 == v16)
                                               * ((((a1 - 92) | 0xA0) ^ 0xFFFFFC63) + ((a1 + 333) | 0x210))) ^ a1))
                            - 8))();
}

uint64_t sub_1B980C01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  int v16;
  _BOOL4 v17;

  v17 = ((uint64_t (*)(_QWORD))*(&off_1E709D0C0 + (v15 ^ 1)))(v14 ^ (v16 - 736) ^ v15 ^ 0x603u) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a14 + 8 * ((v17 * (v15 ^ 0x1E0)) ^ v15)) - 8))();
}

uint64_t sub_1B980C07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;

  v23 = (a20 ^ v22) - (((((v20 - 1760) | 0x9A) + 73) ^ 0xEDAA0B17) & (2 * (a20 ^ v22))) + 1993672186;
  return ((uint64_t (*)(void))(*(_QWORD *)(v21
                                        + 8
                                        * ((504
                                          * (((2 * v23) & 0xDFDBFDDA ^ 0xCD8A09D0) + (v23 ^ 0x1938FB17) - 1610946564 != 266921705)) ^ v20))
                            - 12))();
}

uint64_t sub_1B980C110(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;

  v5 = v3 + v2 - 1877868269 >= ((33 * (a2 ^ 0x8E)) ^ 0x29Cu);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((2 * v5) | (v5 << 8)) ^ a2))
                            - ((a2 + 715336170) ^ 0x2AA32A80)))();
}

uint64_t sub_1B980C188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  _BOOL4 v8;

  v8 = v5 - a1 >= (unint64_t)(25 * (a5 ^ v6 ^ (v6 + 677))) - 1193;
  return (*(uint64_t (**)(void))(v7 + 8 * (((4 * v8) | (32 * v8)) ^ a5)))();
}

uint64_t sub_1B980C1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v10
                                                              + 8
                                                              * ((54 * (v9 >= ((v7 + (a7 ^ (v8 + 1597)) + 851) ^ 0x3CDu))) ^ a7))
                                                  - 12))(a1, 0);
}

uint64_t sub_1B980C200(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v13 = v11 + v10 + a6;
  v14 = v7 + v13;
  v15 = *(_OWORD *)(v14 - 31);
  v16 = a1 + v13;
  *(_OWORD *)(v16 - 15) = *(_OWORD *)(v14 - 15);
  *(_OWORD *)(v16 - 31) = v15;
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * ((((v9 & 0xFFFFFFE0) == 32) * ((10 * (a3 ^ (v8 + 645))) ^ 0x4AB)) ^ (v6 + a3 + 481))))();
}

void sub_1B980C264()
{
  JUMPOUT(0x1B980C214);
}

uint64_t sub_1B980C270(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  void (*v6)(_BYTE *);
  _QWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[4];
  unsigned int v12;
  uint64_t v13;

  *v7 = a1;
  *v8 = v2;
  v4 = ((v1 ^ 0x31F) - 325940229) & 0x136D717C;
  v12 = (v1 ^ 0x31F)
      + 535753261 * ((((2 * v11) | 0x432E8A82) - v11 + 1583921855) ^ 0xAB634B6E)
      + 9;
  v13 = v10;
  v6(v11);
  v12 = v4
      + 535753261
      * (((v11 | 0x27EC23AD) - v11 + (v11 & 0xD813DC50)) ^ 0x2D182D82)
      + 657;
  v13 = v9;
  v6(v11);
  return v3 ^ 0x620F0DF9u;
}

void sub_1B980C52C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X14 }
}

uint64_t sub_1B980C67C(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = (v2 ^ (a2 + 215) ^ 0x8B0A4B63) == 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * (((2 * v4) | (4 * v4)) ^ a2)))(a1, 827000779);
}

uint64_t sub_1B980C6D0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  *(_BYTE *)(a3 + (a2 - 827000779)) = *(_BYTE *)(v3 + (a2 - 827000779)) ^ *(_BYTE *)(v6 + ((a2 - 827000779) & 0xFLL)) ^ *(_BYTE *)(v5 + ((a2 - 827000779) & 0xFLL)) ^ *(_BYTE *)(v4 + ((a2 - 827000779) & 0xFLL)) ^ (97 * ((a2 + 53) & 0xF)) ^ 0x32;
  v13 = v8 - 267 + a2;
  v14 = a2 + 869111975;
  v15 = (v13 - 1292);
  v16 = (v9 > v11) ^ (v14 < v7);
  v17 = v14 < v10;
  if (v16)
    v17 = v9 > v11;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * ((83 * v17) ^ v8)) - 8))(a1, v15);
}

uint64_t sub_1B980C76C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((22
                                          * (((((v0 - 1518) | 0x1C8) - 654498756) ^ v1)
                                           + ((2 * v1) & 0xA7EED6BE ^ 0x60492B6) == 1408723807)) ^ v0))
                            - 8))();
}

uint64_t sub_1B980C7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((1362
                                          * (((a5 - 71) ^ (v5 + (((a5 - 168) | 0x605) ^ 0xAC0893E4) < 8)) & 1)) ^ a5))
                            - 4))();
}

uint64_t sub_1B980C834(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((((a7 - 311191283) & 0x128C66FD) - 159)
                                          * ((a2 + a3) >> 4 != 88045238)) ^ a7))
                            - 12))();
}

uint64_t sub_1B980C880@<X0>(int a1@<W3>, unsigned int a2@<W4>, int a3@<W7>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL4 v20;

  v9 = a3 + a1 + 248 * (((a2 + 920) | 0x301) ^ 0x747);
  v10 = v9 + v4;
  v11 = v9 + a4;
  v12 = v10 - v11;
  v13 = a3 & 0xF;
  v14 = v13 + v7 - v11;
  v15 = (v13 | v6) - v11;
  v16 = (v13 | v5) - v11;
  v20 = v12 > 0xF && v14 > 0xF && v15 > 0xF && v16 > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((86 * v20) ^ a2)) - 12))();
}

uint64_t sub_1B980C8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                                         + 8
                                                                                         * (a7 ^ (1019 * (v7 > 0xF))))
                                                                             - ((52 * (a7 ^ 0x1E1) + 1506241642) & 0xA63893F6)
                                                                             + 978))(a1, a2, a3, a4, 0);
}

uint64_t sub_1B980C94C@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  *(_DWORD *)(v9 - 116) = v7 + 2;
  *(_DWORD *)(v9 - 128) = v7 + 9;
  *(_DWORD *)(v9 - 136) = v7 + 8;
  v17.val[1].i64[0] = ((_BYTE)v7 + 1) & 0xF;
  v17.val[1].i64[1] = v7 & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v7 - 1) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v7 + 14) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v7 + 13) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v7 + 12) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)v7 + 11) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v7 + 10) & 0xF;
  v18.val[1].i64[0] = *(_DWORD *)(v9 - 128) & 0xF;
  v18.val[1].i64[1] = *(_DWORD *)(v9 - 136) & 0xF;
  v10 = *(_QWORD *)(v9 - 256);
  v18.val[2].i64[0] = ((_BYTE)v7 + 7) & 0xF;
  v18.val[2].i64[1] = (v7 + 6) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v7 + 5) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v7 + 4) & 0xF;
  v11.i64[0] = 0x6161616161616161;
  v11.i64[1] = 0x6161616161616161;
  v12.i64[0] = 0x3232323232323232;
  v12.i64[1] = 0x3232323232323232;
  v17.val[0].i64[0] = ((_BYTE)v7 + (_BYTE)v6) & 0xF;
  v17.val[0].i64[1] = *(_DWORD *)(v9 - 116) & 0xF;
  v13.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_1B981C650).u64[0];
  v13.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_1B981C650).u64[0];
  v14 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v2 - 15 + (v7 + v6)), *(int8x16_t *)(v5 + v17.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v4 + v17.val[0].i64[0] - 15), *(int8x16_t *)(v3 + v17.val[0].i64[0] - 15))));
  v15 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v14, 8uLL), v12), vmulq_s8(v13, v11)));
  *(int8x16_t *)(a2 - 15 + (v7 + v6)) = vextq_s8(v15, v15, 8uLL);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10
                                                      + 8
                                                      * ((1049 * ((((a1 - 884) | 0x618) ^ 0x608) == (v8 & 0xFFFFFFF0))) ^ a1))
                                          - 8))(v8);
}

uint64_t sub_1B980CADC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10
                                                      + 8
                                                      * (int)(((((a8 + 1437017927) & 0xAA58D7AD) - 897) * (a1 != a5)) ^ a8))
                                          - 8))(a10);
}

uint64_t sub_1B980CB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;

  v11 = ((((a8 - 1072) ^ 0x6AD) - 1853) & v9) != 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v10
                                                                                                  + 8 * (((8 * v11) | (16 * v11)) ^ (a8 - 1072)))
                                                                                      - 4))(a1, a2, a3, a4, a5, (v8 - a5));
}

uint64_t sub_1B980CB54@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W7>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  int v15;
  char v16;
  uint64_t v17;
  int8x16x4_t v19;

  *(_DWORD *)(v12 - 152) = v11;
  v14 = ((a5 - 19) ^ 0xFFFFFC3B) & v11;
  *(_QWORD *)(v12 - 136) = v6 - 7;
  *(_QWORD *)(v12 - 144) = a6 - 7;
  v15 = -a4;
  *(_DWORD *)(v12 - 160) = v14;
  v16 = v13 + a2 + a1;
  *(_DWORD *)(v12 - 128) = a5 - 19;
  *(_DWORD *)(v12 - 116) = (a5 + 1920881190) & 0x8D81ABEB;
  v17 = (v15 + a3 + a2 + a1 + 496);
  v19.val[0].i64[0] = ((_BYTE)v15 + (_BYTE)a3 + (_BYTE)a2 + (_BYTE)a1 - 16) & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v15 + v16 + 2) & 0xF;
  v19.val[1].i64[0] = ((_BYTE)v15 + v16 + 1) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v15 + v10) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v15 + v16 + 15) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v15 + v16 + 14) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v15 + v16 + 13) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v15 + v10 + *(_DWORD *)(v12 - 116) + 4) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v12 - 144) + v17) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(*(_QWORD *)(v12 - 136) + v17), *(int8x8_t *)(v9 + (v17 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v8 + (v17 & 0xF) - 7), *(int8x8_t *)(v7 + (v17 & 0xF) - 7)))), (int8x8_t)0x3232323232323232), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v19, (int8x16_t)xmmword_1B981C660), (int8x8_t)0x6161616161616161)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(*(_QWORD *)(v12 - 256)
                                                     + 8 * ((21 * (v15 != 8 - v14)) ^ *(_DWORD *)(v12 - 128)))
                                         - 4))((__n128)xmmword_1B981C660);
}

void sub_1B980CCC8()
{
  JUMPOUT(0x1B980CBE0);
}

uint64_t sub_1B980CCEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10
                                                      + 8
                                                      * (int)((((*(_DWORD *)(v11 - 116) + 1285438991) & 0xB361C74D ^ 0x305)
                                                             * (*(_DWORD *)(v11 - 152) == *(_DWORD *)(v11 - 160))) ^ *(_DWORD *)(v11 - 116)))
                                          - ((*(_DWORD *)(v11 - 116) + 536) | 0x10Du)
                                          + 1289))(a10);
}

uint64_t sub_1B980CD48@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = (a1 + v7);
  *(_BYTE *)(a2 + v10) = *(_BYTE *)(v2 + v10) ^ *(_BYTE *)(v5 + (v10 & 0xF)) ^ *(_BYTE *)(v4 + (v10 & 0xF)) ^ *(_BYTE *)(v3 + (v10 & 0xF)) ^ (97 * (v10 & 0xF)) ^ 0x32;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((1933 * (a1 + 431 * (v8 ^ 0x746) - 1294 == v6)) ^ (v8 - 1596)))
                            - 12))();
}

uint64_t sub_1B980CDC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  int v40;

  v38 = *(_QWORD *)(a1 + 24);
  *(int8x16_t *)(v37 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(a1 + 40) - 0x3EAB24E7EEDAADCALL), (int8x16_t)xmmword_1B981C680);
  if (a9)
    v39 = v38 == 0x39E8CCF6252BBBF8;
  else
    v39 = 1;
  v40 = !v39;
  HIDWORD(a12) = v35 << ((a7 - 14) & 0xDF ^ (a7 - 47));
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * (int)((158 * v40) ^ a7)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_1B980CE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  int v34;
  int v35;
  uint64_t v36;
  unsigned int v37;
  _BOOL4 v39;

  v37 = (HIDWORD(a11) & 0xFEECEEFE) + (v34 ^ 0xFF76777F);
  v39 = (((_BYTE)v37 + 1) & 0xF) != 0 || v37 == -9013377;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (((((v35 ^ 0xAB) - 410) ^ 0x3E6) * v39) ^ v35)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_1B980CEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45)
{
  uint64_t v45;
  unsigned int v46;

  v46 = a10 - (((a45 + 1991023091) & 0x895367DD ^ 0x97F0829) & a13) + 630243607;
  return ((uint64_t (*)(void))(*(_QWORD *)(v45
                                        + 8
                                        * ((251
                                          * (((2 * v46) & 0xB6FEE7BE ^ 0x7E072C) + (v46 ^ 0x5FC0F469) + 753659424 == 141255167)) ^ a45))
                            - 4))();
}

uint64_t sub_1B980CF88()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((104 * (v2 + v1 + 612404257 >= ((v0 + 465) ^ 0x74Du))) ^ (v0 - 966)))
                            - 12))();
}

uint64_t sub_1B980CFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                 + 8
                                                                                 * (int)((1278
                                                                                        * ((((a3 ^ 0x6EB)
                                                                                           - 1877) & a6) == -612404256)) ^ a3))
                                                                     - 12))(a1, a2, a3, a2);
}

uint64_t sub_1B980D034@<X0>(int a1@<W0>, int a2@<W2>, unint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v23;

  v9 = (v7 + v6 + a1);
  v10 = v9 + a3 + 1;
  v11 = (v7 + v6) & 0xF;
  v12 = v11 - v9;
  v13 = v4 + v12;
  v14 = v11 + v4 + 1;
  v15 = v3 + (((a2 ^ 0x28Bu) + 1056) ^ 0x747) + v12;
  v16 = v11 + v3 + 3;
  v17 = v12 + v5 + 4;
  v18 = v11 + v5 + 5;
  v20 = v14 > a3 && v13 < v10;
  if (v16 > a3 && v15 < v10)
    v20 = 1;
  v23 = v18 > a3 && v17 < v10 || v20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((2006 * (v23 ^ 1)) ^ a2)) - 12))();
}

uint64_t sub_1B980D0D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * ((252
                                                                         * (((a6 + 82) ^ (v6 < (((a6 - 795) | 0x180) ^ 0x19Au))) & 1)) ^ a6))
                                                           - 12))(a1, a2, 0);
}

uint64_t sub_1B980D110@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  *(_DWORD *)(v10 - 116) = a2 + 9;
  v17.val[1].i64[0] = ((_BYTE)a2 + 14) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v11 = *(_QWORD *)(v10 - 256);
  v12 = v9 + v8 + a1;
  v17.val[3].i64[0] = ((_BYTE)a2 + 10) & 0xF;
  v17.val[3].i64[1] = *(_DWORD *)(v10 - 116) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v18.val[3].i64[0] = (a2 + 2) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v13.i64[0] = 0x7777777777777777;
  v13.i64[1] = 0x7777777777777777;
  v17.val[0].i64[0] = v12 & 0xF;
  v17.val[0].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_1B981C650).u64[0];
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_1B981C650).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v13));
  *(int8x16_t *)(a4 - 15 + v12) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v5 + v17.val[0].i64[0] - 15), *(int8x16_t *)(a4 - 15 + v12)), *(int8x16_t *)(v17.val[0].i64[0] + v4 - 13)), *(int8x16_t *)(v6 + v17.val[0].i64[0] + ((4 * a3) ^ 0x62CLL) - 15)), vextq_s8(v15, v15, 8uLL));
  return (*(uint64_t (**)(void))(v11 + 8 * ((1988 * ((v7 & 0xFFFFFFF0) == 16)) ^ a3)))();
}

void sub_1B980D278()
{
  JUMPOUT(0x1B980D200);
}

uint64_t sub_1B980D284@<X0>(unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  int v16;
  char *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  char *v23;
  char v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  int v37;
  int v38;
  char *v39;
  char *v40;
  unsigned int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  uint64_t v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  int v91;
  uint64_t v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  unsigned int v96;
  char *v97;
  uint64_t v98;
  char *v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  int v104;
  uint64_t v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  int v109;
  int v110;
  unsigned int v111;
  int v112;
  unsigned int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  unsigned int v129;
  int v130;
  int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  unsigned int v143;
  int v144;
  int v145;
  unsigned int v146;
  unsigned int v147;
  int v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  int v163;
  unsigned int v164;
  int v165;
  int v166;
  unsigned int v167;
  int v168;
  int v169;
  unsigned int v170;
  int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  int v175;
  int v176;
  int v177;
  unsigned int v178;
  int v179;
  int v180;
  int v181;
  unsigned int v182;
  int v183;
  unsigned int v184;
  int v185;
  int v186;
  unsigned int v187;
  char *v188;
  char *v189;
  char *v190;
  int v191;
  uint64_t v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  char *v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  int v226;
  unsigned int v227;
  int v228;
  int v229;
  unsigned int v230;
  int v231;
  int v232;
  int v233;
  unsigned int v234;
  unsigned int v235;
  int v236;
  unsigned int v237;
  unsigned int v238;

  v11 = *(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF7);
  v12 = (v8 + 806) | 0x45;
  *(_DWORD *)(v10 - 116) = v12;
  v13 = (uint64_t)*(&off_1E709D0C0 + v8 - 862);
  v14 = *(unsigned __int8 *)(v13 + (v11 ^ 0x85));
  HIDWORD(v15) = v14 ^ 0x1A;
  LODWORD(v15) = ((v12 + 59) ^ v14) << 24;
  v16 = (v15 >> 30) ^ 0x9F;
  v17 = (char *)*(&off_1E709D0C0 + v8 - 980) - 12;
  v18 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEDLL) ^ 0xBFLL];
  HIDWORD(v15) = v18 ^ 0xC;
  LODWORD(v15) = (v18 ^ 0xC0) << 24;
  LOBYTE(v18) = v15 >> 28;
  v19 = v16 << 16;
  v20 = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF3) ^ 0x6FLL));
  HIDWORD(v15) = v20 ^ 0x1A;
  LODWORD(v15) = (v20 ^ 0x80) << 24;
  v21 = ((v15 >> 30) ^ 0x68) << 16;
  v22 = (uint64_t)*(&off_1E709D0C0 + v8 - 773);
  v23 = (char *)*(&off_1E709D0C0 + v8 - 857) - 4;
  v24 = v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBECLL) ^ 0xD8];
  v25 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBE9) ^ 0xBCLL];
  HIDWORD(v15) = v25 ^ 0xC;
  LODWORD(v15) = (v25 ^ 0xC0) << 24;
  LOBYTE(v25) = v15 >> 28;
  v26 = v21 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF2) ^ 0xDFLL)) ^ 0xC0) << 8) | ((v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF4) ^ 0xAFLL] ^ 0x6D) << 24);
  v27 = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF1) ^ 0x98];
  HIDWORD(v15) = v27 ^ 0xC;
  LODWORD(v15) = (v27 ^ 0xC0) << 24;
  v28 = v26 & 0xFFFFFF00 | (v15 >> 28);
  LODWORD(v17) = v17[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF5) ^ 0xD0];
  HIDWORD(v15) = v17 ^ 0xC;
  LODWORD(v15) = (v17 ^ 0xC0) << 24;
  LOBYTE(v17) = v15 >> 28;
  v29 = v19 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF6) ^ 0x49)) ^ 0x4A) << 8) | ((v23[*v9 ^ 0xFELL] ^ 0xB4) << 24);
  v30 = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEBLL) ^ 0xB6));
  HIDWORD(v15) = v30 ^ 0x1A;
  LODWORD(v15) = (v30 ^ 0x80) << 24;
  v31 = (v15 >> 30) ^ 0x21;
  LODWORD(v13) = *(unsigned __int8 *)(v13 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEFLL) ^ 0xC8));
  HIDWORD(v15) = v13 ^ 0x1A;
  LODWORD(v15) = (v13 ^ 0x80) << 24;
  v32 = (((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEALL) ^ 0xC7)) ^ 1) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v24 ^ 0xBDu) << 24) | (v31 << 16) | v25 ^ 0x68) ^ 0x75F49EF4;
  v33 = v18 | ((*(unsigned __int8 *)(v22 + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEELL) ^ 0xB7)) ^ 0xE1) << 8) & 0xFF00FFFF | (((v15 >> 30) ^ 0x37) << 16) | ((v23[*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBF0) ^ 0x18] ^ 0xF2) << 24);
  v34 = ((unsigned __int16)((((*(unsigned __int8 *)(v22
                                                                   + (*(unsigned __int8 *)(v6 - 0x39E8CCF6252BBBEALL) ^ 0xC7)) ^ 1) << 8) | v25 ^ 0x68) ^ 0x9EF4) >> 8);
  v35 = (char *)*(&off_1E709D0C0 + (v8 ^ 0x384)) - 4;
  LODWORD(v23) = (v34 - ((2 * (v32 >> 8)) & 0x12E) - 630217321) ^ *(_DWORD *)&v35[4 * (v34 ^ 0xF5)];
  v36 = (uint64_t)*(&off_1E709D0C0 + (v8 ^ 0x34F));
  v37 = *(_DWORD *)(v36 + 4 * (v24 ^ 0xA2u));
  HIDWORD(v15) = ~v37;
  LODWORD(v15) = v37 ^ 0xAF8BCD8;
  v38 = v31 ^ 0xDD;
  v39 = (char *)*(&off_1E709D0C0 + v8 - 811) - 8;
  LODWORD(v23) = (v15 >> 2) ^ *(_DWORD *)&v39[4 * v38] ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xA555BF4) - 2060800518);
  v40 = (char *)*(&off_1E709D0C0 + (v8 ^ 0x319)) - 4;
  v237 = v29 & 0xFFFFFF00 | v17 ^ 0x3C;
  v41 = *(_DWORD *)&v40[4 * (v25 ^ 0xD9)] ^ v237 ^ ((_DWORD)v23
                                                                   - ((2 * (_DWORD)v23) & 0xA2BAA0D4)
                                                                   - 782413718);
  v238 = v28;
  v235 = v33;
  v233 = v41 ^ v28 ^ 0x2789BBD4;
  v42 = v33 ^ 0xE6 ^ v233;
  LODWORD(v17) = *(_DWORD *)(v36 + 4 * (((v42 ^ v32) >> 24) ^ 0x21));
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0xAF8BCD8;
  LODWORD(v17) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                                            * ((v42 ^ v32) ^ 0xDE)];
  v231 = v42 ^ v32;
  v234 = v41;
  v230 = *(_DWORD *)&v35[4 * (((unsigned __int16)(v42 ^ v32) >> 8) ^ 0x1E)] ^ *(_DWORD *)&v39[4 * (((v42 ^ v32) >> 16) ^ 0x8F)] ^ v41 ^ ((((unsigned __int16)(v42 ^ v32) >> 8) ^ 0xEB) - 630217321 + (~(2 * (((v42 ^ v32) >> 8) ^ 0x4BA6EB)) | 0xFFFFFED1) + 1) ^ ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xA555BF4) - 2060800518);
  v43 = v230 ^ 0x76E748E2 ^ v41 ^ v28;
  v236 = v32;
  v44 = *(_DWORD *)(v36 + 4 * (((v43 ^ v32) >> 24) ^ 0xA2));
  HIDWORD(v15) = ~v44;
  LODWORD(v15) = v44 ^ 0xAF8BCD8;
  v45 = v43 ^ v32 ^ 0xC84590C6;
  v46 = *(_DWORD *)&v35[4 * (BYTE1(v45) ^ 0xF5)] ^ *(_DWORD *)&v39[4
                                                                 * (((v43 ^ v32) >> 16) ^ 0x6C)] ^ (BYTE1(v45) - ((v45 >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518);
  v228 = v43 ^ v32;
  v229 = v43;
  v227 = v230 ^ 0x76E748E2 ^ *(_DWORD *)&v40[4 * ((v43 ^ v32) ^ 0x83)] ^ (v46
                                                                                         - ((2 * v46) & 0xA2BAA0D4)
                                                                                         - 782413718);
  v226 = v227 ^ 0x2789BBD4 ^ v43;
  v232 = v42;
  HIDWORD(v225) = v43 ^ v42;
  v47 = v226 ^ 0x8EDEEA78 ^ v43 ^ v42;
  v48 = *(_DWORD *)(v36 + 4 * (((v47 ^ v45) >> 24) ^ 0x67));
  HIDWORD(v15) = ~v48;
  LODWORD(v15) = v48 ^ 0xAF8BCD8;
  v49 = (v15 >> 2) ^ *(_DWORD *)&v35[4 * (((unsigned __int16)(v47 ^ v45) >> 8) ^ 0x97)] ^ ((((unsigned __int16)(v47 ^ v45) >> 8) ^ 0x62) - ((2 * (((v47 ^ v45) >> 8) ^ 0xD8B62)) & 0x12E) - 630217321);
  v50 = (v49 - ((2 * v49) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4 * ((v47 ^ v45) ^ 0xE1)];
  v51 = v227 ^ 0x2789BBD4 ^ *(_DWORD *)&v39[4 * (((v47 ^ v45 ^ 0x2142BA5) >> 16) ^ 0xB6)] ^ (v50 - ((2 * v50) & 0xA555BF4) - 2060800518);
  HIDWORD(v224) = v47 ^ v45;
  LODWORD(v225) = v47;
  HIDWORD(v223) = v51 ^ v226 ^ 0x8EDEEA78;
  LODWORD(v223) = HIDWORD(v223) ^ 0x307C325C ^ v47 ^ 0x5EF1BA37;
  LODWORD(v23) = *(_DWORD *)(v36 + 4 * (((v223 ^ v47 ^ v45) >> 24) ^ 0xA4));
  HIDWORD(v15) = ~(_DWORD)v23;
  LODWORD(v15) = v23 ^ 0xAF8BCD8;
  LODWORD(v23) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                                            * ((v223 ^ v47 ^ v45) ^ 0x18)];
  v52 = v223 ^ v47 ^ v45 ^ 0xCEE37B5D;
  HIDWORD(v222) = v223 ^ v47 ^ v45;
  LODWORD(v224) = v51;
  v53 = *(_DWORD *)&v39[4 * (BYTE6(v222) ^ 0xCA)] ^ *(_DWORD *)&v35[4 * (BYTE1(v52) ^ 0xF5)] ^ v51 ^ (BYTE1(v52) - ((v52 >> 7) & 0x12E) - 630217321) ^ 0xD4F2AD1A ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xA555BF4) - 2060800518);
  v54 = v53 ^ ((v47 ^ 0x5EF1BA37) - ((2 * (v47 ^ 0x5EF1BA37)) & 0xA9E55A34) - 722293478);
  LODWORD(v17) = *(_DWORD *)(v36 + 4 * (((v54 ^ v52) >> 24) ^ 0x70));
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0xAF8BCD8;
  LODWORD(v17) = ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518) ^ *(_DWORD *)&v39[4
                                                                                            * (((v54 ^ v52 ^ 0xF3443494) >> 16) ^ 0xE4)];
  LODWORD(v17) = ((_DWORD)v17 - 782413718 + (~(2 * (_DWORD)v17) | 0x5D455F2B) + 1) ^ *(_DWORD *)&v40[4 * ((v53 ^ ((v47 ^ 0x37) - ((2 * (v47 ^ 0x37)) & 0x34) + 26) ^ v52) ^ 0x91)];
  LODWORD(v221) = v54 ^ v52;
  v55 = v54 ^ v52 ^ 0x1A89BBD4;
  LODWORD(v17) = ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xB4DF4B2E) - 630217321) ^ *(_DWORD *)&v35[4 * (BYTE1(v55) ^ 0xF5)];
  v56 = v7;
  v57 = v53 ^ BYTE1(v55) ^ ((_DWORD)v17 - ((2 * (_DWORD)v17) & 0xA9E55A34) - 722293478);
  HIDWORD(v221) = v54;
  LODWORD(v222) = v53;
  LODWORD(v220) = v53 ^ ((HIDWORD(v223) ^ 0x307C325C) - ((2 * (HIDWORD(v223) ^ 0x307C325C)) & 0xA9E55A34) - 722293478);
  HIDWORD(v219) = v57 ^ v220;
  LODWORD(v17) = v57 ^ v220 ^ 0xE6F58988;
  v58 = v17 ^ v54;
  v59 = v17 ^ v54 ^ v55;
  v60 = *(_DWORD *)(v36 + 4 * (HIBYTE(v59) ^ 0x43));
  HIDWORD(v15) = ~v60;
  LODWORD(v15) = v60 ^ 0xAF8BCD8;
  v61 = *(_DWORD *)&v35[4 * (((unsigned __int16)(v59 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)&v39[4 * (((v59 ^ 0x4D501F31) >> 16) ^ 0xE2)] ^ (((unsigned __int16)(v59 ^ 0x7ABE) >> 8) - (((v59 ^ 0x299B7ABE) >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA555BF4) - 2060800518);
  HIDWORD(v220) = v57;
  v62 = v57 ^ *(_DWORD *)&v40[4 * (v59 ^ 0xFB)] ^ (v61 - ((2 * v61) & 0xA2BAA0D4) - 782413718);
  HIDWORD(v217) = v62 ^ v17;
  LODWORD(v17) = v62 ^ v17 ^ 0x5BF36347;
  LODWORD(v219) = v58;
  LODWORD(v217) = v17 ^ v58;
  LODWORD(v23) = v17 ^ v58 ^ 0x2745D0FF;
  v63 = v23 ^ v59 ^ 0x299B7ABE ^ 0x3DCC6B2B;
  v64 = (BYTE1(v63) - ((v63 >> 7) & 0x12E) - 630217321) ^ *(_DWORD *)&v35[4 * (BYTE1(v63) ^ 0xF5)];
  v65 = (v64 - ((2 * v64) & 0xA2BAA0D4) - 782413718) ^ *(_DWORD *)&v40[4
                                                                     * ((~(v17 ^ v58) ^ v59 ^ 0xBE) ^ 0x6E)];
  HIDWORD(v216) = v23 ^ v59 ^ 0x299B7ABE;
  v66 = *(_DWORD *)(v36 + 4 * (HIBYTE(HIDWORD(v216)) ^ 0x57u));
  HIDWORD(v15) = ~v66;
  LODWORD(v15) = v66 ^ 0xAF8BCD8;
  v218 = __PAIR64__(v59, v62);
  LODWORD(v216) = (v15 >> 2) ^ *(_DWORD *)&v39[4 * (((HIDWORD(v216) ^ 0x516EF336u) >> 16) ^ 0x8B)] ^ v62 ^ (v65 - ((2 * v65) & 0xA555BF4) - 2060800518);
  HIDWORD(v215) = v216 ^ 0x930000ED ^ v17;
  LODWORD(v215) = HIDWORD(v215) ^ 0x8D06EA22 ^ v23;
  v67 = *(_DWORD *)(v36 + 4 * (((v215 ^ v63) >> 24) ^ 0x39));
  HIDWORD(v15) = ~v67;
  LODWORD(v15) = v67 ^ 0xAF8BCD8;
  HIDWORD(v214) = v215 ^ v63;
  LODWORD(v32) = v215 ^ v63 ^ 0x53DEAA41;
  v68 = *(_DWORD *)&v40[4 * ((v215 ^ v63) ^ 4)] ^ *(_DWORD *)&v35[4 * (BYTE1(v32) ^ 0xF5)] ^ 0xB32F5FD ^ (v15 >> 2);
  v69 = *(_DWORD *)&v39[4 * (((v215 ^ v63 ^ 0x9289BB39) >> 16) ^ 0x7E)] ^ v216 ^ 0x930000ED ^ BYTE1(v32) ^ 0xE1715EEC ^ (v68 - ((2 * v68) & 0xA555BF4) - 2060800518);
  v70 = (HIDWORD(v215) ^ 0x8D06EA22) - ((2 * (HIDWORD(v215) ^ 0x8D06EA22)) & 0xC2E2BDD8);
  LODWORD(v23) = v69 ^ ((_DWORD)v23 - ((2 * (_DWORD)v23) & 0xC2E2BDD8) - 512663828);
  LODWORD(v36) = *(_DWORD *)(v36 + 4 * (((v23 ^ v32) >> 24) ^ 0x44));
  HIDWORD(v15) = ~(_DWORD)v36;
  LODWORD(v15) = v36 ^ 0xAF8BCD8;
  v71 = *(_DWORD *)&v35[4
                      * (((unsigned __int16)((unsigned __int16)v23 ^ WORD2(v214) ^ 0xAA41) >> 8) ^ 0xFD)] ^ *(_DWORD *)&v40[4 * (v23 ^ BYTE4(v214) ^ 0x41 ^ 0xC4)] ^ ((((unsigned __int16)((unsigned __int16)v23 ^ WORD2(v214) ^ 0xAA41) >> 8) ^ 8) - (((v23 ^ v32) >> 7) & 0x12E) - 630217321) ^ ((v15 >> 2) - ((2 * (v15 >> 2)) & 0xA2BAA0D4) - 782413718);
  HIDWORD(v213) = v23 ^ v32 ^ 0xF2402859;
  LODWORD(v17) = (v71 - ((2 * v71) & 0xA555BF4) - 2060800518) ^ *(_DWORD *)&v39[4
                                                                              * (((v23 ^ v32) >> 16) ^ 0x16)];
  LODWORD(v34) = (_DWORD)v17 - ((2 * (_DWORD)v17) & 0xC2E2BDD8);
  v72 = (uint64_t)*(&off_1E709D0C0 + (v8 ^ 0x3BC));
  v73 = (char *)*(&off_1E709D0C0 + v8 - 920) - 4;
  v74 = (uint64_t)*(&off_1E709D0C0 + v8 - 864);
  v75 = *(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 109) ^ 0xA5));
  HIDWORD(v15) = v75 ^ 7;
  LODWORD(v15) = v75 << 24;
  v76 = (uint64_t)*(&off_1E709D0C0 + (v8 ^ 0x3BE));
  v210 = v74;
  v212 = v72;
  v77 = (*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 105) ^ 0x28)) ^ 0xD) & 0xFFFF00FF | ((((*(_BYTE *)(v10 - 106) ^ 0xAC) + *(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 106) ^ 0xA3)) + 87) ^ 0xF6) << 8) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 108) ^ 0xB2)) ^ 0x2E) << 24);
  v209 = v76;
  LODWORD(v17) = (*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 97) ^ 0x7BLL)) ^ 0x78) & 0xFFFF00FF | ((((*(_BYTE *)(v10 - 98) ^ 0xD0) + *(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 98) ^ 0xDFLL)) + 87) ^ 0xE4) << 8) | ((v73[*(unsigned __int8 *)(v10 - 99) ^ 0xAALL] ^ 0xE2) << 16) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 100) ^ 0x45)) ^ 0x16) << 24);
  v211 = v73;
  v78 = (((((v15 >> 30) ^ 0xDB) >> 2) | (((v15 >> 30) ^ 0xDB) << 6)) | ((v73[*(unsigned __int8 *)(v10 - 111) ^ 0x7ALL] ^ 0x81) << 16) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 112) ^ 0x78)) ^ 0x2C) << 24) | (((*(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 110) ^ 0x5DLL)) + (*(_BYTE *)(v10 - 110) ^ 0x52) + 87) ^ 0x5D) << 8)) ^ 0xAE30F304;
  LODWORD(v72) = ((*(unsigned __int8 *)(v74 + (*(unsigned __int8 *)(v10 - 101) ^ 0x60)) ^ 0xCC) & 0xFFFF00FF | ((v73[*(unsigned __int8 *)(v10 - 103) ^ 5] ^ 0xD0) << 16) | (((*(_BYTE *)(v72 + (*(unsigned __int8 *)(v10 - 102) ^ 4)) + (*(_BYTE *)(v10 - 102) ^ 0xB) + 87) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v76 + (*(unsigned __int8 *)(v10 - 104) ^ 0x1CLL)) ^ 0xD9) << 24)) ^ 0xF27FA7C8;
  v79 = (v77 | ((v73[*(unsigned __int8 *)(v10 - 107) ^ 0x27] ^ 0xB4) << 16)) ^ 0xF6784D9;
  LODWORD(v40) = v17 ^ 0x8663AEDE;
  LODWORD(v208) = v56 + 9013377;
  v80 = *(_DWORD *)(v10 - 116);
  HIDWORD(v207) = v80 & 0xBC56885E;
  LODWORD(v207) = v80 ^ 0x754;
  HIDWORD(v206) = v69 ^ (v70 - 512663828);
  LODWORD(v214) = v69;
  LODWORD(v206) = (v34 - 512663828) ^ v69;
  HIDWORD(v205) = v80 ^ 0x711;
  LODWORD(v205) = v80 ^ 0x7F2;
  LODWORD(v213) = v23 ^ 0x626A2240;
  HIDWORD(v208) = (v70 - 512663828) ^ 0x3DC8BA5D ^ (v34 - 512663828);
  HIDWORD(a6) = HIDWORD(v208) ^ v23 ^ 0x626A2240;
  *(_QWORD *)(v10 - 200) = 7;
  v81 = a1[7];
  *(_QWORD *)(v10 - 152) = 12;
  LODWORD(v17) = *(unsigned __int8 *)(v74 + (v81 ^ 0x41));
  v82 = a1[12] ^ 0x60;
  v83 = ((v80 - 1525) | 0x424) ^ 0x57Cu;
  *(_QWORD *)(v10 - 144) = v83;
  *(_QWORD *)(v10 - 128) = 1;
  v84 = *(unsigned __int8 *)(v209 + v82) ^ 0xAD;
  v85 = *(unsigned __int8 *)(v209 + (a1[v83] ^ 0xC1)) ^ 0x19;
  LODWORD(v82) = v73[a1[1] ^ 0x66] ^ 0x6D;
  *(_QWORD *)(v10 - 136) = 15;
  LODWORD(v35) = (_DWORD)v82 << 16;
  v86 = a1[15] ^ 0xE9;
  *(_QWORD *)(v10 - 160) = 11;
  LODWORD(v86) = *(unsigned __int8 *)(v74 + v86) ^ 0xDA;
  LODWORD(v73) = v86 | (v84 << 24);
  v87 = *(unsigned __int8 *)(v74 + (a1[11] ^ 0xC3));
  *(_QWORD *)(v10 - 176) = 0;
  v88 = v35 | ((*(unsigned __int8 *)(v209 + (*a1 ^ 0x30)) ^ 0x9D) << 24);
  LOBYTE(v35) = v87 ^ 0x10;
  *(_QWORD *)(v10 - 168) = 2;
  v89 = v88 & 0xFFFF00FF | (((*(_BYTE *)(v212 + (a1[2] ^ 0xC0)) + (a1[2] ^ 0xCF) + 87) ^ 0xF9) << 8);
  *(_QWORD *)(v10 - 232) = 4;
  *(_QWORD *)(v10 - 216) = 9;
  v90 = v211[a1[9] ^ 0x5DLL] ^ 0xBE;
  *(_QWORD *)(v10 - 192) = 10;
  v91 = (v90 << 16) | (((*(_BYTE *)(v212 + (a1[10] ^ 0xD5)) + (a1[10] ^ 0xDA) + 87) ^ 0xCF) << 8) | v87 ^ 0x10 | (v85 << 24);
  *(_QWORD *)(v10 - 184) = 14;
  v92 = a1[14];
  LOBYTE(v85) = *(_BYTE *)(v212 + (v92 ^ 0xE4));
  *(_QWORD *)(v10 - 224) = 5;
  LODWORD(v74) = (v85 + (v92 ^ 0xEB) - 41);
  *(_QWORD *)(v10 - 208) = 3;
  LODWORD(v92) = *(unsigned __int8 *)(v210 + (a1[3] ^ 0xDCLL)) ^ 0xCE | v89;
  *(_QWORD *)(v10 - 240) = 13;
  LODWORD(v17) = v17 ^ 0xA;
  v93 = v17 | ((*(unsigned __int8 *)(v209 + (a1[4] ^ 0xFCLL)) ^ 0x23) << 24);
  LODWORD(v73) = ((_DWORD)v74 << 8) | ((v211[a1[13] ^ 0x92] ^ 0x83) << 16) | v73;
  LODWORD(v74) = (v211[a1[5] ^ 0xA9] ^ 0x50) << 16;
  *(_QWORD *)(v10 - 248) = 6;
  v94 = v91 + 1271275121 - 2 * (v91 & 0x4BC61E75 ^ v35 & 4);
  LODWORD(v35) = v78 ^ v237 ^ (v92 - ((2 * v92) & 0x2F12947A) + 394873405);
  v95 = v79 ^ v238 ^ ((v74 & 0xFFFF00FF | (((*(_BYTE *)(v212 + (a1[6] ^ 0x4FLL)) + (a1[6] ^ 0x40) + 87) ^ 0xB7) << 8) | v93)
                    - 2
                    * ((v74 & 0x36DE0070 | (((*(_BYTE *)(v212 + (a1[6] ^ 0x4FLL)) + (a1[6] ^ 0x40) + 87) ^ 0xB7) << 8) & 0x3D70 | v93 & 0x36DE3D70) ^ v17 & 0x10)
                    - 1226949280);
  LODWORD(v17) = v40 ^ v236 ^ ((_DWORD)v73 + 1071257447 - 2
                                                                      * (v73 & 0x3FDA1777 ^ v86 & 0x10));
  v96 = v72 ^ v235 ^ v94;
  v97 = (char *)*(&off_1E709D0C0 + (v80 ^ 0x754)) - 8;
  LODWORD(v72) = *(_DWORD *)&v97[4 * (HIBYTE(v96) ^ 0x3F)];
  HIDWORD(v15) = ~(_DWORD)v72;
  LODWORD(v15) = v72 ^ 0x1DE9534E;
  v98 = (uint64_t)*(&off_1E709D0C0 + v80 - 1765);
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v17) ^ 0x34u)) ^ ((BYTE2(v17) ^ 0x68)
                                                                             - 114727250
                                                                             - 2
                                                                             * (((v17 >> 16) ^ 0xB768) & 0xBE ^ (v17 >> 16) & 0x10));
  v99 = (char *)*(&off_1E709D0C0 + (int)(v80 & 0xBC56885E)) - 4;
  v100 = *(_DWORD *)&v99[4 * (v96 ^ 0xC6)] ^ ((BYTE2(v35) ^ 0xD5)
                                                             - 114727250
                                                             - ((2 * ((v35 >> 16) ^ 0x6CD5)) & 0x15C)) ^ ((v96 ^ 0xAB) + 1069380434 + ((2 * (v96 ^ 0xAB) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v35) ^ 0x89u));
  v101 = *(_DWORD *)(v98 + 4 * (BYTE2(v95) ^ 0x8Cu)) ^ *(_DWORD *)&v99[4 * (v17 ^ 0xB6)] ^ ((v17 ^ 0xDB) + 1069380434 + ((2 * (v17 ^ 0xDB) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v95) ^ 0xD0) - 114727250 - ((2 * (HIWORD(v95) ^ 0xC8D0)) & 0x15C));
  v102 = *(_DWORD *)&v97[4 * (HIBYTE(v95) ^ 0xC8)];
  HIDWORD(v15) = ~v102;
  LODWORD(v15) = v102 ^ 0x1DE9534E;
  LODWORD(v92) = v101 + 1312414243 - ((2 * v101) & 0x9C73B446);
  v103 = v100 + 1312414243 - ((2 * v100) & 0x9C73B446);
  LODWORD(v73) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x6C)];
  LODWORD(v86) = ((BYTE2(v96) ^ 0xAD) - 114727250 - ((2 * (HIWORD(v96) ^ 0x3FAD)) & 0x15C)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0x1C)] ^ ((v35 ^ 0x71) + 1069380434 + ((2 * (v35 ^ 0x71) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v96) ^ 0xF1u)) ^ (v15 >> 1);
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  v104 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0xB7)];
  HIDWORD(v15) = ~v104;
  LODWORD(v15) = v104 ^ 0x1DE9534E;
  v105 = (uint64_t)*(&off_1E709D0C0 + v80 - 1760);
  v106 = (v95 ^ 0x10) + 1069380434 + ((2 * (v95 ^ 0x10) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v74) = *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0xDEu)) ^ v232 ^ *(_DWORD *)&v99[4
                                                                                       * (v95 ^ 0x7D)] ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446));
  v107 = *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0x66u));
  LODWORD(v17) = v103 ^ *(_DWORD *)(v105 + 4 * (BYTE1(v95) ^ 0x2Fu)) ^ (v15 >> 1);
  LODWORD(v35) = (_DWORD)v17 - ((2 * (_DWORD)v17) & 0x3E5B35E);
  v108 = v74 ^ v106;
  LODWORD(v17) = *(_DWORD *)(v105 + 4 * (BYTE1(v96) ^ 0x29u)) ^ v234 ^ v73 ^ v92;
  LODWORD(v86) = v107 ^ v233 ^ (v86 + 1312414243 - ((2 * v86) & 0x9C73B446));
  LODWORD(v73) = *(_DWORD *)&v97[4 * ((v74 ^ ~v106) >> 24)];
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  LODWORD(v74) = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x91)];
  HIDWORD(v15) = ~(_DWORD)v74;
  LODWORD(v15) = v74 ^ 0x1DE9534E;
  LODWORD(v74) = v15 >> 1;
  v109 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xA3)];
  HIDWORD(v15) = ~v109;
  LODWORD(v15) = v109 ^ 0x1DE9534E;
  v110 = v74 ^ *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0xF0u)) ^ ((BYTE2(v86) ^ 0xAC)
                                                              - 114727250
                                                              - 2 * ((WORD1(v86) ^ 0xA3AC) & 0xBF ^ WORD1(v86) & 0x11));
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x7B)] ^ *(_DWORD *)(v98
                                                                                             + 4
                                                                                             * (BYTE2(v108) ^ 0x15u)) ^ ((BYTE2(v108) ^ 0x49) - 114727250 - ((2 * (HIWORD(v108) ^ 0xFF49)) & 0x15C)) ^ ((v17 ^ 0x16) + 1069380434 + ((2 * (v17 ^ 0x16) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v92) = v74 + 1312414243 - ((2 * v74) & 0x9C73B446);
  LODWORD(v35) = ((_DWORD)v35 + 32692655) ^ v231;
  v111 = (v110 + 1312414243 - ((2 * v110) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v108) ^ 0x2Cu));
  LODWORD(v73) = v73 ^ *(_DWORD *)&v99[4 * (v86 ^ 3)] ^ ((v86 ^ 0x6E)
                                                                                      + 1069380434
                                                                                      + ((2
                                                                                        * (v86 ^ 0x6E)
                                                                                        + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v35) ^ 0x97u)) ^ ((BYTE2(v35) ^ 0xCB) - 114727250 - ((2 * ((v35 >> 16) ^ 0x6FCB)) & 0x15C));
  LODWORD(v74) = *(_DWORD *)(v98 + 4 * (BYTE2(v17) ^ 0x2Eu)) ^ ((BYTE2(v17) ^ 0x72)
                                                                - 114727250
                                                                - ((2 * ((v17 >> 16) ^ 0x9172)) & 0x15C));
  v112 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x6F)];
  HIDWORD(v15) = ~v112;
  LODWORD(v15) = v112 ^ 0x1DE9534E;
  LODWORD(v86) = ((v108 ^ 0xFC)
                + 1069380434
                + ((2 * (v108 ^ 0xFC) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v105
                                                                                                 + 4
                                                                                                 * (BYTE1(v86) ^ 0xBDu)) ^ *(_DWORD *)&v99[4 * (v108 ^ 0x91)] ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446)) ^ (v15 >> 1);
  v113 = ((v35 ^ 0xE2) - 1726037377) ^ v230 ^ *(_DWORD *)&v99[4 * (v35 ^ 0x8F)] ^ (v111 - 1499549486 - ((2 * v111) & 0x4D3D61A4));
  LODWORD(v17) = *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0x57u)) ^ HIDWORD(v225) ^ ((_DWORD)v73
                                                                                 + 1312414243
                                                                                 - ((2 * (_DWORD)v73) & 0x9C73B446));
  LODWORD(v86) = (v86 - ((2 * v86) & 0x80116EF0) - 1073170568) ^ v228;
  LODWORD(v35) = *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0x42u)) ^ v229 ^ v92;
  v114 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x2D)];
  HIDWORD(v15) = ~v114;
  LODWORD(v15) = v114 ^ 0x1DE9534E;
  LODWORD(v74) = ((v35 ^ 0xA1)
                + 1069380434
                + ((2 * (v35 ^ 0xA1) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xCC)];
  v115 = *(_DWORD *)(v98 + 4 * (BYTE2(v113) ^ 0xDBu)) ^ ((BYTE2(v113) ^ 0x87)
                                                         - 114727250
                                                         - 2 * ((HIWORD(v113) ^ 0x3A87) & 0xBE ^ HIWORD(v113) & 0x10)) ^ (v15 >> 1);
  LODWORD(v74) = (v74 + 1312414243 - ((2 * v74) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v113) ^ 0xDEu));
  LODWORD(v73) = ((v113 ^ 0x9E)
                + 1069380434
                + ((2 * (v113 ^ 0x9E) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v113 ^ 0xF3)];
  v116 = (v115 + 1312414243 - ((2 * v115) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0x57u));
  v117 = ((v17 ^ 0x740CBC3A) >> 16);
  LODWORD(v92) = v117 - 114727250 - (((v17 ^ 0x740CBC3A) >> 15) & 0x15C);
  v118 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x37)];
  HIDWORD(v15) = ~v118;
  LODWORD(v15) = v118 ^ 0x1DE9534E;
  v119 = v15 >> 1;
  v120 = *(_DWORD *)&v97[4 * (HIBYTE(v113) ^ 0x3A)];
  HIDWORD(v15) = ~v120;
  LODWORD(v15) = v120 ^ 0x1DE9534E;
  v121 = BYTE2(v35) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v35) ^ 0xF6u)) ^ *(_DWORD *)(v105
                                                                                + 4
                                                                                * ((unsigned __int16)((unsigned __int16)v17 ^ 0xBC3A) >> 8)) ^ 0xB710BC27 ^ (v15 >> 1);
  v122 = ((v86 ^ 0x68) - 1726037377) ^ v227 ^ *(_DWORD *)&v99[4 * (v86 ^ 5)] ^ (v121 - 1499549486 - ((2 * v121) & 0x4D3D61A4));
  LODWORD(v17) = ((v17 ^ 0x3A) - 1726037377) ^ HIDWORD(v224) ^ *(_DWORD *)&v99[4
                                                                                              * (v17 ^ 0x57)] ^ (v116 - 1499549486 - ((2 * v116) & 0x4D3D61A4));
  LODWORD(v35) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0x7C)];
  HIDWORD(v15) = ~(_DWORD)v35;
  LODWORD(v15) = v35 ^ 0x1DE9534E;
  v123 = *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0x8Eu)) ^ v225 ^ BYTE2(v86) ^ v119 ^ (v74
                                                                                   - 114727250
                                                                                   - ((2 * v74) & 0xF252CD5C));
  LODWORD(v35) = *(_DWORD *)(v105 + 4 * (BYTE1(v86) ^ 0x57u)) ^ v226 ^ v92 ^ *(_DWORD *)(v98 + 4 * (v117 ^ 0x5Cu)) ^ (v15 >> 1) ^ ((_DWORD)v73 + 1312414243 - ((2 * (_DWORD)v73) & 0x9C73B446));
  LODWORD(v86) = v123 ^ 0xFA64A511;
  LODWORD(v74) = ((v123 ^ 0x11) + 1069380434 + ((2 * (v123 ^ 0xFA64A511) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v123 ^ 0x7C)];
  LODWORD(v73) = *(_DWORD *)&v97[4 * (HIBYTE(v122) ^ 0x5B)];
  v124 = v74 + 1312414243 - ((2 * v74) & 0x9C73B446);
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  v125 = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0x28)];
  LODWORD(v74) = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x1F)];
  HIDWORD(v15) = ~v125;
  LODWORD(v15) = v125 ^ 0x1DE9534E;
  LODWORD(v73) = v15 >> 1;
  v126 = *(_DWORD *)&v97[4 * (HIBYTE(v123) ^ 0xB9)];
  HIDWORD(v15) = ~v126;
  LODWORD(v15) = v126 ^ 0x1DE9534E;
  v127 = v15 >> 1;
  LODWORD(v74) = v74 ^ ((v17 ^ 0x72)
                      + 1069380434
                      + ((2 * (v17 ^ 0x72) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  v128 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xB4)];
  HIDWORD(v15) = ~v128;
  LODWORD(v15) = v128 ^ 0x1DE9534E;
  v129 = v127 ^ *(_DWORD *)&v99[4 * (v35 ^ 0x8B)] ^ ((v35 ^ 0xE6)
                                                                    + 1069380434
                                                                    + ((2 * (v35 ^ 0xE6) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  v130 = BYTE2(v122) ^ 0x95;
  v131 = v130 - 114727250 - ((2 * (HIWORD(v122) ^ 0x5B95)) & 0x15C);
  LODWORD(v83) = v122;
  v132 = (v122 ^ 0xF4) + 1069380434 + ((2 * (v122 ^ 0xF4) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  v133 = ((BYTE2(v17) ^ 0x14)
        - 114727250
        - 2 * (((v17 >> 16) ^ 0x2814) & 0xAF ^ (v17 >> 16) & 1)) ^ v223 ^ *(_DWORD *)(v105 + 4 * (BYTE1(v122) ^ 0x1Fu)) ^ (v129 + 1312414243 - ((2 * v129) & 0x9C73B446)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v17) ^ 0x48u));
  v134 = *(_DWORD *)(v105 + 4 * BYTE1(v86)) ^ v224 ^ ((BYTE2(v35) ^ 0x59)
                                                      - 114727250
                                                      - ((2 * ((v35 >> 16) ^ 0xB459)) & 0x15C)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v35) ^ 5u)) ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446));
  LODWORD(v86) = (BYTE2(v86) - 114727250 - ((v86 >> 15) & 0x15C)) ^ HIDWORD(v223) ^ *(_DWORD *)&v99[4 * (v83 ^ 0x99)] ^ v132 ^ ((v15 >> 1) + 1312414243 - ((2 * (v15 >> 1)) & 0x9C73B446)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0x5Cu)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0x12u));
  LODWORD(v35) = *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0x34u)) ^ HIDWORD(v222) ^ v131 ^ *(_DWORD *)(v98 + 4 * (v130 ^ 0x5Cu)) ^ v124 ^ v73;
  LODWORD(v17) = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xEB)];
  HIDWORD(v15) = ~(_DWORD)v17;
  LODWORD(v15) = v17 ^ 0x1DE9534E;
  LODWORD(v17) = (v15 >> 1) + 1312414243 - ((2 * (v15 >> 1)) & 0x9C73B446);
  v135 = ((BYTE2(v86) ^ 0x81) - 114727250 - ((2 * (WORD1(v86) ^ 0x1481)) & 0x15C)) ^ *(_DWORD *)(v98
                                                                                               + 4
                                                                                               * (BYTE2(v86) ^ 0xDDu));
  v136 = ((v86 ^ 0x51) + 1069380434 + ((2 * (v86 ^ 0x51) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v86 ^ 0x3C)];
  LODWORD(v74) = *(_DWORD *)(v98 + 4 * (BYTE2(v133) ^ 0xDBu)) ^ ((BYTE2(v133) ^ 0x87)
                                                                 - 114727250
                                                                 - ((2 * (HIWORD(v133) ^ 0x7787)) & 0x15C));
  v137 = *(_DWORD *)(v98 + 4 * (((v35 ^ 0xA87CE98B) >> 16) ^ 0x5Cu)) ^ ((v35 ^ 0xA87CE98B) >> 16) ^ (v136 - 114727250 - ((2 * v136) & 0xF252CD5C));
  v138 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x14)];
  HIDWORD(v15) = ~v138;
  LODWORD(v15) = v138 ^ 0x1DE9534E;
  v139 = v15 >> 1;
  v140 = *(_DWORD *)&v97[4 * (HIBYTE(v134) ^ 0x9A)];
  HIDWORD(v15) = ~v140;
  LODWORD(v15) = v140 ^ 0x1DE9534E;
  v141 = ((v35 ^ 0x8B)
        + 1069380434
        + ((2 * (v35 ^ 0xA87CE98B) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)(v105
                                                                                           + 4 * (BYTE1(v133) ^ 0xDEu)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xE6)] ^ (v135 + 1312414243 - ((2 * v135) & 0x9C73B446)) ^ (v15 >> 1);
  v142 = *(_DWORD *)&v97[4 * (HIBYTE(v133) ^ 0x77)];
  HIDWORD(v15) = ~v142;
  LODWORD(v15) = v142 ^ 0x1DE9534E;
  LODWORD(v17) = *(_DWORD *)(v105 + 4 * (BYTE1(v86) ^ 0x34u)) ^ v221 ^ ((BYTE2(v134) ^ 0xE9)
                                                                        - 114727250
                                                                        - ((2 * (HIWORD(v134) ^ 0x9AE9)) & 0x15C)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v134) ^ 0xB5u)) ^ ((v133 ^ 0x9E) + 1069380434 + ((2 * (v133 ^ 0x9E) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ v17 ^ *(_DWORD *)&v99[4 * (v133 ^ 0xF3)];
  LODWORD(v83) = *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0xBu)) ^ v220 ^ v139 ^ ((v134 ^ 0xA8)
                                                                              + 1069380434
                                                                              + ((2 * (v134 ^ 0xA8)
                                                                                + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v134 ^ 0xC5)] ^ (v74 + 1312414243 - ((2 * v74) & 0x9C73B446));
  v143 = *(_DWORD *)(v105 + 4 * (BYTE1(v134) ^ 0x2Du)) ^ HIDWORD(v221) ^ (v15 >> 1) ^ (v137
                                                                                       + 1312414243
                                                                                       - ((2 * v137) & 0x9C73B446));
  LODWORD(v86) = (v141 - 722293478 - ((2 * v141) & 0xA9E55A34)) ^ v222;
  v144 = *(_DWORD *)&v97[4 * (BYTE3(v83) ^ 0x6D)];
  HIDWORD(v15) = ~v144;
  LODWORD(v15) = v144 ^ 0x1DE9534E;
  v145 = v15 >> 1;
  v146 = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xFD)];
  v147 = *(_DWORD *)(v98 + 4 * (((v83 ^ 0x2E0E654A) >> 16) ^ 0x5Cu)) ^ (~v146 << 31) ^ (v146 >> 1) ^ (((v83 ^ 0x2E0E654A) >> 16) - 114727250 - (((v83 ^ 0x2E0E654A) >> 15) & 0x15C)) ^ 0xEF4A9A7;
  v148 = ((v83 ^ 0x4A) + 1069380434 + ((2 * (v83 ^ 0x2E0E654A) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v83 ^ 0x27)];
  LODWORD(v73) = v147 + 1312414243 - ((2 * v147) & 0x9C73B446);
  v149 = *(_DWORD *)&v97[4 * (HIBYTE(v143) ^ 0xAE)];
  HIDWORD(v15) = ~v149;
  LODWORD(v15) = v149 ^ 0x1DE9534E;
  v150 = (v15 >> 1) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v86) ^ 0xA4u)) ^ (v148 + 1312414243 - ((2 * v148) & 0x9C73B446));
  LODWORD(v92) = v150 - 114727250 - ((2 * v150) & 0xF252CD5C);
  v151 = *(_DWORD *)(v98 + 4 * (BYTE2(v143) ^ 0x3Au)) ^ v145 ^ *(_DWORD *)&v99[4 * (v86 ^ 0x4D)] ^ ((v86 ^ 0x20) + 1069380434 + ((2 * (v86 ^ 0x20) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v143) ^ 0x66) - 114727250 - 2 * ((HIWORD(v143) ^ 0xAE66) & 0xAF ^ HIWORD(v143) & 1));
  LODWORD(v35) = ((v143 ^ 0xB3)
                - 413623133
                + ((2 * (v143 ^ 0xB3) + 126) & 0x46 ^ 0xEFCE7BFF)) ^ *(_DWORD *)(v105
                                                                                                + 4
                                                                                                * (BYTE1(v83) ^ 0x65u));
  LODWORD(v35) = ((_DWORD)v35 - 1499549486 - ((2 * (_DWORD)v35) & 0x4D3D61A4)) ^ *(_DWORD *)&v99[4
                                                                                               * (v143 ^ 0xDE)];
  LODWORD(v86) = *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0x40u)) ^ ((BYTE2(v86) ^ 0x1C)
                                                                - 114727250
                                                                - ((2 * (WORD1(v86) ^ 0xFD1C)) & 0x15C));
  LODWORD(v86) = (v86 ^ 0xD9E215AF ^ -(v86 ^ 0xD9E215AF) ^ ((v86 ^ v35 ^ 0x431D28D3)
                                                          + (v35 ^ 0x6500C283)
                                                          + 1))
               + (v35 ^ 0x6500C283);
  LODWORD(v35) = *(_DWORD *)&v97[4 * ((v17 ^ 0x3F162902) >> 24)];
  HIDWORD(v15) = ~(_DWORD)v35;
  LODWORD(v15) = v35 ^ 0x1DE9534E;
  v152 = *(_DWORD *)(v105 + 4 * (BYTE1(v143) ^ 0x7Cu));
  v153 = ((v17 ^ 0x3F162902) >> 16) ^ v219 ^ *(_DWORD *)(v98 + 4 * (((v17 ^ 0x3F162902) >> 16) ^ 0x5Cu)) ^ v92;
  v154 = (v15 >> 1) ^ HIDWORD(v218) ^ v86;
  v155 = *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0xCBu)) ^ HIDWORD(v219) ^ (v151 + 1312414243 - ((2 * v151) & 0x9C73B446));
  LODWORD(v35) = v152 ^ HIDWORD(v220) ^ ((v17 ^ 2)
                                       + 1069380434
                                       + ((2 * (v17 ^ 0x3F162902) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v17 ^ 0x6F)] ^ v73;
  LODWORD(v86) = ((BYTE2(v35) ^ 0xE9) - 114727250 - ((2 * ((v35 >> 16) ^ 0xB8E9)) & 0x15C)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v35) ^ 0xB5u));
  v156 = *(_DWORD *)&v97[4 * (HIBYTE(v153) ^ 0x9D)];
  HIDWORD(v15) = ~v156;
  LODWORD(v15) = v156 ^ 0x1DE9534E;
  v157 = v15 >> 1;
  LODWORD(v73) = *(_DWORD *)&v97[4 * (HIBYTE(v155) ^ 0x61)];
  HIDWORD(v15) = ~(_DWORD)v73;
  LODWORD(v15) = v73 ^ 0x1DE9534E;
  LODWORD(v17) = *(_DWORD *)&v99[4 * (v35 ^ 0xC5)] ^ *(_DWORD *)(v98 + 4 * (BYTE2(v153) ^ 0x28u)) ^ ((v35 ^ 0xA8) + 1069380434 + ((2 * (v35 ^ 0xA8) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ ((BYTE2(v153) ^ 0x74) - 114727250 - ((2 * (HIWORD(v153) ^ 0x9D74)) & 0x15C)) ^ (v15 >> 1);
  v158 = v157 ^ ((BYTE2(v154) ^ 0xE6) - 114727250 - 2 * ((HIWORD(v154) ^ 0xB0E6) & 0xAF ^ HIWORD(v154) & 1)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v154) ^ 0xBAu));
  LODWORD(v73) = v153;
  LODWORD(v92) = (v153 ^ 0xD9)
               + 1069380434
               + ((2 * (v153 ^ 0xD9) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  v159 = *(_DWORD *)&v97[4 * ((v35 >> 24) ^ 0xB8)];
  HIDWORD(v15) = ~v159;
  LODWORD(v15) = v159 ^ 0x1DE9534E;
  v160 = (v155 ^ 0x85) + 1069380434 + ((2 * (v155 ^ 0x85) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  v161 = ((BYTE2(v155) ^ 8) - 114727250 - ((2 * (HIWORD(v155) ^ 0x6108)) & 0x15C)) ^ *(_DWORD *)(v98
                                                                                               + 4
                                                                                               * (BYTE2(v155) ^ 0x54u)) ^ *(_DWORD *)&v99[4 * (v154 ^ 0x29)] ^ ((v154 ^ 0x44) + 1069380434 + ((2 * (v154 ^ 0x44) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v15 >> 1);
  LODWORD(v17) = *(_DWORD *)(v105 + 4 * (BYTE1(v154) ^ 0xDDu)) ^ HIDWORD(v217) ^ ((_DWORD)v17
                                                                                  + 1312414243
                                                                                  - ((2 * (_DWORD)v17) & 0x9C73B446));
  LODWORD(v83) = *(_DWORD *)&v97[4 * (HIBYTE(v154) ^ 0xB0)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  v162 = *(_DWORD *)(v105 + 4 * (BYTE1(v153) ^ 0xBDu)) ^ v218 ^ (v161 + 1312414243 - ((2 * v161) & 0x9C73B446));
  v163 = *(_DWORD *)&v99[4 * (v155 ^ 0xE8)];
  v164 = *(_DWORD *)(v105 + 4 * (BYTE1(v155) ^ 0x8Fu)) ^ HIDWORD(v216) ^ *(_DWORD *)&v99[4
                                                                                         * (v73 ^ 0xB4)] ^ v92 ^ (v15 >> 1) ^ (v86 + 1312414243 - ((2 * v86) & 0x9C73B446));
  LODWORD(v86) = v160 ^ v217 ^ v163 ^ *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0x2Du)) ^ (v158
                                                                                      + 1312414243
                                                                                      - ((2 * v158) & 0x9C73B446));
  v165 = BYTE2(v162);
  v166 = *(_DWORD *)&v97[4 * (HIBYTE(v164) ^ 0x18)];
  v167 = ((BYTE2(v86) ^ 0x66) - 114727250 - 2 * ((WORD1(v86) ^ 0xAE66) & 0xAF ^ WORD1(v86) & 1)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0x3Au));
  HIDWORD(v15) = ~v166;
  LODWORD(v15) = v166 ^ 0x1DE9534E;
  LODWORD(v35) = ((v15 >> 1) - 114727250 - ((2 * (v15 >> 1)) & 0xF252CD5C)) ^ *(_DWORD *)(v98
                                                                                        + 4 * (BYTE2(v162) ^ 0x40u));
  v168 = *(_DWORD *)&v97[4 * (HIBYTE(v162) ^ 0xEF)];
  HIDWORD(v15) = ~v168;
  LODWORD(v15) = v168 ^ 0x1DE9534E;
  v169 = (v15 >> 1) ^ *(_DWORD *)&v99[4 * (v164 ^ 0x90)] ^ ((v164 ^ 0xFD)
                                                                           + 1069380434
                                                                           + ((2 * (v164 ^ 0xFD) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v73) = v167 + 1312414243 - ((2 * v167) & 0x9C73B446);
  v170 = *(_DWORD *)&v99[4 * (v17 ^ 0x27)] ^ ((v17 ^ 0x4A)
                                                             + 1069380434
                                                             + ((2 * (v17 ^ 0x4A) + 254) & 0x1A4 ^ 0xFFC2FFFF));
  LODWORD(v83) = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0xAE)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  v171 = (v15 >> 1) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v164) ^ 0xFu)) ^ (v170 - 114727250 - ((2 * v170) & 0xF252CD5C));
  LODWORD(v74) = *(_DWORD *)&v97[4 * ((v17 >> 24) ^ 0xDC)];
  HIDWORD(v15) = ~(_DWORD)v74;
  LODWORD(v15) = v74 ^ 0x1DE9534E;
  v172 = (_DWORD)v35 + 1312414243 - ((2 * (_DWORD)v35) & 0x9C73B446);
  LODWORD(v35) = ((BYTE2(v17) ^ 0xE)
                - 114727250
                - 2 * (((v17 >> 16) ^ 0xDC0E) & 0xBF ^ (v17 >> 16) & 0x11)) ^ v216 ^ *(_DWORD *)(v105 + 4 * (BYTE1(v86) ^ 0x7Cu)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v17) ^ 0x52u)) ^ (v169 + 1312414243 - ((2 * v169) & 0x9C73B446));
  LODWORD(v83) = v86;
  v173 = (v86 ^ 0xB3) + 1069380434 + ((2 * (v86 ^ 0xB3) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v86) = *(_DWORD *)(v105 + 4 * (BYTE1(v164) ^ 0x1Bu)) ^ HIDWORD(v215) ^ *(_DWORD *)&v99[4
                                                                                                 * (v162 ^ 0x4D)] ^ ((v162 ^ 0x20) + 1069380434 + ((2 * (v162 ^ 0x20) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v15 >> 1) ^ v73;
  LODWORD(v17) = v172 ^ HIDWORD(v214) ^ v173 ^ *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0x65u)) ^ *(_DWORD *)&v99[4 * (v83 ^ 0xDE)];
  LOBYTE(v73) = v17 ^ BYTE2(v162);
  v174 = *(_DWORD *)(v105 + 4 * (BYTE1(v162) ^ 0xA4u)) ^ v215 ^ (v171 + 1312414243 - ((2 * v171) & 0x9C73B446));
  LODWORD(v92) = v17 ^ v165 ^ 0x7641388B;
  v175 = (v174 ^ BYTE2(v164));
  LODWORD(v83) = *(_DWORD *)&v97[4 * BYTE3(v92)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  LODWORD(v83) = v15 >> 1;
  v176 = *(_DWORD *)&v97[4 * ((v35 ^ 0xF7E9CFA8) >> 24)];
  HIDWORD(v15) = ~v176;
  LODWORD(v15) = v176 ^ 0x1DE9534E;
  v177 = v15 >> 1;
  v178 = (BYTE2(v92) - 114727250 - ((v17 >> 15) & 0x15C)) ^ *(_DWORD *)(v98 + 4 * (BYTE2(v92) ^ 0x5Cu));
  v179 = *(_DWORD *)&v97[4 * (HIBYTE(v174) ^ 0xE7)];
  HIDWORD(v15) = ~v179;
  LODWORD(v15) = v179 ^ 0x1DE9534E;
  v180 = v15 >> 1;
  v181 = v83 ^ *(_DWORD *)&v99[4 * (v175 ^ 0x18)] ^ (((v35 ^ 0xF7E9CFA8) >> 16)
                                                   - 114727250
                                                   - (((v35 ^ 0xF7E9CFA8) >> 15) & 0x15C)) ^ *(_DWORD *)(v98 + 4 * (((v35 ^ 0xF7E9CFA8) >> 16) ^ 0x5Cu)) ^ ((~(2 * (v175 ^ 0x75) + 4031742) | 0xFFC2FE5B) + (v175 ^ 0x75) + 1069380434);
  v182 = (v181 + 1312414243 - ((2 * v181) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v86) ^ 0xECu));
  v183 = v177 ^ *(_DWORD *)(v98 + 4 * (BYTE2(v86) ^ 0xA7u)) ^ ((BYTE2(v86) ^ 0xFB)
                                                               - 114727250
                                                               - ((2 * (WORD1(v86) ^ 0x57FB)) & 0x15C)) ^ (v92 + 1069380434 + ((2 * v92 + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ *(_DWORD *)&v99[4 * (v73 ^ 0xE6)];
  LODWORD(v83) = *(_DWORD *)&v97[4 * (BYTE3(v86) ^ 0x57)];
  HIDWORD(v15) = ~(_DWORD)v83;
  LODWORD(v15) = v83 ^ 0x1DE9534E;
  v184 = (v183 + 1312414243 - ((2 * v183) & 0x9C73B446)) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v174) ^ 0x6Du));
  v185 = HIWORD(v174) ^ 0xE731;
  LODWORD(v98) = *(_DWORD *)(v98 + 4 * (v185 ^ 0x5Cu));
  v186 = *(_DWORD *)(v105 + 4 * (BYTE1(v35) ^ 0x2Du));
  LODWORD(v86) = v86;
  v187 = ((v35 ^ 0xA8)
        + 1069380434
        + ((2 * (v35 ^ 0xF7E9CFA8) + 254) & 0x1A4 ^ 0xFFC2FFFF)) ^ (v185
                                                                                - 114727250
                                                                                - ((2 * v185) & 0x15C)) ^ *(_DWORD *)&v99[4 * (v35 ^ 0xC5)];
  LODWORD(v83) = *(_DWORD *)&v99[4 * (v86 ^ 0x42)];
  LODWORD(v35) = (v86 ^ 0x2F) + 1069380434 + ((2 * (v86 ^ 0x2F) + 254) & 0x1A4 ^ 0xFFC2FFFF);
  LODWORD(v86) = HIDWORD(v206) ^ *(_DWORD *)(v105 + 4 * (BYTE1(v17) ^ 0xDAu)) ^ ((v187 ^ (v15 >> 1) ^ v98)
                                                                                 + 1312414243
                                                                                 - ((2 * (v187 ^ (v15 >> 1) ^ v98)) & 0x9C73B446));
  LODWORD(v17) = (v184 - 512663828 - ((2 * v184) & 0xC2E2BDD8)) ^ v214;
  LODWORD(v105) = (v182 - 595648296 - ((2 * v182) & 0xB8FE41B0)) ^ HIDWORD(v213);
  LODWORD(v99) = v186 ^ v213 ^ v35 ^ v180 ^ v83 ^ (v178 + 1312414243 - ((2 * v178) & 0x9C73B446));
  BYTE2(v187) = BYTE2(v86) ^ 0x8C;
  LODWORD(v35) = v105 ^ 0x351D74B9;
  LODWORD(v34) = *(_DWORD *)(v10 - 116);
  v188 = (char *)*(&off_1E709D0C0 + (int)v34 - 1801) - 4;
  v189 = (char *)*(&off_1E709D0C0 + (int)v34 - 1668) - 8;
  v190 = (char *)*(&off_1E709D0C0 + (int)v34 - 1699) - 8;
  v191 = (*(_DWORD *)&v190[4 * (BYTE2(v17) ^ 0x9E)] - 1066110617) ^ (*(_DWORD *)&v188[4 * (v99 ^ 0xC9)]
                                                                   + 1161575469);
  v192 = *(unsigned int *)&v188[4 * (v86 ^ 0xC8)];
  v193 = (*(_DWORD *)&v190[4 * (BYTE2(v99) ^ 0x38)] - 1066110617) ^ (*(_DWORD *)&v189[4
                                                                                    * ((v86 ^ 0x898C5DC8) >> 24)]
                                                                   + 74050895) ^ (*(_DWORD *)&v188[4
                                                                                                 * (v17 ^ 0xA2)]
                                                                                + 1161575469);
  LODWORD(v98) = *(_DWORD *)&v188[4 * (v105 ^ 0xB9)];
  v194 = *(unsigned int *)&v189[4 * ((v17 >> 24) ^ 0xE7)];
  LODWORD(v188) = *(_DWORD *)&v189[4 * ((v99 >> 24) ^ 0xB8)];
  v195 = (uint64_t)*(&off_1E709D0C0 + (int)v34 - 1817);
  LODWORD(v86) = *(_DWORD *)(v195 + 4 * (BYTE1(v86) ^ 0x61u)) ^ (*(_DWORD *)&v189[4 * (BYTE3(v105) ^ 0x65)] + 74050895);
  LODWORD(v105) = *(_DWORD *)(v195 + 4 * (BYTE1(v17) ^ 0xA0u));
  LODWORD(v99) = *(_DWORD *)(v195 + 4 * (BYTE1(v99) ^ 0xE9u));
  LODWORD(v86) = (v191 - 839040011 - ((2 * v191) & 0x9BFA87EA)) ^ v86;
  LODWORD(v92) = *(_DWORD *)&v190[4 * BYTE2(v187)];
  LODWORD(v189) = *(_DWORD *)&v190[4 * BYTE2(v35)];
  LODWORD(v97) = *(_DWORD *)(v195 + 4 * BYTE1(v35)) ^ HIDWORD(v208) ^ (v193 - 839040011 - ((2 * v193) & 0x9BFA87EA));
  LODWORD(v17) = HIDWORD(a6) ^ HIDWORD(v213) ^ (v86 - 595648296 - ((2 * v86) & 0xB8FE41B0));
  v196 = ((unsigned __int16)(*(_WORD *)(v195 + 4 * BYTE1(v35)) ^ WORD2(v208) ^ (v193
                                                                                                 + 17397
                                                                                                 - ((2 * v193) & 0x87EA))) >> 8) ^ 0x99;
  v197 = (char *)*(&off_1E709D0C0 + (int)v34 - 1741) - 12;
  a1[*(_QWORD *)(v10 - 248)] = v197[v196] ^ 0x5D;
  v198 = (char *)*(&off_1E709D0C0 + (int)v34 - 1818) - 4;
  a1[*(_QWORD *)(v10 - 240)] = (v198[BYTE2(v17) ^ 0xADLL] - 42) ^ 0xC5;
  LODWORD(v196) = v105 ^ HIDWORD(a6) ^ (v192 - ((2 * v192 - 1971816358) & 0x9BFA87EA) + 322535458) ^ ((_DWORD)v188 + 74050895) ^ ((_DWORD)v189 - 1066110617);
  v199 = (char *)*(&off_1E709D0C0 + SHIDWORD(v205)) - 8;
  a1[*(_QWORD *)(v10 - 200)] = v199[v97 ^ 0xFCLL] ^ 0x42;
  a1[*(_QWORD *)(v10 - 216)] = (v198[BYTE2(v196) ^ 0x8CLL] - 42) ^ 0x47;
  v200 = (char *)*(&off_1E709D0C0 + (int)v205) - 12;
  a1[*(_QWORD *)(v10 - 232)] = (v200[(v97 >> 24) ^ 0xDELL] + 24) ^ 0x1B;
  a1[*(_QWORD *)(v10 - 224)] = ((v198[BYTE2(v97) ^ 0x15] + ((v198[BYTE2(v97) ^ 0x15] - 42) ^ 0xDA) - 41) ^ 0xFE)
                             + v198[BYTE2(v97) ^ 0x15]
                             - 42;
  v201 = (v98 + 1161575469);
  v202 = v206 ^ v99 ^ ((_DWORD)v92 - 1066110617) ^ v201 ^ ((_DWORD)v194 - ((2 * (_DWORD)v194 + 148101790) & 0x9BFA87EA) - 764989116);
  a1[*(_QWORD *)(v10 - 208)] = v199[(v206 ^ v99 ^ (v92 + 103) ^ v201 ^ (v194 - ((2 * v194 - 98) & 0xEA) + 68)) ^ 5] ^ 0xB0;
  a1[*(_QWORD *)(v10 - 152)] = (v200[(v17 >> 24) ^ 0x4ELL] + 24) ^ 0xE6;
  a1[*(_QWORD *)(v10 - 144)] = (v200[BYTE3(v196) ^ 0x9CLL] + 24) ^ 0xB8;
  v203 = *(_QWORD *)(v10 - 176);
  a1[v203] = (v200[BYTE3(v202) ^ 0x67] + 24) ^ 0x91;
  a1[*(_QWORD *)(v10 - 160)] = v199[v196 ^ 0xF2] ^ 0xBA;
  a1[*(_QWORD *)(v10 - 192)] = v197[BYTE1(v196) ^ 0x1ELL] ^ 0xFE;
  a1[*(_QWORD *)(v10 - 168)] = v197[((unsigned __int16)(v206 ^ (unsigned __int16)v99 ^ (v92 + 29031) ^ v201 ^ (v194 - ((2 * v194 - 9570) & 0x87EA) + 12612)) >> 8) ^ 0x33] ^ 0xE7;
  a1[*(_QWORD *)(v10 - 184)] = v197[BYTE1(v17) ^ 0xBCLL] ^ 0x29;
  a1[*(_QWORD *)(v10 - 136)] = v199[v17 ^ 0x9FLL] ^ 0x42;
  a1[*(_QWORD *)(v10 - 128)] = (v198[BYTE2(v202) ^ 0xDLL] - 42) ^ 0x8E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v10 - 256) + 8 * (int)((v34 - 568) | (2 * ((((_DWORD)v203 - 1332899240 - ((2 * (_DWORD)v203 + 32) & 0x611B24B0) + 16) ^ 0xB08D9258) < v56 + 9013377)))) - 8))(v201, v202, v194, &off_1E709D0C0, 66, v192, v195, v199, a2, a3, a4, a1, a6, v205, v206, v207, v208, v209, v210,
           v211,
           v212,
           v213,
           v214,
           v215,
           v216,
           v217,
           v218,
           v219,
           v220,
           v221,
           v222,
           v223,
           v224,
           v225);
}

void sub_1B98101E8()
{
  JUMPOUT(0x1B980E098);
}

uint64_t sub_1B981021C(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((253 * (v4 ^ 0x6E) - 204) * (v3 != a3)) ^ v4))
                            - (v4 + 1753)
                            + 1853))();
}

uint64_t sub_1B9810258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  char v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v7
                                                                                        + 8
                                                                                        * ((1004
                                                                                          * ((((v6 & 8) == 0) ^ (a6 + 75)) & 1)) ^ a6))
                                                                            - 8))(a1, a2, a3, (a2 - a3), (a6 + 331) | 0x400u);
}

uint64_t sub_1B9810290@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W6>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  char v15;
  uint64_t v16;
  int8x16x4_t v18;

  *(_DWORD *)(v12 - 128) = v11;
  *(_DWORD *)(v12 - 136) = v7;
  v13 = (a3 ^ 0xFFFFF88F) & v7;
  v14 = -a2;
  *(_DWORD *)(v12 - 144) = v13;
  v15 = v10 + v9 + v8;
  *(_DWORD *)(v12 - 116) = a3 ^ 0x721;
  v16 = (v14 + v10 + v9 + a1);
  v18.val[0].i64[0] = ((_BYTE)v14 + (_BYTE)v10 + (_BYTE)v9 + (_BYTE)a1) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v14 + v15 - 81) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)v14 + v15 + 5 * *(_BYTE *)(v12 - 116)) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v14 + v15 - 83) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v14 + v15 - 84) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)v14 + v15 - 85) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v14 + v15 - 86) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v14 + v15 - 87) & 0xF;
  *(int8x8_t *)(a4 - 7 + v16) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v5 + (v16 & 0xF) - 7), *(int8x8_t *)(a4 - 7 + v16)), veor_s8(*(int8x8_t *)((v16 & 0xF) + v4 - 5), *(int8x8_t *)((v16 & 0xF) + v6 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v18, (int8x16_t)xmmword_1B981C660), (int8x8_t)0x7777777777777777)));
  return (*(uint64_t (**)(__n128))(*(_QWORD *)(v12 - 256) + 8 * (a3 ^ 2 | (2 * (v14 != 8 - v13)))))((__n128)xmmword_1B981C660);
}

void sub_1B98103CC()
{
  JUMPOUT(0x1B9810300);
}

uint64_t sub_1B98103F4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (v0 ^ (973 * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 144)))))
                            - ((((v0 - 429) | 0x744u) + 4) ^ (v0 + 1431))))();
}

uint64_t sub_1B9810438@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (a1 - 141255584);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v5 + (v8 & 0xF)) ^ *(_BYTE *)((v8 & 0xF) + v4 + 2) ^ *(_BYTE *)((v8 & 0xF) + v6 + 4) ^ (119 * (v8 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((19 * (a1 - 1 != v3)) ^ (a2 - 1753))) - 8))();
}

void sub_1B98104A4()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1807390555)
    v1 = 1645153785;
  else
    v1 = -1645193695;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_1B9810508(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t *v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((a1 + 2125213654 - 2 * (a1 & 0x7EAC2FD6)) ^ 0x135837DF);
  v3 = *(unint64_t **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(unint64_t **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v2 - 0x7542B2AE577378FLL);
  v11 = v1 + 1224239923 * ((&v7 & 0x62925DD | ~(&v7 | 0x62925DD)) ^ 0xB6527F5) + 865;
  v12 = v6;
  v9 = &STACK[0xC7F991DE6408E4D];
  v10 = v5;
  v7 = v2;
  v8 = v4;
  ((void (*)(uint64_t *))*(&off_1E709D0C0 + v1 - 893))(&v7);
  v7 = *(_QWORD *)(v2 - 0x7542B2AE5773797);
  v8 = &STACK[0xC7F991DE6408E5D];
  LODWORD(v9) = v1
              + 1374699841
              * (((&v7 | 0x7984BEEA) - &v7 + (&v7 & 0x867B4110)) ^ 0x1470A6E3)
              + 406;
  sub_1B97D3534((uint64_t)&v7);
  LODWORD(v7) = v1 + 235795823 * (&v7 ^ 0x94AD4959) - 662;
  v8 = v3;
  sub_1B97E07DC((uint64_t)&v7);
  __asm { BR              X8 }
}

uint64_t sub_1B981070C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  *(_DWORD *)(v19 - 112) = v13 + 1224239923 * ((v19 + 1260386870 - 2 * ((v19 - 144) & 0x4B1FFAC6)) ^ 0xB9AC0711) + 1606;
  *(_QWORD *)(v19 - 144) = v14;
  *(_QWORD *)(v19 - 136) = a12;
  *(_QWORD *)(v19 - 104) = v17;
  *(_QWORD *)(v19 - 128) = v17;
  *(_QWORD *)(v19 - 120) = v15;
  v20 = a11(v19 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v12
                                                      + 8
                                                      * ((111
                                                        * ((((v16 + v18 - 1) < 0x7FFFFFFF) ^ (((v13 + 53) & 0xAF ^ 0x17) + 1)) & 1)) ^ (v13 - 2068888523) & 0x7B50BEAF))
                                          - 12))(v20);
}

uint64_t sub_1B98107C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  *(_QWORD *)(v19 - 136) = v15;
  *(_QWORD *)(v19 - 128) = v16;
  *(_DWORD *)(v19 - 144) = (v17 + 791) ^ (1225351577
                                        * ((((2 * ((v19 - 144) ^ 0x34E6FF81)) | 0xB1E44DAA)
                                          - ((v19 - 144) ^ 0x34E6FF81)
                                          + 655218987) ^ 0xCF8E0142));
  *(_QWORD *)(v19 - 120) = v16;
  *(_QWORD *)(v19 - 112) = v14;
  ((void (*)(uint64_t))((char *)*(&off_1E709D0C0 + v17 - 260) - 4))(v19 - 144);
  v20 = 1374699841
      * ((~((v19 - 144) ^ 0xCE91F438 | 0xE3331AF3) + (((v19 - 144) ^ 0xCE91F438) & 0xE3331AF3)) ^ 0xBFA9093D);
  *(_DWORD *)(v19 - 144) = (v17 + 1030) ^ v20;
  *(_DWORD *)(v19 - 128) = -313388985 - v20 + v18;
  *(_QWORD *)(v19 - 136) = a13;
  v21 = sub_1B98039E0(v19 - 144);
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * ((114 * (*(_DWORD *)(v19 - 140) == 538735252)) ^ v17)))(v21);
}

uint64_t sub_1B98108E8()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((111
                                          * ((((v1 + v3 - 1) < 0x7FFFFFFF) ^ ((v2 ^ 0x17) + 1)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_1B981092C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = *(_QWORD *)(v8 + 24);
  v6 = 1224239923 * ((((v4 - 144) | 0x5ECCF06D) + (~(v4 - 144) | 0xA1330F92)) ^ 0xAC7F0DBB);
  *(_DWORD *)(v4 - 144) = v6 ^ 0x3EAF37E3;
  *(_QWORD *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 128) = v6 + v3 - 849;
  sub_1B97D54C4((_DWORD *)(v4 - 144));
  *(_QWORD *)(v4 - 144) = v0;
  *(_QWORD *)(v4 - 136) = v10;
  *(_QWORD *)(v4 - 104) = v2;
  *(_QWORD *)(v4 - 128) = v2;
  *(_QWORD *)(v4 - 120) = v1;
  *(_DWORD *)(v4 - 112) = v3
                        + 1224239923 * ((2 * ((v4 - 144) & 0x10151408) - (v4 - 144) - 269816843) ^ 0x1D591622)
                        + 865;
  v9(v4 - 144);
  *(_DWORD *)(v4 - 128) = v3 + 1374699841 * ((v4 - 144) ^ 0x6DF41809) + 406;
  *(_QWORD *)(v4 - 144) = v2;
  *(_QWORD *)(v4 - 136) = v5;
  return sub_1B97D3534(v4 - 144);
}

void sub_1B9810A50(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) ^ (1225351577 * ((-2 - ((a1 | 0x21ABC784) + (~(_DWORD)a1 | 0xDE54387B))) ^ 0xFDCEE06D));
  __asm { BR              X10 }
}

uint64_t sub_1B9810B20@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067 * ((2 * (&a4 & 0x17931B20) - &a4 + 1751966942) ^ 0xB6AA5905);
  a8 = v12 ^ 0x6228DDF;
  a7 = &STACK[0x37021DA481391552];
  a4 = &STACK[0x42E48BBDD224DE45];
  a5 = v11;
  a6 = (v10 - 136) ^ v12;
  v13 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v10 ^ 0x14F)) - 8))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * (((*(_DWORD *)(v11 - 0x27681A84B35EB0EDLL) == v8) * ((v10 + 48) ^ 0x53C)) ^ v10)))(v13);
}

uint64_t sub_1B9810C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  uint64_t v11;
  int v12;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8
                                        * ((((a10 == v10) ^ (v12 + 1)) & 1 | (8
                                                                                             * (((a10 == v10) ^ (v12 + 1)) & 1))) ^ v12))
                            - 4))();
}

uint64_t sub_1B9810C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  *(_BYTE *)(v11 + (v13 + v12)) = *(_BYTE *)(a11 + (v13 + v12)) ^ 0x32;
  v17 = ((v16 - 1825813931) & 0x6CD3B57A ^ (v12 + 351)) + v13 < (a10 ^ v14);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((v17 | (8 * v17)) ^ v16)) - 4))();
}

void sub_1B9810CB0(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(*(_QWORD *)(v3 + 24) - 0x1E6EF7153090DC2) = v1;
  *(_DWORD *)(v4 - 0x72E1645BEBB64013) = v2;
  *(_DWORD *)v3 = *a1;
}

void sub_1B9810D18(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - (_DWORD)a1 - 1588304853) ^ 0x41C80600);
  __asm { BR              X14 }
}

uint64_t sub_1B9810DD8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)(((*(_DWORD *)(*(_QWORD *)(a1 + 8) + v4) != v3)
                                               * (((v1 + 1019832448) & 0xC336977F) + 614)) ^ (v1 + 1138)))
                            - ((v1 + 670) | 0x304u)
                            + 1800))();
}

uint64_t sub_1B9810E30()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((((((10 * (v2 ^ 0x731)) ^ 0xF68072D2) + v3) * (v0 - 159353952)) >> 31)
                                               * ((v2 - 1130536225) & 0x4362977E ^ 0x130)) | v2))
                            - 8))();
}

uint64_t sub_1B9810E94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = v2;
  v6 = v3 - 535753261 * ((&v5 & 0xF4826C3B | ~(&v5 | 0xF4826C3B)) ^ 0x1899DEB) - 229;
  v7 = a1;
  v8 = v2;
  return ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v1 + 8 * (v3 - 231)) - 4))(&v5);
}

void sub_1B9810FDC(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_1B98110FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  int v7;
  unsigned __int8 *v9;
  _BOOL4 v11;

  v9 = *(unsigned __int8 **)(a4 + 8 * (a5 ^ (a5 - 19)));
  v11 = ((**(unsigned __int8 **)(a7 + 80) - (*v9 ^ 0x32)) ^ 0x76DF27E7)
      + ((2 * (**(unsigned __int8 **)(a7 + 80) - (*v9 ^ 0x32))) & 0xEDBE4FCE)
      - 1183589858 == 1608824740 - v7
     && a6 != 2441235919;
  __asm { BR              X15 }
}

uint64_t sub_1B98121E8@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(v2 + (v4 - 266921706)) = *(_BYTE *)(a2 + (v4 - 266921706));
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((117 * (((a1 + 94) ^ 0xFFFFFC70) + v4 == v3)) ^ a1)) - 12))();
}

void sub_1B9812230(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(_QWORD *)(a1 + 24))
    v2 = *(_DWORD *)(a1 + 20) - v1 == 603303756;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_1B98122DC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t))(v0 + 8 * (v2 ^ 0x302)))(32) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v3 * ((v2 + 35) ^ 0x3E0)) ^ v2))
                            - ((v2 + 1328486859) & 0xB0D0E3DC ^ 0x18CLL)))();
}

uint64_t sub_1B9812348()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  _BOOL4 v4;

  v4 = v1 != v0 + ((v3 - 1653570193) & 0x628F7D0B) - 1027;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((2 * v4) | (4 * v4)) ^ v3)) - 8))();
}

uint64_t sub_1B98123A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v11 = v2 - 603303757;
  v12 = v2 - 1;
  v13 = *(unsigned __int8 *)(v6 + v11);
  if (v13 == 50)
    __asm { BR              X11 }
  if (v13 == 178)
  {
    v14 = 1645153785;
    v15 = *(_QWORD *)(v4 + 8);
    v16 = *(unsigned __int8 *)(v4 + 16) ^ v5;
    *(_QWORD *)result = v6;
    *(_DWORD *)(result + 8) = v7;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 24)
      v17 = -1454758981;
    else
      v17 = -1454758982;
    *(_DWORD *)(result + 16) = 310716794;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 1645153785;
    *(_QWORD *)(v15 - 0x17594DE9181849F3) = a2;
  }
  else
  {
    result = (*(uint64_t (**)(void))(v8 + 8 * (v9 ^ 0x419)))();
    v14 = -1645193696;
  }
  *(_DWORD *)v4 = v14;
  return result;
}

void sub_1B9812484(uint64_t a1)
{
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 1755732067 * ((2 * ((a1 ^ 0xFDCA5AD1) & 0x4699B354) - (a1 ^ 0xFDCA5AD1) - 1184478037) ^ 0x9A6AABA1);
  v3 = *(_DWORD *)(a1 + 32) - v2;
  v4 = v3
     + 628203409 * (((&v4 | 0x3341E245) + (~&v4 | 0xCCBE1DBA)) ^ 0xB1C9EE77)
     - 231789431;
  nullsub_2(&v4);
  __asm { BR              X17 }
}

uint64_t sub_1B981261C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v3 | (8 * (((v0 + 1) & 0x7FFFFFFC) != v1)))) - 4))();
}

void sub_1B9812640()
{
  JUMPOUT(0x1B98125D8);
}

uint64_t sub_1B981264C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _BOOL4 v5;

  v5 = (*(uint64_t (**)(_QWORD))(a1 + 8 * (int)(v4 - 423)))((*(_DWORD *)(v3 + 24 * v2 + 16)
                                                                                     - 1206753083)) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1176 * v5) ^ v4)) - 4))();
}

uint64_t sub_1B9812698()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;

  v3 = 13 * (v2 ^ 0x29F);
  v4 = v0 - ((2 * v0 + 1881461130) & 0x918F5A50) + ((v3 + 1325647569) & 0xB0FC3DDF) - 2133192674;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1636
                                          * (((2 * v4) & 0xFFFEFB66 ^ 0x918E5A40) + (v4 ^ 0xB738D09B) - 1394876467 != 752573824)) ^ v3))
                            - 8))();
}

uint64_t sub_1B9812750()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((158 * (v2 ^ 0x7BB)) ^ 0x14B) * ((v1 + v0 - 2147450291) > 7)) ^ v2))
                            - (((v2 ^ 0x7BBu) + 1878) ^ 0x750)))();
}

uint64_t sub_1B98127B4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (v2 ^ (((unint64_t)(v1 - a1) > 0x1F) | (2 * ((unint64_t)(v1 - a1) > 0x1F))))))();
}

uint64_t sub_1B98127D8()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((v0 < 0x20) ^ (((v1 + 42) | 0x11) + 112)) & 1)
                                          * (((((v1 - 1238) | 0x11) - 840300522) & 0x3215F7D7) - 580)) ^ ((v1 - 1238) | 0x11)))
                            - 4))();
}

uint64_t sub_1B981282C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v8 = v4 + v3 + v5;
  v9 = v1 + v8;
  v10 = *(_OWORD *)(v9 - 31);
  v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((v2 & 0xFFFFFFE0) == 32) * ((v6 - 446) ^ 0x7B)) ^ (v6 + 981)))
                            - 4))();
}

void sub_1B9812884()
{
  JUMPOUT(0x1B9812848);
}

uint64_t sub_1B9812890(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a2 ^ (477 * (v2 == v3))))
                            - ((a2 - 772328148) & 0x2E08CFDF ^ 0x5C7)))();
}

uint64_t sub_1B98128D0(uint64_t a1, int a2)
{
  char v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((a2 + 464) ^ (1777 * ((v2 & 0x18) == 0))))
                            - (a2 + 576)
                            - (a2 + 121)
                            + 1083))();
}

uint64_t sub_1B9812908(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  *(_QWORD *)(a1 - 7 + (v4 + v3 + v5 - v6)) = *(_QWORD *)(v1 - 7 + (v4 + v3 + v5 - v6));
  v9 = v7 - (v2 & 0xFFFFFFF8) - 763 == -v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((8 * v9) | (16 * v9) | v7)) - 12))();
}

uint64_t sub_1B9812968(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)(a3 + (v4 + a4)) = *(_QWORD *)(v5 + (v4 + a4));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((8 * (v6 == a4)) | (16 * (v6 == a4)) | v7)) - 12))();
}

uint64_t sub_1B9812998(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((((v3 + 102) | 0x107) ^ 0x5C8) * (v2 == a2)) ^ v3))
                            - (v3 ^ 0x55Eu)
                            + 312))();
}

uint64_t sub_1B98129D4@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;

  v6 = (a2 - 296) | 0x10A;
  *(_BYTE *)(a1 + (v4 - 752573825)) = *(_BYTE *)(v3 + (v4 - 752573825));
  v7 = v4 - 1 != (v6 ^ 0x4D1 ^ a3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((2 * v7) | (32 * v7)) ^ v6)) - 8))();
}

uint64_t sub_1B9812A24@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + (v5 + v4)) = *(_BYTE *)(v2 + (v5 + v4));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((2 * (v5 - 1 != a2)) | (32 * (v5 - 1 != a2))) ^ v3)) - 8))();
}

uint64_t sub_1B9812A54()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((*(_QWORD *)(v1 + 24) != 0x4B30070DAA05F9DDLL) * ((v0 - 838) ^ 0x165)) ^ v0))
                            - 4))();
}

uint64_t sub_1B9812A90@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;

  *(_BYTE *)(a2 - 0x4B30070DAA05F9DDLL) = 1;
  v4 = *v2;
  *(_QWORD *)(v2[5] - 0xF250A47131524EDLL) = result;
  *(_DWORD *)(v4 - 0x330904BA72E93EC0) = v3;
  *((_DWORD *)v2 + 13) = 1645153785;
  return result;
}

void sub_1B9812B24(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B9812B88@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  unsigned int v5;

  *(_DWORD *)(*(_QWORD *)(a2 + 96) + 24) = v4;
  v5 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 1881461130) & 0xEDAA0BF4) + 786919103;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2
                                                     + 8
                                                     * ((83
                                                       * (((2 * v5) & 0xDFDBFDDA ^ 0xCD8A09D0)
                                                        + (v5 ^ 0x1938FB17)
                                                        - 1610946564 != 266921705)) ^ v3))
                                         - 8))(0);
}

uint64_t sub_1B9812C1C()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1098 * ((((v2 + v1 - 1877868269) < 8) ^ 0x21) & 1)) ^ 0x179u))
                            - 8))();
}

uint64_t sub_1B9812C8C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((84 * (v4 - a1 - (unint64_t)(a3 + 12) + 385 < 0x20)) | (a3 + 1191))))();
}

uint64_t sub_1B9812CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((((a6 - 252) | 0x460) ^ 0x4E1) * (v8 < 0x20)) ^ a6))
                            - ((a6 - 805399230) & 0xB67BFFFD ^ v7)))();
}

uint64_t sub_1B9812D1C@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v9 = v7 + v6 + v8;
  v10 = v4 + v9;
  v11 = *(_OWORD *)(v10 - 31);
  v12 = a3 + v9;
  *(_OWORD *)(v12 - 15) = *(_OWORD *)(v10 - 15);
  *(_OWORD *)(v12 - 31) = v11;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((v5 & 0xFFFFFFE0) == 32) * (((a2 + 1016589078) & 0x3CED7F3C) + 357)) ^ (a1 + a2 + 1066))))();
}

void sub_1B9812D84()
{
  JUMPOUT(0x1B9812D44);
}

uint64_t sub_1B9812D90(uint64_t a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v5
                                                     + 8
                                                     * (int)(((((13 * (a5 ^ 0x105)) ^ (a2 + 1842))
                                                             + ((a5 - 1082458691) & 0xC6FF97EF))
                                                            * (v6 != a3)) ^ a5))
                                         - 8))(0);
}

uint64_t sub_1B9812DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;

  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                               + 8
                                                                               * ((244
                                                                                 * (((a6 + 112) ^ ((((a6 + 935) ^ 0x538) & v7) == 0)) & 1)) ^ a6))
                                                                   - 8))((a6 + 1646419312) & 0x9DDDA5FF, a2, a3, (v8 - a3));
}

uint64_t sub_1B9812E34@<X0>(int a1@<W0>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;

  *(_QWORD *)(a3 - 7 + (v7 + v6 + v8 - a2)) = *(_QWORD *)(v4 - 7 + (v7 + v6 + v8 - a2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a2 - (v5 & 0xFFFFFFF8) == -8) * (40 * (a1 ^ 0x4EE) + 209)) ^ a1))
                            - 4))();
}

void sub_1B9812E94()
{
  JUMPOUT(0x1B9812E60);
}

uint64_t sub_1B9812EA0(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  unint64_t v7;
  int v8;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v6 + 8 * (((a3 - 183) * (v8 != a6)) | a3))
                                         - ((a3 - a2) ^ v7)))(0);
}

uint64_t sub_1B9812ED0@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(a3 + (a1 - 266921706)) = *(_BYTE *)(v5 + (a1 - 266921706));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v3 + 8
                                                          * ((450 * ((a2 ^ 0x1C2) + a1 - 1251 != v4)) ^ a2 ^ 0x1C2))
                                         - 4))(0);
}

uint64_t sub_1B9812F14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v3)) = *(_BYTE *)(v4 + (v7 + v3));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v1 + 8 * (((v6 + v7 - 1251 != v2) * v5) ^ v6)) - 4))(0);
}

uint64_t sub_1B9812F54(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)a1 ^ (1755732067 * ((a1 & 0xECFD530 | ~(a1 | 0xECFD530)) ^ 0x2FF69714));
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_1E709D0C0 + v1 - 804)
                              + ((1547 * (*(_QWORD *)(a1 + 8) != 0x27681A84B35EB105)) ^ v1)
                              - 1)
                            - 8))();
}

uint64_t sub_1B9812FE4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1858
                                          * (*(_DWORD *)(v1 - 0x27681A84B35EB0EDLL) == ((v2 + 1851613323) & 0x91A29F6E ^ 0x620F0EB1))) ^ v2))
                            - 8))();
}

uint64_t sub_1B9813044()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x27681A84B35EB0F5) + 1273267861;
  v4 = *(_DWORD *)(v1 - 0x27681A84B35EB0F9) + 980680899;
  v5 = v4 < (v2 ^ 6u) + 1583983809;
  v6 = v3 < v4;
  if (v3 < 0x5E69B00F != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (((2 * !v6) | (4 * !v6)) ^ v2)) - 8))();
}

uint64_t sub_1B98130E0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  _DWORD *v2;

  *v2 = a2;
  *(_DWORD *)(result + 16) = -1645193524;
  return result;
}

void sub_1B98130F4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16)
     - 460628867 * (((a1 ^ 0x68759CF4 | 0x87CE5E15) - ((a1 ^ 0x68759CF4) & 0x87CE5E15)) ^ 0xA32D409C);
  __asm { BR              X10 }
}

uint64_t sub_1B981323C()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = *(_DWORD *)(v2 + 48) - v0 != 870327928 && (*(_QWORD *)(v2 + 32) | *(_QWORD *)(v2 + 56)) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((28 * v5) ^ v1))
                            - ((3 * (v1 ^ 0x6E4u)) ^ ((v1 - 974) + 4))))();
}

uint64_t sub_1B981329C()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  BOOL v4;

  v4 = v1[5] == 0x164C0FDDF1987668 || (*v1 | v1[3]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((362 * (((v0 - 100) ^ v4) & 1)) ^ v0)) - 8))();
}

uint64_t sub_1B98132FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;
  uint64_t v21;

  return ((uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 + 8 * (int)(v20 & 0x8E18C33F ^ (124 * (v19 != 0)))) - ((502 * (v20 & 0x8E18C33F ^ 0x33F) - 1894953982) & 0x70F2B3FC) + 1000))(a1, &STACK[0xC7F991DE6408EC5], a2, a3, a4, a5, a6, a7, a1, a10, a11, a12, a13, &STACK[0xC7F991DE6408EC5], a15, a8 - 0x3555E11E9398A6A2, a17, a8 - 0x3555E11E9398A7B2, a19);
}

uint64_t sub_1B981343C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  void (*v43)(uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v29 = v22 ^ 0x22F;
  v30 = ((v28 - 1244544018 - 2 * ((v28 - 144) & 0xB5D1C47E)) ^ 0xF45BC1C) * v27;
  *(_QWORD *)(v28 - 128) = v20;
  *(_QWORD *)(v28 - 120) = a20;
  *(_DWORD *)(v28 - 140) = v22 - v30 - 751;
  *(_DWORD *)(v28 - 136) = v23 + v30 + (v22 ^ 0xD21E8525);
  v46 = a1 + v21;
  ((void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v22 - 950)) - 8))(v28 - 144);
  HIDWORD(a10) = 203 * (v29 ^ 0x1C0);
  v47 = v25;
  HIDWORD(v45) = v29 + 1083;
  *(_DWORD *)(v28 - 128) = (v29 + 1083) ^ (628203409
                                         * ((2 * ((v28 - 144) & 0x54E47578) - (v28 - 144) + 723225217) ^ 0xA99386B2));
  *(_QWORD *)(v28 - 144) = a17;
  *(_QWORD *)(v28 - 136) = a18;
  v44 = (void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v29 ^ 0x147)) - 12);
  v44(v28 - 144);
  LODWORD(v45) = v29 + 1402;
  *(_QWORD *)(v28 - 120) = a17;
  *(_QWORD *)(v28 - 112) = a19;
  *(_DWORD *)(v28 - 128) = (v29 + 1402) ^ (((((v28 - 144) | 0x680F62BB) - ((v28 - 144) & 0x680F62BB)) ^ 0xD29B1AD9) * v27);
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a20;
  v43 = (void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v29 ^ 0x1C1)) - 4);
  v43(v28 - 144);
  HIDWORD(v42) = v29 + 1485;
  *(_DWORD *)(v28 - 112) = v29
                         + 1485
                         + 1224239923
                         * ((((v28 - 144) ^ 0xF9BB0CB1 | 0x15437DFD) - (((v28 - 144) ^ 0xF9BB0CB1) & 0x15437DFD)) ^ 0x1E4B8C9B);
  *(_QWORD *)(v28 - 104) = v25;
  *(_QWORD *)(v28 - 128) = a19;
  *(_QWORD *)(v28 - 120) = a17;
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a19;
  v31 = *(void (**)(uint64_t))(v26 + 8 * (v29 ^ 0x171));
  v31(v28 - 144);
  LODWORD(v42) = v29 + 469;
  *(_QWORD *)(v28 - 136) = a19;
  *(_QWORD *)(v28 - 128) = a19;
  *(_DWORD *)(v28 - 120) = v29 + 469 + 1225351577 * ((v28 - 144) ^ 0x239AD816);
  *(_QWORD *)(v28 - 112) = a9;
  *(_QWORD *)(v28 - 104) = a17;
  *(_QWORD *)(v28 - 144) = a18;
  v32 = (void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v29 - 279)) - 12);
  v32(v28 - 144);
  *(_QWORD *)(v28 - 144) = a13;
  *(_QWORD *)(v28 - 136) = a18;
  *(_DWORD *)(v28 - 128) = (v29 + 1083) ^ (628203409
                                         * ((((v28 - 144) | 0xDED8722D) - ((v28 - 144) & 0xDED8722D)) ^ 0x5C507E1E));
  v44(v28 - 144);
  *(_QWORD *)(v28 - 120) = a13;
  *(_QWORD *)(v28 - 112) = a7;
  *(_DWORD *)(v28 - 128) = (v29 + 1402) ^ (1178560073
                                         * ((989915423 - ((v28 - 144) | 0x3B00E91F) + ((v28 - 144) | 0xC4FF16E0)) ^ 0x7E6B6E82));
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a20;
  v43(v28 - 144);
  *(_DWORD *)(v28 - 112) = v29
                         + 1485
                         + 1224239923 * ((((v28 - 144) | 0x639614A3) + (~(v28 - 144) | 0x9C69EB5C)) ^ 0x9125E975);
  *(_QWORD *)(v28 - 104) = v47;
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a7;
  *(_QWORD *)(v28 - 128) = a7;
  *(_QWORD *)(v28 - 120) = a13;
  v31(v28 - 144);
  *(_QWORD *)(v28 - 136) = a7;
  *(_QWORD *)(v28 - 128) = a7;
  *(_QWORD *)(v28 - 112) = a11;
  *(_QWORD *)(v28 - 104) = a13;
  *(_DWORD *)(v28 - 120) = v29
                         + 469
                         + 1225351577 * ((((v28 - 144) | 0x59480BB8) - ((v28 - 144) & 0x59480BB8)) ^ 0x7AD2D3AE);
  *(_QWORD *)(v28 - 144) = a18;
  v32(v28 - 144);
  *(_DWORD *)(v28 - 144) = v29
                         - 108757529
                         * (((((v28 - 144) | 0xF475AFFA) ^ 0xFFFFFFFE) - (~(v28 - 144) | 0xB8A5005)) ^ 0xEB16322E)
                         - 81;
  *(_QWORD *)(v28 - 136) = a7;
  *(_QWORD *)(v28 - 128) = a19;
  ((void (*)(uint64_t))((char *)*(&off_1E709D0C0 + (v29 ^ 0x1AB)) - 12))(v28 - 144);
  *(_DWORD *)(v28 - 140) = (v29 + 383) ^ (460628867 * ((v28 - 144) ^ 0x4C96827D));
  *(_QWORD *)(v28 - 136) = a7;
  sub_1B98032C4(v28 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void (*)(uint64_t), uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))(*(_QWORD *)(v24 + 8 * (v29 | (32 * (*(_DWORD *)(v28 - 144) < (HIDWORD(a10) + 1901766070))))) - 7 * (v29 ^ 0x194u) + 597))(v33, v34, v35, v36, v37, v38, v39, v40, a2, v42, v43, v44, v45, a7, 7 * (v29 ^ 0x194u), a9, a10, (char *)*(&off_1E709D0C0 + (v29 ^ 0x15A)) - 8, v46,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           v31);
}

uint64_t sub_1B981393C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void (*a18)(uint64_t), uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void (*a27)(uint64_t),uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  void (*v35)(uint64_t);
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_DWORD *)(v40 - 144) = (v37 - 204) ^ (235795823 * ((v40 - 101333398 - 2 * ((v40 - 144) & 0xF9F5C6FA)) ^ 0x6D588FA3));
  *(_QWORD *)(v40 - 136) = v39;
  *(_QWORD *)(v40 - 128) = v36;
  v35(v40 - 144);
  *(_QWORD *)(v40 - 144) = a25;
  *(_QWORD *)(v40 - 136) = v39;
  *(_DWORD *)(v40 - 112) = v37
                         + 1327
                         + 1224239923
                         * ((2 * (((v40 - 144) ^ 0xA8FDC33E) & 0x7EE300AA) - ((v40 - 144) ^ 0xA8FDC33E) + 18677589) ^ 0x5B52C1BC);
  *(_QWORD *)(v40 - 128) = v39;
  *(_QWORD *)(v40 - 120) = v36;
  *(_QWORD *)(v40 - 104) = a35;
  a27(v40 - 144);
  *(_DWORD *)(v40 - 112) = v37
                         + 1327
                         + 1224239923
                         * ((((v40 - 144) | 0x595B079F) - (v40 - 144) + ((v40 - 144) & 0xA6A4F860)) ^ 0xABE8FA48);
  *(_QWORD *)(v40 - 144) = a25;
  *(_QWORD *)(v40 - 136) = a19;
  *(_QWORD *)(v40 - 128) = v39;
  *(_QWORD *)(v40 - 120) = v36;
  *(_QWORD *)(v40 - 104) = v39;
  a27(v40 - 144);
  *(_QWORD *)(v40 - 136) = v39;
  *(_QWORD *)(v40 - 128) = a24;
  *(_DWORD *)(v40 - 144) = (v37 - 1882358073) ^ (235795823
                                               * ((((v40 - 144) | 0xEC38560C) - ((v40 - 144) & 0xEC38560C)) ^ 0x78951F55));
  sub_1B9817564(v40 - 144);
  *(_DWORD *)(v40 - 144) = (v37 - 204) ^ (235795823
                                        * ((-2026376004 - ((v40 - 144) | 0x8737F4BC) + ((v40 - 144) | 0x78C80B43)) ^ 0xEC65421A));
  *(_QWORD *)(v40 - 136) = v39;
  *(_QWORD *)(v40 - 128) = a26;
  a18(v40 - 144);
  *(_QWORD *)(v40 - 144) = v39;
  *(_QWORD *)(v40 - 136) = a26;
  *(_DWORD *)(v40 - 128) = v37 + 1374699841 * ((v40 - 144) ^ 0x6DF41809) + 868;
  v41 = sub_1B97D3534(v40 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v38
                                                      + 8
                                                      * ((((((v37 - 577) ^ (a23 == 0)) & 1) == 0) * (v37 - 556)) ^ (v37 + 381)))
                                          - 12))(v41);
}

uint64_t sub_1B9813B7C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v4 = 535753261 * ((((v3 - 144) ^ 0x80BC1318 | 0x67434C63) + ((v3 - 144) ^ 0x26000443 | 0x98BCB39C)) ^ 0xAC481975);
  *(_DWORD *)(v3 - 136) = ((v0 | 0x648) - 403) ^ v4;
  *(_DWORD *)(v3 - 120) = v4 + v7 + 1259132612 + (((v0 | 0x648) - 953243641) & 0x38D157BF);
  *(_QWORD *)(v3 - 144) = v8;
  *(_QWORD *)(v3 - 128) = v2;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_1E709D0C0 + ((v0 | 0x648) ^ 0x6B6)) - 8))(v3 - 144);
  *(_DWORD *)(v6 - 0x164C0FDDF1987668) = v7;
  *(_DWORD *)(v1 + 64) = 1645153785;
  return result;
}

void sub_1B9813D28(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 1759421093 * ((a1 - 1364022623 - 2 * (a1 & 0xAEB2AAA1)) ^ 0x1DCF1AF5);
  __asm { BR              X9 }
}

uint64_t sub_1B9813DD8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  BOOL v3;

  v3 = (*(uint64_t (**)(uint64_t))(v0 + 8 * (v1 - 613)))(200) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1636 * ((v3 ^ v1) & 1)) ^ v1)) - 8))();
}

uint64_t sub_1B9813E18(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t result;
  int v10;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 8 * ((v7 ^ 0x4D8) - 1826)))(a1, 0);
  if ((_DWORD)result == 16)
  {
    v3 -= 7;
    goto LABEL_7;
  }
  if ((_DWORD)result == 12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t))(v5 + 8 * (v4 & 0x75DAF05A)))(a1);
    v10 = v3;
    goto LABEL_8;
  }
  if ((_DWORD)result)
  {
    v3 -= 6;
    goto LABEL_7;
  }
  *v6 = a1;
  v10 = 2107069443;
LABEL_8:
  *(_DWORD *)(v1 + 12) = v10 ^ v2;
  return result;
}

void sub_1B9813EA4(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X10 }
}

uint64_t sub_1B9813F70@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067 * ((&a4 & 0xC1A12D46 | ~(&a4 | 0xC1A12D46)) ^ 0xE0986F62);
  a7 = &STACK[0x37021DA48139155A];
  a6 = (v10 - 127) ^ v12;
  a4 = &STACK[0x42E48BBDD224DE3D];
  a5 = v11;
  a8 = v12 ^ 0x6BDE6AF;
  v13 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v10 - 300)) - 8))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((866
                                              * (*(_DWORD *)(v11 - 0x27681A84B35EB0EDLL) == v8
                                                                                          + ((v10 + 682) | 0x24)
                                                                                          - 1063)) ^ v10)))(v13);
}

uint64_t sub_1B9814058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((111 * (a11 != v11 + 4)) ^ v13))
                            - ((v13 - 509929160) & 0x1E64E3F9)
                            + 337))();
}

void sub_1B981409C(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;

  *a1 = v2;
  *(_DWORD *)(v1 + 4) = -1645193524;
}

void sub_1B9814154(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xB853BF30 | ~(a1 | 0xB853BF30)) ^ 0x996AFD14);
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_1E709D0C0 + (v1 ^ 0x345)))((char *)*(&off_1E709D0C0 + v1 - 872) - 4, sub_1B981723C);
  __asm { BR              X11 }
}

uint64_t sub_1B9814224@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = **(_QWORD **)(v2 + 8 * (a1 - 698)) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v3 | (32 * v3)) ^ a1)) - 4))();
}

uint64_t sub_1B9814250()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0x309)))(v1);
}

void sub_1B9814280(uint64_t a1, uint64_t a2)
{
  __asm { BR              X8 }
}

uint64_t sub_1B9814308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((918 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0x94u)) - 12))();
}

uint64_t sub_1B9814334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  _BOOL4 v24;

  *(_QWORD *)(*(_QWORD *)(a17 + 96) + 504) = v19 + 1;
  *(_DWORD *)(*(_QWORD *)(a17 + 96) + 496) = a19 - 1;
  v22 = 1178560073 * ((((v21 - 152) | 0xA18E8F2E) - ((v21 - 152) & 0xA18E8F2E)) ^ 0x1B1AF74C);
  *(_QWORD *)(v21 - 144) = v21 + 0x5C6940C6B1BC6F3ELL;
  *(_DWORD *)(v21 - 136) = 1172345435 - v22;
  *(_DWORD *)(v21 - 152) = 1076023948 - v22;
  v23 = sub_1B97E0618(v21 - 152);
  v24 = a19 - 1071279739 + ((2 * (*(_DWORD *)(v21 - 184) & 0x3F)) ^ 0x28) + (*(_DWORD *)(v21 - 184) & 0x3F ^ 0xF7ECD6EB) > 0xFFFFFFBF;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * (((4 * v24) | (8 * v24)) ^ 0x283u)) - 12))(v23);
}

uint64_t sub_1B9814528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  int v19;
  int v20;
  uint64_t v21;
  _BOOL4 v22;

  v22 = v19 + 1552915351 < (a19 + 2020647308);
  if ((a19 + 2020647308) < 0xC05E38C8 != (v19 + 1552915351) < 0xC05E38C8)
    v22 = (a19 + 2020647308) < 0xC05E38C8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v21 + 8 * ((v22 * (((v20 - 189) | 0x14) + 430)) ^ v20)) - 4))();
}

uint64_t sub_1B9814594(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v21 = (a1 + 7106602) | 0xC1808080;
  v22 = 628203409 * ((((v20 - 152) | 0xE8E27941) - (v20 - 152) + ((v20 - 152) & 0x171D86B8)) ^ 0x6A6A7572);
  *(_QWORD *)(v20 - 152) = a16;
  *(_DWORD *)(v20 - 144) = v22 + a1 + 992;
  *(_DWORD *)(v20 - 140) = a19 - v22 - 699382058;
  v23 = sub_1B97F4E54(v20 - 152);
  v24 = *(_DWORD *)(v20 - 184) & 0x3F;
  *(_BYTE *)(v20 - 252 + (v24 ^ 0x14)) = -78;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (int)((((v24 ^ 0x14) > 0x37) * (v21 ^ 0xC1ECF534)) ^ a1))
                                          - 12))(v23);
}

uint64_t sub_1B98146B4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t))(v6
                                            + 8
                                            * (((v4 == a4 + ((v5 - 202575953) & 0xCDFFFFF7) + 63)
                                              * (((v5 + 225) | 0x400) - 1545)) | v5)))(-1615192458);
}

uint64_t sub_1B9814700(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((103 * ((v3 ^ 0x2Bu) >= ((a3 + (v4 ^ 0x78) - 1625) ^ (a3 + 8)))) ^ v4))
                            - 4))();
}

uint64_t sub_1B981473C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 252 + a2 + a1) = 0x3232323232323232;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8 * ((51 * (((v3 + 704899974) & 0xD5FC0F78) - 336 == (v2 & 0x38))) ^ v3))
                            - 8))();
}

uint64_t sub_1B98147A0@<X0>(int a1@<W4>, int a2@<W8>)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  unsigned int v11;
  int v12;
  _BOOL4 v13;

  v10 = v3 < v4;
  *(_BYTE *)(v9 - 252 + (a2 - 1737234171)) = *(_BYTE *)(v6 + (v2 + a1))
                                                         + (~(*(unsigned __int8 *)(v6
                                                                                                  + (v2 + a1)) << (v7 + 27)) | 0x9B)
                                                         + 51;
  v11 = v2 + 1 + v5;
  v12 = v10 ^ (v11 < v4);
  v13 = v11 < v3;
  if (!v12)
    v10 = v13;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v8 + 8 * ((491 * v10) ^ v7)) - 4))((v7 - 169));
}

uint64_t sub_1B9814820(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6 + 8 * ((622 * (((v4 == v3) ^ (a3 + v5 - 92)) & 1)) ^ v5)))();
}

uint64_t sub_1B9814870(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t (*a25)(_QWORD, __n128, __n128, __n128, __n128, __n128),int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int32x4_t a33,int32x4_t a34,int32x4_t a35,int32x4_t a36)
{
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t (*v44)(_QWORD, __n128, __n128, __n128, __n128, __n128);
  __n128 v45;
  const char *v46;
  __n128 v47;
  __n128 v48;
  uint64_t v49;
  __n128 v50;
  __n128 v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  uint8x16_t v57;
  uint16x8_t v58;
  int8x16_t v59;
  uint16x8_t v60;
  int8x16_t v61;
  uint8x16_t v62;
  uint16x8_t v63;
  uint16x8_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  uint8x16_t v69;
  int8x16_t v72;
  int8x16_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int v82;
  uint8x16_t v83;
  uint16x8_t v84;
  uint16x8_t v85;
  uint8x16_t v86;
  uint8x16_t v91;
  uint16x8_t v92;
  uint16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  _DWORD *v98;
  int v99;
  unsigned int v100;
  unint64_t v101;
  int8x16x4_t v102;
  int8x16x4_t v103;

  v44 = (uint64_t (*)(_QWORD, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v40 + 8 * (a4 + v36 + 61))
                                                                               - 12);
  v45 = (__n128)vdupq_n_s32(0x620F0DFFu);
  v46 = (const char *)(v43 - 252);
  v47 = (__n128)vdupq_n_s32(0x620F0DF9u);
  v48.n128_u64[0] = 0x3232323232323232;
  v48.n128_u64[1] = 0x3232323232323232;
  a27 = v41 - 16;
  v49 = (v42 - 1);
  v50.n128_u64[0] = 0x6464646464646464;
  v50.n128_u64[1] = 0x6464646464646464;
  v51 = (__n128)vdupq_n_s32(0xC41E1BF2);
  v53 = *(_DWORD *)(v43 - 180);
  v52 = *(_DWORD *)(v43 - 176);
  a26 = v53;
  v54 = *(_DWORD *)(v43 - 172);
  v55 = *(_DWORD *)(v43 - 168);
  v56 = *(_BYTE *)(v43 - 156) ^ 0x5F;
  if (v56 == 2)
  {
    a25 = v44;
    v103 = vld4q_s8(v46);
    v82 = a3 + a4 + 361;
    v83 = (uint8x16_t)veorq_s8(v103.val[0], (int8x16_t)v48);
    v84 = vmovl_u8(*(uint8x8_t *)v83.i8);
    v85 = vmovl_high_u8(v83);
    v86 = (uint8x16_t)veorq_s8(v103.val[1], (int8x16_t)v48);
    _Q22 = vmovl_u8(*(uint8x8_t *)v86.i8);
    _Q21 = vmovl_high_u8(v86);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v91 = (uint8x16_t)veorq_s8(v103.val[2], (int8x16_t)v48);
    v92 = vmovl_high_u8(v91);
    v93 = vmovl_u8(*(uint8x8_t *)v91.i8);
    v103.val[0] = veorq_s8(v103.val[3], (int8x16_t)v48);
    v103.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v103.val[0]);
    v103.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[1]);
    v103.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[1].i8);
    v103.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v103.val[0].i8);
    v103.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[0]);
    v103.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[0].i8);
    v94 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v84.i8), 0x18uLL)), v103.val[0]);
    v95 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v93, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v84), 0x18uLL)), v103.val[3]);
    v96 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v92.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)), v103.val[1]);
    v97 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v92, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)), v103.val[2]);
    v103.val[0] = veorq_s8(vandq_s8((int8x16_t)v94, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)v103.val & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v103.val[3] = veorq_s8(vandq_s8((int8x16_t)v95, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v103.val[3] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v103.val[1] = veorq_s8(vandq_s8((int8x16_t)v96, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v103.val[1] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    v103.val[2] = veorq_s8(vandq_s8((int8x16_t)v97, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v103.val[2] & __PAIR128__(0xFFFFFF06FFFFFF06, 0xFFFFFF06FFFFFF06)));
    a35 = vaddq_s32(vsubq_s32(v96, vaddq_s32((int32x4_t)v103.val[1], (int32x4_t)v103.val[1])), (int32x4_t)v47);
    a36 = vaddq_s32(vsubq_s32(v97, vaddq_s32((int32x4_t)v103.val[2], (int32x4_t)v103.val[2])), (int32x4_t)v47);
    a33 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v103.val[0], (int32x4_t)v103.val[0])), (int32x4_t)v47);
    a34 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v103.val[3], (int32x4_t)v103.val[3])), (int32x4_t)v47);
    v98 = (_DWORD *)&a33 + v39 + 1438604517;
    v99 = *((_DWORD *)&a33 + (v82 ^ 0x475u ^ (unint64_t)(v39 + 788)) + 1438604517) ^ *(v98 - 3);
    v100 = *(v98 - 16) ^ *(v98 - 14) ^ (v99 + v37 - ((2 * v99) & 0xC41E1BF2));
    HIDWORD(v101) = v100 ^ v37;
    LODWORD(v101) = v100;
    *v98 = (v101 >> 31) + v37 - ((2 * (v101 >> 31)) & 0xC41E1BF2);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v40 + 8 * ((1178 * (v41 == 1438604454)) ^ v82)) - 12))(v49);
  }
  else if (v56 == 1)
  {
    a25 = v44;
    v102 = vld4q_s8(v46);
    v57 = (uint8x16_t)veorq_s8(v102.val[0], (int8x16_t)v48);
    v58 = vmovl_high_u8(v57);
    v59 = (int8x16_t)vmovl_high_u16(v58);
    v60 = vmovl_u8(*(uint8x8_t *)v57.i8);
    v61 = (int8x16_t)vmovl_high_u16(v60);
    v62 = (uint8x16_t)veorq_s8(v102.val[1], (int8x16_t)v48);
    v63 = vmovl_u8(*(uint8x8_t *)v62.i8);
    v64 = vmovl_high_u8(v62);
    v65 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v60.i8));
    v66 = vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v61);
    v67 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v64.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v58.i8));
    v68 = vorrq_s8((int8x16_t)vshll_high_n_u16(v64, 8uLL), v59);
    v69 = (uint8x16_t)veorq_s8(v102.val[2], (int8x16_t)v48);
    _Q22 = (int8x16_t)vmovl_high_u8(v69);
    _Q21 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v69.i8);
    v72 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }
    v77 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }
    v102.val[0] = veorq_s8(v102.val[3], (int8x16_t)v48);
    v102.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v102.val[0].i8);
    v102.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v102.val[0]);
    v78 = (int32x4_t)vorrq_s8(vorrq_s8(v65, v72), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v102.val[1].i8), 0x18uLL));
    v102.val[1] = vorrq_s8(vorrq_s8(v66, _Q21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v102.val[1]), 0x18uLL));
    v79 = (int32x4_t)vorrq_s8(vorrq_s8(v67, v77), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v102.val[0].i8), 0x18uLL));
    v80 = (int32x4_t)vorrq_s8(vorrq_s8(v68, _Q22), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v102.val[0]), 0x18uLL));
    a35 = vaddq_s32(vsubq_s32(v79, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v79, v79), (int8x16_t)v51)), (int32x4_t)v47);
    a36 = vaddq_s32(vsubq_s32(v80, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v80, v80), (int8x16_t)v51)), (int32x4_t)v47);
    a33 = vaddq_s32(vsubq_s32(v78, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v78, v78), (int8x16_t)v51)), (int32x4_t)v47);
    a34 = vaddq_s32(vsubq_s32((int32x4_t)v102.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v102.val[1], (int32x4_t)v102.val[1]), (int8x16_t)v51)), (int32x4_t)v47);
    return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(v40 + 8
                                                                      * ((62 * (a27 + 1 != v41)) | (a3 + a4 + 129)))
                                                    - 12))(v49, v45);
  }
  else
  {
    *(_DWORD *)(v43 - 180) = (v53 ^ v42) + (a26 ^ v42) + v42 - (v38 & (2 * ((v53 ^ v42) + (a26 ^ v42))));
    *(_DWORD *)(v43 - 176) = 2 * (v52 ^ v42) + v42 - (v38 & (4 * (v52 ^ v42)));
    *(_DWORD *)(v43 - 172) = 2 * (v54 ^ v42) + v42 - (v38 & (4 * (v54 ^ v42)));
    *(_DWORD *)(v43 - 168) = 2 * (v55 ^ v42) + v42 - (v38 & (4 * (v55 ^ v42)));
    a31 = 0;
    return v44(v49, v45, v47, v48, v50, v51);
  }
}

uint64_t sub_1B98156D0(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,int a23,unsigned int a24)
{
  uint64_t v24;
  _BOOL4 v25;

  if (a24 < 0xBF7B13B9 != (a21 + 1538029256) < 0xBF7B13B9)
    v25 = (a21 + 1538029256) < 0xBF7B13B9;
  else
    v25 = a21 + 1538029256 > a24;
  return ((uint64_t (*)(void))(*(_QWORD *)(v24 + 8 * ((!v25 * (((a3 ^ (a3 + 160)) - 122) ^ 0x458)) ^ (a4 + a3 + 655)))
                            - 12))();
}

uint64_t sub_1B9815760(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v7
                                                               + 8
                                                               * ((1709
                                                                 * (((v6 + 1) ^ (a5 + v5 + 63 < (v5 - 633048600 + a3 + v6 - 352))) & 1)) ^ v6))
                                                   - 12))(a1, 1456643678);
}

uint64_t sub_1B98157C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * (((~a19
                                           + v19
                                           - (unint64_t)(v21 + (v20 ^ 0x3A ^ (a3 + 214))) < 0x10)
                                          * ((v20 ^ 0x3A) - 288)) ^ v20 ^ 0x3A))
                            - 12))();
}

uint64_t sub_1B981580C@<X0>(char a1@<W1>, int a2@<W3>, int a3@<W4>, char a4@<W6>, uint64_t a5@<X8>)
{
  int v5;
  int v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v7 + a5) = *(_BYTE *)(v10 + (v5 + a3))
                      - ((*(_BYTE *)(v10 + (v5 + a3)) << (((v6 + v8) & a1) - 87)) & a4)
                      + 50;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((a5 == 63) * v9) | (a2 + v6 + 276))) - 8))();
}

uint64_t sub_1B9815864(double a1, double a2, int8x16_t a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9;
  int8x16_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *v10 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v12 + (v9 + a9)), vandq_s8(vaddq_s8(*(int8x16_t *)(v12 + (v9 + a9)), *(int8x16_t *)(v12 + (v9 + a9))), a4)), a3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (v11 + 25)) - 8))();
}

uint64_t sub_1B98158CC@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W8>)
{
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t))(v4
                                            + 8
                                            * ((1030 * ((v3 - a1 + 443 + a3 - 1615192901) < 0x38)) ^ (a2 + v3 + 455))))(-1615192458);
}

uint64_t sub_1B9815910@<X0>(uint64_t a1@<X0>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = a1 + a2;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1858
                                * (((v2 + 44) ^ (v6 - v4 + 1615192458 < (((v2 + 99) | 0x61u) ^ 0x277uLL))) & 1)) ^ v2)))();
}

uint64_t sub_1B981598C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 252 + v3 + a1) = 0x3232323232323232;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8 * ((58 * (((7 * (v2 ^ 0x22Cu) - 589) & a2) != 8)) ^ (7 * (v2 ^ 0x22C))))
                            - ((7 * (v2 ^ 0x22C) - 147) | 9u)
                            + 439))();
}

uint64_t sub_1B98159F8(double a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(double *)(v3 + v6) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v4 != v6) * v5) ^ v1)) - v2 + 439))();
}

uint64_t sub_1B9815A20@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)(((((v3 - 805309644) & 0xF1ECFBF7 ^ 0xFFFFFF72) + (v3 ^ (a1 + 117))) * (a2 == v2)) ^ v3)))();
}

void sub_1B9815A6C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;

  v5 = *(unsigned __int8 *)(v4 - 156) ^ 0x5F;
  if (v5 == 1)
  {
    v10 = *(_DWORD *)(v4 - 188);
    v9 = *(_DWORD *)(v4 - 184);
    *(_BYTE *)(v4 - 196) = ((8 * v9) ^ 0xA0) + ((a3 + 22) & 0xB7 ^ 0x87) - ((2 * ((8 * v9) ^ 0xA0)) & 0x60);
    *(_BYTE *)(v4 - 195) = ((v9 >> 5) ^ 0xF2) - 2 * (((v9 >> 5) ^ 0xF2) & 0x36 ^ (v9 >> 5) & 4) + 50;
    *(_BYTE *)(v4 - 194) = ((v9 >> 13) ^ 0x8F) - ((2 * ((v9 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v4 - 193) = ((v9 >> 21) ^ 0x39) - ((2 * ((v9 >> 21) ^ 0x39)) & 0x64) + 50;
    HIDWORD(v11) = v10 ^ 0xA;
    LODWORD(v11) = v9 ^ 0x60000000;
    *(_BYTE *)(v4 - 192) = (v11 >> 29) - ((2 * (v11 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v4 - 191) = ((v10 >> 5) ^ 0xA) - 2 * (((v10 >> 5) ^ 0xA) & 0x37 ^ (v10 >> 5) & 5) + 50;
    *(_BYTE *)(v4 - 190) = ((v10 >> 13) ^ 0xA4) - ((2 * ((v10 >> 13) ^ 0xA4)) & 0x64) + 50;
    v8 = ((v10 >> 21) ^ 0xFFFFFFBE) - ((2 * ((v10 >> 21) ^ 0xFFFFFFBE)) & 0x64) + 50;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_6;
    v8 = *(_DWORD *)(v4 - 188);
    v6 = *(_DWORD *)(v4 - 184);
    *(_BYTE *)(v4 - 196) = ((v8 >> 21) ^ 0xBE)
                         + ~(2 * (((v8 >> 21) ^ 0xBE) & (a4 + a3 + 51) ^ ((v8 & 0x200000) != 0)))
                         + 51;
    *(_BYTE *)(v4 - 195) = ((v8 >> 13) ^ 0xA4) + (~(2 * ((v8 >> 13) ^ 0xA4)) | 0x9B) + 51;
    HIDWORD(v7) = v8 ^ 0xA;
    LODWORD(v7) = v6 ^ 0x60000000;
    *(_BYTE *)(v4 - 194) = ((v8 >> 5) ^ 0xA) - 2 * (((v8 >> 5) ^ 0xA) & 0x36 ^ (v8 >> 5) & 4) + 50;
    *(_BYTE *)(v4 - 193) = (v7 >> 29) - ((2 * (v7 >> 29)) & 0x64) + 50;
    *(_BYTE *)(v4 - 192) = ((v6 >> 21) ^ 0x39) - ((2 * ((v6 >> 21) ^ 0x39)) & 0x64) + 50;
    *(_BYTE *)(v4 - 191) = ((v6 >> 13) ^ 0x8F) - ((2 * ((v6 >> 13) ^ 0x8F)) & 0x64) + 50;
    *(_BYTE *)(v4 - 190) = ((v6 >> 5) ^ 0xF2) - ((2 * ((v6 >> 5) ^ 0xF2)) & 0x64) + 50;
    LOBYTE(v8) = ((8 * v6) ^ 0xA0) + (~(2 * ((8 * v6) ^ 0xA0)) | 0x9F) + 51;
  }
  *(_BYTE *)(v4 - 189) = v8;
LABEL_6:
  JUMPOUT(0x1B9814B38);
}

uint64_t sub_1B9815ED8@<X0>(char a1@<W3>, uint64_t a2@<X5>, int a3@<W8>)
{
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _BOOL4 v11;

  v8 = v5 + a3;
  v9 = *(_DWORD *)(v7 - 252 + ((v5 + a3) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a2 + v8 + 1) = (BYTE2(v9) ^ 0x3B) - ((2 * (BYTE2(v9) ^ 0x3B)) & 0x64) + 50;
  *(_BYTE *)(a2 + v8) = (HIBYTE(v9) ^ 0x51) - (((HIBYTE(v9) ^ 0x51) << ((v4 - a1 + 1) ^ 0xE6)) & 0x64) + 50;
  *(_BYTE *)(a2 + v8 + 3) = v9 ^ 0x47;
  *(_BYTE *)(a2 + v8 + 2) = (BYTE1(v9) ^ 0xA7) - ((2 * (BYTE1(v9) ^ 0xA7)) & 0x64) + 50;
  v10 = *(_DWORD *)(v7 - 160) - 2026446123;
  if (v5 - 1725448501 < v3 != v10 < v3)
    v11 = v10 < v3;
  else
    v11 = v5 - 1725448501 < v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((510 * !v11) ^ v4)) - 12))();
}

void sub_1B9816070()
{
  JUMPOUT(0x1B9816040);
}

uint64_t sub_1B9816078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  int v33;
  uint64_t v34;

  *(_DWORD *)(&a33 + a31) = 1037212390;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)(v34 + 8 * ((22 * (v33 ^ 0x350)) ^ 0x6BD)) - 8))(1398064151, 1037212390, a3, a4, a5, &a33 + a31, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           &a33 + a31 + 392);
}

uint64_t sub_1B981612C(int a1)
{
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((51 * (((v3 == a1) ^ (v1 + 33)) & 1)) ^ v1)) - 4))();
}

uint64_t sub_1B9816174(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  int v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  BOOL v37;

  v33 = v30 & 0xDDFDFEFF;
  v34 = v33 + 12;
  v35 = v33 - a3 + 242;
  v36 = a4 + v33 + 67;
  v37 = a30 - 176914108 < (v32 - 1020078970);
  if ((a30 - 176914108) < 0xB206BC1 != (v32 - 1020078970) < 0xB206BC1)
    v37 = (v32 - 1020078970) < 0xB206BC1;
  return (*(uint64_t (**)(void))(v31 + 8 * ((((v34 ^ v37) & 1) * (v35 ^ 0x29)) ^ v36)))();
}

uint64_t sub_1B98163D4()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((*(_DWORD *)(v1 + 48 * (v4 + v2) + 36) == v4) ^ ((v0 & 0xBF) - 30)) & 1)
                                          * (((v0 & 0x6937FBBF) + 63) ^ 0x80)) ^ v0 & 0x6937FBBF))
                            - 12))();
}

uint64_t sub_1B981642C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v34;

  v31 = v27 - a4 - 242;
  v32 = 628203409 * ((((v30 - 152) | 0x36F0807) - ((v30 - 152) & 0x36F0807)) ^ 0x81E70434);
  *(_DWORD *)(v30 - 136) = v27 - v32 + 1552;
  *(_DWORD *)(v30 - 132) = v29 - v32 + 77623025;
  *(_QWORD *)(v30 - 128) = a14;
  *(_QWORD *)(v30 - 112) = v26;
  *(_QWORD *)(v30 - 104) = a12;
  *(_QWORD *)(v30 - 152) = a13;
  *(_QWORD *)(v30 - 144) = a11;
  v34 = v25;
  ((void (*)(uint64_t))*(&off_1E709D0C0 + v27 - 85))(v30 - 152);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 + 8 * ((356 * (*(_DWORD *)(v30 - 120) == (v31 ^ 0xA3E3FA51) + (v27 ^ 0x3B1))) ^ v27))
                                                                                       - 8))(1398064151, 1037212390, 3253530855, 1041436441, v34, a25);
}

uint64_t sub_1B9816528(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (((*(_DWORD *)(a5 + 48 * (v8 + v5)) != 617625952)
                                * (((a3 + v6 - 835) ^ (a3 - 51)) - 51)) | v6)))();
}

uint64_t sub_1B9816574@<X0>(int a1@<W3>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((199
                                          * (((((v2 - 1058217968) | 0x1001084) - 2098010104) ^ a2) != v3 - 634403168)) ^ v2))
                            + 3253530843
                            - (v2 - a1 - 83)))();
}

void sub_1B98165E4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1B981666C@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26,int a27,int a28)
{
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;

  *(_DWORD *)(a2 + 392) = a3;
  *(_DWORD *)(a2 + 396) = a28;
  *(_QWORD *)(a2 + 400) = a23;
  *(_DWORD *)(a2 + 408) = a25 - v32 + 1642836220;
  *(_QWORD *)(a2 + 416) = v29 + (v32 - 363588221);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48 * v28 + 8))(a12, a19);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33
                                                                       + 8
                                                                       * ((270
                                                                         * (v35
                                                                          + v30
                                                                          - (((v31 + 510469503) & 0xE192D4B6 ^ (v34 - 140)) & (2 * v35)) == v30)) ^ v31)))(1398064151, 1037212390, 3253530855, 1041436441);
}

uint64_t sub_1B9816738()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((39
                                          * ((*(_DWORD *)(v1 + 48 * v0 + 36) + 749419496) < 0x80000003)) ^ v2))
                            - (((v2 - 2124111890) | 0x40885065u) ^ 0xC1ECF0EBLL)))();
}

uint64_t sub_1B98167AC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, _DWORD *a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((598 * (*a6 - 1037212390 < a4 + ((v6 + 30) ^ (a3 - 146)) + 16)) ^ v6))
                            - (((v6 + 30) | 0x40u) ^ 0xFELL)))();
}

uint64_t sub_1B9816804@<X0>(int a1@<W2>, uint64_t a2@<X4>, _DWORD *a3@<X5>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26)
{
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _DWORD *v33;

  v33 = &a3[6 * v27];
  v33[2] = v32;
  v33[3] = v28;
  *((_QWORD *)v33 + 2) = v30;
  v33[6] = a26;
  *a3 = v26 + 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v31
                                        + 8
                                        * (((*(_DWORD *)(a2 + 48 * v29 + 32) + 749419496 < ((a4 + 1033) ^ 0x800004F8))
                                          * ((a1 + a4 - 242) ^ (a1 + 719))) ^ a4))
                            - 8))();
}

uint64_t sub_1B9816880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v21;
  int v22;
  uint64_t v23;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8 * (((v22 + 74 * (v21 ^ 0x4F9) == 1645153933) * (((74 * (v21 ^ 0x4F9)) ^ 0x66) + 1545)) ^ (74 * (v21 ^ 0x4F9)))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1B98168E0(int a1, int a2, int a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  int v27;
  uint64_t v28;
  int v29;
  _BOOL4 v31;

  v31 = v29 != a1 || *a6 != a2 + (v27 ^ a27) - a3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v28 + 8 * ((1725 * v31) ^ v27)) - 8))();
}

void sub_1B9816928()
{
  JUMPOUT(0x1B9816960);
}

uint64_t sub_1B98169AC(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 47;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B98169CC(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 1951 - 1759421093 * ((&v2 + 137599165 - 2 * (&v2 & 0x83398BD)) ^ 0xBB4E28E9);
  v2 = a1;
  sub_1B9813D28((uint64_t)&v2);
  return v4;
}

uint64_t sub_1B9816A60(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v1 = 1374699841 * ((result - 2 * (result & 0xA8F7ECC532399345) - 0x5708133ACDC66CBBLL) ^ 0xA6FB72C95FCD8B4CLL);
  v2 = *(_QWORD *)(result + 16) ^ v1;
  v3 = *(_QWORD *)(result + 8) - v1;
  v4 = v2 >= v3;
  v5 = (uint64_t)v2 < (uint64_t)v3;
  v6 = !v4;
  if (((*(_DWORD *)(result + 24) + 1374699841 * (((_DWORD)result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) & 1) == 0)
    v5 = v6;
  v7 = !v5;
  v8 = 32;
  if (!v7)
    v8 = 28;
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 40) ^ (1374699841
                                                       * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) ^ *(_DWORD *)(result + v8) ^ (1374699841 * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C));
  return result;
}

uint64_t sub_1B9816AF0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 24);
  return 0;
}

void sub_1B9816B08(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (3804331 * ((&v1 & 0xB40B85C6 | ~(&v1 | 0xB40B85C6)) ^ 0x35215FCF)) ^ 0x122;
  sub_1B97F31B8((uint64_t)&v1);
}

void sub_1B9816B9C(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = 1755732067 * (((&v1 | 0xF9EE60DF) + (~&v1 | 0x6119F20)) ^ 0x2728DD05) + 933;
  sub_1B9814154((uint64_t)&v1);
}

uint64_t sub_1B9816C2C(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;

  v1 = 1178560073 * ((2 * (result & 0x64AC438940A5398ALL) - result + 0x1B53BC76BF5AC675) ^ 0xAFEC9E05CEBE17);
  v2 = *(_QWORD *)(result + 16) - v1;
  v3 = *(_QWORD *)(result + 40) + v1;
  v4 = v3 >= v2;
  v5 = v3 != v2;
  v6 = v4;
  if (((*(_DWORD *)(result + 28) ^ (1178560073 * ((2 * (result & 0x40A5398A) - (_DWORD)result - 1084569995) ^ 0x5CEBE17))) & 1) != 0)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7 == 0;
  v9 = 4;
  if (!v8)
    v9 = 24;
  *(_DWORD *)result = (*(_DWORD *)(result + v9)
                     - 1178560073 * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17)) ^ (*(_DWORD *)(result + 8) - 1178560073 * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17));
  return result;
}

uint64_t sub_1B9816CD4(int *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  v2 = a1[1] - 108757529 * (a1 ^ 0xE09C622B);
  result = ((uint64_t (*)(char *, _QWORD))*(&off_1E709D0C0 + (int)(v2 - 1695027228)))((char *)*(&off_1E709D0C0 + (int)(v2 - 1695027372)) - 12, *(&off_1E709D0C0 + (int)(v2 ^ 0x6508107F)));
  v4 = *(_DWORD *)*(&off_1E709D0C0 + (int)(v2 ^ 0x650810DA));
  if ((_DWORD)result)
    v4 = -1645193401;
  *a1 = v4;
  return result;
}

uint64_t sub_1B9816D70(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;

  v1 = 235795823 * ((~result & 0x2A1D36B9A93A3D3 | result & 0xFD5E2C94656C5C2CLL) ^ 0xA1169950E3EEA8ALL);
  v2 = *(_QWORD *)(result + 16);
  v3 = v2 ^ v1;
  v4 = *(_QWORD *)result == v2;
  v5 = (*(_QWORD *)result ^ v1) > v3;
  if (((*(_DWORD *)(result + 8) + (_DWORD)v1) & 1) != 0)
    v6 = v5;
  else
    v6 = v4;
  v7 = !v6;
  v8 = 28;
  if (!v7)
    v8 = 32;
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 12) ^ v1 ^ (*(_DWORD *)(result + v8) - v1);
  return result;
}

_BYTE *sub_1B9816E08(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_1B9816E98 + 4 * byte_1B981F857[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_1B9816EFC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = 628203409 * (((a1 | 0xBB8CAEEC) - (a1 & 0xBB8CAEEC)) ^ 0x3904A2DF);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 20) + v2;
  v7 = *(_DWORD *)a1 + 2024873124 + v2;
  v8 = 235795823
     * (((&v10 | 0xDE5284D5) - &v10 + (&v10 & 0x21AD7B28)) ^ 0x4AFFCD8C);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = v4;
  v16 = v3;
  v11 = v8 + (v6 ^ 0x1C576372) + 2142240416 + ((2 * v6) & 0xBEFD8FFE ^ 0x8651091A);
  v10 = v5;
  v15 = v8 ^ (v7 + 1820);
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_1E709D0C0 + v7) - 4))(&v10);
  *(_DWORD *)(a1 + 40) = v14;
  return result;
}

uint64_t sub_1B9817058(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B9817074(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B981708C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B98170A4(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = 460628867 * (((a1 | 0x167EA26) - a1 + (a1 & 0xFE9815D9)) ^ 0x4DF1685B);
  v3 = *(_DWORD *)(a1 + 20) - v2;
  v5 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v6 = *(_DWORD *)(a1 + 16) - v2 - ((2 * (*(_DWORD *)(a1 + 16) - v2) + 50606586) & 0x52C224C2) - 1427952802;
  v7 = -400126375 * (*(_DWORD *)(a1 + 24) + v2) - 1847956774;
  v8 = 1755732067
     * (((&v10 | 0x8E52AAAD) - &v10 + (&v10 & 0x71AD5550)) ^ 0x50941776);
  v10 = (v7 ^ 0xFFDDE664) + v8 + ((2 * v7) & 0xFFBBCCC8) + 1370734048;
  v12 = v8 ^ (v3 - 2138962107);
  v13 = v4;
  v14 = v6 ^ v8;
  v11 = v5;
  result = ((uint64_t (*)(unsigned int *))((char *)*(&off_1E709D0C0 + (v3 ^ 0x7F7DFD65)) - 8))(&v10);
  *(_DWORD *)(a1 + 28) = v15;
  return result;
}

void sub_1B981723C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = qword_1EF22FD80 ^ (unint64_t)&v1 ^ qword_1EF22FD70;
  qword_1EF22FD80 = 536075833 * v0 + 0x3076D37E12EEFF1CLL;
  qword_1EF22FD70 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  v3 = 1951 - 1759421093 * ((2 * (&v2 & 0x1AB9A500) - &v2 + 1699109631) ^ 0xD63BEAAB);
  v2 = (uint64_t)*(&off_1E709D0C0
                + ((57 * (qword_1EF22FD80 ^ 0xFC ^ qword_1EF22FD70)) ^ byte_1B9826F00[byte_1B9822EB0[(57 * (qword_1EF22FD80 ^ 0xFC ^ qword_1EF22FD70))] ^ 0xF9])
                - 15);
  sub_1B9813D28((uint64_t)&v2);
}

uint64_t sub_1B9817364(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;

  v1 = 1755732067 * ((2 * (result & 0x155053FA18C8728CLL) - result + 0x6AAFAC05E7378D73) ^ 0xB7040B3A39F130A8);
  v2 = *(_QWORD *)(result + 16) ^ v1;
  v3 = *(_QWORD *)(result + 8) - v1;
  v4 = v3 > v2;
  v5 = v3 == v2;
  v6 = v4;
  if (((*(_DWORD *)(result + 32) - 1755732067 * ((2 * (result & 0x18C8728C) - (_DWORD)result - 415789709) ^ 0x39F130A8)) & 1) != 0)
    v7 = v6;
  else
    v7 = v5;
  if (v7)
    v8 = *(_DWORD *)(result + 24) + 1755732067 * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8);
  else
    v8 = *(_DWORD *)(result + 28) - 1755732067 * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8);
  *(_DWORD *)result = *(_DWORD *)(result + 4) ^ (1755732067
                                               * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8)) ^ v8;
  return result;
}

uint64_t sub_1B9817404(char a1, unsigned int a2)
{
  return byte_1B9822DB0[(byte_1B981F550[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B9817430(char a1, unsigned int a2)
{
  return byte_1B981F650[(byte_1B982B9F0[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B981745C(char a1, unsigned int a2)
{
  return byte_1B982BAF0[(byte_1B9826E00[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B9817488(char a1, unsigned int a2)
{
  return byte_1B9826F00[(byte_1B9822EB0[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B98174B4(char a1, unsigned int a2)
{
  return byte_1B9822FB0[(byte_1B981F750[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B98174E0(unsigned int a1)
{
  return byte_1B982BAF0[byte_1B9826E00[a1] ^ 0xB6] ^ a1;
}

uint64_t sub_1B981750C(unsigned int a1)
{
  return byte_1B981F650[byte_1B982B9F0[a1] ^ 0x1B] ^ a1;
}

uint64_t sub_1B9817538(unsigned int a1)
{
  return byte_1B982BAF0[byte_1B9826E00[a1] ^ 0x53] ^ a1;
}

uint64_t sub_1B9817564(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 ^ (235795823 * ((2 * (a1 & 0x5AD4AFC8) - a1 + 623595575) ^ 0xB186196E));
  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v5 = v1
     + 1225351577
     * ((2 * ((&v5 ^ 0x618AC2C7) & 0x400DFC4D) - (&v5 ^ 0x618AC2C7) - 1074658382) ^ 0xFDE21963)
     + 1882357917;
  v6 = v2;
  v7 = v3;
  return ((uint64_t (*)(unsigned int *))*(&off_1E709D0C0 + (int)(v1 ^ 0x8FCD81B4)))(&v5);
}

uint64_t sub_1B9817668(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = 1374699841 * (a1 ^ 0x6DF41809);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)a1;
  v7 = 1224239923 * ((((2 * &v10) | 0x912C61DA) - &v10 + 929681171) ^ 0x3A25CD3A);
  v8 = (*(_DWORD *)(a1 + 8) ^ v2) - 368400168;
  v11 = v2 + *(_DWORD *)(a1 + 56) - v7 - 707766453;
  v16 = v8 + v7 + 869;
  v13 = v3;
  v14 = v5;
  v10 = v6;
  v12 = v4;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_1E709D0C0 + v8) - 4))(&v10);
  *(_DWORD *)(a1 + 24) = v15;
  return result;
}

void sub_1B9817780()
{
  unint64_t v0;
  unsigned int v1;
  _BYTE v2[8];
  char *v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = (unint64_t)&v2[qword_1EF22FD70 ^ qword_1EF22F1A8];
  qword_1EF22F1A8 = 536075833 * v0 - 0x793AB71194CDC804;
  qword_1EF22FD70 = 536075833 * (v0 ^ 0x86C548EE6B3237FCLL);
  v3 = (char *)*(&off_1E709D0C0
               + ((57 * ((qword_1EF22FD70 - qword_1EF22F1A8) ^ 0xFC)) ^ byte_1B9822FB0[byte_1B981F750[(57 * ((qword_1EF22FD70 - qword_1EF22F1A8) ^ 0xFC))] ^ 0xCD])
               - 59);
  v4 = 1951 - 1759421093 * (((&v3 | 0x62E542B1) - (&v3 & 0x62E542B1)) ^ 0xD198F2E5);
  sub_1B9813D28((uint64_t)&v3);
  v4 = 1951 - 1759421093 * ((((2 * &v3) | 0xD19EEED6) - &v3 - 1758426987) ^ 0xDBB2C73F);
  v3 = (char *)*(&off_1E709D0C0
               + ((57 * (qword_1EF22F1A8 ^ 0xFC ^ qword_1EF22FD70)) ^ byte_1B982BAF0[byte_1B9826E00[(57 * (qword_1EF22F1A8 ^ 0xFC ^ qword_1EF22FD70))] ^ 0x15])
               + 80)
     - 4;
  sub_1B9813D28((uint64_t)&v3);
  v1 = 1225351577
     * (((&v3 ^ 0x9D172845 | 0xE551A89D)
       - (&v3 ^ 0x9D172845)
       + ((&v3 ^ 0x9D172845) & 0x1AAE5760)) ^ 0x5BDC58CE);
  LODWORD(v3) = v1 + 336;
  BYTE4(v3) = v1 ^ 0x7D;
  sub_1B97DFEE0((uint64_t)&v3);
}

void sub_1B98179A8(_DWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)*(&off_1E709D0C0
                  + (int)((*a1 ^ (535753261
                                * ((1711628207 - (a1 | 0x66055FAF) + (a1 | 0x99FAA050)) ^ 0x930EAE7F)))
                        - 426523007));
  v3 = (3804331 * (&v2 ^ 0x7ED525F6)) ^ ((*a1 ^ (535753261
                                                             * ((1711628207
                                                               - (a1 | 0x66055FAF)
                                                               + (a1 | 0x99FAA050)) ^ 0x930EAE7F)))
                                                     - 426522727);
  v2 = v1;
  sub_1B97F31B8((uint64_t)&v2);
}

uint64_t sub_1B9817A84(char a1, unsigned int a2)
{
  return byte_1B9822CB0[(byte_1B981F450[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B9817AB0(unsigned int a1)
{
  return byte_1B9822CB0[byte_1B981F450[a1] ^ 0x85] ^ a1;
}

uint64_t sub_1B9817ADC(unsigned int a1)
{
  return byte_1B9822DB0[byte_1B981F550[a1] ^ 0xF7] ^ a1;
}

uint64_t sub_1B9817B08(unsigned int a1)
{
  return byte_1B981F650[byte_1B982B9F0[a1] ^ 0x5E] ^ a1;
}

uint64_t sub_1B9817B34(unsigned int a1)
{
  return byte_1B982BAF0[byte_1B9826E00[a1] ^ 0x15] ^ a1;
}

uint64_t sub_1B9817B60(unsigned int a1)
{
  return byte_1B9826F00[byte_1B9822EB0[a1] ^ 0x84] ^ a1;
}

uint64_t sub_1B9817B8C(unsigned int a1)
{
  return byte_1B9822FB0[byte_1B981F750[a1] ^ 0xCD] ^ a1;
}

uint64_t sub_1B9817BB8(unsigned int a1)
{
  return byte_1B9822DB0[byte_1B981F550[a1] ^ 0xCC] ^ a1;
}

uint64_t sub_1B9817BE4(unsigned int a1)
{
  return byte_1B9826F00[byte_1B9822EB0[a1] ^ 0xF9] ^ a1;
}

void flatbuffers::FlatBufferBuilder::GetBufferPointer()
{
  __assert_rtn("Finished", "flatbuffers.h", 1226, "finished");
}

{
  __assert_rtn("data", "flatbuffers.h", 933, "cur_");
}

void flatbuffers::Allocator::reallocate_downward()
{
  __assert_rtn("reallocate_downward", "flatbuffers.h", 604, "new_size > old_size");
}

void flatbuffers::FlatBufferBuilder::NotNested()
{
  __assert_rtn("NotNested", "flatbuffers.h", 1336, "!num_field_loc");
}

{
  __assert_rtn("NotNested", "flatbuffers.h", 1334, "!nested");
}

void flatbuffers::FlatBufferBuilder::EndTable()
{
  __assert_rtn("EndTable", "flatbuffers.h", 1352, "nested");
}

{
  __assert_rtn("EndTable", "flatbuffers.h", 1367, "table_object_size < 0x10000");
}

{
  __assert_rtn("scratch_end", "flatbuffers.h", 943, "scratch_");
}

{
  __assert_rtn("scratch_data", "flatbuffers.h", 938, "buf_");
}

{
  __assert_rtn("EndTable", "flatbuffers.h", 1378, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
}

void flatbuffers::vector_downward::ensure_space()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 905, "cur_ >= scratch_ && scratch_ >= buf_");
}

{
  __assert_rtn("ensure_space", "flatbuffers.h", 909, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void flatbuffers::FlatBufferBuilder::ReferTo()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1321, "off && off <= GetSize()");
}

void flatbuffers::FlatBufferBuilder::EndVector()
{
  __assert_rtn("EndVector", "flatbuffers.h", 1562, "nested");
}

void flatbuffers::FlatBufferBuilder::Finish()
{
  __assert_rtn("Finish", "flatbuffers.h", 2010, "strlen(file_identifier) == kFileIdentifierLength");
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x1E0C99668](stream, q);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLRequestSetAllowedProtocolTypes()
{
  return MEMORY[0x1E0C92F60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E7097A10();
}

void operator delete(void *__p)
{
  off_1E7097A18(__p);
}

uint64_t operator delete()
{
  return off_1E7097A20();
}

uint64_t operator new[]()
{
  return off_1E7097A28();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7097A30(__sz);
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

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

