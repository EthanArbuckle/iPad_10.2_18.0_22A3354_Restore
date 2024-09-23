void ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke_2(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  const char *v6;
  void *p_p;
  void *__p;
  char v9;

  if ((_DWORD)a2)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke_2", a3);
    if (v9 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusError Async read error 0x%08x sz(%u)", v6, p_p, 74, a2, a4);
    if (v9 < 0)
      operator delete(__p);
  }
  else
  {
    (*(void (**)(const char *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 160))(a3, a4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  }
}

void sub_222D230A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  void *v34;
  _QWORD v35[3];

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = a2;
      if (v6 <= a2)
        v8 = a2 % v6;
    }
    else
    {
      v8 = (v6 - 1) & a2;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == a2)
        {
          if (*((_DWORD *)i + 4) == a2)
            return i;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6)
              v11 %= v6;
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8)
            break;
        }
      }
    }
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  v12 = (_QWORD *)(a1 + 16);
  v35[2] = 0xAAAAAAAAAAAAAA01;
  v13 = operator new(0x38uLL);
  v35[0] = v13;
  v35[1] = a1 + 16;
  *v13 = 0;
  v13[1] = v5;
  *((_DWORD *)v13 + 4) = *a3;
  *((_DWORD *)v13 + 6) = 0;
  v13[4] = v13 + 4;
  v13[5] = v13 + 4;
  v13[6] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v6 || (float)(v15 * (float)v6) < v14)
  {
    v16 = 1;
    if (v6 >= 3)
      v16 = (v6 & (v6 - 1)) != 0;
    v17 = v16 | (2 * v6);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v6)
    {
      v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v6 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v6)
      {
        v6 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = *(void **)a1;
          *(_QWORD *)a1 = v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = (_QWORD *)*v12;
          if (*v12)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v12;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v30))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v30);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v6 = (unint64_t)prime;
          goto LABEL_59;
        }
        v34 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v34)
          operator delete(v34);
        v6 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_59:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v8 = v5 % v6;
      else
        v8 = v5;
    }
    else
    {
      v8 = (v6 - 1) & v5;
    }
  }
  v31 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v8);
  i = (uint64_t *)v35[0];
  if (v31)
  {
    *(_QWORD *)v35[0] = *v31;
LABEL_72:
    *v31 = i;
    goto LABEL_73;
  }
  *(_QWORD *)v35[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = v12;
  if (*i)
  {
    v32 = *(_QWORD *)(*i + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v32 >= v6)
        v32 %= v6;
    }
    else
    {
      v32 &= v6 - 1;
    }
    v31 = (_QWORD *)(*(_QWORD *)a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  v35[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v35);
  return i;
}

void sub_222D234D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientProxy::getShortName(Ari::AriClientProxy *this)
{
  return (uint64_t)this + 16;
}

uint64_t *ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](uint64_t a1, int a2)
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t *v6;
  dispatch_semaphore_s *v7;
  _BOOL8 v8;
  int v10;

  v10 = a2;
  MEMORY[0x22767CED0](*(_BYTE *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 166);
  v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 167);
  v5 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)a1, a2) == 0;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(a1, v5);
  v6 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1, a2, &v10)+ 4;
  v8 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v7) == -1;
  MEMORY[0x22767CED0](v8, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 172);
  return v6;
}

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::__on_zero_shared(uint64_t a1)
{
  AriHostRt::RtTransaction::~RtTransaction((AriHostRt::RtTransaction *)(a1 + 24));
}

void AriHostRt::RtTransaction::create(const unsigned __int8 *a1@<X0>, unsigned int a2@<W1>, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a3@<X2>, AriDispatch::Timer *a4@<X3>, uint64_t a5@<X4>, std::chrono::system_clock::time_point **a6@<X8>)
{
  std::chrono::system_clock::time_point *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  std::chrono::system_clock::time_point *v14;
  unint64_t v15;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *shared_owners;
  unint64_t v26;
  unint64_t *p_shared_weak_owners;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v34[2];
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v35;
  unint64_t v36;

  MEMORY[0x22767CED0](a2 < 0xC, "msgSz < sizeof(ARI_IPC_HEADER_t)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 62);
  make_shared_buffer(a1);
  v11 = (std::chrono::system_clock::time_point *)operator new(0x78uLL);
  v12 = (std::__shared_weak_count *)v11;
  v11[1].__d_.__rep_ = 0;
  v13 = (unint64_t *)&v11[1];
  v11[2].__d_.__rep_ = 0;
  v11->__d_.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)&off_24EB78B58;
  v14 = v11 + 3;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  v36 = 0xAAAAAAAAAAAAAAAALL;
  do
    v15 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v15 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v16 = *a3;
  v17 = (std::__shared_weak_count *)a3[1];
  v34[0] = v16;
  v34[1] = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  AriHostRt::RtTransaction::RtTransaction(v11 + 3, &v35, v34, a4, a5);
  if (v17)
  {
    v20 = (unint64_t *)&v17->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v22 = (std::__shared_weak_count *)v36;
  if (v36)
  {
    v23 = (unint64_t *)(v36 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  *a6 = v14;
  a6[1] = (std::chrono::system_clock::time_point *)v12;
  shared_owners = (std::__shared_weak_count *)v12[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1)
      goto LABEL_29;
    do
      v26 = __ldxr(v13);
    while (__stxr(v26 + 1, v13));
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    do
      v28 = __ldxr(p_shared_weak_owners);
    while (__stxr(v28 + 1, p_shared_weak_owners));
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)&v12[1];
    v12[1].__shared_owners_ = (uint64_t)v12;
    std::__shared_weak_count::__release_weak(shared_owners);
  }
  else
  {
    do
      v29 = __ldxr(v13);
    while (__stxr(v29 + 1, v13));
    v30 = (unint64_t *)&v12->__shared_weak_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)&v12[1];
    v12[1].__shared_owners_ = (uint64_t)v12;
  }
  do
    v32 = __ldaxr(v13);
  while (__stlxr(v32 - 1, v13));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  do
LABEL_29:
    v33 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v33 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v33)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
}

void sub_222D23824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  std::__shared_weak_count *v13;
  void *v15;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::__shared_weak_count::~__shared_weak_count(v13);
  operator delete(v15);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt7SendRawEPhjj_block_invoke(uint64_t isAlloc)
{
  uint64_t v1;
  _DWORD *v2;
  int v3;
  const char *v6;
  unsigned int *v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t **v12;
  uint64_t *i;
  unint64_t v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  unsigned int v17;
  uint64_t *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  AriHostRt::RtTransaction *v24;
  _QWORD *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  _QWORD *v30;
  const char *v31;
  void **v32;
  _QWORD *v33;
  _QWORD *v34;
  void *__p[2];
  char v36;
  AriHostRt::RtTransaction *v37;
  std::__shared_weak_count *v38;
  char v39;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v40[2];

  v1 = isAlloc;
  v2 = (_DWORD *)(isAlloc + 56);
  v3 = *(_DWORD *)(isAlloc + 56);
  if (v3 != 0x8000 && (~v3 & 0x7F00) != 0 && *(_DWORD *)(isAlloc + 56) != 0)
  {
    v15 = *(_QWORD *)(isAlloc + 40);
    isAlloc = (uint64_t)std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)(v15 + 33320), v3);
    if (!isAlloc)
    {
      isAlloc = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(v15 + 33032);
      if ((_DWORD)isAlloc)
      {
        v37 = (AriHostRt::RtTransaction *)0xAAAAAAAAAAAAAAAALL;
        v38 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
        v16 = *(const unsigned __int8 **)(v1 + 48);
        v17 = *(_DWORD *)(v1 + 60);
        v18 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](*(_QWORD *)(v1 + 40) + 33032, (*(_DWORD *)(v1 + 56) >> 8) & 0x7F);
        v19 = (std::__shared_weak_count *)v18[1];
        v40[0] = *v18;
        v40[1] = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)v19;
        if (v19)
        {
          p_shared_owners = (unint64_t *)&v19->__shared_owners_;
          do
            v21 = __ldxr(p_shared_owners);
          while (__stxr(v21 + 1, p_shared_owners));
        }
        AriHostRt::RtTransaction::create(v16, v17, v40, *(AriDispatch::Timer **)(*(_QWORD *)(v1 + 40) + 24), (*(_DWORD *)(*(_QWORD *)(v1 + 40) + 8) * *(_DWORD *)(v1 + 64)), (std::chrono::system_clock::time_point **)&v37);
        if (v19)
        {
          v22 = (unint64_t *)&v19->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        v24 = v37;
        AriHostRt::RtTransaction::startTimeoutCountDown((int64_t *)v37);
        v25 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(_QWORD *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
        v26 = v38;
        isAlloc = (uint64_t)std::shared_ptr<Ari::AriClientProxy>::operator=[abi:ne180100](v25 + 3, (uint64_t)v24, (uint64_t)v38);
        if (v26)
        {
          v27 = (unint64_t *)&v26->__shared_owners_;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }
      }
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = AriHostRt::sendRawInternal_nl((AriHostRt *)isAlloc, *(AriMsg **)(v1 + 48), (unsigned __int8 *)*(unsigned int *)(v1 + 60));
  v8 = *(int8x8_t *)(*(_QWORD *)(v1 + 40) + 33328);
  if (v8)
  {
    v9 = *(int *)(v1 + 56);
    v10 = (uint8x8_t)vcnt_s8(v8);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = *(int *)(v1 + 56);
      if (*(_QWORD *)&v8 <= v9)
        v11 = v9 % *(_QWORD *)&v8;
    }
    else
    {
      v11 = (*(_QWORD *)&v8 - 1) & v9;
    }
    v12 = *(uint64_t ***)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 33320) + 8 * v11);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v9)
          {
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
            {
              v29 = &v37;
              AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendRaw_block_invoke", v6);
              if (v39 < 0)
                v29 = v37;
              v30 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(_QWORD *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
              AriHostRt::RtTransaction::asString((uint64_t *)__p, (AriHostRt::RtTransaction *)v30[3]);
              if (v36 >= 0)
                v32 = __p;
              else
                v32 = (void **)__p[0];
              Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Fail to complete the transaction(%s), cancelling", v31, v29, 699, v32);
              if (v36 < 0)
                operator delete(__p[0]);
              if (v39 < 0)
                operator delete(v37);
              v33 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(_QWORD *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
              AriHostRt::RtTransaction::cancel((AriHostRt::RtTransaction *)v33[3], *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24));
              std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>((_QWORD *)(*(_QWORD *)(v1 + 40) + 33320), *(_DWORD *)(v1 + 56));
            }
            else
            {
              LODWORD(v37) = 0;
              if (!AriMsg::GetBufSeq(*(AriMsg **)(v1 + 48), (const unsigned __int8 *)*(unsigned int *)(v1 + 60), (uint64_t)&v37, v7))
              {
                v34 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(_QWORD *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
                AriMsg::SetBufSeq(**(AriMsg ***)(v34[3] + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v34[3] + 16) + 8) - **(_QWORD **)(v34[3] + 16)));
              }
            }
            return;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= *(_QWORD *)&v8)
              v14 %= *(_QWORD *)&v8;
          }
          else
          {
            v14 &= *(_QWORD *)&v8 - 1;
          }
          if (v14 != v11)
            return;
        }
      }
    }
  }
}

void sub_222D23BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

void AriHostRt::RtTransaction::~RtTransaction(AriHostRt::RtTransaction *this)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void ___ZN3Ari22AriXpcServerConnection4initEv_block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  const char *v9;
  const char *v10;
  void **v11;
  void *p_p;
  const char *v13;
  const char *v14;
  void **v15;
  _QWORD *v16;
  uint64_t **i;
  AriHostRt *v18;
  const char *v19;
  const char *v20;
  void **v21;
  const char *v22;
  void **v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t j;
  unint64_t *p_shared_owners;
  unint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  void *__p;
  char v41;
  void *v42[2];
  char v43;
  uint64_t v44;
  std::__shared_weak_count *v45;

  v3 = a1[4];
  v44 = 0;
  v45 = 0;
  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v6 = std::__shared_weak_count::lock(v4);
    v45 = v6;
    if (!v6)
      return;
    v7 = a1[5];
    v44 = v7;
    if (v7)
    {
      v8 = v6;
      if (MEMORY[0x22767D428](a2) == MEMORY[0x24BDACFA0])
      {
        Ari::AriXpcServerConnection::handleClientMessage((Ari::AriXpcServerConnection *)v3, a2);
      }
      else
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v9);
        asString(a2);
        v11 = v42;
        if (v43 < 0)
          v11 = (void **)v42[0];
        if (v41 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) %s", v10, v11, 372, p_p);
        if (v41 < 0)
          operator delete(__p);
        if (v43 < 0)
          operator delete(v42[0]);
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v13);
        if (v43 >= 0)
          v15 = v42;
        else
          v15 = (void **)v42[0];
        v16 = (_QWORD *)(v3 + 32);
        if (*(char *)(v3 + 55) < 0)
          v16 = (_QWORD *)*v16;
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Terminating conn(%s)", v14, v15, 375, v16);
        if (v43 < 0)
          operator delete(v42[0]);
        xpc_connection_cancel(*(xpc_connection_t *)(v3 + 16));
        v37 = v7;
        for (i = *(uint64_t ***)(v3 + 80); i; i = (uint64_t **)*i)
        {
          v18 = (AriHostRt *)*((unsigned int *)i + 4);
          if (AriHostRt::DeregisterClient(v18))
          {
            AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v19);
            if (v43 >= 0)
              v21 = v42;
            else
              v21 = (void **)v42[0];
            Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to deregister cid 0x%x", v20, v21, 386, v18);
          }
          else
          {
            AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v19);
            if (v43 >= 0)
              v23 = v42;
            else
              v23 = (void **)v42[0];
            Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Deregistered cid 0x%x", v22, v23, 382, v18);
          }
          if (v43 < 0)
            operator delete(v42[0]);
        }
        if (*(_QWORD *)(v3 + 88))
        {
          v24 = *(_QWORD **)(v3 + 80);
          if (v24)
          {
            do
            {
              v25 = (_QWORD *)*v24;
              operator delete(v24);
              v24 = v25;
            }
            while (v25);
          }
          *(_QWORD *)(v3 + 80) = 0;
          v26 = *(_QWORD *)(v3 + 72);
          if (v26)
          {
            for (j = 0; j != v26; ++j)
              *(_QWORD *)(*(_QWORD *)(v3 + 64) + 8 * j) = 0;
          }
          *(_QWORD *)(v3 + 88) = 0;
        }
        v38 = v37;
        v39 = v8;
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v29 = __ldxr(p_shared_owners);
        while (__stxr(v29 + 1, p_shared_owners));
        v30 = *(_QWORD *)(v3 + 128);
        if (!v30)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v30 + 48))(v30, &v38);
        v31 = v39;
        if (v39)
        {
          v32 = (unint64_t *)&v39->__shared_owners_;
          do
            v33 = __ldaxr(v32);
          while (__stlxr(v33 - 1, v32));
          if (!v33)
          {
            ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
            std::__shared_weak_count::__release_weak(v31);
          }
        }
      }
    }
  }
  v34 = v45;
  if (v45)
  {
    v35 = (unint64_t *)&v45->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
}

void sub_222D23FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27)
{
  if (a26 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriXpcServerConnection::handleClientMessage(Ari::AriXpcServerConnection *this, void *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _BOOL8 v12;
  NSObject *v13;
  unint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  void *v18;

  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v3 || (v5 = *(_QWORD *)this, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = MEMORY[0x22767D428](a2) != MEMORY[0x24BDACFA0];
  MEMORY[0x22767CED0](v12, "xpc_get_type(dictionary) != XPC_TYPE_DICTIONARY", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 499);
  xpc_retain(a2);
  v13 = *((_QWORD *)this + 3);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1174405120;
  v16[2] = ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke;
  v16[3] = &__block_descriptor_tmp_80;
  v16[4] = this;
  v16[5] = v5;
  v17 = v7;
  do
    v14 = __ldxr(p_shared_weak_owners);
  while (__stxr(v14 + 1, p_shared_weak_owners));
  v18 = a2;
  dispatch_async(v13, v16);
  if (v17)
    std::__shared_weak_count::__release_weak(v17);
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_222D24194(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientXpcProxy::getShortName(Ari::AriClientXpcProxy *this)
{
  return (uint64_t)this + 56;
}

uint64_t Ari::AriClientGcdProxy::forwardIndication(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t BufGmid;
  const char *v13;
  void **v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  const char *label;
  const char *v19;
  NSObject *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD block[6];
  std::__shared_weak_count *v30;
  AriMsg **v31;
  std::__shared_weak_count *v32;
  void **v33;
  char v34;

  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3 || (v5 = *(_QWORD *)(a1 + 40), (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  MEMORY[0x22767CED0](*(_QWORD *)(a1 + 56) == 0, "conn == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 123);
  BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a2, (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a2 + 8) - **(_QWORD **)a2));
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardIndication", v13);
  if (v34 >= 0)
    v14 = (void **)&v33;
  else
    v14 = v33;
  v15 = (_QWORD *)(a1 + 16);
  if (*(char *)(a1 + 39) < 0)
    v15 = (_QWORD *)*v15;
  v16 = *(_QWORD *)(*(_QWORD *)a2 + 8) - **(_QWORD **)a2;
  v17 = *(NSObject **)(a1 + 56);
  label = dispatch_queue_get_label(v17);
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication(0x%08x) for client(%s) Type(GCD) size(%zu) dispq(%s:%p)", v19, v14, 127, BufGmid, v15, v16, label, v17);
  if (v34 < 0)
    operator delete(v33);
  v20 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN3Ari17AriClientGcdProxy17forwardIndicationENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_17;
  block[4] = a1;
  block[5] = v5;
  v30 = v7;
  do
    v21 = __ldxr(p_shared_weak_owners);
  while (__stxr(v21 + 1, p_shared_weak_owners));
  v22 = *(std::__shared_weak_count **)(a2 + 8);
  v31 = *(AriMsg ***)a2;
  v32 = v22;
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  dispatch_async(v20, block);
  v25 = v32;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_222D243D8(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  uint64_t v2;

  if (*(char *)(v2 - 89) < 0)
    operator delete(*(void **)(v2 - 112));
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

uint64_t __destroy_helper_block_e8_32c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 32);
}

uint64_t AriHostRt::InboundRespCB(AriHostRt *a1)
{
  uint64_t BufCtx;
  int BufGmid;
  const char *v4;
  const char *v5;
  uint64_t *v6;
  uint64_t v7;
  __int128 v8;
  const char *v9;
  const char *v10;
  void **v11;
  uint64_t v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void **v18;
  const char *v19;
  const char *v20;
  void **v21;
  const char *v22;
  void **v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  const char *v31;
  void **v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void **v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  AriMsg **v41;
  std::__shared_weak_count *v42;
  std::string v43;
  void *__p;
  char v45;
  unint64_t v46;
  unint64_t v47;
  void *v48[2];
  char v49;
  void *v50;
  char v51;
  uint64_t v52;
  std::__shared_weak_count *v53;

  AriHostRt::GetInstance(a1);
  BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)a1, (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a1 + 8) - **(_QWORD **)a1));
  v52 = 0;
  v53 = 0;
  BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a1, (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a1 + 8) - **(_QWORD **)a1));
  if ((_DWORD)BufCtx == 32513)
  {
    std::string::basic_string[abi:ne180100]<0>(&v50, "arirt_internal_client");
    Ari::LogTransportBuf();
    if (v51 < 0)
      operator delete(v50);
    if (BufGmid > 68190207)
    {
      if (BufGmid == 68190208)
      {
        v46 = 0xAAAAAAAAAAAAAAAALL;
        v47 = 0xAAAAAAAAAAAAAAAALL;
        ARI_AriMsgAttribResp_Extract();
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v19);
        if (v49 >= 0)
          v21 = v48;
        else
          v21 = (void **)v48[0];
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error getting expected internal message AriMsgAttribResp", v20, v21, 1185);
LABEL_64:
        if (v49 < 0)
          operator delete(v48[0]);
        goto LABEL_66;
      }
      if (BufGmid == 84312064)
      {
        LODWORD(v46) = -1431655766;
        v14 = ARI_CsiGetCurrentBootStateRspCb_Extract();
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v13);
        if (v49 >= 0)
          v32 = v48;
        else
          v32 = (void **)v48[0];
        if (v14)
          v33 = "there was an error";
        else
          v33 = "BB is not ready";
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Received boot state, but %s", v31, v32, 1175, v33);
        goto LABEL_64;
      }
    }
    else
    {
      if (BufGmid == 67436544)
      {
        v46 = 0xAAAAAAAAAAAAAAAALL;
        if (!ARI_AriACK_Extract())
        {
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v15);
          v16 = asString();
          v18 = v48;
          if (v49 < 0)
            v18 = (void **)v48[0];
          Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) ACK received for AriHostRt internal message(%d-0x%03X) with status(%s(%d))", v17, v18, 1197, v46 >> 26, (v46 >> 15) & 0x3FF, v16, HIDWORD(v46));
          goto LABEL_64;
        }
        goto LABEL_66;
      }
      if (BufGmid == 67600384)
      {
        v46 = 0xAAAAAAAAAAAAAAAALL;
        if (!ARI_AriNACK_Extract())
        {
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v5);
          v34 = asString();
          v36 = v48;
          if (v49 < 0)
            v36 = (void **)v48[0];
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) NACK received for AriHostRt internal message(%d-0x%03X) with status(%s(%d))", v35, v36, 1217, v46 >> 26, (v46 >> 15) & 0x3FF, v34, HIDWORD(v46));
          goto LABEL_64;
        }
LABEL_66:
        v12 = 0;
        goto LABEL_67;
      }
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v4);
    if (v49 >= 0)
      v23 = v48;
    else
      v23 = (void **)v48[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unexpected AriHostRt internal message(%d-0x%03X)", v22, v23, 1225, BufGmid >> 26, (BufGmid >> 15) & 0x3FF);
    goto LABEL_64;
  }
  if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(qword_253DF22F8, BufCtx))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(qword_253DF22F8, BufCtx);
  }
  if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(qword_253DF2320, BufCtx))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(qword_253DF2320, BufCtx);
  }
  if (qword_253DF2348 && !qword_253DF2338)
    AriDispatch::Semaphore::signal((AriDispatch::Semaphore *)qword_253DF2348);
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_253DF21D8) & 1) != 0)
  {
    v6 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)&unk_253DF21D8, (BufCtx >> 8) & 0x7F);
    std::shared_ptr<Ari::AriClientProxy>::operator=[abi:ne180100](&v52, *v6, v6[1]);
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 16))(v52);
    if (*(char *)(v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v43, *(const std::string::value_type **)v7, *(_QWORD *)(v7 + 8));
    }
    else
    {
      v8 = *(_OWORD *)v7;
      v43.__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 16);
      *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v8;
    }
    Ari::LogTransportBuf();
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
    v24 = v52;
    v25 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
    v41 = *(AriMsg ***)a1;
    v42 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldxr(p_shared_owners);
      while (__stxr(v27 + 1, p_shared_owners));
    }
    v12 = (*(uint64_t (**)(uint64_t, AriMsg ***))(*(_QWORD *)v24 + 32))(v24, &v41);
    v28 = v42;
    if (v42)
    {
      v29 = (unint64_t *)&v42->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "client_not_registered");
    Ari::LogTransportBuf();
    if (v45 < 0)
      operator delete(__p);
    if (!qword_253DF2388)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v9);
      v11 = v49 >= 0 ? v48 : (void **)v48[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Non-registered cid 0x%04X from buffer ctx 0x%08X", v10, v11, 1247, (BufCtx >> 8) & 0x7F, BufCtx);
      if (v49 < 0)
        operator delete(v48[0]);
    }
    v12 = 0xFFFFFFFFLL;
  }
LABEL_67:
  v37 = v53;
  if (v53)
  {
    v38 = (unint64_t *)&v53->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  return v12;
}

void sub_222D24AAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c48_ZTSNSt3__18weak_ptrIN3Ari17AriClientGcdProxyEEE56c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 56);
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

uint64_t AriHostRt::InboundMsgCB(AriHostRt *this, unsigned __int8 *a2)
{
  Ari *BufCtx;
  int v4;
  const unsigned __int8 *v5;
  AriHostRt *shared_buffer;
  NSObject *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD block[5];
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;

  BufCtx = (Ari *)AriMsg::GetBufCtx(this, a2);
  v4 = (int)BufCtx;
  if ((Ari::GetLogLevels(BufCtx) & 4) != 0)
    Ari::LogHeader(this, v5);
  v19 = 0xAAAAAAAAAAAAAAAALL;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  shared_buffer = (AriHostRt *)make_shared_buffer((const unsigned __int8 *)this);
  AriHostRt::GetInstance(shared_buffer);
  v7 = qword_253DEA0E8;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke;
  block[3] = &__block_descriptor_tmp_89;
  block[4] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  do
    v8 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v8 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v18 = v4;
  dispatch_async(v7, block);
  v9 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v10 = (unint64_t *)(v17 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = (std::__shared_weak_count *)v20;
  if (v20)
  {
    v13 = (unint64_t *)(v20 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return 0;
}

void sub_222D24CE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t isAlloc;
  dispatch_semaphore_s *v4;
  _BOOL8 v5;

  MEMORY[0x22767CED0](*(_BYTE *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 259);
  v2 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v2, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 261);
  isAlloc = IDMgr::isAlloc((IDMgr *)(a1 + 40));
  v5 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v4) == -1;
  MEMORY[0x22767CED0](v5, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 263);
  return isAlloc;
}

void ___ZN9AriHostRt16DeregisterClientEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  unsigned int v4;
  int v5;
  uint64_t v6;
  _BOOL8 v7;
  dispatch_semaphore_s *v8;
  uint64_t *v9;
  char *v10;
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  uint64_t (***v24)();
  uint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  void **v31;
  std::__shared_weak_count *v32;
  std::__shared_weak_count *v33;
  std::__shared_weak_count *v34;
  void *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  uint64_t v38;
  void **v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  std::__shared_weak_count *v42;
  void *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  void **v47;
  std::__shared_weak_count *v48;
  std::__shared_weak_count *v49;
  std::__shared_weak_count *v50;
  void *v51;
  unint64_t *v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  _QWORD *v56;
  int v57;
  _BOOL8 v58;
  int v59;
  uint64_t *v60;
  int8x8_t v61;
  unint64_t v62;
  uint8x8_t v63;
  const char *v64;
  void *p_p;
  uint64_t *v66;
  uint64_t *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  dispatch_semaphore_s *v72;
  _BOOL8 v73;
  int *v74;
  int *v75;
  int *v76;
  void *__p;
  std::__shared_weak_count *v78;
  char v79;
  char v80;
  uint64_t (**v81)();
  int v82;
  uint64_t (***v83)();
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = atomic_load(*(unsigned int **)(a1 + 40));
  if (v4 != -1)
  {
    v5 = *(_DWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 40) + 33192;
    v81 = &off_24EB78D48;
    v82 = v5;
    v83 = &v81;
    MEMORY[0x22767CED0](*(_BYTE *)(v6 + 88) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 333);
    v7 = AriOsa::OsMutexTake(*(AriOsa **)(v6 + 80), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
    MEMORY[0x22767CED0](v7, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 336);
    v9 = *(uint64_t **)v6;
    if (*(_QWORD *)v6)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        LODWORD(__p) = *((_DWORD *)v9 + 4);
        if (!v83)
          std::__throw_bad_function_call[abi:ne180100]();
        if (((unsigned int (*)(uint64_t (***)(), void **, uint64_t *))(*v83)[6])(v83, &__p, v9 + 4))
        {
          if ((unint64_t)v11 >= v12)
          {
            v14 = (v11 - v10) >> 2;
            v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 62)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v12 - (_QWORD)v10) >> 1 > v15)
              v15 = (uint64_t)(v12 - (_QWORD)v10) >> 1;
            if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
              v16 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v16 = v15;
            if (v16)
              v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v16);
            else
              v8 = 0;
            v17 = (char *)(v16 + 4 * v14);
            *(_DWORD *)v17 = *((_DWORD *)v9 + 4);
            v13 = v17 + 4;
            while (v11 != v10)
            {
              v18 = *((_DWORD *)v11 - 1);
              v11 -= 4;
              *((_DWORD *)v17 - 1) = v18;
              v17 -= 4;
            }
            v12 = v16 + 4 * (_QWORD)v8;
            if (v10)
              operator delete(v10);
            v10 = v17;
            goto LABEL_24;
          }
          *(_DWORD *)v11 = *((_DWORD *)v9 + 4);
          v11 += 4;
        }
        v13 = v11;
LABEL_24:
        v9 = (uint64_t *)*v9;
        v11 = v13;
        if (!v9)
          goto LABEL_31;
      }
    }
    v10 = 0;
    v13 = 0;
LABEL_31:
    v23 = AriOsa::OsMutexGive(*(AriOsa **)(v6 + 80), v8) == -1;
    MEMORY[0x22767CED0](v23, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 346);
    v24 = v83;
    if (v83 == &v81)
    {
      v25 = 4;
      v24 = &v81;
    }
    else
    {
      if (!v83)
        goto LABEL_36;
      v25 = 5;
    }
    (*v24)[v25]();
LABEL_36:
    v26 = *(unsigned int **)(a1 + 40);
    v75 = 0;
    v76 = 0;
    v74 = 0;
    v27 = v13 - v10;
    if (v13 == v10)
    {
      v28 = 0;
    }
    else
    {
      if (v27 < 0)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v28 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v27 >> 2);
      v74 = v28;
      v76 = &v28[v29];
      memmove(v28, v10, v13 - v10);
      v75 = &v28[v27 >> 2];
    }
    AriHostRt::checkShouldDeregIndication_nl(v26, &v74);
    if (v28)
    {
      v75 = v28;
      operator delete(v28);
    }
    v30 = *(_QWORD *)(a1 + 40);
    v31 = (void **)(v30 + 33432);
    v32 = *(std::__shared_weak_count **)(v30 + 33440);
    if (v32)
    {
      v33 = std::__shared_weak_count::lock(v32);
      v78 = v33;
      if (v33)
      {
        v34 = v33;
        v35 = *v31;
        __p = v35;
        if (v35)
          AriHostRt::ClientTransitionTracker::removeAllTracking((AriHostRt::ClientTransitionTracker *)v35, *(unsigned int *)(a1 + 48));
        p_shared_owners = (unint64_t *)&v34->__shared_owners_;
        do
          v37 = __ldaxr(p_shared_owners);
        while (__stlxr(v37 - 1, p_shared_owners));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
    }
    v38 = *(_QWORD *)(a1 + 40);
    v39 = (void **)(v38 + 33416);
    v40 = *(std::__shared_weak_count **)(v38 + 33424);
    if (v40)
    {
      v41 = std::__shared_weak_count::lock(v40);
      v78 = v41;
      if (v41)
      {
        v42 = v41;
        v43 = *v39;
        __p = v43;
        if (v43)
          AriHostRt::ClientTransitionTracker::removeAllTracking((AriHostRt::ClientTransitionTracker *)v43, *(unsigned int *)(a1 + 48));
        v44 = (unint64_t *)&v42->__shared_owners_;
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
    }
    v46 = *(_QWORD *)(a1 + 40);
    v47 = (void **)(v46 + 33448);
    v48 = *(std::__shared_weak_count **)(v46 + 33456);
    if (v48)
    {
      v49 = std::__shared_weak_count::lock(v48);
      v78 = v49;
      if (v49)
      {
        v50 = v49;
        v51 = *v47;
        __p = v51;
        if (v51)
          AriHostRt::ClientTransitionTracker::removeAllTracking((AriHostRt::ClientTransitionTracker *)v51, *(unsigned int *)(a1 + 48));
        v52 = (unint64_t *)&v50->__shared_owners_;
        do
          v53 = __ldaxr(v52);
        while (__stlxr(v53 - 1, v52));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
      }
    }
    if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(_QWORD *)(a1 + 40) + 33032))
    {
      v55 = *(_QWORD *)(a1 + 40);
      v56 = (_QWORD *)(v55 + 33032);
      v57 = *(_DWORD *)(a1 + 48);
      MEMORY[0x22767CED0](*(_BYTE *)(v55 + 33136) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 235);
      v58 = AriOsa::OsMutexTake(*(AriOsa **)(v55 + 33128), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
      MEMORY[0x22767CED0](v58, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 236);
      v59 = IDMgr::free((IDMgr *)(v55 + 33072));
      ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(v55 + 33032, v59 ^ 1);
      v60 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)(v55 + 33032), v57);
      v61 = *(int8x8_t *)(v55 + 33040);
      v62 = v60[1];
      v63 = (uint8x8_t)vcnt_s8(v61);
      v63.i16[0] = vaddlv_u8(v63);
      if (v63.u32[0] > 1uLL)
      {
        if (v62 >= *(_QWORD *)&v61)
          v62 %= *(_QWORD *)&v61;
      }
      else
      {
        v62 &= *(_QWORD *)&v61 - 1;
      }
      v66 = *(uint64_t **)(*v56 + 8 * v62);
      do
      {
        v67 = v66;
        v66 = (uint64_t *)*v66;
      }
      while (v66 != v60);
      if (v67 == (uint64_t *)(v55 + 33048))
        goto LABEL_89;
      v68 = v67[1];
      if (v63.u32[0] > 1uLL)
      {
        if (v68 >= *(_QWORD *)&v61)
          v68 %= *(_QWORD *)&v61;
      }
      else
      {
        v68 &= *(_QWORD *)&v61 - 1;
      }
      if (v68 != v62)
      {
LABEL_89:
        if (!*v60)
          goto LABEL_90;
        v69 = *(_QWORD *)(*v60 + 8);
        if (v63.u32[0] > 1uLL)
        {
          if (v69 >= *(_QWORD *)&v61)
            v69 %= *(_QWORD *)&v61;
        }
        else
        {
          v69 &= *(_QWORD *)&v61 - 1;
        }
        if (v69 != v62)
LABEL_90:
          *(_QWORD *)(*v56 + 8 * v62) = 0;
      }
      v70 = *v60;
      if (*v60)
      {
        v71 = *(_QWORD *)(v70 + 8);
        if (v63.u32[0] > 1uLL)
        {
          if (v71 >= *(_QWORD *)&v61)
            v71 %= *(_QWORD *)&v61;
        }
        else
        {
          v71 &= *(_QWORD *)&v61 - 1;
        }
        if (v71 != v62)
        {
          *(_QWORD *)(*v56 + 8 * v71) = v67;
          v70 = *v60;
        }
      }
      *v67 = v70;
      *v60 = 0;
      --*(_QWORD *)(v55 + 33056);
      __p = v60;
      v78 = (std::__shared_weak_count *)(v55 + 33048);
      v79 = 1;
      std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
      v73 = AriOsa::OsMutexGive(*(AriOsa **)(v55 + 33128), v72) == -1;
      MEMORY[0x22767CED0](v73, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 241);
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregisterClient_block_invoke", v54);
      if (v80 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Attempt to de-reg an non-existant CID(%x)", v64, p_p, 613, *(unsigned int *)(a1 + 48));
      if (v80 < 0)
        operator delete(__p);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    if (v10)
    {
      v22 = v10;
      goto LABEL_101;
    }
    return;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregisterClient_block_invoke", a3);
  atomic_load(*(unsigned int **)(a1 + 40));
  v19 = asString();
  v21 = &__p;
  if (v80 < 0)
    v21 = __p;
  Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for DeregisterClient on cid %u", v20, v21, 578, v19, *(unsigned int *)(a1 + 48));
  if (v80 < 0)
  {
    v22 = __p;
LABEL_101:
    operator delete(v22);
  }
}

