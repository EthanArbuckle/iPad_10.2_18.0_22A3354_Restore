void sub_24A44B228(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD10324](v1, 0x10B2C403FE8F2F9);
  _Unwind_Resume(a1);
}

WebPrivacy::Client *WebPrivacy::Client::Client(WebPrivacy::Client *this)
{
  uint64_t v2;
  id v3;

  v2 = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  *(_QWORD *)this = dispatch_queue_create("com.apple.WebPrivacy.XPC", 0);
  *((_QWORD *)this + 1) = v2;
  *((_QWORD *)this + 2) = 850045863;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((_DWORD *)this + 30) = 1065353216;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_QWORD *)this + 21) = 850045863;
  *((_DWORD *)this + 40) = 1065353216;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *(_OWORD *)((char *)this + 217) = 0u;
  *((_QWORD *)this + 30) = 850045863;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_QWORD *)this + 39) = 0;
  *((_QWORD *)this + 40) = 0;
  *((_QWORD *)this + 37) = 0;
  *((_QWORD *)this + 38) = (char *)this + 312;
  *((_QWORD *)this + 41) = 850045863;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_QWORD *)this + 50) = 0;
  *((_QWORD *)this + 51) = 0;
  *((_QWORD *)this + 48) = 0;
  *((_QWORD *)this + 49) = (char *)this + 400;
  *((_QWORD *)this + 52) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)this + 53, "");
  *((_BYTE *)this + 448) = 0;
  *((_BYTE *)this + 456) = 0;
  return this;
}

void sub_24A44B364(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::mutex *v2;
  uint64_t v3;
  std::mutex *v4;
  std::mutex *v5;
  uint64_t v6;
  std::mutex *v7;
  uint64_t v8;

  std::__tree<Backend::RemoteList>::destroy(v8, *(_QWORD **)(v1 + 400));
  std::mutex::~mutex(v7);
  std::__tree<Backend::RemoteList>::destroy(v6, *(_QWORD **)(v1 + 312));
  std::mutex::~mutex(v5);
  std::mutex::~mutex(v4);
  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::~__hash_table(v1 + 88);

  std::mutex::~mutex(v2);
  Platform::WorkDispatcher::~WorkDispatcher((id *)v1);
  _Unwind_Resume(a1);
}

void sub_24A44B514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id location, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  void *v17;
  void *v18;
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a17;
  if (a17 == v19)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_24A44B660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void WebPrivacy::Client::getList(dispatch_queue_t *a1, char a2, char *a3, _QWORD *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  char v16;
  _QWORD v17[3];
  _QWORD *v18;
  _QWORD v19[4];
  __int128 v20;
  char v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(*a1);
  LOBYTE(v15) = a2;
  *((_QWORD *)&v15 + 1) = a1;
  v16 = *a3;
  v8 = v17;
  v9 = (_QWORD *)a4[3];
  if (v9)
  {
    if (v9 == a4)
    {
      v18 = v17;
      (*(void (**)(_QWORD *, _QWORD *))(*a4 + 24))(a4, v17);
      v9 = v18;
    }
    else
    {
      v18 = (_QWORD *)a4[3];
      a4[3] = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  v10 = *a1;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3321888768;
  v19[2] = ___ZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v19[3] = &__block_descriptor_88_ea8_32c153_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEE3__0_e5_v8__0l;
  v20 = v15;
  v21 = v16;
  v11 = v22;
  if (!v9)
    goto LABEL_9;
  if (v9 != v17)
  {
    v9 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v9 + 16))(v9);
LABEL_9:
    v23 = v9;
    goto LABEL_11;
  }
  v23 = v22;
  (*(void (**)(_QWORD *, _BYTE *))(v17[0] + 24))(v17, v22);
LABEL_11:
  v12 = (void *)MEMORY[0x24BD10684](v19);
  if (v23 == v22)
  {
    v13 = 4;
  }
  else
  {
    if (!v23)
      goto LABEL_16;
    v13 = 5;
    v11 = v23;
  }
  (*(void (**)(_QWORD *))(*v11 + 8 * v13))(v11);
LABEL_16:
  dispatch_async(v10, v12);

  if (v18 == v17)
  {
    v14 = 4;
  }
  else
  {
    if (!v18)
      return;
    v14 = 5;
    v8 = v18;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v14))(v8);
}

void sub_24A44B870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16)
{
  _QWORD *v16;
  uint64_t v18;

  if (a16 == v16)
  {
    v18 = 4;
  }
  else
  {
    if (!a16)
      goto LABEL_6;
    v18 = 5;
    v16 = a16;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v18))(v16);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t WebPrivacy::Client::shared(WebPrivacy::Client *this)
{
  if (WebPrivacy::Client::shared(void)::onceToken != -1)
    dispatch_once(&WebPrivacy::Client::shared(void)::onceToken, &__block_literal_global);
  return WebPrivacy::Client::shared(void)::sharedInstance;
}

void WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  char v5;
  unsigned __int8 v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unsigned __int8 v10[8];
  __int128 v11;

  v3 = a1;
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFA0])
  {
    v10[0] = 0;
    v11 = 0uLL;
    xpc_dictionary_get_array(v3, "args");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decode(v10, v4);

    if ((v5 & 1) != 0)
    {
      v6 = v10[0];
      *(_OWORD *)(a2 + 8) = v11;
      *(_BYTE *)a2 = v6;
      *(_BYTE *)(a2 + 24) = 1;
    }
    else
    {
      v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 24) = 0;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 24) = 0;
  }

}

void sub_24A44B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decode(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (xpc_array_get_count(v3) == 2)
    v4 = WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decodeOne<0u>(a1, v3);
  else
    v4 = 0;

  return v4;
}

void sub_24A44BA68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decodeOne<0u>(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (WebPrivacy::XPC::decode<WebPrivacy::MessageError>(v3, a1))
    v4 = WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decodeOne<1u>((uint64_t)a1, v3);
  else
    v4 = 0;

  return v4;
}

void sub_24A44BAC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::MessageError>(void *a1, unsigned __int8 *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 uint64;
  uint64_t v8;

  v3 = a1;
  if (!xpc_array_get_count(v3))
  {

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  xpc_array_get_value(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BD10858]();
  v6 = MEMORY[0x24BDACFF8];

  if (v5 != v6)
    goto LABEL_6;
  uint64 = xpc_array_get_uint64(v3, 0);
  if (uint64 >= 4u)
    goto LABEL_6;
  *a2 = uint64;
  v8 = 1;
LABEL_7:

  return v8;
}

void sub_24A44BB80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>::decodeOne<1u>(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v21;

  v3 = a2;
  v4 = a1 + 8;
  if (xpc_array_get_count(v3) <= 1)
  {

LABEL_9:
    v11 = v3;
    if (xpc_array_get_count(v11) <= 1)
    {

    }
    else
    {
      xpc_array_get_value(v11, 1uLL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BD10858]();
      v14 = MEMORY[0x24BDACFE8];

      if (v13 == v14)
      {
        xpc_array_get_value(v11, 1uLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        Platform::SharedMemory::map(v15, &v21);
        std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100](v4, &v21);
        v16 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
        if (*((_QWORD *)&v21 + 1))
        {
          v17 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }

        goto LABEL_17;
      }
    }

    v19 = 0;
    goto LABEL_20;
  }
  xpc_array_get_value(v3, 1uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BD10858]();
  v7 = MEMORY[0x24BDACFE0];

  if (v6 != v7)
    goto LABEL_9;
  v21 = 0uLL;
  std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100](v4, &v21);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
LABEL_17:

  v19 = 1;
LABEL_20:

  return v19;
}

void sub_24A44BD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void Platform::SharedMemory::map(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  void *v4;
  size_t v5;
  void *v6;
  _QWORD *v7;
  void *region;

  v3 = a1;
  v4 = v3;
  if (v3 && MEMORY[0x24BD10858](v3) == MEMORY[0x24BDACFE8] && (region = 0, (v5 = xpc_shmem_map(v4, &region)) != 0))
  {
    v6 = region;
    v7 = operator new(0x28uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_251BCE478;
    v7[3] = v6;
    v7[4] = v5;
    *a2 = v7 + 3;
    a2[1] = v7;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }

}

void sub_24A44BE34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL WebPrivacy::Client::updateCachedListData(uint64_t a1, unsigned __int8 a2, __int128 *a3)
{
  std::mutex *v5;
  int v6;
  __int16 v7;
  uint64_t **v8;
  int v9;
  __int16 v10;
  _BOOL8 v12;
  _QWORD v14[2];
  unsigned __int8 v15;
  _BYTE v16[14];
  _BYTE v17[14];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  if (!*(_QWORD *)a3)
    return 0;
  v14[0] = a1;
  v14[1] = &v15;
  v5 = (std::mutex *)(a1 + 168);
  std::mutex::lock((std::mutex *)(a1 + 168));
  *(_QWORD *)v17 = WebPrivacy::Client::updateCachedListData(Backend::RemoteList,std::shared_ptr<Platform::SharedMemory> &&)::$_0::operator()(v14);
  *(_DWORD *)&v17[8] = v6;
  *(_WORD *)&v17[12] = v7;
  *(_QWORD *)v16 = &v15;
  v8 = std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__emplace_unique_key_args<Backend::RemoteList,std::piecewise_construct_t const&,std::tuple<Backend::RemoteList const&>,std::tuple<>>(a1 + 88, &v15, (uint64_t)&std::piecewise_construct, (_BYTE **)v16);
  std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100]((uint64_t)(v8 + 3), a3);
  *(_QWORD *)v16 = WebPrivacy::Client::updateCachedListData(Backend::RemoteList,std::shared_ptr<Platform::SharedMemory> &&)::$_0::operator()(v14);
  *(_DWORD *)&v16[8] = v9;
  *(_WORD *)&v16[12] = v10;
  v12 = *(_QWORD *)v16 != *(_QWORD *)v17 || *(_QWORD *)&v16[6] != *(_QWORD *)&v17[6];
  std::mutex::unlock(v5);
  return v12;
}

void sub_24A44BF50(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__emplace_unique_key_args<Backend::RemoteList,std::piecewise_construct_t const&,std::tuple<Backend::RemoteList const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
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
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (uint64_t **)*i)
      {
        v12 = (unint64_t)i[1];
        if (v12 == v7)
        {
          if (*((unsigned __int8 *)i + 16) == (_DWORD)v7)
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
  v13 = a1 + 16;
  v14 = operator new(0x28uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *v14 = 0;
  v14[1] = v7;
  *((_BYTE *)v14 + 16) = **a4;
  v14[3] = 0;
  v14[4] = 0;
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
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__rehash<true>(a1, v20);
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
  i = (uint64_t **)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>>>>::reset[abi:nn180100]((uint64_t)v24, 0);
  return i;
}

void sub_24A44C1B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t Platform::SharedMemory::view(Platform::SharedMemory *this)
{
  return *(_QWORD *)this;
}

uint64_t WebPrivacy::getHeader(_QWORD *a1)
{
  if (a1[1] >= 0x49uLL)
    return *a1;
  else
    return 0;
}

void std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      std::__throw_bad_array_new_length[abi:nn180100]();
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

void WebPrivacy::Client::scheduleListUpdateWithNotification(uint64_t a1, unsigned __int8 a2)
{
  unsigned __int8 v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[5];
  unsigned __int8 v8;
  unsigned __int8 v9;

  v9 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  std::mutex::lock((std::mutex *)(a1 + 328));
  std::__tree<Backend::RemoteList>::__emplace_unique_key_args<Backend::RemoteList,Backend::RemoteList const&>((uint64_t **)(a1 + 392), &v9, &v9);
  v4 = v3;
  std::mutex::unlock((std::mutex *)(a1 + 328));
  if (v4)
  {
    v5 = dispatch_time(0, 1000000000);
    v6 = *(NSObject **)a1;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListE_block_invoke;
    v7[3] = &__block_descriptor_41_e5_v8__0l;
    v7[4] = a1;
    v8 = v9;
    dispatch_after(v5, v6, v7);
  }
}

void sub_24A44C4D8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<Backend::RemoteList>::__emplace_unique_key_args<Backend::RemoteList,Backend::RemoteList const&>(uint64_t **a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  unsigned int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((unsigned __int8 *)v5 + 25);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x20uLL);
    *((_BYTE *)v10 + 25) = *a3;
    std::__tree<Backend::RemoteList>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<Backend::RemoteList>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void sub_24A44C6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10)
{
  void *v10;
  std::mutex *v11;

  std::mutex::unlock(v11);

  _Unwind_Resume(a1);
}

void Platform::dataToBase64String(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", *a1, a1[1], 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v3);
  std::string::basic_string[abi:nn180100]<0>(a2, (char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

}

void sub_24A44C764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void WebPrivacy::createLinkFilteringData(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  WPLinkFilteringData *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v17[0] = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v14 = (id)objc_opt_new();
  v15[0] = &off_251BCE290;
  v15[1] = &v14;
  v16 = v15;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v15);
  v4 = v16;
  if (v16 == v15)
  {
    v5 = 4;
    v4 = v15;
    goto LABEL_7;
  }
  if (v16)
  {
    v5 = 5;
LABEL_7:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  if (objc_msgSend(v14, "count"))
  {
    v9 = [WPLinkFilteringData alloc];
    v10 = -[WPLinkFilteringData initWithRules:](v9, "initWithRules:", v14);
    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v17[0] = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v13);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  *a2 = v10;
  a2[1] = v11;

}

void sub_24A44C950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void callCompletionHandler<void({block_pointer} {__strong})(WPLinkFilteringData *,NSError *)>(void *a1, void *a2, void *a3, unsigned int a4)
{
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FD8];
    if (a4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(a4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

void sub_24A44CB40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_24A44CBFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id WebPrivacy::Client::ensureConnection(WebPrivacy::Client *this)
{
  std::mutex *v2;
  void *v3;
  NSObject *v4;
  xpc_connection_t mach_service;
  void *v6;
  _xpc_connection_s *v7;
  id v8;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (std::mutex *)((char *)this + 16);
  std::mutex::lock((std::mutex *)((char *)this + 16));
  v3 = (void *)*((_QWORD *)this + 10);
  if (!v3)
  {
    v4 = WPOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "com.apple.webprivacyd";
      _os_log_impl(&dword_24A44A000, v4, OS_LOG_TYPE_INFO, "Connecting to system daemon: %s", buf, 0xCu);
    }
    mach_service = xpc_connection_create_mach_service("com.apple.webprivacyd", *(dispatch_queue_t *)this, 0);
    v6 = (void *)*((_QWORD *)this + 10);
    *((_QWORD *)this + 10) = mach_service;

    v7 = (_xpc_connection_s *)*((_QWORD *)this + 10);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3321888768;
    handler[2] = ___ZN10WebPrivacy6Client16ensureConnectionEv_block_invoke;
    handler[3] = &__block_descriptor_40_ea8_32c51_ZTSKZN10WebPrivacy6Client16ensureConnectionEvE3__0_e33_v16__0__NSObject_OS_xpc_object__8l;
    handler[4] = this;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(*((xpc_connection_t *)this + 10));
    v3 = (void *)*((_QWORD *)this + 10);
  }
  v8 = v3;
  std::mutex::unlock(v2);
  return v8;
}

void sub_24A44CDF0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

id WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>(unsigned __int8 *a1)
{
  xpc_object_t v2;
  xpc_object_t empty;
  uint64_t v4;
  id v5;
  xpc_object_t v6;
  xpc_object_t values;

  values = xpc_uint64_create(6uLL);
  v2 = xpc_dictionary_create((const char *const *)&WebPrivacy::messageNameKey, &values, 1uLL);
  empty = xpc_array_create_empty();
  v4 = *a1;
  v5 = empty;
  v6 = xpc_uint64_create(v4);
  xpc_array_append_value(v5, v6);

  xpc_dictionary_set_value(v2, "args", v5);
  return v2;
}

void sub_24A44CEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t WPOSLogXPC(void)
{
  if (WPOSLogXPC(void)::onceToken != -1)
    dispatch_once(&WPOSLogXPC(void)::onceToken, &__block_literal_global_13);
  return WPOSLogXPC(void)::log;
}

uint64_t WebPrivacy::Client::clientNameForUserAgent(WebPrivacy::Client *this)
{
  uint64_t v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  uint64_t v11;

  if (*((char *)this + 447) < 0)
    v2 = *((_QWORD *)this + 54);
  else
    v2 = *((unsigned __int8 *)this + 447);
  v3 = (void **)((char *)this + 424);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    v8 = objc_retainAutorelease(v5);
    std::string::basic_string[abi:nn180100]<0>(&v10, (char *)objc_msgSend(v8, "UTF8String"));
    if (*((char *)this + 447) < 0)
      operator delete(*v3);
    *(_OWORD *)v3 = v10;
    *((_QWORD *)this + 55) = v11;

  }
  return (uint64_t)this + 424;
}

void sub_24A44D030(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>(unsigned __int8 *a1, uint64_t a2)
{
  xpc_object_t v4;
  xpc_object_t empty;
  uint64_t v6;
  id v7;
  xpc_object_t v8;
  id v9;
  const char *v10;
  xpc_object_t v11;
  xpc_object_t values;

  values = xpc_uint64_create(4uLL);
  v4 = xpc_dictionary_create((const char *const *)&WebPrivacy::messageNameKey, &values, 1uLL);
  empty = xpc_array_create_empty();
  v6 = *a1;
  v7 = empty;
  v8 = xpc_uint64_create(v6);
  xpc_array_append_value(v7, v8);

  v9 = v7;
  if (*(char *)(a2 + 23) >= 0)
    v10 = (const char *)a2;
  else
    v10 = *(const char **)a2;
  v11 = xpc_string_create(v10);
  xpc_array_append_value(v9, v11);

  xpc_dictionary_set_value(v4, "args", v9);
  return v4;
}

void sub_24A44D138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_24A44D188()
{
  JUMPOUT(0x24A44D174);
}

void sub_24A44D190()
{
  JUMPOUT(0x24A44D178);
}

uint64_t WebPrivacy::enumerateListRules(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v2 = *(_QWORD *)(result + 8);
  if (v2 >= 0x49)
  {
    v4 = (uint64_t *)result;
    v5 = 72;
    while (v5 < v2)
    {
      v6 = *v4;
      v7 = v5;
      while (1)
      {
        if (!*(_BYTE *)(v6 + v7))
        {
          v8 = 1;
          goto LABEL_11;
        }
        if (*(_BYTE *)(v6 + v7) == 10)
          break;
        if (v2 == ++v7)
        {
          v8 = 0;
          v7 = v2;
          goto LABEL_11;
        }
      }
      v8 = 0;
LABEL_11:
      v9 = v7 - v5;
      v10 = v4[1];
      v12 = v10 < v5 || v7 > v10;
      v13 = v6 + v5;
      if (v12)
        v14 = 0;
      else
        v14 = v9;
      if (v12)
        v13 = 0;
      v17[0] = v13;
      v17[1] = v14;
      v15 = *(_QWORD *)(a2 + 24);
      if (!v15)
      {
        v16 = std::__throw_bad_function_call[abi:nn180100]();
        return Platform::ArrayView<unsigned char>::copyToNSString(v16);
      }
      result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v15 + 48))(v15, v17);
      v5 = v7 + 1;
      if (v8)
        return result;
    }
  }
  return result;
}

id Platform::ArrayView<unsigned char>::copyToNSString(_QWORD *a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", *a1, a1[1], 4);
}

void sub_24A44D3A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24A44D60C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A44D75C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c51_ZTSKZN10WebPrivacy6Client16ensureConnectionEvE3__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void ___Z10WPOSLogXPCv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "XPC");
  v1 = (void *)WPOSLogXPC(void)::log;
  WPOSLogXPC(void)::log = (uint64_t)v0;

}

void ___Z10WPOSLogAPIv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "API");
  v1 = (void *)WPOSLogAPI(void)::log;
  WPOSLogAPI(void)::log = (uint64_t)v0;

}

uint64_t WPOSLogServer(void)
{
  if (WPOSLogServer(void)::onceToken != -1)
    dispatch_once(&WPOSLogServer(void)::onceToken, &__block_literal_global_9);
  return WPOSLogServer(void)::log;
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(void *a1)
{
  id v1;
  int v2;
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v6;

  v1 = a1;
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFA0])
  {
    v6 = 0;
    xpc_dictionary_get_array(v1, "args");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = WebPrivacy::XPC::Message<(MessageName)5,WebPrivacy::MessageError>::decode(&v6, v4);

    if (v2)
      v3 = v6;
    else
      v3 = 0;
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }

  return v3 | (v2 << 8);
}

void sub_24A44D968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)5,WebPrivacy::MessageError>::decode(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (xpc_array_get_count(v3) == 1)
    v4 = WebPrivacy::XPC::decode<WebPrivacy::MessageError>(v3, a1);
  else
    v4 = 0;

  return v4;
}

void sub_24A44D9D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WPOSLogAPI(void)
{
  if (WPOSLogAPI(void)::onceToken != -1)
    dispatch_once(&WPOSLogAPI(void)::onceToken, &__block_literal_global_0);
  return WPOSLogAPI(void)::log;
}

void sub_24A44DA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

id Platform::dataToBase64String(NSData *a1)
{
  -[NSData base64EncodedStringWithOptions:](a1, "base64EncodedStringWithOptions:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void Platform::base64StringToData(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  id v4;
  uint64_t *v5;
  NSString *v6;
  void *v7;
  char *v8;
  char *v9;
  int64_t v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (*((char *)a1 + 23) >= 0)
    v5 = a1;
  else
    v5 = (uint64_t *)*a1;
  v6 = (NSString *)objc_msgSend(v4, "initWithCString:encoding:", v5, 4);
  Platform::base64StringToData(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<unsigned char>::reserve(a2, objc_msgSend(v7, "length"));
  v11 = objc_retainAutorelease(v7);
  v8 = (char *)objc_msgSend(v11, "bytes");
  v9 = (char *)a2[1];
  v10 = objc_msgSend(v11, "length");
  std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>((uint64_t)a2, v9, v8, &v8[v10], v10);

}

void sub_24A44DB74(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

id Platform::base64StringToData(NSString *a1)
{
  NSString *v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v1, 0);

  return v2;
}

void sub_24A44DBEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2;
  char *v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  char *v9;
  char v10;

  v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      abort();
    v5 = (char *)a1[1];
    v6 = operator new(__sz);
    v7 = &v5[(_QWORD)v6 - v2];
    v8 = v7;
    if (v5 != (char *)v2)
    {
      v9 = &v5[~v2];
      do
      {
        v10 = *--v5;
        (v9--)[(_QWORD)v6] = v10;
      }
      while (v5 != (char *)v2);
      v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
      operator delete((void *)v2);
  }
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
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

char *std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int64_t v25;
  char v26;
  char *v27;
  char *v28;
  size_t v29;
  char *v30;
  char *v31;
  char *v32;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      abort();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
    {
      v16 = v15;
      v17 = (char *)operator new(v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v27 = &v13[(_QWORD)v17];
    memcpy(&v13[(_QWORD)v17], __src, a5);
    v28 = &v13[(_QWORD)v17];
    v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(_QWORD)v17 - 1] = v13[(_QWORD)(v11 - 1)];
        --v13;
      }
      while (v13);
      v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5)
      memmove(v30, v5, v10 - v5);
    v32 = *(char **)a1;
    *(_QWORD *)a1 = v28;
    *(_QWORD *)(a1 + 8) = &v30[v10 - v5];
    *(_QWORD *)(a1 + 16) = v31;
    if (v32)
      operator delete(v32);
    return v27;
  }
  v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    v22 = &v5[a5];
    v23 = &v21[-a5];
    v24 = v21;
    if (&v21[-a5] < v10)
    {
      v25 = &v10[a5] - v21;
      v24 = v21;
      do
      {
        v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(_QWORD *)(a1 + 8) = v24;
    if (v21 != v22)
      memmove(&v5[a5], v5, v21 - v22);
    if (v19 != __src)
      memmove(v5, __src, v19 - __src);
    return v5;
  }
  v19 = &__src[v18];
  v20 = a4 - &__src[v18];
  if (a4 != &__src[v18])
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  v21 = &v10[v20];
  *(_QWORD *)(a1 + 8) = &v10[v20];
  if (v18 >= 1)
    goto LABEL_17;
  return v5;
}

uint64_t WebPrivacy::Client::shouldUseXPCService(WebPrivacy::Client *this)
{
  return 0;
}

void ___ZN10WebPrivacy6Client16ensureConnectionEv_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *string;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFB8])
  {
    v7 = (id)WPOSLogXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
      ___ZN10WebPrivacy6Client16ensureConnectionEv_block_invoke_cold_1((uint64_t)string, (uint64_t)&v9, v7);
    }

    atomic_store(0, (unsigned __int8 *)(v4 + 232));
  }
  else
  {
    v5 = (void *)MEMORY[0x24BD1081C](v3);
    v6 = WPOSLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 136380675;
      v10 = v5;
      _os_log_impl(&dword_24A44A000, v6, OS_LOG_TYPE_INFO, "Handled message from server: %{private}s", (uint8_t *)&v9, 0xCu);
    }
    free(v5);
  }

}

void sub_24A44E064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void WebPrivacy::Client::setServerEndpoint(dispatch_queue_t *a1, char a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t *v13;
  char v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[5];
  char v18;
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(*a1);
  v13 = a1;
  v14 = a2;
  v6 = v15;
  v7 = (_QWORD *)a3[3];
  if (v7)
  {
    if (v7 == a3)
    {
      v16 = v15;
      (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v15);
      v7 = v16;
    }
    else
    {
      v16 = (_QWORD *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v8 = *a1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3321888768;
  v17[2] = ___ZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0cvU13block_pointerS4_Ev_block_invoke;
  v17[3] = &__block_descriptor_80_ea8_32c95_ZTSKZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEE3__0_e5_v8__0l;
  v17[4] = v13;
  v18 = v14;
  v9 = v19;
  if (!v7)
    goto LABEL_9;
  if (v7 != v15)
  {
    v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
LABEL_9:
    v20 = v7;
    goto LABEL_11;
  }
  v20 = v19;
  (*(void (**)(_QWORD *, _BYTE *))(v15[0] + 24))(v15, v19);
LABEL_11:
  v10 = (void *)MEMORY[0x24BD10684](v17);
  if (v20 == v19)
  {
    v11 = 4;
  }
  else
  {
    if (!v20)
      goto LABEL_16;
    v11 = 5;
    v9 = v20;
  }
  (*(void (**)(_QWORD *))(*v9 + 8 * v11))(v9);
LABEL_16:
  dispatch_async(v8, v10);

  if (v16 == v15)
  {
    v12 = 4;
  }
  else
  {
    if (!v16)
      return;
    v12 = 5;
    v6 = v16;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v12))(v6);
}

void sub_24A44E250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  _QWORD *v15;
  uint64_t v17;

  if (a15 == v15)
  {
    v17 = 4;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
    v15 = a15;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v17))(v15);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void WebPrivacy::Client::getStatus(dispatch_queue_t *a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  dispatch_queue_t *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  _QWORD v14[5];
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(*a1);
  v4 = v12;
  v5 = (_QWORD *)a2[3];
  if (!v5)
  {
    v13 = 0;
    goto LABEL_5;
  }
  if (v5 != a2)
  {
    v13 = (_QWORD *)a2[3];
    a2[3] = 0;
LABEL_5:
    v6 = a1;
    goto LABEL_7;
  }
  v13 = v12;
  (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, v12);
  v6 = a1;
  v5 = v13;
LABEL_7:
  v7 = *a1;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3321888768;
  v14[2] = ___ZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v14[3] = &__block_descriptor_72_ea8_32c155_ZTSKZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEE3__0_e5_v8__0l;
  v14[4] = v6;
  v8 = v15;
  if (!v5)
  {
LABEL_10:
    v16 = v5;
    goto LABEL_12;
  }
  if (v5 != v12)
  {
    v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 16))(v5);
    goto LABEL_10;
  }
  v16 = v15;
  (*(void (**)(_QWORD *, _BYTE *))(v12[0] + 24))(v12, v15);
LABEL_12:
  v9 = (void *)MEMORY[0x24BD10684](v14);
  if (v16 == v15)
  {
    v10 = 4;
  }
  else
  {
    if (!v16)
      goto LABEL_17;
    v10 = 5;
    v8 = v16;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v10))(v8);
LABEL_17:
  dispatch_async(v7, v9);

  if (v13 == v12)
  {
    v11 = 4;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
    v4 = v13;
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v11))(v4);
}

void sub_24A44E43C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  _QWORD *v14;
  uint64_t v16;

  if (a14 == v14)
  {
    v16 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v16 = 5;
    v14 = a14;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void WebPrivacy::Client::updateList(dispatch_queue_t *a1, char a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t *v13;
  char v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[5];
  char v18;
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(*a1);
  v13 = a1;
  v14 = a2;
  v6 = v15;
  v7 = (_QWORD *)a3[3];
  if (v7)
  {
    if (v7 == a3)
    {
      v16 = v15;
      (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v15);
      v7 = v16;
    }
    else
    {
      v16 = (_QWORD *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v8 = *a1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3321888768;
  v17[2] = ___ZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v17[3] = &__block_descriptor_80_ea8_32c107_ZTSKZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEE3__0_e5_v8__0l;
  v17[4] = v13;
  v18 = v14;
  v9 = v19;
  if (!v7)
    goto LABEL_9;
  if (v7 != v15)
  {
    v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
LABEL_9:
    v20 = v7;
    goto LABEL_11;
  }
  v20 = v19;
  (*(void (**)(_QWORD *, _BYTE *))(v15[0] + 24))(v15, v19);
LABEL_11:
  v10 = (void *)MEMORY[0x24BD10684](v17);
  if (v20 == v19)
  {
    v11 = 4;
  }
  else
  {
    if (!v20)
      goto LABEL_16;
    v11 = 5;
    v9 = v20;
  }
  (*(void (**)(_QWORD *))(*v9 + 8 * v11))(v9);
LABEL_16:
  dispatch_async(v8, v10);

  if (v16 == v15)
  {
    v12 = 4;
  }
  else
  {
    if (!v16)
      return;
    v12 = 5;
    v6 = v16;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v12))(v6);
}

void sub_24A44E634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  _QWORD *v15;
  uint64_t v17;

  if (a15 == v15)
  {
    v17 = 4;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
    v15 = a15;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v17))(v15);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void WebPrivacy::Client::getList(uint64_t a1@<X0>, unsigned int a2@<W1>, _QWORD *a3@<X8>)
{
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  char v20;
  NSObject *v21;

  WebPrivacy::Client::cachedListData(a1, a2, a3);
  if (!*a3)
  {
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)a3);
    v6 = atomic_load((unsigned __int8 *)(a1 + 232));
    if ((v6 & 1) != 0)
    {
      *a3 = 0;
      a3[1] = 0;
    }
    else
    {
      std::mutex::lock((std::mutex *)(a1 + 240));
      v7 = *(_QWORD *)(a1 + 312);
      if (!v7)
        goto LABEL_14;
      v8 = a1 + 312;
      do
      {
        v9 = *(unsigned __int8 *)(v7 + 25);
        v10 = v9 >= a2;
        if (v9 >= a2)
          v11 = (uint64_t *)v7;
        else
          v11 = (uint64_t *)(v7 + 8);
        if (v10)
          v8 = v7;
        v7 = *v11;
      }
      while (*v11);
      if (v8 != a1 + 312 && *(unsigned __int8 *)(v8 + 25) <= a2)
      {
        *a3 = 0;
        a3[1] = 0;
        std::mutex::unlock((std::mutex *)(a1 + 240));
      }
      else
      {
LABEL_14:
        std::mutex::unlock((std::mutex *)(a1 + 240));
        v12 = dispatch_semaphore_create(0);
        v13 = *(NSObject **)a1;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3321888768;
        v19[2] = ___ZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0cvU13block_pointerFvvEEv_block_invoke;
        v19[3] = &__block_descriptor_56_ea8_32c62_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEE3__0_e5_v8__0l;
        v19[4] = a1;
        v20 = a2;
        v21 = v12;
        v14 = (void *)MEMORY[0x24BD10684](v19);

        dispatch_async(v13, v14);
        if (*(_BYTE *)(a1 + 456))
          v15 = (uint64_t)*(double *)(a1 + 448);
        else
          v15 = 10000000;
        v16 = dispatch_time(0, v15);
        if (dispatch_semaphore_wait(v12, v16))
        {
          v17 = WPOSLogXPC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            WebPrivacy::Client::getList(a2, v17, v18);
          atomic_store(1u, (unsigned __int8 *)(a1 + 232));
        }
        WebPrivacy::Client::cachedListData(a1, a2, a3);
        if (!*a3)
        {
          std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)a3);
          *a3 = 0;
          a3[1] = 0;
        }

      }
    }
  }
}

