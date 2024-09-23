void sub_243A9B104(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243A9B230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_243A9B5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;
  uint64_t i;

  for (i = 56; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

uint64_t ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  id v6[2];

  CFRetain(cf);
  v6[0] = &unk_251440768;
  v6[1] = (id)cf;
  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *))(*(_QWORD *)v4 + 48))(v4, v6);
  clpc::user::ioreport::Sample::~Sample(v6);
  return 0;
}

void sub_243A9B734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Sample::~Sample(&a9);
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::Sample::~Sample(id *this)
{

}

{

}

{

  JUMPOUT(0x2494FF52CLL);
}

void sub_243A9BE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  void *v9;

  clpc::user::ioreport::Sample::~Sample(&a9);
  _Unwind_Resume(a1);
}

void sub_243A9BFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
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
    v5 = (v2.i32[0] - 1) & v3;
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

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
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

void sub_243A9C2E8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_243A9C3A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243A9C450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243A9C58C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

clpc::user::iokit::CLPC *clpc::user::iokit::CLPC::CLPC(clpc::user::iokit::CLPC *this)
{
  io_connect_t *v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  uint64_t v5;
  io_service_t v6;
  void *exception;
  _QWORD v9[2];

  *((_DWORD *)this + 3) = 0;
  v2 = (io_connect_t *)((char *)this + 12);
  *((_DWORD *)this + 2) = 0;
  *(_QWORD *)this = &off_251440680;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v3 = IOServiceMatching("AppleCLPC");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v3);
  if (!MatchingService)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2494FF4D8](exception, "Could not get service.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v9[0] = &off_251440660;
  v9[1] = 0;
  *((_DWORD *)this + 2) = MatchingService;
  clpc::user::iokit::Service::~Service((clpc::user::iokit::Service *)v9);
  if (*((_QWORD *)this + 3) != 0x400000)
  {
    v5 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = 0;
    *((_QWORD *)this + 3) = 0x400000;
    if (v5)
      MEMORY[0x2494FF514](v5, 0x1000C8077774924);
  }
  v6 = *((_DWORD *)this + 2);
  if (v6 && !*v2)
    IOServiceOpen(v6, *MEMORY[0x24BDAEC58], 0, v2);
  return this;
}

void sub_243A9C6C0(_Unwind_Exception *a1)
{
  clpc::user::iokit::Service *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *v2 = 0;
  if (v4)
    MEMORY[0x2494FF514](v4, 0x1000C8077774924);
  clpc::user::iokit::Service::~Service(v1);
  _Unwind_Resume(a1);
}

void clpc::user::iokit::Service::~Service(clpc::user::iokit::Service *this)
{
  io_connect_t v2;

  *(_QWORD *)this = &off_251440660;
  v2 = *((_DWORD *)this + 3);
  if (v2)
    IOServiceClose(v2);
  *((_DWORD *)this + 3) = 0;
  clpc::user::iokit::Object::~Object(this);
}

{
  clpc::user::iokit::Service::~Service(this);
  JUMPOUT(0x2494FF52CLL);
}

void clpc::user::iokit::Object::~Object(clpc::user::iokit::Object *this)
{
  int v1;

  *(_QWORD *)this = &off_251440640;
  v1 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = 0;
  if (v1)
    IOObjectRelease(0);
}

{
  clpc::user::iokit::Object::~Object(this);
  JUMPOUT(0x2494FF52CLL);
}

void sub_243A9C894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void clpc::user::iokit::CLPC::~CLPC(clpc::user::iokit::CLPC *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_251440680;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    MEMORY[0x2494FF514](v2, 0x1000C8077774924);
  clpc::user::iokit::Service::~Service(this);
}

{
  clpc::user::iokit::CLPC::~CLPC(this);
  JUMPOUT(0x2494FF52CLL);
}

void sub_243A9CAE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243A9CC2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243A9CCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_243A9CEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_243A9CFC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243A9D51C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void clpc::user::iokit::RegistryEntry::~RegistryEntry(clpc::user::iokit::RegistryEntry *this)
{
  clpc::user::iokit::Object::~Object(this);
  JUMPOUT(0x2494FF52CLL);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void clpc::user::ioreport::Channel::~Channel(id *this)
{

}

{

}

{

  JUMPOUT(0x2494FF52CLL);
}

void clpc::user::ioreport::Subscription::~Subscription(clpc::user::ioreport::Subscription *this)
{
  const void *v2;

  *(_QWORD *)this = &off_2514406A0;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);

}