void sub_222D25488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  if (v26)
    operator delete(v26);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  AriHostRt *BufSeq;
  const char *v5;
  const char *v6;
  void **v7;
  int v8;
  AriHostRt *Instance;
  AriHostRt *v10;
  const char *v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  AriHostRt *v15;
  int v16;
  void **v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  const char *label;
  const char *v25;
  AriHostRt *v26;
  NSObject *v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  AriHostRt *v32;
  int v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unsigned int v37;
  const char *v38;
  void **v39;
  int v40;
  void **v41;
  uint64_t v42;
  const char *v43;
  void **v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD block[6];
  std::__shared_weak_count *v57;
  void *v58[2];
  char v59;
  unsigned int v60;

  v60 = 0;
  AriHostRt::GetInstance((AriHostRt *)a1);
  v2 = ((_WORD)dword_253DEA0DC + 1) & 0x7FF;
  BufSeq = (AriHostRt *)AriMsg::GetBufSeq(**(AriMsg ***)(a1 + 32), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - **(_QWORD **)(a1 + 32)), (uint64_t)&v60, v3);
  if (v60 != (_DWORD)v2)
  {
    BufSeq = (AriHostRt *)AriHostRt::GetInstance(BufSeq);
    if (dword_253DEA0DC != 2048)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v5);
      v7 = v59 >= 0 ? v58 : (void **)v58[0];
      BufSeq = (AriHostRt *)Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Missing expected BB.SEQ(0x%03x), got BB.SEQ(0x%03x)", v6, v7, 1103, v2, v60);
      if (v59 < 0)
        operator delete(v58[0]);
    }
  }
  v8 = v60;
  Instance = (AriHostRt *)AriHostRt::GetInstance(BufSeq);
  dword_253DEA0DC = v8;
  v10 = (AriHostRt *)AriHostRt::GetInstance(Instance);
  v12 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v12 != 2)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v11);
    v40 = v59;
    v41 = (void **)v58[0];
    v42 = asString();
    if (v40 >= 0)
      v44 = v58;
    else
      v44 = v41;
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for InboundMsgCB", v43, v44, 1110, v42);
    goto LABEL_32;
  }
  AriHostRt::GetInstance(v10);
  v14 = qword_253DF2388;
  if (qword_253DF2388)
  {
    v15 = (AriHostRt *)AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v13);
    v16 = v59;
    v17 = (void **)v58[0];
    v18 = *(uint64_t **)(a1 + 32);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(unsigned int *)(a1 + 48);
    AriHostRt::GetInstance(v15);
    v22 = v19 - v20;
    if (v16 >= 0)
      v23 = v58;
    else
      v23 = v17;
    label = dispatch_queue_get_label((dispatch_queue_t)qword_253DF2390);
    v26 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Inbound Msg sz%zu ctx(0x%08X) for sniffer (%s) ", v25, v23, 1118, v22, v21, label);
    if (v59 < 0)
      operator delete(v58[0]);
    AriHostRt::GetInstance(v26);
    v27 = qword_253DF2390;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke_2;
    block[3] = &__block_descriptor_tmp_87;
    v29 = *(_QWORD *)(a1 + 32);
    v28 = *(std::__shared_weak_count **)(a1 + 40);
    block[4] = v14;
    block[5] = v29;
    v57 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v31 = __ldxr(p_shared_owners);
      while (__stxr(v31 + 1, p_shared_owners));
    }
    dispatch_async(v27, block);
    AriHostRt::GetInstance(v32);
    v33 = byte_253DF2398;
    v34 = v57;
    if (!v57)
      goto LABEL_22;
    v35 = (unint64_t *)&v57->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
      if (!v33)
        return;
    }
    else
    {
LABEL_22:
      if (!v33)
        return;
    }
  }
  v37 = *(_DWORD *)(a1 + 48);
  if (v37 >= 0x8000)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v13);
    if (v59 >= 0)
      v39 = v58;
    else
      v39 = (void **)v58[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) GetBufCtx Invalid CTX", v38, v39, 1130);
LABEL_32:
    if (v59 < 0)
      operator delete(v58[0]);
    return;
  }
  v45 = *(_QWORD *)(a1 + 32);
  if (v37)
  {
    v46 = *(std::__shared_weak_count **)(a1 + 40);
    v54[0] = v45;
    v54[1] = v46;
    if (v46)
    {
      v47 = (unint64_t *)&v46->__shared_owners_;
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    AriHostRt::InboundRespCB((AriHostRt *)v54);
    if (v46)
    {
      v49 = (unint64_t *)&v46->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      goto LABEL_50;
    }
  }
  else
  {
    v46 = *(std::__shared_weak_count **)(a1 + 40);
    v55[0] = v45;
    v55[1] = v46;
    if (v46)
    {
      v51 = (unint64_t *)&v46->__shared_owners_;
      do
        v52 = __ldxr(v51);
      while (__stxr(v52 + 1, v51));
    }
    AriHostRt::InboundIndCB((AriHostRt *)v55);
    if (v46)
    {
      v53 = (unint64_t *)&v46->__shared_owners_;
      do
        v50 = __ldaxr(v53);
      while (__stlxr(v50 - 1, v53));
LABEL_50:
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
  }
}

void sub_222D25904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::InboundIndCB(AriHostRt *a1)
{
  const char *v2;
  unsigned int BufGmid;
  const char *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  int v23;
  const char *v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  const char *v29;
  std::string *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  const char *v34;
  const char *v35;
  void **v36;
  std::string::size_type size;
  std::string *v39;
  unsigned __int8 *v40;
  std::string *v41;
  std::string *v42;
  std::string *v43;
  unsigned __int8 *v44;
  int v45;
  uint64_t v46;
  std::string::size_type v47;
  uint64_t v48;
  std::string v49;
  std::string v50;
  AriMsg **v51;
  std::__shared_weak_count *v52;
  unsigned int *v53;
  std::__shared_weak_count *v54;
  void *__p[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59[2];
  __int128 v60;
  __int128 v61;
  _OWORD v62[9];
  unint64_t v63;
  void *v64;
  char v65;

  AriHostRt::GetInstance(a1);
  BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a1, (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a1 + 8) - **(_QWORD **)a1));
  if (BufGmid == 92700672)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v2);
    if ((SBYTE7(v56) & 0x80u) == 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Received All-ready via indication", v4, v5, 1272);
    if (SBYTE7(v56) < 0)
      operator delete(__p[0]);
    AriHostRt::processStartEvent_nl((uint64_t)&AriHostRt::GetInstance(void)::instance);
  }
  v6 = BufGmid >> 26;
  v7 = (BufGmid >> 15) & 0x3FF;
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_253DF2268) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v64, "client_not_registered");
    Ari::LogTransportBuf();
    if (v65 < 0)
      operator delete(v64);
    if (!qword_253DF2388)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v34);
      v36 = (SBYTE7(v56) & 0x80u) == 0 ? __p : (void **)__p[0];
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) No handler is registered for indication gmid(%d-0x%x)", v35, v36, 1282, BufGmid >> 26, (BufGmid >> 15) & 0x3FF);
      if (SBYTE7(v56) < 0)
        operator delete(__p[0]);
    }
    return 0xFFFFFFFFLL;
  }
  v48 = BufGmid;
  v63 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v62[7] = v8;
  v62[8] = v8;
  v62[5] = v8;
  v62[6] = v8;
  v62[3] = v8;
  v62[4] = v8;
  v62[1] = v8;
  v62[2] = v8;
  v61 = v8;
  v62[0] = v8;
  *(_OWORD *)v59 = v8;
  v60 = v8;
  v57 = v8;
  v58 = v8;
  *(_OWORD *)__p = v8;
  v56 = v8;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
  v9 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)&unk_253DF2268, v7 | ((_DWORD)v6 << 10));
  while (1)
  {
    v9 = (uint64_t *)v9[1];
    if (v9 == ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)&unk_253DF2268, v7 | ((_DWORD)v6 << 10)))break;
    v11 = (unsigned int *)v9[2];
    v10 = v9[3];
    v53 = v11;
    v54 = (std::__shared_weak_count *)v10;
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v14 = v11[2];
    v15 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v11 + 16))(v11);
    v16 = *(char *)(v15 + 23);
    if (v16 >= 0)
      v17 = v15;
    else
      v17 = *(_QWORD *)v15;
    if (v16 >= 0)
      v18 = *(unsigned __int8 *)(v15 + 23);
    else
      v18 = *(_QWORD *)(v15 + 8);
    v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, v17, v18);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"-", 1);
    v20 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
    v51 = *(AriMsg ***)a1;
    v52 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldxr(p_shared_owners);
      while (__stxr(v22 + 1, p_shared_owners));
    }
    v23 = (*(uint64_t (**)(unsigned int *, AriMsg ***))(*(_QWORD *)v11 + 40))(v11, &v51);
    v25 = v23;
    v26 = v52;
    if (!v52)
      goto LABEL_27;
    v27 = (unint64_t *)&v52->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
      if (!v25)
        goto LABEL_33;
    }
    else
    {
LABEL_27:
      if (!v23)
        goto LABEL_33;
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v24);
    v30 = &v50;
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v30 = (std::string *)v50.__r_.__value_.__r.__words[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error handling indication for CID 0x%x registered for gmid(%d-0x%x)", v29, v30, 1301, v14, v6, v7, v48);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v50.__r_.__value_.__l.__data_);
    HIDWORD(v48) = -1;
LABEL_33:
    v31 = v54;
    if (v54)
    {
      v32 = (unint64_t *)&v54->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
  }
  memset(&v50, 170, sizeof(v50));
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__p[1], &v50);
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
  {
    size = v50.__r_.__value_.__l.__size_;
    if (v50.__r_.__value_.__l.__size_ > 1)
    {
      v39 = (std::string *)v50.__r_.__value_.__r.__words[0];
      goto LABEL_54;
    }
  }
  else
  {
    size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
    if (HIBYTE(v50.__r_.__value_.__r.__words[2]) <= 1u)
      goto LABEL_64;
    v39 = &v50;
LABEL_54:
    v40 = (unsigned __int8 *)v39 + size;
    v41 = v39;
    v42 = (std::string *)((char *)v39 + size);
    do
    {
      v43 = v41;
      v44 = (unsigned __int8 *)v41;
      while (1)
      {
        v45 = *v44++;
        if (v45 == 45)
          break;
        v43 = (std::string *)v44;
        if (v44 == v40)
        {
          v43 = v42;
          goto LABEL_60;
        }
      }
      v41 = (std::string *)((char *)&v43->__r_.__value_.__l.__data_ + 1);
      v42 = v43;
    }
    while (v44 != v40);
LABEL_60:
    v46 = (char *)v43 - (char *)v39;
    v47 = v43 == (std::string *)v40 ? -1 : v46;
    std::string::erase(&v50, v47, 0xFFFFFFFFFFFFFFFFLL);
    if ((SHIBYTE(v50.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_64:
      v49 = v50;
      goto LABEL_67;
    }
    size = v50.__r_.__value_.__l.__size_;
  }
  std::string::__init_copy_ctor_external(&v49, v50.__r_.__value_.__l.__data_, size);
LABEL_67:
  Ari::LogTransportBuf();
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v50.__r_.__value_.__l.__data_);
  __p[0] = *(void **)MEMORY[0x24BEDB800];
  *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(MEMORY[0x24BEDB800] + 24);
  __p[1] = (void *)(MEMORY[0x24BEDB848] + 16);
  if (SHIBYTE(v60) < 0)
    operator delete(v59[1]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22767D14C](v62);
  return HIDWORD(v48);
}

void sub_222D25E54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a36 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriOsa::IpcWrite(uint64_t (**a1)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD), uint64_t a2, uint64_t a3)
{
  BOOL v6;
  uint64_t v7;
  const char *v8;
  unsigned int v9;
  const char *v10;
  void *p_p;
  void *__p;
  char v14;
  int v15;

  if (a1)
    v6 = a2 == 0;
  else
    v6 = 1;
  v7 = v6;
  MEMORY[0x22767CED0](v7, "(ipc_desc == NULL) || (pBuf == NULL)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", 132);
  v15 = 0;
  if (*a1)
    v9 = (*a1)(a1, a2, a3, &v15, 1, 2000, 0);
  else
    v9 = 0;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcWrite", v8);
  if (v14 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Write(size=%u) completed with status %u", v10, p_p, 148, a3, v9);
  if (v14 < 0)
    operator delete(__p);
  if (v9)
    return 0;
  else
    return 4294967204;
}

void sub_222D26004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN3Ari17AriClientGcdProxy17forwardIndicationENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(_QWORD, _QWORD))(v3 + 72))(**(_QWORD **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) - **(_QWORD **)(a1 + 56));
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_222D260C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v3 + 2));
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

uint64_t AriFramer::fmrMsgCb(AriFramer *this, unsigned __int8 *a2, const char *a3)
{
  size_t *v3;
  unint64_t v4;
  const char *v7;
  void **v8;
  const char *v9;
  const char *v10;
  void **v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  const char *v15;
  unint64_t v16;
  size_t v17;
  const char *v18;
  void **v19;
  const char *v20;
  const char *v21;
  void **v22;
  unint64_t v23;
  size_t v24;
  size_t v25;
  const char *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  const char *v29;
  void **v30;
  const char *v31;
  const char *v32;
  void **v33;
  uint64_t v34;
  size_t v35;
  const char *v36;
  unint64_t v37;
  const char *v38;
  void **v39;
  const char *v40;
  void **v41;
  const char *v42;
  void **v43;
  const char *v44;
  void **v45;
  const char *v47;
  void **v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v52;
  int v53;
  void *__p[2];
  char v55;

  v3 = (size_t *)((char *)this + 32952);
  if (!*((_QWORD *)this + 4121))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", a3);
    if (v55 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) clientAriMsgCB is NULL", v10, v11, 65);
    v12 = a2;
    if (v55 < 0)
      operator delete(__p[0]);
LABEL_79:
    if (v12)
LABEL_80:
      free(v12);
    return 0xFFFFFFFFLL;
  }
  v4 = (unint64_t)a3;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", a3);
  if (v55 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) entering with cachedSize(%zu) data(%p)", v7, v8, 84, *v3, a2);
  if (v55 < 0)
  {
    operator delete(__p[0]);
    if (!v4)
    {
LABEL_67:
      if (a2)
        free(a2);
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v9);
      if (v55 >= 0)
        v45 = __p;
      else
        v45 = (void **)__p[0];
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) exiting with cachedSize(%zu)", v44, v45, 179, *v3);
      if (v55 < 0)
        operator delete(__p[0]);
      return 0;
    }
  }
  else if (!v4)
  {
    goto LABEL_67;
  }
  v13 = 0;
  v14 = (unsigned __int8 *)this + 184;
  while (1)
  {
    MEMORY[0x22767CED0]((*v3 & 0xFFFFFFFFFFFF8000) != 0, "sizeof(scratchBuffer) < cachedSize", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 89);
    v16 = 0x7FFF - *v3;
    v17 = v4 >= v16 ? 0x7FFF - *v3 : v4;
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v15);
    v19 = v55 >= 0 ? __p : (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) TOP newDataSizeRemains(%zu) newDataSizeConsumed(%zu) cachedSize(%zu) newDataToConsume(%zu)", v18, v19, 96, v4, v13, *v3, v17);
    if (v55 < 0)
    {
      operator delete(__p[0]);
      if (a2)
      {
LABEL_23:
        memcpy(&v14[*v3], &a2[v13], v17);
        goto LABEL_30;
      }
    }
    else if (a2)
    {
      goto LABEL_23;
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v20);
    if (v55 >= 0)
      v22 = __p;
    else
      v22 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Data is NULL, but IpcRead also fails for size (%zu)", v21, v22, 103, v17);
    if (v55 < 0)
      operator delete(__p[0]);
LABEL_30:
    v23 = v4 - v17;
    v24 = *v3;
    v49 = v4 - v17;
    if (v4 <= v16)
      v23 = 0;
    v50 = v23;
    v25 = v24 + v17;
    v53 = -1;
    v52 = -1;
    v27 = 0;
    v28 = v14;
    if (AriFramer_HeaderMagicScan(v14, v24 + v17, &v53, &v52))
      break;
LABEL_42:
    if (v53 < 0)
    {
LABEL_55:
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0)
        v41 = __p;
      else
        v41 = (void **)__p[0];
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) No unfinished data, resetting cache", v40, v41, 159);
      v37 = v50;
      if (v55 < 0)
        operator delete(__p[0]);
      *v3 = 0;
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0)
        v33 = __p;
      else
        v33 = (void **)__p[0];
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Cache unfinished message @ index(%zu) and sz(%zu)", v32, v33, 153, v27 + v53, v25 - (v27 + v53));
      if (v55 < 0)
        operator delete(__p[0]);
      v34 = v53;
      v35 = v25 - v27 - v53;
      *v3 = v35;
      memmove(v14, &v28[v34], v35);
      v37 = v50;
    }
    v13 += v17;
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v36);
    if (v55 >= 0)
      v43 = __p;
    else
      v43 = (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) BOTTOM newDataSizeRemains(%zu) newDataSizeConsumed(%zu) cachedSize(%zu)", v42, v43, 163, v37, v13, *v3);
    if (v55 < 0)
      operator delete(__p[0]);
    v4 = v49;
    if (!v37)
      goto LABEL_67;
  }
  v27 = 0;
  v28 = v14;
  while (1)
  {
    if (v27 + v53 + v52 >= 0x7FFF)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0)
        v39 = __p;
      else
        v39 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Illegal message len(%zu), resetting cachedSize(%zu)", v38, v39, 129, v52, *v3);
      if (v55 < 0)
        operator delete(__p[0]);
      v53 = -1;
      goto LABEL_55;
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
    if (v55 >= 0)
      v30 = __p;
    else
      v30 = (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Got message @ index(%zu) and sz(%zu)", v29, v30, 135, v27 + v53, v52);
    if (v55 < 0)
      operator delete(__p[0]);
    if (((unsigned int (*)(unsigned __int8 *, unint64_t))v3[2])(&v28[v53], v52))
      break;
    v27 += v53 + v52;
    v53 = -1;
    v28 = &v14[v27];
    if ((AriFramer_HeaderMagicScan(&v14[v27], v25 - v27, &v53, &v52) & 1) == 0)
      goto LABEL_42;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v31);
  if (v55 >= 0)
    v48 = __p;
  else
    v48 = (void **)__p[0];
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Not able to process ARI message due to internal error", v47, v48, 140);
  v12 = a2;
  if ((v55 & 0x80000000) == 0)
    goto LABEL_79;
  operator delete(__p[0]);
  if (a2)
    goto LABEL_80;
  return 0xFFFFFFFFLL;
}

void sub_222D26708(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt14RegisterClientENSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEERKNS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPj_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  __int128 *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  AriHostRt *v11;
  unint64_t *v12;
  unint64_t v13;
  AriHostRt *v14;
  int v15;
  AriHostRt *v16;
  unint64_t v17;
  uint64_t v18[2];
  _QWORD v19[2];

  v2 = (std::__shared_weak_count *)a1[6];
  v3 = (__int128 *)a1[7];
  v4 = a1[5];
  v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v6 = v5;
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CF8;
  v8 = (uint64_t)&v5[1];
  v19[0] = v4;
  v19[1] = v2;
  if (v2)
  {
    v9 = (unint64_t *)&v2->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = (AriHostRt *)Ari::AriClientXpcProxy::AriClientXpcProxy((uint64_t)&v5[1], v19, v3);
  if (v2)
  {
    v12 = (unint64_t *)&v2->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v18[0] = v8;
  v18[1] = (uint64_t)v6;
  AriHostRt::GetInstance(v11);
  v14 = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(v18);
  v15 = (int)v14;
  AriHostRt::GetInstance(v14);
  v16 = (AriHostRt *)MEMORY[0x22767CED0](v15 == 0x7FFFFFFF, "allocated_id == GetInstance().clientMgr.INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 537);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v15;
  LODWORD(v6[1].__shared_owners_) = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  AriHostRt::GetInstance(v16);
  if (byte_253DEA0D4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v8 + 48))(v8, 1, 0);
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_222D268E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  std::__shared_weak_count *v3;
  void *v5;
  va_list va;

  va_start(va, a3);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void ___ZN3Ari12AriXpcServer4initEv_block_invoke(uint64_t a1, void *a2, const char *a3)
{
  const char *v4;
  void **v5;
  void *p_p;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void **v12;
  void *v13;
  const char *v14;
  void **v15;
  void *v16;
  const char *v17;
  void **v18;
  void *v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_weak_owners;
  unint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  uint64_t ***v36;
  uint64_t **v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  std::__shared_weak_count *v41;
  float v42;
  float v43;
  _BOOL8 v44;
  unint64_t v45;
  unint64_t v46;
  int8x8_t prime;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  void *v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  void *v68;
  void *__p;
  std::__shared_weak_count *v70;
  char v71;
  void *v72[2];
  int64_t v73;
  _QWORD v74[3];
  _QWORD *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", a3);
    asString(a2);
    v5 = v72;
    if (v73 < 0)
      v5 = (void **)v72[0];
    if (v71 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Skipping event due to termination imminent: %s", v4, v5, 273, p_p);
LABEL_8:
    if (v71 < 0)
      operator delete(__p);
    if (SHIBYTE(v73) < 0)
      operator delete(v72[0]);
    return;
  }
  v8 = *(uint64_t **)(a1 + 40);
  v9 = MEMORY[0x22767D428](a2);
  if (v9 == MEMORY[0x24BDACFB8])
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v10);
    asString(a2);
    v15 = v72;
    if (v73 < 0)
      v15 = (void **)v72[0];
    if (v71 >= 0)
      v16 = &__p;
    else
      v16 = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Connection error: %s", v14, v15, 280, v16);
    if (v71 < 0)
      operator delete(__p);
    if (SHIBYTE(v73) < 0)
      operator delete(v72[0]);
    if (a2 == (void *)MEMORY[0x24BDACF48])
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return;
  }
  if (v9 != MEMORY[0x24BDACF88])
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v10);
    asString(a2);
    v12 = v72;
    if (v73 < 0)
      v12 = (void **)v72[0];
    if (v71 >= 0)
      v13 = &__p;
    else
      v13 = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unknown xpc event: %s", v11, v12, 288, v13);
    goto LABEL_8;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v10);
  asString(a2);
  v18 = v72;
  if (v73 < 0)
    v18 = (void **)v72[0];
  if (v71 >= 0)
    v19 = &__p;
  else
    v19 = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) New xpc connection: %s", v17, v18, 292, v19);
  if (v71 < 0)
    operator delete(__p);
  if (SHIBYTE(v73) < 0)
    operator delete(v72[0]);
  v20 = (std::__shared_weak_count *)v8[1];
  if (!v20 || (v21 = *v8, (v22 = std::__shared_weak_count::lock(v20)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v23 = v22;
  p_shared_weak_owners = (unint64_t *)&v22->__shared_weak_owners_;
  do
    v25 = __ldxr(p_shared_weak_owners);
  while (__stxr(v25 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v22->__shared_owners_;
  do
    v27 = __ldaxr(p_shared_owners);
  while (__stlxr(v27 - 1, p_shared_owners));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v23);
  }
  do
    v28 = __ldxr(p_shared_weak_owners);
  while (__stxr(v28 + 1, p_shared_weak_owners));
  v74[0] = &off_24EB783D0;
  v74[1] = v21;
  v74[2] = v23;
  v75 = v74;
  Ari::AriXpcServerConnection::create(a2, (uint64_t)v74, (Ari::AriXpcServerConnection **)&__p);
  v29 = __p;
  v30 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)__p) + 8) ^ ((unint64_t)__p >> 32));
  v31 = 0x9DDFEA08EB382D69 * (((unint64_t)__p >> 32) ^ (v30 >> 47) ^ v30);
  v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
  v33 = v8[5];
  if (!v33)
  {
    v35 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_66;
  }
  v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
  v34.i16[0] = vaddlv_u8(v34);
  if (v34.u32[0] > 1uLL)
  {
    v35 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
    if (v32 >= v33)
      v35 = v32 % v33;
  }
  else
  {
    v35 = v32 & (v33 - 1);
  }
  v36 = *(uint64_t ****)(v8[4] + 8 * v35);
  if (!v36 || (v37 = *v36) == 0)
  {
LABEL_66:
    v73 = 0xAAAAAAAAAAAAAA01;
    v39 = operator new(0x20uLL);
    v40 = v8 + 6;
    v72[0] = v39;
    v72[1] = v8 + 6;
    *v39 = 0;
    v39[1] = v32;
    v41 = v70;
    v39[2] = v29;
    v39[3] = v41;
    __p = 0;
    v70 = 0;
    v42 = (float)(unint64_t)(v8[7] + 1);
    v43 = *((float *)v8 + 16);
    if (v33 && (float)(v43 * (float)v33) >= v42)
    {
LABEL_112:
      v60 = *(_QWORD **)(v8[4] + 8 * v35);
      v61 = v72[0];
      if (v60)
      {
        *(_QWORD *)v72[0] = *v60;
      }
      else
      {
        *(_QWORD *)v72[0] = v8[6];
        v8[6] = (uint64_t)v61;
        *(_QWORD *)(v8[4] + 8 * v35) = v40;
        if (!*(_QWORD *)v61)
        {
LABEL_121:
          v72[0] = 0;
          ++v8[7];
          std::unique_ptr<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>>::reset[abi:ne180100]((uint64_t)v72);
          goto LABEL_122;
        }
        v62 = *(_QWORD *)(*(_QWORD *)v61 + 8);
        if ((v33 & (v33 - 1)) != 0)
        {
          if (v62 >= v33)
            v62 %= v33;
        }
        else
        {
          v62 &= v33 - 1;
        }
        v60 = (_QWORD *)(v8[4] + 8 * v62);
      }
      *v60 = v61;
      goto LABEL_121;
    }
    v44 = 1;
    if (v33 >= 3)
      v44 = (v33 & (v33 - 1)) != 0;
    v45 = v44 | (2 * v33);
    v46 = vcvtps_u32_f32(v42 / v43);
    if (v45 <= v46)
      prime = (int8x8_t)v46;
    else
      prime = (int8x8_t)v45;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v33 = v8[5];
    }
    if (*(_QWORD *)&prime > v33)
      goto LABEL_78;
    if (*(_QWORD *)&prime < v33)
    {
      v54 = vcvtps_u32_f32((float)(unint64_t)v8[7] / *((float *)v8 + 16));
      if (v33 < 3 || (v55 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v55.i16[0] = vaddlv_u8(v55), v55.u32[0] > 1uLL))
      {
        v54 = std::__next_prime(v54);
      }
      else
      {
        v56 = 1 << -(char)__clz(v54 - 1);
        if (v54 >= 2)
          v54 = v56;
      }
      if (*(_QWORD *)&prime <= v54)
        prime = (int8x8_t)v54;
      if (*(_QWORD *)&prime >= v33)
      {
        v33 = v8[5];
      }
      else
      {
        if (prime)
        {
LABEL_78:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v48 = operator new(8 * *(_QWORD *)&prime);
          v49 = (void *)v8[4];
          v8[4] = (uint64_t)v48;
          if (v49)
            operator delete(v49);
          v50 = 0;
          v8[5] = (uint64_t)prime;
          do
            *(_QWORD *)(v8[4] + 8 * v50++) = 0;
          while (*(_QWORD *)&prime != v50);
          v51 = (_QWORD *)*v40;
          if (*v40)
          {
            v52 = v51[1];
            v53 = (uint8x8_t)vcnt_s8(prime);
            v53.i16[0] = vaddlv_u8(v53);
            if (v53.u32[0] > 1uLL)
            {
              if (v52 >= *(_QWORD *)&prime)
                v52 %= *(_QWORD *)&prime;
            }
            else
            {
              v52 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(v8[4] + 8 * v52) = v40;
            v57 = (_QWORD *)*v51;
            if (*v51)
            {
              do
              {
                v58 = v57[1];
                if (v53.u32[0] > 1uLL)
                {
                  if (v58 >= *(_QWORD *)&prime)
                    v58 %= *(_QWORD *)&prime;
                }
                else
                {
                  v58 &= *(_QWORD *)&prime - 1;
                }
                if (v58 != v52)
                {
                  v59 = v8[4];
                  if (!*(_QWORD *)(v59 + 8 * v58))
                  {
                    *(_QWORD *)(v59 + 8 * v58) = v51;
                    goto LABEL_103;
                  }
                  *v51 = *v57;
                  *v57 = **(_QWORD **)(v8[4] + 8 * v58);
                  **(_QWORD **)(v8[4] + 8 * v58) = v57;
                  v57 = v51;
                }
                v58 = v52;
LABEL_103:
                v51 = v57;
                v57 = (_QWORD *)*v57;
                v52 = v58;
              }
              while (v57);
            }
          }
          v33 = (unint64_t)prime;
          goto LABEL_107;
        }
        v68 = (void *)v8[4];
        v8[4] = 0;
        if (v68)
          operator delete(v68);
        v33 = 0;
        v8[5] = 0;
      }
    }
LABEL_107:
    if ((v33 & (v33 - 1)) != 0)
    {
      if (v32 >= v33)
        v35 = v32 % v33;
      else
        v35 = v32;
    }
    else
    {
      v35 = (v33 - 1) & v32;
    }
    goto LABEL_112;
  }
  while (1)
  {
    v38 = (unint64_t)v37[1];
    if (v38 == v32)
      break;
    if (v34.u32[0] > 1uLL)
    {
      if (v38 >= v33)
        v38 %= v33;
    }
    else
    {
      v38 &= v33 - 1;
    }
    if (v38 != v35)
      goto LABEL_66;
LABEL_65:
    v37 = (uint64_t **)*v37;
    if (!v37)
      goto LABEL_66;
  }
  if (v37[2] != __p)
    goto LABEL_65;
  v65 = v70;
  if (v70)
  {
    v66 = (unint64_t *)&v70->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
LABEL_122:
  v63 = v75;
  if (v75 == v74)
  {
    v64 = 4;
    v63 = v74;
LABEL_126:
    (*(void (**)(void))(*v63 + 8 * v64))();
  }
  else if (v75)
  {
    v64 = 5;
    goto LABEL_126;
  }
  std::__shared_weak_count::__release_weak(v23);
}

void sub_222D270EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,char *a27)
{
  std::__shared_weak_count *v27;
  char *v29;
  uint64_t v30;

  std::unique_ptr<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>>::reset[abi:ne180100]((uint64_t)&a18);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  v29 = a27;
  if (a27 == &a24)
  {
    v30 = 4;
    v29 = &a24;
  }
  else
  {
    if (!a27)
      goto LABEL_6;
    v30 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v29 + 8 * v30))();