void sub_24A44E84C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void WebPrivacy::Client::cachedListData(uint64_t a1@<X0>, unsigned __int8 a2@<W1>, _QWORD *a3@<X8>)
{
  std::mutex *v5;
  uint64_t **v6;
  unsigned __int8 v7;

  v7 = a2;
  *a3 = 0;
  a3[1] = 0;
  v5 = (std::mutex *)(a1 + 168);
  std::mutex::lock((std::mutex *)(a1 + 168));
  v6 = std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::find<Backend::RemoteList>((_QWORD *)(a1 + 88), &v7);
  if (v6)
    std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100](a3, (uint64_t *)v6 + 3);
  std::mutex::unlock(v5);
}

void sub_24A44E8C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::mutex *v2;

  std::mutex::unlock(v2);
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListE_block_invoke(uint64_t a1)
{
  WebPrivacy::Client *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  __int128 v11;
  void *v12;
  WebPrivacy::Client *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  unsigned __int8 v23[8];
  std::string v24;
  WebPrivacy::Client *v25;
  unsigned __int8 v26;
  uint64_t block;
  std::string __p;
  WebPrivacy::Client *v29;
  unsigned __int8 v30;
  id v31;

  v2 = *(WebPrivacy::Client **)(a1 + 32);
  v3 = WebPrivacy::Client::clientNameForUserAgent(v2);
  v4 = v3;
  v5 = *(_BYTE *)(a1 + 40);
  v6 = *((_QWORD *)v2 + 52);
  if (v6)
  {
    v23[0] = *(_BYTE *)(a1 + 40);
    if (*(char *)(v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v3, *(_QWORD *)(v3 + 8));
      v6 = *((_QWORD *)v2 + 52);
    }
    else
    {
      v18 = *(_OWORD *)v3;
      v24.__r_.__value_.__r.__words[2] = *(_QWORD *)(v3 + 16);
      *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v18;
    }
    v25 = v2;
    v26 = v5;
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>(v23, (uint64_t)&v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      __assert_rtn("operator()", "Client.h", 98, "result");
    v21 = *(NSObject **)v2;
    block = MEMORY[0x24BDAC760];
    __p.__r_.__value_.__r.__words[0] = 3321888768;
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_34scheduleListUpdateWithNotificationES6_EUb_E3__6EEEvDpOT1_ENKUlOT_DpOT0_E_clIRKSI_JS8_SH_EEEDaSN_SQ__block_invoke;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)&__block_descriptor_56_ea8_32c289_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_34scheduleListUpdateWithNotificationES6_EUb_E3__6EEEvDpOT1_ENKUlOT_DpOT0_E_clIRKSI_JS8_SH_EEEDaSN_SQ_EUlvE__e5_v8__0l;
    v29 = v25;
    v30 = v26;
    v31 = v20;
    v22 = v20;
    dispatch_async(v21, &block);

    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
  }
  else
  {
    WebPrivacy::Client::ensureConnection(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(NSObject **)v2;
    v9 = v7;
    v10 = v8;
    LOBYTE(block) = *(_BYTE *)(a1 + 40);
    if (*(char *)(v4 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *(_QWORD *)(v4 + 8));
    }
    else
    {
      v11 = *(_OWORD *)v4;
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v4 + 16);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
    }
    v29 = v2;
    v30 = v5;
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>((unsigned __int8 *)&block, (uint64_t)&__p);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;
    v14 = v30;
    v15 = malloc_type_malloc(0x30uLL, 0x10E0040DB3EB79FuLL);
    *v15 = MEMORY[0x24BDAC758];
    v15[1] = 50331650;
    v15[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_E3__6EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlOT_DpOT0_E_clIRKSO_JRSE_RSM_EEEDaSV_SY_EUlS3_E_EES5_SU_ENUlPvS3_E_8__invokeES17_S3_;
    v15[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_E3__6EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlOT_DpOT0_E_clIRKSO_JRSE_RSM_EEEDaSV_SY_EUlS3_E_EES5_SU_E10descriptor;
    v15[4] = v13;
    v15[5] = v14;
    v16 = (void *)MEMORY[0x24BD10684]();

    v17 = (void *)MEMORY[0x24BD10684](v16);
    xpc_connection_send_message_with_reply(v9, v12, v10, v17);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
}

void sub_24A44EB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;

  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::Client::updateCachedListData(Backend::RemoteList,std::shared_ptr<Platform::SharedMemory> &&)::$_0::operator()(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t **v3;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t Header;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _BYTE *v14[4];

  v1 = (_BYTE *)a1[1];
  v2 = *a1 + 88;
  v14[0] = v1;
  v3 = std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__emplace_unique_key_args<Backend::RemoteList,std::piecewise_construct_t const&,std::tuple<Backend::RemoteList const&>,std::tuple<>>(v2, v1, (uint64_t)&std::piecewise_construct, v14);
  v4 = v3[3];
  v5 = v3[4];
  v14[2] = v4;
  v14[3] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 1);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  if (v4
    && (v14[0] = (_BYTE *)Platform::SharedMemory::view((Platform::SharedMemory *)v4),
        v14[1] = v8,
        (Header = WebPrivacy::getHeader(v14)) != 0))
  {
    v10 = *(_QWORD *)(Header + 34);
    if (!v5)
      return v10;
  }
  else
  {
    v10 = 0;
    if (!v5)
      return v10;
  }
  v11 = (unint64_t *)(v5 + 1);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    (*(void (**)(uint64_t *))(*v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  return v10;
}

void sub_24A44ECC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

_QWORD *std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void WebPrivacy::Client::deleteList(dispatch_queue_t *a1, char a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[3];
  _QWORD *v15;
  _QWORD v16[4];
  __int128 v17;
  _BYTE v18[24];
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(*a1);
  LOBYTE(v13) = a2;
  *((_QWORD *)&v13 + 1) = a1;
  v6 = v14;
  v7 = (_QWORD *)a3[3];
  if (v7)
  {
    if (v7 == a3)
    {
      v15 = v14;
      (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v14);
      v7 = v15;
    }
    else
    {
      v15 = (_QWORD *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  v8 = *a1;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3321888768;
  v16[2] = ___ZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v16[3] = &__block_descriptor_80_ea8_32c108_ZTSKZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEE3__0_e5_v8__0l;
  v17 = v13;
  v9 = v18;
  if (!v7)
    goto LABEL_9;
  if (v7 != v14)
  {
    v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
LABEL_9:
    v19 = v7;
    goto LABEL_11;
  }
  v19 = v18;
  (*(void (**)(_QWORD *, _BYTE *))(v14[0] + 24))(v14, v18);
LABEL_11:
  v10 = (void *)MEMORY[0x24BD10684](v16);
  if (v19 == v18)
  {
    v11 = 4;
  }
  else
  {
    if (!v19)
      goto LABEL_16;
    v11 = 5;
    v9 = v19;
  }
  (*(void (**)(_QWORD *))(*v9 + 8 * v11))(v9);
LABEL_16:
  dispatch_async(v8, v10);

  if (v15 == v14)
  {
    v12 = 4;
  }
  else
  {
    if (!v15)
      return;
    v12 = 5;
    v6 = v15;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v12))(v6);
}

void sub_24A44EF64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  _QWORD *v15;
  uint64_t v17;

  if (a15 == v15)
  {
    v17 = 4;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
    v15 = a15;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v17))(v15);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void Platform::WorkDispatcher::~WorkDispatcher(id *this)
{

}

uint64_t WebPrivacy::Client::remoteProcessID(xpc_connection_t *this)
{
  std::mutex *v2;
  uint64_t pid;

  v2 = (std::mutex *)(this + 2);
  std::mutex::lock((std::mutex *)(this + 2));
  pid = xpc_connection_get_pid(this[10]);
  std::mutex::unlock(v2);
  return pid;
}

void sub_24A44F018(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void WebPrivacy::Client::resetStateForTesting(WebPrivacy::Client *this)
{
  void *v2;
  _BYTE *v3;

  dispatch_sync(*(dispatch_queue_t *)this, &__block_literal_global_8);
  if (*((_BYTE *)this + 456))
    *((_BYTE *)this + 456) = 0;
  atomic_store(0, (unsigned __int8 *)this + 232);
  v2 = (void *)*((_QWORD *)this + 52);
  *((_QWORD *)this + 52) = 0;

  if (*((char *)this + 447) < 0)
  {
    *((_QWORD *)this + 54) = 0;
    v3 = (_BYTE *)*((_QWORD *)this + 53);
  }
  else
  {
    v3 = (char *)this + 424;
    *((_BYTE *)this + 447) = 0;
  }
  *v3 = 0;
  std::mutex::lock((std::mutex *)((char *)this + 328));
  std::__tree<Backend::RemoteList>::__assign_unique<Backend::RemoteList const*>((uint64_t **)this + 49, 0, 0);
  std::mutex::unlock((std::mutex *)((char *)this + 328));
  std::mutex::lock((std::mutex *)((char *)this + 168));
  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__assign_unique<std::pair<Backend::RemoteList const,std::shared_ptr<Platform::SharedMemory>> const*>((_QWORD *)this + 11, 0, 0);
  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::__assign_unique<std::pair<Backend::RemoteList const,std::array<unsigned char,14ul>> const*>((_QWORD *)this + 16, 0, 0);
  std::mutex::unlock((std::mutex *)((char *)this + 168));
}

void sub_24A44F0EC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void ___ZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0cvU13block_pointerS4_Ev_block_invoke(uint64_t a1)
{
  WebPrivacy::Client *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  WebPrivacy::Client **v11;
  WebPrivacy::Client **v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;
  WebPrivacy::Client *v38;
  _QWORD v39[2];
  WebPrivacy::Client **v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD v43[3];
  _QWORD *v44;
  id v45;
  uint64_t block;
  uint64_t v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD *v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = *(WebPrivacy::Client **)(a1 + 32);
  v3 = v35;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v35, a1 + 48);
  v4 = *((_QWORD *)v2 + 52);
  if (!v4)
  {
    WebPrivacy::Client::ensureConnection(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(NSObject **)v2;
    v7 = v5;
    v8 = v6;
    LOBYTE(block) = *(_BYTE *)(a1 + 40);
    v47 = (uint64_t)v2;
    v9 = v48;
    if (v36)
    {
      if (v36 == v35)
      {
        v49[0] = v48;
        (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v48);
      }
      else
      {
        v49[0] = v36;
        v36 = 0;
      }
    }
    else
    {
      v49[0] = 0;
    }
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::SetServerEndpoint,WebPrivacy::ServerEndpoint const>((unsigned __int8 *)&block);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v47;
    v11 = &v38;
    if (v49[0])
    {
      if ((_QWORD *)v49[0] == v48)
      {
        v40 = &v38;
        (*(void (**)(_QWORD *, WebPrivacy::Client **))(v48[0] + 24))(v48, &v38);
        v12 = v40;
      }
      else
      {
        v12 = (WebPrivacy::Client **)(*(uint64_t (**)(void))(*(_QWORD *)v49[0] + 16))();
        v40 = v12;
      }
      v42 = v37;
      v13 = v43;
      if (v12)
      {
        if (v12 == &v38)
        {
          v44 = v43;
          (*((void (**)(WebPrivacy::Client **, _QWORD *))v38 + 3))(&v38, v43);
        }
        else
        {
          v44 = v12;
          v40 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v40 = 0;
      v42 = v47;
      v13 = v43;
    }
    v44 = 0;
LABEL_16:
    v14 = malloc_type_malloc(0x48uLL, 0x10E004040E2C6D6uLL);
    v15 = v14;
    *v14 = MEMORY[0x24BDAC758];
    v14[1] = 50331650;
    v14[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_17SetServerEndpointENS8_22SetServerEndpointReplyEJKNS7_14ServerEndpointEZZNS7_6Client17setServerEndpointESC_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSM_DpOT0_E_clIRKSN_JRSD_EEEDaSM_SV_EUlS3_E_EES5_SL_ENUlPvS3_E_8__invokeES13_S3_;
    v14[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_17SetServerEndpointENS8_22SetServerEndpointReplyEJKNS7_14ServerEndpointEZZNS7_6Client17setServerEndpointESC_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSM_DpOT0_E_clIRKSN_JRSD_EEEDaSM_SV_EUlS3_E_EES5_SL_E10descriptor;
    v16 = v44;
    v14[4] = v42;
    if (v16)
    {
      if (v16 == v43)
      {
        v14[8] = v14 + 5;
        (*(void (**)(_QWORD *))(v43[0] + 24))(v43);
      }
      else
      {
        v14[8] = v16;
        v44 = 0;
      }
    }
    else
    {
      v14[8] = 0;
    }
    v17 = (void *)MEMORY[0x24BD10684](v15);

    if (v44 == v43)
    {
      v18 = 4;
    }
    else
    {
      if (!v44)
        goto LABEL_26;
      v18 = 5;
      v13 = v44;
    }
    (*(void (**)(_QWORD *))(*v13 + 8 * v18))(v13);
LABEL_26:
    v19 = (void *)MEMORY[0x24BD10684](v17);
    xpc_connection_send_message_with_reply(v7, v10, v8, v19);

    if (v40 == &v38)
    {
      v20 = 4;
    }
    else
    {
      if (!v40)
        goto LABEL_31;
      v20 = 5;
      v11 = v40;
    }
    (*((void (**)(WebPrivacy::Client **))*v11 + v20))(v11);
LABEL_31:

    if ((_QWORD *)v49[0] == v48)
    {
      v21 = 4;
    }
    else
    {
      if (!v49[0])
      {
LABEL_36:

        goto LABEL_37;
      }
      v21 = 5;
      v9 = (_QWORD *)v49[0];
    }
    (*(void (**)(_QWORD *))(*v9 + 8 * v21))(v9);
    goto LABEL_36;
  }
  LOBYTE(v37) = *(_BYTE *)(a1 + 40);
  v38 = v2;
  v23 = v39;
  if (v36)
  {
    if (v36 == v35)
    {
      v41 = v39;
      (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v39);
      v4 = *((_QWORD *)v2 + 52);
    }
    else
    {
      v41 = v36;
      v36 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::SetServerEndpoint,WebPrivacy::ServerEndpoint const>((unsigned __int8 *)&v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v26 = *(NSObject **)v2;
  block = MEMORY[0x24BDAC760];
  v47 = 3321888768;
  v48[0] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC17SetServerEndpointENS2_22SetServerEndpointReplyEJRKNS_14ServerEndpointEZZNS0_17setServerEndpointES5_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSF_DpOT0_E_clIRKSG_JS7_EEEDaSF_SM__block_invoke;
  v48[1] = &__block_descriptor_80_ea8_32c249_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC17SetServerEndpointENS2_22SetServerEndpointReplyEJRKNS_14ServerEndpointEZZNS0_17setServerEndpointES5_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSF_DpOT0_E_clIRKSG_JS7_EEEDaSF_SM_EUlvE__e5_v8__0l;
  v27 = (uint64_t)v41;
  v42 = (uint64_t)v38;
  v28 = v43;
  if (!v41)
    goto LABEL_53;
  if (v41 != v39)
  {
    v27 = (*(uint64_t (**)(void))(*v41 + 16))();
LABEL_53:
    v44 = (_QWORD *)v27;
    goto LABEL_55;
  }
  v44 = v43;
  (*(void (**)(_QWORD *, _QWORD *))(v39[0] + 24))(v39, v43);
LABEL_55:
  v29 = v25;
  v45 = v29;
  v30 = (uint64_t)v44;
  v48[2] = v42;
  v31 = v49;
  if (!v44)
  {
LABEL_58:
    v50 = (_QWORD *)v30;
    goto LABEL_60;
  }
  if (v44 != v43)
  {
    v30 = (*(uint64_t (**)(void))(*v44 + 16))();
    goto LABEL_58;
  }
  v50 = v49;
  (*(void (**)(_QWORD *, _QWORD *))(v43[0] + 24))(v43, v49);
LABEL_60:
  v51 = v45;
  dispatch_async(v26, &block);

  if (v44 == v43)
  {
    v32 = 4;
  }
  else
  {
    if (!v44)
      goto LABEL_65;
    v32 = 5;
    v28 = v44;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v32))(v28);
LABEL_65:

  if (v50 == v49)
  {
    v33 = 4;
  }
  else
  {
    if (!v50)
      goto LABEL_70;
    v33 = 5;
    v31 = v50;
  }
  (*(void (**)(_QWORD *))(*v31 + 8 * v33))(v31);
LABEL_70:

  if (v41 == v39)
  {
    v34 = 4;
  }
  else
  {
    if (!v41)
      goto LABEL_37;
    v34 = 5;
    v23 = v41;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v34))(v23);
LABEL_37:
  if (v36 == v35)
  {
    v22 = 4;
  }
  else
  {
    if (!v36)
      return;
    v22 = 5;
    v3 = v36;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v22))(v3);
}

void sub_24A44F704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,void *a25)
{
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a24 == v28)
  {
    v30 = 4;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v30 = 5;
    v28 = a24;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v30))(v28);
LABEL_6:

  if (a19 == v26)
  {
    v31 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_11;
    v31 = 5;
    v26 = a19;
  }
  (*(void (**)(_QWORD *))(*v26 + 8 * v31))(v26);
LABEL_11:
  if (a13 == v25)
  {
    v32 = 4;
  }
  else
  {
    if (!a13)
      goto LABEL_16;
    v32 = 5;
    v25 = a13;
  }
  (*(void (**)(_QWORD *))(*v25 + 8 * v32))(v25);
LABEL_16:
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c95_ZTSKZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v2;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
}

_QWORD *__destroy_helper_block_ea8_32c95_ZTSKZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEE3__0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
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

id WebPrivacy::XPC::serialize<WebPrivacy::XPC::SetServerEndpoint,WebPrivacy::ServerEndpoint const>(unsigned __int8 *a1)
{
  xpc_object_t v2;
  xpc_object_t empty;
  uint64_t v4;
  id v5;
  xpc_object_t v6;
  xpc_object_t values;

  values = xpc_uint64_create(0);
  v2 = xpc_dictionary_create((const char *const *)&WebPrivacy::messageNameKey, &values, 1uLL);
  empty = xpc_array_create_empty();
  v4 = *a1;
  v5 = empty;
  v6 = xpc_uint64_create(v4);
  xpc_array_append_value(v5, v6);

  xpc_dictionary_set_value(v2, "args", v5);
  return v2;
}

void sub_24A44F99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_17SetServerEndpointENS8_22SetServerEndpointReplyEJKNS7_14ServerEndpointEZZNS7_6Client17setServerEndpointESC_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSM_DpOT0_E_clIRKSN_JRSD_EEEDaSM_SV_EUlS3_E_EES5_SL_ENUlPKvE_8__invokeES14_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_17SetServerEndpointENS8_22SetServerEndpointReplyEJKNS7_14ServerEndpointEZZNS7_6Client17setServerEndpointESC_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSM_DpOT0_E_clIRKSN_JRSD_EEEDaSM_SV_EUlS3_E_EES5_SL_ENUlPvS3_E_8__invokeES13_S3_(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  WebPrivacy::XPC::decode<WebPrivacy::XPC::SetServerEndpointReply>(v3);
  _ZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_((uint64_t *)(a1 + 32));

}

void sub_24A44FA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_QWORD *_ZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[4];
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)(a1 + 1));
  v2 = *(NSObject **)(v1 + 8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3321888768;
  v11[2] = ___ZZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_ENKUlvE_cvU13block_pointerS4_Ev_block_invoke;
  v11[3] = &__block_descriptor_64_ea8_32c177_ZTSKZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_EUlvE__e5_v8__0l;
  v3 = v12;
  v4 = (uint64_t)v10;
  if (!v10)
    goto LABEL_4;
  if (v10 != v9)
  {
    v4 = (*(uint64_t (**)(void))(*v10 + 16))();
LABEL_4:
    v13 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v13 = v12;
  (*(void (**)(_QWORD *, _BYTE *))(v9[0] + 24))(v9, v12);
LABEL_6:
  v5 = (void *)MEMORY[0x24BD10684](v11);
  if (v13 == v12)
  {
    v6 = 4;
  }
  else
  {
    if (!v13)
      goto LABEL_11;
    v6 = 5;
    v3 = v13;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  dispatch_async(v2, v5);

  result = v10;
  if (v10 == v9)
  {
    v8 = 4;
    result = v9;
  }
  else
  {
    if (!v10)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

void sub_24A44FBE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::SetServerEndpointReply>(void *a1)
{
  id v1;
  int v2;
  void *v3;

  v1 = a1;
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_array(v1, "args");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = xpc_array_get_count(v3) == 0;

  }
  else
  {
    v2 = 0;
  }

  return (v2 << 8);
}

void sub_24A44FCA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_ENKUlvE_cvU13block_pointerS4_Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  v3 = std::__throw_bad_function_call[abi:nn180100]();
  return __copy_helper_block_ea8_32c177_ZTSKZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_EUlvE_(v3);
}

uint64_t __copy_helper_block_ea8_32c177_ZTSKZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_EUlvE_(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c177_ZTSKZZZN10WebPrivacy6Client17setServerEndpointENS_14ServerEndpointEONSt3__18functionIFvvEEEENK3__0clEvENKUlOT_E_clINS2_8optionalINS_3XPC22SetServerEndpointReplyEEEEEDaS9_EUlvE_(uint64_t a1)
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

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC17SetServerEndpointENS2_22SetServerEndpointReplyEJRKNS_14ServerEndpointEZZNS0_17setServerEndpointES5_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSF_DpOT0_E_clIRKSG_JS7_EEEDaSF_SM__block_invoke();
}

id __copy_helper_block_ea8_32c249_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC17SetServerEndpointENS2_22SetServerEndpointReplyEJRKNS_14ServerEndpointEZZNS0_17setServerEndpointES5_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSF_DpOT0_E_clIRKSG_JS7_EEEDaSF_SM_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c249_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC17SetServerEndpointENS2_22SetServerEndpointReplyEJRKNS_14ServerEndpointEZZNS0_17setServerEndpointES5_ONSt3__18functionIFvvEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSF_DpOT0_E_clIRKSG_JS7_EEEDaSF_SM_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 64);
  if (result == (_QWORD *)(a1 + 40))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 40);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
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

void ___ZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  WebPrivacy::Client *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  WebPrivacy::Client *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _QWORD *v34;
  WebPrivacy::Client *v35;
  _QWORD v36[3];
  _QWORD *v37;
  WebPrivacy::Client *v38;
  _QWORD v39[3];
  _QWORD *v40;
  id v41;
  WebPrivacy::Client *block;
  _QWORD v43[3];
  WebPrivacy::Client *v44;
  _BYTE v45[24];
  _BYTE *v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v1 = *(WebPrivacy::Client **)(a1 + 32);
  v2 = v33;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v33, a1 + 40);
  v3 = *((_QWORD *)v1 + 52);
  if (!v3)
  {
    WebPrivacy::Client::ensureConnection(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(NSObject **)v1;
    v6 = v4;
    v7 = v5;
    v35 = v1;
    v8 = v36;
    if (v34)
    {
      if (v34 == v33)
      {
        v37 = v36;
        (*(void (**)(_QWORD *, _QWORD *))(v33[0] + 24))(v33, v36);
      }
      else
      {
        v37 = v34;
        v34 = 0;
      }
    }
    else
    {
      v37 = 0;
    }
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetStatus>();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v35;
    v10 = v39;
    if (v37)
    {
      if (v37 == v36)
      {
        v40 = v39;
        (*(void (**)(_QWORD *, _QWORD *))(v36[0] + 24))(v36, v39);
        v11 = v40;
      }
      else
      {
        v11 = (_QWORD *)(*(uint64_t (**)(void))(*v37 + 16))();
        v40 = v11;
      }
      block = v38;
      v12 = (WebPrivacy::Client *)v43;
      if (v11)
      {
        if (v11 == v39)
        {
          v44 = (WebPrivacy::Client *)v43;
          (*(void (**)(_QWORD *, _QWORD *))(v39[0] + 24))(v39, v43);
        }
        else
        {
          v44 = (WebPrivacy::Client *)v11;
          v40 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v40 = 0;
      block = v35;
      v12 = (WebPrivacy::Client *)v43;
    }
    v44 = 0;
LABEL_16:
    v13 = malloc_type_malloc(0x48uLL, 0x10E004040E2C6D6uLL);
    v14 = v13;
    *v13 = MEMORY[0x24BDAC758];
    v13[1] = 50331650;
    v13[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_9GetStatusENS8_14GetStatusReplyEJZZNS7_6Client9getStatusEONSt3__18functionIFvRKNSD_6vectorIiNSD_9allocatorIiEEEERKNSF_INS7_10ListStatusENSG_ISL_EEEENS7_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSW_DpOT0_E_clIRKSX_JEEEDaSW_S15_EUlS3_E_EES5_SV_ENUlPvS3_E_8__invokeES1C_S3_;
    v13[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_9GetStatusENS8_14GetStatusReplyEJZZNS7_6Client9getStatusEONSt3__18functionIFvRKNSD_6vectorIiNSD_9allocatorIiEEEERKNSF_INS7_10ListStatusENSG_ISL_EEEENS7_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSW_DpOT0_E_clIRKSX_JEEEDaSW_S15_EUlS3_E_EES5_SV_E10descriptor;
    v13[4] = block;
    if (v44)
    {
      if (v44 == (WebPrivacy::Client *)v43)
      {
        v13[8] = v13 + 5;
        (*(void (**)(_QWORD *))(v43[0] + 24))(v43);
      }
      else
      {
        v13[8] = v44;
        v44 = 0;
      }
    }
    else
    {
      v13[8] = 0;
    }
    v15 = (void *)MEMORY[0x24BD10684](v14);

    if (v44 == (WebPrivacy::Client *)v43)
    {
      v16 = 4;
    }
    else
    {
      if (!v44)
        goto LABEL_26;
      v16 = 5;
      v12 = v44;
    }
    (*(void (**)(WebPrivacy::Client *))(*(_QWORD *)v12 + 8 * v16))(v12);
LABEL_26:
    v17 = (void *)MEMORY[0x24BD10684](v15);
    xpc_connection_send_message_with_reply(v6, v9, v7, v17);

    if (v40 == v39)
    {
      v18 = 4;
    }
    else
    {
      if (!v40)
        goto LABEL_31;
      v18 = 5;
      v10 = v40;
    }
    (*(void (**)(_QWORD *))(*v10 + 8 * v18))(v10);
LABEL_31:

    if (v37 == v36)
    {
      v19 = 4;
    }
    else
    {
      if (!v37)
      {
LABEL_36:

        goto LABEL_37;
      }
      v19 = 5;
      v8 = v37;
    }
    (*(void (**)(_QWORD *))(*v8 + 8 * v19))(v8);
    goto LABEL_36;
  }
  v35 = v1;
  v21 = v36;
  if (v34)
  {
    if (v34 == v33)
    {
      v37 = v36;
      (*(void (**)(_QWORD *, _QWORD *))(v33[0] + 24))(v33, v36);
      v3 = *((_QWORD *)v1 + 52);
    }
    else
    {
      v37 = v34;
      v34 = 0;
    }
  }
  else
  {
    v37 = 0;
  }
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetStatus>();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v24 = *(NSObject **)v1;
  block = (WebPrivacy::Client *)MEMORY[0x24BDAC760];
  v43[0] = 3321888768;
  v43[1] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC9GetStatusENS2_14GetStatusReplyEJZZNS0_9getStatusEONSt3__18functionIFvRKNS5_6vectorIiNS5_9allocatorIiEEEERKNS7_INS_10ListStatusENS8_ISD_EEEENS_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JEEEDaSO_SV__block_invoke;
  v43[2] = &__block_descriptor_80_ea8_32c284_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC9GetStatusENS2_14GetStatusReplyEJZZNS0_9getStatusEONSt3__18functionIFvRKNS5_6vectorIiNS5_9allocatorIiEEEERKNS7_INS_10ListStatusENS8_ISD_EEEENS_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JEEEDaSO_SV_EUlvE__e5_v8__0l;
  v25 = (uint64_t)v37;
  v38 = v35;
  v26 = v39;
  if (!v37)
    goto LABEL_53;
  if (v37 != v36)
  {
    v25 = (*(uint64_t (**)(void))(*v37 + 16))();
LABEL_53:
    v40 = (_QWORD *)v25;
    goto LABEL_55;
  }
  v40 = v39;
  (*(void (**)(_QWORD *, _QWORD *))(v36[0] + 24))(v36, v39);
LABEL_55:
  v27 = v23;
  v41 = v27;
  v28 = (uint64_t)v40;
  v44 = v38;
  v29 = v45;
  if (!v40)
  {
LABEL_58:
    v46 = (_BYTE *)v28;
    goto LABEL_60;
  }
  if (v40 != v39)
  {
    v28 = (*(uint64_t (**)(void))(*v40 + 16))();
    goto LABEL_58;
  }
  v46 = v45;
  (*(void (**)(_QWORD *, _BYTE *))(v39[0] + 24))(v39, v45);
LABEL_60:
  v47 = v41;
  dispatch_async(v24, &block);

  if (v40 == v39)
  {
    v30 = 4;
  }
  else
  {
    if (!v40)
      goto LABEL_65;
    v30 = 5;
    v26 = v40;
  }
  (*(void (**)(_QWORD *))(*v26 + 8 * v30))(v26);
LABEL_65:

  if (v46 == v45)
  {
    v31 = 4;
  }
  else
  {
    if (!v46)
      goto LABEL_70;
    v31 = 5;
    v29 = v46;
  }
  (*(void (**)(_QWORD *))(*v29 + 8 * v31))(v29);
LABEL_70:

  if (v37 == v36)
  {
    v32 = 4;
  }
  else
  {
    if (!v37)
      goto LABEL_37;
    v32 = 5;
    v21 = v37;
  }
  (*(void (**)(_QWORD *))(*v21 + 8 * v32))(v21);
LABEL_37:
  if (v34 == v33)
  {
    v20 = 4;
  }
  else
  {
    if (!v34)
      return;
    v20 = 5;
    v2 = v34;
  }
  (*(void (**)(_QWORD *))(*v2 + 8 * v20))(v2);
}

void sub_24A4503DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,void *a25)
{
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a24 == v28)
  {
    v30 = 4;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v30 = 5;
    v28 = a24;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v30))(v28);
LABEL_6:

  if (a19 == v26)
  {
    v31 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_11;
    v31 = 5;
    v26 = a19;
  }
  (*(void (**)(_QWORD *))(*v26 + 8 * v31))(v26);
LABEL_11:
  if (a14 == v25)
  {
    v32 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_16;
    v32 = 5;
    v25 = a14;
  }
  (*(void (**)(_QWORD *))(*v25 + 8 * v32))(v25);
LABEL_16:
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c155_ZTSKZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_ea8_32c155_ZTSKZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEE3__0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

id WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetStatus>()
{
  xpc_object_t v0;
  xpc_object_t values;

  values = xpc_uint64_create(2uLL);
  v0 = xpc_dictionary_create((const char *const *)&WebPrivacy::messageNameKey, &values, 1uLL);

  return v0;
}

void sub_24A450618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_9GetStatusENS8_14GetStatusReplyEJZZNS7_6Client9getStatusEONSt3__18functionIFvRKNSD_6vectorIiNSD_9allocatorIiEEEERKNSF_INS7_10ListStatusENSG_ISL_EEEENS7_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSW_DpOT0_E_clIRKSX_JEEEDaSW_S15_EUlS3_E_EES5_SV_ENUlPKvE_8__invokeES1D_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

uint64_t _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_9GetStatusENS8_14GetStatusReplyEJZZNS7_6Client9getStatusEONSt3__18functionIFvRKNSD_6vectorIiNSD_9allocatorIiEEEERKNSF_INS7_10ListStatusENSG_ISL_EEEENS7_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSW_DpOT0_E_clIRKSX_JEEEDaSW_S15_EUlS3_E_EES5_SV_ENUlPvS3_E_8__invokeES1C_S3_(uint64_t a1, void *a2)
{
  _BYTE v4[64];

  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetStatusReply>(a2, (uint64_t)v4);
  _ZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_((uint64_t *)(a1 + 32), (uint64_t)v4);
  return std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v4);
}

void sub_24A4506A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t _ZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[64];
  _QWORD v13[3];
  _QWORD *v14;
  _QWORD v15[4];
  _BYTE v16[64];
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t)(a1 + 1);
  v3 = *a1;
  std::__optional_move_base<WebPrivacy::XPC::GetStatusReply,false>::__optional_move_base[abi:nn180100](v12, a2);
  v4 = v13;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v13, v2);
  v5 = *(NSObject **)(v3 + 8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3321888768;
  v15[2] = ___ZZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v15[3] = &__block_descriptor_128_ea8_32c229_ZTSKZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_EUlvE__e5_v8__0l;
  std::__optional_copy_base<WebPrivacy::XPC::GetStatusReply,false>::__optional_copy_base[abi:nn180100](v16, (uint64_t)v12);
  v6 = v17;
  v7 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v7 = (*(uint64_t (**)(void))(*v14 + 16))();
LABEL_4:
    v18 = (_BYTE *)v7;
    goto LABEL_6;
  }
  v18 = v17;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v17);
LABEL_6:
  v8 = (void *)MEMORY[0x24BD10684](v15);
  if (v18 == v17)
  {
    v9 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_11;
    v9 = 5;
    v6 = v18;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v9))(v6);
LABEL_11:
  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v16);
  dispatch_async(v5, v8);

  if (v14 == v13)
  {
    v10 = 4;
    goto LABEL_15;
  }
  if (v14)
  {
    v10 = 5;
    v4 = v14;
LABEL_15:
    (*(void (**)(_QWORD *))(*v4 + 8 * v10))(v4);
  }
  return std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v12);
}

