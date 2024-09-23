uint64_t RoseRestoreHost::create@<X0>(RoseRestoreHost *this@<X0>, const __CFString *a2@<X1>, ACFURestoreHost **a3@<X8>)
{
  ACFURestoreHost *v7;
  uint64_t result;

  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v7 = (ACFURestoreHost *)operator new(0xF8uLL);
  ACFURestoreHost::ACFURestoreHost(v7);
  *(_QWORD *)v7 = &unk_24E47C860;
  *((_QWORD *)v7 + 29) = 0;
  *((_QWORD *)v7 + 30) = 0;
  *a3 = v7;
  result = RoseRestoreHost::init(v7, this, a2);
  if ((result & 1) == 0)
  {
    *a3 = 0;
    return (*(uint64_t (**)(ACFURestoreHost *))(*(_QWORD *)v7 + 24))(v7);
  }
  return result;
}

void sub_21FA0F030(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  _Unwind_Resume(a1);
}

void RoseRestoreHost::RoseRestoreHost(RoseRestoreHost *this)
{
  _QWORD *v1;

  ACFURestoreHost::ACFURestoreHost(this);
  *v1 = &unk_24E47C860;
  v1[29] = 0;
  v1[30] = 0;
}

__CFDictionary *RoseRestoreHost::createRequest(ACFULogging *a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  ACFULogging *Request;
  __CFDictionary *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v12;

  if (*(_BYTE *)(a3 + 17))
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 0;
  }
  else
  {
    v4 = *(std::__shared_weak_count **)(a2 + 8);
    v12 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    Request = (ACFULogging *)ACFURestoreHost::createRequest();
    v8 = Request;
    if (v12)
    {
      v9 = (unint64_t *)&v12->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (v8)
    {
      if (*(_BYTE *)(a3 + 16))
        CFDictionaryRemoveValue(v8, CFSTR("Rap,RestoreRTKitOS"));
    }
    else
    {
      ACFULogging::getLogInstance(Request);
      ACFULogging::handleMessage();
    }
  }
  return v8;
}

void sub_21FA0F19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void RoseRestoreHost::~RoseRestoreHost(RoseRestoreHost *this)
{
  *(_QWORD *)this = &unk_24E47C860;
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)this + 232);
  ACFURestoreHost::~ACFURestoreHost(this);
}

{
  *(_QWORD *)this = &unk_24E47C860;
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)this + 232);
  ACFURestoreHost::~ACFURestoreHost(this);
}

{
  void *v2;

  *(_QWORD *)this = &unk_24E47C860;
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)this + 232);
  ACFURestoreHost::~ACFURestoreHost(this);
  operator delete(v2);
}

uint64_t RoseRestoreHost::init(RoseRestoreHost *this, CFTypeRef cf, const __CFString *a3)
{
  RoseRestoreHost *v5;
  RoseRestoreHost *v6;
  const __CFDictionary *v7;
  RoseRestoreHost *v8;
  const __CFData *v9;
  RoseRestoreHost *v10;
  const UInt8 *BytePtr;
  RoseCapabilities **v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char **v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  _BYTE *v55;
  _BYTE *v56;
  uint64_t v57;
  char v58;
  CFTypeID TypeID;
  CFTypeID v60;
  CFTypeID v61;
  CFTypeID v62;
  CFTypeID v63;
  CFTypeID v64;
  CFTypeID v65;
  __int128 __src;
  __int128 v68;
  __int128 v69;
  const __CFString *v70;
  CFTypeID v71;
  unint64_t v72[6];
  unint64_t v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  if (!cf)
    goto LABEL_74;
  v5 = this;
  v6 = (RoseRestoreHost *)CFGetTypeID(cf);
  this = (RoseRestoreHost *)CFDictionaryGetTypeID();
  if (v6 != this)
    goto LABEL_74;
  this = (RoseRestoreHost *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("DeviceInfo"));
  if (!this)
    goto LABEL_74;
  v7 = this;
  v8 = (RoseRestoreHost *)CFGetTypeID(this);
  this = (RoseRestoreHost *)CFDictionaryGetTypeID();
  if (v8 != this)
    goto LABEL_74;
  this = (RoseRestoreHost *)CFDictionaryGetValue(v7, CFSTR("Rap,ChipID"));
  if (this
    && (v9 = this, v10 = (RoseRestoreHost *)CFGetTypeID(this), this = (RoseRestoreHost *)CFDataGetTypeID(), v10 == this)
    && (this = (RoseRestoreHost *)CFDataGetLength(v9), this == (RoseRestoreHost *)2))
  {
    BytePtr = CFDataGetBytePtr(v9);
    RoseCapabilities::create((RoseCapabilities *)*(unsigned __int16 *)BytePtr, (RoseCapabilities **)&__src);
    v12 = (RoseCapabilities **)((char *)v5 + 232);
    v13 = std::shared_ptr<RoseCapabilities>::operator=[abi:ne180100]((uint64_t)v5 + 232, &__src);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&__src + 1);
    if (*((_QWORD *)&__src + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&__src + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (*v12)
    {
      __src = xmmword_24E47C890;
      v68 = *(_OWORD *)&off_24E47C8A0;
      v17 = (char **)((char *)v5 + 40);
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 40, (char *)&__src, (uint64_t)&v69, 4uLL);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29)))
      {
        v18 = *((_QWORD *)v5 + 7);
        v19 = (_QWORD *)*((_QWORD *)v5 + 6);
        if ((unint64_t)v19 >= v18)
        {
          v21 = ((char *)v19 - *v17) >> 3;
          if ((unint64_t)(v21 + 1) >> 61)
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          v22 = v18 - (_QWORD)*v17;
          v23 = v22 >> 2;
          if (v22 >> 2 <= (unint64_t)(v21 + 1))
            v23 = v21 + 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
            v24 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)v5 + 56, v24);
          else
            v25 = 0;
          v26 = &v25[8 * v21];
          v27 = &v25[8 * v24];
          *(_QWORD *)v26 = CFSTR("Rap,RTKitIOConfig");
          v20 = v26 + 8;
          v29 = (char *)*((_QWORD *)v5 + 5);
          v28 = (char *)*((_QWORD *)v5 + 6);
          if (v28 != v29)
          {
            do
            {
              v30 = *((_QWORD *)v28 - 1);
              v28 -= 8;
              *((_QWORD *)v26 - 1) = v30;
              v26 -= 8;
            }
            while (v28 != v29);
            v28 = *v17;
          }
          *((_QWORD *)v5 + 5) = v26;
          *((_QWORD *)v5 + 6) = v20;
          *((_QWORD *)v5 + 7) = v27;
          if (v28)
            operator delete(v28);
        }
        else
        {
          *v19 = CFSTR("Rap,RTKitIOConfig");
          v20 = v19 + 1;
        }
        *((_QWORD *)v5 + 6) = v20;
      }
      if (RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*v12))
      {
        v31 = *((_QWORD *)v5 + 7);
        v32 = (_QWORD *)*((_QWORD *)v5 + 6);
        if ((unint64_t)v32 >= v31)
        {
          v34 = ((char *)v32 - *v17) >> 3;
          if ((unint64_t)(v34 + 1) >> 61)
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          v35 = v31 - (_QWORD)*v17;
          v36 = v35 >> 2;
          if (v35 >> 2 <= (unint64_t)(v34 + 1))
            v36 = v34 + 1;
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
            v37 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v37 = v36;
          if (v37)
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)v5 + 56, v37);
          else
            v38 = 0;
          v39 = &v38[8 * v34];
          v40 = &v38[8 * v37];
          *(_QWORD *)v39 = CFSTR("Rap,RestoreRTKitOS");
          v33 = v39 + 8;
          v42 = (char *)*((_QWORD *)v5 + 5);
          v41 = (char *)*((_QWORD *)v5 + 6);
          if (v41 != v42)
          {
            do
            {
              v43 = *((_QWORD *)v41 - 1);
              v41 -= 8;
              *((_QWORD *)v39 - 1) = v43;
              v39 -= 8;
            }
            while (v41 != v42);
            v41 = *v17;
          }
          *((_QWORD *)v5 + 5) = v39;
          *((_QWORD *)v5 + 6) = v33;
          *((_QWORD *)v5 + 7) = v40;
          if (v41)
            operator delete(v41);
        }
        else
        {
          *v32 = CFSTR("Rap,RestoreRTKitOS");
          v33 = v32 + 1;
        }
        *((_QWORD *)v5 + 6) = v33;
      }
      __src = xmmword_24E47C8C0;
      v68 = *(_OWORD *)&off_24E47C8D0;
      v69 = xmmword_24E47C8E0;
      v70 = CFSTR("Rap,SecurityDomain");
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 64, (char *)&__src, (uint64_t)&v71, 7uLL);
      *(_QWORD *)&__src = CFSTR("@Rap,Ticket");
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 88, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
      *(_QWORD *)&__src = CFSTR("Rap,Ticket");
      std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)v5 + 112, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
      __src = xmmword_24E47C8F8;
      v68 = *(_OWORD *)&off_24E47C908;
      v69 = xmmword_24E47C918;
      v44 = (_QWORD *)((char *)v5 + 136);
      std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>((char *)v5 + 136, (char *)&__src, (uint64_t)&v70, 3uLL);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29)))
      {
        v45 = *((_QWORD *)v5 + 19);
        v46 = *((_QWORD *)v5 + 18);
        if (v46 >= v45)
        {
          v48 = (uint64_t)(v46 - *v44) >> 4;
          v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 60)
            std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
          v50 = v45 - *v44;
          if (v50 >> 3 > v49)
            v49 = v50 >> 3;
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
            v51 = 0xFFFFFFFFFFFFFFFLL;
          else
            v51 = v49;
          if (v51)
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>((uint64_t)v5 + 152, v51);
          else
            v52 = 0;
          v53 = &v52[16 * v48];
          v54 = &v52[16 * v51];
          *(_QWORD *)v53 = CFSTR("Rap,RTKitIOConfig");
          v53[8] = 1;
          v47 = v53 + 16;
          v56 = (_BYTE *)*((_QWORD *)v5 + 17);
          v55 = (_BYTE *)*((_QWORD *)v5 + 18);
          if (v55 != v56)
          {
            do
            {
              v57 = *((_QWORD *)v55 - 2);
              v55 -= 16;
              v58 = v55[8];
              *((_QWORD *)v53 - 2) = v57;
              v53 -= 16;
              v53[8] = v58;
            }
            while (v55 != v56);
            v55 = (_BYTE *)*v44;
          }
          *((_QWORD *)v5 + 17) = v53;
          *((_QWORD *)v5 + 18) = v47;
          *((_QWORD *)v5 + 19) = v54;
          if (v55)
            operator delete(v55);
        }
        else
        {
          *(_QWORD *)v46 = CFSTR("Rap,RTKitIOConfig");
          *(_BYTE *)(v46 + 8) = 1;
          v47 = (char *)(v46 + 16);
        }
        *((_QWORD *)v5 + 18) = v47;
      }
      TypeID = CFNumberGetTypeID();
      *(_QWORD *)&__src = CFSTR("Rap,ChipID");
      *((_QWORD *)&__src + 1) = TypeID;
      v60 = CFNumberGetTypeID();
      *(_QWORD *)&v68 = CFSTR("Rap,BoardID");
      *((_QWORD *)&v68 + 1) = v60;
      v61 = CFNumberGetTypeID();
      *(_QWORD *)&v69 = CFSTR("Rap,SecurityDomain");
      *((_QWORD *)&v69 + 1) = v61;
      v62 = CFBooleanGetTypeID();
      v70 = CFSTR("Rap,ProductionMode");
      v71 = v62;
      v63 = CFBooleanGetTypeID();
      v72[0] = (unint64_t)CFSTR("Rap,SecurityMode");
      v72[1] = v63;
      v64 = CFNumberGetTypeID();
      v72[2] = (unint64_t)CFSTR("Rap,ECID");
      v72[3] = v64;
      v65 = CFDataGetTypeID();
      v72[4] = (unint64_t)CFSTR("Rap,Nonce");
      v72[5] = v65;
      std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>((uint64_t **)v5 + 20, (unint64_t *)&__src, v73);
      if (RoseCapabilities::supportsRTKitIOConfig(*((RoseCapabilities **)v5 + 29)))
        *((_QWORD *)v5 + 23) = CFSTR("Rap,FdrRootCaDigest");
      if (RoseCapabilities::supportsRTKitIOConfig(*v12))
        *((_QWORD *)v5 + 24) = CFSTR("Rap,FDRAllowUnsealed");
      *(_QWORD *)&__src = CFSTR("Rap,RTKitOS");
      WORD4(__src) = 1;
      *(_QWORD *)&v68 = CFSTR("Rap,RestoreRTKitOS");
      WORD4(v68) = 1;
      *(_QWORD *)&v69 = CFSTR("Rap,SoftwareBinaryDsp1");
      WORD4(v69) = 0;
      v70 = CFSTR("Rap,RTKitIOConfig");
      LOWORD(v71) = 0;
      std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>((uint64_t **)v5 + 25, (unint64_t *)&__src, v72);
      *((_QWORD *)v5 + 28) = CFSTR("Rose");
      v13 = ACFURestoreHost::init(v5, (const __CFDictionary *)cf, a3);
      if ((v13 & 1) != 0)
        return 1;
    }
    ACFULogging::getLogInstance((ACFULogging *)v13);
    ACFULogging::handleMessage();
  }
  else
  {
LABEL_74:
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t std::shared_ptr<RoseCapabilities>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

const void *RoseRestoreHost::copyFirmwareUpdater(uint64_t a1, const __CFDictionary *a2)
{
  const std::string::value_type **v3;
  __int128 v4;
  const std::string::value_type **v5;
  __int128 v6;
  const std::string::value_type **v7;
  __int128 v8;
  const std::string::value_type **v9;
  __int128 v10;
  const __CFDictionary *Value;
  const __CFDictionary *v12;
  CFTypeID v13;
  const __CFData *v14;
  CFTypeID TypeID;
  ACFULogging *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  CFTypeID v20;
  CFTypeID v21;
  ACFULogging *BytePtr;
  ACFULogging *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  __int128 v27;
  const void *v28;
  const void *v29;
  CFTypeID v30;
  ACFUFTABFile *v31;
  ACFULogging *v32;
  ACFULogging *v33;
  const void *v34;
  const void *v35;
  CFTypeID v36;
  uint64_t (***v37)(_QWORD, std::string *);
  ACFULogging *v38;
  const void *v39;
  const void *v40;
  CFTypeID v41;
  uint64_t (***v42)(_QWORD, std::string *);
  ACFULogging *v43;
  uint64_t (***v44)(_QWORD, std::string *);
  ACFUFTABFile *v45;
  int v46;
  int v47;
  char v48;
  char v49;
  const void *v50;
  const void *v51;
  CFTypeID v52;
  ACFULogging *v53;
  std::string *v54;
  __int128 v55;
  std::string *v56;
  __int128 v57;
  ACFULogging *v59;
  ACFULogging *v60;
  ACFULogging *v61;
  ACFULogging *v62;
  ACFULogging *v63;
  ACFULogging *v64;
  ACFULogging *v65;
  ACFULogging *v66;
  ACFULogging *v67;
  ACFULogging *v68;
  ACFULogging *v69;
  ACFULogging *v70;
  ACFULogging *v71;
  unint64_t v72;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *__p;
  char v87;
  void *v88;
  char v89;
  void *v90;
  char v91;
  void *v92;
  char v93;
  void *v94;
  char v95;
  std::string v96;
  std::string v97;
  void *v98;
  char v99;
  void *v100;
  char v101;
  void *v102;
  char v103;
  void *v104;
  char v105;
  __int128 v106;
  std::string::size_type v107;
  std::string v108;
  std::string v109;
  std::string v110;
  std::string v111;

  GetRoseTatsuTagToFileNameMap((uint64_t)&v110);
  v3 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v110, (unint64_t *)&kRoseRestoreRtkitos);
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v111, *v3, (std::string::size_type)v3[1]);
  }
  else
  {
    v4 = *(_OWORD *)v3;
    v111.__r_.__value_.__r.__words[2] = (std::string::size_type)v3[2];
    *(_OWORD *)&v111.__r_.__value_.__l.__data_ = v4;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v110, (char *)v110.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v109);
  v5 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v109, (unint64_t *)kRoseRtkitos);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v110, *v5, (std::string::size_type)v5[1]);
  }
  else
  {
    v6 = *(_OWORD *)v5;
    v110.__r_.__value_.__r.__words[2] = (std::string::size_type)v5[2];
    *(_OWORD *)&v110.__r_.__value_.__l.__data_ = v6;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v109, (char *)v109.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v108);
  v7 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v108, (unint64_t *)&kRoseSwDsp1);
  if (*((char *)v7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v109, *v7, (std::string::size_type)v7[1]);
  }
  else
  {
    v8 = *(_OWORD *)v7;
    v109.__r_.__value_.__r.__words[2] = (std::string::size_type)v7[2];
    *(_OWORD *)&v109.__r_.__value_.__l.__data_ = v8;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v108, (char *)v108.__r_.__value_.__l.__size_);
  GetRoseTatsuTagToFileNameMap((uint64_t)&v106);
  v9 = (const std::string::value_type **)std::map<__CFString const*,std::string>::at((uint64_t)&v106, (unint64_t *)&kRoseRtkitosICNF);
  if (*((char *)v9 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v108, *v9, (std::string::size_type)v9[1]);
  }
  else
  {
    v10 = *(_OWORD *)v9;
    v108.__r_.__value_.__r.__words[2] = (std::string::size_type)v9[2];
    *(_OWORD *)&v108.__r_.__value_.__l.__data_ = v10;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v106, *((char **)&v106 + 1));
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("DeviceInfo"));
  v12 = Value;
  if (!Value || (v13 = CFGetTypeID(Value), v13 != CFDictionaryGetTypeID()))
  {
    std::string::basic_string[abi:ne180100]<0>(&v104, "copyFirmwareUpdater: failed to get device info list");
    v60 = (ACFULogging *)ACFUError::addError();
    if (v105 < 0)
      operator delete(v104);
    ACFULogging::getLogInstance(v60);
    goto LABEL_112;
  }
  v14 = (const __CFData *)CFDictionaryGetValue(v12, CFSTR("Rap,RestoreBootNonce"));
  if (v14 && (TypeID = CFDataGetTypeID(), v16 = (ACFULogging *)CFGetTypeID(v14), (ACFULogging *)TypeID == v16))
  {
    ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage();
    if (CFDataGetLength(v14) != 8)
    {
      std::string::basic_string[abi:ne180100]<0>(&v102, "copyFirmwareUpdater: nonce is of unexpected size");
      v71 = (ACFULogging *)ACFUError::addError();
      if (v103 < 0)
        operator delete(v102);
      ACFULogging::getLogInstance(v71);
      goto LABEL_112;
    }
    v72 = *(_QWORD *)CFDataGetBytePtr(v14);
  }
  else
  {
    v72 = 0;
  }
  v17 = CFDictionaryGetValue(v12, CFSTR("Rap,ChipRev"));
  v18 = CFDictionaryGetValue(v12, CFSTR("Rap,BoardID"));
  if (!v17
    || (v19 = v18) == 0
    || (v20 = CFDataGetTypeID(), v20 != CFGetTypeID(v17))
    || (v21 = CFDataGetTypeID(), v21 != CFGetTypeID(v19)))
  {
    std::string::basic_string[abi:ne180100]<0>(&v100, "copyFirmwareUpdater: unexpected device info parameters");
    v59 = (ACFULogging *)ACFUError::addError();
    if (v101 < 0)
      operator delete(v100);
    ACFULogging::getLogInstance(v59);
    goto LABEL_112;
  }
  if (CFDataGetLength((CFDataRef)v17) != 2 || CFDataGetLength((CFDataRef)v19) != 2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v98, "copyFirmwareUpdater: bad device info parameters");
    v61 = (ACFULogging *)ACFUError::addError();
    if (v99 < 0)
      operator delete(v98);
    ACFULogging::getLogInstance(v61);
LABEL_112:
    v31 = 0;
    v42 = 0;
    v37 = 0;
    ACFULogging::handleMessage();
    v51 = 0;
    goto LABEL_88;
  }
  CFDataGetBytePtr((CFDataRef)v17);
  BytePtr = (ACFULogging *)CFDataGetBytePtr((CFDataRef)v19);
  ACFULogging::getLogInstance(BytePtr);
  v23 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v96, "RoseRestoreHost");
  v24 = std::string::append(&v96, "::");
  v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v97.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v97.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  v26 = std::string::append(&v97, "copyFirmwareUpdater");
  v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v107 = v26->__r_.__value_.__r.__words[2];
  v106 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v107) < 0)
    operator delete((void *)v106);
  if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v97.__r_.__value_.__l.__data_);
  if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v96.__r_.__value_.__l.__data_);
  v28 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
  v29 = v28;
  if (v28)
  {
    v30 = CFGetTypeID(v28);
    if (v30 == CFDataGetTypeID())
    {
      ACFUFTABFile::create();
      v31 = (ACFUFTABFile *)v106;
      if (!(_QWORD)v106)
      {
        std::string::basic_string[abi:ne180100]<0>(&v92, "copyFirmware: failed to init bundle firmware");
        v67 = (ACFULogging *)ACFUError::addError();
        if (v93 < 0)
          operator delete(v92);
        ACFULogging::getLogInstance(v67);
        v31 = 0;
        v42 = 0;
        v37 = 0;
        ACFULogging::handleMessage();
        v50 = 0;
        v35 = 0;
        v40 = 0;
        v51 = 0;
        goto LABEL_82;
      }
      if (!(*(unsigned int (**)(_QWORD, std::string *))(*(_QWORD *)v106 + 16))(v106, &v109)
        || ((*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(_QWORD *)v31 + 16))(v31, &v110) & 1) == 0)
      {
        std::string::basic_string[abi:ne180100]<0>(&v90, "copyFirmware: bundle firmware specified is invalid");
        v63 = (ACFULogging *)ACFUError::addError();
        if (v91 < 0)
          operator delete(v90);
        ACFULogging::getLogInstance(v63);
        v42 = 0;
        v37 = 0;
        ACFULogging::handleMessage();
        v50 = 0;
        v35 = 0;
        v40 = 0;
        v51 = 0;
        goto LABEL_82;
      }
      if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 232)))
      {
        v32 = (ACFULogging *)(*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(_QWORD *)v31 + 16))(v31, &v108);
        if ((v32 & 1) == 0)
        {
          ACFULogging::getLogInstance(v32);
          ACFULogging::handleMessage();
        }
      }
      v33 = (ACFULogging *)CFDictionaryContainsKey(a2, *(const void **)(a1 + 8));
      if ((_DWORD)v33)
      {
        v34 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
        v35 = v34;
        if (!v34 || (v36 = CFGetTypeID(v34), v36 != CFDataGetTypeID()))
        {
          std::string::basic_string[abi:ne180100]<0>(&v88, "copyFirmware: rooted override data unavailable");
          v65 = (ACFULogging *)ACFUError::addError();
          if (v89 < 0)
            operator delete(v88);
          ACFULogging::getLogInstance(v65);
          goto LABEL_126;
        }
        ACFUFTABFile::create();
        v37 = (uint64_t (***)(_QWORD, std::string *))v106;
        if (!(_QWORD)v106)
        {
          std::string::basic_string[abi:ne180100]<0>(&__p, "copyFirmware: failed to init ftab file object");
          v38 = (ACFULogging *)ACFUError::addError();
          if (v87 < 0)
            operator delete(__p);
          ACFULogging::getLogInstance(v38);
LABEL_126:
          v42 = 0;
          v37 = 0;
          ACFULogging::handleMessage();
          v50 = 0;
          v40 = 0;
          v51 = 0;
LABEL_82:
          CFRelease(v29);
          if (v40)
            CFRelease(v40);
          if (v35)
            CFRelease(v35);
          if (v50)
            CFRelease(v50);
          goto LABEL_88;
        }
      }
      else
      {
        ACFULogging::getLogInstance(v33);
        v37 = 0;
        ACFULogging::handleMessage();
        v35 = 0;
      }
      if (CFDictionaryContainsKey(a2, CFSTR("Rap,RestoreRTKitOS")))
      {
        v39 = (const void *)ACFURestoreHost::copyDataFromFileDictionary();
        v40 = v39;
        if (v39 && (v41 = CFGetTypeID(v39), v41 == CFDataGetTypeID()))
        {
          ACFUFTABFile::create();
          v42 = (uint64_t (***)(_QWORD, std::string *))v106;
          if ((_QWORD)v106)
          {
            if (((*(uint64_t (**)(_QWORD, std::string *))(*(_QWORD *)v106 + 16))(v106, &v111) & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v80, "copyFirmware: bundle cert firmware doesn't have rrko");
              v43 = (ACFULogging *)ACFUError::addError();
              if (v81 < 0)
                operator delete(v80);
              ACFULogging::getLogInstance(v43);
              ACFULogging::handleMessage();
LABEL_140:
              v50 = 0;
LABEL_144:
              v51 = 0;
              goto LABEL_82;
            }
LABEL_57:
            v44 = v42;
            v45 = v31;
            if (v37)
            {
              v46 = (*v37)[2](v37, &v111);
              v47 = (*v37)[2](v37, &v110);
              if (v46)
                v44 = v37;
              else
                v44 = v42;
              if (v47)
                v45 = (ACFUFTABFile *)v37;
              else
                v45 = v31;
            }
            v48 = (*(uint64_t (**)(ACFUFTABFile *, std::string *))(*(_QWORD *)v45 + 16))(v45, &v111);
            if (v44)
              v49 = v48;
            else
              v49 = 1;
            if ((v49 & 1) != 0)
            {
              v50 = 0;
            }
            else
            {
              v50 = (const void *)(**v44)(v44, &v111);
              if (!v50)
              {
                std::string::basic_string[abi:ne180100]<0>(&v78, "copyFirmware: could not get 'rrko' object from ftab");
                v69 = (ACFULogging *)ACFUError::addError();
                if (v79 < 0)
                  operator delete(v78);
                ACFULogging::getLogInstance(v69);
                ACFULogging::handleMessage();
                goto LABEL_140;
              }
              if ((ACFUFTABFile::addNewFileToFTAB() & 1) == 0)
              {
                std::string::basic_string[abi:ne180100]<0>(&v76, "copyFirmware: could not add 'rrko' object to final ftab");
                v70 = (ACFULogging *)ACFUError::addError();
                if (v77 < 0)
                  operator delete(v76);
                ACFULogging::getLogInstance(v70);
                ACFULogging::handleMessage();
                goto LABEL_144;
              }
            }
            if (v72)
              ACFUFTABFile::setBootNonce(v45);
            v51 = (const void *)(*(uint64_t (**)(ACFUFTABFile *))(*(_QWORD *)v45 + 40))(v45);
            if (v51 && (v52 = CFDataGetTypeID(), v53 = (ACFULogging *)CFGetTypeID(v51), (ACFULogging *)v52 == v53))
            {
              ACFULogging::getLogInstance(v53);
              std::string::basic_string[abi:ne180100]<0>(&v96, "RoseRestoreHost");
              v54 = std::string::append(&v96, "::");
              v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
              v97.__r_.__value_.__r.__words[2] = v54->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v97.__r_.__value_.__l.__data_ = v55;
              v54->__r_.__value_.__l.__size_ = 0;
              v54->__r_.__value_.__r.__words[2] = 0;
              v54->__r_.__value_.__r.__words[0] = 0;
              v56 = std::string::append(&v97, "copyFirmwareUpdater");
              v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
              v107 = v56->__r_.__value_.__r.__words[2];
              v106 = v57;
              v56->__r_.__value_.__l.__size_ = 0;
              v56->__r_.__value_.__r.__words[2] = 0;
              v56->__r_.__value_.__r.__words[0] = 0;
              ACFULogging::handleMessageCFType();
              if (SHIBYTE(v107) < 0)
                operator delete((void *)v106);
              if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v97.__r_.__value_.__l.__data_);
              if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v96.__r_.__value_.__l.__data_);
              (*(void (**)(ACFUFTABFile *))(*(_QWORD *)v45 + 24))(v45);
            }
            else
            {
              std::string::basic_string[abi:ne180100]<0>(&v74, "copyFirmware: could not create output data");
              v64 = (ACFULogging *)ACFUError::addError();
              if (v75 < 0)
                operator delete(v74);
              ACFULogging::getLogInstance(v64);
              ACFULogging::handleMessage();
            }
            goto LABEL_82;
          }
          std::string::basic_string[abi:ne180100]<0>(&v82, "copyFirmware: failed to init certification firmware");
          v68 = (ACFULogging *)ACFUError::addError();
          if (v83 < 0)
            operator delete(v82);
          ACFULogging::getLogInstance(v68);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v84, "copyFirmware: rrko bundle data unavailable");
          v66 = (ACFULogging *)ACFUError::addError();
          if (v85 < 0)
            operator delete(v84);
          ACFULogging::getLogInstance(v66);
        }
        v42 = 0;
        ACFULogging::handleMessage();
        v50 = 0;
        v51 = 0;
        goto LABEL_82;
      }
      v42 = 0;
      v40 = 0;
      goto LABEL_57;
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&v94, "copyFirmware: rkos bundle data unavailable");
  v62 = (ACFULogging *)ACFUError::addError();
  if (v95 < 0)
    operator delete(v94);
  ACFULogging::getLogInstance(v62);
  ACFULogging::handleMessage();
  v50 = 0;
  v35 = 0;
  v40 = 0;
  v51 = 0;
  v37 = 0;
  v42 = 0;
  v31 = 0;
  if (v29)
    goto LABEL_82;