LABEL_6:
  std::__shared_weak_count::__release_weak(v27);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServerConnection::create(void *a1@<X0>, uint64_t a2@<X1>, Ari::AriXpcServerConnection **a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  std::__shared_weak_count *shared_owners;
  unint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  Ari::AriXpcServerConnection *v21;
  _QWORD v22[3];
  _QWORD *v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (std::__shared_weak_count *)operator new(0xA0uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78490;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v22, a2);
  v8 = (uint64_t)v23;
  if (!v23)
    goto LABEL_4;
  if (v23 != v22)
  {
    v8 = (*(uint64_t (**)(void))(*v23 + 16))();
LABEL_4:
    v25 = (_BYTE *)v8;
    goto LABEL_6;
  }
  v25 = v24;
  (*(void (**)(_QWORD *, _BYTE *))(v22[0] + 24))(v22, v24);
LABEL_6:
  Ari::AriXpcServerConnection::AriXpcServerConnection((uint64_t)&v6[1], a1, (uint64_t)v24);
  v9 = v25;
  if (v25 == v24)
  {
    v10 = 4;
    v9 = v24;
  }
  else
  {
    if (!v25)
      goto LABEL_11;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_11:
  v11 = v23;
  if (v23 == v22)
  {
    v12 = 4;
    v11 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_16;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_16:
  v21 = (Ari::AriXpcServerConnection *)&v6[1];
  shared_owners = (std::__shared_weak_count *)v6[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1)
      goto LABEL_29;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    v6[1].__vftable = (std::__shared_weak_count_vtbl *)&v6[1];
    v6[1].__shared_owners_ = (uint64_t)v6;
    std::__shared_weak_count::__release_weak(shared_owners);
  }
  else
  {
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v18 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    v6[1].__vftable = (std::__shared_weak_count_vtbl *)&v6[1];
    v6[1].__shared_owners_ = (uint64_t)v6;
  }
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_29:
  Ari::AriXpcServerConnection::init(v21);
  *a3 = v21;
  a3[1] = (Ari::AriXpcServerConnection *)v6;
}

void sub_222D273B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  std::__shared_weak_count *v19;
  char *v21;
  uint64_t v22;
  void *v23;

  v21 = a15;
  if (a15 == &a12)
  {
    v22 = 4;
    v21 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  std::__shared_weak_count::~__shared_weak_count(v19);
  operator delete(v23);
  _Unwind_Resume(a1);
}

void AriFramer::IpcDataCb(AriFramer *this, const char *a2, uint64_t a3, void *a4)
{
  const char *v7;
  const char *v8;
  void **v9;
  uint64_t (*v10)(AriFramer *, const char *, _OWORD *);
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  const char *v14;
  int v15;
  const char *v16;
  void **v17;
  _OWORD v18[5];
  uint64_t v19;
  dispatch_object_t object;
  void *v21[2];
  char v22;

  MEMORY[0x22767CED0](a3 == 0, "cbCtx == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 37);
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "IpcDataCb", v7);
  if (v22 >= 0)
    v9 = v21;
  else
    v9 = (void **)v21[0];
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Owner(%p) data(%p) size(%zu)", v8, v9, 39, a3, this, a2);
  if (v22 < 0)
  {
    operator delete(v21[0]);
    if (!a2)
      return;
  }
  else if (!a2)
  {
    return;
  }
  v10 = *(uint64_t (**)(AriFramer *, const char *, _OWORD *))(a3 + 32960);
  if (!v10)
  {
    if (!AriFramer::fmrMsgCb((AriFramer *)a3, (unsigned __int8 *)this, a2))
      return;
    goto LABEL_16;
  }
  v11 = *(_OWORD *)(a3 + 48);
  v18[2] = *(_OWORD *)(a3 + 32);
  v18[3] = v11;
  v18[4] = *(_OWORD *)(a3 + 64);
  v12 = *(_OWORD *)(a3 + 16);
  v18[0] = *(_OWORD *)a3;
  v18[1] = v12;
  v13 = *(NSObject **)(a3 + 88);
  v19 = *(_QWORD *)(a3 + 80);
  object = v13;
  if (v13)
    dispatch_retain(v13);
  v15 = v10(this, a2, v18);
  if (object)
    dispatch_release(object);
  if (v15)
  {
LABEL_16:
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "IpcDataCb", v14);
    if (v22 >= 0)
      v17 = v21;
    else
      v17 = (void **)v21[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Not able to handle ARI_RT_IPC_DATA", v16, v17, 53);
    if (v22 < 0)
      operator delete(v21[0]);
  }
}

void sub_222D275D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  uint64_t v26;

  if (*(char *)(v26 - 49) < 0)
    operator delete(*(void **)(v26 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientGcdProxy::forwardResponse(uint64_t a1, AriMsg ***a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t BufCtx;
  void **v13;
  const char *v14;
  _QWORD *v15;
  AriMsg *v16;
  AriMsg *v17;
  const char *v18;
  void **v19;
  NSObject *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD block[6];
  std::__shared_weak_count *v30;
  AriMsg **v31;
  std::__shared_weak_count *v32;
  void *__p[2];
  char v34;
  void **v35;
  char v36;

  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3 || (v5 = *(_QWORD *)(a1 + 40), (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  MEMORY[0x22767CED0](*(_QWORD *)(a1 + 56) == 0, "conn == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 102);
  BufCtx = AriMsg::GetBufCtx(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  v13 = (void **)&v35;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardResponse", v14);
  if (v36 < 0)
    v13 = v35;
  v15 = (_QWORD *)(a1 + 16);
  if (*(char *)(a1 + 39) < 0)
    v15 = (_QWORD *)*v15;
  v17 = **a2;
  v16 = (*a2)[1];
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a1 + 24))(__p, a1);
  if (v34 >= 0)
    v19 = __p;
  else
    v19 = (void **)__p[0];
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Msg for client(%s) Type(GCD) size(%zu) %s ctx(0x%08X)", v18, v13, 106, v15, v16 - v17, v19, BufCtx);
  if (v34 < 0)
    operator delete(__p[0]);
  if (v36 < 0)
    operator delete(v35);
  v20 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN3Ari17AriClientGcdProxy15forwardResponseENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  block[5] = v5;
  v30 = v7;
  do
    v21 = __ldxr(p_shared_weak_owners);
  while (__stxr(v21 + 1, p_shared_weak_owners));
  v22 = (std::__shared_weak_count *)a2[1];
  v31 = *a2;
  v32 = v22;
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  dispatch_async(v20, block);
  v25 = v32;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_222D2785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  if (a31 < 0)
    operator delete(__p);
  if (*(char *)(v31 - 89) < 0)
    operator delete(*(void **)(v31 - 112));
  std::__shared_weak_count::__release_weak(a16);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientGcdProxy::getConnectDescription@<X0>(dispatch_queue_t *this@<X0>, std::string *a2@<X8>)
{
  __int128 v4;
  uint64_t v5;
  char *label;
  std::string *v7;
  __int128 v8;
  void **v9;
  std::string::size_type v10;
  std::string *v11;
  __int128 v12;
  void *__p[2];
  unsigned __int8 v15;
  std::string v16;
  std::string v17;
  std::string v18;
  std::string v19;
  _OWORD v20[4];
  void *v21[2];
  __int128 v22;
  __int128 v23;
  _OWORD v24[9];
  unint64_t v25;

  v25 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v4;
  v24[8] = v4;
  v24[5] = v4;
  v24[6] = v4;
  v24[3] = v4;
  v24[4] = v4;
  v24[1] = v4;
  v24[2] = v4;
  v23 = v4;
  v24[0] = v4;
  *(_OWORD *)v21 = v4;
  v22 = v4;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v20);
  v5 = *(_QWORD *)&v20[0];
  *(_DWORD *)((char *)v20 + *(_QWORD *)(*(_QWORD *)&v20[0] - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)v20 + *(_QWORD *)(v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v20 + *(_QWORD *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  memset(a2, 170, sizeof(std::string));
  label = (char *)dispatch_queue_get_label(this[7]);
  std::string::basic_string[abi:ne180100]<0>(&v16, label);
  v7 = std::string::insert(&v16, 0, "dispq(", 6uLL);
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  std::string::push_back(&v17, 64);
  v18 = v17;
  memset(&v17, 0, sizeof(v17));
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v20 + 8, __p);
  if ((v15 & 0x80u) == 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  if ((v15 & 0x80u) == 0)
    v10 = v15;
  else
    v10 = (std::string::size_type)__p[1];
  v11 = std::string::append(&v18, (const std::string::value_type *)v9, v10);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  std::string::push_back(&v19, 41);
  *a2 = v19;
  memset(&v19, 0, sizeof(v19));
  if ((char)v15 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  *(_QWORD *)&v20[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v20 + *(_QWORD *)(*(_QWORD *)&v20[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  *((_QWORD *)&v20[0] + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v22) < 0)
    operator delete(v21[1]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22767D14C](v24);
}

void sub_222D27ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,char a42)
{
  if (a40 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  std::ostringstream::~ostringstream((uint64_t)&a42);
  _Unwind_Resume(a1);
}

void ___ZN3Ari17AriClientGcdProxy15forwardResponseENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(_QWORD, _QWORD))(v3 + 64))(**(_QWORD **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) - **(_QWORD **)(a1 + 56));
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_222D27C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::sendRawInternal_nl(AriHostRt *this, AriMsg *a2, unsigned __int8 *a3)
{
  std::string::value_type *v5;
  size_t v6;
  uint64_t BufCtx;
  AriHostRt *BufGmid;
  uint64_t *v9;
  const std::string *v10;
  std::string *v11;
  AriHostRt *Instance;
  const char *v13;
  unsigned int v14;
  AriHostRt *v15;
  const char *v16;
  uint64_t v17;
  AriHostRt *v18;
  int v19;
  void **v20;
  void **v21;
  const char *label;
  const char *v23;
  void *v24;
  AriHostRt *v25;
  AriHostRt *v26;
  int v27;
  AriHostRt *v28;
  AriHostRt *v29;
  const char *v30;
  uint64_t v31;
  void **v32;
  const char *v33;
  void **v34;
  const char *v35;
  std::string *v36;
  AriHostRt *BufDigest;
  int v38;
  void **v39;
  const char *v40;
  void **v41;
  void **v42;
  uint64_t v43;
  std::string *v44;
  const char *v45;
  void **v46;
  std::string v48;
  _QWORD block[6];
  int v50;
  void *__p[2];
  char v52;
  std::string v53;
  void *v54[2];
  char v55;

  v5 = &v53.__r_.__value_.__s.__data_[21];
  v6 = a3;
  BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  BufGmid = (AriHostRt *)AriMsg::GetBufGmid(a2, (const unsigned __int8 *)v6);
  memset(&v53, 0, sizeof(v53));
  if (((BufCtx >> 8) & 0x7F) == 0x7F)
  {
    *((_BYTE *)&v53.__r_.__value_.__s + 23) = 21;
    qmemcpy(&v53, "arirt_internal_client", 21);
  }
  else
  {
    AriHostRt::GetInstance(BufGmid);
    BufGmid = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_253DF21D8);
    if ((_DWORD)BufGmid)
    {
      AriHostRt::GetInstance(BufGmid);
      v9 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)&unk_253DF21D8, (BufCtx >> 8) & 0x7F);
      v10 = (const std::string *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)*v9 + 16))(*v9);
      BufGmid = (AriHostRt *)std::string::operator=(&v53, v10);
      goto LABEL_10;
    }
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    {
      v53.__r_.__value_.__l.__size_ = 21;
      v11 = (std::string *)v53.__r_.__value_.__r.__words[0];
      v5 = (std::string::value_type *)(v53.__r_.__value_.__r.__words[0] + 21);
    }
    else
    {
      *((_BYTE *)&v53.__r_.__value_.__s + 23) = 21;
      v11 = &v53;
    }
    qmemcpy(v11, "client_not_registered", 21);
  }
  *v5 = 0;
LABEL_10:
  Instance = (AriHostRt *)AriHostRt::GetInstance(BufGmid);
  v14 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v14 == 2)
  {
    v15 = (AriHostRt *)AriHostRt::GetInstance(Instance);
    v17 = qword_253DF2388;
    if (!qword_253DF2388)
      goto LABEL_18;
    v18 = (AriHostRt *)AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v16);
    v19 = v55;
    v20 = (void **)v54[0];
    AriHostRt::GetInstance(v18);
    if (v19 >= 0)
      v21 = v54;
    else
      v21 = v20;
    label = dispatch_queue_get_label((dispatch_queue_t)qword_253DF2390);
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Outbound Msg sz%d ctx(0x%08X) for sniffer (%s) ", v23, v21, 741, a3, BufCtx, label);
    if (v55 < 0)
      operator delete(v54[0]);
    v24 = malloc_type_malloc(v6, 0xF0120842uLL);
    MEMORY[0x22767CED0](v24 == 0, "_msg == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 745);
    v25 = (AriHostRt *)memcpy(v24, a2, v6);
    AriHostRt::GetInstance(v25);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt18sendRawInternal_nlEPhj_block_invoke;
    block[3] = &__block_descriptor_tmp_55;
    block[4] = v17;
    block[5] = v24;
    v50 = (int)a3;
    dispatch_async((dispatch_queue_t)qword_253DF2390, block);
    v15 = (AriHostRt *)AriHostRt::GetInstance(v26);
    if (byte_253DF2398)
    {
LABEL_18:
      AriHostRt::GetInstance(v15);
      v27 = dword_253DEA0E0;
      v28 = (AriHostRt *)AriMsg::SetBufSeq(a2, (const unsigned __int8 *)v6);
      AriHostRt::GetInstance(v28);
      v29 = (AriHostRt *)AriOsa::IpcWrite(qword_253DEA108, (uint64_t)a2, v6);
      v31 = (uint64_t)v29;
      if ((_DWORD)v29)
      {
        v32 = v54;
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_fmr.h", "write", v30);
        if (v55 >= 0)
          v34 = v54;
        else
          v34 = (void **)v54[0];
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) IPC write failure on buffer(%p) sz(%zu)", v33, v34, 82, a2, v6);
        if (v55 < 0)
          operator delete(v54[0]);
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v35);
        if (v55 < 0)
          v32 = (void **)v54[0];
        if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v36 = &v53;
        else
          v36 = (std::string *)v53.__r_.__value_.__r.__words[0];
        BufDigest = (AriHostRt *)GetBufDigest((const unsigned __int8 *)a2, v6, (const char *)v36);
        v38 = v52;
        v39 = (void **)__p[0];
        AriHostRt::GetInstance(BufDigest);
        v41 = __p;
        if (v38 < 0)
          v41 = v39;
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed write to framer with (%s) AP.SEQ(%d) not advanced", v40, v32, 769, v41, dword_253DEA0E0);
        if (v52 < 0)
          operator delete(__p[0]);
        if (v55 < 0)
          operator delete(v54[0]);
        goto LABEL_55;
      }
      AriHostRt::GetInstance(v29);
      dword_253DEA0E0 = v27 + 1;
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v48, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
      else
        v48 = v53;
      Ari::LogTransportBuf();
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
    }
    v31 = 0;
    goto LABEL_55;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v13);
  if (v55 >= 0)
    v42 = v54;
  else
    v42 = (void **)v54[0];
  v43 = asString();
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &v53;
  else
    v44 = (std::string *)v53.__r_.__value_.__r.__words[0];
  GetBufDigest((const unsigned __int8 *)a2, v6, (const char *)v44);
  if (v52 >= 0)
    v46 = __p;
  else
    v46 = (void **)__p[0];
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for sendRawInternal(%s)", v45, v42, 733, v43, v46);
  if (v52 < 0)
    operator delete(__p[0]);
  if (v55 < 0)
    operator delete(v54[0]);
  v31 = 4294967206;
LABEL_55:
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  return v31;
}

void sub_222D280F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;

  if (a20 < 0)
    operator delete(__p);
  if (*(char *)(v34 - 105) < 0)
    operator delete(*(void **)(v34 - 128));
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_32c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(uint64_t result, int a2)
{
  _QWORD *v2;
  const char *v3;
  const char *v4;
  void **v5;
  const char *v6;
  uint64_t *i;
  uint64_t v8;
  int v9;
  const char *v10;
  void **v11;
  void *__p[2];
  char v13;
  int v14;

  if (a2)
  {
    v2 = (_QWORD *)result;
    IDMgr::dump((IDMgr *)(result + 40));
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v3);
    if (v13 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v4, v5, 274, v2, v2[3]);
    if (v13 < 0)
      operator delete(__p[0]);
    for (i = (uint64_t *)v2[2]; i; i = (uint64_t *)*i)
    {
      v8 = v2[17];
      if (v8)
      {
        v9 = *((_DWORD *)i + 6);
        LODWORD(__p[0]) = *((_DWORD *)i + 4);
        v14 = v9;
        (*(void (**)(uint64_t, void **, int *, uint64_t *))(*(_QWORD *)v8 + 48))(v8, __p, &v14, i + 4);
      }
      else
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v6);
        if (v13 >= 0)
          v11 = __p;
        else
          v11 = (void **)__p[0];
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%u", v10, v11, 284, *((unsigned int *)i + 4), *((unsigned int *)i + 4), *((unsigned int *)i + 6));
        if (v13 < 0)
          operator delete(__p[0]);
      }
    }
    AriOsa::OsSleep((AriOsa *)0x7D0);
    return MEMORY[0x22767CED0](1, "true", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 287);
  }
  return result;
}

void sub_222D28330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *AriHostRt::GetInstance(AriHostRt *this)
{
  unsigned __int8 v1;

  {
    AriHostRt::AriHostRt((AriHostRt *)&AriHostRt::GetInstance(void)::instance);
    __cxa_atexit((void (*)(void *))AriHostRt::~AriHostRt, &AriHostRt::GetInstance(void)::instance, &dword_222D22000);
  }
  return &AriHostRt::GetInstance(void)::instance;
}

void sub_222D283C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](uint64_t a1, int a2)
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t *v6;
  dispatch_semaphore_s *v7;
  _BOOL8 v8;
  int v10;

  v10 = a2;
  MEMORY[0x22767CED0](*(_BYTE *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 166);
  v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 167);
  v5 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)a1, a2) == 0;
  ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(a1, v5);
  v6 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1, a2, &v10)+ 4;
  v8 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v7) == -1;
  MEMORY[0x22767CED0](v8, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 172);
  return v6;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN9AriHostRt13RtTransactionEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

_QWORD *__copy_helper_block_e8_40c48_ZTSNSt3__18weak_ptrIN3Ari17AriClientGcdProxyEEE56c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

uint64_t AriHostRt::SendRaw(AriHostRt *this, unsigned __int8 *a2, int a3)
{
  unsigned int v4;
  int BufCtx;
  uint64_t v7;
  _QWORD block[7];
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a2;
  AriHostRt::GetInstance(this);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = -1;
  BufCtx = AriMsg::GetBufCtx(this, (const unsigned __int8 *)v4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt7SendRawEPhjj_block_invoke;
  block[3] = &unk_24EB787A8;
  block[5] = &AriHostRt::GetInstance(void)::instance;
  block[6] = this;
  v10 = BufCtx;
  v11 = v4;
  v12 = a3;
  block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v7 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_222D285DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

std::chrono::system_clock::time_point *AriHostRt::RtTransaction::RtTransaction(std::chrono::system_clock::time_point *a1, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a2, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a3, AriDispatch::Timer *this, uint64_t a5)
{
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7;
  unint64_t *v8;
  unint64_t v9;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v10;
  unint64_t *v11;
  unint64_t v12;

  a1->__d_.__rep_ = 0;
  a1[1].__d_.__rep_ = 0;
  v7 = a2[1];
  a1[2].__d_.__rep_ = *a2;
  a1[3].__d_.__rep_ = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = a3[1];
  a1[4].__d_.__rep_ = *a3;
  a1[5].__d_.__rep_ = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  a1[6].__d_.__rep_ = 1000000 * a5;
  AriDispatch::Timer::Create(this, (dispatch_queue_s *)a2);
  a1[9].__d_.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)this;
  a1[10].__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  a1[11].__d_.__rep_ = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  return a1;
}

void sub_222D286AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v6;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v4);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v2);
  v6 = *(std::__shared_weak_count **)(v1 + 8);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t Ari::AriClientXpcProxy::forwardIndication(uint64_t a1, AriMsg ***a2)
{
  uint64_t BufGmid;
  void *p_p;
  const char *v6;
  const char *v7;
  _QWORD *v8;
  AriMsg *v9;
  AriMsg *v10;
  uint64_t v11;
  std::string *v12;
  xpc_object_t v13;
  std::string v15;
  void *__p;
  char v17;

  BufGmid = AriMsg::GetBufGmid(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  p_p = &__p;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardIndication", v6);
  if (v17 < 0)
    p_p = __p;
  v8 = (_QWORD *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0)
    v8 = (_QWORD *)*v8;
  v10 = **a2;
  v9 = (*a2)[1];
  v11 = *(_QWORD *)(a1 + 40);
  if (*(char *)(v11 + 55) < 0)
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)(v11 + 32), *(_QWORD *)(v11 + 40));
  else
    v15 = *(std::string *)(v11 + 32);
  v12 = &v15;
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication(0x%08x) for client(%s) Type(XPC) size(%zu) conn(%s)", v7, p_p, 193, BufGmid, v8, v9 - v10, v12);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (v17 < 0)
    operator delete(__p);
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "AriCmd", 0x2002uLL);
  xpc_dictionary_set_data(v13, "AriMsg", **a2, (*a2)[1] - **a2);
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 40) + 16), v13);
  xpc_release(v13);
  return 0;
}

void sub_222D28880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(uint64_t result, int a2)
{
  _QWORD *v2;
  const char *v3;
  const char *v4;
  void **v5;
  const char *v6;
  uint64_t *i;
  uint64_t v8;
  int v9;
  const char *v10;
  void **v11;
  void *__p[2];
  char v13;
  int v14;

  if (a2)
  {
    v2 = (_QWORD *)result;
    IDMgr::dump((IDMgr *)(result + 40));
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v3);
    if (v13 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v4, v5, 274, v2, v2[3]);
    if (v13 < 0)
      operator delete(__p[0]);
    for (i = (uint64_t *)v2[2]; i; i = (uint64_t *)*i)
    {
      v8 = v2[17];
      if (v8)
      {
        v9 = *((_DWORD *)i + 6);
        LODWORD(__p[0]) = *((_DWORD *)i + 4);
        v14 = v9;
        (*(void (**)(uint64_t, void **, int *, uint64_t *))(*(_QWORD *)v8 + 48))(v8, __p, &v14, i + 4);
      }
      else
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v6);
        if (v13 >= 0)
          v11 = __p;
        else
          v11 = (void **)__p[0];
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%u", v10, v11, 284, *((unsigned int *)i + 4), *((unsigned int *)i + 4), *((unsigned int *)i + 6));
        if (v13 < 0)
          operator delete(__p[0]);
      }
    }
    AriOsa::OsSleep((AriOsa *)0x7D0);
    return MEMORY[0x22767CED0](1, "true", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 287);
  }
  return result;
}

void sub_222D28A34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientXpcProxy::forwardResponse(uint64_t a1, AriMsg ***a2)
{
  uint64_t BufCtx;
  const char *v5;
  const char *v6;
  void *p_p;
  _QWORD *v8;
  xpc_object_t v9;
  void *__p;
  char v12;

  BufCtx = AriMsg::GetBufCtx(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardResponse", v5);
  if (v12 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v8 = (_QWORD *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0)
    v8 = (_QWORD *)*v8;
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Msg for client(%s) Type(%s) cid(0x%x) size(%zu) ctx(0x%08x)", v6, p_p, 178, v8, "XPC", *(unsigned int *)(a1 + 8), (*a2)[1] - **a2, BufCtx);
  if (v12 < 0)
    operator delete(__p);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "AriCmd", 0x2001uLL);
  xpc_dictionary_set_data(v9, "AriMsg", **a2, (*a2)[1] - **a2);
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 40) + 16), v9);
  xpc_release(v9);
  return 0;
}

void sub_222D28B7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7__cloneEPNS0_6__baseISA_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB783D0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t AriHostRt::DeregisterClient(AriHostRt *this)
{
  int v1;
  uint64_t v2;
  _QWORD block[6];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v1 = (int)this;
  AriHostRt::GetInstance(this);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = -1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt16DeregisterClientEj_block_invoke;
  block[3] = &unk_24EB78738;
  v5 = v1;
  block[4] = &v6;
  block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v2 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD v23[3];

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = a2;
      if (v6 <= a2)
        v8 = a2 % v6;
    }
    else
    {
      v8 = (v6 - 1) & a2;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v8);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2)
              return v10;
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v11 >= v6)
                v11 %= v6;
            }
            else
            {
              v11 &= v6 - 1;
            }
            if (v11 != v8)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  v12 = (_QWORD *)(a1 + 16);
  v23[2] = 0xAAAAAAAAAAAAAA01;
  v10 = operator new(0x28uLL);
  v23[0] = v10;
  v23[1] = a1 + 16;
  *v10 = 0;
  v10[1] = v5;
  *((_DWORD *)v10 + 4) = *a3;
  v10[3] = 0;
  v10[4] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v6 || (float)(v14 * (float)v6) < v13)
  {
    v15 = 1;
    if (v6 >= 3)
      v15 = (v6 & (v6 - 1)) != 0;
    v16 = v15 | (2 * v6);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(a1, v18);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v8 = v5 % v6;
      else
        v8 = v5;
    }
    else
    {
      v8 = (v6 - 1) & v5;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v8);
  if (v20)
  {
    *v10 = *v20;
LABEL_38:
    *v20 = v10;
    goto LABEL_39;
  }
  *v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v19 + 8 * v8) = v12;
  if (*v10)
  {
    v21 = *(_QWORD *)(*v10 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v21 >= v6)
        v21 %= v6;
    }
    else
    {
      v21 &= v6 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  v23[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v23);
  return v10;
}

void sub_222D28E9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RegisterClient(AriHostRt *a1, uint64_t a2, _DWORD *a3)
{
  AriHostRt *v6;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[6];
  std::__shared_weak_count *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v6 = (AriHostRt *)AriHostRt::Init(a1);
  if ((_DWORD)v6)
    return 0xFFFFFFFFLL;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  AriHostRt::GetInstance(v6);
  v8 = qword_253DEA0E8;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1174405120;
  v15[2] = ___ZN9AriHostRt14RegisterClientENSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEERKNS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPj_block_invoke;
  v15[3] = &unk_24EB78700;
  v9 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
  v15[5] = *(_QWORD *)a1;
  v16 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v17 = a2;
  v15[4] = &v18;
  dispatch_sync(v8, v15);
  *a3 = *((_DWORD *)v19 + 6);
  v12 = v16;
  if (v16)
  {
    v13 = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  _Block_object_dispose(&v18, 8);
  return 0;
}

void sub_222D28FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(_QWORD *a1, int a2)
{
  uint64_t *v3;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v13[2];
  char v14;

  v3 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(a1, a2);
  if (v3)
  {
    v4 = (int8x8_t)a1[1];
    v5 = v3[1];
    v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      if (v5 >= *(_QWORD *)&v4)
        v5 %= *(_QWORD *)&v4;
    }
    else
    {
      v5 &= *(_QWORD *)&v4 - 1;
    }
    v7 = *(uint64_t **)(*a1 + 8 * v5);
    do
    {
      v8 = v7;
      v7 = (uint64_t *)*v7;
    }
    while (v7 != v3);
    if (v8 == a1 + 2)
      goto LABEL_19;
    v9 = v8[1];
    if (v6.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v4)
        v9 %= *(_QWORD *)&v4;
    }
    else
    {
      v9 &= *(_QWORD *)&v4 - 1;
    }
    if (v9 != v5)
    {
LABEL_19:
      if (!*v3)
        goto LABEL_20;
      v10 = *(_QWORD *)(*v3 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v10 >= *(_QWORD *)&v4)
          v10 %= *(_QWORD *)&v4;
      }
      else
      {
        v10 &= *(_QWORD *)&v4 - 1;
      }
      if (v10 != v5)
LABEL_20:
        *(_QWORD *)(*a1 + 8 * v5) = 0;
    }
    v11 = *v3;
    if (*v3)
    {
      v12 = *(_QWORD *)(v11 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v12 >= *(_QWORD *)&v4)
          v12 %= *(_QWORD *)&v4;
      }
      else
      {
        v12 &= *(_QWORD *)&v4 - 1;
      }
      if (v12 != v5)
      {
        *(_QWORD *)(*a1 + 8 * v12) = v8;
        v11 = *v3;
      }
    }
    *v8 = v11;
    *v3 = 0;
    --a1[3];
    v13[0] = v3;
    v13[1] = a1 + 2;
    v14 = 1;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v13);
  }
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(_QWORD *a1, int a2)
{
  unint64_t v2;
  uint8x8_t v3;
  unint64_t v4;
  uint64_t **v5;
  uint64_t *result;
  unint64_t v7;

  v2 = a1[1];
  if (!v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (v2 <= a2)
      v4 = a2 % v2;
  }
  else
  {
    v4 = (v2 - 1) & a2;
  }
  v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t *)*result)
  {
    v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2)
          v7 %= v2;
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN9AriHostRt13RtTransactionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t AriFramer::init(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  const char *v11;
  uint64_t result;

  MEMORY[0x22767CED0](a3 == 0, "msg_cb == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 17);
  strlcpy((char *)(a1 + 96), a2, 0x40uLL);
  *(_QWORD *)(a1 + 160) = AriFramer::IpcDataCb;
  *(_QWORD *)(a1 + 168) = a5;
  *(_QWORD *)(a1 + 176) = a1;
  result = AriOsa::IpcInit(a1, v10, v11);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a1 + 32960) = a4;
    *(_QWORD *)(a1 + 32968) = a3;
  }
  return result;
}

uint64_t AriFramer::close(AriFramer *this)
{
  TelephonyUtilTransportFree();
  return 0;
}

void Ari::AriClientProxy::AriClientProxyDebugDump(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v6;
  void *p_p;
  _QWORD *v8;
  void *__p;
  char v10;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "AriClientProxyDebugDump", a3);
  if (v10 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v8 = (_QWORD *)(*(_QWORD *)a3 + 16);
  if (*(char *)(*(_QWORD *)a3 + 39) < 0)
    v8 = (_QWORD *)*v8;
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) #%03d Client(%s-%d) ts(%u)", v6, p_p, 28, a1, v8, *(unsigned int *)(*(_QWORD *)a3 + 8), a2);
  if (v10 < 0)
    operator delete(__p);
}

void sub_222D29374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

Ari::AriClientGcdProxy *Ari::AriClientGcdProxy::AriClientGcdProxy(Ari::AriClientGcdProxy *this, char *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  *(_QWORD *)this = off_24EB78330;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 2, a2);
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *(_QWORD *)this = &off_24EB78110;
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  dispatch_retain(a3);
  v5 = dlopen("/usr/lib/libARI.dylib", 1);
  *((_QWORD *)this + 12) = v5;
  MEMORY[0x22767CED0](v5 == 0, "hostlibHandle == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 54);
  v6 = dlsym(*((void **)this + 12), "AriClientResponseCallback");
  *((_QWORD *)this + 8) = v6;
  MEMORY[0x22767CED0](v6 == 0, "clientResponseCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 57);
  v7 = dlsym(*((void **)this + 12), "AriClientIndicationCallback");
  *((_QWORD *)this + 9) = v7;
  MEMORY[0x22767CED0](v7 == 0, "clientIndicationCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 60);
  v8 = dlsym(*((void **)this + 12), "AriClientNotifyEventCallback");
  *((_QWORD *)this + 10) = v8;
  MEMORY[0x22767CED0](v8 == 0, "clientNotifyEventCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 63);
  v9 = dlsym(*((void **)this + 12), "AriClientCancelTrxCallback");
  *((_QWORD *)this + 11) = v9;
  MEMORY[0x22767CED0](v9 == 0, "clientCancelTrxCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 66);
  return this;
}

void sub_222D29508(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;
  std::__shared_weak_count *v5;

  v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void Ari::AriClientGcdProxy::~AriClientGcdProxy(Ari::AriClientGcdProxy *this)
{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_24EB78110;
  dispatch_release(*((dispatch_object_t *)this + 7));
  *((_QWORD *)this + 11) = 0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  dlclose(*((void **)this + 12));
  *((_QWORD *)this + 12) = 0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  *(_QWORD *)this = off_24EB78330;
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

{
  Ari::AriClientGcdProxy::~AriClientGcdProxy(this);
  JUMPOUT(0x22767D188);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_222D296B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x22767D14C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x22767D14C](a1 + 112);
  return a1;
}

uint64_t Ari::AriClientGcdProxy::notifyEvent(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 80))(a2, *(unsigned int *)(a1 + 8));
}

uint64_t Ari::AriClientGcdProxy::cancelTransaction(uint64_t (**this)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return this[11](a2, a3, a4);
}

uint64_t Ari::AriClientXpcProxy::AriClientXpcProxy(uint64_t a1, _QWORD *a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::string *v10;
  __int128 v11;
  std::string __p;

  v6 = *a2;
  if (*(char *)(*a2 + 55) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v6 + 32), *(_QWORD *)(v6 + 40));
  else
    __p = *(std::string *)(v6 + 32);
  *(_QWORD *)a1 = off_24EB78330;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 16), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(std::string *)(a1 + 16) = __p;
  }
  *(_QWORD *)a1 = &off_24EB781C0;
  *(_QWORD *)(a1 + 40) = *a2;
  v7 = a2[1];
  *(_QWORD *)(a1 + 48) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = (std::string *)(a1 + 56);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v11 = *a3;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  }
  return a1;
}

void sub_222D29898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v16);
  *(_QWORD *)v14 = v17;
  if (*(char *)(v14 + 39) < 0)
    operator delete(*v15);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServerConnection::getConnectDescription(Ari::AriXpcServerConnection *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 55) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 4), *((_QWORD *)this + 5));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 2);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 6);
  }
}

void Ari::AriClientXpcProxy::~AriClientXpcProxy(void **this)
{
  *this = &off_24EB781C0;
  if (*((char *)this + 79) < 0)
    operator delete(this[7]);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(this + 5));
  *this = off_24EB78330;
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

{
  Ari::AriClientXpcProxy::~AriClientXpcProxy(this);
  JUMPOUT(0x22767D188);
}

void Ari::AriClientXpcProxy::getConnectDescription(Ari::AriClientXpcProxy *this@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  const std::string::value_type *v6;
  char *v7;
  const std::string::value_type *v8;
  int v9;
  const std::string::value_type *v10;
  std::string::size_type v11;
  std::string *v12;
  std::string v13;
  std::string v14;

  std::operator+<char>();
  v4 = std::string::append(&v13, "] ", 2uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v8 = (const std::string::value_type *)*((_QWORD *)this + 2);
  v7 = (char *)this + 16;
  v6 = v8;
  v9 = v7[23];
  if (v9 >= 0)
    v10 = v7;
  else
    v10 = v6;
  if (v9 >= 0)
    v11 = v7[23];
  else
    v11 = *((_QWORD *)v7 + 1);
  v12 = std::string::append(&v14, v10, v11);
  *a2 = *v12;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
}

void sub_222D29A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void Ari::AriXpcServerConnection::send(xpc_connection_t *this, void *a2)
{
  xpc_connection_send_message(this[2], a2);
}

uint64_t Ari::AriClientXpcProxy::notifyEvent(uint64_t a1, unsigned int a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *p_p;
  xpc_object_t v10;
  void *__p;
  char v13;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "notifyEvent", a3);
  v6 = *(unsigned int *)(a1 + 8);
  v7 = asString();
  if (v13 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Notifying ARI event for cid 0x%x event %s", v8, p_p, 206, v6, v7);
  if (v13 < 0)
    operator delete(__p);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "AriCmd", 0x2003uLL);
  xpc_dictionary_set_uint64(v10, "AriEvent", a2);
  xpc_dictionary_set_uint64(v10, "AriCid", *(unsigned int *)(a1 + 8));
  xpc_dictionary_set_uint64(v10, "AriToken", (uint64_t)a3);
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 40) + 16), v10);
  xpc_release(v10);
  return 0;
}

void sub_222D29BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientXpcProxy::cancelTransaction(Ari::AriClientXpcProxy *this, uint64_t a2, const char *a3, int a4)
{
  uint64_t v8;
  const char *v9;
  void *p_p;
  xpc_object_t v11;
  void *__p;
  char v14;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "cancelTransaction", a3);
  v8 = asString();
  if (v14 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Canceling transaction 0x%04x gmid 0x%x reason(%s)", v9, p_p, 221, a2, a3, v8);
  if (v14 < 0)
    operator delete(__p);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "AriCmd", 0x2004uLL);
  xpc_dictionary_set_uint64(v11, "context_id", (int)a2);
  xpc_dictionary_set_uint64(v11, "AriGmid", a3);
  xpc_dictionary_set_int64(v11, "AriResult", a4);
  xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)this + 5) + 16), v11);
  xpc_release(v11);
  return 0;
}

void sub_222D29CF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Ari::AriXpcServer::create(Ari::AriXpcServer **a1@<X8>)
{
  char *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  Ari::AriXpcServer *v10;
  Ari::AriXpcServer *v11;

  v3 = (char *)operator new(0x60uLL);
  v4 = (std::__shared_weak_count *)v3;
  *((_QWORD *)v3 + 1) = 0;
  v5 = (unint64_t *)(v3 + 8);
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &off_24EB78380;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *((_DWORD *)v3 + 22) = 1065353216;
  v10 = (Ari::AriXpcServer *)(v3 + 24);
  v11 = (Ari::AriXpcServer *)v3;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  v7 = (unint64_t *)(v3 + 16);
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  *((_QWORD *)v3 + 3) = v3 + 24;
  *((_QWORD *)v3 + 4) = v3;
  do
    v9 = __ldaxr(v5);
  while (__stlxr(v9 - 1, v5));
  if (!v9)
  {
    (*(void (**)(char *))(*(_QWORD *)v3 + 16))(v3);
    std::__shared_weak_count::__release_weak(v4);
  }
  Ari::AriXpcServer::init(v10);
  *a1 = v10;
  a1[1] = v11;
}

void sub_222D29DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServer::init(Ari::AriXpcServer *this)
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  void **v7;
  NSObject *v8;
  dispatch_queue_t v9;
  xpc_connection_t mach_service;
  _xpc_connection_s *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD handler[6];
  void *v14[2];
  uint64_t v15;
  char v16;

  v2 = getprogname();
  if (!strncmp(v2, "CommCenter", 0x10uLL)
    || (v4 = getprogname(), !strncmp(v4, "CommCenter-asan", 0x10uLL))
    || (v5 = getprogname(), !strncmp(v5, "basebandd", 0x10uLL)))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init", v3);
    if (v15 >= 0)
      v7 = v14;
    else
      v7 = (void **)v14[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) XPC Listener: setting up connection", v6, v7, 260);
    if (SHIBYTE(v15) < 0)
      operator delete(v14[0]);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v9 = dispatch_queue_create("AriHostRt", v8);
    *((_QWORD *)this + 2) = v9;
    MEMORY[0x22767CED0](v9 == 0, "listenQueue == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 262);
    mach_service = xpc_connection_create_mach_service("com.apple.commcenter.ari.rt.xpc", *((dispatch_queue_t *)this + 2), 1uLL);
    *((_QWORD *)this + 3) = mach_service;
    MEMORY[0x22767CED0](mach_service == 0, "serverConn == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 264);
    v14[0] = 0;
    v14[1] = v14;
    v15 = 0x2000000000;
    v16 = 0;
    v11 = (_xpc_connection_s *)*((_QWORD *)this + 3);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ___ZN3Ari12AriXpcServer4initEv_block_invoke;
    handler[3] = &unk_24EB78208;
    handler[4] = v14;
    handler[5] = this;
    xpc_connection_set_event_handler(v11, handler);
    xpc_connection_resume(*((xpc_connection_t *)this + 3));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("ARI_SERVER_READY_NOTIFICATION"), 0, 0, 1u);
    _Block_object_dispose(v14, 8);
  }
}

void sub_222D29FB4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 25) < 0)
    operator delete(*(void **)(v1 - 48));
  _Unwind_Resume(exception_object);
}

uint64_t std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](uint64_t a1)
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