void sub_24A450848(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](v2);
  _ZZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_ENUlvE_D1Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::decode<WebPrivacy::XPC::GetStatusReply>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *__p[2];
  _OWORD v8[2];
  char v9;
  void **v10;

  v3 = a1;
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFA0])
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    *(_OWORD *)__p = 0u;
    xpc_dictionary_get_array(v3, "args");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decode((std::vector<int> *)__p, v4);

    if ((v5 & 1) != 0)
    {
      *(_OWORD *)a2 = *(_OWORD *)__p;
      *(_QWORD *)(a2 + 16) = *(_QWORD *)&v8[0];
      __p[0] = 0;
      __p[1] = 0;
      *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)v8 + 8);
      *(_QWORD *)(a2 + 40) = *((_QWORD *)&v8[1] + 1);
      v8[0] = 0uLL;
      *(_BYTE *)(a2 + 48) = v9;
      v6 = 1;
      v8[1] = 0uLL;
    }
    else
    {
      v6 = 0;
      *(_BYTE *)a2 = 0;
    }
    *(_BYTE *)(a2 + 56) = v6;
    v10 = (void **)v8 + 1;
    std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v10);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 56) = 0;
  }

}

void sub_24A450988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  WebPrivacy::XPC::GetStatusReply::~GetStatusReply((WebPrivacy::XPC::GetStatusReply *)&a9);
  _Unwind_Resume(a1);
}

uint64_t _ZZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_ENUlvE_D1Ev(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 64);
  v3 = *(_QWORD **)(a1 + 88);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](a1);
}

void ___ZZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3[3];
  void *__p;
  void *v5;
  uint64_t v6;
  char v7;
  void **v8;

  if (*(_BYTE *)(a1 + 88))
  {
    LOBYTE(__p) = *(_BYTE *)(a1 + 80);
    v1 = *(_QWORD *)(a1 + 120);
    if (v1)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, void **))(*(_QWORD *)v1 + 48))(*(_QWORD *)(a1 + 120), a1 + 32, a1 + 56, &__p);
      return;
    }
    std::__throw_bad_function_call[abi:nn180100]();
    goto LABEL_9;
  }
  __p = 0;
  v5 = 0;
  v6 = 0;
  memset(v3, 0, sizeof(v3));
  v7 = 0;
  v2 = *(_QWORD *)(a1 + 120);
  if (!v2)
  {
LABEL_9:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  (*(void (**)(uint64_t, void **, void **, char *))(*(_QWORD *)v2 + 48))(v2, &__p, v3, &v7);
  v8 = v3;
  std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v8);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
}

void sub_24A450ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  uint64_t v13;

  *(_QWORD *)(v13 - 24) = &a9;
  std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100]((void ***)(v13 - 24));
  if (__p)
  {
    a13 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c229_ZTSKZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_EUlvE_(uint64_t a1, uint64_t a2)
{
  std::__optional_copy_base<WebPrivacy::XPC::GetStatusReply,false>::__optional_copy_base[abi:nn180100]((_BYTE *)(a1 + 32), a2 + 32);
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 96, a2 + 96);
}

void sub_24A450B2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __destroy_helper_block_ea8_32c229_ZTSKZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_EUlvE_(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 96);
  v3 = *(_QWORD **)(a1 + 120);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](a1 + 32);
}

void std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<WebPrivacy::ListStatus>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<WebPrivacy::ListStatus>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 48)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

_BYTE *std::__optional_copy_base<WebPrivacy::XPC::GetStatusReply,false>::__optional_copy_base[abi:nn180100](_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[56] = 0;
  if (*(_BYTE *)(a2 + 56))
  {
    std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::__tuple_impl((uint64_t)a1, a2);
    a1[56] = 1;
  }
  return a1;
}

void sub_24A450C5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::__tuple_impl(uint64_t a1, uint64_t a2)
{
  std::vector<int> *v4;

  v4 = std::vector<int>::vector((std::vector<int> *)a1, (const std::vector<int> *)a2);
  v4[1].__begin_ = 0;
  v4[1].__end_ = 0;
  ++v4;
  v4->__end_cap_.__value_ = 0;
  std::vector<WebPrivacy::ListStatus>::__init_with_size[abi:nn180100]<WebPrivacy::ListStatus*,WebPrivacy::ListStatus*>(v4, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24)) >> 4));
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

void sub_24A450CC4(_Unwind_Exception *exception_object)
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

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, const std::vector<int> *__x)
{
  int *end;
  std::vector<int>::pointer begin;
  int64_t v5;
  std::vector<int>::pointer v6;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  begin = __x->__begin_;
  end = __x->__end_;
  v5 = (char *)end - (char *)__x->__begin_;
  if (end != __x->__begin_)
  {
    std::vector<int>::__vallocate[abi:nn180100](this, v5 >> 2);
    v6 = this->__end_;
    memmove(v6, begin, v5);
    this->__end_ = (std::vector<int>::pointer)((char *)v6 + v5);
  }
  return this;
}

char *std::vector<int>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    abort();
  result = (char *)std::allocator<int>::allocate_at_least[abi:nn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::allocator<int>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(4 * a2);
}

_QWORD *std::vector<WebPrivacy::ListStatus>::__init_with_size[abi:nn180100]<WebPrivacy::ListStatus*,WebPrivacy::ListStatus*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;

  if (a4)
  {
    v6 = (uint64_t)result;
    std::vector<WebPrivacy::ListStatus>::__vallocate[abi:nn180100](result, a4);
    return (_QWORD *)std::vector<WebPrivacy::ListStatus>::__construct_at_end<WebPrivacy::ListStatus*,WebPrivacy::ListStatus*>(v6, a2, a3);
  }
  return result;
}

char *std::vector<WebPrivacy::ListStatus>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    abort();
  result = (char *)std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

uint64_t std::vector<WebPrivacy::ListStatus>::__construct_at_end<WebPrivacy::ListStatus*,WebPrivacy::ListStatus*>(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;

  v3 = result;
  v4 = *(_QWORD *)(result + 8);
  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      result = std::construct_at[abi:nn180100]<WebPrivacy::ListStatus,WebPrivacy::ListStatus&,WebPrivacy::ListStatus*>(v4 + v7, a2 + v7);
      v7 += 48;
    }
    while (a2 + v7 != a3);
    v4 += v7;
  }
  *(_QWORD *)(v3 + 8) = v4;
  return result;
}

void sub_24A450EB8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(48 * a2);
}

uint64_t std::construct_at[abi:nn180100]<WebPrivacy::ListStatus,WebPrivacy::ListStatus&,WebPrivacy::ListStatus*>(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (std::string *)(a1 + 16);
  if (*(char *)(a2 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 16), *(_QWORD *)(a2 + 24));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 32);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](uint64_t a1)
{
  void *v2;
  void **v4;

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = (void **)(a1 + 24);
    std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v4);
    v2 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v2;
      operator delete(v2);
    }
  }
  return a1;
}

void WebPrivacy::XPC::GetStatusReply::~GetStatusReply(WebPrivacy::XPC::GetStatusReply *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 24);
  std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v3);
  v2 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v2;
    operator delete(v2);
  }
}

_BYTE *std::__optional_move_base<WebPrivacy::XPC::GetStatusReply,false>::__optional_move_base[abi:nn180100](_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[56] = 0;
  std::__optional_storage_base<WebPrivacy::XPC::GetStatusReply,false>::__construct_from[abi:nn180100]<std::__optional_move_base<WebPrivacy::XPC::GetStatusReply,false>>((uint64_t)a1, a2);
  return a1;
}

void sub_24A4510AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

__n128 std::__optional_storage_base<WebPrivacy::XPC::GetStatusReply,false>::__construct_from[abi:nn180100]<std::__optional_move_base<WebPrivacy::XPC::GetStatusReply,false>>(uint64_t a1, uint64_t a2)
{
  __n128 result;

  if (*(_BYTE *)(a2 + 56))
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    result = *(__n128 *)(a2 + 24);
    *(__n128 *)(a1 + 24) = result;
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    *(_BYTE *)(a1 + 56) = 1;
  }
  return result;
}

uint64_t WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decode(std::vector<int> *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (xpc_array_get_count(v3) == 3)
    v4 = WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<0u>(a1, v3);
  else
    v4 = 0;

  return v4;
}

void sub_24A45116C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<0u>(std::vector<int> *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  std::vector<int>::size_type v8;
  size_t count;
  uint64_t v10;
  BOOL v12;
  size_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  int64_t int64;
  int v19;
  int *value;
  std::vector<int>::pointer end;
  int *v22;
  std::vector<int>::pointer begin;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  int *v29;
  int v30;
  uint64_t v31;

  v3 = a2;
  v4 = v3;
  if (!xpc_array_get_count(v3))
    goto LABEL_8;
  xpc_array_get_value(v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BD10858]();
  v7 = MEMORY[0x24BDACF78];

  if (v6 != v7)
  {
LABEL_9:

    goto LABEL_10;
  }
  xpc_array_get_array(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  if ((WebPrivacy::XPC::decode(v4, &v31, 0) & 1) == 0
    || (v8 = v31, v31 > 0xFFFFFFFE)
    || (count = xpc_array_get_count(v4), count != v8 + 1))
  {
LABEL_8:

    goto LABEL_9;
  }
  std::vector<int>::reserve(a1, v8);
  if (count < 2)
  {
LABEL_7:

LABEL_36:
    v10 = WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<1u>((uint64_t)a1, v3);
    goto LABEL_11;
  }
  v12 = 0;
  v13 = 1;
  v14 = MEMORY[0x24BDACFD0];
  while (1)
  {
    v15 = v4;
    if (xpc_array_get_count(v15) <= v13)
      break;
    xpc_array_get_value(v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BD10858]();

    if (v17 != v14)
      goto LABEL_35;
    int64 = xpc_array_get_int64(v15, v13);
    v19 = int64;
    if (int64 != (int)int64)
      goto LABEL_35;

    end = a1->__end_;
    value = a1->__end_cap_.__value_;
    if (end >= value)
    {
      begin = a1->__begin_;
      v24 = end - a1->__begin_;
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 62)
        abort();
      v26 = (char *)value - (char *)begin;
      if (v26 >> 1 > v25)
        v25 = v26 >> 1;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
        v27 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v27 = v25;
      if (v27)
      {
        v28 = (char *)std::allocator<int>::allocate_at_least[abi:nn180100]((uint64_t)&a1->__end_cap_, v27);
        begin = a1->__begin_;
        end = a1->__end_;
      }
      else
      {
        v28 = 0;
      }
      v29 = (int *)&v28[4 * v24];
      *v29 = v19;
      v22 = v29 + 1;
      while (end != begin)
      {
        v30 = *--end;
        *--v29 = v30;
      }
      a1->__begin_ = v29;
      a1->__end_ = v22;
      a1->__end_cap_.__value_ = (int *)&v28[4 * v27];
      if (begin)
        operator delete(begin);
    }
    else
    {
      *end = v19;
      v22 = end + 1;
    }
    a1->__end_ = v22;
    v12 = ++v13 >= count;
    if (v13 == count)
      goto LABEL_7;
  }

LABEL_35:
  if (v12)
    goto LABEL_36;
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

void sub_24A4513F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<1u>(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  size_t count;
  uint64_t v10;
  BOOL v12;
  size_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  int uint64;
  id v21;
  void *v22;
  uint64_t v23;
  char *string;
  id v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  size_t v29;
  void *v30;
  _BYTE v31[8];
  uint64_t v32[4];
  double v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v3 = a2;
  v4 = v3;
  if (xpc_array_get_count(v3) < 2)
    goto LABEL_8;
  xpc_array_get_value(v3, 1uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BD10858]();
  v7 = MEMORY[0x24BDACF78];

  if (v6 != v7)
  {
LABEL_9:

    goto LABEL_10;
  }
  xpc_array_get_array(v3, 1uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  if ((WebPrivacy::XPC::decode(v4, &v34, 0) & 1) == 0
    || (v8 = v34, v34 > 0xFFFFFFFE)
    || (count = xpc_array_get_count(v4), count != v8 + 1))
  {
LABEL_8:

    goto LABEL_9;
  }
  std::vector<WebPrivacy::ListStatus>::reserve((char **)(a1 + 24), v8);
  v29 = count;
  if (count < 2)
  {
LABEL_7:

LABEL_36:
    v10 = WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<2u>(a1, v3);
    goto LABEL_11;
  }
  v12 = 0;
  v13 = 1;
  while (1)
  {
    v33 = 0.0;
    memset(v32, 0, sizeof(v32));
    v14 = v4;
    v28 = v12;
    if (xpc_array_get_count(v14) <= v13)
    {
      v17 = v14;
      goto LABEL_32;
    }
    xpc_array_get_value(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BD10858]();

    if (v16 != v7)
      goto LABEL_33;
    xpc_array_get_array(v14, v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (xpc_array_get_count(v30) != 4)
      break;
    v17 = v30;
    if (!xpc_array_get_count(v17))
      goto LABEL_30;
    xpc_array_get_value(v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BD10858]();

    if (v19 != MEMORY[0x24BDACFF8])
      goto LABEL_31;
    uint64 = xpc_array_get_uint64(v17, 0);
    if ((uint64 - 1) >= 8)
      goto LABEL_31;
    v31[0] = uint64;

    if (!WebPrivacy::XPC::decode(v17, v32, 1uLL))
      goto LABEL_32;
    v21 = v17;
    if (xpc_array_get_count(v21) < 3)
      goto LABEL_30;
    xpc_array_get_value(v21, 2uLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BD10858]();

    if (v23 != MEMORY[0x24BDACFF0])
      goto LABEL_31;
    string = (char *)xpc_array_get_string(v21, 2uLL);
    std::string::basic_string[abi:nn180100]<0>(&v35, string);
    if (SHIBYTE(v32[3]) < 0)
      operator delete((void *)v32[1]);
    *(_OWORD *)&v32[1] = v35;
    v32[3] = v36;

    v25 = v21;
    if (xpc_array_get_count(v25) < 4)
    {
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    xpc_array_get_value(v25, 3uLL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BD10858]();

    if (v27 != MEMORY[0x24BDACFA8])
      goto LABEL_31;
    v33 = xpc_array_get_double(v25, 3uLL);

    std::vector<WebPrivacy::ListStatus>::push_back[abi:nn180100]((char **)(a1 + 24), (uint64_t)v31);
    if (SHIBYTE(v32[3]) < 0)
      operator delete((void *)v32[1]);
    v12 = ++v13 >= v29;
    if (v29 == v13)
      goto LABEL_7;
  }
  v17 = v30;
LABEL_32:

  v12 = v28;
LABEL_33:

  if (SHIBYTE(v32[3]) < 0)
    operator delete((void *)v32[1]);

  if (v12)
    goto LABEL_36;
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

void sub_24A451820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::decode(void *a1, uint64_t *a2, size_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a1;
  if (xpc_array_get_count(v5) <= a3)
  {

    goto LABEL_5;
  }
  xpc_array_get_value(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BD10858]();
  v8 = MEMORY[0x24BDACFF8];

  if (v7 != v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  *a2 = xpc_array_get_uint64(v5, a3);
  v9 = 1;
LABEL_6:

  return v9;
}

void sub_24A4519A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *value;
  int64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  std::vector<int>::pointer begin;
  int *end;
  int *v12;
  int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      abort();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::allocator<int>::allocate_at_least[abi:nn180100]((uint64_t)p_end_cap, __n);
    v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

uint64_t WebPrivacy::XPC::Message<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>::decodeOne<2u>(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 uint64;
  uint64_t v8;

  v3 = a2;
  if (xpc_array_get_count(v3) <= 2)
  {

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  xpc_array_get_value(v3, 2uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BD10858]();
  v6 = MEMORY[0x24BDACFF8];

  if (v5 != v6)
    goto LABEL_6;
  uint64 = xpc_array_get_uint64(v3, 2uLL);
  if (uint64 >= 4u)
    goto LABEL_6;
  *(_BYTE *)(a1 + 48) = uint64;
  v8 = 1;
LABEL_7:

  return v8;
}

void sub_24A451B14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::vector<WebPrivacy::ListStatus>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556)
      abort();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](result, a2);
    v9 = *a1;
    v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      v12 = vdupq_n_s64(v8);
      v10 = &v6[v5];
    }
    else
    {
      v10 = &v6[v5];
      do
      {
        *((_OWORD *)v10 - 3) = *(_OWORD *)(v8 - 48);
        v11 = *(_OWORD *)(v8 - 32);
        *((_QWORD *)v10 - 2) = *(_QWORD *)(v8 - 16);
        *((_OWORD *)v10 - 2) = v11;
        *(_QWORD *)(v8 - 24) = 0;
        *(_QWORD *)(v8 - 16) = 0;
        *(_QWORD *)(v8 - 32) = 0;
        *((_QWORD *)v10 - 1) = *(_QWORD *)(v8 - 8);
        v10 -= 48;
        v8 -= 48;
      }
      while ((char *)v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[48 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

uint64_t std::vector<WebPrivacy::ListStatus>::push_back[abi:nn180100](char **a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  unint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  int64x2_t v22;
  char *v23;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  uint64_t v27;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 4);
    v11 = v10 + 1;
    if (v10 + 1 > 0x555555555555555)
      abort();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x2AAAAAAAAAAAAAALL)
      v13 = 0x555555555555555;
    else
      v13 = v11;
    v27 = result;
    v14 = (char *)std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](result, v13);
    v16 = &v14[48 * v10];
    *(_OWORD *)v16 = *(_OWORD *)a2;
    v17 = *(_OWORD *)(a2 + 16);
    *((_QWORD *)v16 + 4) = *(_QWORD *)(a2 + 32);
    *((_OWORD *)v16 + 1) = v17;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *((_QWORD *)v16 + 5) = *(_QWORD *)(a2 + 40);
    v19 = *a1;
    v18 = (unint64_t)a1[1];
    if ((char *)v18 == *a1)
    {
      v22 = vdupq_n_s64(v18);
      v20 = &v14[48 * v10];
    }
    else
    {
      v20 = &v14[48 * v10];
      do
      {
        *((_OWORD *)v20 - 3) = *(_OWORD *)(v18 - 48);
        v21 = *(_OWORD *)(v18 - 32);
        *((_QWORD *)v20 - 2) = *(_QWORD *)(v18 - 16);
        *((_OWORD *)v20 - 2) = v21;
        *(_QWORD *)(v18 - 24) = 0;
        *(_QWORD *)(v18 - 16) = 0;
        *(_QWORD *)(v18 - 32) = 0;
        *((_QWORD *)v20 - 1) = *(_QWORD *)(v18 - 8);
        v20 -= 48;
        v18 -= 48;
      }
      while ((char *)v18 != v19);
      v22 = *(int64x2_t *)a1;
    }
    v9 = v16 + 48;
    *a1 = v20;
    a1[1] = v16 + 48;
    v25 = v22;
    v23 = a1[2];
    a1[2] = &v14[48 * v15];
    v26 = v23;
    v24 = v22.i64[0];
    result = std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v8 = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(v7 + 32) = *(_QWORD *)(a2 + 32);
    *(_OWORD *)(v7 + 16) = v8;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(v7 + 40) = *(_QWORD *)(a2 + 40);
    v9 = (char *)(v7 + 48);
  }
  a1[1] = v9;
  return result;
}

uint64_t std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<WebPrivacy::ListStatus>::__destruct_at_end[abi:nn180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<WebPrivacy::ListStatus>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 48;
      *(_QWORD *)(a1 + 16) = v2 - 48;
      if (*(char *)(v2 - 9) < 0)
      {
        operator delete(*(void **)(v2 - 32));
        v5 = *(_QWORD *)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC9GetStatusENS2_14GetStatusReplyEJZZNS0_9getStatusEONSt3__18functionIFvRKNS5_6vectorIiNS5_9allocatorIiEEEERKNS7_INS_10ListStatusENS8_ISD_EEEENS_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JEEEDaSO_SV__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  _BYTE v3[64];

  v1 = (uint64_t *)(a1 + 32);
  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetStatusReply>(*(void **)(a1 + 72), (uint64_t)v3);
  _ZZZN10WebPrivacy6Client9getStatusEONSt3__18functionIFvRKNS1_6vectorIiNS1_9allocatorIiEEEERKNS3_INS_10ListStatusENS4_IS9_EEEENS_14ServerEndpointEEEEENK3__0clEvENKUlOT_E_clINS1_8optionalINS_3XPC14GetStatusReplyEEEEEDaSK_(v1, (uint64_t)v3);
  return std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v3);
}

void sub_24A451E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__optional_destruct_base<WebPrivacy::XPC::GetStatusReply,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c284_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC9GetStatusENS2_14GetStatusReplyEJZZNS0_9getStatusEONSt3__18functionIFvRKNS5_6vectorIiNS5_9allocatorIiEEEERKNS7_INS_10ListStatusENS8_ISD_EEEENS_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JEEEDaSO_SV_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c284_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC9GetStatusENS2_14GetStatusReplyEJZZNS0_9getStatusEONSt3__18functionIFvRKNS5_6vectorIiNS5_9allocatorIiEEEERKNS7_INS_10ListStatusENS8_ISD_EEEENS_14ServerEndpointEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JEEEDaSO_SV_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 64);
  if (result == (_QWORD *)(a1 + 40))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 40);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void ___ZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  WebPrivacy::Client *v2;
  __int128 *v3;
  _QWORD *v4;
  _BYTE *v5;
  void *v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  void **v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  WebPrivacy::Client *v36;
  _BYTE v37[24];
  _BYTE *v38;
  void **v39;
  void *v40[2];
  char v41;
  void **v42;
  _QWORD v43[3];
  _QWORD *v44;
  void **v45;
  _QWORD v46[3];
  _QWORD *v47;
  id v48;
  uint64_t block;
  void *__p[2];
  void *v51;
  void **v52;
  _QWORD v53[3];
  _QWORD *v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v2 = *(WebPrivacy::Client **)(a1 + 32);
  v3 = (__int128 *)WebPrivacy::Client::clientNameForUserAgent(v2);
  v36 = v2;
  v4 = v37;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v37, a1 + 48);
  v5 = (_BYTE *)(a1 + 40);
  if (!*((_QWORD *)v2 + 52))
  {
    WebPrivacy::Client::ensureConnection(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(NSObject **)v2;
    v8 = v6;
    v9 = v7;
    _ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client10updateListES2_ONS_8functionIFvNS9_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SJ_ELi0EEEDpOT_((uint64_t)&block, v5, v3, &v36);
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>((unsigned __int8 *)&block, (uint64_t)__p);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v52;
    v11 = v46;
    v12 = v53;
    if (v54)
    {
      if (v54 == v53)
      {
        v47 = v46;
        (*(void (**)(_QWORD *, _QWORD *))(v53[0] + 24))(v53, v46);
        v13 = v47;
      }
      else
      {
        v13 = (_QWORD *)(*(uint64_t (**)(void))(*v54 + 16))();
        v47 = v13;
      }
      v39 = v45;
      v14 = v40;
      if (v13)
      {
        if (v13 == v46)
        {
          v42 = v40;
          (*(void (**)(_QWORD *, void **))(v46[0] + 24))(v46, v40);
        }
        else
        {
          v42 = (void **)v13;
          v47 = 0;
        }
        goto LABEL_11;
      }
    }
    else
    {
      v47 = 0;
      v39 = v52;
      v14 = v40;
    }
    v42 = 0;
LABEL_11:
    v15 = malloc_type_malloc(0x48uLL, 0x10E004040E2C6D6uLL);
    v16 = v15;
    *v15 = MEMORY[0x24BDAC758];
    v15[1] = 50331650;
    v15[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client10updateListESD_ONSF_8functionIFvNS7_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSV_DpOT0_E_clIRKSW_JRSE_RSM_EEEDaSV_S14_EUlS3_E_EES5_SU_ENUlPvS3_E_8__invokeES1D_S3_;
    v15[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client10updateListESD_ONSF_8functionIFvNS7_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSV_DpOT0_E_clIRKSW_JRSE_RSM_EEEDaSV_S14_EUlS3_E_EES5_SU_E10descriptor;
    v15[4] = v39;
    if (v42)
    {
      if (v42 == v40)
      {
        v15[8] = v15 + 5;
        (*((void (**)(void **))v40[0] + 3))(v40);
      }
      else
      {
        v15[8] = v42;
        v42 = 0;
      }
    }
    else
    {
      v15[8] = 0;
    }
    v17 = (void *)MEMORY[0x24BD10684](v16);

    if (v42 == v40)
    {
      v18 = 4;
    }
    else
    {
      if (!v42)
        goto LABEL_21;
      v18 = 5;
      v14 = v42;
    }
    (*((void (**)(void **))*v14 + v18))(v14);
LABEL_21:
    v19 = (void *)MEMORY[0x24BD10684](v17);
    xpc_connection_send_message_with_reply(v8, v10, v9, v19);

    if (v47 == v46)
    {
      v20 = 4;
    }
    else
    {
      if (!v47)
        goto LABEL_26;
      v20 = 5;
      v11 = v47;
    }
    (*(void (**)(_QWORD *))(*v11 + 8 * v20))(v11);
LABEL_26:

    if (v54 == v53)
    {
      v21 = 4;
    }
    else
    {
      if (!v54)
      {
LABEL_31:
        if (SHIBYTE(v51) < 0)
          operator delete(__p[0]);

        goto LABEL_34;
      }
      v21 = 5;
      v12 = v54;
    }
    (*(void (**)(_QWORD *))(*v12 + 8 * v21))(v12);
    goto LABEL_31;
  }
  _ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client10updateListES2_ONS_8functionIFvNS9_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SJ_ELi0EEEDpOT_((uint64_t)&v39, v5, v3, &v36);
  v23 = *((_QWORD *)v2 + 52);
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>((unsigned __int8 *)&v39, (uint64_t)v40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v26 = *(NSObject **)v2;
  block = MEMORY[0x24BDAC760];
  __p[0] = (void *)3321888768;
  __p[1] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_10updateListES6_ONS9_8functionIFvNS_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSP_DpOT0_E_clIRKSQ_JS8_SH_EEEDaSP_SW__block_invoke;
  v51 = &__block_descriptor_80_ea8_32c313_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_10updateListES6_ONS9_8functionIFvNS_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSP_DpOT0_E_clIRKSQ_JS8_SH_EEEDaSP_SW_EUlvE__e5_v8__0l;
  v27 = (uint64_t)v44;
  v45 = v42;
  v28 = v46;
  v29 = v43;
  if (!v44)
    goto LABEL_45;
  if (v44 != v43)
  {
    v27 = (*(uint64_t (**)(void))(*v44 + 16))();
LABEL_45:
    v47 = (_QWORD *)v27;
    goto LABEL_47;
  }
  v47 = v46;
  (*(void (**)(_QWORD *, _QWORD *))(v43[0] + 24))(v43, v46);
LABEL_47:
  v30 = v25;
  v48 = v30;
  v31 = (uint64_t)v47;
  v52 = v45;
  v32 = v53;
  if (!v47)
  {
LABEL_50:
    v54 = (_QWORD *)v31;
    goto LABEL_52;
  }
  if (v47 != v46)
  {
    v31 = (*(uint64_t (**)(void))(*v47 + 16))();
    goto LABEL_50;
  }
  v54 = v53;
  (*(void (**)(_QWORD *, _QWORD *))(v46[0] + 24))(v46, v53);
LABEL_52:
  v55 = v48;
  dispatch_async(v26, &block);

  if (v47 == v46)
  {
    v33 = 4;
  }
  else
  {
    if (!v47)
      goto LABEL_57;
    v33 = 5;
    v28 = v47;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v33))(v28);
LABEL_57:

  if (v54 == v53)
  {
    v34 = 4;
  }
  else
  {
    if (!v54)
      goto LABEL_62;
    v34 = 5;
    v32 = v54;
  }
  (*(void (**)(_QWORD *))(*v32 + 8 * v34))(v32);
LABEL_62:

  if (v44 == v43)
  {
    v35 = 4;
  }
  else
  {
    if (!v44)
      goto LABEL_67;
    v35 = 5;
    v29 = v44;
  }
  (*(void (**)(_QWORD *))(*v29 + 8 * v35))(v29);
LABEL_67:
  if (v41 < 0)
    operator delete(v40[0]);
LABEL_34:
  if (v38 == v37)
  {
    v22 = 4;
  }
  else
  {
    if (!v38)
      return;
    v22 = 5;
    v4 = v38;
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v22))(v4);
}

void sub_24A4524A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,_QWORD *a31,void *a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  _QWORD *v44;
  void *v45;
  _QWORD *v46;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  if (a31 == v46)
  {
    v48 = 4;
  }
  else
  {
    if (!a31)
      goto LABEL_6;
    v48 = 5;
    v46 = a31;
  }
  (*(void (**)(_QWORD *))(*v46 + 8 * v48))(v46);
LABEL_6:

  v49 = a26;
  if (a26 == &a23)
  {
    v50 = 4;
    v49 = &a23;
  }
  else
  {
    if (!a26)
      goto LABEL_11;
    v50 = 5;
  }
  (*(void (**)(void))(*v49 + 8 * v50))();
LABEL_11:
  if (a21 < 0)
    operator delete(__p);
  if (a14 == v44)
  {
    v51 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_18;
    v51 = 5;
    v44 = a14;
  }
  (*(void (**)(_QWORD *))(*v44 + 8 * v51))(v44);
LABEL_18:
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c107_ZTSKZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v2;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
}