{
  clpc::user::ioreport::Subscription::~Subscription(this);
  JUMPOUT(0x2494FF52CLL);
}

void clpc::user::ioreport::ChannelList::withAllChannels(uint64_t a1@<X8>)
{
  void *v2;
  char v3;

  v2 = (void *)IOReportCopyAllChannels();
  if (v2)
  {
    *(_QWORD *)a1 = v2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 8) = v3;

}

void clpc::user::ioreport::ChannelList::fromCategories(uint64_t a1@<X8>)
{
  void *v2;
  char v3;

  v2 = (void *)IOReportCopyChannelsInCategories();
  if (v2)
  {
    *(_QWORD *)a1 = v2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 8) = v3;

}

void clpc::user::ioreport::ChannelList::fromFormat(uint64_t a1@<X8>)
{
  void *v2;
  char v3;

  v2 = (void *)IOReportCopyChannelsOfFormat();
  if (v2)
  {
    *(_QWORD *)a1 = v2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 8) = v3;

}

void clpc::user::ioreport::ChannelList::fromGroup(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v4;
  void *v6;
  id v7;

  v4 = a1;
  if (*((char *)a1 + 23) < 0)
    v4 = (uint64_t *)*a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (*((char *)a2 + 23) < 0)
    a2 = (uint64_t *)*a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  clpc::user::ioreport::ChannelList::fromGroup(v7, v6, a3);

}

void sub_243A9DA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromGroup(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a1;
  v6 = a2;
  v7 = (void *)IOReportCopyChannelsInGroup();
  if (v7)
  {
    *(_QWORD *)a3 = v7;
    v8 = 1;
  }
  else
  {
    v8 = 0;
    *(_BYTE *)a3 = 0;
  }
  *(_BYTE *)(a3 + 8) = v8;

}

void sub_243A9DB2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromProvider(uint64_t a1@<X8>)
{
  void *v2;
  char v3;

  v2 = (void *)IOReportCopyChannelsForDriver();
  if (v2)
  {
    *(_QWORD *)a1 = v2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
    *(_BYTE *)a1 = 0;
  }
  *(_BYTE *)(a1 + 8) = v3;

}

void `anonymous namespace'::populate_error_unsupported_stat(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported stat ID %llu."), a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDD0BA0];
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870206, v4);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_243A9DD5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::populate_error_unsupported_schema(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported schema ID %lu."), a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDD0BA0];
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870206, v4);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_243A9DFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243A9E118(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void sub_243A9E384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_243A9E4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100](uint64_t a1, id *a2)
{
  uint64_t i;

  for (i = 0; i != 64; i += 8)
    objc_storeStrong((id *)(a1 + i), *a2);
}

void sub_243A9E6E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_243A9E7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_243A9E9E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_243A9F2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,char a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,char *a38,char a39)
{
  void *v39;
  char *v40;
  char *v42;
  uint64_t v43;

  v42 = a38;
  if (a38 == v40)
  {
    v43 = 4;
    v42 = &a35;
  }
  else
  {
    if (!a38)
      goto LABEL_6;
    v43 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v42 + 8 * v43))();
LABEL_6:
  if (a23)

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a25);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a39);

  _Unwind_Resume(a1);
}

CFTypeRef clpc::user::iokit::RegistryEntry::createProperty(clpc::user::iokit::RegistryEntry *this, const __CFString *a2)
{
  return (id)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 2), a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

void `anonymous namespace'::populate_error_property_read(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *MEMORY[0x24BDD0BA0];
    v4[0] = CFSTR("Failed to read AppleCLPC property.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870199, v2);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_243A9F4D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::populate_error_internal(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *MEMORY[0x24BDD0BA0];
    v4[0] = CFSTR("An internal error occurred.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLPCErrorDomain"), -536870199, v2);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_243A9F5AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243A9F6F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t clpc::user::ioreport::ChannelList::iterate(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  _BYTE v5[24];
  _BYTE *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = v5;
  std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]((uint64_t)v5, a2);
  result = IOReportIterate();
  if (v6 == v5)
  {
    v4 = 4;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
    v2 = v6;
  }
  return (*(uint64_t (**)(_QWORD *))(*v2 + 8 * v4))(v2);
}