double Ari::AriXpcServer::AriXpcServer(Ari::AriXpcServer *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

void Ari::AriXpcServer::~AriXpcServer(Ari::AriXpcServer *this)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  std::__shared_weak_count *v5;

  v2 = (_QWORD *)*((_QWORD *)this + 6);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = (void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v4)
    operator delete(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

void Ari::AriXpcServer::dumpState(Ari::AriXpcServer *this, uint64_t a2, const char *a3)
{
  const char *v4;
  void **v5;
  uint64_t v6;
  const char *v7;
  _QWORD *i;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  char v16;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", a3);
  if (v16 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) XPC Server has %zu active connections:", v4, v5, 316, *((_QWORD *)this + 7));
  if (v16 < 0)
    operator delete(__p[0]);
  for (i = (_QWORD *)*((_QWORD *)this + 6); i; i = (_QWORD *)*i)
  {
    v9 = (void *)i[2];
    v10 = (std::__shared_weak_count *)i[3];
    __p[0] = v9;
    __p[1] = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    Ari::AriXpcServerConnection::dumpState((Ari::AriXpcServerConnection *)v9, v6, v7);
    if (v10)
    {
      v13 = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
}

void sub_222D2A1C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriXpcServerConnection::dumpState(Ari::AriXpcServerConnection *this, uint64_t a2, const char *a3)
{
  const char *v4;
  void **v5;
  _QWORD *v6;
  __int128 v7;
  const char *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  void **v12;
  const char *v13;
  void **v14;
  void **v15;
  void *v17[2];
  char v18;
  void *v19;
  char v20;
  void *__p[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25[2];
  __int128 v26;
  __int128 v27;
  _OWORD v28[9];
  unint64_t v29;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", a3);
  if ((SBYTE7(v22) & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  v6 = (_QWORD *)((char *)this + 32);
  if (*((char *)this + 55) < 0)
    v6 = (_QWORD *)*v6;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) %zu registered clients on connection %s", v4, v5, 620, *((_QWORD *)this + 11), v6);
  if (SBYTE7(v22) < 0)
    operator delete(__p[0]);
  v29 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[7] = v7;
  v28[8] = v7;
  v28[5] = v7;
  v28[6] = v7;
  v28[3] = v7;
  v28[4] = v7;
  v28[1] = v7;
  v28[2] = v7;
  v27 = v7;
  v28[0] = v7;
  *(_OWORD *)v25 = v7;
  v26 = v7;
  v23 = v7;
  v24 = v7;
  *(_OWORD *)__p = v7;
  v22 = v7;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
  v9 = (_QWORD *)((char *)this + 80);
  while (1)
  {
    v9 = (_QWORD *)*v9;
    if (!v9)
      break;
    v10 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", ", 2);
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", v8);
  v11 = v20;
  v12 = (void **)v19;
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__p[1], v17);
  v14 = &v19;
  if (v11 < 0)
    v14 = v12;
  if (v18 >= 0)
    v15 = v17;
  else
    v15 = (void **)v17[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Associated cids: %s", v13, v14, 626, v15);
  if (v18 < 0)
    operator delete(v17[0]);
  if (v20 < 0)
    operator delete(v19);
  __p[0] = *(void **)MEMORY[0x24BEDB800];
  *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(MEMORY[0x24BEDB800] + 24);
  __p[1] = (void *)(MEMORY[0x24BEDB848] + 16);
  if (SHIBYTE(v26) < 0)
    operator delete(v25[1]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x22767D14C](v28);
}

void sub_222D2A3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a18 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  std::ostringstream::~ostringstream((uint64_t)&a25);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriXpcServerConnection::AriXpcServerConnection(uint64_t a1, void *a2, uint64_t a3)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = 0;
  asString(a2);
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_DWORD *)(a1 + 96) = 1065353216;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](a1 + 104, a3);
  xpc_retain(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 24) = dispatch_queue_create("ConnectionQueue (multiple instances)", 0);
  return a1;
}

void sub_222D2A4D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v6 = *(_QWORD **)(v1 + 128);
  if (v6 == v4)
  {
    v7 = v4;
    v8 = 4;
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v8 = 5;
    v7 = *(_QWORD **)(v1 + 128);
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_6:
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v3);
  if (*(char *)(v1 + 55) < 0)
    operator delete(*v2);
  v9 = *(std::__shared_weak_count **)(v1 + 8);
  if (v9)
    std::__shared_weak_count::__release_weak(v9);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServerConnection::~AriXpcServerConnection(Ari::AriXpcServerConnection *this)
{
  void *v2;
  NSObject *v3;
  Ari::AriXpcServerConnection *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;

  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
  {
    xpc_release(v2);
    *((_QWORD *)this + 2) = 0;
  }
  v3 = *((_QWORD *)this + 3);
  if (v3)
  {
    dispatch_release(v3);
    *((_QWORD *)this + 3) = 0;
  }
  v4 = (Ari::AriXpcServerConnection *)*((_QWORD *)this + 16);
  if (v4 == (Ari::AriXpcServerConnection *)((char *)this + 104))
  {
    v5 = 4;
    v4 = (Ari::AriXpcServerConnection *)((char *)this + 104);
  }
  else
  {
    if (!v4)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_10:
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)this + 64);
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void Ari::AriXpcServerConnection::init(Ari::AriXpcServerConnection *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _xpc_connection_s *v10;
  unint64_t v11;
  _QWORD handler[6];
  std::__shared_weak_count *v13;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v2 || (v3 = *(_QWORD *)this, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v7 = __ldxr(p_shared_weak_owners);
  while (__stxr(v7 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  xpc_connection_set_target_queue(*((xpc_connection_t *)this + 2), *((dispatch_queue_t *)this + 3));
  v10 = (_xpc_connection_s *)*((_QWORD *)this + 2);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZN3Ari22AriXpcServerConnection4initEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_54;
  handler[4] = this;
  handler[5] = v3;
  v13 = v5;
  do
    v11 = __ldxr(p_shared_weak_owners);
  while (__stxr(v11 + 1, p_shared_weak_owners));
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_resume(*((xpc_connection_t *)this + 2));
  if (v13)
    std::__shared_weak_count::__release_weak(v13);
  std::__shared_weak_count::__release_weak(v5);
}

void sub_222D2A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::__shared_weak_count *v16;

  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  std::__shared_weak_count::__release_weak(v16);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t Ari::AriXpcServerConnection::handleRegistration(Ari::AriXpcServerConnection *this, xpc_object_t xdict)
{
  const char *string;
  const char *v5;
  char *v6;
  const char *v7;
  void **v8;
  const char *v9;
  char v10;
  const char *v11;
  void **v12;
  const char *v13;
  void **v14;
  const char *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  std::__shared_weak_count *v18;
  const char *v19;
  int v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  const char *v23;
  void **v24;
  uint64_t result;
  const char *v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  xpc_object_t reply;
  void *v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t **v34;
  uint64_t *i;
  unint64_t v36;
  _QWORD *v37;
  float v38;
  float v39;
  _BOOL8 v40;
  unint64_t v41;
  unint64_t v42;
  int8x8_t prime;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint8x8_t v49;
  unint64_t v50;
  uint8x8_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  void *v59;
  _QWORD v60[2];
  unsigned int v61;
  void *__p[2];
  char v63;

  string = xpc_dictionary_get_string(xdict, "AriCheckin");
  if (!string)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v5);
    if (v63 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Received invalid check-in name in client registration request", v11, v12, 464);
    goto LABEL_37;
  }
  v6 = (char *)string;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v5);
  if (v63 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Received checkin from client %s", v7, v8, 421, v6);
  if (v63 < 0)
    operator delete(__p[0]);
  if (!*((_BYTE *)this + 56))
  {
    if (qword_253DF23F0)
    {
      __p[0] = xdict;
      v10 = (*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)qword_253DF23F0 + 48))(qword_253DF23F0, __p);
    }
    else
    {
      v10 = 1;
    }
    *((_BYTE *)this + 56) = v10;
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v9);
    if (v63 >= 0)
      v14 = __p;
    else
      v14 = (void **)__p[0];
    if (*((_BYTE *)this + 56))
      v15 = "yes";
    else
      v15 = "no";
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Entitlement check; Client: %s Entitled: %s", v13, v14, 426, v6, v15);
    if (v63 < 0)
      operator delete(__p[0]);
    if (!*((_BYTE *)this + 56))
      return 0xFFFFFFFFLL;
  }
  v61 = 0;
  v16 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  v60[0] = *(_QWORD *)this;
  if (!v16 || (v17 = std::__shared_weak_count::lock(v16), (v60[1] = v17) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v18 = v17;
  std::string::basic_string[abi:ne180100]<0>(__p, v6);
  v20 = AriHostRt::RegisterClient((AriHostRt *)v60, (uint64_t)__p, &v61);
  if (v63 < 0)
    operator delete(__p[0]);
  p_shared_owners = (unint64_t *)&v18->__shared_owners_;
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  if (v20)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v19);
    if (v63 >= 0)
      v24 = __p;
    else
      v24 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error registering ARI client %s", v23, v24, 458, v6);
LABEL_37:
    if (v63 < 0)
      operator delete(__p[0]);
    return 0xFFFFFFFFLL;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v19);
  if (v63 >= 0)
    v27 = __p;
  else
    v27 = (void **)__p[0];
  v28 = v61;
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Sending XPC ARI registration reply with cid 0x%04x", v26, v27, 435, v61);
  if (v63 < 0)
    operator delete(__p[0]);
  v29 = (int)v28;
  if (xpc_dictionary_get_BOOL(xdict, "ExpectsReply"))
    reply = xpc_dictionary_create_reply(xdict);
  else
    reply = xpc_dictionary_create(0, 0, 0);
  v31 = reply;
  xpc_dictionary_set_uint64(reply, "AriCmd", 0xA010uLL);
  xpc_dictionary_set_uint64(v31, "AriCid", v28);
  xpc_connection_send_message(*((xpc_connection_t *)this + 2), v31);
  xpc_release(v31);
  v32 = *((_QWORD *)this + 9);
  if (v32)
  {
    v33 = (uint8x8_t)vcnt_s8((int8x8_t)v32);
    v33.i16[0] = vaddlv_u8(v33);
    if (v33.u32[0] > 1uLL)
    {
      v28 = (int)v28;
      if (v32 <= (int)v28)
        v28 = (int)v28 % v32;
    }
    else
    {
      v28 = (v32 - 1) & (int)v28;
    }
    v34 = *(uint64_t ***)(*((_QWORD *)this + 8) + 8 * v28);
    if (v34)
    {
      for (i = *v34; i; i = (uint64_t *)*i)
      {
        v36 = i[1];
        if (v36 == v29)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v29)
            return 0;
        }
        else
        {
          if (v33.u32[0] > 1uLL)
          {
            if (v36 >= v32)
              v36 %= v32;
          }
          else
          {
            v36 &= v32 - 1;
          }
          if (v36 != v28)
            break;
        }
      }
    }
  }
  else
  {
    v28 = 0xAAAAAAAAAAAAAAAALL;
  }
  v37 = operator new(0x18uLL);
  *v37 = 0;
  v37[1] = v29;
  *((_DWORD *)v37 + 4) = v29;
  v38 = (float)(unint64_t)(*((_QWORD *)this + 11) + 1);
  v39 = *((float *)this + 24);
  if (!v32 || (float)(v39 * (float)v32) < v38)
  {
    v40 = 1;
    if (v32 >= 3)
      v40 = (v32 & (v32 - 1)) != 0;
    v41 = v40 | (2 * v32);
    v42 = vcvtps_u32_f32(v38 / v39);
    if (v41 <= v42)
      prime = (int8x8_t)v42;
    else
      prime = (int8x8_t)v41;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v32 = *((_QWORD *)this + 9);
    }
    if (*(_QWORD *)&prime > v32)
      goto LABEL_77;
    if (*(_QWORD *)&prime < v32)
    {
      v50 = vcvtps_u32_f32((float)*((unint64_t *)this + 11) / *((float *)this + 24));
      if (v32 < 3 || (v51 = (uint8x8_t)vcnt_s8((int8x8_t)v32), v51.i16[0] = vaddlv_u8(v51), v51.u32[0] > 1uLL))
      {
        v50 = std::__next_prime(v50);
      }
      else
      {
        v52 = 1 << -(char)__clz(v50 - 1);
        if (v50 >= 2)
          v50 = v52;
      }
      if (*(_QWORD *)&prime <= v50)
        prime = (int8x8_t)v50;
      if (*(_QWORD *)&prime >= v32)
      {
        v32 = *((_QWORD *)this + 9);
      }
      else
      {
        if (prime)
        {
LABEL_77:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v44 = operator new(8 * *(_QWORD *)&prime);
          v45 = (void *)*((_QWORD *)this + 8);
          *((_QWORD *)this + 8) = v44;
          if (v45)
            operator delete(v45);
          v46 = 0;
          *((int8x8_t *)this + 9) = prime;
          do
            *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v46++) = 0;
          while (*(_QWORD *)&prime != v46);
          v47 = (_QWORD *)*((_QWORD *)this + 10);
          if (v47)
          {
            v48 = v47[1];
            v49 = (uint8x8_t)vcnt_s8(prime);
            v49.i16[0] = vaddlv_u8(v49);
            if (v49.u32[0] > 1uLL)
            {
              if (v48 >= *(_QWORD *)&prime)
                v48 %= *(_QWORD *)&prime;
            }
            else
            {
              v48 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v48) = (char *)this + 80;
            v53 = (_QWORD *)*v47;
            if (*v47)
            {
              do
              {
                v54 = v53[1];
                if (v49.u32[0] > 1uLL)
                {
                  if (v54 >= *(_QWORD *)&prime)
                    v54 %= *(_QWORD *)&prime;
                }
                else
                {
                  v54 &= *(_QWORD *)&prime - 1;
                }
                if (v54 != v48)
                {
                  v55 = *((_QWORD *)this + 8);
                  if (!*(_QWORD *)(v55 + 8 * v54))
                  {
                    *(_QWORD *)(v55 + 8 * v54) = v47;
                    goto LABEL_102;
                  }
                  *v47 = *v53;
                  *v53 = **(_QWORD **)(*((_QWORD *)this + 8) + 8 * v54);
                  **(_QWORD **)(*((_QWORD *)this + 8) + 8 * v54) = v53;
                  v53 = v47;
                }
                v54 = v48;
LABEL_102:
                v47 = v53;
                v53 = (_QWORD *)*v53;
                v48 = v54;
              }
              while (v53);
            }
          }
          v32 = (unint64_t)prime;
          goto LABEL_106;
        }
        v59 = (void *)*((_QWORD *)this + 8);
        *((_QWORD *)this + 8) = 0;
        if (v59)
          operator delete(v59);
        v32 = 0;
        *((_QWORD *)this + 9) = 0;
      }
    }
LABEL_106:
    if ((v32 & (v32 - 1)) != 0)
    {
      if (v32 <= v29)
        v28 = v29 % v32;
      else
        v28 = v29;
    }
    else
    {
      v28 = (v32 - 1) & v29;
    }
  }
  v56 = *((_QWORD *)this + 8);
  v57 = *(_QWORD **)(v56 + 8 * v28);
  if (v57)
  {
    *v37 = *v57;
LABEL_119:
    *v57 = v37;
    goto LABEL_120;
  }
  *v37 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = v37;
  *(_QWORD *)(v56 + 8 * v28) = (char *)this + 80;
  if (*v37)
  {
    v58 = *(_QWORD *)(*v37 + 8);
    if ((v32 & (v32 - 1)) != 0)
    {
      if (v58 >= v32)
        v58 %= v32;
    }
    else
    {
      v58 &= v32 - 1;
    }
    v57 = (_QWORD *)(*((_QWORD *)this + 8) + 8 * v58);
    goto LABEL_119;
  }
LABEL_120:
  result = 0;
  ++*((_QWORD *)this + 11);
  return result;
}

void sub_222D2AE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  operator delete(v21);
  _Unwind_Resume(a1);
}

int8x8_t **Ari::AriXpcServerConnection::handleDeregistration(int8x8_t *this, xpc_object_t xdict)
{
  AriHostRt *uint64;
  const char *v4;
  AriHostRt *v5;
  const char *v6;
  const char *v7;
  void **v8;
  const char *v9;
  void **v10;
  int8x8_t **v11;
  const char *v13;
  void **v14;
  int8x8_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  int8x8_t v19;
  int8x8_t *v20;
  uint64_t v21;
  unint64_t v22;
  int8x8_t v23;
  int8x8_t *v24;
  int8x8_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *__p[2];
  char v30;

  uint64 = (AriHostRt *)xpc_dictionary_get_uint64(xdict, "AriCid");
  v5 = uint64;
  if (!(_DWORD)uint64)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v4);
    if (v30 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Attempt to de-register cid 0x%x", v9, v10, 488, 0);
LABEL_11:
    if (v30 < 0)
      operator delete(__p[0]);
    return (int8x8_t **)0xFFFFFFFFLL;
  }
  if (AriHostRt::DeregisterClient(uint64))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v6);
    if (v30 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to deregister cid 0x%x", v7, v8, 483, v5);
    goto LABEL_11;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v6);
  if (v30 >= 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Deregistered cid 0x%x", v13, v14, 477, v5);
  if (v30 < 0)
    operator delete(__p[0]);
  v15 = this[9];
  if (!*(_QWORD *)&v15)
    return 0;
  v16 = (int)v5;
  v17 = (uint8x8_t)vcnt_s8(v15);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] > 1uLL)
  {
    v18 = (int)v5;
    if (*(_QWORD *)&v15 <= (unint64_t)(int)v5)
      v18 = (unint64_t)(int)v5 % *(_QWORD *)&v15;
  }
  else
  {
    v18 = (*(_QWORD *)&v15 - 1) & (int)v5;
  }
  v19 = this[8];
  v11 = *(int8x8_t ***)(*(_QWORD *)&v19 + 8 * v18);
  if (v11)
  {
    v20 = *v11;
    if (!*v11)
      return 0;
    v21 = *(_QWORD *)&v15 - 1;
    do
    {
      v22 = (unint64_t)v20[1];
      if (v22 == (int)v5)
      {
        if (v20[2].i32[0] == (_DWORD)v5)
        {
          v23 = *v20;
          if (v17.u32[0] > 1uLL)
          {
            if ((unint64_t)(int)v5 >= *(_QWORD *)&v15)
              v16 = (unint64_t)(int)v5 % *(_QWORD *)&v15;
          }
          else
          {
            v16 = (int)v5 & (unint64_t)v21;
          }
          v24 = *(int8x8_t **)(*(_QWORD *)&v19 + 8 * v16);
          do
          {
            v25 = v24;
            v24 = (int8x8_t *)*v24;
          }
          while (v24 != v20);
          if (v25 == &this[10])
            goto LABEL_55;
          v26 = (unint64_t)v25[1];
          if (v17.u32[0] > 1uLL)
          {
            if (v26 >= *(_QWORD *)&v15)
              v26 %= *(_QWORD *)&v15;
          }
          else
          {
            v26 &= v21;
          }
          if (v26 == v16)
          {
LABEL_57:
            if (v23)
            {
              v27 = *(_QWORD *)(*(_QWORD *)&v23 + 8);
              goto LABEL_59;
            }
          }
          else
          {
LABEL_55:
            if (!*(_QWORD *)&v23)
              goto LABEL_56;
            v27 = *(_QWORD *)(*(_QWORD *)&v23 + 8);
            if (v17.u32[0] > 1uLL)
            {
              v28 = *(_QWORD *)(*(_QWORD *)&v23 + 8);
              if (v27 >= *(_QWORD *)&v15)
                v28 = v27 % *(_QWORD *)&v15;
            }
            else
            {
              v28 = v27 & v21;
            }
            if (v28 != v16)
            {
LABEL_56:
              *(_QWORD *)(*(_QWORD *)&v19 + 8 * v16) = 0;
              v23 = *v20;
              goto LABEL_57;
            }
LABEL_59:
            if (v17.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&v15)
                v27 %= *(_QWORD *)&v15;
            }
            else
            {
              v27 &= v21;
            }
            if (v27 != v16)
            {
              *(_QWORD *)(*(_QWORD *)&this[8] + 8 * v27) = v25;
              v23 = *v20;
            }
          }
          *v25 = v23;
          *v20 = 0;
          --*(_QWORD *)&this[11];
          operator delete(v20);
          return 0;
        }
      }
      else
      {
        if (v17.u32[0] > 1uLL)
        {
          if (v22 >= *(_QWORD *)&v15)
            v22 %= *(_QWORD *)&v15;
        }
        else
        {
          v22 &= v21;
        }
        if (v22 != v18)
          return 0;
      }
      v11 = 0;
      v20 = (int8x8_t *)*v20;
    }
    while (v20);
  }
  return v11;
}

void sub_222D2B17C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  Ari::AriXpcServerConnection *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t uint64;
  const char *v7;
  uint64_t v8;
  const char *v9;
  std::string *v10;
  uint64_t v11;
  uint64_t v12;
  AriHostRt *data;
  const char *v14;
  AriHostRt *v15;
  const char *v16;
  std::string *v17;
  const char *v18;
  std::string *v19;
  AriHostRt *v20;
  uint64_t v21;
  AriHostRt *v22;
  int v23;
  int v24;
  AriHostRt *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  std::string *p_p;
  AriHostRt *v31;
  char *string;
  uint64_t v33;
  AriHostRt *v34;
  AriHostRt *v35;
  xpc_object_t array;
  unint64_t *p_shared_owners;
  unint64_t v38;
  uint64_t v39;
  const char *v40;
  std::string *v41;
  const char *v42;
  std::string *v43;
  std::string v44;
  _QWORD applier[5];
  std::string __p;
  _QWORD *(*v47)(_QWORD *, _QWORD *);
  _QWORD *(*v48)(uint64_t);
  _QWORD v49[3];
  size_t length;
  std::__shared_weak_count *v52;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    v3 = *(Ari::AriXpcServerConnection **)(a1 + 32);
    v4 = std::__shared_weak_count::lock(v2);
    v52 = v4;
    if (v4)
    {
      v5 = v4;
      if (*(_QWORD *)(a1 + 40))
      {
        uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCmd");
        v8 = uint64;
        if ((_DWORD)uint64 == 4112)
        {
          Ari::AriXpcServerConnection::handleRegistration(v3, *(xpc_object_t *)(a1 + 56));
        }
        else if (*((_BYTE *)v3 + 56))
        {
          switch((int)uint64)
          {
            case 4113:
              Ari::AriXpcServerConnection::handleDeregistration((int8x8_t *)v3, *(xpc_object_t *)(a1 + 56));
              break;
            case 4114:
              v20 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriGmid");
              v21 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::RegIndication(v20, v21);
              break;
            case 4115:
              v22 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriGmid");
              v23 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::DeregIndication(v22, v23);
              break;
            case 4116:
              v24 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriEvent");
              v25 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              v26 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriToken");
              AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v27);
              v28 = asString();
              p_p = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Received notify ACK from cid 0x%x for event %s token %llu", v29, p_p, 578, v25, v28, v26);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              AriHostRt::ProcessClientNotifyAck(v25, v24, v26);
              break;
            case 4117:
              v31 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              memset(&__p, 170, sizeof(__p));
              string = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "ErrorReason");
              std::string::basic_string[abi:ne180100]<0>(&__p, string);
              v33 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "ErrorType");
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v44, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              else
                v44 = __p;
              AriHostRt::ProcessClientError(v31, v33, (uint64_t)&v44);
              if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v44.__r_.__value_.__l.__data_);
              goto LABEL_13;
            case 4118:
              v34 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::RegAllIndications(v34);
              break;
            case 4119:
              v35 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 56), "AriGmidList");
              __p.__r_.__value_.__r.__words[0] = 0;
              __p.__r_.__value_.__l.__size_ = (std::string::size_type)&__p;
              __p.__r_.__value_.__r.__words[2] = 0x4002000000;
              v47 = __Block_byref_object_copy_;
              v48 = __Block_byref_object_dispose_;
              v49[0] = v49;
              v49[1] = v49;
              v49[2] = 0;
              applier[0] = MEMORY[0x24BDAC760];
              applier[1] = 0x40000000;
              applier[2] = ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke_71;
              applier[3] = &unk_24EB78260;
              applier[4] = &__p;
              xpc_array_apply(array, applier);
              AriHostRt::PushAllIndications(v35, __p.__r_.__value_.__l.__size_ + 40);
              _Block_object_dispose(&__p, 8);
              std::__list_imp<unsigned int>::clear(v49);
              break;
            default:
              if ((_DWORD)uint64 != 4097)
              {
                AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v7);
                v39 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCmd");
                v41 = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v41 = (std::string *)__p.__r_.__value_.__r.__words[0];
                Ari::Log((Ari *)8, (uint64_t)"(%s:%d) received unknown xpc command 0x%llx", v40, v41, 592, v39);
                goto LABEL_13;
              }
              length = 0xAAAAAAAAAAAAAAAALL;
              v11 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "context_id");
              v12 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriMsgTO");
              data = (AriHostRt *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 56), "AriMsg", &length);
              v15 = data;
              if (!(_DWORD)v11 || !length || !data)
              {
                AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v14);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v43 = &__p;
                else
                  v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
                Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Received invalid message from XPC client id(%u) size(%lu), msg(%p)\n", v42, v43, 526, v11, length, v15);
                goto LABEL_13;
              }
              AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v14);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v17 = &__p;
              else
                v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
              Ari::Log((Ari *)4, (uint64_t)"(%s:%d) message received for ctx 0x%08x to(%d)", v16, v17, 530, v11, v12);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v18);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v19 = &__p;
              else
                v19 = (std::string *)__p.__r_.__value_.__r.__words[0];
              Ari::LogBuf((Ari *)"msg", (const char *)v19, (const char *)0x213, (uint64_t)v15, (const void *)length);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              AriHostRt::SendRaw(v15, (unsigned __int8 *)length, v12);
              break;
          }
        }
        else
        {
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v7);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v10 = &__p;
          else
            v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Entitlement check failed for client; ignoring xpc command 0x%x",
            v9,
            v10,
            598,
            v8);
LABEL_13:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
        xpc_release(*(xpc_object_t *)(a1 + 56));
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v38 = __ldaxr(p_shared_owners);
      while (__stlxr(v38 - 1, p_shared_owners));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_222D2B764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (a32 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v32 - 80);
  _Unwind_Resume(a1);
}

_QWORD *__Block_byref_object_copy_(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result[5] = result + 5;
  result[6] = result + 5;
  result[7] = 0;
  v2 = a2[7];
  if (v2)
  {
    v4 = a2[5];
    v3 = (uint64_t *)a2[6];
    v5 = *v3;
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(v4 + 8);
    **(_QWORD **)(v4 + 8) = v5;
    v6 = result[5];
    *(_QWORD *)(v6 + 8) = v3;
    *v3 = v6;
    result[5] = v4;
    *(_QWORD *)(v4 + 8) = result + 5;
    result[7] = v2;
    a2[7] = 0;
  }
  return result;
}

_QWORD *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::__list_imp<unsigned int>::clear((_QWORD *)(a1 + 40));
}

uint64_t ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke_71(uint64_t a1, int a2, xpc_object_t xuint)
{
  _QWORD *v3;
  int value;
  _DWORD *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  value = xpc_uint64_get_value(xuint);
  v5 = operator new(0x18uLL);
  v5[4] = value;
  v6 = v3[5];
  v3 += 5;
  *(_QWORD *)v5 = v6;
  *((_QWORD *)v5 + 1) = v3;
  *(_QWORD *)(v6 + 8) = v5;
  *v3 = v5;
  ++v3[2];
  return 1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EB77EA0, MEMORY[0x24BEDAAF0]);
}

void sub_222D2B934(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
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
      std::string::__throw_length_error[abi:ne180100]();
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

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

_QWORD *std::__list_imp<unsigned int>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78380;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78380;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::__on_zero_shared(uint64_t a1)
{
  Ari::AriXpcServer::~AriXpcServer((Ari::AriXpcServer *)(a1 + 24));
}

_QWORD *_ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEED1Ev(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_24EB783D0;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEED0Ev(_QWORD *a1)
{
  std::__shared_weak_count *v1;

  *a1 = &off_24EB783D0;
  v1 = (std::__shared_weak_count *)a1[2];
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB783D0;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7destroyEv(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE18destroy_deallocateEv(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEEclEOS9_(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_weak_owners;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v22[5];
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;

  v4 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 8);
      if (v8)
      {
        v9 = *(NSObject **)(v8 + 16);
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 1174405120;
        v22[2] = ___ZZZN3Ari12AriXpcServer4initEvEUb_ENK3__0clENSt3__110shared_ptrINS_22AriXpcServerConnectionEEE_block_invoke;
        v22[3] = &__block_descriptor_tmp_86;
        v10 = *(std::__shared_weak_count **)(a1 + 16);
        v22[4] = v8;
        v23 = v10;
        if (v10)
        {
          p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
          do
            v12 = __ldxr(p_shared_weak_owners);
          while (__stxr(v12 + 1, p_shared_weak_owners));
        }
        v24 = v4;
        v25 = v3;
        if (v3)
        {
          p_shared_owners = (unint64_t *)&v3->__shared_owners_;
          do
            v14 = __ldxr(p_shared_owners);
          while (__stxr(v14 + 1, p_shared_owners));
        }
        dispatch_async(v9, v22);
        v15 = v25;
        if (v25)
        {
          v16 = (unint64_t *)&v25->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        if (v23)
          std::__shared_weak_count::__release_weak(v23);
      }
      v18 = (unint64_t *)&v7->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  if (v3)
  {
    v20 = (unint64_t *)&v3->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

uint64_t _ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN3Ari12AriXpcServer4initEvEUb_E3__0))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE11target_typeEv()
{
  return &_ZTIZZN3Ari12AriXpcServer4initEvEUb_E3__0;
}

void ___ZZZN3Ari12AriXpcServer4initEvEUb_ENK3__0clENSt3__110shared_ptrINS_22AriXpcServerConnectionEEE_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  const char *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  void **v7;
  const char *v8;
  uint64_t v9;
  std::string *v10;
  int8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD **v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::string v31;
  _QWORD *v32;
  std::__shared_weak_count *v33;
  void *v34[2];
  char v35;
  char v36;

  v2 = (std::__shared_weak_count *)a1[5];
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v33 = v3;
    if (v3)
    {
      v5 = v3;
      v6 = (_QWORD *)a1[4];
      v32 = v6;
      if (v6)
      {
        v7 = v34;
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "operator()_block_invoke", v4);
        if (v36 < 0)
          v7 = (void **)v34[0];
        v9 = a1[6];
        if (*(char *)(v9 + 55) < 0)
          std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)(v9 + 32), *(_QWORD *)(v9 + 40));
        else
          v31 = *(std::string *)(v9 + 32);
        if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v10 = &v31;
        else
          v10 = (std::string *)v31.__r_.__value_.__r.__words[0];
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Removing connection %s", v8, v7, 302, v10);
        if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v31.__r_.__value_.__l.__data_);
        if (v36 < 0)
          operator delete(v34[0]);
        v11 = (int8x8_t)v6[5];
        if (v11)
        {
          v12 = a1[6];
          v13 = 0x9DDFEA08EB382D69 * (((8 * v12) + 8) ^ HIDWORD(v12));
          v14 = 0x9DDFEA08EB382D69 * (HIDWORD(v12) ^ (v13 >> 47) ^ v13);
          v15 = 0x9DDFEA08EB382D69 * (v14 ^ (v14 >> 47));
          v16 = (uint8x8_t)vcnt_s8(v11);
          v16.i16[0] = vaddlv_u8(v16);
          if (v16.u32[0] > 1uLL)
          {
            v17 = v15;
            if (v15 >= *(_QWORD *)&v11)
              v17 = v15 % *(_QWORD *)&v11;
          }
          else
          {
            v17 = v15 & (*(_QWORD *)&v11 - 1);
          }
          v18 = v6[4];
          v19 = *(_QWORD ***)(v18 + 8 * v17);
          if (v19)
          {
            v20 = *v19;
            if (v20)
            {
              v21 = *(_QWORD *)&v11 - 1;
              do
              {
                v22 = v20[1];
                if (v22 == v15)
                {
                  if (v20[2] == v12)
                  {
                    if (v16.u32[0] > 1uLL)
                    {
                      if (v15 >= *(_QWORD *)&v11)
                        v15 %= *(_QWORD *)&v11;
                    }
                    else
                    {
                      v15 &= v21;
                    }
                    v23 = *(_QWORD **)(v18 + 8 * v15);
                    do
                    {
                      v24 = v23;
                      v23 = (_QWORD *)*v23;
                    }
                    while (v23 != v20);
                    if (v24 == v6 + 6)
                      goto LABEL_51;
                    v25 = v24[1];
                    if (v16.u32[0] > 1uLL)
                    {
                      if (v25 >= *(_QWORD *)&v11)
                        v25 %= *(_QWORD *)&v11;
                    }
                    else
                    {
                      v25 &= v21;
                    }
                    if (v25 != v15)
                    {
LABEL_51:
                      if (!*v20)
                        goto LABEL_52;
                      v26 = *(_QWORD *)(*v20 + 8);
                      if (v16.u32[0] > 1uLL)
                      {
                        if (v26 >= *(_QWORD *)&v11)
                          v26 %= *(_QWORD *)&v11;
                      }
                      else
                      {
                        v26 &= v21;
                      }
                      if (v26 != v15)
LABEL_52:
                        *(_QWORD *)(v18 + 8 * v15) = 0;
                    }
                    v27 = *v20;
                    if (*v20)
                    {
                      v28 = *(_QWORD *)(v27 + 8);
                      if (v16.u32[0] > 1uLL)
                      {
                        if (v28 >= *(_QWORD *)&v11)
                          v28 %= *(_QWORD *)&v11;
                      }
                      else
                      {
                        v28 &= v21;
                      }
                      if (v28 != v15)
                      {
                        *(_QWORD *)(v6[4] + 8 * v28) = v24;
                        v27 = *v20;
                      }
                    }
                    *v24 = v27;
                    *v20 = 0;
                    --v6[7];
                    v34[0] = v20;
                    v34[1] = v6 + 6;
                    v35 = 1;
                    std::unique_ptr<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>>::reset[abi:ne180100]((uint64_t)v34);
                    break;
                  }
                }
                else
                {
                  if (v16.u32[0] > 1uLL)
                  {
                    if (v22 >= *(_QWORD *)&v11)
                      v22 %= *(_QWORD *)&v11;
                  }
                  else
                  {
                    v22 &= v21;
                  }
                  if (v22 != v17)
                    break;
                }
                v20 = (_QWORD *)*v20;
              }
              while (v20);
            }
          }
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v30 = __ldaxr(p_shared_owners);
      while (__stlxr(v30 - 1, p_shared_owners));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_222D2C2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  uint64_t v19;

  if (*(char *)(v19 - 33) < 0)
    operator delete(*(void **)(v19 - 56));
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_32c43_ZTSNSt3__18weak_ptrIN3Ari12AriXpcServerEEE48c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSNSt3__18weak_ptrIN3Ari12AriXpcServerEEE48c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 48);
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void std::unique_ptr<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 16);
    operator delete(v1);
  }
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

uint64_t std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(uint64_t a1)
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

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22767D188);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78490;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78490;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::__on_zero_shared(uint64_t a1)
{
  Ari::AriXpcServerConnection::~AriXpcServerConnection((Ari::AriXpcServerConnection *)(a1 + 24));
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x22767D074](v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x22767D080](v13);
  return a1;
}

void sub_222D2C6A8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x22767D080](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x222D2C688);
}

void sub_222D2C6F0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[3];

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_222D2C830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t AriSdk::MsgBase::send()
{
  MEMORY[0x22767CED0](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24);
  return 0xFFFFFFFFLL;
}

AriSdk::MsgBase *AriSdk::MsgBase::MsgBase(AriSdk::MsgBase *this)
{
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = &unk_24EB78520;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  MEMORY[0x22767CED0](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 39);
  return this;
}

void sub_222D2C98C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

AriSdk::MsgBase *AriSdk::MsgBase::MsgBase(AriSdk::MsgBase *this, const unsigned __int8 *a2)
{
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = &unk_24EB78520;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  MEMORY[0x22767CED0](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 53);
  return this;
}

void sub_222D2CA10(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void AriSdk::MsgBase::~MsgBase(AriSdk::MsgBase *this)
{
  *(_QWORD *)this = &unk_24EB78520;
  MEMORY[0x22767CED0](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 67);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 48);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

uint64_t AriHost::Send()
{
  MEMORY[0x22767CED0](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 85);
  return 0xFFFFFFFFLL;
}

uint64_t AriOsa::IpcInit(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void **v5;
  const char *v6;
  const char *v7;
  void **v8;
  __int128 v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  void *__p[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit", a3);
  if ((SBYTE7(v18) & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Using transport device %s", v4, v5, 35, a1 + 96);
  if (SBYTE7(v18) < 0)
    operator delete(__p[0]);
  if (!strcmp("ABMRT/PCIe/ARI", (const char *)(a1 + 96)))
  {
    v22 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v10;
    v21 = v10;
    v18 = v10;
    v19 = v10;
    *(_OWORD *)__p = v10;
    TelephonyBasebandPCITransportInitParameters();
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v12 = dispatch_queue_create("ariIpcReadQueue", v11);
    v13 = *(NSObject **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v12;
    if (v13)
    {
      dispatch_release(v13);
      v12 = *(dispatch_queue_t *)(a1 + 88);
    }
    __p[1] = v12;
    LODWORD(v19) = v19 | 5;
    LODWORD(__p[0]) = 8;
    v14 = capabilities::radio::ARITransportTimeout((capabilities::radio *)v12);
    if (v14 < 0)
      __assert_rtn("IpcInit", "ari_osa_ios_libtu_ipc.cpp", 46, "0 <= capabilities::radio::ARITransportTimeout().count()");
    v15 = capabilities::radio::ARITransportTimeout((capabilities::radio *)v14);
    if (v15 >= 0x100000000)
      __assert_rtn("IpcInit", "ari_osa_ios_libtu_ipc.cpp", 47, "capabilities::radio::ARITransportTimeout().count() <= std::numeric_limits<UInt32>::max()");
    DWORD2(v18) = capabilities::radio::ARITransportTimeout((capabilities::radio *)v15);
    *(_QWORD *)((char *)&v19 + 4) = 0x100000000004;
    *(_QWORD *)&v18 = &__block_literal_global;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke_2;
    v16[3] = &__block_descriptor_tmp_13;
    v16[4] = a1;
    *(_QWORD *)&v21 = 0;
    v20 = (unint64_t)v16;
    if (TelephonyBasebandPCITransportCreate())
      return 0;
    else
      return 4294967204;
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit", v6);
    if ((SBYTE7(v18) & 0x80u) == 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) SocketTransport unavailable on this build", v7, v8, 123);
    if (SBYTE7(v18) < 0)
      operator delete(__p[0]);
    return 4294967204;
  }
}

void sub_222D2CCF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  const char *v7;
  void **v8;
  const char *v9;
  void **v10;
  const char *v11;
  void **v12;
  void *__p[2];
  char v14;

  if ((_DWORD)a2)
  {
    if ((_DWORD)a2 == 1)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
      if (v14 >= 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusError reported from PCITransport library (%p, %p)", v7, v8, 56, a3, a4);
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
      if (v14 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unrecognized status reported by PCITransport library: status=0x%08x (%p, %p)", v11, v12, 62, a2, a3, a4);
    }
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
    if (v14 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusNotReady reported from PCITransport library (%p, %p)", v9, v10, 59, a3, a4);
  }
  if (v14 < 0)
    operator delete(__p[0]);
}

void sub_222D2CE34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriOsa::IpcRead()
{
  return 4294967204;
}

uint64_t AriOsa::IpcPoll()
{
  return 4294967204;
}

uint64_t AriOsa::IpcFreeBuf(AriOsa *this, unsigned __int8 *a2)
{
  free(this);
  return 0;
}

uint64_t AriOsa::IpcClose()
{
  TelephonyUtilTransportFree();
  return 0;
}

_QWORD *std::function<BOOL ()(void *)>::~function(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t AriHostRt::RtTransaction::cancel(AriHostRt::RtTransaction *this, uint64_t a2)
{
  uint64_t v4;
  uint64_t BufCtx;
  uint64_t BufGmid;

  AriDispatch::Timer::cancel(*((AriDispatch::Timer **)this + 7));
  v4 = *((_QWORD *)this + 4);
  BufCtx = AriMsg::GetBufCtx(**((AriMsg ***)this + 2), (const unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)this + 2) + 8) - **((_QWORD **)this + 2)));
  BufGmid = AriMsg::GetBufGmid(**((AriMsg ***)this + 2), (const unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)this + 2) + 8) - **((_QWORD **)this + 2)));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v4 + 56))(v4, BufCtx, BufGmid, a2);
}