LABEL_88:
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v108.__r_.__value_.__l.__data_);
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v109.__r_.__value_.__l.__data_);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v110.__r_.__value_.__l.__data_);
  if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v111.__r_.__value_.__l.__data_);
  if (v37)
    ((void (*)(uint64_t (***)(_QWORD, std::string *)))(*v37)[7])(v37);
  if (v42)
    ((void (*)(uint64_t (***)(_QWORD, std::string *)))(*v42)[7])(v42);
  if (v31)
    (*(void (**)(ACFUFTABFile *))(*(_QWORD *)v31 + 56))(v31);
  return v51;
}

void sub_21FA109C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *__p,uint64_t a62,int a63)
{
  char a66;
  uint64_t v66;

  if (a66 < 0)
    operator delete(__p);
  if (*(char *)(v66 - 185) < 0)
    operator delete(*(void **)(v66 - 208));
  if (*(char *)(v66 - 153) < 0)
    operator delete(*(void **)(v66 - 176));
  if (*(char *)(v66 - 121) < 0)
    operator delete(*(void **)(v66 - 144));
  if (*(char *)(v66 - 89) < 0)
    operator delete(*(void **)(v66 - 112));
  _Unwind_Resume(a1);
}

_QWORD *std::map<__CFString const*,std::string>::at(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
LABEL_8:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  v3 = *a2;
  while (1)
  {
    while (1)
    {
      v4 = v2[4];
      if (v3 >= v4)
        break;
      v2 = (_QWORD *)*v2;
      if (!v2)
        goto LABEL_8;
    }
    if (v4 >= v3)
      return v2 + 5;
    v2 = (_QWORD *)v2[1];
    if (!v2)
      goto LABEL_8;
  }
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E47C6D8, MEMORY[0x24BEDAAF0]);
}

void sub_21FA10E34(_Unwind_Exception *a1)
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

uint64_t std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](uint64_t a1)
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

char *std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<__CFString const*>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<__CFString const*>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<__CFString const*>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<__CFString const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

char *std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  char *v20;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60)
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<ACFURestoreHost::FileList>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v17 - 7;
      v19 = v9;
      v20 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 4;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9 - 7);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v17 - 7;
    v19 = v9;
    v20 = v16;
LABEL_18:
    result = (char *)memmove(v19, v20, v18);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<ACFURestoreHost::FileList>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ACFURestoreHost::FileList>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t **std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v10 = result;
    v11 = v8;
    v12 = v8;
    if (v8)
    {
      v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__node_assign_unique(v5, a2, v8);
        if ((v9 & 1) != 0)
        {
          v8 = v11;
          v12 = v11;
          if (!v11)
          {
            a2 += 2;
            break;
          }
          v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          v8 = v12;
        }
        a2 += 2;
        if (!v8)
          break;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(v5, a2, a2);
    a2 += 2;
  }
  return result;
}

void sub_21FA1137C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__node_assign_unique(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t v9;

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
        v8 = v5[4];
        if (v6 >= v8)
          break;
        v5 = *v7;
        v4 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= v6)
        return (uint64_t *)v7;
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
    v9 = a2[1];
    a3[4] = v6;
    a3[5] = v9;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v7, v4, a3);
  }
  return a3;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

_QWORD *std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
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

uint64_t std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
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
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

void std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
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
        v9 = v5[4];
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
    v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t **std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v10 = result;
    v11 = v8;
    v12 = v8;
    if (v8)
    {
      v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__node_assign_unique(v5, a2, (uint64_t)v8);
        if ((v9 & 1) != 0)
        {
          v8 = v11;
          v12 = v11;
          if (!v11)
          {
            a2 += 2;
            break;
          }
          v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          v8 = v12;
        }
        a2 += 2;
        if (!v8)
          break;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__emplace_unique_key_args<__CFString const*,std::pair<__CFString const* const,unsigned long> const&>(v5, a2, a2);
    a2 += 2;
  }
  return result;
}

void sub_21FA1189C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__node_assign_unique(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t **v7;
  unint64_t v8;

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
        v8 = v5[4];
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
    *(_QWORD *)(a3 + 32) = v6;
    *(_WORD *)(a3 + 40) = *((_WORD *)a2 + 4);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }
  return (uint64_t **)a3;
}

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[63] < 0)
      operator delete(*((void **)a2 + 5));
    operator delete(a2);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E47C6E0, MEMORY[0x24BEDAB00]);
}

void sub_21FA119D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t RoseBootstrappedPreflight::getUnsignedFirmwarePath(RoseBootstrappedPreflight *this)
{
  if (RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once != -1)
    dispatch_once(&RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once, &__block_literal_global);
  return RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path;
}

uint64_t ___ZN25RoseBootstrappedPreflight23getUnsignedFirmwarePathEv_block_invoke()
{
  const __CFString *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = CFSTR("/usr/standalone/firmware/Rose/r1p0/ftab.bin");
  result = MGGetProductType();
  if (result > 2625074842)
  {
    if (result <= 3571532205)
    {
      if (result <= 2941181570)
      {
        if (result <= 2793418700)
        {
          if (result != 2625074843)
          {
            if (result != 2688879999)
            {
              v2 = 2722529672;
              goto LABEL_59;
            }
LABEL_45:
            v0 = CFSTR("/usr/standalone/firmware/Rose/r1p3/ftab.bin");
            goto LABEL_82;
          }
LABEL_77:
          v0 = CFSTR("/usr/standalone/firmware/Rose/r2w0/ftab.bin");
          goto LABEL_82;
        }
        if (result != 2793418701)
        {
          if (result != 2795618603)
          {
            if (result == 2940697645)
              goto LABEL_45;
            goto LABEL_83;
          }
LABEL_80:
          v0 = CFSTR("/usr/standalone/firmware/Rose/r2p1/ftab.bin");
          goto LABEL_82;
        }
LABEL_81:
        v0 = CFSTR("/usr/standalone/firmware/Rose/r2p0/ftab.bin");
        goto LABEL_82;
      }
      if (result <= 3001488777)
      {
        if (result == 2941181571)
          goto LABEL_80;
        if (result != 2943112657)
        {
          if (result != 2979575960)
            goto LABEL_83;
LABEL_61:
          v0 = CFSTR("/usr/standalone/firmware/Rose/r1w1/ftab.bin");
          goto LABEL_82;
        }
LABEL_72:
        v0 = CFSTR("/usr/standalone/firmware/Rose/r1w0/ftab.bin");
        goto LABEL_82;
      }
      if (result != 3001488778)
      {
        if (result == 3143587592)
          goto LABEL_77;
        if (result == 3348380076)
        {
          v0 = CFSTR("/usr/standalone/firmware/Rose/r1hp0/ftab.bin");
          goto LABEL_82;
        }
        goto LABEL_83;
      }
LABEL_76:
      v0 = CFSTR("/usr/standalone/firmware/Rose/r1p1/ftab.bin");
      goto LABEL_82;
    }
    if (result <= 3825599859)
    {
      if (result > 3742999857)
      {
        if (result == 3742999858)
          goto LABEL_71;
        if (result == 3767261006)
          goto LABEL_61;
        v3 = 3819635030;
        goto LABEL_54;
      }
      if (result == 3571532206)
        goto LABEL_72;
      if (result != 3585085679)
      {
        v3 = 3663011141;
LABEL_54:
        if (result != v3)
          goto LABEL_83;
        goto LABEL_71;
      }
LABEL_70:
      v0 = CFSTR("/usr/standalone/firmware/Rose/r1p2/ftab.bin");
      goto LABEL_82;
    }
    if (result > 3885279869)
    {
      if (result != 4201643249)
      {
        if (result == 4068102502)
          goto LABEL_77;
        if (result != 3885279870)
          goto LABEL_83;
      }
      goto LABEL_76;
    }
    if (result == 3825599860)
      goto LABEL_81;
    if (result == 3839750255)
      goto LABEL_77;
    v5 = 3867318491;
    goto LABEL_49;
  }
  if (result > 1408738133)
  {
    if (result <= 2021146988)
    {
      if (result <= 1554479184)
      {
        switch(result)
        {
          case 1408738134:
            goto LABEL_72;
          case 1434404433:
            goto LABEL_45;
          case 1540760353:
            v0 = CFSTR("/usr/standalone/firmware/Rose/r1hp1/ftab.bin");
            goto LABEL_82;
        }
LABEL_83:
        v0 = 0;
        goto LABEL_82;
      }
      if (result == 1554479185)
        goto LABEL_77;
      if (result == 1602181456)
        goto LABEL_61;
      v5 = 1770142589;
LABEL_49:
      if (result == v5)
        goto LABEL_77;
      goto LABEL_83;
    }
    if (result <= 2085054104)
    {
      if (result == 2021146989)
        goto LABEL_45;
      if (result == 2080700391)
        goto LABEL_82;
      v5 = 2084894489;
      goto LABEL_49;
    }
    if (result == 2085054105)
      goto LABEL_71;
    if (result == 2132302344)
      goto LABEL_72;
    v4 = 2309863438;
LABEL_69:
    if (result != v4)
      goto LABEL_83;
    goto LABEL_70;
  }
  if (result <= 749116820)
  {
    if (result <= 425046864)
    {
      if (result != 133314240 && result != 330877086)
        goto LABEL_83;
      goto LABEL_80;
    }
    if (result == 425046865)
    {
LABEL_71:
      v0 = CFSTR("/usr/standalone/firmware/Rose/r1w2/ftab.bin");
      goto LABEL_82;
    }
    if (result == 574536383)
      goto LABEL_80;
    v4 = 689804742;
    goto LABEL_69;
  }
  if (result <= 1169082143)
  {
    if (result == 749116821)
      goto LABEL_77;
    if (result == 851437781)
      goto LABEL_80;
    v4 = 1060988941;
    goto LABEL_69;
  }
  if (result == 1169082144)
    goto LABEL_76;
  if (result == 1280909812)
    goto LABEL_61;
  v2 = 1371389549;
LABEL_59:
  if (result != v2)
    goto LABEL_83;
LABEL_82:
  RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path = (uint64_t)v0;
  return result;
}

uint64_t RoseBootstrappedPreflight::bootstrappedPreflight(RoseBootstrappedPreflight *this, const __CFString *a2, __CFString *a3, const __CFString *a4)
{
  const __CFAllocator *v5;
  ACFULogging *DataFromFileURL;
  ACFULogging *v7;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *rep;
  std::__shared_weak_count *v9;
  unint64_t *p_info;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  ACFULogging *v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  ACFULogging *PowerState;
  unsigned int v25;
  _BOOL4 v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  unint64_t v36;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  char v41;
  unint64_t *v42;
  unint64_t v43;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v44;
  uint64_t v45;
  CFTypeID v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v50;
  ACFULogging *v51;
  uint64_t (***v52)(_QWORD);
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  __CFDictionary *Mutable;
  __CFDictionary *v59;
  __CFDictionary *v60;
  __CFDictionary *v61;
  ACFULogging *v62;
  __CFDictionary *v63;
  const void *v64;
  ACFULogging *v65;
  ACFULogging *v66;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *ptr;
  ACFULogging *v68;
  ACFULogging *v69;
  CFTypeID TypeID;
  char *v71;
  unint64_t *v72;
  unint64_t v73;
  ACFULogging *v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  ACFULogging *v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  uint64_t (*v84)(const __CFAllocator *);
  char *v85;
  uint64_t (*v86)(ACFULogging *, ACFULogging *, CFTypeRef *);
  ACFULogging *v87;
  ACFULogging *v88;
  int v89;
  int v90;
  uint64_t v91;
  ACFULogging *v92;
  std::__shared_weak_count *cntrl;
  uint64_t *p_shared_owners;
  unint64_t v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  const __CFURL *v99;
  const void *URLByAppendingStrings;
  const __CFData *v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  ACFULogging *v118;
  ACFULogging *v119;
  CFTypeID v120;
  RoseCapabilities **v121;
  unint64_t *v122;
  unint64_t v123;
  ACFULogging *v124;
  int v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  ACFULogging *v129;
  unsigned int v130;
  _BOOL4 v131;
  std::__shared_weak_count *v132;
  unint64_t *v133;
  unint64_t v134;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  ACFULogging *v139;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v140;
  std::__shared_weak_count *v141;
  unint64_t *v142;
  unint64_t v143;
  int v144;
  unint64_t v145;
  ACFUFirmware *v146;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  unint64_t *v151;
  unint64_t v152;
  const __CFString *v153;
  ACFULogging *v154;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v155;
  const __CFData *v156;
  RoseCapabilities **v157;
  const UInt8 *BytePtr;
  CFIndex Length;
  ACFULogging *v160;
  RoseCapabilities **v161;
  unint64_t *v162;
  unint64_t v163;
  ACFULogging *v164;
  int v165;
  std::__shared_weak_count *v166;
  unint64_t *v167;
  unint64_t v168;
  ACFULogging *v169;
  ACFULogging *v170;
  uint64_t (***v171)(_QWORD);
  std::__shared_weak_count *v172;
  unint64_t *v173;
  unint64_t v174;
  unint64_t *v175;
  unint64_t v176;
  unint64_t *v177;
  unint64_t v178;
  unint64_t *v179;
  unint64_t v180;
  uint64_t *v181;
  unint64_t *v182;
  unint64_t v183;
  unint64_t *v184;
  unint64_t v185;
  unint64_t *v186;
  unint64_t v187;
  unint64_t *v188;
  unint64_t v189;
  unint64_t *v190;
  unint64_t v191;
  unint64_t *v192;
  unint64_t v193;
  uint64_t *v194;
  unint64_t *v195;
  unint64_t v196;
  unint64_t *v197;
  unint64_t v198;
  ACFULogging *value;
  CFURLRef v201;
  __CFDictionary *theDict;
  const __CFAllocator *allocator;
  ACFUDiagnostics *v204[2];
  uint64_t v205[2];
  ACFUDiagnostics *v206[2];
  uint64_t v207[2];
  ACFUFirmware *v208;
  std::__shared_weak_count *v209;
  _BYTE v210[8];
  char *v211;
  ACFUDiagnostics *v212[2];
  uint64_t v213[2];
  ACFUDiagnostics *v214[2];
  uint64_t v215[2];
  ACFUDiagnostics *v216[2];
  uint64_t v217[2];
  ACFUFirmware *v218;
  std::__shared_weak_count *v219;
  _BYTE v220[8];
  char *v221;
  ACFUDiagnostics *v222;
  std::__shared_weak_count *v223;
  __int16 v224;
  CFTypeRef cf;
  CFTypeRef v226;
  CFTypeRef v227;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v228;
  std::__shared_weak_count *v229;
  _BOOL4 v230;
  RoseCapabilities **v231;
  uint64_t v232;
  ACFUDiagnostics *v233;
  ACFUDiagnostics *v234;
  ACFUFirmware *v235;
  std::__shared_weak_count *v236;
  uint64_t v237;
  std::__shared_weak_count *v238;
  BOOL v239;
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *v240;
  std::__shared_weak_count *v241;
  char v242;
  char *v243;
  std::__shared_weak_count *v244;
  std::__fs::filesystem::recursive_directory_iterator v245;
  std::chrono::nanoseconds __ns;
  const __CFString *v247;
  _BOOL4 v248;
  unsigned __int8 v249;

  v239 = 1;
  v237 = 0;
  v238 = 0;
  v235 = 0;
  v236 = 0;
  v233 = 0;
  v234 = 0;
  v231 = 0;
  v232 = 0;
  v228 = 0;
  v229 = 0;
  v226 = 0;
  v227 = 0;
  cf = 0;
  v224 = -1;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!a2)
  {
    if (RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once != -1)
      dispatch_once(&RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::only_once, &__block_literal_global);
    a2 = (const __CFString *)RoseBootstrappedPreflight::getUnsignedFirmwarePath(void)::path;
  }
  allocator = v5;
  v201 = CFURLCreateWithString(v5, a2, 0);
  if (!v201)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_304;
  }
  DataFromFileURL = (ACFULogging *)AMSupportCreateDataFromFileURL();
  if ((_DWORD)DataFromFileURL)
  {
    ACFULogging::getLogInstance(DataFromFileURL);
    v7 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    v243 = "/usr/standalone/firmware/Rose";
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&v245, &v243);
    MEMORY[0x2207CEDAC](&__ns, &v245, 0, 0);
    if (*(char *)(&v245.__rec_ + 7) < 0)
      operator delete(v245.__imp_.__ptr_);
    rep = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)__ns.__rep_;
    v9 = (std::__shared_weak_count *)v247;
    if (v247)
    {
      p_info = (unint64_t *)&v247->info;
      do
        v11 = __ldxr(p_info);
      while (__stxr(v11 + 1, p_info));
      v12 = (std::__shared_weak_count *)v247;
      v245.__imp_.__ptr_ = rep;
      v245.__imp_.__cntrl_ = v9;
      v245.__rec_ = v248;
      if (v247)
      {
        v13 = (unint64_t *)&v247->info;
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
        v240 = 0;
        v241 = 0;
        v242 = 0;
        do
          v15 = __ldaxr(v13);
        while (__stlxr(v15 - 1, v13));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
        goto LABEL_142;
      }
    }
    else
    {
      v245.__imp_.__ptr_ = (std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *)__ns.__rep_;
      v245.__imp_.__cntrl_ = 0;
      v245.__rec_ = v248;
    }
    v240 = 0;
    v241 = 0;
    v242 = 0;
LABEL_142:
    while (v245.__imp_.__ptr_ != v240)
    {
      v92 = (ACFULogging *)std::__fs::filesystem::recursive_directory_iterator::__dereference(&v245);
      ACFULogging::getLogInstance(v92);
      ACFULogging::handleMessage();
      std::__fs::filesystem::recursive_directory_iterator::__increment(&v245, 0);
    }
    cntrl = v245.__imp_.__cntrl_;
    if (v245.__imp_.__cntrl_)
    {
      p_shared_owners = &v245.__imp_.__cntrl_->__shared_owners_;
      do
        v95 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v95 - 1, (unint64_t *)p_shared_owners));
      if (!v95)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v96 = (std::__shared_weak_count *)v247;
    if (v247)
    {
      v97 = (unint64_t *)&v247->info;
      do
        v98 = __ldaxr(v97);
      while (__stlxr(v98 - 1, v97));
      if (!v98)
      {
        ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
        std::__shared_weak_count::__release_weak(v96);
      }
    }
    goto LABEL_154;
  }
  ACFUDiagnostics::create((ACFUDiagnostics *)a3, (const __CFString *)1);
  std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>(&v233, &__ns.__rep_);
  v16 = (ACFULogging *)__ns.__rep_;
  __ns.__rep_ = 0;
  if (v16)
  {
    v17 = (void *)MEMORY[0x2207CEBFC]();
    operator delete(v17);
  }
  if (!v233)
  {
    ACFULogging::getLogInstance(v16);
    goto LABEL_304;
  }
  v222 = v233;
  v223 = (std::__shared_weak_count *)v234;
  if (v234)
  {
    v18 = (unint64_t *)((char *)v234 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  RoseTransport::create((uint64_t *)&v222, 0, 0, &__ns.__rep_);
  std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>(&v231, &__ns.__rep_);
  v20 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v20)
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(_QWORD *)v20 + 64))(v20);
  v21 = v223;
  if (v223)
  {
    v22 = (unint64_t *)&v223->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (!v231)
    goto LABEL_309;
  PowerState = (ACFULogging *)RoseTransport::getPowerState((RoseTransport *)v231, &v239);
  if ((_DWORD)PowerState)
    goto LABEL_303;
  if (!v239)
  {
    PowerState = (ACFULogging *)RoseTransport::setPowerState(v231, 1);
    if ((_DWORD)PowerState)
      goto LABEL_303;
  }
  v25 = 1;
  do
  {
    ACFULogging::getLogInstance(PowerState);
    ACFULogging::handleMessage();
    PowerState = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v231 + 4))(v231);
    if ((_DWORD)PowerState)
      goto LABEL_303;
    (*(void (**)(std::chrono::nanoseconds *__return_ptr, RoseCapabilities **, _QWORD, uint64_t))*v231)(&__ns, v231, 0, 1);
    PowerState = (ACFULogging *)std::shared_ptr<ACFUCommon::PersonalizeParams>::operator=[abi:ne180100](&v228, &__ns.__rep_);
    v26 = v248;
    v230 = v248;
    v27 = (std::__shared_weak_count *)v247;
    if (v247)
    {
      v28 = (unint64_t *)&v247->info;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
      v26 = v230;
    }
  }
  while (v26 && v25++ < 5);
  if (v26)
    goto LABEL_303;
  v31 = v228;
  v32 = v229;
  if (v229)
  {
    v33 = (unint64_t *)&v229->__shared_owners_;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    v35 = *(unsigned __int8 *)(v31 + 176);
    do
      v36 = __ldaxr(v33);
    while (__stlxr(v36 - 1, v33));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    if (!v35)
      goto LABEL_303;
  }
  else if (!*(_BYTE *)(v228 + 176))
  {
LABEL_303:
    ACFULogging::getLogInstance(PowerState);
LABEL_304:
    ACFULogging::handleMessage();
LABEL_154:
    value = 0;
LABEL_155:
    theDict = 0;
LABEL_156:
    v91 = 0;
    v74 = 0;
LABEL_157:
    v88 = 0;
    v83 = 0;
LABEL_158:
    v99 = 0;
LABEL_159:
    URLByAppendingStrings = 0;
LABEL_160:
    v101 = 0;
    goto LABEL_161;
  }
  v37 = v228;
  v38 = v229;
  __ns.__rep_ = v228;
  v247 = (const __CFString *)v229;
  if (v229)
  {
    v39 = (unint64_t *)&v229->__shared_owners_;
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  PowerState = ACFUCommon::Parameter::GetDataAsType<unsigned short>(v37 + 168, &v224);
  v41 = (char)PowerState;
  if (v38)
  {
    v42 = (unint64_t *)&v38->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  if ((v41 & 1) == 0)
    goto LABEL_303;
  ACFUFTABFile::create();
  std::shared_ptr<ACFUFTABFile>::operator=[abi:ne180100]<ACFUFTABFile,std::default_delete<ACFUFTABFile>,void>(&v237, &__ns.__rep_);
  v44 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v44)
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(_QWORD *)v44 + 56))(v44);
  v45 = v237;
  if (!v237)
  {
LABEL_309:
    ACFULogging::getLogInstance(0);
    goto LABEL_304;
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
    v45 = v237;
  }
  PowerState = (ACFULogging *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v45 + 40))(v45);
  cf = PowerState;
  if (!PowerState)
    goto LABEL_303;
  v46 = CFGetTypeID(PowerState);
  PowerState = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v46 != PowerState)
    goto LABEL_303;
  v47 = v238;
  v237 = 0;
  v238 = 0;
  if (v47)
  {
    v48 = (unint64_t *)&v47->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  GetRoseTatsuTagToFileNameMap((uint64_t)v220);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v235, &__ns.__rep_);
  v50 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v50)
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(_QWORD *)v50 + 56))(v50);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v220, v221);
  if (!v235)
    goto LABEL_315;
  v52 = (uint64_t (***)(_QWORD))v228;
  v53 = v229;
  __ns.__rep_ = v228;
  v247 = (const __CFString *)v229;
  if (v229)
  {
    v54 = (unint64_t *)&v229->__shared_owners_;
    do
      v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }
  v51 = (ACFULogging *)(**v52)(v52);
  value = v51;
  if (v53)
  {
    v56 = (unint64_t *)&v53->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  if (!value)
  {
LABEL_315:
    ACFULogging::getLogInstance(v51);
    goto LABEL_304;
  }
  Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v59 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v60 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v61 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v62 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v63 = v62;
  if (Mutable && v59 && v60 && v61 && v62)
  {
    v64 = (const void *)*MEMORY[0x24BDBD270];
    CFDictionaryAddValue(v60, CFSTR("Trusted"), (const void *)*MEMORY[0x24BDBD270]);
    CFDictionaryAddValue(v61, CFSTR("Trusted"), v64);
    CFDictionaryAddValue(v63, CFSTR("Trusted"), v64);
    CFDictionaryAddValue(v59, CFSTR("Rap,RTKitOS"), v60);
    CFDictionaryAddValue(v59, CFSTR("Rap,SoftwareBinaryDsp1"), v61);
    CFDictionaryAddValue(v59, CFSTR("Rap,RTKitIOConfig"), v63);
    CFDictionaryAddValue(Mutable, CFSTR("BuildIdentity"), v59);
    CFDictionaryAddValue(Mutable, CFSTR("DeviceInfo"), value);
LABEL_97:
    CFRelease(v59);
    theDict = Mutable;
    goto LABEL_98;
  }
  ACFULogging::getLogInstance(v62);
  v65 = (ACFULogging *)ACFULogging::handleMessage();
  if (Mutable)
    CFRelease(Mutable);
  Mutable = 0;
  theDict = 0;
  if (v59)
    goto LABEL_97;
LABEL_98:
  if (v60)
    CFRelease(v60);
  if (v61)
    CFRelease(v61);
  if (v63)
    CFRelease(v63);
  if (!theDict)
  {
    ACFULogging::getLogInstance(v65);
    ACFULogging::handleMessage();
    goto LABEL_155;
  }
  v226 = (CFTypeRef)ACFUFirmware::copyFWContainer(v235);
  CFDictionarySetValue(theDict, CFSTR("FirmwareData"), v226);
  v240 = 0;
  v241 = 0;
  LOWORD(v248) = 0;
  __ns.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep)CFSTR("Rap,ProductionMode");
  v247 = CFSTR("Rap,SecurityMode");
  v66 = (ACFULogging *)RoseRestoreHost::create(theDict, CFSTR("RoseBootstrappedPreflight"), &v245.__imp_.__ptr_);
  ptr = v245.__imp_.__ptr_;
  if (v245.__imp_.__ptr_)
  {
    v68 = (ACFULogging *)CFDictionaryGetValue(theDict, CFSTR("FirmwareData"));
    v69 = v68;
    if (!v68)
      goto LABEL_328;
    TypeID = CFDataGetTypeID();
    v68 = (ACFULogging *)CFGetTypeID(v69);
    if ((ACFULogging *)TypeID != v68)
      goto LABEL_328;
    GetRoseTatsuTagToFileNameMap((uint64_t)&v245);
    RTKitFirmware::create();
    std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v240, (uint64_t *)&v243);
    v71 = v243;
    v243 = 0;
    if (v71)
      (*(void (**)(char *))(*(_QWORD *)v71 + 56))(v71);
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v245, (char *)v245.__imp_.__cntrl_);
    if (!v240)
      goto LABEL_328;
    v243 = (char *)v240;
    v244 = v241;
    if (v241)
    {
      v72 = (unint64_t *)&v241->__shared_owners_;
      do
        v73 = __ldxr(v72);
      while (__stxr(v73 + 1, v72));
    }
    v68 = (ACFULogging *)(*(uint64_t (**)(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *, char **, std::chrono::nanoseconds *))(*(_QWORD *)ptr + 8))(ptr, &v243, &__ns);
    v74 = v68;
    v75 = v244;
    if (v244)
    {
      v76 = (unint64_t *)&v244->__shared_owners_;
      do
        v77 = __ldaxr(v76);
      while (__stlxr(v77 - 1, v76));
      if (!v77)
      {
        ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
        std::__shared_weak_count::__release_weak(v75);
      }
    }
    if (!v74)
    {
LABEL_328:
      ACFULogging::getLogInstance(v68);
      ACFULogging::handleMessage();
      v74 = 0;
    }
    v78 = (ACFULogging *)(*(uint64_t (**)(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp>::element_type *))(*(_QWORD *)ptr + 24))(ptr);
  }
  else
  {
    ACFULogging::getLogInstance(v66);
    v78 = (ACFULogging *)ACFULogging::handleMessage();
    v74 = 0;
  }
  v79 = v241;
  if (v241)
  {
    v80 = (unint64_t *)&v241->__shared_owners_;
    do
      v81 = __ldaxr(v80);
    while (__stlxr(v81 - 1, v80));
    if (!v81)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }
  if (!v74)
  {
    ACFULogging::getLogInstance(v78);
    ACFULogging::handleMessage();
    goto LABEL_156;
  }
  v82 = dlopen("/usr/lib/libauthinstall.dylib", 1);
  v83 = v82;
  if (!v82)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v91 = 0;
    goto LABEL_157;
  }
  v84 = (uint64_t (*)(const __CFAllocator *))dlsym(v82, "AMAuthInstallCreate");
  v85 = dlerror();
  if (v85
    || !v84
    || (v86 = (uint64_t (*)(ACFULogging *, ACFULogging *, CFTypeRef *))dlsym(v83, "AMAuthInstallRequestSendSync"), (v85 = dlerror()) != 0)|| !v86)
  {
    ACFULogging::getLogInstance((ACFULogging *)v85);
LABEL_330:
    ACFULogging::handleMessage();
    v91 = 0;
    v88 = 0;
    goto LABEL_158;
  }
  v87 = (ACFULogging *)v84(allocator);
  v88 = v87;
  if (!v87)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_330;
  }
  v89 = 1;
  while (1)
  {
    ACFULogging::getLogInstance(v87);
    ACFULogging::handleMessage();
    v90 = v86(v88, v74, &v227);
    v87 = (ACFULogging *)v227;
    if (!v90)
      break;
    if (v227)
    {
      CFRelease(v227);
      v227 = 0;
    }
    __ns.__rep_ = 4000000000;
    std::this_thread::sleep_for (&__ns);
    if (++v89 == 6)
      goto LABEL_138;
  }
  if (!v227)
  {
LABEL_138:
    ACFULogging::getLogInstance(v87);
    ACFULogging::handleMessage();
LABEL_139:
    v91 = 0;
    goto LABEL_158;
  }
  v118 = (ACFULogging *)CFDictionaryGetValue((CFDictionaryRef)v227, CFSTR("Rap,Ticket"));
  v119 = v118;
  if (!v118 || (v120 = CFDataGetTypeID(), v118 = (ACFULogging *)CFGetTypeID(v119), (ACFULogging *)v120 != v118))
  {
    ACFULogging::getLogInstance(v118);
LABEL_356:
    ACFULogging::handleMessage();
    goto LABEL_139;
  }
  (*(void (**)(ACFUFirmware *, ACFULogging *))(*(_QWORD *)v235 + 72))(v235, v119);
  v121 = v231;
  v218 = v235;
  v219 = v236;
  if (v236)
  {
    v122 = (unint64_t *)&v236->__shared_owners_;
    do
      v123 = __ldxr(v122);
    while (__stxr(v123 + 1, v122));
  }
  v124 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **, ACFUFirmware **))*v121 + 2))(v121, &v218);
  v125 = (int)v124;
  v126 = v219;
  if (v219)
  {
    v127 = (unint64_t *)&v219->__shared_owners_;
    do
      v128 = __ldaxr(v127);
    while (__stlxr(v128 - 1, v127));
    if (!v128)
    {
      ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
      std::__shared_weak_count::__release_weak(v126);
    }
  }
  if (v125)
  {
    ACFULogging::getLogInstance(v124);
    ACFULogging::handleMessage();
    v217[0] = (uint64_t)v231;
    v217[1] = v232;
    if (v232)
    {
      v177 = (unint64_t *)(v232 + 8);
      do
        v178 = __ldxr(v177);
      while (__stxr(v178 + 1, v177));
    }
    v216[0] = v233;
    v216[1] = v234;
    if (v234)
    {
      v179 = (unint64_t *)((char *)v234 + 8);
      do
        v180 = __ldxr(v179);
      while (__stxr(v180 + 1, v179));
    }
    saveDebugInfo(v217, v216);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v216);
    v181 = v217;
    goto LABEL_352;
  }
  v129 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v231 + 3))(v231);
  if ((_DWORD)v129)
  {
    ACFULogging::getLogInstance(v129);
    ACFULogging::handleMessage();
    v215[0] = (uint64_t)v231;
    v215[1] = v232;
    if (v232)
    {
      v182 = (unint64_t *)(v232 + 8);
      do
        v183 = __ldxr(v182);
      while (__stxr(v183 + 1, v182));
    }
    v214[0] = v233;
    v214[1] = v234;
    if (v234)
    {
      v184 = (unint64_t *)((char *)v234 + 8);
      do
        v185 = __ldxr(v184);
      while (__stxr(v185 + 1, v184));
    }
    saveDebugInfo(v215, v214);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v214);
    v181 = v215;
    goto LABEL_352;
  }
  v130 = 1;
  do
  {
    ACFULogging::getLogInstance(v129);
    ACFULogging::handleMessage();
    (*(void (**)(std::chrono::nanoseconds *__return_ptr, RoseCapabilities **, uint64_t, uint64_t))*v231)(&__ns, v231, 1, 1);
    v129 = (ACFULogging *)std::shared_ptr<ACFUCommon::PersonalizeParams>::operator=[abi:ne180100](&v228, &__ns.__rep_);
    v131 = v248;
    v230 = v248;
    v132 = (std::__shared_weak_count *)v247;
    if (v247)
    {
      v133 = (unint64_t *)&v247->info;
      do
        v134 = __ldaxr(v133);
      while (__stlxr(v134 - 1, v133));
      if (!v134)
      {
        ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
        std::__shared_weak_count::__release_weak(v132);
      }
      v131 = v230;
    }
  }
  while (v131 && v130++ < 5);
  if (v131)
  {
    ACFULogging::getLogInstance(v129);
    ACFULogging::handleMessage();
    v213[0] = (uint64_t)v231;
    v213[1] = v232;
    if (v232)
    {
      v186 = (unint64_t *)(v232 + 8);
      do
        v187 = __ldxr(v186);
      while (__stxr(v187 + 1, v186));
    }
    v212[0] = v233;
    v212[1] = v234;
    if (v234)
    {
      v188 = (unint64_t *)((char *)v234 + 8);
      do
        v189 = __ldxr(v188);
      while (__stxr(v189 + 1, v188));
    }
    saveDebugInfo(v213, v212);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v212);
    v181 = v213;