_QWORD *__destroy_helper_block_ea8_32c107_ZTSKZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEE3__0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
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

uint64_t _ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client10updateListES2_ONS_8functionIFvNS9_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SJ_ELi0EEEDpOT_(uint64_t a1, _BYTE *a2, __int128 *a3, _QWORD *a4)
{
  std::string *v6;
  __int128 v7;
  _QWORD *v8;

  *(_BYTE *)a1 = *a2;
  v6 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    v6->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_QWORD *)(a1 + 32) = *a4;
  v8 = (_QWORD *)a4[4];
  if (v8)
  {
    if (v8 == a4 + 1)
    {
      *(_QWORD *)(a1 + 64) = a1 + 40;
      (*(void (**)(_QWORD))(*(_QWORD *)a4[4] + 24))(a4[4]);
    }
    else
    {
      *(_QWORD *)(a1 + 64) = v8;
      a4[4] = 0;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 64) = 0;
  }
  return a1;
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client10updateListESD_ONSF_8functionIFvNS7_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSV_DpOT0_E_clIRKSW_JRSE_RSM_EEEDaSV_S14_EUlS3_E_EES5_SU_ENUlPKvE_8__invokeES1E_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client10updateListESD_ONSF_8functionIFvNS7_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSV_DpOT0_E_clIRKSW_JRSE_RSM_EEEDaSV_S14_EUlS3_E_EES5_SU_ENUlPvS3_E_8__invokeES1D_S3_(uint64_t a1, void *a2)
{
  id v3;
  __int16 updated;

  v3 = a2;
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(v3);
  _ZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_((uint64_t *)(a1 + 32), &updated);

}

void sub_24A4527F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void _ZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_(uint64_t *a1, __int16 *a2)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  _QWORD v11[3];
  _QWORD *v12;
  _QWORD v13[4];
  __int16 v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v10 = *a2;
  v3 = v11;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v11, (uint64_t)(a1 + 1));
  v4 = *(NSObject **)(v2 + 8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3321888768;
  v13[2] = ___ZZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v13[3] = &__block_descriptor_72_ea8_32c182_ZTSKZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_EUlvE__e5_v8__0l;
  v14 = v10;
  v5 = v15;
  v6 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  if (v12 != v11)
  {
    v6 = (*(uint64_t (**)(void))(*v12 + 16))();
LABEL_4:
    v16 = (_BYTE *)v6;
    goto LABEL_6;
  }
  v16 = v15;
  (*(void (**)(_QWORD *, _BYTE *))(v11[0] + 24))(v11, v15);
LABEL_6:
  v7 = (void *)MEMORY[0x24BD10684](v13);
  if (v16 == v15)
  {
    v8 = 4;
  }
  else
  {
    if (!v16)
      goto LABEL_11;
    v8 = 5;
    v5 = v16;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v8))(v5);
LABEL_11:
  dispatch_async(v4, v7);

  if (v12 == v11)
  {
    v9 = 4;
  }
  else
  {
    if (!v12)
      return;
    v9 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v9))(v3);
}

void sub_24A452988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  _QWORD *v14;
  uint64_t v16;

  if (a14 == v14)
  {
    v16 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v16 = 5;
    v14 = a14;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ___ZZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v5;

  if (*(_BYTE *)(a1 + 33))
  {
    v1 = *(_QWORD *)(a1 + 64);
    if (v1)
    {
      v2 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 48);
      return v2();
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      v2 = *(uint64_t (**)(void))(*(_QWORD *)v3 + 48);
      return v2();
    }
  }
  v5 = std::__throw_bad_function_call[abi:nn180100]();
  return __copy_helper_block_ea8_32c182_ZTSKZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_EUlvE_(v5);
}

uint64_t __copy_helper_block_ea8_32c182_ZTSKZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_EUlvE_(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_ea8_32c182_ZTSKZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_EUlvE_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_10updateListES6_ONS9_8functionIFvNS_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSP_DpOT0_E_clIRKSQ_JS8_SH_EEEDaSP_SW__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  __int16 updated;

  v1 = (uint64_t *)(a1 + 32);
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(*(void **)(a1 + 72));
  _ZZZN10WebPrivacy6Client10updateListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15UpdateListReplyEEEEEDaSB_(v1, &updated);
}

id __copy_helper_block_ea8_32c313_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_10updateListES6_ONS9_8functionIFvNS_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSP_DpOT0_E_clIRKSQ_JS8_SH_EEEDaSP_SW_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c313_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_10updateListES6_ONS9_8functionIFvNS_12MessageErrorEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSP_DpOT0_E_clIRKSQ_JS8_SH_EEEDaSP_SW_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 64);
  if (result == (_QWORD *)(a1 + 40))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 40);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void ___ZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  char v2;
  _BYTE *v3;
  WebPrivacy::Client *v4;
  _QWORD *v5;
  __int128 *v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  _BYTE v45[24];
  _BYTE *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[3];
  _QWORD *v50;
  uint64_t v51;
  void *__p;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD v57[3];
  _QWORD *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[3];
  _QWORD *v62;
  id v63;
  uint64_t block;
  void *v65[2];
  void *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[3];
  _QWORD *v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = (_BYTE *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 32);
  v4 = *(WebPrivacy::Client **)(a1 + 40);
  v47 = (uint64_t)v4;
  v48 = v2;
  v5 = v49;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v49, a1 + 56);
  if (!*(_BYTE *)(a1 + 48))
  {
    WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()((uint64_t)&v47, 0);
    goto LABEL_46;
  }
  v6 = (__int128 *)WebPrivacy::Client::clientNameForUserAgent(v4);
  v43 = v47;
  v44 = v48;
  v7 = v45;
  if (v50)
  {
    if (v50 == v49)
    {
      v46 = v45;
      (*(void (**)(_QWORD *, _BYTE *))(v49[0] + 24))(v49, v45);
    }
    else
    {
      v46 = v50;
      v50 = 0;
    }
  }
  else
  {
    v46 = 0;
  }
  if (!*((_QWORD *)v4 + 52))
  {
    WebPrivacy::Client::ensureConnection(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(NSObject **)v4;
    v10 = v8;
    v11 = v9;
    v12 = (unsigned __int8 *)_ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client7getListES2_ONS9_18ListRequestOptionsEONS_8functionIFvNS9_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SP_ELi0EEEDpOT_((uint64_t)&block, v3, v6, &v43);
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>(v12, (uint64_t)v65);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v67;
    v60 = v68;
    v15 = v61;
    v16 = v69;
    if (v70)
    {
      if (v70 == v69)
      {
        v62 = v61;
        (*(void (**)(_QWORD *, _QWORD *))(v69[0] + 24))(v69, v61);
        v17 = v62;
      }
      else
      {
        v17 = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*v70 + 16))(v70, v13);
        v62 = v17;
      }
      v51 = v59;
      LOBYTE(__p) = v60;
      v18 = &v53;
      if (v17)
      {
        if (v17 == v61)
        {
          v56 = &v53;
          (*(void (**)(_QWORD *, uint64_t *))(v61[0] + 24))(v61, &v53);
        }
        else
        {
          v56 = v17;
          v62 = 0;
        }
        goto LABEL_18;
      }
    }
    else
    {
      v62 = 0;
      v51 = v67;
      LOBYTE(__p) = v68;
      v18 = &v53;
    }
    v56 = 0;
LABEL_18:
    v19 = (char *)malloc_type_malloc(0x50uLL, 0x10E00404ACE56F5uLL);
    v20 = v19;
    *(_QWORD *)v19 = MEMORY[0x24BDAC758];
    *((_QWORD *)v19 + 1) = 50331650;
    *((_QWORD *)v19 + 2) = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSF_8functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlS10_DpOT0_E_clIRKS11_JRSE_RSM_EEEDaS10_S19_EUlS3_E_EES5_SZ_ENUlPvS3_E_8__invokeES1I_S3_;
    *((_QWORD *)v19 + 3) = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSF_8functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlS10_DpOT0_E_clIRKS11_JRSE_RSM_EEEDaS10_S19_EUlS3_E_EES5_SZ_E10descriptor;
    *((_QWORD *)v19 + 4) = v51;
    v19[40] = (char)__p;
    if (v56)
    {
      if (v56 == &v53)
      {
        *((_QWORD *)v19 + 9) = v19 + 48;
        (*(void (**)(uint64_t *))(v53 + 24))(&v53);
      }
      else
      {
        *((_QWORD *)v19 + 9) = v56;
        v56 = 0;
      }
    }
    else
    {
      *((_QWORD *)v19 + 9) = 0;
    }
    v21 = (void *)MEMORY[0x24BD10684](v20);

    if (v56 == &v53)
    {
      v22 = 4;
    }
    else
    {
      if (!v56)
        goto LABEL_28;
      v22 = 5;
      v18 = v56;
    }
    (*(void (**)(uint64_t *))(*v18 + 8 * v22))(v18);
LABEL_28:
    v23 = (void *)MEMORY[0x24BD10684](v21);
    xpc_connection_send_message_with_reply(v10, v14, v11, v23);

    if (v62 == v61)
    {
      v24 = 4;
    }
    else
    {
      if (!v62)
        goto LABEL_33;
      v24 = 5;
      v15 = v62;
    }
    (*(void (**)(_QWORD *))(*v15 + 8 * v24))(v15);
LABEL_33:

    if (v70 == v69)
    {
      v25 = 4;
    }
    else
    {
      if (!v70)
      {
LABEL_38:
        if (SHIBYTE(v66) < 0)
          operator delete(v65[0]);

        goto LABEL_41;
      }
      v25 = 5;
      v16 = v70;
    }
    (*(void (**)(_QWORD *))(*v16 + 8 * v25))(v16);
    goto LABEL_38;
  }
  _ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client7getListES2_ONS9_18ListRequestOptionsEONS_8functionIFvNS9_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SP_ELi0EEEDpOT_((uint64_t)&v51, v3, v6, &v43);
  v28 = *((_QWORD *)v4 + 52);
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::UpdateList,Backend::RemoteList const,std::string const>((unsigned __int8 *)&v51, (uint64_t)&__p);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v32 = *(NSObject **)v4;
  block = MEMORY[0x24BDAC760];
  v65[0] = (void *)3321888768;
  v65[1] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_7getListES6_ONS_18ListRequestOptionsEONS9_8functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSV_DpOT0_E_clIRKSW_JS8_SH_EEEDaSV_S12__block_invoke;
  v66 = &__block_descriptor_88_ea8_32c360_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_7getListES6_ONS_18ListRequestOptionsEONS9_8functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSV_DpOT0_E_clIRKSW_JS8_SH_EEEDaSV_S12_EUlvE__e5_v8__0l;
  v59 = v55;
  v60 = (char)v56;
  v33 = v61;
  v34 = v57;
  v35 = (uint64_t)v58;
  if (!v58)
    goto LABEL_57;
  if (v58 != v57)
  {
    v35 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v58 + 16))(v58, v31);
LABEL_57:
    v62 = (_QWORD *)v35;
    goto LABEL_59;
  }
  v62 = v61;
  (*(void (**)(_QWORD *, _QWORD *))(v57[0] + 24))(v57, v61);
LABEL_59:
  v37 = v30;
  v63 = v37;
  v67 = v59;
  v68 = v60;
  v38 = v69;
  v39 = (uint64_t)v62;
  if (!v62)
  {
LABEL_62:
    v70 = (_QWORD *)v39;
    goto LABEL_64;
  }
  if (v62 != v61)
  {
    v39 = (*(uint64_t (**)(_QWORD *, uint64_t))(*v62 + 16))(v62, v36);
    goto LABEL_62;
  }
  v70 = v69;
  (*(void (**)(_QWORD *, _QWORD *))(v61[0] + 24))(v61, v69);
LABEL_64:
  v71 = v63;
  dispatch_async(v32, &block);

  if (v62 == v61)
  {
    v40 = 4;
  }
  else
  {
    if (!v62)
      goto LABEL_69;
    v40 = 5;
    v33 = v62;
  }
  (*(void (**)(_QWORD *))(*v33 + 8 * v40))(v33);
LABEL_69:

  if (v70 == v69)
  {
    v41 = 4;
  }
  else
  {
    if (!v70)
      goto LABEL_74;
    v41 = 5;
    v38 = v70;
  }
  (*(void (**)(_QWORD *))(*v38 + 8 * v41))(v38);
LABEL_74:

  if (v58 == v57)
  {
    v42 = 4;
  }
  else
  {
    if (!v58)
      goto LABEL_79;
    v42 = 5;
    v34 = v58;
  }
  (*(void (**)(_QWORD *))(*v34 + 8 * v42))(v34);
LABEL_79:
  if (v54 < 0)
    operator delete(__p);
LABEL_41:
  if (v46 == v45)
  {
    v26 = 4;
  }
  else
  {
    if (!v46)
      goto LABEL_46;
    v26 = 5;
    v7 = v46;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v26))(v7);
LABEL_46:
  if (v50 == v49)
  {
    v27 = 4;
  }
  else
  {
    if (!v50)
      return;
    v27 = 5;
    v5 = v50;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v27))(v5);
}

void sub_24A453190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,_QWORD *a39,void *a40)
{
  _QWORD *v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  if (a39 == v43)
  {
    v45 = 4;
  }
  else
  {
    if (!a39)
      goto LABEL_6;
    v45 = 5;
    v43 = a39;
  }
  (*(void (**)(_QWORD *))(*v43 + 8 * v45))(v43);
LABEL_6:

  v46 = a33;
  if (a33 == &a30)
  {
    v47 = 4;
    v46 = &a30;
  }
  else
  {
    if (!a33)
      goto LABEL_11;
    v47 = 5;
  }
  (*(void (**)(void))(*v46 + 8 * v47))();
LABEL_11:
  if (a27 < 0)
    operator delete(__p);
  if (a14 == v41)
  {
    v48 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_18;
    v48 = 5;
    v41 = a14;
  }
  (*(void (**)(_QWORD *))(*v41 + 8 * v48))(v41);
LABEL_18:
  if (a20 == v40)
  {
    v49 = 4;
  }
  else
  {
    if (!a20)
      goto LABEL_23;
    v49 = 5;
    v40 = a20;
  }
  (*(void (**)(_QWORD *))(*v40 + 8 * v49))(v40);
LABEL_23:
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c153_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEE3__0(uint64_t a1, uint64_t a2)
{
  __int128 v2;

  v2 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v2;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 56, a2 + 56);
}

_QWORD *__destroy_helper_block_ea8_32c153_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEE3__0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 56);
  result = *(_QWORD **)(a1 + 80);
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

void WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()(uint64_t a1, int a2)
{
  WebPrivacy::Client *v3;
  void **v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  void **v9;
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void **v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  uint64_t v29;
  WebPrivacy::Client *v30;
  char v31;
  _QWORD v32[3];
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void (**v37)(void **, _QWORD *);
  char v38;
  uint64_t v39;
  void **v40;
  uint64_t *v41;
  NSObject **v42;
  char v43;
  _QWORD v44[3];
  _QWORD *v45;
  NSObject **v46;
  uint64_t v47;
  _QWORD v48[2];
  void **v49;
  _QWORD *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = *(WebPrivacy::Client **)a1;
  switch(a2)
  {
    case 0:
    case 2:
      v30 = *(WebPrivacy::Client **)a1;
      v31 = *(_BYTE *)(a1 + 8);
      v4 = (void **)v32;
      std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v32, a1 + 16);
      if (!*((_QWORD *)v3 + 52))
      {
        WebPrivacy::Client::ensureConnection(v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)v3;
        v7 = v5;
        v8 = v6;
        LOBYTE(v34) = *(_BYTE *)(a1 + 8);
        v35 = (uint64_t)v30;
        LOBYTE(v36) = v31;
        v9 = (void **)&v37;
        if (v33)
        {
          if (v33 == v32)
          {
            v40 = (void **)&v37;
            (*(void (**)(_QWORD *, void **))(v32[0] + 24))(v32, (void **)&v37);
          }
          else
          {
            v40 = v33;
            v33 = 0;
          }
        }
        else
        {
          v40 = 0;
        }
        WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>((unsigned __int8 *)&v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (NSObject **)v35;
        v43 = (char)v36;
        v17 = v44;
        if (v40)
        {
          if (v40 == (void **)&v37)
          {
            v45 = v44;
            v37[3]((void **)&v37, v44);
            v18 = v45;
          }
          else
          {
            v18 = (_QWORD *)(*((uint64_t (**)(void))*v40 + 2))();
            v45 = v18;
          }
          v46 = v42;
          LOBYTE(v47) = v43;
          v19 = v48;
          if (v18)
          {
            if (v18 == v44)
            {
              v50 = v48;
              (*(void (**)(_QWORD *, _QWORD *))(v44[0] + 24))(v44, v48);
            }
            else
            {
              v50 = v18;
              v45 = 0;
            }
            goto LABEL_28;
          }
        }
        else
        {
          v45 = 0;
          v46 = (NSObject **)v35;
          LOBYTE(v47) = (_BYTE)v36;
          v19 = v48;
        }
        v50 = 0;
LABEL_28:
        v20 = (char *)malloc_type_malloc(0x50uLL, 0x10E00404ACE56F5uLL);
        v21 = v20;
        *(_QWORD *)v20 = MEMORY[0x24BDAC758];
        *((_QWORD *)v20 + 1) = 50331650;
        *((_QWORD *)v20 + 2) = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSt3__18functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSK_E_clESK_EUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSU_DpOT0_E_clIRKSV_JRSE_EEEDaSU_S13_EUlS3_E_EES5_ST_ENUlPvS3_E_8__invokeES1B_S3_;
        *((_QWORD *)v20 + 3) = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSt3__18functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSK_E_clESK_EUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSU_DpOT0_E_clIRKSV_JRSE_EEEDaSU_S13_EUlS3_E_EES5_ST_E10descriptor;
        *((_QWORD *)v20 + 4) = v46;
        v20[40] = v47;
        if (v50)
        {
          if (v50 == v48)
          {
            *((_QWORD *)v20 + 9) = v20 + 48;
            (*(void (**)(_QWORD *))(v48[0] + 24))(v48);
          }
          else
          {
            *((_QWORD *)v20 + 9) = v50;
            v50 = 0;
          }
        }
        else
        {
          *((_QWORD *)v20 + 9) = 0;
        }
        v22 = (void *)MEMORY[0x24BD10684](v21);

        if (v50 == v48)
        {
          v23 = 4;
        }
        else
        {
          if (!v50)
            goto LABEL_38;
          v23 = 5;
          v19 = v50;
        }
        (*(void (**)(_QWORD *))(*v19 + 8 * v23))(v19);
LABEL_38:
        v24 = (void *)MEMORY[0x24BD10684](v22);
        xpc_connection_send_message_with_reply(v7, v16, v8, v24);

        if (v45 == v44)
        {
          v25 = 4;
        }
        else
        {
          if (!v45)
            goto LABEL_43;
          v25 = 5;
          v17 = v45;
        }
        (*(void (**)(_QWORD *))(*v17 + 8 * v25))(v17);
LABEL_43:

        if (v40 == (void **)&v37)
        {
          v26 = 4;
        }
        else
        {
          if (!v40)
          {
LABEL_48:

            goto LABEL_49;
          }
          v26 = 5;
          v9 = v40;
        }
        (*((void (**)(void **))*v9 + v26))(v9);
        goto LABEL_48;
      }
      v46 = (NSObject **)v3;
      LOBYTE(v34) = *(_BYTE *)(a1 + 8);
      v35 = (uint64_t)v30;
      LOBYTE(v36) = v31;
      v28 = (void **)&v37;
      if (v33)
      {
        if (v33 == v32)
        {
          v40 = (void **)&v37;
          (*(void (**)(_QWORD *, void **))(v32[0] + 24))(v32, (void **)&v37);
        }
        else
        {
          v40 = v33;
          v33 = 0;
        }
      }
      else
      {
        v40 = 0;
      }
      _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_7getListES8_ONS1_18ListRequestOptionsEONSt3__18functionIFvNS1_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSF_E_clESF_EUlOT_E_EEEvDpOT1_EUlSP_DpOT0_E_NSD_5tupleIJS8_SQ_EEEEEDcSP_RKT0_(&v46, (uint64_t)&v34);
      if (v40 == (void **)&v37)
      {
        v29 = 4;
      }
      else
      {
        if (!v40)
          goto LABEL_49;
        v29 = 5;
        v28 = v40;
      }
      (*((void (**)(void **))*v28 + v29))(v28);
LABEL_49:
      v15 = v33;
LABEL_50:
      if (v15 == v4)
      {
        v27 = 4;
      }
      else
      {
        if (!v15)
          return;
        v27 = 5;
        v4 = v15;
      }
      (*((void (**)(void **))*v4 + v27))(v4);
      return;
    case 1:
    case 3:
      LOBYTE(v46) = a2;
      v4 = (void **)&v47;
      std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)&v47, a1 + 16);
      v10 = *((_QWORD *)v3 + 1);
      v34 = MEMORY[0x24BDAC760];
      v35 = 3321888768;
      v36 = ___ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
      v37 = (void (**)(void **, _QWORD *))&__block_descriptor_72_ea8_32c183_ZTSKZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_EUlvE__e5_v8__0l;
      v38 = (char)v46;
      v11 = &v39;
      v12 = (uint64_t)v49;
      if (!v49)
        goto LABEL_9;
      if (v49 == (void **)&v47)
      {
        v41 = &v39;
        (*(void (**)(uint64_t *, uint64_t *))(v47 + 24))(&v47, &v39);
      }
      else
      {
        v12 = (*((uint64_t (**)(void **))*v49 + 2))(v49);
LABEL_9:
        v41 = (uint64_t *)v12;
      }
      v13 = (void *)MEMORY[0x24BD10684](&v34);
      if (v41 == &v39)
      {
        v14 = 4;
      }
      else
      {
        if (!v41)
          goto LABEL_17;
        v14 = 5;
        v11 = v41;
      }
      (*(void (**)(uint64_t *))(*v11 + 8 * v14))(v11);
LABEL_17:
      dispatch_async(v10, v13);

      v15 = v49;
      goto LABEL_50;
    default:
      WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()();
  }
}

void sub_24A45392C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,_QWORD *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;

  if (a21 == v30)
  {
    v32 = 4;
  }
  else
  {
    if (!a21)
      goto LABEL_6;
    v32 = 5;
    v30 = a21;
  }
  (*(void (**)(_QWORD *))(*v30 + 8 * v32))(v30);
LABEL_6:
  if (a14 == v29)
  {
    v33 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_11;
    v33 = 5;
    v29 = a14;
  }
  (*(void (**)(_QWORD *))(*v29 + 8 * v33))(v29);
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__15tupleIJN7Backend10RemoteListENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEZZN10WebPrivacy6Client7getListES2_ONS9_18ListRequestOptionsEONS_8functionIFvNS9_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEC1B8nn180100IJKS2_KS8_SP_ELi0EEEDpOT_(uint64_t a1, _BYTE *a2, __int128 *a3, uint64_t *a4)
{
  std::string *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t *v9;

  *(_BYTE *)a1 = *a2;
  v6 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    v6->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  v8 = *a4;
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a4 + 8);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = (uint64_t *)a4[5];
  if (v9)
  {
    if (v9 == a4 + 2)
    {
      *(_QWORD *)(a1 + 72) = a1 + 48;
      (*(void (**)(uint64_t))(*(_QWORD *)a4[5] + 24))(a4[5]);
    }
    else
    {
      *(_QWORD *)(a1 + 72) = v9;
      a4[5] = 0;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 72) = 0;
  }
  return a1;
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSF_8functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlS10_DpOT0_E_clIRKS11_JRSE_RSM_EEEDaS10_S19_EUlS3_E_EES5_SZ_ENUlPKvE_8__invokeES1J_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
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

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSF_8functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlS10_DpOT0_E_clIRKS11_JRSE_RSM_EEEDaS10_S19_EUlS3_E_EES5_SZ_ENUlPvS3_E_8__invokeES1I_S3_(uint64_t a1, void *a2)
{
  __int16 updated;
  unsigned __int8 v4;
  id v5;

  v5 = a2;
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(v5);
  if ((updated & 0xFF00) != 0)
    v4 = updated;
  else
    v4 = 1;
  WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()(a1 + 32, v4);

}

void sub_24A453BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_7getListES6_ONS_18ListRequestOptionsEONS9_8functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSV_DpOT0_E_clIRKSW_JS8_SH_EEEDaSV_S12__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int16 updated;
  unsigned __int8 v3;

  v1 = a1 + 32;
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(*(void **)(a1 + 80));
  if ((updated & 0xFF00) != 0)
    v3 = updated;
  else
    v3 = 1;
  WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()(v1, v3);
}

id __copy_helper_block_ea8_32c360_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_7getListES6_ONS_18ListRequestOptionsEONS9_8functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSV_DpOT0_E_clIRKSW_JS8_SH_EEEDaSV_S12_EUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id result;

  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
  result = *(id *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c360_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_7getListES6_ONS_18ListRequestOptionsEONS9_8functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSV_DpOT0_E_clIRKSW_JS8_SH_EEEDaSV_S12_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 72);
  if (result == (_QWORD *)(a1 + 48))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 48);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t ___ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];
  char v6;

  v1 = *(_BYTE *)(a1 + 32);
  v5[0] = 0;
  v5[1] = 0;
  v6 = v1;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    return (*(uint64_t (**)(uint64_t, char *, _QWORD *))(*(_QWORD *)v2 + 48))(v2, &v6, v5);
  v4 = std::__throw_bad_function_call[abi:nn180100]();
  return __copy_helper_block_ea8_32c183_ZTSKZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_EUlvE_(v4);
}

uint64_t __copy_helper_block_ea8_32c183_ZTSKZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_EUlvE_(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_ea8_32c183_ZTSKZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_EUlvE_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

void _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_7getListES8_ONS1_18ListRequestOptionsEONSt3__18functionIFvNS1_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSF_E_clESF_EUlOT_E_EEEvDpOT1_EUlSP_DpOT0_E_NSD_5tupleIJS8_SQ_EEEEEDcSP_RKT0_(NSObject ***a1, uint64_t a2)
{
  NSObject **v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD v16[3];
  _QWORD *v17;
  id v18;
  _QWORD block[5];
  char v20;
  _BYTE v21[24];
  _BYTE *v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = (*a1)[52];
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>((unsigned __int8 *)a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(NSObject *, void *))v4[2].isa)(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v7 = *v3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV__block_invoke;
  block[3] = &__block_descriptor_88_ea8_32c303_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV_EUlvE__e5_v8__0l;
  v14 = *(_QWORD *)(a2 + 8);
  v15 = *(_BYTE *)(a2 + 16);
  v8 = v16;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v16, a2 + 24);
  v9 = v6;
  v18 = v9;
  block[4] = v14;
  v20 = v15;
  v10 = v21;
  v11 = (uint64_t)v17;
  if (!v17)
    goto LABEL_5;
  if (v17 != v16)
  {
    v11 = (*(uint64_t (**)(void))(*v17 + 16))();
LABEL_5:
    v22 = (_BYTE *)v11;
    goto LABEL_7;
  }
  v22 = v21;
  (*(void (**)(_QWORD *, _BYTE *))(v16[0] + 24))(v16, v21);
LABEL_7:
  v23 = v18;
  dispatch_async(v7, block);

  if (v17 == v16)
  {
    v12 = 4;
  }
  else
  {
    if (!v17)
      goto LABEL_12;
    v12 = 5;
    v8 = v17;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v12))(v8);
LABEL_12:

  if (v22 == v21)
  {
    v13 = 4;
    goto LABEL_16;
  }
  if (v22)
  {
    v13 = 5;
    v10 = v22;
LABEL_16:
    (*(void (**)(_QWORD *))(*v10 + 8 * v13))(v10);
  }

}

void sub_24A453F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15, void *a16)
{
  void *v16;
  _QWORD *v17;
  uint64_t v19;

  if (a15 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v19 = 5;
    v17 = a15;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:

  _Unwind_Resume(a1);
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSt3__18functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSK_E_clESK_EUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSU_DpOT0_E_clIRKSV_JRSE_EEEDaSU_S13_EUlS3_E_EES5_ST_ENUlPKvE_8__invokeES1C_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
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

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client7getListESD_ONS7_18ListRequestOptionsEONSt3__18functionIFvNS7_12MessageErrorEONS_9ArrayViewIhEEEEEENK3__0clEvENKUlSK_E_clESK_EUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSU_DpOT0_E_clIRKSV_JRSE_EEEDaSU_S13_EUlS3_E_EES5_ST_ENUlPvS3_E_8__invokeES1B_S3_(uint64_t a1, void *a2)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  char v6[16];
  std::__shared_weak_count *v7;
  char v8;

  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(a2, (uint64_t)v6);
  _ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_(a1 + 32, v6);
  if (v8)
  {
    v3 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
}

void sub_24A45405C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)&a10);
  _Unwind_Resume(exception_object);
}

void _ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_(uint64_t a1, char *a2)
{
  uint64_t v4;
  int v5;
  BOOL v6;
  _QWORD *v7;
  NSObject *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  __int128 v24;
  char v25;
  _QWORD v26[3];
  _QWORD *v27;
  _QWORD v28[5];
  char v29;
  char v30;
  __int128 v31;
  char v32;
  _BYTE v33[24];
  _BYTE *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a1;
  v5 = a2[24];
  if (a2[24])
    v6 = *a2 == 0;
  else
    v6 = 0;
  if (v6)
  {
    WebPrivacy::Client::scheduleListUpdateWithNotification(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
    v5 = a2[24];
  }
  v21 = v4;
  v22 = *(_BYTE *)(a1 + 8);
  v23 = 0;
  v25 = 0;
  if (v5)
  {
    v23 = *a2;
    v24 = *(_OWORD *)(a2 + 8);
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    v25 = 1;
  }
  v7 = v26;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v26, a1 + 16);
  v8 = *(NSObject **)(v4 + 8);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3321888768;
  v28[2] = ___ZZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v28[3] = &__block_descriptor_112_ea8_32c242_ZTSKZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_EUlvE__e5_v8__0l;
  v28[4] = v21;
  v29 = v22;
  v30 = 0;
  v32 = 0;
  if (v25)
  {
    v30 = v23;
    v31 = v24;
    if (*((_QWORD *)&v24 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v32 = 1;
  }
  v11 = v33;
  v12 = (uint64_t)v27;
  if (!v27)
    goto LABEL_17;
  if (v27 != v26)
  {
    v12 = (*(uint64_t (**)(void))(*v27 + 16))();
LABEL_17:
    v34 = (_BYTE *)v12;
    goto LABEL_19;
  }
  v34 = v33;
  (*(void (**)(_QWORD *, _BYTE *))(v26[0] + 24))(v26, v33);
LABEL_19:
  v13 = (void *)MEMORY[0x24BD10684](v28);
  if (v34 == v33)
  {
    v14 = 4;
    goto LABEL_23;
  }
  if (v34)
  {
    v14 = 5;
    v11 = v34;
LABEL_23:
    (*(void (**)(_QWORD *))(*v11 + 8 * v14))(v11);
  }
  if (v32)
  {
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  dispatch_async(v8, v13);

  if (v27 == v26)
  {
    v18 = 4;
    goto LABEL_34;
  }
  if (v27)
  {
    v18 = 5;
    v7 = v27;
LABEL_34:
    (*(void (**)(_QWORD *))(*v7 + 8 * v18))(v7);
  }
  if (v25 && *((_QWORD *)&v24 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v24 + 1) + 16))(*((_QWORD *)&v24 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v24 + 1));
    }
  }
}