uint64_t AriHostRt::RtTransaction::getFullContextId(AriMsg ***this)
{
  return AriMsg::GetBufCtx(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

uint64_t AriHostRt::RtTransaction::getGMID(AriMsg ***this)
{
  return AriMsg::GetBufGmid(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

uint64_t AriHostRt::RtTransaction::startTimeoutCountDown(int64_t *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t v9;

  AriHostRt::GetInstance((AriHostRt *)this);
  v2 = (std::__shared_weak_count *)this[1];
  if (!v2 || (v3 = std::__shared_weak_count::lock(v2)) == 0)
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v4 = v3;
  p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
  do
    v6 = __ldxr(p_shared_weak_owners);
  while (__stxr(v6 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v8 = __ldaxr(p_shared_owners);
  while (__stlxr(v8 - 1, p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v4);
  }
  dispatch_time(0, this[6]);
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  AriDispatch::Timer::set();
  std::__shared_weak_count::__release_weak(v4);
  std::__shared_weak_count::__release_weak(v4);
  return 0;
}

void sub_222D2D098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  std::__shared_weak_count *v15;

  if (a15)
    std::__shared_weak_count::__release_weak(a15);
  std::__shared_weak_count::__release_weak(v15);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt13RtTransaction21startTimeoutCountDownEv_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  AriHostRt::RtTransaction *v6;
  uint64_t v7;
  int BufCtx;
  const char *v9;
  void **v10;
  int v11;
  void **v12;
  unint64_t v13;
  __uint64_t v14;
  const char *v15;
  void **v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  char *v20;
  int v21;
  int BufGmid;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void *v25[2];
  char v26;
  void *__p[2];
  char v28;
  void *v29[2];
  char v30;
  AriHostRt::RtTransaction *v31;
  std::__shared_weak_count *v32;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    v32 = v4;
    if (v4)
    {
      v5 = v4;
      v6 = (AriHostRt::RtTransaction *)a1[5];
      v31 = v6;
      if (v6)
      {
        v7 = a1[7];
        BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 8) - **(_QWORD **)(v3 + 16)));
        if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)(v7 + 33320), BufCtx))
        {
          v10 = v29;
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "startTimeoutCountDown_block_invoke", v9);
          if (v30 < 0)
            v10 = (void **)v29[0];
          AriHostRt::RtTransaction::asString((uint64_t *)__p, (AriHostRt::RtTransaction *)v3);
          v11 = v28;
          v12 = (void **)__p[0];
          v13 = *(_QWORD *)(v3 + 48);
          v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          v16 = __p;
          if (v11 < 0)
            v16 = v12;
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Transaction(%s) timeout after %llu msec (%llu msec actual)", v15, v10, 95, v16, v13 / 0xF4240, (v14 - *(_QWORD *)(v3 + 88)) / 0xF4240);
          if (v28 < 0)
            operator delete(__p[0]);
          if (v30 < 0)
            operator delete(v29[0]);
          AriHostRt::RtTransaction::cancel(v6, 4294967212);
          v17 = a1[7];
          v18 = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 8) - **(_QWORD **)(v3 + 16)));
          std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>((_QWORD *)(v17 + 33320), v18);
          v19 = (uint64_t *)(a1[7] + 33512);
          if (*v19)
          {
            AriHostRt::RtTransaction::asString((uint64_t *)v29, (AriHostRt::RtTransaction *)v3);
            if (v30 >= 0)
              v20 = (char *)v29;
            else
              v20 = (char *)v29[0];
            std::string::basic_string[abi:ne180100]<0>(v25, v20);
            v21 = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 8) - **(_QWORD **)(v3 + 16)));
            BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 8) - **(_QWORD **)(v3 + 16)));
            std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*v19, 1, (uint64_t)v25, v21, BufGmid);
            if (v26 < 0)
              operator delete(v25[0]);
            if (v30 < 0)
              operator delete(v29[0]);
          }
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_222D2D2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;

  if (a31 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v31 - 80);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RtTransaction::asString(AriHostRt::RtTransaction *this)
{
  uint64_t v1;
  const unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;

  v1 = *((_QWORD *)this + 2);
  v2 = *(const unsigned __int8 **)v1;
  v3 = *(_QWORD *)(v1 + 8) - *(_QWORD *)v1;
  v4 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 16))(*((_QWORD *)this + 4));
  if (*(char *)(v4 + 23) >= 0)
    v5 = (const char *)v4;
  else
    v5 = *(const char **)v4;
  return GetBufDigest(v2, v3, v5);
}

uint64_t std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  int v6;
  int v7;
  int v8;

  v8 = a2;
  v6 = a5;
  v7 = a4;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, int *, int *))(*(_QWORD *)a1 + 48))(a1, &v8, a3, &v7, &v6);
}

uint64_t AriHostRt::RtTransaction::getClientProxy@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 40);
  *a2 = *(_QWORD *)(this + 32);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

uint64_t AriHostRt::RtTransaction::updateSeq(AriMsg ***this)
{
  return AriMsg::SetBufSeq(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

unint64_t AriHostRt::RtTransaction::getTimeoutMs(AriHostRt::RtTransaction *this)
{
  return *((_QWORD *)this + 6) / 0xF4240uLL;
}

BOOL AriHostRt::RtTransaction::isLaterThan(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 80) >= a2;
}

uint64_t AriHostRt::ClientTransitionTracker::ClientTransitionTracker(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](a1 + 40, a2);
  *(_QWORD *)(a1 + 72) = 850045863;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_QWORD *)(a1 + 128) = 0;
  return a1;
}

void sub_222D2D4C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *AriHostRt::ClientTransitionTracker::create@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(a2, a1);
}

void AriHostRt::ClientTransitionTracker::~ClientTransitionTracker(AriHostRt::ClientTransitionTracker *this)
{
  AriHostRt::ClientTransitionTracker *v2;
  uint64_t v3;

  std::mutex::~mutex((std::mutex *)((char *)this + 72));
  v2 = (AriHostRt::ClientTransitionTracker *)*((_QWORD *)this + 8);
  if (v2 == (AriHostRt::ClientTransitionTracker *)((char *)this + 40))
  {
    v3 = 4;
    v2 = (AriHostRt::ClientTransitionTracker *)((char *)this + 40);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table((uint64_t)this);
}

uint64_t AriHostRt::ClientTransitionTracker::trackClient(uint64_t a1, uint64_t *a2, const char *a3)
{
  unint64_t v6;
  int v7;
  void **v8;
  uint64_t v9;
  const char *v10;
  void **v11;
  void **v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD **v16;
  _QWORD *i;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  void *v41;
  void *__p[2];
  char v43;
  void *v44[2];
  unint64_t v45;

  do
    v6 = __ldaxr(&AriHostRt::ClientTransitionTracker::tokenGenerator);
  while (__stlxr(v6 + 1, &AriHostRt::ClientTransitionTracker::tokenGenerator));
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "trackClient", a3);
  v7 = SHIBYTE(v45);
  v8 = (void **)v44[0];
  v9 = *(unsigned int *)(*a2 + 8);
  (*(void (**)(void **__return_ptr))(*(_QWORD *)*a2 + 24))(__p);
  if (v7 >= 0)
    v11 = v44;
  else
    v11 = v8;
  if (v43 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) tracking client 0x%x with token %llu for transition: %s", v10, v11, 164, v9, v6, v12);
  if (v43 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v45) < 0)
    operator delete(v44[0]);
  std::mutex::lock((std::mutex *)(a1 + 72));
  v13 = *(_QWORD *)(a1 + 8);
  if (v13)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      v15 = v6;
      if (v13 <= v6)
        v15 = v6 % v13;
    }
    else
    {
      v15 = (v13 - 1) & v6;
    }
    v16 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v15);
    if (v16)
    {
      for (i = *v16; i; i = (_QWORD *)*i)
      {
        v18 = i[1];
        if (v18 == v6)
        {
          if (i[2] == v6)
            goto LABEL_85;
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (v18 >= v13)
              v18 %= v13;
          }
          else
          {
            v18 &= v13 - 1;
          }
          if (v18 != v15)
            break;
        }
      }
    }
  }
  else
  {
    v15 = 0xAAAAAAAAAAAAAAAALL;
  }
  v45 = 0xAAAAAAAAAAAAAA01;
  v19 = operator new(0x28uLL);
  v20 = (_QWORD *)(a1 + 16);
  v44[0] = v19;
  v44[1] = (void *)(a1 + 16);
  *v19 = 0;
  v19[1] = v6;
  v19[3] = 0;
  v19[4] = 0;
  v19[2] = v6;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v13 || (float)(v22 * (float)v13) < v21)
  {
    v23 = 1;
    if (v13 >= 3)
      v23 = (v13 & (v13 - 1)) != 0;
    v24 = v23 | (2 * v13);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v13 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v13)
      goto LABEL_41;
    if (*(_QWORD *)&prime < v13)
    {
      v33 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v13 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= v13)
      {
        v13 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_41:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v27 = operator new(8 * *(_QWORD *)&prime);
          v28 = *(void **)a1;
          *(_QWORD *)a1 = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v29++) = 0;
          while (*(_QWORD *)&prime != v29);
          v30 = (_QWORD *)*v20;
          if (*v20)
          {
            v31 = v30[1];
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v31) = v20;
            v36 = (_QWORD *)*v30;
            if (*v30)
            {
              do
              {
                v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                if (v37 != v31)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v37))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v37) = v30;
                    goto LABEL_66;
                  }
                  *v30 = *v36;
                  *v36 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v37);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v37) = v36;
                  v36 = v30;
                }
                v37 = v31;
LABEL_66:
                v30 = v36;
                v36 = (_QWORD *)*v36;
                v31 = v37;
              }
              while (v36);
            }
          }
          v13 = (unint64_t)prime;
          goto LABEL_70;
        }
        v41 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v41)
          operator delete(v41);
        v13 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_70:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v13 <= v6)
        v15 = v6 % v13;
      else
        v15 = v6;
    }
    else
    {
      v15 = (v13 - 1) & v6;
    }
  }
  v38 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  i = v44[0];
  if (v38)
  {
    *(_QWORD *)v44[0] = *v38;
LABEL_83:
    *v38 = i;
    goto LABEL_84;
  }
  *(_QWORD *)v44[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v20;
  if (*i)
  {
    v39 = *(_QWORD *)(*i + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v39 >= v13)
        v39 %= v13;
    }
    else
    {
      v39 &= v13 - 1;
    }
    v38 = (_QWORD *)(*(_QWORD *)a1 + 8 * v39);
    goto LABEL_83;
  }
LABEL_84:
  v44[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v44);
LABEL_85:
  std::shared_ptr<Ari::AriClientProxy>::operator=[abi:ne180100](i + 3, *a2, a2[1]);
  std::mutex::unlock((std::mutex *)(a1 + 72));
  return (*(uint64_t (**)(uint64_t, const char *, unint64_t))(*(_QWORD *)*a2 + 48))(*a2, a3, v6);
}

void sub_222D2DA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::mutex *v26;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a21);
  std::mutex::unlock(v26);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<Ari::AriClientProxy>::operator=[abi:ne180100](_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  if (a3)
  {
    v4 = (unint64_t *)(a3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = a2;
  a1[1] = a3;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return a1;
}

void AriHostRt::ClientTransitionTracker::removeClient(int8x8_t *this, uint64_t a2, unint64_t a3)
{
  std::mutex *v6;
  const char *v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  _QWORD **v11;
  _QWORD *v12;
  unint64_t v13;
  const char *v14;
  void **v15;
  const char *v16;
  void **v17;
  const char *v18;
  const char *v19;
  void **v20;
  int8x8_t v21;
  const char *v22;
  void **v23;
  void *__p[2];
  char v25;

  v6 = (std::mutex *)&this[9];
  std::mutex::lock((std::mutex *)&this[9]);
  v8 = this[1];
  if (!*(_QWORD *)&v8)
    goto LABEL_17;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = a3;
    if (*(_QWORD *)&v8 <= a3)
      v10 = a3 % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & a3;
  }
  v11 = *(_QWORD ***)(*(_QWORD *)this + 8 * v10);
  if (!v11 || (v12 = *v11) == 0)
  {
LABEL_17:
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
    if (v25 >= 0)
      v15 = __p;
    else
      v15 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) attempted ack of stale token %llu for cid 0x%x", v14, v15, 198, a3, a2);
    goto LABEL_21;
  }
  while (1)
  {
    v13 = v12[1];
    if (v13 == a3)
      break;
    if (v9.u32[0] > 1uLL)
    {
      if (v13 >= *(_QWORD *)&v8)
        v13 %= *(_QWORD *)&v8;
    }
    else
    {
      v13 &= *(_QWORD *)&v8 - 1;
    }
    if (v13 != v10)
      goto LABEL_17;
LABEL_16:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_17;
  }
  if (v12[2] != a3)
    goto LABEL_16;
  if (*(_DWORD *)(v12[3] + 8) == (_DWORD)a2)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
    if (v25 >= 0)
      v17 = __p;
    else
      v17 = (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) no longer tracking client 0x%x with token %llu", v16, v17, 182, a2, a3);
    if (v25 < 0)
      operator delete(__p[0]);
    std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::remove((uint64_t)__p, this, v12);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)__p);
    if (!*(_QWORD *)&this[3])
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v18);
      if (v25 >= 0)
        v20 = __p;
      else
        v20 = (void **)__p[0];
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) All transitions are complete.  Executing post-transition action", v19, v20, 186);
      if (v25 < 0)
        operator delete(__p[0]);
      v21 = this[8];
      if (!*(_QWORD *)&v21)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(int8x8_t))(**(_QWORD **)&v21 + 48))(v21);
    }
    goto LABEL_23;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
  if (v25 >= 0)
    v23 = __p;
  else
    v23 = (void **)__p[0];
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) mismatched cid, expected 0x%x, received ack for cid 0x%x with token %llu", v22, v23, 193, *(unsigned int *)(v12[3] + 8), a2, a3);
LABEL_21:
  if (v25 < 0)
    operator delete(__p[0]);
LABEL_23:
  std::mutex::unlock(v6);
}

void sub_222D2DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  std::mutex *v19;

  if (a19 < 0)
    operator delete(__p);
  std::mutex::unlock(v19);
  _Unwind_Resume(a1);
}

void AriHostRt::ClientTransitionTracker::removeAllTracking(AriHostRt::ClientTransitionTracker *this, uint64_t a2)
{
  std::mutex *v4;
  const char *v5;
  _QWORD *v6;
  const char *v7;
  void **v8;
  _QWORD *v9;
  const char *v10;
  void **v11;
  uint64_t v12;
  void *__p[2];
  char v14;

  v4 = (std::mutex *)((char *)this + 72);
  std::mutex::lock((std::mutex *)((char *)this + 72));
  if (*((_QWORD *)this + 3))
  {
    v6 = (_QWORD *)*((_QWORD *)this + 2);
    if (v6)
    {
      do
      {
        while (*(_DWORD *)(v6[3] + 8) != (_DWORD)a2)
        {
          v6 = (_QWORD *)*v6;
          if (!v6)
            goto LABEL_12;
        }
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeAllTracking", v5);
        if (v14 >= 0)
          v8 = __p;
        else
          v8 = (void **)__p[0];
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Removing active transition tracking for cid 0x%x token %llu", v7, v8, 213, a2, v6[2]);
        if (v14 < 0)
          operator delete(__p[0]);
        v9 = (_QWORD *)*v6;
        std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::remove((uint64_t)__p, this, v6);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)__p);
        v6 = v9;
      }
      while (v9);
LABEL_12:
      if (!*((_QWORD *)this + 3))
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeAllTracking", v5);
        if (v14 >= 0)
          v11 = __p;
        else
          v11 = (void **)__p[0];
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) All transitions are complete.  Executing post-transition action", v10, v11, 223);
        if (v14 < 0)
          operator delete(__p[0]);
        v12 = *((_QWORD *)this + 8);
        if (!v12)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 48))(v12);
      }
    }
  }
  std::mutex::unlock(v4);
}

void sub_222D2DF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  std::mutex *v19;

  if (a19 < 0)
    operator delete(__p);
  std::mutex::unlock(v19);
  _Unwind_Resume(a1);
}

void AriHostRt::ClientTransitionTracker::logRemainingClients(AriHostRt::ClientTransitionTracker *this@<X0>, std::string *a2@<X8>)
{
  const char *v4;
  _QWORD *i;
  int v6;
  void **v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void **v12;
  void **v13;
  uint64_t v14;
  char *v15;
  size_t v16;
  void **v17;
  char *v18;
  void **v19;
  std::string::size_type v20;
  std::string::size_type v21;
  std::string::size_type v22;
  std::string::size_type size;
  std::mutex *v24;
  void *__p[2];
  char v26;
  void *v27[3];

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (*((_QWORD *)this + 3))
  {
    v24 = (std::mutex *)((char *)this + 72);
    std::mutex::lock((std::mutex *)((char *)this + 72));
    for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)*i)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "logRemainingClients", v4);
      v6 = SHIBYTE(v27[2]);
      v7 = (void **)v27[0];
      v9 = i[2];
      v8 = (unsigned int *)i[3];
      v10 = v8[2];
      (*(void (**)(void **__return_ptr))(*(_QWORD *)v8 + 24))(__p);
      if (v6 >= 0)
        v12 = v27;
      else
        v12 = v7;
      v13 = __p;
      if (v26 < 0)
        v13 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Pending transition for cid 0x%x token %llu client %s", v11, v12, 238, v10, v9, v13, v24);
      if (v26 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v27[2]) < 0)
        operator delete(v27[0]);
      v14 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)i[3] + 16))(i[3]);
      v15 = (char *)v14;
      if (*(char *)(v14 + 23) >= 0)
        v16 = *(unsigned __int8 *)(v14 + 23);
      else
        v16 = *(_QWORD *)(v14 + 8);
      memset(v27, 170, sizeof(v27));
      std::string::basic_string[abi:ne180100]((uint64_t)v27, v16 + 1);
      if (SHIBYTE(v27[2]) >= 0)
        v17 = v27;
      else
        v17 = (void **)v27[0];
      if (v16)
      {
        if (v15[23] >= 0)
          v18 = v15;
        else
          v18 = *(char **)v15;
        memmove(v17, v18, v16);
      }
      *(_WORD *)((char *)v17 + v16) = 44;
      if (SHIBYTE(v27[2]) >= 0)
        v19 = v27;
      else
        v19 = (void **)v27[0];
      if (SHIBYTE(v27[2]) >= 0)
        v20 = HIBYTE(v27[2]);
      else
        v20 = (std::string::size_type)v27[1];
      std::string::append(a2, (const std::string::value_type *)v19, v20);
      if (SHIBYTE(v27[2]) < 0)
        operator delete(v27[0]);
    }
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      size = a2->__r_.__value_.__l.__size_;
      if (size)
      {
        v22 = a2->__r_.__value_.__r.__words[0];
        v21 = a2->__r_.__value_.__r.__words[0] + size;
        goto LABEL_37;
      }
    }
    else if (*((_BYTE *)&a2->__r_.__value_.__s + 23))
    {
      v21 = (std::string::size_type)a2 + HIBYTE(a2->__r_.__value_.__r.__words[2]);
      v22 = (std::string::size_type)a2;
LABEL_37:
      std::string::erase(a2, ~v22 + v21, 1uLL);
    }
    std::mutex::unlock(v24);
  }
}

void sub_222D2E1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  std::mutex::unlock(a14);
  if (*(char *)(v26 + 23) < 0)
    operator delete(*(void **)v26);
  _Unwind_Resume(a1);
}

void AriHostRt::AriHostRt(AriHostRt *this)
{
  char *v2;
  uint64_t v3;
  dispatch_semaphore_s **v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_semaphore_s **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)this = -1;
  v2 = (char *)this + 33064;
  *((_WORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0x80000000001;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 4127) = 0;
  *((_QWORD *)this + 4128) = 0;
  *((_QWORD *)this + 4126) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_QWORD *)this + 29) = 0;
  v13[0] = &off_24EB78BF8;
  v13[1] = Ari::AriClientProxy::AriClientProxyDebugDump;
  v14 = v13;
  *((_DWORD *)this + 8266) = 1065353216;
  *(_OWORD *)((char *)this + 33032) = 0u;
  *(_OWORD *)((char *)this + 33048) = 0u;
  MEMORY[0x22767CF30]((char *)this + 33072, 1, 127);
  *((_QWORD *)v2 + 8) = 0;
  v2[72] = 0;
  v3 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v3 = (*(uint64_t (**)(void))(*v14 + 16))();
LABEL_4:
    *((_QWORD *)v2 + 13) = v3;
    goto LABEL_6;
  }
  *((_QWORD *)v2 + 13) = v2 + 80;
  (*(void (**)(_QWORD *, char *))(v13[0] + 24))(v13, v2 + 80);
LABEL_6:
  MEMORY[0x22767CED0](0, "max >= INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 138);
  if (!AriOsa::OsMutexCreate((AriOsa *)(v2 + 64), v4))
    v2[72] = 1;
  v5 = v14;
  if (v14 == v13)
  {
    v6 = 4;
    v5 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_13;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_13:
  v12 = 0;
  *(_OWORD *)((char *)this + 33176) = 0u;
  *(_OWORD *)((char *)this + 33192) = 0u;
  *((_DWORD *)v2 + 36) = 1065353216;
  MEMORY[0x22767CF30]((char *)this + 33216, 1, 0xFFFFLL);
  *((_QWORD *)v2 + 26) = 0;
  v2[216] = 0;
  v7 = (uint64_t)v12;
  if (!v12)
  {
LABEL_16:
    *((_QWORD *)v2 + 31) = v7;
    goto LABEL_18;
  }
  if (v12 != v11)
  {
    v7 = (*(uint64_t (**)(void))(*v12 + 16))();
    goto LABEL_16;
  }
  *((_QWORD *)v2 + 31) = v2 + 224;
  (*(void (**)(_QWORD *, char *))(v11[0] + 24))(v11, v2 + 224);
LABEL_18:
  MEMORY[0x22767CED0](0, "max >= INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 138);
  if (!AriOsa::OsMutexCreate((AriOsa *)(v2 + 208), v8))
    v2[216] = 1;
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
    goto LABEL_24;
  }
  if (v12)
  {
    v10 = 5;
LABEL_24:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  *(_OWORD *)((char *)this + 33320) = 0u;
  *(_OWORD *)((char *)this + 33336) = 0u;
  *((_DWORD *)v2 + 72) = 1065353216;
  *((_OWORD *)this + 2085) = 0u;
  *((_OWORD *)this + 2086) = 0u;
  *((_DWORD *)v2 + 82) = 1065353216;
  *(_OWORD *)((char *)this + 33400) = 0u;
  *(_OWORD *)((char *)this + 33416) = 0u;
  *(_OWORD *)((char *)this + 33432) = 0u;
  *(_OWORD *)((char *)this + 33448) = 0u;
  *(_OWORD *)((char *)this + 33464) = 0u;
  *((_BYTE *)this + 33480) = 0;
  *((_QWORD *)this + 4190) = 0;
  *((_QWORD *)this + 4191) = 0;
  *((_QWORD *)this + 4189) = 0;
}

void sub_222D2E518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  IDMgr *v21;
  dispatch_semaphore_s *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;

  IDMgr::~IDMgr(v21);
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table(v20);
  v24 = a13;
  if (a13 == &a10)
  {
    v25 = 4;
    v24 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v25 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v24 + 8 * v25))();
LABEL_6:
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr(v19, v23);
  v26 = *(NSObject **)(v17 + 144);
  if (v26)
    dispatch_release(v26);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v18);
  _Unwind_Resume(a1);
}

void AriHostRt::~AriHostRt(AriHostRt *this)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  dispatch_semaphore_s *v9;
  uint64_t v10;
  uint64_t i;
  AriOsa *v12;
  char *v13;
  uint64_t v14;
  dispatch_semaphore_s *v15;
  NSObject *v16;

  v2 = (char *)this + 33488;
  v3 = (char *)this + 33176;
  v4 = (char *)*((_QWORD *)this + 4189);
  if (v4 == v2)
  {
    v5 = 4;
    v4 = v2;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_6:
  v6 = (std::__shared_weak_count *)*((_QWORD *)v3 + 35);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  v7 = (std::__shared_weak_count *)*((_QWORD *)v3 + 33);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v3 + 31);
  if (v8)
    std::__shared_weak_count::__release_weak(v8);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 33400);
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table((uint64_t)this + 33360);
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table((uint64_t)this + 33320);
  if (*((_QWORD *)v3 + 3))
  {
    std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(*((_QWORD **)v3 + 2));
    *((_QWORD *)v3 + 2) = 0;
    v10 = *((_QWORD *)v3 + 1);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
        *(_QWORD *)(*(_QWORD *)v3 + 8 * i) = 0;
    }
    *((_QWORD *)v3 + 3) = 0;
  }
  v12 = (AriOsa *)*((_QWORD *)v3 + 12);
  if (v12)
    AriOsa::OsMutexFree(v12, v9);
  v13 = (char *)*((_QWORD *)v3 + 17);
  if (v13 == v3 + 112)
  {
    v14 = 4;
    v13 = v3 + 112;
  }
  else
  {
    if (!v13)
      goto LABEL_24;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
LABEL_24:
  std::__tree<IDMgr::Range>::destroy(*((_QWORD **)v3 + 10));
  std::__tree<IDMgr::Range>::destroy(*((_QWORD **)v3 + 7));
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table((uint64_t)v3);
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr((uint64_t)this + 33032, v15);
  v16 = *((_QWORD *)this + 18);
  if (v16)
    dispatch_release(v16);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
}

uint64_t AriHostRt::Init(AriHostRt *this)
{
  unsigned int v1;

  if (AriHostRt::Init(void)::pred != -1)
    dispatch_once(&AriHostRt::Init(void)::pred, &__block_literal_global_0);
  AriHostRt::GetInstance(this);
  v1 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v1 == -1)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void ___ZN9AriHostRt4InitEv_block_invoke()
{
  NSObject *v0;
  AriHostRt *v1;
  NSObject *v2;
  AriHostRt *v3;
  AriHostRt *Instance;
  AriHostRt *v5;
  AriHostRt *v6;
  AriHostRt *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  const char *v15;
  const char *v16;
  void **v17;
  void *__p[2];
  char v19;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v1 = (AriHostRt *)dispatch_queue_create("AriHostRt", v0);
  AriHostRt::GetInstance(v1);
  qword_253DEA0E8 = (uint64_t)v1;
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v3 = (AriHostRt *)dispatch_queue_create("AriHostRt", v2);
  Instance = (AriHostRt *)AriHostRt::GetInstance(v3);
  qword_253DEA0F0 = (uint64_t)v3;
  AriHostRt::GetInstance(Instance);
  v5 = (AriHostRt *)MEMORY[0x22767CED0](qword_253DEA0E8 == 0, "GetInstance().hostRtQueue == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 302);
  AriHostRt::GetInstance(v5);
  MEMORY[0x22767CED0](qword_253DEA0F0 == 0, "GetInstance().lpmQueue == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 303);
  Ari::AriXpcServer::create((Ari::AriXpcServer **)__p);
  v7 = (AriHostRt *)AriHostRt::GetInstance(v6);
  v8 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  v9 = (std::__shared_weak_count *)qword_253DEA100;
  unk_253DEA0F8 = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v13 = (unint64_t *)((char *)__p[1] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  AriHostRt::GetInstance(v7);
  atomic_store(1u, &AriHostRt::GetInstance(void)::instance);
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v15);
  if (v19 >= 0)
    v17 = __p;
  else
    v17 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT state init success", v16, v17, 313);
  if (v19 < 0)
    operator delete(__p[0]);
}

void sub_222D2E9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::Init(AriHostRt *this, const char *a2, const char *a3)
{
  int v3;
  AriHostRt *v5;
  uint64_t v6;
  const char *v7;
  void **v8;
  AriHostRt *v9;
  const char *v10;
  const char *v11;
  void **v12;
  _QWORD block[6];
  int v15;
  void *__p[2];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = -1;
  if ((_DWORD)a2)
  {
    v3 = (int)a2;
    v5 = (AriHostRt *)AriHostRt::Init(this);
    if ((_DWORD)v5)
    {
      v6 = 0xFFFFFFFFLL;
      goto LABEL_15;
    }
    AriHostRt::GetInstance(v5);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt4InitEPKcj_block_invoke;
    block[3] = &unk_24EB78630;
    v15 = v3;
    block[4] = &v18;
    block[5] = this;
    dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
    AriHostRt::SendSensitiveLoggingInfo(v9);
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init", v10);
    if (v17 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Init complete", v11, v12, 359);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init", a3);
    if (v17 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Host RT invalid msgTimeoutMultiplier param: must be > 0", v7, v8, 326);
  }
  if (v17 < 0)
    operator delete(__p[0]);
  v6 = *((unsigned int *)v19 + 6);
LABEL_15:
  _Block_object_dispose(&v18, 8);
  return v6;
}

void sub_222D2EB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  if (a23 < 0)
    operator delete(__p);
  _Block_object_dispose((const void *)(v23 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt4InitEPKcj_block_invoke(uint64_t a1)
{
  int v2;
  const char *v3;
  AriHostRt *v4;
  const char *v5;
  void **v6;
  AriHostRt *v7;
  AriHostRt *Instance;
  unsigned int v9;
  const char *v10;
  const char *v11;
  void **v12;
  const char *v13;
  void **v14;
  AriHostRt *v15;
  AriHostRt *v16;
  AriHostRt *v17;
  void *__p[2];
  char v19;

  v2 = *(_DWORD *)(a1 + 48);
  AriHostRt::GetInstance((AriHostRt *)a1);
  dword_253DEA0D8 = v2;
  v4 = (AriHostRt *)AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v3);
  AriHostRt::GetInstance(v4);
  if (v19 >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  v7 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT msgTimeoutMultiplier: (%d)", v5, v6, 335, dword_253DEA0D8);
  if (v19 < 0)
    operator delete(__p[0]);
  Instance = (AriHostRt *)AriHostRt::GetInstance(v7);
  v9 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v9 == 2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    AriHostRt::GetInstance(Instance);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AriFramer::init((uint64_t)qword_253DEA108, *(const char **)(a1 + 40), (uint64_t)AriHostRt::InboundMsgCB, 0, 0);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v10);
      if (v19 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ** FAILED TO INIT ARI FRAMER / TRANSPORT **", v11, v12, 352);
      if (v19 < 0)
        operator delete(__p[0]);
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v10);
      if (v19 >= 0)
        v14 = __p;
      else
        v14 = (void **)__p[0];
      v15 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT framer success", v13, v14, 346);
      if (v19 < 0)
        operator delete(__p[0]);
      v16 = (AriHostRt *)AriHostRt::GetInstance(v15);
      atomic_store(2u, &AriHostRt::GetInstance(void)::instance);
      v17 = (AriHostRt *)AriHostRt::GetInstance(v16);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AriHostRt::sendBootStateRequest_nl(v17);
    }
  }
}

void sub_222D2ED6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::sendBootStateRequest_nl(AriHostRt *this)
{
  __int128 v1;
  uint64_t EncodedBuf;
  const char *v3;
  AriMsg *v4;
  const char *v5;
  void **v6;
  AriHostRt *v7;
  unsigned __int8 *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void **v12;
  void *__p[2];
  char v15;
  unsigned int v16;
  _OWORD v17[4];
  unint64_t v18;

  v18 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[2] = v1;
  v17[3] = v1;
  v17[0] = v1;
  v17[1] = v1;
  MEMORY[0x22767CF84](v17, 75923456);
  v16 = 0;
  EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v17, &v16);
  v4 = (AriMsg *)EncodedBuf;
  if (EncodedBuf)
  {
    *(_DWORD *)(EncodedBuf + 8) = *(_DWORD *)(EncodedBuf + 8) & 0x1FFFF | 0xFE020000;
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendBootStateRequest_nl", v3);
    if (v15 >= 0)
      v6 = __p;
    else
      v6 = (void **)__p[0];
    v7 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) sending RT boot state request...", v5, v6, 457);
    if (v15 < 0)
      operator delete(__p[0]);
    v10 = AriHostRt::sendRawInternal_nl(v7, v4, (unsigned __int8 *)v16);
    if ((_DWORD)v10)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendBootStateRequest_nl", v9);
      if (v15 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Could not send boot state request", v11, v12, 460);
      if (v15 < 0)
        operator delete(__p[0]);
    }
    AriMsg::ReleaseEncodedMessage(v4, v8);
  }
  else
  {
    v10 = 0xFFFFFFFFLL;
  }
  AriMsg::~AriMsg((AriMsg *)v17);
  return v10;
}