LABEL_352:
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v181);
    goto LABEL_139;
  }
  if (!this)
  {
    ACFULogging::getLogInstance(v129);
    ACFULogging::handleMessage();
    v99 = 0;
    URLByAppendingStrings = 0;
    v101 = 0;
    goto LABEL_292;
  }
  ACFULogging::getLogInstance(v129);
  ACFUCommon::stringFromCFString(this, v136);
  if ((v249 & 0x80u) == 0)
    v138 = (const __CFString *)v249;
  else
    v138 = v247;
  if (v138)
    ACFUCommon::stringFromCFString(this, v137);
  ACFULogging::handleMessage();
  if (v138 && *(char *)(&v245.__rec_ + 7) < 0)
    operator delete(v245.__imp_.__ptr_);
  if ((char)v249 < 0)
    operator delete((void *)__ns.__rep_);
  v139 = CFURLCreateWithString(allocator, (CFStringRef)this, 0);
  v99 = v139;
  if (!v139)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_356;
  }
  v140 = v228;
  v141 = v229;
  if (v229)
  {
    v142 = (unint64_t *)&v229->__shared_owners_;
    do
      v143 = __ldxr(v142);
    while (__stxr(v143 + 1, v142));
    v144 = *(unsigned __int8 *)(v140 + 80);
    do
      v145 = __ldaxr(v142);
    while (__stlxr(v145 - 1, v142));
    if (!v145)
    {
      ((void (*)(std::__shared_weak_count *))v141->__on_zero_shared)(v141);
      std::__shared_weak_count::__release_weak(v141);
    }
    if (!v144)
      goto LABEL_302;
  }
  else if (!*(_BYTE *)(v228 + 80))
  {
LABEL_302:
    ACFULogging::getLogInstance(v139);
LABEL_360:
    ACFULogging::handleMessage();
    v91 = 0;
    goto LABEL_159;
  }
  v146 = v235;
  v147 = v228;
  v148 = v229;
  __ns.__rep_ = v228;
  v247 = (const __CFString *)v229;
  if (v229)
  {
    v149 = (unint64_t *)&v229->__shared_owners_;
    do
      v150 = __ldxr(v149);
    while (__stxr(v150 + 1, v149));
  }
  (*(void (**)(ACFUFirmware *, _QWORD))(*(_QWORD *)v146 + 16))(v146, *(_QWORD *)(v147 + 72));
  if (v148)
  {
    v151 = (unint64_t *)&v148->__shared_owners_;
    do
      v152 = __ldaxr(v151);
    while (__stlxr(v152 - 1, v151));
    if (!v152)
    {
      ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
      std::__shared_weak_count::__release_weak(v148);
    }
  }
  v139 = (ACFULogging *)RTKitFirmware::saveFirmwareToPath(v235, v99);
  if ((_DWORD)v139)
    goto LABEL_302;
  v139 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v231 + 4))(v231);
  if ((_DWORD)v139)
    goto LABEL_302;
  if (v226)
  {
    CFRelease(v226);
    v226 = 0;
  }
  URLByAppendingStrings = (const void *)ACFUCommon::createURLByAppendingStrings(this, CFSTR("ftab.bin"), v153);
  if (!URLByAppendingStrings)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_360;
  }
  v154 = (ACFULogging *)AMSupportCreateDataFromFileURL();
  if ((_DWORD)v154)
  {
    ACFULogging::getLogInstance(v154);
    ACFULogging::handleMessage();
LABEL_363:
    v91 = 0;
    goto LABEL_160;
  }
  GetRoseTatsuTagToFileNameMap((uint64_t)v210);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(&v235, &__ns.__rep_);
  v155 = __ns.__rep_;
  __ns.__rep_ = 0;
  if (v155)
    (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(_QWORD *)v155 + 56))(v155);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v210, v211);
  if (!v235
    || (v156 = (const __CFData *)(*(uint64_t (**)(ACFUFirmware *))(*(_QWORD *)v235 + 32))(v235),
        (v101 = v156) == 0))
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    goto LABEL_363;
  }
  v157 = v231;
  BytePtr = CFDataGetBytePtr(v156);
  Length = CFDataGetLength(v101);
  v160 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **, const UInt8 *, CFIndex))*v157 + 1))(v157, BytePtr, Length);
  if ((_DWORD)v160)
  {
    ACFULogging::getLogInstance(v160);
    ACFULogging::handleMessage();
    goto LABEL_380;
  }
  v161 = v231;
  v208 = v235;
  v209 = v236;
  if (v236)
  {
    v162 = (unint64_t *)&v236->__shared_owners_;
    do
      v163 = __ldxr(v162);
    while (__stxr(v163 + 1, v162));
  }
  v164 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **, ACFUFirmware **))*v161 + 2))(v161, &v208);
  v165 = (int)v164;
  v166 = v209;
  if (v209)
  {
    v167 = (unint64_t *)&v209->__shared_owners_;
    do
      v168 = __ldaxr(v167);
    while (__stlxr(v168 - 1, v167));
    if (!v168)
    {
      ((void (*)(std::__shared_weak_count *))v166->__on_zero_shared)(v166);
      std::__shared_weak_count::__release_weak(v166);
    }
  }
  if (v165)
  {
    ACFULogging::getLogInstance(v164);
    ACFULogging::handleMessage();
    v207[0] = (uint64_t)v231;
    v207[1] = v232;
    if (v232)
    {
      v190 = (unint64_t *)(v232 + 8);
      do
        v191 = __ldxr(v190);
      while (__stxr(v191 + 1, v190));
    }
    v206[0] = v233;
    v206[1] = v234;
    if (v234)
    {
      v192 = (unint64_t *)((char *)v234 + 8);
      do
        v193 = __ldxr(v192);
      while (__stxr(v193 + 1, v192));
    }
    saveDebugInfo(v207, v206);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v206);
    v194 = v207;
    goto LABEL_379;
  }
  v169 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v231 + 3))(v231);
  if ((_DWORD)v169)
  {
    ACFULogging::getLogInstance(v169);
    ACFULogging::handleMessage();
    v205[0] = (uint64_t)v231;
    v205[1] = v232;
    if (v232)
    {
      v195 = (unint64_t *)(v232 + 8);
      do
        v196 = __ldxr(v195);
      while (__stxr(v196 + 1, v195));
    }
    v204[0] = v233;
    v204[1] = v234;
    if (v234)
    {
      v197 = (unint64_t *)((char *)v234 + 8);
      do
        v198 = __ldxr(v197);
      while (__stxr(v198 + 1, v197));
    }
    saveDebugInfo(v205, v204);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v204);
    v194 = v205;
LABEL_379:
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v194);
    goto LABEL_380;
  }
LABEL_292:
  v170 = (ACFULogging *)(*((uint64_t (**)(RoseCapabilities **))*v231 + 4))(v231);
  if ((_DWORD)v170)
  {
    ACFULogging::getLogInstance(v170);
    ACFULogging::handleMessage();
LABEL_380:
    v91 = 0;
    goto LABEL_161;
  }
  v171 = (uint64_t (***)(_QWORD))v228;
  v172 = v229;
  __ns.__rep_ = v228;
  v247 = (const __CFString *)v229;
  if (v229)
  {
    v173 = (unint64_t *)&v229->__shared_owners_;
    do
      v174 = __ldxr(v173);
    while (__stxr(v174 + 1, v173));
  }
  v91 = (**v171)(v171);
  if (v172)
  {
    v175 = (unint64_t *)&v172->__shared_owners_;
    do
      v176 = __ldaxr(v175);
    while (__stlxr(v176 - 1, v175));
    if (!v176)
    {
      ((void (*)(std::__shared_weak_count *))v172->__on_zero_shared)(v172);
      std::__shared_weak_count::__release_weak(v172);
    }
  }
LABEL_161:
  if (!v239 && v231)
    RoseTransport::setPowerState(v231, 0);
  if (v88)
    CFRelease(v88);
  if (value)
    CFRelease(value);
  if (theDict)
    CFRelease(theDict);
  if (v226)
  {
    CFRelease(v226);
    v226 = 0;
  }
  if (v99)
    CFRelease(v99);
  if (URLByAppendingStrings)
    CFRelease(URLByAppendingStrings);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v201)
    CFRelease(v201);
  if (v74)
    CFRelease(v74);
  if (v227)
  {
    CFRelease(v227);
    v227 = 0;
  }
  if (v101)
    CFRelease(v101);
  if (v83)
    dlclose(v83);
  v102 = v229;
  if (v229)
  {
    v103 = (unint64_t *)&v229->__shared_owners_;
    do
      v104 = __ldaxr(v103);
    while (__stlxr(v104 - 1, v103));
    if (!v104)
    {
      ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
      std::__shared_weak_count::__release_weak(v102);
    }
  }
  v105 = (std::__shared_weak_count *)v232;
  if (v232)
  {
    v106 = (unint64_t *)(v232 + 8);
    do
      v107 = __ldaxr(v106);
    while (__stlxr(v107 - 1, v106));
    if (!v107)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  v108 = (std::__shared_weak_count *)v234;
  if (v234)
  {
    v109 = (unint64_t *)((char *)v234 + 8);
    do
      v110 = __ldaxr(v109);
    while (__stlxr(v110 - 1, v109));
    if (!v110)
    {
      ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
      std::__shared_weak_count::__release_weak(v108);
    }
  }
  v111 = v236;
  if (v236)
  {
    v112 = (unint64_t *)&v236->__shared_owners_;
    do
      v113 = __ldaxr(v112);
    while (__stlxr(v113 - 1, v112));
    if (!v113)
    {
      ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
      std::__shared_weak_count::__release_weak(v111);
    }
  }
  v114 = v238;
  if (v238)
  {
    v115 = (unint64_t *)&v238->__shared_owners_;
    do
      v116 = __ldaxr(v115);
    while (__stlxr(v116 - 1, v115));
    if (!v116)
    {
      ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
      std::__shared_weak_count::__release_weak(v114);
    }
  }
  return v91;
}

void sub_21FA13760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  uint64_t v54;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a54);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v54 - 256);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v54 - 240);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v54 - 224);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v54 - 208);
  _Unwind_Resume(a1);
}

void sub_21FA13A78()
{
  __cxa_end_catch();
  JUMPOUT(0x21FA139D0);
}

_QWORD *std::shared_ptr<ACFUDiagnostics>::operator=[abi:ne180100]<ACFUDiagnostics,std::default_delete<ACFUDiagnostics>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = *a2;
  if (*a2)
  {
    v5 = operator new(0x20uLL);
    *v5 = off_24E47CA00;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
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

_QWORD *std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = *a2;
  if (*a2)
  {
    v5 = operator new(0x20uLL);
    *v5 = off_24E47CA60;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
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

const __CFData *ACFUCommon::Parameter::GetDataAsType<unsigned short>(uint64_t a1, _WORD *a2)
{
  const __CFData *result;
  const UInt8 *BytePtr;
  unint64_t Length;

  if (!*(_BYTE *)(a1 + 8))
    return 0;
  result = *(const __CFData **)a1;
  if (!result)
    return result;
  BytePtr = CFDataGetBytePtr(result);
  Length = CFDataGetLength(*(CFDataRef *)a1);
  if (Length > 2)
    return 0;
  *a2 = 0;
  memcpy(a2, BytePtr, Length);
  return (const __CFData *)1;
}

_QWORD *std::shared_ptr<ACFUFTABFile>::operator=[abi:ne180100]<ACFUFTABFile,std::default_delete<ACFUFTABFile>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = *a2;
  if (*a2)
  {
    v5 = operator new(0x20uLL);
    *v5 = off_24E47CAC0;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
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

_QWORD *std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = *a2;
  if (*a2)
  {
    v5 = operator new(0x20uLL);
    *v5 = off_24E47C9A0;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v4;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
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

void saveDebugInfo(uint64_t *a1, ACFUDiagnostics **a2)
{
  uint64_t v2;
  int v4;
  int v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v2 = *a1;
  if (v2 && *a2)
  {
    v9 = 0;
    v10 = 0;
    v4 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v2 + 40))(v2, &v9, 1);
    v5 = v4;
    v6 = v10;
    if (!v10)
      goto LABEL_7;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (v8)
    {
LABEL_7:
      if (v4)
        return;
      goto LABEL_8;
    }
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    if (!v5)
LABEL_8:
      ACFUDiagnostics::perform(*a2);
  }
}

void sub_21FA13DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  char *v3;
  char *v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_21FA13E54(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *i;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      v16 = *v4++;
      *i = v16;
    }
    *i = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_21FA13FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(_QWORD *result, char *a2, char *a3, unint64_t a4)
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

_QWORD *std::shared_ptr<ACFUCommon::PersonalizeParams>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
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

void std::__shared_ptr_pointer<RTKitFirmware  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<RTKitFirmware  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 56))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<RTKitFirmware  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
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

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ACFUDiagnostics  *>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(a1 + 24))
  {
    v1 = (void *)MEMORY[0x2207CEBFC]();
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<ACFUDiagnostics  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

void std::__shared_ptr_pointer<RoseTransport  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<RoseTransport  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 64))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<RoseTransport  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

void std::__shared_ptr_pointer<ACFUFTABFile  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ACFUFTABFile  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 56))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ACFUFTABFile  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

void RoseCapabilities::create(RoseCapabilities *this@<X0>, RoseCapabilities **a2@<X8>)
{
  int v2;
  void *v4;
  uint64_t v5;

  v2 = (int)this;
  v4 = operator new(4uLL);
  std::shared_ptr<RoseCapabilities>::shared_ptr[abi:ne180100]<RoseCapabilities,void>(a2, (uint64_t)v4);
  if (*a2)
  {
    v5 = RoseCapabilities::init(*a2, v2);
    if ((v5 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage();
      std::shared_ptr<RoseCapabilities>::reset[abi:ne180100](a2);
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
}

void sub_21FA143D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t RoseCapabilities::init(RoseCapabilities *this, int a2)
{
  uint64_t result;

  if (a2 == 8228)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    result = 1;
    *(_DWORD *)this = 1;
  }
  else if (a2 == 8198)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    *(_DWORD *)this = 0;
    return 1;
  }
  else
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    return 0;
  }
  return result;
}

void std::shared_ptr<RoseCapabilities>::reset[abi:ne180100](_QWORD *a1)
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

BOOL RoseCapabilities::supportsRTKitIOConfig(RoseCapabilities *this)
{
  return *(_DWORD *)this != 0;
}

uint64_t RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(RoseCapabilities *this)
{
  return 1;
}

BOOL RoseCapabilities::requiresSeparateFirmwareTargetForCertification(RoseCapabilities *this)
{
  return *(_DWORD *)this == 0;
}

uint64_t RoseCapabilities::supportsRoseSEPairing(RoseCapabilities *this, unsigned int a2)
{
  int v2;
  unint64_t v3;
  int v4;
  char v5;

  v2 = *(_DWORD *)this;
  v3 = (0x15001100100uLL >> a2) & 1;
  if (a2 > 0x28)
    LOBYTE(v3) = 0;
  LOBYTE(v4) = (a2 & 0xFC) == 8;
  if (v2)
    v4 = *(_DWORD *)this;
  if (v2 == 1)
    v5 = v3;
  else
    v5 = v4;
  return v5 & 1;
}

void RoseCapabilities::supportedFDRDataClassesForCalibrationType(_DWORD *a1@<X0>, int a2@<W1>, std::string **a3@<X8>)
{
  std::string *v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  void *v9[2];
  char v10;
  void *__p;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*a1)
  {
    if (a2 != 1)
    {
      if (!a2)
      {
        ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMCl");
        *a3 = 0;
        a3[1] = 0;
        a3[2] = 0;
        v6 = (std::string *)operator new(0x30uLL);
        *a3 = v6;
        a3[1] = v6;
        a3[2] = v6 + 2;
        v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v6);
        goto LABEL_13;
      }
LABEL_9:
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      return;
    }
LABEL_12:
    ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rSCl");
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    v8 = (std::string *)operator new(0x30uLL);
    *a3 = v8;
    a3[1] = v8;
    a3[2] = v8 + 2;
    v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v8);
    goto LABEL_13;
  }
  if (a2 == 2)
  {
    ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMNB", "rMC2");
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    v7 = (std::string *)operator new(0x30uLL);
    *a3 = v7;
    a3[1] = v7;
    a3[2] = v7 + 2;
    v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v7);
    goto LABEL_13;
  }
  if (a2 == 1)
    goto LABEL_12;
  if (a2)
    goto LABEL_9;
  ACFUCommon::FDRDataClass::FDRDataClass((ACFUCommon::FDRDataClass *)v9, "rMUB", "rMC2");
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = (std::string *)operator new(0x30uLL);
  *a3 = v4;
  a3[1] = v4;
  a3[2] = v4 + 2;
  v5 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)(a3 + 2), (ACFUCommon::FDRDataClass *)v9, (ACFUCommon::FDRDataClass *)&v13, v4);
LABEL_13:
  a3[1] = v5;
  if (v12 < 0)
    operator delete(__p);
  if (v10 < 0)
    operator delete(v9[0]);
}

void sub_21FA147E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v6;
  va_list va;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v6 = va_arg(va1, void **);
  v8 = va_arg(va1, _QWORD);
  v4 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  ACFUCommon::FDRDataClass::~FDRDataClass((void **)va1);
  _Unwind_Resume(a1);
}

void ACFUCommon::FDRDataClass::~FDRDataClass(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

const __CFString *RoseCapabilities::chipNameForCertification(RoseCapabilities *this)
{
  if (*(_DWORD *)this)
    return CFSTR("R2");
  else
    return CFSTR("R1");
}

ACFUCommon::FDRDataClass *ACFUCommon::FDRDataClass::FDRDataClass(ACFUCommon::FDRDataClass *this, char *a2)
{
  _QWORD *v3;

  v3 = std::string::basic_string[abi:ne180100]<0>(this, a2);
  std::string::basic_string[abi:ne180100]<0>(v3 + 3, (char *)&unk_21FA22A31);
  return this;
}

void sub_21FA148DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

ACFUCommon::FDRDataClass *ACFUCommon::FDRDataClass::FDRDataClass(ACFUCommon::FDRDataClass *this, char *a2, char *a3)
{
  _QWORD *v5;

  v5 = std::string::basic_string[abi:ne180100]<0>(this, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return this;
}

void sub_21FA1492C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::shared_ptr<RoseCapabilities>::shared_ptr[abi:ne180100]<RoseCapabilities,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24E47CB20;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_21FA1498C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<RoseCapabilities *,std::shared_ptr<RoseCapabilities>::__shared_ptr_default_delete<RoseCapabilities,RoseCapabilities>,std::allocator<RoseCapabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>(uint64_t a1, ACFUCommon::FDRDataClass *a2, ACFUCommon::FDRDataClass *a3, std::string *this)
{
  std::string *v4;
  const ACFUCommon::FDRDataClass *v6;
  _QWORD v8[3];
  char v9;
  std::string *v10;
  std::string *v11;

  v4 = this;
  v10 = this;
  v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      ACFUCommon::FDRDataClass::FDRDataClass(v4, v6);
      v6 = (const ACFUCommon::FDRDataClass *)((char *)v6 + 48);
      v4 = v11 + 2;
      v11 += 2;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21FA14A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

std::string *ACFUCommon::FDRDataClass::FDRDataClass(std::string *this, const ACFUCommon::FDRDataClass *a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;

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
  v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_21FA14B24(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)a1[1];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v4 = *v2;
  if (*v1 != *v2)
  {
    v5 = *a1;
    do
    {
      v3 -= 48;
      std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0)
    operator delete(*(void **)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        std::allocator<ACFUCommon::FDRDataClass>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t RoseEvent::create@<X0>(ACFULogging *a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  int v8;
  _QWORD *v9;
  uint64_t (**v10)(RoseCommandCompleteEvent *__hidden);
  uint64_t result;
  ACFULogging *v12;

  *a4 = 0;
  if (!a1 || a2 <= 3)
  {
    ACFULogging::getLogInstance(a1);
    return ACFULogging::handleMessage();
  }
  v8 = *(_DWORD *)a1 & 0x3FF;
  switch(v8)
  {
    case 525:
      v9 = operator new(0x18uLL);
      v10 = &off_24E47CC28;
      break;
    case 144:
      v9 = operator new(0x18uLL);
      v10 = &off_24E47CBF8;
      break;
    case 128:
      v9 = operator new(0x18uLL);
      v10 = &off_24E47CBC8;
      break;
    default:
      ACFULogging::getLogInstance(a1);
      v12 = (ACFULogging *)ACFULogging::handleMessage();
      ACFULogging::getLogInstance(v12);
      return ACFULogging::handleMessage();
  }
  *v9 = v10;
  v9[1] = 0;
  *a4 = v9;
  result = RoseEvent::init((uint64_t)v9, (const UInt8 *)a1, a2, a3);
  if ((result & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)result);
    return ACFULogging::handleMessage();
  }
  return result;
}

void sub_21FA14DF8(_Unwind_Exception *exception_object)
{
  _QWORD *v1;

  *v1 = 0;
  _Unwind_Resume(exception_object);
}

uint64_t RoseEvent::init(uint64_t a1, const UInt8 *a2, CFIndex a3, int a4)
{
  CFDataRef v6;

  if (a2 && a3)
  {
    v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3);
    *(_QWORD *)(a1 + 8) = v6;
    if (v6)
    {
      *(_DWORD *)(a1 + 16) = a4;
      return 1;
    }
    ACFULogging::getLogInstance(0);
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
  }
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseEvent::validate(CFDataRef *this)
{
  const UInt8 *BytePtr;
  ACFULogging *Length;
  unint64_t v4;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  ACFULogging *v9;
  std::string v11;
  std::string v12;
  void *__p[2];
  std::string::size_type v14;

  BytePtr = CFDataGetBytePtr(this[1]);
  Length = (ACFULogging *)CFDataGetLength(this[1]);
  if (BytePtr)
  {
    v4 = (unint64_t)Length - 113;
    ACFULogging::getLogInstance(Length);
    if (v4 > 0xFFFFFFFFFFFFFF94)
    {
      std::string::basic_string[abi:ne180100]<0>(&v11, "RoseEvent");
      v5 = std::string::append(&v11, "::");
      v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      v12.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      v7 = std::string::append(&v12, "validate");
      v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      v14 = v7->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      v9 = (ACFULogging *)ACFULogging::handleMessageBinary();
      if (SHIBYTE(v14) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v12.__r_.__value_.__l.__data_);
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v11.__r_.__value_.__l.__data_);
      if ((~*(_DWORD *)BytePtr & 0xC000) == 0)
        return 1;
      ACFULogging::getLogInstance(v9);
    }
  }
  else
  {
    ACFULogging::getLogInstance(Length);
  }
  ACFULogging::handleMessage();
  return 0;
}

void sub_21FA1506C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void RoseEvent::~RoseEvent(RoseEvent *this)
{
  const void *v2;

  *(_QWORD *)this = &unk_24E47CB98;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 1) = 0;
  }
}

void RoseEvent::RoseEvent(RoseEvent *this)
{
  *(_QWORD *)this = &unk_24E47CB98;
  *((_QWORD *)this + 1) = 0;
}

void RoseCommandCompleteEvent::RoseCommandCompleteEvent(RoseCommandCompleteEvent *this)
{
  *(_QWORD *)this = &off_24E47CBC8;
  *((_QWORD *)this + 1) = 0;
}

uint64_t RoseCommandCompleteEvent::validate(CFDataRef *a1, int a2)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  ACFULogging *v6;
  BOOL v7;

  Length = CFDataGetLength(a1[1]);
  BytePtr = CFDataGetBytePtr(a1[1]);
  v6 = (ACFULogging *)(*(uint64_t (**)(CFDataRef *))*a1)(a1);
  if ((v6 & 1) != 0 && ((*(_DWORD *)BytePtr & 0x3C00) == 0x800 ? (v7 = Length == 10) : (v7 = 0), v7))
  {
    if (*((unsigned __int16 *)BytePtr + 3) == a2 && !*((_WORD *)BytePtr + 2))
    {
      (*((void (**)(CFDataRef *))*a1 + 3))(a1);
      return 1;
    }
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    (*((void (**)(CFDataRef *))*a1 + 3))(a1);
  }
  else
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseCommandCompleteEvent::log(CFDataRef *this)
{
  ACFULogging *BytePtr;
  ACFULogging *v3;

  BytePtr = (ACFULogging *)CFDataGetBytePtr(this[1]);
  if (BytePtr && (BytePtr = (ACFULogging *)CFDataGetLength(this[1]), BytePtr == (ACFULogging *)10))
  {
    ACFULogging::getLogInstance((ACFULogging *)0xA);
    v3 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v3);
  }
  else
  {
    ACFULogging::getLogInstance(BytePtr);
  }
  return ACFULogging::handleMessage();
}

void RoseFDRTrustEvaluationCompleteEvent::RoseFDRTrustEvaluationCompleteEvent(RoseFDRTrustEvaluationCompleteEvent *this)
{
  *(_QWORD *)this = &off_24E47CBF8;
  *((_QWORD *)this + 1) = 0;
}

uint64_t RoseFDRTrustEvaluationCompleteEvent::validate(CFDataRef *this)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v4;

  Length = CFDataGetLength(this[1]);
  BytePtr = CFDataGetBytePtr(this[1]);
  v4 = RoseEvent::validate(this);
  if ((v4 & 1) != 0 && (*(_DWORD *)BytePtr & 0x3FFF) == 0x890 && Length == 48)
  {
    if (!*(_QWORD *)(BytePtr + 6) && !*((_WORD *)BytePtr + 2))
    {
      (*((void (**)(CFDataRef *))*this + 3))(this);
      return 1;
    }
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
    (*((void (**)(CFDataRef *))*this + 3))(this);
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseFDRTrustEvaluationCompleteEvent::log(CFDataRef *this)
{
  ACFULogging *BytePtr;
  ACFULogging *v3;

  BytePtr = (ACFULogging *)CFDataGetBytePtr(this[1]);
  if (BytePtr && (BytePtr = (ACFULogging *)CFDataGetLength(this[1]), BytePtr == (ACFULogging *)48))
  {
    ACFULogging::getLogInstance((ACFULogging *)0x30);
    v3 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v3);
  }
  else
  {
    ACFULogging::getLogInstance(BytePtr);
  }
  return ACFULogging::handleMessage();
}

void RoseInitDoneEvent::RoseInitDoneEvent(RoseInitDoneEvent *this)
{
  *(_QWORD *)this = &off_24E47CC28;
  *((_QWORD *)this + 1) = 0;
}

uint64_t RoseInitDoneEvent::validate(CFDataRef *this)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v4;
  int v5;

  Length = CFDataGetLength(this[1]);
  BytePtr = CFDataGetBytePtr(this[1]);
  v4 = RoseEvent::validate(this);
  if ((v4 & 1) == 0)
    goto LABEL_16;
  v5 = *((_DWORD *)this + 4);
  if (v5 == 1)
  {
    if ((*(_DWORD *)BytePtr & 0x3C00) != 0
      || (*(_DWORD *)BytePtr & 0x3FF) != 0x20D
      || (unint64_t)Length < 0x70
      || Length >= 129)
    {
      goto LABEL_16;
    }
  }
  else if (v5
         || (*(_DWORD *)BytePtr & 0x3C00) != 0
         || (*(_DWORD *)BytePtr & 0x3FF) != 0x20D
         || (unint64_t)Length < 0x46
         || Length > 128
         || Length != BytePtr[42] + 43)
  {
LABEL_16:
    ACFULogging::getLogInstance((ACFULogging *)v4);
    ACFULogging::handleMessage();
    return 0;
  }
  if (!*((_WORD *)BytePtr + 2))
  {
    (*((void (**)(CFDataRef *))*this + 3))(this);
    return 1;
  }
  ACFULogging::getLogInstance((ACFULogging *)v4);
  ACFULogging::handleMessage();
  (*((void (**)(CFDataRef *))*this + 3))(this);
  return 0;
}

