uint64_t eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve(uint64_t this, void *a2, int a3, char a4)
{
  *(_BYTE *)(this + 288) = 0;
  *(_QWORD *)this = off_251CC9EA0;
  *(_QWORD *)(this + 296) = a2;
  *(_DWORD *)(this + 292) = a3;
  *(_BYTE *)(this + 289) = a4;
  *(_BYTE *)(this + 304) = 15;
  return this;
}

void *eUICC::eUICCVinylMAVValve::GetVinylType@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  int v4;
  __int16 v5;
  __int16 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = eUICC::GetVinylType::Perform();
  v6 = v5;
  v7 = v4;
  gBBULogMaskGet();
  if (v7 || v6 != 1)
  {
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status 0x%hhx\n", v8, v9, v10, v7);
  }
  else
  {
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "status 0x%hhx cards_type: %hhu \n", v8, v9, v10, v6);
    *((_DWORD *)this + 2) = v6;
    *((_BYTE *)this + 285) = HIBYTE(v6);
    *((_BYTE *)this + 287) = HIBYTE(v6) == 3;
  }
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

void *eUICC::eUICCVinylMAVValve::GetData@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  unsigned __int8 v19;
  char v20;
  unsigned __int16 v21;
  __int128 v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[19];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[19];
  __int16 v35;
  __int16 v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int16 v40;

  if (*((_QWORD *)this + 37))
  {
    if (*((_BYTE *)this + 288))
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "eUICCVinylData cache is valid. Using cached data!\n", v4, v5, v6, v17);
LABEL_6:
      eUICC::logEUICCData((int *)this + 2);
      return memcpy(a2, (char *)this + 8, 0x119uLL);
    }
    *(_OWORD *)((char *)this + 248) = 0u;
    *(_OWORD *)((char *)this + 264) = 0u;
    *(_OWORD *)((char *)this + 216) = 0u;
    *(_OWORD *)((char *)this + 232) = 0u;
    *(_OWORD *)((char *)this + 184) = 0u;
    *(_OWORD *)((char *)this + 200) = 0u;
    *(_OWORD *)((char *)this + 152) = 0u;
    *(_OWORD *)((char *)this + 168) = 0u;
    *(_OWORD *)((char *)this + 120) = 0u;
    *(_OWORD *)((char *)this + 136) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)((char *)this + 104) = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + 40) = 0u;
    *(_OWORD *)((char *)this + 8) = 0u;
    *(_OWORD *)((char *)this + 273) = 0u;
    eUICC::GetData::Perform();
    *((_DWORD *)this + 2) = v19;
    *(_WORD *)((char *)this + 13) = bswap32(v21) >> 16;
    *(_OWORD *)((char *)this + 15) = v22;
    *((_BYTE *)this + 31) = v23;
    *((_OWORD *)this + 2) = v24;
    *((_OWORD *)this + 3) = v25;
    *((_OWORD *)this + 4) = v26;
    *((_OWORD *)this + 5) = v27;
    *(_DWORD *)((char *)this + 143) = *(_DWORD *)&v30[15];
    *((_OWORD *)this + 7) = v29;
    *((_OWORD *)this + 8) = *(_OWORD *)v30;
    *((_OWORD *)this + 6) = v28;
    *(_DWORD *)((char *)this + 218) = *(_DWORD *)&v34[15];
    *(_OWORD *)((char *)this + 203) = *(_OWORD *)v34;
    *(_OWORD *)((char *)this + 187) = v33;
    *(_OWORD *)((char *)this + 171) = v32;
    *(_OWORD *)((char *)this + 155) = v31;
    *((_WORD *)this + 115) = v35;
    *((_BYTE *)this + 250) = v37;
    *((_WORD *)this + 124) = v36;
    *(_OWORD *)((char *)this + 267) = v39;
    *(_OWORD *)((char *)this + 251) = v38;
    *((_BYTE *)this + 12) = v20;
    *(_WORD *)((char *)this + 283) = v40;
    *((_BYTE *)this + 286) = v19 == 4;
    if (*((_DWORD *)this + 2) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
    {
      *((_BYTE *)this + 288) = 1;
      goto LABEL_6;
    }
    gBBULogMaskGet();
    v11 = "error %d status %u sw1_sw2 0x%x\n";
    v17 = v18;
    v12 = 22;
    v13 = 0xFFFFFFFFLL;
LABEL_9:
    _BBULog(v12, v13, "eUICCVinylMAVValve", "", v11, v8, v9, v10, v17);
    return memcpy(a2, (char *)this + 8, 0x119uLL);
  }
  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
    _BBULog(1, 6, "eUICCVinylMAVValve", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCVinylMAVValve.cpp");
  if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
  {
    v11 = "No transport available.. bail out\n";
    v12 = 0;
    v13 = 1;
    goto LABEL_9;
  }
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

uint64_t eUICC::eUICCVinylMAVValve::SetCardMode(uint64_t a1, int a2, char a3)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD __src[37];

  __src[36] = *MEMORY[0x24BDAC8D0];
  v6 = (_DWORD *)(a1 + 8);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)a1 + 8))(__src);
  memcpy(v6, __src, 0x119uLL);
  if ((a3 & 1) != 0)
    goto LABEL_5;
  if (*v6 != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"outData.Valid()");
    return 18;
  }
  if (*(unsigned __int8 *)(a1 + 31) != a2)
  {
LABEL_5:
    v10 = *(_DWORD *)(a1 + 292);
    __src[0] = *(_QWORD *)(a1 + 296);
    LOBYTE(__src[1]) = v10;
    BYTE1(__src[1]) = a2;
    WORD1(__src[1]) = 1;
    HIDWORD(__src[1]) = 10000;
    v12 = eUICC::SwitchMode::Perform();
    if (!v12 && (v11 & 0xFF00000000) == 0x100000000 && a2 == BYTE5(v11))
      return 0;
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Failed err %d status %hhu mode %d sw1 0x%x sw2 0x%x\n", v13, v14, v15, v12);
    return 18;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Baseband already in mode %hhu\n", v7, v8, v9, a2);
  return 0;
}

uint64_t eUICC::eUICCVinylMAVValve::DeleteProfile(eUICC::eUICCVinylMAVValve *this)
{
  char v1;
  int v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  char v14;

  if (*((_QWORD *)this + 37))
  {
    v2 = eUICC::DeleteProfile::Perform();
    if (v2 || (result = 0, v1 != 1))
    {
      gBBULogMaskGet();
      v7 = "DeleteProfile failed, error %d status %hhu sw1 0x%x sw2 0x%x\n";
      v14 = v2;
      v8 = 22;
      v9 = 0xFFFFFFFFLL;
LABEL_5:
      _BBULog(v8, v9, "eUICCVinylMAVValve", "", v7, v4, v5, v6, v14);
      return 18;
    }
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "eUICCVinylMAVValve", "", "check failed: %s, %d, assertion: %s\n", v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCVinylMAVValve.cpp");
    v13 = (_BYTE *)gBBULogMaskGet();
    result = 18;
    if ((*v13 & 1) != 0 && gBBULogVerbosity >= 1)
    {
      v7 = "No transport available, bail out..\n";
      v8 = 0;
      v9 = 1;
      goto LABEL_5;
    }
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::StoreData()
{
  _WORD *v0;
  _WORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  char v15[6003];
  uint64_t v16;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v16 = *MEMORY[0x24BDAC8D0];
  eUICC::StoreData::Perform();
  if (v11 || v12 != 1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"rsp.Valid()");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v8, v9, v10, v12);
    result = 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v3, v15, &v15[v14], v14);
    result = 0;
  }
  *v1 = bswap32(v13) >> 16;
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::ValidatePerso(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  int v5;
  const void *v6;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 __dst;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;
  char v29;
  char v30;
  __int16 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  memset(v27, 0, 28);
  __dst = 0u;
  v25 = 0u;
  DWORD1(v27[1]) = 30000;
  v4 = *(_QWORD *)(a1 + 296);
  v5 = *(_DWORD *)(a1 + 292);
  v6 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8) - (_QWORD)v6;
  if (v8 >= 0x41)
    v9 = 65;
  else
    v9 = v8;
  memcpy(&__dst, v6, v9);
  v28 = v4;
  v29 = v5;
  v30 = 0;
  v31 = v9;
  v33 = v25;
  v34 = v26;
  *(_OWORD *)v35 = v27[0];
  *(_OWORD *)&v35[12] = *(_OWORD *)((char *)v27 + 12);
  v32 = __dst;
  eUICC::ValidatePerso::Perform();
  if ((_QWORD)__dst)
  {
    if (!*(_DWORD *)__dst && *(_BYTE *)(__dst + 8) == 1 && *(_WORD *)(__dst + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(__dst + 13), (char *)(__dst + 13 + *(unsigned __int16 *)(__dst + 11)), *(unsigned __int16 *)(__dst + 11));
      v10 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v14, v15, v16, *(_BYTE *)(__dst + 8));
      v10 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    v10 = 11;
  }
  v20 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
  if (*((_QWORD *)&__dst + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&__dst + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return v10;
}

void sub_24BA05998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Unwind_Resume(exception_object);
}

void eUICC::eUICCVinylMAVValve::~eUICCVinylMAVValve(eUICC::eUICCVinylMAVValve *this)
{
  void *v1;

  VinylCommunication::~VinylCommunication(this);
  operator delete(v1);
}

_QWORD *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;

  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    v9 = (char *)v7[1];
    goto LABEL_17;
  }
  v12 = (_BYTE *)result[1];
  v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    v16 = a3 - __src;
    if (v16)
      result = memmove(v9, __src, v16);
    v15 = &v9[v16];
    goto LABEL_20;
  }
  v14 = &__src[v13];
  if (v12 != v9)
  {
    result = memmove((void *)*result, __src, v13);
    v9 = (char *)v7[1];
  }
  if (a3 != v14)
    result = memmove(v9, v14, a3 - v14);
  v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
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
  __cxa_throw(exception, (struct type_info *)off_251CC9BE8, MEMORY[0x24BEDAAF0]);
}

void sub_24BA05B6C(_Unwind_Exception *a1)
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

uint64_t std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](uint64_t a1)
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

uint64_t VinylController::create(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VinylController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  char v20;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "entering VinylController::create\n", v4, v5, v6, v19);
  v14 = (VinylController *)VinylController::instance;
  if (!a2 || VinylController::instance)
  {
    if (VinylController::instance)
      goto LABEL_7;
    v14 = (VinylController *)operator new(0x88uLL);
    VinylController::VinylController(v14);
  }
  else
  {
    v14 = (VinylController *)operator new(0x88uLL);
    VinylController::VinylController((uint64_t)v14, 0, a1);
  }
  VinylController::instance = (uint64_t)v14;
LABEL_7:
  if (!*((_QWORD *)v14 + 2))
  {
    VinylControllerObjDestroy((uint64_t)v14, v7, v8, v9, v10, v11, v12, v13, v20);
    VinylController::instance = 0;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "returning VinylController::create\n", v15, v16, v17, v20);
  return VinylController::instance;
}

void sub_24BA05CD0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylControllerObjDestroy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    VinylController::instance = 0;
    gBBULogMaskGet();
    return _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Cleaning up VinylController object \n", v9, v10, v11, a9);
  }
  return result;
}

uint64_t VinylController::VinylController(uint64_t a1, int a2, uint64_t a3)
{
  VinylSecureElement *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;

  *(_QWORD *)a1 = off_251CC9F18;
  *(_QWORD *)(a1 + 8) = 0;
  v5 = (VinylSecureElement *)VinylCommunication::create(a2, 0);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 120) = VinylSecureElement::create(v5);
  *(_QWORD *)(a1 + 128) = 0;
  v6 = (_OWORD *)(a1 + 32);
  if (a3)
  {
    v7 = *(_OWORD *)(a3 + 16);
    *v6 = *(_OWORD *)a3;
    *(_OWORD *)(a1 + 48) = v7;
    v8 = *(_OWORD *)(a3 + 32);
    v9 = *(_OWORD *)(a3 + 48);
    v10 = *(_OWORD *)(a3 + 64);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a3 + 80);
    *(_OWORD *)(a1 + 80) = v9;
    *(_OWORD *)(a1 + 96) = v10;
    *(_OWORD *)(a1 + 64) = v8;
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *(_QWORD *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *v6 = 0u;
  }
  *(_BYTE *)(a1 + 24) = v11;
  return a1;
}

void sub_24BA05DE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void **v2;
  uint64_t v4;

  v4 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v2);
  _Unwind_Resume(a1);
}

void VinylController::VinylController(VinylController *this)
{
  *(_QWORD *)this = off_251CC9F18;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = VinylCommunication::create(0, 0);
  *((_BYTE *)this + 24) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_QWORD *)this + 16) = 0;
}

void sub_24BA05E74(_Unwind_Exception *a1)
{
  const void **v1;

  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::performNonUpdateOperation(uint64_t a1, int a2, __CFDictionary **a3, void *a4)
{
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t TransportNoEvents;
  char *v25;
  char *v26;
  void *v27;
  BBUCapabilities *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  char v35;
  char v36;
  unint64_t *v37;
  unint64_t v38;
  VinylSecureElement *v39;
  void *v40;
  int v41;
  int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  int v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  char v140;
  char v141;
  const void *v142;
  void *v143[4];
  char v144;
  void *v145;
  char v146;
  void *v147;
  char v148;
  void *v149;
  char v150;
  char *v151;
  void *__p[2];
  char v153;
  unsigned __int8 v154;
  uint64_t v155;

  v155 = *MEMORY[0x24BDAC8D0];
  v151 = 0;
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v8 = (void *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(__p);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, (__int128 *)__p);
    v9 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v10 = (unint64_t *)((char *)__p[1] + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v8 = (void *)qword_2579B9258;
  }
  v12 = (std::__shared_weak_count *)off_2579B9260;
  v143[0] = v8;
  v143[1] = off_2579B9260;
  if (off_2579B9260)
  {
    v13 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v15 = BBUCapabilities::supportsVinylRestore((BBUCapabilities *)v8);
  v16 = v15;
  if (!v12)
    goto LABEL_15;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (v18)
  {
LABEL_15:
    if ((v15 & 1) != 0)
      goto LABEL_16;
LABEL_52:
    TransportNoEvents = 0;
    goto LABEL_101;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  if ((v16 & 1) == 0)
    goto LABEL_52;
LABEL_16:
  if (a4)
  {
    __p[0] = a4;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset((const void **)(a1 + 128), (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v142, (const void **)(a1 + 128));
  Options::Options(v143, &v142);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v142);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)v143);
  if (v153 >= 0)
    v22 = __p;
  else
    LOBYTE(v22) = __p[0];
  v23 = _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v19, v20, v21, (char)v22);
  if (v153 < 0)
    operator delete(__p[0]);
  if (!VinylController::operationRequested(v23, a2, (uint64_t)v143))
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v101, v102, v103, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    gBBULogMaskGet();
    v107 = "No operation requested in options\n";
    goto LABEL_134;
  }
  TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)a1);
  if ((_DWORD)TransportNoEvents)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v108, v109, v110, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
      _BBULog(0, 1, "VinylController", "", "Fail to create transport: %d\n", v111, v112, v113, TransportNoEvents);
    goto LABEL_93;
  }
  eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(a1 + 32), (void *)LODWORD(v143[0]), 0, (eUICC::eUICCVinylICEValve **)__p);
  v25 = v151;
  v26 = (char *)__p[0];
  v151 = (char *)__p[0];
  __p[0] = 0;
  if (v25)
  {
    (*(void (**)(char *))(*(_QWORD *)v25 + 56))(v25);
    v27 = __p[0];
    __p[0] = 0;
    if (v27)
      (*(void (**)(void *))(*(_QWORD *)v27 + 56))(v27);
    v26 = v151;
  }
  if (!v26)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v114, v115, v116, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    TransportNoEvents = 18;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      _BBULog(0, 1, "VinylController", "", "Fail to get valve\n", v117, v118, v119, v139);
      TransportNoEvents = 18;
    }
    goto LABEL_93;
  }
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v28 = (BBUCapabilities *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(__p);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, (__int128 *)__p);
    v29 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v30 = (unint64_t *)((char *)__p[1] + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v28 = (BBUCapabilities *)qword_2579B9258;
  }
  v32 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v33 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v35 = BBUCapabilities::supportsEuiccViaEOS(v28);
  v36 = v35;
  if (v32)
  {
    v37 = (unint64_t *)&v32->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
      if ((v36 & 1) != 0)
        goto LABEL_45;
LABEL_54:
      v40 = 0;
      v43 = v151;
LABEL_55:
      (*(void (**)(void **__return_ptr))(*(_QWORD *)v43 + 8))(__p);
      v47 = (int)__p[0];
      v48 = BYTE4(__p[0]);
      v49 = v154;
      if (v47 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
      {
        if (v49 != 82)
          goto LABEL_150;
        if (!v48)
          goto LABEL_150;
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "resetting refurb fw with perso supported in an attempt to clear perso\n", v50, v51, v52, v139);
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)v151 + 16))(v151, 1, 1);
        (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)v151 + 16))(v151, 0, 1);
        v53 = v151;
        *(_OWORD *)(v151 + 24) = 0u;
        *(_OWORD *)(v53 + 40) = 0u;
        *(_OWORD *)(v53 + 56) = 0u;
        *(_OWORD *)(v53 + 72) = 0u;
        *(_OWORD *)(v53 + 88) = 0u;
        *(_OWORD *)(v53 + 104) = 0u;
        *(_OWORD *)(v53 + 120) = 0u;
        *(_OWORD *)(v53 + 136) = 0u;
        *(_OWORD *)(v53 + 152) = 0u;
        *(_OWORD *)(v53 + 168) = 0u;
        *(_OWORD *)(v53 + 184) = 0u;
        *(_OWORD *)(v53 + 200) = 0u;
        *(_OWORD *)(v53 + 216) = 0u;
        *(_OWORD *)(v53 + 232) = 0u;
        *(_OWORD *)(v53 + 8) = 0u;
        *(_OWORD *)(v53 + 248) = 0u;
        *(_OWORD *)(v53 + 264) = 0u;
        *(_OWORD *)(v53 + 273) = 0u;
        (*(void (**)(void **__return_ptr))(*(_QWORD *)v53 + 8))(__p);
        v54 = (int)__p[0];
        if (v54 != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Condition <<%s>> failed %s %s/%d\n", v65, v66, v67, (char)"outData.Valid()");
          TransportNoEvents = 18;
          if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
          {
            _BBULog(0, 1, "VinylController", "", "Fail to get data after resetting refurb\n", v68, v69, v70, v140);
            TransportNoEvents = 18;
          }
        }
        else
        {
LABEL_150:
          v55 = 1;
          switch(a2)
          {
            case 0:
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_GET_EID\n", v56, v57, v58, v139);
              if (a3)
              {
                TransportNoEvents = eUICC::getEID();
                if ((_DWORD)TransportNoEvents)
                {
                  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v59, v60, v61, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
                    _BBULog(0, 1, "VinylController", "", "Failed to retrieve EID: %d\n", v62, v63, v64, TransportNoEvents);
                }
              }
              else
              {
                if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v136, v137, v138, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                TransportNoEvents = 0;
                if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity > 0)
                {
                  v74 = "Client rsp data is not valid\n";
                  v75 = 1;
                  goto LABEL_73;
                }
              }
              break;
            case 1:
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_NON_UPDATE\n", v76, v77, v78, v139);
              v55 = 0;
              goto LABEL_75;
            case 2:
LABEL_75:
              if (HIDWORD(v143[0])
                && (gBBULogMaskGet(),
                    v82 = _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_REFURB\n", v79, v80, v81, v139), TransportNoEvents = VinylController::Refurb(v82, SHIDWORD(v143[0]), &v151), (_DWORD)TransportNoEvents))
              {
                if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v130, v131, v132, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
                  _BBULog(0, 1, "VinylController", "", "Failed to Refurb: %d\n", v133, v134, v135, TransportNoEvents);
              }
              else if ((v55 & 1) != 0)
              {
                TransportNoEvents = 0;
              }
              else
              {
LABEL_79:
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_BOOTSTRAP_PROVISIONING\n", v83, v84, v85, v139);
                TransportNoEvents = VinylController::bootstrapProvisioning(a1, &v151);
                if ((_DWORD)TransportNoEvents)
                {
                  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v86, v87, v88, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
                    _BBULog(0, 1, "VinylController", "", "Failed to complete bootstrap provisioning: %d\n", v89, v90, v91, TransportNoEvents);
                }
              }
              break;
            case 3:
              goto LABEL_79;
            case 4:
              LOBYTE(__p[0]) = 0;
              gBBULogMaskGet();
              _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "In VINYL_OPERATION_GET_PAIRING_PARAMS\n", v92, v93, v94, v139);
              v95 = eUICC::checkEOSDev(__p, (uint64_t)&v151);
              TransportNoEvents = v95;
              if ((_DWORD)v95 || !LOBYTE(__p[0]))
              {
                if (!(_DWORD)v95)
                  TransportNoEvents = VinylController::getPairingParameters(0, (CFDictionaryRef)a4, a3, &v151);
              }
              else
              {
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "EOS - dev product type detected, returning not supported\n", v96, v97, v98, v141);
                TransportNoEvents = 9;
              }
              break;
            default:
              gBBULogMaskGet();
              v74 = "Invalid user operation\n";
              goto LABEL_72;
          }
        }
      }
      else
      {
        if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v120, v121, v122, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        gBBULogMaskGet();
        v74 = "eUICC not detected, skipping\n";
LABEL_72:
        v75 = 0xFFFFFFFFLL;
LABEL_73:
        _BBULog(0, v75, "VinylController", "", v74, v71, v72, v73, v139);
        TransportNoEvents = 0;
      }
      if (v40)
        VinylSecureElement::PowerDownSE(*(VinylSecureElement **)(a1 + 120), v40);
      goto LABEL_93;
    }
  }
  if ((v35 & 1) == 0)
    goto LABEL_54;
LABEL_45:
  v39 = *(VinylSecureElement **)(a1 + 120);
  if (!v39)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v123, v124, v125, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    TransportNoEvents = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) == 0 || gBBULogVerbosity <= 0)
      goto LABEL_93;
    v107 = "Vinyl Secure Element object not created, cannot power up SE\n";
    v126 = 1;
    goto LABEL_135;
  }
  v40 = (void *)VinylSecureElement::PowerUpSE(v39);
  if (v40)
  {
    (*(void (**)(void **__return_ptr))(*(_QWORD *)v151 + 8))(__p);
    v41 = (int)__p[0];
    v42 = (TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2;
    v43 = v151;
    if (v41 != v42)
    {
      if ((*(unsigned int (**)(char *, _QWORD, uint64_t))(*(_QWORD *)v151 + 16))(v151, 0, 1))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Reset card failed\n", v44, v45, v46, v139);
      }
      v43 = v151;
      *(_OWORD *)(v151 + 24) = 0u;
      *(_OWORD *)(v43 + 40) = 0u;
      *(_OWORD *)(v43 + 56) = 0u;
      *(_OWORD *)(v43 + 72) = 0u;
      *(_OWORD *)(v43 + 88) = 0u;
      *(_OWORD *)(v43 + 104) = 0u;
      *(_OWORD *)(v43 + 120) = 0u;
      *(_OWORD *)(v43 + 136) = 0u;
      *(_OWORD *)(v43 + 152) = 0u;
      *(_OWORD *)(v43 + 168) = 0u;
      *(_OWORD *)(v43 + 184) = 0u;
      *(_OWORD *)(v43 + 200) = 0u;
      *(_OWORD *)(v43 + 216) = 0u;
      *(_OWORD *)(v43 + 232) = 0u;
      *(_OWORD *)(v43 + 248) = 0u;
      *(_OWORD *)(v43 + 8) = 0u;
      *(_OWORD *)(v43 + 264) = 0u;
      *(_OWORD *)(v43 + 273) = 0u;
    }
    goto LABEL_55;
  }
  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v127, v128, v129, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
  gBBULogMaskGet();
  v107 = "Failed to power SE\n";
LABEL_134:
  v126 = 0xFFFFFFFFLL;
LABEL_135:
  _BBULog(0, v126, "VinylController", "", v107, v104, v105, v106, v139);
  TransportNoEvents = 0;
LABEL_93:
  VinylController::freeTransport((VinylController *)a1);
  if (v150 < 0)
    operator delete(v149);
  if (v148 < 0)
    operator delete(v147);
  if (v146 < 0)
    operator delete(v145);
  if (v144 < 0)
    operator delete(v143[2]);
LABEL_101:
  v99 = v151;
  v151 = 0;
  if (v99)
    (*(void (**)(char *))(*(_QWORD *)v99 + 56))(v99);
  return TransportNoEvents;
}

void sub_24BA06C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, char a16, int a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v41;

  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  Options::~Options(&a18);
  v41 = a34;
  a34 = 0;
  if (v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 56))(v41);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFDictionary const>::reset(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  const void *v4;
  const void *v6;

  v3 = *a2;
  if (*a2)
    CFRetain(*a2);
  v4 = *a1;
  *a1 = v3;
  v6 = v4;
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v6);
}

uint64_t VinylController::operationRequested(uint64_t a1, int a2, uint64_t a3)
{
  BBUCapabilities *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  BBUCapabilities *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v27;
  __int128 v28;

  if (!*(_DWORD *)(a3 + 4))
  {
    v12 = 0;
    goto LABEL_36;
  }
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v5 = (BBUCapabilities *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(&v28);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, &v28);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v5 = (BBUCapabilities *)qword_2579B9258;
  }
  v9 = (std::__shared_weak_count *)off_2579B9260;
  v27 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v10 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if ((BBUCapabilities::supportsEuiccViaEOS(v5) & 1) != 0)
  {
    v12 = 1;
    if (!v9)
      goto LABEL_36;
    goto LABEL_32;
  }
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v13 = (BBUCapabilities *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(&v28);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, &v28);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v13 = (BBUCapabilities *)qword_2579B9258;
  }
  v17 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v18 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v12 = (uint64_t)BBUCapabilities::supportsVinylUpdate(v13);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v9 = v27;
  if (v27)
  {
LABEL_32:
    v22 = (unint64_t *)&v9->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_36:
  v24 = *(unsigned __int8 *)(a3 + 127);
  if ((v24 & 0x80u) != 0)
    v24 = *(_QWORD *)(a3 + 112);
  v25 = *(unsigned __int8 *)(a3 + 71);
  if ((v25 & 0x80u) != 0)
    v25 = *(_QWORD *)(a3 + 56);
  switch(a2)
  {
    case 0:
    case 4:
      v12 = 1;
      break;
    case 1:
      if (v25 | v24)
        v12 = 1;
      else
        v12 = v12;
      break;
    case 2:
      return v12;
    case 3:
      v12 = (v25 | v24) != 0;
      break;
    default:
      v12 = 0;
      break;
  }
  return v12;
}

void sub_24BA0703C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t VinylController::createTransportNoEvents(VinylController *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  std::chrono::nanoseconds __ns;

  if (*((_QWORD *)this + 2))
  {
    if (*((_BYTE *)this + 24))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "opening channel on provided external transport\n", v2, v3, v4, v19);
      return (*(uint64_t (**)(_QWORD, char *))(**((_QWORD **)this + 2) + 24))(*((_QWORD *)this + 2), (char *)this + 32);
    }
    VinylController::freeTransport(this);
    v6 = 1;
    v7 = 1;
    do
    {
      v8 = v6;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "createTransport attempt %d/%d\n", v9, v10, v11, v7);
      v12 = (*(uint64_t (**)(_QWORD, char *))(**((_QWORD **)this + 2) + 16))(*((_QWORD *)this + 2), (char *)this + 32);
      if (!(_DWORD)v12)
        break;
      VinylController::freeTransport(this);
      __ns.__rep_ = 3000000000;
      std::this_thread::sleep_for (&__ns);
      v6 = 0;
      v7 = 2;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v13, v14, v15, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    v12 = 1;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
      _BBULog(0, 1, "VinylController", "", "fCommunication object not created, cannot create Transport\n", v16, v17, v18, v19);
  }
  return v12;
}

uint64_t VinylController::Refurb(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v18;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "refurbAction: %d\n", v5, v6, v7, a2);
  switch(a2)
  {
    case 1:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)*a3 + 24);
      goto LABEL_5;
    case 2:
      v8 = *(uint64_t (**)(void))(*(_QWORD *)*a3 + 24);
LABEL_5:
      v12 = v8();
      if ((_DWORD)v12)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle Refurb operation, ret %d\n", v13, v14, v15, v12);
      }
      return v12;
    case 3:
      v16 = 1;
      goto LABEL_9;
    case 4:
      v16 = 0;
LABEL_9:
      eUICC::ClearMetadata::Perform(v16, a3);
      break;
    default:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "default case\n", v9, v10, v11, v18);
      break;
  }
  return 0;
}

uint64_t VinylController::bootstrapProvisioning(uint64_t a1, _QWORD *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v8;
  _BYTE v9[16];
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *__p;
  char v17;

  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v8, (const void **)(a1 + 128));
  Options::Options(v9, &v8);
  v3 = eUICC::TwoPhaseProv::Perform((uint64_t)v9, a2);
  if (v17 < 0)
    operator delete(__p);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v8);
  if (!v3)
    return 0;
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle bootstrap provisioning operation, ret %d\n", v4, v5, v6, v3);
  return 11;
}

void sub_24BA07478(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  Options::~Options((void **)va1);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylController::getPairingParameters(int a1, CFDictionaryRef theDict, __CFDictionary **a3, _QWORD *a4)
{
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  CFTypeID v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("kToBeSignedPayload"));
  if (Value && (v7 = Value, v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
  {
    if (eUICC::Pairing::GetParameters(v7, a3, a4))
      return 11;
    else
      return 0;
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Signing payload dictionary not present in the input dictionary\n", v13, v14, v15, v16);
    return 0;
  }
}

uint64_t VinylController::freeTransport(VinylController *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v8)(char *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char v13;

  if (*((_BYTE *)this + 24))
  {
    gBBULogMaskGet();
    v4 = "Skipping free of external transport\n";
    v5 = 0xFFFFFFFFLL;
LABEL_3:
    _BBULog(0, v5, "VinylController", "", v4, v1, v2, v3, v13);
    return 0;
  }
  if (*((_QWORD *)this + 2))
  {
    v8 = (uint64_t (*)(char *))*((_QWORD *)this + 11);
    if (!v8)
      return 0;
    result = v8((char *)this + 32);
    if ((_DWORD)result)
    {
      if ((*(unsigned int (**)(_QWORD, char *))(**((_QWORD **)this + 2) + 40))(*((_QWORD *)this + 2), (char *)this + 32))
      {
        return 0;
      }
      else
      {
        return 3;
      }
    }
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    v12 = (_BYTE *)gBBULogMaskGet();
    result = 0;
    if ((*v12 & 1) != 0 && gBBULogVerbosity >= 1)
    {
      v4 = "fCommunication object not created, cannot free Transport\n";
      v5 = 1;
      goto LABEL_3;
    }
  }
  return result;
}

void Options::~Options(void **this)
{
  if (*((char *)this + 127) < 0)
    operator delete(this[13]);
  if (*((char *)this + 103) < 0)
    operator delete(this[10]);
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

void VinylController::~VinylController(const void **this)
{
  void *v1;

  VinylController::~VinylController(this);
  operator delete(v1);
}

{
  void *v2;
  const void *v3;

  *this = off_251CC9F18;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 16);
  v2 = (void *)this[15];
  this[15] = 0;
  if (v2)
    operator delete(v2);
  v3 = this[2];
  this[2] = 0;
  if (v3)
    (*(void (**)(const void *))(*(_QWORD *)v3 + 8))(v3);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(this + 1);
}

const void **ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

uint64_t std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

uint64_t ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_24BA04000);
  }
  return result;
}

uint64_t __cxx_global_var_init_48()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

eUICC::eUICCVinylICEValve *eUICC::eUICCVinylICEValve::eUICCVinylICEValve(eUICC::eUICCVinylICEValve *this, void *a2, int a3, char a4)
{
  eUICC::VinylCommandDriver **v5;
  int v6;
  eUICC::VinylCommandDriver *v7;

  *((_BYTE *)this + 288) = 0;
  *((_BYTE *)this + 304) = 0;
  *(_QWORD *)this = &off_251CC9F48;
  v5 = (eUICC::VinylCommandDriver **)((char *)this + 312);
  *((_QWORD *)this + 39) = 0;
  *((_QWORD *)this + 37) = a2;
  v6 = a3 != 1;
  if (a3 == 255)
    v6 = 255;
  *((_DWORD *)this + 73) = v6;
  *((_BYTE *)this + 289) = a4;
  IceAriGetContext();
  v7 = (eUICC::VinylCommandDriver *)operator new(8uLL);
  eUICC::VinylCommandDriver::VinylCommandDriver();
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v5, v7);
  *((_BYTE *)this + 304) = 15;
  return this;
}

void sub_24BA07AD4(_Unwind_Exception *a1)
{
  VinylCommunication *v1;
  eUICC::VinylCommandDriver **v2;
  void *v3;

  operator delete(v3);
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v2, 0);
  VinylCommunication::~VinylCommunication(v1);
  _Unwind_Resume(a1);
}

void *IceAriGetContext(void)
{
  void *v0;
  _BYTE *v1;
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  __int128 v11;

  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  v0 = off_2579B9208;
  if (!off_2579B9208)
  {
    v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v11, (uint64_t)v1);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&off_2579B9208, &v11);
    v2 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v3 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 - 1, v3));
      if (!v4)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
    v0 = off_2579B9208;
  }
  v5 = (std::__shared_weak_count *)off_2579B9210;
  if (off_2579B9210)
  {
    v6 = (unint64_t *)((char *)off_2579B9210 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v0;
}

void sub_24BA07C08(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  _Unwind_Resume(a1);
}

void *eUICC::eUICCVinylICEValve::GetVinylType@<X0>(eUICC::eUICCVinylICEValve *this@<X0>, void *a2@<X8>)
{
  *((_DWORD *)this + 2) = 0;
  *((_BYTE *)this + 287) = 1;
  return memcpy(a2, (char *)this + 8, 0x119uLL);
}

uint64_t eUICC::eUICCVinylICEValve::GetData@<X0>(eUICC::eUICCVinylICEValve *this@<X0>, void *a2@<X8>)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  BOOL isAbsentOkay;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  _OWORD *v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  _BYTE v28[64];
  void *v29;
  void *__p;

  AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK((AriSdk::ARI_IBIVinylGetDataReq_SDK *)v28);
  v4 = (_OWORD *)((char *)this + 8);
  if (*((_BYTE *)this + 288))
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylData cache is valid. Using cached data!\n", v5, v6, v7, v27);
    eUICC::logEUICCData((int *)this + 2);
    goto LABEL_22;
  }
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 273) = 0u;
  *v4 = 0u;
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v29, (_DWORD *)this + 73);
  v8 = operator new(1uLL);
  *v8 = 0;
  v9 = __p;
  __p = v8;
  if (v9)
    operator delete(v9);
  isAbsentOkay = eUICC::eUICCVinylICEValve::isAbsentOkay(this);
  *((_BYTE *)this + 286) = isAbsentOkay;
  if (isAbsentOkay)
  {
LABEL_21:
    *(_DWORD *)v4 = 255;
    goto LABEL_22;
  }
  if ((eUICC::VinylCommandDriver::GetData() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Invalid GetData response from the BB\n", v23, v24, v25, v27);
    goto LABEL_21;
  }
  *((_DWORD *)this + 2) = *MEMORY[0x48];
  *(_WORD *)((char *)this + 13) = *MEMORY[0x58];
  v11 = (_OWORD *)MEMORY[0x60];
  if (MEMORY[0x60] == MEMORY[0x68])
    v11 = 0;
  *(_OWORD *)((char *)this + 15) = *v11;
  *((_BYTE *)this + 31) = *MEMORY[0x78];
  v12 = (_OWORD *)MEMORY[0x80];
  if (MEMORY[0x80] == MEMORY[0x88])
    v12 = 0;
  v13 = v12[1];
  *((_OWORD *)this + 2) = *v12;
  *((_OWORD *)this + 3) = v13;
  *((_QWORD *)this + 8) = *MEMORY[0x98];
  *((_QWORD *)this + 9) = *MEMORY[0xB0];
  v14 = (_OWORD *)MEMORY[0xC8];
  if (MEMORY[0xC8] == MEMORY[0xD0])
    v14 = 0;
  *((_OWORD *)this + 5) = *v14;
  v15 = (_OWORD *)MEMORY[0x128];
  if (MEMORY[0x128] == MEMORY[0x130])
    v15 = 0;
  *(_OWORD *)((char *)this + 155) = *v15;
  v16 = (_OWORD *)MEMORY[0x1C0];
  if (MEMORY[0x1C0] == MEMORY[0x1C8])
    v16 = 0;
  v17 = v16[1];
  *(_OWORD *)((char *)this + 251) = *v16;
  *(_OWORD *)((char *)this + 267) = v17;
  *((_WORD *)this + 115) = *MEMORY[0x188];
  v18 = MEMORY[0x1A8];
  if (MEMORY[0x1A8] == MEMORY[0x1B0])
    v18 = 0;
  v19 = *(_BYTE *)(v18 + 2);
  *((_WORD *)this + 124) = *(_WORD *)v18;
  *((_BYTE *)this + 250) = v19;
  *((_BYTE *)this + 12) = *MEMORY[0x50];
  *((_BYTE *)this + 283) = *MEMORY[0x1E8];
  *((_BYTE *)this + 288) = 1;
  eUICC::logEUICCData((int *)this + 2);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "result  0x%x \n", v20, v21, v22, *MEMORY[0x48]);
LABEL_22:
  memcpy(a2, (char *)this + 8, 0x119uLL);
  return MEMORY[0x24BD2BE4C](v28);
}

void sub_24BA07EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  MEMORY[0x24BD2BE4C](va);
  _Unwind_Resume(a1);
}

void **AriSdk::Tlv<unsigned int>::operator=<int &,void>(void **a1, _DWORD *a2)
{
  _DWORD *v4;
  void *v5;

  v4 = operator new(4uLL);
  *v4 = *a2;
  v5 = *a1;
  *a1 = v4;
  if (v5)
    operator delete(v5);
  return a1;
}

BOOL eUICC::eUICCVinylICEValve::isAbsentOkay(eUICC::eUICCVinylICEValve *this)
{
  int v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  _BYTE v30[64];
  void *v31;
  std::chrono::nanoseconds __ns;

  AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v30);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v31, (_DWORD *)this + 73);
  v2 = -1;
  while (1)
  {
    if ((eUICC::VinylCommandDriver::GetVinylType() & 1) == 0)
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Error: failed to get slot info from BB\n", v8, v9, v10, v28);
LABEL_13:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"ret");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to get data from UIM\n", v14, v15, v16, v29);
LABEL_14:
      v17 = 0;
      goto LABEL_15;
    }
    v3 = *MEMORY[0x48];
    if ((int)*MEMORY[0x48] > 5)
      break;
    if (v3 != 1 && v3 != 4)
      goto LABEL_20;
LABEL_10:
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "SIM still initializing, trying again... sim_state 0x%x (retryCount: %d, retryLimit: %d)\n", v5, v6, v7, *MEMORY[0x48]);
    __ns.__rep_ = 2000000000;
    std::this_thread::sleep_for (&__ns);
    if (++v2 >= 6)
      goto LABEL_13;
  }
  if (v3 == 254)
    goto LABEL_10;
  if (v3 != 6)
    goto LABEL_20;
  if ((*MEMORY[0x80] & 1) != 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v22, v23, v24, (char)"!(GET_RSP_FIELD(rsp, sim_error_cause_t28) & sim_error_cause_mask)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "sim_state 0x%x, sim_error_cause 0x%x\n", v25, v26, v27, *MEMORY[0x48]);
    goto LABEL_14;
  }
  if (*MEMORY[0x80] == 2)
  {
    v17 = 1;
    goto LABEL_15;
  }
LABEL_20:
  if (MEMORY[0x88])
    v17 = (*MEMORY[0x88] & 3) == 0;
  else
    v17 = 1;
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "sim_state 0x%x sim_error_cause: 0x%x sim_ext_capabilities 0x%x isAbsentOk: %s\n", v19, v20, v21, *MEMORY[0x48]);
LABEL_15:
  MEMORY[0x24BD2BE94](v30);
  return v17;
}

void sub_24BA0824C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  MEMORY[0x24BD2BE94](va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::SetCardMode(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  _BYTE v10[64];
  void *v11;
  void *__p;

  AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK((AriSdk::ARI_IBIVinylSwitchModeReq_SDK *)v10);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v11, (_DWORD *)(a1 + 292));
  v2 = operator new(1uLL);
  *v2 = 1;
  v3 = __p;
  __p = v2;
  if (v3)
    operator delete(v3);
  if ((eUICC::VinylCommandDriver::SwitchCardMode() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Error: failed to SwitchCardMode\n", v5, v6, v7, v9);
    v4 = 18;
  }
  MEMORY[0x24BD2BE64](v10);
  return v4;
}

void sub_24BA08334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  MEMORY[0x24BD2BE64](va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::DeleteProfile(eUICC::eUICCVinylICEValve *this, unsigned int a2)
{
  _DWORD *v4;
  void *v5;
  _DWORD *v6;
  void *v7;
  _WORD *v8;
  void *v9;
  _WORD *v10;
  void *v11;
  _WORD *v12;
  void *v13;
  char *v14;
  uint64_t v15;
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
  _QWORD v27[2];
  uint64_t v28;
  _BYTE v29[64];
  void *v30;
  void *__p;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];

  AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK((AriSdk::ARI_IBIVinylTapeReq_SDK *)v29);
  v28 = 0;
  v27[0] = 0xBFD00402820434BFLL;
  *(_QWORD *)((char *)v27 + 6) = 0xD80302820434BFD0;
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v30, (_DWORD *)this + 73);
  v4 = operator new(4uLL);
  *v4 = 17;
  v5 = __p;
  __p = v4;
  if (v5)
    operator delete(v5);
  v6 = operator new(4uLL);
  *v6 = 1;
  v7 = v32;
  v32 = v6;
  if (v7)
    operator delete(v7);
  v8 = operator new(2uLL);
  *v8 = 1;
  v9 = v33;
  v33 = v8;
  if (v9)
    operator delete(v9);
  v10 = operator new(2uLL);
  *v10 = 0;
  v11 = v34;
  v34 = v10;
  if (v11)
    operator delete(v11);
  v12 = operator new(2uLL);
  *v12 = 7;
  v13 = v35;
  v35 = v12;
  if (v13)
    operator delete(v13);
  v14 = (char *)&v27[a2] - a2;
  AriSdk::TlvArray<unsigned char,3584ul>::assign<unsigned char *>(v36, v14, v14 + 7);
  if ((eUICC::VinylCommandDriver::DeleteProfile() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v23, v24, v25, (char)"status");
    v22 = 11;
LABEL_15:
    v15 = v28;
    if (!v28)
      goto LABEL_19;
    goto LABEL_18;
  }
  v15 = v28;
  if (**(_DWORD **)(v28 + 80))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"!GET_RSP_FIELD(rsp, result_t4)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to DeleteProfile status %d SW1_SW2 0x%x\n", v19, v20, v21, **(_DWORD **)(v28 + 80));
    v22 = 18;
    goto LABEL_15;
  }
  v22 = 0;
LABEL_18:
  (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
LABEL_19:
  MEMORY[0x24BD2BE34](v29);
  return v22;
}

void sub_24BA08590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  MEMORY[0x24BD2BE34](va);
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3584ul>::assign<unsigned char *>(_QWORD *a1, char *a2, char *a3)
{
  unint64_t v4;
  const char *v5;
  void *p_p;
  void *__p;
  char v9;

  v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xE01)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/AppleInternal/Library/BuildRoots/1ce10175-54cc-11ef-a474-76625042721f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, p_p, 385, a1, v4, 3584);
    if (v9 < 0)
      operator delete(__p);
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xE01;
}

void sub_24BA08668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::StoreData(uint64_t a1, char **a2, _QWORD *a3, _WORD *a4)
{
  _DWORD *v8;
  void *v9;
  _DWORD *v10;
  void *v11;
  _WORD *v12;
  void *v13;
  _WORD *v14;
  void *v15;
  char *v16;
  char *v17;
  _WORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v31[64];
  void *v32;
  void *__p;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];

  AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK((AriSdk::ARI_IBIVinylTapeReq_SDK *)v31);
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v32, (_DWORD *)(a1 + 292));
  v8 = operator new(4uLL);
  *v8 = 5;
  v9 = __p;
  __p = v8;
  if (v9)
    operator delete(v9);
  v10 = operator new(4uLL);
  *v10 = 1;
  v11 = v34;
  v34 = v10;
  if (v11)
    operator delete(v11);
  v12 = operator new(2uLL);
  *v12 = 1;
  v13 = v35;
  v35 = v12;
  if (v13)
    operator delete(v13);
  v14 = operator new(2uLL);
  *v14 = 0;
  v15 = v36;
  v36 = v14;
  if (v15)
    operator delete(v15);
  v17 = *a2;
  v16 = a2[1];
  v18 = operator new(2uLL);
  *v18 = (_WORD)v16 - (_WORD)v17;
  v19 = v37;
  v37 = v18;
  if (v19)
  {
    operator delete(v19);
    v17 = *a2;
    v16 = a2[1];
  }
  AriSdk::TlvArray<unsigned char,3584ul>::assign<std::__wrap_iter<unsigned char const*>>(v38, v17, v16);
  if ((eUICC::VinylCommandDriver::DeleteProfile() & 1) != 0)
  {
    if (*MEMORY[0x50])
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"!GET_RSP_FIELD(rsp, result_t4)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to store data status %d SW1_SW2 0x%x\n", v23, v24, v25, *MEMORY[0x50]);
      v26 = 18;
    }
    else
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a3, MEMORY[0x78], (char *)(MEMORY[0x78] + (unsigned __int16)*MEMORY[0x70]), (unsigned __int16)*MEMORY[0x70]);
      v26 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"status");
    v26 = 11;
  }
  *a4 = *MEMORY[0x58];
  (*(void (**)(_QWORD))(MEMORY[0] + 16))(0);
  MEMORY[0x24BD2BE34](v31);
  return v26;
}

void sub_24BA088D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  MEMORY[0x24BD2BE34](va);
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3584ul>::assign<std::__wrap_iter<unsigned char const*>>(_QWORD *a1, char *a2, char *a3)
{
  unint64_t v4;
  const char *v5;
  void *p_p;
  void *__p;
  char v9;

  v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xE01)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/AppleInternal/Library/BuildRoots/1ce10175-54cc-11ef-a474-76625042721f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, p_p, 385, a1, v4, 3584);
    if (v9 < 0)
      operator delete(__p);
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xE01;
}

void sub_24BA089B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::ValidatePerso(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  void *v13;
  _WORD *v14;
  void *v15;
  _WORD *v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _WORD *v32;
  __n128 v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[64];
  void *v37;
  void *__p;
  void *v39;
  void *v40;
  uint64_t v41;

  AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK((AriSdk::ARI_IBIVinylValidatePsoReq_SDK *)v36);
  v35 = 0;
  v6 = a2[1];
  v7 = v6 - *a2;
  v8 = (unsigned __int16)(v6 - *(_WORD *)a2);
  if (v8 >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Payload too large -- payload_size: %d  max allowed: %lu)\n", v9, v10, v11, v7);
LABEL_14:
    v27 = 18;
    goto LABEL_16;
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v37, (_DWORD *)(a1 + 292));
  v12 = operator new(2uLL);
  *v12 = 1;
  v13 = __p;
  __p = v12;
  if (v13)
    operator delete(v13);
  v14 = operator new(2uLL);
  *v14 = 0;
  v15 = v39;
  v39 = v14;
  if (v15)
    operator delete(v15);
  v16 = operator new(2uLL);
  *v16 = v7;
  v17 = v40;
  v40 = v16;
  if (v17)
    operator delete(v17);
  v18 = (const void *)*a2;
  v19 = *a2 + v8;
  v34 = 0;
  v33 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v33, v18, v19, v8);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v41, &v33, v20);
  if (v33.n128_u64[0])
  {
    v33.n128_u64[1] = v33.n128_u64[0];
    operator delete((void *)v33.n128_u64[0]);
  }
  if ((eUICC::VinylCommandDriver::ValidatePerso() & 1) != 0)
  {
    if (**(_DWORD **)(v35 + 72) || (v32 = *(_WORD **)(v35 + 88), !*v32))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"!GET_RSP_FIELD(rsp, result_t3) && GET_RSP_FIELD(rsp, sim_rsp_len_t5)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to AuthPerso status %d SW1_SW2 0x%x rsp_len %u\n", v24, v25, v26, **(_DWORD **)(v35 + 72));
      goto LABEL_14;
    }
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(a3, *(char **)(v35 + 96), (char *)(*(_QWORD *)(v35 + 96) + (unsigned __int16)*v32), (unsigned __int16)*v32);
    v27 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"status");
    v27 = 11;
  }
LABEL_16:
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 16))(v35);
  MEMORY[0x24BD2BE7C](v36);
  return v27;
}

void sub_24BA08C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  MEMORY[0x24BD2BE7C](&a18);
  _Unwind_Resume(a1);
}

uint64_t AriSdk::TlvArray<unsigned char,3584ul>::operator=(uint64_t a1, __n128 *a2, const char *a3)
{
  const char *v5;
  void *p_p;
  void *__p;
  char v9;

  if (a2->n128_u64[1] - a2->n128_u64[0] < 0xE01)
  {
    std::vector<unsigned char>::__move_assign(a1, a2);
  }
  else
  {
    AriOsa::LogSrcInfo((AriOsa *)"/AppleInternal/Library/BuildRoots/1ce10175-54cc-11ef-a474-76625042721f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "operator=", a3);
    if (v9 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Array assignment too large(%p), got(%zu) max(%zu)", v5, p_p, 360, a1, a2->n128_u64[1] - a2->n128_u64[0], 3584);
    if (v9 < 0)
      operator delete(__p);
  }
  return a1;
}

void sub_24BA08D40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void eUICC::eUICCVinylICEValve::~eUICCVinylICEValve(eUICC::VinylCommandDriver **this)
{
  *this = (eUICC::VinylCommandDriver *)&off_251CC9F48;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  VinylCommunication::~VinylCommunication((VinylCommunication *)this);
}

{
  *this = (eUICC::VinylCommandDriver *)&off_251CC9F48;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  VinylCommunication::~VinylCommunication((VinylCommunication *)this);
}

{
  void *v2;

  *this = (eUICC::VinylCommandDriver *)&off_251CC9F48;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  VinylCommunication::~VinylCommunication((VinylCommunication *)this);
  operator delete(v2);
}

_QWORD *std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_251CC9FB0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_24BA08E4C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ICEARIContext *,std::shared_ptr<ICEARIContext>::__shared_ptr_default_delete<ICEARIContext,ICEARIContext>,std::allocator<ICEARIContext>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](eUICC::VinylCommandDriver **a1, eUICC::VinylCommandDriver *a2)
{
  eUICC::VinylCommandDriver *v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    eUICC::VinylCommandDriver::~VinylCommandDriver(v3);
    operator delete(v4);
  }
}

_QWORD *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  char *v13;
  char *v14;
  size_t v15;

  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    v9 = (char *)v7[1];
    goto LABEL_17;
  }
  v12 = (_BYTE *)result[1];
  if (v12 - v9 >= a4)
  {
LABEL_17:
    v15 = a3 - __src;
    if (v15)
      result = memmove(v9, __src, v15);
    v14 = &v9[v15];
    goto LABEL_20;
  }
  v13 = &__src[v12 - v9];
  if (v12 != v9)
  {
    result = memmove((void *)*result, __src, v12 - v9);
    v9 = (char *)v7[1];
  }
  if (a3 != v13)
    result = memmove(v9, v13, a3 - v13);
  v14 = &v9[a3 - v13];
LABEL_20:
  v7[1] = v14;
  return result;
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
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

void sub_24BA090B0(_Unwind_Exception *exception_object)
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

__n128 std::vector<unsigned char>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t __cxx_global_var_init_0()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_24BA04000);
  }
  return result;
}

void *VinylCommunication::create(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int RadioVendor;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(2, 0, "VinylCommunication", "", "VinylCommunication::create", v4, v5, v6, v13);
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      v8 = operator new(0x38uLL);
      VinylEURCommunication::VinylEURCommunication((uint64_t)v8, a2);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylCommunication", "", "Unhandled radio type or no radio\n", v9, v10, v11, v13);
      return 0;
    }
  }
  else
  {
    v8 = operator new(0x40uLL);
    VinylICECommunication::VinylICECommunication((uint64_t)v8, a1, a2);
  }
  return v8;
}

void sub_24BA09234(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylCommunication::VinylCommunication(uint64_t result, int a2, uint64_t a3)
{
  *(_QWORD *)result = off_251CCA028;
  *(_DWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  return result;
}

uint64_t VinylEURCommunication::VinylEURCommunication(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)a1 = off_251CCA308;
  *(_QWORD *)(a1 + 24) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(_QWORD *)(a1 + 32) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 34;
  return a1;
}

uint64_t VinylICECommunication::VinylICECommunication(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = a3;
  *(_QWORD *)a1 = off_251CCA220;
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(_QWORD *)(a1 + 40) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 34;
  return a1;
}

uint64_t eUICC::logEUICCData(int *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *__p;
  char v27;
  void *v28;
  char v29;
  void *v30[2];
  char v31;

  gBBULogMaskGet();
  v2 = *a1;
  ctu::hex((ctu *)((char *)a1 + 7), (const void *)0x10);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "status 0x%x sw1_sw2 0x%x eid 0x%s op_mode 0x%hhx\n", v3, v4, v5, v2);
  if (v31 < 0)
    operator delete(v30[0]);
  gBBULogMaskGet();
  v6 = v30;
  ctu::hex((ctu *)(a1 + 6), (const void *)0x20);
  if (v31 < 0)
    LOBYTE(v6) = v30[0];
  ctu::hex((ctu *)(a1 + 14), (const void *)8);
  ctu::hex((ctu *)(a1 + 16), (const void *)8);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "current_fw_version %s main_fw_nonce 0x%s gold_fw_nonce 0x%s\n", v7, v8, v9, (char)v6);
  if (v27 < 0)
    operator delete(__p);
  if (v29 < 0)
    operator delete(v28);
  if (v31 < 0)
    operator delete(v30[0]);
  gBBULogMaskGet();
  ctu::hex((ctu *)(a1 + 18), (const void *)0x10);
  v10 = v31;
  v11 = (char)v30[0];
  ctu::hex((ctu *)((char *)a1 + 147), (const void *)0x10);
  if (v10 >= 0)
    v15 = v30;
  else
    LOBYTE(v15) = v11;
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "main_fw_pcf_mac 0x%s gold_fw_pcf_mac 0x%s pcf_version 0x%x\n", v12, v13, v14, (char)v15);
  if (v29 < 0)
    operator delete(v28);
  if (v31 < 0)
    operator delete(v30[0]);
  gBBULogMaskGet();
  ctu::hex((ctu *)(a1 + 60), (const void *)3);
  v16 = v31;
  v17 = (char)v30[0];
  ctu::hex((ctu *)((char *)a1 + 243), (const void *)0x20);
  if (v16 >= 0)
    v21 = v30;
  else
    LOBYTE(v21) = v17;
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "loader_version 0x%s key_id 0x%s perso %d\n", v18, v19, v20, (char)v21);
  if (v29 < 0)
    operator delete(v28);
  if (v31 < 0)
    operator delete(v30[0]);
  gBBULogMaskGet();
  return _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylValve", "", "chip_id 0x%x stream_apdu_max_apdus 0x%x isAbsentOk: %s\n", v22, v23, v24, *((_BYTE *)a1 + 275));
}

void sub_24BA0963C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
    operator delete(__p);
  if (*(char *)(v25 - 49) < 0)
    operator delete(*(void **)(v25 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t DEREncodeItemIntoVector(unint64_t a1, unint64_t a2, const void *a3, unint64_t *a4)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;

  v8 = DERLengthOfItem(a1, a2);
  v15 = v8;
  v9 = *a4;
  v10 = a4[1] - *a4;
  if (v8 <= v10)
  {
    if (v8 < v10)
      a4[1] = v9 + v8;
  }
  else
  {
    std::vector<unsigned char>::__append(a4, v8 - v10);
    v9 = *a4;
  }
  v11 = DEREncodeItem(a1, a2, a3, v9, &v15);
  if ((_DWORD)v11)
  {
    v12 = *a4;
  }
  else
  {
    v14 = a4[1] - *a4;
    if (v15 > v14)
    {
      std::vector<unsigned char>::__append(a4, v15 - v14);
      return v11;
    }
    if (v15 >= v14)
      return v11;
    v12 = *a4 + v15;
  }
  a4[1] = v12;
  return v11;
}

uint64_t DEREncodeSequenceIntoVector(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;

  v8 = DERLengthOfEncodedSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(_QWORD *)a3);
  v15 = v8;
  v9 = *a4;
  v10 = a4[1] - *a4;
  if (v8 <= v10)
  {
    if (v8 < v10)
      a4[1] = v9 + v8;
  }
  else
  {
    std::vector<unsigned char>::__append(a4, v8 - v10);
    v9 = *a4;
  }
  v11 = DEREncodeSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(_QWORD *)a3, v9, &v15);
  if ((_DWORD)v11)
  {
    v12 = *a4;
  }
  else
  {
    v14 = a4[1] - *a4;
    if (v15 > v14)
    {
      std::vector<unsigned char>::__append(a4, v15 - v14);
      return v11;
    }
    if (v15 >= v14)
      return v11;
    v12 = *a4 + v15;
  }
  a4[1] = v12;
  return v11;
}

uint64_t DERDecodeBBTicket(uint64_t a1, unsigned int a2, unint64_t a3)
{
  uint64_t result;
  _OWORD *v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  _QWORD v11[2];
  unint64_t v12;
  unint64_t v13;
  _OWORD v14[10];
  uint64_t v15;
  _OWORD v16[9];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16[6] = xmmword_24BA29998;
  v16[7] = unk_24BA299A8;
  v16[8] = xmmword_24BA299B8;
  v16[2] = xmmword_24BA29958;
  v16[3] = unk_24BA29968;
  v16[4] = xmmword_24BA29978;
  v16[5] = unk_24BA29988;
  v16[0] = xmmword_24BA29938;
  v16[1] = unk_24BA29948;
  v14[6] = xmmword_24BA29A28;
  v14[7] = unk_24BA29A38;
  v14[8] = xmmword_24BA29A48;
  v14[9] = unk_24BA29A58;
  v14[2] = xmmword_24BA299E8;
  v14[3] = unk_24BA299F8;
  v14[4] = xmmword_24BA29A08;
  v14[5] = unk_24BA29A18;
  v14[0] = xmmword_24BA299C8;
  v14[1] = unk_24BA299D8;
  v15 = 1;
  v11[0] = a1;
  v11[1] = a2;
  result = DERDecodeItem((uint64_t)v11, &v12);
  if (!(_DWORD)result)
  {
    if (v12 == 0x2000000000000010)
    {
      if (TelephonyRadiosGetRadioVendor() == 1)
      {
        v5 = v14;
        v6 = 7;
      }
      else
      {
        v5 = v16;
        v6 = 6;
      }
      result = (uint64_t)DERParseSequenceContent(&v13, v6, (uint64_t)v5, a3, 0);
      if (!(_DWORD)result)
      {
        v7 = *(uint64_t **)(a3 + 16);
        v8 = *v7;
        v9 = *((unsigned __int16 *)v7 + 4);
        v10 = v8 == 0x43DCE48862A0806 && v9 == 771;
        result = 3;
        if (v10)
        {
          if (*(_QWORD *)(a3 + 24) == 10)
            return 0;
          else
            return 3;
        }
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t parseAndCheckIfTagEnabled(uint64_t a1, unsigned int a2, int *a3)
{
  int v5;
  char v6;
  unint64_t v7;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];

  v12 = 0;
  v5 = DERDecodeSeqInit(a1, &v12, v13);
  v6 = 0;
  if (!v5)
  {
    v7 = a2 | 0x8000000000000000;
    while (1)
    {
      v5 = DERDecodeSeqNext(v13, &v9);
      if (v5)
        break;
      if (v9 == v7)
      {
        if (v11 != 4)
        {
          v6 = 0;
LABEL_14:
          v5 = 3;
          goto LABEL_12;
        }
        v6 = 0;
        if (*v10)
        {
          if (*v10 != 1)
            goto LABEL_14;
          v6 = 1;
        }
      }
    }
    if (v5 == 1)
      v5 = 0;
    else
      v6 = 0;
  }
LABEL_12:
  *a3 = v5;
  return v6 & 1;
}

uint64_t isBBTicketCalibEnabled(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  int v4;

  v4 = 0;
  result = parseAndCheckIfTagEnabled(a1 + 48, 0xD4u, &v4);
  if (v4)
  {
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t isBBTicketFATPCalibEnabled(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  int v4;

  v4 = 0;
  result = parseAndCheckIfTagEnabled(a1 + 48, 0x1C2u, &v4);
  if (v4)
  {
    result = 0;
    *a2 = v4;
  }
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

uint64_t eUICC::Pairing::CreateValidatePersoPayload(unint64_t *a1, CFDictionaryRef theDict)
{
  CFIndex Count;
  size_t v4;
  const void **v5;
  const void **v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  const void *v10;
  CFTypeID v11;
  CFTypeID v12;
  CFIndex Length;
  const char *CStringPtr;
  CFIndex v15;
  const UInt8 *BytePtr;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  _QWORD v72[4];
  void *__p;
  char *v74;
  uint64_t v75;
  void *v76;
  _BYTE *v77;
  uint64_t v78;
  void *v79;
  _BYTE *v80;
  uint64_t v81;
  void *v82;
  _BYTE *v83;
  uint64_t v84;
  void *v85;
  _BYTE *v86;
  uint64_t v87;
  _BYTE *v88;
  char *v89;
  uint64_t v90;
  _QWORD v91[4];
  int v92;
  char v93;

  v93 = 127;
  v92 = 17433507;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v82 = 0;
  v83 = 0;
  v84 = 0;
  if (!theDict)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v45, v46, v47, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    gBBULogMaskGet();
    v51 = "To be signed dictionary is NULL\n";
    goto LABEL_68;
  }
  Count = CFDictionaryGetCount(theDict);
  v4 = Count;
  if (Count <= 0)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v52, v53, v54, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    gBBULogMaskGet();
    v51 = "To be signed dictionary is empty\n";
    goto LABEL_68;
  }
  v5 = (const void **)calloc(Count, 8uLL);
  if (!v5)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v55, v56, v57, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    gBBULogMaskGet();
    v51 = "Calloc dict keys failed\n";
LABEL_68:
    _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", v51, v48, v49, v50, v70);
    v6 = 0;
    v5 = 0;
    goto LABEL_73;
  }
  v6 = (const void **)calloc(v4, 8uLL);
  if (v6)
  {
    CFDictionaryGetKeysAndValues(theDict, v5, v6);
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v79 = 0;
      v80 = 0;
      v81 = 0;
      v76 = 0;
      v77 = 0;
      v78 = 0;
      __p = 0;
      v74 = 0;
      v75 = 0;
      v9 = (const __CFString *)v5[v7];
      v10 = v6[v7];
      v11 = CFGetTypeID(v9);
      if (v11 != CFStringGetTypeID())
        break;
      v12 = CFGetTypeID(v10);
      if (v12 != CFDataGetTypeID())
        break;
      Length = CFStringGetLength(v9);
      CStringPtr = CFStringGetCStringPtr(v9, 0x8000100u);
      v8 = DEREncodeItemIntoVector(0xCuLL, Length, CStringPtr, (unint64_t *)&v79);
      if (v8)
      {
        if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
          _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
        gBBULogMaskGet();
        v17 = 1;
        _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "UTF8 string encoding for key failed\n", v22, v23, v24, v70);
      }
      else
      {
        v15 = CFDataGetLength((CFDataRef)v10);
        BytePtr = CFDataGetBytePtr((CFDataRef)v10);
        v8 = DEREncodeItemIntoVector(4uLL, v15, BytePtr, (unint64_t *)&v76);
        if (v8)
        {
          if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
            _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
          gBBULogMaskGet();
          v17 = 1;
          _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Octect string encoding for value failed\n", v28, v29, v30, v70);
        }
        else
        {
          v72[0] = v79;
          v72[1] = v80 - (_BYTE *)v79;
          v72[2] = v76;
          v72[3] = v77 - (_BYTE *)v76;
          v8 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v72, (uint64_t)&eUICC::Pairing::derKeyValueSpec, (unint64_t *)&__p);
          if (!v8)
          {
            std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>((uint64_t)&v88, v89, (char *)__p, v74, v74 - (_BYTE *)__p);
            v17 = 0;
            v8 = 0;
LABEL_13:
            v18 = 1;
            goto LABEL_14;
          }
          if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
            _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v31, v32, v33, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
          gBBULogMaskGet();
          v17 = 1;
          _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Creating sequence using Key, Value pair failed\n", v34, v35, v36, v70);
        }
      }
      v18 = 0;
LABEL_14:
      if (__p)
      {
        v74 = (char *)__p;
        operator delete(__p);
      }
      if (v76)
      {
        v77 = v76;
        operator delete(v76);
      }
      if (v79)
      {
        v80 = v79;
        operator delete(v79);
      }
      if ((v18 & 1) == 0)
      {
        if ((v17 & 1) != 0)
          goto LABEL_42;
        goto LABEL_49;
      }
      if (v4 == ++v7)
      {
        v37 = DEREncodeItemIntoVector(0x2000000000000010uLL, v89 - v88, v88, (unint64_t *)&v85);
        v8 = v37;
        if (v37
          || (v8 = DEREncodeItemIntoVector(0xA000000000000005, v86 - (_BYTE *)v85, v85, (unint64_t *)&v82)) != 0)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "Condition <<%s>> failed %s %s/%d\n", v38, v39, v40, (char)"DR_Success == ret");
        }
        else
        {
          v91[0] = &v92;
          v91[1] = 5;
          v91[2] = v82;
          v91[3] = v83 - (_BYTE *)v82;
          v8 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v91, (uint64_t)&eUICC::Pairing::derKeyValueSpec, a1);
          if (v8)
          {
            if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
              _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v64, v65, v66, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
            gBBULogMaskGet();
            _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Creating validatePerso sequence failed\n", v67, v68, v69, v70);
          }
        }
        goto LABEL_42;
      }
    }
    v17 = 0;
    goto LABEL_13;
  }
  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
    _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v58, v59, v60, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
  gBBULogMaskGet();
  _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Calloc dict values failed\n", v61, v62, v63, v70);
  v6 = 0;
LABEL_73:
  v8 = 0;
LABEL_42:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylPairing", "", "CreateValidatePersoPayload DR %d\n", v41, v42, v43, v8);
  if (v5)
    free(v5);
  if (v6)
    free(v6);
  if (v8)
    v7 = 11;
  else
    v7 = 0;
LABEL_49:
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  if (v85)
  {
    v86 = v85;
    operator delete(v85);
  }
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  return v7;
}

void sub_24BA0A3EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32)
{
  uint64_t v32;
  void *v34;

  if (__p)
    operator delete(__p);
  if (a22)
    operator delete(a22);
  if (a25)
    operator delete(a25);
  if (a28)
    operator delete(a28);
  if (a31)
    operator delete(a31);
  v34 = *(void **)(v32 - 152);
  if (v34)
  {
    *(_QWORD *)(v32 - 144) = v34;
    operator delete(v34);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Pairing::GetParameters(const __CFDictionary *a1, __CFDictionary **a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFDictionary *Mutable;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFDataRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const UInt8 *BytePtr;
  CFIndex v22;
  uint64_t v23;
  CFDataRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const UInt8 *v28;
  CFIndex v29;
  uint64_t v30;
  CFDataRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const UInt8 *v35;
  CFIndex v36;
  uint64_t v37;
  CFDataRef v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const UInt8 *v42;
  CFIndex v43;
  uint64_t v44;
  __CFData *v45;
  CFIndex v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const UInt8 *v50;
  CFIndex v51;
  uint64_t v52;
  CFDataRef v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const UInt8 *v57;
  CFIndex v58;
  uint64_t v59;
  CFDataRef v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const UInt8 *v64;
  CFIndex v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  void *__p;
  _BYTE *v79;
  uint64_t v80;
  void *v81;
  _BYTE *v82;
  uint64_t v83;
  UInt8 *v84;
  CFIndex v85;
  UInt8 *v86;
  CFIndex v87;
  UInt8 *bytes;
  CFIndex length;
  UInt8 *v90;
  CFIndex v91;
  UInt8 *v92;
  CFIndex v93;
  UInt8 *v94;
  CFIndex v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100[2];
  unint64_t v101[2];
  void *v102;
  int64_t v103;

  v102 = 0;
  v103 = 0;
  v101[0] = 0;
  v101[1] = 0;
  v100[0] = 0;
  v100[1] = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  __p = 0;
  v79 = 0;
  v80 = 0;
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "In GetParameters\n", v6, v7, v8, v76);
  if (a2)
  {
    eUICC::Pairing::CreateValidatePersoPayload((unint64_t *)&v81, a1);
    gBBULogMaskGet();
    _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v81, v82 - (_BYTE *)v81, 32, v9);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v11 = (*(uint64_t (**)(_QWORD, void **, void **))(*(_QWORD *)*a3 + 40))(*a3, &v81, &__p);
    v12 = VinylControllerMapBBUReturnToVinylResult(v11);
    if ((_DWORD)v12)
    {
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v73, v74, v75, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
      goto LABEL_12;
    }
    v102 = __p;
    v103 = v79 - (_BYTE *)__p;
    if (DERDecodeSeqContentInit((unint64_t *)&v102, v101)
      || DERDecodeSeqNext(v101, &v98)
      || DERParseSequenceContent(&v99, 4u, (uint64_t)&eUICC::Pairing::LPASigningRespSpec, (unint64_t)&bytes, 0x40uLL)|| DERDecodeSeqContentInit((unint64_t *)&bytes, v100)|| DERDecodeSeqNext(v100, &v96)|| DERParseSequenceContent(&v97, 6u, (uint64_t)&eUICC::Pairing::euiccSignedLPADataSpec, (unint64_t)&v84, 0x60uLL))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"(der_ret == DR_Success)");
      v12 = 27;
LABEL_12:
      *a2 = Mutable;
      goto LABEL_13;
    }
    if (length)
    {
      v17 = CFDataCreate(0, bytes, length);
      CFDictionarySetValue(Mutable, CFSTR("euiccSignedLPAData"), v17);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccSignedLPAData:: \n", v18, v19, v20, v77);
      gBBULogMaskGet();
      BytePtr = CFDataGetBytePtr(v17);
      v22 = CFDataGetLength(v17);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)BytePtr, v22, 32, v23);
    }
    else
    {
      v17 = 0;
    }
    if (v85)
    {
      v24 = CFDataCreate(0, v84, v85);
      CFDictionarySetValue(Mutable, CFSTR("eidValue"), v24);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eidValue:: \n", v25, v26, v27, v77);
      gBBULogMaskGet();
      v28 = CFDataGetBytePtr(v24);
      v29 = CFDataGetLength(v24);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v28, v29, 32, v30);
    }
    else
    {
      v24 = 0;
    }
    if (v87)
    {
      v31 = CFDataCreate(0, v86, v87);
      CFDictionarySetValue(Mutable, CFSTR("eUICCPublicKey"), v31);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eUICCPublicKey:: \n", v32, v33, v34, v77);
      gBBULogMaskGet();
      v35 = CFDataGetBytePtr(v31);
      v36 = CFDataGetLength(v31);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v35, v36, 32, v37);
    }
    else
    {
      v31 = 0;
    }
    if (v91)
    {
      v38 = CFDataCreate(0, v90, v91);
      CFDictionarySetValue(Mutable, CFSTR("euiccSignature"), v38);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccSignature:: \n", v39, v40, v41, v77);
      gBBULogMaskGet();
      v42 = CFDataGetBytePtr(v38);
      v43 = CFDataGetLength(v38);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v42, v43, 32, v44);
    }
    else
    {
      v38 = 0;
    }
    v45 = 0;
    v46 = v93;
    if (v93 && v95)
    {
      v45 = CFDataCreateMutable(0, 0);
      CFDataAppendBytes(v45, v92, v93);
      CFDataAppendBytes(v45, v94, v95);
      CFDictionarySetValue(Mutable, CFSTR("euicceumCertificate"), v45);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euicceumCertificate:: \n", v47, v48, v49, v77);
      gBBULogMaskGet();
      v50 = CFDataGetBytePtr(v45);
      v51 = CFDataGetLength(v45);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v50, v51, 32, v52);
      v46 = v93;
    }
    if (v46)
    {
      v53 = CFDataCreate(0, v92, v46);
      CFDictionarySetValue(Mutable, CFSTR("euiccCertificate"), v53);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "euiccCertificate:: \n", v54, v55, v56, v77);
      gBBULogMaskGet();
      v57 = CFDataGetBytePtr(v53);
      v58 = CFDataGetLength(v53);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v57, v58, 32, v59);
    }
    else
    {
      v53 = 0;
    }
    if (v95)
    {
      v60 = CFDataCreate(0, v94, v95);
      CFDictionarySetValue(Mutable, CFSTR("eumCertificate"), v60);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylPairing", "", "eumCertificate:: \n", v61, v62, v63, v77);
      gBBULogMaskGet();
      v64 = CFDataGetBytePtr(v60);
      v65 = CFDataGetLength(v60);
      _BBULogBinary(0, 0xFFFFFFFFLL, "VinylPairing", "", (uint64_t)v64, v65, 32, v66);
    }
    else
    {
      v60 = 0;
    }
    *a2 = Mutable;
    if (v17)
      CFRelease(v17);
    if (v24)
      CFRelease(v24);
    if (v31)
      CFRelease(v31);
    if (v38)
      CFRelease(v38);
    if (v53)
      CFRelease(v53);
    if (v60)
      CFRelease(v60);
    if (v45)
      CFRelease(v45);
    v12 = 0;
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylPairing", "", "check failed: %s, %d, assertion: %s\n", v67, v68, v69, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinylPairing.cpp");
    gBBULogMaskGet();
    _BBULog(1, 0xFFFFFFFFLL, "VinylPairing", "", "Null rsp dictionary reference passed\n", v70, v71, v72, v77);
    v12 = 30;
  }
LABEL_13:
  if (__p)
  {
    v79 = __p;
    operator delete(__p);
  }
  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }
  return v12;
}

void sub_24BA0AC5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Pairing::Verify()
{
  return 10;
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  int64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  int64_t v24;
  char v25;
  char *v26;
  char *v27;
  char *v28;
  char v29;
  char *v30;
  char *v31;
  char *v32;
  char v33;
  char *v34;
  char *v35;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v6 = a5;
  v7 = __src;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
      v16 = operator new(v15);
    else
      v16 = 0;
    v26 = &v13[(_QWORD)v16];
    v27 = &v13[(_QWORD)v16 + v6];
    v28 = v26;
    do
    {
      v29 = *v7++;
      *v28++ = v29;
      --v6;
    }
    while (v6);
    v30 = *(char **)a1;
    if (*(char **)a1 == v5)
    {
      v32 = v26;
    }
    else
    {
      v31 = v5;
      v32 = v26;
      do
      {
        v33 = *--v31;
        *--v32 = v33;
      }
      while (v31 != v30);
      v10 = *(char **)(a1 + 8);
    }
    v34 = (char *)v16 + v15;
    if (v10 != v5)
      memmove(v27, v5, v10 - v5);
    v35 = *(char **)a1;
    *(_QWORD *)a1 = v32;
    *(_QWORD *)(a1 + 8) = &v27[v10 - v5];
    *(_QWORD *)(a1 + 16) = v34;
    if (v35)
      operator delete(v35);
    return v26;
  }
  v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v18 = &__src[a5];
    v20 = *(char **)(a1 + 8);
LABEL_17:
    v21 = &v5[v6];
    v22 = &v20[-v6];
    v23 = v20;
    if (&v20[-v6] < v10)
    {
      v24 = &v10[v6] - v20;
      v23 = v20;
      do
      {
        v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(_QWORD *)(a1 + 8) = v23;
    if (v20 != v21)
      memmove(&v5[v6], v5, v20 - v21);
    if (v18 != v7)
      memmove(v5, v7, v18 - v7);
    return v5;
  }
  v18 = &__src[v17];
  v19 = a4 - &__src[v17];
  if (a4 != &__src[v17])
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  v20 = &v10[v19];
  *(_QWORD *)(a1 + 8) = &v10[v19];
  if (v17 >= 1)
    goto LABEL_17;
  return v5;
}

uint64_t *ReverseProxyGetSettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  const __CFAllocator *v5;
  CFURLRef v6;
  _BOOL4 v7;
  const __CFString *v8;
  const void *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  std::__assoc_sub_state *v32;
  uint64_t *p_shared_owners;
  unint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  std::string v41;
  CFURLRef v42;
  std::__assoc_sub_state *v43;
  _QWORD v44[5];
  char *v45;
  CFURLRef v46;
  std::string v47;
  std::string v48;
  std::string v49;
  const __CFString *v50;

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3002000000;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  v4 = (char *)operator new(0x90uLL);
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(_QWORD *)v4 = off_251CCA0B0;
  *((_QWORD *)v4 + 1) = 0;
  v45 = v4;
  v43 = (std::__assoc_sub_state *)v4;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v4);
  *a2 = 0;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v41, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v41 = *(std::string *)a1;
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v47, v41.__r_.__value_.__l.__data_, v41.__r_.__value_.__l.__size_);
  else
    v47 = v41;
  v46 = 0;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v48, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
  else
    v48 = v47;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v49, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  else
    v49 = v48;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v50 = 0;
  if (ctu::cf::convert_copy())
  {
    v6 = CFURLCreateWithString(v5, v50, 0);
    CFRelease(v50);
    v7 = v6 != 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if ((SHIBYTE(v49.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!v7)
      goto LABEL_19;
    goto LABEL_18;
  }
  operator delete(v49.__r_.__value_.__l.__data_);
  if (v7)
  {
LABEL_18:
    v8 = (const __CFString *)v46;
    v46 = v6;
    v50 = v8;
    ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v50);
  }
LABEL_19:
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  v42 = v46;
  v46 = 0;
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v46);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
  v9 = (const void *)RPRegisterForAvailability();
  if (!v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v26, v27, v28, (char)"reg");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Failed to register for proxy\n", v29, v30, v31, v40);
    goto LABEL_41;
  }
  v10 = *(unsigned __int8 *)(a1 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(a1 + 8);
  if (!v10
    || (v42
      ? (v11 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
      : (v11 = 0),
        !v11))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"!url.empty() && urlRef");
    gBBULogMaskGet();
    v25 = "NULL requestURL?\n";
LABEL_36:
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", v25, v22, v23, v24, v39);
    goto LABEL_37;
  }
  RPRegistrationResume();
  v49.__r_.__value_.__r.__words[0] = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000;
  v12 = std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v4, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)&v49);
  MEMORY[0x24BD2BBE8](v9);
  if (!v12)
  {
    if ((std::future<BOOL>::get(&v43) & 1) != 0)
    {
      *a2 = RPCopyProxyDictionary();
      v49.__r_.__value_.__r.__words[0] = 0;
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v49.__r_.__value_.__l.__data_);
      goto LABEL_37;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v36, v37, v38, (char)"future.get()");
    gBBULogMaskGet();
    v25 = "Failed to get PRP\n";
    goto LABEL_36;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"fs == std::future_status::ready");
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "PRP timed out %d\n", v16, v17, v18, v12);
LABEL_37:
  CFRelease(v9);
LABEL_41:
  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef((const void **)&v42);
  v32 = v43;
  if (v43)
  {
    p_shared_owners = &v43->__shared_owners_;
    do
      v34 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v34 - 1, (unint64_t *)p_shared_owners));
    if (!v34)
      ((void (*)(std::__assoc_sub_state *))v32->__on_zero_shared)(v32);
  }
  _Block_object_dispose(v44, 8);
  return std::promise<BOOL>::~promise((uint64_t *)&v45);
}

void sub_24BA0B350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,const void *a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t *v33;
  const void **v34;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;

  ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(&a25);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v34);
  v36 = a26;
  if (a26)
  {
    v37 = (unint64_t *)(a26 + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36);
  }
  _Block_object_dispose(&a27, 8);
  std::promise<BOOL>::~promise(v33);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 40));
}

void ___Z23ReverseProxyGetSettingsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  if (a2 != 2)
  {
    v2 = a2;
    if (a2 == 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Available!\n", v4, v5, v6, v11);
      v7 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v12 = 1;
      std::promise<BOOL>::set_value(v7, &v12);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Aborted? %d\n", v8, v9, v10, v2);
    }
  }
}

void std::promise<BOOL>::set_value(uint64_t *a1, _BYTE *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (!v2)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<BOOL>::set_value<BOOL>(v2, a2);
}

uint64_t std::future<BOOL>::get(std::__assoc_sub_state **a1)
{
  std::__assoc_sub_state *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = *a1;
  *a1 = 0;
  std::__assoc_state<BOOL>::move(v1);
  v3 = v2;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
      ((void (*)(std::__assoc_sub_state *))v1->__on_zero_shared)(v1);
  }
  return v3;
}

void sub_24BA0B56C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::future<BOOL>::get(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const void **ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__assoc_state<BOOL>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  operator delete(v3);
}

uint64_t std::__assoc_state<BOOL>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<BOOL>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  const std::error_category *v4;
  unint64_t *v5;
  unint64_t v6;
  std::logic_error v8[2];
  std::exception_ptr v9;

  v2 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v9.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v9);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v4 = std::future_category();
        MEMORY[0x24BD2BFA8](v8, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v8);
      }
    }
    v5 = (unint64_t *)(v2 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  std::logic_error *exception;
  std::logic_error *v3;

  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_24BA0B788(void *a1)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x24BD2BFA8](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_24BA0B7F0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_sub_state::__attach_future[abi:ne180100](uint64_t a1)
{
  std::mutex *v2;
  int v3;
  unint64_t *v4;
  unint64_t v5;

  v2 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  v3 = *(_DWORD *)(a1 + 136);
  if ((v3 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v4 = (unint64_t *)(a1 + 8);
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  *(_DWORD *)(a1 + 136) = v3 | 2;
  std::mutex::unlock(v2);
}

void sub_24BA0B860(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
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

void std::__assoc_state<BOOL>::set_value<BOOL>(uint64_t a1, _BYTE *a2)
{
  std::mutex *v4;
  uint64_t v5;
  std::exception_ptr v6;

  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_BYTE *)(a1 + 140) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_24BA0B9A0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a2)
{
  unsigned int v4;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5;
  std::chrono::steady_clock::time_point v6;
  std::chrono::system_clock::time_point v7;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v9;
  unsigned int v10;
  uint64_t v11;
  std::unique_lock<std::mutex> v13;

  v13.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  v13.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 24));
  v4 = *(_DWORD *)(a1 + 136);
  if ((v4 & 8) != 0)
  {
    v11 = 2;
    goto LABEL_25;
  }
  if ((v4 & 4) != 0)
  {
    v11 = ((v4 >> 2) & 1) == 0;
    goto LABEL_25;
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
  {
    if (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
    {
      v5 = *a2;
      v6.__d_.__rep_ = v5 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v6.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v7.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v7.__d_.__rep_)
        {
          v8 = 0;
          goto LABEL_14;
        }
        if (v7.__d_.__rep_ < 1)
        {
          if ((unint64_t)v7.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
            goto LABEL_13;
          v8 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v7.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            v8 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_14;
          }
LABEL_13:
          v8 = 1000 * v7.__d_.__rep_;
LABEL_14:
          if (v8 > (v6.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v9.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
        }
        v9.__d_.__rep_ = v8 + v6.__d_.__rep_;
LABEL_17:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 88), &v13, v9);
        std::chrono::steady_clock::now();
      }
      std::chrono::steady_clock::now();
    }
    v10 = *(_DWORD *)(a1 + 136);
    if ((v10 & 4) != 0)
      goto LABEL_24;
  }
  v10 = *(_DWORD *)(a1 + 136);
LABEL_24:
  v11 = ((v10 >> 2) & 1) == 0;
  if (v13.__owns_)
LABEL_25:
    std::mutex::unlock(v13.__m_);
  return v11;
}

void std::__assoc_state<BOOL>::move(std::__assoc_sub_state *a1)
{
  void *ptr;
  std::exception_ptr v3;
  std::exception_ptr v4;
  std::exception_ptr v5;
  std::unique_lock<std::mutex> __lk;

  __lk.__m_ = &a1->__mut_;
  __lk.__owns_ = 1;
  std::mutex::lock(&a1->__mut_);
  std::__assoc_sub_state::__sub_wait(a1, &__lk);
  ptr = a1->__exception_.__ptr_;
  v5.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v5);
  if (ptr)
  {
    std::exception_ptr::exception_ptr(&v4, &a1->__exception_);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else if (__lk.__owns_)
  {
    std::mutex::unlock(__lk.__m_);
  }
}

void sub_24BA0BBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
}

_QWORD *BBUCapabilities::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  _DWORD *v3;

  v3 = operator new(4uLL);
  *v3 = TelephonyRadiosGetProduct();
  return std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(a1, (uint64_t)v3);
}

void sub_24BA0BC14(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBUCapabilities::BBUCapabilities(BBUCapabilities *this)
{
  *(_DWORD *)this = TelephonyRadiosGetProduct();
}

uint64_t BBUCapabilities::getARICommandTimeout(BBUCapabilities *this)
{
  return 2000;
}

capabilities::euicc *BBUCapabilities::supportsVinylRestore(BBUCapabilities *this)
{
  capabilities::euicc *v1;
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  BBUCapabilities *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  __int128 v12;

  if ((capabilities::euicc::supportsVinylRestore(this) & 1) != 0)
    return (capabilities::euicc *)1;
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(&v12);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, &v12);
    v2 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v3 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 - 1, v3));
      if (!v4)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }
  v5 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v6 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (BBUCapabilities *)pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v1 = BBUCapabilities::supportsVinylUpdate(v8);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v1;
}

void sub_24BA0BD6C(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  _Unwind_Resume(a1);
}

capabilities::euicc *BBUCapabilities::supportsVinylUpdate(BBUCapabilities *this)
{
  uint64_t IsInternalBuild;
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  capabilities::euicc *result;
  char vars0;

  IsInternalBuild = TelephonyUtilIsInternalBuild();
  if ((_DWORD)IsInternalBuild
    && (IsInternalBuild = BBUpdaterCommon::isNVRAMKeyPresent(CFSTR("VinylForceGenericUpdate"), v2),
        (_DWORD)IsInternalBuild))
  {
    gBBULogMaskGet();
    result = (capabilities::euicc *)_BBULog(0, 0xFFFFFFFFLL, "BBUCapabilities", "", "kVinylForceGenericUpdate NV set to TRUE\n", v3, v4, v5, vars0);
  }
  else
  {
    result = (capabilities::euicc *)capabilities::euicc::supportsGenericUpdater((capabilities::euicc *)IsInternalBuild);
    if (!(_DWORD)result)
      return result;
  }
  return (capabilities::euicc *)(capabilities::euicc::supportsEOS(result) ^ 1);
}

BOOL BBUCapabilities::supportsEUICCGSMAMastering(BBUCapabilities *this, unsigned int a2)
{
  return a2 > 4;
}

uint64_t BBUCapabilities::getEUICCCertIDSize(BBUCapabilities *this, unsigned int a2)
{
  if (a2 <= 4)
    return 4;
  else
    return 20;
}

uint64_t BBUCapabilities::getEUICCAttempts(BBUCapabilities *this)
{
  return 3;
}

_QWORD *std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_251CCA0F8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_24BA0BE70(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<BBUCapabilities *,std::shared_ptr<BBUCapabilities>::__shared_ptr_default_delete<BBUCapabilities,BBUCapabilities>,std::allocator<BBUCapabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_1()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

void **BBUFSDebugRegisterDelegate(void **result)
{
  sDelegate = *result;
  return result;
}

uint64_t _BBUFSDebugPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (sDelegate)
    return sDelegate(result, a2, &a9);
  return result;
}

uint64_t eUICC::VinylFactory::GetValve@<X0>(eUICC::VinylFactory *this@<X0>, void *a2@<X1>, char a3@<W2>, eUICC::eUICCVinylICEValve **a4@<X8>)
{
  int v5;
  uint64_t result;
  eUICC::eUICCVinylICEValve *v9;

  v5 = (int)a2;
  result = TelephonyRadiosGetRadioVendor();
  if ((result - 2) >= 2)
  {
    if ((_DWORD)result == 1)
    {
      v9 = (eUICC::eUICCVinylICEValve *)operator new(0x138uLL);
      result = eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve((uint64_t)v9, this, v5, a3);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = (eUICC::eUICCVinylICEValve *)operator new(0x140uLL);
    result = eUICC::eUICCVinylICEValve::eUICCVinylICEValve(v9, this, v5, a3);
  }
  *a4 = v9;
  return result;
}

void sub_24BA0C000(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::copyAsCFString()
{
  void *exception;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if ((ctu::cf::convert_copy() & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 32, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp", 0x34u, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Unrecognized radio type.\")", v2, v3, v4, v5);
  }
  return 0;
}

void sub_24BA0C0A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::getEID()
{
  __CFDictionary **v0;
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::string *p_p;
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  std::string v27;
  const void *v28;
  std::string __p;
  char buffer[8192];
  _QWORD v31[34];
  char v32;
  uint64_t v33;

  v0 = (__CFDictionary **)MEMORY[0x24BDAC7A8]();
  v33 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)v1 + 8))(v31);
  if (LODWORD(v31[0]) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    eUICC::stringifyDataBuffer((eUICC *)((char *)v31 + 7), v2);
    gBBULogMaskGet();
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      LOBYTE(p_p) = __p.__r_.__value_.__s.__data_[0];
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v3, v4, v5, (char)p_p);
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v27, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v27 = __p;
      v13 = (const void *)eUICC::copyAsCFString();
      v28 = v13;
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);
      CFDictionarySetValue(Mutable, CFSTR("EID"), v13);
      *v0 = Mutable;
      v14 = CFStringCreateWithFormat(v7, 0, CFSTR("%@"), Mutable);
      v15 = v14;
      if (v14)
      {
        if (CFStringGetCString(v14, buffer, 0x2000, 0x8000100u))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "client rsp data: %s\n", v16, v17, v18, (char)buffer);
        }
        CFRelease(v15);
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v28);
    }
    else
    {
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "eUICCVinylFactory", "", "check failed: %s, %d, assertion: %s\n", v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp");
      if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
        _BBULog(0, 1, "eUICCVinylFactory", "", "Failed to allocate shared info dict\n", v22, v23, v24, v26);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    if (!v32)
      return 107;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "eUICC not stuffed but that's ok!\n", v9, v10, v11, v25);
  }
  return 0;
}

void sub_24BA0C3BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::stringifyDataBuffer(eUICC *this, unsigned __int8 *a2)
{
  uint64_t i;
  _QWORD *v3;
  uint64_t v4;
  char v6;
  _QWORD v7[2];
  uint64_t v8;
  _QWORD v9[10];
  char v10;
  uint64_t v11;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  for (i = 0; i != 16; ++i)
  {
    *(_DWORD *)((char *)v9 + *(_QWORD *)(v8 - 24)) = *(_DWORD *)((_BYTE *)v9 + *(_QWORD *)(v8 - 24)) & 0xFFFFFFB5 | 8;
    v6 = 48;
    v3 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v8, &v6);
    *(_QWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 24) = 2;
    std::ostream::operator<<();
  }
  std::stringbuf::str();
  v7[0] = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v7[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v8 = v4;
  v9[0] = MEMORY[0x24BEDB848] + 16;
  if (v10 < 0)
    operator delete((void *)v9[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2C164](&v11);
}

void sub_24BA0C530(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::checkEOSDev(_BYTE *a1, uint64_t a2)
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  char v11;
  char v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void *__p[2];
  char v22;
  __int128 v23[18];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v4 = (void *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(v23);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, v23);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v23[0] + 1);
    if (*((_QWORD *)&v23[0] + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v23[0] + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v4 = (void *)qword_2579B9258;
  }
  v8 = (std::__shared_weak_count *)off_2579B9260;
  __p[0] = v4;
  __p[1] = off_2579B9260;
  if (off_2579B9260)
  {
    v9 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v11 = BBUCapabilities::supportsEuiccViaEOS((BBUCapabilities *)v4);
  v12 = v11;
  if (!v8)
    goto LABEL_15;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if ((v12 & 1) == 0)
      return 0;
  }
  else
  {
LABEL_15:
    if ((v11 & 1) == 0)
      return 0;
  }
  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a2 + 8))(v23);
  if (LODWORD(v23[0]) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
    return 107;
  eUICC::stringifyDataBuffer((eUICC *)((char *)v23 + 7), v15);
  gBBULogMaskGet();
  v19 = __p;
  if (v22 < 0)
    LOBYTE(v19) = __p[0];
  _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v16, v17, v18, (char)v19);
  if (HIBYTE(v23[0]) == 99)
    *a1 = 1;
  if (v22 < 0)
    operator delete(__p[0]);
  return 0;
}

void sub_24BA0C750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_24BA0C8B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x24BD2C164](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *a2)
{
  char *v3;
  int v4;
  const std::locale::facet *v5;
  int v6;
  std::locale v8;

  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
    v5 = std::locale::use_facet(&v8, MEMORY[0x24BEDB350]);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_24BA0C964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2C164](a1 + 128);
  return a1;
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t __cxx_global_var_init_2()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_24BA04000);
  }
  return result;
}

uint64_t __cxx_global_var_init_12()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

const void **VinylICECommunication::statusCallback(char a1, uint64_t a2, int a3)
{
  const void **result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t Controller;

  result = (const void **)gBBULogMaskGet();
  if ((*(_BYTE *)result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    result = (const void **)_BBULog(2, 0, "BBUICE16Communication", "", "transport %p, status: %d\n", v6, v7, v8, a1);
  if (a3 == 1)
  {
    Controller = TelephonyBasebandCreateController();
    v9 = TelephonyBasebandResetModem();
    if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      v13 = "failure";
      if (v9)
        v13 = "success";
      _BBULog(2, 0, "BBUICE16Communication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_24BA0CB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylICECommunication::freeTransportSync(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[6];
  char v14;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 48);
  if (!v2)
    return 1;
  if (v2 == a2)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = a1;
    dispatch_sync(v10, block);
    v8 = TelephonyUtilTransportFree();
    v11 = *(NSObject **)(a1 + 40);
    v13[0] = v9;
    v13[1] = 0x40000000;
    v13[2] = ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke_2;
    v13[3] = &__block_descriptor_tmp_8;
    v14 = v8;
    v13[4] = a1;
    v13[5] = a2;
    dispatch_sync(v11, v13);
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      _BBULog(2, 0, "BBUICE16Communication", "", "call with %p different from fTransportCreated(%p)\n", v5, v6, v7, a2);
      return 0;
    }
  }
  return v8;
}

uint64_t ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 1;
  return result;
}

uint64_t ___ZN21VinylICECommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 32);
  *(_BYTE *)(v1 + 24) = 0;
  if (*(_BYTE *)(result + 48))
  {
    *(_QWORD *)(v1 + 48) = 0;
  }
  else
  {
    v2 = result;
    result = gBBULogMaskGet();
    if ((*(_BYTE *)result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      return _BBULog(2, 0, "BBUICE16Communication", "", "fail to free transport: %p\n", v3, v4, v5, *(_QWORD *)(v2 + 40));
  }
  return result;
}

uint64_t VinylICECommunication::openChannel()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BBUCapabilities *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  int v14;
  char v16;
  __int128 v17;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "BBUICE16Communication", "", " Initializing KTL options struct, opening ARI channel\n", v0, v1, v2, v16);
  IceAriGetContext();
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v3 = (BBUCapabilities *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(&v17);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, &v17);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v3 = (BBUCapabilities *)qword_2579B9258;
  }
  v7 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v8 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  BBUCapabilities::getARICommandTimeout(v3);
  v10 = KTLInitOptions();
  v11 = v10;
  if (!v7)
    goto LABEL_15;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (v13)
  {
LABEL_15:
    if ((v10 & 1) != 0)
      goto LABEL_16;
LABEL_20:
    IceAriSetContextValid(1);
    return 11;
  }
  ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
  std::__shared_weak_count::__release_weak(v7);
  if ((v11 & 1) == 0)
    goto LABEL_20;
LABEL_16:
  IceAriGetContext();
  v14 = KTLOpenChannel();
  IceAriSetContextValid(1);
  if (v14)
    return 0;
  else
    return 11;
}

void sub_24BA0CEE4(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  _Unwind_Resume(a1);
}

void IceAriSetContextValid(char a1)
{
  _BYTE *v2;
  _BYTE *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __int128 v12;

  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  v2 = off_2579B9208;
  if (!off_2579B9208)
  {
    v3 = operator new(0x28uLL);
    v3[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v12, (uint64_t)v3);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&off_2579B9208, &v12);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v2 = off_2579B9208;
  }
  v7 = (std::__shared_weak_count *)off_2579B9210;
  if (off_2579B9210)
  {
    v8 = (unint64_t *)((char *)off_2579B9210 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  v2[32] = a1;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_24BA0D024(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t VinylICECommunication::createTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  char v18;
  _QWORD block[8];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 3;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2000000000;
  v34 = 0;
  TelephonyBasebandPCITransportInitParameters();
  if (*(_QWORD *)(a1 + 48))
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      _BBULog(2, 0, "BBUICE16Communication", "", "Need to free transport before creating again", v4, v5, v6, v18);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 40))(a1, *(_QWORD *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  LODWORD(v29) = v29 | 1;
  v8 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 0x40000000;
  v26[2] = ___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke;
  v26[3] = &__block_descriptor_tmp_12;
  v26[4] = a2;
  *((_QWORD *)&v27 + 1) = v7;
  *(_QWORD *)&v28 = v26;
  if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(2, 0, "BBUICE16Communication", "", "Creating transport:%p \n", v9, v10, v11, a2);
  LODWORD(v27) = 8;
  DWORD2(v28) = 10000;
  *(_DWORD *)(a1 + 56) = 8;
  if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(2, 0, "BBUICE16Communication", "", "Creating with timeout set to %u ms\n", v12, v13, v14, SBYTE8(v28));
  v15 = *(NSObject **)(a1 + 32);
  block[0] = v8;
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2;
  block[3] = &unk_251CCA1C8;
  block[6] = a1;
  block[7] = a2;
  v22 = v29;
  v23 = v30;
  v24 = v31;
  v25 = v32;
  v20 = v27;
  v21 = v28;
  block[4] = v33;
  block[5] = &v35;
  dispatch_sync(v15, block);
  v16 = *((unsigned int *)v36 + 6);
  if ((_DWORD)v27 == 8 && !(_DWORD)v16)
  {
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2);
    *((_DWORD *)v36 + 6) = v16;
  }
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);
  return v16;
}

void sub_24BA0D2B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_24BA0D408(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void VinylICECommunication::closeChannel(VinylICECommunication *this)
{
  if (IceAriGetContextValid())
  {
    IceAriGetContext();
    KTLCloseChannel();
    IceAriSetContextValid(0);
  }
}

BOOL IceAriGetContextValid(void)
{
  unsigned __int8 *v0;
  _BYTE *v1;
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  int v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  __int128 v12;

  pthread_mutex_lock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  v0 = (unsigned __int8 *)off_2579B9208;
  if (!off_2579B9208)
  {
    v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v12, (uint64_t)v1);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&off_2579B9208, &v12);
    v2 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v3 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 - 1, v3));
      if (!v4)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
    v0 = (unsigned __int8 *)off_2579B9208;
  }
  v5 = (std::__shared_weak_count *)off_2579B9210;
  if (off_2579B9210)
  {
    v6 = (unint64_t *)((char *)off_2579B9210 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  v8 = v0[32];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v8 != 0;
}

void sub_24BA0D554(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t VinylICECommunication::freeTransport(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 1;
  if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(2, 0, "BBUICE16Communication", "", "request to free transport: %p\n", v4, v5, v6, a2);
  (*(void (**)(_QWORD *))(*a1 + 32))(a1);
  v7 = a1[4];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylICECommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke;
  block[3] = &unk_251CCA1F0;
  block[4] = &v11;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v7, block);
  v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_24BA0D668(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21VinylICECommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = VinylICECommunication::freeTransportSync(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void VinylICECommunication::~VinylICECommunication(VinylICECommunication *this)
{
  void *v1;

  VinylICECommunication::~VinylICECommunication(this);
  operator delete(v1);
}

{
  NSObject *v2;
  NSObject *v3;

  *(_QWORD *)this = off_251CCA220;
  v2 = *((_QWORD *)this + 5);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 4);
  if (v3)
    dispatch_release(v3);
  VinylCommunication::~VinylCommunication(this);
}

uint64_t __cxx_global_var_init_3()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_24BA04000);
  }
  return result;
}

uint64_t __cxx_global_var_init_21()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

const void **VinylEURCommunication::statusCallback(char a1, uint64_t a2, int a3)
{
  const void **result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t Controller;

  result = (const void **)gBBULogMaskGet();
  if ((*(_BYTE *)result & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    result = (const void **)_BBULog(0, 0, "VinylEURCommunication", "", "transport %p, status: %#x\n", v6, v7, v8, a1);
  if (a3 == 1)
  {
    Controller = TelephonyBasebandCreateController();
    v9 = TelephonyBasebandResetModem();
    if ((*(_BYTE *)gBBULogMaskGet() & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      v13 = "failure";
      if (v9)
        v13 = "success";
      _BBULog(2, 0, "VinylEURCommunication", "", "Resetting modem: %s\n", v10, v11, v12, (char)v13);
    }
    return ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)&Controller);
  }
  return result;
}

void sub_24BA0D86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t VinylEURCommunication::freeTransportSync(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[6];
  char v12;

  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    return 1;
  if (v2 == a2)
  {
    v8 = TelephonyUtilTransportFree();
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylEURCommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    v12 = v8;
    block[4] = a1;
    block[5] = a2;
    dispatch_sync(v9, block);
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      _BBULog(0, 0, "VinylEURCommunication", "", "call with %p different from fTransportCreated(%p)\n", v5, v6, v7, a2);
      return 0;
    }
  }
  return v8;
}

uint64_t ___ZN21VinylEURCommunication17freeTransportSyncEP26TelephonyUtilTransport_tag_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  }
  else
  {
    result = gBBULogMaskGet();
    if ((*(_BYTE *)result & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      return _BBULog(0, 0, "VinylEURCommunication", "", "fail to free transport: %p\n", v2, v3, v4, *(_QWORD *)(v1 + 40));
  }
  return result;
}

uint64_t VinylEURCommunication::openChannel()
{
  return 0;
}

uint64_t VinylEURCommunication::createTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *exception;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD block[8];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[3];
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 3;
  if (capabilities::diag::preferredInterface((capabilities::diag *)a1) == 8)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2000000000;
    v35 = 0;
    TelephonyBasebandPCITransportInitParameters();
    if (*(_QWORD *)(a1 + 40))
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Communication/Eureka/VinylEURCommunication.cpp", 0x59u, (ctu::LogMessageBuffer *)"Assertion failure(nullptr == fTransportCreated && \"Telephony transport error.\")", v16, v17, v18, v19);
    }
    v4 = *(_QWORD *)(a1 + 32);
    v5 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 0x40000000;
    v27[2] = ___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke;
    v27[3] = &__block_descriptor_tmp_11;
    v27[4] = a2;
    *((_QWORD *)&v28 + 1) = v4;
    *(_QWORD *)&v29 = v27;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      _BBULog(0, 0, "VinylEURCommunication", "", "Creating transport:%p \n", v6, v7, v8, a2);
    LODWORD(v28) = 2;
    DWORD2(v29) = 2000;
    *(_DWORD *)(a1 + 48) = 2;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      _BBULog(0, 0, "VinylEURCommunication", "", "Creating with timeout set to %u ms\n", v9, v10, v11, SBYTE8(v29));
    v12 = *(NSObject **)(a1 + 24);
    block[0] = v5;
    block[1] = 0x40000000;
    block[2] = ___ZN21VinylEURCommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2;
    block[3] = &unk_251CCA2B0;
    block[6] = a1;
    block[7] = a2;
    v23 = v30;
    v24 = v31;
    v25 = v32;
    v26 = v33;
    v21 = v28;
    v22 = v29;
    block[4] = v34;
    block[5] = &v36;
    dispatch_sync(v12, block);
    _Block_object_dispose(v34, 8);
  }
  v13 = *((unsigned int *)v37 + 6);
  _Block_object_dispose(&v36, 8);
  return v13;
}

void sub_24BA0DC28(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  __cxa_free_exception(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_24BA0DD98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylEURCommunication::freeTransport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 1;
  if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(0, 0, "VinylEURCommunication", "", "request to free transport: %p\n", v4, v5, v6, a2);
  v7 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN21VinylEURCommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke;
  block[3] = &unk_251CCA2D8;
  block[4] = &v11;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v7, block);
  v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_24BA0DE90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN21VinylEURCommunication13freeTransportEP26TelephonyUtilTransport_tag_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = VinylEURCommunication::freeTransportSync(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void VinylEURCommunication::~VinylEURCommunication(VinylEURCommunication *this)
{
  void *v1;

  VinylEURCommunication::~VinylEURCommunication(this);
  operator delete(v1);
}

{
  NSObject *v2;
  NSObject *v3;

  *(_QWORD *)this = off_251CCA308;
  v2 = *((_QWORD *)this + 4);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 3);
  if (v3)
    dispatch_release(v3);
  VinylCommunication::~VinylCommunication(this);
}

uint64_t Options::Options(uint64_t a1, const __CFDictionary **a2)
{
  uint64_t v4;
  void **v5;
  void **v6;
  void **v7;
  uint64_t (*v8)(uint64_t);
  const __CFDictionary *Value;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v17;
  unsigned int v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v28;
  unsigned int v29;
  int v30;
  char *v31;
  uint64_t v32;
  char v33;
  const __CFString *v34;
  unint64_t v35;
  unsigned __int8 v36;
  uint64_t i;
  uint64_t v38;
  void *exception;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void **v45;
  _BYTE v46[8];
  char *v47;
  void *v48[2];
  unsigned __int8 v49;
  _BYTE v50[16];
  _BYTE v51[16];
  void *__p[2];
  uint64_t v53;
  int v54;
  _QWORD v55[3];
  int v56;
  _QWORD v57[3];
  int v58;
  _QWORD v59[3];
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)a1 = 255;
  v4 = a1 + 16;
  *(_QWORD *)(a1 + 4) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 16), "");
  *(_WORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 42) = 0;
  v5 = (void **)(a1 + 48);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 48), "");
  *(_BYTE *)(a1 + 72) = 0;
  v6 = (void **)(a1 + 80);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 80), "");
  v7 = (void **)(a1 + 104);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 104), "");
  v8 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!*a2)
    v8 = 0;
  if (v8)
  {
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v51, *a2);
    Value = (const __CFDictionary *)CFDictionaryGetValue(*a2, CFSTR("BasebandUpdater"));
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v50, Value);
    *(_BYTE *)(a1 + 11) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v50, CFSTR("VinylForceGold"));
    *(_BYTE *)(a1 + 10) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v50, CFSTR("VinylForceMain"));
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 39) < 0)
      operator delete(*(void **)v4);
    *(_OWORD *)v4 = *(_OWORD *)__p;
    *(_QWORD *)(v4 + 16) = v53;
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 71) < 0)
      operator delete(*v5);
    *(_OWORD *)v5 = *(_OWORD *)__p;
    *(_QWORD *)(a1 + 64) = v53;
    *(_BYTE *)(a1 + 72) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v51, CFSTR("VinylTwoPhasePresenceCheck"));
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 103) < 0)
      operator delete(*v6);
    *(_OWORD *)v6 = *(_OWORD *)__p;
    *(_QWORD *)(a1 + 96) = v53;
    ctu::cf::map_adapter::getString();
    if (*(char *)(a1 + 127) < 0)
      operator delete(*v7);
    *(_OWORD *)v7 = *(_OWORD *)__p;
    *(_QWORD *)(a1 + 120) = v53;
    if (*(char *)(a1 + 127) < 0)
    {
      v11 = *(char **)(a1 + 104);
      v10 = *(_QWORD *)(a1 + 112);
    }
    else
    {
      v10 = *(unsigned __int8 *)(a1 + 127);
      v11 = (char *)(a1 + 104);
    }
    v12 = &v11[v10];
    v13 = MEMORY[0x24BDAC740];
    if (v10)
    {
      v14 = v10 - 1;
      while (1)
      {
        v15 = *v11;
        if ((v15 & 0x80000000) != 0 ? __maskrune(v15, 0x20000uLL) : *(_DWORD *)(v13 + 4 * v15 + 60) & 0x20000)
          break;
        ++v11;
        --v14;
        if (v11 == v12)
          goto LABEL_34;
      }
      if (v11 == v12 || v11 + 1 == v12)
      {
        v12 = v11;
      }
      else
      {
        v17 = 1;
        v12 = v11;
        do
        {
          v18 = v11[v17];
          if ((v18 & 0x80000000) != 0)
            v19 = __maskrune(v18, 0x20000uLL);
          else
            v19 = *(_DWORD *)(v13 + 4 * v18 + 60) & 0x20000;
          if (!v19)
            *v12++ = v11[v17];
          ++v17;
          --v14;
        }
        while (v14);
      }
    }
LABEL_34:
    if (*(char *)(a1 + 127) < 0)
    {
      v21 = *(_QWORD *)(a1 + 104);
      v20 = (char *)(v21 + *(_QWORD *)(a1 + 112));
    }
    else
    {
      v20 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
      v21 = a1 + 104;
    }
    std::string::erase((std::string *)(a1 + 104), (std::string::size_type)&v12[-v21], v20 - v12);
    if (*(char *)(a1 + 127) < 0)
    {
      v23 = *(char **)(a1 + 104);
      v22 = *(_QWORD *)(a1 + 112);
    }
    else
    {
      v22 = *(unsigned __int8 *)(a1 + 127);
      v23 = (char *)(a1 + 104);
    }
    v24 = &v23[v22];
    if (v22)
    {
      v25 = v22 - 1;
      while (1)
      {
        v26 = *v23;
        if ((v26 & 0x80000000) != 0 ? __maskrune(v26, 0x200uLL) : *(_DWORD *)(v13 + 4 * v26 + 60) & 0x200)
          break;
        ++v23;
        --v25;
        if (v23 == v24)
          goto LABEL_59;
      }
      if (v23 == v24 || v23 + 1 == v24)
      {
        v24 = v23;
      }
      else
      {
        v28 = 1;
        v24 = v23;
        do
        {
          v29 = v23[v28];
          if ((v29 & 0x80000000) != 0)
            v30 = __maskrune(v29, 0x200uLL);
          else
            v30 = *(_DWORD *)(v13 + 4 * v29 + 60) & 0x200;
          if (!v30)
            *v24++ = v23[v28];
          ++v28;
          --v25;
        }
        while (v25);
      }
    }
LABEL_59:
    if (*(char *)(a1 + 127) < 0)
    {
      v32 = *(_QWORD *)(a1 + 104);
      v31 = (char *)(v32 + *(_QWORD *)(a1 + 112));
    }
    else
    {
      v31 = (char *)v7 + *(unsigned __int8 *)(a1 + 127);
      v32 = a1 + 104;
    }
    std::string::erase((std::string *)(a1 + 104), (std::string::size_type)&v24[-v32], v31 - v24);
    if ((ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v50, CFSTR("VinylSkipAll")) & 1) != 0)
      v33 = 1;
    else
      v33 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v51, CFSTR("UpdateBaseband")) ^ 1;
    *(_BYTE *)(a1 + 8) = v33;
    *(_BYTE *)(a1 + 9) = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v50, CFSTR("VinylOnlyPerso"));
    if (ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v50, CFSTR("VinylUse4FF")))
      *(_DWORD *)a1 = 1;
    if (BBUpdaterCommon::isNVRAMKeyPresent(CFSTR("VinylForceGenericUpdate"), v34))
      *(_WORD *)(a1 + 10) = 257;
    __p[0] = 0;
    __p[1] = 0;
    v53 = 0;
    ctu::cf::map_adapter::getString();
    if (SHIBYTE(v53) < 0)
      operator delete(__p[0]);
    v35 = v49;
    v36 = v49;
    if ((v49 & 0x80u) != 0)
      v35 = (unint64_t)v48[1];
    if (v35)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "Bootstrap");
      v54 = 1;
      std::string::basic_string[abi:ne180100]<0>(v55, "All");
      v56 = 2;
      std::string::basic_string[abi:ne180100]<0>(v57, "Bootstrap Preferences");
      v58 = 3;
      std::string::basic_string[abi:ne180100]<0>(v59, "All Preferences");
      v60 = 4;
      std::map<std::string,VinylRefurbAction,BBUpdaterCommon::case_insensitive_key_comparer,std::allocator<std::pair<std::string const,VinylRefurbAction>>>::map[abi:ne180100]((uint64_t)v46, (uint64_t)__p, 4);
      for (i = 0; i != -16; i -= 4)
      {
        if (SHIBYTE(v59[i + 2]) < 0)
          operator delete((void *)v59[i]);
      }
      v38 = std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::find<std::string>((uint64_t)v46, (uint64_t)v48);
      if (&v47 == (char **)v38)
      {
        exception = __cxa_allocate_exception(0x210uLL);
        v44 = exception;
        v45 = v48;
        if ((v49 & 0x80u) != 0)
          LOBYTE(v45) = v48[0];
        _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Options/eUICCOptions.cpp", 0x4Bu, (ctu::LogMessageBuffer *)"Invalid Refurb Option %s", v41, v42, v43, (char)v45);
      }
      *(_DWORD *)(a1 + 4) = *(_DWORD *)(v38 + 56);
      std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy((uint64_t)v46, v47);
      v36 = v49;
    }
    if ((v36 & 0x80) != 0)
      operator delete(v48[0]);
    MEMORY[0x24BD2BD2C](v50);
    MEMORY[0x24BD2BD2C](v51);
  }
  return a1;
}

void sub_24BA0E590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, char *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  char *v29;
  void **v30;
  void **v31;
  void **v32;
  void **v33;
  void *v34;

  __cxa_free_exception(v34);
  std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy((uint64_t)&a11, a12);
  if (a19 < 0)
    operator delete(__p);
  MEMORY[0x24BD2BD2C](&a20);
  MEMORY[0x24BD2BD2C](&a22);
  if (v29[127] < 0)
    operator delete(*v33);
  if (v29[103] < 0)
    operator delete(*v32);
  if (v29[71] < 0)
    operator delete(*v31);
  if (v29[39] < 0)
    operator delete(*v30);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

_QWORD *Options::StringifyPostProcess@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;

  if ((a1 - 1) > 3)
    v2 = "No Action";
  else
    v2 = off_251CCA350[a1 - 1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t Options::ToString(Options *this)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  unsigned int v27;
  char *v28;
  void **v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  int v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  void *__p[2];
  unsigned __int8 v58;
  _QWORD v59[11];
  char v60;
  uint64_t v61;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v59);
  v2 = v59[0];
  *(_DWORD *)((char *)&v59[1] + *(_QWORD *)(v59[0] - 24)) |= 1u;
  *(_DWORD *)((char *)&v59[1] + *(_QWORD *)(v2 - 24)) = *(_DWORD *)((_BYTE *)&v59[1] + *(_QWORD *)(v2 - 24)) & 0xFFFFFFB5 | 8;
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v59, (uint64_t)"=========== Vinyl eUICC Options ============\n", 45);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"uimSlot               ", 22);
  v4 = (_QWORD *)std::ostream::operator<<();
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"skipAll               ", 22);
  v6 = (_QWORD *)std::ostream::operator<<();
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"onlyPerso             ", 22);
  v8 = (_QWORD *)std::ostream::operator<<();
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"forceMain             ", 22);
  v10 = (_QWORD *)std::ostream::operator<<();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"forceGold             ", 22);
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"forcePerso            ", 22);
  v14 = (_QWORD *)std::ostream::operator<<();
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"\n", 1);
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"alderHost             ", 22);
  v17 = *((char *)this + 39);
  if (v17 >= 0)
    v18 = (char *)this + 16;
  else
    v18 = (char *)*((_QWORD *)this + 2);
  if (v17 >= 0)
    v19 = *((unsigned __int8 *)this + 39);
  else
    v19 = *((_QWORD *)this + 3);
  v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v18, v19);
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"persoStatic           ", 22);
  v22 = (_QWORD *)std::ostream::operator<<();
  v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"internalBuild         ", 22);
  v24 = (_QWORD *)std::ostream::operator<<();
  v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"\n", 1);
  v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"postProcess           ", 22);
  v27 = *((_DWORD *)this + 1) - 1;
  if (v27 > 3)
    v28 = "No Action";
  else
    v28 = off_251CCA350[v27];
  std::string::basic_string[abi:ne180100]<0>(__p, v28);
  if ((v58 & 0x80u) == 0)
    v29 = __p;
  else
    v29 = (void **)__p[0];
  if ((v58 & 0x80u) == 0)
    v30 = v58;
  else
    v30 = (uint64_t)__p[1];
  v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v29, v30);
  v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\n", 1);
  v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"twoPhaseRefurbRef     ", 22);
  v34 = *((char *)this + 127);
  if (v34 >= 0)
    v35 = (char *)this + 104;
  else
    v35 = (char *)*((_QWORD *)this + 13);
  if (v34 >= 0)
    v36 = *((unsigned __int8 *)this + 127);
  else
    v36 = *((_QWORD *)this + 14);
  v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
  v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"\n", 1);
  v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)"twoPhaseUrl           ", 22);
  v40 = *((char *)this + 71);
  if (v40 >= 0)
    v41 = (char *)this + 48;
  else
    v41 = (char *)*((_QWORD *)this + 6);
  if (v40 >= 0)
    v42 = *((unsigned __int8 *)this + 71);
  else
    v42 = *((_QWORD *)this + 7);
  v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)v41, v42);
  v44 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)"twoPhasePresenceCheck ", 22);
  v45 = (_QWORD *)std::ostream::operator<<();
  v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"\n", 1);
  v47 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v46, (uint64_t)"twoPhaseEidMask       ", 22);
  v50 = *((_QWORD *)this + 10);
  v49 = (char *)this + 80;
  v48 = v50;
  v51 = v49[23];
  if (v51 >= 0)
    v52 = (uint64_t)v49;
  else
    v52 = v48;
  if (v51 >= 0)
    v53 = v49[23];
  else
    v53 = *((_QWORD *)v49 + 1);
  v54 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, v52, v53);
  v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v55, (uint64_t)"======================================\n", 39);
  if ((char)v58 < 0)
    operator delete(__p[0]);
  std::stringbuf::str();
  v59[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v59 + *(_QWORD *)(v59[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v59[1] = MEMORY[0x24BEDB848] + 16;
  if (v60 < 0)
    operator delete((void *)v59[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x24BD2C164](&v61);
}

void sub_24BA0EB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
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

void sub_24BA0EC20(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x24BD2C164](v1);
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
  MEMORY[0x24BD2C164](a1 + 112);
  return a1;
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

uint64_t std::map<std::string,VinylRefurbAction,BBUpdaterCommon::case_insensitive_key_comparer,std::allocator<std::pair<std::string const,VinylRefurbAction>>>::map[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,VinylRefurbAction> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 32;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_24BA0EDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,VinylRefurbAction> const&>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__construct_node<std::pair<std::string const,VinylRefurbAction> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, uint64_t a5)
{
  uint64_t **v9;
  const char *v11;
  const char *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  BOOL v19;
  const char *v20;
  const char *v21;
  uint64_t *v22;
  const char *v23;

  v9 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2
    || (*(char *)(a5 + 23) >= 0 ? (v11 = (const char *)a5) : (v11 = *(const char **)a5),
        *((char *)a2 + 55) >= 0 ? (v12 = (const char *)(a2 + 4)) : (v12 = (const char *)a2[4]),
        strcasecmp(v11, v12) < 0))
  {
    v13 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      v15 = a2;
LABEL_29:
      if (v13)
      {
        *a3 = v15;
        return v15 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v13)
    {
      v14 = (uint64_t *)*a2;
      do
      {
        v15 = v14;
        v14 = (uint64_t *)v14[1];
      }
      while (v14);
    }
    else
    {
      v18 = a2;
      do
      {
        v15 = (uint64_t *)v18[2];
        v19 = *v15 == (_QWORD)v18;
        v18 = v15;
      }
      while (v19);
    }
    if (*((char *)v15 + 55) >= 0)
      v20 = (const char *)(v15 + 4);
    else
      v20 = (const char *)v15[4];
    if (*(char *)(a5 + 23) >= 0)
      v21 = (const char *)a5;
    else
      v21 = *(const char **)a5;
    if (strcasecmp(v20, v21) < 0)
      goto LABEL_29;
    return std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  if (strcasecmp(v12, v11) < 0)
  {
    v16 = a2[1];
    if (v16)
    {
      v17 = (uint64_t *)a2[1];
      do
      {
        a4 = (uint64_t **)v17;
        v17 = (uint64_t *)*v17;
      }
      while (v17);
    }
    else
    {
      v22 = a2;
      do
      {
        a4 = (uint64_t **)v22[2];
        v19 = *a4 == v22;
        v22 = (uint64_t *)a4;
      }
      while (!v19);
    }
    if (a4 == v9
      || (*((char *)a4 + 55) >= 0 ? (v23 = (const char *)(a4 + 4)) : (v23 = (const char *)a4[4]),
          strcasecmp(v11, v23) < 0))
    {
      if (v16)
      {
        *a3 = (uint64_t *)a4;
      }
      else
      {
        *a3 = a2;
        return a2 + 1;
      }
      return (uint64_t *)a4;
    }
    return std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
  }
  *a3 = a2;
  *a4 = a2;
  return (uint64_t *)a4;
}

void std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__construct_node<std::pair<std::string const,VinylRefurbAction> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    *((_QWORD *)v6 + 6) = *(_QWORD *)(a2 + 16);
  }
  *((_DWORD *)v6 + 14) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_24BA0F0D8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

_QWORD *std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  const char *v11;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    if (*(char *)(a3 + 23) >= 0)
      v6 = (const char *)a3;
    else
      v6 = *(const char **)a3;
    do
    {
      while (1)
      {
        v7 = v4;
        v10 = (_QWORD *)v4[4];
        v8 = v4 + 4;
        v9 = v10;
        v11 = (const char *)(*((char *)v8 + 23) >= 0 ? v8 : v9);
        if ((strcasecmp(v6, v11) & 0x80000000) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_15;
      }
      if ((strcasecmp(v11, v6) & 0x80000000) == 0)
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
LABEL_15:
  *a2 = v7;
  return v5;
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

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

void std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::find<std::string>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;

  v3 = a1 + 8;
  v4 = std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__lower_bound<std::string>(a1, a2, *(_QWORD *)(a1 + 8), a1 + 8);
  if (v3 == v4)
    return v3;
  v5 = v4;
  v6 = *(char *)(a2 + 23) >= 0 ? (const char *)a2 : *(const char **)a2;
  v7 = *(char *)(v5 + 55) >= 0 ? (const char *)(v5 + 32) : *(const char **)(v5 + 32);
  if (strcasecmp(v6, v7) < 0)
    return v3;
  return v5;
}

uint64_t std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__lower_bound<std::string>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t *v9;

  if (a3)
  {
    v5 = a3;
    if (*(char *)(a2 + 23) >= 0)
      v6 = (const char *)a2;
    else
      v6 = *(const char **)a2;
    do
    {
      if (*(char *)(v5 + 55) >= 0)
        v7 = (const char *)(v5 + 32);
      else
        v7 = *(const char **)(v5 + 32);
      v8 = strcasecmp(v7, v6);
      v9 = (uint64_t *)(v5 + 8);
      if (v8 >= 0)
      {
        v9 = (uint64_t *)v5;
        a4 = v5;
      }
      v5 = *v9;
    }
    while (*v9);
  }
  return a4;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x24BD2BFD8](v13, a1);
  if (v13[0])
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
  MEMORY[0x24BD2BFE4](v13);
  return a1;
}

void sub_24BA0F614(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24BD2BFE4](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24BA0F5F4);
}

void sub_24BA0F65C(_Unwind_Exception *a1)
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
  void *__p[2];
  char v18;

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
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
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

void sub_24BA0F790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

VinylSecureElement *VinylSecureElement::create(VinylSecureElement *this)
{
  VinylSecureElement *v1;

  v1 = (VinylSecureElement *)operator new(1uLL);
  VinylSecureElement::init(v1);
  return v1;
}

uint64_t VinylSecureElement::init(VinylSecureElement *this)
{
  void *v1;
  void *v2;
  void *exception;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v1 = dlopen("/usr/lib/libnfrestore.dylib", 261);
  if (!v1)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure(lib != __null && \"Could not find /usr/lib/libnfrestore.dylib\")", v5, v6, v7, v17);
    goto LABEL_10;
  }
  v2 = v1;
  pfnNfRestoreOpenWithSE = dlsym(v1, "NfRestoreSEOpenWithError");
  if (!pfnNfRestoreOpenWithSE)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x31u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreOpenWithSE != __null && \"Could not find NfRestoreSEOpenWithError symbol\\n\")", v8, v9, v10, v17);
    goto LABEL_10;
  }
  pfnNfRestoreSEClose = dlsym(v2, "NfRestoreSEClose");
  if (!pfnNfRestoreSEClose)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x34u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreSEClose != __null && \"Could not find NfRestoreSEClose symbol\\n\")", v11, v12, v13, v17);
    goto LABEL_10;
  }
  pfnNfRestoreDumpUART = (uint64_t)dlsym(v2, "NfRestoreDumpUART");
  if (!pfnNfRestoreDumpUART)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 1, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/SecureElement/VinylSecureElement.cpp", 0x37u, (ctu::LogMessageBuffer *)"Assertion failure(pfnNfRestoreDumpUART != __null && \"Could not find pfnNfRestoreDumpUART symbol\\n\")", v14, v15, v16, v17);
LABEL_10:
  }
  return 0;
}

void sub_24BA0F9C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylSecureElement::PowerUpSE(VinylSecureElement *this)
{
  BOOL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  std::chrono::nanoseconds __ns;

  v7 = 0;
  if (pfnNfRestoreOpenWithSE)
    v1 = pfnNfRestoreDumpUART == 0;
  else
    v1 = 1;
  if (v1)
    return 0;
  v2 = pfnNfRestoreOpenWithSE(0, 0, &v7);
  if (v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylSecureElement", "", "pfnNfRestoreOpenWithSE failure, outResult: %d\n", v3, v4, v5, v7);
  }
  __ns.__rep_ = 1000000000;
  std::this_thread::sleep_for (&__ns);
  return v2;
}

uint64_t VinylSecureElement::PowerDownSE(VinylSecureElement *this, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char vars0;

  if (!pfnNfRestoreSEClose)
    return 1;
  pfnNfRestoreSEClose(a2);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylSecureElement", "", "SE closed SUCCESSFULLY\n", v2, v3, v4, vars0);
  return 0;
}

uint64_t _BBUException::_BBUException(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(_DWORD *)(a1 + 520) = a2;
  *(_QWORD *)a1 = off_251CCA418;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

{
  *(_DWORD *)(a1 + 520) = a2;
  *(_QWORD *)a1 = off_251CCA418;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

void sub_24BA0FB34(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void _BBUException::constructCommon(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *this, char *a6)
{
  uint64_t v10;
  __int128 v11;
  char *v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  void **v17;
  std::string::size_type v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  std::string::size_type size;
  std::string *v25;
  __int128 v26;
  const std::string::value_type *v27;
  std::string::size_type v28;
  uint64_t v29;
  std::string *v30;
  std::string v31;
  uint64_t v32;
  void *__p[2];
  unsigned __int8 v34;
  std::string v35;
  std::string v36;
  std::string v37;
  std::string v38;
  std::string v39;
  __int128 v40;
  int64_t v41;
  std::string v42;

  ctu::LogMessageBuffer::vCreateWithFormat(this, a6, a3);
  v10 = MEMORY[0x24BD2BCE4](&v40);
  v11 = *(_OWORD *)v10;
  v42.__r_.__value_.__r.__words[2] = *(_QWORD *)(v10 + 16);
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v11;
  *(_QWORD *)(v10 + 8) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)v10 = 0;
  MEMORY[0x24BD2BCFC](&v40);
  std::string::basic_string[abi:ne180100]<0>(&v35, " ");
  v12 = BBUReturnAsString(a2);
  v13 = std::string::append(&v35, v12);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  v15 = std::string::append(&v36, "@");
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  ctu::llvm::StringRef::StringRef((ctu::llvm::StringRef *)&v32, a3);
  ctu::basename();
  if ((v34 & 0x80u) == 0)
    v17 = __p;
  else
    v17 = (void **)__p[0];
  if ((v34 & 0x80u) == 0)
    v18 = v34;
  else
    v18 = (std::string::size_type)__p[1];
  v19 = std::string::append(&v37, (const std::string::value_type *)v17, v18);
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  v21 = std::string::append(&v38, ":");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v39.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v31, a4);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = &v31;
  else
    v23 = (std::string *)v31.__r_.__value_.__r.__words[0];
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
  else
    size = v31.__r_.__value_.__l.__size_;
  v25 = std::string::append(&v39, (const std::string::value_type *)v23, size);
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v41 = v25->__r_.__value_.__r.__words[2];
  v40 = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  if (v41 >= 0)
    v27 = (const std::string::value_type *)&v40;
  else
    v27 = (const std::string::value_type *)v40;
  if (v41 >= 0)
    v28 = HIBYTE(v41);
  else
    v28 = *((_QWORD *)&v40 + 1);
  std::string::append(&v42, v27, v28);
  if (SHIBYTE(v41) < 0)
    operator delete((void *)v40);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if ((char)v34 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  *(_OWORD *)(a1 + 8) = 0u;
  v29 = a1 + 8;
  *(_OWORD *)(v29 + 480) = 0u;
  *(_OWORD *)(v29 + 496) = 0u;
  *(_OWORD *)(v29 + 448) = 0u;
  *(_OWORD *)(v29 + 464) = 0u;
  *(_OWORD *)(v29 + 416) = 0u;
  *(_OWORD *)(v29 + 432) = 0u;
  *(_OWORD *)(v29 + 384) = 0u;
  *(_OWORD *)(v29 + 400) = 0u;
  *(_OWORD *)(v29 + 352) = 0u;
  *(_OWORD *)(v29 + 368) = 0u;
  *(_OWORD *)(v29 + 320) = 0u;
  *(_OWORD *)(v29 + 336) = 0u;
  *(_OWORD *)(v29 + 288) = 0u;
  *(_OWORD *)(v29 + 304) = 0u;
  *(_OWORD *)(v29 + 256) = 0u;
  *(_OWORD *)(v29 + 272) = 0u;
  *(_OWORD *)(v29 + 224) = 0u;
  *(_OWORD *)(v29 + 240) = 0u;
  *(_OWORD *)(v29 + 192) = 0u;
  *(_OWORD *)(v29 + 208) = 0u;
  *(_OWORD *)(v29 + 160) = 0u;
  *(_OWORD *)(v29 + 176) = 0u;
  *(_OWORD *)(v29 + 128) = 0u;
  *(_OWORD *)(v29 + 144) = 0u;
  *(_OWORD *)(v29 + 96) = 0u;
  *(_OWORD *)(v29 + 112) = 0u;
  *(_OWORD *)(v29 + 64) = 0u;
  *(_OWORD *)(v29 + 80) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  v30 = &v42;
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v30 = (std::string *)v42.__r_.__value_.__r.__words[0];
  *(_OWORD *)(v29 + 16) = 0uLL;
  snprintf((char *)v29, 0x200uLL, "%s\n", (const char *)v30);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
}

void sub_24BA0FE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  uint64_t v49;

  if (*(char *)(v49 - 121) < 0)
    operator delete(*(void **)(v49 - 144));
  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v49 - 153) < 0)
    operator delete(*(void **)(v49 - 176));
  if (a49 < 0)
    operator delete(a44);
  if (a23 < 0)
    operator delete(a18);
  if (a42 < 0)
    operator delete(a37);
  if (a35 < 0)
    operator delete(a30);
  if (a29 < 0)
    operator delete(a24);
  if (*(char *)(v49 - 57) < 0)
    operator delete(*(void **)(v49 - 80));
  _Unwind_Resume(exception_object);
}

void sub_24BA0FF48(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void _BBUException::~_BBUException(std::exception *this)
{
  void *v1;

  std::exception::~exception(this);
  operator delete(v1);
}

void _BBUException::_BBUException(_BBUException *this, const _BBUException *a2)
{
  *(_QWORD *)this = off_251CCA418;
  strncpy((char *)this + 8, (const char *)a2 + 8, 0x200uLL);
  *((_DWORD *)this + 130) = *((_DWORD *)a2 + 130);
}

uint64_t _BBUException::what(_BBUException *this)
{
  return (uint64_t)this + 8;
}

ctu::llvm::StringRef *ctu::llvm::StringRef::StringRef(ctu::llvm::StringRef *this, const char *__s)
{
  *(_QWORD *)this = __s;
  if (!__s)
    ctu::llvm::StringRef::StringRef();
  *((_QWORD *)this + 1) = strlen(__s);
  return this;
}

uint64_t VinyleUICCPerformOperationWithTransport(unsigned int a1, __CFDictionary **a2, const __CFDictionary *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BBUCapabilities *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int updated;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "Vinyl Operation: %d, lastOperation: %d\n", v10, v11, v12, a1);
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v13 = (BBUCapabilities *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(&v47);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, &v47);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
    if (*((_QWORD *)&v47 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v13 = (BBUCapabilities *)qword_2579B9258;
  }
  v17 = (std::__shared_weak_count *)off_2579B9260;
  if (off_2579B9260)
  {
    v18 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v20 = BBUCapabilities::supportsVinylRestore(v13);
  v21 = v20;
  if (!v17)
    goto LABEL_15;
  p_shared_owners = (unint64_t *)&v17->__shared_owners_;
  do
    v23 = __ldaxr(p_shared_owners);
  while (__stlxr(v23 - 1, p_shared_owners));
  if (v23)
  {
LABEL_15:
    if ((v20 & 1) != 0)
      goto LABEL_16;
LABEL_30:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "unsupported device\n", v37, v38, v39, v46);
    return 0;
  }
  ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
  std::__shared_weak_count::__release_weak(v17);
  if ((v21 & 1) == 0)
    goto LABEL_30;
LABEL_16:
  if (a3)
  {
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v47, a3);
    if ((ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)&v47, CFSTR("UpdateBaseband")) & 1) != 0)
    {
      MEMORY[0x24BD2BD2C](&v47);
      goto LABEL_19;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "updateBaseband false\n", v40, v41, v42, v46);
    MEMORY[0x24BD2BD2C](&v47);
    return 0;
  }
LABEL_19:
  if (a1 >= 5)
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylNonUpdate", "", "check failed: %s, %d, assertion: %s\n", v43, v44, v45, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/NonUpdate/VinyleUICC.cpp");
    v25 = 0;
    updated = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      _BBULog(0, 1, "VinylNonUpdate", "", "Invalid user operation: %d\n", v30, v31, v32, a1);
      updated = 0;
      v25 = 0;
    }
  }
  else
  {
    result = VinylController::create(a5, 1);
    if (!result)
      return result;
    v25 = result;
    updated = VinylController::performNonUpdateOperation(result, a1, a2, a3);
  }
  if (a4 == 1)
    VinylControllerObjDestroy(v25, v26, v27, v28, v29, v30, v31, v32, v46);
  if (updated && updated != 9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylNonUpdate", "", "something is wrong.. : %d\n", v34, v35, v36, updated);
    if (!a5)
      BBUpdaterCommon::collectCoreDump((BBUpdaterCommon *)a2, 0, 0);
  }
  return VinylControllerMapBBUReturnToVinylResult(updated);
}

void sub_24BA10340(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t VinyleUICCPerformOperation(unsigned int a1, __CFDictionary **a2, const __CFDictionary *a3, int a4)
{
  return VinyleUICCPerformOperationWithTransport(a1, a2, a3, a4, 0);
}

uint64_t __cxx_global_var_init_4()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

const void **CFOBJ_STR@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  CFStringRef v3;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@"), *a1);
  ctu::cf::assign();
  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v3);
}

void sub_24BA10428(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  if (*(char *)(v2 + 23) < 0)
    operator delete(*(void **)v2);
  _Unwind_Resume(a1);
}

uint64_t VinylControllerMapBBUReturnToVinylResult(unsigned int a1)
{
  if (a1 > 0x1B)
    return 1;
  else
    return dword_24BA29D18[a1];
}

uint64_t eUICC::TwoPhaseProv::ComposeGps(BBUpdaterCommon *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFDataRef v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex length;
  _QWORD v12[2];
  unint64_t v13;
  const void *v14;
  UInt8 bytes[16];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v12[0] = &v13;
  v12[1] = 8;
  v13 = bswap64(BBUpdaterCommon::getECID(a1));
  length = 16;
  if (DEREncodeSequenceFromObject(0xE00000000000002DLL, (unint64_t)v12, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::getProvSessReqSpec, (unint64_t)bytes, 0x10uLL, (unint64_t *)&length))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v2, v3, v4, (char)"DR_Success == enc_ret");
    return 17;
  }
  v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length);
  v7 = *(const void **)a1;
  *(_QWORD *)a1 = v6;
  v14 = v7;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
  if (!*(_QWORD *)a1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"gps_req.get()");
    return 17;
  }
  return 0;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t eUICC::TwoPhaseProv::ConvertGpsToGbpp(uint64_t *a1, const void **a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v11;
  CFMutableDictionaryRef theDict;
  const void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("APIVersion");
  v14[1] = CFSTR("1");
  v3 = *a1;
  v14[2] = CFSTR("BPPRequestData");
  v14[3] = v3;
  v14[4] = CFSTR("Command");
  v14[5] = CFSTR("GetBpp");
  v14[6] = CFSTR("ResponseDataFlag");
  v14[7] = CFSTR("NEW_BPP");
  v14[8] = CFSTR("HardwareType");
  v14[9] = CFSTR("2");
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!theDict)
    v4 = 0;
  if (v4)
  {
    for (i = 0; i != 10; i += 2)
      CFDictionaryAddValue(theDict, (const void *)v14[i], (const void *)v14[i + 1]);
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(&v11, (CFTypeRef *)&theDict);
    if (&v11 != a2)
    {
      v13 = *a2;
      *a2 = v11;
      v11 = 0;
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v13);
    }
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v11);
    v6 = 0;
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"dict");
    v6 = 17;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v6;
}

void sub_24BA107A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t eUICC::TwoPhaseProv::ConvertPirToHir(CFDataRef *a1, const void **this, void **a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v11;
  uint64_t (*v12)(uint64_t);
  uint64_t i;
  const void *v14;
  uint64_t (*v15)(uint64_t);
  const void *v16;
  __CFDictionary *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  CFMutableDictionaryRef theDict;
  void *value;
  const void *v31[11];

  v31[10] = *(const void **)MEMORY[0x24BDAC8D0];
  v28 = 0;
  theDict = 0;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  if (a1 && *a1 && eUICC::TwoPhaseProv::SessionData::extractDataFromPir((uint64_t)this, a1))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"(kVinylResultSuccess == sessionData.extractDataFromPir(*pir))");
    v9 = 27;
    goto LABEL_27;
  }
  v31[0] = CFSTR("APIVersion");
  v31[1] = CFSTR("1");
  v31[2] = CFSTR("Command");
  v31[3] = CFSTR("HandleInstallationResult");
  v31[4] = CFSTR("EuiccSessionID");
  eUICC::TwoPhaseProv::SessionData::getEUICCSessionId(this, (const void **)&value);
  v31[5] = value;
  v31[6] = CFSTR("EID");
  eUICC::TwoPhaseProv::SessionData::getEid(this, &v24);
  v31[7] = v24;
  v31[8] = CFSTR("TransactionID");
  eUICC::TwoPhaseProv::SessionData::getTransactionId(this, &v23);
  v31[9] = v23;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&value);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v11 = theDict;
  theDict = Mutable;
  value = v11;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&value);
  if (theDict)
    v12 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  else
    v12 = 0;
  if (!v12)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"dict");
    v9 = 17;
    goto LABEL_27;
  }
  for (i = 0; i != 10; i += 2)
  {
    v14 = v31[i + 1];
    if (v14)
      CFDictionaryAddValue(theDict, v31[i], v14);
  }
  eUICC::TwoPhaseProv::SessionData::getError(this, (const void **)&value);
  if (value)
    v15 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  else
    v15 = 0;
  if (v15)
  {
    eUICC::TwoPhaseProv::SessionData::getError(this, &v24);
    v16 = v24;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v24);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&value);
    if (!v16)
      goto LABEL_20;
    v17 = theDict;
    eUICC::TwoPhaseProv::SessionData::getError(this, (const void **)&value);
    CFDictionaryAddValue(v17, CFSTR("ErrorCode"), value);
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&value);
LABEL_20:
  if (a1 && *a1)
    CFDictionaryAddValue(theDict, CFSTR("ProfileInstallationResult"), *a1);
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(&value, (CFTypeRef *)&theDict);
  if (&value != a3)
  {
    v18 = *a3;
    *a3 = value;
    value = 0;
    v31[0] = v18;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v31);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&value);
  v9 = 0;
LABEL_27:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v25);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v27);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v9;
}

void sub_24BA10B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  const void *v9;
  va_list va;
  const void *v11;
  va_list va1;
  const void *v13;
  va_list va2;
  const void *v15;
  va_list va3;
  const void *v17;
  va_list va4;
  va_list va5;

  va_start(va5, a8);
  va_start(va4, a8);
  va_start(va3, a8);
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v11 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v13 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v15 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v17 = va_arg(va5, const void *);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va3);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va4);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t eUICC::TwoPhaseProv::ExtractNotificationListSeqNumbers(CFDataRef *a1, const void ***a2)
{
  const __CFAllocator *v4;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v12;
  CFDataRef v13;
  CFDataRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  CFDataRef v19;
  unint64_t v20[2];
  unint64_t v21[2];
  CFDataRef theData;
  unint64_t v23;
  const UInt8 *v24[2];
  unint64_t v25[2];
  CFDataRef v26;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v4, Length, *a1);
  v21[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v21[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v21, v25))
    goto LABEL_2;
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000028)
  {
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret && TAG_LN == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v24, v25))
    goto LABEL_2;
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret && TAG_NML == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v24, v25))
  {
LABEL_2:
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret";
  }
  else
  {
    while (1)
    {
      v12 = DERDecodeSeqNext(v25, &v23);
      if (v12)
        break;
      v19 = 0;
      if (v23 != 0xA00000000000002FLL)
      {
        gBBULogMaskGet();
        v18 = "TAG_NM == dec.tag";
LABEL_28:
        _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)v18);
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v19);
        goto LABEL_4;
      }
      if (DERDecodeSeqContentInit((unint64_t *)v24, v20))
      {
        gBBULogMaskGet();
        v18 = "DR_Success == der_ret";
        goto LABEL_28;
      }
      if (DERDecodeSeqNext(v20, &v23) || v23 != 0x8000000000000000)
      {
        gBBULogMaskGet();
        v18 = "DR_Success == der_ret && TAG_SEQN == dec.tag";
        goto LABEL_28;
      }
      v13 = CFDataCreate(v4, v24[0], (CFIndex)v24[1]);
      v14 = v19;
      v19 = v13;
      v26 = v14;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v26);
      std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](a2, (const void **)&v19);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v19);
    }
    if (v12 == 1)
    {
      v10 = 0;
      goto LABEL_5;
    }
    gBBULogMaskGet();
    v9 = "DR_EndOfSequence == der_ret";
  }
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
LABEL_4:
  v10 = 27;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v10;
}

void sub_24BA10E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  const void *v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, const void *);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](const void ***a1, const void **a2)
{
  uint64_t v4;
  const void **v5;
  const void **v6;
  unint64_t v7;
  uint64_t result;
  const void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  const void **v15;
  const void **v16;
  const void **v17;
  const void **v18;
  const void **v19;
  const void *v20;
  int64x2_t v21;
  const void **v22;
  uint64_t v23;
  int64x2_t v24;
  const void **v25;
  uint64_t v26;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    v10 = (uint64_t)(v7 - (_QWORD)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v11 = (char *)v5 - (char *)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v26 = v4;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v4, v13);
    else
      v14 = 0;
    v15 = (const void **)&v14[8 * v10];
    v16 = (const void **)&v14[8 * v13];
    v25 = v16;
    v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(v15, a2);
    v9 = v17 + 1;
    v24.i64[1] = (uint64_t)(v17 + 1);
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        *--v17 = 0;
        v20 = *--v18;
        *v17 = v20;
        *v18 = 0;
      }
      while (v18 != v19);
      v21 = *(int64x2_t *)a1;
      v9 = (const void **)v24.i64[1];
      v16 = v25;
    }
    *a1 = v17;
    a1[1] = v9;
    v24 = v21;
    v22 = a1[2];
    a1[2] = v16;
    v25 = v22;
    v23 = v21.i64[0];
    result = std::__split_buffer<ctu::cf::CFSharedRef<__CFData const>>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    result = (uint64_t)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(*(const void ***)(v4 - 8), a2);
    v9 = (const void **)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

uint64_t eUICC::TwoPhaseProv::ExtractProfileInfo(CFDataRef *a1, uint64_t **a2)
{
  const __CFAllocator *v4;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  CFDataRef v17;
  CFDataRef v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  __int128 v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  CFDataRef v27;
  const void *v28;
  const UInt8 *v29[2];
  char *v30;
  int v31[2];
  size_t __sz;
  _QWORD **v33;
  _QWORD *v34[2];
  int v35;
  unint64_t v36;
  unint64_t v37[2];
  __CFData *MutableCopy;
  unint64_t v39;
  unint64_t v40[2];
  unint64_t v41[3];

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  MutableCopy = CFDataCreateMutableCopy(v4, Length, *a1);
  v37[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v37[1] = CFDataGetLength(MutableCopy);
  if (!DERDecodeSeqContentInit(v37, v41))
  {
    if (DERDecodeSeqNext(v41, &v39) || v39 != 0xA00000000000002DLL)
    {
      gBBULogMaskGet();
      v9 = "DR_Success == der_ret && TAG_PILR == dec.tag";
      goto LABEL_3;
    }
    if (!DERDecodeSeqContentInit(v40, v41))
    {
      if (DERDecodeSeqNext(v41, &v39) || v39 != 0xA000000000000000)
      {
        gBBULogMaskGet();
        v9 = "DR_Success == der_ret && TAG_PILR_OK == dec.tag";
        goto LABEL_3;
      }
      if (!DERDecodeSeqContentInit(v40, v41))
      {
        v10 = 0;
        v22 = (const void *)*MEMORY[0x24BDBD270];
        v21 = (const void *)*MEMORY[0x24BDBD268];
        while (1)
        {
          if (DERDecodeSeqNext(v41, &v39) == 1)
            goto LABEL_4;
          v35 = 0;
          v34[0] = 0;
          v34[1] = 0;
          v33 = v34;
          v27 = 0;
          v28 = 0;
          __p[0] = 0;
          __p[1] = 0;
          v26 = 0;
          if (!DERDecodeSeqContentInit(v40, &v36))
          {
            if (v39 != 0xE000000000000003)
            {
              gBBULogMaskGet();
              v15 = "DR_Success == der_ret && TAG_PI == dec.tag";
              goto LABEL_19;
            }
            if (!DERParseSequenceContent(v40, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInfoSpec, (unint64_t)v29, 0x30uLL))
            {
              v16 = 3;
              if (!*(_QWORD *)v31 || !__sz)
                goto LABEL_20;
              v23 = 0uLL;
              v24 = 0;
              std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v23, *(const void **)v31, *(_QWORD *)v31 + __sz, __sz);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
              *(_OWORD *)__p = v23;
              v26 = v24;
              v17 = CFDataCreate(v4, v29[0], (CFIndex)v29[1]);
              v18 = v27;
              v27 = v17;
              *(_QWORD *)&v23 = v18;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v23);
              if (!DERParseInteger(&v30, &v35))
              {
                v19 = v22;
                if (v35 != 1)
                  v19 = v21;
                v20 = v28;
                v28 = v19;
                *(_QWORD *)&v23 = v20;
                ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v23);
                std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__emplace_unique_key_args<std::vector<unsigned char>,std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>(a2, (unsigned __int8 **)__p, (uint64_t)__p, (const void **)&v27);
                v16 = 0;
                goto LABEL_20;
              }
            }
          }
          gBBULogMaskGet();
          v15 = "DR_Success == der_ret";
LABEL_19:
          _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)v15);
          v10 = 27;
          v16 = 2;
LABEL_20:
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(&v28);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v27);
          std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&v33, v34[0]);
          if (v16 && v16 != 3)
            goto LABEL_4;
        }
      }
    }
  }
  gBBULogMaskGet();
  v9 = "DR_Success == der_ret";
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  v10 = 27;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_24BA11328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,const void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,_QWORD *a33)
{
  const void **v33;
  uint64_t v34;

  if (__p)
    operator delete(__p);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(v33);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a24);
  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&a32, a33);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v34 - 136));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDeleteResult(CFDataRef *a1, BOOL *a2)
{
  return eUICC::TwoPhaseProv::ExtractResult(a1, a2, 0xA000000000000033);
}

uint64_t eUICC::TwoPhaseProv::ExtractResult(CFDataRef *a1, BOOL *a2, uint64_t a3)
{
  const __CFAllocator *v6;
  CFIndex Length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v14[2];
  CFDataRef theData;
  int v16;
  unint64_t v17;
  char *v18[2];
  unint64_t v19[2];

  v16 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v6, Length, *a1);
  v14[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v14[1] = CFDataGetLength(theData);
  *a2 = 0;
  if (!DERDecodeSeqContentInit(v14, v19))
  {
    if (DERDecodeSeqNext(v19, &v17) || v17 != a3)
    {
      gBBULogMaskGet();
      v11 = "DR_Success == der_ret && top_level_tag == dec.tag";
      goto LABEL_3;
    }
    if (!DERDecodeSeqContentInit((unint64_t *)v18, v19))
    {
      if (DERDecodeSeqNext(v19, &v17) || v17 != 0x8000000000000000)
      {
        gBBULogMaskGet();
        v11 = "DR_Success == der_ret && TAG_DP_RESULT == dec.tag";
        goto LABEL_3;
      }
      if (!DERParseInteger(v18, &v16))
      {
        v12 = 0;
        *a2 = v16 == 0;
        goto LABEL_4;
      }
    }
  }
  gBBULogMaskGet();
  v11 = "DR_Success == der_ret";
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
  v12 = 27;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v12;
}

void sub_24BA11518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDisableResult(CFDataRef *a1, BOOL *a2)
{
  return eUICC::TwoPhaseProv::ExtractResult(a1, a2, 0xA000000000000032);
}

uint64_t eUICC::TwoPhaseProv::SerializeDictIntoPlistData(const void **a1)
{
  const __CFAllocator *v2;
  const void *v3;
  CFDataRef Data;
  CFDataRef v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  CFErrorRef *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  const void *v24;
  void *__p[2];
  char v26;
  const void *v27;
  CFErrorRef error[2];
  char v29;
  CFDataRef v30;
  const void *v31;

  v31 = 0;
  v30 = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = *a1;
  error[0] = 0;
  error[1] = (CFErrorRef)&v31;
  Data = CFPropertyListCreateData(v2, v3, kCFPropertyListXMLFormat_v1_0, 0, error);
  v5 = v30;
  v30 = Data;
  __p[0] = v5;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  v6 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v30)
    v6 = 0;
  if (!v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"outData");
    gBBULogMaskGet();
    v11 = *a1;
    v27 = v11;
    if (v11)
      CFRetain(v11);
    v12 = error;
    CFOBJ_STR(&v27, error);
    if (v29 < 0)
      LOBYTE(v12) = error[0];
    v24 = v31;
    if (v31)
      CFRetain(v31);
    CFOBJ_STR(&v24, __p);
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to serialize dictionary %s error %s\n", v13, v14, v15, (char)v12);
    if (v26 < 0)
      operator delete(__p[0]);
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v24);
    if (v29 < 0)
      operator delete(error[0]);
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v27);
    goto LABEL_18;
  }
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to assign output data\n", v19, v20, v21, v23);
LABEL_18:
    v7 = 10;
    goto LABEL_19;
  }
  v7 = 0;
LABEL_19:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v30);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v31);
  return v7;
}

void sub_24BA11758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, const void *a20)
{
  uint64_t v20;

  if (a19 < 0)
    operator delete(__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a13);
  if (*(char *)(v20 - 33) < 0)
    operator delete(*(void **)(v20 - 56));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a20);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 32));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v20 - 24));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::CreateDictionaryFromPlistData(const __CFData **a1, __CFError **a2)
{
  const __CFData *v3;
  uint64_t (*v4)(uint64_t);
  const __CFAllocator *v6;
  CFPropertyListRef v7;
  void *v8;
  uint64_t (*v9)(uint64_t);
  CFTypeID v10;
  const void **v11;
  __CFError *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFErrorRef *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const void **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFErrorRef *v34;
  char v36;
  const void *v37;
  const void *v38;
  void *__p[2];
  char v40;
  const __CFData *v41;
  CFErrorRef error[2];
  char v43;
  void *v44;
  const void *v45;

  v44 = 0;
  v45 = 0;
  v3 = *a1;
  v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!*a1)
    v4 = 0;
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v14, v15, v16, (char)"inData");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to create data\n", v17, v18, v19, v36);
LABEL_30:
    v13 = 10;
    goto LABEL_31;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  error[0] = 0;
  error[1] = (CFErrorRef)&v45;
  v7 = CFPropertyListCreateWithData(v6, v3, 0, 0, error);
  v8 = v44;
  v44 = (void *)v7;
  __p[0] = v8;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  v9 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!v44)
    v9 = 0;
  if (!v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"outPlist");
    gBBULogMaskGet();
    v41 = *a1;
    if (v41)
      CFRetain(v41);
    v23 = error;
    CFOBJ_STR(&v41, error);
    if (v43 < 0)
      LOBYTE(v23) = error[0];
    v38 = v45;
    if (v45)
      CFRetain(v45);
    CFOBJ_STR(&v38, __p);
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Failed to deserialize dictionary %s error %s\n", v24, v25, v26, (char)v23);
    if (v40 < 0)
      operator delete(__p[0]);
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v38);
    if (v43 < 0)
      operator delete(error[0]);
    v27 = (const void **)&v41;
    goto LABEL_29;
  }
  v10 = CFGetTypeID(v44);
  if (v10 != CFDictionaryGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"CFGetTypeID(outPlist.get()) == CFDictionaryGetTypeID()");
    gBBULogMaskGet();
    v37 = v44;
    if (v44)
      CFRetain(v44);
    CFOBJ_STR(&v37, error);
    if (v43 >= 0)
      v34 = error;
    else
      LOBYTE(v34) = error[0];
    _BBULog(22, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Deserialized plist data is not a dictionary: %s\n", v31, v32, v33, (char)v34);
    if (v43 < 0)
      operator delete(error[0]);
    v27 = &v37;
LABEL_29:
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v27);
    goto LABEL_30;
  }
  __p[0] = v44;
  v11 = (const void **)ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(error, (CFTypeRef *)__p);
  v12 = *a2;
  *a2 = error[0];
  error[0] = v12;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v11);
  v13 = 0;
LABEL_31:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v44);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v45);
  return v13;
}

void sub_24BA11AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, const void *a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  if (*(char *)(v23 - 33) < 0)
    operator delete(*(void **)(v23 - 56));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a14);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v23 - 32));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v23 - 24));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t eUICC::TwoPhaseProv::IsNotificationForTwoPhase(CFDataRef *a1, const void **a2)
{
  const __CFAllocator *v4;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t v12;
  UInt8 *MutableBytePtr;
  const UInt8 *BytePtr;
  CFIndex v15;
  CFDataRef v16;
  const void *v17;
  uint64_t (*v18)(uint64_t);
  _BYTE v19[24];
  uint64_t v20;
  unint64_t v21[2];
  CFDataRef theData;
  unint64_t v23;
  unint64_t v24[2];
  unint64_t v25[2];
  const void *v26;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v4, Length, *a1);
  v21[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v21[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v21, v25))
    goto LABEL_2;
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA00000000000002BLL)
  {
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret && TAG_RNLR == dec.tag";
    goto LABEL_4;
  }
  if (DERDecodeSeqContentInit(v24, v25))
    goto LABEL_2;
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret && TAG_RNLR_NL == dec.tag";
    goto LABEL_4;
  }
  v12 = v24[0];
  MutableBytePtr = CFDataGetMutableBytePtr(theData);
  if (DERDecodeSeqContentInit(v24, v25))
  {
LABEL_2:
    gBBULogMaskGet();
LABEL_3:
    v9 = "DR_Success == der_ret";
    goto LABEL_4;
  }
  if (DERDecodeSeqNext(v25, &v23) || v23 != 0xA000000000000037)
  {
    gBBULogMaskGet();
    v9 = "DR_Success == der_ret && TAG_PIR == dec.tag";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(v24, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultSpec, (unint64_t)v19, 0x20uLL))
  {
    gBBULogMaskGet();
    goto LABEL_3;
  }
  if (!v20)
  {
    v10 = 0;
    goto LABEL_5;
  }
  BytePtr = CFDataGetBytePtr(*a1);
  v15 = CFDataGetLength(*a1);
  v16 = CFDataCreate(v4, &BytePtr[v12 - (_QWORD)MutableBytePtr], v15 - (v12 - (_QWORD)MutableBytePtr));
  v17 = *a2;
  *a2 = v16;
  v26 = v17;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  if (*a2)
    v18 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v18 = 0;
  if (v18)
  {
    v10 = 1;
    goto LABEL_5;
  }
  gBBULogMaskGet();
  v9 = "ntf";
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  v10 = 0;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v10;
}

void sub_24BA11DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL eUICC::TwoPhaseProv::IsProvTxIdAvailable(CFDataRef *a1)
{
  const __CFAllocator *v2;
  CFIndex Length;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _BOOL8 v8;
  int v10;
  unint64_t v12[2];
  CFDataRef theData;
  unint64_t v14;
  unint64_t v15[2];
  unint64_t v16[2];

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v2, Length, *a1);
  v12[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v12[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v12, v16))
  {
    gBBULogMaskGet();
    v7 = "DR_Success == DERDecodeSeqContentInit(&gps_der, &seq)";
LABEL_9:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)v7);
    v8 = 0;
    goto LABEL_10;
  }
  if (DERDecodeSeqNext(v16, &v14))
  {
LABEL_4:
    gBBULogMaskGet();
    v7 = "DR_Success == DERDecodeSeqNext(&seq, &dec)";
    goto LABEL_9;
  }
  if (v14 != 0xE00000000000002DLL)
  {
    gBBULogMaskGet();
    v7 = "TAG_GPS == dec.tag";
    goto LABEL_9;
  }
  if (DERDecodeSeqContentInit(v15, v16))
    goto LABEL_7;
  if (DERDecodeSeqNext(v16, &v14))
    goto LABEL_4;
  if (v14 != 0xA000000000000000)
  {
    gBBULogMaskGet();
    v7 = "TAG_GPS_PS == dec.tag";
    goto LABEL_9;
  }
  if (DERDecodeSeqContentInit(v15, v16))
  {
LABEL_7:
    gBBULogMaskGet();
    v7 = "DR_Success == DERDecodeSeqContentInit(&dec.content, &seq)";
    goto LABEL_9;
  }
  do
  {
    v10 = DERDecodeSeqNext(v16, &v14);
    v8 = v10 != 1;
    if (v10 == 1)
      break;
  }
  while (v14 != 0xA000000000000003 || v15[1] == 0);
LABEL_10:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v8;
}

void sub_24BA11FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ComposeNsr(CFDataRef *a1, const void **a2)
{
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  const UInt8 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  _QWORD v20[2];
  const void *v21[2];

  v21[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v4 = CFDataGetLength(*a1) + 7;
  v5 = MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v18 - ((v5 + 22) & 0xFFFFFFFFFFFFFFF0);
  v7 = v5 + 14;
  v8 = (const UInt8 *)&v18 - ((MEMORY[0x24BDAC7A8]() + 29) & 0xFFFFFFFFFFFFFFF0);
  v19 = v4;
  v20[1] = CFDataGetLength(*a1);
  v20[0] = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000000, (unint64_t)v20, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSearchCriteriaSpec, (unint64_t)v6, v4, (unint64_t *)&v19)|| (v19 = v7, DEREncodeSequenceFromObject(0xA000000000000030, (unint64_t)v20, 0x10uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::notificationSentSpec, (unint64_t)v8, v7, (unint64_t *)&v19)))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v19);
    v14 = *a2;
    *a2 = v13;
    v21[0] = v14;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v21);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"nsr_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeDisableReq(CFDataRef *a1, const void **a2)
{
  unint64_t v4;
  const UInt8 *v5;
  const UInt8 *BytePtr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDataRef v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  char v17;
  _QWORD v18[4];
  const void *v19[2];

  v19[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v17 = 0;
  v4 = CFDataGetLength(*a1) + 22;
  v5 = (const UInt8 *)&v16 - ((MEMORY[0x24BDAC7A8]() + 37) & 0xFFFFFFFFFFFFFFF0);
  v16 = v4;
  v18[1] = CFDataGetLength(*a1);
  BytePtr = CFDataGetBytePtr(*a1);
  v18[3] = 1;
  v18[0] = BytePtr;
  v18[2] = &v17;
  if (DEREncodeSequenceFromObject(0xA000000000000032, (unint64_t)v18, 0x20uLL, 2u, (uint64_t)&eUICC::TwoPhaseProv::profileOperationSpec, (unint64_t)v5, v4, (unint64_t *)&v16))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v16);
    v12 = *a2;
    *a2 = v11;
    v19[0] = v12;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v19);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"disable_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeDeleteReq(CFDataRef *a1, const void **a2)
{
  unint64_t v4;
  const UInt8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFDataRef v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  _QWORD v17[4];
  const void *v18[2];

  v18[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v4 = CFDataGetLength(*a1) + 14;
  v5 = (const UInt8 *)&v15 - ((MEMORY[0x24BDAC7A8]() + 29) & 0xFFFFFFFFFFFFFFF0);
  v16 = v4;
  v17[1] = CFDataGetLength(*a1);
  v17[0] = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000033, (unint64_t)v17, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::deleteProfileSpec, (unint64_t)v5, v4, (unint64_t *)&v16))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v16);
    v11 = *a2;
    *a2 = v10;
    v18[0] = v11;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v18);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"delete_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::ComposeRnl(CFDataRef *a1, const void **a2)
{
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  const UInt8 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  char *v20;
  CFIndex v21;
  const UInt8 *BytePtr;
  CFIndex Length;
  const void *v24[2];

  v24[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v4 = CFDataGetLength(*a1) + 7;
  v5 = MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v18 - ((v5 + 22) & 0xFFFFFFFFFFFFFFF0);
  v7 = v5 + 14;
  v8 = (const UInt8 *)&v18 - ((MEMORY[0x24BDAC7A8]() + 29) & 0xFFFFFFFFFFFFFFF0);
  v20 = v6;
  v21 = 0;
  v19 = v4;
  Length = CFDataGetLength(*a1);
  BytePtr = CFDataGetBytePtr(*a1);
  if (DEREncodeSequenceFromObject(0xA000000000000000, (unint64_t)&v20, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSeqNumSpec, (unint64_t)v6, v4, (unint64_t *)&v19)|| (v21 = v19, v19 = v7, DEREncodeSequenceFromObject(0xA00000000000002BLL, (unint64_t)&v20, 0x20uLL, 1u, (uint64_t)&eUICC::TwoPhaseProv::retrieveNtfListSearchCriteriaSpec, (unint64_t)v8, v7, (unint64_t *)&v19)))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == enc_ret");
    return 10;
  }
  else
  {
    v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v19);
    v14 = *a2;
    *a2 = v13;
    v24[0] = v14;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v24);
    if (*a2)
    {
      return 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"rnl_req.get()");
      return 17;
    }
  }
}

uint64_t eUICC::TwoPhaseProv::GetNextBppSegment(_DWORD *a1, CFDataRef *a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t **v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t **v18;
  uint64_t **v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t **v22;
  uint64_t *v23[3];
  unint64_t v24[2];
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28[2];
  _DWORD *__dst[36];

  __dst[35] = *(_DWORD **)MEMORY[0x24BDAC8D0];
  v24[0] = (unint64_t)&CFDataGetBytePtr(*a2)[*a3];
  v24[1] = CFDataGetLength(*a2) - *a3;
  *a4 = 0;
  memcpy(__dst, &unk_24BA29EC8, 0x118uLL);
  std::map<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>::map[abi:ne180100]((uint64_t)v23, (int *)__dst, 7);
  if (!DERDecodeSeqContentInit(v24, v28))
  {
    if (DERDecodeSeqNext(v28, (unint64_t *)&v25))
    {
LABEL_4:
      gBBULogMaskGet();
      v11 = "DR_Success == DERDecodeSeqNext(&seq, &decoded)";
      goto LABEL_5;
    }
    __dst[0] = a1;
    if (!*((_BYTE *)std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst)+ 40))
    {
      __dst[0] = a1;
      v14 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
      if (v14[6] != v25)
      {
        gBBULogMaskGet();
        v11 = "tag_props[seg].optional || tag_props[seg].topLevelTag == decoded.tag";
        goto LABEL_5;
      }
    }
    if (*a1 > 6u)
      goto LABEL_20;
    v15 = 1 << *a1;
    if ((v15 & 0x13) != 0)
    {
      __dst[0] = a1;
      v19 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
      if (v19[6] == v25)
      {
        if (DERDecodeSeqContentInit(&v26, v28))
        {
          gBBULogMaskGet();
          v11 = "DR_Success == DERDecodeSeqContentInit(&decoded.content, &seq)";
          goto LABEL_5;
        }
        if (DERDecodeSeqNext(v28, (unint64_t *)&v25))
          goto LABEL_4;
        __dst[0] = a1;
        if (!*((_BYTE *)std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst)+ 40))
        {
          __dst[0] = a1;
          v22 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
          if (v22[7] != v25)
          {
            gBBULogMaskGet();
            v11 = "tag_props[seg].optional || (tag_props[seg].innerTag == decoded.tag)";
            goto LABEL_5;
          }
        }
        *a4 = v26 + v27 - v24[0];
      }
    }
    else
    {
      if ((v15 & 0x24) != 0)
      {
        v16 = v27;
        v17 = v26 - v24[0];
        *a4 = v26 - v24[0];
        eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end = v17 + *a3 + v16;
        __dst[0] = a1;
        v18 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
LABEL_26:
        v12 = 0;
        *a1 = *((_DWORD *)v18 + 16);
        goto LABEL_6;
      }
      v20 = v26 + v27 - v24[0];
      *a4 = v20;
      v21 = *a3 + v20;
      if (v21 > eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end)
      {
        gBBULogMaskGet();
        v11 = "offset + length <= offset_seq_end";
        goto LABEL_5;
      }
      if (v21 != eUICC::TwoPhaseProv::GetNextBppSegment(eUICC::TwoPhaseProv::eBppSegment &,ctu::cf::CFSharedRef<__CFData const> &,unsigned long &,unsigned long &)::offset_seq_end)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_6;
      }
    }
    __dst[0] = a1;
    v18 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(v23, a1, (uint64_t)&std::piecewise_construct, __dst);
    goto LABEL_26;
  }
  gBBULogMaskGet();
  v11 = "DR_Success == DERDecodeSeqContentInit(&content, &seq)";
LABEL_5:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
  v12 = 27;
LABEL_6:
  std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy((uint64_t)v23, v23[1]);
  return v12;
}

void sub_24BA12BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::StringifyDataBuffer(uint64_t *a1, int a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;
  _QWORD v11[10];
  char v12;
  uint64_t v13;
  char v14[9];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  v4 = *a1;
  if (a1[1] != *a1)
  {
    v5 = 0;
    do
    {
      if (a2)
      {
        *(_DWORD *)((char *)v11 + *(_QWORD *)(v10 - 24)) = *(_DWORD *)((_BYTE *)v11 + *(_QWORD *)(v10 - 24)) & 0xFFFFFFB5 | 8;
        v14[0] = 48;
        v6 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v10, v14);
        *(_QWORD *)((char *)v6 + *(_QWORD *)(*v6 - 24) + 24) = 2;
        std::ostream::operator<<();
      }
      else
      {
        v14[0] = *(_BYTE *)(v4 + v5);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v14, 1);
      }
      ++v5;
      v4 = *a1;
    }
    while (a1[1] - *a1 > v5);
  }
  std::stringbuf::str();
  v9[0] = *MEMORY[0x24BEDB7F0];
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v9 + *(_QWORD *)(v9[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v10 = v7;
  v11[0] = MEMORY[0x24BEDB848] + 16;
  if (v12 < 0)
    operator delete((void *)v11[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2C164](&v13);
}

void sub_24BA12D70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::LogOversizedPlain(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = result;
  v2 = *(unsigned __int8 *)(result + 23);
  if (*(char *)(result + 23) < 0)
  {
    if (!*(_QWORD *)(result + 8))
      return result;
  }
  else if (!*(_BYTE *)(result + 23))
  {
    return result;
  }
  v3 = 0;
  if ((v2 & 0x80) == 0)
    goto LABEL_7;
LABEL_6:
  v2 = *(_QWORD *)(v1 + 8);
LABEL_7:
  while (v2 > v3)
  {
    gBBULogMaskGet();
    LOBYTE(v10) = v1;
    if (*(char *)(v1 + 23) < 0)
      v10 = *(_QWORD *)v1;
    result = _BBULogPlain(0, "%s\n", v4, v5, v6, v7, v8, v9, v10 + v3);
    v3 += 1023;
    v2 = *(unsigned __int8 *)(v1 + 23);
    if ((v2 & 0x80) != 0)
      goto LABEL_6;
  }
  return result;
}

uint64_t eUICC::TwoPhaseProv::IsNotificationSentRspSuccess(CFDataRef *a1)
{
  const __CFAllocator *v2;
  CFIndex Length;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v10[2];
  CFDataRef theData;
  int v12;
  unint64_t v13;
  char *v14[2];
  unint64_t v15[2];

  v12 = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v2, Length, *a1);
  v10[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v10[1] = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit(v10, v15))
    goto LABEL_2;
  if (DERDecodeSeqNext(v15, &v13) || v13 != 0xA000000000000030)
  {
    gBBULogMaskGet();
    v7 = "DR_Success == der_ret && TAG_NS == dec.tag";
    goto LABEL_3;
  }
  if (DERDecodeSeqContentInit((unint64_t *)v14, v15) || DERDecodeSeqNext(v15, &v13))
    goto LABEL_2;
  if (v13 != 0x8000000000000000)
  {
    gBBULogMaskGet();
    v7 = "TAG_SEQN == dec.tag";
    goto LABEL_3;
  }
  if (DERParseInteger(v14, &v12))
  {
LABEL_2:
    gBBULogMaskGet();
    v7 = "DR_Success == der_ret";
  }
  else
  {
    if (!v12)
    {
      v8 = 1;
      goto LABEL_4;
    }
    gBBULogMaskGet();
    v7 = "DELETE_NOTIFICATION_STATUS_OK == del_status";
  }
LABEL_3:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)v7);
  v8 = 0;
LABEL_4:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v8;
}

void sub_24BA12FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::ExtractDataFromPbiRsp(CFDataRef *a1, const void **a2, const void **a3)
{
  const __CFAllocator *v6;
  CFIndex Length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFDataRef v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  CFNumberRef v23;
  const void *v24;
  int valuePtr;
  int v26;
  unint64_t v27[2];
  CFDataRef theData;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  const UInt8 *v32[2];
  unint64_t v33[2];
  const void *v34;

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a1);
  theData = CFDataCreateMutableCopy(v6, Length, *a1);
  v27[0] = (unint64_t)CFDataGetMutableBytePtr(theData);
  v27[1] = CFDataGetLength(theData);
  if (a2 && a3)
  {
    if (DERDecodeSeqContentInit(v27, v33))
    {
      gBBULogMaskGet();
      v11 = "DR_Success == DERDecodeSeqContentInit(&pbi_der, &seq)";
    }
    else if (DERDecodeSeqNext(v33, &v31))
    {
      gBBULogMaskGet();
      v11 = "DR_Success == DERDecodeSeqNext(&seq, &dec)";
    }
    else if (v31 == 0xE00000000000002ELL)
    {
      if (DERDecodeSeqContentInit((unint64_t *)v32, v33))
      {
        gBBULogMaskGet();
        v11 = "DR_Success == DERDecodeSeqContentInit(&dec.content, &seq)";
      }
      else
      {
        if (!DERDecodeSeqNext(v33, &v29))
        {
          if (v29 != 0x2000000000000010)
          {
            if (v29 == 2)
            {
              v26 = 0;
              if (DERParseInteger(&v30, &v26))
              {
                gBBULogMaskGet();
                _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"DR_Success == DERParseInteger(&dec_nested.content, &err_val)");
                goto LABEL_13;
              }
              v22 = -127 - v26;
              if ((v26 - 1) >= 5)
                v22 = -254;
              valuePtr = v22;
              v23 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
              v24 = *a3;
              *a3 = v23;
              v34 = v24;
              ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v34);
            }
            else
            {
              if (v29 != 0xA000000000000037)
                goto LABEL_13;
              v17 = CFDataCreate(v6, v32[0], (CFIndex)v32[1]);
              v18 = *a2;
              *a2 = v17;
              v34 = v18;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
            }
          }
          v15 = 0;
          goto LABEL_14;
        }
        gBBULogMaskGet();
        v11 = "DR_Success == DERDecodeSeqNext(&seq, &dec_nested)";
      }
    }
    else
    {
      gBBULogMaskGet();
      v11 = "TAG_PBI == dec.tag";
    }
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)v11);
LABEL_13:
    v15 = 27;
    goto LABEL_14;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvUtil", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"(nullptr != pir) && (nullptr != err)");
  v15 = 10;
LABEL_14:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  return v15;
}

void sub_24BA13284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL eUICC::TwoPhaseProv::LdrVerSupportsTwoPhaseInstall(eUICC::TwoPhaseProv *this)
{
  unsigned int v1;
  char *v2;
  _BOOL8 v3;
  uint64_t v4;
  char *v5;

  v1 = this;
  v2 = (char *)operator new(0xAuLL);
  *(_QWORD *)v2 = 0x8710870387028700;
  *((_WORD *)v2 + 4) = -30944;
  if ((v1 & 0x8000) != 0)
  {
    if (v1 >> 8 < 0x87)
    {
      v3 = 0;
    }
    else
    {
      v4 = 0;
      v5 = v2 + 10;
      while (*(unsigned __int16 *)&v2[v4] != v1)
      {
        v4 += 2;
        if (v4 == 10)
          goto LABEL_10;
      }
      v5 = &v2[v4];
LABEL_10:
      v3 = v5 - v2 == 10;
    }
  }
  else
  {
    v3 = v1 > 0x70F;
  }
  operator delete(v2);
  return v3;
}

_QWORD *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
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

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFDictionaryGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(uint64_t a1, unint64_t a2)
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

uint64_t std::__split_buffer<ctu::cf::CFSharedRef<__CFData const>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>(uint64_t a1)
{
  const void **v2;
  void *v3;

  v2 = (const void **)(a1 + 24);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)(a1 + 32));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v2);
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
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

void sub_24BA136D8(_Unwind_Exception *exception_object)
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

uint64_t *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__emplace_unique_key_args<std::vector<unsigned char>,std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>(uint64_t **a1, unsigned __int8 **a2, uint64_t a3, const void **a4)
{
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t *v11[3];
  uint64_t v12;

  v7 = (uint64_t **)std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__find_equal<std::vector<unsigned char>>((uint64_t)a1, &v12, a2);
  v8 = *v7;
  if (!*v7)
  {
    v9 = v7;
    std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__construct_node<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>((uint64_t)a1, a3, a4, (uint64_t)v11);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, v12, v9, v11[0]);
    v8 = v11[0];
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

_QWORD *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__find_equal<std::vector<unsigned char>>(uint64_t a1, _QWORD *a2, unsigned __int8 **a3)
{
  _QWORD *result;
  _QWORD *v4;
  _QWORD *v5;
  unsigned __int8 *v6;
  _QWORD *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;

  v5 = *(_QWORD **)(a1 + 8);
  result = (_QWORD *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = a3[1];
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = (unsigned __int8 *)v4[4];
        v9 = (unsigned __int8 *)v7[5];
        if (v8 != v9)
          break;
LABEL_12:
        if (*a3 != v6)
        {
          v15 = (uint64_t)(*a3 + 1);
          while (v8 != v9)
          {
            v16 = *v8;
            v17 = *(unsigned __int8 *)(v15 - 1);
            if (v16 < v17)
              break;
            ++v8;
            if (v17 < v16 || v15++ == (_QWORD)v6)
              goto LABEL_27;
          }
          result = v7 + 1;
          v4 = (_QWORD *)v7[1];
          if (v4)
            continue;
        }
        goto LABEL_27;
      }
      v10 = v8 + 1;
      v11 = *a3;
      while (v11 != v6)
      {
        v12 = *v11;
        v13 = *(v10 - 1);
        if (v12 < v13)
          break;
        ++v11;
        if (v13 < v12 || v10++ == v9)
          goto LABEL_12;
      }
      v4 = (_QWORD *)*v7;
      result = v7;
    }
    while (*v7);
  }
  else
  {
    v7 = result;
  }
LABEL_27:
  *a2 = v7;
  return result;
}

uint64_t std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__construct_node<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, const void **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  void *v8;
  uint64_t result;

  v7 = a1 + 8;
  v8 = operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>::pair[abi:ne180100]<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&,0>((uint64_t)v8 + 32, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_24BA138AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>::pair[abi:ne180100]<std::vector<unsigned char>&,eUICC::TwoPhaseProv::ProfileProperties&,0>(uint64_t a1, uint64_t a2, const void **a3)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((_QWORD *)a1, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef((const void **)(a1 + 24), a3);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef((const void **)(a1 + 32), a3 + 1);
  return a1;
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::vector<unsigned char> const,eUICC::TwoPhaseProv::ProfileProperties>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(const void **a1)
{
  const void **v2;
  const void *v3;
  const void *v4;
  const void *v6;

  v2 = (const void **)a1[1];
  if (*a1)
  {
    v3 = *v2;
    *v2 = *a1;
    v6 = v3;
  }
  else
  {
    v4 = *v2;
    *v2 = 0;
    v6 = v4;
  }
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v6);
  return a1;
}

uint64_t std::map<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_hint_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::pair<eUICC::TwoPhaseProv::eBppSegment const,eUICC::TwoPhaseProv::BppTagProperties> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_24BA13A4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_hint_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::pair<eUICC::TwoPhaseProv::eBppSegment const,eUICC::TwoPhaseProv::BppTagProperties> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t *v6;
  _OWORD *v7;
  uint64_t **v8;
  __int128 v9;
  uint64_t v11;
  uint64_t *v12;

  v6 = std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__find_equal<eUICC::TwoPhaseProv::eBppSegment>(a1, a2, &v12, &v11, a3);
  v7 = (_OWORD *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x48uLL);
    v9 = *(_OWORD *)(a4 + 16);
    v7[2] = *(_OWORD *)a4;
    v7[3] = v9;
    *((_QWORD *)v7 + 8) = *(_QWORD *)(a4 + 32);
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v12, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__find_equal<eUICC::TwoPhaseProv::eBppSegment>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::__map_value_compare<eUICC::TwoPhaseProv::eBppSegment,std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>,std::less<eUICC::TwoPhaseProv::eBppSegment>,true>,std::allocator<std::__value_type<eUICC::TwoPhaseProv::eBppSegment,eUICC::TwoPhaseProv::BppTagProperties>>>::__emplace_unique_key_args<eUICC::TwoPhaseProv::eBppSegment,std::piecewise_construct_t const&,std::tuple<eUICC::TwoPhaseProv::eBppSegment const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  char *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (char *)operator new(0x48uLL);
    *((_DWORD *)v11 + 8) = **a4;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    std::__tree<std::__value_type<std::string,VinylRefurbAction>,std::__map_value_compare<std::string,std::__value_type<std::string,VinylRefurbAction>,BBUpdaterCommon::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,VinylRefurbAction>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::Perform(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_queue_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t ProvisioningSessions;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  eUICC::TwoPhaseProv *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  const char *v58;
  __int128 v59;
  std::__shared_weak_count *v60;
  unint64_t *p_shared_owners;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL IsProvTxIdAvailable;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int (*v82)(void);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  const void *v102;
  const void **PbiReq;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const void **Bpp;
  const void **v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int IsNotificationSentRspSuccess;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char v124;
  char v125;
  char v126;
  char v127;
  const void *v128;
  const void *v129;
  const void *v130;
  const void *v131;
  const void *v132;
  const void *v133;
  const void *v134;
  const void *v135;
  CFDataRef v136;
  __int16 v137;
  __int128 v138;
  uint64_t v139;
  std::__shared_weak_count *v140;
  const void *v141;
  void *v142;
  const void *v143;
  const void *v144;
  const void *v145;
  void *__p;
  void *v147;
  uint64_t v148;
  __int128 __src[18];
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "TwoPhaseProvImpl::Perform\n", v6, v7, v8, v123);
  *(_QWORD *)(a1 + 376) = a2;
  v9 = dispatch_queue_create("VinylControllerTwoPhaseProvisioning", 0);
  v10 = *(NSObject **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v9;
  if (v10)
    dispatch_release(v10);
  __p = 0;
  v147 = 0;
  v148 = 0;
  v144 = 0;
  v145 = 0;
  v142 = 0;
  v143 = 0;
  v140 = 0;
  v141 = 0;
  v139 = 0;
  v138 = 0uLL;
  v137 = 0;
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)*a3 + 8))(__src);
  memcpy((void *)(a1 + 88), __src, 0x119uLL);
  if (*(_BYTE *)(a1 + 366))
  {
    gBBULogMaskGet();
    v14 = "!getDataRsp.contents.isAbsentOk";
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)v14);
    ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if (*(_DWORD *)(a1 + 88) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v35, v36, v37, (char)"getDataRsp.Valid()");
    ProvisioningSessions = 10;
    goto LABEL_28;
  }
  v28 = (eUICC::TwoPhaseProv *)__rev16(*(unsigned __int16 *)(a1 + 328));
  if (!eUICC::TwoPhaseProv::LdrVerSupportsTwoPhaseInstall(v28))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v39, v40, v41, (char)"LdrVerSupportsTwoPhaseInstall(ldr_ver)");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "ldr ver %04X not eligible, skipping\n", v42, v43, v44, (char)v28);
    ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 92))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v29, v30, v31, (char)"0 == getDataRsp.contents.perso");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "two-phase flow unsupported with perso incomplete\n", v32, v33, v34, v125);
LABEL_26:
    ProvisioningSessions = 29;
    goto LABEL_28;
  }
  v136 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)(a1 + 95), 16);
  eUICC::TwoPhaseProv::SessionData::setEid(a1, &v136);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v136);
  if ((eUICC::TwoPhaseProv::SessionData::isEidEligible((eUICC::TwoPhaseProv::SessionData *)a1, (const Options *)a2) & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v52, v53, v54, (char)"sessionData.isEidEligible( performOptions)");
    gBBULogMaskGet();
    v58 = "EID not eligible, skipping\n";
    goto LABEL_47;
  }
  ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleRefurbishProfileReference(a1, a3);
  if ((_DWORD)ProvisioningSessions)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v49, v50, v51, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  v69 = *(unsigned __int8 *)(a2 + 71);
  if ((v69 & 0x80u) != 0)
    v69 = *(_QWORD *)(a2 + 56);
  if (!v69)
  {
    gBBULogMaskGet();
    v14 = "!performOptions.twoPhaseUrl.empty()";
    goto LABEL_5;
  }
  ReverseProxyGetSettings(a2 + 48, (uint64_t *)&v135);
  v70 = (_QWORD *)(a1 + 72);
  if ((const void **)(a1 + 72) != &v135)
  {
    *(_QWORD *)&__src[0] = *v70;
    *v70 = v135;
    v135 = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__src);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v135);
  ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications((const void **)a1, a3);
  if ((_DWORD)ProvisioningSessions
    || (v71 = eUICC::TwoPhaseProv::ComposeGps((BBUpdaterCommon *)&v145), ProvisioningSessions = v71, (_DWORD)v71)
    || (ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProvisioningSessions(v71, (uint64_t)&v145, &v144, (uint64_t)&v137, a3), (_DWORD)ProvisioningSessions))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v72, v73, v74, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v134, &v144);
  IsProvTxIdAvailable = eUICC::TwoPhaseProv::IsProvTxIdAvailable((CFDataRef *)&v134);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v134);
  if (!IsProvTxIdAvailable)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v79, v80, v81, (char)"IsProvTxIdAvailable( euicc_rsp)");
    ProvisioningSessions = 26;
    goto LABEL_28;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v133, &v144);
  ProvisioningSessions = eUICC::TwoPhaseProv::ConvertGpsToGbpp((uint64_t *)&v133, (const void **)&v142);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v133);
  if ((_DWORD)ProvisioningSessions
    || (ProvisioningSessions = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v142),
        (_DWORD)ProvisioningSessions))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v76, v77, v78, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
  std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&v139, __src);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)__src);
  v82 = *(unsigned int (**)(void))(*(_QWORD *)v139 + 24);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 376) + 72))
  {
    if (v82() != 204)
      goto LABEL_84;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v89, v90, v91, (char)"kHttpStatusNoContent != getbpp_rsp->getHttpResponseCode()");
    gBBULogMaskGet();
    v58 = "no profile returned, skipping\n";
LABEL_47:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v58, v55, v56, v57, v126);
    ProvisioningSessions = 0;
    goto LABEL_6;
  }
  if (v82() == 204)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v83, v84, v85, (char)"kHttpStatusNoContent != getbpp_rsp->getHttpResponseCode()");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "no profile returned with presence check on, failing\n", v86, v87, v88, v127);
LABEL_35:
    ProvisioningSessions = 28;
    goto LABEL_6;
  }
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v139 + 24))(v139) == 200)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v92, v93, v94, (char)"kHttpStatusSuccess != getbpp_rsp->getHttpResponseCode()");
    gBBULogMaskGet();
    v58 = "profile returned with presence check on, returning success\n";
    goto LABEL_47;
  }
LABEL_84:
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v139 + 24))(v139) != 200)
  {
    gBBULogMaskGet();
    v101 = "kHttpStatusSuccess == getbpp_rsp->getHttpResponseCode()";
LABEL_88:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v98, v99, v100, (char)v101);
    goto LABEL_35;
  }
  (*(void (**)(const void **__return_ptr))(*(_QWORD *)v139 + 40))(&v132);
  ProvisioningSessions = eUICC::TwoPhaseProv::CreateDictionaryFromPlistData((const __CFData **)&v132, (__CFError **)&v142);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v132);
  if ((_DWORD)ProvisioningSessions
    || (ProvisioningSessions = eUICC::TwoPhaseProv::SessionData::processAlderResponse(a1, (CFDictionaryRef *)&v142),
        (_DWORD)ProvisioningSessions))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v95, v96, v97, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  eUICC::TwoPhaseProv::SessionData::getPbiReq((const void **)a1, (const void **)__src);
  if (!*(_QWORD *)&__src[0])
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
    goto LABEL_95;
  }
  eUICC::TwoPhaseProv::SessionData::getBpp((const void **)a1, &v135);
  v102 = v135;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v135);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  if (!v102)
  {
LABEL_95:
    gBBULogMaskGet();
    v14 = "kVinylResultSuccess == vinyl_ret && sessionData.getPbiReq().get() && sessionData.getBpp().get()";
    goto LABEL_5;
  }
  PbiReq = eUICC::TwoPhaseProv::SessionData::getPbiReq((const void **)a1, &v131);
  ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::PrepareBPPInstallation((uint64_t)PbiReq, (uint64_t)&v131, &v144, (uint64_t)&v137, a3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v131);
  if ((_DWORD)ProvisioningSessions
    || (ProvisioningSessions = eUICC::TwoPhaseProv::SessionData::extractDataFromPbiRsp(a1, (CFDataRef *)&v144),
        (_DWORD)ProvisioningSessions))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v104, v105, v106, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  Bpp = eUICC::TwoPhaseProv::SessionData::getBpp((const void **)a1, &v130);
  ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::LoadBPP((uint64_t)Bpp, (CFDataRef *)&v130, &v144, (uint64_t)&v137, a3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v130);
  if ((_DWORD)ProvisioningSessions)
    goto LABEL_103;
  ProvisioningSessions = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v144, (const void **)a1, &v142);
  if ((_DWORD)ProvisioningSessions)
    goto LABEL_103;
  ProvisioningSessions = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v142);
  if ((_DWORD)ProvisioningSessions)
    goto LABEL_103;
  eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
  std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&v138, __src);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)__src);
  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)v138 + 24))(v138) != 200)
  {
    gBBULogMaskGet();
    v101 = "kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()";
    goto LABEL_88;
  }
  eUICC::TwoPhaseProv::SessionData::getPirSeqNum((const void **)a1, (const void **)__src);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=(&v143, (const void **)__src);
  v108 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent((uint64_t)v108, (CFDataRef *)&v143, &v144, a3);
  if ((_DWORD)ProvisioningSessions)
  {
LABEL_103:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v109, v110, v111, (char)"kVinylResultSuccess == vinyl_ret");
    goto LABEL_42;
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v129, &v144);
  IsNotificationSentRspSuccess = eUICC::TwoPhaseProv::IsNotificationSentRspSuccess((CFDataRef *)&v129);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v129);
  if ((IsNotificationSentRspSuccess & 1) != 0)
  {
    eUICC::TwoPhaseProv::SessionData::getError((const void **)a1, (const void **)__src);
    v113 = *(_QWORD *)&__src[0];
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__src);
    if (v113)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v114, v115, v116, (char)"nullptr == sessionData.getError().get()");
      eUICC::TwoPhaseProv::SessionData::clearTransientData((eUICC::TwoPhaseProv::SessionData *)a1);
      goto LABEL_26;
    }
    eUICC::TwoPhaseProv::SessionData::clearTransientData((eUICC::TwoPhaseProv::SessionData *)a1);
    ProvisioningSessions = eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications((const void **)a1, a3);
    if (!(_DWORD)ProvisioningSessions)
      goto LABEL_6;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v120, v121, v122, (char)"kVinylResultSuccess == vinyl_ret");
LABEL_42:
    if ((_DWORD)ProvisioningSessions == 28)
      goto LABEL_6;
    goto LABEL_28;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v117, v118, v119, (char)"IsNotificationSentRspSuccess( euicc_rsp)");
  ProvisioningSessions = 27;
LABEL_28:
  eUICC::TwoPhaseProv::SessionData::getEUICCSessionId((const void **)a1, &v135);
  if (v135)
  {
    eUICC::TwoPhaseProv::SessionData::getError((const void **)a1, (const void **)__src);
    if (*(_QWORD *)&__src[0])
    {
      v38 = 1;
    }
    else
    {
      eUICC::TwoPhaseProv::SessionData::getPir((const void **)a1, &v128);
      v38 = v128 != 0;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v128);
    }
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__src);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v135);
    if (v38)
    {
      eUICC::TwoPhaseProv::SessionData::getPir((const void **)a1, &v128);
      v45 = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v128, (const void **)a1, &v142);
      if ((_DWORD)v45 || (v45 = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v142), (_DWORD)v45))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v46, v47, v48, (char)"kVinylResultSuccess == handle_result_ret");
      }
      else
      {
        eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync(a1, (uint64_t *)&__p, __src);
        v59 = __src[0];
        __src[0] = 0uLL;
        v60 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
        v138 = v59;
        if (v60)
        {
          p_shared_owners = (unint64_t *)&v60->__shared_owners_;
          do
            v62 = __ldaxr(p_shared_owners);
          while (__stlxr(v62 - 1, p_shared_owners));
          if (!v62)
          {
            ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
            std::__shared_weak_count::__release_weak(v60);
          }
        }
        v63 = (std::__shared_weak_count *)*((_QWORD *)&__src[0] + 1);
        if (*((_QWORD *)&__src[0] + 1))
        {
          v64 = (unint64_t *)(*((_QWORD *)&__src[0] + 1) + 8);
          do
            v65 = __ldaxr(v64);
          while (__stlxr(v65 - 1, v64));
          if (!v65)
          {
            ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
            std::__shared_weak_count::__release_weak(v63);
          }
        }
        v45 = ProvisioningSessions;
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)v138 + 24))(v138) != 200)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v66, v67, v68, (char)"kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()");
          v45 = 28;
        }
      }
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v128);
      ProvisioningSessions = v45;
    }
  }
  else
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v135);
  }
LABEL_6:
  v16.n128_f64[0] = eUICC::TwoPhaseProv::SessionData::clear((eUICC::TwoPhaseProv::SessionData *)a1);
  if ((_DWORD)ProvisioningSessions && v137 == 28581)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Delaying for 6FA5 handling\n", v17, v18, v19, v124);
    v20 = (_OWORD *)*a3;
    *(_OWORD *)((char *)v20 + 8) = 0u;
    v20 = (_OWORD *)((char *)v20 + 8);
    v20[15] = 0u;
    v20[16] = 0u;
    v20[13] = 0u;
    v20[14] = 0u;
    v20[11] = 0u;
    v20[12] = 0u;
    v20[9] = 0u;
    v20[10] = 0u;
    v20[7] = 0u;
    v20[8] = 0u;
    v20[5] = 0u;
    v20[6] = 0u;
    v20[3] = 0u;
    v20[4] = 0u;
    v20[1] = 0u;
    v20[2] = 0u;
    *(_OWORD *)((char *)v20 + 265) = 0u;
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)*a3 + 8))(__src);
    *(_QWORD *)&__src[0] = 3000000000;
    std::this_thread::sleep_for ((const std::chrono::nanoseconds *)__src);
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
  if (*((_QWORD *)&v138 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v21->__on_zero_shared)(v21, v16);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v140;
  if (v140)
  {
    v25 = (unint64_t *)&v140->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v24->__on_zero_shared)(v24, v16);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v141);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v142);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v143);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v144);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v145);
  if (__p)
  {
    v147 = __p;
    operator delete(__p);
  }
  return ProvisioningSessions;
}

void sub_24BA14D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26,const void *a27,const void *a28,const void *a29,const void *a30,const void *a31,void *__p,uint64_t a33)
{
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&a27);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a28);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a29);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a30);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a31);
  if (__p)
  {
    a33 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleRefurbishProfileReference(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t *v13;
  char v14;
  _BYTE *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  size_t v24;
  char *v25;
  char *v26;
  char v27;
  unint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t ProfilesInfoList;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  CFDataRef *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t Value;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  _QWORD *v56;
  int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *__p;
  char v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const void *v68[2];
  unint64_t v69[2];
  uint64_t *v70;
  _QWORD *v71[2];
  const void *v72;
  char *v73;
  _BYTE *v74;
  char *v75;
  uint64_t v76[3];
  _QWORD v77[10];
  char v78;
  uint64_t v79;
  std::string v80;

  memset(&v80, 0, sizeof(v80));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v76);
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v71[1] = 0;
  v72 = 0;
  v70 = (uint64_t *)v71;
  v71[0] = 0;
  v4 = *(_QWORD *)(a1 + 376);
  v5 = MEMORY[0x24BEDB7F0];
  v6 = MEMORY[0x24BEDB848];
  if (!v4)
    goto LABEL_33;
  if (*(char *)(v4 + 127) < 0)
  {
    if (*(_QWORD *)(v4 + 112))
      goto LABEL_4;
LABEL_33:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v34, v35, v36, (char)"options && !options->twoPhaseRefurbRef.empty()");
    ProfilesInfoList = 0;
    goto LABEL_34;
  }
  if (!*(_BYTE *)(v4 + 127))
    goto LABEL_33;
LABEL_4:
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v58, (const std::string *)(v4 + 104), 24);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=();
  v56 = a2;
  v7 = *(void **)v5;
  v58 = v7;
  v9 = *(void **)(v5 + 64);
  v8 = *(_QWORD *)(v5 + 72);
  *(void **)((char *)&v58 + *((_QWORD *)v7 - 3)) = v9;
  v10 = v6 + 16;
  v60 = v8;
  v61 = v10;
  if (v63 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2C164]();
  v11 = 0;
  v12 = 0;
  while (1)
  {
    *(_QWORD *)((char *)v77 + *(_QWORD *)(v76[0] - 24)) = 2;
    v13 = std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v76, (uint64_t)&v80);
    if ((*((_BYTE *)v13 + *(_QWORD *)(*v13 - 24) + 32) & 5) != 0)
      break;
    v57 = 0;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v58, &v80, 24);
    *(_DWORD *)((char *)&v59 + *((_QWORD *)v58 - 3)) = *(_DWORD *)((_BYTE *)&v59 + *((_QWORD *)v58 - 3)) & 0xFFFFFFB5 | 8;
    MEMORY[0x24BD2BFCC](&v58, &v57);
    v58 = v7;
    *(void **)((char *)&v58 + *((_QWORD *)v7 - 3)) = v9;
    v60 = v8;
    v61 = v10;
    if (v63 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x24BD2C164](&v64);
    v14 = v57;
    if (v11 >= v75)
    {
      v16 = (unint64_t)v73;
      v17 = v11 - v73;
      v18 = v11 - v73 + 1;
      if (v18 < 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v19 = v7;
      v20 = v10;
      v21 = v8;
      v22 = v9;
      v23 = v75 - v73;
      if (2 * (v75 - v73) > (unint64_t)v18)
        v18 = 2 * v23;
      if (v23 >= 0x3FFFFFFFFFFFFFFFLL)
        v24 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v24 = v18;
      if (v24)
        v25 = (char *)operator new(v24);
      else
        v25 = 0;
      v12 = &v25[v17];
      *v12 = v14;
      v15 = v12 + 1;
      if (v11 != (char *)v16)
      {
        v26 = &v11[~v16];
        do
        {
          v27 = *--v11;
          (v26--)[(_QWORD)v25] = v27;
        }
        while (v11 != (char *)v16);
        v11 = v73;
        v12 = v25;
      }
      v73 = v12;
      v74 = v15;
      v75 = &v25[v24];
      if (v11)
        operator delete(v11);
      v9 = v22;
      v8 = v21;
      v10 = v20;
      v7 = v19;
    }
    else
    {
      *v11 = v57;
      v15 = v11 + 1;
    }
    v74 = v15;
    v11 = v15;
  }
  v68[0] = v12;
  v68[1] = (const void *)(v11 - v12);
  v28 = DERDecodeSeqContentInit((unint64_t *)v68, v69);
  v5 = MEMORY[0x24BEDB7F0];
  v6 = MEMORY[0x24BEDB848];
  if ((_DWORD)v28)
  {
    gBBULogMaskGet();
    v32 = "DR_Success == der_ret";
LABEL_31:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v29, v30, v31, (char)v32);
    ProfilesInfoList = 27;
    goto LABEL_34;
  }
  ProfilesInfoList = eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProfilesInfoList((uint64_t)v28, &v72, v56);
  if ((_DWORD)ProfilesInfoList
    || (ProfilesInfoList = eUICC::TwoPhaseProv::ExtractProfileInfo((CFDataRef *)&v72, &v70), (_DWORD)ProfilesInfoList))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v39, v40, v41, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    while (1)
    {
      v42 = DERDecodeSeqNext(v69, &v65);
      if (v42)
        break;
      v59 = 0;
      v60 = 0;
      v58 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v58, v68[0], v66 + v67, v66 + v67 - (unint64_t)v68[0]);
      v43 = (CFDataRef *)std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::find<std::vector<unsigned char>>((uint64_t)&v70, (unsigned __int8 **)&v58);
      if (v71 != (_QWORD **)v43
        && ((gBBULogMaskGet(),
             _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "matched refurb profileReference\n", v44, v45, v46, v55), Value = CFBooleanGetValue(v43[8]), (_DWORD)Value)&& (Value = eUICC::TwoPhaseProv::TwoPhaseProvImpl::DisableProfile(Value, v43 + 7, v56), ProfilesInfoList = Value, (_DWORD)Value)|| (ProfilesInfoList = eUICC::TwoPhaseProv::TwoPhaseProvImpl::DeleteProfile(Value, v43 + 7, v56), (_DWORD)ProfilesInfoList)))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v48, v49, v50, (char)"kVinylResultSuccess == ret");
        v51 = 0;
      }
      else
      {
        v68[0] = (const void *)(v66 + v67);
        if (v66 + v67 <= (unint64_t)v11)
        {
          v51 = 1;
        }
        else
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v52, v53, v54, (char)"der_item.data <= (profile_ref_input.data() + profile_ref_input.size())");
          v51 = 0;
          ProfilesInfoList = 27;
        }
      }
      if (v58)
      {
        v59 = v58;
        operator delete(v58);
      }
      if ((v51 & 1) == 0)
        goto LABEL_34;
    }
    if (v42 != 1)
    {
      gBBULogMaskGet();
      v32 = "der_ret == DR_EndOfSequence";
      goto LABEL_31;
    }
  }
LABEL_34:
  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&v70, v71[0]);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v72);
  if (v73)
    operator delete(v73);
  v76[0] = *(_QWORD *)v5;
  v37 = *(_QWORD *)(v5 + 72);
  *(uint64_t *)((char *)v76 + *(_QWORD *)(v76[0] - 24)) = *(_QWORD *)(v5 + 64);
  v76[2] = v37;
  v77[0] = v6 + 16;
  if (v78 < 0)
    operator delete((void *)v77[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2C164](&v79);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v80.__r_.__value_.__l.__data_);
  return ProfilesInfoList;
}

void sub_24BA15534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _QWORD *a64;
  const void *a66;
  void *a67;
  void *a68;
  char a70;
  uint64_t v70;

  std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::destroy((uint64_t)&a63, a64);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a66);
  if (a67)
  {
    a68 = a67;
    operator delete(a67);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a70);
  if (*(char *)(v70 - 89) < 0)
    operator delete((void *)STACK[0x300]);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::HandleNotifications(const void **a1, _QWORD *a2)
{
  uint64_t NotificationListForSeqNum;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  const void **v16;
  const void **v17;
  const void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  char IsNotificationForTwoPhase;
  __int128 v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int IsNotificationSentRspSuccess;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  __int128 v41;
  const void *v42;
  void *v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  __int128 v48;
  void *__p;
  void *v50;
  uint64_t v51;
  const void **v52;
  const void **v53;
  uint64_t v54;
  const void *v55;
  const void *v56[2];

  v55 = 0;
  v56[0] = 0;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0uLL;
  NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::ListInstallationNotifications((uint64_t)a1, v56, a2);
  if (!(_DWORD)NotificationListForSeqNum)
  {
    v47 = v56[0];
    if (v56[0])
      CFRetain(v56[0]);
    NotificationListForSeqNum = eUICC::TwoPhaseProv::ExtractNotificationListSeqNumbers((CFDataRef *)&v47, &v52);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v47);
    if ((_DWORD)NotificationListForSeqNum)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"kVinylResultSuccess == ret");
      goto LABEL_7;
    }
    v16 = v52;
    v17 = v53;
    if (v52 == v53)
    {
      NotificationListForSeqNum = 0;
      goto LABEL_7;
    }
    while (1)
    {
      v18 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v46, v16);
      v44 = 0;
      v45 = 0;
      v43 = 0;
      NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::RetrieveNotificationListForSeqNum((uint64_t)v18, (CFDataRef *)&v46, v56, a2);
      if ((_DWORD)NotificationListForSeqNum)
        break;
      v42 = v56[0];
      if (v56[0])
        CFRetain(v56[0]);
      IsNotificationForTwoPhase = eUICC::TwoPhaseProv::IsNotificationForTwoPhase((CFDataRef *)&v42, &v45);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v42);
      if ((IsNotificationForTwoPhase & 1) != 0)
      {
        NotificationListForSeqNum = eUICC::TwoPhaseProv::ConvertPirToHir((CFDataRef *)&v45, a1, &v43);
        if ((_DWORD)NotificationListForSeqNum)
          break;
        NotificationListForSeqNum = eUICC::TwoPhaseProv::SerializeDictIntoPlistData((const void **)&v43);
        if ((_DWORD)NotificationListForSeqNum)
          break;
        eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync((uint64_t)a1, (uint64_t *)&__p, &v41);
        v25 = v41;
        v41 = 0uLL;
        v26 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
        v48 = v25;
        if (v26)
        {
          p_shared_owners = (unint64_t *)&v26->__shared_owners_;
          do
            v28 = __ldaxr(p_shared_owners);
          while (__stlxr(v28 - 1, p_shared_owners));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }
        v29 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
        if (*((_QWORD *)&v41 + 1))
        {
          v30 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
        v32 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v48 + 24))(v48);
        if ((_DWORD)v32 == 200)
        {
          NotificationListForSeqNum = eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent(v32, (CFDataRef *)&v46, v56, a2);
          if ((_DWORD)NotificationListForSeqNum)
            break;
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v40, v56);
          IsNotificationSentRspSuccess = eUICC::TwoPhaseProv::IsNotificationSentRspSuccess((CFDataRef *)&v40);
          ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
          if ((IsNotificationSentRspSuccess & 1) != 0)
          {
            NotificationListForSeqNum = 0;
            v23 = 0;
            v22 = 0;
          }
          else
          {
            gBBULogMaskGet();
            _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v37, v38, v39, (char)"IsNotificationSentRspSuccess( euicc_rsp)");
            v22 = 2;
            v23 = 1;
            NotificationListForSeqNum = 27;
          }
        }
        else
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v33, v34, v35, (char)"kHttpStatusSuccess == handlenotification_rsp->getHttpResponseCode()");
          v22 = 2;
          v23 = 1;
          NotificationListForSeqNum = 28;
        }
      }
      else
      {
        NotificationListForSeqNum = 0;
        v23 = 0;
        v22 = 4;
      }
LABEL_19:
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v43);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v44);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v45);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v46);
      if ((v22 | 4) != 4)
      {
        if (!v23)
          goto LABEL_8;
        goto LABEL_7;
      }
      if (++v16 == v17)
        goto LABEL_7;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"kVinylResultSuccess == ret");
    v22 = 2;
    v23 = 1;
    goto LABEL_19;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"kVinylResultSuccess == ret");
LABEL_7:
  v11.n128_f64[0] = eUICC::TwoPhaseProv::SessionData::clearTransientData((eUICC::TwoPhaseProv::SessionData *)a1);
LABEL_8:
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
  if (*((_QWORD *)&v48 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v48 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v12->__on_zero_shared)(v12, v11);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }
  __p = &v52;
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v55);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v56);
  return NotificationListForSeqNum;
}

void sub_24BA15AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, const void *a14, uint64_t a15, uint64_t a16, char a17, int a18, const void *a19, const void *a20,const void *a21,const void *a22,__int16 a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  uint64_t v33;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a14);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a19);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a20);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a21);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a22);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  if (__p)
  {
    a33 = (uint64_t)__p;
    operator delete(__p);
  }
  __p = (void *)(v33 - 128);
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v33 - 104));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v33 - 96));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProvisioningSessions(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, _QWORD *a5)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int v21;
  char v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *__p;
  _BYTE *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const void *v37;
  const void *v38;

  v34 = 0;
  v35 = 0;
  v36 = 0;
  __p = 0;
  v32 = 0;
  v33 = 0;
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"success");
    gBBULogMaskGet();
    v19 = "Failed to assign request data\n";
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v19, v16, v17, v18, v27);
    v9 = 17;
    goto LABEL_6;
  }
  v8 = (*(uint64_t (**)(_QWORD, void **, void **, uint64_t))(*(_QWORD *)*a5 + 32))(*a5, &v34, &__p, a4);
  v9 = VinylControllerMapBBUReturnToVinylResult(v8);
  if ((_DWORD)v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kVinylResultSuccess == ret");
    goto LABEL_6;
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v28, __p, (uint64_t)v32, v32 - (_BYTE *)__p);
  v37 = 0;
  v21 = ctu::cf::convert_copy();
  v22 = v21;
  if (v21)
  {
    v23 = *a3;
    *a3 = v37;
    v38 = v23;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
  }
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  if ((v22 & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"success");
    gBBULogMaskGet();
    v19 = "Failed to assign response data\n";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  return v9;
}

void sub_24BA15D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  uint64_t v18;
  void *v20;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  v20 = *(void **)(v18 - 72);
  if (v20)
  {
    *(_QWORD *)(v18 - 64) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *eUICC::TwoPhaseProv::TwoPhaseProvImpl::PostDataSync@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v20[2];
  char v21;
  void *v22[2];
  uint64_t v23;
  void *__p;
  char v25;
  const void *v26[3];
  _QWORD **v27;
  _QWORD *v28[2];
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  char *v32;

  v6 = (char *)operator new(0xA0uLL);
  *((_QWORD *)v6 + 2) = 0;
  *((_QWORD *)v6 + 3) = 850045863;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_QWORD *)v6 + 10) = 0;
  *((_QWORD *)v6 + 11) = 1018212795;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(_QWORD *)v6 = off_251CCA458;
  *((_QWORD *)v6 + 1) = 0;
  v31 = (unint64_t *)v6;
  v32 = v6;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v6);
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  v26[1] = 0;
  v26[2] = 0;
  ctu::Http::HttpRequest::create();
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v27, v28[0]);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v29 + 8))(v29, *(_QWORD *)(a1 + 64));
  v7 = v29;
  dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>(&v31, (void **)&v27);
  (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v7 + 16))(v7, v27);
  if (v27)
    _Block_release(v27);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v29 + 96))(v29, 60.0);
  v8 = v29;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(v26, (const void **)(a1 + 72));
  (*(void (**)(uint64_t, const void **))(*(_QWORD *)v8 + 88))(v8, v26);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v26);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v29 + 56))(v29, a2);
  eUICC::TwoPhaseProv::StringifyDataBuffer(a2, 0);
  eUICC::TwoPhaseProv::LogOversizedPlain((uint64_t)&__p);
  if (v25 < 0)
    operator delete(__p);
  v22[1] = 0;
  v23 = 0;
  v22[0] = 0;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v29 + 40))(v29, v22);
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get((uint64_t *)&v31, a3);
  gBBULogMaskGet();
  v9 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a3 + 16))(*a3);
  (*(void (**)(_QWORD))(*(_QWORD *)*a3 + 24))(*a3);
  (*(void (**)(_QWORD))(*(_QWORD *)*a3 + 32))(*a3);
  _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "result %d code %d raw_error %ld\n", v10, v11, v12, v9);
  (*(void (**)(void **__return_ptr))(*(_QWORD *)*a3 + 48))(v20);
  eUICC::TwoPhaseProv::LogOversizedPlain((uint64_t)v20);
  if (v21 < 0)
    operator delete(v20[0]);
  v13 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v31;
  if (v31)
  {
    v17 = v31 + 1;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
      (*(void (**)(unint64_t *))(*v16 + 16))(v16);
  }
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v32);
}

void sub_24BA16070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,char a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;
  uint64_t v35;
  unint64_t *v37;
  unint64_t *v38;
  unint64_t v39;

  if (a17 < 0)
    operator delete(__p);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](v34);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](v35 - 64);
  v37 = *(unint64_t **)(v35 - 48);
  if (v37)
  {
    v38 = v37 + 1;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
      (*(void (**)(unint64_t *))(*v37 + 16))(v37);
  }
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(v35 - 40));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::PrepareBPPInstallation(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, _QWORD *a5)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int v21;
  char v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *__p;
  _BYTE *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const void *v37;
  const void *v38;

  v34 = 0;
  v35 = 0;
  v36 = 0;
  __p = 0;
  v32 = 0;
  v33 = 0;
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"success");
    gBBULogMaskGet();
    v19 = "Failed to assign request data\n";
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v19, v16, v17, v18, v27);
    v9 = 17;
    goto LABEL_6;
  }
  v8 = (*(uint64_t (**)(_QWORD, void **, void **, uint64_t))(*(_QWORD *)*a5 + 32))(*a5, &v34, &__p, a4);
  v9 = VinylControllerMapBBUReturnToVinylResult(v8);
  if ((_DWORD)v9)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kVinylResultSuccess == ret");
    goto LABEL_6;
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v28, __p, (uint64_t)v32, v32 - (_BYTE *)__p);
  v37 = 0;
  v21 = ctu::cf::convert_copy();
  v22 = v21;
  if (v21)
  {
    v23 = *a3;
    *a3 = v37;
    v38 = v23;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
  }
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }
  if ((v22 & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"success");
    gBBULogMaskGet();
    v19 = "Failed to assign response data\n";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  return v9;
}

void sub_24BA16354(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  uint64_t v18;
  void *v20;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  v20 = *(void **)(v18 - 72);
  if (v20)
  {
    *(_QWORD *)(v18 - 64) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::LoadBPP(uint64_t a1, CFDataRef *a2, const void **a3, uint64_t a4, _QWORD *a5)
{
  const __CFAllocator *v6;
  const __CFAllocator *v7;
  uint64_t NextBppSegment;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  const UInt8 *BytePtr;
  CFDataRef v15;
  CFDataRef v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  int v25;
  char v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  void *v36;
  void *v37;
  uint64_t v38;
  void *__p;
  _BYTE *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CFDataRef v45;
  CFIndex v46;
  int v47;
  uint64_t v48;
  const void *v49;
  const void *v50[2];

  v48 = 0;
  v47 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
  do
  {
    v46 = 0;
    v44 = 0;
    v45 = 0;
    v42 = 0;
    v43 = 0;
    __p = 0;
    v40 = 0;
    v41 = 0;
    NextBppSegment = eUICC::TwoPhaseProv::GetNextBppSegment(&v47, a2, &v48, (unint64_t *)&v46);
    if ((_DWORD)NextBppSegment)
    {
LABEL_3:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
LABEL_4:
      v12 = 1;
      goto LABEL_5;
    }
    if (!v46)
    {
      NextBppSegment = 0;
      v12 = 0;
      goto LABEL_5;
    }
    BytePtr = CFDataGetBytePtr(*a2);
    v15 = CFDataCreateWithBytesNoCopy(v6, &BytePtr[v48], v46, v7);
    v16 = v45;
    v45 = v15;
    v50[0] = v16;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v50);
    if ((ctu::cf::assign() & 1) == 0)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v18, v19, v20, (char)"success");
      gBBULogMaskGet();
      v24 = "Failed to assign request data\n";
LABEL_20:
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", v24, v21, v22, v23, v32);
      v12 = 1;
      NextBppSegment = 17;
      goto LABEL_5;
    }
    v17 = (*(uint64_t (**)(_QWORD, void **, void **, uint64_t))(*(_QWORD *)*a5 + 32))(*a5, &v42, &__p, a4);
    NextBppSegment = VinylControllerMapBBUReturnToVinylResult(v17);
    if ((_DWORD)NextBppSegment)
      goto LABEL_3;
    if (v40 != __p)
    {
      v36 = 0;
      v37 = 0;
      v38 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v36, __p, (uint64_t)v40, v40 - (_BYTE *)__p);
      v49 = 0;
      v25 = ctu::cf::convert_copy();
      v26 = v25;
      if (v25)
      {
        v27 = *a3;
        *a3 = v49;
        v50[0] = v27;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v50);
      }
      if (v36)
      {
        v37 = v36;
        operator delete(v36);
      }
      if ((v26 & 1) != 0)
      {
        NextBppSegment = 0;
        goto LABEL_4;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"success");
      gBBULogMaskGet();
      v24 = "Failed to assign response data\n";
      goto LABEL_20;
    }
    NextBppSegment = 0;
    v12 = 0;
    v48 += v46;
LABEL_5:
    if (__p)
    {
      v40 = __p;
      operator delete(__p);
    }
    if (v42)
    {
      v43 = v42;
      operator delete(v42);
    }
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v45);
    if (v47 == 7)
      v13 = 1;
    else
      v13 = v12;
  }
  while ((v13 & 1) == 0);
  return NextBppSegment;
}

void sub_24BA16690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,const void *a26)
{
  if (__p)
    operator delete(__p);
  if (a20)
    operator delete(a20);
  if (a23)
    operator delete(a23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a26);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::NotificationSent(uint64_t a1, CFDataRef *a2, const void **a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *__p;
  void *v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int16 v25;
  const void *v26;
  const void *v27;
  const void *v28;

  v26 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v6 = eUICC::TwoPhaseProv::ComposeNsr(a2, &v26);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    v10 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a4 + 32))(*a4, &v22, &v19, &v25);
    v6 = VinylControllerMapBBUReturnToVinylResult(v10);
    if ((_DWORD)v6)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      __p = 0;
      v17 = 0;
      v18 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v19, (uint64_t)v20, v20 - (_BYTE *)v19);
      v27 = 0;
      if (ctu::cf::convert_copy())
      {
        v14 = *a3;
        *a3 = v27;
        v28 = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
      }
      if (__p)
      {
        v17 = __p;
        operator delete(__p);
      }
      v6 = 0;
    }
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  return v6;
}

void sub_24BA16874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  uint64_t v21;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  if (a20)
    operator delete(a20);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v21 - 56));
  _Unwind_Resume(a1);
}

void std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *a1;
  *a1 = 0;
  std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::move(v2, a2);
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
}

void sub_24BA1691C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::future<BOOL>::get(v1);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::Perform(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _BYTE *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  __int128 v16;

  pthread_mutex_lock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  v4 = qword_2579B92A8;
  if (!qword_2579B92A8)
  {
    v5 = operator new(0x180uLL);
    v5[368] = 0;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *((_OWORD *)v5 + 4) = 0u;
    *((_QWORD *)v5 + 10) = 0;
    std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(&v16, (uint64_t)v5);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B92A8, &v16);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v4 = qword_2579B92A8;
  }
  v9 = (std::__shared_weak_count *)off_2579B92B0;
  if (off_2579B92B0)
  {
    v10 = (unint64_t *)((char *)off_2579B92B0 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  v12 = eUICC::TwoPhaseProv::TwoPhaseProvImpl::Perform(v4, a1, a2);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  pthread_mutex_lock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::reset[abi:ne180100](&qword_2579B92A8);
  pthread_mutex_unlock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  return v12;
}

void sub_24BA16A98(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::ListInstallationNotifications(uint64_t a1, const void **a2, _QWORD *a3)
{
  _WORD *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *__p;
  void *v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char *v22;
  const void *v23;
  const void *v24;

  v5 = operator new(7uLL);
  v21 = (char *)v5 + 7;
  v22 = (char *)v5 + 7;
  *(_DWORD *)v5 = -2130433857;
  v5[2] = 1794;
  *((_BYTE *)v5 + 6) = 0x80;
  v20 = v5;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v6 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a3 + 32))(*a3, &v20, &v17, &v16);
  v7 = VinylControllerMapBBUReturnToVinylResult(v6);
  if ((_DWORD)v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    __p = 0;
    v14 = 0;
    v15 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v17, (uint64_t)v18, v18 - (_BYTE *)v17);
    v23 = 0;
    if (ctu::cf::convert_copy())
    {
      v11 = *a2;
      *a2 = v23;
      v24 = v11;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    if (__p)
    {
      v14 = __p;
      operator delete(__p);
    }
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  return v7;
}

void sub_24BA16C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  uint64_t v18;
  void *v20;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  v20 = *(void **)(v18 - 56);
  if (v20)
  {
    *(_QWORD *)(v18 - 48) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::RetrieveNotificationListForSeqNum(uint64_t a1, CFDataRef *a2, const void **a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *__p;
  void *v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const void *v26;
  const void *v27;
  const void *v28;

  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v6 = eUICC::TwoPhaseProv::ComposeRnl(a2, &v26);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    v10 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a4 + 32))(*a4, &v23, &v20, &v19);
    v6 = VinylControllerMapBBUReturnToVinylResult(v10);
    if ((_DWORD)v6)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      __p = 0;
      v17 = 0;
      v18 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v20, (uint64_t)v21, v21 - (_BYTE *)v20);
      v27 = 0;
      if (ctu::cf::convert_copy())
      {
        v14 = *a3;
        *a3 = v27;
        v28 = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v28);
      }
      if (__p)
      {
        v17 = __p;
        operator delete(__p);
      }
      v6 = 0;
    }
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v26);
  return v6;
}

void sub_24BA16DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  uint64_t v19;
  void *v21;

  if (__p)
    operator delete(__p);
  if (a18)
    operator delete(a18);
  v21 = *(void **)(v19 - 80);
  if (v21)
  {
    *(_QWORD *)(v19 - 72) = v21;
    operator delete(v21);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::GetProfilesInfoList(uint64_t a1, const void **a2, _QWORD *a3)
{
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *__p;
  void *v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char *v22;
  const void *v23;
  const void *v24;

  v5 = (char *)operator new(9uLL);
  v21 = v5 + 9;
  v22 = v5 + 9;
  *(_QWORD *)v5 = 0x709F5A045C062DBFLL;
  v5[8] = -30;
  v20 = v5;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v6 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a3 + 32))(*a3, &v20, &v17, &v16);
  v7 = VinylControllerMapBBUReturnToVinylResult(v6);
  if ((_DWORD)v7)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v8, v9, v10, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    __p = 0;
    v14 = 0;
    v15 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v17, (uint64_t)v18, v18 - (_BYTE *)v17);
    v23 = 0;
    if (ctu::cf::convert_copy())
    {
      v11 = *a2;
      *a2 = v23;
      v24 = v11;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
    }
    if (__p)
    {
      v14 = __p;
      operator delete(__p);
    }
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  return v7;
}

void sub_24BA16F6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  uint64_t v18;
  void *v20;

  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  v20 = *(void **)(v18 - 56);
  if (v20)
  {
    *(_QWORD *)(v18 - 48) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = MEMORY[0x24BEDB858];
  v6 = MEMORY[0x24BEDB858] + 104;
  a1[16] = MEMORY[0x24BEDB858] + 104;
  a1[2] = v5 + 64;
  v7 = a1 + 2;
  v8 = (uint64_t)(a1 + 3);
  v9 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *a1 = v10;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v10 - 24)) = v11;
  a1[1] = 0;
  v12 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v12, a1 + 3);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v13 = v9[4];
  v14 = v9[5];
  a1[2] = v13;
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v13 - 24)) = v14;
  v15 = v9[1];
  *a1 = v15;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v15 - 24)) = v9[6];
  *a1 = v5 + 24;
  a1[16] = v6;
  a1[2] = v5 + 64;
  std::stringbuf::basic_stringbuf[abi:ne180100](v8, a2, a3);
  return a1;
}

void sub_24BA170A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x24BD2C164](v1);
  _Unwind_Resume(a1);
}

uint64_t *std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const std::locale::facet *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  std::locale v19;
  char v20;

  MEMORY[0x24BD2BFC0](&v20, a1, 0);
  if (!v20)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v4 = *(_QWORD *)(*a1 - 24);
  v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  v7 = std::locale::use_facet(&v19, MEMORY[0x24BEDB350]);
  std::locale::~locale(&v19);
  v8 = 0;
  v9 = a1 + 5;
  if (v5 >= 1)
    v10 = v6;
  else
    v10 = 0x7FFFFFFFFFFFFFF7;
  while (1)
  {
    v11 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4])
      break;
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    v14 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v15 = v14[3];
    if (v15 == v14[4])
      (*(void (**)(_QWORD *))(*v14 + 80))(v14);
    else
      v14[3] = v15 + 1;
    if (v10 == ++v8)
    {
      v16 = 0;
      v17 = *a1;
      *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
      goto LABEL_25;
    }
  }
  v13 = (*(uint64_t (**)(_QWORD *))(*v11 + 72))(v11);
  if (v13 != -1)
    goto LABEL_14;
  v16 = 2;
LABEL_23:
  v17 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
  if (!v8)
    v16 |= 4u;
LABEL_25:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_24BA17284(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  _QWORD *v9;
  uint64_t v11;

  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  v11 = *v9;
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(_QWORD *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x24BA17250);
  }
  __cxa_rethrow();
}

void sub_24BA172E8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::DisableProfile(uint64_t a1, CFDataRef *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *__p;
  void *v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int16 v29;
  BOOL v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;

  v31 = 0;
  v32 = 0;
  v30 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v4 = eUICC::TwoPhaseProv::ComposeDisableReq(a2, &v32);
  if ((_DWORD)v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    v8 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a3 + 32))(*a3, &v26, &v23, &v29);
    v4 = VinylControllerMapBBUReturnToVinylResult(v8);
    if ((_DWORD)v4)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      __p = 0;
      v21 = 0;
      v22 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v23, (uint64_t)v24, v24 - (_BYTE *)v23);
      v33 = 0;
      if (ctu::cf::convert_copy())
      {
        v12 = v31;
        v31 = v33;
        v34 = v12;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
      }
      if (__p)
      {
        v21 = __p;
        operator delete(__p);
      }
      if (eUICC::TwoPhaseProv::ExtractDisableResult((CFDataRef *)&v31, &v30))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == ret");
        v4 = 27;
      }
      else if (v30)
      {
        v4 = 0;
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
        v4 = 29;
      }
    }
  }
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v32);
  return v4;
}

void sub_24BA17530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  uint64_t v20;

  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 40));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::TwoPhaseProvImpl::DeleteProfile(uint64_t a1, CFDataRef *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *__p;
  void *v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int16 v29;
  BOOL v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;

  v31 = 0;
  v32 = 0;
  v30 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v4 = eUICC::TwoPhaseProv::ComposeDeleteReq(a2, &v32);
  if ((_DWORD)v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    ctu::cf::assign();
    v8 = (*(uint64_t (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a3 + 32))(*a3, &v26, &v23, &v29);
    v4 = VinylControllerMapBBUReturnToVinylResult(v8);
    if ((_DWORD)v4)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kVinylResultSuccess == ret");
    }
    else
    {
      __p = 0;
      v21 = 0;
      v22 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v23, (uint64_t)v24, v24 - (_BYTE *)v23);
      v33 = 0;
      if (ctu::cf::convert_copy())
      {
        v12 = v31;
        v31 = v33;
        v34 = v12;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v34);
      }
      if (__p)
      {
        v21 = __p;
        operator delete(__p);
      }
      if (eUICC::TwoPhaseProv::ExtractDeleteResult((CFDataRef *)&v31, &v30))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == ret");
        v4 = 27;
      }
      else if (v30)
      {
        v4 = 0;
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylControllerTwoPhaseProvisioning", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"success");
        v4 = 29;
      }
    }
  }
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v32);
  return v4;
}

void sub_24BA177B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  uint64_t v20;

  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 48));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v20 - 40));
  _Unwind_Resume(a1);
}

_QWORD *eUICC::TwoPhaseProv::TwoPhaseProvImpl::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  _BYTE *v3;

  v3 = operator new(0x180uLL);
  v3[368] = 0;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_QWORD *)v3 + 10) = 0;
  return std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(a1, (uint64_t)v3);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=(const void **a1, const void **a2)
{
  const void *v3;
  const void *v5;

  if (a1 != a2)
  {
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(&v5, a2);
    v3 = *a1;
    *a1 = v5;
    v5 = v3;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  }
  return a1;
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  operator delete(v3);
}

uint64_t std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::__on_zero_shared(_BYTE *a1)
{
  if ((a1[136] & 1) != 0)
    std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 144));
  return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  const std::error_category *v4;
  unint64_t *v5;
  unint64_t v6;
  std::logic_error v8[2];
  std::exception_ptr v9;

  v2 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v9.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v9);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v4 = std::future_category();
        MEMORY[0x24BD2BFA8](v8, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v8);
      }
    }
    v5 = (unint64_t *)(v2 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t *dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>@<X0>(unint64_t **a1@<X0>, void **a2@<X8>)
{
  char *v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD aBlock[5];
  _QWORD v10[5];
  char *v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3002000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  v4 = (char *)operator new(0xA0uLL);
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 850045863;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(_QWORD *)v4 = off_251CCA458;
  *((_QWORD *)v4 + 1) = 0;
  v11 = v4;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v4);
  v5 = *a1;
  *a1 = (unint64_t *)v4;
  if (v5)
  {
    v6 = v5 + 1;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
      (*(void (**)(unint64_t *))(*v5 + 16))(v5);
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8dispatch20future_callback_implINSt3__110shared_ptrIN3ctu4Http12HttpResponseEEES6_EENS_5blockIU13block_pointerFvT0_EEERNS1_6futureIT_EE_block_invoke;
  aBlock[3] = &unk_251CCA498;
  aBlock[4] = v10;
  *a2 = _Block_copy(aBlock);
  _Block_object_dispose(v10, 8);
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v11);
}

void sub_24BA17C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__0(uint64_t a1)
{
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(a1 + 40));
}

void ___ZN8dispatch20future_callback_implINSt3__110shared_ptrIN3ctu4Http12HttpResponseEEES6_EENS_5blockIU13block_pointerFvT0_EEERNS1_6futureIT_EE_block_invoke(uint64_t a1, uint64_t a2)
{
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::set_value((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::set_value(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (!v2)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::set_value<std::shared_ptr<ctu::Http::HttpResponse>>(v2, a2);
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::set_value<std::shared_ptr<ctu::Http::HttpResponse>>(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  std::exception_ptr v6;

  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_OWORD *)(a1 + 144) = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_24BA17CFC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<std::shared_ptr<ctu::Http::HttpResponse>>::move(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  std::exception_ptr v5;
  std::exception_ptr v6;
  std::exception_ptr v7;
  std::unique_lock<std::mutex> __lk;

  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)a1, &__lk);
  v4 = *(_QWORD *)(a1 + 16);
  v7.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v7);
  if (v4)
  {
    std::exception_ptr::exception_ptr(&v6, (const std::exception_ptr *)(a1 + 16));
    v5.__ptr_ = &v6;
    std::rethrow_exception(v5);
    __break(1u);
  }
  else
  {
    *a2 = *(_OWORD *)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;
    *(_QWORD *)(a1 + 152) = 0;
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
  }
}

void sub_24BA17DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  *(_QWORD *)(a1 + 64) = 0;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

void std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::reset[abi:ne180100](_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_24BA17F28(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

_QWORD *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::find<std::vector<unsigned char>>(uint64_t a1, unsigned __int8 **a2)
{
  _QWORD *v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v3 = (_QWORD *)(a1 + 8);
  result = std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__lower_bound<std::vector<unsigned char>>(a1, a2, *(_QWORD **)(a1 + 8), (_QWORD *)(a1 + 8));
  if (v3 != result)
  {
    v6 = result[4];
    v5 = result[5];
    if (v6 == v5)
      return result;
    v7 = *a2;
    v8 = v6 + 1;
    while (v7 != a2[1])
    {
      v9 = *v7;
      v10 = *(unsigned __int8 *)(v8 - 1);
      if (v9 < v10)
        break;
      ++v7;
      if (v10 < v9 || v8++ == v5)
        return result;
    }
  }
  return v3;
}

_QWORD *std::__tree<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::__map_value_compare<std::vector<unsigned char>,std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>,std::less<std::vector<unsigned char>>,true>,std::allocator<std::__value_type<std::vector<unsigned char>,eUICC::TwoPhaseProv::ProfileProperties>>>::__lower_bound<std::vector<unsigned char>>(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _QWORD *result;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;

  result = a4;
  if (a3)
  {
    v5 = a2[1];
    do
    {
      if (*a2 == v5)
      {
LABEL_12:
        result = a3;
      }
      else
      {
        v6 = (unsigned __int8 *)a3[4];
        v7 = *a2 + 1;
        while (v6 != (unsigned __int8 *)a3[5])
        {
          v8 = *v6;
          v9 = *(unsigned __int8 *)(v7 - 1);
          if (v8 < v9)
            break;
          ++v6;
          if (v9 < v8 || v7++ == v5)
            goto LABEL_12;
        }
        ++a3;
      }
      a3 = (_QWORD *)*a3;
    }
    while (a3);
  }
  return result;
}

void std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  const void **v2;
  const void **v4;
  void *v5;

  v1 = *a1;
  v2 = (const void **)**a1;
  if (v2)
  {
    v4 = (const void **)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v4 - 1);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::shared_ptr[abi:ne180100]<eUICC::TwoPhaseProv::TwoPhaseProvImpl,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_251CCA4C8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_24BA181F0(_Unwind_Exception *exception_object)
{
  const void **v1;
  void *v3;

  if (v1)
  {
    eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::__on_zero_shared(uint64_t a1)
{
  const void **v1;
  void *v2;

  v1 = *(const void ***)(a1 + 24);
  if (v1)
  {
    eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<eUICC::TwoPhaseProv::TwoPhaseProvImpl *,std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::__shared_ptr_default_delete<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl>,std::allocator<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void eUICC::TwoPhaseProv::TwoPhaseProvImpl::~TwoPhaseProvImpl(const void **this)
{
  NSObject *v2;

  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(this + 10);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(this + 9);
  v2 = this[8];
  if (v2)
    dispatch_release(v2);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(this + 7);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 6);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 4);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 3);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 2);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this + 1);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(this);
}

uint64_t __cxx_global_var_init_5()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::TwoPhaseProv::TwoPhaseProvImpl,eUICC::TwoPhaseProv::TwoPhaseProvImpl,ctu::PthreadMutexGuardPolicy<eUICC::TwoPhaseProv::TwoPhaseProvImpl>>::sInstance, &dword_24BA04000);
  }
  return result;
}

uint64_t eUICC::ClearMetadata::GetListOfIccids(int a1, const void ***a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  const __CFData *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex Length;
  const __CFAllocator *v15;
  const __CFData *MutableCopy;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  CFDataRef v23;
  CFDataRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  char v32;
  char v33;
  char v34;
  CFDataRef v35;
  const void *v36[2];
  char *v37;
  int v38;
  unint64_t v39;
  UInt8 *MutableBytePtr;
  CFIndex v41;
  CFDataRef theData;
  const __CFData *v43;
  unint64_t v44[2];
  unint64_t v45[2];
  void *__p;
  void *v47;
  uint64_t v48;
  __int16 v49;
  const __CFData *v50;
  void *v51;
  _BYTE *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char *v56;
  CFDataRef v57;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Requesting Profile List\n", v6, v7, v8, v32);
  v9 = operator new(7uLL);
  v55 = (char *)v9 + 7;
  v56 = (char *)v9 + 7;
  *(_DWORD *)v9 = 1543777727;
  v9[2] = 23042;
  *((_BYTE *)v9 + 6) = -107;
  v53 = 0;
  v54 = v9;
  v51 = 0;
  v52 = 0;
  v50 = 0;
  v49 = 0;
  (*(void (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a3 + 32))(*a3, &v54, &v51, &v49);
  __p = 0;
  v47 = 0;
  v48 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v51, (uint64_t)v52, v52 - (_BYTE *)v51);
  v43 = 0;
  if (ctu::cf::convert_copy())
  {
    v10 = v50;
    v50 = v43;
    v36[0] = v10;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v36);
  }
  if (__p)
  {
    v47 = __p;
    operator delete(__p);
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Extracting Profile List\n", v11, v12, v13, v33);
  Length = CFDataGetLength(v50);
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Length, v50);
  v41 = 0;
  theData = MutableCopy;
  MutableBytePtr = 0;
  MutableBytePtr = CFDataGetMutableBytePtr(MutableCopy);
  v41 = CFDataGetLength(theData);
  if (DERDecodeSeqContentInit((unint64_t *)&MutableBytePtr, v45))
    goto LABEL_6;
  if (DERDecodeSeqNext(v45, (unint64_t *)&v43) || v43 != (const __CFData *)0xA00000000000002DLL)
  {
    gBBULogMaskGet();
    v20 = "DR_Success == der_ret && TAG_PILR == dec.tag";
    goto LABEL_7;
  }
  if (DERDecodeSeqContentInit(v44, v45))
    goto LABEL_6;
  if (DERDecodeSeqNext(v45, (unint64_t *)&v43) || v43 != (const __CFData *)0xA000000000000000)
  {
    gBBULogMaskGet();
    v20 = "DR_Success == der_ret && TAG_PILR_OK == dec.tag";
    goto LABEL_7;
  }
  if (DERDecodeSeqContentInit(v44, v45))
  {
LABEL_6:
    gBBULogMaskGet();
    v20 = "DR_Success == der_ret";
LABEL_7:
    _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)v20);
    goto LABEL_8;
  }
  while (1)
  {
    if (DERDecodeSeqNext(v45, (unint64_t *)&v43) == 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::GetListOfIccids: Successfully populated ICCID list!\n", v25, v26, v27, v34);
      v21 = 0;
      goto LABEL_9;
    }
    v38 = 0;
    v35 = 0;
    if (DERDecodeSeqContentInit(v44, &v39))
      break;
    if (v43 != (const __CFData *)0xE000000000000003)
    {
      gBBULogMaskGet();
      v31 = "DR_Success == der_ret && TAG_PI == dec.tag";
      goto LABEL_37;
    }
    v23 = CFDataCreate(v15, (const UInt8 *)v36[0], (CFIndex)v36[1]);
    v24 = v35;
    v35 = v23;
    v57 = v24;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v57);
    if (DERParseInteger(&v37, &v38))
      break;
    if (!a1 || v38 == 1)
      std::vector<ctu::cf::CFSharedRef<__CFData const>>::push_back[abi:ne180100](a2, (const void **)&v35);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v35);
  }
  gBBULogMaskGet();
  v31 = "DR_Success == der_ret";
LABEL_37:
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)v31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v35);
LABEL_8:
  v21 = 27;
LABEL_9:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&theData);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v50);
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  return v21;
}

void sub_24BA18748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,const void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30)
{
  uint64_t v30;
  void *v32;
  void *v33;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a13);
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(&a23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v30 - 144));
  v32 = *(void **)(v30 - 136);
  if (v32)
  {
    *(_QWORD *)(v30 - 128) = v32;
    operator delete(v32);
  }
  v33 = *(void **)(v30 - 112);
  if (v33)
  {
    *(_QWORD *)(v30 - 104) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(a1);
}

uint64_t eUICC::ClearMetadata::ClearMetadataForIccids(CFDataRef **a1, _QWORD *a2)
{
  CFDataRef *v2;
  CFDataRef *v3;
  char *v5;
  const UInt8 *BytePtr;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int16 v14;
  void *__p;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char *v20;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    v13 = xmmword_24BA2A1B8;
    do
    {
      v5 = (char *)operator new(0x15uLL);
      v19 = v5 + 21;
      v20 = v5 + 21;
      *(_OWORD *)v5 = v13;
      *(_QWORD *)(v5 + 13) = 0x8002E100000000;
      v18 = v5;
      BytePtr = CFDataGetBytePtr(*v2);
      v7 = (char *)v18;
      v8 = *(_QWORD *)BytePtr;
      *(_DWORD *)((char *)v18 + 13) = *((_DWORD *)BytePtr + 2);
      *(_QWORD *)(v7 + 5) = v8;
      __p = 0;
      v16 = 0;
      v17 = 0;
      v14 = 0;
      (*(void (**)(_QWORD, void **, void **, __int16 *))(*(_QWORD *)*a2 + 32))(*a2, &v18, &__p, &v14);
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::ClearMetadataForIccids: Attempted metadata clear for ICCID\n", v9, v10, v11, v13);
      if (__p)
      {
        v16 = __p;
        operator delete(__p);
      }
      if (v18)
      {
        v19 = v18;
        operator delete(v18);
      }
      ++v2;
    }
    while (v2 != v3);
  }
  return 0;
}

void sub_24BA188E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::ClearMetadata::Perform(int a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFDataRef *v8[3];
  CFDataRef **v9;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylClearMetadata", "", "VinylClearMetadata::Perform: onlyBootstrap=%d\n", v4, v5, v6, a1);
  memset(v8, 0, sizeof(v8));
  eUICC::ClearMetadata::GetListOfIccids(a1, (const void ***)v8, a2);
  eUICC::ClearMetadata::ClearMetadataForIccids(v8, a2);
  v9 = v8;
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  return 0;
}

void sub_24BA189B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::vector<ctu::cf::CFSharedRef<__CFData const>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUASCIIDigitToInt(__darwin_ct_rune_t this, unsigned int a2)
{
  uint64_t result;
  __darwin_ct_rune_t v5;

  result = (this - 48);
  if (result > 9)
  {
    v5 = __toupper(this);
    if (((v5 << 24) - 1073741825) > 0x1AFFFFFE)
      return 0xFFFFFFFFLL;
    result = v5 - 55;
    if (result >= a2)
      return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t BBUpdaterCommon::BBUStringToUInt32(const char *a1, int __base)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return strtoul(a1, 0, __base);
}

BOOL BBUpdaterCommon::BBUFileExists(const char *a1)
{
  stat v2;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return stat(a1, &v2) == 0;
}

DIR *BBUpdaterCommon::BBUReadDirectory(const char *a1, uint64_t *a2)
{
  DIR *result;
  DIR *v4;
  dirent *v5;
  _QWORD *v6;
  uint64_t v7;
  void *__p[2];
  char v9;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = opendir(a1);
  if (result)
  {
    v4 = result;
    while (1)
    {
      v5 = readdir(v4);
      if (!v5)
        break;
      std::string::basic_string[abi:ne180100](__p, v5->d_name, v5->d_namlen);
      v6 = std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>((uint64_t)a2, 0, 0, (uint64_t)__p);
      v6[1] = a2;
      v7 = *a2;
      *v6 = *a2;
      *(_QWORD *)(v7 + 8) = v6;
      *a2 = (uint64_t)v6;
      ++a2[2];
      if (v9 < 0)
        operator delete(__p[0]);
    }
    return (DIR *)closedir(v4);
  }
  return result;
}

void sub_24BA18B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BBUpdaterCommon::BBUGetFileName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  __int128 v3;
  std::string __p;
  char v5;
  uint64_t v6;
  void **v7;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  ctu::tokenize();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (*(char *)(v6 - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v6 - 24), *(_QWORD *)(v6 - 16));
  }
  else
  {
    v3 = *(_OWORD *)(v6 - 24);
    a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(v6 - 8);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
  v7 = (void **)&v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void sub_24BA18C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  uint64_t v16;

  *(_QWORD *)(v16 - 24) = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 24));
  _Unwind_Resume(a1);
}

void BBUpdaterCommon::BBUStripCharacters(uint64_t *a1@<X0>, const std::string *a2@<X1>, _QWORD *a3@<X8>)
{
  BOOL v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;

  v6 = *((char *)a1 + 23) < 0;
  if (*((char *)a1 + 23) >= 0)
    v7 = *((unsigned __int8 *)a1 + 23);
  else
    v7 = a1[1];
  v8 = (char *)operator new[](v7 + 1);
  v9 = v8;
  v10 = v8;
  if (v7)
  {
    v11 = 0;
    v12 = 1;
    v10 = v8;
    do
    {
      v13 = (uint64_t *)*a1;
      if (!v6)
        v13 = a1;
      if (std::string::find(a2, *((_BYTE *)v13 + v11), 0) == -1)
      {
        if (*((char *)a1 + 23) >= 0)
          v14 = a1;
        else
          v14 = (uint64_t *)*a1;
        *v10++ = *((_BYTE *)v14 + v11);
      }
      v11 = v12;
      v6 = *((char *)a1 + 23) < 0;
      v15 = *((unsigned __int8 *)a1 + 23);
      if ((v15 & 0x80u) != 0)
        v15 = a1[1];
    }
    while (v15 > v12++);
  }
  *v10 = 0;
  std::string::basic_string[abi:ne180100]<0>(a3, v9);
  operator delete[](v9);
}

_QWORD *BBUpdaterCommon::BBUCFStringToCPPString@<X0>(const __CFString *this@<X0>, _QWORD *a2@<X8>)
{
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CFStringGetCString(this, buffer, 1024, 0x8000100u);
  return std::string::basic_string[abi:ne180100]<0>(a2, buffer);
}

void BBUpdaterCommon::BBUStringToArgv(char *a1, void **a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  unsigned int v8;
  int v9;
  char *v10;
  char *v11;
  unint64_t v12;
  char **v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unsigned int v27;
  int v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  __int128 v42;
  unint64_t v43;

  std::operator+<char>();
  if (a1[23] < 0)
    operator delete(*(void **)a1);
  *(_OWORD *)a1 = v42;
  *((_QWORD *)a1 + 2) = v43;
  if ((v43 & 0x8000000000000000) == 0)
    v4 = HIBYTE(v43);
  else
    v4 = *((_QWORD *)a1 + 1);
  if (v4)
  {
    v5 = 0;
    v6 = MEMORY[0x24BDAC740];
    do
    {
      while (1)
      {
        v7 = a1[23] >= 0 ? a1 : *(char **)a1;
        v8 = v7[v5];
        v9 = (v8 & 0x80000000) != 0 ? __maskrune(v8, 0x4000uLL) : *(_DWORD *)(v6 + 4 * v8 + 60) & 0x4000;
        v10 = a1[23] >= 0 ? a1 : *(char **)a1;
        v11 = &v10[v5];
        if (v5 >= v4 || !v9)
          break;
        *v11 = 0;
        ++v5;
      }
      v13 = (char **)a2[1];
      v12 = (unint64_t)a2[2];
      if ((unint64_t)v13 >= v12)
      {
        v15 = ((char *)v13 - (_BYTE *)*a2) >> 3;
        if ((unint64_t)(v15 + 1) >> 61)
          goto LABEL_63;
        v16 = v12 - (_QWORD)*a2;
        v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1))
          v17 = v15 + 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a2 + 2), v18);
        else
          v19 = 0;
        v20 = &v19[8 * v15];
        *(_QWORD *)v20 = v11;
        v14 = v20 + 8;
        v22 = (char *)*a2;
        v21 = (char *)a2[1];
        if (v21 != *a2)
        {
          do
          {
            v23 = *((_QWORD *)v21 - 1);
            v21 -= 8;
            *((_QWORD *)v20 - 1) = v23;
            v20 -= 8;
          }
          while (v21 != v22);
          v21 = (char *)*a2;
        }
        *a2 = v20;
        a2[1] = v14;
        a2[2] = &v19[8 * v18];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *v13 = v11;
        v14 = v13 + 1;
      }
      a2[1] = v14;
      v24 = v5 + 1;
      do
      {
        v25 = v24;
        if (a1[23] >= 0)
          v26 = a1;
        else
          v26 = *(char **)a1;
        v27 = v26[v25];
        if ((v27 & 0x80000000) != 0)
          v28 = __maskrune(v27, 0x4000uLL);
        else
          v28 = *(_DWORD *)(v6 + 4 * v27 + 60) & 0x4000;
        v24 = v25 + 1;
      }
      while (v25 < v4 && !v28);
      v5 = v25;
    }
    while (v25 < v4);
  }
  v29 = (unint64_t)a2[2];
  v30 = a2[1];
  if ((unint64_t)v30 >= v29)
  {
    v32 = ((char *)v30 - (_BYTE *)*a2) >> 3;
    if ((unint64_t)(v32 + 1) >> 61)
LABEL_63:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v33 = v29 - (_QWORD)*a2;
    v34 = v33 >> 2;
    if (v33 >> 2 <= (unint64_t)(v32 + 1))
      v34 = v32 + 1;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a2 + 2), v35);
    else
      v36 = 0;
    v37 = &v36[8 * v32];
    v38 = &v36[8 * v35];
    *(_QWORD *)v37 = 0;
    v31 = v37 + 8;
    v40 = (char *)*a2;
    v39 = (char *)a2[1];
    if (v39 != *a2)
    {
      do
      {
        v41 = *((_QWORD *)v39 - 1);
        v39 -= 8;
        *((_QWORD *)v37 - 1) = v41;
        v37 -= 8;
      }
      while (v39 != v40);
      v39 = (char *)*a2;
    }
    *a2 = v37;
    a2[1] = v31;
    a2[2] = v38;
    if (v39)
      operator delete(v39);
  }
  else
  {
    *v30 = 0;
    v31 = v30 + 1;
  }
  a2[1] = v31;
}

double BBUpdaterCommon::BBUGetTimeDifference(BBUpdaterCommon *this, const double *a2, const double *a3)
{
  return *(double *)this - *a2;
}

pthread_t BBUpdaterCommon::BBUThreadSpawn(BBUpdaterCommon *this, void *(__cdecl *a2)(void *), void *(*a3)(void *), void *a4)
{
  int v4;
  int v7;
  pthread_t v9;
  pthread_attr_t v10;
  uint64_t v11;

  v4 = (int)a4;
  v11 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  pthread_attr_init(&v10);
  if (v4)
    pthread_attr_setdetachstate(&v10, 2);
  v7 = pthread_create(&v9, &v10, a2, a3);
  pthread_attr_destroy(&v10);
  if (v7)
    return 0;
  else
    return v9;
}

BOOL BBUpdaterCommon::BBUThreadJoin(_opaque_pthread_t *this, void *a2)
{
  return pthread_join(this, 0) == 0;
}

uint64_t BBUpdaterCommon::BBUPromptForStepping(BBUpdaterCommon *this, BOOL a2, const char *a3, const char *a4)
{
  return 1;
}

pthread_mutex_t *BBUpdaterCommon::BBUMutex::BBUMutex(pthread_mutex_t *this, const char *a2)
{
  pthread_mutex_init(this, 0);
  return this;
}

void BBUpdaterCommon::BBUMutex::~BBUMutex(pthread_mutex_t *this)
{
  pthread_mutex_destroy(this);
}

{
  pthread_mutex_destroy(this);
}

uint64_t BBUpdaterCommon::collectCoreDump(BBUpdaterCommon *this, const __CFDictionary **a2, const __CFString *a3)
{
  int v3;
  const __CFAllocator *v6;
  CFStringRef v7;
  const void *v8;
  CFNumberRef v9;
  __CFDictionary *Mutable;
  const __CFDictionary **v11;
  int v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _BYTE *v19;
  const char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *values;
  void *keys;
  int valuePtr;
  CFTypeRef obj;
  CFTypeRef cf;

  v3 = (int)a3;
  obj = 0;
  cf = 0;
  valuePtr = 2;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v28 = CFSTR("/mnt4");
  v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@/%@"));
  v8 = (const void *)MEMORY[0x24BD2B96C](&obj);
  if (!v8)
  {
    v18 = 0;
    v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
    if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6)
      goto LABEL_53;
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v22, v23, v24, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
    v8 = 0;
    goto LABEL_52;
  }
  BBUpdaterRegisterLogSink();
  v9 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("BootMode"), v9);
  CFDictionarySetValue(Mutable, CFSTR("SystemRoot"), CFSTR("/mnt5"));
  CFDictionarySetValue(Mutable, CFSTR("DataRoot"), CFSTR("/mnt4"));
  CFDictionarySetValue(Mutable, CFSTR("RemoteFSRoot"), CFSTR("/mnt3/bbfs/"));
  v11 = a2;
  if (a2 || (v11 = (const __CFDictionary **)v7) != 0)
    CFDictionarySetValue(Mutable, CFSTR("coreDumpPath"), v11);
  if (!BBUpdaterSetOptions())
  {
    v18 = 0;
    v20 = "BBUpdaterSetOptions rejected  with error\n";
    if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6)
      goto LABEL_53;
LABEL_51:
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
LABEL_52:
    v18 = 0;
    goto LABEL_53;
  }
  v12 = BBUpdaterExecCommand();
  v13 = (_BYTE *)gBBULogMaskGet();
  if (!v12)
  {
    v18 = 0;
    v20 = "BBUpdaterExecCommand rejected  with error\n";
    if ((*v13 & 2) == 0 || gBBULogVerbosity < 6)
      goto LABEL_53;
    goto LABEL_51;
  }
  _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Core dump successful \n", v14, v15, v16, (char)CFSTR("/mnt4"));
  if (this)
  {
    keys = CFSTR("LogDirectory");
    if (a2)
      v17 = (const __CFString *)a2;
    else
      v17 = v7;
    values = CFURLCreateWithString(v6, v17, 0);
    *(_QWORD *)this = CFDictionaryCreate(v6, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  if (v3)
  {
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    CFRelease(v8);
    if (obj)
    {
      CFRelease(obj);
      obj = 0;
    }
    v8 = (const void *)MEMORY[0x24BD2B96C](&obj);
    if (!v8)
    {
      v18 = 1;
      v20 = "BBUpdaterExtremeCreateWithError rejected with error\n";
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      {
        _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
        v8 = 0;
      }
      goto LABEL_53;
    }
    BBUpdaterRegisterLogSink();
    if (BBUpdaterSetOptions())
    {
      v18 = BBUpdaterExecCommand();
      v19 = (_BYTE *)gBBULogMaskGet();
      if ((_DWORD)v18)
      {
        v18 = 1;
        v20 = "BB reset successful\n";
LABEL_21:
        _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", v20, v14, v15, v16, (char)v28);
        goto LABEL_23;
      }
      v20 = "BBUpdaterExecCommand rejected  with error\n";
      if ((*v19 & 2) == 0 || gBBULogVerbosity < 6)
      {
LABEL_53:
        gBBULogMaskGet();
        goto LABEL_21;
      }
    }
    else
    {
      v18 = 0;
      v20 = "BBUpdaterSetOptions rejected  with error\n";
      if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6)
        goto LABEL_53;
    }
    goto LABEL_51;
  }
  v18 = 1;
LABEL_23:
  if (obj)
  {
    CFShow(obj);
    if (obj)
      CFRelease(obj);
    obj = 0;
  }
  if (v8)
    CFRelease(v8);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v7)
    CFRelease(v7);
  return v18;
}

uint64_t BBUpdaterCommon::bbupdater_log(BBUpdaterCommon *this, void *a2, char a3, const char *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  gBBULogMaskGet();
  return _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "bbupdater: %s", v5, v6, v7, a3);
}

BOOL BBUpdaterCommon::inRestoreOS(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS != -1)
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global);
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS != -1)
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_42);
  return (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0;
}

void sub_24BA1987C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUMGCopyAnswer(BBUpdaterCommon *this, const __CFString *a2)
{
  if (BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::onceToken != -1)
    dispatch_once(&BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::onceToken, &__block_literal_global_78);
  if (BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer)
    return BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer(this, 0);
  else
    return 0;
}

uint64_t ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ___ZN15BBUpdaterCommon11inRestoreOSEv_block_invoke_2()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  BBUpdaterCommon::inRestoreOS(void)::recoveryOS = os_variant_is_recovery();
  result = gBBULogMaskGet();
  if ((*(_BYTE *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    return _BBULog(24, 0, "BBUCommon", "", "InRecoveryOS: %d\n", v1, v2, v3, BBUpdaterCommon::inRestoreOS(void)::recoveryOS);
  return result;
}

uint64_t BBUpdaterCommon::getECID(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::getECID(void)::sOnce != -1)
    dispatch_once(&BBUpdaterCommon::getECID(void)::sOnce, &__block_literal_global_46);
  return BBUpdaterCommon::getECID(void)::ecid;
}

void sub_24BA19A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::getEUICCChipID(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::getEUICCChipID(void)::sOnce != -1)
    dispatch_once(&BBUpdaterCommon::getEUICCChipID(void)::sOnce, &__block_literal_global_51);
  return BBUpdaterCommon::getEUICCChipID(void)::euiccChipID;
}

void sub_24BA19B34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **BBUpdaterCommon::BBUReadNVRAM@<X0>(const void **a1@<X8>)
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t v9;
  void *__p[2];
  char v11;

  {
    BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo = 0;
    __cxa_atexit((void (*)(void *))ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef, &BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo, &dword_24BA04000);
  }
  if (BBUpdaterCommon::BBUReadNVRAM(void)::onceToken != -1)
    dispatch_once(&BBUpdaterCommon::BBUReadNVRAM(void)::onceToken, &__block_literal_global_55);
  if ((*(_BYTE *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    v9 = BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo;
    if (BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo)
      CFRetain((CFTypeRef)BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo);
    CFOBJ_STR(&v9, __p);
    if (v11 >= 0)
      v7 = __p;
    else
      LOBYTE(v7) = __p[0];
    _BBULog(24, 0, "BBUCommon", "", "NVRAM: %s\n", v4, v5, v6, (char)v7);
    if (v11 < 0)
      operator delete(__p[0]);
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v9);
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::SharedRef(a1, (const void **)&BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo);
}

void sub_24BA19C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a11);
  _Unwind_Resume(a1);
}

uint64_t ___ZN15BBUpdaterCommon12BBUReadNVRAMEv_block_invoke()
{
  int v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  io_registry_entry_t v10;
  io_object_t v11;
  kern_return_t CFProperties;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  char v23;
  CFMutableDictionaryRef properties[2];
  mach_port_t v25;

  v25 = 0;
  v0 = MEMORY[0x24BD2BB70](*MEMORY[0x24BDAD2F0], &v25);
  if (v0)
  {
    v1 = v0;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v2, v3, v4, (char)"KERN_SUCCESS == kr");
    result = gBBULogMaskGet();
    if ((*(_BYTE *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      v9 = "Could not get master port %d\n";
      v23 = v1;
      return _BBULog(24, 0, "BBUCommon", "", v9, v6, v7, v8, v23);
    }
  }
  else
  {
    v10 = IORegistryEntryFromPath(v25, "IODeviceTree:/options");
    if (v10)
    {
      v11 = v10;
      properties[0] = 0;
      properties[1] = (CFMutableDictionaryRef)&BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo;
      CFProperties = IORegistryEntryCreateCFProperties(v10, properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy((const void **)properties);
      if (CFProperties
        || (BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo
          ? (v22 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
          : (v22 = 0),
            !v22))
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"KERN_SUCCESS == kr && nvramInfo");
        if ((*(_BYTE *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
          _BBULog(24, 0, "BBUCommon", "", "Could not load NVRAM? %d\n", v16, v17, v18, CFProperties);
      }
      return IOObjectRelease(v11);
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "BBUCommon", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"nvramRef");
      result = gBBULogMaskGet();
      if ((*(_BYTE *)(result + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      {
        v9 = "Could not find NVRAM via IOKit\n";
        return _BBULog(24, 0, "BBUCommon", "", v9, v6, v7, v8, v23);
      }
    }
  }
  return result;
}

void sub_24BA19EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy((const void **)va);
  _Unwind_Resume(a1);
}

BOOL BBUpdaterCommon::isNVRAMKeyPresent(const __CFString *this, const __CFString *a2)
{
  uint64_t (*v3)(uint64_t);
  _BOOL8 v4;
  char CStringPtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFDictionaryRef theDict;

  BBUpdaterCommon::BBUReadNVRAM((const void **)&theDict);
  v3 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!theDict)
    v3 = 0;
  if (v3)
    v4 = CFDictionaryContainsKey(theDict, this) != 0;
  else
    v4 = 0;
  if ((*(_BYTE *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    CStringPtr = CFStringGetCStringPtr(this, 0x8000100u);
    _BBULog(24, 0, "BBUCommon", "", "NVRAM '%s' exists? %s\n", v6, v7, v8, CStringPtr);
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  return v4;
}

void sub_24BA19FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t BBUpdaterCommon::BBUCreateCFError(CFErrorRef *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  const __CFAllocator *v7;
  const __CFDictionary *Mutable;
  CFDictionaryRef v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v16;
  CFDictionaryRef userInfo;
  const __CFDictionary *v18;
  CFDictionaryRef v19;

  v16 = 0;
  userInfo = 0;
  if (!a1)
  {
    v11 = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5)
      goto LABEL_13;
LABEL_12:
    _BBULog(1, 6, "BBUCommon", "", "check failed: %s, %d, assertion: %s\n", v12, v13, v14, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Support/BBUCommon.cpp");
    v11 = 0;
    goto LABEL_13;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v11 = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v9 = userInfo;
  userInfo = Mutable;
  v19 = v9;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v19);
  v18 = 0;
  if ((ctu::cf::convert_copy() & 1) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = v16;
  v16 = v18;
  v19 = v10;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v19);
  ctu::cf::insert<__CFString const*,__CFString const*>(userInfo, (void *)*MEMORY[0x24BDBD378], (uint64_t)v18);
  if (a4)
    ctu::cf::insert<__CFString const*,__CFError *>(userInfo, (void *)*MEMORY[0x24BDBD3B0], a4);
  *a1 = CFErrorCreate(v7, CFSTR("BBUpdater"), a3, userInfo);
  v11 = 1;
LABEL_13:
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v16);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&userInfo);
  return v11;
}

void sub_24BA1A1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  const void *v6;
  va_list va;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, const void *);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ctu::cf::insert<__CFString const*,__CFString const*>(__CFDictionary *a1, void *cf, uint64_t a3)
{
  uint64_t v6;
  void *key;

  key = cf;
  if (cf)
    CFRetain(cf);
  v6 = a3;
  if (a3)
  {
    CFRetain((CFTypeRef)a3);
    if (key)
    {
      CFDictionaryAddValue(a1, key, (const void *)a3);
      a3 = 1;
    }
    else
    {
      a3 = 0;
    }
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v6);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return a3;
}

void sub_24BA1A278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&a9);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ctu::cf::insert<__CFString const*,__CFError *>(__CFDictionary *a1, void *cf, uint64_t a3)
{
  uint64_t v6;
  void *key;

  key = cf;
  if (cf)
    CFRetain(cf);
  v6 = a3;
  if (a3)
  {
    CFRetain((CFTypeRef)a3);
    if (key)
    {
      CFDictionaryAddValue(a1, key, (const void *)a3);
      a3 = 1;
    }
    else
    {
      a3 = 0;
    }
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v6);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return a3;
}

void sub_24BA1A318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&a9);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  _Unwind_Resume(a1);
}

_QWORD *BBUpdaterCommon::BBUStrError@<X0>(BBUpdaterCommon *this@<X0>, _QWORD *a2@<X8>)
{
  int v2;
  char __strerrbuf[16];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v2 = (int)this;
  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)__strerrbuf = 0u;
  v6 = 0u;
  if (strerror_r((int)this, __strerrbuf, 0x80uLL))
    snprintf(__strerrbuf, 0x80uLL, "unknown error %d", v2);
  return std::string::basic_string[abi:ne180100]<0>(a2, __strerrbuf);
}

const char *BBUpdaterCommon::redactedString(BBUpdaterCommon *this, const char *a2)
{
  if (BBUpdaterCommon::inRestoreOS(this))
    return (const char *)this;
  else
    return "0x<< SNUM >>";
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
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
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

_QWORD *std::__list_imp<std::string>::__create_node[abi:ne180100]<std::string const&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  std::string *v8;

  v7 = operator new(0x28uLL);
  *v7 = a2;
  v7[1] = a3;
  v8 = (std::string *)(v7 + 2);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v7[4] = *(_QWORD *)(a4 + 16);
  }
  return v7;
}

void sub_24BA1A60C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v4;
  CFTypeID v5;

  v4 = *a2;
  if (*a2 && (v5 = CFGetTypeID(*a2), v5 == CFBooleanGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2)
      CFRelease(*a2);
  }
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v4;
  CFTypeID v5;

  v4 = *a2;
  if (*a2 && (v5 = CFGetTypeID(*a2), v5 == CFNumberGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2)
      CFRelease(*a2);
  }
  return a1;
}

const void **ctu::cf::detail::TakeOwnershipProxy<__CFDictionary>::~TakeOwnershipProxy(const void **a1)
{
  const void **v2;
  const void *v3;
  const void *v4;
  const void *v6;

  v2 = (const void **)a1[1];
  if (*a1)
  {
    v3 = *v2;
    *v2 = *a1;
    v6 = v3;
  }
  else
  {
    v4 = *v2;
    *v2 = 0;
    v6 = v4;
  }
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&v6);
  return a1;
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

const void **eUICC::TwoPhaseProv::SessionData::getError@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(a2, this + 7);
}

const void **eUICC::TwoPhaseProv::SessionData::getBpp@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 4);
}

const void **eUICC::TwoPhaseProv::SessionData::getPbiReq@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 3);
}

const void **eUICC::TwoPhaseProv::SessionData::getEid@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this);
}

const void **eUICC::TwoPhaseProv::SessionData::getTransactionId@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 1);
}

const void **eUICC::TwoPhaseProv::SessionData::getEUICCSessionId@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 2);
}

const void **eUICC::TwoPhaseProv::SessionData::getPir@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 5);
}

const void **eUICC::TwoPhaseProv::SessionData::getPirSeqNum@<X0>(const void **this@<X0>, const void **a2@<X8>)
{
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a2, this + 6);
}

uint64_t eUICC::TwoPhaseProv::SessionData::processAlderResponse(uint64_t a1, CFDictionaryRef *a2)
{
  const void *Value;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v11;

  Value = CFDictionaryGetValue(*a2, CFSTR("Command"));
  v5 = CFGetTypeID(Value);
  if (v5 == CFStringGetTypeID())
  {
    if (CFEqual(Value, CFSTR("GetBppResp")))
    {
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v11, (const void **)a2);
      v6 = eUICC::TwoPhaseProv::SessionData::convertGbppToPbiBpp(a1, (CFDictionaryRef *)&v11);
      ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v11);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"CFGetTypeID( cmd) == CFStringGetTypeID()");
    return 27;
  }
  return v6;
}

void sub_24BA1A8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::convertGbppToPbiBpp(uint64_t a1, CFDictionaryRef *a2)
{
  const void *Value;
  const void *v5;
  CFTypeID v6;
  const __CFData *v7;
  const __CFAllocator *v8;
  CFDataRef Copy;
  const void *v10;
  uint64_t DataFromPbiReq;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const __CFData *v28;
  CFDataRef v29;
  const void *v30;
  const void *v31;

  Value = CFDictionaryGetValue(*a2, CFSTR("Command"));
  if (!Value)
  {
    gBBULogMaskGet();
    v19 = "cmd";
LABEL_13:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)v19);
    return 26;
  }
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"CFGetTypeID( cmd) == CFStringGetTypeID()");
    return 27;
  }
  if (!CFEqual(v5, CFSTR("GetBppResp")))
  {
    gBBULogMaskGet();
    v19 = "CFEqual(cmd, Alder::ValueCommandGetBppResp)";
    goto LABEL_13;
  }
  v7 = (const __CFData *)CFDictionaryGetValue(*a2, CFSTR("BPPMetaData"));
  if (!v7)
  {
    gBBULogMaskGet();
LABEL_12:
    v19 = "data";
    goto LABEL_13;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
  v10 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = Copy;
  v31 = v10;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
  if (!*(_QWORD *)(a1 + 24))
  {
    gBBULogMaskGet();
    v27 = "pbiReq.get()";
LABEL_16:
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)v27);
    return 17;
  }
  DataFromPbiReq = eUICC::TwoPhaseProv::SessionData::extractDataFromPbiReq(a1, (CFDataRef *)(a1 + 24));
  if (!(_DWORD)DataFromPbiReq)
  {
    v28 = (const __CFData *)CFDictionaryGetValue(*a2, CFSTR("BPP"));
    if (v28)
    {
      v29 = CFDataCreateCopy(v8, v28);
      v30 = *(const void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v29;
      v31 = v30;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v31);
      if (*(_QWORD *)(a1 + 32))
        return 0;
      gBBULogMaskGet();
      v27 = "bpp.get()";
      goto LABEL_16;
    }
    gBBULogMaskGet();
    goto LABEL_12;
  }
  v12 = DataFromPbiReq;
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kVinylResultSuccess == result");
  return v12;
}

double eUICC::TwoPhaseProv::SessionData::clearTransientData(eUICC::TwoPhaseProv::SessionData *this)
{
  double result;

  *((_QWORD *)this + 7) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  return result;
}

double eUICC::TwoPhaseProv::SessionData::clear(eUICC::TwoPhaseProv::SessionData *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPbiReq(uint64_t a1, CFDataRef *a2)
{
  const __CFAllocator *v4;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  CFDataRef v12;
  const void *v13;
  uint64_t (*v14)(uint64_t);
  CFDataRef v15;
  const void *v16;
  uint64_t (*v17)(uint64_t);
  CFDataRef v18;
  const void *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const UInt8 *v25;
  CFIndex v26;
  const UInt8 *v27;
  CFIndex v28;
  unint64_t v29[2];
  _BYTE v30[16];
  const UInt8 *v31;
  CFIndex v32;
  unint64_t v33;
  unint64_t v34[2];
  unint64_t v35[2];
  __CFData *MutableCopy;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39[2];
  const void *v40;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFDataGetLength(*a2);
  MutableCopy = CFDataCreateMutableCopy(v4, Length, *a2);
  v35[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v35[1] = CFDataGetLength(MutableCopy);
  if (DERDecodeSeqContentInit(v35, v39) || DERDecodeSeqNext(v39, &v37))
  {
    gBBULogMaskGet();
    v9 = "(DR_Success == ret)";
    goto LABEL_4;
  }
  if (v37 != 0xE00000000000002ELL)
  {
    gBBULogMaskGet();
    v9 = "TAG_PBI == dec.tag";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v38, 4u, (uint64_t)&eUICC::TwoPhaseProv::prepareBppInstallationReqSpec, (unint64_t)v34, 0x10uLL))
  {
    gBBULogMaskGet();
LABEL_9:
    v9 = "(ret == DR_Success)";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(v34, 5u, (uint64_t)&eUICC::TwoPhaseProv::serverSignedPayloadSpec, (unint64_t)v30, 0x30uLL)|| !v32)
  {
    gBBULogMaskGet();
    v9 = "(ret == DR_Success) && (ssp_decoded.eUICCSessionId.length > 0)";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v33, 2u, (uint64_t)&eUICC::TwoPhaseProv::smdpSignedMetadataSpec, (unint64_t)v29, 0x10uLL))
  {
    gBBULogMaskGet();
    goto LABEL_9;
  }
  if (!DERParseSequenceContent(v29, 5u, (uint64_t)&eUICC::TwoPhaseProv::smdpMetadataSpec, (unint64_t)&v25, 0x20uLL)&& v26&& v28)
  {
    v12 = CFDataCreate(v4, v31, v32);
    v13 = *(const void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v12;
    v40 = v13;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
    if (*(_QWORD *)(a1 + 16))
      v14 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    else
      v14 = 0;
    if (v14)
    {
      v15 = CFDataCreate(v4, v25, v26);
      v16 = *(const void **)a1;
      *(_QWORD *)a1 = v15;
      v40 = v16;
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
      if (*(_QWORD *)a1)
        v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      else
        v17 = 0;
      if (v17)
      {
        v18 = CFDataCreate(v4, v27, v28);
        v19 = *(const void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v18;
        v40 = v19;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
        if (*(_QWORD *)(a1 + 8))
          v20 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        else
          v20 = 0;
        if (v20)
        {
          v10 = 0;
          goto LABEL_5;
        }
        gBBULogMaskGet();
        v24 = "transactionId";
      }
      else
      {
        gBBULogMaskGet();
        v24 = "eid";
      }
    }
    else
    {
      gBBULogMaskGet();
      v24 = "euiccSessionId";
    }
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)v24);
    v10 = 17;
    goto LABEL_5;
  }
  gBBULogMaskGet();
  v9 = "(ret == DR_Success) && (sm_decoded.eid.length > 0) && (sm_decoded.transactionId.length > 0)";
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
  v10 = 27;
LABEL_5:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_24BA1AE8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v1 - 88));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPbiRsp(uint64_t a1, CFDataRef *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  BOOL v8;
  uint64_t (*v9)(uint64_t);
  BOOL v10;
  const void *v12;
  const void *v13;
  const void *v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v3 = eUICC::TwoPhaseProv::ExtractDataFromPbiRsp(a2, &v14, &v13);
  if ((_DWORD)v3)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v4, v5, v6, (char)"kVinylResultSuccess == ret");
  }
  else
  {
    v7 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    if (!v14)
      v7 = 0;
    if (v7)
      v8 = v14 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v3 = 0;
    }
    else
    {
      eUICC::TwoPhaseProv::SessionData::extractDataFromPir(a1, (CFDataRef *)&v14);
      v3 = 1;
    }
    v9 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
    if (!v13)
      v9 = 0;
    if (v9)
      v10 = v13 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::operator=((const void **)(a1 + 56), &v13);
      v3 = 1;
    }
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v12);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v13);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v14);
  return v3;
}

void sub_24BA1AFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v6 - 40));
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)(v6 - 32));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v6 - 24));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::extractDataFromPir(uint64_t a1, CFDataRef *a2)
{
  const __CFAllocator *v4;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  CFDataRef v12;
  const void *v13;
  CFDataRef v14;
  const void *v15;
  CFNumberRef v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char valuePtr;
  unint64_t v22[2];
  UInt8 *bytes;
  CFIndex length;
  _BYTE v25[8];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _BYTE v29[8];
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  const UInt8 *v33[2];
  unint64_t v34;
  unint64_t v35;
  unint64_t v36[4];
  __CFData *MutableCopy;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40[2];
  const void *v41;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFDataGetLength(*a2);
  MutableCopy = CFDataCreateMutableCopy(v4, v5, *a2);
  v22[0] = (unint64_t)CFDataGetMutableBytePtr(MutableCopy);
  v22[1] = CFDataGetLength(MutableCopy);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::operator=((const void **)(a1 + 40), (const void **)a2);
  if (DERDecodeSeqContentInit(v22, v40) || DERDecodeSeqNext(v40, &v38))
    goto LABEL_3;
  if (v38 != 0xA000000000000037)
  {
    gBBULogMaskGet();
    v9 = "dec.tag == TAG_PIR";
    goto LABEL_4;
  }
  if (DERParseSequenceContent(&v39, 3u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultSpec, (unint64_t)v36, 0x20uLL))goto LABEL_3;
  if (DERParseSequenceContent(v36, 4u, (uint64_t)&eUICC::TwoPhaseProv::profileInstallationResultDataSpec, (unint64_t)v33, 0x30uLL))goto LABEL_3;
  v12 = CFDataCreate(v4, v33[0], (CFIndex)v33[1]);
  v13 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v12;
  v41 = v13;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v41);
  if (DERParseSequenceContent(&v34, 6u, (uint64_t)&eUICC::TwoPhaseProv::notificationMetaDataSpec, (unint64_t)&bytes, 0x10uLL))goto LABEL_3;
  if (!length)
  {
    gBBULogMaskGet();
    v9 = "nm_decoded.seqNumber.length > 0";
    goto LABEL_4;
  }
  v14 = CFDataCreate(v4, bytes, length);
  v15 = *(const void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v14;
  v41 = v15;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v41);
  if (DERParseSequenceContent(&v35, 2u, (uint64_t)&eUICC::TwoPhaseProv::finalResultSpec, (unint64_t)v29, 0x20uLL))
  {
LABEL_3:
    gBBULogMaskGet();
    v9 = "(ret == DR_Success)";
  }
  else
  {
    if (v30 | v32)
    {
      if (v32)
      {
        if (DERParseSequenceContent(&v31, 3u, (uint64_t)&eUICC::TwoPhaseProv::errorResultSpec, (unint64_t)v25, 0x20uLL)|| !v26|| v28 != 1)
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v18, v19, v20, (char)"(ret == DR_Success) && (er_decoded.bppCommandId.length > 0) && (er_decoded.errorReason.length == 1)");
          goto LABEL_5;
        }
        valuePtr = *v27;
        v16 = CFNumberCreate(v4, kCFNumberCharType, &valuePtr);
        v17 = *(const void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v16;
        v41 = v17;
        ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v41);
      }
      v10 = 0;
      goto LABEL_6;
    }
    gBBULogMaskGet();
    v9 = "(fr_decoded.successResult.length > 0) || (fr_decoded.errorResult.length > 0)";
  }
LABEL_4:
  _BBULog(0, 0xFFFFFFFFLL, "VinylTwoPhaseProvSessionData", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)v9);
LABEL_5:
  v10 = 27;
LABEL_6:
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)&MutableCopy);
  return v10;
}

void sub_24BA1B304(_Unwind_Exception *a1)
{
  uint64_t v1;

  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v1 - 104));
  _Unwind_Resume(a1);
}

uint64_t eUICC::TwoPhaseProv::SessionData::isEidEligible(eUICC::TwoPhaseProv::SessionData *this, const Options *a2)
{
  std::locale::__imp *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  int v11;
  int v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::regex_traits<char> v23[2];
  std::__shared_weak_count *v24;
  void *__p[2];
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  std::string v30;
  void *v31[2];
  _QWORD v32[6];
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;

  std::string::basic_string[abi:ne180100]<0>(&v30, "89[0-9]{14}((8[012346789])|(5[12]))[0-9]{14}");
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v26 = 0;
  if (!*(_QWORD *)this)
  {
    v18 = 0;
    goto LABEL_40;
  }
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v4 = (std::locale::__imp *)qword_2579B9258;
  if (!qword_2579B9258)
  {
    BBUCapabilities::create_default_global(v31);
    std::shared_ptr<BBUCapabilities>::operator=[abi:ne180100]((uint64_t)&qword_2579B9258, (__int128 *)v31);
    v5 = (std::__shared_weak_count *)v31[1];
    if (v31[1])
    {
      v6 = (unint64_t *)((char *)v31[1] + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v4 = (std::locale::__imp *)qword_2579B9258;
  }
  v8 = (std::__shared_weak_count *)off_2579B9260;
  v23[0].__loc_.__locale_ = v4;
  v23[0].__ct_ = (const std::ctype<char> *)off_2579B9260;
  if (off_2579B9260)
  {
    v9 = (unint64_t *)((char *)off_2579B9260 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v11 = BBUCapabilities::supportsEuiccViaEOS(v4);
  v12 = v11;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if (!v12)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  if (v11)
LABEL_17:
    MEMORY[0x24BD2BF6C](&v30, "89[0-9]{14}9[34567][0-9]{14}");
LABEL_18:
  ctu::cf::assign();
  eUICC::TwoPhaseProv::StringifyDataBuffer((uint64_t *)&v27, 1);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  *(_OWORD *)__p = *(_OWORD *)v31;
  v26 = v32[0];
  v15 = *((unsigned __int8 *)a2 + 103);
  if ((v15 & 0x80u) != 0)
    v15 = *((_QWORD *)a2 + 11);
  if (v15)
    std::string::operator=(&v30, (const std::string *)((char *)a2 + 80));
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(v23, (uint64_t)&v30, 0);
  v16 = (char *)HIBYTE(v26);
  if (v26 >= 0)
    v17 = (char *)__p;
  else
    v17 = (char *)__p[0];
  if (v26 < 0)
    v16 = (char *)__p[1];
  v32[4] = 0;
  v32[5] = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  *(_OWORD *)v31 = 0u;
  memset(v32, 0, 25);
  v18 = std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(v17, &v16[(_QWORD)v17], (uint64_t)v31, (uint64_t)v23, 0);
  if (v31[0])
  {
    v31[1] = v31[0];
    operator delete(v31[0]);
  }
  v19 = v24;
  if (v24)
  {
    v20 = (unint64_t *)&v24->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  std::locale::~locale(&v23[0].__loc_);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
LABEL_40:
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  return v18;
}

void sub_24BA1B5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  if (a22 < 0)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(const void **a1, const void **a2)
{
  const void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    CFRetain(v3);
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::operator=(const void **a1, const void **a2)
{
  const void *v3;
  const void *v5;

  if (a1 != a2)
  {
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::SharedRef(&v5, a2);
    v3 = *a1;
    *a1 = v5;
    v5 = v3;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&v5);
  }
  return a1;
}

std::regex_traits<char> *std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(std::regex_traits<char> *a1, uint64_t a2, int a3)
{
  std::regex_traits<char> *v6;
  uint64_t v7;
  std::basic_regex<char> *v8;

  v6 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v6[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v6[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[1].__col_ + 4) = 0u;
  HIDWORD(v6[2].__ct_) = 0;
  v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0)
    v8 = (std::basic_regex<char> *)a2;
  else
    v8 = *(std::basic_regex<char> **)a2;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a2 + 8);
  if ((std::basic_regex<char> *)((char *)v8 + v7) != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v6, v8, (std::basic_regex<char> *)((char *)v8 + v7)))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  return a1;
}

void sub_24BA1B77C(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x24BD2C128]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x24BEDB4B0]);
  return this;
}

void sub_24BA1B7E0(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  v6 = operator new(8uLL);
  *v6 = &unk_251CCA6C0;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>((_QWORD *)(a1 + 40), (uint64_t)v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }
  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32)
LABEL_14:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
    }
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (char *)a3);
  }
}

void sub_24BA1B928(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1B97C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;

  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v7, a2);
  v3 = (std::__shared_weak_count *)a1[1];
  v4 = v7;
  *(_QWORD *)&v7 = *a1;
  *((_QWORD *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  std::__node<char> *v8;
  std::__owns_one_state<char> *v9;
  std::__node<char> *first;
  std::__owns_one_state<char> *v11;
  unsigned __int8 *v12;
  std::__node<char> *v13;
  std::__owns_one_state<char> *v14;
  std::__node<char> *v15;

  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == a2)
  {
    v8 = (std::__node<char> *)operator new(0x10uLL);
    v9 = a1->__end_;
    first = v9->__first_;
    v8[1].__vftable = (std::__node<char>_vtbl *)first;
    v9->__first_ = v8;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v7 == (unsigned __int8 *)a3)
    return a3;
  while (*v7 == 124)
  {
    v11 = a1->__end_;
    v12 = v7 + 1;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(a1, v7 + 1, a3);
    if (v12 == v7)
    {
      v13 = (std::__node<char> *)operator new(0x10uLL);
      v14 = a1->__end_;
      v15 = v14->__first_;
      v13[1].__vftable = (std::__node<char>_vtbl *)v15;
      v14->__first_ = v13;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v11);
    if (v7 == (unsigned __int8 *)a3)
      return a3;
  }
  return (char *)v7;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  char *v4;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return (char *)a2;
  v4 = (char *)a3;
  if (*a2 == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &unk_251CCA838;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      v10 = v3;
      v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (char *)v3, v4);
    }
    while (v10 != v3);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v11 = operator new(0x18uLL);
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *v11 = &unk_251CCA880;
      v11[1] = v14;
      *((_BYTE *)v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__owns_one_state<char> *v9;
  unsigned __int8 *v10;

  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>((uint64_t)a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124)
      return (std::basic_regex<char> *)v8;
    v9 = a1->__end_;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>((uint64_t)a1, (std::basic_regex<char> *)(v8 + 1), a3);
    if (v8 + 1 == v10)
      goto LABEL_9;
    v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__node<char> *first;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *v14;
  std::__node<char> *v15;

  end = a1->__end_;
  v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new(0x10uLL);
    first = end->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>((uint64_t)a1, __s, v8);
  }
  if (v8 != a3)
    ++v8;
  while (v8 != a3)
  {
    v11 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v11)
      v12 = v11;
    else
      v12 = a3;
    v13 = a1->__end_;
    if (v12 == v8)
    {
      v14 = (std::__node<char> *)operator new(0x10uLL);
      v15 = v13->__first_;
      v14[1].__vftable = (std::__node<char>_vtbl *)v15;
      v13->__first_ = v14;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>((uint64_t)a1, v8, v12);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v13);
    if (v12 == a3)
      v8 = v12;
    else
      v8 = v12 + 1;
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *first;
  std::basic_regex<char> *v11;
  std::basic_regex<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *v14;
  std::__node<char> *v15;

  end = a1->__end_;
  v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new(0x10uLL);
    first = end->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
  }
  if (v8 != a3)
    v8 = (std::basic_regex<char> *)((char *)v8 + 1);
  while (v8 != a3)
  {
    v11 = (std::basic_regex<char> *)memchr(v8, 10, (char *)a3 - (char *)v8);
    if (v11)
      v12 = v11;
    else
      v12 = a3;
    v13 = a1->__end_;
    if (v12 == v8)
    {
      v14 = (std::__node<char> *)operator new(0x10uLL);
      v15 = v13->__first_;
      v14[1].__vftable = (std::__node<char>_vtbl *)v15;
      v13->__first_ = v14;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, v8, v12);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v13);
    if (v12 == a3)
      v8 = v12;
    else
      v8 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 1);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1BF64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

_QWORD *std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = &unk_251CCA718;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_24BA1BFDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  operator delete(this);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_alternative<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v5;

  do
  {
    v5 = a2;
    a2 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(a1, (char *)a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  std::__node<char> *v6;
  std::__node<char> *first;
  std::__node<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;

  v6 = (std::__node<char> *)operator new(0x18uLL);
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&unk_251CCAD00;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  v8 = (std::__node<char> *)operator new(0x10uLL);
  v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  v10 = (std::__node<char> *)operator new(0x10uLL);
  v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&unk_251CCAD48;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v9;

  result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    marked_count = a1->__marked_count_;
    v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, (unsigned __int8 *)a2, a3);
    result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  char *v3;
  int v6;
  int v7;
  char *v8;
  unsigned int v9;
  std::__node<char> *v10;
  BOOL v11;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  char *v14;
  int v16;
  BOOL v17;
  unsigned int marked_count;
  std::basic_regex<char> v19;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        v7 = a2[2];
        if (v7 == 33)
        {
          std::regex_traits<char>::regex_traits(&v19.__traits_);
          memset(&v19.__flags_, 0, 40);
          v19.__flags_ = this->__flags_;
          v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v19, v3 + 3, a3);
          marked_count = v19.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v19, 1, this->__marked_count_);
          this->__marked_count_ += marked_count;
          if (v8 == a3 || *v8 != 41)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          goto LABEL_27;
        }
        if (v7 == 61)
        {
          std::regex_traits<char>::regex_traits(&v19.__traits_);
          memset(&v19.__flags_, 0, 40);
          v19.__flags_ = this->__flags_;
          v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v19, v3 + 3, a3);
          v9 = v19.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v19, 0, this->__marked_count_);
          this->__marked_count_ += v9;
          if (v8 == a3 || *v8 != 41)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_27:
          v3 = v8 + 1;
          std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&v19.__start_);
          std::locale::~locale(&v19.__traits_.__loc_);
          return v3;
        }
      }
      return v3;
    }
    v10 = (std::__node<char> *)operator new(0x18uLL);
    v11 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
LABEL_17:
    v10->__vftable = (std::__node<char>_vtbl *)(v14 + 16);
    v10[1].__vftable = (std::__node<char>_vtbl *)first;
    LOBYTE(v10[2].__vftable) = v11;
    end->__first_ = v10;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94)
      return v3;
    v10 = (std::__node<char> *)operator new(0x18uLL);
    v11 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
    goto LABEL_17;
  }
  if (a2 + 1 != a3)
  {
    v16 = a2[1];
    if (v16 == 66)
    {
      v17 = 1;
    }
    else
    {
      if (v16 != 98)
        return v3;
      v17 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v17);
    v3 += 2;
  }
  return v3;
}

void sub_24BA1C580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v3;
  int v6;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  _BYTE *v11;
  char *v12;
  unsigned int marked_count;
  char *v14;
  char *v15;

  v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 == 40)
      {
        v11 = a2 + 1;
        if (a2 + 1 != (unsigned __int8 *)a3)
        {
          if (a2 + 2 != (unsigned __int8 *)a3 && *v11 == 63 && a2[2] == 58)
          {
            ++this->__open_count_;
            v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
            if (v12 != a3 && *v12 == 41)
            {
              --this->__open_count_;
              return (unsigned __int8 *)(v12 + 1);
            }
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
            marked_count = this->__marked_count_;
            ++this->__open_count_;
            v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v11, a3);
            if (v14 != a3)
            {
              v15 = v14;
              if (*v14 == 41)
              {
                std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
                --this->__open_count_;
                return (unsigned __int8 *)(v15 + 1);
              }
            }
          }
        }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if (v6 == 46)
      {
        v7 = (std::__node<char> *)operator new(0x10uLL);
        end = this->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_251CCA958;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        return ++v3;
      }
      if ((v6 - 42) >= 2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
LABEL_28:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    }
    if (v6 > 91)
    {
      if (v6 == 92)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(this, a2, (unsigned __int8 *)a3);
      if (v6 == 123)
        goto LABEL_28;
    }
    else
    {
      if (v6 == 91)
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, (char *)a2, a3);
      if (v6 == 63)
        goto LABEL_28;
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  size_t v18;
  BOOL v19;
  BOOL v20;
  std::__owns_one_state<char> *v21;
  BOOL v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  size_t __max;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    v13 = a2;
    if (v12 != 123)
      return v13;
    v15 = a2 + 1;
    v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(a1, a2 + 1, a3, (int *)&__max);
    if (v15 != v16)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = (int)__max;
LABEL_33:
              v21 = __s;
              v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = (int)__max;
LABEL_45:
            v21 = __s;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(v10, v23, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    v14 = 0;
    goto LABEL_36;
  }
  v13 = a2;
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    v14 = 1;
    goto LABEL_36;
  }
  return v13;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  char *v4;
  std::__node<char> *first;

  v4 = (char *)operator new(0x30uLL);
  first = this->__end_->__first_;
  *(_QWORD *)v4 = &unk_251CCA8C8;
  *((_QWORD *)v4 + 1) = first;
  std::locale::locale((std::locale *)v4 + 2, &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  v4[40] = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  std::__node<char> *v8;

  v8 = (std::__node<char> *)operator new(0x58uLL);
  std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100]((uint64_t)v8, (uint64_t)a2, a3, (uint64_t)this->__end_->__first_, a4);
  this->__end_->__first_ = v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_24BA1CB70(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1CBBC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA8C8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA8C8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = &unk_251CCA910;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCA910;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA910;
  v2 = a1 + 2;
  std::shared_ptr<eUICC::ValidatePerso::Response>::~shared_ptr[abi:ne180100]((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  std::vector<std::csub_match>::size_type v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  char v8;
  std::sub_match<const char *> *begin;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  std::sub_match<const char *> *v15;
  uint64_t v16;
  std::vector<std::csub_match> __p;
  std::vector<std::csub_match>::value_type v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  std::vector<std::csub_match>::value_type v22;
  char v23;
  uint64_t v24;

  v19 = 0;
  v20 = 0;
  v21 = 0;
  memset(&v22, 0, 17);
  v23 = 0;
  v24 = 0;
  memset(&__p, 0, sizeof(__p));
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v5 = *(_QWORD *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  v19 = v5;
  v20 = v5;
  v21 = 0;
  v22 = v18;
  v24 = v5;
  v23 = 1;
  v6 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v7 = v6 == *(const char **)(a2 + 8);
  else
    v7 = 0;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a2 + 32);
  v14 = 1;
  do
  {
    v15 = &begin[v14];
    v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)v16 = v15->std::pair<const char *, const char *>;
    *(_BYTE *)(v16 + 16) = v15->matched;
    v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_24BA1D218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  std::match_results<const char *>::value_type *p_unmatched;

  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos)
    this->__position_start_ = __f;
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  _OWORD *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  const char *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  uint64_t *v34;
  _BYTE v37[56];
  void *__p[2];
  _QWORD v39[4];
  std::vector<std::csub_match>::value_type __x;
  _OWORD *v41;
  _OWORD *v42;
  unint64_t v43;

  v41 = 0;
  v42 = 0;
  v43 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v37[32])
    {
      *(_QWORD *)&v37[40] = *(_QWORD *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }
    v34 = a4;
    v11 = v42;
    *((_DWORD *)v42 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v42 - 40), *(unsigned int *)(a1 + 32));
    v12 = v42;
    *((_QWORD *)v42 - 2) = v6;
    *((_DWORD *)v12 - 2) = a5;
    *((_BYTE *)v12 - 4) = a6;
    v13 = 1;
    while (2)
    {
      if ((v13 & 0xFFF) == 0 && (int)(v13 >> 12) >= (int)a3 - (int)a2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v15 = v12 - 1;
      v14 = *((_QWORD *)v12 - 2);
      v16 = v12 - 6;
      if (v14)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v14 + 16))(v14, v12 - 6);
      switch(*(_DWORD *)v16)
      {
        case 0xFFFFFC18:
          v17 = (const char *)*((_QWORD *)v12 - 10);
          if ((a5 & 0x20) != 0 && v17 == a2 || (a5 & 0x1000) != 0 && v17 != a3)
            goto LABEL_16;
          v25 = *v34;
          *(_QWORD *)v25 = a2;
          *(_QWORD *)(v25 + 8) = v17;
          *(_BYTE *)(v25 + 16) = 1;
          v26 = *((_QWORD *)v12 - 8);
          v27 = *((_QWORD *)v12 - 7) - v26;
          if (v27)
          {
            v28 = 0xAAAAAAAAAAAAAAABLL * (v27 >> 3);
            v29 = (_BYTE *)(v26 + 16);
            v30 = 1;
            do
            {
              v31 = v25 + 24 * v30;
              *(_OWORD *)v31 = *((_OWORD *)v29 - 1);
              v32 = *v29;
              v29 += 24;
              *(_BYTE *)(v31 + 16) = v32;
            }
            while (v28 > v30++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v18 = v42 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v43, (_QWORD *)v42 - 12);
          v42 = v18;
          goto LABEL_23;
        case 0xFFFFFC20:
          v19 = *(v12 - 5);
          *(_OWORD *)v37 = *v16;
          *(_OWORD *)&v37[16] = v19;
          memset(&v37[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v37[32], *((__int128 **)v12 - 8), *((__int128 **)v12 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v12 - 7) - *((_QWORD *)v12 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v12 - 5), *((__int128 **)v12 - 4), (uint64_t)(*((_QWORD *)v12 - 4) - *((_QWORD *)v12 - 5)) >> 4);
          v20 = *v15;
          *(_QWORD *)((char *)&v39[1] + 5) = *(_QWORD *)((char *)v12 - 11);
          v39[1] = v20;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v15 + 24))(*v15, 1, v12 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v39[1] + 24))(v39[1], 0, v37);
          v21 = v42;
          if ((unint64_t)v42 >= v43)
          {
            v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v22 = *(_OWORD *)&v37[16];
            *v42 = *(_OWORD *)v37;
            v21[1] = v22;
            *((_QWORD *)v21 + 4) = 0;
            *((_QWORD *)v21 + 5) = 0;
            *((_QWORD *)v21 + 6) = 0;
            *((_QWORD *)v21 + 7) = 0;
            v21[2] = *(_OWORD *)&v37[32];
            *((_QWORD *)v21 + 6) = *(_QWORD *)&v37[48];
            memset(&v37[32], 0, 24);
            *((_QWORD *)v21 + 8) = 0;
            *((_QWORD *)v21 + 9) = 0;
            *(_OWORD *)((char *)v21 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v21 + 9) = v39[0];
            __p[0] = 0;
            __p[1] = 0;
            v39[0] = 0;
            v23 = v39[1];
            *(_QWORD *)((char *)v21 + 85) = *(_QWORD *)((char *)&v39[1] + 5);
            *((_QWORD *)v21 + 10) = v23;
            v42 = v21 + 6;
          }
          if (*(_QWORD *)&v37[32])
          {
            *(_QWORD *)&v37[40] = *(_QWORD *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          v12 = v42;
          ++v13;
          if (v41 != v42)
            continue;
          v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(_QWORD *)v37 = &v41;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
  return v6;
}

void sub_24BA1D650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  std::vector<std::csub_match>::pointer v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::pair<const char *, const char *> v14;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::size_type v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    end = this->__end_;
    v16 = end - begin;
    if (v16 >= __n)
      v17 = __n;
    else
      v17 = end - begin;
    if (v17)
    {
      v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      v19 = &end[__n - v16];
      v20 = 24 * __n - 24 * v16;
      do
      {
        v21 = __u->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    v11 = this->__end_;
    v12 = &v11[__n];
    v13 = 24 * __n;
    do
    {
      v14 = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v11->matched = *(_QWORD *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3;
  BOOL v4;
  std::vector<std::csub_match>::size_type v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  v4 = __sz >= v3;
  v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1D994(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1D9E0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer(v16);
  return v14;
}

void sub_24BA1DB2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(96 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    do
    {
      v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(_QWORD *)(v7 - 56) = 0;
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 64) = 0;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(_QWORD *)(v7 - 48) = *(_QWORD *)(a3 - 48);
      *(_QWORD *)(a3 - 64) = 0;
      *(_QWORD *)(a3 - 56) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(_QWORD *)(v7 - 24) = *(_QWORD *)(a3 - 24);
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v9 = *(_QWORD *)(a3 - 16);
      *(_QWORD *)(v7 - 11) = *(_QWORD *)(a3 - 11);
      *(_QWORD *)(v7 - 16) = v9;
      v7 = *((_QWORD *)&v15 + 1) - 96;
      *((_QWORD *)&v15 + 1) -= 96;
      a3 -= 96;
    }
    while (a3 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD **)(a1[2] + 8);
  v2 = *(_QWORD **)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<std::__state<char>>::destroy[abi:ne180100](v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void std::allocator<std::__state<char>>::destroy[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
}

void **std::__split_buffer<std::__state<char>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::__state<char>>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::__state<char>>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 96;
    std::allocator<std::__state<char>>::destroy[abi:ne180100](v4, (_QWORD *)(i - 96));
  }
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::__compressed_pair<std::csub_match *> *p_end_cap;
  std::sub_match<const char *> *v7;
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  std::sub_match<const char *> *v15;
  std::vector<std::csub_match>::size_type v16;
  std::pair<const char *, const char *> v17;
  std::sub_match<const char *> *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> *v21;
  std::pair<const char *, const char *> v22;
  std::sub_match<const char *> *v23;
  std::sub_match<const char *> *end;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v26;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      v15 = &v9[__n];
      v16 = 24 * __n;
      do
      {
        v17 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&v9->matched = *(_QWORD *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    else
      v14 = 0;
    v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    v19 = &v18[__n];
    v20 = 24 * __n;
    v21 = v18;
    do
    {
      v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      *v21 = v22;
      v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v26 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v18[-1].matched = *(_QWORD *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
      operator delete(end);
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::__compressed_pair<std::pair<unsigned long, const char *> *, std::allocator<std::pair<unsigned long, const char *>>> *p_end_cap;
  std::pair<unsigned long, const char *> *v5;
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  std::pair<unsigned long, const char *> *v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    v8 = (char *)v7 - (char *)this->__begin_;
    v9 = __n + (v8 >> 4);
    if (v9 >> 60)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    else
      v13 = 0;
    v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    v16 = &v14[__n];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_24BA1E128(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_24BA1E198(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<std::__wrap_iter<char const*>>(a1, a2 + 1, a3);
  if (v5 == result)
  {
    result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)(a2 + 1), (std::basic_regex<char> *)a3, 0);
      if (v5 == result)
        return a2;
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v5;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  uint64_t *v7;
  char *v8;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3)
      goto LABEL_20;
    v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3)
      goto LABEL_20;
    do
    {
      v8 = v5;
      v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(a1, v5, a3, v7);
    }
    while (v8 != v5);
    if (v8 == a3)
      goto LABEL_20;
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93)
LABEL_20:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  std::__node<char> *v2;
  unsigned int v3;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v2 = (std::__node<char> *)operator new(0x18uLL);
    v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    end = this->__end_;
    first = end->__first_;
    v2->__vftable = (std::__node<char>_vtbl *)&unk_251CCAB98;
    v2[1].__vftable = (std::__node<char>_vtbl *)first;
    LODWORD(v2[2].__vftable) = v3;
    end->__first_ = v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  std::__node<char> *v4;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v4 = (std::__node<char> *)operator new(0x18uLL);
    end = this->__end_;
    first = end->__first_;
    v4->__vftable = (std::__node<char>_vtbl *)&unk_251CCABE0;
    v4[1].__vftable = (std::__node<char>_vtbl *)first;
    LODWORD(v4[2].__vftable) = a2;
    end->__first_ = v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1E520(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;
  BOOL v5;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = (char)*a2;
    v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1E664(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v4;
  unsigned int v5;
  int v6;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = *a2;
    v5 = v4 - 48;
    if (v4 == 48)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return ++v3;
    }
    if ((v4 - 49) > 8)
      return v3;
    if (++v3 == a3)
    {
      v3 = a3;
    }
    else
    {
      while (1)
      {
        v6 = *v3;
        if ((v6 - 48) > 9)
          break;
        if (v5 >= 0x19999999)
          goto LABEL_16;
        ++v3;
        v5 = v6 + 10 * v5 - 48;
        if (v3 == a3)
        {
          v3 = a3;
          break;
        }
      }
      if (!v5)
        goto LABEL_16;
    }
    if (v5 <= a1->__marked_count_)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
      return v3;
    }
LABEL_16:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v3;
  int v4;
  BOOL v5;
  BOOL v6;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  int v8;
  BOOL v9;
  std::__bracket_expression<char, std::regex_traits<char>> *v10;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100)
      return v3;
    v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      v6 = 1;
      goto LABEL_12;
    case 'S':
      v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      v5 = 1;
LABEL_15:
      v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4)
{
  std::basic_regex<char> *v4;
  int locale_low;
  char v6;
  std::string *v7;
  std::basic_regex<char>::value_type locale;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  std::string::value_type v16;
  unsigned int v17;
  std::string::value_type v18;

  v4 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    if (locale_low > 109)
    {
      v6 = 0;
      switch(LOBYTE(this->__traits_.__loc_.__locale_))
      {
        case 'n':
          if (a4)
          {
            v7 = a4;
            locale = 10;
            goto LABEL_52;
          }
          locale = 10;
          goto LABEL_61;
        case 'r':
          if (a4)
          {
            v7 = a4;
            locale = 13;
            goto LABEL_52;
          }
          locale = 13;
          goto LABEL_61;
        case 't':
          if (a4)
          {
            v7 = a4;
            locale = 9;
            goto LABEL_52;
          }
          locale = 9;
          goto LABEL_61;
        case 'u':
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
            goto LABEL_66;
          v9 = BYTE1(this->__traits_.__loc_.__locale_);
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6)
            goto LABEL_66;
          v4 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2);
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
            goto LABEL_66;
          v10 = LOBYTE(v4->__traits_.__loc_.__locale_);
          v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
            goto LABEL_24;
          v10 |= 0x20u;
          if ((v10 - 97) >= 6)
            goto LABEL_66;
          v11 = -87;
LABEL_24:
          v6 = 16 * (v11 + v10);
LABEL_25:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3)
            goto LABEL_66;
          v12 = BYTE1(v4->__traits_.__loc_.__locale_);
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_30;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6)
            goto LABEL_66;
          v13 = -87;
LABEL_30:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3)
            goto LABEL_66;
          v14 = BYTE2(v4->__traits_.__loc_.__locale_);
          v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38)
            goto LABEL_35;
          v14 |= 0x20u;
          if ((v14 - 97) >= 6)
            goto LABEL_66;
          v15 = -87;
LABEL_35:
          v16 = v15 + v14 + 16 * (v13 + v12 + v6);
          if (a4)
            std::string::operator=(a4, v16);
          else
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
          return (std::basic_regex<char> *)((char *)v4 + 3);
        case 'v':
          if (a4)
          {
            v7 = a4;
            locale = 11;
            goto LABEL_52;
          }
          locale = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_47;
      }
      goto LABEL_61;
    }
    if (locale_low == 48)
    {
      if (a4)
      {
        v7 = a4;
        locale = 0;
        goto LABEL_52;
      }
      locale = 0;
LABEL_61:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, locale);
      return (std::basic_regex<char> *)((char *)v4 + 1);
    }
    if (locale_low != 99)
    {
      if (locale_low == 102)
      {
        if (a4)
        {
          v7 = a4;
          locale = 12;
LABEL_52:
          std::string::operator=(v7, locale);
          return (std::basic_regex<char> *)((char *)v4 + 1);
        }
        locale = 12;
        goto LABEL_61;
      }
LABEL_47:
      if (LOBYTE(this->__traits_.__loc_.__locale_) != 95
        && ((locale_low & 0x80) != 0
         || (a1->__traits_.__ct_->__tab_[LOBYTE(this->__traits_.__loc_.__locale_)] & 0x500) == 0))
      {
        locale = (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_;
        if (a4)
        {
          v7 = a4;
          goto LABEL_52;
        }
        goto LABEL_61;
      }
LABEL_66:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_66;
    if (SBYTE1(this->__traits_.__loc_.__locale_) < 65)
      goto LABEL_66;
    v17 = BYTE1(this->__traits_.__loc_.__locale_);
    if (v17 >= 0x5B && (v17 - 97) > 0x19u)
      goto LABEL_66;
    v18 = v17 & 0x1F;
    if (a4)
      std::string::operator=(a4, v18);
    else
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v18);
    return (std::basic_regex<char> *)((char *)v4 + 2);
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  char *v8;
  std::__node<char> *first;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100]((uint64_t)v8, (uint64_t)this, v2, (uint64_t)this->__end_->__first_);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &unk_251CCA9E8;
    *((_QWORD *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_251CCAA30;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_24BA1EBA4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA1EBF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  char *v11;

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_251CCAB08;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = &unk_251CCA9A0;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_24BA1ED3C(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA9A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA9A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA9E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCA9E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCAA78;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCAA78;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCAAC0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CCAAC0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  std::__bracket_expression<char, std::regex_traits<char>> *v4;

  v4 = (std::__bracket_expression<char, std::regex_traits<char>> *)operator new(0xB0uLL);
  std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v4, (uint64_t)this, (uint64_t)this->__end_->__first_, __negate, this->__flags_ & 1, (this->__flags_ & 8) != 0);
  this->__end_->__first_ = v4;
  this->__end_ = v4;
  return v4;
}

void sub_24BA1F4E0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  BOOL v13;
  std::locale v15;
  std::string v16;

  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v15, v11);
  std::locale::name(&v16, &v15);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    v13 = v16.__r_.__value_.__l.__size_ != 1 || *v16.__r_.__value_.__l.__data_ != 67;
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  else
  {
    v13 = SHIBYTE(v16.__r_.__value_.__r.__words[2]) != 1 || v16.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v15);
  *(_BYTE *)(a1 + 171) = v13;
  return a1;
}

void sub_24BA1F830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  void (__cdecl ***v10)(std::__owns_one_state<char> *__hidden);
  std::locale *v11;
  void **v12;
  void (__cdecl **v14)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v15)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v16)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v17)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v14 = v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v15 = v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))*v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  v17 = v10[1];
  if (v17)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v17 + 1))(v17);
  _Unwind_Resume(a1);
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v6;

  v6 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v6 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  operator delete(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char *current;
  char *last;
  signed __int8 v6;
  signed __int8 v7;
  std::regex_traits<char> *p_traits;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v10;
  uint64_t v11;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  const void *p_p;
  uint64_t v21;
  BOOL v22;
  int v23;
  size_t size;
  std::vector<std::pair<std::string, std::string>>::pointer v25;
  size_t v26;
  int v27;
  _BOOL4 v28;
  int v29;
  size_t v30;
  std::string *data;
  size_t v32;
  int v33;
  BOOL v34;
  int v35;
  _BOOL4 negate;
  uint64_t v37;
  size_t v38;
  unsigned __int8 v39;
  std::vector<char>::pointer v40;
  unint64_t v41;
  int v42;
  std::regex_traits<char>::char_class_type v43;
  int v44;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v46;
  char *v47;
  std::vector<std::pair<std::string, std::string>>::pointer v48;
  std::vector<std::pair<std::string, std::string>>::pointer v49;
  int64_t v50;
  uint64_t v51;
  unint64_t v52;
  size_t v53;
  const void *v54;
  uint64_t v55;
  BOOL v56;
  int v57;
  size_t v58;
  std::vector<std::pair<std::string, std::string>>::pointer v59;
  size_t v60;
  int v61;
  _BOOL4 v62;
  int v63;
  size_t v64;
  std::string *v65;
  size_t v66;
  int v67;
  BOOL v68;
  std::vector<std::string>::pointer v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  size_t v75;
  size_t v76;
  uint64_t v77;
  BOOL v78;
  std::string *v79;
  std::string::size_type v80;
  int v81;
  std::string *v82;
  void **v83;
  uint64_t v84;
  unint64_t v85;
  int v86;
  std::regex_traits<char>::char_class_type v87;
  int v88;
  std::vector<std::string>::pointer v89;
  uint64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  size_t v94;
  void *v95;
  size_t v96;
  uint64_t v97;
  BOOL v98;
  std::string *v99;
  std::string::size_type v100;
  int v101;
  std::string *v102;
  void **v103;
  uint64_t v104;
  int v105;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v108;
  std::regex_traits<char>::char_class_type neg_mask;
  int v110;
  std::__node<char> *first;
  int v112;
  char v113;
  char v114;
  uint64_t v115;
  _BOOL4 v116;
  _BOOL4 v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *__p;
  size_t v123;
  char v124;
  unsigned __int8 v125;
  unsigned __int8 v126;
  uint64_t v127;

  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v37 = 0;
    negate = this->__negate_;
    goto LABEL_221;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_58;
  v6 = *current;
  v125 = *current;
  v7 = current[1];
  v126 = v7;
  if (this->__icase_)
  {
    v125 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    v126 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124)
      goto LABEL_8;
LABEL_58:
    negate = 0;
    v37 = 1;
    goto LABEL_59;
  }
  v38 = v123;
  operator delete(__p);
  if (!v38)
    goto LABEL_58;
LABEL_8:
  begin = this->__digraphs_.__begin_;
  v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1)
      v11 = 1;
    p_second = &begin->second;
    do
    {
      if (v125 == *(p_second - 1) && v126 == *p_second)
        goto LABEL_218;
      p_second += 2;
      --v11;
    }
    while (v11);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127);
    v14 = this->__ranges_.__begin_;
    v15 = v124;
    v16 = (char *)this->__ranges_.__end_ - (char *)v14;
    if (v16)
    {
      v17 = 0;
      v18 = v16 / 48;
      v113 = v124;
      if (v124 >= 0)
        v19 = v124;
      else
        v19 = v123;
      if (v124 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      if (v18 <= 1)
        v21 = 1;
      else
        v21 = v16 / 48;
      v22 = 1;
      while (1)
      {
        v23 = SHIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        if (v23 >= 0)
          size = HIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        else
          size = v14->first.__r_.__value_.__l.__size_;
        if (v23 >= 0)
          v25 = v14;
        else
          v25 = (std::vector<std::pair<std::string, std::string>>::pointer)v14->first.__r_.__value_.__r.__words[0];
        if (size >= v19)
          v26 = v19;
        else
          v26 = size;
        v27 = memcmp(p_p, v25, v26);
        v28 = v19 >= size;
        if (v27)
          v28 = v27 >= 0;
        if (v28)
        {
          v29 = SHIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          if (v29 >= 0)
            v30 = HIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          else
            v30 = v14->second.__r_.__value_.__l.__size_;
          if (v29 >= 0)
            data = &v14->second;
          else
            data = (std::string *)v14->second.__r_.__value_.__l.__data_;
          if (v19 >= v30)
            v32 = v30;
          else
            v32 = v19;
          v33 = memcmp(data, p_p, v32);
          v34 = v30 >= v19;
          if (v33)
            v34 = v33 >= 0;
          if (v34)
            break;
        }
        v22 = ++v17 < v18;
        ++v14;
        if (v21 == v17)
        {
          v35 = 0;
          negate = 0;
          goto LABEL_162;
        }
      }
      negate = 1;
      v35 = 5;
LABEL_162:
      p_traits = &this->__traits_;
      v15 = v113;
    }
    else
    {
      v22 = 0;
      v35 = 0;
      negate = 0;
    }
    if (v15 < 0)
      operator delete(__p);
    if (v22)
      goto LABEL_195;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_200;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)p_traits, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  v89 = this->__equivalences_.__begin_;
  v90 = v124;
  v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (v91)
  {
    v92 = 0;
    v93 = v91 / 24;
    v95 = __p;
    v94 = v123;
    if (v124 >= 0)
      v96 = v124;
    else
      v96 = v123;
    if (v93 <= 1)
      v97 = 1;
    else
      v97 = v91 / 24;
    v98 = 1;
    while (1)
    {
      v99 = &v89[v92];
      v100 = HIBYTE(v99->__r_.__value_.__r.__words[2]);
      v101 = (char)v100;
      if ((v100 & 0x80u) != 0)
        v100 = v99->__r_.__value_.__l.__size_;
      if (v96 == v100)
      {
        if (v101 >= 0)
          v102 = &v89[v92];
        else
          v102 = (std::string *)v99->__r_.__value_.__r.__words[0];
        if ((v90 & 0x80) == 0)
        {
          if ((_DWORD)v90)
          {
            v103 = &__p;
            v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != v102->__r_.__value_.__s.__data_[0])
                goto LABEL_188;
              v103 = (void **)((char *)v103 + 1);
              v102 = (std::string *)((char *)v102 + 1);
              --v104;
            }
            while (v104);
            negate = 1;
            v35 = 5;
            goto LABEL_192;
          }
          negate = 1;
          if (v98)
            goto LABEL_220;
LABEL_200:
          if ((char)v125 < 0)
          {
            neg_mask = this->__neg_mask_;
            goto LABEL_213;
          }
          mask = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          v108 = tab[v125];
          if ((v108 & mask) == 0 && (v125 != 95 || (mask & 0x80) == 0)
            || (char)v126 < 0
            || (tab[v126] & mask) == 0 && ((mask & 0x80) == 0 || v126 != 95))
          {
            neg_mask = this->__neg_mask_;
            if ((v108 & neg_mask) != 0 || v125 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_217:
              v110 = negate;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v126] & neg_mask) != 0)
                goto LABEL_217;
              v110 = 1;
              if (v126 == 95 && (neg_mask & 0x80) != 0)
                goto LABEL_217;
LABEL_219:
              negate = v110;
LABEL_220:
              v37 = 2;
              goto LABEL_221;
            }
          }
LABEL_218:
          v110 = 1;
          goto LABEL_219;
        }
        v118 = v93;
        v121 = v90;
        v105 = memcmp(v95, v102, v94);
        v93 = v118;
        v90 = v121;
        if (!v105)
          break;
      }
LABEL_188:
      v98 = ++v92 < v93;
      if (v92 == v97)
        goto LABEL_191;
    }
    v35 = 5;
    negate = 1;
    goto LABEL_193;
  }
  v98 = 0;
LABEL_191:
  v35 = 0;
LABEL_192:
  if ((v90 & 0x80) != 0)
LABEL_193:
    operator delete(__p);
  if (!v98)
    goto LABEL_200;
LABEL_195:
  if (v35)
    goto LABEL_220;
  v37 = 2;
LABEL_59:
  v39 = *a2->__current_;
  v125 = v39;
  if (this->__icase_)
  {
    v39 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v39);
    v125 = v39;
  }
  v40 = this->__chars_.__begin_;
  v41 = this->__chars_.__end_ - v40;
  if (v41)
  {
    if (v41 <= 1)
      v41 = 1;
    while (1)
    {
      v42 = *v40++;
      if (v42 == v39)
        break;
      if (!--v41)
        goto LABEL_66;
    }
LABEL_77:
    negate = 1;
    goto LABEL_221;
  }
LABEL_66:
  v43 = this->__neg_mask_;
  if (v43 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v39 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v39] & v43) == 0)
      v44 = (v39 == 95) & (v43 >> 7);
    else
      LOBYTE(v44) = 1;
    end = this->__neg_chars_.__end_;
    v46 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v39, end - this->__neg_chars_.__begin_);
    v47 = v46 ? v46 : end;
    if ((v44 & 1) == 0 && v47 == end)
      goto LABEL_77;
  }
  v49 = this->__ranges_.__begin_;
  v48 = this->__ranges_.__end_;
  if (v49 != v48)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126);
      v49 = this->__ranges_.__begin_;
      v48 = this->__ranges_.__end_;
    }
    else
    {
      v124 = 1;
      LOWORD(__p) = v39;
    }
    v50 = (char *)v48 - (char *)v49;
    if (v50)
    {
      v119 = v37;
      v116 = negate;
      v51 = 0;
      v52 = v50 / 48;
      v114 = v124;
      if (v124 >= 0)
        v53 = v124;
      else
        v53 = v123;
      if (v124 >= 0)
        v54 = &__p;
      else
        v54 = __p;
      if (v52 <= 1)
        v55 = 1;
      else
        v55 = v50 / 48;
      v56 = 1;
      while (1)
      {
        v57 = SHIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        if (v57 >= 0)
          v58 = HIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        else
          v58 = v49->first.__r_.__value_.__l.__size_;
        if (v57 >= 0)
          v59 = v49;
        else
          v59 = (std::vector<std::pair<std::string, std::string>>::pointer)v49->first.__r_.__value_.__r.__words[0];
        if (v58 >= v53)
          v60 = v53;
        else
          v60 = v58;
        v61 = memcmp(v54, v59, v60);
        v62 = v53 >= v58;
        if (v61)
          v62 = v61 >= 0;
        if (v62)
        {
          v63 = SHIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          if (v63 >= 0)
            v64 = HIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          else
            v64 = v49->second.__r_.__value_.__l.__size_;
          if (v63 >= 0)
            v65 = &v49->second;
          else
            v65 = (std::string *)v49->second.__r_.__value_.__l.__data_;
          if (v53 >= v64)
            v66 = v64;
          else
            v66 = v53;
          v67 = memcmp(v65, v54, v66);
          v68 = v64 >= v53;
          if (v67)
            v68 = v67 >= 0;
          if (v68)
            break;
        }
        v56 = ++v51 < v52;
        ++v49;
        if (v55 == v51)
        {
          negate = v116;
          goto LABEL_123;
        }
      }
      negate = 1;
LABEL_123:
      v37 = v119;
      if ((v114 & 0x80) == 0)
        goto LABEL_125;
    }
    else
    {
      v56 = 0;
      if ((v124 & 0x80) == 0)
        goto LABEL_125;
    }
    operator delete(__p);
LABEL_125:
    if (v56)
      goto LABEL_221;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_154;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  v69 = this->__equivalences_.__begin_;
  v70 = v124;
  v71 = (char *)this->__equivalences_.__end_ - (char *)v69;
  if (v71)
  {
    v120 = v37;
    v72 = 0;
    v73 = v71 / 24;
    v74 = __p;
    v75 = v123;
    if (v124 >= 0)
      v76 = v124;
    else
      v76 = v123;
    if (v73 <= 1)
      v77 = 1;
    else
      v77 = v71 / 24;
    v78 = 1;
    while (1)
    {
      v79 = &v69[v72];
      v80 = HIBYTE(v79->__r_.__value_.__r.__words[2]);
      v81 = (char)v80;
      if ((v80 & 0x80u) != 0)
        v80 = v79->__r_.__value_.__l.__size_;
      if (v76 == v80)
      {
        if (v81 >= 0)
          v82 = &v69[v72];
        else
          v82 = (std::string *)v79->__r_.__value_.__r.__words[0];
        if ((v70 & 0x80) != 0)
        {
          v117 = negate;
          v85 = v73;
          v115 = v77;
          v86 = memcmp(v74, v82, v75);
          v77 = v115;
          v73 = v85;
          negate = v117;
          if (!v86)
          {
            negate = 1;
            v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!(_DWORD)v70)
          {
            negate = 1;
            v37 = v120;
            if (!v78)
              goto LABEL_154;
            goto LABEL_221;
          }
          v83 = &__p;
          v84 = v70;
          while (*(unsigned __int8 *)v83 == v82->__r_.__value_.__s.__data_[0])
          {
            v83 = (void **)((char *)v83 + 1);
            v82 = (std::string *)((char *)v82 + 1);
            if (!--v84)
            {
              negate = 1;
              goto LABEL_149;
            }
          }
        }
      }
      v78 = ++v72 < v73;
      if (v72 == v77)
      {
LABEL_149:
        v37 = v120;
        if ((v70 & 0x80) == 0)
          goto LABEL_153;
        goto LABEL_152;
      }
    }
  }
  v78 = 0;
  if (v124 < 0)
LABEL_152:
    operator delete(__p);
LABEL_153:
  if (!v78)
  {
LABEL_154:
    if ((char)v125 < 0)
      goto LABEL_221;
    v87 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v125] & v87) == 0)
    {
      v88 = (v87 >> 7) & 1;
      if (v125 != 95)
        v88 = 0;
      if (v88 != 1)
        goto LABEL_221;
    }
    goto LABEL_77;
  }
LABEL_221:
  if (negate == this->__negate_)
  {
    first = 0;
    v112 = -993;
  }
  else
  {
    a2->__current_ += v37;
    first = this->__first_;
    v112 = -995;
  }
  a2->__do_ = v112;
  a2->__node_ = first;
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0)
    operator delete(*(void **)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_24BA20468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_24BA205E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char *,char *>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_24BA20794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA207E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  int v9;
  char *v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  std::string *v16;
  _BYTE *v17;
  char *v18;
  char *v19;
  std::string::size_type size;
  char v21;
  std::string __p;
  std::string v24;
  std::string v25;
  std::string v26;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }
    if (v9 == 61)
    {
      v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, a4);
LABEL_38:
      v6 = (uint64_t)v10;
      v21 = 0;
      goto LABEL_42;
    }
    goto LABEL_9;
  }
  v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, (uint64_t)&v26);
  v4 = v19;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v26.__r_.__value_.__l.__size_;
  v14 = v19;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      v12 = *v4;
      if (v12 == 92)
      {
        v13 = v4 + 1;
        if (v11)
        {
          v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, a3, &v26);
        }
        else
        {
          v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, &v26, v6);
          v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (v15 = *v14, v15 == 93)
    || (v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }
        v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }
    else if (*((_BYTE *)&v26.__r_.__value_.__s + 23))
    {
      v16 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1)
        goto LABEL_40;
LABEL_25:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, v16->__r_.__value_.__s.__data_[0]);
    }
LABEL_41:
    v21 = 1;
    v4 = v14;
    goto LABEL_42;
  }
  memset(&v25, 0, sizeof(v25));
  v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    v4 = v18;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if ((_DWORD)v17 == 92)
    {
      if (v11)
        v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v14 + 2, a3, &v25);
      else
        v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v14 + 2), (std::basic_regex<char> *)a3, &v25, v6);
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v17) = *v17;
  }
  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  v24 = v26;
  memset(&v26, 0, sizeof(v26));
  __p = v25;
  memset(&v25, 0, sizeof(v25));
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  v21 = 1;
LABEL_42:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if ((v21 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_24BA20B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v6;
  char *v7;
  char *v8;
  char *i;
  int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p[2];
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  v6 = a3 - 2;
  v7 = a2;
  v8 = a2;
  for (i = a2; ; v8 = i)
  {
    v10 = *i++;
    if (v10 == 61 && *i == 93)
      break;
    if (a2 == v6)
      goto LABEL_33;
    ++v7;
    --v6;
  }
  if (v8 == a3)
LABEL_33:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, a2, v7, (uint64_t)&v20);
  if (((char)v22 & 0x80000000) == 0)
  {
    v11 = v22;
    if (v22)
    {
      v12 = (char *)&v20;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  v11 = v21;
  if (!v21)
    goto LABEL_34;
  v12 = (char *)v20;
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, v12, &v12[v11], (uint64_t)__p);
  v13 = v19;
  if ((v19 & 0x80u) != 0)
    v13 = (unint64_t)__p[1];
  if (v13)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (__int128 *)__p);
  }
  else
  {
    v14 = v22;
    if ((v22 & 0x80u) != 0)
      v14 = v21;
    if (v14 == 2)
    {
      v16 = (char *)&v20;
      if ((v22 & 0x80u) != 0)
        v16 = (char *)v20;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v16, v16[1]);
    }
    else
    {
      if (v14 != 1)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v15 = (char *)&v20;
      if ((v22 & 0x80u) != 0)
        v15 = (char *)v20;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v15);
    }
  }
  if ((char)v19 < 0)
    operator delete(__p[0]);
  if ((char)v22 < 0)
    operator delete(v20);
  return v7 + 2;
}

void sub_24BA20D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *i;
  int v9;
  int v10;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  v5 = a3 - 2;
  v6 = a2;
  v7 = a2;
  for (i = a2; ; v7 = i)
  {
    v9 = *i++;
    if (v9 == 58 && *i == 93)
      break;
    if (a2 == v5)
      goto LABEL_11;
    ++v6;
    --v5;
  }
  if (v7 == a3)
LABEL_11:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  v10 = std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *i;
  int v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v13;
  unint64_t v14;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  v5 = a3 - 2;
  v6 = a2;
  v7 = a2;
  for (i = a2; ; v7 = i)
  {
    v9 = *i++;
    if (v9 == 46 && *i == 93)
      break;
    if (a2 == v5)
      goto LABEL_15;
    ++v6;
    --v5;
  }
  if (v7 == a3)
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v13;
  v10 = v14;
  *(_QWORD *)(a4 + 16) = v14;
  v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(a4 + 8);
  if (v11 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return v6 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4, uint64_t a5)
{
  int locale_low;
  int v7;
  int v8;
  std::string::value_type v9;
  std::string *v10;

  if (this == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low > 97)
  {
    if (locale_low > 114)
    {
      if (locale_low != 115)
      {
        if (locale_low != 119)
          return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (locale_low == 98)
      {
        v10 = a4;
        v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      if (locale_low != 100)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low <= 82)
  {
    if (LOBYTE(this->__traits_.__loc_.__locale_))
    {
      if (locale_low == 68)
      {
        v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
    }
    v9 = 0;
    v10 = a4;
    goto LABEL_19;
  }
  if (locale_low == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (locale_low == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3, std::string *this)
{
  int v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        LOBYTE(v5) = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        LOBYTE(v5) = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        LOBYTE(v5) = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        LOBYTE(v5) = 11;
        goto LABEL_49;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          LOBYTE(v5) = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      LOBYTE(v5) = 7;
LABEL_49:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (v5 == 34 || v5 == 47)
    goto LABEL_14;
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30)
    goto LABEL_52;
  v7 = v5 - 48;
  v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30)
      goto LABEL_39;
    v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      goto LABEL_39;
    }
  }
  v8 = a3;
LABEL_39:
  if (this)
    std::string::operator=(this, v7);
  else
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
  return v8;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_24BA215A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  std::pair<std::string,std::string>::~pair((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA21850(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_24BA21A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_24BA21B10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_24BA21B80(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_24BA21C94(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA21EF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_24BA21FA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](std::vector<std::pair<std::string, std::string>> *a1, __int128 *a2)
{
  std::allocator<std::pair<std::string, std::string>> *p_end_cap;
  std::pair<std::string, std::string> *v5;
  std::pair<std::string, std::string> *value;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  std::pair<std::string, std::string> *end;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::pair<std::string, std::string> *v15;
  std::pair<std::string, std::string> *v16;
  __int128 v17;
  __int128 v18;
  std::__split_buffer<std::pair<std::string, std::string>> __v;

  value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::pair<std::string, std::string>> *)&a1->__end_cap_;
  v5 = value;
  v7 = *((_QWORD *)p_end_cap - 1);
  if (v7 >= (unint64_t)value)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (unint64_t)a1->__begin_) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)a1->__begin_) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v14)
      v15 = (std::pair<std::string, std::string> *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)p_end_cap, v14);
    else
      v15 = 0;
    v16 = v15 + v11;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    v17 = *a2;
    v16->first.__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v16->first.__r_.__value_.__l.__data_ = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    v16->second.__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v16->second.__r_.__value_.__l.__data_ = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    __v.__end_ = v16 + 1;
    std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(a1, &__v);
    end = a1->__end_;
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&__v);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    end = (std::pair<std::string, std::string> *)(v7 + 48);
    a1->__end_ = (std::vector<std::pair<std::string, std::string>>::pointer)(v7 + 48);
  }
  a1->__end_ = end;
}

void sub_24BA2233C(_Unwind_Exception *a1, std::__split_buffer<std::pair<std::string, std::string>> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer((std::__split_buffer<std::pair<std::string, std::string>> *)&a10);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_24BA223D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA22424(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(std::vector<std::pair<std::string, std::string>> *this, std::__split_buffer<std::pair<std::string, std::string>> *__v)
{
  std::pair<std::string, std::string> *v4;
  std::pair<std::string, std::string> *begin;
  std::pair<std::string, std::string> *end;
  std::pair<std::string, std::string> *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 48);
      *(_QWORD *)(v9 - 32) = *(_QWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      v11 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((_QWORD *)&v16 + 1) = v9;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](this);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<std::pair<std::string,std::string>>::destroy[abi:ne180100](v4, i - 48);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  void *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = operator new(0x10uLL);
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new(0x38uLL);
  LODWORD(first) = this->__loop_count_;
  v18 = __s->__first_;
  *(_QWORD *)v17 = &unk_251CCAC28;
  *((_QWORD *)v17 + 1) = v18;
  *((_QWORD *)v17 + 2) = v14;
  *((_QWORD *)v17 + 3) = __min;
  *((_QWORD *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = (_DWORD)first;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((_BYTE *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_251CCACB8;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((_QWORD *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = (_DWORD)first + 1;
}

void sub_24BA22930(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);

  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA22A4C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA22A98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CCAC88;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_RE_expression<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  do
  {
    v5 = a2;
    a2 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD2BF30](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24BA22F3C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v8;

  if (a2 == a3)
    return (unsigned __int8 *)a2;
  end = a1->__end_;
  marked_count = a1->__marked_count_;
  v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2)
    return (unsigned __int8 *)a2;
  else
    return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v6;
  char *v7;
  uint64_t v9;
  unsigned int marked_count;
  char *v11;
  _BOOL4 v12;
  uint64_t v13;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(a1, a2, a3);
  v7 = v6;
  if (a2 == v6 && a2 != a3 && a2 + 1 != a3)
  {
    v9 = (uint64_t)v6;
    if (*a2 == 92)
      v9 = (uint64_t)&a2[2 * (a2[1] == 40)];
    if ((char *)v9 == a2)
    {
      if (*a2 == 92)
      {
        v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, a2[1]);
        v13 = 2;
        if (!v12)
          v13 = 0;
        return &a2[v13];
      }
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
      marked_count = a1->__marked_count_;
      v11 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_RE_expression<std::__wrap_iter<char const*>>((uint64_t)a1, v9, (uint64_t)a3);
      if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      v7 = v11 + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v11;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  std::basic_regex<char> *v22;
  int v24;
  int v25;

  v6 = a2;
  if (a2 != a3)
  {
    v7 = __mexp_end;
    v8 = __mexp_begin;
    v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      v13 = a2 + 2;
      v25 = 0;
      v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>((uint64_t)this, a2 + 2, a3, &v25);
      if (v13 == v14)
        goto LABEL_16;
      if (v14 != a3)
      {
        v15 = v14 + 1;
        v16 = *v14;
        if (v16 == 44)
        {
          v24 = -1;
          v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            v19 = v24;
            v18 = v25;
            if (v24 == -1)
            {
              v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            v6 = &v17[2 * (v17[1] == 125)];
            v20 = v8;
            v21 = v7;
            v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          v6 = v14 + 2;
          v18 = v25;
          v20 = v8;
          v21 = v7;
          v22 = this;
          v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  int v6;
  char *result;
  std::__node<char> *v9;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if (a2 == a3)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(this, a2, a3);
    if (result != a2)
      return result;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
    return a2 + 1;
  }
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(this, a2, a3);
  if (result != a2)
    return result;
  if (*a2 != 46)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
  v9 = (std::__node<char> *)operator new(0x10uLL);
  end = this->__end_;
  first = end->__first_;
  v9->__vftable = (std::__node<char>_vtbl *)&unk_251CCAD90;
  v9[1].__vftable = (std::__node<char>_vtbl *)first;
  end->__first_ = v9;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  return a2 + 1;
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;

  v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  do
  {
    v7 = v6;
    v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  char *v8;
  unsigned __int8 *v9;
  int locale_low;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  std::basic_regex<char> *v17;
  std::basic_regex<char> *v18;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3)
    goto LABEL_12;
  locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  switch(locale_low)
  {
    case '$':
      v11 = operator new(0x18uLL);
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      goto LABEL_8;
    case '(':
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression((std::basic_regex<char> *)a1);
      v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v17 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v17 == a3 || (v18 = v17, LOBYTE(v17->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression((std::basic_regex<char> *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)&v18->__traits_.__loc_.__locale_ + 1;
LABEL_12:
      if (v9 != (unsigned __int8 *)a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
      return (unsigned __int8 *)a2;
    case '^':
      v11 = operator new(0x18uLL);
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
LABEL_8:
      v15 = *(_QWORD *)(v13 + 8);
      *v11 = v14 + 16;
      v11[1] = v15;
      *((_BYTE *)v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  return (unsigned __int8 *)a2;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  char *result;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (result == (char *)a2)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)a2, (char *)a3);
    if (result == (char *)a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)a2, (char *)a3);
      }
      else
      {
        v7 = (std::__node<char> *)operator new(0x10uLL);
        end = a1->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_251CCAD90;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        return (char *)&a2->__traits_.__loc_.__locale_ + 1;
      }
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  int locale_low;
  uint64_t v5;

  v3 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    v5 = (locale_low - 36);
    if (v5 > 0x3A)
      goto LABEL_8;
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0)
      return v3;
    if (v5 == 5)
    {
      if (a1->__open_count_)
        return v3;
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2)
        return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  int v5;
  char v6;
  BOOL v7;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      v5 = *v4;
      v6 = *v4;
      v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
      if (v7 && (v5 - 123) >= 3)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
        {
          return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4, a3, 0);
        }
        else
        {
          v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
          v10 = 2;
          if (!v9)
            v10 = 0;
          v3 += v10;
        }
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
        v3 += 2;
      }
    }
  }
  return v3;
}

uint64_t std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(char *__f, char *__l, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5;
  int v9;
  uint64_t result;
  std::match_results<const char *> __p;

  v5 = a5;
  memset(&__p.__prefix_, 0, 17);
  memset(&__p.__suffix_, 0, 17);
  __p.__ready_ = 0;
  __p.__position_start_ = 0;
  memset(&__p, 0, 41);
  v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a4, __f, __l, &__p, a5 | 0x1040u);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)a3, (uint64_t)__f, (std::sub_match<std::__wrap_iter<const char *>> *)__l, (uint64_t *)&__p, (v5 & 0x800) != 0);
  if (__p.__matches_.__begin_)
  {
    __p.__matches_.__end_ = __p.__matches_.__begin_;
    operator delete(__p.__matches_.__begin_);
  }
  if (!v9)
    return 0;
  if (!*(_BYTE *)(a3 + 88))
    return 1;
  result = 0;
  *(_QWORD *)(a3 + 8) = *(_QWORD *)a3;
  return result;
}

void sub_24BA239F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  int v9;
  std::match_results<const char *>::value_type *p_unmatched;
  const char *first;
  const char *second;
  uint64_t result;
  int v14;
  const char *v15;
  int v16;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_)
      p_unmatched = &this->__unmatched_;
    else
      p_unmatched = this->__matches_.__begin_;
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        begin = this->__matches_.__begin_;
        end = this->__matches_.__end_;
        if (v16)
          break;
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l)
          goto LABEL_14;
      }
      if (end == begin)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
  }
  result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *a1, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  std::vector<std::ssub_match>::pointer begin;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  std::vector<std::ssub_match>::pointer end;
  std::sub_match<std::__wrap_iter<const char *>> *v23;

  v10 = a4[6];
  std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  begin = a1->__begin_;
  if (a1->__end_ != a1->__begin_)
  {
    v12 = 0;
    v13 = 0;
    v15 = *a4;
    v14 = a4[1];
    do
    {
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      v17 = (_QWORD *)(v15 + v12 * 24);
      if (v16 <= v13)
        v18 = a4 + 3;
      else
        v18 = v17;
      begin[v12].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v18 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13)
        v19 = a4 + 3;
      else
        v19 = (uint64_t *)(*a4 + v12 * 24);
      a1->__begin_[v12].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + v19[1] - v10);
      v15 = *a4;
      v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13)
        v20 = a4 + 3;
      else
        v20 = (uint64_t *)(*a4 + v12 * 24);
      v21 = *((_BYTE *)v20 + 16);
      begin = a1->__begin_;
      end = a1->__end_;
      a1->__begin_[v12].matched = v21;
      ++v13;
      ++v12;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  a1[1].__begin_ = a3;
  a1[1].__end_ = a3;
  LOBYTE(a1[1].__end_cap_.__value_) = 0;
  v23 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  a1[2].__begin_ = v23;
  a1[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(a1[2].__end_cap_.__value_) = *((_BYTE *)a4 + 64);
  a1[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  a1[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(a1[3].__end_cap_.__value_) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    a1[4].__end_ = v23;
  LOBYTE(a1[4].__begin_) = *((_BYTE *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _BYTE v55[40];
  __int128 v56;
  void *__p[2];
  _QWORD v58[3];
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v55 = 0;
    memset(&v55[8], 0, 32);
    v56 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v58, 0, 21);
    std::deque<std::__state<char>>::push_back(&v59, (uint64_t)v55);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v55[32])
    {
      *(_QWORD *)&v56 = *(_QWORD *)&v55[32];
      operator delete(*(void **)&v55[32]);
    }
    v12 = *((_QWORD *)&v59 + 1);
    v13 = *((_QWORD *)&v61 + 1) + v61 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    v53 = 0;
    v18 = 0;
    v51 = 0;
    v52 = a2;
    v19 = a3 - a2;
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v59 + 1);
    v22 = *((_QWORD *)&v61 + 1) + v61 - 1;
    v23 = v22 / 0x2A;
    v24 = 3 * (v22 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    v25 = *(_QWORD *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(_BYTE *)(v25 + 92) = a6;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v19)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v27 = v20 + v61 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == a3;
          v36 = v33 != v52 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v51;
          if ((v53 & (v51 >= v37)) == 0)
            v38 = v37;
          if (v38 != v19)
          {
            v51 = v38;
            std::deque<std::__state<char>>::pop_back(&v59);
            v53 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v59 + 1);
          v40 = v60;
          if ((_QWORD)v60 == *((_QWORD *)&v59 + 1))
          {
            v40 = *((_QWORD *)&v59 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * ((unint64_t)v61 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v61 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * ((*((_QWORD *)&v61 + 1) + (_QWORD)v61) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v61 + 1) + (_QWORD)v61) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v61 + 8, v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v59 + 1);
              v40 = v60;
            }
          }
          *((_QWORD *)&v61 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v59 + 1) + 8);
              *((_QWORD *)&v59 + 1) = v39;
              v47 = v60 - (_QWORD)v39;
            }
            while ((_QWORD)v60 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v61 = v48;
LABEL_53:
          v53 = 1;
          v51 = v19;
LABEL_38:
          v20 = *((_QWORD *)&v61 + 1);
          if (*((_QWORD *)&v61 + 1))
            continue;
          if ((v53 & 1) != 0)
          {
            v49 = *a4;
            *(_QWORD *)v49 = v52;
            *(_QWORD *)(v49 + 8) = v52 + v51;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v59, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v59);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v55 = *(_OWORD *)v30;
          *(_OWORD *)&v55[16] = v45;
          v56 = 0uLL;
          *(_QWORD *)&v55[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v55[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v58[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v58[1] + 5) = *(_QWORD *)(v30 + 85);
          v58[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v58[1] + 24))(v58[1], 0, v55);
          std::deque<std::__state<char>>::push_back(&v59, (uint64_t)v55);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v55[32])
          {
            *(_QWORD *)&v56 = *(_QWORD *)&v55[32];
            operator delete(*(void **)&v55[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v59);
  return v6;
}

void sub_24BA2427C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  uint64_t v22;

  std::deque<std::__state<char>>::~deque[abi:ne180100]((_QWORD *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  const char *v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  const char *v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v41;
  const char *v42;
  char v43;
  _BYTE v46[56];
  void *__p[2];
  _QWORD v48[4];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v50[40];
  __int128 v51;
  void *v52[6];
  _OWORD *v53;
  _OWORD *v54;
  _QWORD v55[3];

  v53 = 0;
  v54 = 0;
  v55[0] = 0;
  *(_DWORD *)v50 = 0;
  memset(&v50[8], 0, 32);
  v51 = 0u;
  memset(v52, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_43;
  __x.first = a3;
  __x.second = a3;
  __x.matched = 0;
  *(_DWORD *)v46 = 0;
  memset(&v46[8], 0, 48);
  *(_OWORD *)__p = 0uLL;
  memset(v48, 0, 21);
  v54 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v53, (uint64_t)v46);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(_QWORD *)&v46[32])
  {
    *(_QWORD *)&v46[40] = *(_QWORD *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }
  v41 = a4;
  v11 = v54;
  *((_DWORD *)v54 - 24) = 0;
  *((_QWORD *)v11 - 11) = a2;
  *((_QWORD *)v11 - 10) = a2;
  *((_QWORD *)v11 - 9) = a3;
  std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
  std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v54 - 40), *(unsigned int *)(a1 + 32));
  v42 = 0;
  v43 = 0;
  v12 = 0;
  v13 = (const char *)(a3 - a2);
  v14 = v54;
  *((_QWORD *)v54 - 2) = v6;
  *((_DWORD *)v14 - 2) = a5;
  *((_BYTE *)v14 - 4) = a6;
  do
  {
    v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
    if (!v15)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v17 = v14 - 1;
    v16 = *((_QWORD *)v14 - 2);
    v18 = v14 - 6;
    if (v16)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
    switch(*(_DWORD *)v18)
    {
      case 0xFFFFFC18:
        v19 = (const char *)*((_QWORD *)v14 - 10);
        if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != a3)
          goto LABEL_19;
        v26 = &v19[-*((_QWORD *)v14 - 11)];
        v27 = v42;
        if ((v43 & ((uint64_t)v42 >= (uint64_t)v26)) == 0)
        {
          v28 = *(v14 - 5);
          *(_OWORD *)v50 = *(_OWORD *)v18;
          *(_OWORD *)&v50[16] = v28;
          if (v50 != v18)
          {
            std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v50[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
            std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v52, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          }
          v29 = (void *)*v17;
          *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
          v52[3] = v29;
          v27 = v26;
        }
        v30 = v54;
        if (v27 == v13)
        {
          v31 = (uint64_t)v53;
          while (v30 != (_QWORD *)v31)
          {
            v30 -= 12;
            std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, v30);
          }
          v54 = (_OWORD *)v31;
          v43 = 1;
          v42 = (const char *)(a3 - a2);
        }
        else
        {
          v42 = v27;
          v32 = v54 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, (_QWORD *)v54 - 12);
          v54 = v32;
          v43 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        v20 = v54 - 6;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, (_QWORD *)v54 - 12);
        v54 = v20;
        break;
      case 0xFFFFFC20:
        v21 = *(v14 - 5);
        *(_OWORD *)v46 = *(_OWORD *)v18;
        *(_OWORD *)&v46[16] = v21;
        memset(&v46[32], 0, 24);
        std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v46[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v48[0] = 0;
        std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
        v22 = (void *)*v17;
        *(_QWORD *)((char *)&v48[1] + 5) = *(_QWORD *)((char *)v14 - 11);
        v48[1] = v22;
        (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v48[1] + 24))(v48[1], 0, v46);
        v23 = v54;
        if ((unint64_t)v54 >= v55[0])
        {
          v54 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v53, (uint64_t)v46);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          v24 = *(_OWORD *)&v46[16];
          *v54 = *(_OWORD *)v46;
          v23[1] = v24;
          *((_QWORD *)v23 + 4) = 0;
          *((_QWORD *)v23 + 5) = 0;
          *((_QWORD *)v23 + 6) = 0;
          *((_QWORD *)v23 + 7) = 0;
          v23[2] = *(_OWORD *)&v46[32];
          *((_QWORD *)v23 + 6) = *(_QWORD *)&v46[48];
          memset(&v46[32], 0, 24);
          *((_QWORD *)v23 + 8) = 0;
          *((_QWORD *)v23 + 9) = 0;
          *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
          *((_QWORD *)v23 + 9) = v48[0];
          __p[0] = 0;
          __p[1] = 0;
          v48[0] = 0;
          v25 = v48[1];
          *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v48[1] + 5);
          *((_QWORD *)v23 + 10) = v25;
          v54 = v23 + 6;
        }
        if (*(_QWORD *)&v46[32])
        {
          *(_QWORD *)&v46[40] = *(_QWORD *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    v14 = v54;
  }
  while (v53 != v54);
  if ((v43 & 1) != 0)
  {
    v33 = *v41;
    *(_QWORD *)v33 = a2;
    *(_QWORD *)(v33 + 8) = &v42[(_QWORD)a2];
    *(_BYTE *)(v33 + 16) = 1;
    if ((_QWORD)v51 != *(_QWORD *)&v50[32])
    {
      v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(_QWORD *)&v50[32]) >> 3);
      v35 = (_BYTE *)(*(_QWORD *)&v50[32] + 16);
      v36 = 1;
      do
      {
        v37 = v33 + 24 * v36;
        *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
        v38 = *v35;
        v35 += 24;
        *(_BYTE *)(v37 + 16) = v38;
        v15 = v34 > v36++;
      }
      while (v15);
    }
    v39 = 1;
  }
  else
  {
LABEL_43:
    v39 = 0;
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (*(_QWORD *)&v50[32])
  {
    *(_QWORD *)&v51 = *(_QWORD *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }
  *(_QWORD *)v50 = &v53;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v50);
  return v39;
}

void sub_24BA247D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  std::__state<char>::~__state(&a19);
  std::__state<char>::~__state(&a35);
  a35 = v35 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;

  v2 = a1 + 5;
  v3 = a1[5] + a1[4] - 1;
  std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(a1 + 5), (_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_24BA2A9C0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_24BA24D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::cf::CFSharedRef<__CFData const>>>((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_24BA25554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](_QWORD *a1)
{
  _QWORD *v2;
  void **v3;
  void **v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = a1 + 5;
  v3 = (void **)a1[1];
  v4 = (void **)a1[2];
  if (v4 == v3)
  {
    v4 = (void **)a1[1];
  }
  else
  {
    v5 = a1[4];
    v6 = &v3[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v3 = (void **)a1[1];
      v4 = (void **)a1[2];
    }
  }
  *v2 = 0;
  v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = (void **)a1[2];
      v3 = (void **)(a1[1] + 8);
      a1[1] = v3;
      v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    v13 = *v3++;
    operator delete(v13);
  }
  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __sz)
{
  std::vector<std::ssub_match>::size_type v2;
  BOOL v3;
  std::vector<std::ssub_match>::size_type v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  v3 = __sz >= v2;
  v4 = __sz - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v4);
  }
  else if (!v3)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  std::__compressed_pair<std::ssub_match *> *p_end_cap;
  std::sub_match<std::__wrap_iter<const char *>> *v5;
  std::sub_match<std::__wrap_iter<const char *>> *value;
  std::sub_match<std::__wrap_iter<const char *>> *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::sub_match<std::__wrap_iter<const char *>> *v13;
  std::vector<std::ssub_match>::size_type v14;
  std::sub_match<std::__wrap_iter<const char *>> *v15;
  std::sub_match<std::__wrap_iter<const char *>> *v16;
  std::vector<std::ssub_match>::size_type v17;
  std::sub_match<std::__wrap_iter<const char *>> *v18;
  std::sub_match<std::__wrap_iter<const char *>> *v19;
  std::sub_match<std::__wrap_iter<const char *>> *end;
  std::vector<std::ssub_match>::pointer begin;
  std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  v7 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v7) >> 3) >= __n)
  {
    if (__n)
    {
      v13 = &v7[__n];
      v14 = 24 * __n;
      do
      {
        v7->first.__i_ = 0;
        v7->second.__i_ = 0;
        v7->matched = 0;
        ++v7;
        v14 -= 24;
      }
      while (v14);
      v7 = v13;
    }
    this->__end_ = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v11);
    else
      v12 = 0;
    v15 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v8];
    v16 = &v15[__n];
    v17 = 24 * __n;
    v18 = v15;
    do
    {
      v18->first.__i_ = 0;
      v18->second.__i_ = 0;
      v18->matched = 0;
      ++v18;
      v17 -= 24;
    }
    while (v17);
    v19 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v11];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v22 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(_QWORD *)&v15[-1].matched = *(_QWORD *)&end[-1].matched;
        v15[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v22;
        --v15;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v15;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v19;
    if (end)
      operator delete(end);
  }
}

uint64_t __cxx_global_var_init_6()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_24BA04000);
  }
  return result;
}

char *BBUReturnAsString(int a1)
{
  return BBUReturnAsString::BBUReturnStrings[a1];
}

uint64_t ErrnoToBBUReturn(int a1)
{
  if (a1 == 35)
    return 13;
  else
    return 3;
}

unint64_t BBULogModuleEnabled(char a1)
{
  return ((unint64_t)sLogInternalMask >> a1) & 1;
}

uint64_t gBBULogMaskGet(void)
{
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  return gBBULogMaskGet(void)::sBBULogMask;
}

void BBULogSetMask(unsigned int a1)
{
  uint64_t v1;

  v1 = a1;
  sLogInternalMask = a1;
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  *(_QWORD *)gBBULogMaskGet(void)::sBBULogMask = v1;
}

uint64_t BBULogSetVerbosity(uint64_t result)
{
  gBBULogVerbosity = result;
  return result;
}

void BBULogSetExtraVerbosity(unsigned int a1)
{
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if (a1 >= 7 && (*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & 0x40) != 0)
    TelephonyUtilDebugSetFlags();
}

uint64_t _BBULogv(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, va_list a6)
{
  pthread_mutex_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  size_t v18;
  _QWORD *v19;
  _QWORD *v20;
  size_t v21;
  _QWORD *v22;
  _QWORD *v23;
  size_t v24;
  void **v25;
  unint64_t v26;
  void **v27;
  FILE *Stream;
  void **v29;
  FILE **v30;
  void **v31;
  void *__p[2];
  unsigned __int8 v34;
  char v35;
  _QWORD v36[11];
  char v37;
  uint64_t v38;
  timeval v39;

  if (gLockGet(void)::once != -1)
    dispatch_once(&gLockGet(void)::once, &__block_literal_global_40);
  v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
  BBUpdaterCommon::BBUMutex::lock((pthread_mutex_t *)gLockGet(void)::_gLock);
  if (sLogBufferGet(void)::once != -1)
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
  if (*(_QWORD *)sLogBufferGet(void)::sLogBuffer || (((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    vsnprintf(gTempLogBuffer, 0x400uLL, a5, a6);
    gettimeofday(&v39, 0);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v36);
    v12 = (_QWORD *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)__p, 1);
    *(_QWORD *)((char *)v13 + *(_QWORD *)(*v13 - 24) + 24) = 3;
    v35 = 48;
    std::operator<<[abi:ne180100]<std::char_traits<char>>(v13, &v35);
    v14 = (_QWORD *)std::ostream::operator<<();
    *(_QWORD *)((char *)v14 + *(_QWORD *)(*v14 - 24) + 24) = 1;
    LOBYTE(__p[0]) = 91;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
    v15 = (_QWORD *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 46;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)__p, 1);
    v16 = (_QWORD *)std::ostream::operator<<();
    LOBYTE(__p[0]) = 93;
    v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
    v18 = strlen(a3);
    v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)a3, v18);
    v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"::", 2);
    v21 = strlen(a4);
    v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)a4, v21);
    v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
    v24 = strlen(gTempLogBuffer);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)gTempLogBuffer, v24);
    std::stringbuf::str();
    if (sLogBufferGet(void)::once != -1)
      dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
    if (*(_QWORD *)sLogBufferGet(void)::sLogBuffer)
    {
      if ((v34 & 0x80u) == 0)
        v25 = __p;
      else
        v25 = (void **)__p[0];
      if ((v34 & 0x80u) == 0)
        v26 = v34;
      else
        v26 = (unint64_t)__p[1];
      (*(void (**)(_QWORD, void **, unint64_t))(**(_QWORD **)sLogBufferGet(void)::sLogBuffer + 24))(*(_QWORD *)sLogBufferGet(void)::sLogBuffer, v25, v26);
    }
    if ((((unint64_t)sLogInternalMask >> a1) & 1) != 0)
    {
      if (gBBULogSinkFunc)
      {
        if ((v34 & 0x80u) == 0)
          v27 = __p;
        else
          v27 = (void **)__p[0];
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v27);
      }
      else
      {
        Stream = (FILE *)_BBULogGetStream(a1);
        if ((v34 & 0x80u) == 0)
          v29 = __p;
        else
          v29 = (void **)__p[0];
        fputs((const char *)v29, Stream);
        fflush(Stream);
        v30 = (FILE **)MEMORY[0x24BDAC8E8];
        if (Stream != (FILE *)*MEMORY[0x24BDAC8E8])
        {
          if ((v34 & 0x80u) == 0)
            v31 = __p;
          else
            v31 = (void **)__p[0];
          fputs((const char *)v31, (FILE *)*MEMORY[0x24BDAC8E8]);
          fflush(*v30);
        }
      }
    }
    if ((char)v34 < 0)
      operator delete(__p[0]);
    v36[0] = *MEMORY[0x24BEDB800];
    *(_QWORD *)((char *)v36 + *(_QWORD *)(v36[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v36[1] = MEMORY[0x24BEDB848] + 16;
    if (v37 < 0)
      operator delete((void *)v36[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x24BD2C164](&v38);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_24BA26144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  pthread_mutex_t *v16;

  if (a14 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  BBUpdaterCommon::BBUMutex::unlock(v16);
  _Unwind_Resume(a1);
}

uint64_t _BBULogGetStream(int a1)
{
  uint64_t *v1;
  uint64_t v2;

  switch(a1)
  {
    case 0:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 24);
      break;
    case 1:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 32);
      break;
    case 5:
    case 6:
    case 7:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 40);
      break;
    case 9:
    case 13:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 48);
      break;
    case 14:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 56);
      break;
    case 17:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 16);
      break;
    default:
      if (gLogStreamsGet(void)::once != -1)
        dispatch_once(&gLogStreamsGet(void)::once, &__block_literal_global_45);
      v1 = (uint64_t *)(gLogStreamsGet(void)::sLogStreams + 8);
      break;
  }
  v2 = *v1;
  if (v2)
    return v2;
  else
    return *MEMORY[0x24BDAC8E8];
}

uint64_t _BBULog(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _BBULogv(a1, a2, a3, a4, a5, &a9);
}

uint64_t _BBULogPlain(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  pthread_mutex_t *v11;
  size_t v12;
  void **v13;
  unint64_t v14;
  void **v15;
  FILE *Stream;
  void **v17;
  FILE **v18;
  void **v19;
  void *__p[2];
  unsigned __int8 v22;
  _QWORD v23[11];
  char v24;
  _QWORD v25[20];

  if (gLockGet(void)::once != -1)
    dispatch_once(&gLockGet(void)::once, &__block_literal_global_40);
  v11 = (pthread_mutex_t *)gLockGet(void)::_gLock;
  BBUpdaterCommon::BBUMutex::lock((pthread_mutex_t *)gLockGet(void)::_gLock);
  if (sLogBufferGet(void)::once != -1)
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
  if (*(_QWORD *)sLogBufferGet(void)::sLogBuffer || (((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    v25[19] = &a9;
    vsnprintf(gTempLogBuffer, 0x400uLL, a2, &a9);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v23);
    if (a1 == 1)
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"!!! ", 4);
    v12 = strlen(gTempLogBuffer);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)gTempLogBuffer, v12);
    std::stringbuf::str();
    if (sLogBufferGet(void)::once != -1)
      dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
    if (*(_QWORD *)sLogBufferGet(void)::sLogBuffer)
    {
      if ((v22 & 0x80u) == 0)
        v13 = __p;
      else
        v13 = (void **)__p[0];
      if ((v22 & 0x80u) == 0)
        v14 = v22;
      else
        v14 = (unint64_t)__p[1];
      (*(void (**)(_QWORD, void **, unint64_t))(**(_QWORD **)sLogBufferGet(void)::sLogBuffer + 24))(*(_QWORD *)sLogBufferGet(void)::sLogBuffer, v13, v14);
    }
    if ((((unint64_t)sLogInternalMask >> a1) & 1) != 0)
    {
      if (gBBULogSinkFunc)
      {
        if ((v22 & 0x80u) == 0)
          v15 = __p;
        else
          v15 = (void **)__p[0];
        gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v15);
      }
      else
      {
        Stream = (FILE *)_BBULogGetStream(a1);
        if ((v22 & 0x80u) == 0)
          v17 = __p;
        else
          v17 = (void **)__p[0];
        fputs((const char *)v17, Stream);
        fflush(Stream);
        v18 = (FILE **)MEMORY[0x24BDAC8E8];
        if (Stream != (FILE *)*MEMORY[0x24BDAC8E8])
        {
          if ((v22 & 0x80u) == 0)
            v19 = __p;
          else
            v19 = (void **)__p[0];
          fputs((const char *)v19, (FILE *)*MEMORY[0x24BDAC8E8]);
          fflush(*v18);
        }
      }
    }
    if ((char)v22 < 0)
      operator delete(__p[0]);
    v23[0] = *MEMORY[0x24BEDB800];
    *(_QWORD *)((char *)v23 + *(_QWORD *)(v23[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v23[1] = MEMORY[0x24BEDB848] + 16;
    if (v24 < 0)
      operator delete((void *)v23[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x24BD2C164](v25);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_24BA26688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  pthread_mutex_t *v16;

  if (a15 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  BBUpdaterCommon::BBUMutex::unlock(v16);
  _Unwind_Resume(a1);
}

uint64_t _BBULogBinary(uint64_t result, uint64_t a2, const char *a3, const char *a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  uint64_t i;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  char v30;
  BOOL v31;
  unint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v36;
  char v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[32];
  __int128 v42;
  uint64_t v43;

  v38 = a7;
  v43 = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    v8 = a6;
    v10 = result;
    v12 = 0;
    v13 = a2;
    v31 = (int)a2 >= 0 && a6 > 0x3E80;
    v14 = 112;
    if (v31)
    {
      v15 = a6 - 224;
    }
    else
    {
      v14 = 0xFFFFFFFFLL;
      v15 = 0;
    }
    v36 = v14;
    v32 = v14 + v15;
    v33 = a2;
    v34 = result;
    do
    {
      if (v12 == v36)
      {
        _BBULog(v10, v13, a3, a4, " -- middle of buffer snipped -- \n", a6, a7, a8, v30);
        v12 = v32;
      }
      *(_OWORD *)&v41[16] = 0u;
      v42 = 0u;
      if (v8 - v12 >= 0x10)
        v16 = 16;
      else
        v16 = v8 - v12;
      v40 = 0uLL;
      *(_OWORD *)v41 = 0uLL;
      v39 = 0uLL;
      v17 = a3;
      if (v16)
      {
        v18 = (54 - 3 * v16) - 3;
        v19 = v16;
        v20 = (char *)&v39 + 1;
        v21 = (unsigned __int8 *)(a5 + v12);
        do
        {
          v22 = *v21++;
          v23 = a0123456789abcd[v22 & 0xF];
          *(v20 - 1) = a0123456789abcd[(unint64_t)v22 >> 4];
          *v20 = v23;
          v20[1] = 32;
          v20 += 3;
          v18 += 3;
          --v19;
        }
        while (v19);
        memset(v20 - 1, 32, 3 * (17 - v16));
        for (i = 0; i != v16; ++i)
        {
          v25 = *(unsigned __int8 *)(a5 + v12 + i);
          if ((v25 - 32) >= 0x5F)
            LOBYTE(v25) = 46;
          *((_BYTE *)&v39 + v18 + i) = v25;
        }
        v26 = v18 + i;
        v17 = a3;
        v28 = v33;
        v27 = v34;
      }
      else
      {
        v28 = v13;
        *(_DWORD *)&v41[15] = 538976288;
        *(_QWORD *)&v29 = 0x2020202020202020;
        *((_QWORD *)&v29 + 1) = 0x2020202020202020;
        v40 = v29;
        *(_OWORD *)v41 = v29;
        v26 = 51;
        v39 = v29;
        v27 = v10;
      }
      strcpy((char *)&v39 + v26, "\r\n");
      v10 = v27;
      v13 = v28;
      a3 = v17;
      result = _BBULog(v27, v28, v17, a4, "%c%04zx  %s", a6, a7, a8, v38);
      v12 += 16;
      v8 = a6;
    }
    while (v12 < a6);
    if (v31)
      return _BBULog(v10, v13, a3, a4, "(snipped)\n", a6, a7, a8, v30);
  }
  return result;
}

uint64_t _BBULogTracer::_BBULogTracer(uint64_t a1, int a2, uint64_t a3, const char *a4, const char *a5, char *__format, ...)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char __str[256];
  uint64_t v17;
  va_list va;

  va_start(va, __format);
  v17 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_QWORD *)(a1 + 8) = a4;
  *(_QWORD *)(a1 + 16) = a5;
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if (((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask >> a2) & 1) == 0)
  {
    if ((a3 & 0x80000000) == 0)
      return a1;
    goto LABEL_6;
  }
  if ((a3 & 0x80000000) != 0 || gBBULogVerbosity >= (int)a3)
  {
LABEL_6:
    vsnprintf(__str, 0x100uLL, __format, va);
    _BBULog(a2, a3, a4, a5, "ENTER: %s\n", v12, v13, v14, (char)__str);
  }
  return a1;
}

void _BBULogTracer::~_BBULogTracer(_BBULogTracer *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char v10;

  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if (((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask >> *(_DWORD *)this) & 1) == 0)
  {
    v9 = *((unsigned int *)this + 1);
    if ((v9 & 0x80000000) == 0)
      return;
    goto LABEL_8;
  }
  v9 = *((unsigned int *)this + 1);
  if (gBBULogVerbosity >= (int)v9 || (v9 & 0x80000000) != 0)
LABEL_8:
    _BBULog(*(_DWORD *)this, v9, *((const char **)this + 1), *((const char **)this + 2), "EXIT:\n", a6, a7, a8, v10);
}

void BBUFDRLogHandler(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;

  v8 = (char)a2;
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(15, 0, "BBULog", "", "Dump: %s\n", a6, a7, a8, v8);
}

void BBULogParseDebugArgs(const __CFDictionary **a1)
{
  uint64_t (*v1)(uint64_t);
  const __CFDictionary *Value;
  void *v4;
  _DWORD *v5;
  const char **v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  char *v12;
  void *v13[2];
  unint64_t v14;
  _BYTE v15[16];
  _BYTE v16[16];
  void *__p[2];
  unint64_t v18;

  if (*a1)
    v1 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v1 = 0;
  if (v1)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v16, *a1);
    Value = (const __CFDictionary *)CFDictionaryGetValue(*a1, CFSTR("BasebandUpdater"));
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v15, Value);
    ctu::cf::map_adapter::getString();
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
    v18 = v14;
    *(_OWORD *)__p = *(_OWORD *)v13;
    v4 = (void *)HIBYTE(v14);
    if ((v14 & 0x8000000000000000) != 0)
      v4 = v13[1];
    if (v4)
    {
      v13[0] = 0;
      v13[1] = 0;
      v14 = 0;
      BBUpdaterCommon::BBUStringToArgv((char *)__p, v13);
      v5 = (_DWORD *)MEMORY[0x24BDAF288];
      v6 = (const char **)MEMORY[0x24BDAF270];
      *MEMORY[0x24BDAF278] = 1;
      *v5 = 1;
      do
      {
        while (1)
        {
          while (1)
          {
            v7 = getopt_long(((unint64_t)((char *)v13[1] - (char *)v13[0]) >> 3) - 1, (char *const *)v13[0], "hl:C:v:x:t:r:p:e:c:w:i:s:fUFD:nHSqPV", (const option *)&BBULogParseDebugArgs(ctu::cf::CFSharedRef<__CFDictionary const>)::long_options, 0);
            if (v7 <= 117)
              break;
            if (v7 == 118)
            {
              v12 = 0;
              v11 = strtoul(*v6, &v12, 0);
              if (!*v12)
                gBBULogVerbosity = v11;
            }
            else if (v7 == 120)
            {
              v12 = 0;
              v8 = strtoul(*v6, &v12, 0);
              if (!*v12)
                BBULogSetExtraVerbosity(v8);
            }
          }
          if (v7 != 108)
            break;
          v12 = 0;
          v9 = strtoul(*v6, &v12, 0);
          if (!*v12)
          {
            v10 = v9;
            sLogInternalMask = v9;
            if (gBBULogMaskGet(void)::once != -1)
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
            *(_QWORD *)gBBULogMaskGet(void)::sBBULogMask = v10;
          }
        }
      }
      while (v7 != -1);
      if (v13[0])
      {
        v13[1] = v13[0];
        operator delete(v13[0]);
      }
    }
    MEMORY[0x24BD2BD2C](v15);
    MEMORY[0x24BD2BD2C](v16);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
  }
}

void sub_24BA26E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (__p)
    operator delete(__p);
  MEMORY[0x24BD2BD2C](&a13);
  MEMORY[0x24BD2BD2C](&a15);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(a1);
}

void **BBULogRegisterRemoteFSDelegate(void)
{
  return BBUFSDebugRegisterDelegate((void **)&BBULogRegisterRemoteFSDelegate(void)::delegate);
}

void BBURemoteFSPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  BBULogPrintDelegate(23, (uint64_t)a1, a2, a3);
}

uint64_t BBULogRegisterDelegates(void)
{
  void **v0;
  uint64_t result;

  TelephonyUtilDebugRegisterDelegate();
  v0 = BBUFSDebugRegisterDelegate((void **)&BBULogRegisterRemoteFSDelegate(void)::delegate);
  result = BBUpdaterCommon::inRestoreOS((BBUpdaterCommon *)v0);
  if ((_DWORD)result)
  {
    ETLDebugRegisterDelegate();
    return KTLDebugRegisterDelegate();
  }
  return result;
}

void *BBULogRegisterSink(void *result, uint64_t a2)
{
  gBBULogSinkContext = a2;
  gBBULogSinkFunc = result;
  return result;
}

_QWORD *BBULogRegisterLogBuffer(uint64_t *a1)
{
  if (sLogBufferGet(void)::once != -1)
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
  return std::shared_ptr<BBULogBuffer>::operator=[abi:ne180100]((_QWORD *)sLogBufferGet(void)::sLogBuffer, a1);
}

_QWORD *std::shared_ptr<BBULogBuffer>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
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

void BBULogUnregisterLogBuffer(void)
{
  if (sLogBufferGet(void)::once != -1)
    dispatch_once(&sLogBufferGet(void)::once, &__block_literal_global_43);
  if (*(_QWORD *)sLogBufferGet(void)::sLogBuffer)
    std::shared_ptr<eUICC::TwoPhaseProv::TwoPhaseProvImpl>::reset[abi:ne180100]((_QWORD *)sLogBufferGet(void)::sLogBuffer);
}

void sub_24BA27040(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24BA270EC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBULogPrintDelegate(int a1, uint64_t a2, const char *a3, va_list a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  timeval v13;
  char __str[256];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  gettimeofday(&v13, 0);
  vsnprintf(__str, 0x100uLL, a3, a4);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if (((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask >> a1) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(a1, "%u.%03u: %s: %s", v7, v8, v9, v10, v11, v12, v13.tv_sec);
}

void BBULogTelephonyUtilPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  BBULogPrintDelegate(6, (uint64_t)a1, a2, a3);
}

void BBULogTelephonyUtilPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(6, (uint64_t)v5, a3, a4);
}

void BBULogPrintBinaryDelegate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  timeval v13;
  void *__p[2];
  uint64_t v15;

  __p[0] = 0;
  __p[1] = 0;
  v15 = 0;
  if (a4 < 0x801)
  {
    v6 = a4;
  }
  else
  {
    MEMORY[0x24BD2BF6C](__p, "(snipped)");
    v6 = 2048;
  }
  gettimeofday(&v13, 0);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    _BBULogPlain(a1, "%u.%03u: %s: %u%s\n", v7, v8, v9, v10, v11, v12, v13.tv_sec);
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_0);
  }
  if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULogBinary(a1, 0, "BBULog", "", a3, v6, 32, v12);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
}

void sub_24BA273E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BBULogETLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  BBULogPrintDelegate(7, (uint64_t)a1, a2, a3);
}

void BBULogETLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(7, (uint64_t)v5, a3, a4);
}

void BBULogKTLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  BBULogPrintDelegate(8, (uint64_t)a1, a2, a3);
}

void BBULogKTLPrintErrorDelegate(const char *a1, const char *a2, va_list a3)
{
  BBULogPrintDelegate(0, (uint64_t)a1, a2, a3);
}

void BBULogKTLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(8, (uint64_t)v5, a3, a4);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

uint64_t DERLengthOfLength(unint64_t a1)
{
  uint64_t result;
  unint64_t v2;
  BOOL v3;

  if (a1 < 0x80)
    return 1;
  v2 = a1;
  result = 1;
  do
  {
    ++result;
    v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

unint64_t DEREncodeLength(unint64_t a1, unint64_t a2, unint64_t *a3)
{
  return DEREncodeLengthSized(a1, a2, *a3, (uint64_t *)a3);
}

unint64_t DEREncodeLengthSized(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  if (result >= 0x80)
  {
    v5 = 0;
    v6 = result;
    do
    {
      --v5;
      v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    v8 = -v5;
    v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        v4 = 1 - v5;
        *(_BYTE *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          v10 = (_BYTE *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            v11 = (_BYTE *)(a2 + *a4);
            while (v10 != (_BYTE *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2)
                goto LABEL_23;
              *v10-- = result;
              v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4)
                  goto LABEL_23;
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3)
    return 7;
  if (*a4)
  {
    *(_BYTE *)a2 = result;
    if (*a4)
    {
      v4 = 1;
LABEL_19:
      v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfItem(unint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;

  v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  v5 = 1;
  if (a2 >= 0x80)
  {
    v6 = a2;
    do
    {
      ++v5;
      v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  v7 = __CFADD__(v3, v5);
  v8 = v3 + v5;
  if (v7 || (result = v8 + a2, __CFADD__(v8, a2)))
    __break(0x5500u);
  return result;
}

uint64_t DEREncodeItem(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return DEREncodeItemSized(a1, a2, a3, a4, *a5, a5);
}

uint64_t DEREncodeItemSized(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  unint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v12 = *a6;
  v13 = DERLengthOfItem(a1, a2);
  if (v13 > a5)
    return 7;
  v15 = v13;
  if (v13 > *a6)
    goto LABEL_20;
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12)
    goto LABEL_20;
  result = DEREncodeTag(a1, a4, (unint64_t *)v22);
  if ((_DWORD)result)
    return result;
  v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  v17 = v15 >= v22[0];
  v18 = v15 - v22[0];
  if (!v17)
    goto LABEL_22;
  v19 = a4 + v12;
  v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20)
LABEL_20:
    __break(0x5519u);
  result = DEREncodeLengthSized(a2, v20, v18, v22);
  if ((_DWORD)result)
    return result;
  if (__CFADD__(v20, v22[0]))
    goto LABEL_21;
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2)
    goto LABEL_20;
  memmove(v21, a3, a2);
  return 0;
}

uint64_t DEREncodeTag(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;

  v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(_BYTE *)a2 = HIBYTE(result) & 0xE0 | result;
      v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  v4 = 0;
  v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  v7 = *a3;
  if (v4 >= *a3)
    return 7;
  if (v4 >= ~a2 || (*(_BYTE *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    v8 = v4 + 1;
    *(_BYTE *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      v9 = (_BYTE *)(a2 + v4 - 1);
      v10 = (_BYTE *)(a2 + v7);
      while (v9 != (_BYTE *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2)
          goto LABEL_21;
        v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11)
          goto LABEL_17;
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  unint64_t v8;
  unint64_t v11;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  const void **v27;
  __int16 v28;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  unint64_t v37;
  size_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v44;
  unint64_t v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = ~a6;
  if (~a6 < a7)
    goto LABEL_73;
  v11 = *a8;
  v44 = a7;
  v45[0] = 0;
  if (v11 < a7)
    goto LABEL_74;
  result = DEREncodeTag(a1, a6, &v44);
  if ((_DWORD)result)
    return result;
  if (v44 > v8)
    goto LABEL_73;
  v17 = a7 - v44;
  if (a7 < v44)
    goto LABEL_75;
  v18 = a6 + a7;
  v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v45);
    if ((_DWORD)result)
      return result;
    v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19)
      goto LABEL_74;
    v42 = a6 + v11;
    v20 = v45[0];
    result = DEREncodeLengthSized(v45[0], v19, v17, (uint64_t *)&v44);
    if ((_DWORD)result)
      return result;
    v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    v22 = v17 - v44;
    if (v17 >= v44)
    {
      v23 = (_BYTE *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18)
          return 7;
        if (a4)
        {
          v24 = 0;
          v25 = a2 + a3;
          v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5)
              goto LABEL_73;
            v26 = *(_QWORD *)(a5 + v24);
            if (v26 > ~a2)
              goto LABEL_73;
            v27 = (const void **)(a2 + v26);
            v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0)
              break;
            if ((v28 & 1) == 0)
              goto LABEL_29;
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
              goto LABEL_74;
            if (v27[1])
            {
LABEL_29:
              v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23)
                goto LABEL_74;
              result = DEREncodeTag(*(_QWORD *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if ((_DWORD)result)
                return result;
              if (__CFADD__(v23, v44))
                goto LABEL_73;
              v30 = v22 - v44;
              if (v22 < v44)
                goto LABEL_75;
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
                goto LABEL_74;
              v31 = (unint64_t)v27[1];
              v45[0] = v31;
              v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                v32 = 0;
                v45[0] = ++v31;
              }
              v33 = (unint64_t)&v23[v44];
              v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33)
                goto LABEL_74;
              result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if ((_DWORD)result)
                return result;
              v34 = v44;
              if (__CFADD__(v33, v44))
                goto LABEL_73;
              v35 = v30 - v44;
              if (v30 < v44)
                goto LABEL_75;
              v23 = (_BYTE *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (_BYTE *)-1)
                  goto LABEL_73;
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6)
                  goto LABEL_74;
                *v23 = 0;
                --v35;
                if (v30 == v34)
                  goto LABEL_75;
                ++v23;
              }
              if ((unint64_t)v23 > v42)
                goto LABEL_74;
              if ((unint64_t)v23 < a6)
                goto LABEL_74;
              v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23)
                goto LABEL_74;
              result = (uint64_t)memmove(v23, *v27, v36);
              v21 = v42;
              v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37))
                goto LABEL_73;
              v22 = v35 - v37;
              if (v35 < v37)
                goto LABEL_75;
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24)
              goto LABEL_71;
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
            goto LABEL_74;
          if ((unint64_t)v23 > v21)
            goto LABEL_74;
          if ((unint64_t)v23 < a6)
            goto LABEL_74;
          v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23)
            goto LABEL_74;
          result = (uint64_t)memmove(v23, *v27, v39);
          v21 = v42;
          v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37))
            goto LABEL_73;
          v40 = v22 >= v37;
          v22 -= v37;
          if (!v40)
            goto LABEL_75;
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t DERContentLengthOfEncodedSequence(unint64_t result, unint64_t a2, int a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unsigned __int8 **v10;
  __int16 v11;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;

  v5 = 0;
  if (!a3)
  {
LABEL_38:
    result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  v6 = 0;
  v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    v8 = *(_QWORD *)(a4 + 24 * v6);
    v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      v5 = 0;
      result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result)
      break;
    v10 = (unsigned __int8 **)(result + v8);
    v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if ((v11 & 1) != 0)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
          goto LABEL_43;
        if (!v10[1])
          goto LABEL_37;
      }
      v13 = *(_QWORD *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      v15 = __CFADD__(v5, v14);
      v16 = v5 + v14;
      if (v15)
        goto LABEL_42;
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
        goto LABEL_43;
      v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80)
          goto LABEL_25;
        v18 = 1;
        v21 = v17;
        do
        {
          ++v18;
          v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      v15 = __CFADD__(v16, v18);
      v22 = v16 + v18;
      if (v15)
        goto LABEL_42;
      v15 = __CFADD__(v22, v17);
      v5 = v22 + v17;
      if (v15)
        goto LABEL_42;
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
      goto LABEL_43;
    v20 = v10[1];
    v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15)
      goto LABEL_42;
LABEL_37:
    if (++v6 == a3)
      goto LABEL_38;
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequence(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2)
    return DEREncodeSequenceFromObject(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v17[0] = 0;
  result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v17);
  if (!(_DWORD)result)
  {
    v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      v13 = v17[0];
      do
      {
        ++v12;
        v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    v14 = __CFADD__(v10, v12);
    v15 = v10 + v12;
    if (v14 || (v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t DERLengthOfEncodedSequence(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2)
    __break(0x5519u);
  if (DERLengthOfEncodedSequenceFromObject(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5))
    return 0;
  else
    return v5[0];
}

uint64_t std::future<BOOL>::get(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(result + 8);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  if (!v2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void ctu::llvm::StringRef::StringRef()
{
  __assert_rtn("StringRef", "StringRef.h", 83, "Str && \"StringRef cannot be built from a NULL argument\"");
}

uint64_t BBUpdaterExecCommand()
{
  return MEMORY[0x24BED3458]();
}

uint64_t BBUpdaterExtremeCreateWithError()
{
  return MEMORY[0x24BED3460]();
}

uint64_t BBUpdaterRegisterLogSink()
{
  return MEMORY[0x24BED3470]();
}

uint64_t BBUpdaterSetOptions()
{
  return MEMORY[0x24BED3478]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

uint64_t ETLDebugRegisterDelegate()
{
  return MEMORY[0x24BED3E80]();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

uint64_t KTLCloseChannel()
{
  return MEMORY[0x24BED4BE8]();
}

uint64_t KTLDebugRegisterDelegate()
{
  return MEMORY[0x24BED4C08]();
}

uint64_t KTLInitOptions()
{
  return MEMORY[0x24BED4C88]();
}

uint64_t KTLOpenChannel()
{
  return MEMORY[0x24BED4CC8]();
}

uint64_t RPCopyProxyDictionary()
{
  return MEMORY[0x24BED8C70]();
}

uint64_t RPRegisterForAvailability()
{
  return MEMORY[0x24BED8C80]();
}

uint64_t RPRegistrationInvalidate()
{
  return MEMORY[0x24BED8C90]();
}

uint64_t RPRegistrationResume()
{
  return MEMORY[0x24BED8CA0]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x24BED8D60]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x24BED8DE0]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x24BED96D8]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x24BED96F8]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x24BED9700]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x24BED9728]();
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

uint64_t capabilities::diag::preferredInterface(capabilities::diag *this)
{
  return MEMORY[0x24BED9200](this);
}

uint64_t capabilities::euicc::supportsEOS(capabilities::euicc *this)
{
  return MEMORY[0x24BED9228](this);
}

uint64_t capabilities::euicc::supportsVinylRestore(capabilities::euicc *this)
{
  return MEMORY[0x24BED9230](this);
}

uint64_t capabilities::euicc::supportsGenericUpdater(capabilities::euicc *this)
{
  return MEMORY[0x24BED9240](this);
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x24BECE808](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9968](this);
}

uint64_t ctu::LogMessageBuffer::vCreateWithFormat(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x24BED9980](this, a2, a3);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x24BED9A90]();
}

{
  return MEMORY[0x24BED9A98]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED9AA0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x24BED9AB0](this);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

{
  return MEMORY[0x24BED9AE8]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9BB0](this, a2);
}

uint64_t ctu::Http::HttpRequest::create()
{
  return MEMORY[0x24BED9BD0]();
}

uint64_t ctu::basename()
{
  return MEMORY[0x24BED9C90]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x24BED9C98]();
}

uint64_t eUICC::SwitchMode::Perform()
{
  return MEMORY[0x24BED3FD0]();
}

uint64_t eUICC::GetVinylType::Perform()
{
  return MEMORY[0x24BED3FD8]();
}

uint64_t eUICC::DeleteProfile::Perform()
{
  return MEMORY[0x24BED3FE0]();
}

uint64_t eUICC::ValidatePerso::Perform()
{
  return MEMORY[0x24BED3FF0]();
}

uint64_t eUICC::VinylCommandDriver::GetVinylType()
{
  return MEMORY[0x24BED4DE8]();
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile()
{
  return MEMORY[0x24BED4DF0]();
}

uint64_t eUICC::VinylCommandDriver::ValidatePerso()
{
  return MEMORY[0x24BED4E00]();
}

uint64_t eUICC::VinylCommandDriver::SwitchCardMode()
{
  return MEMORY[0x24BED4E08]();
}

uint64_t eUICC::VinylCommandDriver::GetData()
{
  return MEMORY[0x24BED4E10]();
}

uint64_t eUICC::VinylCommandDriver::VinylCommandDriver()
{
  return MEMORY[0x24BED4E30]();
}

void eUICC::VinylCommandDriver::~VinylCommandDriver(eUICC::VinylCommandDriver *this)
{
  MEMORY[0x24BED4E38](this);
}

uint64_t eUICC::GetData::Perform()
{
  return MEMORY[0x24BED4010]();
}

uint64_t eUICC::StoreData::Perform()
{
  return MEMORY[0x24BED4018]();
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BECE8C0](this, a2, a3);
}

uint64_t AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
  return MEMORY[0x24BECEB58](this);
}

void AriSdk::ARI_IBIVinylTapeReq_SDK::~ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
  MEMORY[0x24BECEB60](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  return MEMORY[0x24BECF0A0](this);
}

void AriSdk::ARI_IBIVinylGetDataReq_SDK::~ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  MEMORY[0x24BECF0A8](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  return MEMORY[0x24BECF9B8](this);
}

void AriSdk::ARI_IBIVinylSwitchModeReq_SDK::~ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  MEMORY[0x24BECF9C0](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  return MEMORY[0x24BECFE20](this);
}

void AriSdk::ARI_IBIVinylValidatePsoReq_SDK::~ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  MEMORY[0x24BECFE28](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x24BED08C8](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  MEMORY[0x24BED08D0](this);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E98](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x24BED9EA8]();
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x24BEDABD8](__ns);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE98]();
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
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF70]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=()
{
  return MEMORY[0x24BEDB0F0]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_251CC9C38(__p);
}

void operator delete(void *__p)
{
  off_251CC9C40(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_251CC9C48(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CC9C50(__sz);
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x24BDAE6B0](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x24BDAF4F0]();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