void sub_24A454310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a29)
    _ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI__cold_1((uint64_t)&a20);
  _ZZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_ENUlvE_D1Ev((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t _ZZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_ENUlvE_D1Ev(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 48);
  v3 = *(_QWORD **)(a1 + 72);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  if (*(_BYTE *)(a1 + 40))
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](a1 + 24);
  return a1;
}

void ___ZZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Platform::SharedMemory *v13[2];
  char v14;

  if (!*(_BYTE *)(a1 + 72))
  {
    v13[0] = 0;
    v13[1] = 0;
    LOBYTE(v11) = 1;
    v6 = *(_QWORD *)(a1 + 104);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t *, Platform::SharedMemory **))(*(_QWORD *)v6 + 48))(v6, &v11, v13);
      return;
    }
    std::__throw_bad_function_call[abi:nn180100]();
    goto LABEL_17;
  }
  v2 = *(_QWORD *)(a1 + 32);
  WebPrivacy::XPC::GetListReply::takeData((WebPrivacy::XPC::GetListReply *)(a1 + 48), v13);
  v3 = *(_BYTE *)(a1 + 48);
  if (v13[0])
  {
    v11 = Platform::SharedMemory::view(v13[0]);
    v12 = v4;
    v14 = v3;
    v5 = *(_QWORD *)(a1 + 104);
    if (v5)
    {
      (*(void (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)v5 + 48))(v5, &v14, &v11);
      WebPrivacy::Client::updateCachedListData(v2, *(_BYTE *)(a1 + 40), (__int128 *)v13);
      goto LABEL_9;
    }
LABEL_17:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  v11 = 0;
  v12 = 0;
  v14 = v3;
  v7 = *(_QWORD *)(a1 + 104);
  if (!v7)
    goto LABEL_17;
  (*(void (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v14, &v11);
LABEL_9:
  v8 = (std::__shared_weak_count *)v13[1];
  if (v13[1])
  {
    v9 = (unint64_t *)((char *)v13[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_24A4544E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  unint64_t *p_shared_owners;
  unint64_t v15;

  if (a13)
  {
    p_shared_owners = (unint64_t *)&a13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))a13->__on_zero_shared)(a13);
      std::__shared_weak_count::__release_weak(a13);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c242_ZTSKZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_EUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  if (*(_BYTE *)(a2 + 72))
  {
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    v3 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v3;
    if (v3)
    {
      v4 = (unint64_t *)(v3 + 8);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
    *(_BYTE *)(a1 + 72) = 1;
  }
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 80, a2 + 80);
}

void sub_24A4545A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 72))
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](v1 + 56);
  _Unwind_Resume(exception_object);
}

_QWORD *__destroy_helper_block_ea8_32c242_ZTSKZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_EUlvE_(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *result;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 80);
  result = *(_QWORD **)(a1 + 104);
  if (result == v2)
  {
    v4 = 4;
    result = v2;
  }
  else
  {
    if (!result)
      goto LABEL_6;
    v4 = 5;
  }
  result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
LABEL_6:
  if (*(_BYTE *)(a1 + 72))
    return (_QWORD *)std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](a1 + 56);
  return result;
}

void WebPrivacy::XPC::GetListReply::takeData(WebPrivacy::XPC::GetListReply *this@<X0>, _OWORD *a2@<X8>)
{
  _QWORD *v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;

  v7 = 0uLL;
  v3 = *(_OWORD *)((char *)this + 8);
  v2 = (_QWORD *)((char *)this + 8);
  *a2 = v3;
  *v2 = 0;
  v2[1] = 0;
  std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100]((uint64_t)v2, &v7);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV__block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  char v5[16];
  std::__shared_weak_count *v6;
  char v7;

  v1 = a1 + 32;
  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(*(void **)(a1 + 80), (uint64_t)v5);
  _ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI_(v1, v5);
  if (v7)
  {
    v2 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v4 = __ldaxr(p_shared_owners);
      while (__stlxr(v4 - 1, p_shared_owners));
      if (!v4)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }
}

void sub_24A454710(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV__block_invoke_cold_1((uint64_t)&a9);
  _Unwind_Resume(exception_object);
}

id __copy_helper_block_ea8_32c303_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV_EUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id result;

  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
  result = *(id *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c303_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 72);
  if (result == (_QWORD *)(a1 + 48))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 48);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

void ___ZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0cvU13block_pointerFvvEEv_block_invoke(std::__shared_weak_count *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  NSObject **shared_owners;
  uint64_t v4;
  uint64_t *p_shared_weak_owners;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  char shared_weak_owners;
  std::__shared_weak_count_vtbl *v10;
  int v11;
  char v12;
  NSObject *v13;
  std::__shared_weak_count_vtbl *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  BOOL v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  char v27[8];
  uint64_t v28;
  std::__shared_weak_count *v29;
  unsigned __int8 v30;
  _BYTE buf[24];
  void *v32;
  NSObject **v33;
  char v34;
  std::__shared_weak_count_vtbl *v35;
  char v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  char v39;
  uint64_t v40;

  v2 = a1;
  v40 = *MEMORY[0x24BDAC8D0];
  shared_owners = (NSObject **)a1[1].__shared_owners_;
  v4 = mach_approximate_time();
  p_shared_weak_owners = &v2[1].__shared_weak_owners_;
  WebPrivacy::Client::sendSync<WebPrivacy::XPC::GetList,WebPrivacy::XPC::GetListReply,Backend::RemoteList const&>((uint64_t)shared_owners, (unsigned __int8 *)&v2[1].__shared_weak_owners_, (uint64_t)v27);
  v6 = (id)WPOSLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((*(_BYTE *)p_shared_weak_owners - 1) > 7u)
      v7 = CFSTR("Invalid");
    else
      v7 = off_251BCED28[(char)(*(_BYTE *)p_shared_weak_owners - 1)];
    v8 = mach_approximate_time();
    if (WebPrivacy::millisecondsSince(unsigned long long)::onceToken != -1)
      dispatch_once(&WebPrivacy::millisecondsSince(unsigned long long)::onceToken, &__block_literal_global_44);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)((v8 - v4)
                                 * WebPrivacy::millisecondsSince(unsigned long long)::timebase
                                 / *(unsigned int *)algn_2544D135C)
                        / 1000000.0;
    _os_log_impl(&dword_24A44A000, v6, OS_LOG_TYPE_INFO, "Received sync reply for %@ in %.3f ms", buf, 0x16u);
  }

  shared_weak_owners = v2[1].__shared_weak_owners_;
  v10 = v2[2].__vftable;
  v11 = v30;
  if (v30)
  {
    v12 = v27[0];
    v1 = v28;
    v2 = v29;
    v28 = 0;
    v29 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = *shared_owners;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v32 = &__block_descriptor_88_ea8_32c75_ZTSKZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0clEvEUlvE__e5_v8__0l;
  v33 = shared_owners;
  v34 = shared_weak_owners;
  v14 = v10;
  v35 = v14;
  v36 = 0;
  v39 = 0;
  if (v11)
  {
    v36 = v12;
    v37 = v1;
    v38 = v2;
    if (v2)
    {
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    v39 = 1;
  }
  v17 = (void *)MEMORY[0x24BD10684](buf);
  if (v39)
  {
    v18 = v38;
    if (v38)
    {
      v19 = (unint64_t *)&v38->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  dispatch_async(v13, v17);
  if (v2)
    v21 = v11 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    v22 = (unint64_t *)&v2->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  if (v30)
  {
    v24 = v29;
    if (v29)
    {
      v25 = (unint64_t *)&v29->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }
}

void sub_24A454C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, char a12)
{
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v15;

  if (a12 && a11)
  {
    p_shared_owners = (unint64_t *)&a11->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))a11->__on_zero_shared)(a11);
      std::__shared_weak_count::__release_weak(a11);
    }
  }
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c62_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v3;
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c62_ZTSKZN10WebPrivacy6Client7getListEN7Backend10RemoteListEE3__0(uint64_t a1)
{

}

void WebPrivacy::Client::sendSync<WebPrivacy::XPC::GetList,WebPrivacy::XPC::GetListReply,Backend::RemoteList const&>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v6 = *(_QWORD *)(a1 + 416);
  if (v6)
  {
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
      __assert_rtn("sendSync", "Client.h", 116, "result");
    WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(v8, a3);
  }
  else
  {
    WebPrivacy::Client::ensureConnection((WebPrivacy::Client *)a1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WebPrivacy::XPC::sendSync<WebPrivacy::XPC::GetList,WebPrivacy::XPC::GetListReply,Backend::RemoteList const>(v8, a2, a3);
  }

}

void sub_24A454DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::sendSync<WebPrivacy::XPC::GetList,WebPrivacy::XPC::GetListReply,Backend::RemoteList const>(void *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  void *v5;
  xpc_object_t v6;
  _xpc_connection_s *connection;

  connection = a1;
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(connection, v5);

  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(v6, a3);
}

void sub_24A454E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t ___ZN10WebPrivacyL17millisecondsSinceEy_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&WebPrivacy::millisecondsSince(unsigned long long)::timebase);
}

void ___ZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _BOOL4 v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  if (!*(_BYTE *)(a1 + 80))
  {
LABEL_17:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    return;
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(_BYTE *)(a1 + 56) == 0;
  WebPrivacy::XPC::GetListReply::takeData((WebPrivacy::XPC::GetListReply *)(a1 + 56), &v11);
  if ((_QWORD)v11)
  {
    WebPrivacy::Client::updateCachedListData(v2, *(_BYTE *)(a1 + 40), &v11);
    goto LABEL_4;
  }
  if (v3)
  {
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    goto LABEL_17;
  }
  std::mutex::lock((std::mutex *)(v2 + 240));
  std::__tree<Backend::RemoteList>::__emplace_unique_key_args<Backend::RemoteList,Backend::RemoteList const&>((uint64_t **)(v2 + 304), (unsigned __int8 *)(a1 + 40), (_BYTE *)(a1 + 40));
  std::mutex::unlock((std::mutex *)(v2 + 240));
  v4 = 1;
LABEL_4:
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  if (v4)
  {
    WebPrivacy::Client::scheduleListUpdateWithNotification(v2, *(_BYTE *)(a1 + 40));
    atomic_store(0, (unsigned __int8 *)(v2 + 232));
  }
}

void sub_24A454FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  std::mutex *v10;
  unint64_t *p_shared_owners;
  unint64_t v13;

  std::mutex::unlock(v10);
  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c75_ZTSKZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0clEvEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  *(_BYTE *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 80) = 0;
  if (*(_BYTE *)(a2 + 80))
  {
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    v6 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    *(_BYTE *)(a1 + 80) = 1;
  }
  return result;
}

void __destroy_helper_block_ea8_32c75_ZTSKZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEENK3__0clEvEUlvE_(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 80))
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](a1 + 64);

}

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10UpdateListENS8_15UpdateListReplyEJKN7Backend10RemoteListEKNSt3__112basic_stringIcNSF_11char_traitsIcEENSF_9allocatorIcEEEEZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_E3__6EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlOT_DpOT0_E_clIRKSO_JRSE_RSM_EEEDaSV_SY_EUlS3_E_EES5_SU_ENUlPvS3_E_8__invokeES17_S3_(uint64_t a1, void *a2)
{
  id v3;
  __int16 updated;

  v3 = a2;
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(v3);
  _ZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_(a1 + 32, (char *)&updated);

}

void sub_24A455130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

uint64_t _ZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_(uint64_t a1, char *a2)
{
  WebPrivacy::Client *v2;
  unsigned __int8 v3;
  _BYTE *v4;
  BOOL v5;
  NSObject *v7;
  void *v9;
  void *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  void *v13;
  _QWORD *v14;
  __int128 v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unsigned __int8 v22[8];
  __int128 v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v2 = *(WebPrivacy::Client **)a1;
  v3 = *(_BYTE *)(a1 + 8);
  LOBYTE(v21) = v3;
  *((_QWORD *)&v21 + 1) = v2;
  v4 = a2 + 1;
  if (a2[1])
    v5 = *a2 == 0;
  else
    v5 = 0;
  if (v5)
  {
    *(_QWORD *)&v19 = v2;
    BYTE8(v19) = v3;
    v20 = v21;
    if (*((_QWORD *)v2 + 52))
    {
      *(_QWORD *)&v26 = v2;
      v22[0] = v3;
      v23 = v19;
      v24[0] = v20;
      _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_34scheduleListUpdateWithNotificationES8_EUb_ENK3__6clINSt3__18optionalINS4_15UpdateListReplyEEEEEDaOT_EUlSJ_E_EEEvDpOT1_EUlSJ_DpOT0_E_NSD_5tupleIJS8_SK_EEEEEDcSJ_RKT0_((NSObject ***)&v26, (uint64_t)v22);
      _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)v24);
    }
    else
    {
      WebPrivacy::Client::ensureConnection(v2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)v2;
      v11 = v9;
      v12 = v10;
      v22[0] = *(_BYTE *)(a1 + 8);
      v23 = v19;
      v24[0] = v20;
      WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>(v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v23;
      v25 = v24[0];
      v26 = v23;
      v27 = v24[0];
      v14 = malloc_type_malloc(0x40uLL, 0x10E0040B37C3717uLL);
      *v14 = MEMORY[0x24BDAC758];
      v14[1] = 50331650;
      v14[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_ENK3__6clINSt3__18optionalINS8_15UpdateListReplyEEEEEDaOT_EUlSO_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEESM_SO_SX_EUlS3_E_EES5_SN_ENUlPvS3_E_8__invokeES14_S3_;
      v14[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_ENK3__6clINSt3__18optionalINS8_15UpdateListReplyEEEEEDaOT_EUlSO_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEESM_SO_SX_EUlS3_E_EES5_SN_E10descriptor;
      v15 = v27;
      *((_OWORD *)v14 + 2) = v26;
      *((_OWORD *)v14 + 3) = v15;
      v16 = (void *)MEMORY[0x24BD10684]();

      _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v27);
      v17 = (void *)MEMORY[0x24BD10684](v16);
      xpc_connection_send_message_with_reply(v11, v13, v12, v17);

      _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v25);
      _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)v24);

    }
    _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v20);
  }
  else
  {
    v7 = WPOSLogXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      _ZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT__cold_1(v4, a2, v7);
  }
  return _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v21);
}

void sub_24A45536C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev(v7 + 24);
  _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev(v6);
  _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  std::mutex::lock((std::mutex *)(v2 + 328));
  std::__tree<Backend::RemoteList>::__erase_unique<Backend::RemoteList>(v2 + 392, (unsigned __int8 *)a1);
  std::mutex::unlock((std::mutex *)(v2 + 328));
  return a1;
}

void sub_24A455444(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_34scheduleListUpdateWithNotificationES8_EUb_ENK3__6clINSt3__18optionalINS4_15UpdateListReplyEEEEEDaOT_EUlSJ_E_EEEvDpOT1_EUlSJ_DpOT0_E_NSD_5tupleIJS8_SK_EEEEEDcSJ_RKT0_(NSObject ***a1, uint64_t a2)
{
  NSObject **v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  void *v12;
  _QWORD block[4];
  __int128 v14;
  __int128 v15;
  id v16;

  v3 = *a1;
  v4 = (*a1)[52];
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::GetList,Backend::RemoteList const>((unsigned __int8 *)a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(NSObject *, void *))v4[2].isa)(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_34scheduleListUpdateWithNotificationES8_EUb_ENK3__6clINSt3__18optionalINS4_15UpdateListReplyEEEEEDaOT_EUlSJ_E_EEEvDpOT1_EUlSJ_DpOT0_E_NSD_5tupleIJS8_SK_EEEEEDcSJ_RKT0__cold_1();
  v7 = *v3;
  v12 = v6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_34scheduleListUpdateWithNotificationES6_EUb_ENK3__6clINSt3__18optionalINS2_15UpdateListReplyEEEEEDaOT_EUlSH_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEESF_SH_SO__block_invoke;
  block[3] = &__block_descriptor_72_ea8_32c276_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_34scheduleListUpdateWithNotificationES6_EUb_ENK3__6clINSt3__18optionalINS2_15UpdateListReplyEEEEEDaOT_EUlSH_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEESF_SH_SO_EUlvE__e5_v8__0l;
  v10 = *(_OWORD *)(a2 + 8);
  v11 = *(_OWORD *)(a2 + 24);
  v14 = v10;
  v15 = v11;
  v16 = v6;
  v8 = v6;
  dispatch_async(v7, block);
  _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v11);

  return _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev((uint64_t)&v15);
}

void sub_24A455548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_ENK3__6clINSt3__18optionalINS8_15UpdateListReplyEEEEEDaOT_EUlSO_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEESM_SO_SX_EUlS3_E_EES5_SN_ENUlPKvE_8__invokeES15_(uint64_t a1)
{
  return _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev(a1 + 48);
}

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_7GetListENS8_12GetListReplyEJKN7Backend10RemoteListEZZZNS7_6Client34scheduleListUpdateWithNotificationESD_EUb_ENK3__6clINSt3__18optionalINS8_15UpdateListReplyEEEEEDaOT_EUlSO_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEESM_SO_SX_EUlS3_E_EES5_SN_ENUlPvS3_E_8__invokeES14_S3_(uint64_t a1, void *a2)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _BYTE v6[16];
  std::__shared_weak_count *v7;
  char v8;

  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(a2, (uint64_t)v6);
  _ZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_((uint64_t *)(a1 + 32), (WebPrivacy::XPC::GetListReply *)v6);
  if (v8)
  {
    v3 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
}

void sub_24A4555DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)&a10);
  _Unwind_Resume(exception_object);
}

void _ZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_(uint64_t *a1, WebPrivacy::XPC::GetListReply *this)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  NSObject *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;
  _QWORD v12[4];
  unsigned __int8 v13;

  if (*((_BYTE *)this + 24))
  {
    v3 = *a1;
    WebPrivacy::XPC::GetListReply::takeData(this, &v11);
    if ((_QWORD)v11)
    {
      std::mutex::lock((std::mutex *)(v3 + 240));
      v4 = (unsigned __int8 *)(a1 + 1);
      std::__tree<Backend::RemoteList>::__erase_unique<Backend::RemoteList>(v3 + 304, v4);
      std::mutex::unlock((std::mutex *)(v3 + 240));
      atomic_store(0, (unsigned __int8 *)(v3 + 232));
      if (WebPrivacy::Client::updateCachedListData(v3, *v4, &v11))
      {
        v5 = *v4;
        v6 = *(NSObject **)(v3 + 8);
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3321888768;
        v12[2] = ___ZZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
        v12[3] = &__block_descriptor_33_ea8_32c205_ZTSKZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_EUlvE__e5_v8__0l;
        v13 = v5;
        v7 = (void *)MEMORY[0x24BD10684](v12);
        dispatch_async(v6, v7);

      }
    }
  }
  else
  {
    v11 = 0uLL;
  }
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_24A45571C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<Backend::RemoteList>::__erase_unique<Backend::RemoteList>(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(unsigned __int8 *)(v2 + 25);
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(unsigned __int8 *)(v4 + 25))
    return 0;
  std::__tree<Backend::RemoteList>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t *std::__tree<Backend::RemoteList>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
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
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

void ___ZZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint8_t buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = WPOSLogAPI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if ((*(_BYTE *)(a1 + 32) - 1) > 7u)
      v3 = CFSTR("Invalid");
    else
      v3 = off_251BCED28[(char)(*(_BYTE *)(a1 + 32) - 1)];
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_24A44A000, v2, OS_LOG_TYPE_INFO, "Dispatching list data changed notification for (%{public}@)", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("ResourceType");
  if ((*(_BYTE *)(a1 + 32) - 1) >= 8u)
    __assert_rtn("resourceType", "Client.mm", 256, "false");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (*(_BYTE *)(a1 + 32) - 1) + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WPResourceDataChangedNotificationName"), 0, v6);

}

void sub_24A455D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c205_ZTSKZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_EUlvE_(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(result + 32) = *(_BYTE *)(a2 + 32);
  return result;
}

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_34scheduleListUpdateWithNotificationES6_EUb_ENK3__6clINSt3__18optionalINS2_15UpdateListReplyEEEEEDaOT_EUlSH_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEESF_SH_SO__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  _BYTE v5[16];
  std::__shared_weak_count *v6;
  char v7;

  v1 = (uint64_t *)(a1 + 32);
  WebPrivacy::XPC::decode<WebPrivacy::XPC::GetListReply>(*(void **)(a1 + 64), (uint64_t)v5);
  _ZZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_ENUlSC_E_clINS6_INS7_12GetListReplyEEEEESA_SC_(v1, (WebPrivacy::XPC::GetListReply *)v5);
  if (v7)
  {
    v2 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v4 = __ldaxr(p_shared_owners);
      while (__stlxr(v4 - 1, p_shared_owners));
      if (!v4)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }
}

void sub_24A455E00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV__block_invoke_cold_1((uint64_t)&a9);
  _Unwind_Resume(exception_object);
}

id __copy_helper_block_ea8_32c276_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_34scheduleListUpdateWithNotificationES6_EUb_ENK3__6clINSt3__18optionalINS2_15UpdateListReplyEEEEEDaOT_EUlSH_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEESF_SH_SO_EUlvE_(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  id result;

  v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

uint64_t __destroy_helper_block_ea8_32c276_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_34scheduleListUpdateWithNotificationES6_EUb_ENK3__6clINSt3__18optionalINS2_15UpdateListReplyEEEEEDaOT_EUlSH_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEESF_SH_SO_EUlvE_(uint64_t a1)
{

  return _ZN8Platform9ScopeExitIZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS1_3XPC15UpdateListReplyEEEEEDaOT_EUlvE_ED1Ev(a1 + 48);
}

uint64_t ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_34scheduleListUpdateWithNotificationES6_EUb_E3__6EEEvDpOT1_ENKUlOT_DpOT0_E_clIRKSI_JS8_SH_EEEDaSN_SQ__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int16 updated;

  v1 = a1 + 32;
  updated = WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateListReply>(*(void **)(a1 + 48));
  return _ZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT_(v1, (char *)&updated);
}

id __copy_helper_block_ea8_32c289_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_34scheduleListUpdateWithNotificationES6_EUb_E3__6EEEvDpOT1_ENKUlOT_DpOT0_E_clIRKSI_JS8_SH_EEEDaSN_SQ_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result;

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c289_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10UpdateListENS2_15UpdateListReplyEJRKN7Backend10RemoteListERKNSt3__112basic_stringIcNS9_11char_traitsIcEENS9_9allocatorIcEEEEZZNS0_34scheduleListUpdateWithNotificationES6_EUb_E3__6EEEvDpOT1_ENKUlOT_DpOT0_E_clIRKSI_JS8_SH_EEEDaSN_SQ_EUlvE_(uint64_t a1)
{

}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)v2 + 24);
    operator delete(v2);
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::find<Backend::RemoteList>(_QWORD *a1, unsigned __int8 *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t ***v6;
  uint64_t **result;
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
  v6 = *(uint64_t ****)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t **)*result)
  {
    v8 = (unint64_t)result[1];
    if (v8 == v3)
    {
      if (*((unsigned __int8 *)result + 16) == (_DWORD)v3)
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

void ___ZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  WebPrivacy::Client *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  WebPrivacy::Client **v11;
  WebPrivacy::Client **v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;
  WebPrivacy::Client *v38;
  _QWORD v39[2];
  WebPrivacy::Client **v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD v43[3];
  _QWORD *v44;
  id v45;
  uint64_t block;
  uint64_t v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD *v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = *(WebPrivacy::Client **)(a1 + 40);
  v3 = v35;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v35, a1 + 48);
  v4 = *((_QWORD *)v2 + 52);
  if (!v4)
  {
    WebPrivacy::Client::ensureConnection(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(NSObject **)v2;
    v7 = v5;
    v8 = v6;
    LOBYTE(block) = *(_BYTE *)(a1 + 32);
    v47 = (uint64_t)v2;
    v9 = v48;
    if (v36)
    {
      if (v36 == v35)
      {
        v49[0] = v48;
        (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v48);
      }
      else
      {
        v49[0] = v36;
        v36 = 0;
      }
    }
    else
    {
      v49[0] = 0;
    }
    WebPrivacy::XPC::serialize<WebPrivacy::XPC::DeleteList,Backend::RemoteList const>((unsigned __int8 *)&block);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v47;
    v11 = &v38;
    if (v49[0])
    {
      if ((_QWORD *)v49[0] == v48)
      {
        v40 = &v38;
        (*(void (**)(_QWORD *, WebPrivacy::Client **))(v48[0] + 24))(v48, &v38);
        v12 = v40;
      }
      else
      {
        v12 = (WebPrivacy::Client **)(*(uint64_t (**)(void))(*(_QWORD *)v49[0] + 16))();
        v40 = v12;
      }
      v42 = v37;
      v13 = v43;
      if (v12)
      {
        if (v12 == &v38)
        {
          v44 = v43;
          (*((void (**)(WebPrivacy::Client **, _QWORD *))v38 + 3))(&v38, v43);
        }
        else
        {
          v44 = v12;
          v40 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v40 = 0;
      v42 = v47;
      v13 = v43;
    }
    v44 = 0;
LABEL_16:
    v14 = malloc_type_malloc(0x48uLL, 0x10E004040E2C6D6uLL);
    v15 = v14;
    *v14 = MEMORY[0x24BDAC758];
    v14[1] = 50331650;
    v14[2] = _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10DeleteListENS8_15DeleteListReplyEJKN7Backend10RemoteListEZZNS7_6Client10deleteListESD_ONSt3__18functionIFvNS7_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEEDaSO_SX_EUlS3_E_EES5_SN_ENUlPvS3_E_8__invokeES15_S3_;
    v14[3] = &_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10DeleteListENS8_15DeleteListReplyEJKN7Backend10RemoteListEZZNS7_6Client10deleteListESD_ONSt3__18functionIFvNS7_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEEDaSO_SX_EUlS3_E_EES5_SN_E10descriptor;
    v16 = v44;
    v14[4] = v42;
    if (v16)
    {
      if (v16 == v43)
      {
        v14[8] = v14 + 5;
        (*(void (**)(_QWORD *))(v43[0] + 24))(v43);
      }
      else
      {
        v14[8] = v16;
        v44 = 0;
      }
    }
    else
    {
      v14[8] = 0;
    }
    v17 = (void *)MEMORY[0x24BD10684](v15);

    if (v44 == v43)
    {
      v18 = 4;
    }
    else
    {
      if (!v44)
        goto LABEL_26;
      v18 = 5;
      v13 = v44;
    }
    (*(void (**)(_QWORD *))(*v13 + 8 * v18))(v13);
LABEL_26:
    v19 = (void *)MEMORY[0x24BD10684](v17);
    xpc_connection_send_message_with_reply(v7, v10, v8, v19);

    if (v40 == &v38)
    {
      v20 = 4;
    }
    else
    {
      if (!v40)
        goto LABEL_31;
      v20 = 5;
      v11 = v40;
    }
    (*((void (**)(WebPrivacy::Client **))*v11 + v20))(v11);
LABEL_31:

    if ((_QWORD *)v49[0] == v48)
    {
      v21 = 4;
    }
    else
    {
      if (!v49[0])
      {
LABEL_36:

        goto LABEL_37;
      }
      v21 = 5;
      v9 = (_QWORD *)v49[0];
    }
    (*(void (**)(_QWORD *))(*v9 + 8 * v21))(v9);
    goto LABEL_36;
  }
  LOBYTE(v37) = *(_BYTE *)(a1 + 32);
  v38 = v2;
  v23 = v39;
  if (v36)
  {
    if (v36 == v35)
    {
      v41 = v39;
      (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v39);
      v4 = *((_QWORD *)v2 + 52);
    }
    else
    {
      v41 = v36;
      v36 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  WebPrivacy::XPC::serialize<WebPrivacy::XPC::DeleteList,Backend::RemoteList const>((unsigned __int8 *)&v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    __assert_rtn("operator()", "Client.h", 98, "result");
  v26 = *(NSObject **)v2;
  block = MEMORY[0x24BDAC760];
  v47 = 3321888768;
  v48[0] = ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10DeleteListENS2_15DeleteListReplyEJRKN7Backend10RemoteListEZZNS0_10deleteListES6_ONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEEDaSH_SO__block_invoke;
  v48[1] = &__block_descriptor_80_ea8_32c248_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10DeleteListENS2_15DeleteListReplyEJRKN7Backend10RemoteListEZZNS0_10deleteListES6_ONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEEDaSH_SO_EUlvE__e5_v8__0l;
  v27 = (uint64_t)v41;
  v42 = (uint64_t)v38;
  v28 = v43;
  if (!v41)
    goto LABEL_53;
  if (v41 != v39)
  {
    v27 = (*(uint64_t (**)(void))(*v41 + 16))();
LABEL_53:
    v44 = (_QWORD *)v27;
    goto LABEL_55;
  }
  v44 = v43;
  (*(void (**)(_QWORD *, _QWORD *))(v39[0] + 24))(v39, v43);
LABEL_55:
  v29 = v25;
  v45 = v29;
  v30 = (uint64_t)v44;
  v48[2] = v42;
  v31 = v49;
  if (!v44)
  {
LABEL_58:
    v50 = (_QWORD *)v30;
    goto LABEL_60;
  }
  if (v44 != v43)
  {
    v30 = (*(uint64_t (**)(void))(*v44 + 16))();
    goto LABEL_58;
  }
  v50 = v49;
  (*(void (**)(_QWORD *, _QWORD *))(v43[0] + 24))(v43, v49);
LABEL_60:
  v51 = v45;
  dispatch_async(v26, &block);

  if (v44 == v43)
  {
    v32 = 4;
  }
  else
  {
    if (!v44)
      goto LABEL_65;
    v32 = 5;
    v28 = v44;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v32))(v28);
LABEL_65:

  if (v50 == v49)
  {
    v33 = 4;
  }
  else
  {
    if (!v50)
      goto LABEL_70;
    v33 = 5;
    v31 = v50;
  }
  (*(void (**)(_QWORD *))(*v31 + 8 * v33))(v31);
LABEL_70:

  if (v41 == v39)
  {
    v34 = 4;
  }
  else
  {
    if (!v41)
      goto LABEL_37;
    v34 = 5;
    v23 = v41;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v34))(v23);
LABEL_37:
  if (v36 == v35)
  {
    v22 = 4;
  }
  else
  {
    if (!v36)
      return;
    v22 = 5;
    v3 = v36;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v22))(v3);
}

void sub_24A456578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,void *a25)
{
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a24 == v28)
  {
    v30 = 4;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v30 = 5;
    v28 = a24;
  }
  (*(void (**)(_QWORD *))(*v28 + 8 * v30))(v28);
LABEL_6:

  if (a19 == v26)
  {
    v31 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_11;
    v31 = 5;
    v26 = a19;
  }
  (*(void (**)(_QWORD *))(*v26 + 8 * v31))(v26);
LABEL_11:
  if (a13 == v25)
  {
    v32 = 4;
  }
  else
  {
    if (!a13)
      goto LABEL_16;
    v32 = 5;
    v25 = a13;
  }
  (*(void (**)(_QWORD *))(*v25 + 8 * v32))(v25);
LABEL_16:
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c108_ZTSKZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
}

_QWORD *__destroy_helper_block_ea8_32c108_ZTSKZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEE3__0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
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

id WebPrivacy::XPC::serialize<WebPrivacy::XPC::DeleteList,Backend::RemoteList const>(unsigned __int8 *a1)
{
  xpc_object_t v2;
  xpc_object_t empty;
  uint64_t v4;
  id v5;
  xpc_object_t v6;
  xpc_object_t values;

  values = xpc_uint64_create(8uLL);
  v2 = xpc_dictionary_create((const char *const *)&WebPrivacy::messageNameKey, &values, 1uLL);
  empty = xpc_array_create_empty();
  v4 = *a1;
  v5 = empty;
  v6 = xpc_uint64_create(v4);
  xpc_array_append_value(v5, v6);

  xpc_dictionary_set_value(v2, "args", v5);
  return v2;
}

void sub_24A456808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

_QWORD *_ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10DeleteListENS8_15DeleteListReplyEJKN7Backend10RemoteListEZZNS7_6Client10deleteListESD_ONSt3__18functionIFvNS7_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEEDaSO_SX_EUlS3_E_EES5_SN_ENUlPKvE_8__invokeES16_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

void _ZZN8Platform8BlockPtrIFvPU24objcproto13OS_xpc_object8NSObjectEE12fromCallableIZZN10WebPrivacy3XPC13sendWithReplyINS8_10DeleteListENS8_15DeleteListReplyEJKN7Backend10RemoteListEZZNS7_6Client10deleteListESD_ONSt3__18functionIFvNS7_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvS3_PU28objcproto17OS_dispatch_queueS1_DpOT1_ENKUlSO_DpOT0_E_clIRKSP_JRSE_EEEDaSO_SX_EUlS3_E_EES5_SN_ENUlPvS3_E_8__invokeES15_S3_(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int16 v5;
  char v6;

  v4 = a2;
  v3 = WebPrivacy::XPC::decode<WebPrivacy::XPC::DeleteListReply>(v4);
  v5 = v3;
  v6 = BYTE2(v3);
  _ZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_((uint64_t *)(a1 + 32), &v5);

}

void sub_24A4568EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void _ZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_(uint64_t *a1, __int16 *a2)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  char v11;
  _QWORD v12[3];
  _QWORD *v13;
  _QWORD v14[4];
  __int16 v15;
  char v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v10 = *a2;
  v11 = *((_BYTE *)a2 + 2);
  v3 = v12;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v12, (uint64_t)(a1 + 1));
  v4 = *(NSObject **)(v2 + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3321888768;
  v14[2] = ___ZZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v14[3] = &__block_descriptor_72_ea8_32c183_ZTSKZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_EUlvE__e5_v8__0l;
  v15 = v10;
  v16 = v11;
  v5 = v17;
  v6 = (uint64_t)v13;
  if (!v13)
    goto LABEL_4;
  if (v13 != v12)
  {
    v6 = (*(uint64_t (**)(void))(*v13 + 16))();
LABEL_4:
    v18 = (_BYTE *)v6;
    goto LABEL_6;
  }
  v18 = v17;
  (*(void (**)(_QWORD *, _BYTE *))(v12[0] + 24))(v12, v17);
LABEL_6:
  v7 = (void *)MEMORY[0x24BD10684](v14);
  if (v18 == v17)
  {
    v8 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_11;
    v8 = 5;
    v5 = v18;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v8))(v5);
