void std::__tree<std::string>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::string>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::string>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

const char *TelephonyXPC::ServerPowerObserver::asString(unsigned int a1)
{
  if (a1 > 2)
    return "Unknown";
  else
    return off_24CEA1160[a1];
}

{
  if (a1 > 3)
    return "Unknown";
  else
    return off_24CEA1178[a1];
}

void TelephonyXPC::ServerPowerObserver::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[2];
  uint64_t v16;
  std::__shared_weak_count *v17;

  *a3 = 0xAAAAAAAAAAAAAAAALL;
  a3[1] = 0xAAAAAAAAAAAAAAAALL;
  v6 = operator new(0x90uLL);
  v7 = (std::__shared_weak_count *)a1[1];
  v16 = *a1;
  v17 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  if (*(_QWORD *)a2)
    v10 = _Block_copy(*(const void **)a2);
  else
    v10 = 0;
  v11 = *(NSObject **)(a2 + 8);
  v15[0] = v10;
  v15[1] = v11;
  if (v11)
    dispatch_retain(v11);
  TelephonyXPC::ServerPowerObserver::ServerPowerObserver(v6, &v16, (uint64_t)v15);
  std::shared_ptr<TelephonyXPC::ServerPowerObserver>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerPowerObserver,void>(a3, (uint64_t)v6);
  if (v11)
    dispatch_release(v11);
  if (v10)
    _Block_release(v10);
  v12 = v17;
  if (v17)
  {
    v13 = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  TelephonyXPC::ServerPowerObserver::init((TelephonyXPC::ServerPowerObserver *)*a3);
}

void sub_212CF9E48(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::ServerPowerObserver::PowerEvent,TelephonyXPC::ServerPowerObserver::PowerState,dispatch::group_session)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void TelephonyXPC::ServerPowerObserver::init(TelephonyXPC::ServerPowerObserver *this)
{
  std::__shared_weak_count *v3;
  char *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  _QWORD v15[6];
  std::__shared_weak_count *v16;
  _QWORD *v17;
  _QWORD block[6];

  v5 = *((_QWORD *)this + 9);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  v4 = (char *)this + 72;
  if (!v3 || (v6 = std::__shared_weak_count::lock(v3)) == 0)
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
  v12 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1174405120;
  v15[2] = ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke;
  v15[3] = &__block_descriptor_tmp_10;
  v15[4] = this;
  v15[5] = v5;
  v16 = v7;
  do
    v13 = __ldxr(p_shared_weak_owners);
  while (__stxr(v13 + 1, p_shared_weak_owners));
  v17 = v15;
  block[0] = v12;
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN12TelephonyXPC19ServerPowerObserverEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_19;
  block[4] = v4;
  block[5] = &v17;
  v14 = *((_QWORD *)this + 11);
  if (*((_QWORD *)this + 12))
    dispatch_async_and_wait(v14, block);
  else
    dispatch_sync(v14, block);
  if (v16)
    std::__shared_weak_count::__release_weak(v16);
  std::__shared_weak_count::__release_weak(v7);
}

_QWORD *TelephonyXPC::ServerPowerObserver::ServerPowerObserver(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  void *v6;
  NSObject *v7;

  *a1 = off_24CEA0E88;
  v5 = ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::SharedLoggable<std::string const&,std::shared_ptr<ctu::LogServer>&>(a1, (uint64_t)"ServerPowerObserver", (uint64_t)"ServerPowerObserver", a2);
  *v5 = off_24CEA0E88;
  v5[13] = 0;
  v5[14] = 0;
  *((_DWORD *)v5 + 30) = 2;
  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a3 + 8);
  a1[16] = v6;
  a1[17] = v7;
  if (v7)
    dispatch_retain(v7);
  ctu::LoggerCommonBase::setLogLevel();
  return a1;
}

void sub_212CFA098(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  dispatch::callback<void({block_pointer})(TelephonyXPC::ServerPowerObserver::PowerEvent,TelephonyXPC::ServerPowerObserver::PowerState,dispatch::group_session)>::~callback(v3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2);
  *v1 = off_24CEA0FE8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v1 + 9);
  _Unwind_Resume(a1);
}

const char *TelephonyXPC::ServerPowerObserver::getName(TelephonyXPC::ServerPowerObserver *this)
{
  return "ServerPowerObserver";
}

_QWORD *ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::SharedLoggable<std::string const&,std::shared_ptr<ctu::LogServer>&>(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  dispatch_object_t object;

  object = 0;
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::SharedSynchronizable(a1 + 9, a2, 0, &object);
  if (object)
    dispatch_release(object);
  *a1 = off_24CEA0FE8;
  ctu::LoggerCommonBase::LoggerCommonBase();
  a1[1] = &unk_24CEA10E0;
  v6 = a4[1];
  a1[7] = *a4;
  a1[8] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  *a1 = off_24CEA10A0;
  return a1;
}

void sub_212CFA194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  _QWORD *v10;

  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v10);
  _Unwind_Resume(a1);
}

void TelephonyXPC::ServerPowerObserver::~ServerPowerObserver(TelephonyXPC::ServerPowerObserver *this)
{
  NSObject *v2;
  const void *v3;

  *(_QWORD *)this = off_24CEA0E88;
  v2 = *((_QWORD *)this + 17);
  if (v2)
    dispatch_release(v2);
  v3 = (const void *)*((_QWORD *)this + 16);
  if (v3)
    _Block_release(v3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 104);
  *(_QWORD *)this = off_24CEA0FE8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable((_QWORD *)this + 9);
}

{
  void *v1;

  TelephonyXPC::ServerPowerObserver::~ServerPowerObserver(this);
  operator delete(v1);
}

void ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke(uint64_t a1)
{
  __int128 v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_weak_owners;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  std::string v23;
  std::__shared_weak_count *v24;
  __int128 v25;
  _QWORD aBlock[4];
  __int128 v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  _OWORD v30[3];

  *(_QWORD *)&v30[2] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = v1;
  v30[1] = v1;
  v29 = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke_2;
  aBlock[3] = &__block_descriptor_tmp;
  v19 = *(_OWORD *)(a1 + 32);
  v27 = v19;
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  v28 = v2;
  if (v2)
  {
    p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v4 = __ldxr(p_shared_weak_owners);
    while (__stxr(v4 + 1, p_shared_weak_owners));
  }
  v5 = _Block_copy(aBlock);
  v6 = *(NSObject **)(v19 + 88);
  *(_QWORD *)&v29 = 1;
  *((_QWORD *)&v29 + 1) = v6;
  if (v6)
    dispatch_retain(v6);
  *(_QWORD *)&v30[0] = 0;
  if (v5)
  {
    *((_QWORD *)&v30[0] + 1) = _Block_copy(v5);
    memset(&v30[1], 0, 24);
    _Block_release(v5);
  }
  else
  {
    memset((char *)v30 + 8, 0, 32);
  }
  *(_DWORD *)(v19 + 120) = 2;
  ctu::power::manager::get((ctu::power::manager *)v6);
  v20 = v29;
  if (*((_QWORD *)&v29 + 1))
    dispatch_retain(*((dispatch_object_t *)&v29 + 1));
  v7 = *(void **)&v30[0];
  if (*(_QWORD *)&v30[0])
    v7 = _Block_copy(*(const void **)&v30[0]);
  v21 = v7;
  v8 = (void *)*((_QWORD *)&v30[0] + 1);
  if (*((_QWORD *)&v30[0] + 1))
    v8 = _Block_copy(*((const void **)&v30[0] + 1));
  v22 = v8;
  if (SBYTE7(v30[2]) < 0)
    std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)&v30[1], *((std::string::size_type *)&v30[1] + 1));
  else
    v23 = *(std::string *)&v30[1];
  ctu::power::manager::registerListener();
  v9 = v25;
  v25 = 0uLL;
  v10 = *(std::__shared_weak_count **)(v19 + 112);
  *(_OWORD *)(v19 + 104) = v9;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
  if (*((_QWORD *)&v25 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ctu::power::manager::parameters::~parameters((void **)&v20);
  v16 = v24;
  if (v24)
  {
    v17 = (unint64_t *)&v24->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  ctu::power::manager::parameters::~parameters((void **)&v29);
  if (v28)
    std::__shared_weak_count::__release_weak(v28);
}

void sub_212CFA494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, dispatch_object_t object, void *a14, void *aBlock, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30)
{
  uint64_t v30;

  if (aBlock)
    _Block_release(aBlock);
  if (a14)
    _Block_release(a14);
  if (object)
    dispatch_release(object);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  ctu::power::manager::parameters::~parameters((void **)(v30 - 96));
  if (a30)
    std::__shared_weak_count::__release_weak(a30);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke_2(_QWORD *a1, int a2, uint64_t a3, const void **a4)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v9;
  void *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v6 = a1[4];
  v14 = 0;
  v15 = 0;
  v7 = (std::__shared_weak_count *)a1[6];
  if (!v7)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v9 = std::__shared_weak_count::lock(v7);
  v15 = v9;
  if (!v9 || (v14 = a1[5]) == 0)
  {
LABEL_7:
    (*((void (**)(void))*a4 + 2))();
    if (!v9)
      return;
    goto LABEL_12;
  }
  if (*a4)
    v10 = _Block_copy(*a4);
  else
    v10 = 0;
  v13 = v10;
  TelephonyXPC::ServerPowerObserver::handlePowerNotification_sync(v6, (uint64_t)&v13, a2);
  if (v10)
    _Block_release(v10);
LABEL_12:
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
}

void sub_212CFA624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  const void *v11;

  if (v11)
    _Block_release(v11);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void TelephonyXPC::ServerPowerObserver::handlePowerNotification_sync(uint64_t a1, uint64_t a2, int a3)
{
  char v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unsigned int v17;
  const void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  void *aBlock;
  __int128 block;
  __int128 v28;
  dispatch_group_t group[2];
  unint64_t v30;

  if (a3 <= -536870273)
  {
    if (a3 != -536870320 && a3 != -536870315)
    {
      if (a3 == -536870288)
      {
        *(_DWORD *)(a1 + 120) = 0;
LABEL_17:
        v6 = 4;
        v5 = 1;
        goto LABEL_19;
      }
LABEL_16:
      *(_DWORD *)(a1 + 120) = 2;
      goto LABEL_17;
    }
LABEL_12:
    v5 = 0;
    *(_DWORD *)(a1 + 120) = 2;
    v6 = 1;
    goto LABEL_19;
  }
  if (a3 > -536870129)
  {
    if (a3 == -536870112)
    {
      v5 = 0;
      *(_DWORD *)(a1 + 120) = 2;
      v6 = 3;
      goto LABEL_19;
    }
    if (a3 != -536870128)
      goto LABEL_16;
    goto LABEL_12;
  }
  if (a3 != -536870272)
  {
    if (a3 == -536870144)
    {
      v5 = 0;
      v6 = 0;
      *(_DWORD *)(a1 + 120) = 2;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  v5 = 0;
  if (*(_DWORD *)(a1 + 120))
    *(_DWORD *)(a1 + 120) = 1;
  v6 = 2;
LABEL_19:
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 8))(a1 + 8, 20))
  {
    v30 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v7;
    *(_OWORD *)group = v7;
    block = v7;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
    MEMORY[0x2199A48FC](&block, "Power Notification [");
    ctu::operator<<();
    v8 = ctu::operator<<();
    v9 = MEMORY[0x2199A48FC](v8, "]");
    MEMORY[0x2199A48FC](v9, " Event [");
    v10 = ctu::operator<<();
    v11 = MEMORY[0x2199A48FC](v10, "]");
    MEMORY[0x2199A48FC](v11, " PowerState [");
    v12 = ctu::operator<<();
    v13 = MEMORY[0x2199A48FC](v12, "]");
    MEMORY[0x2199A48FC](v13, " Forced Sleep [");
    v14 = ctu::operator<<();
    MEMORY[0x2199A48FC](v14, "]");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](&block);
  }
  if ((v5 & 1) == 0 && *(_QWORD *)(a1 + 128) && *(_QWORD *)(a1 + 136))
  {
    v15 = dispatch_group_create();
    v16 = v15;
    if (v15)
    {
      dispatch_retain(v15);
      dispatch_group_enter(v16);
      v17 = *(_DWORD *)(a1 + 120);
      dispatch_retain(v16);
      dispatch_group_enter(v16);
    }
    else
    {
      v17 = *(_DWORD *)(a1 + 120);
    }
    v18 = *(const void **)(a1 + 128);
    if (v18)
      v19 = _Block_copy(v18);
    else
      v19 = 0;
    v20 = *(NSObject **)(a1 + 136);
    v21 = MEMORY[0x24BDAC760];
    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 1174405120;
    *(_QWORD *)&v28 = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEclIJS3_S4_S5_EEEvDpT__block_invoke;
    *((_QWORD *)&v28 + 1) = &__block_descriptor_tmp_20;
    if (v19)
      v22 = _Block_copy(v19);
    else
      v22 = 0;
    v30 = __PAIR64__(v17, v6);
    group[0] = v22;
    group[1] = v16;
    if (v16)
    {
      dispatch_retain(v16);
      dispatch_group_enter(v16);
    }
    dispatch_async(v20, &block);
    if (group[1])
    {
      dispatch_group_leave(group[1]);
      if (group[1])
        dispatch_release(group[1]);
    }
    if (group[0])
      _Block_release(group[0]);
    if (v19)
      _Block_release(v19);
    if (v16)
    {
      dispatch_group_leave(v16);
      dispatch_release(v16);
    }
    v23 = *(NSObject **)(a1 + 88);
    v25[0] = v21;
    v25[1] = 1174405120;
    v25[2] = ___ZN12TelephonyXPC19ServerPowerObserver28handlePowerNotification_syncEN8dispatch5blockIU13block_pointerFvbEEEjb_block_invoke;
    v25[3] = &__block_descriptor_tmp_17;
    v25[4] = a1;
    v24 = *(void **)a2;
    if (*(_QWORD *)a2)
      v24 = _Block_copy(v24);
    aBlock = v24;
    dispatch_group_notify(v16, v23, v25);
    if (aBlock)
      _Block_release(aBlock);
    if (v16)
    {
      dispatch_group_leave(v16);
      dispatch_release(v16);
      dispatch_release(v16);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)a2 + 16))();
  }
}

uint64_t __copy_helper_block_e8_40c60_ZTSNSt3__18weak_ptrIN12TelephonyXPC19ServerPowerObserverEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c60_ZTSNSt3__18weak_ptrIN12TelephonyXPC19ServerPowerObserverEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t std::hex[abi:ne180100](uint64_t result)
{
  *(_DWORD *)(result + 8) = *(_DWORD *)(result + 8) & 0xFFFFFFB5 | 8;
  return result;
}

uint64_t ___ZN12TelephonyXPC19ServerPowerObserver28handlePowerNotification_syncEN8dispatch5blockIU13block_pointerFvbEEEjb_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[3];
  unint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v2 + 8));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 8))(v2 + 8, 20))
  {
    v6 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[1] = v3;
    v5[2] = v3;
    v5[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v5);
    MEMORY[0x2199A48FC](v5, "All clients acknowledged the power notification");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](v5);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "ServerPowerObserver");
  *(_DWORD *)(a1 + 20) = unk_212D069D4;
}

uint64_t ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

_QWORD *ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CEA0FE8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CEA0FE8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CEA0C30, MEMORY[0x24BEDAAF0]);
}

void sub_212CFAD68(_Unwind_Exception *a1)
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

void ctu::power::manager::parameters::~parameters(void **this)
{
  const void *v2;
  const void *v3;
  NSObject *v4;

  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  v2 = this[3];
  if (v2)
    _Block_release(v2);
  v3 = this[2];
  if (v3)
    _Block_release(v3);
  v4 = this[1];
  if (v4)
    dispatch_release(v4);
}

uint64_t std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](uint64_t a1)
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

uint64_t *std::shared_ptr<TelephonyXPC::ServerPowerObserver>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerPowerObserver,void>(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24CEA1028;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2)
    v5 = (_QWORD *)(a2 + 72);
  else
    v5 = 0;
  std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__enable_weak_this[abi:ne180100]<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver,void>((uint64_t)a1, v5, a2);
  return a1;
}

void sub_212CFAEB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__enable_weak_this[abi:ne180100]<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  if (a2)
  {
    v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4)
        std::__shared_weak_count::__release_weak(v4);
      if (v5)
      {
        v10 = (unint64_t *)&v5->__shared_owners_;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
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

_QWORD *ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::SharedSynchronizable(_QWORD *a1, uint64_t a2, dispatch_queue_attr_t attr, dispatch_object_t *a4)
{
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  v7 = *a4;
  if (*a4)
  {
    dispatch_retain(*a4);
    dispatch_retain(v7);
    v8 = dispatch_queue_create_with_target_V2(v6, attr, v7);
  }
  else
  {
    v8 = dispatch_queue_create(v6, attr);
  }
  v9 = v8;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v8;
  if (v8)
    dispatch_retain(v8);
  a1[3] = v7;
  if (v7)
    dispatch_retain(v7);
  if (v9)
    dispatch_release(v9);
  if (v7)
  {
    dispatch_release(v7);
    dispatch_release(v7);
  }
  return a1;
}

_QWORD *ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  _QWORD *v2;

  *a1 = off_24CEA0FE8;
  v2 = a1 + 9;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v2);
  return a1;
}

void ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  _QWORD *v2;

  *a1 = off_24CEA0FE8;
  v2 = a1 + 9;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v2);
  operator delete(a1);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEclIJS3_S4_S5_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_group_t group;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(unsigned int *)(a1 + 52);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, dispatch_group_t *))(v3 + 16))(v3, v1, v2, &group);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
}

void sub_212CFB234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c127_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    v6 = *(NSObject **)(a1 + 40);
    if (v6)
      dispatch_group_enter(v6);
  }
}

void __destroy_helper_block_e8_32c127_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
    _Block_release(v4);
}

void TelephonyXPC::Server::State::~State(TelephonyXPC::Server::State *this)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  *(_QWORD *)this = &off_24CEA11A8;
  *((_QWORD *)this + 9) = &unk_24CEA11E0;
  v2 = *((_QWORD *)this + 36);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*((dispatch_object_t *)this + 36));
    *((_QWORD *)this + 36) = 0;
  }
  std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*((_QWORD **)this + 41));
  std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(*((xpc_object_t **)this + 38));
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 272);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 256);
  v3 = *((_QWORD *)this + 31);
  if (v3)
    dispatch_release(v3);
  v4 = (const void *)*((_QWORD *)this + 30);
  if (v4)
    _Block_release(v4);
  xpc_release(*((xpc_object_t *)this + 27));
  *((_QWORD *)this + 27) = 0;
  if (*((char *)this + 215) < 0)
    operator delete(*((void **)this + 24));
  if (*((char *)this + 191) < 0)
    operator delete(*((void **)this + 21));
  if (*((char *)this + 167) < 0)
    operator delete(*((void **)this + 18));
  *((_QWORD *)this + 9) = off_24CEA12A0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::XpcServer::~XpcServer(this);
}