void sub_222D2EEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (a16 < 0)
    operator delete(__p);
  AriMsg::~AriMsg((AriMsg *)&a18);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::SendSensitiveLoggingInfo(AriHostRt *this)
{
  AriHostRt *v1;
  AriHostRt *Instance;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v1 = (AriHostRt *)capabilities::radio::vendor(this);
  if ((_DWORD)v1 != 3)
    return 0;
  Instance = (AriHostRt *)AriHostRt::GetInstance(v1);
  v3 = 0xFFFFFFFFLL;
  if (!AriHostRt::Init(Instance))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2000000000;
    v9 = -1;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___ZN9AriHostRt24SendSensitiveLoggingInfoEv_block_invoke;
    v5[3] = &unk_24EB78AD8;
    v5[4] = &v6;
    v5[5] = &AriHostRt::GetInstance(void)::instance;
    dispatch_sync((dispatch_queue_t)qword_253DEA0E8, v5);
    v3 = *((unsigned int *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

uint64_t AriHostRt::Init(AriHostRt *a1, const void *a2, NSObject *a3, const char *a4)
{
  BOOL v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  AriHostRt::GetInstance(a1);
  if (a2)
    v8 = a3 == 0;
  else
    v8 = 1;
  v9 = v8;
  MEMORY[0x22767CED0](v9, "startedCallback == nullptr || startedCallbackQueue == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 367);
  if (qword_253DF23C0)
    _Block_release((const void *)qword_253DF23C0);
  if (qword_253DF23C8)
    dispatch_release((dispatch_object_t)qword_253DF23C8);
  v10 = _Block_copy(a2);
  dispatch_retain(a3);
  *(_QWORD *)(&byte_253DEA0D5 + 33515) = v10;
  *(_QWORD *)(&byte_253DEA0D5 + 33523) = a3;
  byte_253DEA0D5 = 0;
  return AriHostRt::Init(a1, a4, v11);
}

uint64_t AriHostRt::Shutdown(AriHostRt *this)
{
  const char *v1;
  const char *v2;
  void *p_p;
  void *__p;
  char v6;
  _QWORD block[5];

  AriHostRt::GetInstance(this);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt8ShutdownEv_block_invoke;
  block[3] = &__block_descriptor_tmp_24;
  block[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Shutdown", v1);
  if (v6 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Done", v2, p_p, 402);
  if (v6 < 0)
    operator delete(__p);
  return 0;
}

void sub_222D2F140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double ___ZN9AriHostRt8ShutdownEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  double result;

  TelephonyUtilTransportFree();
  atomic_store(4u, *(unsigned int **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 4) = 0;
  *(_DWORD *)(v2 + 12) = 2048;
  v3 = *(const void **)(v2 + 33520);
  if (v3)
  {
    _Block_release(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(NSObject **)(v2 + 33528);
  if (v4)
  {
    dispatch_release(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = 0.0;
  *(_OWORD *)(v2 + 33520) = 0u;
  return result;
}

uint64_t AriHostRt::ProcessClientNotifyAck(AriHostRt *a1, int a2, uint64_t a3)
{
  const char *v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v10;
  const char *v11;
  void *p_p;
  void *__p;
  char v14;
  _QWORD v15[6];
  int v16;
  _QWORD v17[6];
  int v18;
  _QWORD block[6];
  int v20;

  AriHostRt::GetInstance(a1);
  switch(a2)
  {
    case 2:
    case 8:
      v7 = qword_253DEA0E8;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke;
      block[3] = &__block_descriptor_tmp_26;
      v20 = (int)a1;
      block[4] = &AriHostRt::GetInstance(void)::instance;
      block[5] = a3;
      v8 = block;
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
      v7 = qword_253DEA0E8;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 0x40000000;
      v17[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_2;
      v17[3] = &__block_descriptor_tmp_27;
      v18 = (int)a1;
      v17[4] = &AriHostRt::GetInstance(void)::instance;
      v17[5] = a3;
      v8 = v17;
LABEL_4:
      dispatch_async(v7, v8);
      break;
    case 7:
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 0x40000000;
      v15[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_3;
      v15[3] = &__block_descriptor_tmp_28;
      v16 = (int)a1;
      v15[4] = &AriHostRt::GetInstance(void)::instance;
      v15[5] = a3;
      dispatch_sync((dispatch_queue_t)qword_253DEA0E8, v15);
      break;
    default:
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "ProcessClientNotifyAck", v6);
      v10 = asString();
      if (v14 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) received notify ack from cid 0x%x for event %s", v11, p_p, 442, a1, v10);
      if (v14 < 0)
        operator delete(__p);
      break;
  }
  return 0;
}

void sub_222D2F378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int8x8_t **v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (int8x8_t **)(v2 + 33416);
  v4 = *(std::__shared_weak_count **)(v2 + 33424);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = v5;
      if (*v3)
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_222D2F43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int8x8_t **v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (int8x8_t **)(v2 + 33432);
  v4 = *(std::__shared_weak_count **)(v2 + 33440);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = v5;
      if (*v3)
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_222D2F4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  int8x8_t **v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (int8x8_t **)(v2 + 33448);
  v4 = *(std::__shared_weak_count **)(v2 + 33456);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = v5;
      if (*v3)
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_222D2F5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::setMsgAttrib_nl(unsigned int *a1, _DWORD *a2)
{
  unsigned int v4;
  __int128 v5;
  uint64_t v6;
  uint64_t EncodedBuf;
  const char *v8;
  AriMsg *v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  AriHostRt *v17;
  unsigned __int8 *v18;
  const char *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  const char *v26;
  void *__p[2];
  char v29;
  unsigned int v30;
  _OWORD v31[4];
  unint64_t v32;

  MEMORY[0x22767CED0](a2 == 0, "param == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 468);
  v4 = atomic_load(a1);
  if (v4 != 2)
    return 0xFFFFFFFFLL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[2] = v5;
  v31[3] = v5;
  v31[0] = v5;
  v31[1] = v5;
  MEMORY[0x22767CF84](v31, 67665920);
  v6 = AriMsg::pack((AriMsg *)v31, 1, a2);
  if (!(_DWORD)v6)
  {
    v30 = 0;
    EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v31, &v30);
    v9 = (AriMsg *)EncodedBuf;
    if (EncodedBuf)
    {
      *(_DWORD *)(EncodedBuf + 8) = *(_DWORD *)(EncodedBuf + 8) & 0x1FFFF | 0xFE020000;
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setMsgAttrib_nl", v8);
      if (v29 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      v11 = asString();
      v12 = asString();
      v14 = a2[2];
      v13 = a2[3];
      v15 = asString();
      v17 = (AriHostRt *)Ari::Log((Ari *)4, (uint64_t)"(%s:%d) sending RT AriMsgAttribReq %s %s on msg(%d-0x%03x) val(0x%x-%s)...", v16, v10, 488, v11, v12, v14 >> 26, (v14 >> 15) & 0x3FF, v13, v15);
      if (v29 < 0)
        operator delete(__p[0]);
      v6 = AriHostRt::sendRawInternal_nl(v17, v9, (unsigned __int8 *)v30);
      if ((_DWORD)v6)
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setMsgAttrib_nl", v19);
        if (v29 >= 0)
          v20 = __p;
        else
          v20 = (void **)__p[0];
        v21 = asString();
        v22 = asString();
        v24 = a2[2];
        v23 = a2[3];
        v25 = asString();
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Could not send AriMsgAttribReq %s %s on msg(%d-0x%03x) val(0x%x-%s)...", v26, v20, 494, v21, v22, v24 >> 26, (v24 >> 15) & 0x3FF, v23, v25);
        if (v29 < 0)
          operator delete(__p[0]);
      }
      AriMsg::ReleaseEncodedMessage(v9, v18);
    }
    else
    {
      v6 = 0xFFFFFFFFLL;
    }
  }
  AriMsg::~AriMsg((AriMsg *)v31);
  return v6;
}

void sub_222D2F7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24)
{
  AriMsg::~AriMsg((AriMsg *)&a24);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RegisterClient(AriHostRt *this, char *a2, unsigned int *a3, dispatch_queue_s *a4)
{
  BOOL v7;
  uint64_t v8;
  AriHostRt *v9;
  AriHostRt *v10;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  if (a2)
    v7 = a3 == 0;
  else
    v7 = 1;
  v8 = v7;
  v9 = (AriHostRt *)MEMORY[0x22767CED0](v8, "(cid == NULL) || (dq == NULL)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 502);
  v10 = (AriHostRt *)AriHostRt::Init(v9);
  if ((_DWORD)v10)
    return 0xFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  AriHostRt::GetInstance(v10);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt14RegisterClientEPKcPjP16dispatch_queue_s_block_invoke;
  block[3] = &unk_24EB786D8;
  block[5] = this;
  block[6] = a3;
  block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  *(_DWORD *)a2 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return 0;
}

void sub_222D2F910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt14RegisterClientEPKcPjP16dispatch_queue_s_block_invoke(_QWORD *a1)
{
  char *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  AriHostRt *v15;
  int v16;
  AriHostRt *v17;
  unint64_t v18;
  uint64_t v19[2];

  v2 = (char *)a1[5];
  v3 = a1[6];
  v4 = (std::__shared_weak_count *)operator new(0x80uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CA8;
  v6 = &v4[1].__vftable;
  Ari::AriClientGcdProxy::AriClientGcdProxy((Ari::AriClientGcdProxy *)&v4[1], v2, v3);
  v7 = (std::__shared_weak_count *)v4[3].__vftable;
  if (v7)
  {
    if (v7->__shared_owners_ != -1)
      goto LABEL_14;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v10 = __ldxr(p_shared_weak_owners);
    while (__stxr(v10 + 1, p_shared_weak_owners));
    v4[2].__shared_weak_owners_ = (uint64_t)v6;
    v4[3].__vftable = (std::__shared_weak_count_vtbl *)v4;
    std::__shared_weak_count::__release_weak(v7);
  }
  else
  {
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v12 = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    v4[2].__shared_weak_owners_ = (uint64_t)v6;
    v4[3].__vftable = (std::__shared_weak_count_vtbl *)v4;
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
LABEL_14:
  v19[0] = (uint64_t)&v4[1];
  v19[1] = (uint64_t)v4;
  AriHostRt::GetInstance((AriHostRt *)v7);
  v15 = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(v19);
  v16 = (int)v15;
  AriHostRt::GetInstance(v15);
  v17 = (AriHostRt *)MEMORY[0x22767CED0](v16 == 0x7FFFFFFF, "allocated_id == GetInstance().clientMgr.INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 510);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v16;
  LODWORD(v4[1].__shared_owners_) = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  AriHostRt::GetInstance(v17);
  if (byte_253DEA0D4)
    (*(void (**)(_QWORD *, uint64_t, _QWORD))(*v6 + 48))(v6, 1, 0);
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_222D2FAF0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(uint64_t *a1)
{
  _BOOL8 v2;
  uint64_t v3;
  const char *v4;
  int v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t *v10;
  dispatch_semaphore_s *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  const char *v17;
  void *p_p;
  const char *v19;
  uint64_t i;
  int v21;
  const char *v22;
  void *v23;
  _BOOL8 v24;
  void *__p;
  uint64_t v27;
  std::__shared_weak_count *v28;
  int v29;
  int v30;

  MEMORY[0x22767CED0](byte_253DF2240 == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 204);
  v2 = AriOsa::OsMutexTake((AriOsa *)qword_253DF2238, (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v2, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 205);
  v29 = -1431655766;
  v3 = IDMgr::allocate((IDMgr *)&unk_253DF2200, &v29);
  if ((v3 & 1) != 0)
  {
    v5 = AriOsa::OsTimeStamp((AriOsa *)v3);
    LODWORD(__p) = v5;
    v6 = *a1;
    v7 = (std::__shared_weak_count *)a1[1];
    v27 = *a1;
    v28 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)&unk_253DF21D8, v29, &v29);
    *((_DWORD *)v10 + 6) = v5;
    v27 = 0;
    v28 = 0;
    v12 = (std::__shared_weak_count *)v10[5];
    v10[4] = v6;
    v10[5] = (uint64_t)v7;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (v28)
    {
      v15 = &v28->__shared_owners_;
      do
        v16 = __ldaxr((unint64_t *)v15);
      while (__stlxr(v16 - 1, (unint64_t *)v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
  else
  {
    v29 = 0x7FFFFFFF;
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "alloc", v4);
    if (SHIBYTE(v28) >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v17, p_p, 210, &unk_253DF21D8, qword_253DF21F0);
    if (SHIBYTE(v28) < 0)
      operator delete(__p);
    for (i = qword_253DF21E8; i; i = *(_QWORD *)i)
    {
      if (qword_253DF2260)
      {
        v21 = *(_DWORD *)(i + 24);
        LODWORD(__p) = *(_DWORD *)(i + 16);
        v30 = v21;
        (*(void (**)(uint64_t, void **, int *, uint64_t))(*(_QWORD *)qword_253DF2260 + 48))(qword_253DF2260, &__p, &v30, i + 32);
      }
      else
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "alloc", v19);
        if (SHIBYTE(v28) >= 0)
          v23 = &__p;
        else
          v23 = __p;
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%d", v22, v23, 220, *(unsigned int *)(i + 16), *(unsigned int *)(i + 16), *(unsigned int *)(i + 24));
        if (SHIBYTE(v28) < 0)
          operator delete(__p);
      }
    }
  }
  v24 = AriOsa::OsMutexGive((AriOsa *)qword_253DF2238, v11) == -1;
  MEMORY[0x22767CED0](v24, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 227);
  return v29;
}

void sub_222D2FDE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 40);
}

_QWORD *AriHostRt::RegisterEntitlementChecker(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *result;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)a1[3];
  if (!v1)
  {
    v6 = 0;
    v3 = (_QWORD *)qword_253DF23F0;
    if ((uint64_t *)qword_253DF23F0 != &checkerFunction)
    {
      result = 0;
LABEL_9:
      v6 = v3;
      qword_253DF23F0 = (uint64_t)result;
      goto LABEL_14;
    }
LABEL_10:
    v3 = v5;
    (*(void (**)(void))(checkerFunction + 24))();
    (*(void (**)(uint64_t))(*(_QWORD *)qword_253DF23F0 + 32))(qword_253DF23F0);
    qword_253DF23F0 = (uint64_t)v6;
    v6 = v5;
    v4 = 4;
    return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v3 + 8 * v4))(v3);
  }
  if (v1 == a1)
  {
    v6 = v5;
    (*(void (**)(_QWORD *, _QWORD *))(*a1 + 24))(a1, v5);
    result = v6;
  }
  else
  {
    result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*v1 + 16))(a1[3]);
    v6 = result;
  }
  v3 = (_QWORD *)qword_253DF23F0;
  if (result != v5)
  {
    if ((uint64_t *)qword_253DF23F0 != &checkerFunction)
      goto LABEL_9;
    goto LABEL_10;
  }
  if ((uint64_t *)qword_253DF23F0 == &checkerFunction)
  {
    memset(v7, 170, 24);
    (*(void (**)(_QWORD *, _QWORD *))(v5[0] + 24))(v5, v7);
    (*(void (**)(_QWORD *))(*v6 + 32))(v6);
    v6 = 0;
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)qword_253DF23F0 + 24))(qword_253DF23F0, v5);
    (*(void (**)(uint64_t))(*(_QWORD *)qword_253DF23F0 + 32))(qword_253DF23F0);
    qword_253DF23F0 = 0;
    v6 = v5;
    (*(void (**)(_QWORD *, uint64_t *))(v7[0] + 24))(v7, &checkerFunction);
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v7[0] + 32))(v7);
    qword_253DF23F0 = (uint64_t)&checkerFunction;
    v3 = v6;
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t *))(v5[0] + 24))(v5, &checkerFunction);
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v6 + 32))(v6);
    v3 = (_QWORD *)qword_253DF23F0;
    v6 = (_QWORD *)qword_253DF23F0;
    qword_253DF23F0 = (uint64_t)&checkerFunction;
  }
LABEL_14:
  if (v3 == v5)
  {
    v4 = 4;
    v3 = v5;
  }
  else
  {
    if (!v3)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v3 + 8 * v4))(v3);
}

void sub_222D30078(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t AriHostRt::HasEntitlement(AriHostRt *this, void *a2)
{
  AriHostRt *v3;

  if (!qword_253DF23F0)
    return 1;
  v3 = this;
  return (*(uint64_t (**)(uint64_t, AriHostRt **))(*(_QWORD *)qword_253DF23F0 + 48))(qword_253DF23F0, &v3);
}

void AriHostRt::checkShouldDeregIndication_nl(unsigned int *a1, int **a2)
{
  int *v2;
  int *v3;
  uint64_t v4;
  IDMgr *v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  _BOOL8 v9;
  int isAlloc;
  AriOsa *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_semaphore_s *v18;
  _BOOL8 v19;
  int v20;
  _BOOL8 v21;
  int v22;
  uint64_t *v23;
  int8x8_t v24;
  unint64_t v25;
  uint8x8_t v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  dispatch_semaphore_s *v33;
  _BOOL8 v34;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39[3];
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = (uint64_t)(a1 + 8294);
    v5 = (IDMgr *)(a1 + 8304);
    v6 = (uint64_t)(a1 + 8298);
    do
    {
      memset(v39, 170, sizeof(v39));
      v7 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](v4, *v2);
      std::list<std::shared_ptr<Ari::AriClientProxy>>::list(v39, v7);
      if (v39[2])
      {
        LODWORD(v36) = *v2;
        v8 = v36;
        MEMORY[0x22767CED0](*(_BYTE *)(v4 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 192);
        v9 = AriOsa::OsMutexTake(*(AriOsa **)(v4 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
        MEMORY[0x22767CED0](v9, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 193);
        isAlloc = IDMgr::isAlloc(v5);
        v11 = (AriOsa *)ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(v4, isAlloc ^ 1u);
        LODWORD(v40) = AriOsa::OsTimeStamp(v11);
        std::list<std::shared_ptr<Ari::AriClientProxy>>::list(&v41, v39);
        v12 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, v8, &v36);
        *((_DWORD *)v12 + 6) = (_DWORD)v40;
        std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v12 + 4);
        v13 = v43;
        if (v43)
        {
          v15 = v41;
          v14 = v42;
          v16 = *v42;
          *(_QWORD *)(v16 + 8) = *(_QWORD *)(v41 + 8);
          **(_QWORD **)(v15 + 8) = v16;
          v17 = v12[4];
          *(_QWORD *)(v17 + 8) = v14;
          *v14 = v17;
          v12[4] = v15;
          *(_QWORD *)(v15 + 8) = v12 + 4;
          v12[6] += v13;
          v43 = 0;
        }
        std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(&v41);
        v19 = AriOsa::OsMutexGive(*(AriOsa **)(v4 + 96), v18) == -1;
        MEMORY[0x22767CED0](v19, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 198);
      }
      else
      {
        v36 = 0x200000001;
        v37 = (*v2 & 0x3FF | (HIBYTE(*(_WORD *)v2) >> 2 << 11)) << 15;
        v38 = 0;
        AriHostRt::setMsgAttrib_nl(a1, &v36);
        v20 = *v2;
        MEMORY[0x22767CED0](*(_BYTE *)(v4 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 235);
        v21 = AriOsa::OsMutexTake(*(AriOsa **)(v4 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
        MEMORY[0x22767CED0](v21, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 236);
        v22 = IDMgr::free(v5);
        ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(v4, v22 ^ 1);
        v23 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((_QWORD *)v4, v20);
        v24 = *(int8x8_t *)(v4 + 8);
        v25 = v23[1];
        v26 = (uint8x8_t)vcnt_s8(v24);
        v26.i16[0] = vaddlv_u8(v26);
        if (v26.u32[0] > 1uLL)
        {
          if (v25 >= *(_QWORD *)&v24)
            v25 %= *(_QWORD *)&v24;
        }
        else
        {
          v25 &= *(_QWORD *)&v24 - 1;
        }
        v27 = *(uint64_t **)(*(_QWORD *)v4 + 8 * v25);
        do
        {
          v28 = v27;
          v27 = (uint64_t *)*v27;
        }
        while (v27 != v23);
        if (v28 == (uint64_t *)v6)
          goto LABEL_24;
        v29 = v28[1];
        if (v26.u32[0] > 1uLL)
        {
          if (v29 >= *(_QWORD *)&v24)
            v29 %= *(_QWORD *)&v24;
        }
        else
        {
          v29 &= *(_QWORD *)&v24 - 1;
        }
        if (v29 != v25)
        {
LABEL_24:
          if (!*v23)
            goto LABEL_25;
          v30 = *(_QWORD *)(*v23 + 8);
          if (v26.u32[0] > 1uLL)
          {
            if (v30 >= *(_QWORD *)&v24)
              v30 %= *(_QWORD *)&v24;
          }
          else
          {
            v30 &= *(_QWORD *)&v24 - 1;
          }
          if (v30 != v25)
LABEL_25:
            *(_QWORD *)(*(_QWORD *)v4 + 8 * v25) = 0;
        }
        v31 = *v23;
        if (*v23)
        {
          v32 = *(_QWORD *)(v31 + 8);
          if (v26.u32[0] > 1uLL)
          {
            if (v32 >= *(_QWORD *)&v24)
              v32 %= *(_QWORD *)&v24;
          }
          else
          {
            v32 &= *(_QWORD *)&v24 - 1;
          }
          if (v32 != v25)
          {
            *(_QWORD *)(*(_QWORD *)v4 + 8 * v32) = v28;
            v31 = *v23;
          }
        }
        *v28 = v31;
        *v23 = 0;
        --*(_QWORD *)(v4 + 24);
        v40 = v23;
        v41 = v6;
        LOBYTE(v42) = 1;
        std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v40);
        v34 = AriOsa::OsMutexGive(*(AriOsa **)(v4 + 96), v33) == -1;
        MEMORY[0x22767CED0](v34, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 241);
      }
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v39);
      ++v2;
    }
    while (v2 != v3);
  }
}

void sub_222D304A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t *v4;
  va_list va;

  va_start(va, a4);
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v4);
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::SetMsgTimeoutMultiplier(AriHostRt *this)
{
  int v1;
  AriHostRt *Instance;
  const char *v3;
  const char *v4;
  void **v5;
  _QWORD block[5];
  int v8;
  void **v9;
  char v10;

  v1 = (int)this;
  Instance = (AriHostRt *)AriHostRt::GetInstance(this);
  if (v1)
  {
    AriHostRt::GetInstance(Instance);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt23SetMsgTimeoutMultiplierEj_block_invoke;
    block[3] = &__block_descriptor_tmp_44;
    block[4] = &AriHostRt::GetInstance(void)::instance;
    v8 = v1;
    dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetMsgTimeoutMultiplier", v3);
    if (v10 >= 0)
      v5 = (void **)&v9;
    else
      v5 = v9;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Invalid msgTimeoutMultiplier param: must be > 0", v4, v5, 627);
    if (v10 < 0)
      operator delete(v9);
  }
  return 0xFFFFFFFFLL;
}

void sub_222D3059C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 17) < 0)
    operator delete(*(void **)(v1 - 40));
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt23SetMsgTimeoutMultiplierEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void *p_p;
  void *__p;
  char v7;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetMsgTimeoutMultiplier_block_invoke", a3);
  if (v7 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) AriHostRt msgTimeoutMultiplier: prev(%d) new(%d)", v4, p_p, 632, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
  if (v7 < 0)
    operator delete(__p);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 40);
}

void sub_222D3064C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::RegisterSniffer(AriHostRt *this, dispatch_queue_s *a2, int (*a3)(unsigned __int8 *, unint64_t))
{
  char v3;
  AriHostRt *v6;
  uint64_t v7;
  _QWORD v9[7];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v3 = (char)a3;
  v6 = (AriHostRt *)MEMORY[0x22767CED0](this == 0, "dq == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 641);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = -1;
  AriHostRt::GetInstance(v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___ZN9AriHostRt15RegisterSnifferEP16dispatch_queue_sPFiPhmEb_block_invoke;
  v9[3] = &unk_24EB78780;
  v9[5] = this;
  v9[6] = a2;
  v10 = v3;
  v9[4] = &v11;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, v9);
  v7 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void sub_222D3073C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt15RegisterSnifferEP16dispatch_queue_sPFiPhmEb_block_invoke(uint64_t a1)
{
  AriHostRt *Instance;
  const char *v3;
  unsigned int v4;
  uint64_t v5;
  AriHostRt *v6;
  uint64_t v7;
  AriHostRt *v8;
  uint64_t v9;
  const char *v10;
  void *p_p;
  void *__p;
  char v13;

  Instance = (AriHostRt *)AriHostRt::GetInstance((AriHostRt *)a1);
  v4 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v4 == 2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (AriHostRt *)AriHostRt::GetInstance(Instance);
    qword_253DF2390 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (AriHostRt *)AriHostRt::GetInstance(v6);
    qword_253DF2388 = v7;
    LOBYTE(v7) = *(_BYTE *)(a1 + 56);
    AriHostRt::GetInstance(v8);
    byte_253DF2398 = v7;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegisterSniffer_block_invoke", v3);
    v9 = asString();
    if (v13 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for RegisterSniffer", v10, p_p, 648, v9);
    if (v13 < 0)
      operator delete(__p);
  }
}

void sub_222D30834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt18sendRawInternal_nlEPhj_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  free(*(void **)(a1 + 40));
}

uint64_t AriHostRt::RegIndication(AriHostRt *this, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  void **v7;
  AriHostRt *v8;
  _QWORD block[6];
  int v11;
  int v12;
  void **v13;
  void **v14;
  uint64_t v15;
  int v16;

  if (AriHostRt::Init(this))
    return 0xFFFFFFFFLL;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegIndication", v4);
  if (v15 >= 0)
    v7 = (void **)&v13;
  else
    v7 = v13;
  v8 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Registering indication gmid 0x%x triggered by cid 0x%x", v6, v7, 778, this, a2);
  if (SHIBYTE(v15) < 0)
    operator delete(v13);
  AriHostRt::GetInstance(v8);
  v13 = 0;
  v14 = (void **)&v13;
  v15 = 0x2000000000;
  v16 = -1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt13RegIndicationEjj_block_invoke;
  block[3] = &unk_24EB787F0;
  block[4] = &v13;
  block[5] = &AriHostRt::GetInstance(void)::instance;
  v11 = (int)this;
  v12 = a2;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v5 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v5;
}

void sub_222D30994(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 41) < 0)
    operator delete(*(void **)(v1 - 64));
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt13RegIndicationEjj_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;

  result = AriHostRt::regIndication_nl(*(AriHostRt **)(a1 + 40), *(_DWORD *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 4) && (v4 = atomic_load((unsigned int *)v3), v4 == 2))
  {
    v5 = (*(_DWORD *)(a1 + 48) & 0x3FF | ((unsigned __int16)*(_DWORD *)(a1 + 48) >> 10 << 11)) << 15;
    v6 = 0x200000001;
    v7 = v5;
    v8 = 0x7FFFFFFF;
    result = AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 40), &v6);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t AriHostRt::regIndication_nl(AriHostRt *this, int a2, uint64_t a3)
{
  char *v6;
  char *v7;
  const char *v8;
  uint64_t *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  const char *v14;
  uint64_t *v15;
  const char *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t *v33;
  unint64_t v34;
  _BOOL8 v35;
  int v36;
  AriOsa *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  dispatch_semaphore_s *v44;
  _BOOL8 v45;
  const char *v46;
  void *p_p;
  uint64_t v48;
  const char *v49;
  void *v50;
  uint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  void *v60[2];
  char v61;
  void *__p;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;

  v6 = (char *)this + 33272;
  v7 = (char *)this + 33032;
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)this + 33032) & 1) == 0)
  {
    v23 = (unsigned __int16)a2 >> 10;
    v24 = a2 & 0x3FF;
    if ((_DWORD)a3 == -1)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v8);
      if (SHIBYTE(v64) >= 0)
        p_p = &__p;
      else
        p_p = __p;
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) RegIndication: ARI_INVALID_CID for indication(%d-0x%x)", v46, p_p, 916, v23, v24);
      if (SHIBYTE(v64) < 0)
        operator delete(__p);
      std::string::basic_string[abi:ne180100]<0>(v60, "invalid cid with indication reg");
      std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*((_QWORD *)v6 + 30), 3, (uint64_t)v60, 0, 0);
      if ((v61 & 0x80000000) == 0)
        return 0;
      v27 = v60[0];
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v8);
      if (SHIBYTE(v64) >= 0)
        v26 = &__p;
      else
        v26 = __p;
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) RegIndication: No registered cid 0x%04X for indication(%d-0x%x)", v25, v26, 921, a3, v23, v24);
      if ((SHIBYTE(v64) & 0x80000000) == 0)
        return 0;
      v27 = __p;
    }
    operator delete(v27);
    return 0;
  }
  v9 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)v7, a3);
  v11 = *v9;
  v10 = (std::__shared_weak_count *)v9[1];
  v58 = *v9;
  v59 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)this + 33176))
  {
    v15 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)this + 33176, a2);
    v17 = v15;
    v18 = v15;
    while (1)
    {
      v18 = (uint64_t *)v18[1];
      if (v18 == v15)
        break;
      if (*(_DWORD *)(v18[2] + 8) == (_DWORD)a3)
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v16);
        v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
        v21 = &__p;
        if (SHIBYTE(v64) < 0)
          v21 = __p;
        if (*(char *)(v19 + 23) >= 0)
          v22 = v19;
        else
          v22 = *(_QWORD *)v19;
        Ari::Log((Ari *)4, (uint64_t)"(%s:%d) RegIndication: Duplicated handler from client(%s) for indication(%d-0x%x), no-op", v20, v21, 938, v22, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
        if (SHIBYTE(v64) < 0)
          operator delete(__p);
        goto LABEL_51;
      }
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v16);
    v48 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    v50 = &__p;
    if (SHIBYTE(v64) < 0)
      v50 = __p;
    if (*(char *)(v48 + 23) >= 0)
      v51 = v48;
    else
      v51 = *(_QWORD *)v48;
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) RegIndication: Add client(%s:0x%x) as listening for indication(%d-0x%x)", v49, v50, 943, v51, a3, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
    if (SHIBYTE(v64) < 0)
      operator delete(__p);
    std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(v17, v11, (uint64_t)v10);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v14);
    v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    v30 = &__p;
    if (SHIBYTE(v64) < 0)
      v30 = __p;
    if (*(char *)(v28 + 23) >= 0)
      v31 = v28;
    else
      v31 = *(_QWORD *)v28;
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) RegIndication: client(%s:0x%x) first to register indication(%d-0x%x)", v29, v30, 950, v31, a3, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
    if (SHIBYTE(v64) < 0)
      operator delete(__p);
    v55 = (uint64_t *)&v55;
    v56 = (uint64_t *)&v55;
    v57 = 0;
    v32 = (uint64_t *)operator new(0x20uLL);
    v32[2] = v11;
    v32[3] = (uint64_t)v10;
    if (v10)
    {
      v33 = (unint64_t *)&v10->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    *v32 = (uint64_t)&v55;
    v32[1] = (uint64_t)&v55;
    v55 = v32;
    v56 = v32;
    v57 = 1;
    v66 = a2;
    MEMORY[0x22767CED0](v6[8] == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 180);
    v35 = AriOsa::OsMutexTake(*(AriOsa **)v6, (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
    MEMORY[0x22767CED0](v35, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 181);
    v36 = IDMgr::allocate((AriHostRt *)((char *)this + 33216));
    v37 = (AriOsa *)ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap((uint64_t)this + 33176, v36 ^ 1u);
    LODWORD(__p) = AriOsa::OsTimeStamp(v37);
    std::list<std::shared_ptr<Ari::AriClientProxy>>::list(&v63, &v55);
    v38 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 33176, a2, &v66);
    *((_DWORD *)v38 + 6) = (_DWORD)__p;
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v38 + 4);
    v39 = v65;
    if (v65)
    {
      v41 = v63;
      v40 = v64;
      v42 = *v64;
      *(_QWORD *)(v42 + 8) = *(_QWORD *)(v63 + 8);
      **(_QWORD **)(v41 + 8) = v42;
      v43 = v38[4];
      *(_QWORD *)(v43 + 8) = v40;
      *v40 = v43;
      v38[4] = v41;
      *(_QWORD *)(v41 + 8) = v38 + 4;
      v38[6] += v39;
      v65 = 0;
    }
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(&v63);
    v45 = AriOsa::OsMutexGive(*(AriOsa **)v6, v44) == -1;
    MEMORY[0x22767CED0](v45, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 186);
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear((uint64_t *)&v55);
  }
LABEL_51:
  if (v10)
  {
    v52 = (unint64_t *)&v10->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return 0;
}

void sub_222D30F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RegAllIndications(AriHostRt *this)
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  void **v5;
  AriHostRt *v6;
  _QWORD block[6];
  int v9;
  void **v10;
  void **v11;
  uint64_t v12;
  int v13;

  if (AriHostRt::Init(this))
    return 0xFFFFFFFFLL;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications", v2);
  if (v12 >= 0)
    v5 = (void **)&v10;
  else
    v5 = v10;
  v6 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Registering all indications triggered by cid 0x%x", v4, v5, 811, this);
  if (SHIBYTE(v12) < 0)
    operator delete(v10);
  AriHostRt::GetInstance(v6);
  v10 = 0;
  v11 = (void **)&v10;
  v12 = 0x2000000000;
  v13 = -1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt17RegAllIndicationsEj_block_invoke;
  block[3] = &unk_24EB78818;
  v9 = (int)this;
  block[4] = &v10;
  block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v3 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v3;
}

void sub_222D3110C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 25) < 0)
    operator delete(*(void **)(v1 - 48));
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt17RegAllIndicationsEj_block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  _DWORD *v7;
  const char *v8;
  _QWORD *v9;
  uint64_t v10;
  const char *v11;
  void *p_p;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void **v18;
  const char *v19;
  void **v20;
  void *v21[2];
  char v22;
  unsigned __int16 v23;
  char v24;
  void *__p;
  uint64_t v26;
  char v27;
  unsigned __int16 v28;
  int v29;
  _QWORD v30[2];
  char v31;
  _BYTE v32[24];
  _BYTE *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(_QWORD *)(a1 + 40) + 33032) & 1) == 0)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v2);
    if (v27 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to re-register indications using invalid cid 0x%x", v11, p_p, 820, *(unsigned int *)(a1 + 48));
    if (v27 < 0)
      operator delete(__p);
    v13 = *(_QWORD *)(a1 + 40);
    std::string::basic_string[abi:ne180100]<0>(v30, "invalid cid with bulk indication reg");
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*(_QWORD *)(v13 + 33512), 3, (uint64_t)v30, 0, 0);
    if ((v31 & 0x80000000) == 0)
      return;
    v14 = (void *)v30[0];
LABEL_34:
    operator delete(v14);
    return;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v3 + 4) || (v4 = atomic_load((unsigned int *)v3), v4 != 2))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v2);
    if (v27 >= 0)
      v16 = &__p;
    else
      v16 = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to re-register indications using invalid cid 0x%x", v15, v16, 826, *(unsigned int *)(a1 + 48));
    if ((v27 & 0x80000000) == 0)
      return;
    v14 = __p;
    goto LABEL_34;
  }
  bzero(&v26, 0x7D4uLL);
  __p = (void *)0x200000001;
  v29 = 0x7FFFFFFF;
  v24 = 0;
  v23 = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_DWORD *)(a1 + 48);
  v7 = operator new(0x30uLL);
  *(_QWORD *)v7 = &off_24EB78DD8;
  v7[2] = v6;
  *((_QWORD *)v7 + 2) = v5;
  *((_QWORD *)v7 + 3) = &__p;
  *((_QWORD *)v7 + 4) = &v23;
  *((_QWORD *)v7 + 5) = &v24;
  v33 = v7;
  ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::doForEach(v5 + 33176, (uint64_t)v32);
  v9 = v33;
  if (v33 == v32)
  {
    v10 = 4;
    v9 = v32;
  }
  else
  {
    if (!v33)
      goto LABEL_21;
    v10 = 5;
  }
  v9 = (_QWORD *)(*(uint64_t (**)(void))(*v9 + 8 * v10))();
LABEL_21:
  if (v23)
  {
    v28 = v23;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AriHostRt::setGroupMsgAttrib_nl((uint64_t)v9, (unsigned __int16 *)&__p, v8);
  }
  if (v24)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v8);
    if (v22 >= 0)
      v18 = v21;
    else
      v18 = (void **)v21[0];
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) cid 0x%x requested group registration, registered %u indications", v17, v18, 878, *(unsigned int *)(a1 + 48), v23);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v8);
    if (v22 >= 0)
      v20 = v21;
    else
      v20 = (void **)v21[0];
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) cid 0x%x requested group registration, but no indications are registered", v19, v20, 874, *(unsigned int *)(a1 + 48));
  }
  if (v22 < 0)
  {
    v14 = v21[0];
    goto LABEL_34;
  }
}

void sub_222D3142C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::doForEach(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  dispatch_semaphore_s *v5;
  uint64_t *i;
  uint64_t v7;
  _BOOL8 v8;
  int v10;

  MEMORY[0x22767CED0](*(_BYTE *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 322);
  v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 324);
  for (i = *(uint64_t **)(a1 + 16); i; i = (uint64_t *)*i)
  {
    v10 = *((_DWORD *)i + 4);
    v7 = *(_QWORD *)(a2 + 24);
    if (!v7)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, int *, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v10, i + 4);
  }
  v8 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v5) == -1;
  return MEMORY[0x22767CED0](v8, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 327);
}

uint64_t AriHostRt::setGroupMsgAttrib_nl(uint64_t a1, unsigned __int16 *a2, const char *a3)
{
  const char *v4;
  void **v5;
  __int128 v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void **v10;
  const char *v11;
  void **v12;
  AriMsg *EncodedBuf;
  const char *v14;
  AriMsg *v15;
  unsigned __int8 *v16;
  const char *v17;
  const char *v18;
  void **v19;
  const char *v20;
  void **v21;
  unsigned int v23;
  void *v24[2];
  char v25;
  void *__p[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;

  if (a2[1004])
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", a3);
    if ((SBYTE7(v27) & 0x80u) == 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Sending AriGrpMsgsAttribReq with %u gmids", v4, v5, 968, a2[1004]);
    if (SBYTE7(v27) < 0)
      operator delete(__p[0]);
    v30 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v6;
    v29 = v6;
    *(_OWORD *)__p = v6;
    v27 = v6;
    MEMORY[0x22767CF84](__p, 67698688);
    v8 = AriMsg::pack((AriMsg *)__p, 1, a2);
    if ((_DWORD)v8)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v7);
      if (v25 >= 0)
        v10 = v24;
      else
        v10 = (void **)v24[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to pack AriGrpMsgsAttribReq", v9, v10, 975);
      if (v25 < 0)
        operator delete(v24[0]);
    }
    else
    {
      v23 = 0;
      EncodedBuf = (AriMsg *)AriMsg::getEncodedBuf((AriMsg *)__p, &v23);
      v15 = EncodedBuf;
      if (EncodedBuf)
      {
        *((_DWORD *)EncodedBuf + 2) = *((_DWORD *)EncodedBuf + 2) & 0x1FFFF | 0xFE020000;
        v8 = AriHostRt::sendRawInternal_nl(EncodedBuf, EncodedBuf, (unsigned __int8 *)v23);
        if ((_DWORD)v8)
        {
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v17);
          v19 = v25 >= 0 ? v24 : (void **)v24[0];
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to send AriGrpMsgsAttribReq", v18, v19, 988);
          if (v25 < 0)
            operator delete(v24[0]);
        }
        AriMsg::ReleaseEncodedMessage(v15, v16);
      }
      else
      {
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v14);
        if (v25 >= 0)
          v21 = v24;
        else
          v21 = (void **)v24[0];
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to create payload.  Out of memory?", v20, v21, 994);
        if (v25 < 0)
          operator delete(v24[0]);
        v8 = 4294967214;
      }
    }
    AriMsg::~AriMsg((AriMsg *)__p);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", a3);
    if ((SBYTE7(v27) & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Zero gmids provided", v11, v12, 964);
    if (SBYTE7(v27) < 0)
      operator delete(__p[0]);
    return 0xFFFFFFFFLL;
  }
  return v8;
}