LABEL_11:
  dispatch_async(v4, v7);

  if (v13 == v12)
  {
    v9 = 4;
  }
  else
  {
    if (!v13)
      return;
    v9 = 5;
    v3 = v13;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v9))(v3);
}

void sub_24A456A90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  _QWORD *v14;
  uint64_t v16;

  if (a14 == v14)
  {
    v16 = 4;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v16 = 5;
    v14 = a14;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::DeleteListReply>(void *a1)
{
  int v1;
  id v2;
  int v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int16 v7;

  v2 = a1;
  if (MEMORY[0x24BD10858]() == MEMORY[0x24BDACFA0])
  {
    v7 = 0;
    xpc_dictionary_get_array(v2, "args");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decode((unsigned __int8 *)&v7, v5);

    v1 = HIBYTE(v7);
    if (v3)
      v4 = v7;
    else
      v4 = 0;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }

  return (v3 << 16) | (v1 << 8) | v4;
}

void sub_24A456B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(_BYTE *a1)
{
  int v2;
  uint64_t v3;
  char v4;
  char v5;

  v2 = a1[34];
  v3 = (uint64_t)(a1 + 40);
  if (v2)
  {
    v4 = a1[32];
    v5 = a1[33];
  }
  else
  {
    v4 = 1;
    v5 = 0;
  }
  return std::function<void ()(WebPrivacy::MessageError,BOOL)>::operator()(v3, v4, v5);
}

uint64_t __copy_helper_block_ea8_32c183_ZTSKZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_EUlvE_(uint64_t a1, uint64_t a2)
{
  __int16 v2;

  v2 = *(_WORD *)(a2 + 32);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_WORD *)(a1 + 32) = v2;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_ea8_32c183_ZTSKZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_EUlvE_(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
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

uint64_t std::function<void ()(WebPrivacy::MessageError,BOOL)>::operator()(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  char v6;
  char v7;

  v7 = a2;
  v6 = a3;
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
    return (*(uint64_t (**)(uint64_t, char *, char *))(*(_QWORD *)v3 + 48))(v3, &v7, &v6);
  v5 = std::__throw_bad_function_call[abi:nn180100]();
  return WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decode(v5);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decode(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (xpc_array_get_count(v3) == 2)
    v4 = WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decodeOne<0u>(a1, v3);
  else
    v4 = 0;

  return v4;
}

void sub_24A456C9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decodeOne<0u>(unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (WebPrivacy::XPC::decode<WebPrivacy::MessageError>(v3, a1))
    v4 = WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decodeOne<1u>((uint64_t)a1, v3);
  else
    v4 = 0;

  return v4;
}

void sub_24A456CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)9,WebPrivacy::MessageError,BOOL>::decodeOne<1u>(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  if (xpc_array_get_count(v3) <= 1)
  {

    goto LABEL_5;
  }
  xpc_array_get_value(v3, 1uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BD10858]();
  v6 = MEMORY[0x24BDACF80];

  if (v5 != v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  *(_BYTE *)(a1 + 1) = xpc_array_get_BOOL(v3, 1uLL);
  v7 = 1;
LABEL_6:

  return v7;
}

void sub_24A456DB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10DeleteListENS2_15DeleteListReplyEJRKN7Backend10RemoteListEZZNS0_10deleteListES6_ONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEEDaSH_SO__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  __int16 v3;
  char v4;

  v1 = (uint64_t *)(a1 + 32);
  v2 = WebPrivacy::XPC::decode<WebPrivacy::XPC::DeleteListReply>(*(void **)(a1 + 72));
  v3 = v2;
  v4 = BYTE2(v2);
  _ZZZN10WebPrivacy6Client10deleteListEN7Backend10RemoteListEONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvENKUlOT_E_clINS3_8optionalINS_3XPC15DeleteListReplyEEEEEDaSB_(v1, &v3);
}

id __copy_helper_block_ea8_32c248_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10DeleteListENS2_15DeleteListReplyEJRKN7Backend10RemoteListEZZNS0_10deleteListES6_ONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEEDaSH_SO_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

_QWORD *__destroy_helper_block_ea8_32c248_ZTSKZZN10WebPrivacy6Client13sendWithReplyINS_3XPC10DeleteListENS2_15DeleteListReplyEJRKN7Backend10RemoteListEZZNS0_10deleteListES6_ONSt3__18functionIFvNS_12MessageErrorEbEEEENK3__0clEvEUlOT_E_EEEvDpOT1_ENKUlSH_DpOT0_E_clIRKSI_JS8_EEEDaSH_SO_EUlvE_(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 64);
  if (result == (_QWORD *)(a1 + 40))
  {
    v3 = 4;
    result = (_QWORD *)(a1 + 40);
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::~__hash_table(uint64_t a1)
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

void std::__tree<Backend::RemoteList>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<Backend::RemoteList>::destroy(a1, *a2);
    std::__tree<Backend::RemoteList>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<Backend::RemoteList>::__assign_unique<Backend::RemoteList const*>(uint64_t **result, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  char v11;
  _QWORD v12[3];

  v5 = result;
  if (result[2])
  {
    v12[0] = result;
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = v6[1];
    else
      v8 = (uint64_t)v6;
    if (!v8)
    {
      v9 = 0;
      goto LABEL_16;
    }
    v9 = std::__tree<Backend::RemoteList>::_DetachedTreeCache::__detach_next(v8);
    for (i = (uint64_t)v9; a2 != a3; ++a2)
    {
      std::__tree<Backend::RemoteList>::__node_assign_unique(v5, a2, v8);
      if ((v11 & 1) != 0)
      {
        if (!i)
        {
          v9 = 0;
          v8 = 0;
          ++a2;
          break;
        }
        v9 = std::__tree<Backend::RemoteList>::_DetachedTreeCache::__detach_next(i);
        v8 = i;
        i = (uint64_t)v9;
      }
      else
      {
        v9 = (_QWORD *)i;
      }
    }
LABEL_16:
    v12[1] = v9;
    v12[2] = v8;
    result = (uint64_t **)std::__tree<Backend::RemoteList>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100]((uint64_t)v12);
  }
  while (a2 != a3)
  {
    result = std::__tree<Backend::RemoteList>::__emplace_unique_key_args<Backend::RemoteList,Backend::RemoteList const&>(v5, a2, a2);
    ++a2;
  }
  return result;
}

uint64_t **std::__tree<Backend::RemoteList>::__node_assign_unique(uint64_t **a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unsigned int v6;
  uint64_t **v7;
  unsigned int v8;

  v4 = a1 + 1;
  v5 = a1[1];
  v6 = *a2;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((unsigned __int8 *)v5 + 25);
        if (v6 >= v8)
          break;
        v5 = *v7;
        v4 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= v6)
        return v7;
      v5 = v7[1];
      if (!v5)
      {
        v4 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    *(_BYTE *)(a3 + 25) = v6;
    std::__tree<Backend::RemoteList>::__insert_node_at(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }
  return (uint64_t **)a3;
}

_QWORD *std::__tree<Backend::RemoteList>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<Backend::RemoteList>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<Backend::RemoteList>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<Backend::RemoteList>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__assign_unique<std::pair<Backend::RemoteList const,std::shared_ptr<Platform::SharedMemory>> const*>(_QWORD *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v10;
  uint64_t *v11;
  unsigned __int8 v12;

  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    while (v8 && a2 != a3)
    {
      v10 = v8;
      v11 = (uint64_t *)(a2 + 8);
      v12 = *a2;
      a2 += 24;
      *(_BYTE *)(v8 + 16) = v12;
      std::shared_ptr<Platform::SharedMemory>::operator=[abi:nn180100]((_QWORD *)(v8 + 24), v11);
      v8 = *(_QWORD *)v8;
      std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique(a1, v10);
    }
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__deallocate_node((uint64_t)a1, (_QWORD *)v8);
  }
  while (a2 != a3)
  {
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__emplace_unique_key_args<Backend::RemoteList,std::pair<Backend::RemoteList const,std::shared_ptr<Platform::SharedMemory>> const&>((uint64_t)a1, a2, (uint64_t)a2);
    a2 += 24;
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t **v6;

  v2 = (_QWORD *)a2;
  v5 = (unsigned __int8 *)(a2 + 16);
  v4 = *(unsigned __int8 *)(a2 + 16);
  *((_QWORD *)v5 - 1) = v4;
  v6 = std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique_prepare[abi:nn180100]((uint64_t)a1, v4, v5);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique_perform[abi:nn180100](a1, v2);
  return (uint64_t **)v2;
}

uint64_t **std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique_prepare[abi:nn180100](uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t ***v6;
  uint64_t **i;
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
    v6 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = *v6; i; i = (uint64_t **)*i)
      {
        v8 = (unint64_t)i[1];
        if (v8 == a2)
        {
          if (*((unsigned __int8 *)i + 16) == *a3)
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
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__rehash<true>(a1, v15);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique_perform[abi:nn180100](_QWORD *result, _QWORD *a2)
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

uint64_t **std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__emplace_unique_key_args<Backend::RemoteList,std::pair<Backend::RemoteList const,std::shared_ptr<Platform::SharedMemory>> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t ***v9;
  uint64_t **i;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[2];
  char v27;

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
    v9 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t **)*i)
      {
        v11 = (unint64_t)i[1];
        if (v11 == v6)
        {
          if (*((unsigned __int8 *)i + 16) == (_DWORD)v6)
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
  v12 = a1 + 16;
  v13 = operator new(0x28uLL);
  v26[0] = v13;
  v26[1] = a1 + 16;
  *v13 = 0;
  v13[1] = v6;
  *((_BYTE *)v13 + 16) = *(_BYTE *)a3;
  v14 = *(_QWORD *)(a3 + 16);
  v13[3] = *(_QWORD *)(a3 + 8);
  v13[4] = v14;
  if (v14)
  {
    v15 = (unint64_t *)(v14 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v27 = 1;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v7 || (float)(v18 * (float)v7) < v17)
  {
    v19 = 1;
    if (v7 >= 3)
      v19 = (v7 & (v7 - 1)) != 0;
    v20 = v19 | (2 * v7);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__rehash<true>(a1, v22);
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
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = v12;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v24 >= v7)
          v24 %= v7;
      }
      else
      {
        v24 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (uint64_t **)v26[0];
  v26[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>>>>::reset[abi:nn180100]((uint64_t)v26, 0);
  return i;
}

void sub_24A457740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::__assign_unique<std::pair<Backend::RemoteList const,std::array<unsigned char,14ul>> const*>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t i;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (char *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    while (v8 && a2 != a3)
    {
      v10 = (uint64_t)v8;
      v8[16] = *(_BYTE *)a2;
      v11 = *(_QWORD *)(a2 + 1);
      *(_QWORD *)(v8 + 23) = *(_QWORD *)(a2 + 7);
      *(_QWORD *)(v8 + 17) = v11;
      v8 = *(char **)v8;
      std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__node_insert_unique(a1, v10);
      a2 += 15;
    }
    if (v8)
    {
      do
      {
        v12 = *(char **)v8;
        operator delete(v8);
        v8 = v12;
      }
      while (v12);
    }
  }
  while (a2 != a3)
  {
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::__emplace_unique_key_args<Backend::RemoteList,std::pair<Backend::RemoteList const,std::array<unsigned char,14ul>> const&>((uint64_t)a1, (unsigned __int8 *)a2, (_QWORD *)a2);
    a2 += 15;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::array<unsigned char,14ul>>>>::__emplace_unique_key_args<Backend::RemoteList,std::pair<Backend::RemoteList const,std::array<unsigned char,14ul>> const&>(uint64_t a1, unsigned __int8 *a2, _QWORD *a3)
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
            if (*((unsigned __int8 *)v10 + 16) == (_DWORD)v6)
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
  v10[2] = *a3;
  *(_QWORD *)((char *)v10 + 23) = *(_QWORD *)((char *)a3 + 7);
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
    std::__hash_table<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::__unordered_map_hasher<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::hash<Backend::RemoteList>,std::equal_to<Backend::RemoteList>,true>,std::__unordered_map_equal<Backend::RemoteList,std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>,std::equal_to<Backend::RemoteList>,std::hash<Backend::RemoteList>,true>,std::allocator<std::__hash_value_type<Backend::RemoteList,std::shared_ptr<Platform::SharedMemory>>>>::__rehash<true>(a1, v17);
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

void sub_24A457A38(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 16))(v0);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(unint64_t *a1@<X8>)
{
  unint64_t v1;

  v1 = __ldaxr(a1);
  __stlxr(v1 - 1, a1);
}

void OUTLINED_FUNCTION_3()
{
  std::__shared_weak_count *v0;

  std::__shared_weak_count::__release_weak(v0);
}

uint64_t WPOSLogDatabase(void)
{
  if (WPOSLogDatabase(void)::onceToken != -1)
    dispatch_once(&WPOSLogDatabase(void)::onceToken, &__block_literal_global_3);
  return WPOSLogDatabase(void)::log;
}

void ___Z15WPOSLogDatabasev_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "Database");
  v1 = (void *)WPOSLogDatabase(void)::log;
  WPOSLogDatabase(void)::log = (uint64_t)v0;

}

uint64_t WPOSLogNetwork(void)
{
  if (WPOSLogNetwork(void)::onceToken != -1)
    dispatch_once(&WPOSLogNetwork(void)::onceToken, &__block_literal_global_5);
  return WPOSLogNetwork(void)::log;
}

void ___Z14WPOSLogNetworkv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "Network");
  v1 = (void *)WPOSLogNetwork(void)::log;
  WPOSLogNetwork(void)::log = (uint64_t)v0;

}

uint64_t WPOSLogSandbox(void)
{
  if (WPOSLogSandbox(void)::onceToken != -1)
    dispatch_once(&WPOSLogSandbox(void)::onceToken, &__block_literal_global_7);
  return WPOSLogSandbox(void)::log;
}

void ___Z14WPOSLogSandboxv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "Sandbox");
  v1 = (void *)WPOSLogSandbox(void)::log;
  WPOSLogSandbox(void)::log = (uint64_t)v0;

}

void ___Z13WPOSLogServerv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "Server");
  v1 = (void *)WPOSLogServer(void)::log;
  WPOSLogServer(void)::log = (uint64_t)v0;

}

uint64_t WPOSLogSharedMemory(void)
{
  if (WPOSLogSharedMemory(void)::onceToken != -1)
    dispatch_once(&WPOSLogSharedMemory(void)::onceToken, &__block_literal_global_11);
  return WPOSLogSharedMemory(void)::log;
}

void ___Z19WPOSLogSharedMemoryv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebPrivacy", "SharedMemory");
  v1 = (void *)WPOSLogSharedMemory(void)::log;
  WPOSLogSharedMemory(void)::log = (uint64_t)v0;

}

void sub_24A457CF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void Platform::getUserCacheDirectory(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  int v4;
  const std::error_category *v5;
  id v6;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    std::string::basic_string[abi:nn180100]<0>((_QWORD *)a1, (char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation"));
    v4 = 0;
  }
  else
  {
    v5 = std::generic_category();
    *(_QWORD *)a1 = 2;
    *(_QWORD *)(a1 + 8) = v5;
    v4 = 1;
  }
  *(_DWORD *)(a1 + 24) = v4;

}

void sub_24A457D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

std::string *Platform::stringByAppendingPathComponent@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  std::string *v5;
  int v6;
  BOOL v7;
  const std::string::value_type *v8;
  int v9;
  const std::string::value_type *v10;
  std::string::size_type v11;

  v5 = a3;
  LODWORD(a3) = *(char *)(a1 + 23);
  if ((a3 & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    LODWORD(a3) = *(char *)(a1 + 23);
    if ((a3 & 0x80000000) != 0)
    {
      v6 = 1;
      if (!*(_QWORD *)(a1 + 8))
        goto LABEL_12;
      goto LABEL_5;
    }
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v5->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  v6 = 0;
  if (!(_BYTE)a3)
    goto LABEL_12;
LABEL_5:
  a3 = (std::string *)a3;
  v7 = v6 == 0;
  if (v6)
    v8 = *(const std::string::value_type **)a1;
  else
    v8 = (const std::string::value_type *)a1;
  if (!v7)
    a3 = *(std::string **)(a1 + 8);
  if (a3->__r_.__value_.__s.__data_[(_QWORD)v8 - 1] != 47)
    std::string::append(v5, "/", 1uLL);
LABEL_12:
  v9 = *(char *)(a2 + 23);
  if (v9 >= 0)
    v10 = (const std::string::value_type *)a2;
  else
    v10 = *(const std::string::value_type **)a2;
  if (v9 >= 0)
    v11 = *(unsigned __int8 *)(a2 + 23);
  else
    v11 = *(_QWORD *)(a2 + 8);
  return std::string::append(v5, v10, v11);
}

void sub_24A457E84(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t Platform::createDirectoryWithIntermediateDirectories(const std::string *a1)
{
  unsigned int v1;
  const std::string *v2;
  int v3;
  std::string::size_type v4;
  std::string::size_type v5;
  std::string *v6;
  std::string *v7;
  int v8;
  const char *v9;
  std::string v11;
  stat v12;

  v2 = a1;
  if ((SHIBYTE(a1->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((_BYTE *)&a1->__r_.__value_.__s + 23))
    {
      v3 = a1->__r_.__value_.__s.__data_[0];
      goto LABEL_6;
    }
LABEL_32:
    v1 = 45;
LABEL_33:
    std::generic_category();
    return v1;
  }
  if (!a1->__r_.__value_.__l.__size_)
    goto LABEL_32;
  a1 = (const std::string *)a1->__r_.__value_.__r.__words[0];
  v3 = *(unsigned __int8 *)v2->__r_.__value_.__l.__data_;
LABEL_6:
  if (v3 != 47)
    goto LABEL_32;
  if (!access((const char *)a1, 7))
  {
    if ((v2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = (const char *)v2;
    else
      v9 = (const char *)v2->__r_.__value_.__r.__words[0];
    if (stat(v9, &v12) == -1)
    {
      v1 = *__error();
    }
    else
    {
      if ((v12.st_mode & 0xF000) == 0x4000)
        goto LABEL_39;
      v1 = 20;
    }
    goto LABEL_33;
  }
  v4 = 1;
  do
  {
    while (1)
    {
      v5 = std::string::find(v2, 47, v4);
      std::string::basic_string(&v11, v2, 0, v5, (std::allocator<char> *)&v12);
      v6 = (v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
         ? &v11
         : (std::string *)v11.__r_.__value_.__r.__words[0];
      if (stat((const char *)v6, &v12))
      {
        if (*__error() != 2
          || ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? (v7 = &v11)
            : (v7 = (std::string *)v11.__r_.__value_.__r.__words[0]),
              mkdir((const char *)v7, 0x1C0u) == -1))
        {
          v1 = *__error();
          v8 = 1;
LABEL_25:
          std::generic_category();
          goto LABEL_26;
        }
      }
      else if ((v12.st_mode & 0xF000) != 0x4000)
      {
        v8 = 1;
        v1 = 20;
        goto LABEL_25;
      }
      if (v5 == -1)
      {
        v8 = 3;
      }
      else
      {
        v4 = v5 + 1;
        v8 = 0;
      }
LABEL_26:
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
        break;
      if (v8)
        goto LABEL_30;
    }
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  while (!v8);
LABEL_30:
  if (v8 != 3)
    return v1;
LABEL_39:
  std::system_category();
  return 0;
}

void sub_24A458074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void WebPrivacy::createTrackingResourceRequestContentExtensionSource(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17[3];
  id *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v19[0] = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v16 = (id)objc_opt_new();
  v17[0] = &off_251BCE3B0;
  v17[1] = &v16;
  v18 = v17;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v17);
  v4 = v18;
  if (v18 == v17)
  {
    v5 = 4;
    v4 = v17;
    goto LABEL_7;
  }
  if (v18)
  {
    v5 = 5;
LABEL_7:
    (*((void (**)(void))*v4 + v5))();
  }
  if (objc_msgSend(v16, "count"))
  {
    v9 = v16;
    v10 = (void *)MEMORY[0x24BD10510]();
    v17[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 1, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v17[0];
    *a2 = v11;
    a2[1] = (uint64_t)v12;
    objc_autoreleasePoolPop(v10);

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v19[0] = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v15;
  }

}

void sub_24A458298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void WebPrivacy::createTrackerDomainNamesData(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v16[0] = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v13 = (id)objc_opt_new();
  v14[0] = &off_251BCE2D8;
  v14[1] = &v13;
  v15 = v14;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v14);
  v4 = v15;
  if (v15 == v14)
  {
    v5 = 4;
    v4 = v14;
    goto LABEL_7;
  }
  if (v15)
  {
    v5 = 5;
LABEL_7:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  if (objc_msgSend(v13, "count"))
  {
    v9 = v13;
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v16[0] = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v12);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  *a2 = v9;
  a2[1] = v10;

}

void sub_24A4584DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void WebPrivacy::createTrackerDomainNamesJSONData(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17[3];
  id *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v19[0] = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v16 = (id)objc_opt_new();
  v17[0] = &off_251BCE320;
  v17[1] = &v16;
  v18 = v17;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v17);
  v4 = v18;
  if (v18 == v17)
  {
    v5 = 4;
    v4 = v17;
    goto LABEL_7;
  }
  if (v18)
  {
    v5 = 5;
LABEL_7:
    (*((void (**)(void))*v4 + v5))();
  }
  if (objc_msgSend(v16, "count"))
  {
    v9 = v16;
    v10 = (void *)MEMORY[0x24BD10510]();
    v17[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 1, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v17[0];
    *a2 = v11;
    a2[1] = (uint64_t)v12;
    objc_autoreleasePoolPop(v10);

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v19[0] = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v15;
  }

}

void sub_24A458750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void WebPrivacy::createTrackerNetworkAddressesList(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v17[0] = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v14 = (id)objc_opt_new();
  v15[0] = &off_251BCE368;
  v15[1] = &v14;
  v16 = v15;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v15);
  v4 = v16;
  if (v16 == v15)
  {
    v5 = 4;
    v4 = v15;
    goto LABEL_7;
  }
  if (v16)
  {
    v5 = 5;
LABEL_7:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  if (v14)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3321888768;
    v13[2] = ___ZN10WebPrivacy33createTrackerNetworkAddressesListERKN8Platform9ArrayViewIhEE_block_invoke;
    v13[3] = &__block_descriptor_33_ea8_32c86_ZTSKZN10WebPrivacy33createTrackerNetworkAddressesListERKN8Platform9ArrayViewIhEEE3__1_e57_q24__0__WPNetworkAddressRange_8__WPNetworkAddressRange_16l;
    objc_msgSend(v14, "sortUsingComparator:", v13);
    v9 = v14;
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v17[0] = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v12);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  *a2 = v9;
  a2[1] = v10;

}

void sub_24A4589C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t ___ZN10WebPrivacy33createTrackerNetworkAddressesListERKN8Platform9ArrayViewIhEE_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void WebPrivacy::createStorageAccessUserAgentStringQuirksData(uint64_t a1@<X0>, WPStorageAccessUserAgentStringQuirksData **a2@<X8>)
{
  void *v3;
  WPStorageAccessUserAgentStringQuirksData *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 8))
  {
    WebPrivacy::rawJSONToDictionarys(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = -[WPStorageAccessUserAgentStringQuirksData initWithQuirks:]([WPStorageAccessUserAgentStringQuirksData alloc], "initWithQuirks:", v3);
      v5 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = CFSTR("List data not found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v10);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = 0;
    }
    *a2 = v4;
    a2[1] = (WPStorageAccessUserAgentStringQuirksData *)v5;

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = (WPStorageAccessUserAgentStringQuirksData *)v8;
  }
}

void sub_24A458BAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id WebPrivacy::rawJSONToDictionarys(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = (id)objc_opt_new();
  v6[0] = &off_251BCE3F8;
  v6[1] = &v5;
  v7 = v6;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v6);
  v2 = v7;
  if (v7 == v6)
  {
    v3 = 4;
    v2 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return v5;
}

void sub_24A458C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:

  _Unwind_Resume(a1);
}

void WebPrivacy::createStorageAccessPromptQuirksData(uint64_t a1@<X0>, WPStorageAccessPromptQuirksData **a2@<X8>)
{
  void *v3;
  WPStorageAccessPromptQuirksData *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 8))
  {
    WebPrivacy::rawJSONToDictionarys(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = -[WPStorageAccessPromptQuirksData initWithQuirks:]([WPStorageAccessPromptQuirksData alloc], "initWithQuirks:", v3);
      v5 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = CFSTR("List data not found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v10);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = 0;
    }
    *a2 = v4;
    a2[1] = (WPStorageAccessPromptQuirksData *)v5;

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = (WPStorageAccessPromptQuirksData *)v8;
  }
}

void sub_24A458E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void WebPrivacy::createRestrictedOpenerDomains(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v16[0] = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    *a2 = 0;
    a2[1] = v8;
    return;
  }
  v13 = (id)objc_opt_new();
  v14[0] = &off_251BCEDD8;
  v14[1] = &v13;
  v15 = v14;
  WebPrivacy::enumerateListRules(a1, (uint64_t)v14);
  v4 = v15;
  if (v15 == v14)
  {
    v5 = 4;
    v4 = v14;
    goto LABEL_7;
  }
  if (v15)
  {
    v5 = 5;
LABEL_7:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  if (objc_msgSend(v13, "count"))
  {
    v9 = v13;
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v16[0] = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("List data not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), 1001, v12);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  *a2 = v9;
  a2[1] = v10;

}

void sub_24A459034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE3F8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE3F8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v4 = (void *)MEMORY[0x24BD10510]();
  v5 = (void *)MEMORY[0x24BDD1608];
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v7, 0, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11 || v9)
  {
    v12 = WPOSLogAPI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    objc_msgSend(**(id **)(a1 + 8), "addObject:", v11);
  }

  objc_autoreleasePoolPop(v4);
}

void sub_24A459238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE3B0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE3B0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = (void *)MEMORY[0x24BD10510]();
  v5 = (void *)MEMORY[0x24BDD1608];
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v7, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (v9)
  {
    v10 = WPOSLogAPI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(**(id **)(a1 + 8), "addObject:", v8);
  }

  objc_autoreleasePoolPop(v4);
}

void sub_24A4593C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE290;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE290;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createLinkFilteringData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  WPLinkFilteringRule *v10;
  id v11;

  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") && (unint64_t)objc_msgSend(v11, "count") <= 3)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = &stru_251BCF340;
      if (objc_msgSend(v11, "count") == 2 || objc_msgSend(v11, "count") == 3)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");

        if (v7)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = &stru_251BCF340;
        }
      }
      v8 = &stru_251BCF340;
      if (objc_msgSend(v11, "count") == 3)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v9 = **(void ***)(a1 + 8);
      v10 = -[WPLinkFilteringRule initWithQueryParameter:domain:path:]([WPLinkFilteringRule alloc], "initWithQueryParameter:domain:path:", v4, v5, v8);
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

void sub_24A4595EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE2D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE2D8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  WPTrackingDomain *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  WPTrackingDomain *v20;

  v5 = (void *)MEMORY[0x24BD10510]();
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(";"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 4 || objc_msgSend(v7, "count") == 5)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      if (objc_msgSend(v7, "count") != 5
        || (objc_msgSend(v7, "objectAtIndexedSubscript:", 4),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1")),
            v10,
            (v11 & 1) != 0))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("1"));

        if ((v13 & 1) != 0)
        {
          v14 = **(void ***)(a1 + 8);
          v15 = [WPTrackingDomain alloc];
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v7, "count");
          if (v18 == 5)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v2 == 0;
          }
          else
          {
            v19 = 1;
          }
          v20 = -[WPTrackingDomain initWithHost:owner:canBlock:](v15, "initWithHost:owner:canBlock:", v16, v17, v19);
          objc_msgSend(v14, "addObject:", v20);

          if (v18 == 5)
        }
      }
    }
  }

  objc_autoreleasePoolPop(v5);
}

void sub_24A459880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (v4 == 5)
  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE320;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE320;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerDomainNamesJSONData(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BD10510]();
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(";"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 4 || objc_msgSend(v6, "count") == 5)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v22[0] = CFSTR("dn");
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v22[1] = CFSTR("n");
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      v22[2] = CFSTR("s");
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "count") == 5)
      {
        v20[0] = CFSTR("dn");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v13;
        v20[1] = CFSTR("dnbr");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v14;
        v20[2] = CFSTR("n");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2] = v15;
        v20[3] = CFSTR("s");
        objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[3] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
        v17 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v17;
      }
      v18 = **(void ***)(a1 + 8);
      objc_msgSend(v6, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v12, v19);

    }
  }

  objc_autoreleasePoolPop(v4);
}

