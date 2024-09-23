CTGreenTeaLoggerImpl **getCTGreenTeaOsLogHandle(CTGreenTeaLoggerImpl **result)
{
  if (result)
    return (CTGreenTeaLoggerImpl **)CTGreenTeaLoggerImpl::getLogHandle(*result);
  return result;
}

void __ct_green_tea_logger_create_static_block_invoke()
{
  unsigned __int8 v0;
  uint64_t v1;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed))
  {
    v1 = operator new();
    *(_QWORD *)v1 = 850045863;
    *(_OWORD *)(v1 + 8) = 0u;
    *(_OWORD *)(v1 + 24) = 0u;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_QWORD *)(v1 + 80) = 0;
    *(_QWORD *)(v1 + 72) = 0;
    *(_QWORD *)(v1 + 56) = 0;
    *(_QWORD *)(v1 + 64) = v1 + 72;
    _ZZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed = v1;
    __cxa_guard_release(&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed);
  }
  ct_green_tea_logger_create_static::fLogServer = _ZZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed;
}

void sub_2064E1040(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed);
  _Unwind_Resume(a1);
}

uint64_t ___Z21getGreenTeaLogUtilityv_block_invoke()
{
  _QWORD *v0;
  uint64_t result;

  v0 = operator new(0x20uLL);
  v0[1] = 0;
  v0[2] = 0;
  *v0 = &off_24BF22268;
  qword_253CF8998 = (uint64_t)v0;
  v0[3] = &unk_24BF22240;
  result = (uint64_t)(v0 + 3);
  getGreenTeaLogUtility(void)::greenTeaLogUtility = result;
  return result;
}

ct_green_tea_logger_s *ct_green_tea_logger_create_static(ct_green_tea_logger_s *result)
{
  const char *v1;
  unsigned __int8 v2;

  if (result)
  {
    v1 = (const char *)result;
    {
      ct_green_tea_logger_create_static::fLogServer = 0;
    }
    if (ct_green_tea_logger_create_static::onceToken != -1)
      dispatch_once(&ct_green_tea_logger_create_static::onceToken, &__block_literal_global_0);
    return CTGreenTeaLogServer::getLogger((CTGreenTeaLogServer *)ct_green_tea_logger_create_static::fLogServer, v1);
  }
  return result;
}

void ___ZN12_GLOBAL__N_117isInternalInstallEv_block_invoke()
{
  const void *v0;
  const void *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFEqual(v0, CFSTR("Internal"));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v3[0] = 67109120;
      v3[1] = v2 != 0;
      _os_log_impl(&dword_2064E0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Internal install: %d", (uint8_t *)v3, 8u);
    }
    CFRelease(v1);
  }
}

void ___ZN12_GLOBAL__N_116isCarrierInstallEv_block_invoke()
{
  const void *v0;
  const void *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFEqual(v0, CFSTR("Carrier"));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v3[0] = 67109120;
      v3[1] = v2 != 0;
      _os_log_impl(&dword_2064E0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Carrier install: %d", (uint8_t *)v3, 8u);
    }
    CFRelease(v1);
  }
}

ct_green_tea_logger_s *CTGreenTeaLogServer::getLogger(CTGreenTeaLogServer *this, const char *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  ct_green_tea_logger_s *v9;
  ct_green_tea_logger_s *GreenTeaLogger;
  const char *v12;

  v12 = a2;
  std::mutex::lock((std::mutex *)this);
  v4 = (_QWORD *)*((_QWORD *)this + 9);
  if (!v4)
    goto LABEL_12;
  v5 = (_QWORD *)((char *)this + 72);
  do
  {
    v6 = v4[4];
    v7 = v6 >= (unint64_t)a2;
    if (v6 >= (unint64_t)a2)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != (_QWORD *)((char *)this + 72) && v5[4] <= (unint64_t)a2)
  {
    v9 = (ct_green_tea_logger_s *)v5[5];
  }
  else
  {
LABEL_12:
    GreenTeaLogger = createGreenTeaLogger(a2);
    if (GreenTeaLogger)
    {
      std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__emplace_unique_key_args<char const*,char const*&,ct_green_tea_logger_s *&>((uint64_t **)this + 8, (unint64_t *)&v12, (uint64_t *)&v12, (uint64_t *)&GreenTeaLogger);
      v9 = GreenTeaLogger;
    }
    else
    {
      v9 = 0;
    }
  }
  std::mutex::unlock((std::mutex *)this);
  return v9;
}