uint64_t RoseInitDoneEvent::log(CFDataRef *this)
{
  RoseInitDoneEvent *v1;
  int v2;
  RoseInitDoneEvent *v3;
  ACFULogging *v4;
  RoseInitDoneEvent *v6;

  v1 = (RoseInitDoneEvent *)this;
  v2 = *((_DWORD *)this + 4);
  if (v2 == 1)
  {
    this = (CFDataRef *)CFDataGetBytePtr(this[1]);
    if (this)
    {
      v6 = (RoseInitDoneEvent *)this;
      this = (CFDataRef *)CFDataGetLength(*((CFDataRef *)v1 + 1));
      if ((unint64_t)this > 0x6F)
      {
        ACFULogging::getLogInstance((ACFULogging *)this);
        ACFULogging::handleMessage();
        return RoseCommand::parsePingInfo((uint64_t)v6 + 4);
      }
    }
  }
  else if (!v2)
  {
    this = (CFDataRef *)CFDataGetBytePtr(this[1]);
    if (this)
    {
      v3 = (RoseInitDoneEvent *)this;
      this = (CFDataRef *)CFDataGetLength(*((CFDataRef *)v1 + 1));
      if ((unint64_t)this > 0x45)
      {
        ACFULogging::getLogInstance((ACFULogging *)this);
        v4 = (ACFULogging *)ACFULogging::handleMessage();
        ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage();
        return RoseCommand::parsePingInfo((uint64_t)v3 + 6);
      }
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)this);
  return ACFULogging::handleMessage();
}

void RoseCommandCompleteEvent::~RoseCommandCompleteEvent(RoseCommandCompleteEvent *this)
{
  void *v1;

  RoseEvent::~RoseEvent(this);
  operator delete(v1);
}

void RoseFDRTrustEvaluationCompleteEvent::~RoseFDRTrustEvaluationCompleteEvent(RoseFDRTrustEvaluationCompleteEvent *this)
{
  void *v1;

  RoseEvent::~RoseEvent(this);
  operator delete(v1);
}

void RoseInitDoneEvent::~RoseInitDoneEvent(RoseInitDoneEvent *this)
{
  void *v1;

  RoseEvent::~RoseEvent(this);
  operator delete(v1);
}

BOOL RoseCommand::parsePingInfo(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  ACFULogging *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  ACFULogging *v8;
  ACFULogging *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;
  std::string v15;
  std::string v16;
  void *__p[2];
  std::string::size_type v18;
  void *v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v21 = 0;
  v22 = 0;
  v23 = 0;
  v2 = operator new(0x28uLL);
  v19 = v2;
  v20 = xmmword_21FA26220;
  v3 = *(_OWORD *)(a1 + 16);
  *v2 = *(_OWORD *)a1;
  v2[1] = v3;
  *((_BYTE *)v2 + 32) = 0;
  ACFULogging::getLogInstance((ACFULogging *)v2);
  v4 = (ACFULogging *)ACFULogging::handleMessage();
  v5 = *(unsigned __int8 *)(a1 + 36);
  if (v5 <= 0x1A)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
  }
  else
  {
    v6 = *(void **)(a1 + 41);
    v7 = *(_QWORD *)(a1 + 49);
    if (SHIBYTE(v23) < 0)
      operator delete(v21);
    v21 = v6;
    v22 = v7;
    LOBYTE(v23) = 0;
    HIBYTE(v23) = 16;
    ACFULogging::getLogInstance(v4);
    v8 = (ACFULogging *)ACFULogging::handleMessage();
    if (*(unsigned __int8 *)(a1 + 36) >= 0x1Cu)
    {
      ACFULogging::getLogInstance(v8);
      v9 = (ACFULogging *)ACFULogging::handleMessage();
      ACFULogging::getLogInstance(v9);
      std::string::basic_string[abi:ne180100]<0>(&v15, "RoseCommand");
      v10 = std::string::append(&v15, "::");
      v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      v12 = std::string::append(&v16, "parsePingInfo");
      v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
      v18 = v12->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v13;
      v12->__r_.__value_.__l.__size_ = 0;
      v12->__r_.__value_.__r.__words[2] = 0;
      v12->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageBinary();
      if (SHIBYTE(v18) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v16.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(v20) < 0)
    operator delete(v19);
  if (SHIBYTE(v23) < 0)
    operator delete(v21);
  return v5 > 0x1A;
}

void sub_21FA15B94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;

  if (a36 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  if (a23 < 0)
    operator delete(a18);
  if (*(char *)(v36 - 89) < 0)
    operator delete(*(void **)(v36 - 112));
  if (*(char *)(v36 - 65) < 0)
    operator delete(*(void **)(v36 - 88));
  _Unwind_Resume(exception_object);
}

uint64_t RoseCommand::parsePingInfo(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  ACFULogging *v4;
  void *v5;
  uint64_t v6;
  ACFULogging *v7;
  ACFULogging *v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string v14;
  std::string v15;
  void *__p[2];
  std::string::size_type v17;
  void *v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  v2 = operator new(0x28uLL);
  v18 = v2;
  v19 = xmmword_21FA26220;
  v3 = *(_OWORD *)(a1 + 18);
  *v2 = *(_OWORD *)(a1 + 2);
  v2[1] = v3;
  *((_BYTE *)v2 + 32) = 0;
  ACFULogging::getLogInstance((ACFULogging *)v2);
  v4 = (ACFULogging *)ACFULogging::handleMessage();
  v5 = *(void **)(a1 + 42);
  v6 = *(_QWORD *)(a1 + 50);
  if (SHIBYTE(v22) < 0)
    operator delete(v20);
  v20 = v5;
  v21 = v6;
  LOBYTE(v22) = 0;
  HIBYTE(v22) = 16;
  ACFULogging::getLogInstance(v4);
  v7 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v7);
  v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v14, "RoseCommand");
  v9 = std::string::append(&v14, "::");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v15, "parsePingInfo");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19) < 0)
    operator delete(v18);
  if (SHIBYTE(v22) < 0)
    operator delete(v20);
  return 1;
}

void sub_21FA15E4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;

  if (a36 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  if (a23 < 0)
    operator delete(a18);
  if (*(char *)(v36 - 73) < 0)
    operator delete(*(void **)(v36 - 96));
  if (*(char *)(v36 - 49) < 0)
    operator delete(*(void **)(v36 - 72));
  _Unwind_Resume(exception_object);
}

_QWORD *RoseCommand::create(int a1, int a2, unint64_t a3, char a4)
{
  _QWORD *v8;
  _BOOL8 v9;

  v8 = operator new(0x30uLL);
  v8[1] = 0;
  v8[2] = 0;
  *v8 = 0;
  *((_DWORD *)v8 + 6) = a2;
  *((_DWORD *)v8 + 7) = a1;
  *((_BYTE *)v8 + 32) = a4;
  v8[5] = 0;
  v9 = RoseCommand::init((RoseCommand *)v8, a3);
  if (!v9)
  {
    ACFULogging::getLogInstance((ACFULogging *)v9);
    ACFULogging::handleMessage();
    if (*v8)
      operator delete((void *)*v8);
    operator delete(v8);
    return 0;
  }
  return v8;
}

uint64_t RoseCommand::RoseCommand(uint64_t result, int a2, int a3, char a4)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = a3;
  *(_DWORD *)(result + 28) = a2;
  *(_BYTE *)(result + 32) = a4;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

BOOL RoseCommand::init(RoseCommand *this, unint64_t a2)
{
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  char v8;
  __int128 v9;
  uint64_t v10;

  if (a2 >= 0x2D)
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
  }
  else
  {
    *((_QWORD *)this + 5) = a2 + 4;
    v8 = 0;
    std::vector<unsigned char>::vector(&v9, a2 + 4, &v8);
    v4 = *(void **)this;
    if (*(_QWORD *)this)
    {
      *((_QWORD *)this + 1) = v4;
      operator delete(v4);
    }
    v5 = (unsigned int *)v9;
    *(_OWORD *)this = v9;
    *((_QWORD *)this + 2) = v10;
    v6 = *v5 & 0xFFFFC3FF | ((*((_DWORD *)this + 7) & 0xF) << 10);
    *v5 = v6;
    *v5 = v6 & 0xFFFF3C00 | *((_DWORD *)this + 6) & 0x3FF | 0x4000;
  }
  return a2 < 0x2D;
}

void RoseCommand::~RoseCommand(RoseCommand *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
  {
    *((_QWORD *)this + 1) = v2;
    operator delete(v2);
  }
}

uint64_t RoseCommand::getPayload(RoseCommand *this)
{
  return *(_QWORD *)this + 4;
}

uint64_t RoseCommand::getPacketData(RoseCommand *this)
{
  return *(_QWORD *)this;
}

uint64_t RoseCommand::getPacketLength(RoseCommand *this)
{
  return *((_QWORD *)this + 5);
}

BOOL RoseCommand::setPayloadLength(RoseCommand *this, uint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  char v6;

  v2 = a2 + 4;
  if ((unint64_t)(a2 + 4) <= 0x30)
  {
    v4 = *((_QWORD *)this + 1) - *(_QWORD *)this;
    if (v2 > v4)
    {
      v6 = 0;
      std::vector<unsigned char>::__append(this, v2 - v4, &v6);
    }
    *((_QWORD *)this + 5) = v2;
  }
  return v2 < 0x31;
}

uint64_t RoseCommand::validateResponse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;

  if ((unint64_t)(a3 - 113) > 0xFFFFFFFFFFFFFF94 && ((*(_DWORD *)a2 >> 10) & 0xF) == *(_DWORD *)(a1 + 28))
  {
    v3 = (*(_DWORD *)a2 & 0xC000) == 0x8000 && (*(_DWORD *)a2 & 0x3FF) == *(_DWORD *)(a1 + 24);
    if (v3 && (!*(_BYTE *)(a1 + 32) || !*(_WORD *)(a2 + 4)))
      return 1;
  }
  ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage();
  return 0;
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2, _BYTE *a3)
{
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_BYTE *)a1[1];
    v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_21FA16290(_Unwind_Exception *exception_object)
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
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(_QWORD *a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;

  v4 = a2;
  v7 = (_BYTE *)a1[1];
  v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0)
      std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
    v10 = v6 - *a1;
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
    v14 = &v8[(_QWORD)v12];
    v15 = &v8[(_QWORD)v12 + v4];
    v16 = &v8[(_QWORD)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (_BYTE *)*a1;
    if (v7 != (_BYTE *)*a1)
    {
      do
      {
        v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (_BYTE *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
      operator delete(v7);
  }
}

uint64_t RoseCalibration::sendCalibration(uint64_t *a1, uint64_t a2, __int128 *a3)
{
  int *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _DWORD *v21[2];
  uint64_t v22;
  std::__shared_weak_count *v23;
  char v24[8];
  _QWORD *v25;
  unsigned int v26;
  int *v27[3];

  v6 = (int *)operator new(0xCuLL);
  v27[1] = v6 + 3;
  v27[2] = v6 + 3;
  *(_QWORD *)v6 = 0x100000000;
  v6[2] = 2;
  v27[0] = v6;
  v7 = (std::__shared_weak_count *)a1[1];
  v22 = *a1;
  v23 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = *(_DWORD **)a2;
  v11 = *(_DWORD **)(a2 + 8);
  v21[0] = v10;
  v21[1] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 2);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  RoseCalibration::sendCalibration(&v22, v21, a3, v27, (uint64_t)v24);
  v14 = v26;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v24, v25);
  if (v11)
  {
    v15 = (unint64_t *)(v11 + 2);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 16))(v11);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v27[0])
    operator delete(v27[0]);
  return v14;
}

void sub_21FA16548(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  operator delete(v2);
  _Unwind_Resume(a1);
}

void RoseCalibration::sendCalibration(_QWORD *a1@<X0>, _DWORD **a2@<X1>, __int128 *a3@<X2>, int **a4@<X3>, uint64_t a5@<X8>)
{
  __int128 v8;
  char *v9;
  int *v10;
  std::string::size_type size;
  std::string::size_type i;
  ACFULogging *v13;
  __int128 v14;
  std::string *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  std::string *v22;
  std::string *v23;
  std::string *v24;
  size_t v25;
  int v26;
  size_t v27;
  std::string *v28;
  std::string *v29;
  int v30;
  const std::string::value_type *v31;
  std::string::size_type v32;
  std::string::size_type v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  uint64_t v46[3];
  std::string v47;
  std::string v48;
  __int128 v49;
  uint64_t v50;
  char **v51;
  char *v52[2];
  std::string *v53;
  std::string *v54;
  unint64_t v55;
  uint64_t *v56;
  _QWORD *v57[2];
  std::string *v58;
  std::string v59;
  void *v60;
  char v61;
  __int128 v62;
  uint64_t v63;
  _BYTE v64[24];
  _BYTE *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v57[0] = 0;
  v57[1] = 0;
  v55 = 0;
  v56 = (uint64_t *)v57;
  v53 = 0;
  v54 = 0;
  v52[0] = 0;
  v52[1] = 0;
  v51 = v52;
  v8 = *a3;
  LOBYTE(v50) = *((_BYTE *)a3 + 16);
  v49 = v8;
  v9 = (char *)operator new(0x20uLL);
  *(_QWORD *)v9 = off_24E47CCB0;
  *(_OWORD *)(v9 + 8) = v49;
  *((_QWORD *)v9 + 3) = v50;
  v65 = v9;
  v10 = *a4;
  v42 = a5;
  v43 = a4[1];
  if (*a4 != v43)
  {
LABEL_2:
    RoseCapabilities::supportedFDRDataClassesForCalibrationType(*a2, *v10, (std::string **)&v48);
    size = v48.__r_.__value_.__l.__size_;
    for (i = v48.__r_.__value_.__r.__words[0]; ; i += 48)
    {
      if (i == size)
      {
LABEL_37:
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
        if (++v10 != v43)
          goto LABEL_2;
        v22 = v53;
        v23 = v54;
        memset(&v59, 0, sizeof(v59));
        if (v53 != v54)
        {
          v24 = 0;
          v25 = 0;
          do
          {
            v26 = (char)v25;
            if ((v25 & 0x80u) == 0)
              v27 = v25;
            else
              v27 = v59.__r_.__value_.__l.__size_;
            std::string::basic_string[abi:ne180100]((uint64_t)&v48, v27 + 1);
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v28 = &v48;
            else
              v28 = (std::string *)v48.__r_.__value_.__r.__words[0];
            if (v27)
            {
              if ((v25 & 0x80u) == 0)
                v29 = &v59;
              else
                v29 = v24;
              memmove(v28, v29, v27);
            }
            *(_WORD *)((char *)&v28->__r_.__value_.__l.__data_ + v27) = 32;
            v30 = SHIBYTE(v22->__r_.__value_.__r.__words[2]);
            if (v30 >= 0)
              v31 = (const std::string::value_type *)v22;
            else
              v31 = (const std::string::value_type *)v22->__r_.__value_.__r.__words[0];
            if (v30 >= 0)
              v32 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
            else
              v32 = v22->__r_.__value_.__l.__size_;
            v9 = (char *)std::string::append(&v48, v31, v32);
            v33 = *(_QWORD *)v9;
            *(_QWORD *)&v62 = *((_QWORD *)v9 + 1);
            *(_QWORD *)((char *)&v62 + 7) = *(_QWORD *)(v9 + 15);
            v25 = v9[23];
            *(_QWORD *)v9 = 0;
            *((_QWORD *)v9 + 1) = 0;
            *((_QWORD *)v9 + 2) = 0;
            if (v26 < 0)
              operator delete(v24);
            v59.__r_.__value_.__r.__words[0] = v33;
            v59.__r_.__value_.__l.__size_ = v62;
            *(std::string::size_type *)((char *)&v59.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)&v62 + 7);
            *((_BYTE *)&v59.__r_.__value_.__s + 23) = v25;
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v48.__r_.__value_.__l.__data_);
            ++v22;
            v24 = (std::string *)v33;
          }
          while (v22 != v23);
        }
        goto LABEL_64;
      }
      if (*((_BYTE *)a3 + 16))
      {
        if (*(char *)(i + 47) < 0)
        {
          if (!*(_QWORD *)(i + 32))
            goto LABEL_10;
        }
        else if (!*(_BYTE *)(i + 47))
        {
          goto LABEL_10;
        }
        v13 = (ACFULogging *)std::__tree<std::string>::__count_unique<std::string>((uint64_t)&v51, (const void **)(i + 24));
        if (v13)
        {
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          goto LABEL_37;
        }
      }
LABEL_10:
      ACFUCommon::FDRDataClass::FDRDataClass(&v59, (const ACFUCommon::FDRDataClass *)i);
      v62 = 0uLL;
      v63 = 0;
      v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&v62;
      v47.__r_.__value_.__s.__data_[8] = 0;
      *(_QWORD *)&v62 = operator new(0x30uLL);
      *((_QWORD *)&v62 + 1) = v62;
      v63 = v62 + 48;
      *((_QWORD *)&v62 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ACFUCommon::FDRDataClass>,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass const*,ACFUCommon::FDRDataClass*>((uint64_t)&v63, (ACFUCommon::FDRDataClass *)&v59, (ACFUCommon::FDRDataClass *)&v62, (std::string *)v62);
      if (v61 < 0)
        operator delete(v60);
      if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v59.__r_.__value_.__l.__data_);
      (*(void (**)(std::string *__return_ptr, _QWORD, __int128 *, __int128 *, _BYTE *))(*(_QWORD *)*a1 + 24))(&v59, *a1, &v62, a3, v64);
      memset(&v47, 0, sizeof(v47));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v47, (__int128 *)v59.__r_.__value_.__l.__data_, (__int128 *)v59.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v59.__r_.__value_.__l.__size_ - v59.__r_.__value_.__r.__words[0]) >> 3));
      v14 = *(_OWORD *)&v47.__r_.__value_.__l.__data_;
      v58 = &v47;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
      if ((_QWORD)v14 != *((_QWORD *)&v14 + 1))
      {
        std::__tree<RoseCapabilities::CalibrationType>::__emplace_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(&v56, v10, v10);
        if (*((_BYTE *)a3 + 16))
        {
          if (*(char *)(i + 47) < 0)
          {
            if (*(_QWORD *)(i + 32))
            {
LABEL_18:
              v16 = v54;
              if ((unint64_t)v54 >= v55)
              {
                v20 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v53, (__int128 *)(i + 24));
              }
              else
              {
                if ((*(_BYTE *)(i + 47) & 0x80) != 0)
                {
                  std::string::__init_copy_ctor_external(v54, *(const std::string::value_type **)(i + 24), *(_QWORD *)(i + 32));
                }
                else
                {
                  v17 = *(_OWORD *)(i + 24);
                  v54->__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 40);
                  *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
                }
                v20 = v16 + 1;
              }
              v54 = v20;
              v15 = (std::string *)std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v51, (const void **)(i + 24), i + 24);
              goto LABEL_33;
            }
          }
          else if (*(_BYTE *)(i + 47))
          {
            goto LABEL_18;
          }
        }
        v18 = v54;
        if ((unint64_t)v54 >= v55)
        {
          v15 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v53, (__int128 *)i);
        }
        else
        {
          if (*(char *)(i + 23) < 0)
          {
            std::string::__init_copy_ctor_external(v54, *(const std::string::value_type **)i, *(_QWORD *)(i + 8));
          }
          else
          {
            v19 = *(_OWORD *)i;
            v54->__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 16);
            *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
          }
          v15 = v18 + 1;
        }
        v54 = v15;
      }
LABEL_33:
      if ((_DWORD)v60)
      {
        ACFULogging::getLogInstance((ACFULogging *)v15);
        ACFULogging::handleMessage();
        v35 = (int)v60;
        v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&v59;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)&v62;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
        std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
        v34 = v42;
        goto LABEL_67;
      }
      memset(&v47, 0, sizeof(v47));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v47, (__int128 *)v59.__r_.__value_.__l.__data_, (__int128 *)v59.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v59.__r_.__value_.__l.__size_ - v59.__r_.__value_.__r.__words[0]) >> 3));
      v21 = *(_OWORD *)&v47.__r_.__value_.__l.__data_;
      v58 = &v47;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
      v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&v59;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
      v59.__r_.__value_.__r.__words[0] = (std::string::size_type)&v62;
      std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
      if ((_QWORD)v21 != *((_QWORD *)&v21 + 1))
        goto LABEL_37;
    }
  }
  memset(&v59, 0, sizeof(v59));
LABEL_64:
  ACFULogging::getLogInstance((ACFULogging *)v9);
  ACFULogging::handleMessage();
  v34 = v42;
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);
  v35 = 0;
LABEL_67:
  std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100](v46, (uint64_t)&v56);
  std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100]((uint64_t *)v34, (uint64_t)v46);
  *(_DWORD *)(v34 + 24) = v35;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)v46, (_QWORD *)v46[1]);
  v40 = v65;
  if (v65 == v64)
  {
    v41 = 4;
    v40 = v64;
    goto LABEL_71;
  }
  if (v65)
  {
    v41 = 5;
LABEL_71:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(*v40 + 8 * v41))(v40, v36, v37, v38, v39);
  }
  std::__tree<std::string>::destroy((uint64_t)&v51, v52[0]);
  v59.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)&v56, v57[0]);
}

void sub_21FA16BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,char *a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,char a40,_QWORD *a41)
{
  uint64_t v41;
  _QWORD *v43;
  uint64_t v44;

  a21 = v41 - 208;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  *(_QWORD *)(v41 - 208) = v41 - 160;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  *(_QWORD *)(v41 - 208) = &__p;
  std::vector<ACFUCommon::FDRDataClass>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  v43 = *(_QWORD **)(v41 - 112);
  if (v43 == (_QWORD *)(v41 - 136))
  {
    v44 = 4;
    v43 = (_QWORD *)(v41 - 136);
  }
  else
  {
    if (!v43)
      goto LABEL_6;
    v44 = 5;
  }
  (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_6:
  std::__tree<std::string>::destroy((uint64_t)&a34, a35);
  *(_QWORD *)(v41 - 208) = &a37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v41 - 208));
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy((uint64_t)&a40, a41);
  _Unwind_Resume(a1);
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

__n128 std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = off_24E47CCB0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = off_24E47CCB0;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::operator()(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, const __CFData **a5)
{
  ACFULogging *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  const __CFData *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = *(ACFULogging **)a2;
  v7 = *(std::__shared_weak_count **)(a2 + 8);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v8 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (v6
    && (v10 = *a5,
  {
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    v13 = RoseTransport::sendCalibration(v6, v10, *(unsigned __int8 *)(a1 + 24), a4);
    if (v7)
    {
      v14 = (unint64_t *)&v7->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    v13 = 1;
  }
  if (v8)
  {
    v16 = (unint64_t *)&v8->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v7)
  {
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
  return v13;
}

void sub_21FA16FDC(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (v1)
  {
    v8 = (unint64_t *)&v1->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0,std::allocator<RoseCalibration::sendCalibration(std::shared_ptr<ACFUROM>,std::shared_ptr<RoseCapabilities>,ACFUFDR::Config const&,std::vector<RoseCapabilities::CalibrationType> &)::$_0>,ACFUErrorCode ()(std::shared_ptr<ACFUTransport>,std::shared_ptr<ACFUFirmware>,std::string const&,__CFData const*)>::target_type()
{
}

uint64_t std::__tree<std::string>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  const void **v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    v4 = a1 + 16;
    v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2))
          return v5;
        ++v2;
      }
      v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_21FA1721C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_21FA17378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

uint64_t **std::__tree<RoseCapabilities::CalibrationType>::__emplace_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(uint64_t **a1, int *a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
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
        v9 = *((_DWORD *)v5 + 7);
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
    *((_DWORD *)v10 + 7) = *a3;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
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
    std::vector<__CFString const*>::__throw_length_error[abi:ne180100]();
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
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
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

void sub_21FA175C8(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
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

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *result;
  uint64_t *v7;
  uint64_t v8;

  v5 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  result = *v5;
  if (!*v5)
  {
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

_QWORD *std::__tree<std::string>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::string>::__construct_node<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x38uLL);
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
    v7->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_21FA17984(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
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

uint64_t *std::set<RoseCapabilities::CalibrationType>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<RoseCapabilities::CalibrationType>::insert[abi:ne180100]<std::__tree_const_iterator<RoseCapabilities::CalibrationType,std::__tree_node<RoseCapabilities::CalibrationType,void *> *,long>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_21FA17AAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<RoseCapabilities::CalibrationType>::insert[abi:ne180100]<std::__tree_const_iterator<RoseCapabilities::CalibrationType,std::__tree_node<RoseCapabilities::CalibrationType,void *> *,long>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<RoseCapabilities::CalibrationType>::__emplace_hint_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(v5, v6, v4 + 7, v4 + 7);
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
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

uint64_t *std::__tree<RoseCapabilities::CalibrationType>::__emplace_hint_unique_key_args<RoseCapabilities::CalibrationType,RoseCapabilities::CalibrationType const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<RoseCapabilities::CalibrationType>::__find_equal<RoseCapabilities::CalibrationType>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<RoseCapabilities::CalibrationType>::__find_equal<RoseCapabilities::CalibrationType>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
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
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
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
    if (*((_DWORD *)v10 + 7) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 28);
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
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 28);
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

void RoseTransport::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  char *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _BOOL8 v13;
  BOOL v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18[2];

  v8 = (char *)operator new(0x78uLL);
  ACFUTransport::ACFUTransport((ACFUTransport *)v8);
  *(_QWORD *)v8 = &off_24E47CD40;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  v8[72] = 0;
  *((_QWORD *)v8 + 10) = 0;
  *((_QWORD *)v8 + 11) = 0;
  v8[96] = 0;
  *(_QWORD *)(v8 + 108) = 0;
  *(_QWORD *)(v8 + 100) = 0;
  *((_DWORD *)v8 + 29) = 0;
  *a4 = (uint64_t)v8;
  v9 = *a1;
  v10 = (std::__shared_weak_count *)a1[1];
  v18[0] = v9;
  v18[1] = (uint64_t)v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = RoseTransport::init((uint64_t)v8, v18, a2, a3);
  v14 = v13;
  if (v10)
  {
    v15 = (unint64_t *)&v10->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (!v14)
  {
    ACFULogging::getLogInstance((ACFULogging *)v13);
    ACFULogging::handleMessage();
    v17 = *a4;
    *a4 = 0;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 64))(v17);
  }
}

void sub_21FA17EC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t *v11;
  uint64_t v13;

  v13 = *v11;
  *v11 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 64))(v13);
  _Unwind_Resume(exception_object);
}

void RoseTransport::RoseTransport(RoseTransport *this)
{
  uint64_t v1;

  ACFUTransport::ACFUTransport(this);
  *(_QWORD *)v1 = &off_24E47CD40;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_BYTE *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0;
  *(_BYTE *)(v1 + 96) = 0;
  *(_QWORD *)(v1 + 108) = 0;
  *(_QWORD *)(v1 + 100) = 0;
  *(_DWORD *)(v1 + 116) = 0;
}