void sub_243A9F7D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  _QWORD *v17;
  uint64_t v19;

  if (a17 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
    v17 = a17;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_243A9FFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);

  if (*(_BYTE *)(v10 - 144))
    clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)(v10 - 168));

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va1);

  _Unwind_Resume(a1);
}

void std::vector<CLPCReportingStatID>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_243AA01FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_243AA03B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_243AA04D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList7iterateENSt3__18functionIFvNS1_7ChannelEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  id v6[2];

  CFRetain(cf);
  v6[0] = &unk_251440738;
  v6[1] = (id)cf;
  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *))(*(_QWORD *)v4 + 48))(v4, v6);
  clpc::user::ioreport::Channel::~Channel(v6);
  return 0;
}

void sub_243AA0758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Channel::~Channel(&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x2494FF52CLL);
}

uint64_t std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  uint64_t v5;
  id v7[2];

  CFRetain(cf);
  v7[0] = &unk_251440738;
  v7[1] = (id)cf;
  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
    std::__throw_bad_function_call[abi:ne180100]();
  if ((*(unsigned int (**)(uint64_t, id *))(*(_QWORD *)v4 + 48))(v4, v7))
    v5 = 0;
  else
    v5 = 16;
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

void sub_243AA08E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Channel::~Channel(&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251440458, MEMORY[0x24BEDAAF0]);
}

void sub_243AA0988(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_243AA0B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  clpc::user::ioreport::Sample::~Sample((id *)va);
  _Unwind_Resume(a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t __copy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(uint64_t a1)
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

_QWORD *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
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
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
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
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
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
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
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
  return i;
}

void sub_243AA0EB4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = (_QWORD *)v8;
    }
    else
    {
      do
      {
        *(_DWORD *)(v8 + 16) = *(_DWORD *)v4;
        *(_QWORD *)(v8 + 24) = *(_QWORD *)(v4 + 8);
        v10 = *(_QWORD **)v8;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique(a1, v8);
        v4 += 16;
        if (v10)
          v11 = v4 == a3;
        else
          v11 = 1;
        v8 = (uint64_t)v10;
      }
      while (!v11);
    }
    if (v10)
    {
      do
      {
        v12 = (_QWORD *)*v10;
        operator delete(v10);
        v10 = v12;
      }
      while (v12);
    }
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>((uint64_t)a1, (unsigned int *)v4, (_OWORD *)v4);
    v4 += 16;
  }
}

void sub_243AA11D8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_243AA11F8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v4;
  _DWORD *v5;
  uint64_t *v6;

  v2 = (_QWORD *)a2;
  v5 = (_DWORD *)(a2 + 16);
  v4 = *(unsigned int *)(a2 + 16);
  *((_QWORD *)v5 - 1) = v4;
  v6 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *i;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  _BOOL8 v12;
  size_t v13;
  unint64_t v14;
  size_t v15;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
      v5 = v3 <= a2 ? a2 % v3 : a2;
    else
      v5 = (v3 - 1) & a2;
    v6 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = *v6; i; i = (uint64_t *)*i)
      {
        v8 = i[1];
        if (v8 == a2)
        {
          if (*((_DWORD *)i + 4) == *a3)
            return i;
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3)
              v8 %= v3;
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5)
            break;
        }
      }
    }
  }
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    v11 = 2 * v3;
    v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    v13 = v12 | v11;
    v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14)
      v15 = v14;
    else
      v15 = v13;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v15);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>(uint64_t a1, unsigned int *a2, _OWORD *a3)
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
      v3 = ((_DWORD)v7 - 1) & v6;
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
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_OWORD *)v10 + 1) = *a3;
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
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
      v3 = ((_DWORD)v7 - 1) & v6;
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