void sub_2064E13A8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ct_green_tea_logging_enabled()
{
  CTGreenTeaLoggerImpl **GreenTeaLogger;
  uint64_t v1;
  NSObject *LogHandle;
  _BOOL8 v3;
  uint64_t v4;

  GreenTeaLogger = (CTGreenTeaLoggerImpl **)createGreenTeaLogger((const char *)&unk_2064E1E5D);
  if (!GreenTeaLogger)
    return 0;
  v1 = (uint64_t)GreenTeaLogger;
  LogHandle = CTGreenTeaLoggerImpl::getLogHandle(*GreenTeaLogger);
  if (LogHandle)
    v3 = os_log_type_enabled(LogHandle, OS_LOG_TYPE_INFO);
  else
    v3 = 0;
  v4 = std::shared_ptr<CTGreenTeaLoggerImpl>::~shared_ptr[abi:ne180100](v1);
  MEMORY[0x20BCF72D8](v4, 0x20C40A4A59CD2);
  return v3;
}

uint64_t CTGreenTeaLoggerImpl::getLogHandle(CTGreenTeaLoggerImpl *this)
{
  return *(_QWORD *)this;
}

uint64_t ct_green_tea_logger_destroy(uint64_t result)
{
  if (result)
  {
    std::shared_ptr<CTGreenTeaLoggerImpl>::~shared_ptr[abi:ne180100](result);
    JUMPOUT(0x20BCF72D8);
  }
  return result;
}

ct_green_tea_logger_s *createGreenTeaLogger(const char *a1)
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  ct_green_tea_logger_s *v7;
  uint64_t (***v9)(_QWORD);
  std::__shared_weak_count *v10;

  getGreenTeaLogUtility(&v9);
  v2 = (**v9)(v9);
  v3 = v2;
  v4 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if (v3)
        goto LABEL_6;
      return 0;
    }
  }
  if (!v2)
    return 0;
LABEL_6:
  v7 = (ct_green_tea_logger_s *)operator new();
  ct_green_tea_logger_s::ct_green_tea_logger_s(v7, a1);
  return v7;
}

void sub_2064E151C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BCF72D8](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

BOOL GreenTeaLogUtility::canCreateLogHandle(GreenTeaLogUtility *this)
{
    return 1;
}

void ct_green_tea_logger_s::ct_green_tea_logger_s(ct_green_tea_logger_s *this, const char *a2)
{
  _QWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24BF222A0;
  v4[3] = os_log_create("com.apple.greentea", a2);
  *(_QWORD *)&v8 = v4 + 3;
  *((_QWORD *)&v8 + 1) = v4;
  std::shared_ptr<CTGreenTeaLoggerImpl>::operator=[abi:ne180100]((uint64_t)this, &v8);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_2064E1688(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<CTGreenTeaLoggerImpl>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void getGreenTeaLogUtility(_QWORD *a1@<X8>)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  int v8;

  {
    getGreenTeaLogUtility(void)::greenTeaLogUtility = 0;
    qword_253CF8998 = 0;
  }
  v4 = 0x253CF8000uLL;
  if ((v3 & 1) == 0)
  {
    v4 = 0x253CF8000uLL;
    if (v8)
    {
      getGreenTeaLogUtility(void)::onceToken = 0;
      v4 = 0x253CF8000;
    }
  }
  if (*(_QWORD *)(v4 + 2464) != -1)
    dispatch_once(&getGreenTeaLogUtility(void)::onceToken, &__block_literal_global_1);
  v5 = qword_253CF8998;
  *a1 = getGreenTeaLogUtility(void)::greenTeaLogUtility;
  a1[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::__on_zero_shared(uint64_t a1)
{
  CTGreenTeaLoggerImpl::~CTGreenTeaLoggerImpl((void **)(a1 + 24));
}

void CTGreenTeaLoggerImpl::~CTGreenTeaLoggerImpl(void **this)
{
  void *v1;

  v1 = *this;
  if (v1)
    os_release(v1);
}

uint64_t *std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__emplace_unique_key_args<char const*,char const*&,ct_green_tea_logger_s *&>(uint64_t **a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (uint64_t *)operator new(0x30uLL);
    v13 = *a4;
    v12[4] = *a3;
    v12[5] = v13;
    std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return v12;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

const char *ct_green_tea_logger_create(const char *a1)
{
  if (a1)
    return (const char *)createGreenTeaLogger(a1);
  return a1;
}

void GreenTeaLogUtility::~GreenTeaLogUtility(GreenTeaLogUtility *this)
{
  GreenTeaLogUtilityInterface::~GreenTeaLogUtilityInterface(this);
  JUMPOUT(0x20BCF72D8);
}

uint64_t std::shared_ptr<CTGreenTeaLoggerImpl>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::shared_ptr<CTGreenTeaLoggerImpl>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

void std::__shared_ptr_emplace<GreenTeaLogUtility>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24BF22268;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<GreenTeaLogUtility>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24BF22268;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BCF72D8);
}

uint64_t std::__shared_ptr_emplace<GreenTeaLogUtility>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 8))(a1 + 24);
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24BF222A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24BF222A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BCF72D8);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8440]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24BF22150(__p);
}

uint64_t operator delete()
{
  return off_24BF22158();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24BF22160(__sz);
}

uint64_t operator new()
{
  return off_24BF22168();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