BOOL RoseTransport::init(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  unint64_t v12;
  _BOOL8 result;
  ACFULogging *PowerState;
  BOOL v15;
  _QWORD *v16;
  ACFULogging *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unsigned __int16 v24;
  BOOL v25;

  v25 = 0;
  v24 = -8531;
  v7 = (std::__shared_weak_count *)a2[1];
  v22 = *a2;
  v23 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = ACFUTransport::init();
  if (v23)
  {
    v11 = &v23->__shared_owners_;
    do
      v12 = __ldaxr((unint64_t *)v11);
    while (__stlxr(v12 - 1, (unint64_t *)v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if ((v10 & 1) == 0)
    return 0;
  *(_DWORD *)(a1 + 100) = a4;
  *(_QWORD *)(a1 + 32) = a3;
  if (a3 || (result = RoseTransport::createRoseController((RoseTransport *)a1)))
  {
    PowerState = (ACFULogging *)RoseTransport::getPowerState((RoseTransport *)a1, &v25);
    if ((_DWORD)PowerState
      || !v25
      && (ACFULogging::getLogInstance(PowerState),
          ACFULogging::handleMessage(),
          PowerState = (ACFULogging *)RoseTransport::setPowerState((RoseCapabilities **)a1, 1),
          (_DWORD)PowerState))
    {
      ACFULogging::getLogInstance(PowerState);
    }
    else
    {
      if ((*(unsigned int (**)(_QWORD, unsigned __int16 *))(**(_QWORD **)(a1 + 32) + 120))(*(_QWORD *)(a1 + 32), &v24))
      {
        v15 = 1;
      }
      else
      {
        v15 = v24 == 57005;
      }
      if (v15)
      {
        ACFULogging::getLogInstance((ACFULogging *)v24);
      }
      else
      {
        RoseCapabilities::create((RoseCapabilities *)v24, (RoseCapabilities **)&v21);
        v16 = (_QWORD *)(a1 + 104);
        v17 = (ACFULogging *)std::shared_ptr<RoseCapabilities>::operator=[abi:ne180100]((uint64_t)v16, &v21);
        v18 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
        if (*((_QWORD *)&v21 + 1))
        {
          v19 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
        }
        if (*v16)
          return 1;
        ACFULogging::getLogInstance(v17);
      }
    }
    ACFULogging::handleMessage();
    return 0;
  }
  return result;
}

void sub_21FA18188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL RoseTransport::createRoseController(RoseTransport *this)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  ACFULogging *MatchingService;
  io_object_t v5;
  kern_return_t ChildEntry;
  ACFULogging *v7;
  io_service_t v8;
  BOOL v9;
  const __CFAllocator *v10;
  const __CFUUID *v11;
  const __CFUUID *v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, _QWORD, char *);
  const __CFUUID *v16;
  CFUUIDBytes v17;
  uint64_t v18;
  dispatch_queue_t v19;
  void *v20;
  char *v21;
  ACFULogging *v22;
  char *v23;
  uint64_t v25;
  io_registry_entry_t child[2];

  *(_QWORD *)child = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching("rose");
  MatchingService = (ACFULogging *)IOServiceGetMatchingService(v2, v3);
  if ((_DWORD)MatchingService)
  {
    v5 = MatchingService;
    ChildEntry = IORegistryEntryGetChildEntry((io_registry_entry_t)MatchingService, "IOService", child);
    v7 = (ACFULogging *)IOObjectRelease(v5);
    v8 = child[0];
    if (ChildEntry)
      v9 = 1;
    else
      v9 = child[0] == 0;
    if (v9)
      goto LABEL_24;
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
    v11 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xAu, 0x3Au, 0xB3u, 0x17u, 0x88u, 0xE7u, 0x40u, 0xA0u, 0x89u, 0x68u, 0x33u, 0x55u, 0x58u, 0x14u, 0x66u, 0x63u);
    v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v13 = (uint64_t *)((char *)this + 24);
    LODWORD(v11) = IOCreatePlugInInterfaceForService(v8, v11, v12, (IOCFPlugInInterface ***)this + 3, (SInt32 *)&child[1]);
    v7 = (ACFULogging *)IOObjectRelease(child[0]);
    if ((_DWORD)v11)
      goto LABEL_24;
    v14 = *v13;
    if (!*v13)
      goto LABEL_24;
    v15 = *(void (**)(uint64_t, _QWORD, _QWORD, char *))(*(_QWORD *)v14 + 8);
    v16 = CFUUIDGetConstantUUIDWithBytes(v10, 0x10u, 0x3Au, 0xBDu, 0x4Au, 0x60u, 0x94u, 0x4Bu, 0xC0u, 0xAEu, 0xEEu, 0x3Eu, 0x37u, 0xF5u, 0xA2u, 0xFu, 0x3Bu);
    v17 = CFUUIDGetUUIDBytes(v16);
    v15(v14, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, (char *)this + 32);
    v18 = *((_QWORD *)this + 4);
    if (!v18)
    {
      ACFULogging::getLogInstance(0);
      goto LABEL_26;
    }
    v7 = (ACFULogging *)(*(uint64_t (**)(uint64_t, ACFULogging *(*)(ACFULogging *, void *, os_log_type_t, const char *), _QWORD))(*(_QWORD *)v18 + 64))(v18, RoseTransport::roseControllerLogSink, 0);
    if ((_DWORD)v7
      || (v19 = dispatch_queue_create("RoseQueue", 0),
          v20 = (void *)*((_QWORD *)this + 5),
          *((_QWORD *)this + 5) = v19,
          v20,
          !*((_QWORD *)this + 5)))
    {
LABEL_24:
      ACFULogging::getLogInstance(v7);
      goto LABEL_26;
    }
    v21 = (char *)operator new(0x78uLL);
    *((_QWORD *)v21 + 14) = 0;
    *(_QWORD *)v21 = 1018212795;
    *(_OWORD *)(v21 + 8) = 0u;
    *(_OWORD *)(v21 + 24) = 0u;
    *((_QWORD *)v21 + 5) = 0;
    *((_QWORD *)v21 + 6) = 850045863;
    *(_OWORD *)(v21 + 56) = 0u;
    *(_OWORD *)(v21 + 72) = 0u;
    *(_OWORD *)(v21 + 88) = 0u;
    *(_OWORD *)(v21 + 100) = 0u;
    v25 = 0;
    std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 7, (uint64_t)v21);
    std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](&v25, 0);
    if (*((_QWORD *)this + 7))
    {
      v23 = (char *)operator new(0x78uLL);
      *((_QWORD *)v23 + 14) = 0;
      *(_QWORD *)v23 = 1018212795;
      *(_OWORD *)(v23 + 8) = 0u;
      *(_OWORD *)(v23 + 24) = 0u;
      *((_QWORD *)v23 + 5) = 0;
      *((_QWORD *)v23 + 6) = 850045863;
      *(_OWORD *)(v23 + 56) = 0u;
      *(_OWORD *)(v23 + 72) = 0u;
      *(_OWORD *)(v23 + 88) = 0u;
      *(_OWORD *)(v23 + 100) = 0u;
      v25 = 0;
      std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 6, (uint64_t)v23);
      std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](&v25, 0);
      if (*((_QWORD *)this + 6))
      {
        v22 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)this + 4) + 72))(*((_QWORD *)this + 4), *((_QWORD *)this + 5));
        if (!(_DWORD)v22)
        {
          v22 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD, RoseTransport *))(**((_QWORD **)this + 4)
                                                                                          + 336))(*((_QWORD *)this + 4), RoseTransport::eventCallback, this);
          if (!(_DWORD)v22)
          {
            v22 = (ACFULogging *)(*(uint64_t (**)(_QWORD, ACFULogging *(*)(ACFULogging *, uint64_t), RoseTransport *))(**((_QWORD **)this + 4) + 384))(*((_QWORD *)this + 4), RoseTransport::crashCallback, this);
            if (!(_DWORD)v22)
            {
              *((_BYTE *)this + 96) = 1;
              goto LABEL_17;
            }
          }
        }
      }
    }
    ACFULogging::getLogInstance(v22);
  }
  else
  {
    ACFULogging::getLogInstance(MatchingService);
  }
LABEL_26:
  ACFULogging::handleMessage();
LABEL_17:
  if (*((_BYTE *)this + 96))
    return 1;
  RoseTransport::destroyRoseController(this);
  return *((_BYTE *)this + 96) != 0;
}

uint64_t RoseTransport::getPowerState(RoseTransport *this, BOOL *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  ACFULogging *ValueIfPresent;
  ACFULogging *v7;
  uint64_t v8;
  ACFULogging *v10;
  int valuePtr;
  void *value;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
LABEL_13:
    ACFULogging::handleMessage();
    return 3029;
  }
  v5 = Mutable;
  if (RoseTransport::getRoseDebugInfoDict(this, Mutable))
  {
    CFRelease(v5);
    ACFULogging::getLogInstance(v10);
    goto LABEL_13;
  }
  value = 0;
  valuePtr = 0;
  ValueIfPresent = (ACFULogging *)CFDictionaryGetValueIfPresent(v5, CFSTR("RosePowerState"), (const void **)&value);
  if (!(_DWORD)ValueIfPresent)
  {
    ACFULogging::getLogInstance(ValueIfPresent);
LABEL_8:
    ACFULogging::handleMessage();
    v8 = 3029;
    goto LABEL_9;
  }
  v7 = (ACFULogging *)CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
  if (!(_DWORD)v7)
  {
    ACFULogging::getLogInstance(v7);
    goto LABEL_8;
  }
  v8 = 0;
  *a2 = valuePtr != 0;
LABEL_9:
  CFRelease(v5);
  return v8;
}

uint64_t RoseTransport::setPowerState(RoseCapabilities **this, uint64_t a2)
{
  ACFULogging *v4;
  ACFULogging *v5;

  if ((a2 & 1) == 0 && RoseCapabilities::supportsRTKitIOConfig(this[13]))
  {
    v4 = (ACFULogging *)RoseTransport::applyResetGlitchWorkaround((RoseTransport *)this);
    if ((v4 & 1) == 0)
    {
      ACFULogging::getLogInstance(v4);
      ACFULogging::handleMessage();
    }
  }
  v5 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *, uint64_t))(*(_QWORD *)this[4] + 408))(this[4], a2);
  ACFULogging::getLogInstance(v5);
  ACFULogging::handleMessage();
  if ((_DWORD)v5)
    return 3028;
  else
    return 0;
}

ACFULogging *RoseTransport::roseControllerLogSink(ACFULogging *this, void *a2, os_log_type_t a3, const char *a4)
{
  if ((int)a2 <= 1)
  {
    if (a2 > 1)
      return this;
    goto LABEL_7;
  }
  if ((_DWORD)a2 == 2 || (_DWORD)a2 == 16 || (_DWORD)a2 == 17)
  {
LABEL_7:
    ACFULogging::getLogInstance(this);
    return (ACFULogging *)ACFULogging::handleMessage();
  }
  return this;
}

_QWORD *RoseTransport::eventCallback(RoseTransport *this, void *a2, uint64_t a3)
{
  if (this)
    return RoseTransport::eventHandler(this, a2, a3);
  ACFULogging::getLogInstance(0);
  return (_QWORD *)ACFULogging::handleMessage();
}

ACFULogging *RoseTransport::crashCallback(ACFULogging *a1, uint64_t a2)
{
  ACFULogging *v4;

  ACFULogging::getLogInstance(a1);
  v4 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1)
    return RoseTransport::crashHandler(a1, a2);
  ACFULogging::getLogInstance(v4);
  return (ACFULogging *)ACFULogging::handleMessage();
}

IOCFPlugInInterface **RoseTransport::destroyRoseController(RoseTransport *this)
{
  IOCFPlugInInterface **result;
  uint64_t v3;

  result = (IOCFPlugInInterface **)*((_QWORD *)this + 3);
  if (result)
  {
    v3 = *((_QWORD *)this + 4);
    if (v3)
    {
      (*(void (**)(_QWORD))(*(_QWORD *)v3 + 24))(*((_QWORD *)this + 4));
      *((_QWORD *)this + 4) = 0;
      result = (IOCFPlugInInterface **)*((_QWORD *)this + 3);
    }
    result = (IOCFPlugInInterface **)IODestroyPlugInInterface(result);
    *((_QWORD *)this + 3) = 0;
  }
  return result;
}

uint64_t RoseTransport::getBootNonceHash(RoseTransport *this, unsigned __int8 *a2, size_t a3, unint64_t *a4)
{
  size_t v8;
  char *v9;
  ACFULogging *v10;
  ACFULogging *v11;
  uint64_t result;
  size_t v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = 0;
  bzero(v9, v8);
  v10 = (ACFULogging *)(*(uint64_t (**)(_QWORD, unsigned __int8 *, size_t, size_t *))(**((_QWORD **)this + 4)
                                                                                              + 152))(*((_QWORD *)this + 4), a2, a3, v13);
  if ((_DWORD)v10)
    goto LABEL_12;
  if (v13[0] - 1 < a3)
  {
    v10 = (ACFULogging *)memcmp(v9, a2, v13[0]);
    if ((_DWORD)v10)
    {
LABEL_8:
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      result = 0;
      *a4 = v13[0];
      return result;
    }
    v11 = (ACFULogging *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 144))(*((_QWORD *)this + 4));
    if ((_DWORD)v11)
    {
      ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage();
      return 3008;
    }
    v13[0] = 0;
    v10 = (ACFULogging *)(*(uint64_t (**)(_QWORD, unsigned __int8 *, size_t, size_t *))(**((_QWORD **)this + 4)
                                                                                                + 152))(*((_QWORD *)this + 4), a2, a3, v13);
    if (!(_DWORD)v10)
    {
      if (v13[0] - 1 < a3)
      {
        v10 = (ACFULogging *)memcmp(v9, a2, v13[0]);
        if ((_DWORD)v10)
          goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_12:
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    return 3007;
  }
LABEL_13:
  ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage();
  return 3009;
}

void RoseTransport::getBoardParameters(RoseTransport *this@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  _OWORD *v8;
  int BootNonceHash;
  ACFUCommon::PersonalizeParams *v10;
  CFDataRef v11;
  ACFULogging *v12;
  ACFULogging *v13;
  ACFUCommon::PersonalizeParams *v14;
  CFDataRef v15;
  ACFULogging *v16;
  ACFUCommon::PersonalizeParams *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  ACFUCommon::PersonalizeParams *v26;
  const __CFAllocator *v27;
  CFDataRef v28;
  ACFUCommon::PersonalizeParams *v29;
  CFDataRef v30;
  ACFUCommon::PersonalizeParams *v31;
  CFDataRef v32;
  ACFUCommon::PersonalizeParams *v33;
  CFDataRef v34;
  ACFUCommon::PersonalizeParams *v35;
  CFDataRef v36;
  ACFUCommon::PersonalizeParams *v37;
  CFDataRef v38;
  ACFUCommon::PersonalizeParams *v39;
  CFDataRef v40;
  ACFUCommon::PersonalizeParams *v41;
  CFDataRef v42;
  ACFULogging *v43;
  ACFUCommon::PersonalizeParams *v44;
  std::__shared_weak_count *v45;
  void *__p;
  void *v47;
  _OWORD *v48;
  UInt8 v49[2];
  UInt8 v50;
  UInt8 v51;
  UInt8 v52;
  UInt8 v53;
  uint64_t v54;
  unint64_t v55;
  UInt8 v56[10];
  UInt8 v57[2];
  UInt8 v58[2];
  UInt8 v59[8];
  UInt8 bytes[16];
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  *(_WORD *)v58 = -8531;
  *(_WORD *)v57 = -8531;
  v55 = 0;
  *(_QWORD *)v56 = 0xDEADBEEFDEADBEEFLL;
  *(_OWORD *)bytes = 0u;
  v61 = 0u;
  *(_QWORD *)v59 = 0;
  v54 = 0;
  v53 = -34;
  v52 = -34;
  v51 = -34;
  v50 = -34;
  *(_WORD *)v49 = -8531;
  v8 = operator new(0x50uLL);
  v47 = v8 + 5;
  v48 = v8 + 5;
  v8[2] = xmmword_24E47CDB0;
  v8[3] = *(_OWORD *)&off_24E47CDC0;
  v8[4] = xmmword_24E47CDD0;
  *v8 = xmmword_24E47CD90;
  v8[1] = *(_OWORD *)&off_24E47CDA0;
  __p = v8;
  std::allocate_shared[abi:ne180100]<ACFUCommon::PersonalizeParams,std::allocator<ACFUCommon::PersonalizeParams>,std::vector<__CFString const*> &,void>((uint64_t)&__p, &v44);
  if (a3)
  {
    BootNonceHash = RoseTransport::getBootNonceHash(this, bytes, 0x20uLL, &v55);
    if (BootNonceHash)
      goto LABEL_14;
    v10 = v44;
    v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 32);
    *((_QWORD *)v10 + 7) = v11;
    *((_BYTE *)v10 + 64) = v11 != 0;
  }
  if (a2)
  {
    v12 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *, uint64_t, uint64_t *))(**((_QWORD **)this + 4) + 160))(*((_QWORD *)this + 4), v59, 8, &v54);
    if ((_DWORD)v12)
    {
      ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage();
      BootNonceHash = 3007;
      goto LABEL_14;
    }
    ACFULogging::getLogInstance(v12);
    v13 = (ACFULogging *)ACFULogging::handleMessage();
    if ((unint64_t)(v54 - 9) <= 0xFFFFFFFFFFFFFFF7)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      BootNonceHash = 3009;
      goto LABEL_14;
    }
    v14 = v44;
    v15 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v59, 8);
    *((_QWORD *)v14 + 9) = v15;
    *((_BYTE *)v14 + 80) = v15 != 0;
  }
  v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 120))(*((_QWORD *)this + 4), v58);
  if ((_DWORD)v16
    || *(unsigned __int16 *)v58 == 57005
    || (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 128))(*((_QWORD *)this + 4), v57), (_DWORD)v16)|| *(unsigned __int16 *)v57 == 57005|| (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 136))(*((_QWORD *)this + 4), v56), (_DWORD)v16)|| !*(_QWORD *)v56|| *(_QWORD *)v56 == 0xDEADBEEFDEADBEEFLL|| (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 224))(*((_QWORD *)this + 4), &v52), (_DWORD)v16)|| v52 >= 2u|| (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 216))(*((_QWORD *)this + 4), &v53), (_DWORD)v16)
    || v53 >= 2u
    || (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 232))(*((_QWORD *)this + 4), &v51), (_DWORD)v16)|| v51 == 222|| (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 240))(*((_QWORD *)this + 4), &v50), (_DWORD)v16)|| v50 == 222|| (v16 = (ACFULogging *)(*(uint64_t (**)(_QWORD, UInt8 *))(**((_QWORD **)this + 4) + 352))(*((_QWORD *)this + 4), v49), (_DWORD)v16)|| *(unsigned __int16 *)v49 == 57005)
  {
    ACFULogging::getLogInstance(v16);
    ACFULogging::handleMessage();
    BootNonceHash = 3011;
  }
  else
  {
    v26 = v44;
    v27 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v28 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v56, 8);
    *((_QWORD *)v26 + 5) = v28;
    *((_BYTE *)v26 + 48) = v28 != 0;
    v29 = v44;
    v30 = CFDataCreate(v27, v57, 2);
    *((_QWORD *)v29 + 3) = v30;
    *((_BYTE *)v29 + 32) = v30 != 0;
    v31 = v44;
    v32 = CFDataCreate(v27, v58, 2);
    *((_QWORD *)v31 + 1) = v32;
    *((_BYTE *)v31 + 16) = v32 != 0;
    v33 = v44;
    v34 = CFDataCreate(v27, &v53, 1);
    *((_QWORD *)v33 + 11) = v34;
    *((_BYTE *)v33 + 96) = v34 != 0;
    v35 = v44;
    v36 = CFDataCreate(v27, &v52, 1);
    *((_QWORD *)v35 + 13) = v36;
    *((_BYTE *)v35 + 112) = v36 != 0;
    v37 = v44;
    v38 = CFDataCreate(v27, &v51, 1);
    *((_QWORD *)v37 + 17) = v38;
    *((_BYTE *)v37 + 144) = v38 != 0;
    v39 = v44;
    v40 = CFDataCreate(v27, &v50, 1);
    *((_QWORD *)v39 + 19) = v40;
    *((_BYTE *)v39 + 160) = v40 != 0;
    v41 = v44;
    v42 = CFDataCreate(v27, v49, 2);
    *((_QWORD *)v41 + 21) = v42;
    *((_BYTE *)v41 + 176) = v42 != 0;
    v43 = (ACFULogging *)ACFUCommon::PersonalizeParams::logParameters(v44);
    if (*(_WORD *)v57 && v51 - 4 <= 0xFFFFFFFC)
    {
      ACFULogging::getLogInstance(v43);
      ACFULogging::handleMessage();
      std::shared_ptr<RoseCapabilities>::reset[abi:ne180100](&v44);
      BootNonceHash = 3006;
    }
    else
    {
      BootNonceHash = 0;
    }
  }
LABEL_14:
  v17 = v44;
  v18 = v45;
  if (v45)
  {
    p_shared_owners = (unint64_t *)&v45->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
    *(_QWORD *)a4 = v17;
    *(_QWORD *)(a4 + 8) = v18;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    *(_DWORD *)(a4 + 16) = BootNonceHash;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  else
  {
    *(_QWORD *)a4 = v44;
    *(_QWORD *)(a4 + 8) = 0;
    *(_DWORD *)(a4 + 16) = BootNonceHash;
  }
  v23 = v45;
  if (v45)
  {
    v24 = (unint64_t *)&v45->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (__p)
  {
    v47 = __p;
    operator delete(__p);
  }
}

void sub_21FA193F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::setNonce(uint64_t this, void *a2, uint64_t a3)
{
  if (!a2
    || !a3
    || (this = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 32) + 168))(*(_QWORD *)(this + 32)),
        (_DWORD)this))
  {
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    return 3028;
  }
  return this;
}

uint64_t RoseTransport::pushFirmware(uint64_t a1, ACFUFirmware **a2)
{
  const __CFData *Manifest;
  uint64_t v5;
  ACFULogging *v6;
  BOOL v7;
  uint64_t v8;
  ACFULogging *v9;
  ACFULogging *v10;
  uint64_t v11;
  ACFULogging *v12;
  ACFULogging *v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *);
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v20;
  CFIndex v21;
  const UInt8 *v22;
  CFIndex v23;
  const UInt8 *v24;
  CFIndex v25;
  ACFULogging *v26;
  uint64_t (*v27)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex);
  const UInt8 *v28;
  CFIndex v29;
  const UInt8 *v30;
  CFIndex v31;
  const UInt8 *v32;
  CFIndex v33;
  ACFULogging *v34;
  char v35;
  ACFULogging *v36;
  uint64_t v37;
  const char *v39;
  ACFULogging *v40;
  const __CFData *v41;
  const __CFData *theData;
  const __CFData *v43;
  unsigned int v44;
  _QWORD v45[3];
  ACFULogging *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  Manifest = (const __CFData *)ACFUFirmware::getManifest(*a2);
  v5 = ACFUFirmware::copyFWDataByTag(*a2, CFSTR("Rap,RTKitOS"));
  v6 = (ACFULogging *)ACFUFirmware::copyFWDataByTag(*a2, CFSTR("Rap,SoftwareBinaryDsp1"));
  v44 = -559038737;
  v41 = v6;
  theData = (const __CFData *)v5;
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (!Manifest)
    {
      ACFULogging::getLogInstance(v6);
      ACFULogging::handleMessage();
      v43 = 0;
      v11 = 1001;
      goto LABEL_34;
    }
    if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104)))
    {
      v8 = ACFUFirmware::copyFWDataByTag(*a2, CFSTR("Rap,RTKitIOConfig"));
      if (!v8)
      {
        ACFULogging::getLogInstance(0);
        v39 = "pushFirmware";
        ACFULogging::handleMessage();
      }
    }
    else
    {
      v8 = 0;
    }
    v43 = (const __CFData *)v8;
    if (*(_BYTE *)(a1 + 96))
    {
      v9 = (ACFULogging *)RoseTransport::flushDebugInfo((RoseTransport *)a1);
      if (!(_DWORD)v9)
      {
        v11 = 0;
LABEL_15:
        v12 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 32) + 184))(*(_QWORD *)(a1 + 32), 0);
        if ((_DWORD)v12)
        {
          ACFULogging::getLogInstance(v12);
          ACFULogging::handleMessage();
          goto LABEL_34;
        }
        v13 = (ACFULogging *)(*(uint64_t (**)(_QWORD, unsigned int *))(**(_QWORD **)(a1 + 32) + 192))(*(_QWORD *)(a1 + 32), &v44);
        if ((_DWORD)v13)
          v14 = 1;
        else
          v14 = v44 >= 2;
        if (v14)
        {
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          goto LABEL_34;
        }
        if (v44)
        {
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          v11 = 3010;
          goto LABEL_34;
        }
        v15 = *(uint64_t **)(a1 + 32);
        v16 = *v15;
        if (v8)
        {
          v17 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *))(v16 + 448);
          BytePtr = CFDataGetBytePtr(Manifest);
          Length = CFDataGetLength(Manifest);
          v20 = CFDataGetBytePtr(theData);
          v21 = CFDataGetLength(theData);
          v22 = CFDataGetBytePtr(v41);
          v23 = CFDataGetLength(v41);
          v24 = CFDataGetBytePtr(v43);
          v25 = CFDataGetLength(v43);
          v26 = (ACFULogging *)v17(v15, BytePtr, Length, v20, v21, v22, v23, v24, v25, v39, v40);
          if ((_DWORD)v26)
          {
            ACFULogging::getLogInstance(v26);
            ACFULogging::handleMessage();
LABEL_47:
            v11 = 3001;
            goto LABEL_34;
          }
        }
        else
        {
          v27 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex))(v16 + 96);
          v28 = CFDataGetBytePtr(Manifest);
          v29 = CFDataGetLength(Manifest);
          v30 = CFDataGetBytePtr(theData);
          v31 = CFDataGetLength(theData);
          v32 = CFDataGetBytePtr(v41);
          v33 = CFDataGetLength(v41);
          v34 = (ACFULogging *)v27(v15, v28, v29, v30, v31, v32, v33);
          if ((_DWORD)v34)
          {
            ACFULogging::getLogInstance(v34);
            ACFULogging::handleMessage();
            v43 = 0;
            goto LABEL_47;
          }
        }
        if (!*(_BYTE *)(a1 + 96))
          goto LABEL_32;
        v45[0] = off_24E47CEB8;
        v45[1] = a1;
        v46 = (ACFULogging *)v45;
        v35 = ACFUSynchronize::Syncher::wait();
        v36 = v46;
        if (v46 == (ACFULogging *)v45)
        {
          v37 = 4;
          v36 = (ACFULogging *)v45;
        }
        else
        {
          if (!v46)
            goto LABEL_31;
          v37 = 5;
        }
        v36 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v36 + 8 * v37))(v36);
LABEL_31:
        if ((v35 & 1) == 0)
        {
          ACFULogging::getLogInstance(v36);
          ACFULogging::handleMessage();
          v11 = 3002;
          goto LABEL_34;
        }
LABEL_32:
        v11 = 0;
LABEL_34:
        CFRelease(theData);
        goto LABEL_35;
      }
      v10 = v9;
      ACFULogging::getLogInstance(v9);
      v39 = "pushFirmware";
      v40 = v10;
      ACFULogging::handleMessage();
    }
    v11 = 3000;
    goto LABEL_15;
  }
  ACFULogging::getLogInstance(v6);
  ACFULogging::handleMessage();
  v43 = 0;
  v11 = 1000;
  if (v5)
    goto LABEL_34;
LABEL_35:
  if (v41)
    CFRelease(v41);
  if (v43)
    CFRelease(v43);
  return v11;
}

void sub_21FA199B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char *a21)
{
  char *v21;
  char *v23;
  uint64_t v24;

  v23 = a21;
  if (a21 == v21)
  {
    v24 = 4;
    v23 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::flushDebugInfo(RoseTransport *this)
{
  ACFULogging *v2;
  uint64_t v3;
  unsigned __int8 v4;
  char v5;
  char v6;
  ACFULogging *v7;
  BOOL v8;
  ACFULogging *v10;
  ACFULogging *v12;
  unint64_t v13;
  _BYTE v14[15];
  uint64_t v15;
  void *__p[2];
  uint64_t v17;

  v14[0] = 0;
  std::vector<unsigned char>::vector(__p, 0x2000uLL, v14);
  v15 = 0;
  if (RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(*((RoseCapabilities **)this + 13)))
  {
    v2 = (ACFULogging *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 272))(*((_QWORD *)this + 4));
    if ((_DWORD)v2)
    {
      ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage();
      v3 = 3000;
      goto LABEL_16;
    }
    while (1)
    {
      v10 = (ACFULogging *)(*(uint64_t (**)(_QWORD, void *, unint64_t, uint64_t *))(**((_QWORD **)this + 4)
                                                                                                  + 280))(*((_QWORD *)this + 4), __p[0], v17 - (unint64_t)__p[0], &v15);
      if ((_DWORD)v10 || v15 == 0)
        break;
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      v15 = 0;
    }
    if ((_DWORD)v10)
    {
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      v3 = 3000;
    }
    else
    {
      v3 = 0;
    }
    v12 = (ACFULogging *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 288))(*((_QWORD *)this + 4));
    if ((_DWORD)v12)
    {
      ACFULogging::getLogInstance(v12);
      ACFULogging::handleMessage();
      v3 = 3000;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v13 = 0;
    while (RoseTransport::isCrashLogAvailable(this, v4, &v13))
    {
      v13 = 0;
      v7 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, void *, unint64_t, unint64_t *))(**((_QWORD **)this + 4) + 360))(*((_QWORD *)this + 4), v4, v14, __p[0], v17 - (unint64_t)__p[0], &v13);
      if ((_DWORD)v7)
        v8 = 1;
      else
        v8 = v13 == 0;
      if (v8)
      {
        ACFULogging::getLogInstance(v7);
        v3 = 3000;
      }
      else
      {
        ACFULogging::getLogInstance(v7);
      }
      ACFULogging::handleMessage();
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
LABEL_16:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v3;
}

void sub_21FA19C68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL RoseTransport::isCrashLogAvailable(RoseTransport *this, uint64_t a2, unint64_t *a3)
{
  if (a3)
  {
    this = (RoseTransport *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, unint64_t *))(**((_QWORD **)this + 4) + 360))(*((_QWORD *)this + 4), a2, 0, 0, 0, a3);
    if (!(_DWORD)this && *a3 <= 0x200000)
      return *a3 != 0;
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 0;
}