void sub_243AA1634(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
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
      v4 = ((_DWORD)v8 - 1) & v7;
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
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
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
      v4 = ((_DWORD)v8 - 1) & v7;
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

void sub_243AA1858(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
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
      v4 = ((_DWORD)v8 - 1) & v7;
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
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
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
      v4 = ((_DWORD)v8 - 1) & v7;
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

void sub_243AA1A78(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *inserted;
  uint64_t *v12;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v12 = (uint64_t *)*v8;
      operator delete(v8);
      v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>(a1, (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_243AA1B68(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_243AA1B88(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD *)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = *(_QWORD *)v16;
    if (!v16)
      break;
    v19 = *(_QWORD *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      v20 = *(_QWORD *)(v16 + 8);
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

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
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  uint64_t *i;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;

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
    v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
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
      for (i = *v7; *v7; i = *v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = (uint64_t **)i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (uint64_t *)*v13;
            }
            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = (uint64_t **)i;
            v8 = v12;
          }
        }
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

unsigned int *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>(_QWORD *a1, _OWORD *a2)
{
  unsigned int *v4;
  unint64_t v5;
  _QWORD *inserted;

  v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  v5 = v4[4];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = v5;
  inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_243AA2088(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *inserted;
  uint64_t *v12;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      *((_DWORD *)v8 + 5) = *((_DWORD *)a2 + 5);
      v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v12 = (uint64_t *)*v8;
      operator delete(v8);
      v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>(a1, a2 + 2);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_243AA2178(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_243AA2198(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *inserted;

  v4 = operator new(0x18uLL);
  v5 = *a2;
  v4[2] = *a2;
  *v4 = 0;
  v4[1] = v5;
  inserted = (_QWORD *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v5, (_DWORD *)v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_243AA2210(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_243AA232C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Channel::~Channel(&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(_QWORD *a1, unint64_t *a2)
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
      if (v3 == v8)
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

_QWORD *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>(uint64_t a1, unsigned int *a2, _DWORD *a3)
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
      v3 = ((_DWORD)v7 - 1) & v6;
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
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
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
      v3 = ((_DWORD)v7 - 1) & v6;
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

void sub_243AA2644(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_243AA2740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  clpc::user::ioreport::Channel::~Channel((id *)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_243AA2D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a5);

  clpc::user::ioreport::Sample::~Sample((id *)va);
  _Unwind_Resume(a1);
}

void sub_243AA2FD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA3194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA32E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA34A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA35F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA37BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA3908(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA3AD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA3C1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA3DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA3F30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_243AA40F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_243AA4258(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x24BDAC1C0]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x24BDAC1C8]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x24BDAC1D0]();
}

uint64_t CCDigestReset()
{
  return MEMORY[0x24BDAC1F0]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x24BDAC1F8]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

uint64_t IOReportArrayGetValueAtIndex()
{
  return MEMORY[0x24BED4AA8]();
}

uint64_t IOReportChannelGetChannelID()
{
  return MEMORY[0x24BED4AB8]();
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x24BED4AF0]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x24BED4AF8]();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return MEMORY[0x24BED4B00]();
}

uint64_t IOReportCopyChannelsInGroup()
{
  return MEMORY[0x24BED4B08]();
}

uint64_t IOReportCopyChannelsOfFormat()
{
  return MEMORY[0x24BED4B10]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x24BED4B20]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x24BED4B28]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x24BED4B30]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x24BED4B38]();
}

uint64_t IOReportHistogramGetBucketCount()
{
  return MEMORY[0x24BED4B48]();
}

uint64_t IOReportHistogramGetBucketHits()
{
  return MEMORY[0x24BED4B50]();
}

uint64_t IOReportHistogramGetBucketSum()
{
  return MEMORY[0x24BED4B58]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x24BED4B70]();
}

uint64_t IOReportPrune()
{
  return MEMORY[0x24BED4B78]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x24BED4B90]();
}

uint64_t IOReportStateGetCount()
{
  return MEMORY[0x24BED4B98]();
}

uint64_t IOReportStateGetIDForIndex()
{
  return MEMORY[0x24BED4BA8]();
}

uint64_t IOReportStateGetInTransitions()
{
  return MEMORY[0x24BED4BB0]();
}

uint64_t IOReportStateGetResidency()
{
  return MEMORY[0x24BED4BC0]();
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_251440478();
}

void operator delete(void *__p)
{
  off_251440480(__p);
}

uint64_t operator delete()
{
  return off_251440488();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251440490(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x24BDAFD48](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