{
  void *v1;

  TelephonyXPC::Server::State::~State(this);
  operator delete(v1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void TelephonyXPC::Server::State::Parameters::~Parameters(xpc_object_t *this)
{
  xpc_release(this[9]);
  this[9] = 0;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void `non-virtual thunk to'TelephonyXPC::Server::State::~State(TelephonyXPC::Server::State *this)
{
  TelephonyXPC::Server::State::~State((TelephonyXPC::Server::State *)((char *)this - 72));
}

{
  void *v1;

  TelephonyXPC::Server::State::~State((TelephonyXPC::Server::State *)((char *)this - 72));
  operator delete(v1);
}

_QWORD *TelephonyXPC::Server::Server(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = off_24CEA1220;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = off_24CEA1220;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

void TelephonyXPC::Server::~Server(TelephonyXPC::Server *this)
{
  *(_QWORD *)this = off_24CEA1220;
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = off_24CEA1220;
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = off_24CEA1220;
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  operator delete(this);
}

void TelephonyXPC::Server::create(xpc_object_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  xpc_object_t value;
  xpc_object_t v14;
  uint64_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  int v23;
  size_t size;
  unint64_t v25;
  std::string *p_object;
  uint64_t v27;
  uint64_t v28;
  std::string *v29;
  std::string *v30;
  xpc_object_t v31;
  std::string::size_type v32;
  std::string::size_type v33;
  char *v34;
  unint64_t *v35;
  unint64_t v36;
  void *v37;
  std::string *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  std::__shared_weak_count *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t *p_shared_weak_owners;
  unint64_t v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject *v56;
  unint64_t *v57;
  unint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  void *aBlock;
  NSObject *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  char *v73;
  std::__shared_weak_count *v74;
  void *v75;
  std::string object;
  void *v77;
  char v78;
  void *__p;
  char v80;
  xpc_object_t v81;
  std::string v82;
  std::string v83;
  std::string v84;
  xpc_object_t xarray;
  unint64_t v86;
  _QWORD v87[2];
  xpc_object_t mach_service;
  dispatch_object_t v89[5];
  void *block[2];
  _QWORD *(*v91)(uint64_t);
  void *v92;
  char *v93;
  _QWORD *v94;

  v7 = *a1;
  if (*a1)
    xpc_retain(*a1);
  else
    v7 = xpc_null_create();
  v8 = (std::__shared_weak_count *)a2[1];
  v71 = *a2;
  v72 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = *(void **)a3;
  if (*(_QWORD *)a3)
    v11 = _Block_copy(v11);
  v12 = *(NSObject **)(a3 + 8);
  aBlock = v11;
  v70 = v12;
  if (v12)
    dispatch_retain(v12);
  v73 = 0;
  v74 = 0;
  if (MEMORY[0x2199A4C50](v7) != MEMORY[0x24BDACFA0])
    goto LABEL_12;
  v86 = 0xAAAAAAAAAAAAAAAALL;
  xarray = xpc_null_create();
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServiceXPCName");
  xpc::dyn_cast_or_default();
  v82 = object;
  *((_BYTE *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServiceNotificationName");
  xpc::dyn_cast_or_default();
  v83 = object;
  *((_BYTE *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServerHostName");
  xpc::dyn_cast_or_default();
  v84 = object;
  *((_BYTE *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(&object, v7, "ServerEnablePowerObserver");
  LOBYTE(v86) = xpc::dyn_cast_or_default();
  xpc_release(object.__r_.__value_.__l.__data_);
  xpc::dict::object_proxy::operator xpc::object(&object, v7, "ServerEnableSignalHandler");
  BYTE1(v86) = xpc::dyn_cast_or_default();
  xpc_release(object.__r_.__value_.__l.__data_);
  value = xpc_dictionary_get_value(v7, "ServiceXPCEntitlements");
  v14 = value;
  v15 = MEMORY[0x24BDACF78];
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    v14 = xpc_null_create();
    if (!v14)
    {
      v16 = xpc_null_create();
      v14 = 0;
      goto LABEL_20;
    }
  }
  if (MEMORY[0x2199A4C50](v14) == v15)
  {
    xpc_retain(v14);
    v16 = v14;
  }
  else
  {
    v16 = xpc_null_create();
  }
LABEL_20:
  xpc_release(v14);
  v17 = xpc_null_create();
  v18 = xarray;
  xarray = v16;
  xpc_release(v18);
  xpc_release(v17);
  if (MEMORY[0x2199A4C50](v16) == v15)
    goto LABEL_48;
  v19 = xpc_array_create(0, 0);
  if (v19 || (v19 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x2199A4C50](v19) == v15)
    {
      xpc_retain(v19);
      v20 = v19;
    }
    else
    {
      v20 = xpc_null_create();
    }
  }
  else
  {
    v20 = xpc_null_create();
    v19 = 0;
  }
  xpc_release(v19);
  v21 = xpc_null_create();
  v22 = xarray;
  xarray = v20;
  xpc_release(v22);
  xpc_release(v21);
  v23 = SHIBYTE(v82.__r_.__value_.__r.__words[2]);
  if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v82.__r_.__value_.__r.__words[2]);
  else
    size = v82.__r_.__value_.__l.__size_;
  v25 = size + 6;
  memset(&object, 170, sizeof(object));
  if (size + 6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v25 >= 0x17)
  {
    v27 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v25 | 7) != 0x17)
      v27 = v25 | 7;
    v28 = v27 + 1;
    p_object = (std::string *)operator new(v27 + 1);
    object.__r_.__value_.__l.__size_ = size + 6;
    object.__r_.__value_.__r.__words[2] = v28 | 0x8000000000000000;
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)p_object;
    goto LABEL_37;
  }
  memset(&object, 0, sizeof(object));
  p_object = &object;
  *((_BYTE *)&object.__r_.__value_.__s + 23) = size + 6;
  if (size)
  {
LABEL_37:
    if (v23 >= 0)
      v29 = &v82;
    else
      v29 = (std::string *)v82.__r_.__value_.__r.__words[0];
    memmove(p_object, v29, size);
  }
  strcpy((char *)p_object + size, ".allow");
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v30 = &object;
  else
    v30 = (std::string *)object.__r_.__value_.__r.__words[0];
  v31 = xpc_string_create((const char *)v30);
  if (!v31)
    v31 = xpc_null_create();
  xpc_array_append_value(xarray, v31);
  xpc_release(v31);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0)
    operator delete(object.__r_.__value_.__l.__data_);
LABEL_48:
  v32 = HIBYTE(v82.__r_.__value_.__r.__words[2]);
  if ((v82.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v32 = v82.__r_.__value_.__l.__size_;
  if (!v32)
    goto LABEL_59;
  v33 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
  if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v33 = v83.__r_.__value_.__l.__size_;
  if (!v33)
  {
LABEL_59:
    v34 = 0;
    goto LABEL_114;
  }
  v34 = (char *)operator new(0x158uLL);
  TelephonyXPC::Server::State::Parameters::Parameters(&object, (const TelephonyXPC::Server::State::Parameters *)&v82);
  if (v72)
  {
    v35 = (unint64_t *)&v72->__shared_owners_;
    do
      v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
  }
  if (aBlock)
    v37 = _Block_copy(aBlock);
  else
    v37 = 0;
  v75 = v37;
  if (v70)
    dispatch_retain(v70);
  std::string::basic_string[abi:ne180100]<0>(block, "Server");
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v38 = &object;
  else
    v38 = (std::string *)object.__r_.__value_.__r.__words[0];
  mach_service = xpc_connection_create_mach_service((const char *)v38, 0, 1uLL);
  if (!mach_service)
    mach_service = xpc_null_create();
  v89[0] = 0;
  ctu::XpcServer::XpcServer();
  if (v89[0])
    dispatch_release(v89[0]);
  xpc_release(mach_service);
  mach_service = 0;
  if (SHIBYTE(v91) < 0)
    operator delete(block[0]);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v87, "com.apple.telephony.xpc", "server");
  *((_QWORD *)v34 + 9) = off_24CEA12A0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)block);
  *((_QWORD *)v34 + 10) = &unk_24CEA10E0;
  *((_QWORD *)v34 + 16) = v71;
  *((_QWORD *)v34 + 17) = v72;
  if (v72)
  {
    v39 = (unint64_t *)&v72->__shared_owners_;
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v89);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v87);
  *(_QWORD *)v34 = &off_24CEA11A8;
  *((_QWORD *)v34 + 9) = &unk_24CEA11E0;
  TelephonyXPC::Server::State::Parameters::Parameters((std::string *)v34 + 6, (const TelephonyXPC::Server::State::Parameters *)&object);
  *((_DWORD *)v34 + 58) = 0;
  if (v37)
    v41 = _Block_copy(v37);
  else
    v41 = 0;
  *((_QWORD *)v34 + 30) = v41;
  *((_QWORD *)v34 + 31) = v70;
  if (v70)
    dispatch_retain(v70);
  *((_QWORD *)v34 + 32) = v71;
  *((_QWORD *)v34 + 33) = v72;
  if (v72)
  {
    v42 = (unint64_t *)&v72->__shared_owners_;
    do
      v43 = __ldxr(v42);
    while (__stxr(v43 + 1, v42));
  }
  *((_QWORD *)v34 + 38) = 0;
  *((_QWORD *)v34 + 39) = 0;
  *((_QWORD *)v34 + 34) = 0;
  *((_QWORD *)v34 + 35) = 0;
  *((_QWORD *)v34 + 36) = 0;
  *((_QWORD *)v34 + 37) = v34 + 304;
  *((_QWORD *)v34 + 41) = 0;
  *((_QWORD *)v34 + 42) = 0;
  *((_QWORD *)v34 + 40) = v34 + 328;
  ctu::LoggerCommonBase::setLogLevel();
  v44 = (std::__shared_weak_count *)operator new(0x20uLL);
  v44->__shared_owners_ = 0;
  v45 = (unint64_t *)&v44->__shared_owners_;
  v44->__vftable = (std::__shared_weak_count_vtbl *)off_24CEA12E0;
  v44->__shared_weak_owners_ = 0;
  v44[1].__vftable = (std::__shared_weak_count_vtbl *)v34;
  v46 = (std::__shared_weak_count *)*((_QWORD *)v34 + 2);
  if (!v46)
  {
    do
      v50 = __ldxr(v45);
    while (__stxr(v50 + 1, v45));
    p_shared_weak_owners = (unint64_t *)&v44->__shared_weak_owners_;
    do
      v52 = __ldxr(p_shared_weak_owners);
    while (__stxr(v52 + 1, p_shared_weak_owners));
    *((_QWORD *)v34 + 1) = v34;
    *((_QWORD *)v34 + 2) = v44;
    do
LABEL_93:
      v53 = __ldaxr(v45);
    while (__stlxr(v53 - 1, v45));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
    goto LABEL_96;
  }
  if (v46->__shared_owners_ == -1)
  {
    do
      v47 = __ldxr(v45);
    while (__stxr(v47 + 1, v45));
    v48 = (unint64_t *)&v44->__shared_weak_owners_;
    do
      v49 = __ldxr(v48);
    while (__stxr(v49 + 1, v48));
    *((_QWORD *)v34 + 1) = v34;
    *((_QWORD *)v34 + 2) = v44;
    std::__shared_weak_count::__release_weak(v46);
    goto LABEL_93;
  }
LABEL_96:
  v73 = v34;
  v74 = v44;
  if (v70)
    dispatch_release(v70);
  if (v75)
    _Block_release(v75);
  if (v72)
  {
    v54 = (unint64_t *)&v72->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
  xpc_release(v81);
  v81 = 0;
  if (v80 < 0)
    operator delete(__p);
  if (v78 < 0)
    operator delete(v77);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0)
    operator delete(object.__r_.__value_.__l.__data_);
  v89[0] = (dispatch_object_t)MEMORY[0x24BDAC760];
  v89[1] = (dispatch_object_t)0x40000000;
  v89[2] = (dispatch_object_t)___ZN12TelephonyXPC6Server5State4initEv_block_invoke;
  v89[3] = (dispatch_object_t)&__block_descriptor_tmp_23;
  v89[4] = (dispatch_object_t)v34;
  block[0] = (void *)MEMORY[0x24BDAC760];
  v87[0] = v89;
  block[1] = (void *)0x40000000;
  v91 = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v92 = &__block_descriptor_tmp_24;
  v93 = v34 + 8;
  v94 = v87;
  v56 = *((_QWORD *)v34 + 3);
  if (*((_QWORD *)v34 + 4))
    dispatch_async_and_wait(v56, block);
  else
    dispatch_sync(v56, block);
LABEL_114:
  xpc_release(xarray);
  if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v84.__r_.__value_.__l.__data_);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v82.__r_.__value_.__l.__data_);
  if (!v34)
LABEL_12:
    syslog(3, "Could not create TelephonyXPCServer, verify parameters\n");
  if (v70)
    dispatch_release(v70);
  if (aBlock)
    _Block_release(aBlock);
  if (v72)
  {
    v57 = (unint64_t *)&v72->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
  xpc_release(v7);
  v59 = operator new(0x18uLL);
  v60 = v59;
  if (v74)
  {
    v61 = (unint64_t *)&v74->__shared_owners_;
    do
      v62 = __ldxr(v61);
    while (__stxr(v62 + 1, v61));
    *v59 = off_24CEA1220;
    v59[1] = v73;
    v59[2] = v74;
    do
      v63 = __ldxr(v61);
    while (__stxr(v63 + 1, v61));
  }
  else
  {
    *v59 = off_24CEA1220;
    v59[1] = v73;
    v59[2] = 0;
  }
  *a4 = v59;
  v64 = operator new(0x20uLL);
  *v64 = off_24CEA16F8;
  v64[1] = 0;
  v64[2] = 0;
  v64[3] = v60;
  a4[1] = v64;
  if (v74)
  {
    v65 = (unint64_t *)&v74->__shared_owners_;
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  if (v74)
  {
    v67 = (unint64_t *)&v74->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
}

void sub_212CFBFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,xpc_object_t object,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,xpc_object_t a36)
{
  void *v36;
  uint64_t v37;

  (*(void (**)(uint64_t))(*(_QWORD *)v37 + 32))(v37);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback((uint64_t)&a18);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  TelephonyXPC::Server::State::Parameters::~Parameters(&object);
  TelephonyXPC::Server::State::Parameters::~Parameters(&a36);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback((uint64_t)&a12);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  xpc_release(v36);
  _Unwind_Resume(a1);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

uint64_t TelephonyXPC::Server::start(TelephonyXPC::Server *this)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *((_QWORD *)this + 1);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ZN12TelephonyXPC6Server5State5startEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_28;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_24;
  block[4] = v1 + 8;
  block[5] = &v5;
  v2 = *(NSObject **)(v1 + 24);
  if (*(_QWORD *)(v1 + 32))
    dispatch_async_and_wait(v2, block);
  else
    dispatch_sync(v2, block);
  return *(unsigned int *)(v1 + 232);
}

void TelephonyXPC::Server::broadcastEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[2];
  std::string v8;

  v4 = *(_QWORD *)(a1 + 8);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v8 = *(std::string *)a2;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(*(const void **)a3);
  else
    v5 = 0;
  v6 = *(NSObject **)(a3 + 8);
  v7[0] = v5;
  v7[1] = v6;
  if (v6)
    dispatch_retain(v6);
  TelephonyXPC::Server::State::broadcast(v4, (uint64_t)&v8, (uint64_t)v7);
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_212CFC40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Server::State::broadcast(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[2];
  std::string v9;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v9 = *(std::string *)a2;
  v5 = xpc_null_create();
  if (*(_QWORD *)a3)
    v6 = _Block_copy(*(const void **)a3);
  else
    v6 = 0;
  v7 = *(NSObject **)(a3 + 8);
  v8[0] = v6;
  v8[1] = v7;
  if (v7)
    dispatch_retain(v7);
  TelephonyXPC::Server::State::broadcast(a1, (uint64_t)&v9, v5, (uint64_t)v8);
  if (v7)
    dispatch_release(v7);
  if (v6)
    _Block_release(v6);
  xpc_release(v5);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_212CFC510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a9);
  xpc_release(v16);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(void)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void TelephonyXPC::Server::broadcastEvent(uint64_t a1, uint64_t a2, xpc_object_t *a3, uint64_t a4)
{
  uint64_t v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[2];
  std::string v11;

  v6 = *(_QWORD *)(a1 + 8);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v11 = *(std::string *)a2;
  v7 = *a3;
  if (v7)
    xpc_retain(v7);
  else
    v7 = xpc_null_create();
  if (*(_QWORD *)a4)
    v8 = _Block_copy(*(const void **)a4);
  else
    v8 = 0;
  v9 = *(NSObject **)(a4 + 8);
  v10[0] = v8;
  v10[1] = v9;
  if (v9)
    dispatch_retain(v9);
  TelephonyXPC::Server::State::broadcast(v6, (uint64_t)&v11, v7, (uint64_t)v10);
  if (v9)
    dispatch_release(v9);
  if (v8)
    _Block_release(v8);
  xpc_release(v7);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

void sub_212CFC678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a9);
  xpc_release(v16);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Server::State::broadcast(uint64_t a1, uint64_t a2, xpc_object_t object, uint64_t a4)
{
  void *v7;
  uint64_t *v8;
  NSObject *v9;
  _QWORD v10[5];
  xpc_object_t v11;
  std::string __p;
  void *aBlock;
  dispatch_object_t objecta;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_38;
  v10[4] = a1;
  v11 = object;
  if (object)
    xpc_retain(object);
  else
    v11 = xpc_null_create();
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  v7 = *(void **)a4;
  if (*(_QWORD *)a4)
    v7 = _Block_copy(v7);
  v8 = (uint64_t *)(a1 + 8);
  v9 = *(NSObject **)(a4 + 8);
  aBlock = v7;
  objecta = v9;
  if (v9)
    dispatch_retain(v9);
  ctu::SharedSynchronizable<ctu::XpcServer>::execute_wrapped(v8, (uint64_t)v10);
  if (objecta)
    dispatch_release(objecta);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  xpc_release(v11);
}

void sub_212CFC7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t TelephonyXPC::Server::setCommandHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  std::string v11;
  _QWORD v12[5];
  std::string __p;
  void *aBlock;
  dispatch_object_t object;
  _QWORD *v16;
  _QWORD block[6];

  v4 = *(_QWORD *)(a1 + 8);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v11 = *(std::string *)a2;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(*(const void **)a3);
  else
    v5 = 0;
  v6 = *(NSObject **)(a3 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1174405120;
  v12[2] = ___ZN12TelephonyXPC6Server5State17setCommandHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS_17ServerClientStateEN3xpc4dictENSA_IU13block_pointerFviSD_EEEEEE_block_invoke;
  v12[3] = &__block_descriptor_tmp_42;
  v12[4] = v4;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    __p = v11;
  if (v5)
    v8 = _Block_copy(v5);
  else
    v8 = 0;
  aBlock = v8;
  object = v6;
  if (v6)
    dispatch_retain(v6);
  v16 = v12;
  block[0] = v7;
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_24;
  block[4] = v4 + 8;
  block[5] = &v16;
  v9 = *(NSObject **)(v4 + 24);
  if (*(_QWORD *)(v4 + 32))
    dispatch_async_and_wait(v9, block);
  else
    dispatch_sync(v9, block);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  return 0;
}

void sub_212CFC98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

_QWORD *TelephonyXPC::Server::statusToString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 3)
    v2 = "Unknown";
  else
    v2 = off_24CEA1798[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

const char *TelephonyXPC::Server::asString(unsigned int a1)
{
  if (a1 > 3)
    return "Unknown";
  else
    return off_24CEA1798[a1];
}

void TelephonyXPC::Server::State::handleServerError_sync(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  char *v5;
  void **v6;
  char *v7;
  const char *v8;
  uint8_t *v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14[2];
  char v15;
  void *__p[4];
  void *aBlock;
  int v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (char *)MEMORY[0x2199A4C08](*a2);
    memset(__p, 170, 24);
    std::string::basic_string[abi:ne180100]<0>(__p, v5);
    free(v5);
    v6 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_212CF9000, v4, OS_LOG_TYPE_DEFAULT, "#I Server error: %s", buf, 0xCu);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 40))
  {
    v7 = (char *)MEMORY[0x2199A4C08](*a2);
    memset(buf, 170, sizeof(buf));
    std::string::basic_string[abi:ne180100]<0>(buf, v7);
    free(v7);
    v9 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
    ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Server error: %s", v8, v9);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](__p);
    if ((char)buf[23] < 0)
      operator delete(*(void **)buf);
  }
  *(_DWORD *)(a1 + 232) = 3;
  v10 = *(const void **)(a1 + 240);
  if (v10)
    v11 = _Block_copy(v10);
  else
    v11 = 0;
  v12 = *(NSObject **)(a1 + 248);
  __p[0] = (void *)MEMORY[0x24BDAC760];
  __p[1] = (void *)1174405120;
  __p[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
  __p[3] = &__block_descriptor_tmp_27;
  if (v11)
    v13 = _Block_copy(v11);
  else
    v13 = 0;
  aBlock = v13;
  v18 = 3;
  dispatch_async(v12, __p);
  if (aBlock)
    _Block_release(aBlock);
  if (v11)
    _Block_release(v11);
  std::string::basic_string[abi:ne180100]<0>(v14, "ServerStateError");
  TelephonyXPC::Server::State::broadcastServerState(a1, (const char *)v14);
  if (v15 < 0)
    operator delete(v14[0]);
}

void TelephonyXPC::Server::State::handleNewClient_sync(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, void **a3@<X8>)
{
  _xpc_connection_s *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  char v10;
  pid_t pid;
  __int128 v12;
  void *v13;
  uint64_t v14;
  xpc_object_t v15;
  void **v16;
  char v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void *v20;
  xpc_object_t v21;
  size_t v22;
  NSObject *v23;
  const char *v24;
  xpc_object_t v25;
  uint64_t *v26;
  uint64_t **v27;
  unint64_t v28;
  uint64_t **v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  xpc_object_t value;
  void *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  void **v41;
  char *v42;
  uint64_t v43;
  void **v44;
  xpc_object_t v45;
  _QWORD aBlock[5];
  uint64_t v47[3];
  char **v48;
  char *v49[2];
  void *v50[3];
  xpc_object_t v51;
  uint64_t v52;
  xpc_object_t object;
  size_t index;
  void *__p[2];
  char v56;
  uint8_t buf[16];
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v49[0] = 0;
  v49[1] = 0;
  v48 = v49;
  v6 = (_xpc_connection_s *)*a2;
  if (*a2)
    xpc_retain(*a2);
  else
    v6 = (_xpc_connection_s *)xpc_null_create();
  if (MEMORY[0x2199A4C50](v6) != MEMORY[0x24BDACF88])
    goto LABEL_5;
  pid = xpc_connection_get_pid(v6);
  if (getpid() == pid)
    goto LABEL_41;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v12;
  v58 = v12;
  xpc_connection_get_audit_token();
  v13 = (void *)xpc_copy_entitlement_for_token();
  v14 = MEMORY[0x24BDACFA0];
  if (v13 || (v13 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x2199A4C50](v13) == v14)
    {
      xpc_retain(v13);
      v15 = v13;
    }
    else
    {
      v15 = xpc_null_create();
    }
  }
  else
  {
    v15 = xpc_null_create();
    v13 = 0;
  }
  xpc_release(v13);
  if (MEMORY[0x2199A4C50](v15) == v14)
  {
    v18 = *(xpc_object_t *)(a1 + 216);
    if (v18)
      xpc_retain(*(xpc_object_t *)(a1 + 216));
    else
      v18 = xpc_null_create();
    xpc::array::iterator::iterator(&object, v18, 0);
    xpc_release(v18);
    v19 = *(xpc_object_t *)(a1 + 216);
    if (v19)
      xpc_retain(*(xpc_object_t *)(a1 + 216));
    else
      v19 = xpc_null_create();
    v20 = MEMORY[0x2199A4C50](*(_QWORD *)(a1 + 216)) == MEMORY[0x24BDACF78]
        ? (void *)xpc_array_get_count(*(xpc_object_t *)(a1 + 216))
        : 0;
    xpc::array::iterator::iterator(&v51, v19, v20);
    xpc_release(v19);
    v21 = object;
    v22 = index;
    if (index == v52 && object == v51)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      do
      {
        memset(v50, 170, sizeof(v50));
        value = xpc_array_get_value(v21, v22);
        __p[0] = value;
        if (value)
          xpc_retain(value);
        else
          __p[0] = xpc_null_create();
        xpc::dyn_cast_or_default();
        xpc_release(__p[0]);
        v37 = (void *)HIBYTE(v50[2]);
        v38 = SHIBYTE(v50[2]);
        if (SHIBYTE(v50[2]) < 0)
          v37 = v50[1];
        if (v37)
        {
          v39 = *(NSObject **)(a1 + 112);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v44 = (void **)v50[0];
            if (v38 >= 0)
              v44 = v50;
            LODWORD(__p[0]) = 136315138;
            *(void **)((char *)__p + 4) = v44;
            _os_log_debug_impl(&dword_212CF9000, v39, OS_LOG_TYPE_DEBUG, "#D Searching for entitlement: %s", (uint8_t *)__p, 0xCu);
          }
          if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
          {
            v41 = v50;
            if (SHIBYTE(v50[2]) < 0)
              v41 = (void **)v50[0];
            ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Searching for entitlement: %s", v40, v41);
            ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
            MEMORY[0x2199A486C](__p);
          }
          __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
          if (SHIBYTE(v50[2]) >= 0)
            v42 = (char *)v50;
          else
            v42 = (char *)v50[0];
          xpc::dict::object_proxy::operator xpc::object(__p, v15, v42);
          if (MEMORY[0x2199A4C50](__p[0]) != MEMORY[0x24BDACFE0])
          {
            v43 = MEMORY[0x2199A4C50](__p[0]);
            if (v43 == MEMORY[0x24BDACF80])
            {
              v17 = xpc::dyn_cast_or_default();
              std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v48, v50, (uint64_t)v50);
            }
            else if (v43 == MEMORY[0x24BDACF78])
            {
              std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v48, v50, (uint64_t)v50);
              v17 = 1;
            }
          }
          xpc_release(__p[0]);
          LOBYTE(v38) = HIBYTE(v50[2]);
        }
        if ((v38 & 0x80) != 0)
          operator delete(v50[0]);
        v21 = object;
        v22 = index + 1;
        index = v22;
      }
      while (v22 != v52 || object != v51);
    }
    xpc_release(v21);
    xpc_release(object);
  }
  else
  {
    v17 = 0;
  }
  xpc_release(v15);
  if ((v17 & 1) != 0)
  {
LABEL_41:
    v10 = 1;
  }
  else
  {
LABEL_5:
    v7 = *(NSObject **)(a1 + 112);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      xpc::connection::to_debug_string((xpc::connection *)__p, (uint64_t)v6);
      v16 = v56 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_212CF9000, v7, OS_LOG_TYPE_ERROR, "Connection not allowed:\n %s", buf, 0xCu);
      if (v56 < 0)
        operator delete(__p[0]);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 80))
    {
      xpc::connection::to_debug_string((xpc::connection *)buf, (uint64_t)v6);
      v9 = (SBYTE7(v58) & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Connection not allowed:\n %s", v8, v9);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](__p);
      if (SBYTE7(v58) < 0)
        operator delete(*(void **)buf);
    }
    v10 = 0;
  }
  xpc_release(v6);
  if ((v10 & 1) != 0)
  {
    memset(buf, 170, sizeof(buf));
    xpc::connection::to_debug_string((xpc::connection *)__p, (uint64_t)*a2);
    TelephonyXPC::ServerClientState::ServerClientState(buf, (__int128 *)__p);
    if (v56 < 0)
      operator delete(__p[0]);
    std::set<std::string>::set[abi:ne180100](v47, (uint64_t)&v48);
    TelephonyXPC::ServerClientState::setClientEntitlements((uint64_t *)buf, (uint64_t)v47);
    std::__tree<std::string>::destroy((uint64_t)v47, (char *)v47[1]);
    v23 = *(NSObject **)(a1 + 112);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v45 = *a2;
      LODWORD(__p[0]) = 134217984;
      *(void **)((char *)__p + 4) = v45;
      _os_log_debug_impl(&dword_212CF9000, v23, OS_LOG_TYPE_DEBUG, "#D New client %p", (uint8_t *)__p, 0xCu);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
    {
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"New client %p", v24, *a2);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](__p);
    }
    v25 = *a2;
    v26 = *(uint64_t **)(a1 + 304);
    if (v26)
    {
      while (1)
      {
        while (1)
        {
          v27 = (uint64_t **)v26;
          v28 = v26[4];
          if (v28 <= (unint64_t)v25)
            break;
          v26 = *v27;
          v29 = v27;
          if (!*v27)
            goto LABEL_58;
        }
        if (v28 >= (unint64_t)v25)
          break;
        v26 = v27[1];
        if (!v26)
        {
          v29 = v27 + 1;
          goto LABEL_58;
        }
      }
      v30 = (uint64_t *)v27;
    }
    else
    {
      v29 = (uint64_t **)(a1 + 304);
      v27 = (uint64_t **)(a1 + 304);
LABEL_58:
      v30 = (uint64_t *)operator new(0x38uLL);
      v30[4] = (uint64_t)v25;
      if (v25)
        xpc_retain(v25);
      else
        v30[4] = (uint64_t)xpc_null_create();
      v30[5] = 0;
      v30[6] = 0;
      *v30 = 0;
      v30[1] = 0;
      v30[2] = (uint64_t)v27;
      *v29 = v30;
      v31 = **(_QWORD **)(a1 + 296);
      v32 = v30;
      if (v31)
      {
        *(_QWORD *)(a1 + 296) = v31;
        v32 = *v29;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(a1 + 304), v32);
      ++*(_QWORD *)(a1 + 312);
    }
    std::shared_ptr<TelephonyXPC::ServerClientState::State>::operator=[abi:ne180100](v30 + 5, *(uint64_t *)buf, *(uint64_t *)&buf[8]);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State20handleNewClient_syncEN3xpc10connectionE_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_46;
    aBlock[4] = a1;
    *a3 = _Block_copy(aBlock);
    v33 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v34 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
  }
  else
  {
    *a3 = 0;
  }
  std::__tree<std::string>::destroy((uint64_t)&v48, v49[0]);
}

void sub_212CFD48C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,xpc_object_t a32,uint64_t a33,xpc_object_t object,uint64_t a35,xpc_object_t a36,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void TelephonyXPC::Server::State::handleClientError_sync(uint64_t a1, xpc_object_t *a2, xpc::object *a3)
{
  xpc_object_t v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (***v14)(_QWORD, uint64_t);
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  void **v18;
  const char *v19;
  void **v20;
  std::string *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  void **v25;
  uint64_t *v26;
  xpc_object_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  BOOL v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  unsigned int (***v35)(_QWORD, uint64_t);
  NSObject *v36;
  const char *v37;
  void **v38;
  const char *v39;
  void **v40;
  _QWORD *v41;
  BOOL v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  void **v46;
  void **v47;
  std::string *v48;
  void **v49;
  void **v50;
  void *__p[4];
  unint64_t v52;
  unint64_t v53;
  std::string v54;
  std::string v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v52 = 0xAAAAAAAAAAAAAAAALL;
  v53 = 0xAAAAAAAAAAAAAAAALL;
  v6 = *a2;
  if (*a2)
    xpc_retain(*a2);
  else
    v6 = xpc_null_create();
  TelephonyXPC::Server::State::getClientState_sync(&v52, a1, (unint64_t)v6);
  xpc_release(v6);
  if (!v52)
    goto LABEL_63;
  memset(__p, 170, 24);
  if (*(char *)(v52 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v55, *(const std::string::value_type **)v52, *(_QWORD *)(v52 + 8));
  }
  else
  {
    v7 = *(_OWORD *)v52;
    v55.__r_.__value_.__r.__words[2] = *(_QWORD *)(v52 + 16);
    *(_OWORD *)&v55.__r_.__value_.__l.__data_ = v7;
  }
  v8 = std::string::insert(&v55, 0, "Client '", 8uLL);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v54.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v54, "' ", 2uLL);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  __p[2] = (void *)v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v54.__r_.__value_.__l.__data_);
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v55.__r_.__value_.__l.__data_);
  v12 = *(_QWORD *)a3;
  if (*(_QWORD *)a3 != MEMORY[0x24BDACF38])
  {
    if (v12 == MEMORY[0x24BDACF30])
    {
      v35 = (unsigned int (***)(_QWORD, uint64_t))(a1 + 80);
      v36 = *(NSObject **)(a1 + 112);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v49 = __p;
        if (SHIBYTE(__p[2]) < 0)
          v49 = (void **)__p[0];
        LODWORD(v54.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v54.__r_.__value_.__r.__words + 4) = (std::string::size_type)v49;
        _os_log_debug_impl(&dword_212CF9000, v36, OS_LOG_TYPE_DEBUG, "#D %s connection interrupted", (uint8_t *)&v54, 0xCu);
      }
      if (!(**v35)(v35, 20))
        goto LABEL_61;
      v38 = __p;
      if (SHIBYTE(__p[2]) < 0)
        v38 = (void **)__p[0];
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s connection interrupted", v37, v38);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    }
    else
    {
      v13 = MEMORY[0x24BDACF48];
      v14 = (unsigned int (***)(_QWORD, uint64_t))(a1 + 80);
      v15 = *(NSObject **)(a1 + 112);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v12 != v13)
      {
        if (v16)
        {
          xpc::object::to_string(a3);
          v47 = __p;
          if (SHIBYTE(__p[2]) < 0)
            v47 = (void **)__p[0];
          if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v48 = &v54;
          else
            v48 = (std::string *)v54.__r_.__value_.__r.__words[0];
          LODWORD(v55.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 4) = (std::string::size_type)v47;
          WORD2(v55.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v55.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v48;
          _os_log_debug_impl(&dword_212CF9000, v15, OS_LOG_TYPE_DEBUG, "#D %s %s", (uint8_t *)&v55, 0x16u);
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v54.__r_.__value_.__l.__data_);
        }
        if (!(**v14)(v14, 20))
          goto LABEL_61;
        v17 = SHIBYTE(__p[2]);
        v18 = (void **)__p[0];
        xpc::object::to_string(a3);
        v20 = __p;
        if (v17 < 0)
          v20 = v18;
        v21 = (v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v55
            : (std::string *)v55.__r_.__value_.__r.__words[0];
        ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s %s", v19, v20, v21);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x2199A486C](&v54);
        if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_61;
        v22 = (void *)v55.__r_.__value_.__r.__words[0];
        goto LABEL_60;
      }
      if (v16)
      {
        v50 = __p;
        if (SHIBYTE(__p[2]) < 0)
          v50 = (void **)__p[0];
        LODWORD(v54.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v54.__r_.__value_.__r.__words + 4) = (std::string::size_type)v50;
        _os_log_debug_impl(&dword_212CF9000, v15, OS_LOG_TYPE_DEBUG, "#D %s will be terminated", (uint8_t *)&v54, 0xCu);
      }
      if (!(**v14)(v14, 20))
        goto LABEL_61;
      v40 = __p;
      if (SHIBYTE(__p[2]) < 0)
        v40 = (void **)__p[0];
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s will be terminated", v39, v40);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    }
    MEMORY[0x2199A486C](&v54);
    goto LABEL_61;
  }
  v23 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v46 = __p;
    if (SHIBYTE(__p[2]) < 0)
      v46 = (void **)__p[0];
    LODWORD(v54.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v54.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
    _os_log_debug_impl(&dword_212CF9000, v23, OS_LOG_TYPE_DEBUG, "#D %s disappeared", (uint8_t *)&v54, 0xCu);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
  {
    v25 = __p;
    if (SHIBYTE(__p[2]) < 0)
      v25 = (void **)__p[0];
    ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s disappeared", v24, v25);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](&v54);
  }
  v26 = *(uint64_t **)(a1 + 304);
  if (!v26)
    goto LABEL_61;
  v27 = *a2;
  v28 = a1 + 304;
  v29 = *(_QWORD **)(a1 + 304);
  do
  {
    v30 = v29[4];
    v31 = v30 >= (unint64_t)v27;
    if (v30 >= (unint64_t)v27)
      v32 = v29;
    else
      v32 = v29 + 1;
    if (v31)
      v28 = (uint64_t)v29;
    v29 = (_QWORD *)*v32;
  }
  while (*v32);
  if (v28 == a1 + 304 || *(_QWORD *)(v28 + 32) > (unint64_t)v27)
    goto LABEL_61;
  v33 = *(_QWORD **)(v28 + 8);
  if (v33)
  {
    do
    {
      v34 = v33;
      v33 = (_QWORD *)*v33;
    }
    while (v33);
  }
  else
  {
    v41 = (_QWORD *)v28;
    do
    {
      v34 = (_QWORD *)v41[2];
      v42 = *v34 == (_QWORD)v41;
      v41 = v34;
    }
    while (!v42);
  }
  if (*(_QWORD *)(a1 + 296) == v28)
    *(_QWORD *)(a1 + 296) = v34;
  --*(_QWORD *)(a1 + 312);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v26, (uint64_t *)v28);
  std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>((xpc_object_t *)(v28 + 32));
  v22 = (void *)v28;
LABEL_60:
  operator delete(v22);
LABEL_61:
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
LABEL_63:
  v43 = (std::__shared_weak_count *)v53;
  if (v53)
  {
    v44 = (unint64_t *)(v53 + 8);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
}

void sub_212CFDC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  MEMORY[0x2199A486C](&a20);
  if (a16 < 0)
    operator delete(__p);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 - 9) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(a1 - 32), *(_QWORD *)(a1 - 24));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 - 32);
    a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 - 16);
  }
}

uint64_t ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CEA12A0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CEA12A0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

xpc_object_t xpc::dict::object_proxy::operator xpc::object(_QWORD *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_dictionary_get_value(xdict, key);
  *a1 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a1 = result;
  return result;
}

std::string *TelephonyXPC::Server::State::Parameters::Parameters(std::string *this, const TelephonyXPC::Server::State::Parameters *a2)
{
  __int128 v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;
  void *v8;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  v6 = this + 2;
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  }
  else
  {
    v7 = *((_OWORD *)a2 + 3);
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 8);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  v8 = (void *)*((_QWORD *)a2 + 9);
  this[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
  if (v8)
    xpc_retain(v8);
  else
    this[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  LOWORD(this[3].__r_.__value_.__r.__words[1]) = *((_WORD *)a2 + 40);
  return this;
}

void sub_212CFDE88(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void xpc::connection::~connection(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 32))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30[8];
  _QWORD aBlock[5];
  void *v32;
  dispatch_object_t object;
  uint64_t v34;
  std::__shared_weak_count *v35;
  _QWORD handler[6];
  std::__shared_weak_count *v37;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(v1 + 225))
  {
    *(_QWORD *)(v1 + 288) = dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, *(dispatch_queue_t *)(v1 + 24));
    v3 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v3 || (v4 = *(_QWORD *)(v1 + 8), (v5 = std::__shared_weak_count::lock(v3)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v6 = v5;
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v6);
    }
    v11 = *(NSObject **)(v1 + 288);
    handler[0] = v2;
    handler[1] = 1174405120;
    handler[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v1;
    handler[5] = v4;
    v37 = v6;
    do
      v12 = __ldxr(p_shared_weak_owners);
    while (__stxr(v12 + 1, p_shared_weak_owners));
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate(*(dispatch_object_t *)(v1 + 288));
    signal(15, (void (__cdecl *)(int))1);
    if (v37)
      std::__shared_weak_count::__release_weak(v37);
    std::__shared_weak_count::__release_weak(v6);
  }
  if (*(_BYTE *)(v1 + 224))
  {
    v13 = *(std::__shared_weak_count **)(v1 + 264);
    v34 = *(_QWORD *)(v1 + 256);
    v35 = v13;
    if (v13)
    {
      v14 = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    aBlock[0] = v2;
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_15;
    aBlock[3] = &__block_descriptor_tmp_21;
    aBlock[4] = v1;
    v16 = _Block_copy(aBlock);
    v17 = *(NSObject **)(v1 + 24);
    if (v17)
      dispatch_retain(*(dispatch_object_t *)(v1 + 24));
    v32 = v16;
    object = v17;
    TelephonyXPC::ServerPowerObserver::create(&v34, (uint64_t)&v32, v30);
    v18 = *(_OWORD *)v30;
    *(_OWORD *)v30 = 0uLL;
    v19 = *(std::__shared_weak_count **)(v1 + 280);
    *(_OWORD *)(v1 + 272) = v18;
    if (v19)
    {
      v20 = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = (std::__shared_weak_count *)v30[1];
    if (v30[1])
    {
      v23 = (unint64_t *)(v30[1] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (object)
      dispatch_release(object);
    if (v32)
      _Block_release(v32);
    v25 = v35;
    if (v35)
    {
      v26 = (unint64_t *)&v35->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v28 = *(NSObject **)(v1 + 112);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v30[0]) = 0;
      _os_log_debug_impl(&dword_212CF9000, v28, OS_LOG_TYPE_DEBUG, "#D Server power observer enabled", (uint8_t *)v30, 2u);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Server power observer enabled", v29);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](v30);
    }
  }
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_2(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  const char *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD v21[2];
  void *__p[2];
  char v23;
  uint8_t buf[8];
  uint64_t v25;
  void (*v26)(_QWORD *);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        v6 = *(NSObject **)(v3 + 112);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212CF9000, v6, OS_LOG_TYPE_DEFAULT, "#I SIGTERM received", buf, 2u);
        }
        if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
        {
          ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"SIGTERM received", v7);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x2199A486C](buf);
        }
        v8 = *(std::__shared_weak_count **)(v3 + 16);
        if (!v8 || (v9 = *(_QWORD *)(v3 + 8), (v10 = std::__shared_weak_count::lock(v8)) == 0))
          std::__throw_bad_weak_ptr[abi:ne180100]();
        v11 = v10;
        p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
        do
          v13 = __ldxr(p_shared_weak_owners);
        while (__stxr(v13 + 1, p_shared_weak_owners));
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v11);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "EventServerSIGTERM");
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        v25 = 1174405120;
        v26 = ___ZN12TelephonyXPC6Server5State13handleSIGTERMEv_block_invoke;
        v27 = &__block_descriptor_tmp_26;
        v28 = v3;
        v29 = v9;
        v30 = v11;
        do
          v16 = __ldxr(p_shared_weak_owners);
        while (__stxr(v16 + 1, p_shared_weak_owners));
        v17 = _Block_copy(buf);
        v18 = *(NSObject **)(v3 + 24);
        if (v18)
          dispatch_retain(*(dispatch_object_t *)(v3 + 24));
        v21[0] = v17;
        v21[1] = v18;
        TelephonyXPC::Server::State::broadcast(v3, (uint64_t)__p, (uint64_t)v21);
        if (v18)
          dispatch_release(v18);
        if (v17)
          _Block_release(v17);
        if (v23 < 0)
          operator delete(__p[0]);
        if (v30)
          std::__shared_weak_count::__release_weak(v30);
        std::__shared_weak_count::__release_weak(v11);
      }
      v19 = (unint64_t *)&v5->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_15(uint64_t a1, unsigned int a2, unsigned int a3, NSObject **a4)
{
  uint64_t v7;
  unsigned int (***v8)(uint64_t, uint64_t);
  NSObject *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  std::string *v15;
  std::string::size_type size;
  NSObject *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD aBlock[4];
  dispatch_group_t group;
  _QWORD v26[2];
  std::string v27;
  std::string v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 32);
  memset(&v28, 0, sizeof(v28));
  v8 = (unsigned int (***)(uint64_t, uint64_t))(v7 + 80);
  v9 = *(NSObject **)(v7 + 112);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 2)
      v10 = "Unknown";
    else
      v10 = off_24CEA1760[a3];
    *(_DWORD *)buf = 136315138;
    v30 = v10;
    _os_log_impl(&dword_212CF9000, v9, OS_LOG_TYPE_DEFAULT, "#I Power state: %s", buf, 0xCu);
  }
  if ((**v8)(v7 + 80, 40))
  {
    if (a3 > 2)
      v12 = "Unknown";
    else
      v12 = off_24CEA1760[a3];
    ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Power state: %s", v11, v12);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](buf);
  }
  v13 = "EventSystemShuttingDown";
  v14 = 23;
  switch(a2)
  {
    case 0u:
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      {
        v28.__r_.__value_.__l.__size_ = 20;
        v15 = (std::string *)v28.__r_.__value_.__r.__words[0];
      }
      else
      {
        *((_BYTE *)&v28.__r_.__value_.__s + 23) = 20;
        v15 = &v28;
      }
      strcpy((char *)v15, "EventSystemPoweredOn");
      break;
    case 1u:
      goto LABEL_16;
    case 2u:
      v13 = "EventSystemEnteringLowPower";
      v14 = 27;
      goto LABEL_16;
    case 3u:
      v13 = "EventSystemExitingLowPower";
      v14 = 26;
LABEL_16:
      std::string::__assign_external(&v28, v13, v14);
      break;
    default:
      break;
  }
  size = HIBYTE(v28.__r_.__value_.__r.__words[2]);
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v28.__r_.__value_.__l.__size_;
  if (size)
  {
    v17 = *(NSObject **)(v7 + 112);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 > 3)
        v18 = "Unknown";
      else
        v18 = off_24CEA1778[a2];
      *(_DWORD *)buf = 136315138;
      v30 = v18;
      _os_log_impl(&dword_212CF9000, v17, OS_LOG_TYPE_DEFAULT, "#I Sending server power event: %s", buf, 0xCu);
    }
    if ((**v8)(v7 + 80, 40))
    {
      if (a2 > 3)
        v20 = "Unknown";
      else
        v20 = off_24CEA1778[a2];
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Sending server power event: %s", v19, v20);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](buf);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v27, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
    else
      v27 = v28;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_18;
    aBlock[3] = &__block_descriptor_tmp_19_0;
    v21 = *a4;
    group = v21;
    if (v21)
    {
      dispatch_retain(v21);
      dispatch_group_enter(v21);
    }
    v22 = _Block_copy(aBlock);
    v23 = *(NSObject **)(v7 + 24);
    if (v23)
      dispatch_retain(*(dispatch_object_t *)(v7 + 24));
    v26[0] = v22;
    v26[1] = v23;
    TelephonyXPC::Server::State::broadcast(v7, (uint64_t)&v27, (uint64_t)v26);
    if (v23)
      dispatch_release(v23);
    if (v22)
      _Block_release(v22);
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    if (group)
    {
      dispatch_group_leave(group);
      if (group)
        dispatch_release(group);
    }
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
}

void sub_212CFE948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
  MEMORY[0x2199A486C](&a29);
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = *(NSObject **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_group_enter(v4);
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
}

void ___ZN12TelephonyXPC6Server5State13handleSIGTERMEv_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  const void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[4];
  void *aBlock;
  int v14;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        v6 = *(const void **)(v3 + 240);
        if (v6)
          v7 = _Block_copy(v6);
        else
          v7 = 0;
        v8 = *(NSObject **)(v3 + 248);
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 1174405120;
        v12[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
        v12[3] = &__block_descriptor_tmp_27;
        if (v7)
          v9 = _Block_copy(v7);
        else
          v9 = 0;
        aBlock = v9;
        v14 = 2;
        dispatch_async(v8, v12);
        if (aBlock)
          _Block_release(aBlock);
        if (v7)
          _Block_release(v7);
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  std::string::size_type size;
  std::string::size_type v7;
  std::string::size_type v9;

  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v7 = 22;
LABEL_5:
    std::string::__grow_by_and_replace(this, v7, __n - v7, size, 0, size, __n, __s);
    return this;
  }
  v7 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v7 < __n)
  {
    size = this->__r_.__value_.__l.__size_;
    goto LABEL_5;
  }
  v9 = this->__r_.__value_.__r.__words[0];
  memmove(this->__r_.__value_.__l.__data_, __s, __n);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  *(_BYTE *)(v9 + __n) = 0;
  return this;
}

uint64_t ___ZN12TelephonyXPC6Server5State5startEv_block_invoke(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  const __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *__p[2];
  char v16;
  __int128 block;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void *aBlock;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_DWORD *)(v1 + 232))
  {
    ctu::XpcServer::startListener_sync(*(ctu::XpcServer **)(result + 32));
    v2 = (const char *)(v1 + 168);
    if (*(char *)(v1 + 191) < 0)
      v2 = *(const char **)v2;
    v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0x600u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
    CFRelease(v3);
    *(_DWORD *)(v1 + 232) = 1;
    v5 = *(const void **)(v1 + 240);
    if (v5)
      v6 = _Block_copy(v5);
    else
      v6 = 0;
    v7 = *(NSObject **)(v1 + 248);
    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 1174405120;
    v18 = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
    v19 = &__block_descriptor_tmp_27;
    if (v6)
      v8 = _Block_copy(v6);
    else
      v8 = 0;
    aBlock = v8;
    v21 = 1;
    dispatch_async(v7, &block);
    if (aBlock)
      _Block_release(aBlock);
    if (v6)
      _Block_release(v6);
    std::string::basic_string[abi:ne180100]<0>(__p, "ServerStateStarted");
    TelephonyXPC::Server::State::broadcastServerState(v1, (const char *)__p);
    if (v16 < 0)
      operator delete(__p[0]);
    v9 = *(NSObject **)(v1 + 112);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(int *)(v1 + 232);
      if (v10 > 3)
        v11 = "Unknown";
      else
        v11 = off_24CEA1798[v10];
      LODWORD(block) = 136315138;
      *(_QWORD *)((char *)&block + 4) = v11;
      _os_log_impl(&dword_212CF9000, v9, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&block, 0xCu);
    }
    result = (**(uint64_t (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 40);
    if ((_DWORD)result)
    {
      v13 = *(int *)(v1 + 232);
      if (v13 > 3)
        v14 = "Unknown";
      else
        v14 = off_24CEA1798[v13];
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s", v12, v14);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      return MEMORY[0x2199A486C](&block);
    }
  }
  return result;
}

void TelephonyXPC::Server::State::broadcastServerState(uint64_t a1, const char *a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *aBlock;
  dispatch_object_t v8;
  void *__p[2];
  char v10;
  xpc_object_t object;
  xpc_object_t v12;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x2199A4C50](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
      v5 = v4;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v4 = 0;
  }
  xpc_release(v4);
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  object = xpc_string_create(a2);
  if (!object)
    object = xpc_null_create();
  xpc::dict::object_proxy::operator=(&v12, v5, "KeyServerState", &object);
  xpc_release(v12);
  v12 = 0;
  xpc_release(object);
  object = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "EventServerStateChange");
  if (v5)
  {
    xpc_retain(v5);
    v6 = v5;
  }
  else
  {
    v6 = xpc_null_create();
  }
  aBlock = 0;
  v8 = 0;
  TelephonyXPC::Server::State::broadcast(a1, (uint64_t)__p, v6, (uint64_t)&aBlock);
  if (v8)
    dispatch_release(v8);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v6);
  if (v10 < 0)
    operator delete(__p[0]);
  xpc_release(v5);
}

void sub_212CFF0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v18;

  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a10);
  xpc_release(v18);
  if (a17 < 0)
    operator delete(__p);
  xpc_release(v17);
  _Unwind_Resume(a1);
}

xpc_object_t xpc::dict::object_proxy::operator=(xpc_object_t *a1, xpc_object_t xdict, char *key, xpc_object_t *a4)
{
  xpc_object_t result;

  xpc_dictionary_set_value(xdict, key, *a4);
  *a1 = *a4;
  result = xpc_null_create();
  *a4 = result;
  return result;
}

{
  xpc_object_t result;

  xpc_dictionary_set_value(xdict, key, *a4);
  *a1 = *a4;
  result = xpc_null_create();
  *a4 = result;
  return result;
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  _QWORD *v14;
  std::string *v15;
  xpc_object_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  _BOOL4 isNotificationRegistered_sync;
  _BOOL4 v24;
  NSObject *v25;
  std::string *v26;
  __int128 v27;
  int v28;
  std::string::size_type v29;
  uint64_t SystemTime;
  std::string *v31;
  std::string *v32;
  __int128 v33;
  int v34;
  std::string::size_type v35;
  uint64_t v36;
  const char *v37;
  std::string *v38;
  NSObject *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  BOOL v54;
  NSObject *v55;
  unint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  NSObject *group;
  _QWORD *v63;
  xpc_object_t message;
  unsigned int (***v65)(_QWORD, uint64_t);
  _QWORD *v66;
  _QWORD block[6];
  std::__shared_weak_count *v68;
  std::string v69;
  void *aBlock;
  dispatch_object_t object;
  _QWORD handler[6];
  std::__shared_weak_count *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  std::string __p;
  NSObject *v77;
  std::string v78;
  std::string v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  xpc_object_t v82;
  unint64_t v83;
  unint64_t v84;
  xpc_object_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  xpc_object_t v88;
  xpc_object_t v89;
  xpc_object_t v90;
  uint8_t buf[4];
  std::string *v92;
  __int16 v93;
  std::string *v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = MEMORY[0x24BDACFA0];
  if (v3 || (v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x2199A4C50](v3) == v4)
    {
      xpc_retain(v3);
      message = v3;
    }
    else
    {
      message = xpc_null_create();
    }
  }
  else
  {
    message = xpc_null_create();
    v3 = 0;
  }
  xpc_release(v3);
  if (MEMORY[0x2199A4C50](*(_QWORD *)(a1 + 40)) == v4)
  {
    v5 = *(void **)(a1 + 40);
    v89 = v5;
    if (v5)
      xpc_retain(v5);
    else
      v89 = xpc_null_create();
    xpc::dict::object_proxy::operator=(&v90, message, "eventData", &v89);
    xpc_release(v90);
    v90 = 0;
    xpc_release(v89);
    v89 = 0;
  }
  v87 = xpc_string_create("eventNotification");
  if (!v87)
    v87 = xpc_null_create();
  xpc::dict::object_proxy::operator=(&v88, message, "command", &v87);
  xpc_release(v88);
  v88 = 0;
  xpc_release(v87);
  v87 = 0;
  v6 = (const char *)(a1 + 48);
  if (*(char *)(a1 + 71) < 0)
    v6 = *(const char **)(a1 + 48);
  v85 = xpc_string_create(v6);
  if (!v85)
    v85 = xpc_null_create();
  xpc::dict::object_proxy::operator=(&v86, message, "event", &v85);
  xpc_release(v86);
  v86 = 0;
  xpc_release(v85);
  v85 = 0;
  group = dispatch_group_create();
  v7 = (std::__shared_weak_count *)v2[2];
  if (!v7 || (v60 = v2[1], (v8 = std::__shared_weak_count::lock(v7)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v9 = v8;
  p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
  do
    v11 = __ldxr(p_shared_weak_owners);
  while (__stxr(v11 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
  }
  v61 = v9;
  v14 = (_QWORD *)v2[37];
  v66 = v2 + 38;
  v15 = (std::string *)(a1 + 48);
  if (v14 != v2 + 38)
  {
    v59 = &v74;
    v65 = (unsigned int (***)(_QWORD, uint64_t))(v2 + 10);
    v63 = v2;
    do
    {
      v83 = 0xAAAAAAAAAAAAAAAALL;
      v84 = 0xAAAAAAAAAAAAAAAALL;
      v16 = (xpc_object_t)v14[4];
      v82 = v16;
      if (v16)
      {
        xpc_retain(v16);
      }
      else
      {
        v16 = xpc_null_create();
        v82 = v16;
      }
      v17 = v14[5];
      v18 = v14[6];
      v83 = v17;
      v84 = v18;
      if (v18)
      {
        v19 = (unint64_t *)(v18 + 8);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      if (v16)
        xpc_retain(v16);
      else
        v16 = xpc_null_create();
      v80 = v17;
      v81 = (std::__shared_weak_count *)v18;
      if (v18)
      {
        v21 = (unint64_t *)(v18 + 8);
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      if (*(char *)(a1 + 71) < 0)
        std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
      else
        v79 = *v15;
      isNotificationRegistered_sync = TelephonyXPC::ServerClientState::isNotificationRegistered_sync(&v80, (uint64_t)&v79);
      v24 = isNotificationRegistered_sync;
      if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v79.__r_.__value_.__l.__data_);
        if (v24)
        {
LABEL_47:
          v25 = v2[14];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = v15;
            if (*(char *)(a1 + 71) < 0)
              v26 = (std::string *)v15->__r_.__value_.__r.__words[0];
            if (*(char *)(v17 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v78, *(const std::string::value_type **)v17, *(_QWORD *)(v17 + 8));
            }
            else
            {
              v27 = *(_OWORD *)v17;
              v78.__r_.__value_.__r.__words[2] = *(_QWORD *)(v17 + 16);
              *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v27;
            }
            v28 = SHIBYTE(v78.__r_.__value_.__r.__words[2]);
            v29 = v78.__r_.__value_.__r.__words[0];
            SystemTime = TelephonyUtilGetSystemTime();
            *(_DWORD *)buf = 136315650;
            v31 = &v78;
            if (v28 < 0)
              v31 = (std::string *)v29;
            v92 = v26;
            v93 = 2080;
            v94 = v31;
            v95 = 2048;
            v96 = SystemTime;
            _os_log_impl(&dword_212CF9000, v25, OS_LOG_TYPE_DEFAULT, "#I Sending %s to %s at %llu", buf, 0x20u);
            if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v78.__r_.__value_.__l.__data_);
            v2 = v63;
            v15 = (std::string *)(a1 + 48);
          }
          if ((**v65)(v65, 40))
          {
            v32 = v15;
            if (*(char *)(a1 + 71) < 0)
              v32 = (std::string *)v15->__r_.__value_.__r.__words[0];
            if (*(char *)(v17 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v78, *(const std::string::value_type **)v17, *(_QWORD *)(v17 + 8));
            }
            else
            {
              v33 = *(_OWORD *)v17;
              v78.__r_.__value_.__r.__words[2] = *(_QWORD *)(v17 + 16);
              *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v33;
            }
            v34 = SHIBYTE(v78.__r_.__value_.__r.__words[2]);
            v35 = v78.__r_.__value_.__r.__words[0];
            v36 = TelephonyUtilGetSystemTime();
            if (v34 >= 0)
              v38 = &v78;
            else
              v38 = (std::string *)v35;
            ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Sending %s to %s at %llu", v37, v32, v38, v36, v59);
            ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
            v15 = (std::string *)(a1 + 48);
            MEMORY[0x2199A486C](buf);
            v2 = v63;
            if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v78.__r_.__value_.__l.__data_);
          }
          if (*(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 80))
          {
            dispatch_group_enter(group);
            v39 = v2[3];
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 1174405120;
            handler[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_31;
            handler[3] = &__block_descriptor_tmp_34;
            handler[4] = v2;
            handler[5] = v60;
            v73 = v61;
            do
              v40 = __ldxr(p_shared_weak_owners);
            while (__stxr(v40 + 1, p_shared_weak_owners));
            v74 = v17;
            v75 = (std::__shared_weak_count *)v18;
            if (v18)
            {
              v41 = (unint64_t *)(v18 + 8);
              do
                v42 = __ldxr(v41);
              while (__stxr(v42 + 1, v41));
            }
            if (*(char *)(a1 + 71) < 0)
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
            else
              __p = *v15;
            v77 = group;
            xpc_connection_send_message_with_reply((xpc_connection_t)v16, message, v39, handler);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            v43 = v75;
            if (v75)
            {
              v44 = (unint64_t *)&v75->__shared_owners_;
              do
                v45 = __ldaxr(v44);
              while (__stlxr(v45 - 1, v44));
              if (!v45)
              {
                ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                std::__shared_weak_count::__release_weak(v43);
              }
            }
            if (v73)
              std::__shared_weak_count::__release_weak(v73);
          }
          else
          {
            xpc_connection_send_message((xpc_connection_t)v16, message);
          }
        }
      }
      else if (isNotificationRegistered_sync)
      {
        goto LABEL_47;
      }
      v46 = v81;
      if (v81)
      {
        v47 = (unint64_t *)&v81->__shared_owners_;
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }
      xpc_release(v16);
      v49 = (std::__shared_weak_count *)v84;
      if (v84)
      {
        v50 = (unint64_t *)(v84 + 8);
        do
          v51 = __ldaxr(v50);
        while (__stlxr(v51 - 1, v50));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
      xpc_release(v82);
      v52 = (_QWORD *)v14[1];
      if (v52)
      {
        do
        {
          v53 = v52;
          v52 = (_QWORD *)*v52;
        }
        while (v52);
      }
      else
      {
        do
        {
          v53 = (_QWORD *)v14[2];
          v54 = *v53 == (_QWORD)v14;
          v14 = v53;
        }
        while (!v54);
      }
      v14 = v53;
    }
    while (v53 != v66);
  }
  if (*(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 80))
  {
    v55 = v2[3];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_35;
    block[3] = &__block_descriptor_tmp_37;
    block[4] = v2;
    block[5] = v60;
    v68 = v61;
    do
      v56 = __ldxr(p_shared_weak_owners);
    while (__stxr(v56 + 1, p_shared_weak_owners));
    if (*(char *)(a1 + 71) < 0)
      std::string::__init_copy_ctor_external(&v69, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
    else
      v69 = *(std::string *)(a1 + 48);
    v57 = *(void **)(a1 + 72);
    if (v57)
      v57 = _Block_copy(v57);
    v58 = *(NSObject **)(a1 + 80);
    aBlock = v57;
    object = v58;
    if (v58)
      dispatch_retain(v58);
    dispatch_group_notify(group, v55, block);
    if (object)
      dispatch_release(object);
    if (aBlock)
      _Block_release(aBlock);
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v69.__r_.__value_.__l.__data_);
    if (v68)
      std::__shared_weak_count::__release_weak(v68);
  }
  dispatch_release(group);
  std::__shared_weak_count::__release_weak(v61);
  xpc_release(message);
}

void sub_212CFF940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,xpc_object_t object,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32)
{
  if (a32)
    std::__shared_weak_count::__release_weak(a32);
  std::__shared_weak_count::__release_weak(a18);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_31(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  __int128 *v7;
  __int128 v8;
  std::string *v9;
  _QWORD *v10;
  uint64_t SystemTime;
  __int128 *v12;
  __int128 v13;
  std::string *v14;
  _QWORD *v15;
  uint64_t v16;
  const char *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::string v20;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  std::string *v24;
  __int16 v25;
  _QWORD *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && (v3 = *(_QWORD *)(a1 + 32), v4 = std::__shared_weak_count::lock(v2), (v22 = v4) != 0))
  {
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(__int128 **)(a1 + 56);
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
        }
        else
        {
          v8 = *v7;
          v20.__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
          *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v8;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v9 = &v20;
        else
          v9 = (std::string *)v20.__r_.__value_.__r.__words[0];
        v10 = (_QWORD *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v10 = (_QWORD *)*v10;
        SystemTime = TelephonyUtilGetSystemTime();
        *(_DWORD *)buf = 136315650;
        v24 = v9;
        v25 = 2080;
        v26 = v10;
        v27 = 2048;
        v28 = SystemTime;
        _os_log_impl(&dword_212CF9000, v6, OS_LOG_TYPE_DEFAULT, "#I %s responded to %s at %llu", buf, 0x20u);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v20.__r_.__value_.__l.__data_);
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
      {
        v12 = *(__int128 **)(a1 + 56);
        if (*((char *)v12 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
        }
        else
        {
          v13 = *v12;
          v20.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
          *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v13;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v14 = &v20;
        else
          v14 = (std::string *)v20.__r_.__value_.__r.__words[0];
        v15 = (_QWORD *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v15 = (_QWORD *)*v15;
        v16 = TelephonyUtilGetSystemTime();
        ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s responded to %s at %llu", v17, v14, v15, v16);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x2199A486C](buf);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v20.__r_.__value_.__l.__data_);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
  }
}

void sub_212CFFD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c39_ZTSN12TelephonyXPC17ServerClientStateE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v3;
  unint64_t *v4;
  unint64_t v5;
  std::string::size_type v6;
  unint64_t *v7;
  unint64_t v8;
  std::string *v9;
  __int128 v10;

  v3 = *(_QWORD *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = *(_QWORD *)(a2 + 64);
  a1[2].__r_.__value_.__l.__size_ = *(_QWORD *)(a2 + 56);
  a1[2].__r_.__value_.__r.__words[2] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a2 + 72), *(_QWORD *)(a2 + 80));
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 88);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
}

void sub_212CFFE18(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v4;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2);
  v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c39_ZTSN12TelephonyXPC17ServerClientStateE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;

  v2 = a1 + 56;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

xpc_object_t *std::pair<xpc::connection const,TelephonyXPC::ServerClientState>::~pair(xpc_object_t *a1)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  unsigned int (***v5)(_QWORD, uint64_t);
  NSObject *v6;
  _QWORD *v7;
  const char *v8;
  _QWORD *v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  __int128 buf;
  uint64_t (*v17)(uint64_t);
  void *v18;
  void *aBlock;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    if (v4 && *(_QWORD *)(a1 + 40))
    {
      v5 = (unsigned int (***)(_QWORD, uint64_t))(v2 + 80);
      v6 = *(NSObject **)(v2 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (_QWORD *)(a1 + 56);
        if (*(char *)(a1 + 79) < 0)
          v7 = (_QWORD *)*v7;
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_212CF9000, v6, OS_LOG_TYPE_DEFAULT, "#I All clients responded to %s", (uint8_t *)&buf, 0xCu);
      }
      if ((**v5)(v5, 40))
      {
        v9 = (_QWORD *)(a1 + 56);
        if (*(char *)(a1 + 79) < 0)
          v9 = (_QWORD *)*v9;
        ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"All clients responded to %s", v8, v9);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x2199A486C](&buf);
      }
    }
  }
  else
  {
    v4 = 0;
  }
  v10 = *(const void **)(a1 + 80);
  if (v10)
    v11 = _Block_copy(v10);
  else
    v11 = 0;
  v12 = *(NSObject **)(a1 + 88);
  *(_QWORD *)&buf = MEMORY[0x24BDAC760];
  *((_QWORD *)&buf + 1) = 1174405120;
  v17 = ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke;
  v18 = &__block_descriptor_tmp_40;
  if (v11)
    v13 = _Block_copy(v11);
  else
    v13 = 0;
  aBlock = v13;
  dispatch_async(v12, &buf);
  if (aBlock)
    _Block_release(aBlock);
  if (v11)
    _Block_release(v11);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::string *v7;
  __int128 v8;
  void *v9;
  NSObject *v10;

  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 56), *(_QWORD *)(a2 + 64));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 56);
    a1[9] = *(_QWORD *)(a2 + 72);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  v9 = *(void **)(a2 + 80);
  if (v9)
    v9 = _Block_copy(v9);
  v10 = *(NSObject **)(a2 + 88);
  a1[10] = v9;
  a1[11] = v10;
  if (v10)
    dispatch_retain(v10);
}

void sub_212D0018C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  std::__shared_weak_count *v4;

  v2 = *(NSObject **)(a1 + 88);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 80);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

void __copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(std::string *a1, uint64_t a2)
{
  void *v4;
  std::string *v5;
  __int128 v6;
  void *v7;
  NSObject *v8;

  v4 = *(void **)(a2 + 40);
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  if (v4)
    xpc_retain(v4);
  else
    a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
  v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *(void **)(a2 + 72);
  if (v7)
    v7 = _Block_copy(v7);
  v8 = *(NSObject **)(a2 + 80);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v8;
  if (v8)
    dispatch_retain(v8);
}

void sub_212D002A4(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 80);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 72);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

void ctu::SharedSynchronizable<ctu::XpcServer>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD block[6];
  std::__shared_weak_count *v16;

  v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_39;
  block[5] = v5;
  v16 = v7;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  block[4] = a2;
  dispatch_async(v8, block);
  v11 = v16;
  if (v16)
  {
    v12 = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
}

void __destroy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
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
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZN12TelephonyXPC6Server5State17setCommandHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS_17ServerClientStateEN3xpc4dictENSA_IU13block_pointerFviSD_EEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  const char *v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t **v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t *v12;
  std::string *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 buf;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (_QWORD *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0)
      v4 = (_QWORD *)*v4;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_212CF9000, v3, OS_LOG_TYPE_DEFAULT, "#I Registered command %s", (uint8_t *)&buf, 0xCu);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 40))
  {
    v6 = (_QWORD *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0)
      v6 = (_QWORD *)*v6;
    ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Registered command %s", v5, v6);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](&buf);
  }
  v7 = *(uint64_t **)(v2 + 328);
  v8 = (uint64_t **)(v2 + 328);
  v9 = (uint64_t **)(v2 + 328);
  if (!v7)
    goto LABEL_18;
  v8 = (uint64_t **)(v2 + 328);
  while (1)
  {
    while (1)
    {
      v9 = (uint64_t **)v7;
      v10 = v7 + 4;
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((_QWORD *)(a1 + 40), (void **)v7 + 4) & 0x80) == 0)break;
      v7 = *v9;
      v8 = v9;
      if (!*v9)
        goto LABEL_18;
    }
    if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v10, (void **)(a1 + 40)) & 0x80) == 0)
      break;
    v8 = v9 + 1;
    v7 = v9[1];
    if (!v7)
      goto LABEL_18;
  }
  v11 = *v8;
  if (!*v8)
  {
LABEL_18:
    v20 = 0xAAAAAAAAAAAAAA00;
    v12 = (uint64_t *)operator new(0x48uLL);
    *(_QWORD *)&buf = v12;
    *((_QWORD *)&buf + 1) = v2 + 328;
    v13 = (std::string *)(v12 + 4);
    if (*(char *)(a1 + 63) < 0)
    {
      std::string::__init_copy_ctor_external(v13, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 + 40);
      v12[6] = *(_QWORD *)(a1 + 56);
    }
    v12[7] = 0;
    v12[8] = 0;
    LOBYTE(v20) = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v9;
    *v8 = v12;
    v14 = **(_QWORD **)(v2 + 320);
    if (v14)
    {
      *(_QWORD *)(v2 + 320) = v14;
      v12 = *v8;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 328), v12);
    ++*(_QWORD *)(v2 + 336);
    v11 = (uint64_t *)buf;
    *(_QWORD *)&buf = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)&buf);
  }
  v15 = *(void **)(a1 + 64);
  if (v15)
    v15 = _Block_copy(v15);
  v16 = (const void *)v11[7];
  v11[7] = (uint64_t)v15;
  if (v16)
    _Block_release(v16);
  v17 = *(NSObject **)(a1 + 72);
  if (v17)
    dispatch_retain(v17);
  v18 = v11[8];
  v11[8] = (uint64_t)v17;
  if (v18)
    dispatch_release(v18);
}

void sub_212D007A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c121_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;

  v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 40);
    v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  v6 = *(void **)(a2 + 64);
  if (v6)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v7;
  if (v7)
    dispatch_retain(v7);
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c121_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 24);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
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

void ___ZN12TelephonyXPC6Server5State20handleNewClient_syncEN3xpc10connectionE_block_invoke(uint64_t a1, void **a2, void **a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  xpc_object_t object;
  xpc_object_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *a2;
  v8 = v5;
  if (v5)
    xpc_retain(v5);
  else
    v8 = xpc_null_create();
  v6 = *a3;
  object = v6;
  if (v6)
    xpc_retain(v6);
  else
    object = xpc_null_create();
  TelephonyXPC::Server::State::handleMessage_sync(v4, &v8, (xpc::object *)&object);
  xpc_release(object);
  object = 0;
  xpc_release(v8);
}

void sub_212D00CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  xpc_release(object);
  xpc_release(a10);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Server::State::handleMessage_sync(uint64_t a1, xpc_object_t *a2, xpc::object *a3)
{
  xpc_object_t v6;
  unint64_t v7;
  unsigned int (***v8)(uint64_t, uint64_t);
  NSObject *v9;
  _BOOL4 v10;
  __int128 v11;
  int v12;
  std::string::size_type v13;
  const char *v14;
  std::string *v15;
  std::string *p_p;
  int v17;
  std::string::size_type v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  _QWORD *v26;
  xpc_object_t v27;
  xpc_object_t reply;
  xpc_object_t v29;
  int v30;
  std::string::size_type v31;
  std::string *v32;
  std::string *v33;
  __int128 v34;
  int v35;
  std::string::size_type v36;
  std::string *p_block;
  std::string *p_aBlock;
  void *v39;
  NSObject *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const void *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  void *v50;
  const void *v51;
  dispatch_block_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  xpc_object_t v58;
  xpc_object_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  NSObject *v63;
  std::string::size_type size;
  char v65;
  xpc_object_t v66;
  xpc_object_t v67;
  std::string::size_type v68;
  std::string *v69;
  int data;
  int v71;
  xpc_object_t v73;
  std::string *v74;
  std::string::size_type v75;
  uint64_t v76;
  uint64_t (*v78)(uint64_t);
  xpc_object_t v79;
  std::string *v80;
  xpc_object_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  uint64_t (*v85)(uint64_t);
  xpc_object_t v86;
  uint64_t v87;
  std::string::size_type v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  NSObject *v92;
  const char *v93;
  std::string *v94;
  xpc_object_t v95;
  std::string::size_type v96;
  std::string *v97;
  xpc_object_t v98;
  xpc_object_t v99;
  std::string *v100;
  NSObject *v101;
  xpc_object_t v102;
  xpc_object_t v103;
  void *v104;
  uint64_t *v105;
  NSObject *v106;
  xpc_object_t v107;
  void *v108;
  char v109;
  qos_class_t qos_class;
  xpc_object_t v111;
  xpc_object_t object;
  unint64_t v113;
  unint64_t v114;
  std::string aBlock;
  void *v116;
  xpc_object_t v117;
  xpc_object_t v118;
  void *v119;
  dispatch_object_t v120;
  xpc_object_t v121;
  dispatch_object_t v122;
  xpc_object_t v123;
  xpc_object_t v124;
  xpc_object_t v125;
  xpc_object_t v126;
  std::string __p;
  std::string block;
  void *v129;
  void *v130;
  xpc_object_t v131;
  std::string v132;
  dispatch_object_t v133;
  void *v134;
  dispatch_object_t v135;
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  v113 = 0xAAAAAAAAAAAAAAAALL;
  v114 = 0xAAAAAAAAAAAAAAAALL;
  v6 = *a2;
  if (*a2)
    xpc_retain(*a2);
  else
    v6 = xpc_null_create();
  TelephonyXPC::Server::State::getClientState_sync(&v113, a1, (unint64_t)v6);
  xpc_release(v6);
  v7 = v113;
  v8 = (unsigned int (***)(uint64_t, uint64_t))(a1 + 80);
  v9 = *(NSObject **)(a1 + 112);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10)
    {
      if (*(char *)(v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&block, *(const std::string::value_type **)v7, *(_QWORD *)(v7 + 8));
      }
      else
      {
        v34 = *(_OWORD *)v7;
        block.__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 16);
        *(_OWORD *)&block.__r_.__value_.__l.__data_ = v34;
      }
      v35 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
      v36 = block.__r_.__value_.__r.__words[0];
      xpc::object::to_string(a3);
      p_block = &block;
      if (v35 < 0)
        p_block = (std::string *)v36;
      if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_aBlock = &aBlock;
      else
        p_aBlock = (std::string *)aBlock.__r_.__value_.__r.__words[0];
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_block;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_aBlock;
      _os_log_debug_impl(&dword_212CF9000, v9, OS_LOG_TYPE_DEBUG, "#D Got message from %s of %s", (uint8_t *)&__p, 0x16u);
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0)
        operator delete(aBlock.__r_.__value_.__l.__data_);
      if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
        operator delete(block.__r_.__value_.__l.__data_);
    }
    if ((**v8)(a1 + 80, 20))
    {
      if (*(char *)(v113 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&aBlock, *(const std::string::value_type **)v113, *(_QWORD *)(v113 + 8));
      }
      else
      {
        v11 = *(_OWORD *)v113;
        aBlock.__r_.__value_.__r.__words[2] = *(_QWORD *)(v113 + 16);
        *(_OWORD *)&aBlock.__r_.__value_.__l.__data_ = v11;
      }
      v17 = SHIBYTE(aBlock.__r_.__value_.__r.__words[2]);
      v18 = aBlock.__r_.__value_.__r.__words[0];
      xpc::object::to_string(a3);
      v15 = &aBlock;
      if (v17 < 0)
        v15 = (std::string *)v18;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_22:
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Got message from %s of %s", v14, v15, p_p);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](&block);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0)
        operator delete(aBlock.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (v10)
    {
      xpc::object::to_string((xpc::object *)a2);
      v30 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
      v31 = block.__r_.__value_.__r.__words[0];
      xpc::object::to_string(a3);
      v32 = &block;
      if (v30 < 0)
        v32 = (std::string *)v31;
      if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v33 = &aBlock;
      else
        v33 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v32;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v33;
      _os_log_debug_impl(&dword_212CF9000, v9, OS_LOG_TYPE_DEBUG, "#D Got message from %s of %s", (uint8_t *)&__p, 0x16u);
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0)
        operator delete(aBlock.__r_.__value_.__l.__data_);
      if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
        operator delete(block.__r_.__value_.__l.__data_);
    }
    if ((**v8)(a1 + 80, 20))
    {
      xpc::object::to_string((xpc::object *)a2);
      v12 = SHIBYTE(aBlock.__r_.__value_.__r.__words[2]);
      v13 = aBlock.__r_.__value_.__r.__words[0];
      xpc::object::to_string(a3);
      v15 = &aBlock;
      if (v12 < 0)
        v15 = (std::string *)v13;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      goto LABEL_22;
    }
  }
  v19 = *(xpc_object_t *)a3;
  if (v19)
    xpc_retain(v19);
  else
    v19 = xpc_null_create();
  v20 = MEMORY[0x2199A4C50](v19);
  v21 = MEMORY[0x24BDACFA0];
  if (v20 != MEMORY[0x24BDACFA0])
    goto LABEL_149;
  v22 = *a2;
  if (*a2)
    xpc_retain(*a2);
  else
    v22 = xpc_null_create();
  memset(&__p, 170, sizeof(__p));
  xpc::dict::object_proxy::operator xpc::object(&aBlock, v19, "command");
  memset(&block, 0, sizeof(block));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
    operator delete(block.__r_.__value_.__l.__data_);
  xpc_release(aBlock.__r_.__value_.__l.__data_);
  v23 = *(_QWORD **)(a1 + 328);
  if (v23)
  {
    v24 = a1 + 328;
    do
    {
      v25 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v23 + 4, (void **)&__p.__r_.__value_.__l.__data_);
      if (v25 >= 0)
        v26 = v23;
      else
        v26 = v23 + 1;
      if (v25 >= 0)
        v24 = (uint64_t)v23;
      v23 = (_QWORD *)*v26;
    }
    while (*v26);
    if (v24 != a1 + 328
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)(v24 + 32)) & 0x80) == 0)
    {
      v121 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      v122 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
      if (v22)
      {
        xpc_retain(v22);
        v27 = v22;
      }
      else
      {
        v27 = xpc_null_create();
      }
      TelephonyXPC::Server::State::getClientState_sync(&v121, a1, (unint64_t)v27);
      xpc_release(v27);
      reply = xpc_dictionary_create_reply(v19);
      if (reply || (reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x2199A4C50](reply) == MEMORY[0x24BDACFA0])
        {
          xpc_retain(reply);
          v29 = reply;
        }
        else
        {
          v29 = xpc_null_create();
        }
      }
      else
      {
        v29 = xpc_null_create();
        reply = 0;
      }
      xpc_release(reply);
      v119 = (void *)0xAAAAAAAAAAAAAAAALL;
      v120 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
      aBlock.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
      aBlock.__r_.__value_.__l.__size_ = 1174405120;
      aBlock.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN12TelephonyXPC6Server5State24handlePublicMessage_syncEN3xpc10connectionERNS2_4dictE_block_invoke;
      v116 = &__block_descriptor_tmp_51;
      v117 = v29;
      if (v29)
        xpc_retain(v29);
      else
        v117 = xpc_null_create();
      v118 = v22;
      if (v22)
        xpc_retain(v22);
      else
        v118 = xpc_null_create();
      v107 = v29;
      v39 = _Block_copy(&aBlock);
      v40 = *(NSObject **)(a1 + 24);
      if (v40)
        dispatch_retain(*(dispatch_object_t *)(a1 + 24));
      v119 = v39;
      v120 = v40;
      qos_class = qos_class_self();
      v41 = (std::__shared_weak_count *)v122;
      v111 = v121;
      if (v122)
      {
        v42 = (unint64_t *)&v122[1];
        do
          v43 = __ldxr(v42);
        while (__stxr(v43 + 1, v42));
      }
      if (v19)
      {
        xpc_retain(v19);
        object = v19;
      }
      else
      {
        object = xpc_null_create();
      }
      if (v39)
      {
        v44 = _Block_copy(v39);
        if (!v40)
          goto LABEL_93;
      }
      else
      {
        v44 = 0;
        if (!v40)
        {
LABEL_93:
          v45 = *(void **)(v24 + 56);
          if (v45)
          {
            v46 = _Block_copy(v45);
            v47 = v46;
            block.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
            block.__r_.__value_.__l.__size_ = 1174405120;
            block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEclIJS2_S4_S7_EEEv11qos_class_tDpT__block_invoke;
            v129 = &__block_descriptor_tmp_52;
            if (v46)
            {
              v45 = _Block_copy(v46);
              v109 = 0;
LABEL_101:
              v130 = v45;
              v131 = v111;
              v132.__r_.__value_.__r.__words[0] = (std::string::size_type)v41;
              if (v41)
              {
                p_shared_owners = (unint64_t *)&v41->__shared_owners_;
                do
                  v49 = __ldxr(p_shared_owners);
                while (__stxr(v49 + 1, p_shared_owners));
              }
              v132.__r_.__value_.__l.__size_ = (std::string::size_type)object;
              if (object)
                xpc_retain(object);
              else
                v132.__r_.__value_.__l.__size_ = (std::string::size_type)xpc_null_create();
              v108 = v44;
              if (v44)
                v50 = _Block_copy(v44);
              else
                v50 = 0;
              v51 = v47;
              v132.__r_.__value_.__r.__words[2] = (std::string::size_type)v50;
              v133 = v40;
              if (v40)
                dispatch_retain(v40);
              v52 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos_class, 0, &block);
              dispatch_async(*(dispatch_queue_t *)(v24 + 64), v52);
              if (v52)
                _Block_release(v52);
              v21 = MEMORY[0x24BDACFA0];
              if (v133)
                dispatch_release(v133);
              if (v132.__r_.__value_.__r.__words[2])
                _Block_release((const void *)v132.__r_.__value_.__r.__words[2]);
              xpc_release((xpc_object_t)v132.__r_.__value_.__l.__size_);
              v132.__r_.__value_.__l.__size_ = 0;
              v53 = (std::__shared_weak_count *)v132.__r_.__value_.__r.__words[0];
              if (v132.__r_.__value_.__r.__words[0])
              {
                v54 = (unint64_t *)(v132.__r_.__value_.__r.__words[0] + 8);
                do
                  v55 = __ldaxr(v54);
                while (__stlxr(v55 - 1, v54));
                if (!v55)
                {
                  ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
                  std::__shared_weak_count::__release_weak(v53);
                }
              }
              if (v130)
                _Block_release(v130);
              if ((v109 & 1) == 0)
                _Block_release(v51);
              if (v40)
                dispatch_release(v40);
              if (v108)
                _Block_release(v108);
              xpc_release(object);
              if (v41)
              {
                v56 = (unint64_t *)&v41->__shared_owners_;
                do
                  v57 = __ldaxr(v56);
                while (__stlxr(v57 - 1, v56));
                if (!v57)
                {
                  ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                  std::__shared_weak_count::__release_weak(v41);
                }
              }
              v58 = xpc_null_create();
              v59 = xpc_null_create();
              xpc_release(v19);
              xpc_release(v59);
              if (v120)
                dispatch_release(v120);
              if (v119)
                _Block_release(v119);
              xpc_release(v118);
              v118 = 0;
              xpc_release(v117);
              v117 = 0;
              xpc_release(v107);
              v60 = (std::__shared_weak_count *)v122;
              if (v122)
              {
                v61 = (unint64_t *)&v122[1];
                do
                  v62 = __ldaxr(v61);
                while (__stlxr(v62 - 1, v61));
                if (!v62)
                {
                  ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
                  std::__shared_weak_count::__release_weak(v60);
                }
              }
              v19 = v58;
              goto LABEL_146;
            }
            v45 = 0;
          }
          else
          {
            v47 = 0;
            block.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
            block.__r_.__value_.__l.__size_ = 1174405120;
            block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEclIJS2_S4_S7_EEEv11qos_class_tDpT__block_invoke;
            v129 = &__block_descriptor_tmp_52;
          }
          v109 = 1;
          goto LABEL_101;
        }
      }
      dispatch_retain(v40);
      goto LABEL_93;
    }
    v21 = MEMORY[0x24BDACFA0];
  }
LABEL_146:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  xpc_release(v22);
LABEL_149:
  if (MEMORY[0x2199A4C50](v19) != v21)
    goto LABEL_201;
  v63 = *a2;
  if (v63)
    xpc_retain(v63);
  else
    v63 = xpc_null_create();
  memset(&aBlock, 170, sizeof(aBlock));
  xpc::dict::object_proxy::operator xpc::object(&__p, v19, "command");
  memset(&block, 0, sizeof(block));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
    operator delete(block.__r_.__value_.__l.__data_);
  xpc_release(__p.__r_.__value_.__l.__data_);
  size = HIBYTE(aBlock.__r_.__value_.__r.__words[2]);
  v65 = HIBYTE(aBlock.__r_.__value_.__r.__words[2]);
  if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = aBlock.__r_.__value_.__l.__size_;
  if (size)
  {
    v66 = xpc_dictionary_create_reply(v19);
    if (v66 || (v66 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x2199A4C50](v66) == v21)
      {
        xpc_retain(v66);
        v67 = v66;
      }
      else
      {
        v67 = xpc_null_create();
      }
    }
    else
    {
      v67 = xpc_null_create();
      v66 = 0;
    }
    xpc_release(v66);
    v68 = HIBYTE(aBlock.__r_.__value_.__r.__words[2]);
    if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v68 = aBlock.__r_.__value_.__l.__size_;
    switch(v68)
    {
      case 9uLL:
        v74 = &aBlock;
        if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v74 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
        v75 = v74->__r_.__value_.__r.__words[0];
        v76 = v74->__r_.__value_.__s.__data_[8];
        if (v75 != *(_QWORD *)"eventsOff" || v76 != str_11[8])
          goto LABEL_196;
        block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        xpc::dict::object_proxy::operator xpc::object(&v121, v19, "eventList");
        xpc::bridge();
        ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&block, __p.__r_.__value_.__l.__data_);
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&__p.__r_.__value_.__l.__data_);
        xpc_release(v121);
        if (block.__r_.__value_.__r.__words[0])
          v78 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
        else
          v78 = 0;
        if (v78)
        {
          if (v63)
          {
            xpc_retain(v63);
            v79 = v63;
          }
          else
          {
            v79 = xpc_null_create();
          }
          v119 = (void *)block.__r_.__value_.__r.__words[0];
          if (block.__r_.__value_.__r.__words[0])
            CFRetain(block.__r_.__value_.__l.__data_);
          TelephonyXPC::Server::State::registerNotification(a1, v79, 0, (const void **)&v119);
          ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&v119);
          xpc_release(v79);
          v87 = 0;
          goto LABEL_233;
        }
        break;
      case 8uLL:
        v80 = &aBlock;
        if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v80 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
        if (v80->__r_.__value_.__r.__words[0] != *(_QWORD *)"eventsOn")
          goto LABEL_196;
        block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        xpc::dict::object_proxy::operator xpc::object(&v121, v19, "eventList");
        xpc::bridge();
        ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&block, __p.__r_.__value_.__l.__data_);
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&__p.__r_.__value_.__l.__data_);
        xpc_release(v121);
        if (block.__r_.__value_.__r.__words[0])
          v85 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
        else
          v85 = 0;
        if (v85)
        {
          if (v63)
          {
            xpc_retain(v63);
            v86 = v63;
          }
          else
          {
            v86 = xpc_null_create();
          }
          v119 = (void *)block.__r_.__value_.__r.__words[0];
          if (block.__r_.__value_.__r.__words[0])
            CFRetain(block.__r_.__value_.__l.__data_);
          TelephonyXPC::Server::State::registerNotification(a1, v86, 1, (const void **)&v119);
          ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&v119);
          xpc_release(v86);
          v87 = 0;
          goto LABEL_233;
        }
        break;
      case 7uLL:
        v69 = &aBlock;
        if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v69 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
        data = (int)v69->__r_.__value_.__l.__data_;
        v71 = *(_DWORD *)((char *)v69->__r_.__value_.__r.__words + 3);
        if (data != *(_DWORD *)"checkIn" || v71 != *(_DWORD *)"ckIn")
        {
LABEL_196:
          v81 = v19;
LABEL_197:
          xpc_release(v67);
          v65 = HIBYTE(aBlock.__r_.__value_.__r.__words[2]);
          v19 = v81;
          goto LABEL_198;
        }
        memset(&__p, 170, sizeof(__p));
        xpc::dict::object_proxy::operator xpc::object(&v121, v19, "clientName");
        memset(&block, 0, sizeof(block));
        xpc::dyn_cast_or_default();
        if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
          operator delete(block.__r_.__value_.__l.__data_);
        xpc_release(v121);
        block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        block.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        if (v63)
        {
          xpc_retain(v63);
          v73 = v63;
        }
        else
        {
          v73 = xpc_null_create();
        }
        TelephonyXPC::Server::State::getClientState_sync(&block, a1, (unint64_t)v73);
        xpc_release(v73);
        v88 = block.__r_.__value_.__r.__words[0];
        if (block.__r_.__value_.__r.__words[0])
        {
          std::string::operator=((std::string *)block.__r_.__value_.__l.__data_, &__p);
          *(_BYTE *)(v88 + 24) = 1;
        }
        v89 = (std::__shared_weak_count *)block.__r_.__value_.__l.__size_;
        if (block.__r_.__value_.__l.__size_)
        {
          v90 = (unint64_t *)(block.__r_.__value_.__l.__size_ + 8);
          do
            v91 = __ldaxr(v90);
          while (__stlxr(v91 - 1, v90));
          if (!v91)
          {
            ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
            std::__shared_weak_count::__release_weak(v89);
          }
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v87 = 0;
LABEL_234:
        v125 = xpc_int64_create((int)v87);
        if (!v125)
          v125 = xpc_null_create();
        xpc::dict::object_proxy::operator=(&v126, v67, "commandResult", &v125);
        xpc_release(v126);
        v126 = 0;
        xpc_release(v125);
        v125 = 0;
        v92 = *(NSObject **)(a1 + 112);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          v100 = &aBlock;
          if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v100 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
          LODWORD(block.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)block.__r_.__value_.__r.__words + 4) = (std::string::size_type)v100;
          WORD2(block.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&block.__r_.__value_.__r.__words[1] + 6) = v87;
          _os_log_debug_impl(&dword_212CF9000, v92, OS_LOG_TYPE_DEBUG, "#D Replying to client's command: %s, with return code: %d", (uint8_t *)&block, 0x12u);
        }
        if ((**v8)(a1 + 80, 20))
        {
          v94 = &aBlock;
          if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v94 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
          ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Replying to client's command: %s, with return code: %d", v93, v94, v87);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x2199A486C](&block);
        }
        xpc_connection_send_message((xpc_connection_t)v63, v67);
        v81 = xpc_null_create();
        v95 = xpc_null_create();
        xpc_release(v19);
        xpc_release(v95);
        v96 = HIBYTE(aBlock.__r_.__value_.__r.__words[2]);
        if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v96 = aBlock.__r_.__value_.__l.__size_;
        if (v96 == 8)
        {
          v97 = &aBlock;
          if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v97 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
          if (v97->__r_.__value_.__r.__words[0] == *(_QWORD *)"eventsOn" && *(_DWORD *)(a1 + 232) == 1)
          {
            v98 = xpc_dictionary_create(0, 0, 0);
            if (v98 || (v98 = xpc_null_create()) != 0)
            {
              if (MEMORY[0x2199A4C50](v98) == v21)
              {
                xpc_retain(v98);
                v99 = v98;
              }
              else
              {
                v99 = xpc_null_create();
              }
            }
            else
            {
              v99 = xpc_null_create();
              v98 = 0;
            }
            xpc_release(v98);
            v123 = xpc_string_create("ServerStateStarted");
            if (!v123)
              v123 = xpc_null_create();
            xpc::dict::object_proxy::operator=(&v124, v99, "KeyServerState", &v123);
            xpc_release(v124);
            v124 = 0;
            xpc_release(v123);
            v123 = 0;
            if (v63)
            {
              xpc_retain(v63);
              v101 = v63;
            }
            else
            {
              v101 = xpc_null_create();
            }
            std::string::basic_string[abi:ne180100]<0>(&__p, "EventServerStateChange");
            if (v99)
            {
              xpc_retain(v99);
              v102 = v99;
            }
            else
            {
              v102 = xpc_null_create();
            }
            v121 = 0;
            v122 = 0;
            block.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
            block.__r_.__value_.__l.__size_ = 1174405120;
            block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke;
            v129 = &__block_descriptor_tmp_61;
            v130 = (void *)a1;
            v131 = v102;
            if (v102)
              xpc_retain(v102);
            else
              v131 = xpc_null_create();
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v132, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            else
              v132 = __p;
            v133 = v101;
            if (v101)
              xpc_retain(v101);
            else
              v133 = (dispatch_object_t)xpc_null_create();
            v103 = v121;
            if (v121)
              v104 = _Block_copy(v121);
            else
              v104 = 0;
            v105 = (uint64_t *)(a1 + 8);
            v106 = v122;
            v134 = v104;
            v135 = v122;
            if (v122)
              dispatch_retain(v122);
            ctu::SharedSynchronizable<ctu::XpcServer>::execute_wrapped(v105, (uint64_t)&block);
            if (v135)
              dispatch_release(v135);
            if (v134)
              _Block_release(v134);
            xpc_release(v133);
            v133 = 0;
            if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v132.__r_.__value_.__l.__data_);
            xpc_release(v131);
            if (v106)
              dispatch_release(v106);
            if (v103)
              _Block_release(v103);
            xpc_release(v102);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            xpc_release(v101);
            xpc_release(v99);
          }
        }
        goto LABEL_197;
      default:
        goto LABEL_196;
    }
    v87 = 3760250882;
LABEL_233:
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&block.__r_.__value_.__l.__data_);
    goto LABEL_234;
  }
LABEL_198:
  if (v65 < 0)
    operator delete(aBlock.__r_.__value_.__l.__data_);
  xpc_release(v63);
LABEL_201:
  xpc_release(v19);
  v82 = (std::__shared_weak_count *)v114;
  if (v114)
  {
    v83 = (unint64_t *)(v114 + 8);
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }
}

void sub_212D01DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, xpc_object_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,xpc_object_t a26,xpc_object_t a27,char a28,uint64_t a29,xpc_object_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,uint64_t a50,xpc_object_t object)
{
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  xpc_release(object);
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a30);
  xpc_release(v56);
  if (a41 < 0)
    operator delete(__p);
  xpc_release(v55);
  xpc_release(v52);
  xpc_release(v54);
  if (a24 < 0)
    operator delete(a19);
  xpc_release(v53);
  xpc_release(v51);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void xpc::connection::to_debug_string(xpc::connection *this, uint64_t a2)
{
  char *v3;

  v3 = (char *)MEMORY[0x2199A4C08](a2);
  memset(this, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(this, v3);
  free(v3);
}

xpc_object_t *xpc::array::iterator::iterator(xpc_object_t *a1, xpc_object_t object, void *a3)
{
  *a1 = object;
  if (object)
    xpc_retain(object);
  else
    *a1 = xpc_null_create();
  a1[1] = a3;
  return a1;
}

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t **a1, void **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *result;
  uint64_t *v7[3];
  uint64_t v8;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  result = *v5;
  if (!*v5)
  {
    memset(v7, 170, sizeof(v7));
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, v7);
    std::__tree<std::string>::__insert_node_at(a1, v8, v5, v7[0]);
    return v7[0];
  }
  return result;
}

_QWORD *std::__tree<std::string>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

void std::__tree<std::string>::__construct_node<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a1 + 8;
  memset(a3, 170, 24);
  v6 = (char *)operator new(0x38uLL);
  *a3 = v6;
  a3[1] = v5;
  *((_BYTE *)a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v7->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  *((_BYTE *)a3 + 16) = 1;
}

void sub_212D0242C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void **v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::string>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::set<std::string>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<std::string>::insert[abi:ne180100]<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(a1, *(void ***)a2, (void **)(a2 + 8));
  return a1;
}

void sub_212D02524(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::string>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<std::string>::insert[abi:ne180100]<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(uint64_t *result, void **a2, void **a3)
{
  void **v4;
  uint64_t **v5;
  uint64_t v6;
  void **v7;
  void **v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = (uint64_t)(result + 1);
    do
    {
      result = std::__tree<std::string>::__emplace_hint_unique_key_args<std::string,std::string const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      v7 = (void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (void **)v4[2];
          v9 = *v8 == v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::string>::__emplace_hint_unique_key_args<std::string,std::string const&>(uint64_t **a1, uint64_t a2, void **a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8[3];
  uint64_t v9;
  void **v10;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = (void **)0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    memset(v8, 170, sizeof(v8));
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a4, v8);
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v10, v6, v8[0]);
    return v8[0];
  }
  return result;
}

void **std::__tree<std::string>::__find_equal<std::string>(_QWORD *a1, uint64_t a2, void ***a3, uint64_t *a4, void **a5)
{
  void **v9;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void **v14;
  void **v15;
  _QWORD *v16;
  BOOL v17;
  void **v19;

  v9 = (void **)(a1 + 1);
  if (a1 + 1 == (_QWORD *)a2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, (void **)(a2 + 32)) & 0x80) != 0)
  {
    if (*a1 == a2)
    {
      v12 = (_QWORD *)a2;
    }
    else
    {
      v11 = *(_QWORD **)a2;
      if (*(_QWORD *)a2)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)v11[1];
        }
        while (v11);
      }
      else
      {
        v16 = (_QWORD *)a2;
        do
        {
          v12 = (_QWORD *)v16[2];
          v17 = *v12 == (_QWORD)v16;
          v16 = v12;
        }
        while (v17);
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v12 + 4, a5) & 0x80) == 0)
        return (void **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, a3, a5);
    }
    if (*(_QWORD *)a2)
    {
      *a3 = (void **)v12;
      return (void **)(v12 + 1);
    }
    else
    {
      *a3 = (void **)a2;
      return (void **)a2;
    }
  }
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((_QWORD *)(a2 + 32), a5) & 0x80) != 0)
  {
    a4 = (uint64_t *)(a2 + 8);
    v13 = *(_QWORD *)(a2 + 8);
    if (v13)
    {
      v14 = *(void ***)(a2 + 8);
      do
      {
        v15 = v14;
        v14 = (void **)*v14;
      }
      while (v14);
    }
    else
    {
      v19 = (void **)a2;
      do
      {
        v15 = (void **)v19[2];
        v17 = *v15 == v19;
        v19 = v15;
      }
      while (!v17);
    }
    if (v15 == v9)
      goto LABEL_27;
    if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, v15 + 4) & 0x80) != 0)
    {
      v13 = *a4;
LABEL_27:
      if (v13)
      {
        *a3 = v15;
        return v15;
      }
      else
      {
        *a3 = (void **)a2;
      }
      return (void **)a4;
    }
    return (void **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  *a3 = (void **)a2;
  *a4 = a2;
  return (void **)a4;
}

void std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>(xpc_object_t *a1)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  xpc_release(*a1);
  *a1 = 0;
}

_QWORD *std::shared_ptr<TelephonyXPC::ServerClientState::State>::operator=[abi:ne180100](_QWORD *a1, uint64_t a2, uint64_t a3)
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

_QWORD *TelephonyXPC::Server::State::getClientState_sync(_QWORD *result, uint64_t a2, unint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  *result = 0;
  result[1] = 0;
  v3 = *(_QWORD **)(a2 + 304);
  if (v3)
  {
    v4 = (_QWORD *)(a2 + 304);
    do
    {
      v5 = v3[4];
      v6 = v5 >= a3;
      if (v5 >= a3)
        v7 = v3;
      else
        v7 = v3 + 1;
      if (v6)
        v4 = v3;
      v3 = (_QWORD *)*v7;
    }
    while (*v7);
    if (v4 != (_QWORD *)(a2 + 304) && v4[4] <= a3)
      return std::shared_ptr<TelephonyXPC::ServerClientState::State>::operator=[abi:ne180100](result, v4[5], v4[6]);
  }
  return result;
}

void ___ZN12TelephonyXPC6Server5State24handlePublicMessage_syncEN3xpc10connectionERNS2_4dictE_block_invoke(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t object;

  v6 = MEMORY[0x2199A4C50](*(_QWORD *)(a1 + 32));
  v7 = MEMORY[0x24BDACFA0];
  if (v6 == MEMORY[0x24BDACFA0])
  {
    v11 = xpc_int64_create(a2);
    if (!v11)
      v11 = xpc_null_create();
    xpc::dict::object_proxy::operator=(&object, *(xpc_object_t *)(a1 + 32), "commandResult", &v11);
    xpc_release(object);
    xpc_release(v11);
    if (MEMORY[0x2199A4C50](*a3) == v7)
    {
      v8 = (void *)*a3;
      v9 = v8;
      if (v8)
        xpc_retain(v8);
      else
        v9 = xpc_null_create();
      xpc::dict::object_proxy::operator=(&v10, *(xpc_object_t *)(a1 + 32), "commandData", &v9);
      xpc_release(v10);
      xpc_release(v9);
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
}

xpc_object_t __copy_helper_block_e8_32c15_ZTSN3xpc4dictE40c22_ZTSN3xpc10connectionE(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  xpc_object_t result;

  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  if (v4)
    xpc_retain(v4);
  else
    *(_QWORD *)(a1 + 32) = xpc_null_create();
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  if (v5)
    return xpc_retain(v5);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c15_ZTSN3xpc4dictE40c22_ZTSN3xpc10connectionE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
}

uint64_t dispatch::callback<void({block_pointer})(int,xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEclIJS2_S4_S7_EEEv11qos_class_tDpT__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *aBlock;
  dispatch_object_t object;
  xpc_object_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v2 = a1[4];
  v3 = (std::__shared_weak_count *)a1[6];
  v15 = a1[5];
  v16 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (void *)a1[7];
  v14 = v6;
  if (v6)
    xpc_retain(v6);
  else
    v14 = xpc_null_create();
  v7 = (void *)a1[8];
  if (v7)
    v7 = _Block_copy(v7);
  v8 = a1[9];
  aBlock = v7;
  object = v8;
  if (v8)
    dispatch_retain(v8);
  (*(void (**)(uint64_t, uint64_t *, xpc_object_t *, void **))(v2 + 16))(v2, &v15, &v14, &aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v14);
  v14 = 0;
  v9 = v16;
  if (v16)
  {
    v10 = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_212D02BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, dispatch_object_t object, xpc_object_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  unint64_t *p_shared_owners;
  unint64_t v16;

  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(a12);
  if (a14)
  {
    p_shared_owners = (unint64_t *)&a14->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
      std::__shared_weak_count::__release_weak(a14);
    }
  }
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c126_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS_8callbackIU13block_pointerFviS4_EEEEEE40c39_ZTSN12TelephonyXPC17ServerClientStateE56c15_ZTSN3xpc4dictE64c57_ZTSN8dispatch8callbackIU13block_pointerFviN3xpc4dictEEEE(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = (void *)a2[4];
  if (v4)
    v4 = _Block_copy(v4);
  v6 = a2[5];
  v5 = a2[6];
  a1[4] = v4;
  a1[5] = v6;
  a1[6] = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = (void *)a2[7];
  a1[7] = v9;
  if (v9)
    xpc_retain(v9);
  else
    a1[7] = xpc_null_create();
  v10 = (void *)a2[8];
  if (v10)
    v10 = _Block_copy(v10);
  v11 = a2[9];
  a1[8] = v10;
  a1[9] = v11;
  if (v11)
    dispatch_retain(v11);
}

void __destroy_helper_block_e8_32c126_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS_8callbackIU13block_pointerFviS4_EEEEEE40c39_ZTSN12TelephonyXPC17ServerClientStateE56c15_ZTSN3xpc4dictE64c57_ZTSN8dispatch8callbackIU13block_pointerFviN3xpc4dictEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    _Block_release(v3);
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(_QWORD *)(a1 + 56) = 0;
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](a1 + 40);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    _Block_release(v4);
}

void TelephonyXPC::Server::State::registerNotification(uint64_t a1, xpc_object_t object, char a3, const void **a4)
{
  _QWORD v7[5];
  xpc_object_t objecta;
  const void *v9;
  char v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1174405120;
  v7[2] = ___ZN12TelephonyXPC6Server5State20registerNotificationEN3xpc10connectionEbN3ctu2cf11CFSharedRefIK9__CFArrayEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_55;
  v7[4] = a1;
  objecta = object;
  if (object)
    xpc_retain(object);
  else
    objecta = xpc_null_create();
  v10 = a3;
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(&v9, a4);
  ctu::SharedSynchronizable<ctu::XpcServer>::execute_wrapped((uint64_t *)(a1 + 8), (uint64_t)v7);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v9);
  xpc_release(objecta);
}

_QWORD *ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef cf)
{
  CFTypeID v4;

  if (cf && (v4 = CFGetTypeID(cf), v4 == CFArrayGetTypeID()))
  {
    *a1 = cf;
    CFRetain(cf);
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void ___ZN12TelephonyXPC6Server5State20registerNotificationEN3xpc10connectionEbN3ctu2cf11CFSharedRefIK9__CFArrayEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc::object *v3;
  xpc_object_t v4;
  int v5;
  NSObject *v6;
  const char *v7;
  _BYTE *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void **v12;
  void *__p[2];
  char v14;
  const void *v15;
  unint64_t v16;
  unint64_t v17;
  _BYTE buf[12];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (xpc::object *)(a1 + 40);
  v4 = *(xpc_object_t *)(a1 + 40);
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  if (v4)
    xpc_retain(v4);
  else
    v4 = xpc_null_create();
  TelephonyXPC::Server::State::getClientState_sync(&v16, v2, (unint64_t)v4);
  xpc_release(v4);
  if (v16)
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(&v15, (const void **)(a1 + 48));
    TelephonyXPC::ServerClientState::registerNotification_sync((void **)&v16, v5, &v15);
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v15);
  }
  else if (MEMORY[0x2199A4C50](*(_QWORD *)v3) == MEMORY[0x24BDACF88])
  {
    v6 = *(NSObject **)(v2 + 112);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      xpc::object::to_string(v3);
      v12 = v14 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v12;
      _os_log_debug_impl(&dword_212CF9000, v6, OS_LOG_TYPE_DEBUG, "#D %s is not in client list", buf, 0xCu);
      if (v14 < 0)
        operator delete(__p[0]);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 20))
    {
      xpc::object::to_string(v3);
      v8 = v19 >= 0 ? buf : *(_BYTE **)buf;
      ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s is not in client list", v7, v8);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x2199A486C](__p);
      if (v19 < 0)
        operator delete(*(void **)buf);
    }
  }
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
}

const void **__copy_helper_block_e8_40c22_ZTSN3xpc10connectionE48c39_ZTSN3ctu2cf11CFSharedRefIK9__CFArrayEE(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  if (v4)
    xpc_retain(v4);
  else
    *(_QWORD *)(a1 + 40) = xpc_null_create();
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef((const void **)(a1 + 48), (const void **)(a2 + 48));
}

void __destroy_helper_block_e8_40c22_ZTSN3xpc10connectionE48c39_ZTSN3ctu2cf11CFSharedRefIK9__CFArrayEE(uint64_t a1)
{
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  const char **v7;
  const char *v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  xpc_object_t v18;
  _BOOL4 isNotificationRegistered_sync;
  _BOOL4 v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  __int128 v24;
  int v25;
  std::string::size_type v26;
  uint64_t SystemTime;
  std::string *v28;
  const char *v29;
  NSObject *v30;
  __int128 v31;
  int v32;
  std::string::size_type v33;
  uint64_t v34;
  const char *v35;
  std::string *v36;
  _xpc_connection_s *v37;
  NSObject *v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  xpc_object_t v54;
  _QWORD block[6];
  std::__shared_weak_count *v56;
  xpc_object_t v57;
  std::string v58;
  void *aBlock;
  dispatch_object_t object;
  _QWORD handler[6];
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  std::string __p;
  NSObject *v66;
  std::string v67;
  std::string v68;
  __int128 *v69;
  unint64_t v70;
  xpc_object_t v71;
  xpc_object_t v72;
  xpc_object_t v73;
  xpc_object_t v74;
  xpc_object_t v75;
  xpc_object_t v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  std::string *v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = MEMORY[0x24BDACFA0];
  if (v3 || (v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x2199A4C50](v3) == v4)
    {
      xpc_retain(v3);
      v5 = v3;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v3 = 0;
  }
  xpc_release(v3);
  if (MEMORY[0x2199A4C50](*(_QWORD *)(a1 + 40)) == v4)
  {
    v6 = *(void **)(a1 + 40);
    v75 = v6;
    if (v6)
      xpc_retain(v6);
    else
      v75 = xpc_null_create();
    xpc::dict::object_proxy::operator=(&v76, v5, "eventData", &v75);
    xpc_release(v76);
    v76 = 0;
    xpc_release(v75);
    v75 = 0;
  }
  v73 = xpc_string_create("eventNotification");
  if (!v73)
    v73 = xpc_null_create();
  xpc::dict::object_proxy::operator=(&v74, v5, "command", &v73);
  xpc_release(v74);
  v74 = 0;
  xpc_release(v73);
  v73 = 0;
  v7 = (const char **)(a1 + 48);
  v8 = (const char *)(a1 + 48);
  if (*(char *)(a1 + 71) < 0)
    v8 = *v7;
  v71 = xpc_string_create(v8);
  if (!v71)
    v71 = xpc_null_create();
  xpc::dict::object_proxy::operator=(&v72, v5, "event", &v71);
  xpc_release(v72);
  v72 = 0;
  xpc_release(v71);
  v71 = 0;
  v9 = dispatch_group_create();
  v10 = *(std::__shared_weak_count **)(v2 + 16);
  if (!v10 || (v11 = *(_QWORD *)(v2 + 8), (v12 = std::__shared_weak_count::lock(v10)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v13 = v12;
  p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
  do
    v15 = __ldxr(p_shared_weak_owners);
  while (__stxr(v15 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v13);
  }
  v69 = (__int128 *)0xAAAAAAAAAAAAAAAALL;
  v70 = 0xAAAAAAAAAAAAAAAALL;
  v18 = *(xpc_object_t *)(a1 + 72);
  if (v18)
    xpc_retain(*(xpc_object_t *)(a1 + 72));
  else
    v18 = xpc_null_create();
  TelephonyXPC::Server::State::getClientState_sync(&v69, v2, (unint64_t)v18);
  xpc_release(v18);
  if (*(char *)(a1 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v68, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    *(_OWORD *)&v68.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
    v68.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 64);
  }
  isNotificationRegistered_sync = TelephonyXPC::ServerClientState::isNotificationRegistered_sync((uint64_t *)&v69, (uint64_t)&v68);
  v20 = isNotificationRegistered_sync;
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v68.__r_.__value_.__l.__data_);
    if (!v20)
      goto LABEL_78;
  }
  else if (!isNotificationRegistered_sync)
  {
    goto LABEL_78;
  }
  v21 = *(NSObject **)(v2 + 112);
  v53 = v11;
  v54 = v5;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (const char *)(a1 + 48);
    if (*(char *)(a1 + 71) < 0)
      v22 = *v7;
    v23 = v9;
    if (*((char *)v69 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v67, *(const std::string::value_type **)v69, *((_QWORD *)v69 + 1));
    }
    else
    {
      v24 = *v69;
      v67.__r_.__value_.__r.__words[2] = *((_QWORD *)v69 + 2);
      *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v24;
    }
    v25 = SHIBYTE(v67.__r_.__value_.__r.__words[2]);
    v26 = v67.__r_.__value_.__r.__words[0];
    SystemTime = TelephonyUtilGetSystemTime();
    v28 = &v67;
    *(_DWORD *)buf = 136315650;
    if (v25 < 0)
      v28 = (std::string *)v26;
    v78 = v22;
    v79 = 2080;
    v80 = v28;
    v81 = 2048;
    v82 = SystemTime;
    _os_log_impl(&dword_212CF9000, v21, OS_LOG_TYPE_DEFAULT, "#I Sending %s to %s at %llu", buf, 0x20u);
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v67.__r_.__value_.__l.__data_);
    v9 = v23;
    v11 = v53;
    v5 = v54;
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 40))
  {
    v29 = (const char *)(a1 + 48);
    if (*(char *)(a1 + 71) < 0)
      v29 = *v7;
    v30 = v9;
    if (*((char *)v69 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v67, *(const std::string::value_type **)v69, *((_QWORD *)v69 + 1));
    }
    else
    {
      v31 = *v69;
      v67.__r_.__value_.__r.__words[2] = *((_QWORD *)v69 + 2);
      *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v31;
    }
    v32 = SHIBYTE(v67.__r_.__value_.__r.__words[2]);
    v33 = v67.__r_.__value_.__r.__words[0];
    v34 = TelephonyUtilGetSystemTime();
    v36 = &v67;
    if (v32 < 0)
      v36 = (std::string *)v33;
    ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Sending %s to %s at %llu", v35, v29, v36, v34);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x2199A486C](buf);
    v9 = v30;
    v11 = v53;
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v67.__r_.__value_.__l.__data_);
    v5 = v54;
  }
  if (*(_QWORD *)(a1 + 80) && *(_QWORD *)(a1 + 88))
  {
    dispatch_group_enter(v9);
    v37 = *(_xpc_connection_s **)(a1 + 72);
    v38 = *(NSObject **)(v2 + 24);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_56;
    handler[3] = &__block_descriptor_tmp_57;
    handler[4] = v2;
    handler[5] = v11;
    v62 = v13;
    do
      v39 = __ldxr(p_shared_weak_owners);
    while (__stxr(v39 + 1, p_shared_weak_owners));
    v63 = (uint64_t)v69;
    v64 = (std::__shared_weak_count *)v70;
    if (v70)
    {
      v40 = (unint64_t *)(v70 + 8);
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
    }
    if (*(char *)(a1 + 71) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 64);
    }
    v66 = v9;
    xpc_connection_send_message_with_reply(v37, v5, v38, handler);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v42 = v64;
    if (v64)
    {
      v43 = (unint64_t *)&v64->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    if (v62)
      std::__shared_weak_count::__release_weak(v62);
  }
  else
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), v5);
  }
LABEL_78:
  if (*(_QWORD *)(a1 + 80) && *(_QWORD *)(a1 + 88))
  {
    v45 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_58;
    block[3] = &__block_descriptor_tmp_60;
    block[4] = v2;
    block[5] = v11;
    v56 = v13;
    do
      v46 = __ldxr(p_shared_weak_owners);
    while (__stxr(v46 + 1, p_shared_weak_owners));
    v47 = *(void **)(a1 + 72);
    v57 = v47;
    if (v47)
      xpc_retain(v47);
    else
      v57 = xpc_null_create();
    if (*(char *)(a1 + 71) < 0)
    {
      std::string::__init_copy_ctor_external(&v58, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      *(_OWORD *)&v58.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
      v58.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 64);
    }
    v48 = *(void **)(a1 + 80);
    if (v48)
      v48 = _Block_copy(v48);
    v49 = *(NSObject **)(a1 + 88);
    aBlock = v48;
    object = v49;
    if (v49)
      dispatch_retain(v49);
    dispatch_group_notify(v9, v45, block);
    if (object)
      dispatch_release(object);
    if (aBlock)
      _Block_release(aBlock);
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
    xpc_release(v57);
    v57 = 0;
    if (v56)
      std::__shared_weak_count::__release_weak(v56);
  }
  dispatch_release(v9);
  v50 = (std::__shared_weak_count *)v70;
  if (v70)
  {
    v51 = (unint64_t *)(v70 + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  std::__shared_weak_count::__release_weak(v13);
  xpc_release(v5);
}

void sub_212D038F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,xpc_object_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,std::__shared_weak_count *a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  std::__shared_weak_count *v49;
  uint64_t v50;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a35);
  if (a34)
    std::__shared_weak_count::__release_weak(a34);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v50 - 224);
  std::__shared_weak_count::__release_weak(v49);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_56(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  __int128 *v7;
  __int128 v8;
  std::string *v9;
  _QWORD *v10;
  uint64_t SystemTime;
  __int128 *v12;
  __int128 v13;
  std::string *v14;
  _QWORD *v15;
  uint64_t v16;
  const char *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::string v20;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  std::string *v24;
  __int16 v25;
  _QWORD *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && (v3 = *(_QWORD *)(a1 + 32), v4 = std::__shared_weak_count::lock(v2), (v22 = v4) != 0))
  {
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(__int128 **)(a1 + 56);
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
        }
        else
        {
          v8 = *v7;
          v20.__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
          *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v8;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v9 = &v20;
        else
          v9 = (std::string *)v20.__r_.__value_.__r.__words[0];
        v10 = (_QWORD *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v10 = (_QWORD *)*v10;
        SystemTime = TelephonyUtilGetSystemTime();
        *(_DWORD *)buf = 136315650;
        v24 = v9;
        v25 = 2080;
        v26 = v10;
        v27 = 2048;
        v28 = SystemTime;
        _os_log_impl(&dword_212CF9000, v6, OS_LOG_TYPE_DEFAULT, "#I %s responded to %s at %llu", buf, 0x20u);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v20.__r_.__value_.__l.__data_);
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
      {
        v12 = *(__int128 **)(a1 + 56);
        if (*((char *)v12 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
        }
        else
        {
          v13 = *v12;
          v20.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
          *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v13;
        }
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v14 = &v20;
        else
          v14 = (std::string *)v20.__r_.__value_.__r.__words[0];
        v15 = (_QWORD *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0)
          v15 = (_QWORD *)*v15;
        v16 = TelephonyUtilGetSystemTime();
        ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"%s responded to %s at %llu", v17, v14, v15, v16);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x2199A486C](buf);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v20.__r_.__value_.__l.__data_);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
  }
}

void sub_212D03CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_58(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  NSObject *v5;
  void **v6;
  _QWORD *v7;
  const char *v8;
  _BYTE *v9;
  _QWORD *v10;
  const void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *__p[2];
  uint64_t (*v18)(uint64_t);
  void *v19;
  void *aBlock;
  uint64_t v21;
  std::__shared_weak_count *v22;
  _BYTE buf[12];
  __int16 v24;
  _QWORD *v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v21 = 0;
  v22 = 0;
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    v22 = v4;
    if (v4)
    {
      v21 = *(_QWORD *)(a1 + 40);
      if (v21)
      {
        v5 = *(NSObject **)(v2 + 112);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          xpc::object::to_string((xpc::object *)(a1 + 56));
          v6 = (void **)__p[0];
          if (SHIBYTE(v18) >= 0)
            v6 = __p;
          v7 = (_QWORD *)(a1 + 64);
          if (*(char *)(a1 + 87) < 0)
            v7 = (_QWORD *)*v7;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v6;
          v24 = 2080;
          v25 = v7;
          _os_log_impl(&dword_212CF9000, v5, OS_LOG_TYPE_DEFAULT, "#I Client %s responded to %s", buf, 0x16u);
          if (SHIBYTE(v18) < 0)
            operator delete(__p[0]);
        }
        if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 40))
        {
          xpc::object::to_string((xpc::object *)(a1 + 56));
          if (v26 >= 0)
            v9 = buf;
          else
            v9 = *(_BYTE **)buf;
          v10 = (_QWORD *)(a1 + 64);
          if (*(char *)(a1 + 87) < 0)
            v10 = (_QWORD *)*v10;
          ctu::LogMessageBuffer::createWithFormat((ctu::LogMessageBuffer *)"Client %s responded to %s", v8, v9, v10);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x2199A486C](__p);
          if (v26 < 0)
            operator delete(*(void **)buf);
        }
      }
    }
  }
  else
  {
    v4 = 0;
  }
  v11 = *(const void **)(a1 + 88);
  if (v11)
    v12 = _Block_copy(v11);
  else
    v12 = 0;
  v13 = *(NSObject **)(a1 + 96);
  __p[0] = (void *)MEMORY[0x24BDAC760];
  __p[1] = (void *)1174405120;
  v18 = ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke;
  v19 = &__block_descriptor_tmp_40;
  if (v12)
    v14 = _Block_copy(v12);
  else
    v14 = 0;
  aBlock = v14;
  dispatch_async(v13, __p);
  if (aBlock)
    _Block_release(aBlock);
  if (v12)
    _Block_release(v12);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c23_ZTSKN3xpc10connectionE64c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  std::string *v8;
  __int128 v9;
  void *v10;
  NSObject *v11;

  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *(void **)(a2 + 56);
  a1[7] = v7;
  if (v7)
    xpc_retain(v7);
  else
    a1[7] = xpc_null_create();
  v8 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 64);
    a1[10] = *(_QWORD *)(a2 + 80);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  v10 = *(void **)(a2 + 88);
  if (v10)
    v10 = _Block_copy(v10);
  v11 = *(NSObject **)(a2 + 96);
  a1[11] = v10;
  a1[12] = v11;
  if (v11)
    dispatch_retain(v11);
}

void sub_212D0407C(_Unwind_Exception *a1)
{
  uint64_t v1;
  xpc_object_t *v2;
  std::__shared_weak_count *v4;

  xpc::connection::~connection(v2);
  v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c23_ZTSKN3xpc10connectionE64c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  std::__shared_weak_count *v4;

  v2 = *(NSObject **)(a1 + 96);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 88);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(_QWORD *)(a1 + 56) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

void __copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c23_ZTSKN3xpc10connectionE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(std::string *a1, uint64_t a2)
{
  void *v4;
  std::string *v5;
  __int128 v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(void **)(a2 + 40);
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  if (v4)
    xpc_retain(v4);
  else
    a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
  v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *(void **)(a2 + 72);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
  if (v7)
    xpc_retain(v7);
  else
    a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  v8 = *(void **)(a2 + 80);
  if (v8)
    v8 = _Block_copy(v8);
  v9 = *(NSObject **)(a2 + 88);
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v8;
  a1[3].__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
  if (v9)
    dispatch_retain(v9);
}

void sub_212D041CC(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c23_ZTSKN3xpc10connectionE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 88);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 80);
  if (v3)
    _Block_release(v3);
  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(_QWORD *)(a1 + 72) = 0;
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
    if (*(uint64_t **)v12 != v7)
      break;
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
    if (v20 && !*((_BYTE *)v20 + 24))
    {
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
      goto LABEL_72;
    }
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
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
  if (!*v7 || *((_BYTE *)v15 + 24))
  {
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_59;
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
    goto LABEL_49;
  }
  v16 = (uint64_t *)v7[1];
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_59:
    v15 = v7;
  }
  else
  {
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
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(xpc_object_t *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(*a1);
    std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>(a1 + 4);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

_QWORD *TelephonyXPC::ServerClientState::ServerClientState(_QWORD *a1, __int128 *a2)
{
  std::string *v4;

  v4 = (std::string *)operator new(0x50uLL);
  TelephonyXPC::ServerClientState::State::State(v4, a2);
  return std::shared_ptr<TelephonyXPC::ServerClientState::State>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerClientState::State,void>(a1, (uint64_t)v4);
}

void sub_212D0470C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *TelephonyXPC::ServerClientState::ServerClientState(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

std::string *TelephonyXPC::ServerClientState::setCheckedIn(std::string **a1, const std::string *a2)
{
  std::string *v2;
  std::string *result;

  v2 = *a1;
  result = std::string::operator=(*a1, a2);
  v2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

BOOL TelephonyXPC::ServerClientState::isNotificationRegistered_sync(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  void **v3;
  std::string __p;

  v2 = *a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  v3 = std::__tree<std::string>::find<std::string>(v2 + 32, (void **)&__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v2 + 40 != (_QWORD)v3;
}

void sub_212D04814(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

const void **TelephonyXPC::ServerClientState::registerNotification_sync(void **a1, int a2, const void **a3)
{
  void *v4;
  const __CFArray *v5;
  CFRange v6;
  void (__cdecl *v7)(const void *, void *);
  CFArrayRef theArray;

  v4 = *a1;
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef((const void **)&theArray, a3);
  v5 = theArray;
  v6.length = CFArrayGetCount(theArray);
  if (a2)
    v7 = (void (__cdecl *)(const void *, void *))TelephonyXPC::ServerClientState::State::registerNotificationApplier;
  else
    v7 = (void (__cdecl *)(const void *, void *))TelephonyXPC::ServerClientState::State::unregisterNotificationApplier;
  v6.location = 0;
  CFArrayApplyFunction(v5, v6, v7, v4);
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_212D048AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void TelephonyXPC::ServerClientState::getName(TelephonyXPC::ServerClientState *this@<X0>, std::string *a2@<X8>)
{
  __int128 *v2;
  __int128 v3;

  v2 = *(__int128 **)this;
  if (*(char *)(*(_QWORD *)this + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
  }
  else
  {
    v3 = *v2;
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

void TelephonyXPC::ServerClientState::setClientEntitlements(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  char *v4;

  v2 = *a1;
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v3, a2);
  if ((_QWORD **)(v2 + 56) != &v3)
    std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t *)(v2 + 56), v3, &v4);
  std::__tree<std::string>::destroy((uint64_t)&v3, v4);
}

void sub_212D04940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  std::__tree<std::string>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

BOOL TelephonyXPC::ServerClientState::isClientEntitled(uint64_t *a1, void **a2)
{
  uint64_t v2;

  v2 = *a1;
  return v2 + 64 != (_QWORD)std::__tree<std::string>::find<std::string>(*a1 + 56, a2);
}

std::string *TelephonyXPC::ServerClientState::State::State(std::string *this, __int128 *a2)
{
  __int128 v3;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  this[1].__r_.__value_.__l.__size_ = (std::string::size_type)&this[1].__r_.__value_.__r.__words[2];
  this[3].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__r.__words[2] = 0;
  this[2].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__l.__size_ = (std::string::size_type)&this[2].__r_.__value_.__r.__words[2];
  return this;
}

void **std::__tree<std::string>::find<std::string>(uint64_t a1, void **a2)
{
  void **v2;
  _QWORD *v3;
  void **v5;
  char v6;
  _QWORD *v7;

  v2 = (void **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (void **)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = (void **)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void TelephonyXPC::ServerClientState::State::registerNotificationApplier(TelephonyXPC::ServerClientState::State *this, uint64_t **a2, void *a3)
{
  void *__p[2];
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = 0uLL;
  v7 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = 0uLL;
  v5 = 0;
  std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(a2 + 4, __p, (uint64_t)__p);
  if (SHIBYTE(v5) < 0)
    operator delete(__p[0]);
}

void sub_212D04AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TelephonyXPC::ServerClientState::State::unregisterNotificationApplier(TelephonyXPC::ServerClientState::State *this, _QWORD *a2, void *a3)
{
  void ***v4;
  void **v5;
  void **v6;
  void **v7;
  void **v8;
  void **v9;
  BOOL v10;
  uint64_t *v11;
  void *__p[2];
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v14 = 0uLL;
  v15 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = 0uLL;
  v13 = 0;
  v4 = (void ***)(a2 + 4);
  v5 = std::__tree<std::string>::find<std::string>((uint64_t)(a2 + 4), __p);
  v6 = v5;
  if (a2 + 5 != v5)
  {
    v7 = (void **)v5[1];
    if (v7)
    {
      do
      {
        v8 = v7;
        v7 = (void **)*v7;
      }
      while (v7);
    }
    else
    {
      v9 = v5;
      do
      {
        v8 = (void **)v9[2];
        v10 = *v8 == v9;
        v9 = v8;
      }
      while (!v10);
    }
    if (*v4 == v5)
      *v4 = v8;
    v11 = (uint64_t *)a2[5];
    --a2[6];
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, (uint64_t *)v6);
    if (*((char *)v6 + 55) < 0)
      operator delete(v6[4]);
    operator delete(v6);
  }
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
}

void sub_212D04BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t **leaf_high;
  _QWORD *v12;
  BOOL v13;
  uint64_t **v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18[3];

  v5 = (uint64_t **)result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t)(result + 1);
    *(_QWORD *)(v7 + 16) = 0;
    result[1] = 0;
    result[2] = 0;
    if (*(_QWORD *)(v6 + 8))
      v8 = *(uint64_t **)(v6 + 8);
    else
      v8 = (uint64_t *)v6;
    v18[0] = result;
    v18[1] = v8;
    v18[2] = v8;
    if (v8)
    {
      v18[1] = std::__tree<std::string>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 4));
          v10 = v18[2];
          v17 = 0xAAAAAAAAAAAAAAAALL;
          leaf_high = (uint64_t **)std::__tree<std::string>::__find_leaf_high((uint64_t)v5, &v17, v18[2] + 4);
          std::__tree<std::string>::__insert_node_at(v5, v17, leaf_high, v10);
          v8 = v18[1];
          v18[2] = v18[1];
          if (v18[1])
            v18[1] = std::__tree<std::string>::_DetachedTreeCache::__detach_next((uint64_t)v18[1]);
          v12 = (_QWORD *)v9[1];
          if (v12)
          {
            do
            {
              a2 = v12;
              v12 = (_QWORD *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v13 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v13);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t *)std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)v18);
  }
  if (a2 != a3)
  {
    do
    {
      memset(v18, 170, sizeof(v18));
      std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)v5, (uint64_t)(a2 + 4), v18);
      v17 = 0xAAAAAAAAAAAAAAAALL;
      v14 = (uint64_t **)std::__tree<std::string>::__find_leaf_high((uint64_t)v5, &v17, v18[0] + 4);
      result = std::__tree<std::string>::__insert_node_at(v5, v17, v14, v18[0]);
      v15 = (_QWORD *)a2[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)a2[2];
          v13 = *v16 == (_QWORD)a2;
          a2 = v16;
        }
        while (!v13);
      }
      a2 = v16;
    }
    while (v16 != a3);
  }
  return result;
}

void sub_212D04DD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::string>::__find_leaf_high(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v5 = (_QWORD *)v4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)(v4 + 32)) & 0x80) == 0)
          break;
        v4 = *v5;
        result = v5;
        if (!*v5)
          goto LABEL_8;
      }
      v4 = v5[1];
    }
    while (v4);
    result = v5 + 1;
  }
  else
  {
    result = (_QWORD *)(a1 + 8);
  }
LABEL_8:
  *a2 = v5;
  return result;
}

_QWORD *std::__tree<std::string>::_DetachedTreeCache::__detach_next(uint64_t a1)
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

uint64_t std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  std::__tree<std::string>::destroy(*(_QWORD *)a1, *(char **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = *(_QWORD *)(v3 + 16);
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::string>::destroy(*(_QWORD *)a1, (char *)v2);
  }
  return a1;
}

_QWORD *std::shared_ptr<TelephonyXPC::ServerClientState::State>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerClientState::State,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24CEA17C8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_212D04F4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<TelephonyXPC::ServerClientState::State>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<TelephonyXPC::ServerClientState::State>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<TelephonyXPC::ServerClientState::State>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::__tree<std::string>::destroy(a2 + 56, *(char **)(a2 + 64));
    std::__tree<std::string>::destroy(a2 + 32, *(char **)(a2 + 40));
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
    operator delete((void *)a2);
  }
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x24BED9638]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
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

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x24BED97E8]();
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x24BED9850]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::LogMessageBuffer::createWithFormat(ctu::LogMessageBuffer *this, const char *a2, ...)
{
  return MEMORY[0x24BED9978](this, a2);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9990](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x24BED99A0]();
}

uint64_t ctu::LoggerCommonBase::setInheritedLogLevel()
{
  return MEMORY[0x24BED99A8]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x24BED99B0]();
}

{
  return MEMORY[0x24BED99B8]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x24BED9680]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x24BED9688](this);
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x24BED9CF0](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x24BED9CF8]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
  MEMORY[0x24BED9D00](this);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D30]();
}

{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D50]();
}

{
  return MEMORY[0x24BED9D58]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D68]();
}

{
  return MEMORY[0x24BED9D70]();
}

{
  return MEMORY[0x24BED9D80]();
}

uint64_t xpc::bridge()
{
  return MEMORY[0x24BED9DB8]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog()
{
  return MEMORY[0x24BED9DC0]();
}

uint64_t ctu::LoggerCommonBase::getLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E58](this);
}

uint64_t ctu::LoggerCommonBase::getLocalLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E68](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x24BED9ED0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CEA0C48(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CEA0C50(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
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

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