void sub_222D31814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0)
    operator delete(__p);
  AriMsg::~AriMsg((AriMsg *)&a20);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::PushAllIndications(AriHostRt *a1, uint64_t a2)
{
  const char *v4;
  const char *v6;
  const char *v7;
  void **v8;
  AriHostRt *v9;
  NSObject *v10;
  const char *v11;
  void **v12;
  _QWORD block[4];
  _QWORD v14[4];
  int v15;
  void **v16;
  char v17;
  void *v18[3];

  if (AriHostRt::Init(a1))
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)(a2 + 16))
  {
    memset(v18, 170, sizeof(v18));
    std::list<unsigned int>::list(v18, a2);
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "PushAllIndications", v6);
    if (v17 >= 0)
      v8 = (void **)&v16;
    else
      v8 = v16;
    v9 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Updating RT with all indications pushed by cid 0x%x", v7, v8, 896, a1);
    if (v17 < 0)
      operator delete(v16);
    AriHostRt::GetInstance(v9);
    v10 = qword_253DEA0E8;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN9AriHostRt18PushAllIndicationsEjRKNSt3__14listIjNS0_9allocatorIjEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_67;
    std::list<unsigned int>::list(v14, (uint64_t)v18);
    v14[3] = &AriHostRt::GetInstance(void)::instance;
    v15 = (int)a1;
    dispatch_sync(v10, block);
    std::__list_imp<unsigned int>::clear(v14);
    std::__list_imp<unsigned int>::clear(v18);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "PushAllIndications", v4);
    if (SHIBYTE(v18[2]) >= 0)
      v12 = v18;
    else
      v12 = (void **)v18[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) No indications were pushed by cid 0x%x", v11, v12, 891, a1);
    if (SHIBYTE(v18[2]) < 0)
      operator delete(v18[0]);
  }
  return 0;
}

void sub_222D31A08(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 33) < 0)
    operator delete(*(void **)(v1 - 56));
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt18PushAllIndicationsEjRKNSt3__14listIjNS0_9allocatorIjEEEE_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  AriHostRt *v3;
  uint64_t v4;

  v1 = result + 32;
  v2 = *(_QWORD *)(result + 40);
  if (v2 != result + 32)
  {
    v3 = *(AriHostRt **)(result + 56);
    v4 = *(unsigned int *)(result + 64);
    do
    {
      result = AriHostRt::regIndication_nl(v3, *(_DWORD *)(v2 + 16), v4);
      v2 = *(_QWORD *)(v2 + 8);
    }
    while (v2 != v1);
  }
  return result;
}

_QWORD *__copy_helper_block_e8_32c37_ZTSNSt3__14listIjNS_9allocatorIjEEEE(uint64_t a1, uint64_t a2)
{
  return std::list<unsigned int>::list((_QWORD *)(a1 + 32), a2 + 32);
}

_QWORD *__destroy_helper_block_e8_32c37_ZTSNSt3__14listIjNS_9allocatorIjEEEE(uint64_t a1)
{
  return std::__list_imp<unsigned int>::clear((_QWORD *)(a1 + 32));
}

_QWORD *std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;

  result = operator new(0x20uLL);
  result[2] = a2;
  result[3] = a3;
  if (a3)
  {
    v7 = (unint64_t *)(a3 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = *a1;
  *result = *a1;
  result[1] = a1;
  *(_QWORD *)(v9 + 8) = result;
  *a1 = (uint64_t)result;
  ++a1[2];
  return result;
}

uint64_t AriHostRt::processStartEvent_nl(uint64_t this)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  void *p_p;
  void *__p;
  char v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(this + 4))
  {
    v1 = this;
    *(_BYTE *)(this + 4) = 1;
    v2 = *(void **)(this + 33520);
    if (v2)
    {
      v3 = *(NSObject **)(this + 33528);
      if (v3)
      {
        dispatch_async(v3, v2);
        AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "processStartEvent_nl", v4);
        if (v8 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Dispatched supervisory Started callback", v5, p_p, 1037);
        if (v8 < 0)
          operator delete(__p);
      }
    }
    v9[0] = &off_24EB78E68;
    v9[3] = v9;
    ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v1 + 33032, (uint64_t)v9);
  }
  return this;
}

void sub_222D31C44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  dispatch_semaphore_s *v5;
  _QWORD *i;
  uint64_t v7;

  MEMORY[0x22767CED0](*(_BYTE *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 311);
  v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x22767CED0](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 313);
  for (i = *(_QWORD **)(a1 + 16); i; i = (_QWORD *)*i)
  {
    v7 = *(_QWORD *)(a2 + 24);
    if (!v7)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 48))(v7, i + 4);
  }
  AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v5);
  JUMPOUT(0x22767CED0);
}

uint64_t AriHostRt::DeregIndication(AriHostRt *this, int a2)
{
  int v3;
  uint64_t v4;
  _QWORD block[6];
  int v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v3 = (int)this;
  AriHostRt::GetInstance(this);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = -1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt15DeregIndicationEjj_block_invoke;
  block[3] = &unk_24EB78870;
  v7 = a2;
  v8 = v3;
  block[4] = &v9;
  block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v4 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void ___ZN9AriHostRt15DeregIndicationEjj_block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  const char *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int *v13;
  int v14;
  int *v15;
  const char *v16;
  void **v17;
  uint64_t v18;
  const char *v19;
  void **v20;
  uint64_t v21;
  const char *v22;
  void **v23;
  const char *v24;
  void **v25;
  unint64_t *v26;
  unint64_t v27;
  int *v28;
  int *v29;
  int *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  void *v33[2];
  char v34;

  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(_QWORD *)(a1 + 40) + 33032) & 1) != 0)
  {
    v3 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](*(_QWORD *)(a1 + 40) + 33032, *(_DWORD *)(a1 + 48));
    v5 = *v3;
    v4 = (std::__shared_weak_count *)v3[1];
    v31 = *v3;
    v32 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(_QWORD *)(a1 + 40) + 33176) & 1) != 0)
    {
      v9 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](*(_QWORD *)(a1 + 40) + 33176, *(_DWORD *)(a1 + 52));
      v10 = (uint64_t *)v9[1];
      if (v10 != v9)
      {
        do
        {
          v11 = (uint64_t *)v10[1];
          if (*(_DWORD *)(v10[2] + 8) == *(_DWORD *)(a1 + 48))
          {
            v12 = *v10;
            *(_QWORD *)(v12 + 8) = v11;
            *(_QWORD *)v10[1] = v12;
            --v9[2];
            std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v10 + 2));
            operator delete(v10);
          }
          v10 = v11;
        }
        while (v11 != v9);
      }
      v13 = *(unsigned int **)(a1 + 40);
      v14 = *(_DWORD *)(a1 + 52);
      v15 = (int *)operator new(4uLL);
      *v15 = v14;
      v29 = v15 + 1;
      v30 = v15 + 1;
      v28 = v15;
      AriHostRt::checkShouldDeregIndication_nl(v13, &v28);
      v29 = v15;
      operator delete(v15);
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v16);
      LODWORD(v13) = v34;
      v17 = (void **)v33[0];
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
      v20 = v33;
      if ((int)v13 < 0)
        v20 = v17;
      if (*(char *)(v18 + 23) >= 0)
        v21 = v18;
      else
        v21 = *(_QWORD *)v18;
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) client(%s:0x%x) no longer listening for msgid(%d-0x%x)", v19, v20, 1079, v21, *(unsigned int *)(a1 + 48), (unsigned __int16)*(_DWORD *)(a1 + 52) >> 10, *(_DWORD *)(a1 + 52) & 0x3FF);
      if (v34 < 0)
        operator delete(v33[0]);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v8);
      if (v34 >= 0)
        v25 = v33;
      else
        v25 = (void **)v33[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) indication msgid(%d-0x%x) is not registered with any cid (cid 0x%x attempted deregister)", v24, v25, 1060, (unsigned __int16)*(_DWORD *)(a1 + 52) >> 10, *(_DWORD *)(a1 + 52) & 0x3FF, *(unsigned int *)(a1 + 48));
      if (v34 < 0)
        operator delete(v33[0]);
    }
    if (v4)
    {
      v26 = (unint64_t *)&v4->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v2);
    if (v34 >= 0)
      v23 = v33;
    else
      v23 = (void **)v33[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) No registered cid 0x%04X", v22, v23, 1053, *(unsigned int *)(a1 + 48));
    if (v34 < 0)
      operator delete(v33[0]);
  }
}

void sub_222D320EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  if (*(char *)(v10 - 49) < 0)
    operator delete(*(void **)(v10 - 72));
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(**(_QWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - **(_QWORD **)(a1 + 40));
}

uint64_t __copy_helper_block_e8_40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t AriHostRt::CancelAllTransactions(AriHostRt *this)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  AriDispatch::Semaphore *v15;
  const char *v16;
  const char *v17;
  void **v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  NSObject *v35;
  unint64_t *v36;
  unint64_t v37;
  AriDispatch::Semaphore *v38;
  const char *v39;
  const char *v40;
  void **v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::string v55;
  _QWORD v56[5];
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  std::string v60;
  void *__p[2];
  char v62;
  _QWORD block[5];
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  void *v68;
  char v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD v72[3];
  _QWORD *v73;
  _QWORD v74[3];
  _QWORD *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  AriHostRt::GetInstance(this);
  v70 = 0xAAAAAAAAAAAAAAAALL;
  v71 = 0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(&v68, "cancel");
  AriDispatch::Semaphore::Create();
  if (v69 < 0)
    operator delete(v68);
  *(_QWORD *)&v67 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v2 = v70;
  v1 = v71;
  if (v71)
  {
    v3 = (unint64_t *)(v71 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v74[0] = &off_24EB78EF8;
  v74[1] = v2;
  v65 = 0;
  v66 = 0;
  v74[2] = v1;
  v75 = v74;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v67, (uint64_t)v74);
  v5 = v75;
  if (v75 == v74)
  {
    v6 = 4;
    v5 = v74;
  }
  else
  {
    if (!v75)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  v7 = v67;
  if (*((_QWORD *)&v67 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 16);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&xmmword_253DF2358 + 1);
  xmmword_253DF2358 = v7;
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  v11 = qword_253DEA0E8;
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke;
  block[3] = &__block_descriptor_tmp_106;
  block[4] = &AriHostRt::GetInstance(void)::instance;
  v64 = v7;
  if (*((_QWORD *)&v7 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  dispatch_async(v11, block);
  v15 = (AriDispatch::Semaphore *)v70;
  dispatch_walltime(0, 5000000000);
  if ((AriDispatch::Semaphore::wait(v15) & 1) == 0)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions", v16);
    if (v62 >= 0)
      v18 = __p;
    else
      v18 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for clients to stall", v17, v18, 1346);
    if (v62 < 0)
      operator delete(__p[0]);
    AriHostRt::ClientTransitionTracker::logRemainingClients((AriHostRt::ClientTransitionTracker *)v7, &v60);
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v60.__r_.__value_.__l.__data_);
  }
  v20 = v70;
  v19 = v71;
  if (v71)
  {
    v21 = (unint64_t *)(v71 + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v72[0] = &off_24EB79008;
  v72[1] = v20;
  v58 = 0;
  v59 = 0;
  v72[2] = v19;
  v73 = v72;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(__p, (uint64_t)v72);
  v23 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  v67 = v23;
  if (*((_QWORD *)&v7 + 1))
  {
    v24 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v7 + 1) + 16))(*((_QWORD *)&v7 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v7 + 1));
    }
  }
  v26 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v27 = (unint64_t *)((char *)__p[1] + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v73;
  if (v73 == v72)
  {
    v30 = 4;
    v29 = v72;
  }
  else
  {
    if (!v73)
      goto LABEL_45;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_45:
  v31 = v67;
  if (*((_QWORD *)&v67 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 16);
    do
      v33 = __ldxr(v32);
    while (__stxr(v33 + 1, v32));
  }
  v34 = (std::__shared_weak_count *)*((_QWORD *)&xmmword_253DF2358 + 1);
  xmmword_253DF2358 = v31;
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  v35 = qword_253DEA0E8;
  v56[0] = v12;
  v56[1] = 1174405120;
  v56[2] = ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke_108;
  v56[3] = &__block_descriptor_tmp_111;
  v56[4] = &AriHostRt::GetInstance(void)::instance;
  v57 = v31;
  if (*((_QWORD *)&v31 + 1))
  {
    v36 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
    do
      v37 = __ldxr(v36);
    while (__stxr(v37 + 1, v36));
  }
  dispatch_async(v35, v56);
  v38 = (AriDispatch::Semaphore *)v70;
  dispatch_walltime(0, 5000000000);
  if ((AriDispatch::Semaphore::wait(v38) & 1) == 0)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions", v39);
    if (v62 >= 0)
      v41 = __p;
    else
      v41 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for clients to ack end of cancellation", v40, v41, 1373);
    if (v62 < 0)
      operator delete(__p[0]);
    AriHostRt::ClientTransitionTracker::logRemainingClients((AriHostRt::ClientTransitionTracker *)v31, &v55);
    if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v55.__r_.__value_.__l.__data_);
  }
  v42 = (std::__shared_weak_count *)*((_QWORD *)&v57 + 1);
  if (*((_QWORD *)&v57 + 1))
  {
    v43 = (unint64_t *)(*((_QWORD *)&v57 + 1) + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
  if (*((_QWORD *)&v64 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v48 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
  if (*((_QWORD *)&v67 + 1))
  {
    v49 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  v51 = (std::__shared_weak_count *)v71;
  if (v71)
  {
    v52 = (unint64_t *)(v71 + 8);
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  return 0;
}

void sub_222D326E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  if (a32 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a38);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v40 - 208);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v40 - 168);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void *p_p;
  uint64_t v6;
  void *__p;
  char v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 4) = 0;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", a3);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to stall (crash)", v4, p_p, 1338);
  if (v8 < 0)
    operator delete(__p);
  v6 = *(_QWORD *)(a1 + 32) + 33032;
  v9[0] = &off_24EB78F88;
  v9[1] = a1 + 40;
  v9[3] = v9;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v9);
}

uint64_t __copy_helper_block_e8_40c63_ZTSNSt3__110shared_ptrIN9AriHostRt23ClientTransitionTrackerEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c63_ZTSNSt3__110shared_ptrIN9AriHostRt23ClientTransitionTrackerEEE(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke_108(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void **v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  void **v16;
  uint64_t v17;
  void *__p[2];
  char v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", a3);
  if (v19 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) canceling %u outstanding requests", v4, v5, 1357, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 33344));
  if (v19 < 0)
    operator delete(__p[0]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD **)(v6 + 33336);
  if (v7)
  {
    do
    {
      v8 = (void *)v7[3];
      v9 = (std::__shared_weak_count *)v7[4];
      __p[0] = v8;
      __p[1] = v9;
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      AriHostRt::RtTransaction::cancel((AriHostRt::RtTransaction *)v8, 4294967211);
      if (v9)
      {
        v12 = (unint64_t *)&v9->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v7 = (_QWORD *)*v7;
    }
    while (v7);
    v6 = *(_QWORD *)(a1 + 32);
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(v6 + 33320);
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", v14);
  if (v19 >= 0)
    v16 = __p;
  else
    v16 = (void **)__p[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients of end of cancellation", v15, v16, 1365);
  if (v19 < 0)
    operator delete(__p[0]);
  v17 = *(_QWORD *)(a1 + 32) + 33032;
  v20[0] = &off_24EB79088;
  v20[1] = a1 + 40;
  v20[3] = v20;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v17, (uint64_t)v20);
}

uint64_t AriHostRt::commitLPM(AriHostRt *this, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t *v6;
  unint64_t v7;
  AriDispatch::Semaphore *v8;
  const char *v9;
  const char *v10;
  void **v11;
  const char *v12;
  void **v13;
  const char *v14;
  void **v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v23[5];
  void *__p[2];
  char v25;
  _QWORD block[6];
  std::__shared_weak_count *v27;
  int v28;
  void *v29;
  char v30;
  unint64_t v31;
  unint64_t v32;

  AriHostRt::GetInstance(this);
  v4 = MEMORY[0x24BDAC760];
  if (a2 < 0x1F5)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v3);
    if (v25 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Skipping request-draining due to imminent LPM timeout in %dms", v12, v13, 1436, a2);
    if (v25 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v31 = 0xAAAAAAAAAAAAAAAALL;
    v32 = 0xAAAAAAAAAAAAAAAALL;
    std::string::basic_string[abi:ne180100]<0>(&v29, "lpmDrainSignal");
    AriDispatch::Semaphore::Create();
    if (v30 < 0)
      operator delete(v29);
    block[2] = ___ZN9AriHostRt9commitLPMEj_block_invoke;
    block[3] = &__block_descriptor_tmp_118;
    block[4] = &AriHostRt::GetInstance(void)::instance;
    block[5] = v31;
    v5 = qword_253DEA0E8;
    block[0] = v4;
    block[1] = 1174405120;
    v28 = a2;
    v27 = (std::__shared_weak_count *)v32;
    if (v32)
    {
      v6 = (unint64_t *)(v32 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    dispatch_async(v5, block);
    v8 = (AriDispatch::Semaphore *)v31;
    dispatch_walltime(0, 1000000 * a2);
    if ((AriDispatch::Semaphore::wait(v8) & 1) != 0)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v9);
      if (v25 >= 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) lpm-critical transaction draining complete", v10, v11, 1431);
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v9);
      if (v25 >= 0)
        v15 = __p;
      else
        v15 = (void **)__p[0];
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) timeout waiting %dms to drain lpm-critical transactions", v14, v15, 1427, a2);
    }
    if (v25 < 0)
      operator delete(__p[0]);
    v16 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v19 = (std::__shared_weak_count *)v32;
    if (v32)
    {
      v20 = (unint64_t *)(v32 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  v23[0] = v4;
  v23[1] = 0x40000000;
  v23[2] = ___ZN9AriHostRt9commitLPMEj_block_invoke_122;
  v23[3] = &__block_descriptor_tmp_125;
  v23[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_async((dispatch_queue_t)qword_253DEA0E8, v23);
  return 0;
}

void sub_222D32E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;

  if (a22 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a28);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v28 - 48);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt9commitLPMEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void **v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  void **v22;
  const char *v23;
  void **v24;
  void **v25;
  uint64_t v26;
  int BufCtx;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  int v34;
  void **v35;
  const char *v36;
  void **v37;
  void **v38;
  void **v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  float v43;
  float v44;
  _BOOL8 v45;
  unint64_t v46;
  unint64_t v47;
  size_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  const char *v56;
  void **v57;
  uint64_t v58;
  void *v59[2];
  char v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  void *__p[2];
  int64_t v64;

  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", a3);
  if (v64 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  v58 = a1;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) attempt to drain lpm-critical request based on %u outstanding requests with %dms timeout", v4, v5, 1391, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 33344), *(unsigned int *)(a1 + 56));
  if (SHIBYTE(v64) < 0)
    operator delete(__p[0]);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 33400);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = (std::__shared_weak_count *)v7[1];
  *v7 = v6;
  v7[1] = v8;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(*(_QWORD *)(v58 + 32) + 33360);
  v15 = *(_QWORD *)(v58 + 32);
  v16 = *(_QWORD **)(v15 + 33336);
  if (v16)
  {
    while (1)
    {
      v18 = v16[3];
      v17 = (std::__shared_weak_count *)v16[4];
      v61 = v18;
      v62 = v17;
      if (v17)
      {
        v19 = (unint64_t *)&v17->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      if (*(_QWORD *)(v18 + 48) <= 0x4A8270A3FuLL)
        break;
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v14);
      v34 = SHIBYTE(v64);
      v35 = (void **)__p[0];
      AriHostRt::RtTransaction::asString((uint64_t *)v59, (AriHostRt::RtTransaction *)v18);
      if (v34 >= 0)
        v37 = __p;
      else
        v37 = v35;
      if (v60 >= 0)
        v38 = v59;
      else
        v38 = (void **)v59[0];
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) NOT waiting for trx(%s) due to long timeout of %llums", v36, v37, 1408, v38, *(_QWORD *)(v18 + 48) / 0xF4240uLL);
      if (v60 < 0)
        operator delete(v59[0]);
      if (SHIBYTE(v64) < 0)
        operator delete(__p[0]);
LABEL_79:
      if (v17)
      {
        v52 = (unint64_t *)&v17->__shared_owners_;
        do
          v53 = __ldaxr(v52);
        while (__stlxr(v53 - 1, v52));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v16 = (_QWORD *)*v16;
      if (!v16)
      {
        v15 = *(_QWORD *)(v58 + 32);
        goto LABEL_86;
      }
    }
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v14);
    v21 = SHIBYTE(v64);
    v22 = (void **)__p[0];
    AriHostRt::RtTransaction::asString((uint64_t *)v59, (AriHostRt::RtTransaction *)v18);
    if (v21 >= 0)
      v24 = __p;
    else
      v24 = v22;
    if (v60 >= 0)
      v25 = v59;
    else
      v25 = (void **)v59[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) trx(%s) is lpm-critical", v23, v24, 1402, v25);
    if (v60 < 0)
      operator delete(v59[0]);
    if (SHIBYTE(v64) < 0)
      operator delete(__p[0]);
    v26 = *(_QWORD *)(v58 + 32);
    BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)(v18 + 16), (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v18 + 16) + 8) - **(_QWORD **)(v18 + 16)));
    v28 = BufCtx;
    v29 = v26 + 33360;
    v30 = BufCtx;
    v31 = *(_QWORD *)(v26 + 33368);
    if (v31)
    {
      v32 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
      v32.i16[0] = vaddlv_u8(v32);
      if (v32.u32[0] > 1uLL)
      {
        v33 = BufCtx;
        if (v31 <= BufCtx)
          v33 = BufCtx % v31;
      }
      else
      {
        v33 = (v31 - 1) & BufCtx;
      }
      v39 = *(void ***)(*(_QWORD *)v29 + 8 * v33);
      if (v39)
      {
        v40 = *v39;
        if (*v39)
        {
          do
          {
            v41 = v40[1];
            if (v41 == BufCtx)
            {
              if (*((_DWORD *)v40 + 4) == BufCtx)
                goto LABEL_78;
            }
            else
            {
              if (v32.u32[0] > 1uLL)
              {
                if (v41 >= v31)
                  v41 %= v31;
              }
              else
              {
                v41 &= v31 - 1;
              }
              if (v41 != v33)
                break;
            }
            v40 = (_QWORD *)*v40;
          }
          while (v40);
        }
      }
    }
    else
    {
      v33 = 0xAAAAAAAAAAAAAAAALL;
    }
    v64 = 0xAAAAAAAAAAAAAA01;
    v40 = operator new(0x28uLL);
    v42 = (_QWORD *)(v26 + 33376);
    __p[0] = v40;
    __p[1] = (void *)(v29 + 16);
    *v40 = 0;
    v40[1] = v30;
    *((_DWORD *)v40 + 4) = v28;
    v40[3] = 0;
    v40[4] = 0;
    v43 = (float)(unint64_t)(*(_QWORD *)(v29 + 24) + 1);
    v44 = *(float *)(v29 + 32);
    if (!v31 || (float)(v44 * (float)v31) < v43)
    {
      v45 = (v31 & (v31 - 1)) != 0;
      if (v31 < 3)
        v45 = 1;
      v46 = v45 | (2 * v31);
      v47 = vcvtps_u32_f32(v43 / v44);
      if (v46 <= v47)
        v48 = v47;
      else
        v48 = v46;
      std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(v29, v48);
      v31 = *(_QWORD *)(v29 + 8);
      if ((v31 & (v31 - 1)) != 0)
      {
        if (v31 <= v30)
          v33 = v30 % v31;
        else
          v33 = v30;
      }
      else
      {
        v33 = (v31 - 1) & v30;
      }
    }
    v49 = *(_QWORD *)v29;
    v50 = *(_QWORD **)(*(_QWORD *)v29 + 8 * v33);
    if (v50)
    {
      *v40 = *v50;
    }
    else
    {
      *v40 = *v42;
      *v42 = v40;
      *(_QWORD *)(v49 + 8 * v33) = v42;
      if (!*v40)
        goto LABEL_77;
      v51 = *(_QWORD *)(*v40 + 8);
      if ((v31 & (v31 - 1)) != 0)
      {
        if (v51 >= v31)
          v51 %= v31;
      }
      else
      {
        v51 &= v31 - 1;
      }
      v50 = (_QWORD *)(*(_QWORD *)v29 + 8 * v51);
    }
    *v50 = v40;
LABEL_77:
    __p[0] = 0;
    ++*(_QWORD *)(v29 + 24);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100]((uint64_t)__p);
LABEL_78:
    std::shared_ptr<Ari::AriClientProxy>::operator=[abi:ne180100](v40 + 3, v18, (uint64_t)v17);
    v17 = v62;
    goto LABEL_79;
  }
LABEL_86:
  v54 = (uint64_t *)(v15 + 33384);
  v55 = *v54;
  if (*v54)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v14);
    if (v64 >= 0)
      v57 = __p;
    else
      v57 = (void **)__p[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) lpmDrainSet.size(): %zu", v56, v57, 1420, v55);
    if (SHIBYTE(v64) < 0)
      operator delete(__p[0]);
  }
  else
  {
    AriDispatch::Semaphore::signal((AriDispatch::Semaphore *)v54[2]);
  }
}

void sub_222D33498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c51_ZTSNSt3__110shared_ptrIN11AriDispatch9SemaphoreEEE(uint64_t result, uint64_t a2)
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

uint64_t __destroy_helper_block_e8_40c51_ZTSNSt3__110shared_ptrIN11AriDispatch9SemaphoreEEE(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t ___ZN9AriHostRt9commitLPMEj_block_invoke_122(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4;
  uint64_t **v5;
  int v6;
  void **v7;
  const char *v8;
  void **v9;
  void *p_p;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int v15;
  const char *v16;
  const char *v17;
  void **v18;
  void *__p;
  int v21;
  int v22;
  char v23;
  void *v24[2];
  char v25;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(uint64_t ***)(v4 + 33376);
  if (v5)
  {
    do
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", a3);
      v6 = v25;
      v7 = (void **)v24[0];
      AriHostRt::RtTransaction::asString((uint64_t *)&__p, (AriHostRt::RtTransaction *)v5[3]);
      if (v6 >= 0)
        v9 = v24;
      else
        v9 = v7;
      if (v23 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) trx(%s) not drained before lpm", v8, v9, 1445, p_p);
      if (v23 < 0)
        operator delete(__p);
      if (v25 < 0)
        operator delete(v24[0]);
      v5 = (uint64_t **)*v5;
    }
    while (v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v11 = v4 + 33400;
  v12 = *(std::__shared_weak_count **)(v11 + 8);
  *(_OWORD *)v11 = 0u;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(*(_QWORD *)(a1 + 32) + 33360);
  __p = (void *)0x600000001;
  v15 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
  v21 = 0xFFFF;
  v22 = v15;
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v16);
  if (v25 >= 0)
    v18 = v24;
  else
    v18 = (void **)v24[0];
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Committing LPM to BB before AP sleep", v17, v18, 1462);
  if (v25 < 0)
    operator delete(v24[0]);
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &__p);
}

void sub_222D3370C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::SetOPMode(int a1, NSObject *a2, unsigned int a3)
{
  std::chrono::system_clock::time_point v6;
  const char *v7;
  const char *v8;
  void **v9;
  std::string *v10;
  const char *v11;
  void **v12;
  std::string *v13;
  const char *v14;
  void **v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  _QWORD v20[4];
  std::string __p;
  unsigned int *v22;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep;
  int v24;
  unsigned int v25;
  int v26;
  _QWORD block[5];
  _QWORD v28[5];
  void *v29[2];
  char v30;
  std::string v31;

  memset(&v31, 170, sizeof(v31));
  std::string::basic_string[abi:ne180100]<0>(&v31, "");
  v6.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  AriHostRt::GetInstance((AriHostRt *)v6.__d_.__rep_);
  if (a1 == 1)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
    if (v30 >= 0)
      v12 = v29;
    else
      v12 = (void **)v29[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to enter LPM", v11, v12, 1498);
    if (v30 < 0)
      operator delete(v29[0]);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      v31.__r_.__value_.__l.__size_ = 14;
      v13 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((_BYTE *)&v31.__r_.__value_.__s + 23) = 14;
      v13 = &v31;
    }
    strcpy((char *)v13, "lpmEnterSignal");
    a3 >>= 1;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 0x40000000;
    v28[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke;
    v28[3] = &__block_descriptor_tmp_129;
    v28[4] = &AriHostRt::GetInstance(void)::instance;
    dispatch_async((dispatch_queue_t)qword_253DEA0E8, v28);
    v17 = 3;
    goto LABEL_27;
  }
  if (a1 == 2)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
    if (v30 >= 0)
      v9 = v29;
    else
      v9 = (void **)v29[0];
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to exit LPM", v8, v9, 1517);
    if (v30 < 0)
      operator delete(v29[0]);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      v31.__r_.__value_.__l.__size_ = 13;
      v10 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((_BYTE *)&v31.__r_.__value_.__s + 23) = 13;
      v10 = &v31;
    }
    strcpy((char *)v10, "lpmExitSignal");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2;
    block[3] = &__block_descriptor_tmp_132;
    block[4] = &AriHostRt::GetInstance(void)::instance;
    dispatch_async((dispatch_queue_t)qword_253DEA0E8, block);
    v17 = 4;
LABEL_27:
    v18 = qword_253DEA0F0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 1174405120;
    v20[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_3;
    v20[3] = &__block_descriptor_tmp_146;
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
    else
      __p = v31;
    v24 = v17;
    v25 = a3;
    v26 = a1;
    v22 = &AriHostRt::GetInstance(void)::instance;
    rep = v6.__d_.__rep_;
    dispatch_group_async(a2, v18, v20);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v16 = 0;
    goto LABEL_33;
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
  if (v30 >= 0)
    v15 = v29;
  else
    v15 = (void **)v29[0];
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Setting unknown mode", v14, v15, 1535);
  if (v30 < 0)
    operator delete(v29[0]);
  v16 = 0xFFFFFFFFLL;
LABEL_33:
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  return v16;
}

void sub_222D33A88(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 89) < 0)
    operator delete(*(void **)(v1 - 112));
  if (*(char *)(v1 - 65) < 0)
    operator delete(*(void **)(v1 - 88));
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke(uint64_t a1)
{
  __int128 v2;

  v2 = xmmword_222D3E5F0;
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &v2);
}

uint64_t ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2(uint64_t a1)
{
  __int128 v2;

  v2 = xmmword_222D3E600;
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &v2);
}

void ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  AriHostRt::ClientTransitionTracker **v8;
  AriHostRt::ClientTransitionTracker *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  AriDispatch::Semaphore *v19;
  const char *v20;
  const char *v21;
  std::string *p_p;
  const char *v23;
  uint64_t *v24;
  size_t size;
  void **v26;
  std::string *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  AriHostRt::ClientTransitionTracker **v34;
  AriHostRt::ClientTransitionTracker *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  NSObject *v41;
  unint64_t *v42;
  unint64_t v43;
  AriDispatch::Semaphore *v44;
  const char *v45;
  const char *v46;
  std::string *v47;
  void *v48;
  const char *v49;
  std::string *v50;
  std::chrono::system_clock::time_point v51;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v52;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *p_shared_owners;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  const char *v64;
  std::string *v65;
  const char *v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  std::string v76;
  _QWORD v77[6];
  std::__shared_weak_count *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  char v84;
  unint64_t v85;
  unint64_t v86;
  void *v87[3];
  std::string __p;
  _QWORD block[6];
  std::__shared_weak_count *v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  std::string v96;
  unint64_t v97;
  unint64_t v98;
  _QWORD v99[3];
  _QWORD *v100;
  _QWORD v101[3];
  _QWORD *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v97 = 0xAAAAAAAAAAAAAAAALL;
  v98 = 0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 55) < 0)
    std::string::__init_copy_ctor_external(&v96, *(const std::string::value_type **)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    v96 = *(std::string *)(a1 + 32);
  AriDispatch::Semaphore::Create();
  if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v96.__r_.__value_.__l.__data_);
  v94 = 0xAAAAAAAAAAAAAAAALL;
  v95 = 0xAAAAAAAAAAAAAAAALL;
  v3 = v97;
  v2 = v98;
  if (v98)
  {
    v4 = (unint64_t *)(v98 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v101[0] = &off_24EB79108;
  v101[1] = v3;
  v92 = 0;
  v93 = 0;
  v101[2] = v2;
  v102 = v101;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v94, (uint64_t)v101);
  v6 = v102;
  if (v102 == v101)
  {
    v7 = 4;
    v6 = v101;
  }
  else
  {
    if (!v102)
      goto LABEL_14;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_14:
  v8 = (AriHostRt::ClientTransitionTracker **)(*(_QWORD *)(a1 + 56) + 33432);
  v9 = (AriHostRt::ClientTransitionTracker *)v94;
  v10 = v95;
  if (v95)
  {
    v11 = (unint64_t *)(v95 + 16);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = (std::__shared_weak_count *)v8[1];
  *v8 = v9;
  v8[1] = (AriHostRt::ClientTransitionTracker *)v10;
  if (v13)
    std::__shared_weak_count::__release_weak(v13);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(NSObject **)(v14 + 24);
  v16 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_4;
  block[3] = &__block_descriptor_tmp_134;
  block[4] = v14;
  block[5] = v9;
  v90 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v17 = (unint64_t *)(v10 + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v91 = *(_DWORD *)(a1 + 72);
  dispatch_async(v15, block);
  v19 = (AriDispatch::Semaphore *)v97;
  dispatch_walltime(0, 1000000 * *(unsigned int *)(a1 + 76));
  if ((AriDispatch::Semaphore::wait(v19) & 1) == 0)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v20);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (*(_DWORD *)(a1 + 80) == 1)
      v23 = "enter";
    else
      v23 = "exit";
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for client to %s LPM", v21, p_p, 1560, v23);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    memset(&__p, 170, sizeof(__p));
    AriHostRt::ClientTransitionTracker::logRemainingClients(v9, &__p);
    if (*(_DWORD *)(a1 + 80) == 1)
    {
      v24 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 33512);
      if (*v24)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        memset(v87, 170, sizeof(v87));
        v26 = v87;
        std::string::basic_string[abi:ne180100]((uint64_t)v87, size + 25);
        if (SHIBYTE(v87[2]) < 0)
          v26 = (void **)v87[0];
        if (size)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v27 = &__p;
          else
            v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
          memmove(v26, v27, size);
        }
        strcpy((char *)v26 + size, " failed to ACK LPM enter.");
        std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*v24, 2, (uint64_t)v87, 0, 0);
        if (SHIBYTE(v87[2]) < 0)
          operator delete(v87[0]);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 80) == 1)
  {
    v85 = 0xAAAAAAAAAAAAAAAALL;
    v86 = 0xAAAAAAAAAAAAAAAALL;
    std::string::basic_string[abi:ne180100]<0>(&v83, "stallSignal");
    AriDispatch::Semaphore::Create();
    if (v84 < 0)
      operator delete(v83);
    v81 = 0xAAAAAAAAAAAAAAAALL;
    v82 = 0xAAAAAAAAAAAAAAAALL;
    v29 = v85;
    v28 = v86;
    if (v86)
    {
      v30 = (unint64_t *)(v86 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    v99[0] = &off_24EB79208;
    v99[1] = v29;
    v79 = 0;
    v80 = 0;
    v99[2] = v28;
    v100 = v99;
    std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v81, (uint64_t)v99);
    v32 = v100;
    if (v100 == v99)
    {
      v33 = 4;
      v32 = v99;
    }
    else
    {
      if (!v100)
        goto LABEL_58;
      v33 = 5;
    }
    (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_58:
    v34 = (AriHostRt::ClientTransitionTracker **)(*(_QWORD *)(a1 + 56) + 33432);
    v35 = (AriHostRt::ClientTransitionTracker *)v81;
    v36 = v82;
    if (v82)
    {
      v37 = (unint64_t *)(v82 + 16);
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
    }
    v39 = (std::__shared_weak_count *)v34[1];
    *v34 = v35;
    v34[1] = (AriHostRt::ClientTransitionTracker *)v36;
    if (v39)
      std::__shared_weak_count::__release_weak(v39);
    v40 = *(_QWORD *)(a1 + 56);
    v41 = *(NSObject **)(v40 + 24);
    v77[0] = v16;
    v77[1] = 1174405120;
    v77[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2_140;
    v77[3] = &__block_descriptor_tmp_142;
    v77[4] = v40;
    v77[5] = v35;
    v78 = (std::__shared_weak_count *)v36;
    if (v36)
    {
      v42 = (unint64_t *)(v36 + 8);
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    dispatch_async(v41, v77);
    v44 = (AriDispatch::Semaphore *)v85;
    dispatch_walltime(0, 1000000 * *(unsigned int *)(a1 + 76));
    if ((AriDispatch::Semaphore::wait(v44) & 1) != 0)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v45);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v47 = &__p;
      else
        v47 = (std::string *)__p.__r_.__value_.__r.__words[0];
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) stall complete", v46, v47, 1595);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_80;
      v48 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v45);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v50 = &__p;
      else
        v50 = (std::string *)__p.__r_.__value_.__r.__words[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for client to stall", v49, v50, 1590);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      AriHostRt::ClientTransitionTracker::logRemainingClients(v35, &v76);
      if ((SHIBYTE(v76.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_80;
      v48 = (void *)v76.__r_.__value_.__r.__words[0];
    }
    operator delete(v48);
LABEL_80:
    v51.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    v52 = (v51.__d_.__rep_ - *(_QWORD *)(a1 + 64)) / 1000;
    v53 = *(unsigned int *)(a1 + 76);
    if (v52 >= v53)
      v54 = 0;
    else
      v54 = (v53 - v52);
    AriHostRt::commitLPM((AriHostRt *)v51.__d_.__rep_, v54);
    v55 = v78;
    if (v78)
    {
      p_shared_owners = (unint64_t *)&v78->__shared_owners_;
      do
        v57 = __ldaxr(p_shared_owners);
      while (__stlxr(v57 - 1, p_shared_owners));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    v58 = (std::__shared_weak_count *)v82;
    if (v82)
    {
      v59 = (unint64_t *)(v82 + 8);
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = (std::__shared_weak_count *)v86;
    if (v86)
    {
      v62 = (unint64_t *)(v86 + 8);
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v20);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v65 = &__p;
  else
    v65 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (*(_DWORD *)(a1 + 80) == 1)
    v66 = "enter";
  else
    v66 = "exit";
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Completed %s LPM", v64, v65, 1604, v66);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v67 = v90;
  if (v90)
  {
    v68 = (unint64_t *)&v90->__shared_owners_;
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
  }
  v70 = (std::__shared_weak_count *)v95;
  if (v95)
  {
    v71 = (unint64_t *)(v95 + 8);
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }
  v73 = (std::__shared_weak_count *)v98;
  if (v98)
  {
    v74 = (unint64_t *)(v98 + 8);
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
  }
}

void sub_222D342B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  uint64_t v51;

  if (a39 < 0)
    operator delete(__p);
  if (a45 < 0)
    operator delete(a40);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a51);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v51 - 224);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v51 - 184);
  _Unwind_Resume(a1);
}

void sub_222D343CC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v1 - 112);
  if (v2 == v0)
  {
    v3 = 4;
    v2 = (_QWORD *)(v1 - 136);
  }
  else
  {
    if (!v2)
    {
LABEL_6:
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v1 - 240);
      JUMPOUT(0x222D343BCLL);
    }
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
  goto LABEL_6;
}