void RoseTransport::collectFirmwareLogs(RoseCapabilities **this)
{
  ACFULogging *v2;
  char v3;
  const __CFAllocator *v4;
  __CFData *Mutable;
  ACFULogging *v6;
  CFIndex v7;
  UInt8 *MutableBytePtr;
  ACFULogging *v9;
  CFIndex v10;
  CFStringRef v11;
  CFStringRef v12;
  ACFULogging *v13;
  ACFULogging *v14;
  unint64_t v15;

  v15 = 0;
  v2 = (ACFULogging *)RoseCapabilities::supportsFirmwareLogCollectionFromRoseController(this[13]);
  v3 = (char)v2;
  ACFULogging::getLogInstance(v2);
  if ((v3 & 1) != 0)
  {
    ACFULogging::handleMessage();
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (Mutable)
    {
      v6 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(_QWORD *)this[4] + 272))(this[4]);
      if ((_DWORD)v6)
      {
        ACFULogging::getLogInstance(v6);
      }
      else
      {
        LODWORD(v7) = 0;
        while (1)
        {
          CFDataIncreaseLength(Mutable, 1024);
          MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
          v9 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *, UInt8 *, uint64_t, unint64_t *))(*(_QWORD *)this[4] + 280))(this[4], &MutableBytePtr[v7], 1024, &v15);
          if ((_DWORD)v9 || v15 >= 0x401)
            break;
          v7 = (v7 + v15);
          if (!v15)
          {
            if (!(_DWORD)v7)
            {
              ACFULogging::getLogInstance(v9);
              goto LABEL_15;
            }
            v10 = v7;
            goto LABEL_10;
          }
        }
        ACFULogging::getLogInstance(v9);
        ACFULogging::handleMessage();
        if (!(_DWORD)v7)
          goto LABEL_16;
        v10 = v7;
LABEL_10:
        CFDataSetLength(Mutable, v10);
        v11 = CFStringCreateWithFormat(v4, 0, CFSTR("%@.log"), CFSTR("FirmwareLogs"), "collectFirmwareLogs");
        if (v11)
        {
          v12 = v11;
          v13 = (ACFULogging *)ACFUDiagnostics::addItem();
          ACFULogging::getLogInstance(v13);
          ACFULogging::handleMessage();
          CFRelease(v12);
          goto LABEL_16;
        }
        ACFULogging::getLogInstance(0);
      }
    }
    else
    {
      ACFULogging::getLogInstance(0);
    }
LABEL_15:
    ACFULogging::handleMessage();
LABEL_16:
    v14 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(_QWORD *)this[4] + 288))(this[4]);
    if ((_DWORD)v14)
    {
      ACFULogging::getLogInstance(v14);
      ACFULogging::handleMessage();
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    ACFULogging::handleMessage();
  }
}

void RoseTransport::logCrashLogReason(RoseTransport *this, const unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v3;
  const unsigned __int8 *v4;
  uint64_t v5;
  ACFULogging *v7;
  void *__p;
  char v9;

  if (a3 >= 0x51)
  {
    v3 = 32;
    while (1)
    {
      v4 = &a2[v3];
      v5 = *(unsigned int *)&a2[v3 + 12];
      if (v5 <= 0xF)
        break;
      if (*(_DWORD *)v4 == 1131639922)
      {
        if (*((_DWORD *)v4 + 2) == 257 && v5 >= 0x15 && v3 + v5 + 32 <= a3)
        {
          v7 = (ACFULogging *)std::string::basic_string[abi:ne180100](&__p, (void *)(v4 + 20), (int)v5 - 20);
          ACFULogging::getLogInstance(v7);
          ACFULogging::handleMessage();
          if (v9 < 0)
            operator delete(__p);
          return;
        }
        break;
      }
      v3 += v5;
      if (v3 + 48 >= a3)
        return;
    }
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
}

void sub_21FA1A1AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void RoseTransport::collectCrashLogs(_BOOL8 this)
{
  RoseTransport *v1;
  uint64_t v2;
  char v3;
  const __CFAllocator *v4;
  uint64_t v5;
  __CFData *Mutable;
  __CFData *v7;
  const __CFAllocator *v8;
  RoseTransport *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _QWORD, _QWORD *, UInt8 *, CFIndex, unsigned __int8 **);
  UInt8 *MutableBytePtr;
  CFIndex Length;
  ACFULogging *v14;
  const UInt8 *BytePtr;
  const UInt8 *v16;
  ACFUMachO32 *v17;
  uint64_t v18;
  uint64_t v19;
  ACFUMachO64 *v20;
  uint64_t v21;
  RoseTransport *v22;
  CFStringRef v23;
  CFStringRef v24;
  ACFULogging *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD v32[2];
  unsigned __int8 *v33;
  unint64_t v34;

  v1 = (RoseTransport *)this;
  v2 = 0;
  v3 = 1;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  do
  {
    v30 = v3;
    v34 = 0;
    v33 = 0;
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    this = RoseTransport::isCrashLogAvailable(v1, v2, &v34);
    if (!this)
      goto LABEL_24;
    v5 = 1;
    while (1)
    {
      ACFULogging::getLogInstance((ACFULogging *)this);
      ACFULogging::handleMessage();
      Mutable = CFDataCreateMutable(v4, 0);
      if (Mutable)
        break;
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
LABEL_21:
      v5 = (v5 + 1);
      this = RoseTransport::isCrashLogAvailable(v1, v2, &v34);
      if (!this)
        goto LABEL_24;
    }
    v7 = Mutable;
    v8 = v4;
    CFDataIncreaseLength(Mutable, v34);
    memset(v32, 0, 15);
    v9 = v1;
    v10 = *((_QWORD *)v1 + 4);
    v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD *, UInt8 *, CFIndex, unsigned __int8 **))(*(_QWORD *)v10 + 360);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    Length = CFDataGetLength(v7);
    v14 = (ACFULogging *)v11(v10, v2, v32, MutableBytePtr, Length, &v33);
    if (!(_DWORD)v14)
    {
      if (v33 != (unsigned __int8 *)v34)
      {
        ACFULogging::getLogInstance(v14);
        v14 = (ACFULogging *)ACFULogging::handleMessage();
      }
      ACFULogging::getLogInstance(v14);
      v28 = BYTE6(v32[1]);
      v29 = BYTE4(v32[1]);
      v26 = v32[0];
      v27 = BYTE5(v32[1]);
      ACFULogging::handleMessage();
      BytePtr = CFDataGetBytePtr(v7);
      v4 = v8;
      v1 = v9;
      if (!BytePtr)
        goto LABEL_17;
      v16 = BytePtr;
      if ((unint64_t)CFDataGetLength(v7) < 0x20 || *((_DWORD *)v16 + 3) > 0x3Fu)
        goto LABEL_17;
      if ((v30 & 1) != 0)
      {
        v17 = (ACFUMachO32 *)CFDataGetBytePtr(v7);
        ACFUMachO32::create(v17, v33);
        v18 = v31;
        v31 = 0;
        v19 = *((_QWORD *)v9 + 10);
        *((_QWORD *)v9 + 10) = v18;
        if (!v19)
          goto LABEL_17;
      }
      else
      {
        v20 = (ACFUMachO64 *)CFDataGetBytePtr(v7);
        ACFUMachO64::create(v20, v33);
        v21 = v31;
        v31 = 0;
        v19 = *((_QWORD *)v9 + 11);
        *((_QWORD *)v9 + 11) = v21;
        if (!v19)
        {
LABEL_17:
          v22 = (RoseTransport *)CFDataGetBytePtr(v7);
          RoseTransport::logCrashLogReason(v22, (const unsigned __int8 *)v22, (unint64_t)v33);
          v23 = CFStringCreateWithFormat(v8, 0, CFSTR("%@-%d.bin"), kRoseCoreToCrashLogKey[v2], v5, v26, v27, v28, v29);
          if (v23)
          {
            v24 = v23;
            v25 = (ACFULogging *)ACFUDiagnostics::addItem();
            ACFULogging::getLogInstance(v25);
            ACFULogging::handleMessage();
            CFRelease(v24);
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
          }
          CFRelease(v7);
          goto LABEL_21;
        }
      }
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
      v31 = 0;
      goto LABEL_17;
    }
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    CFRelease(v7);
    v4 = v8;
    v1 = v9;
LABEL_24:
    v3 = 0;
    v2 = 1;
  }
  while ((v30 & 1) != 0);
}

uint64_t RoseTransport::isCoreDumpAvailable(RoseTransport *this, uint64_t a2, unsigned int *a3)
{
  ACFULogging *v4;
  unsigned int v5;
  _QWORD v7[2];

  if (a3)
  {
    memset(v7, 0, 15);
    v4 = (ACFULogging *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD *))(**((_QWORD **)this + 4) + 368))(*((_QWORD *)this + 4), a2, v7);
    if ((_DWORD)v4)
    {
      ACFULogging::getLogInstance(v4);
    }
    else
    {
      v5 = LODWORD(v7[1]) - 2097153;
      ACFULogging::getLogInstance(v4);
      if (v5 >> 21 == 2047)
      {
        ACFULogging::handleMessage();
        *a3 = v7[1];
        return 1;
      }
    }
  }
  else
  {
    ACFULogging::getLogInstance(this);
  }
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseTransport::collectCoreDump(RoseTransport *this)
{
  RoseTransport *v1;
  uint64_t v2;
  char v3;
  const __CFAllocator *v4;
  char v5;
  CFMutableDataRef Mutable;
  __CFData *v7;
  ACFUMachO *v8;
  const __CFData *MachoHeaderData;
  const __CFData *v10;
  unsigned int Length;
  const UInt8 *BytePtr;
  const __CFString *v13;
  UInt8 *MutableBytePtr;
  ACFULogging *v15;
  __CFData *v16;
  CFStringRef v17;
  CFStringRef v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFIndex extraLength;

  v1 = this;
  v2 = 0;
  v3 = 1;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  do
  {
    v5 = v3;
    ACFULogging::getLogInstance(this);
    v21 = v2;
    ACFULogging::handleMessage();
    LODWORD(extraLength) = 0;
    this = (RoseTransport *)RoseTransport::isCoreDumpAvailable(v1, v2, (unsigned int *)&extraLength);
    if (!(_DWORD)this)
      goto LABEL_20;
    v23 = 0;
    Mutable = CFDataCreateMutable(v4, 0);
    if (!Mutable)
    {
      ACFULogging::getLogInstance(0);
      this = (RoseTransport *)ACFULogging::handleMessage();
      goto LABEL_20;
    }
    v7 = Mutable;
    if ((v5 & 1) != 0)
    {
      v8 = (ACFUMachO *)*((_QWORD *)v1 + 10);
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v8 = (ACFUMachO *)*((_QWORD *)v1 + 11);
      if (!v8)
        goto LABEL_11;
    }
    MachoHeaderData = (const __CFData *)ACFUMachO::getMachoHeaderData(v8);
    if (MachoHeaderData)
    {
      v10 = MachoHeaderData;
      Length = CFDataGetLength(MachoHeaderData);
      BytePtr = CFDataGetBytePtr(v10);
      CFDataAppendBytes(v7, BytePtr, Length);
      v13 = CFSTR("%@-raw.bin");
      goto LABEL_12;
    }
LABEL_11:
    Length = 0;
    v13 = CFSTR("%@.bin");
LABEL_12:
    CFDataIncreaseLength(v7, extraLength);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    v15 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, UInt8 *, uint64_t *))(**((_QWORD **)v1 + 4) + 376))(*((_QWORD *)v1 + 4), v2, 0, extraLength, &MutableBytePtr[Length], &v23);
    if ((_DWORD)v15)
    {
      ACFULogging::getLogInstance(v15);
    }
    else
    {
      if (v23 != extraLength)
      {
        ACFULogging::getLogInstance(v15);
        v21 = v23;
        v22 = extraLength;
        ACFULogging::handleMessage();
      }
      v17 = CFStringCreateWithFormat(v4, 0, v13, kRoseCoreToCoreDumpKey[v2], "collectCoreDump", v21, v22);
      if (v17)
      {
        v18 = v17;
        ACFUDiagnostics::addItem();
        CFRelease(v7);
        v16 = (__CFData *)v18;
        goto LABEL_19;
      }
      ACFULogging::getLogInstance(0);
    }
    ACFULogging::handleMessage();
    v16 = v7;
LABEL_19:
    CFRelease(v16);
LABEL_20:
    v3 = 0;
    v2 = 1;
  }
  while ((v5 & 1) != 0);
  v19 = *((_QWORD *)v1 + 10);
  *((_QWORD *)v1 + 10) = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  result = *((_QWORD *)v1 + 11);
  *((_QWORD *)v1 + 11) = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void RoseTransport::collectIOReport(RoseTransport *this)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  ACFULogging *ChannelCount;
  uint64_t Subscription;
  const void *v6;
  ACFULogging *v7;
  const void *Samples;
  const __CFArray *Mutable;
  ACFULogging *v10;

  v1 = IOReportCopyAllChannels();
  if (!v1)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return;
  }
  v2 = (const void *)v1;
  v3 = IOReportSelectChannelsInGroup();
  if ((v3 & 1) != 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)v3);
  }
  else
  {
    ChannelCount = (ACFULogging *)IOReportGetChannelCount();
    ACFULogging::getLogInstance(ChannelCount);
    if ((int)ChannelCount > 0)
    {
      ACFULogging::handleMessage();
      Subscription = IOReportCreateSubscription();
      if (Subscription)
      {
        v6 = (const void *)Subscription;
        v7 = (ACFULogging *)IOReportGetChannelCount();
        if ((int)v7 < 1 || (int)v7 > (int)ChannelCount)
        {
          ACFULogging::getLogInstance(v7);
          ACFULogging::handleMessage();
          Mutable = 0;
          Samples = 0;
        }
        else
        {
          if (v7 < ChannelCount)
          {
            ACFULogging::getLogInstance(v7);
            ACFULogging::handleMessage();
          }
          Samples = (const void *)IOReportCreateSamples();
          if (Samples)
          {
            Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
            if (Mutable)
            {
              v10 = (ACFULogging *)IOReportIterate();
              if ((_DWORD)v10)
              {
                ACFULogging::getLogInstance(v10);
                ACFULogging::handleMessage();
              }
              if (CFArrayGetCount(Mutable))
                ACFUDiagnostics::addItem();
            }
            else
            {
              ACFULogging::getLogInstance(0);
              ACFULogging::handleMessage();
            }
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
            Mutable = 0;
          }
        }
        CFRelease(v6);
        goto LABEL_16;
      }
      ACFULogging::getLogInstance(0);
    }
  }
  ACFULogging::handleMessage();
  Samples = 0;
  Mutable = 0;
LABEL_16:
  CFRelease(v2);
  if (Samples)
    CFRelease(Samples);
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t ___ZN13RoseTransport15collectIOReportEv_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = (const void *)IOReportSampleCopyDescription();
  if (v2)
  {
    v3 = v2;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v2);
    CFRelease(v3);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  return 0;
}

uint64_t RoseTransport::getDebugInfo(uint64_t a1, uint64_t a2, int a3)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v6;
  ACFULogging *v7;
  uint64_t v8;
  char v10;

  v10 = 1;
  if (!*(_QWORD *)(a1 + 8))
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
LABEL_11:
    ACFULogging::handleMessage();
    return 3000;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_11;
  }
  v6 = Mutable;
  v7 = (ACFULogging *)(*(uint64_t (**)(_QWORD, CFMutableDictionaryRef))(**(_QWORD **)(a1 + 32) + 248))(*(_QWORD *)(a1 + 32), Mutable);
  if ((_DWORD)v7)
  {
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    v8 = 3015;
  }
  else
  {
    ACFUDiagnostics::addItem();
    v8 = (*(uint64_t (**)(_QWORD, char *))(**(_QWORD **)(a1 + 32) + 304))(*(_QWORD *)(a1 + 32), &v10);
    ACFULogging::getLogInstance((ACFULogging *)v8);
    if ((_DWORD)v8)
    {
      ACFULogging::handleMessage();
      v8 = 3000;
    }
    else
    {
      ACFULogging::handleMessage();
      if (a3)
      {
        RoseTransport::waitForFatalCrashCB((RoseTransport *)a1);
        *(_BYTE *)(a1 + 72) = 0;
        RoseTransport::collectCrashLogs(a1);
        RoseTransport::collectCoreDump((RoseTransport *)a1);
        RoseTransport::collectFirmwareLogs((RoseCapabilities **)a1);
        RoseTransport::collectIOReport((RoseTransport *)a1);
        v8 = 0;
      }
    }
  }
  CFRelease(v6);
  return v8;
}

uint64_t RoseTransport::waitForFatalCrashCB(RoseTransport *this)
{
  char v2;
  uint64_t result;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5[0] = off_24E47CF48;
  v6 = v5;
  v2 = ACFUSynchronize::Syncher::wait();
  result = (uint64_t)v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = (uint64_t)v5;
    goto LABEL_5;
  }
  if (v6)
  {
    v4 = 5;
LABEL_5:
    result = (*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v4))();
  }
  if ((v2 & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)result);
    result = ACFULogging::handleMessage();
    if (!*((_BYTE *)this + 72))
    {
      result = RoseTransport::triggerCrashLog(this);
      if ((result & 1) != 0)
        return RoseTransport::waitForFatalCrashCB(this);
    }
  }
  return result;
}

void sub_21FA1AF90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL RoseTransport::triggerCrashLog(RoseTransport *this)
{
  ACFULogging *v2;

  v2 = (ACFULogging *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 344))(*((_QWORD *)this + 4));
  ACFULogging::getLogInstance(v2);
  ACFULogging::handleMessage();
  if (!(_DWORD)v2)
    *((_BYTE *)this + 72) = 1;
  return (_DWORD)v2 == 0;
}

ACFULogging *RoseTransport::crashHandler(ACFULogging *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  ACFULogging *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (!*(_BYTE *)(a2 + 60))
      return result;
    ACFULogging::getLogInstance(result);
    ACFULogging::handleMessage();
    v4[0] = off_24E47CFC8;
    v5 = (ACFULogging *)v4;
    ACFUSynchronize::Syncher::notify();
    result = v5;
    if (v5 == (ACFULogging *)v4)
    {
      v3 = 4;
      result = (ACFULogging *)v4;
    }
    else
    {
      if (!v5)
        return result;
      v3 = 5;
    }
    return (ACFULogging *)(*(uint64_t (**)(ACFULogging *, uint64_t))(*(_QWORD *)result + 8 * v3))(result, v2);
  }
  else
  {
    ACFULogging::getLogInstance(result);
    return (ACFULogging *)ACFULogging::handleMessage();
  }
}

void sub_21FA1B170(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v16;
  uint64_t v17;

  v16 = a15;
  if (a15 == &a12)
  {
    v17 = 4;
    v16 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::reset(RoseCapabilities **this)
{
  uint64_t v2;
  ACFULogging *v3;

  v2 = RoseCapabilities::supportsRTKitIOConfig(this[13]);
  if ((_DWORD)v2)
  {
    v2 = RoseTransport::applyResetGlitchWorkaround((RoseTransport *)this);
    if ((v2 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      v2 = ACFULogging::handleMessage();
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)v2);
  ACFULogging::handleMessage();
  v3 = (ACFULogging *)(*(uint64_t (**)(RoseCapabilities *))(*(_QWORD *)this[4] + 112))(this[4]);
  ACFULogging::getLogInstance(v3);
  ACFULogging::handleMessage();
  if ((_DWORD)v3)
    return 3014;
  else
    return 0;
}

uint64_t RoseTransport::applyResetGlitchWorkaround(RoseTransport *this)
{
  RoseCommand *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  std::chrono::nanoseconds __ns;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v2 = (RoseCommand *)RoseCommand::create(0, 112, 0, 1);
  v7 = 0;
  v3 = RoseTransport::sendRoseCommand(this, v2, (uint64_t)&__ns, &v7, 0x100000096);
  v4 = v3;
  if ((v3 & 1) != 0)
  {
    __ns.__rep_ = 70000000;
    std::this_thread::sleep_for (&__ns);
  }
  ACFULogging::getLogInstance((ACFULogging *)v3);
  ACFULogging::handleMessage();
  RoseCommand::~RoseCommand(v2);
  operator delete(v5);
  return v4;
}

void sub_21FA1B3A0(_Unwind_Exception *exception_object)
{
  RoseCommand *v1;
  void *v3;

  if (v1)
  {
    RoseCommand::~RoseCommand(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

ACFULogging *RoseTransport::getRoseDebugInfoDict(RoseTransport *this, __CFDictionary *a2)
{
  ACFULogging *v2;
  ACFULogging *v3;

  if (a2)
  {
    v2 = (ACFULogging *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 248))(*((_QWORD *)this + 4));
    v3 = v2;
    if ((_DWORD)v2)
    {
      ACFULogging::getLogInstance(v2);
      ACFULogging::handleMessage();
    }
  }
  else
  {
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    return (ACFULogging *)3758097084;
  }
  return v3;
}

uint64_t RoseTransport::getCapabilities@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 112);
  *a2 = *(_QWORD *)(this + 104);
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

_QWORD *RoseTransport::eventHandler(RoseTransport *this, void *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *result;
  uint64_t v8;
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = operator new(0x20uLL);
  *v6 = off_24E47D058;
  v6[1] = this;
  v6[2] = a2;
  v6[3] = a3;
  v10 = v6;
  ACFUSynchronize::Syncher::notify();
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

void sub_21FA1B548(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
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
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::sendRoseCommand(ACFULogging *a1, RoseCommand *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE v5[112];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  return RoseTransport::sendRoseCommand(a1, a2, (uint64_t)v5, &v4, a3);
}

uint64_t RoseTransport::sendRoseCommand(ACFULogging *a1, RoseCommand *a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  ACFULogging *v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t);
  uint64_t PacketData;
  uint64_t PacketLength;
  ACFULogging *v20;
  uint64_t (*v21)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v22;
  uint64_t v23;
  ACFULogging *v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  __int128 v28;
  std::string v30;
  std::string v31;
  void *__p[2];
  std::string::size_type v33;

  if (!a4)
  {
    ACFULogging::getLogInstance(a1);
LABEL_21:
    ACFULogging::handleMessage();
    return 0;
  }
  *a4 = 0;
  ACFULogging::getLogInstance(a1);
  v10 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v10);
  std::string::basic_string[abi:ne180100]<0>(&v30, "RoseTransport");
  v11 = std::string::append(&v30, "::");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  v13 = std::string::append(&v31, "sendRoseCommand");
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v33 = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  RoseCommand::getPacketData(a2);
  RoseCommand::getPacketLength(a2);
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v33) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  v15 = (uint64_t *)*((_QWORD *)a1 + 4);
  v16 = *v15;
  if ((a5 & 0xFF00000000) != 0)
  {
    v17 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(v16 + 464);
    PacketData = RoseCommand::getPacketData(a2);
    PacketLength = RoseCommand::getPacketLength(a2);
    v20 = (ACFULogging *)v17(v15, PacketData, PacketLength, a3, 112, a4, a5);
    if ((_DWORD)v20)
      goto LABEL_20;
  }
  else
  {
    v21 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(v16 + 256);
    v22 = RoseCommand::getPacketData(a2);
    v23 = RoseCommand::getPacketLength(a2);
    v20 = (ACFULogging *)v21(v15, v22, v23, a3, 112, a4);
    if ((_DWORD)v20)
    {
LABEL_20:
      ACFULogging::getLogInstance(v20);
      goto LABEL_21;
    }
  }
  ACFULogging::getLogInstance(v20);
  v24 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v24);
  std::string::basic_string[abi:ne180100]<0>(&v30, "RoseTransport");
  v25 = std::string::append(&v30, "::");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = std::string::append(&v31, "sendRoseCommand");
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v33 = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageBinary();
  if (SHIBYTE(v33) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  return RoseCommand::validateResponse((uint64_t)a2, a3, *a4);
}

void sub_21FA1B8E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::copyCalDataToSend(uint64_t this, CFDataRef theData)
{
  if (!theData
    || (this = CFDataGetLength(theData), this < 1)
    || (this = (uint64_t)CFDataGetBytePtr(theData)) == 0
    || (this = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)this, *(unsigned __int16 *)this + 8, (CFAllocatorRef)*MEMORY[0x24BDBD258])) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)this);
    ACFULogging::handleMessage();
    return 0;
  }
  return this;
}

uint64_t RoseTransport::pingCheck(RoseTransport *this)
{
  ACFULogging *v2;
  unint64_t v3;
  RoseCommand *v4;
  RoseCommand *v5;
  const void *p_p;
  size_t v7;
  uint64_t Payload;
  int v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  void *__p;
  unint64_t v15;
  unsigned __int8 v16;
  std::chrono::nanoseconds __ns;
  _BYTE v18[112];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (ACFULogging *)std::string::basic_string[abi:ne180100]<0>(&__p, "RoseTransport-v1");
  v13 = 0;
  v3 = v16;
  if ((v16 & 0x80u) != 0)
    v3 = v15;
  if (v3 >= 0x21)
  {
    ACFULogging::getLogInstance(v2);
    ACFULogging::handleMessage();
    v10 = 3012;
  }
  else
  {
    v4 = (RoseCommand *)RoseCommand::create(0, 0, 0x20uLL, 0);
    v5 = v4;
    if (v4)
    {
      if ((v16 & 0x80u) == 0)
        p_p = &__p;
      else
        p_p = __p;
      if ((v16 & 0x80u) == 0)
        v7 = v16;
      else
        v7 = v15;
      Payload = RoseCommand::getPayload(v4);
      if (v7)
        Payload = (uint64_t)memmove((void *)Payload, p_p, v7);
      v9 = 1;
      while (1)
      {
        ACFULogging::getLogInstance((ACFULogging *)Payload);
        ACFULogging::handleMessage();
        if ((RoseTransport::sendRoseCommand(this, v5, (uint64_t)v18, (uint64_t *)&v13, 0) & 1) != 0)
          break;
        __ns.__rep_ = 500000000;
        std::this_thread::sleep_for (&__ns);
        if (++v9 == 6)
          goto LABEL_16;
      }
      Payload = RoseTransport::parsePingResponse((uint64_t)this, (uint64_t)v18, v13);
      if ((Payload & 1) == 0)
      {
LABEL_16:
        ACFULogging::getLogInstance((ACFULogging *)Payload);
        ACFULogging::handleMessage();
        v10 = 3003;
        goto LABEL_19;
      }
      ACFULogging::getLogInstance((ACFULogging *)Payload);
      ACFULogging::handleMessage();
      v10 = 0;
LABEL_19:
      RoseCommand::~RoseCommand(v5);
      operator delete(v11);
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      v10 = 1007;
    }
  }
  if ((char)v16 < 0)
    operator delete(__p);
  return v10;
}

void sub_21FA1BC5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  _Unwind_Resume(exception_object);
}

uint64_t RoseTransport::parsePingResponse(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;

  v5 = RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104));
  if ((_DWORD)v5 == 1)
  {
    if (a3 <= 0x6F)
      goto LABEL_10;
    v5 = RoseCommand::parsePingInfo(a2 + 4);
    if ((v5 & 1) == 0)
      goto LABEL_10;
    return 1;
  }
  if (!(_DWORD)v5 && a3 > 0x43 && *(unsigned __int8 *)(a2 + 40) + 41 == a3)
  {
    v5 = RoseCommand::parsePingInfo(a2 + 4);
    if ((v5 & 1) != 0)
      return 1;
  }
LABEL_10:
  ACFULogging::getLogInstance((ACFULogging *)v5);
  ACFULogging::handleMessage();
  return 0;
}