void sub_24A459BCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCE368;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCE368;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackerNetworkAddressesList(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  int v17;
  void *v18;
  WPNetworkAddressRange *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  WPNetworkAddressRange *v24;
  _BYTE v25[8];
  int v26;

  v4 = (void *)MEMORY[0x24BD10510]();
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(";"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 3)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count") == 2)
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          objc_msgSend(v10, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("."));

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            v15 = 30;
          else
            v15 = 2;
          v25[1] = v15;
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = inet_pton(v15, (const char *)objc_msgSend(v16, "UTF8String"), &v26);

          if (v17)
          {
            v18 = **(void ***)(a1 + 8);
            v19 = [WPNetworkAddressRange alloc];
            objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "integerValue");
            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[WPNetworkAddressRange initWithAddress:netMaskLength:owner:host:](v19, "initWithAddress:netMaskLength:owner:host:", v25, v21, v22, v23);
            objc_msgSend(v18, "addObject:", v24);

          }
        }
      }

    }
  }

  objc_autoreleasePoolPop(v4);
}

void sub_24A459EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void std::__function::__func<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::~__func()
{
  JUMPOUT(0x24BD10324);
}

_QWORD *std::__function::__func<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_251BCEDD8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251BCEDD8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createRestrictedOpenerDomains(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WPRestrictedOpenerDomain *v11;

  v4 = (void *)MEMORY[0x24BD10510]();
  Platform::ArrayView<unsigned char>::copyToNSString(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if ((unint64_t)(v9 - 3) >= 0xFFFFFFFFFFFFFFFELL)
    {
      v10 = **(void ***)(a1 + 8);
      v11 = -[WPRestrictedOpenerDomain initWithDomain:openerType:]([WPRestrictedOpenerDomain alloc], "initWithDomain:openerType:", v7, v9);
      objc_msgSend(v10, "addObject:", v11);

    }
  }

  objc_autoreleasePoolPop(v4);
}

void sub_24A45A0D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

unsigned __int8 *Platform::computeSHA256@<X0>(_DWORD *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  int v3;
  CC_LONG v4;
  CC_LONG v5;

  v3 = *((char *)a1 + 23);
  v4 = a1[2];
  if (v3 >= 0)
  {
    v5 = v3;
  }
  else
  {
    a1 = *(_DWORD **)a1;
    v5 = v4;
  }
  return CC_SHA256(a1, v5, a2);
}

void Platform::description(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t i;
  unint64_t v5;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a2, 0x40uLL);
  for (i = 0; i != 32; ++i)
  {
    v5 = *(unsigned __int8 *)(a1 + i);
    std::string::push_back(a2, a0123456789abcd[v5 >> 4]);
    std::string::push_back(a2, a0123456789abcd[v5 & 0xF]);
  }
}

void Platform::SharedMemory::map(int *a1@<X0>, _QWORD *a2@<X8>)
{
  int v4;
  NSObject *v5;
  int v6;
  int *v7;
  off_t st_size;
  void *v9;
  _QWORD *v10;
  int v11;
  int *v12;
  stat v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  if (v4 == -1)
    Platform::SharedMemory::map();
  if (fstat(v4, &v13))
  {
    v5 = (id)WPOSLogSharedMemory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *a1;
      v7 = __error();
      Platform::SharedMemory::map((uint64_t)v7, (uint64_t)v14, v6);
    }
LABEL_5:

    *a2 = 0;
    a2[1] = 0;
    return;
  }
  st_size = v13.st_size;
  v9 = mmap(0, v13.st_size, 1, 1, *a1, 0);
  if (v9 == (void *)-1)
  {
    v5 = (id)WPOSLogSharedMemory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = *a1;
      v12 = __error();
      Platform::SharedMemory::map((uint64_t)v12, (uint64_t)v14, v11);
    }
    goto LABEL_5;
  }
  v10 = operator new(0x28uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = &off_251BCE478;
  v10[3] = v9;
  v10[4] = st_size;
  *a2 = v10 + 3;
  a2[1] = v10;
}

void sub_24A45A310(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *Platform::SharedMemory::SharedMemory(_QWORD *this, void *a2, uint64_t a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  return this;
}

_QWORD *Platform::SharedMemory::SharedMemory(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  *result = v2;
  result[1] = v3;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  *result = v2;
  result[1] = v3;
  return result;
}

void Platform::SharedMemory::~SharedMemory(Platform::SharedMemory *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    munmap(v2, *((_QWORD *)this + 1));
}

{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    munmap(v2, *((_QWORD *)this + 1));
}

void std::__shared_ptr_emplace<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared,std::allocator<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251BCE478;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared,std::allocator<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251BCE478;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD10324);
}

void *std::__shared_ptr_emplace<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared,std::allocator<Platform::SharedMemory::adopt(void *,unsigned long)::EnableMakeShared>>::__on_zero_shared(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 24);
  if (result)
    return (void *)munmap(result, *(_QWORD *)(a1 + 32));
  return result;
}

void OUTLINED_FUNCTION_0_1(float a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;

  *(float *)a3 = a1;
  *(_DWORD *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 8) = 1024;
  *(_DWORD *)(a3 + 10) = v4;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0xEu);
}

void sub_24A45A4B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

WebPrivacy *WebPrivacy::filterUsingCachedParameters(WebPrivacy *this, NSURL *a2)
{
  WebPrivacy *v2;
  void *v3;
  WebPrivacy *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WebPrivacy *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  WebPrivacy *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v2 = this;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  -[WebPrivacy query](v2, "query");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v47[5], "length"))
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    -[WebPrivacy _lp_highLevelDomain](v2, "_lp_highLevelDomain");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v41[5], "length"))
    {
      v19 = 0;
LABEL_20:
      _Block_object_dispose(&v40, 8);

      goto LABEL_21;
    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    v35 = (id)objc_opt_new();
    +[WPResources sharedInstance](WPResources, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = ___ZN10WebPrivacyL27filterUsingCachedParametersEP5NSURL_block_invoke;
    v24[3] = &unk_251BCEFA8;
    v26 = &v46;
    v27 = &v40;
    v4 = v2;
    v25 = v4;
    v28 = &v36;
    v29 = &v30;
    objc_msgSend(v3, "_doWithCachedLinkFilteringData:", v24);

    if (!*((_BYTE *)v37 + 24))
    {
      v19 = 0;
LABEL_19:

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v36, 8);
      v2 = v4;
      goto LABEL_20;
    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend((id)v31[5], "componentsJoinedByString:", CFSTR("&"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      v10 = objc_msgSend(v5, "rangeOfQuery");
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = WPOSLogAPI();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          WebPrivacy::filterUsingCachedParameters(v11, v12, v13, v14, v15, v16, v17, v18);
        v19 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v8, "replaceCharactersInRange:withString:", v10, v9, v6);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:encodingInvalidCharacters:", v8, 0);

      v5 = (void *)v20;
    }
    else
    {
      objc_msgSend(v5, "setQuery:", 0);
    }
    objc_msgSend(v5, "URL");
    v21 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v21;
    if (v21)
      v22 = (void *)v21;
    else
      v22 = v4;
    v19 = v4;
    v4 = v22;
LABEL_18:

    goto LABEL_19;
  }
  v19 = 0;
LABEL_21:
  _Block_object_dispose(&v46, 8);

  return v2;
}

void sub_24A45A7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);

  _Block_object_dispose((const void *)(v38 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_24A45A890()
{
  JUMPOUT(0x24A45A884);
}

void sub_24A45A95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A45AA18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A45ABE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_24A45ACFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A45B010(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_24A45B1A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24A45B288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_24A45B45C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A45B750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_24A45B824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c80_ZTSKZ67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__2(_QWORD *a1, uint64_t a2)
{
  id result;
  uint64_t v5;

  a1[4] = *(id *)(a2 + 32);
  result = *(id *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  a1[5] = result;
  a1[6] = v5;
  return result;
}

void __destroy_helper_block_ea8_32c80_ZTSKZ67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__2(uint64_t a1)
{

}

void sub_24A45B968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  va_list va;

  va_start(va, a6);
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)va);

  _Unwind_Resume(a1);
}

void checkForURLUsingFastPath(NSString *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  NSString *v9;

  v9 = a1;
  v3 = -[NSString rangeOfString:](v9, "rangeOfString:", CFSTR("http"));
  if (!v4)
  {
    v8 = 0;
    v5 = 0;
    goto LABEL_8;
  }
  if (v3)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {

LABEL_5:
    v5 = 0;
  }
  v8 = 1;
LABEL_8:
  *(_BYTE *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v5;

}

void sub_24A45BA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id WebPrivacy::applyOrderedReplacements<NSString>(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = v3;
  if (*a2 == a2[1])
  {
    v5 = v3;
  }
  else
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    for (i = a2[1]; i != *a2; objc_msgSend(v5, "replaceCharactersInRange:withString:", v7, v8, *(_QWORD *)(i + 16)))
    {
      v7 = *(_QWORD *)(i - 24);
      v8 = *(_QWORD *)(i - 16);
      i -= 24;
    }

  }
  return v5;
}

void sub_24A45BAE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void WebPrivacy::findOrderedReplacementRanges(WebPrivacy *this@<X0>, uint64_t a2@<X8>)
{
  WebPrivacy *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  void (*v13)(uint64_t);
  const char *v14;
  _QWORD v15[3];
  void **v16;

  v4 = this;
  v9 = 0;
  v10 = &v9;
  v11 = 0x4812000000;
  v12 = __Block_byref_object_copy__32;
  v13 = __Block_byref_object_dispose__33;
  v14 = "";
  memset(v15, 0, sizeof(v15));
  WebPrivacy::sharedLinkDetector(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebPrivacy length](v4, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSString_block_invoke;
  v8[3] = &unk_251BCEFD0;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v4, 0, 0, v6, v8);

  v7 = v10;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__init_with_size[abi:nn180100]<std::pair<_NSRange,NSString * {__strong}>*,std::pair<_NSRange,NSString * {__strong}>*>((char *)a2, v7[6], v7[7], 0xAAAAAAAAAAAAAAABLL * ((v7[7] - v7[6]) >> 3));
  _Block_object_dispose(&v9, 8);
  v16 = (void **)v15;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v16);

}

void sub_24A45BC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  *(_QWORD *)(v9 - 56) = v8;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)(v9 - 56));

  _Unwind_Resume(a1);
}

void sub_24A45BD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_24A45BE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void WebPrivacy::findOrderedReplacementRanges(void *a1, void *a2)
{
  id v3;
  dispatch_group_t v4;
  unint64_t *v5;
  unint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  _QWORD block[4];
  id v25;
  _QWORD *v26;
  std::__shared_weak_count *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  std::__shared_weak_count *v31;
  _QWORD *v32;
  std::__shared_weak_count *v33;

  v3 = a1;
  v23 = a2;
  v4 = dispatch_group_create();
  v5 = (unint64_t *)operator new(0x30uLL);
  v5[1] = 0;
  v6 = v5 + 1;
  v5[2] = 0;
  *v5 = (unint64_t)&off_251BCE440;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v32 = v5 + 3;
  v33 = (std::__shared_weak_count *)v5;
  WebPrivacy::sharedLinkDetector((WebPrivacy *)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "length");
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3321888768;
  v28[2] = ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEE_block_invoke;
  v28[3] = &unk_251BCE840;
  v10 = v4;
  v29 = v10;
  v30 = v5 + 3;
  v31 = (std::__shared_weak_count *)v5;
  do
    v11 = __ldxr(v6);
  while (__stxr(v11 + 1, v6));
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v3, 0, 0, v8, v28);

  block[0] = v9;
  block[1] = 3321888768;
  block[2] = ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEE_block_invoke_38;
  block[3] = &unk_251BCE778;
  v26 = v5 + 3;
  v27 = (std::__shared_weak_count *)v5;
  do
    v12 = __ldxr(v6);
  while (__stxr(v12 + 1, v6));
  v13 = v23;
  v25 = v13;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  v14 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v31;
  if (v31)
  {
    v18 = (unint64_t *)&v31->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  v20 = v33;
  if (v33)
  {
    v21 = (unint64_t *)&v33->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

}

void sub_24A45C090(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  va_list va;

  va_start(va, a16);
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](v19);

  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24A45C11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c81_ZTSKZ68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__3(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = MEMORY[0x24BD10684](*(_QWORD *)(a2 + 32));
  result = *(id *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c81_ZTSKZ68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__3(uint64_t a1)
{

}

void sub_24A45C2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a6);
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)va);

  _Unwind_Resume(a1);
}

id WebPrivacy::applyOrderedReplacements<NSAttributedString>(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = v3;
  if (*a2 == a2[1])
  {
    v5 = v3;
  }
  else
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    for (i = a2[1]; i != *a2; objc_msgSend(v5, "replaceCharactersInRange:withString:", v7, v8, *(_QWORD *)(i + 16)))
    {
      v7 = *(_QWORD *)(i - 24);
      v8 = *(_QWORD *)(i - 16);
      i -= 24;
    }

  }
  return v5;
}

void sub_24A45C3B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24A45C538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = v16;

  _Unwind_Resume(a1);
}

void sub_24A45C67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  void *v12;
  void *v13;
  void *v14;

  a12 = (void **)&a9;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&a12);

  _Unwind_Resume(a1);
}

void sub_24A45C700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c91_ZTSKZ78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__4(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = MEMORY[0x24BD10684](*(_QWORD *)(a2 + 32));
  result = *(id *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c91_ZTSKZ78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__4(uint64_t a1)
{

}

void sub_24A45C8A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24A45CA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  void *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_24A45CBF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24A45CCA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c95_ZTSKZ82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__5(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BD10684](*(_QWORD *)(a2 + 32));
  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_ea8_32c95_ZTSKZ82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__5(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));

}

void sub_24A45CE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A45D084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  void *v23;
  void *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v25);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_24A45D1F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24A45D2A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c105_ZTSKZ92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__6(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BD10684](*(_QWORD *)(a2 + 32));
  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_ea8_32c105_ZTSKZ92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__6(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));

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

void ___ZN10WebPrivacyL27filterUsingCachedParametersEP5NSURL_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  if (objc_msgSend(v26, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "componentsSeparatedByString:", CFSTR("&"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v4)
    {
      v25 = *(_QWORD *)v37;
      *(_QWORD *)&v5 = 138412290;
      v23 = v5;
      v24 = v3;
      do
      {
        v6 = 0;
        v27 = v4;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v3);
          v7 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v6);
          v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("="));
          v9 = (uint64_t)v7;
          if (v8 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "substringToIndex:", v8);
            v9 = objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v26, "objectForKey:", v9, v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v29 = v6;
          v30 = (void *)v9;
          if (!v10)
            goto LABEL_24;
          objc_msgSend(v10, "domains");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v11;
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v11, "domains");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v13, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

          }
          else
          {
            v28 = 1;
          }

          objc_msgSend(v11, "paths");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count") == 0;

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v11, "paths");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 32), "path");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v20) = objc_msgSend(v21, "rangeOfString:", v20) != 0x7FFFFFFFFFFFFFFFLL;

                v15 |= v20;
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            }
            while (v17);
          }

          v11 = v31;
          if ((v28 & v15) == 1)
          {
            v22 = WPOSLogAPI();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v41 = v30;
              _os_log_impl(&dword_24A44A000, v22, OS_LOG_TYPE_INFO, "Removed known tracking query parameter: %@", buf, 0xCu);
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

          }
          else
          {
LABEL_24:

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v7);
          }

          v6 = v29 + 1;
          v3 = v24;
        }
        while (v29 + 1 != v27);
        v4 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v4);
    }

  }
}

void sub_24A45D684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__32(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v1);
}

id WebPrivacy::sharedLinkDetector(WebPrivacy *this)
{
  if (WebPrivacy::sharedLinkDetector(void)::onceToken != -1)
    dispatch_once(&WebPrivacy::sharedLinkDetector(void)::onceToken, &__block_literal_global_1);
  return (id)WebPrivacy::sharedLinkDetector(void)::detector;
}

void ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSString_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int64x2_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;
  uint64_t v31;
  int64x2_t v32;
  uint64_t v33;
  int64x2_t *v34;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfRanges") == 1)
  {
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_wp_urlByRemovingTrackingInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v5, "absoluteString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          v9 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
          v10 = objc_msgSend(v3, "range");
          v12 = v11;
          v13 = v8;
          v14 = v9[4].u64[0];
          v15 = (uint64_t *)v9[3].i64[1];
          if ((unint64_t)v15 >= v14)
          {
            v17 = v9[3].i64[0];
            v18 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v15 - v17) >> 3);
            v19 = v18 + 1;
            if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - v17) >> 3);
            if (2 * v20 > v19)
              v19 = 2 * v20;
            if (v20 >= 0x555555555555555)
              v21 = 0xAAAAAAAAAAAAAAALL;
            else
              v21 = v19;
            v34 = v9 + 4;
            v22 = (char *)std::allocator<std::pair<_NSRange,NSString * {__strong}>>::allocate_at_least[abi:nn180100]((uint64_t)v9[4].i64, v21);
            v24 = (uint64_t *)&v22[24 * v18];
            *v24 = v10;
            v24[1] = v12;
            v24[2] = (uint64_t)v13;
            v26 = v9[3].i64[0];
            v25 = v9[3].u64[1];
            if (v25 == v26)
            {
              v29 = vdupq_n_s64(v25);
              v27 = &v22[24 * v18];
            }
            else
            {
              v27 = &v22[24 * v18];
              do
              {
                *(_OWORD *)(v27 - 24) = *(_OWORD *)(v25 - 24);
                v28 = *(_QWORD *)(v25 - 8);
                *(_QWORD *)(v25 - 8) = 0;
                *((_QWORD *)v27 - 1) = v28;
                v27 -= 24;
                v25 -= 24;
              }
              while (v25 != v26);
              v29 = v9[3];
            }
            v16 = v24 + 3;
            v9[3].i64[0] = (uint64_t)v27;
            v9[3].i64[1] = (uint64_t)(v24 + 3);
            v32 = v29;
            v30 = v9[4].i64[0];
            v9[4].i64[0] = (uint64_t)&v22[24 * v23];
            v33 = v30;
            v31 = v29.i64[0];
            std::__split_buffer<std::pair<_NSRange,NSString * {__strong}>>::~__split_buffer((uint64_t)&v31);
          }
          else
          {
            *v15 = v10;
            v15[1] = v12;
            v16 = v15 + 3;
            v15[2] = (uint64_t)v13;
          }
          v9[3].i64[1] = (uint64_t)v16;
        }

      }
    }

  }
}

void sub_24A45D9C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void ___ZN10WebPrivacyL18sharedLinkDetectorEv_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 32, &v10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v10;
  v2 = (void *)WebPrivacy::sharedLinkDetector(void)::detector;
  WebPrivacy::sharedLinkDetector(void)::detector = v0;

  if (v1)
  {
    v3 = WPOSLogAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ___ZN10WebPrivacyL18sharedLinkDetectorEv_block_invoke_cold_1((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);
  }

}

void sub_24A45DA98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *std::allocator<std::pair<_NSRange,NSString * {__strong}>>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a2);
}

uint64_t std::__split_buffer<std::pair<_NSRange,NSString * {__strong}>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *std::vector<std::pair<_NSRange,NSString * {__strong}>>::__init_with_size[abi:nn180100]<std::pair<_NSRange,NSString * {__strong}>*,std::pair<_NSRange,NSString * {__strong}>*>(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<_NSRange,NSString * {__strong}>>::__vallocate[abi:nn180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      *(_OWORD *)v7 = *(_OWORD *)a2;
      result = (char *)*(id *)(a2 + 16);
      *(_QWORD *)(v7 + 16) = result;
      v7 += 24;
      a2 += 24;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

char *std::vector<std::pair<_NSRange,NSString * {__strong}>>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    abort();
  result = (char *)std::allocator<std::pair<_NSRange,NSString * {__strong}>>::allocate_at_least[abi:nn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;
  id *v6;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 3;

        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEE_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  id v8;
  id v9;
  unint64_t *v10;
  unint64_t v11;
  id v12;
  _QWORD *v13;
  unint64_t *v14;
  unint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  std::__shared_weak_count *v24;
  void *v25;

  v23 = a2;
  if (objc_msgSend(v23, "numberOfRanges") == 1)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    objc_msgSend(v23, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(std::__shared_weak_count **)(a1 + 48);
    v24 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = *(id *)(a1 + 32);
    v25 = v8;
    v9 = v23;
    if (v4)
    {
      v10 = (unint64_t *)&v4->__shared_owners_;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = v8;
    v13 = malloc_type_malloc(0x40uLL, 0x10E0040F7CBCFC1uLL);
    *v13 = MEMORY[0x24BDAC758];
    v13[1] = 50331650;
    v13[2] = _ZZN8Platform8BlockPtrIFvP5NSURLEE12fromCallableIZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS9_4pairI8_NSRangeU8__strongS8_EENS9_9allocatorISE_EEEEEEUb_E3__0EES4_T_ENUlPvS2_E_8__invokeESN_S2_;
    v13[3] = &_ZZN8Platform8BlockPtrIFvP5NSURLEE12fromCallableIZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS9_4pairI8_NSRangeU8__strongS8_EENS9_9allocatorISE_EEEEEEUb_E3__0EES4_T_E10descriptor;
    v13[4] = v5;
    v13[5] = v4;
    if (v4)
    {
      v14 = (unint64_t *)&v4->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
      v16 = v12;
      v13[6] = v16;
      v13[7] = v9;
      v17 = (void *)MEMORY[0x24BD10684](v13);

      do
        v18 = __ldaxr(v14);
      while (__stlxr(v18 - 1, v14));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      v19 = v12;
      v13[6] = v19;
      v13[7] = v9;
      v17 = (void *)MEMORY[0x24BD10684](v13);

    }
    v20 = (void *)MEMORY[0x24BD10684](v17);
    objc_msgSend(v3, "_wp_removeTrackingInformation:", v20);

    if (v24)
    {
      v21 = (unint64_t *)&v24->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

  }
}

void sub_24A45DE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  void *v11;
  void *v12;
  void *v13;

  _ZZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEEEUb_EN3__0D1Ev((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t _ZZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEEEUb_EN3__0D1Ev(uint64_t a1)
{

  return std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](a1);
}

uint64_t __copy_helper_block_ea8_40c98_ZTSNSt3__110shared_ptrINS_6vectorINS_4pairI8_NSRangeU8__strongP8NSStringEENS_9allocatorIS7_EEEEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_ea8_40c98_ZTSNSt3__110shared_ptrINS_6vectorINS_4pairI8_NSRangeU8__strongP8NSStringEENS_9allocatorIS7_EEEEEE(uint64_t a1)
{
  return std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](a1 + 40);
}

uint64_t ___ZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEE_block_invoke_38(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(uint64_t **)(a1 + 40);
  v3 = *v2;
  v4 = (unint64_t *)v2[1];
  v5 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v4 - *v2) >> 3));
  if (v4 == (unint64_t *)v3)
    v6 = 0;
  else
    v6 = v5;
  _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Lb0EEEvT1_SJ_T0_NS_15iterator_traitsISJ_E15difference_typeEb(v3, v4, v6, 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void std::__shared_ptr_emplace<std::vector<std::pair<_NSRange,NSString * {__strong}>>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251BCE440;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<std::pair<_NSRange,NSString * {__strong}>>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251BCE440;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD10324);
}

void std::__shared_ptr_emplace<std::vector<std::pair<_NSRange,NSString * {__strong}>>>::__on_zero_shared(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 24);
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v1);
}

void _ZZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEEEUb_EN3__0clEP5NSURL(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  _QWORD v29[5];

  v3 = a2;
  v4 = *(id *)(a1 + 16);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 24), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v3, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v8 = *(char ***)a1;
        v9 = objc_msgSend(*(id *)(a1 + 24), "range");
        v11 = v10;
        v12 = v7;
        v13 = (unint64_t)v8[2];
        v14 = (uint64_t *)v8[1];
        if ((unint64_t)v14 >= v13)
        {
          v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - *v8) >> 3);
          v17 = v16 + 1;
          if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - (_QWORD)*v8) >> 3);
          if (2 * v18 > v17)
            v17 = 2 * v18;
          if (v18 >= 0x555555555555555)
            v19 = 0xAAAAAAAAAAAAAAALL;
          else
            v19 = v17;
          v29[4] = v8 + 2;
          v20 = (char *)std::allocator<std::pair<_NSRange,NSString * {__strong}>>::allocate_at_least[abi:nn180100]((uint64_t)(v8 + 2), v19);
          v22 = (uint64_t *)&v20[24 * v16];
          *v22 = v9;
          v22[1] = v11;
          v22[2] = (uint64_t)v12;
          v24 = *v8;
          v23 = v8[1];
          if (v23 == *v8)
          {
            v27 = v8[1];
            v25 = &v20[24 * v16];
          }
          else
          {
            v25 = &v20[24 * v16];
            do
            {
              *(_OWORD *)(v25 - 24) = *(_OWORD *)(v23 - 24);
              v26 = *((_QWORD *)v23 - 1);
              *((_QWORD *)v23 - 1) = 0;
              *((_QWORD *)v25 - 1) = v26;
              v25 -= 24;
              v23 -= 24;
            }
            while (v23 != v24);
            v27 = *v8;
            v23 = v8[1];
          }
          v15 = (char *)(v22 + 3);
          *v8 = v25;
          v29[0] = v27;
          v29[1] = v27;
          v8[1] = (char *)(v22 + 3);
          v29[2] = v23;
          v28 = v8[2];
          v8[2] = &v20[24 * v21];
          v29[3] = v28;
          std::__split_buffer<std::pair<_NSRange,NSString * {__strong}>>::~__split_buffer((uint64_t)v29);
        }
        else
        {
          *v14 = v9;
          v14[1] = v11;
          v15 = (char *)(v14 + 3);
          v14[2] = (uint64_t)v12;
        }
        v8[1] = v15;
      }

    }
  }
  dispatch_group_leave(v4);

}

void sub_24A45E1D8(_Unwind_Exception *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;

  dispatch_group_leave(v2);
  _Unwind_Resume(a1);
}

uint64_t _ZZN8Platform8BlockPtrIFvP5NSURLEE12fromCallableIZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS9_4pairI8_NSRangeU8__strongS8_EENS9_9allocatorISE_EEEEEEUb_E3__0EES4_T_ENUlPKvE_8__invokeESO_(uint64_t a1)
{
  uint64_t v2;

  v2 = a1 + 32;

  return std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](v2);
}