void sub_222D34408()
{
  uint64_t v0;

  if (*(char *)(v0 - 185) < 0)
    operator delete(*(void **)(v0 - 208));
  JUMPOUT(0x222D343C4);
}

void ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32) + 33032;
  v2 = *(unsigned int *)(a1 + 56);
  v3[0] = &off_24EB79188;
  v3[1] = a1 + 40;
  v3[2] = v2;
  v3[3] = v3;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v1, (uint64_t)v3);
}

void ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2_140(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void *p_p;
  uint64_t v6;
  void *__p;
  char v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke_2", a3);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to stall (LPM enter)", v4, p_p, 1582);
  if (v8 < 0)
    operator delete(__p);
  v6 = *(_QWORD *)(a1 + 32) + 33032;
  v9[0] = &off_24EB79288;
  v9[1] = a1 + 40;
  v9[3] = v9;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v9);
}

void __copy_helper_block_e8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 32), *(_QWORD *)(a2 + 40));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 32);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 48);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
}

uint64_t AriHostRt::RegisterBasebandResetDelegate(AriHostRt *a1)
{
  AriHostRt *Instance;
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  Instance = (AriHostRt *)AriHostRt::GetInstance(a1);
  if (AriHostRt::Init(Instance))
    return 0xFFFFFFFFLL;
  v4 = qword_253DEA0E8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_147;
  v10[4] = &AriHostRt::GetInstance(void)::instance;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v11, (uint64_t)a1);
  dispatch_sync(v4, v10);
  result = (uint64_t)v12;
  if (v12 == v11)
  {
    v9 = 4;
    result = (uint64_t)v11;
  }
  else
  {
    if (!v12)
      return result;
    v9 = 5;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 8 * v9))(result, v5, v6, v7, v8);
  return 0;
}

void sub_222D34990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c120_ZTSNSt3__18functionIFvN9AriHostRt20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_e8_40c120_ZTSNSt3__18functionIFvN9AriHostRt20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEE(uint64_t a1)
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

uint64_t AriHostRt::ProcessClientError(AriHostRt *a1, uint64_t a2, uint64_t a3)
{
  AriHostRt *Instance;
  NSObject *v6;
  _QWORD v7[5];
  std::string __p;

  Instance = (AriHostRt *)AriHostRt::GetInstance(a1);
  if (AriHostRt::Init(Instance))
    return 0xFFFFFFFFLL;
  v6 = qword_253DEA0E8;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1174405120;
  v7[2] = ___ZN9AriHostRt18ProcessClientErrorEi21ARI_CLIENT_ERROR_TYPENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_148;
  v7[4] = &AriHostRt::GetInstance(void)::instance;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  dispatch_async(v6, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return 0;
}

void ___ZN9AriHostRt18ProcessClientErrorEi21ARI_CLIENT_ERROR_TYPENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  std::string __p;

  v2 = (uint64_t *)(*(_QWORD *)(a1 + 32) + 33512);
  v3 = *v2;
  if (*v2)
  {
    if (*(char *)(a1 + 63) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
      v3 = *v2;
    }
    else
    {
      __p = *(std::string *)(a1 + 40);
    }
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(v3, 3, (uint64_t)&__p, 0, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_222D34BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t ___ZN9AriHostRt24SendSensitiveLoggingInfoEv_block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  const char *v4;
  uint64_t *v5;
  int v6;
  const char *v7;
  void **v8;
  __int16 v9;
  const char *v10;
  const char *v11;
  void **v12;
  void *__p[2];
  char v15;
  uint64_t v16;
  _WORD v17[1002];
  int v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v2;
  v20 = v2;
  v21 = 0xAAAAAAAAFFFFFFFFLL;
  SdkGmidListSensitiveLogging();
  if (*((_QWORD *)&v20 + 1) >= 0x1F5uLL)
    __assert_rtn("SendSensitiveLoggingInfo_block_invoke", "ari_host_rt.cpp", 1670, "gmidList.size() <= ARI_MSG_SET_MAX");
  bzero(v17, 0x7D4uLL);
  v16 = 0x900000001;
  v18 = 0x7FFFFFFF;
  v5 = (uint64_t *)v20;
  if ((_QWORD)v20)
  {
    v6 = 0;
    do
    {
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendSensitiveLoggingInfo_block_invoke", v4);
      if (v15 >= 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      v3 = Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Updating sensitive logging gmid: 0x%x", v7, v8, 1680, *((unsigned int *)v5 + 4));
      if (v15 < 0)
        operator delete(__p[0]);
      v9 = v6 + 1;
      *(_DWORD *)&v17[2 * (unsigned __int16)v6] = *((_DWORD *)v5 + 4);
      v5 = (uint64_t *)*v5;
      ++v6;
    }
    while (v5);
  }
  else
  {
    v9 = 0;
  }
  v17[1000] = v9;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AriHostRt::setGroupMsgAttrib_nl(v3, (unsigned __int16 *)&v16, v4);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendSensitiveLoggingInfo_block_invoke", v10);
    if (v15 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to send the sensitive logging info", v11, v12, 1688);
    if (v15 < 0)
      operator delete(__p[0]);
  }
  return std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v19);
}

void sub_222D34DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (a17 < 0)
    operator delete(__p);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v17 - 128);
  _Unwind_Resume(a1);
}

void AriHostRt::DumpState(AriHostRt *this)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  AriHostRt::ClientTransitionTracker *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  NSObject *v13;
  unint64_t *v14;
  unint64_t v15;
  AriDispatch::Semaphore *v16;
  const char *v17;
  const char *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::string v29;
  void *v30;
  char v31;
  _QWORD v32[6];
  std::__shared_weak_count *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *__p;
  char v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD block[5];
  _QWORD v43[3];
  _QWORD *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  AriHostRt::GetInstance(this);
  v1 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt9DumpStateEv_block_invoke;
  block[3] = &__block_descriptor_tmp_159;
  block[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_253DEA0E8, block);
  v40 = 0xAAAAAAAAAAAAAAAALL;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(&__p, "dumptracker");
  AriDispatch::Semaphore::Create();
  if (v39 < 0)
    operator delete(__p);
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v3 = v40;
  v2 = v41;
  if (v41)
  {
    v4 = (unint64_t *)(v41 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v43[0] = &off_24EB79498;
  v43[1] = v3;
  v34 = 0;
  v35 = 0;
  v43[2] = v2;
  v44 = v43;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v36, (uint64_t)v43);
  v6 = v44;
  if (v44 == v43)
  {
    v7 = 4;
    v6 = v43;
  }
  else
  {
    if (!v44)
      goto LABEL_11;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_11:
  v8 = (AriHostRt::ClientTransitionTracker *)v36;
  v9 = v37;
  if (v37)
  {
    v10 = (unint64_t *)(v37 + 16);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = (std::__shared_weak_count *)qword_253DF2380;
  qword_253DF2378 = (uint64_t)v8;
  qword_253DF2380 = v9;
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
  v13 = qword_253DEA0E8;
  v32[0] = v1;
  v32[1] = 1174405120;
  v32[2] = ___ZN9AriHostRt9DumpStateEv_block_invoke_2;
  v32[3] = &__block_descriptor_tmp_162;
  v32[4] = &AriHostRt::GetInstance(void)::instance;
  v32[5] = v8;
  v33 = (std::__shared_weak_count *)v9;
  if (v9)
  {
    v14 = (unint64_t *)(v9 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  dispatch_async(v13, v32);
  v16 = (AriDispatch::Semaphore *)v40;
  dispatch_walltime(0, 250000000);
  if ((AriDispatch::Semaphore::wait(v16) & 1) == 0)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState", v17);
    if (v31 >= 0)
      v19 = &v30;
    else
      v19 = v30;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Some clients did not dump state", v18, v19, 1750);
    if (v31 < 0)
      operator delete(v30);
    AriHostRt::ClientTransitionTracker::logRemainingClients(v8, &v29);
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
  }
  v20 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = (std::__shared_weak_count *)v37;
  if (v37)
  {
    v24 = (unint64_t *)(v37 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v27 = (unint64_t *)(v41 + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_222D35134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;

  if (a19 < 0)
    operator delete(__p);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)&a29);
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](v36 - 144);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt9DumpStateEv_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v3;
  void *p_p;
  uint64_t v5;
  void *__p;
  char v8;
  _QWORD v9[6];

  v9[4] = *MEMORY[0x24BDAC8D0];
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", a3);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Client Resources:", v3, p_p, 1700);
  if (v8 < 0)
    operator delete(__p);
  v5 = *(_QWORD *)(a1 + 32) + 33032;
  v9[0] = &off_24EB79398;
  v9[3] = v9;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v5, (uint64_t)v9);
}

void sub_222D35610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt9DumpStateEv_block_invoke_2(uint64_t a1, uint64_t a2, const char *a3)
{
  const char *v4;
  void *p_p;
  uint64_t v6;
  void *__p;
  char v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke_2", a3);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to DumpState", v4, p_p, 1742);
  if (v8 < 0)
    operator delete(__p);
  v6 = *(_QWORD *)(a1 + 32) + 33032;
  v9[0] = &off_24EB79518;
  v9[1] = a1 + 40;
  v9[3] = v9;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v9);
}

const char *asString(int a1)
{
  if ((a1 - 1) > 2)
    return "unknown";
  else
    return (&off_24EB79588)[a1 - 1];
}

uint64_t AriRuntimeNotifyAck(AriHostRt *a1, uint64_t a2, int a3)
{
  AriHostRt::ProcessClientNotifyAck(a1, a3, a2);
  return 0;
}

uint64_t AriRuntimeReportError(AriHostRt *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  std::string __p;

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v3 = AriHostRt::ProcessClientError(a1, a2, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_222D358CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78B58;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78B58;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 24);
    operator delete(v1);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table(uint64_t a1)
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
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 3));
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

_QWORD *std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *result;
  uint64_t v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = operator new(0xA0uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24EB78BA8;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
  AriHostRt::ClientTransitionTracker::ClientTransitionTracker((uint64_t)(v4 + 3), (uint64_t)v7);
  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
    goto LABEL_5;
  }
  if (v8)
  {
    v6 = 5;
LABEL_5:
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
  }
  *a1 = v4 + 3;
  a1[1] = v4;
  return result;
}

void sub_222D35ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  std::__shared_weak_count *v13;
  char *v14;
  char *v16;
  uint64_t v17;
  void *v18;

  v16 = a13;
  if (a13 == v14)
  {
    v17 = 4;
    v16 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:
  std::__shared_weak_count::~__shared_weak_count(v13);
  operator delete(v18);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78BA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78BA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

void std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::__on_zero_shared(uint64_t a1)
{
  AriHostRt::ClientTransitionTracker::~ClientTransitionTracker((AriHostRt::ClientTransitionTracker *)(a1 + 24));
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::remove(uint64_t result, _QWORD *a2, _QWORD *a3)
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

  v3 = (int8x8_t)a2[1];
  v4 = a3[1];
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
  v6 = *(_QWORD **)(*a2 + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a3);
  if (v7 == a2 + 2)
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
    if (!*a3)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a3 + 8);
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
      *(_QWORD *)(*a2 + 8 * v4) = 0;
  }
  v10 = *a3;
  if (*a3)
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
      *(_QWORD *)(*a2 + 8 * v11) = v7;
      v10 = *a3;
    }
  }
  *v7 = v10;
  *a3 = 0;
  --a2[3];
  *(_QWORD *)result = a3;
  *(_QWORD *)(result + 8) = a2 + 2;
  *(_BYTE *)(result + 16) = 1;
  return result;
}

void std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::~__func()
{
  JUMPOUT(0x22767D188);
}

_QWORD *std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EB78BF8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EB78BF8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::operator()(uint64_t a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1 + 8))(*a2, *a3, a4);
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::target_type()
{
}

void IDMgr::~IDMgr(IDMgr *this)
{
  std::__tree<IDMgr::Range>::destroy(*((_QWORD **)this + 5));
  std::__tree<IDMgr::Range>::destroy(*((_QWORD **)this + 2));
}

void std::__tree<IDMgr::Range>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<IDMgr::Range>::destroy(*a1);
    std::__tree<IDMgr::Range>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 4));
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1 + 4);
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr(uint64_t a1, dispatch_semaphore_s *a2)
{
  uint64_t v3;
  uint64_t i;
  AriOsa *v5;
  _QWORD *v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
  v5 = *(AriOsa **)(a1 + 96);
  if (v5)
    AriOsa::OsMutexFree(v5, a2);
  v6 = *(_QWORD **)(a1 + 136);
  if (v6 == (_QWORD *)(a1 + 112))
  {
    v7 = 4;
    v6 = (_QWORD *)(a1 + 112);
    goto LABEL_12;
  }
  if (v6)
  {
    v7 = 5;
LABEL_12:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  std::__tree<IDMgr::Range>::destroy(*(_QWORD **)(a1 + 80));
  std::__tree<IDMgr::Range>::destroy(*(_QWORD **)(a1 + 56));
  return std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::~__hash_table(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 3));
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

uint64_t std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  void *v34;
  _QWORD v35[3];

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = a2;
      if (v6 <= a2)
        v8 = a2 % v6;
    }
    else
    {
      v8 = (v6 - 1) & a2;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == a2)
        {
          if (*((_DWORD *)i + 4) == a2)
            return i;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6)
              v11 %= v6;
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8)
            break;
        }
      }
    }
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  v12 = (_QWORD *)(a1 + 16);
  v35[2] = 0xAAAAAAAAAAAAAA01;
  v13 = operator new(0x30uLL);
  v35[0] = v13;
  v35[1] = a1 + 16;
  *v13 = 0;
  v13[1] = v5;
  *((_DWORD *)v13 + 4) = *a3;
  *((_DWORD *)v13 + 6) = 0;
  v13[4] = 0;
  v13[5] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v6 || (float)(v15 * (float)v6) < v14)
  {
    v16 = 1;
    if (v6 >= 3)
      v16 = (v6 & (v6 - 1)) != 0;
    v17 = v16 | (2 * v6);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v6)
    {
      v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v6 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v6)
      {
        v6 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = *(void **)a1;
          *(_QWORD *)a1 = v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = (_QWORD *)*v12;
          if (*v12)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v12;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v30))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v30);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v6 = (unint64_t)prime;
          goto LABEL_59;
        }
        v34 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v34)
          operator delete(v34);
        v6 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_59:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5)
        v8 = v5 % v6;
      else
        v8 = v5;
    }
    else
    {
      v8 = (v6 - 1) & v5;
    }
  }
  v31 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v8);
  i = (uint64_t *)v35[0];
  if (v31)
  {
    *(_QWORD *)v35[0] = *v31;
LABEL_72:
    *v31 = i;
    goto LABEL_73;
  }
  *(_QWORD *)v35[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = v12;
  if (*i)
  {
    v32 = *(_QWORD *)(*i + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v32 >= v6)
        v32 %= v6;
    }
    else
    {
      v32 &= v6 - 1;
    }
    v31 = (_QWORD *)(*(_QWORD *)a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  v35[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v35);
  return i;
}

void sub_222D36430(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EB78CF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22767D188);
}

uint64_t std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_DWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv(uint64_t a1)
{
  _DWORD *result;

  result = operator new(0x10uLL);
  *(_QWORD *)result = &off_24EB78D48;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t result, uint64_t a2)
{
  *(_QWORD *)a2 = &off_24EB78D48;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[2];
  uint64_t v17;

  v3 = *(_DWORD *)(a1 + 8);
  v16[0] = (uint64_t)v16;
  v16[1] = (uint64_t)v16;
  v17 = 0;
  v4 = (uint64_t *)a3[1];
  if (v4 == a3)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = a3[2];
    do
    {
      v8 = (uint64_t *)v4[1];
      v6 |= *(_DWORD *)(v4[2] + 8) == v3;
      if (*(_DWORD *)(v4[2] + 8) == v3)
      {
        if (v8 == a3)
        {
          LOBYTE(v9) = 1;
LABEL_9:
          v8 = a3;
        }
        else
        {
          while (1)
          {
            v9 = *(_DWORD *)(v8[2] + 8) == v3;
            v6 |= v9;
            if (*(_DWORD *)(v8[2] + 8) != v3)
              break;
            v8 = (uint64_t *)v8[1];
            if (v8 == a3)
              goto LABEL_9;
          }
        }
        if (v4 != v8)
        {
          v10 = *v8;
          if (v16 != a3)
          {
            v11 = 1;
            if ((uint64_t *)v10 != v4)
            {
              v12 = v4;
              do
              {
                v12 = (uint64_t *)v12[1];
                ++v11;
              }
              while (v12 != (uint64_t *)v10);
            }
            v7 -= v11;
            a3[2] = v7;
            v5 += v11;
            v17 = v5;
          }
          v13 = *v4;
          *(_QWORD *)(v13 + 8) = *(_QWORD *)(v10 + 8);
          **(_QWORD **)(v10 + 8) = v13;
          v14 = v16[0];
          *(_QWORD *)(v16[0] + 8) = v4;
          *v4 = v14;
          v16[0] = v10;
          *(_QWORD *)(v10 + 8) = v16;
        }
        if (!v9)
          v8 = (uint64_t *)v8[1];
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v16);
  return (char)-(char)v6;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt16DeregisterClientEjEUb_E3__0))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt16DeregisterClientEjEUb_E3__0;
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

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
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

__n128 _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_24EB78DD8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24EB78DD8;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  unsigned __int16 *v7;
  _WORD *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void **v12;
  uint64_t v13;
  void *__p[2];
  char v15;

  v3 = *(_QWORD *)(a3 + 8);
  if (v3 != a3)
  {
    v5 = *a2;
    do
    {
      v6 = v3;
      v3 = *(_QWORD *)(v3 + 8);
    }
    while (v3 != a3);
    if (*(_DWORD *)(*(_QWORD *)(v6 + 16) + 8) == *(_DWORD *)(a1 + 8))
    {
      v7 = *(unsigned __int16 **)(a1 + 24);
      v8 = *(_WORD **)(a1 + 32);
      v9 = (unsigned __int16)*v8;
      *v8 = v9 + 1;
      *(_DWORD *)&v7[2 * v9 + 4] = (v5 & 0x3FF | ((unsigned __int16)v5 >> 10 << 11)) << 15;
      if ((unsigned __int16)(v9 + 1) == 500)
      {
        v7[1004] = 500;
        if (AriHostRt::setGroupMsgAttrib_nl(a1, v7, (const char *)a3))
        {
          AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", v10);
          if (v15 >= 0)
            v12 = __p;
          else
            v12 = (void **)__p[0];
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to register indications", v11, v12, 857);
          if (v15 < 0)
            operator delete(__p[0]);
          v13 = *(_QWORD *)(a1 + 16);
          std::string::basic_string[abi:ne180100]<0>(__p, "Failed to send indication registration");
          std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*(_QWORD *)(v13 + 33512), 3, (uint64_t)__p, 0, 0);
          if (v15 < 0)
            operator delete(__p[0]);
        }
        bzero((void *)(*(_QWORD *)(a1 + 24) + 8), 0x7D0uLL);
        **(_WORD **)(a1 + 32) = 0;
      }
      **(_BYTE **)(a1 + 40) = 1;
    }
  }
}

void sub_222D36A98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1;
}

_QWORD *std::list<unsigned int>::list(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;

  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  if (v3 != a2)
  {
    v5 = 1;
    v6 = a1;
    do
    {
      v7 = operator new(0x18uLL);
      v7[4] = *(_DWORD *)(v3 + 16);
      *(_QWORD *)v7 = v6;
      *((_QWORD *)v7 + 1) = a1;
      *((_QWORD *)v6 + 1) = v7;
      *a1 = v7;
      a1[2] = v5;
      v3 = *(_QWORD *)(v3 + 8);
      ++v5;
      v6 = v7;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_222D36B84(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::__list_imp<unsigned int>::clear(v1);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t *v1;

  v1 = *(uint64_t **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1 + 4);
    operator delete(v1);
  }
}

uint64_t *std::list<std::shared_ptr<Ari::AriClientProxy>>::list(uint64_t *a1, _QWORD *a2)
{
  _QWORD *i;

  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  for (i = a2; ; std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(a1, i[2], i[3]))
  {
    i = (_QWORD *)i[1];
    if (i == a2)
      break;
  }
  return a1;
}

void sub_222D36C30(_Unwind_Exception *a1)
{
  uint64_t *v1;

  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__func()
{
  JUMPOUT(0x22767D188);
}

_QWORD *std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24EB78E68;
  return result;
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24EB78E68;
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v2 + 48))(v2, 1, 0);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_222D36D1C(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::target_type()
{
}

_QWORD *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB78EF8;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB78EF8;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x22767D188);
}

_QWORD *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB78EF8;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB78EF8;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::target_type()
{
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EB78F88;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EB78F88;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = **(_QWORD **)(a1 + 8);
    v14 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 8);
    v14 = 0;
  }
  v13 = v2;
  AriHostRt::ClientTransitionTracker::trackClient(v6, &v13, (const char *)2);
  v8 = v14;
  if (!v14)
    goto LABEL_12;
  v9 = (unint64_t *)&v14->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  v11 = (unint64_t *)&v3->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_222D37074(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    v5 = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5;
}

_QWORD *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB79008;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB79008;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x22767D188);
}

_QWORD *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB79008;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB79008;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::target_type()
{
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(*(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EB79088;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EB79088;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = **(_QWORD **)(a1 + 8);
    v14 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 8);
    v14 = 0;
  }
  v13 = v2;
  AriHostRt::ClientTransitionTracker::trackClient(v6, &v13, (const char *)8);
  v8 = v14;
  if (!v14)
    goto LABEL_12;
  v9 = (unint64_t *)&v14->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  v11 = (unint64_t *)&v3->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_222D37454(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    v5 = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7;
}

_QWORD *_ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEED1Ev(_QWORD *a1)
{
  *a1 = &off_24EB79108;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEED0Ev(_QWORD *a1)
{
  *a1 = &off_24EB79108;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB79108;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7__cloneEPNS0_6__baseIS9_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB79108;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7destroyEv(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 8);
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE18destroy_deallocateEv(void *a1)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEEclEv(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

__n128 _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24EB79188;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24EB79188;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESD_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = **(_QWORD **)(a1 + 8);
    v14 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 8);
    v14 = 0;
  }
  v13 = v2;
  AriHostRt::ClientTransitionTracker::trackClient(v6, &v13, (const char *)*(unsigned int *)(a1 + 16));
  v8 = v14;
  if (!v14)
    goto LABEL_12;
  v9 = (unint64_t *)&v14->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  v11 = (unint64_t *)&v3->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_222D377EC(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    v5 = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9;
}

_QWORD *_ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEED1Ev(_QWORD *a1)
{
  *a1 = &off_24EB79208;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEED0Ev(_QWORD *a1)
{
  *a1 = &off_24EB79208;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB79208;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7__cloneEPNS0_6__baseIS9_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB79208;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7destroyEv(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 8);
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE18destroy_deallocateEv(void *a1)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEEclEv(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EB79288;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EB79288;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESD_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = **(_QWORD **)(a1 + 8);
    v14 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 8);
    v14 = 0;
  }
  v13 = v2;
  AriHostRt::ClientTransitionTracker::trackClient(v6, &v13, (const char *)5);
  v8 = v14;
  if (!v14)
    goto LABEL_12;
  v9 = (unint64_t *)&v14->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  v11 = (unint64_t *)&v3->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_222D37B78(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    v5 = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11;
}

_QWORD *_ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_ED1Ev(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_24EB79308;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
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
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_ED0Ev(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_24EB79308;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7__cloneEv(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_24EB79308;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_222D37D3C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7__cloneEPNS0_6__baseISB_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24EB79308;
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *_ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7destroyEv(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
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

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E18destroy_deallocateEv(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
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
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_EclEOS4_OSA_OiOj(uint64_t *a1, int *a2, uint64_t a3, int *a4, int *a5)
{
  int v6;
  std::string::value_type *v7;
  std::string::size_type v8;
  int v9;
  int v10;
  int v11;
  _BYTE v12[7];
  std::string v13;

  v6 = *a2;
  v7 = *(std::string::value_type **)a3;
  v8 = *(_QWORD *)(a3 + 8);
  *(_DWORD *)v12 = *(_DWORD *)(a3 + 16);
  *(_DWORD *)&v12[3] = *(_DWORD *)(a3 + 19);
  v9 = *(char *)(a3 + 23);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  v10 = *a4;
  v11 = *a5;
  AriHostRt::GetInstance((AriHostRt *)a1);
  if (!byte_253DEA0D5)
  {
    if (v9 < 0)
    {
      std::string::__init_copy_ctor_external(&v13, v7, v8);
    }
    else
    {
      v13.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      v13.__r_.__value_.__l.__size_ = v8;
      LODWORD(v13.__r_.__value_.__r.__words[2]) = *(_DWORD *)v12;
      *(_DWORD *)((char *)&v13.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)&v12[3];
      *((_BYTE *)&v13.__r_.__value_.__s + 23) = v9;
    }
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(a1[4], v6, (uint64_t)&v13, v10, v11);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
  }
  byte_253DEA0D5 = 1;
  if (v9 < 0)
    operator delete(v7);
}

void sub_222D37ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
    operator delete(__p);
  if (v16 < 0)
    operator delete(v15);
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEEEUb7_E4__12))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E11target_typeEv()
{
  return &_ZTIZZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEEEUb7_E4__12;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24EB79398;
  return result;
}

void _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24EB79398;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t a2, const char *a3)
{
  std::__shared_weak_count *v3;
  unsigned int *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *p_p;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *__p;
  char v15;

  v4 = *(unsigned int **)a2;
  v3 = *(std::__shared_weak_count **)(a2 + 8);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", a3);
  v7 = v4[2];
  v8 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  p_p = &__p;
  if (v15 < 0)
    p_p = __p;
  if (*(char *)(v8 + 23) >= 0)
    v11 = v8;
  else
    v11 = *(_QWORD *)v8;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Client ID: 0x%x(%s)", v9, p_p, 1702, v7, v11);
  if (v15 < 0)
    operator delete(__p);
  if (v3)
  {
    v12 = (unint64_t *)&v3->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_222D3809C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v22;

  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__13))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__13;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24EB79418;
  return result;
}

void _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24EB79418;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unsigned int *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void **p_p;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  void *__p;
  char v21;

  v3 = *(_QWORD **)(a3 + 8);
  if (v3 != (_QWORD *)a3)
  {
    v5 = *a2 & 0x3FF;
    v6 = (unsigned __int16)*a2 >> 10;
    do
    {
      v8 = (unsigned int *)v3[2];
      v7 = (std::__shared_weak_count *)v3[3];
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      AriOsa::LogSrcInfo((AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", (const char *)a3);
      v11 = v21;
      v12 = (void **)__p;
      v13 = v8[2];
      v14 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v8 + 16))(v8);
      p_p = &__p;
      if (v11 < 0)
        p_p = v12;
      if (*(char *)(v14 + 23) >= 0)
        v17 = v14;
      else
        v17 = *(_QWORD *)v14;
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication ID: (%d-0x%x), Client ID or Actor ID: 0x%x(%s)", v15, p_p, 1710, v6, v5, v13, v17);
      if (v21 < 0)
      {
        operator delete(__p);
        if (v7)
        {
LABEL_15:
          v18 = (unint64_t *)&v7->__shared_owners_;
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 - 1, v18));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
      else if (v7)
      {
        goto LABEL_15;
      }
      v3 = (_QWORD *)v3[1];
    }
    while (v3 != (_QWORD *)a3);
  }
}

void sub_222D382D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v24;

  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__14))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__14;
}

_QWORD *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB79498;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::~__func(_QWORD *a1)
{
  *a1 = &off_24EB79498;
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x22767D188);
}

_QWORD *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24EB79498;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24EB79498;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  return std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::target_type()
{
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
  JUMPOUT(0x22767D188);
}

_QWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EB79518;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EB79518;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = **(_QWORD **)(a1 + 8);
    v14 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 8);
    v14 = 0;
  }
  v13 = v2;
  AriHostRt::ClientTransitionTracker::trackClient(v6, &v13, (const char *)7);
  v8 = v14;
  if (!v14)
    goto LABEL_12;
  v9 = (unint64_t *)&v14->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v3)
      return;
  }
  else
  {
LABEL_12:
    if (!v3)
      return;
  }
  v11 = (unint64_t *)&v3->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_222D38644(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
    v5 = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb9_E4__16))
    return a1 + 8;
  else
    return 0;
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb9_E4__16;
}

uint64_t _GLOBAL__sub_I_ari_host_rt_cpp()
{
  qword_253DF23F0 = 0;
  return __cxa_atexit((void (*)(void *))std::function<BOOL ()(void *)>::~function, &checkerFunction, &dword_222D22000);
}

uint64_t ARI_AriACK_Extract()
{
  return MEMORY[0x24BECE218]();
}

uint64_t ARI_AriMsgAttribResp_Extract()
{
  return MEMORY[0x24BECE220]();
}

uint64_t ARI_AriNACK_Extract()
{
  return MEMORY[0x24BECE228]();
}

uint64_t ARI_CsiGetCurrentBootStateRspCb_Extract()
{
  return MEMORY[0x24BECE3D0]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC048]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC068](center, name, object, userInfo, deliverImmediately);
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t GetBufDigest(const unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  return MEMORY[0x24BECE5F8](a1, a2, a3);
}

uint64_t make_shared_buffer(const unsigned __int8 *a1)
{
  return MEMORY[0x24BECE600](a1);
}

uint64_t AriFramer_HeaderMagicScan(const unsigned __int8 *a1, uint64_t a2, int *a3, unint64_t *a4)
{
  return MEMORY[0x24BECE608](a1, a2, a3, a4);
}

uint64_t SdkGmidListSensitiveLogging(void)
{
  return MEMORY[0x24BECE610]();
}

uint64_t asString()
{
  return MEMORY[0x24BECE628]();
}

{
  return MEMORY[0x24BECE648]();
}

{
  return MEMORY[0x24BECE650]();
}

{
  return MEMORY[0x24BECE6B8]();
}

{
  return MEMORY[0x24BECE6D0]();
}

{
  return MEMORY[0x24BECE7A8]();
}

uint64_t asString(void *a1)
{
  return MEMORY[0x24BECE7B0](a1);
}

uint64_t AriDispatch::Timer::set()
{
  return MEMORY[0x24BECE7B8]();
}

uint64_t AriDispatch::Timer::Create(AriDispatch::Timer *this, dispatch_queue_s *a2)
{
  return MEMORY[0x24BECE7C0](this, a2);
}

uint64_t AriDispatch::Timer::cancel(AriDispatch::Timer *this)
{
  return MEMORY[0x24BECE7C8](this);
}

uint64_t AriDispatch::Semaphore::wait(AriDispatch::Semaphore *this)
{
  return MEMORY[0x24BECE7D0](this);
}

uint64_t AriDispatch::Semaphore::Create()
{
  return MEMORY[0x24BECE7D8]();
}

uint64_t AriDispatch::Semaphore::signal(AriDispatch::Semaphore *this)
{
  return MEMORY[0x24BECE7E0](this);
}

uint64_t capabilities::radio::ARITransportTimeout(capabilities::radio *this)
{
  return MEMORY[0x24BED9268](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t Ari::GetLogLevels(Ari *this)
{
  return MEMORY[0x24BECE7F8](this);
}

uint64_t Ari::LogTransportBuf()
{
  return MEMORY[0x24BECE800]();
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x24BECE808](this, a2, a3);
}

uint64_t Ari::LogBuf(Ari *this, const char *a2, const char *a3, uint64_t a4, const void *a5)
{
  return MEMORY[0x24BECE810](this, a2, a3, a4, a5);
}

uint64_t Ari::SWTrap(Ari *this, uint64_t a2, const char *a3, const char *a4)
{
  return MEMORY[0x24BECE818](this, a2, a3, a4);
}

uint64_t Ari::LogConfig()
{
  return MEMORY[0x24BECE820]();
}

uint64_t Ari::LogHeader(Ari *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE828](this, a2);
}

uint64_t IDMgr::dump(IDMgr *this)
{
  return MEMORY[0x24BECE830](this);
}

uint64_t IDMgr::free(IDMgr *this)
{
  return MEMORY[0x24BECE838](this);
}

uint64_t IDMgr::isAlloc(IDMgr *this)
{
  return MEMORY[0x24BECE840](this);
}

uint64_t IDMgr::allocate(IDMgr *this, int *a2)
{
  return MEMORY[0x24BECE848](this, a2);
}

uint64_t IDMgr::allocate(IDMgr *this)
{
  return MEMORY[0x24BECE850](this);
}

void IDMgr::IDMgr(IDMgr *this)
{
  MEMORY[0x24BECE858](this);
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE860](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x24BECE870](this, a2);
}

uint64_t AriMsg::pack(AriMsg *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x24BECE878](this, a2, a3);
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE888](this, a2);
}

uint64_t AriMsg::GetBufSeq(AriMsg *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x24BECE890](this, a2, a3, a4);
}

uint64_t AriMsg::SetBufSeq(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE898](this, a2);
}

void AriMsg::AriMsg(AriMsg *this)
{
  MEMORY[0x24BECE8B0](this);
}

void AriMsg::~AriMsg(AriMsg *this)
{
  MEMORY[0x24BECE8B8](this);
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BECE8C0](this, a2, a3);
}

uint64_t AriOsa::OsMutexFree(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x24BECE8C8](this, a2);
}

uint64_t AriOsa::OsMutexGive(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x24BECE8D0](this, a2);
}

uint64_t AriOsa::OsMutexTake(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x24BECE8D8](this, a2);
}

uint64_t AriOsa::OsTimeStamp(AriOsa *this)
{
  return MEMORY[0x24BECE8E0](this);
}

uint64_t AriOsa::OsMutexCreate(AriOsa *this, dispatch_semaphore_s **a2)
{
  return MEMORY[0x24BECE8E8](this, a2);
}

uint64_t AriOsa::OsSleep(AriOsa *this)
{
  return MEMORY[0x24BECE8F0](this);
}

uint64_t AriMsg::getEncodedBuf(AriMsg *this, unsigned int *a2)
{
  return MEMORY[0x24BED1CE0](this, a2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF60]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
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

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EB77ED8(__p);
}

uint64_t operator delete()
{
  return off_24EB77EE0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EB77EE8(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
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

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