uint64_t RoseTransport::sendCalibration(ACFULogging *a1, const __CFData *a2, unsigned int a3, uint64_t a4)
{
  ACFULogging *v7;
  unsigned __int8 v8;
  _BOOL8 v9;
  const UInt8 *BytePtr;
  ACFULogging *Length;
  unsigned __int16 v12;
  unsigned int v13;
  uint64_t v14;
  RoseCommand *v15;
  uint64_t Payload;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  RoseCommand *v22;
  void *v23;
  int v24;
  size_t v25;
  _BOOL8 v26;
  _BYTE *v27;
  ACFULogging *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const __CFData *cf;
  uint64_t v41;
  _QWORD v42[3];
  ACFULogging *v43;
  _BYTE v44[112];
  uint64_t v45;

  v7 = a1;
  v45 = *MEMORY[0x24BDAC8D0];
  if ((v8 & 1) == 0)
  {
    if ((_DWORD)a1)
    {
      RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier = 0uLL;
      unk_25553BFD0 = 0;
      __cxa_atexit(MEMORY[0x24BEDACF0], &RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier, &dword_21FA0E000);
    }
  }
  if (!a2)
  {
    ACFULogging::getLogInstance(a1);
    goto LABEL_54;
  }
  cf = a2;
  v9 = RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*((RoseCapabilities **)v7 + 13));
  if (v9)
  {
    cf = (const __CFData *)RoseTransport::copyCalDataToSend(v9, a2);
    if (!cf)
    {
      ACFULogging::getLogInstance(0);
LABEL_54:
      ACFULogging::handleMessage();
      return 1006;
    }
  }
  else
  {
    CFRetain(a2);
  }
  BytePtr = CFDataGetBytePtr(cf);
  if (!BytePtr)
  {
    ACFULogging::getLogInstance(0);
LABEL_57:
    v15 = 0;
    ACFULogging::handleMessage();
    v37 = 1006;
    goto LABEL_48;
  }
  Length = (ACFULogging *)CFDataGetLength(cf);
  if (!(_WORD)Length)
  {
    ACFULogging::getLogInstance(Length);
    goto LABEL_57;
  }
  v12 = (unsigned __int16)Length;
  if ((unsigned __int16)Length % 0x29u)
    v13 = (unsigned __int16)Length / 0x29u + 1;
  else
    v13 = (unsigned __int16)Length / 0x29u;
  if (a3)
  {
    if (RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::only_once != -1)
      dispatch_once(&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::only_once, &__block_literal_global_0);
    v14 = *((_QWORD *)&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier + 1);
    if (byte_25553BFD7 >= 0)
      v14 = byte_25553BFD7;
    if (!v14)
    {
      ACFULogging::getLogInstance(Length);
      v15 = 0;
      ACFULogging::handleMessage();
      v37 = 1;
      goto LABEL_48;
    }
    v15 = (RoseCommand *)RoseCommand::create(2, 55, 0x2CuLL, 1);
    Payload = RoseCommand::getPayload(v15);
    v17 = Payload;
    *(_OWORD *)(Payload + 28) = 0u;
    *(_OWORD *)Payload = 0u;
    *(_OWORD *)(Payload + 16) = 0u;
    if (*(char *)(a4 + 23) >= 0)
      v18 = (const char *)a4;
    else
      v18 = *(const char **)a4;
    strlcpy((char *)Payload, v18, 8uLL);
    if (byte_25553BFD7 >= 0)
      v19 = (const char *)&RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier;
    else
      v19 = (const char *)RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier;
    strlcpy((char *)(v17 + 8), v19, 0x20uLL);
    v41 = 0;
    v20 = RoseTransport::sendRoseCommand(v7, v15, (uint64_t)v44, &v41, 0);
    if ((v20 & 1) == 0)
    {
LABEL_59:
      ACFULogging::getLogInstance((ACFULogging *)v20);
      ACFULogging::handleMessage();
      v37 = 3004;
      goto LABEL_48;
    }
    v21 = 56;
  }
  else
  {
    v15 = 0;
    v21 = 32;
  }
  v20 = (uint64_t)RoseCommand::create(2, v21, 0x2CuLL, 1);
  v22 = (RoseCommand *)v20;
  if (v15)
  {
    RoseCommand::~RoseCommand(v15);
    operator delete(v23);
  }
  v15 = v22;
  if (v13)
  {
    v24 = 0;
    while (1)
    {
      v25 = v12 >= 0x29u ? 41 : v12;
      v26 = RoseCommand::setPayloadLength(v22, (v25 + 3));
      if (!v26)
        break;
      v27 = (_BYTE *)RoseCommand::getPayload(v22);
      *(_WORD *)v27 = v12;
      v27[2] = v25;
      if ((_DWORD)v25)
        v27 = memmove(v27 + 3, BytePtr, v25);
      ACFULogging::getLogInstance((ACFULogging *)v27);
      ACFULogging::handleMessage();
      v41 = 0;
      v20 = RoseTransport::sendRoseCommand(v7, v22, (uint64_t)v44, &v41, 0);
      if ((v20 & 1) == 0)
        goto LABEL_59;
      BytePtr += v25;
      v12 -= v25;
      if (v13 == ++v24)
        goto LABEL_39;
    }
    ACFULogging::getLogInstance((ACFULogging *)v26);
    ACFULogging::handleMessage();
    v37 = 1006;
    goto LABEL_48;
  }
LABEL_39:
  ACFULogging::getLogInstance((ACFULogging *)v20);
  v28 = (ACFULogging *)ACFULogging::handleMessage();
  if (!*((_BYTE *)v7 + 96))
    goto LABEL_46;
  v42[0] = off_24E47D0D8;
  v42[1] = v7;
  v42[2] = a3;
  v43 = (ACFULogging *)v42;
  v35 = ACFUSynchronize::Syncher::wait();
  v28 = v43;
  if (v43 == (ACFULogging *)v42)
  {
    v36 = 4;
    v28 = (ACFULogging *)v42;
    goto LABEL_44;
  }
  if (v43)
  {
    v36 = 5;
LABEL_44:
    v28 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v28 + 8 * v36))(v28, v29, v30, v31, v32, v33, v34);
  }
  if ((v35 & 1) != 0)
  {
LABEL_46:
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    v37 = 0;
    goto LABEL_48;
  }
  ACFULogging::getLogInstance(v28);
  ACFULogging::handleMessage();
  v37 = 3005;
LABEL_48:
  CFRelease(cf);
  if (v15)
  {
    RoseCommand::~RoseCommand(v15);
    operator delete(v38);
  }
  return v37;
}

void sub_21FA1C41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  RoseCommand *v22;
  void *v24;

  if (v22)
  {
    RoseCommand::~RoseCommand(v22);
    operator delete(v24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN13RoseTransport15sendCalibrationEPK8__CFDatabRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEE_block_invoke()
{
  ACFULogging *TypeID;
  const __CFNumber *v1;
  CFTypeID v2;
  ACFULogging *Value;
  ACFULogging *v4;
  const __CFNumber *v5;
  CFTypeID v6;
  ACFULogging *v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t valuePtr;
  _QWORD v21[2];
  _QWORD v22[11];
  char v23;
  uint64_t v24;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v21);
  v19 = 0;
  valuePtr = 0;
  TypeID = (ACFULogging *)MGCopyAnswer();
  v1 = TypeID;
  if (!TypeID || (v2 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v2 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    ACFULogging::handleMessage();
    if (!v1)
      goto LABEL_12;
    goto LABEL_19;
  }
  Value = (ACFULogging *)CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
  if (!(_DWORD)Value)
  {
    ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage();
LABEL_19:
    v5 = 0;
    goto LABEL_10;
  }
  v4 = (ACFULogging *)MGCopyAnswer();
  v5 = v4;
  if (v4 && (v6 = CFGetTypeID(v4), v4 = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v6 == v4))
  {
    v7 = (ACFULogging *)CFNumberGetValue(v5, kCFNumberSInt64Type, &v19);
    if ((_DWORD)v7)
    {
      *(_DWORD *)((char *)&v22[1] + *(_QWORD *)(v22[0] - 24)) |= 0x4000u;
      LOBYTE(v16) = 48;
      v8 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v22, (char *)&v16);
      v9 = *v8;
      *(uint64_t *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 24) = 8;
      *(_DWORD *)((char *)v8 + *(_QWORD *)(v9 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(v9 - 24) + 8) & 0xFFFFFFB5 | 8;
      v10 = (_QWORD *)std::ostream::operator<<();
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"-", 1);
      v18 = 48;
      v12 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v11, &v18);
      v13 = *v12;
      *(uint64_t *)((char *)v12 + *(_QWORD *)(*v12 - 24) + 24) = 16;
      *(_DWORD *)((char *)v12 + *(_QWORD *)(v13 - 24) + 8) = *(_DWORD *)((_BYTE *)v12 + *(_QWORD *)(v13 - 24) + 8) & 0xFFFFFFB5 | 8;
      std::ostream::operator<<();
      std::stringbuf::str();
      if (byte_25553BFD7 < 0)
        operator delete((void *)RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier);
      RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::hostIdentifier = v16;
      unk_25553BFD0 = v17;
      goto LABEL_10;
    }
    ACFULogging::getLogInstance(v7);
  }
  else
  {
    ACFULogging::getLogInstance(v4);
  }
  ACFULogging::handleMessage();
LABEL_10:
  CFRelease(v1);
  if (v5)
    CFRelease(v5);
LABEL_12:
  v21[0] = *MEMORY[0x24BEDB7F0];
  v14 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v21 + *(_QWORD *)(v21[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v22[0] = v14;
  v22[1] = MEMORY[0x24BEDB848] + 16;
  if (v23 < 0)
    operator delete((void *)v22[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2207CEDF4](&v24);
}

void sub_21FA1C74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
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

void sub_21FA1C878(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2207CEDF4](v1);
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

void sub_21FA1C92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
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
  MEMORY[0x2207CEDF4](a1 + 128);
  return a1;
}

void RoseTransport::runCertification(uint64_t a1@<X0>, int a2@<W1>, ACFUFirmware **a3@<X2>, uint64_t a4@<X8>)
{
  const __CFData *Manifest;
  const __CFData *v8;
  const __CFData *v9;
  ACFULogging *v10;
  const __CFData *v11;
  const __CFData *v12;
  ACFULogging *v13;
  ACFULogging *v14;
  const UInt8 *BytePtr;
  CFIndex Length;
  ACFULogging *v17;
  ACFULogging *v18;
  ACFULogging *v19;
  uint64_t *v20;
  uint64_t v21;
  const UInt8 *v22;
  CFIndex v23;
  const UInt8 *v24;
  CFIndex v25;
  const UInt8 *v26;
  CFIndex v27;
  const UInt8 *v28;
  CFIndex v29;
  ACFULogging *v30;
  uint64_t (*v31)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex);
  const UInt8 *v32;
  CFIndex v33;
  const __CFData *v34;
  const UInt8 *v35;
  CFIndex v36;
  const UInt8 *v37;
  CFIndex v38;
  ACFULogging *v39;
  uint64_t v40;
  const __CFAllocator *v41;
  ACFULogging *v42;
  CFDataRef v43;
  int v44;
  const char *v45;
  ACFULogging *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *);
  const __CFData *v49;
  const __CFData *v50;
  const __CFData *v51;
  int v52;
  CFIndex v53;
  const UInt8 *v54;

  v53 = 0;
  v54 = 0;
  v52 = -559038737;
  if (a2)
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage();
    v43 = 0;
    v44 = 1010;
    goto LABEL_36;
  }
  if (!RoseCapabilities::requiresSeparateFirmwareTargetForCertification(*(RoseCapabilities **)(a1 + 104)))
  {
    v8 = 0;
    v9 = 0;
    v12 = 0;
    v11 = 0;
    goto LABEL_25;
  }
  Manifest = (const __CFData *)ACFUFirmware::getManifest(*a3);
  v8 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, CFSTR("Rap,RestoreRTKitOS"));
  v9 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, CFSTR("Rap,SoftwareBinaryDsp1"));
  v10 = (ACFULogging *)(*(uint64_t (**)(ACFUFirmware *))(*(_QWORD *)*a3 + 32))(*a3);
  v11 = v10;
  if (!v8 || !v9)
  {
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    v43 = 0;
    v12 = 0;
    v44 = 1000;
    goto LABEL_28;
  }
  if (!Manifest)
  {
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    v12 = 0;
    v43 = 0;
    v44 = 1001;
    goto LABEL_29;
  }
  if (!v10)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v12 = 0;
    v43 = 0;
    v44 = 1002;
    goto LABEL_29;
  }
  if (RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(a1 + 104)))
  {
    v12 = (const __CFData *)ACFUFirmware::copyFWDataByTag(*a3, CFSTR("Rap,RTKitIOConfig"));
    if (!v12)
    {
      ACFULogging::getLogInstance(0);
      v45 = "runCertification";
      ACFULogging::handleMessage();
    }
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  if (*(_BYTE *)(a1 + 96))
  {
    v13 = (ACFULogging *)RoseTransport::flushDebugInfo((RoseTransport *)a1);
    if ((_DWORD)v13)
    {
      v14 = v13;
      ACFULogging::getLogInstance(v13);
      v45 = "runCertification";
      v46 = v14;
      ACFULogging::handleMessage();
    }
  }
  BytePtr = CFDataGetBytePtr(v11);
  Length = CFDataGetLength(v11);
  v17 = (ACFULogging *)(*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(_QWORD *)a1 + 8))(a1, BytePtr, Length);
  if ((_DWORD)v17)
  {
    v44 = (int)v17;
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    v43 = 0;
    goto LABEL_29;
  }
  v18 = (ACFULogging *)(*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 32) + 184))(*(_QWORD *)(a1 + 32), 1);
  if ((_DWORD)v18)
  {
    ACFULogging::getLogInstance(v18);
LABEL_46:
    ACFULogging::handleMessage();
    v43 = 0;
    v44 = 3010;
    goto LABEL_29;
  }
  v19 = (ACFULogging *)(*(uint64_t (**)(_QWORD, int *))(**(_QWORD **)(a1 + 32) + 192))(*(_QWORD *)(a1 + 32), &v52);
  if ((_DWORD)v19 || v52 != 1)
  {
    ACFULogging::getLogInstance(v19);
    goto LABEL_46;
  }
  v49 = v11;
  v50 = v8;
  v20 = *(uint64_t **)(a1 + 32);
  v21 = *v20;
  v51 = v9;
  if (!v12)
  {
    v31 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex))(v21 + 96);
    v32 = CFDataGetBytePtr(Manifest);
    v33 = CFDataGetLength(Manifest);
    v34 = v9;
    v35 = CFDataGetBytePtr(v8);
    v36 = CFDataGetLength(v8);
    v37 = CFDataGetBytePtr(v34);
    v38 = CFDataGetLength(v34);
    v39 = (ACFULogging *)v31(v20, v32, v33, v35, v36, v37, v38);
    if (!(_DWORD)v39)
    {
      v12 = 0;
      goto LABEL_24;
    }
    ACFULogging::getLogInstance(v39);
    ACFULogging::handleMessage();
    v12 = 0;
    v43 = 0;
    v44 = 3001;
LABEL_49:
    v8 = v50;
    v9 = v51;
    v11 = v49;
    goto LABEL_29;
  }
  v47 = a4;
  v48 = *(uint64_t (**)(uint64_t *, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const UInt8 *, CFIndex, const char *, ACFULogging *))(v21 + 448);
  v22 = CFDataGetBytePtr(Manifest);
  v23 = CFDataGetLength(Manifest);
  v24 = CFDataGetBytePtr(v8);
  v25 = CFDataGetLength(v8);
  v26 = CFDataGetBytePtr(v9);
  v27 = CFDataGetLength(v9);
  v28 = CFDataGetBytePtr(v12);
  v29 = CFDataGetLength(v12);
  v30 = (ACFULogging *)v48(v20, v22, v23, v24, v25, v26, v27, v28, v29, v45, v46);
  if ((_DWORD)v30)
  {
    ACFULogging::getLogInstance(v30);
    ACFULogging::handleMessage();
    v43 = 0;
    v44 = 3001;
    a4 = v47;
    goto LABEL_49;
  }
  a4 = v47;
LABEL_24:
  v8 = v50;
  v9 = v51;
  v11 = v49;
LABEL_25:
  v40 = *(_QWORD *)(a1 + 32);
  v41 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v42 = (ACFULogging *)(*(uint64_t (**)(uint64_t, _QWORD, const UInt8 **, CFIndex *))(*(_QWORD *)v40 + 312))(v40, *MEMORY[0x24BDBD240], &v54, &v53);
  if ((_DWORD)v42)
  {
    ACFULogging::getLogInstance(v42);
    ACFULogging::handleMessage();
    v43 = 0;
    v44 = 3013;
  }
  else
  {
    v43 = CFDataCreateWithBytesNoCopy(v41, v54, v53, v41);
    if (v43)
    {
      v44 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      v44 = 4000;
    }
  }
LABEL_28:
  if (v8)
LABEL_29:
    CFRelease(v8);
  if (v9)
    CFRelease(v9);
  if (v12)
    CFRelease(v12);
  if (v11)
    CFRelease(v11);
LABEL_36:
  *(_QWORD *)a4 = v43;
  *(_DWORD *)(a4 + 8) = v44;
}

void RoseTransport::~RoseTransport(RoseTransport *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_24E47CD40;
  RoseTransport::destroyRoseController(this);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)this + 104);
  v2 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 7, 0);
  std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100]((uint64_t *)this + 6, 0);

  ACFUTransport::~ACFUTransport(this);
}

{
  void *v1;

  RoseTransport::~RoseTransport(this);
  operator delete(v1);
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

void std::unique_ptr<ACFUSynchronize::Syncher>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
}

_QWORD *std::allocate_shared[abi:ne180100]<ACFUCommon::PersonalizeParams,std::allocator<ACFUCommon::PersonalizeParams>,std::vector<__CFString const*> &,void>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0xE8uLL);
  result = std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__shared_ptr_emplace[abi:ne180100]<std::vector<__CFString const*> &,std::allocator<ACFUCommon::PersonalizeParams>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_21FA1D1C4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__shared_ptr_emplace[abi:ne180100]<std::vector<__CFString const*> &,std::allocator<ACFUCommon::PersonalizeParams>,0>(_QWORD *a1, uint64_t a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E47CE68;
  std::allocator<ACFUCommon::PersonalizeParams>::construct[abi:ne180100]<ACFUCommon::PersonalizeParams,std::vector<__CFString const*> &>((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_21FA1D220(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E47CE68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E47CE68;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

void std::allocator<ACFUCommon::PersonalizeParams>::construct[abi:ne180100]<ACFUCommon::PersonalizeParams,std::vector<__CFString const*> &>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *__p;
  void *v5;
  uint64_t v6;

  __p = 0;
  v5 = 0;
  v6 = 0;
  std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(&__p, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3);
  MEMORY[0x2207CEA34](a2, &__p);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
}

void sub_21FA1D2D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<__CFString const*>::__init_with_size[abi:ne180100]<__CFString const**,__CFString const**>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<__CFString const*>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21FA1D348(_Unwind_Exception *exception_object)
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

_QWORD *std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = off_24E47CEB8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = off_24E47CEB8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (***v3)(_QWORD);
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(v1 + 64);
  if (!v2)
    return 0;
  if (v3)
  {
    v4 = (**v3)(v3);
    v2 = *(_QWORD *)(v1 + 64);
    *(_QWORD *)(v1 + 64) = 0;
    if (!v2)
      return v4;
  }
  else
  {
    v4 = 0;
    *(_QWORD *)(v1 + 64) = 0;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  return v4;
}

uint64_t std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<RoseTransport::pushFirmware(std::shared_ptr<ACFUFirmware>)::$_0>,BOOL ()(void)>::target_type()
{
}

_QWORD *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = off_24E47CF48;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = off_24E47CF48;
}

uint64_t _ZNSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_EclEv()
{
  return 1;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_;
}

_QWORD *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = off_24E47CFC8;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = off_24E47CFC8;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_;
}

__n128 std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = off_24E47D058;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = off_24E47D058;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::operator()(_QWORD *a1)
{
  ACFULogging *v1;
  uint64_t v2;
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = a1[1];
  v1 = (ACFULogging *)a1[2];
  v3 = a1[3];
  v4 = RoseCapabilities::supportsRTKitIOConfig(*(RoseCapabilities **)(v2 + 104));
  RoseEvent::create(v1, v3, v4, &v7);
  v5 = v7;
  v7 = 0;
  result = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = v5;
  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 16))(result);
    result = v7;
    v7 = 0;
    if (result)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  }
  return result;
}

uint64_t std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::eventHandler(void *,unsigned long)::$_0,std::allocator<RoseTransport::eventHandler(void *,unsigned long)::$_0>,void ()(void)>::target_type()
{
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

  MEMORY[0x2207CED34](v13, a1);
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
  MEMORY[0x2207CED40](v13);
  return a1;
}

void sub_21FA1D7FC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2207CED40](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21FA1D7DCLL);
}

void sub_21FA1D844(_Unwind_Exception *a1)
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

void sub_21FA1D978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

__n128 std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = off_24E47D0D8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = off_24E47D0D8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t (***v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  CFDataRef *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(v2 + 64);
  if (!v3)
    return 0;
  if (*(_BYTE *)(a1 + 16))
  {
    if (v4)
    {
      v5 = (**v4)(v4);
LABEL_8:
      v6 = v5;
      goto LABEL_10;
    }
  }
  else
  {
    if (v7)
    {
      v5 = RoseCommandCompleteEvent::validate(v7, 32);
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_10:
  v8 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  return v6;
}

uint64_t std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0,std::allocator<RoseTransport::sendCalibration(__CFData const*,BOOL,std::string const&)::$_0>,BOOL ()(void)>::target_type()
{
}

ACFURestore *RoseRestore::create(RoseRestore *this, const __CFDictionary *a2)
{
  ACFURestore *v3;
  ACFULogging *v4;

  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v3 = (ACFURestore *)operator new(0x160uLL);
  ACFURestore::ACFURestore(v3);
  *(_QWORD *)v3 = off_24E47D158;
  *((_WORD *)v3 + 168) = 0;
  *((_QWORD *)v3 + 43) = 0;
  v4 = (ACFULogging *)RoseRestore::init(v3, this, CFSTR("Rap,Ticket"));
  if ((_DWORD)v4)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    (*(void (**)(ACFURestore *))(*(_QWORD *)v3 + 8))(v3);
    return 0;
  }
  return v3;
}

void sub_21FA1DC68(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void RoseRestore::RoseRestore(RoseRestore *this)
{
  uint64_t v1;

  ACFURestore::ACFURestore(this);
  *(_QWORD *)v1 = off_24E47D158;
  *(_WORD *)(v1 + 336) = 0;
  *(_QWORD *)(v1 + 344) = 0;
}

void RoseRestore::queryCmd(RoseRestore *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  ACFULogging *Cmd;
  const __CFDictionary *v6;
  char v7;
  CFTypeID Value;
  const void *v9;
  CFTypeID TypeID;
  const UInt8 *BytePtr;
  unint64_t Length;
  size_t v13;
  const void **v14;
  CFDictionaryRef __s2;
  char v16;
  void *__p;
  char v18;

  if (ACFURestore::isNeRDOS(this))
  {
    v4 = (*(uint64_t (**)(RoseRestore *))(*(_QWORD *)this + 16))(this);
    if (v4)
    {
      *(_QWORD *)a2 = v4;
      *(_BYTE *)(a2 + 8) = 1;
      return;
    }
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Failed to collect preflight info");
    ACFUError::addError();
    if (v18 < 0)
      operator delete(__p);
    v7 = 0;
    v6 = 0;
  }
  else
  {
    Cmd = (ACFULogging *)ACFURestore::queryCmd(this);
    v6 = __s2;
    v7 = v16;
    if (v16)
    {
      if ((ACFURestore::isPreflight(this) & 1) == 0 && CFDictionaryContainsKey(__s2, CFSTR("Rap,BoardID")))
      {
        LOWORD(__s2) = 0;
        Value = (CFTypeID)CFDictionaryGetValue(v6, CFSTR("Rap,BoardID"));
        v9 = (const void *)Value;
        if (Value)
        {
          TypeID = CFDataGetTypeID();
          Value = CFGetTypeID(v9);
          if (TypeID == Value)
          {
            BytePtr = CFDataGetBytePtr((CFDataRef)v9);
            Length = CFDataGetLength((CFDataRef)v9);
            if (Length >= 2)
              v13 = 2;
            else
              v13 = Length;
            Value = memcmp(BytePtr, &__s2, v13);
            LODWORD(v9) = Value == 0;
          }
          else
          {
            LODWORD(v9) = 0;
          }
        }
        ACFULogging::getLogInstance((ACFULogging *)Value);
        ACFULogging::handleMessage();
        v14 = (const void **)MEMORY[0x24BDBD270];
        if (!(_DWORD)v9)
          v14 = (const void **)MEMORY[0x24BDBD268];
        CFDictionaryAddValue(v6, CFSTR("LocalSigningID"), *v14);
      }
    }
    else
    {
      ACFULogging::getLogInstance(Cmd);
      ACFULogging::handleMessage();
    }
  }
  *(_QWORD *)a2 = v6;
  *(_BYTE *)(a2 + 8) = v7;
}

void sub_21FA1DEC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t RoseRestore::performCmd(CFDictionaryRef *this)
{
  uint64_t result;
  ACFULogging *CurrentUpdateStep;
  ACFULogging *isPostSealing;
  const void *Value;
  const void *v6;
  CFTypeID v7;
  ACFULogging *TypeID;
  CFDictionaryRef v9;
  unint64_t *v10;
  unint64_t v11;
  CFDictionaryRef v12;
  void *v13;
  std::string::size_type v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  const __CFDictionary *v26;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v28;
  const void *v29;
  const void *v30;
  ACFULogging *v31;
  std::string *v32;
  __int128 v33;
  std::string *v34;
  __int128 v35;
  ACFULogging *v36;
  void *v37;
  void *v38;
  char v39;
  std::string v40;
  std::string v41;
  void *__p;
  char v43;
  void *v44;
  char v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  CFDictionaryRef v48;
  std::__shared_weak_count *v49;
  __int128 v50;
  std::string::size_type v51;

  result = ACFURestore::performCmd((ACFURestore *)this);
  if ((_DWORD)result)
  {
    CurrentUpdateStep = (ACFULogging *)ACFURestore::getCurrentUpdateStep((ACFURestore *)this);
    if ((_DWORD)CurrentUpdateStep)
    {
      ACFULogging::getLogInstance(CurrentUpdateStep);
      ACFURestore::getCurrentUpdateStep((ACFURestore *)this);
      ACFULogging::handleMessage();
      return 1;
    }
    isPostSealing = (ACFULogging *)ACFURestore::isPostSealing((ACFURestore *)this);
    if ((_DWORD)isPostSealing)
    {
      Value = CFDictionaryGetValue(this[16], CFSTR("APTicket"));
      if (!Value)
      {
        ACFULogging::getLogInstance(0);
        goto LABEL_62;
      }
      v6 = Value;
      v7 = CFGetTypeID(Value);
      TypeID = (ACFULogging *)CFDataGetTypeID();
      if ((ACFULogging *)v7 != TypeID)
      {
        ACFULogging::getLogInstance(TypeID);
        goto LABEL_62;
      }
      LOWORD(v50) = 0;
      *((_QWORD *)&v50 + 1) = v6;
      LOBYTE(v51) = *((_BYTE *)this + 337);
      v9 = this[7];
      v48 = this[6];
      v49 = (std::__shared_weak_count *)v9;
      if (v9)
      {
        v10 = (unint64_t *)((char *)v9 + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      v12 = this[21];
      if (v12
      {
        v14 = (std::string::size_type)this[22];
        v41.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
        v41.__r_.__value_.__l.__size_ = v14;
        if (v14)
        {
          v15 = (unint64_t *)(v14 + 8);
          do
            v16 = __ldxr(v15);
          while (__stxr(v16 + 1, v15));
        }
      }
      else
      {
        v13 = 0;
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = 0uLL;
      }
      RoseTransport::getCapabilities((uint64_t)v13, &v46);
      isPostSealing = (ACFULogging *)RoseCalibration::sendCalibration((uint64_t *)&v48, (uint64_t)&v46, &v50);
      v17 = (int)isPostSealing;
      v18 = v47;
      if (v47)
      {
        p_shared_owners = (unint64_t *)&v47->__shared_owners_;
        do
          v20 = __ldaxr(p_shared_owners);
        while (__stlxr(v20 - 1, p_shared_owners));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      if (v41.__r_.__value_.__l.__size_)
      {
        v21 = (unint64_t *)(v41.__r_.__value_.__l.__size_ + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          (*(void (**)(std::string::size_type))(*(_QWORD *)v41.__r_.__value_.__l.__size_ + 16))(v41.__r_.__value_.__l.__size_);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v41.__r_.__value_.__l.__size_);
        }
      }
      v23 = v49;
      if (v49)
      {
        v24 = (unint64_t *)&v49->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      if (v17)
      {
        ACFULogging::getLogInstance(isPostSealing);
        goto LABEL_62;
      }
    }
    if (!*((_BYTE *)this + 336))
      return 1;
    this[25] = this[41];
    v26 = this[18];
    this[26] = v26;
    if (this[27] && this[28])
    {
      if (v26)
      {
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, this[15]);
        if (MutableCopy)
        {
          v28 = MutableCopy;
          v29 = (const void *)ACFUFirmware::copyFWContainer(this[19]);
          if (v29)
          {
            v30 = v29;
            CFDictionarySetValue(v28, CFSTR("FirmwareData"), v29);
            CFRelease(v30);
            ACFULogging::getLogInstance(v31);
            std::string::basic_string[abi:ne180100]<0>(&v40, "RoseRestore");
            v32 = std::string::append(&v40, "::");
            v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
            v41.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v33;
            v32->__r_.__value_.__l.__size_ = 0;
            v32->__r_.__value_.__r.__words[2] = 0;
            v32->__r_.__value_.__r.__words[0] = 0;
            v34 = std::string::append(&v41, "performCmd");
            v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
            v51 = v34->__r_.__value_.__r.__words[2];
            v50 = v35;
            v34->__r_.__value_.__l.__size_ = 0;
            v34->__r_.__value_.__r.__words[2] = 0;
            v34->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType();
            if (SHIBYTE(v51) < 0)
              operator delete((void *)v50);
            if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v41.__r_.__value_.__l.__data_);
            if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v40.__r_.__value_.__l.__data_);
            v36 = (ACFULogging *)(*(uint64_t (**)(CFDictionaryRef, char *, CFDictionaryRef, __CFDictionary *, _QWORD))(*(_QWORD *)this[6] + 32))(this[6], (char *)this + 200, this[17], v28, 0);
            if (!(_DWORD)v36)
            {
              CFRelease(v28);
              return 1;
            }
            ACFULogging::getLogInstance(v36);
            ACFULogging::handleMessage();
            std::string::basic_string[abi:ne180100]<0>(&v38, "Failed to perform certification step");
            ACFUError::addError();
            if (v39 < 0)
              operator delete(v38);
          }
          else
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
          }
          CFRelease(v28);
          return 0;
        }
        ACFULogging::getLogInstance(0);
LABEL_62:
        ACFULogging::handleMessage();
        return 0;
      }
      ACFULogging::getLogInstance(isPostSealing);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "No certification URL found for certification step");
      ACFUError::addError();
      if ((v43 & 0x80000000) == 0)
        return 0;
      v37 = __p;
    }
    else
    {
      ACFULogging::getLogInstance(isPostSealing);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&v44, "Incomplete parameter set for certification");
      ACFUError::addError();
      if ((v45 & 0x80000000) == 0)
        return 0;
      v37 = v44;
    }
    operator delete(v37);
    return 0;
  }
  return result;
}

void sub_21FA1E460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void RoseRestore::~RoseRestore(RoseRestore *this)
{
  void *v1;

  ACFURestore::~ACFURestore(this);
  operator delete(v1);
}