void _ZZN8Platform8BlockPtrIFvP5NSURLEE12fromCallableIZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS9_4pairI8_NSRangeU8__strongS8_EENS9_9allocatorISE_EEEEEEUb_E3__0EES4_T_ENUlPvS2_E_8__invokeESN_S2_(uint64_t a1, void *a2)
{
  _ZZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONSt3__16vectorINS2_4pairI8_NSRangeU8__strongS1_EENS2_9allocatorIS7_EEEEEEUb_EN3__0clEP5NSURL(a1 + 32, a2);
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Lb0EEEvT1_SJ_T0_NS_15iterator_traitsISJ_E15difference_typeEb(uint64_t a1, unint64_t *a2, uint64_t a3, char a4)
{
  unint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;
  unint64_t v23;
  __int128 *v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  BOOL v32;
  __int128 *v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  _BOOL4 v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  void *v44;
  BOOL v45;
  unint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  BOOL v49;
  BOOL v50;
  unint64_t v51;
  unint64_t v52;
  BOOL v53;
  BOOL v54;
  unint64_t *v55;
  _BOOL4 v56;
  __int128 *v57;
  unint64_t v58;
  unint64_t v59;
  BOOL v60;
  BOOL v61;
  unint64_t v62;
  unint64_t v63;
  _BOOL4 v64;
  _BOOL4 v65;
  unint64_t v66;
  unint64_t v67;
  BOOL v68;
  BOOL v69;
  uint64_t v70;
  void *v71;
  void *v72;
  unint64_t v73;
  _BOOL4 v74;
  unint64_t *v75;
  BOOL v76;
  char v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  _BOOL4 v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  BOOL v90;
  _QWORD *v91;
  void *v92;
  int64_t v93;
  int64_t v94;
  int64_t v95;
  uint64_t v96;
  unint64_t *v97;
  unint64_t v98;
  _BOOL4 v99;
  unint64_t *v100;
  unint64_t v101;
  unint64_t v102;
  BOOL v103;
  uint64_t v104;
  unint64_t *v105;
  unint64_t v106;
  void *v107;
  unint64_t v108;
  _BOOL4 v109;
  _BOOL4 v110;
  _BOOL4 v111;
  void *v112;
  int64_t v113;
  _OWORD *v114;
  uint64_t v115;
  _OWORD *v116;
  unint64_t v117;
  _QWORD *v118;
  unint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  _BOOL4 v123;
  unint64_t v124;
  void *v125;
  unint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t *v131;
  unint64_t v132;
  unint64_t v133;
  _BOOL4 v134;
  _OWORD *v135;
  unint64_t v136;
  unint64_t *v137;
  unint64_t v138;
  void *v139;
  BOOL v140;
  void *v141;
  void **v143;
  uint64_t v144;
  void *v145;
  unint64_t v146;
  _BOOL4 v147;
  void *v148;
  void **v149;
  void **v150;
  void *v151;
  void *v152;
  void *v153;
  BOOL v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t *v160;
  __int128 v161;

LABEL_1:
  v157 = (uint64_t)(a2 - 6);
  v158 = (uint64_t)(a2 - 3);
  v160 = a2;
  v156 = (uint64_t)(a2 - 9);
  v7 = a1;
  while (2)
  {
    a1 = v7;
    v8 = v160;
    v9 = (uint64_t)v160 - v7;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v160 - v7) >> 3);
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v73 = *(v160 - 3);
        v76 = v73 == *(_QWORD *)a1;
        v74 = v73 < *(_QWORD *)a1;
        if (v76)
          v74 = *(v160 - 2) < *(_QWORD *)(a1 + 8);
        if (v74)
          std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)(v160 - 3));
        return;
      case 3:
        _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), v158);
        return;
      case 4:
        _ZNSt3__17__sort4B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEvT1_SJ_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), a1 + 48, v158);
        return;
      case 5:
        _ZNSt3__124__sort5_maybe_branchlessB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Li0EEEvT1_SJ_SJ_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), a1 + 48, a1 + 72, v158);
        return;
      default:
        if (v9 <= 575)
        {
          v75 = (unint64_t *)(a1 + 24);
          v76 = (unint64_t *)a1 == v160 || v75 == v160;
          v77 = v76;
          if ((a4 & 1) != 0)
          {
            if ((v77 & 1) == 0)
            {
              v78 = 0;
              v79 = (unint64_t *)a1;
              do
              {
                v80 = v75;
                v81 = v79[3];
                v82 = v79[4];
                v83 = v81 < *v79;
                if (v81 == *v79)
                  v83 = v82 < v79[1];
                if (v83)
                {
                  v84 = v79[5];
                  v79[5] = 0;
                  v85 = v78;
                  while (1)
                  {
                    v86 = a1 + v85;
                    *(_OWORD *)(v86 + 24) = *(_OWORD *)(a1 + v85);
                    v87 = *(_QWORD *)(a1 + v85 + 16);
                    *(_QWORD *)(v86 + 16) = 0;
                    v88 = *(void **)(a1 + v85 + 40);
                    *(_QWORD *)(v86 + 40) = v87;

                    if (!v85)
                      break;
                    v89 = *(_QWORD *)(v86 - 24);
                    v76 = v81 == v89;
                    v90 = v81 < v89;
                    if (v76)
                      v90 = v82 < *(_QWORD *)(v86 - 16);
                    v85 -= 24;
                    if (!v90)
                    {
                      v91 = (_QWORD *)(a1 + v85 + 24);
                      goto LABEL_102;
                    }
                  }
                  v91 = (_QWORD *)a1;
LABEL_102:
                  *v91 = v81;
                  v91[1] = v82;
                  v92 = (void *)v91[2];
                  v91[2] = v84;

                }
                v75 = v80 + 3;
                v78 += 24;
                v79 = v80;
              }
              while (v80 + 3 != v160);
            }
          }
          else if ((v77 & 1) == 0)
          {
            v143 = (void **)(a1 + 40);
            do
            {
              v144 = (uint64_t)v75;
              v145 = *(void **)(a1 + 24);
              v146 = *(_QWORD *)(a1 + 32);
              v147 = (unint64_t)v145 < *(_QWORD *)a1;
              if (v145 == *(void **)a1)
                v147 = v146 < *(_QWORD *)(a1 + 8);
              if (v147)
              {
                v148 = *(void **)(a1 + 40);
                *(_QWORD *)(a1 + 40) = 0;
                v149 = v143;
                v150 = v143;
                do
                {
                  *((_OWORD *)v149 - 1) = *(_OWORD *)(v149 - 5);
                  v151 = *(v150 - 3);
                  v150 -= 3;
                  *v150 = 0;
                  v152 = *v149;
                  *v149 = v151;

                  v153 = *(v149 - 8);
                  v76 = v145 == v153;
                  v154 = v145 < v153;
                  if (v76)
                    v154 = v146 < (unint64_t)*(v149 - 7);
                  v149 = v150;
                }
                while (v154);
                *(v150 - 2) = v145;
                *(v150 - 1) = (void *)v146;
                v155 = *v150;
                *v150 = v148;

              }
              v75 = (unint64_t *)(v144 + 24);
              v143 += 3;
              a1 = v144;
            }
            while ((unint64_t *)(v144 + 24) != v160);
          }
          return;
        }
        if (!a3)
        {
          if ((unint64_t *)a1 == v160)
            return;
          v93 = (unint64_t)(v10 - 2) >> 1;
          v94 = v93;
          do
          {
            v95 = v94;
            if (v93 >= v94)
            {
              v96 = (2 * v94) | 1;
              v97 = (unint64_t *)(a1 + 24 * v96);
              if (2 * v95 + 2 >= v10)
              {
                v98 = *v97;
              }
              else
              {
                v98 = v97[3];
                v99 = v97[1] < v97[4];
                if (*v97 != v98)
                  v99 = *v97 < v98;
                if (v99)
                  v97 += 3;
                else
                  v98 = *v97;
                if (v99)
                  v96 = 2 * v95 + 2;
              }
              v100 = (unint64_t *)(a1 + 24 * v95);
              v102 = *v100;
              v101 = v100[1];
              v76 = v98 == *v100;
              v103 = v98 < *v100;
              if (v76)
                v103 = v97[1] < v101;
              if (!v103)
              {
                v104 = a1 + 24 * v95;
                v159 = *(_QWORD *)(v104 + 16);
                *(_QWORD *)(v104 + 16) = 0;
                do
                {
                  v105 = v100;
                  v100 = v97;
                  *(_OWORD *)v105 = *(_OWORD *)v97;
                  v106 = v97[2];
                  v100[2] = 0;
                  v107 = (void *)v105[2];
                  v105[2] = v106;

                  if (v93 < v96)
                    break;
                  v97 = (unint64_t *)(a1 + 24 * ((2 * v96) | 1));
                  if (2 * v96 + 2 >= v10)
                  {
                    v108 = *v97;
                    v96 = (2 * v96) | 1;
                  }
                  else
                  {
                    v108 = v97[3];
                    v109 = v97[1] < v97[4];
                    if (*v97 != v108)
                      v109 = *v97 < v108;
                    if (v109)
                      v97 += 3;
                    else
                      v108 = *v97;
                    v96 = v109 ? 2 * v96 + 2 : (2 * v96) | 1;
                  }
                  v110 = v97[1] < v101;
                  v76 = v108 == v102;
                  v111 = v108 < v102;
                  if (!v76)
                    v110 = v111;
                }
                while (!v110);
                *v100 = v102;
                v100[1] = v101;
                v112 = (void *)v100[2];
                v100[2] = v159;

              }
            }
            v94 = v95 - 1;
          }
          while (v95);
          v113 = v9 / 0x18uLL;
          v114 = v160;
          while (2)
          {
            v115 = 0;
            v116 = v114;
            v161 = *(_OWORD *)a1;
            v117 = *(_QWORD *)(a1 + 16);
            *(_QWORD *)(a1 + 16) = 0;
            v118 = (_QWORD *)a1;
            do
            {
              v119 = &v118[3 * v115 + 3];
              v120 = (2 * v115) | 1;
              v121 = 2 * v115 + 2;
              if (v121 < v113)
              {
                v122 = v119[3];
                v76 = *v119 == v122;
                v123 = *v119 < v122;
                if (v76)
                  v123 = v119[1] < v119[4];
                if (v123)
                {
                  v119 += 3;
                  v120 = v121;
                }
              }
              *(_OWORD *)v118 = *(_OWORD *)v119;
              v124 = v119[2];
              v119[2] = 0;
              v125 = (void *)v118[2];
              v118[2] = v124;

              v118 = v119;
              v115 = v120;
            }
            while (v120 <= (uint64_t)((unint64_t)(v113 - 2) >> 1));
            v114 = (_OWORD *)((char *)v116 - 24);
            if (v119 != (unint64_t *)((char *)v116 - 24))
            {
              *(_OWORD *)v119 = *v114;
              v126 = *((_QWORD *)v116 - 1);
              *((_QWORD *)v116 - 1) = 0;
              v127 = (void *)v119[2];
              v119[2] = v126;

              *v114 = v161;
              v128 = (void *)*((_QWORD *)v116 - 1);
              *((_QWORD *)v116 - 1) = v117;

              v129 = (uint64_t)v119 - a1 + 24;
              if (v129 >= 25)
              {
                v130 = (v129 / 0x18uLL - 2) >> 1;
                v131 = (unint64_t *)(a1 + 24 * v130);
                v133 = *v119;
                v132 = v119[1];
                v134 = *v131 < *v119;
                if (*v131 == *v119)
                  v134 = v131[1] < v132;
                if (v134)
                {
                  v135 = v114;
                  v136 = v119[2];
                  v119[2] = 0;
                  do
                  {
                    v137 = v119;
                    v119 = v131;
                    *(_OWORD *)v137 = *(_OWORD *)v131;
                    v138 = v131[2];
                    v119[2] = 0;
                    v139 = (void *)v137[2];
                    v137[2] = v138;

                    if (!v130)
                      break;
                    v130 = (v130 - 1) >> 1;
                    v131 = (unint64_t *)(a1 + 24 * v130);
                    v140 = *v131 < v133;
                    if (*v131 == v133)
                      v140 = v131[1] < v132;
                  }
                  while (v140);
                  *v119 = v133;
                  v119[1] = v132;
                  v141 = (void *)v119[2];
                  v119[2] = v136;
                  v114 = v135;
LABEL_158:

                }
              }
              if (v113-- <= 2)
                return;
              continue;
            }
            break;
          }
          *(_OWORD *)v119 = v161;
          v141 = (void *)v119[2];
          v119[2] = v117;
          goto LABEL_158;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = (unint64_t *)(a1 + 24 * ((unint64_t)v10 >> 1));
        if ((unint64_t)v9 < 0xC01)
        {
          _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_(v12, (unint64_t *)a1, v158);
        }
        else
        {
          _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)a1, v12, v158);
          v13 = 3 * v11;
          _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)(a1 + 24), (unint64_t *)(a1 + 8 * v13 - 24), v157);
          _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)(a1 + 48), (unint64_t *)(a1 + 24 + 8 * v13), v156);
          v8 = v160;
          _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)(a1 + 8 * v13 - 24), v12, a1 + 24 + 8 * v13);
          std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)v12);
        }
        --a3;
        v14 = *(_QWORD *)a1;
        if ((a4 & 1) == 0)
        {
          v16 = *(_QWORD *)(a1 - 24);
          v15 = *(_QWORD *)(a1 + 8);
          v76 = v16 == v14;
          v17 = v16 < v14;
          if (v76)
            v17 = *(_QWORD *)(a1 - 16) < v15;
          if (v17)
            goto LABEL_13;
          v46 = v8;
          v47 = *(_QWORD *)(a1 + 16);
          *(_QWORD *)(a1 + 16) = 0;
          v48 = *(v46 - 3);
          v49 = v15 < *(v46 - 2);
          v76 = v14 == v48;
          v50 = v14 < v48;
          if (v76)
            v50 = v49;
          if (v50)
          {
            v7 = a1;
            do
            {
              v51 = *(_QWORD *)(v7 + 24);
              v52 = *(_QWORD *)(v7 + 32);
              v7 += 24;
              v53 = v15 < v52;
              v76 = v14 == v51;
              v54 = v14 < v51;
              if (v76)
                v54 = v53;
            }
            while (!v54);
          }
          else
          {
            v55 = (unint64_t *)(a1 + 24);
            do
            {
              v7 = (unint64_t)v55;
              if (v55 >= v160)
                break;
              v56 = v15 < v55[1];
              if (v14 != *v55)
                v56 = v14 < *v55;
              v55 += 3;
            }
            while (!v56);
          }
          v57 = (__int128 *)v160;
          if (v7 < (unint64_t)v160)
          {
            v57 = (__int128 *)v160;
            do
            {
              v58 = *((_QWORD *)v57 - 3);
              v59 = *((_QWORD *)v57 - 2);
              v57 = (__int128 *)((char *)v57 - 24);
              v60 = v15 < v59;
              v76 = v14 == v58;
              v61 = v14 < v58;
              if (v76)
                v61 = v60;
            }
            while (v61);
          }
          while (v7 < (unint64_t)v57)
          {
            std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)v7, v57);
            do
            {
              v62 = *(_QWORD *)(v7 + 24);
              v63 = *(_QWORD *)(v7 + 32);
              v7 += 24;
              v64 = v15 < v63;
              v76 = v14 == v62;
              v65 = v14 < v62;
              if (v76)
                v65 = v64;
            }
            while (!v65);
            do
            {
              v66 = *((_QWORD *)v57 - 3);
              v67 = *((_QWORD *)v57 - 2);
              v57 = (__int128 *)((char *)v57 - 24);
              v68 = v15 < v67;
              v76 = v14 == v66;
              v69 = v14 < v66;
              if (v76)
                v69 = v68;
            }
            while (v69);
          }
          if (v7 - 24 != a1)
          {
            *(_OWORD *)a1 = *(_OWORD *)(v7 - 24);
            v70 = *(_QWORD *)(v7 - 8);
            *(_QWORD *)(v7 - 8) = 0;
            v71 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v70;

          }
          *(_QWORD *)(v7 - 24) = v14;
          *(_QWORD *)(v7 - 16) = v15;
          v72 = *(void **)(v7 - 8);
          *(_QWORD *)(v7 - 8) = v47;

          a4 = 0;
          continue;
        }
        v15 = *(_QWORD *)(a1 + 8);
LABEL_13:
        v18 = 0;
        v19 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;
        do
        {
          v20 = *(_QWORD *)(a1 + v18 + 24);
          v21 = *(_QWORD *)(a1 + v18 + 32) < v15;
          v76 = v20 == v14;
          v22 = v20 < v14;
          if (!v76)
            v21 = v22;
          v18 += 24;
        }
        while (v21);
        v23 = a1 + v18;
        v24 = (__int128 *)v8;
        if (v18 == 24)
        {
          v24 = (__int128 *)v8;
          do
          {
            if (v23 >= (unint64_t)v24)
              break;
            v29 = *((_QWORD *)v24 - 3);
            v30 = *((_QWORD *)v24 - 2);
            v24 = (__int128 *)((char *)v24 - 24);
            v31 = v30 < v15;
            v76 = v29 == v14;
            v32 = v29 < v14;
            if (v76)
              v32 = v31;
          }
          while (!v32);
        }
        else
        {
          do
          {
            v25 = *((_QWORD *)v24 - 3);
            v26 = *((_QWORD *)v24 - 2);
            v24 = (__int128 *)((char *)v24 - 24);
            v27 = v26 < v15;
            v76 = v25 == v14;
            v28 = v25 < v14;
            if (v76)
              v28 = v27;
          }
          while (!v28);
        }
        v7 = v23;
        if (v23 < (unint64_t)v24)
        {
          v33 = v24;
          do
          {
            std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)v7, v33);
            do
            {
              v34 = *(_QWORD *)(v7 + 24);
              v35 = *(_QWORD *)(v7 + 32);
              v7 += 24;
              v36 = v35 < v15;
              v76 = v34 == v14;
              v37 = v34 < v14;
              if (v76)
                v37 = v36;
            }
            while (v37);
            do
            {
              v38 = *((_QWORD *)v33 - 3);
              v39 = *((_QWORD *)v33 - 2);
              v33 = (__int128 *)((char *)v33 - 24);
              v40 = v39 < v15;
              v76 = v38 == v14;
              v41 = v38 < v14;
              if (v76)
                v41 = v40;
            }
            while (!v41);
          }
          while (v7 < (unint64_t)v33);
        }
        if (v7 - 24 != a1)
        {
          *(_OWORD *)a1 = *(_OWORD *)(v7 - 24);
          v42 = *(_QWORD *)(v7 - 8);
          *(_QWORD *)(v7 - 8) = 0;
          v43 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v42;

        }
        *(_QWORD *)(v7 - 24) = v14;
        *(_QWORD *)(v7 - 16) = v15;
        v44 = *(void **)(v7 - 8);
        *(_QWORD *)(v7 - 8) = v19;

        if (v23 < (unint64_t)v24)
        {
LABEL_42:
          _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Lb0EEEvT1_SJ_T0_NS_15iterator_traitsISJ_E15difference_typeEb(a1, v7 - 24, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v45 = _ZNSt3__127__insertion_sort_incompleteB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEbT1_SJ_T0_(a1, (unint64_t *)(v7 - 24));
        if (!_ZNSt3__127__insertion_sort_incompleteB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEbT1_SJ_T0_(v7, v160))
        {
          if (v45)
            continue;
          goto LABEL_42;
        }
        a2 = (unint64_t *)(v7 - 24);
        if (!v45)
          goto LABEL_1;
        return;
    }
  }
}

void _ZNSt3__124__sort5_maybe_branchlessB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Li0EEEvT1_SJ_SJ_SJ_SJ_T0_(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;

  _ZNSt3__17__sort4B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEvT1_SJ_SJ_SJ_T0_(a1, a2, a3, a4);
  v10 = *(_QWORD *)a5 < *(_QWORD *)a4;
  if (*(_QWORD *)a5 == *(_QWORD *)a4)
    v10 = *(_QWORD *)(a5 + 8) < *(_QWORD *)(a4 + 8);
  if (v10)
  {
    std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a4, (__int128 *)a5);
    v11 = *(_QWORD *)a4 < *(_QWORD *)a3;
    if (*(_QWORD *)a4 == *(_QWORD *)a3)
      v11 = *(_QWORD *)(a4 + 8) < *(_QWORD *)(a3 + 8);
    if (v11)
    {
      std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a3, (__int128 *)a4);
      v12 = *(_QWORD *)a3 < *a2;
      if (*(_QWORD *)a3 == *a2)
        v12 = *(_QWORD *)(a3 + 8) < a2[1];
      if (v12)
      {
        std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a2, (__int128 *)a3);
        v13 = *a2 < *a1;
        if (*a2 == *a1)
          v13 = a2[1] < a1[1];
        if (v13)
          std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)a2);
      }
    }
  }
}

void _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v11;
  _BOOL4 v12;
  __int128 *v13;
  _BOOL4 v14;

  v5 = a1;
  v6 = *a2;
  v7 = a2[1];
  v8 = *a2 < *a1;
  if (*a2 == *a1)
    v8 = v7 < a1[1];
  v9 = *(_QWORD *)(a3 + 8) < v7;
  v10 = *(_QWORD *)a3 == v6;
  v11 = *(_QWORD *)a3 < v6;
  if (v10)
    v11 = v9;
  if (v8)
  {
    if (v11)
    {
LABEL_11:
      v13 = (__int128 *)a3;
LABEL_17:
      std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, v13);
      return;
    }
    std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)a2);
    v12 = *(_QWORD *)a3 < *a2;
    if (*(_QWORD *)a3 == *a2)
      v12 = *(_QWORD *)(a3 + 8) < a2[1];
    if (v12)
    {
      a1 = a2;
      goto LABEL_11;
    }
  }
  else if (v11)
  {
    std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a2, (__int128 *)a3);
    v14 = *a2 < *v5;
    if (*a2 == *v5)
      v14 = a2[1] < v5[1];
    if (v14)
    {
      a1 = v5;
      v13 = (__int128 *)a2;
      goto LABEL_17;
    }
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEbT1_SJ_T0_(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  _BOOL8 result;
  unint64_t v6;
  BOOL v7;
  _BOOL4 v8;
  unint64_t *v9;
  unint64_t *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  unint64_t *v23;
  void *v24;

  v4 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = *(a2 - 3);
      v7 = v6 == *(_QWORD *)a1;
      v8 = v6 < *(_QWORD *)a1;
      if (v7)
        v8 = *(a2 - 2) < *(_QWORD *)(a1 + 8);
      if (v8)
      {
        std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)(a2 - 3));
        return 1;
      }
      return result;
    case 3uLL:
      _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), (uint64_t)(a2 - 3));
      return 1;
    case 4uLL:
      _ZNSt3__17__sort4B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEvT1_SJ_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), a1 + 48, (uint64_t)(a2 - 3));
      return 1;
    case 5uLL:
      _ZNSt3__124__sort5_maybe_branchlessB8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_Li0EEEvT1_SJ_SJ_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), a1 + 48, a1 + 72, (uint64_t)(a2 - 3));
      return 1;
    default:
      v9 = (unint64_t *)(a1 + 48);
      _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_((unint64_t *)a1, (unint64_t *)(a1 + 24), a1 + 48);
      v10 = (unint64_t *)(a1 + 72);
      if ((unint64_t *)(a1 + 72) == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    v13 = *v10;
    v14 = v10[1];
    v15 = *v10 < *v9;
    if (*v10 == *v9)
      v15 = v14 < v9[1];
    if (v15)
    {
      v16 = v10[2];
      v10[2] = 0;
      v17 = v11;
      while (1)
      {
        v18 = a1 + v17;
        *(_OWORD *)(v18 + 72) = *(_OWORD *)(a1 + v17 + 48);
        v19 = *(_QWORD *)(a1 + v17 + 64);
        *(_QWORD *)(v18 + 64) = 0;
        v20 = *(void **)(a1 + v17 + 88);
        *(_QWORD *)(v18 + 88) = v19;

        if (v17 == -48)
          break;
        v21 = *(_QWORD *)(v18 + 24);
        v7 = v13 == v21;
        v22 = v13 < v21;
        if (v7)
          v22 = v14 < *(_QWORD *)(v18 + 32);
        v17 -= 24;
        if (!v22)
        {
          v23 = (unint64_t *)(a1 + v17 + 72);
          goto LABEL_18;
        }
      }
      v23 = (unint64_t *)a1;
LABEL_18:
      *v23 = v13;
      v23[1] = v14;
      v24 = (void *)v23[2];
      v23[2] = v16;

      if (++v12 == 8)
        return v10 + 3 == a2;
    }
    v9 = v10;
    v11 += 24;
    v10 += 3;
    if (v10 == a2)
      return 1;
  }
}

void std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100](__int128 *a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = *a1;
  *a1 = *a2;
  *a2 = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = 0;
  v5 = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = 0;
  v6 = (void *)*((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v5;

  v7 = (void *)*((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;

}

void _ZNSt3__17__sort4B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEvT1_SJ_SJ_SJ_T0_(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;

  _ZNSt3__17__sort3B8nn180100INS_17_ClassicAlgPolicyERZZN10WebPrivacyL28findOrderedReplacementRangesEP8NSStringU13block_pointerFvONS_6vectorINS_4pairI8_NSRangeU8__strongS4_EENS_9allocatorIS9_EEEEEEUb0_E3__1PS9_EEjT1_SJ_SJ_T0_(a1, a2, a3);
  v8 = *(_QWORD *)a4 < *(_QWORD *)a3;
  if (*(_QWORD *)a4 == *(_QWORD *)a3)
    v8 = *(_QWORD *)(a4 + 8) < *(_QWORD *)(a3 + 8);
  if (v8)
  {
    std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a3, (__int128 *)a4);
    v9 = *(_QWORD *)a3 < *a2;
    if (*(_QWORD *)a3 == *a2)
      v9 = *(_QWORD *)(a3 + 8) < a2[1];
    if (v9)
    {
      std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a2, (__int128 *)a3);
      v10 = *a2 < *a1;
      if (*a2 == *a1)
        v10 = a2[1] < a1[1];
      if (v10)
        std::pair<_NSRange,NSString * {__strong}>::swap[abi:nn180100]((__int128 *)a1, (__int128 *)a2);
    }
  }
}

id WebPrivacy::applyOrderedReplacements<objc_object>(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = v3;
  if (*a2 == a2[1])
  {
    v5 = v3;
  }
  else
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    for (i = a2[1]; i != *a2; objc_msgSend(v5, "replaceCharactersInRange:withString:", v7, v8, *(_QWORD *)(i + 16)))
    {
      v7 = *(_QWORD *)(i - 24);
      v8 = *(_QWORD *)(i - 16);
      i -= 24;
    }

  }
  return v5;
}

void sub_24A45F1A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24A45F430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_24A45F654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_24A45F790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A45F9A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24A45FB28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_24A45FC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A45FE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id location, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  void *v17;
  void *v18;
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a17;
  if (a17 == v19)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_24A45FF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A460084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A4601B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A4602EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A460420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A460554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A460688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  void *v14;
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a13;
  if (a13 == v15)
  {
    v18 = 4;
    v17 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_24A460730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::mutex *v10;

  std::mutex::unlock(v10);

  _Unwind_Resume(a1);
}

void sub_24A46083C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, ...)
{
  std::mutex *v5;
  va_list va;

  va_start(va, a5);

  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100]((uint64_t)va);
  std::mutex::unlock(v5);
  _Unwind_Resume(a1);
}

void sub_24A4608C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_24A460AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

void callCompletionHandler<void({block_pointer} {__strong})(NSData *,NSError *)>(void *a1, void *a2, void *a3, unsigned int a4)
{
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FD8];
    if (a4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(a4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

void sub_24A460C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_24A461124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_24A461510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_24A4617DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A461AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A461DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A4620E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A4623EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_24A462810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v18;
  void *v19;

  v19 = v18;

  _Unwind_Resume(a1);
}

void _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD_(void **a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  WebPrivacy::Client *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t v23[16];
  id v24[2];
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[8];
  std::__shared_weak_count *v28;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("com.apple.WebPrivacy.TrackingResourceRequestContentBlockerVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = (WebPrivacy::Client *)objc_msgSend(v5, "isEqualToString:", a1[1]);
    if ((_DWORD)v6)
    {
      v7 = WPOSLogAPI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24A44A000, v7, OS_LOG_TYPE_INFO, "Adding last cached tracker block list rules", buf, 2u);
      }
      (*((void (**)(void))a1[2] + 2))();
      goto LABEL_27;
    }
  }
  v8 = WebPrivacy::Client::shared(v6);
  WebPrivacy::Client::cachedListData(v8, 1u, buf);
  if (!*(_QWORD *)buf)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_11;
  }
  v25 = Platform::SharedMemory::view(*(Platform::SharedMemory **)buf);
  v26 = v9;
  if (!v9)
  {
LABEL_11:
    v13 = WPOSLogAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__cold_1();
    (*((void (**)(void))a1[2] + 2))();
    goto LABEL_22;
  }
  WebPrivacy::createTrackingResourceRequestContentExtensionSource((uint64_t)&v25, (uint64_t *)v24);
  if (!objc_msgSend(v24[0], "length"))
  {
    v14 = WPOSLogAPI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__cold_2();
      if (v3)
        goto LABEL_16;
    }
    else if (v3)
    {
LABEL_16:
      v15 = WPOSLogAPI();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_24A44A000, v15, OS_LOG_TYPE_INFO, "Falling back to previously compiled rules", v23, 2u);
      }
      (*((void (**)(void))a1[2] + 2))();
      goto LABEL_21;
    }
    (*((void (**)(void))a1[2] + 2))();
    goto LABEL_21;
  }
  v10 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11 = (void *)objc_msgSend(v10, "initWithData:encoding:", v24[0], 4);
  v12 = *a1;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = ___ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__block_invoke;
  v19[3] = &unk_251BCF0C0;
  v20 = v3;
  v22 = a1[2];
  v21 = a1[1];
  objc_msgSend(v12, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", CFSTR("com.apple.WebPrivacy.TrackingResourceRequestContentBlocker"), v11, v19);

LABEL_21:
LABEL_22:
  v16 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_27:

}

void sub_24A462B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  uint64_t v22;

  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:nn180100](v22 - 64);
  _Unwind_Resume(a1);
}

void _ZZN8Platform8BlockPtrIFvP17WKContentRuleListP7NSErrorEE12fromCallableIZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorENS_9ArrayViewIhEEEEDaT_OT0_EUlS2_S4_E_EES6_SF_ENUlPKvE_8__invokeESK_(id *a1)
{

}

void _ZZN8Platform8BlockPtrIFvP17WKContentRuleListP7NSErrorEE12fromCallableIZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorENS_9ArrayViewIhEEEEDaT_OT0_EUlS2_S4_E_EES6_SF_ENUlPvS2_S4_E_8__invokeESJ_S2_S4_(uint64_t a1, void *a2)
{
  _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD_((void **)(a1 + 32), a2);
}

void ___ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WPOSLogAPI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ___ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__block_invoke_cold_1(v8, (uint64_t)v12, v7);
    }

    if (a1[4])
    {
      v9 = WPOSLogAPI();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_24A44A000, v9, OS_LOG_TYPE_INFO, "Falling back to previously compiled rules", v11, 2u);
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", a1[5], CFSTR("com.apple.WebPrivacy.TrackingResourceRequestContentBlockerVersion"));

  }
}

void sub_24A462D64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24A462E1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24A4630C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  _Block_object_dispose(&a19, 8);

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);

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

void sub_24A463318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_24A463420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_24A46349C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_24A463514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_24A4635F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_24A4636B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_24A46378C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A463AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,char a31)
{
  _Block_object_dispose(&a25, 8);

  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_24A463C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_24A463D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24A46404C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);

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

void sub_24A4641A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_24A464288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN10WebPrivacy6Client16ensureConnectionEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136380675;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_24A44A000, a3, (uint64_t)a3, "Handled error from server: %{private}s", (uint8_t *)a2);
}

void WebPrivacy::Client::getList(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((a1 - 1) > 7u)
    v3 = CFSTR("Invalid");
  else
    v3 = off_251BCED28[(char)(a1 - 1)];
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_24A44A000, a2, a3, "Timed out waiting for sync reply for %@", (uint8_t *)&v4);
}

void WebPrivacy::Client::getList(Backend::RemoteList,WebPrivacy::ListRequestOptions &&,std::function<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)> &&)::$_0::operator() const(void)::{lambda(std::function)#1}::operator()()
{
  __assert_rtn("isFatalForListDataRetrieval", "Client.mm", 133, "false");
}

void _ZZZZN10WebPrivacy6Client7getListEN7Backend10RemoteListEONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlS7_E_clES7_ENKUlOT_E_clINS5_8optionalINS_3XPC12GetListReplyEEEEEDaSI__cold_1(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = (unint64_t *)(v1 + 8);
    do
      OUTLINED_FUNCTION_2(v2);
    while (v4);
    if (!v3)
    {
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_3();
    }
  }
  OUTLINED_FUNCTION_4();
}

void ___ZZN10WebPrivacy6Client13sendWithReplyINS_3XPC7GetListENS2_12GetListReplyEJRKN7Backend10RemoteListEZZZNS0_7getListES6_ONS_18ListRequestOptionsEONSt3__18functionIFvNS_12MessageErrorEON8Platform9ArrayViewIhEEEEEENK3__0clEvENKUlSD_E_clESD_EUlOT_E_EEEvDpOT1_ENKUlSO_DpOT0_E_clIRKSP_JS8_EEEDaSO_SV__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = (unint64_t *)(v1 + 8);
    do
      OUTLINED_FUNCTION_2(v2);
    while (v4);
    if (!v3)
    {
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_3();
    }
  }
  OUTLINED_FUNCTION_4();
}

void _ZZZN10WebPrivacy6Client34scheduleListUpdateWithNotificationEN7Backend10RemoteListEEUb_ENK3__6clINSt3__18optionalINS_3XPC15UpdateListReplyEEEEEDaOT__cold_1(_BYTE *a1, char *a2, NSObject *a3)
{
  const char *v3;
  unint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*a1)
  {
    v4 = *a2;
    if (v4 > 3)
      v3 = "Invalid";
    else
      v3 = off_251BCED08[v4];
  }
  else
  {
    v3 = "DecodingFailure";
  }
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_24A44A000, a3, (uint64_t)a3, "Updated list with error: %s", (uint8_t *)&v5);
}

void _ZN8Platform20separateLastArgumentIZN10WebPrivacy6Client13sendWithReplyINS1_3XPC7GetListENS4_12GetListReplyEJRKN7Backend10RemoteListEZZZNS2_34scheduleListUpdateWithNotificationES8_EUb_ENK3__6clINSt3__18optionalINS4_15UpdateListReplyEEEEEDaOT_EUlSJ_E_EEEvDpOT1_EUlSJ_DpOT0_E_NSD_5tupleIJS8_SK_EEEEEDcSJ_RKT0__cold_1()
{
  __assert_rtn("operator()", "Client.h", 98, "result");
}

void std::__function::__func<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::rawJSONToDictionarys(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A44A000, a2, a3, "Failed to deserialize raw JSON content: %@", a5, a6, a7, a8, 2u);
}

void std::__function::__func<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0,std::allocator<WebPrivacy::createTrackingResourceRequestContentExtensionSource(Platform::ArrayView<unsigned char> const&)::$_0>,void ()(Platform::ArrayView<unsigned char>&&)>::operator()(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A44A000, a2, a3, "Failed to serialize content extension source: %@", a5, a6, a7, a8, 2u);
}

void Platform::SharedMemory::map()
{
  __assert_rtn("map", "SharedMemory.mm", 22, "fileDescriptor");
}

void Platform::SharedMemory::map(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_1(1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_1_0(&dword_24A44A000, "Failed to mmap file descriptor %i: %{errno}i", v3, v4);
}

{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_1(1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_1_0(&dword_24A44A000, "Failed to fstat file descriptor %i: %{errno}i", v3, v4);
}

void WebPrivacy::filterUsingCachedParameters(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_24A44A000, a1, a3, "Unable to replace query in filtered URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void ___ZN10WebPrivacyL18sharedLinkDetectorEv_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A44A000, a2, a3, "Unable to initialize shared data detector: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

void _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_24A44A000, v0, v1, "List updated while retrieving compiled rule list; falling back to previously compiled rules",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

void _ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_24A44A000, v0, v1, "Failed to parse tracker block list rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void ___ZZZ68__WPResources_loadTrackerBlockerRuleListForStore_completionHandler__ENK4__10clIN10WebPrivacy12MessageErrorEN8Platform9ArrayViewIhEEEEDaT_OT0_ENUlP17WKContentRuleListP7NSErrorE_clESB_SD__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_24A44A000, a3, (uint64_t)a3, "Failed to compile tracker block list rules with error: %{public}@", (uint8_t *)a2);

}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void operator delete(void *__p)
{
  off_251BCDBE0(__p);
}

uint64_t operator delete()
{
  return off_251BCDBE8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251BCDBF0(__sz);
}

uint64_t operator new()
{
  return off_251BCDBF8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

uint64_t mach_approximate_time(void)
{
  return MEMORY[0x24BDAEB38]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0650](xarray, index);
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0658](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  double result;

  MEMORY[0x24BDB0678](xarray, index);
  return result;
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0680](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0690](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