ACFULogging *RoseRestore::gatherPreflightParameters(__CFString **this)
{
  ACFULogging *isNeRDOS;
  char v3;
  const __CFString *v4;
  ACFULogging *v5;
  ACFULogging *v6;
  void *v7;
  void *v8;
  ACFULogging *v9;
  int v10;
  uint64_t v11;
  std::chrono::nanoseconds __ns;

  isNeRDOS = (ACFULogging *)ACFURestore::isNeRDOS((ACFURestore *)this);
  v3 = (char)isNeRDOS;
  ACFULogging::getLogInstance(isNeRDOS);
  if ((v3 & 1) != 0)
  {
    ACFULogging::handleMessage();
    v5 = (ACFULogging *)RoseBootstrappedPreflight::bootstrappedPreflight(0, 0, this[43], v4);
    v6 = v5;
    v7 = 0;
    if (!v5)
    {
LABEL_9:
      ACFULogging::getLogInstance(v5);
      ACFULogging::handleMessage();
      v6 = 0;
      if (!v7)
        return v6;
      goto LABEL_13;
    }
  }
  else
  {
    ACFULogging::handleMessage();
    v8 = dlopen("/System/Library/PrivateFrameworks/Proximity.framework/Proximity", 1);
    if (!v8)
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      return 0;
    }
    v7 = v8;
    v9 = (ACFULogging *)dlsym(v8, "PRGetPreflightInfo");
    ACFULogging::getLogInstance(v9);
    if (!v9)
    {
      ACFULogging::handleMessage();
      v6 = 0;
      goto LABEL_13;
    }
    v5 = (ACFULogging *)ACFULogging::handleMessage();
    v10 = 1;
    while (1)
    {
      ACFULogging::getLogInstance(v5);
      v11 = ACFULogging::handleMessage();
      v5 = (ACFULogging *)((uint64_t (*)(uint64_t))v9)(v11);
      if (v5)
        break;
      ++v10;
      __ns.__rep_ = 1000000000;
      std::this_thread::sleep_for (&__ns);
      if (v10 == 3)
        goto LABEL_9;
    }
    v6 = v5;
  }
  ACFULogging::getLogInstance(v5);
  ACFULogging::handleMessage();
  if (v7)
LABEL_13:
    dlclose(v7);
  return v6;
}

uint64_t RoseRestore::init(RoseRestore *this, const __CFDictionary *a2, const void *a3)
{
  ACFULogging *v4;
  ACFULogging *Value;
  ACFULogging *v6;
  CFTypeID v7;
  uint64_t isPreflight;
  const __CFString *v9;
  const void *v10;
  const __CFString *v11;
  std::__shared_weak_count *v12;
  char v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t URLByAppendingStrings;
  char *v22;
  ACFULogging *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  const void **v27;
  ACFULogging *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  __int128 v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t isPostSealing;
  void *v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  const __CFString *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  void *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  const char *v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  ACFULogging *v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  std::__shared_weak_count *v80;
  std::__shared_weak_count *v81;
  std::__shared_weak_count *v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  RoseCapabilities *v86[2];
  uint64_t v87;
  __int16 v88;
  __int128 v89;
  int v90;
  const __CFString *v91;
  uint64_t v92;
  char **v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v89 = 0uLL;
  v4 = (ACFULogging *)ACFURestore::init(this, a2, a3);
  if ((_DWORD)v4)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    v16 = 4000;
    goto LABEL_17;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), CFSTR("DebugLogPath")))
  {
    Value = (ACFULogging *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), CFSTR("DebugLogPath"));
    v6 = Value;
    if (!Value || (v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFStringGetTypeID(), (ACFULogging *)v7 != Value))
    {
      ACFULogging::getLogInstance(Value);
      ACFULogging::handleMessage();
      v16 = 4002;
      goto LABEL_17;
    }
    *((_QWORD *)this + 43) = v6;
  }
  isPreflight = ACFURestore::isPreflight(this);
  if ((isPreflight & 1) != 0 || (isPreflight = ACFURestore::isNeRDOS(this), (isPreflight & 1) != 0))
  {
    ACFULogging::getLogInstance((ACFULogging *)isPreflight);
    ACFULogging::handleMessage();
    v10 = 0;
    v11 = 0;
    v86[0] = 0;
    v86[1] = 0;
LABEL_9:
    v12 = 0;
    LOWORD(v87) = 3;
    v13 = 1;
    BYTE2(v87) = 1;
    v90 = 0;
    v91 = v11;
    v92 = 0;
    goto LABEL_10;
  }
  v90 = 1;
  v94 = 0;
  v95 = 0;
  v91 = 0;
  v92 = 0;
  v93 = &v94;
  v88 = 1;
  URLByAppendingStrings = ACFUCommon::createURLByAppendingStrings(*((ACFUCommon **)this + 41), CFSTR("/usr/standalone/firmware/Rose/"), v9);
  v10 = (const void *)URLByAppendingStrings;
  if (!URLByAppendingStrings)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v16 = 4000;
    goto LABEL_127;
  }
  v91 = CFSTR("Rap,Ticket");
  v92 = URLByAppendingStrings;
  GetRoseTatsuTagToFileNameMap((uint64_t)v86);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v93, v94);
  v22 = (char *)v86[1];
  v93 = (char **)v86[0];
  v94 = (char *)v86[1];
  v95 = v87;
  if (v87)
  {
    *((_QWORD *)v86[1] + 2) = &v94;
    v86[0] = (RoseCapabilities *)&v86[1];
    v86[1] = 0;
    v87 = 0;
    v22 = 0;
  }
  else
  {
    v93 = &v94;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v86, v22);
  RTKitFirmware::create();
  std::shared_ptr<RTKitFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>((_QWORD *)this + 19, (uint64_t *)v86);
  v23 = v86[0];
  v86[0] = 0;
  if (v23)
    v23 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v23 + 56))(v23);
  if (!*((_QWORD *)this + 19))
  {
    ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage();
    v16 = 1000;
    goto LABEL_127;
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)this + 24);
  v84 = *((_QWORD *)this + 23);
  v85 = v24;
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldxr(p_shared_owners);
    while (__stxr(v26 + 1, p_shared_owners));
  }
  RoseTransport::create(&v84, 0, 0, (uint64_t *)v86);
  v27 = (const void **)((char *)this + 168);
  std::shared_ptr<RoseTransport>::operator=[abi:ne180100]<RoseTransport,std::default_delete<RoseTransport>,void>((_QWORD *)this + 21, (uint64_t *)v86);
  v28 = v86[0];
  v86[0] = 0;
  if (v28)
    v28 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v28 + 64))(v28);
  v29 = v85;
  if (v85)
  {
    v30 = (unint64_t *)&v85->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  if (!*v27)
    goto LABEL_126;
  v32 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
  v83 = v32;
  if (v32)
  {
    v33 = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }
  v35 = (std::__shared_weak_count *)*((_QWORD *)this + 20);
  v82 = v35;
  if (v35)
  {
    v36 = (unint64_t *)&v35->__shared_owners_;
    do
      v37 = __ldxr(v36);
    while (__stxr(v37 + 1, v36));
  }
  v38 = (std::__shared_weak_count *)*((_QWORD *)this + 24);
  v81 = v38;
  if (v38)
  {
    v39 = (unint64_t *)&v38->__shared_owners_;
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  v28 = (ACFULogging *)ACFURTKitROM::create();
  v41 = *(_OWORD *)v86;
  v86[0] = 0;
  v86[1] = 0;
  v42 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
  v89 = v41;
  if (v42)
  {
    v43 = (unint64_t *)&v42->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = (std::__shared_weak_count *)v86[1];
  if (v86[1])
  {
    v46 = (unint64_t *)((char *)v86[1] + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  if (v81)
  {
    v48 = (unint64_t *)&v81->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  if (v82)
  {
    v50 = (unint64_t *)&v82->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }
  if (v83)
  {
    v52 = (unint64_t *)&v83->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  if (!(_QWORD)v89)
  {
LABEL_126:
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    v16 = 4008;
LABEL_127:
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v93, v94);
    if (!v10)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (*((_QWORD *)this + 18))
  {
    isPostSealing = ACFURestore::isPostSealing(this);
    *((_BYTE *)this + 336) = isPostSealing ^ 1;
    if ((isPostSealing & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)isPostSealing);
      ACFULogging::handleMessage();
      if (*v27
      {
        v56 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
        v79 = v56;
        if (v56)
        {
          v57 = (unint64_t *)&v56->__shared_owners_;
          do
            v58 = __ldxr(v57);
          while (__stxr(v58 + 1, v57));
        }
      }
      else
      {
        v55 = 0;
        v79 = 0;
      }
      RoseTransport::getCapabilities((uint64_t)v55, v86);
      v59 = RoseCapabilities::chipNameForCertification(v86[0]);
      *((_QWORD *)this + 25) = 0;
      *((_QWORD *)this + 26) = 0;
      *((_QWORD *)this + 27) = v59;
      *((_QWORD *)this + 28) = CFSTR("rcrt");
      *((_DWORD *)this + 58) = 1;
      *((_QWORD *)this + 31) = 0;
      *((_QWORD *)this + 32) = 0;
      *((_QWORD *)this + 30) = 0;
      v60 = (std::__shared_weak_count *)v86[1];
      if (v86[1])
      {
        v61 = (unint64_t *)((char *)v86[1] + 8);
        do
          v62 = __ldaxr(v61);
        while (__stlxr(v62 - 1, v61));
        if (!v62)
        {
          ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
          std::__shared_weak_count::__release_weak(v60);
        }
      }
      if (v79)
      {
        v63 = (unint64_t *)&v79->__shared_owners_;
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
    }
  }
  else
  {
    *((_BYTE *)this + 336) = 0;
  }
  if (ACFURestore::isPostSealing(this))
  {
    if (*v27
    {
      v66 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
      v80 = v66;
      if (v66)
      {
        v67 = (unint64_t *)&v66->__shared_owners_;
        do
          v68 = __ldxr(v67);
        while (__stxr(v68 + 1, v67));
      }
    }
    else
    {
      v65 = 0;
      v80 = 0;
    }
    RoseTransport::getCapabilities((uint64_t)v65, v86);
    *((_BYTE *)this + 337) = RoseCapabilities::supportsRTKitIOConfig(v86[0]);
    v70 = (std::__shared_weak_count *)v86[1];
    if (v86[1])
    {
      v71 = (unint64_t *)((char *)v86[1] + 8);
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
    if (v80)
    {
      v73 = (unint64_t *)&v80->__shared_owners_;
      do
        v74 = __ldaxr(v73);
      while (__stlxr(v74 - 1, v73));
      if (!v74)
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
    }
    v75 = (ACFULogging *)ACFUCommon::parseDebugArgs(*((ACFUCommon **)this + 15), (const __CFDictionary *)"combinedFDRObjects", v69);
    if (!HIDWORD(v86[0]))
    {
      *((_BYTE *)this + 337) = LODWORD(v86[0]) != 0;
      ACFULogging::getLogInstance(v75);
      ACFULogging::handleMessage();
    }
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v93, v94);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
  v11 = (const __CFString *)v89;
  *(_OWORD *)v86 = v89;
  if (!*((_QWORD *)&v89 + 1))
    goto LABEL_9;
  v76 = (unint64_t *)(*((_QWORD *)&v89 + 1) + 8);
  do
    v77 = __ldxr(v76);
  while (__stxr(v77 + 1, v76));
  LOWORD(v87) = 3;
  BYTE2(v87) = 1;
  v90 = 0;
  v91 = v11;
  v92 = (uint64_t)v12;
  do
    v78 = __ldxr(v76);
  while (__stxr(v78 + 1, v76));
  v13 = 0;
LABEL_10:
  LOWORD(v93) = v87;
  BYTE2(v93) = BYTE2(v87);
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>((uint64_t **)this + 3, &v90, (int *)&v94);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&v91);
  if ((v13 & 1) == 0)
  {
    v14 = (unint64_t *)&v12->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  ACFUError::createAppendedDomain(*((ACFUError **)this + 13), CFSTR("RoseRestore"));
  v16 = 0;
  if (v10)
LABEL_16:
    CFRelease(v10);
LABEL_17:
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
  if (*((_QWORD *)&v89 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v89 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v16;
}

void sub_21FA1EFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v5, *(char **)(v6 - 72));
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v6 - 128);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>(uint64_t **result, int *a2, int *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v10 = result;
    v11 = v8;
    v12 = v8;
    if (v8)
    {
      v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      while (a2 != a3)
      {
        std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(v5, a2, (uint64_t)v8);
        if ((v9 & 1) != 0)
        {
          v8 = v11;
          v12 = v11;
          if (!v11)
          {
            a2 += 8;
            break;
          }
          v11 = std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
        }
        else
        {
          v8 = v12;
        }
        a2 += 8;
        if (!v8)
          break;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    result = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__emplace_unique_key_args<ACFURestore::UpdateSteps,std::pair<ACFURestore::UpdateSteps const,RestoreStep> const&>(v5, a2, (uint64_t)a2);
    a2 += 8;
  }
  return result;
}

void sub_21FA1F1D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__node_assign_unique(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;

  v3 = (uint64_t *)a3;
  v6 = a1 + 1;
  v5 = a1[1];
  v7 = *a2;
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_9;
      }
      if (v9 >= v7)
        return (uint64_t *)v8;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_9:
    *(_DWORD *)(a3 + 32) = v7;
    RestoreStep::operator=();
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v6, v3);
  }
  return v3;
}

uint64_t std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

void std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::destroy(a1, a2[1]);
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)(a2 + 5));
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__emplace_unique_key_args<ACFURestore::UpdateSteps,std::pair<ACFURestore::UpdateSteps const,RestoreStep> const&>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t **v8;
  int v9;
  int v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v17[2];
  char v18;

  v6 = a1 + 1;
  v5 = a1[1];
  v7 = a1 + 1;
  v8 = a1 + 1;
  if (v5)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v10 = *((_DWORD *)v5 + 8);
        if (v9 >= v10)
          break;
        v5 = *v8;
        v7 = v8;
        if (!*v8)
          goto LABEL_9;
      }
      if (v10 >= v9)
        return v8;
      v5 = v8[1];
      if (!v5)
      {
        v7 = v8 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = operator new(0x40uLL);
    v12 = v11;
    v17[1] = v6;
    v11[8] = *(_DWORD *)a3;
    v13 = *(_QWORD *)(a3 + 16);
    *((_QWORD *)v11 + 5) = *(_QWORD *)(a3 + 8);
    *((_QWORD *)v11 + 6) = v13;
    if (v13)
    {
      v14 = (unint64_t *)(v13 + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    *((_WORD *)v11 + 28) = *(_WORD *)(a3 + 24);
    *((_BYTE *)v11 + 58) = *(_BYTE *)(a3 + 26);
    v18 = 1;
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, (uint64_t)v8, v7, (uint64_t *)v11);
    v17[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,void *>>>>::reset[abi:ne180100]((uint64_t)v17, 0);
  }
  return (uint64_t **)v12;
}

void std::unique_ptr<std::__tree_node<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)v2 + 40);
    operator delete(v2);
  }
}

_QWORD *RoseUpdaterCreate(const __CFDictionary *a1, void (*a2)(void *, const char *), void *a3, uint64_t *a4)
{
  ACFULogging *v8;
  ACFULogging *LogInstance;
  ACFULogging *inited;
  const __CFDictionary *v11;
  _QWORD *Instance;
  ACFULogging *v13;
  ACFULogging *v15;
  void **v16;
  _QWORD v17[2];
  char v18;
  _QWORD v19[2];
  char v20;
  _QWORD v21[2];
  char v22;
  _QWORD v23[2];
  char v24;
  _BYTE v25[16];

  v8 = (ACFULogging *)MEMORY[0x2207CEC80](v25, CFSTR("RoseUpdaterCreate"));
  LogInstance = (ACFULogging *)ACFULogging::getLogInstance(v8);
  inited = (ACFULogging *)ACFULogging::initLog(LogInstance, a1, a2, a3);
  if ((_DWORD)inited)
  {
    ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v23, "failed to init logging");
    v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v24 & 0x80000000) == 0)
      goto LABEL_18;
    v16 = (void **)v23;
    goto LABEL_17;
  }
  if (RoseUpdaterCreate::only_once != -1)
    dispatch_once(&RoseUpdaterCreate::only_once, &__block_literal_global_1);
  if (!kRoseRestoreObjTypeID)
  {
    ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v21, "failed to create Rose CFRuntimeClass");
    v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v22 & 0x80000000) == 0)
      goto LABEL_18;
    v16 = (void **)v21;
    goto LABEL_17;
  }
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v19, "failed to create Rose CFType object");
    v15 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v20 & 0x80000000) == 0)
      goto LABEL_18;
    v16 = (void **)v19;
    goto LABEL_17;
  }
  v13 = RoseRestore::create(a1, v11);
  Instance[2] = v13;
  if (v13)
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
    goto LABEL_8;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  std::string::basic_string[abi:ne180100]<0>(v17, "failed to get the Rose restore instance");
  v15 = (ACFULogging *)ACFUError::addError();
  if (v18 < 0)
  {
    v16 = (void **)v17;
LABEL_17:
    operator delete(*v16);
  }
LABEL_18:
  ACFULogging::getLogInstance(v15);
  ACFULogging::handleMessage();
  *a4 = ACFUError::getCFError((ACFUError *)v25);
  if (Instance)
  {
    CFRelease(Instance);
    Instance = 0;
  }
LABEL_8:
  MEMORY[0x2207CEC8C](v25);
  return Instance;
}

void sub_21FA1F744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a16 < 0)
    operator delete(__p);
  MEMORY[0x2207CEC8C](v28 - 48);
  _Unwind_Resume(a1);
}

_QWORD *RoseRestoreObjDestroy(_QWORD *result)
{
  _QWORD *v1;
  ACFULogging *v2;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      v2 = (ACFULogging *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
      ACFULogging::getLogInstance(v2);
      result = (_QWORD *)ACFULogging::handleMessage();
      v1[2] = 0;
    }
  }
  return result;
}

CFStringRef RoseRestoreObjDescribe(CFStringRef result)
{
  CFStringRef v1;
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  if (result)
  {
    v1 = result;
    v2 = CFGetAllocator(result);
    v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, CFSTR("<RoseRestoreObj %p [%p]>{}"), v1, v3);
  }
  return result;
}

uint64_t RoseUpdaterExecCommand(ACFULogging *CFError, ACFURestore *this, uint64_t a3, uint64_t a4, ACFULogging **a5)
{
  ACFURestore *v5;
  unint64_t *p_shared_owners;
  unint64_t v9;
  ACFUError *v10;
  std::__shared_weak_count *v11;

  if (CFError)
  {
    v5 = (ACFURestore *)*((_QWORD *)CFError + 2);
    if (v5)
    {
      ACFURestore::restoreCommand(this, (const __CFString *)this);
      if ((ACFURestore::executeCommand() & 1) != 0)
        return 1;
      ACFURestore::getErrorHandle(v5);
      CFError = (ACFULogging *)ACFUError::getCFError(v10);
      *a5 = CFError;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)())v11->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
    ACFULogging::getLogInstance(CFError);
  }
  else
  {
    ACFULogging::getLogInstance(0);
  }
  ACFULogging::handleMessage();
  return 0;
}

void sub_21FA1F9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RoseUpdaterIsDone(uint64_t result, _QWORD *a2)
{
  ACFURestore *v3;
  ACFULogging *CFError;
  uint64_t *p_shared_owners;
  unint64_t v6;
  ACFULogging *v7;
  void *__p;
  char v9;
  ACFUError *v10;
  std::__shared_weak_count *v11;

  if (result)
  {
    v3 = *(ACFURestore **)(result + 16);
    if (!v3)
    {
      v7 = (ACFULogging *)MEMORY[0x2207CEC80](&v10, CFSTR("RoseUpdaterIsDone"));
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "RoseRestore object doesn't exist");
      ACFUError::addError();
      if (v9 < 0)
        operator delete(__p);
      *a2 = ACFUError::getCFError((ACFUError *)&v10);
      MEMORY[0x2207CEC8C](&v10);
      return 1;
    }
    result = ACFURestore::isRestoreComplete(*(ACFURestore **)(result + 16));
    if ((_DWORD)result)
    {
      ACFURestore::getErrorHandle(v3);
      CFError = (ACFULogging *)ACFUError::getCFError(v10);
      *a2 = CFError;
      if (v11)
      {
        p_shared_owners = &v11->__shared_owners_;
        do
          v6 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
        if (!v6)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      ACFULogging::getLogInstance(CFError);
      ACFULogging::handleMessage();
      return 1;
    }
    *a2 = 0;
  }
  return result;
}

void sub_21FA1FB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v17 - 32);
  _Unwind_Resume(a1);
}

void GetRoseTatsuTagToFileNameMap(uint64_t a1@<X8>)
{
  uint64_t i;
  const __CFString *v3;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Rap,SoftwareBinaryDsp1");
  std::string::basic_string[abi:ne180100]<0>(v4, "sbd1");
  v4[3] = CFSTR("Rap,RTKitOS");
  std::string::basic_string[abi:ne180100]<0>(v5, "rkos");
  v5[3] = CFSTR("Rap,RestoreRTKitOS");
  std::string::basic_string[abi:ne180100]<0>(v6, "rrko");
  v6[3] = CFSTR("Rap,RTKitIOConfig");
  std::string::basic_string[abi:ne180100]<0>(v7, "icnf");
  std::map<__CFString const*,std::string>::map[abi:ne180100](a1, (unint64_t *)&v3, 4);
  for (i = 0; i != -16; i -= 4)
  {
    if (SHIBYTE(v7[i + 2]) < 0)
      operator delete((void *)v7[i]);
  }
}

void sub_21FA1FC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v12;

  v12 = 0;
  while (1)
  {
    if (*(char *)(v10 + v12 + 127) < 0)
      operator delete(*(void **)(v10 + v12 + 104));
    v12 -= 32;
    if (v12 == -128)
      _Unwind_Resume(exception_object);
  }
}

uint64_t std::map<__CFString const*,std::string>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_21FA1FD34(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__emplace_hint_unique_key_args<__CFString const*,std::pair<__CFString const* const,std::string> const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__find_equal<__CFString const*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
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
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
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
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
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

void std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::__construct_node<std::pair<__CFString const* const,std::string> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 16) = 0;
  *((_QWORD *)v6 + 4) = *(_QWORD *)a2;
  v7 = (std::string *)(v6 + 40);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 8);
    v7->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
  }
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_21FA20000(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<__CFString const*,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 63) < 0)
      operator delete(__p[5]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x24BED9FA8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
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

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x24BDBBD10](theData, extraLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x24BED4AF0]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x24BED4B20]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x24BED4B30]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x24BED4B38]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x24BED4B70]();
}

uint64_t IOReportSampleCopyDescription()
{
  return MEMORY[0x24BED4B80]();
}

uint64_t IOReportSelectChannelsInGroup()
{
  return MEMORY[0x24BED4B88]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ACFUCommon::parseDebugArgs(ACFUCommon *this, const __CFDictionary *a2, const char *a3)
{
  return MEMORY[0x24BE05B58](this, a2, a3);
}

uint64_t ACFUCommon::PersonalizeParams::logParameters(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x24BE05B60](this);
}

uint64_t ACFUCommon::PersonalizeParams::PersonalizeParams()
{
  return MEMORY[0x24BE05B78]();
}

uint64_t ACFUCommon::stringFromCFString(ACFUCommon *this, const __CFString *a2)
{
  return MEMORY[0x24BE05B88](this, a2);
}

uint64_t ACFUCommon::createURLByAppendingStrings(ACFUCommon *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BE05BA0](this, a2, a3);
}

uint64_t ACFULogging::handleMessage()
{
  return MEMORY[0x24BE05BA8]();
}

uint64_t ACFULogging::getLogInstance(ACFULogging *this)
{
  return MEMORY[0x24BE05BB8](this);
}

uint64_t ACFULogging::handleMessageBinary()
{
  return MEMORY[0x24BE05BC8]();
}

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x24BE05BD8]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x24BE05BE8](this, a2, a3, a4);
}

uint64_t ACFUMachO32::create(ACFUMachO32 *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BE05BF8](this, a2);
}

uint64_t ACFUMachO64::create(ACFUMachO64 *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BE05C00](this, a2);
}

uint64_t ACFURestore::performCmd(ACFURestore *this)
{
  return MEMORY[0x24BE05C08](this);
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x24BE05C28](this);
}

uint64_t ACFURestore::isPostSealing(ACFURestore *this)
{
  return MEMORY[0x24BE05C30](this);
}

uint64_t ACFURestore::executeCommand()
{
  return MEMORY[0x24BE05C50]();
}

uint64_t ACFURestore::getErrorHandle(ACFURestore *this)
{
  return MEMORY[0x24BE05C60](this);
}

uint64_t ACFURestore::restoreCommand(ACFURestore *this, const __CFString *a2)
{
  return MEMORY[0x24BE05C70](this, a2);
}

uint64_t ACFURestore::isRestoreComplete(ACFURestore *this)
{
  return MEMORY[0x24BE05C80](this);
}

uint64_t ACFURestore::getCurrentUpdateStep(ACFURestore *this)
{
  return MEMORY[0x24BE05C90](this);
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x24BE05CA0](this, a2, a3);
}

uint64_t ACFURestore::isNeRDOS(ACFURestore *this)
{
  return MEMORY[0x24BE05CA8](this);
}

uint64_t ACFURestore::queryCmd(ACFURestore *this)
{
  return MEMORY[0x24BE05CB8](this);
}

void ACFURestore::ACFURestore(ACFURestore *this)
{
  MEMORY[0x24BE05CC8](this);
}

void ACFURestore::~ACFURestore(ACFURestore *this)
{
  MEMORY[0x24BE05CD0](this);
}

uint64_t RestoreStep::operator=()
{
  return MEMORY[0x24BE05CE8]();
}

uint64_t ACFUFTABFile::setBootNonce(ACFUFTABFile *this)
{
  return MEMORY[0x24BE05CF0](this);
}

uint64_t ACFUFTABFile::addNewFileToFTAB()
{
  return MEMORY[0x24BE05CF8]();
}

uint64_t ACFUFTABFile::create()
{
  return MEMORY[0x24BE05D00]();
}

uint64_t ACFUFirmware::copyFWContainer(ACFUFirmware *this)
{
  return MEMORY[0x24BE05D08](this);
}

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x24BE05D28]();
}

uint64_t ACFUTransport::init()
{
  return MEMORY[0x24BE05D30]();
}

void ACFUTransport::ACFUTransport(ACFUTransport *this)
{
  MEMORY[0x24BE05D38](this);
}

void ACFUTransport::~ACFUTransport(ACFUTransport *this)
{
  MEMORY[0x24BE05D40](this);
}

uint64_t RTKitFirmware::saveFirmwareToPath(RTKitFirmware *this, const __CFURL *a2)
{
  return MEMORY[0x24BE05D48](this, a2);
}

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x24BE05D58]();
}

{
  return MEMORY[0x24BE05D78]();
}

uint64_t ACFUDiagnostics::create(ACFUDiagnostics *this, const __CFString *a2)
{
  return MEMORY[0x24BE05DA0](this, a2);
}

uint64_t ACFUDiagnostics::addItem()
{
  return MEMORY[0x24BE05DB0]();
}

uint64_t ACFUDiagnostics::perform(ACFUDiagnostics *this)
{
  return MEMORY[0x24BE05DB8](this);
}

void ACFUDiagnostics::~ACFUDiagnostics(ACFUDiagnostics *this)
{
  MEMORY[0x24BE05DD8](this);
}

uint64_t ACFURestoreHost::createRequest()
{
  return MEMORY[0x24BE05DE0]();
}

uint64_t ACFURestoreHost::copyDataFromFileDictionary()
{
  return MEMORY[0x24BE05DE8]();
}

uint64_t ACFURestoreHost::init(ACFURestoreHost *this, const __CFDictionary *a2, const __CFString *a3)
{
  return MEMORY[0x24BE05DF0](this, a2, a3);
}

void ACFURestoreHost::ACFURestoreHost(ACFURestoreHost *this)
{
  MEMORY[0x24BE05DF8](this);
}

void ACFURestoreHost::~ACFURestoreHost(ACFURestoreHost *this)
{
  MEMORY[0x24BE05E00](this);
}

uint64_t ACFUSynchronize::Syncher::wait()
{
  return MEMORY[0x24BE05E08]();
}

uint64_t ACFUSynchronize::Syncher::notify()
{
  return MEMORY[0x24BE05E20]();
}

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x24BE05EA8](this);
}

uint64_t ACFUError::createAppendedDomain(ACFUError *this, const __CFString *a2)
{
  return MEMORY[0x24BE05EB8](this, a2);
}

uint64_t ACFUError::addError()
{
  return MEMORY[0x24BE05EC8]();
}

void ACFUError::ACFUError(ACFUError *this, const __CFString *a2)
{
  MEMORY[0x24BE05EE0](this, a2);
}

void ACFUError::~ACFUError(ACFUError *this)
{
  MEMORY[0x24BE05EF8](this);
}

uint64_t ACFUMachO::getMachoHeaderData(ACFUMachO *this)
{
  return MEMORY[0x24BE05F00](this);
}

uint64_t ACFUFirmware::getManifest(ACFUFirmware *this)
{
  return MEMORY[0x24BE05F10](this);
}

uint64_t ACFUFirmware::copyFWDataByTag(ACFUFirmware *this, const __CFString *a2)
{
  return MEMORY[0x24BE05F20](this, a2);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x24BEDA9F8](this);
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

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x24BEDABD8](__ns);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF78]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
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

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x24BEDB2C8](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x24BEDB2D0](this, __p, __opt, __ec);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E47C718(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E47C720(__sz);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

