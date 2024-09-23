VinylRestore *VinylRestore::create(VinylRestore *this, const __CFDictionary *a2)
{
  ACFULogging *v3;
  std::string *v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;
  VinylRestore *v8;
  ACFULogging *v9;
  std::string v11;
  std::string v12;
  __int128 v13;
  std::string::size_type v14;

  ACFULogging::getLogInstance(this);
  v3 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v3);
  std::string::basic_string[abi:ne180100]<0>(&v11, "VinylRestore");
  v4 = std::string::append(&v11, "::");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v12, "create");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14 = v6->__r_.__value_.__r.__words[2];
  v13 = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v14) < 0)
    operator delete((void *)v13);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  v8 = (VinylRestore *)operator new(0x150uLL);
  VinylRestore::VinylRestore(v8);
  v9 = (ACFULogging *)(*(uint64_t (**)(VinylRestore *, VinylRestore *, const __CFString *))(*(_QWORD *)v8 + 40))(v8, this, CFSTR("eUICC,Ticket"));
  if ((_DWORD)v9)
  {
    ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage();
    v9 = (ACFULogging *)(*(uint64_t (**)(VinylRestore *))(*(_QWORD *)v8 + 8))(v8);
    v8 = 0;
  }
  ACFULogging::getLogInstance(v9);
  ACFULogging::handleMessage();
  return v8;
}

void sub_222D40214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  operator delete(v23);
  _Unwind_Resume(a1);
}

uint64_t VinylRestore::queryCmd@<X0>(std::__shared_weak_count **this@<X0>, uint64_t a2@<X8>)
{
  std::__shared_weak_count *PersoParameters;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;
  ACFULogging *v14;
  std::string v16;
  std::string v17;
  __int128 v18;
  std::string::size_type v19;

  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 0;
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFURestore::isPreflight((ACFURestore *)this);
  ACFULogging::handleMessage();
  if (ACFURestore::isPreflight((ACFURestore *)this))
  {
    PersoParameters = (std::__shared_weak_count *)((uint64_t (*)(std::__shared_weak_count **))(*this)->__shared_weak_owners_)(this);
    *(_QWORD *)a2 = PersoParameters;
    *(_BYTE *)(a2 + 8) = PersoParameters != 0;
  }
  else
  {
    PersoParameters = this[21];
    if (PersoParameters)
    {
      if (PersoParameters)
      {
        v5 = this[22];
        *(_QWORD *)&v18 = PersoParameters;
        *((_QWORD *)&v18 + 1) = v5;
        if (v5)
        {
          p_shared_owners = (unint64_t *)&v5->__shared_owners_;
          do
            v7 = __ldxr(p_shared_owners);
          while (__stxr(v7 + 1, p_shared_owners));
        }
        PersoParameters = (std::__shared_weak_count *)VinylTransport::getPersoParameters((const __CFDictionary **)PersoParameters, (uint64_t)&v17);
        *(_QWORD *)a2 = v17.__r_.__value_.__r.__words[0];
        *(_BYTE *)(a2 + 8) = v17.__r_.__value_.__s.__data_[8];
        if (v5)
        {
          v8 = (unint64_t *)&v5->__shared_owners_;
          do
            v9 = __ldaxr(v8);
          while (__stlxr(v9 - 1, v8));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
      }
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)PersoParameters);
  std::string::basic_string[abi:ne180100]<0>(&v16, "VinylRestore");
  v10 = std::string::append(&v16, "::");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v17, "queryCmd");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v19 = v12->__r_.__value_.__r.__words[2];
  v18 = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v19) < 0)
    operator delete((void *)v18);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v14);
  return ACFULogging::handleMessage();
}

void sub_222D40484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v23 - 64);
  _Unwind_Resume(a1);
}

uint64_t VinylRestore::getPreflightPersoParameters@<X0>(VinylRestore *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(VinylRestore *))(*(_QWORD *)this + 16))(this);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result != 0;
  return result;
}

uint64_t VinylRestore::performCmd(const __CFDictionary **this)
{
  std::string *v2;
  __int128 v3;
  std::string *v4;
  __int128 v5;
  const __CFDictionary *updated;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  int v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::string v15;
  std::string v16;
  __int128 v17;
  std::string::size_type v18;

  ACFULogging::getLogInstance((ACFULogging *)this);
  std::string::basic_string[abi:ne180100]<0>(&v15, "VinylRestore");
  v2 = std::string::append(&v15, "::");
  v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  v4 = std::string::append(&v16, "performCmd");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v18 = v4->__r_.__value_.__r.__words[2];
  v17 = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v18) < 0)
    operator delete((void *)v17);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  updated = this[21];
  if (!updated)
    goto LABEL_19;
  if (!updated)
    goto LABEL_19;
  v7 = (std::__shared_weak_count *)this[22];
  *(_QWORD *)&v17 = updated;
  *((_QWORD *)&v17 + 1) = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  updated = VinylTransport::updateFw((const __CFDictionary **)updated, this[15]);
  v10 = (int)updated;
  if (v7)
  {
    v11 = (unint64_t *)&v7->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (!v10)
  {
    v13 = 1;
  }
  else
  {
LABEL_19:
    ACFULogging::getLogInstance(updated);
    updated = (const __CFDictionary *)ACFULogging::handleMessage();
    v13 = 0;
  }
  ACFULogging::getLogInstance(updated);
  ACFULogging::handleMessage();
  return v13;
}

void sub_222D406D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v23 - 64);
  _Unwind_Resume(a1);
}

void VinylRestore::~VinylRestore(VinylRestore *this)
{
  *(_QWORD *)this = off_24EB7A0B0;
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  ACFURestore::~ACFURestore(this);
}

{
  void *v1;

  VinylRestore::~VinylRestore(this);
  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void VinylRestore::VinylRestore(VinylRestore *this)
{
  ACFULogging *v1;

  ACFURestore::ACFURestore(this);
  *(_QWORD *)v1 = off_24EB7A0B0;
  ACFULogging::getLogInstance(v1);
  ACFULogging::handleMessage();
}

void sub_222D40810(_Unwind_Exception *a1)
{
  ACFURestore *v1;

  ACFURestore::~ACFURestore(v1);
  _Unwind_Resume(a1);
}

__CFDictionary *VinylRestore::gatherPreflightParameters(VinylRestore *this)
{
  ACFULogging *v1;
  const __CFDictionary *v2;
  std::string *v3;
  __int128 v4;
  std::string *v5;
  __int128 v6;
  const void *Value;
  CFTypeID v8;
  ACFULogging *TypeID;
  const __CFData *v10;
  const UInt8 *BytePtr;
  const __CFAllocator *v12;
  CFDataRef v13;
  CFDataRef v14;
  uint64_t (*v15)(uint64_t);
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v21;
  CFMutableDictionaryRef v22;
  CFMutableDictionaryRef v23;
  uint64_t (*v24)(uint64_t);
  uint64_t (*v25)(uint64_t);
  __CFDictionary *v26;
  ACFULogging *v27;
  const void *v28;
  const void *v29;
  __CFDictionary *v30;
  const void *v31;
  __CFDictionary *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  ACFULogging *v38;
  std::string *v39;
  __int128 v40;
  std::string *v41;
  __int128 v42;
  std::string v44;
  std::string v45;
  void *__p[2];
  std::string::size_type v47;
  CFDataRef v48;
  CFMutableDictionaryRef v49;
  CFMutableDictionaryRef v50;

  v49 = 0;
  v50 = 0;
  v48 = 0;
  v1 = (ACFULogging *)MGCopyAnswer();
  v2 = v1;
  if (!v1)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_50;
  }
  ACFULogging::getLogInstance(v1);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  v3 = std::string::append(&v44, "::");
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  v5 = std::string::append(&v45, "gatherPreflightParameters");
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v47 = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  Value = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateKeyId"));
  v8 = CFGetTypeID(Value);
  TypeID = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v8 != TypeID)
    goto LABEL_46;
  TypeID = (ACFULogging *)CFDataGetLength((CFDataRef)Value);
  if ((unint64_t)TypeID <= 0x13)
    goto LABEL_46;
  v10 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateKeyId"));
  BytePtr = CFDataGetBytePtr(v10);
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], BytePtr, 20, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v14 = v48;
  v48 = v13;
  __p[0] = v14;
  TypeID = (ACFULogging *)ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
  v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v48)
    v15 = 0;
  if (!v15 || !v48)
    goto LABEL_46;
  ACFULogging::getLogInstance(TypeID);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  v16 = std::string::append(&v44, "::");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v45, "gatherPreflightParameters");
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v47 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v21 = v49;
  v49 = Mutable;
  __p[0] = v21;
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  v22 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v23 = v50;
  v50 = v22;
  __p[0] = v23;
  TypeID = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  v24 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  v25 = v49
      ? ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get
      : 0;
  if (!v25 || !v49)
    goto LABEL_46;
  if (!v50)
    v24 = 0;
  if (!v24 || !v50)
  {
LABEL_46:
    ACFULogging::getLogInstance(TypeID);
LABEL_50:
    ACFULogging::handleMessage();
    v26 = 0;
    goto LABEL_43;
  }
  v26 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v26)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_50;
  }
  v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateCsn"));
  if (!v27
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateEuiccChipId"))) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateMainFwNonce"))) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateGoldFwNonce"))) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateLoaderVersion"))) == 0
    || (v27 = (ACFULogging *)CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateGoldFwMac"))) == 0)
  {
    ACFULogging::getLogInstance(v27);
LABEL_45:
    ACFULogging::handleMessage();
    goto LABEL_43;
  }
  v28 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateCsn"));
  CFDictionarySetValue(v26, CFSTR("eUICC,EID"), v28);
  v29 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateEuiccChipId"));
  CFDictionarySetValue(v26, CFSTR("eUICC,ChipID"), v29);
  v30 = v49;
  v31 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateMainFwNonce"));
  CFDictionarySetValue(v30, CFSTR("Nonce"), v31);
  CFDictionarySetValue(v26, CFSTR("eUICC,Main"), v49);
  v32 = v50;
  v33 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateGoldFwNonce"));
  CFDictionarySetValue(v32, CFSTR("Nonce"), v33);
  CFDictionarySetValue(v26, CFSTR("eUICC,Gold"), v50);
  CFDictionarySetValue(v26, CFSTR("eUICC,RootKeyIdentifier"), v48);
  v34 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateLoaderVersion"));
  CFDictionarySetValue(v26, CFSTR("eUICC,FirmwareLoaderVersion"), v34);
  v35 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateMainFwMac"));
  CFDictionarySetValue(v26, CFSTR("eUICC,MainFwMac"), v35);
  v36 = CFDictionaryGetValue(v2, CFSTR("kVinylFwUpdateGoldFwMac"));
  CFDictionarySetValue(v26, CFSTR("eUICC,GoldFwMac"), v36);
  v37 = (const void *)MGCopyAnswer();
  if (!v37)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_45;
  }
  CFDictionarySetValue(v26, CFSTR("eUICC,ApProductionMode"), v37);
  CFDictionarySetValue(v26, CFSTR("@eUICC,Ticket"), (const void *)*MEMORY[0x24BDBD270]);
  ACFULogging::getLogInstance(v38);
  std::string::basic_string[abi:ne180100]<0>(&v44, "VinylRestore");
  v39 = std::string::append(&v44, "::");
  v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v40;
  v39->__r_.__value_.__l.__size_ = 0;
  v39->__r_.__value_.__r.__words[2] = 0;
  v39->__r_.__value_.__r.__words[0] = 0;
  v41 = std::string::append(&v45, "gatherPreflightParameters");
  v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v47 = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v47) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
LABEL_43:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v48);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v49);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v50);
  return v26;
}

void sub_222D40EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v30 - 72));
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v30 - 64));
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v30 - 56));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t VinylRestore::init(VinylRestore *this, const __CFDictionary *a2, const void *a3)
{
  ACFULogging *v6;
  uint64_t v7;
  ACFULogging *v8;
  __CFString *Value;
  CFTypeID TypeID;
  const void *v11;
  CFTypeID v12;
  ACFULogging *v13;
  uint64_t isPreflight;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  ACFULogging *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  const __CFString *v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  const __CFString *v27;
  uint64_t URLByAppendingStrings;
  char *v29;
  ACFULogging *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t *v34;
  ACFULogging *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  __int128 v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  unint64_t v64;
  ACFULogging *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v72;
  std::__shared_weak_count *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  std::string v82;
  std::string v83;
  __int128 __p;
  std::string::size_type v85;
  __int16 v86;
  __int128 v87;
  ACFUTransport *v88;
  const __CFString *v89;
  uint64_t v90;
  __int128 v91;
  std::string::size_type v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v87 = 0uLL;
  v6 = (ACFULogging *)ACFURestore::init(this, a2, a3);
  v7 = (uint64_t)v6;
  if ((_DWORD)v6)
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    goto LABEL_94;
  }
  v8 = (ACFULogging *)CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), CFSTR("RestoreSystemPartition"));
  if ((_DWORD)v8)
  {
    Value = (__CFString *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), CFSTR("RestoreSystemPartition"));
    TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value))
    {
LABEL_4:
      v7 = 4002;
      goto LABEL_94;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    Value = &stru_24EB7B590;
  }
  if (CFDictionaryContainsKey(*((CFDictionaryRef *)this + 16), CFSTR("DebugLogPath")))
  {
    v11 = CFDictionaryGetValue(*((CFDictionaryRef *)this + 16), CFSTR("DebugLogPath"));
    v12 = CFGetTypeID(v11);
    v13 = (ACFULogging *)CFStringGetTypeID();
    if ((ACFULogging *)v12 != v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      goto LABEL_4;
    }
  }
  isPreflight = ACFURestore::isPreflight(this);
  if ((isPreflight & 1) != 0)
  {
    v15 = (std::__shared_weak_count *)*((_QWORD *)this + 24);
    v72 = *((_QWORD *)this + 23);
    v73 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    VinylTransport::createTransport(&v72, *((_QWORD *)this + 17), &v88);
    std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>((_QWORD *)this + 21, (uint64_t *)&v88);
    v18 = v88;
    v88 = 0;
    if (v18)
      v18 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v18 + 64))(v18);
    v19 = v73;
    if (v73)
    {
      v20 = (unint64_t *)&v73->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    if (!*((_QWORD *)this + 21))
    {
      ACFULogging::getLogInstance(v18);
      ACFULogging::handleMessage();
      v7 = 4008;
      goto LABEL_94;
    }
    ACFULogging::getLogInstance(v18);
    ACFULogging::handleMessage();
    v22 = (const __CFString *)v87;
    goto LABEL_81;
  }
  LODWORD(v88) = 1;
  *((_QWORD *)&v91 + 1) = 0;
  v92 = 0;
  v89 = 0;
  v90 = 0;
  *(_QWORD *)&v91 = (char *)&v91 + 8;
  v86 = 1;
  ACFULogging::getLogInstance((ACFULogging *)isPreflight);
  std::string::basic_string[abi:ne180100]<0>(&v82, "VinylRestore");
  v23 = std::string::append(&v82, "::");
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v83.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  v25 = std::string::append(&v83, "init");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v85 = v25->__r_.__value_.__r.__words[2];
  __p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v85) < 0)
    operator delete((void *)__p);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v82.__r_.__value_.__l.__data_);
  URLByAppendingStrings = ACFUCommon::createURLByAppendingStrings((ACFUCommon *)Value, CFSTR("/usr/standalone/firmware/Vinyl/"), v27);
  if (!URLByAppendingStrings)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v7 = 4000;
LABEL_106:
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v91, *((char **)&v91 + 1));
    goto LABEL_94;
  }
  v89 = CFSTR("eUICC,Ticket");
  v90 = URLByAppendingStrings;
  getVinylTatsuTagToFileNameMap((uint64_t)&__p);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v91, *((char **)&v91 + 1));
  v29 = (char *)*((_QWORD *)&__p + 1);
  v91 = __p;
  v92 = v85;
  if (v85)
  {
    *(_QWORD *)(*((_QWORD *)&__p + 1) + 16) = (char *)&v91 + 8;
    *(_QWORD *)&__p = (char *)&__p + 8;
    *((_QWORD *)&__p + 1) = 0;
    v85 = 0;
    v29 = 0;
  }
  else
  {
    *(_QWORD *)&v91 = (char *)&v91 + 8;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&__p, v29);
  RTKitFirmware::create();
  std::shared_ptr<ACFUFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>((_QWORD *)this + 19, (uint64_t *)&__p);
  v30 = (ACFULogging *)__p;
  *(_QWORD *)&__p = 0;
  if (v30)
    v30 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v30 + 56))(v30);
  if (!*((_QWORD *)this + 19))
  {
    ACFULogging::getLogInstance(v30);
    ACFULogging::handleMessage();
    v7 = 1000;
    goto LABEL_106;
  }
  v31 = (std::__shared_weak_count *)*((_QWORD *)this + 24);
  v80 = *((_QWORD *)this + 23);
  v81 = v31;
  if (v31)
  {
    v32 = (unint64_t *)&v31->__shared_owners_;
    do
      v33 = __ldxr(v32);
    while (__stxr(v33 + 1, v32));
  }
  VinylTransport::createTransport(&v80, *((_QWORD *)this + 17), (ACFUTransport **)&__p);
  v34 = (uint64_t *)((char *)this + 168);
  std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>((_QWORD *)this + 21, (uint64_t *)&__p);
  v35 = (ACFULogging *)__p;
  *(_QWORD *)&__p = 0;
  if (v35)
    v35 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v35 + 64))(v35);
  v36 = v81;
  if (v81)
  {
    v37 = (unint64_t *)&v81->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  if (!*v34)
    goto LABEL_105;
  v39 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
  v78 = *v34;
  v79 = v39;
  if (v39)
  {
    v40 = (unint64_t *)&v39->__shared_owners_;
    do
      v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
  }
  v42 = (std::__shared_weak_count *)*((_QWORD *)this + 20);
  v76 = *((_QWORD *)this + 19);
  v77 = v42;
  if (v42)
  {
    v43 = (unint64_t *)&v42->__shared_owners_;
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }
  v45 = (std::__shared_weak_count *)*((_QWORD *)this + 24);
  v74 = *((_QWORD *)this + 23);
  v75 = v45;
  if (v45)
  {
    v46 = (unint64_t *)&v45->__shared_owners_;
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
  }
  v35 = (ACFULogging *)ACFURTKitROM::create();
  v48 = __p;
  __p = 0uLL;
  v49 = (std::__shared_weak_count *)*((_QWORD *)&v87 + 1);
  v87 = v48;
  if (v49)
  {
    v50 = (unint64_t *)&v49->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  v52 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v53 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  if (v75)
  {
    v55 = &v75->__shared_owners_;
    do
      v56 = __ldaxr((unint64_t *)v55);
    while (__stlxr(v56 - 1, (unint64_t *)v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  if (v77)
  {
    v57 = &v77->__shared_owners_;
    do
      v58 = __ldaxr((unint64_t *)v57);
    while (__stlxr(v58 - 1, (unint64_t *)v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }
  if (v79)
  {
    v59 = &v79->__shared_owners_;
    do
      v60 = __ldaxr((unint64_t *)v59);
    while (__stlxr(v60 - 1, (unint64_t *)v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }
  v22 = (const __CFString *)v87;
  if (!(_QWORD)v87)
  {
LABEL_105:
    ACFULogging::getLogInstance(v35);
    ACFULogging::handleMessage();
    v7 = 4008;
    goto LABEL_106;
  }
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v91, *((char **)&v91 + 1));
LABEL_81:
  v61 = (std::__shared_weak_count *)*((_QWORD *)&v87 + 1);
  *(_QWORD *)&__p = v22;
  *((_QWORD *)&__p + 1) = *((_QWORD *)&v87 + 1);
  if (*((_QWORD *)&v87 + 1))
  {
    v62 = (unint64_t *)(*((_QWORD *)&v87 + 1) + 8);
    do
      v63 = __ldxr(v62);
    while (__stxr(v63 + 1, v62));
    LOWORD(v85) = 3;
    BYTE2(v85) = 1;
    LODWORD(v88) = 0;
    v89 = v22;
    v90 = (uint64_t)v61;
    do
      v64 = __ldxr(v62);
    while (__stxr(v64 + 1, v62));
  }
  else
  {
    LOWORD(v85) = 3;
    BYTE2(v85) = 1;
    LODWORD(v88) = 0;
    v89 = v22;
    v90 = 0;
  }
  LOWORD(v91) = v85;
  BYTE2(v91) = BYTE2(v85);
  std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__assign_unique<std::pair<ACFURestore::UpdateSteps const,RestoreStep> const*>((uint64_t **)this + 3, (int *)&v88, (int *)&v91 + 2);
  v65 = (ACFULogging *)std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&v89);
  if (v61)
  {
    v66 = (unint64_t *)&v61->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  ACFULogging::getLogInstance(v65);
  ACFULogging::handleMessage();
  v7 = 0;
LABEL_94:
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v87 + 1);
  if (*((_QWORD *)&v87 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v87 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  return v7;
}

void sub_222D41758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;
  uint64_t v41;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v40, *(char **)(v41 - 120));
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v41 - 176);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<ACFUFirmware>::operator=[abi:ne180100]<RTKitFirmware,std::default_delete<RTKitFirmware>,void>(_QWORD *a1, uint64_t *a2)
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
    *v5 = off_24EB7A108;
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

_QWORD *std::shared_ptr<ACFUTransport>::operator=[abi:ne180100]<VinylTransport,std::default_delete<VinylTransport>,void>(_QWORD *a1, uint64_t *a2)
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
    *v5 = off_24EB7A168;
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

uint64_t VinylRestore::updateAllowed(VinylRestore *this)
{
  const void *v2;
  const __CFDictionary **v3;
  const __CFDictionary **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  const __CFDictionary *Value;
  ACFULogging *v9;
  int Bool;
  int v11;
  ACFULogging *v12;
  const __CFDictionary *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  const __CFData *v18;
  int64_t Length;
  _BOOL4 v20;
  CFTypeID v21;
  unint64_t *v22;
  unint64_t v23;
  std::string v25;
  std::string v26;
  void *__p[2];
  std::string::size_type v28;
  _BYTE v29[16];
  _BYTE v30[16];
  const __CFDictionary **v31;
  std::__shared_weak_count *v32;

  v2 = (const void *)*((_QWORD *)this + 21);
  if (v2
  {
    v4 = v3;
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
    v31 = v3;
    v32 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v31 = 0;
    v32 = 0;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 17), CFSTR("BasebandUpdater"));
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v30, Value);
  v9 = (ACFULogging *)ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v29, *((const __CFDictionary **)this + 17));
  ACFULogging::getLogInstance(v9);
  ACFURestore::isPreflight(this);
  ACFULogging::handleMessage();
  Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v30, CFSTR("VinylSkipAll"));
  v11 = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v29, CFSTR("UpdateBaseband"));
  if (ACFURestore::isPreflight(this))
  {
    v12 = (ACFULogging *)MGCopyAnswer();
    v13 = v12;
    if (v12)
    {
      ACFULogging::getLogInstance(v12);
      std::string::basic_string[abi:ne180100]<0>(&v25, "VinylRestore");
      v14 = std::string::append(&v25, "::");
      v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
      v26.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v15;
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      v16 = std::string::append(&v26, "updateAllowed");
      v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      v28 = v16->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType();
      if (SHIBYTE(v28) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
      v12 = (ACFULogging *)CFDictionaryGetValue(v13, CFSTR("kVinylFwUpdateCsn"));
      v18 = v12;
    }
    else
    {
      v18 = 0;
    }
    ACFULogging::getLogInstance(v12);
    Length = ACFULogging::handleMessage();
    if (v18
      && (ACFULogging::getLogInstance((ACFULogging *)Length),
          CFGetTypeID(v18),
          CFDataGetTypeID(),
          CFDataGetLength(v18),
          ACFULogging::handleMessage(),
          v21 = CFGetTypeID(v18),
          Length = CFDataGetTypeID(),
          v21 == Length))
    {
      Length = CFDataGetLength(v18);
      v20 = Length > 0;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    Length = VinylTransport::checkVinylPresence(v4);
    v20 = Length;
  }
  ACFULogging::getLogInstance((ACFULogging *)Length);
  ACFULogging::handleMessage();
  MEMORY[0x22767DA3C](v29);
  MEMORY[0x22767DA3C](v30);
  if (v5)
  {
    v22 = (unint64_t *)&v5->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v11 & ~Bool & v20;
}

void sub_222D41D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,char a34)
{
  uint64_t v34;

  if (a32 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (a19 < 0)
    operator delete(a14);
  MEMORY[0x22767DA3C](&a34);
  MEMORY[0x22767DA3C](v34 - 112);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v34 - 96);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
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
  __cxa_throw(exception, (struct type_info *)off_24EB79D58, MEMORY[0x24BEDAAF0]);
}

void sub_222D41EFC(_Unwind_Exception *a1)
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

void std::__shared_ptr_pointer<VinylTransport  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<VinylTransport  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 64))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<VinylTransport  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
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
      v11 = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
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
          v11 = std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next((uint64_t)v11);
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

void sub_222D421F8(_Unwind_Exception *a1, uint64_t a2, ...)
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v8, v6, v3);
  }
  return v3;
}

uint64_t *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

_QWORD *std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v8, v7, (uint64_t *)v11);
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

_QWORD *eUICCFwReaderOpen(ACFULogging *a1)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *v4;

  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v4 = vinyl_unzOpen((uint64_t)BytePtr, Length);
  if (!v4)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  return v4;
}

uint64_t eUICCFwReaderClose(ACFULogging *a1)
{
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  if (a1)
    vinyl_unzClose((uint64_t)a1);
  return 0;
}

uint64_t eUICCFwReaderFindFile(uint64_t a1, CFStringRef theString)
{
  char buffer[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (CFStringGetCString(theString, buffer, 1024, 0x8000100u))
    return 4 * (vinyl_unzLocateFile(a1, buffer, 0) != 0);
  else
    return 99;
}

ACFULogging *eUICCFwReaderFindAndCopyFileData(ACFULogging *a1, CFStringRef theString, CFTypeRef *a3)
{
  std::string *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  ACFULogging *File;
  ACFULogging *v11;
  ACFULogging *v12;
  ACFULogging *v13;
  CFTypeRef v14;
  std::string v16;
  std::string v17;
  void *__p[2];
  std::string::size_type v19;
  CFTypeRef v20;

  v20 = 0;
  if (theString)
  {
    ACFULogging::getLogInstance(a1);
    std::string::basic_string[abi:ne180100]<0>(&v16, "eUICCFwReader");
    v6 = std::string::append(&v16, "::");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    v8 = std::string::append(&v17, "eUICCFwReaderFindAndCopyFileData");
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v19 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v19) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v17.__r_.__value_.__l.__data_);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v16.__r_.__value_.__l.__data_);
  }
  File = (ACFULogging *)eUICCFwReaderFindFile((uint64_t)a1, theString);
  if ((_DWORD)File)
  {
    v11 = File;
    ACFULogging::getLogInstance(File);
    ACFULogging::handleMessage();
    return v11;
  }
  else
  {
    v13 = (ACFULogging *)eUICCFwReaderCopyFileData((uint64_t)a1, &v20);
    v12 = v13;
    if ((_DWORD)v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      v14 = v20;
      if (!v20)
        return v12;
    }
    else
    {
      v14 = v20;
      if (!v20)
      {
        ACFULogging::getLogInstance(v13);
        ACFULogging::handleMessage();
        return 0;
      }
      *a3 = CFRetain(v20);
    }
    CFRelease(v14);
  }
  return v12;
}

void sub_222D42A30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t eUICCFwReaderCopyFileData(uint64_t a1, CFTypeRef *a2)
{
  const UInt8 *v4;
  const UInt8 *v5;
  int CurrentFile;
  CFDataRef v7;
  CFDataRef v8;
  uint64_t v10;
  size_t __size;
  _BYTE v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (vinyl_unzGetCurrentFileInfo(a1, (uint64_t)&v10, (uint64_t)v12, 0x400uLL, 0, 0, 0, 0))
    return 15;
  v4 = (const UInt8 *)malloc(__size);
  if (!v4)
    return 2;
  v5 = v4;
  if (vinyl_unzOpenCurrentFile(a1))
    return 15;
  CurrentFile = vinyl_unzReadCurrentFile(a1, (uint64_t)v5, __size);
  if (__size != CurrentFile)
    return 4;
  if (vinyl_unzCloseCurrentFile(a1))
    return 15;
  v7 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, __size, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v7)
    return 2;
  v8 = v7;
  *a2 = CFRetain(v7);
  CFRelease(v8);
  return 0;
}

uint64_t eUICCFwReaderStart(ACFULogging *a1, uint64_t (*a2)(uint64_t, CFStringRef, ACFULogging *), uint64_t a3)
{
  ACFULogging *v6;
  const __CFAllocator *v7;
  CFStringRef v8;
  CFStringRef v9;
  char v10;
  uint64_t v11;
  ACFULogging *v12;
  _BYTE v14[136];
  char cStr[1024];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  v6 = (ACFULogging *)eUICCFwReaderOpen(a1);
  if (!v6)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    v11 = 4;
    goto LABEL_9;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    if (vinyl_unzGetCurrentFileInfo((uint64_t)v6, (uint64_t)v14, (uint64_t)cStr, 0x400uLL, 0, 0, 0, 0))
    {
      v11 = 15;
      goto LABEL_9;
    }
    if (cStr[0])
      break;
LABEL_7:
    if (vinyl_unzGoToNextFile(v6))
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
  }
  v8 = CFStringCreateWithCString(v7, cStr, 0x8000100u);
  if (v8)
  {
    v9 = v8;
    v10 = a2(a3, v8, v6);
    CFRelease(v9);
    if ((v10 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v11 = 3;
LABEL_9:
  v12 = (ACFULogging *)eUICCFwReaderClose(v6);
  ACFULogging::getLogInstance(v12);
  ACFULogging::handleMessage();
  return v11;
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

void sub_222D42EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

void sub_222D42F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
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
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>((uint64_t)(a2 + 2), v18);
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
    v33 = v29 - (_QWORD)*a2;
    v34 = v33 >> 2;
    if (v33 >> 2 <= (unint64_t)(v32 + 1))
      v34 = v32 + 1;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>((uint64_t)(a2 + 2), v35);
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
  v8 = (const void *)MEMORY[0x22767D484](&obj);
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
    v8 = (const void *)MEMORY[0x22767D484](&obj);
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

void sub_222D43BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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

void sub_222D43DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t BBUpdaterCommon::getEUICCChipID(BBUpdaterCommon *this)
{
  if (BBUpdaterCommon::getEUICCChipID(void)::sOnce != -1)
    dispatch_once(&BBUpdaterCommon::getEUICCChipID(void)::sOnce, &__block_literal_global_51);
  return BBUpdaterCommon::getEUICCChipID(void)::euiccChipID;
}

void sub_222D43E98(_Unwind_Exception *a1, uint64_t a2, ...)
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
    __cxa_atexit((void (*)(void *))ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef, &BBUpdaterCommon::BBUReadNVRAM(void)::nvramInfo, &dword_222D3F000);
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

void sub_222D43FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
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
  v0 = MEMORY[0x22767D76C](*MEMORY[0x24BDAD2F0], &v25);
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

void sub_222D44248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
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

void sub_222D44330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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

void sub_222D44544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
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

void sub_222D445DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
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

void sub_222D4467C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
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

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
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

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
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

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
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

void sub_222D44A58(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
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

void std::vector<char *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<char *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
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

void sub_222D44E08(_Unwind_Exception *a1)
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

void sub_222D44FDC(_Unwind_Exception *a1, uint64_t a2, ...)
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
    return dword_222D6F420[a1];
}

uint64_t eUICC::Perso::Perform(uint64_t a1, uint64_t a2, void (****a3)(std::string *__return_ptr))
{
  void *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  __int128 v18;

  pthread_mutex_lock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  v6 = off_2557754A0;
  if (!off_2557754A0)
  {
    v7 = operator new(0x38uLL);
    v7[4] = 0;
    v7[5] = 0;
    v7[6] = 0;
    v7[1] = 0;
    v7[2] = 0;
    *v7 = 0;
    std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(&v18, (uint64_t)v7);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&off_2557754A0, &v18);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v6 = off_2557754A0;
  }
  v11 = (std::__shared_weak_count *)off_2557754A8;
  if (off_2557754A8)
  {
    v12 = (unint64_t *)((char *)off_2557754A8 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  v14 = eUICC::Perso::PersoImplementation::Perform((uint64_t)v6, a1, a2, a3);
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v14;
}

void sub_222D45168(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::Perform(uint64_t a1, uint64_t a2, uint64_t a3, void (****a4)(std::string *__return_ptr))
{
  dispatch_queue_t v8;
  NSObject *v9;
  uint64_t v10;
  const void **v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  BBUpdaterCommon *NonceServer;
  uint64_t i;
  uint64_t v37;
  const void *v38;
  void *__p;
  void *v40;
  uint64_t v41;
  const void *v42;

  __p = 0;
  v40 = 0;
  v41 = 0;
  if (!*a4)
  {
    gBBULogMaskGet();
    v20 = "vinylValve";
LABEL_18:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)v20);
    v21 = 10;
    goto LABEL_22;
  }
  *(_QWORD *)(a1 + 24) = a2;
  v8 = dispatch_queue_create("PersoImpl", 0);
  v9 = *(NSObject **)a1;
  *(_QWORD *)a1 = v8;
  if (v9)
    dispatch_release(v9);
  v10 = *(unsigned __int8 *)(a2 + 39);
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(a2 + 24);
  if (!v10)
  {
    gBBULogMaskGet();
    v20 = "!performOptions.alderHostname.empty()";
    goto LABEL_18;
  }
  ReverseProxyGetSettings(a2 + 16, (uint64_t *)&v38);
  v11 = (const void **)(a1 + 8);
  if ((const void **)(a1 + 8) != &v38)
  {
    v42 = *v11;
    *v11 = v38;
    v38 = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v42);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v38);
  if (*v11)
    v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v12 = 0;
  if (!v12)
  {
    gBBULogMaskGet();
    v20 = "this->reverseProxySettings";
    goto LABEL_18;
  }
  if (eUICC::Perso::PersoImplementation::ForcePerso((BBUpdaterCommon *)a1, (uint64_t)&__p, a4))
  {
    gBBULogMaskGet();
    v16 = "kBBUReturnSuccess == ret";
LABEL_21:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)v16);
    v21 = 18;
    goto LABEL_22;
  }
  if (eUICC::Perso::PersoImplementation::InitPersoDevice((BBUpdaterCommon *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
    goto LABEL_20;
  }
  if (eUICC::Perso::PersoImplementation::InitPersoServer((_QWORD *)a1, (uint64_t)&__p, a3, a4)
    || __p == v40)
  {
    goto LABEL_29;
  }
  if (eUICC::Perso::PersoImplementation::AuthenticatePersoDevice((_QWORD *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
LABEL_20:
    gBBULogMaskGet();
    v16 = "kBBUReturnSuccess == ret && !dataBuffer.empty()";
    goto LABEL_21;
  }
  if (eUICC::Perso::PersoImplementation::GetWrapKeyServer(a1, (uint64_t)&__p) || __p == v40)
    goto LABEL_29;
  v21 = eUICC::Perso::PersoImplementation::FinalizePersoDevice((_QWORD *)a1, (uint64_t)&__p, a4);
  if ((_DWORD)v21)
  {
LABEL_38:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v31, v32, v33, (char)"kBBUReturnSuccess == ret");
    goto LABEL_22;
  }
  v34 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  v42 = v34;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v42);
  NonceServer = (BBUpdaterCommon *)eUICC::Perso::PersoImplementation::GetNonceServer((_QWORD *)a1, (uint64_t)&__p, (void (****)(_QWORD *__return_ptr))a4);
  if ((_DWORD)NonceServer
    || __p == v40
    || eUICC::Perso::PersoImplementation::CreateValidationBlob(NonceServer, (unint64_t *)&__p)
    || __p == v40
    || eUICC::Perso::PersoImplementation::ValidatePersoDevice((_QWORD *)a1, (uint64_t)&__p, a4)
    || __p == v40)
  {
LABEL_29:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"kBBUReturnSuccess == ret && !dataBuffer.empty()");
    v21 = 53;
    goto LABEL_22;
  }
  v21 = eUICC::Perso::PersoImplementation::SendReceiptServer((_QWORD *)a1, (uint64_t)&__p);
  if ((_DWORD)v21)
    goto LABEL_38;
  v37 = *(_QWORD *)(a1 + 32);
  for (i = *(_QWORD *)(a1 + 40);
        i != v37;
        std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](a1 + 48, i))
  {
    i -= 48;
  }
  v21 = 0;
  *(_QWORD *)(a1 + 40) = v37;
LABEL_22:
  v22 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  v42 = v22;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v42);
  *(_QWORD *)(a1 + 24) = 0;
  v23 = *(NSObject **)a1;
  *(_QWORD *)a1 = 0;
  if (v23)
    dispatch_release(v23);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "ret %d records %zu\n", v24, v25, v26, v21);
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  return v21;
}

void sub_222D45620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void eUICC::Perso::DumpTransactions(std::string *a1@<X8>)
{
  __int128 **v3;
  _QWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 v13;

  pthread_mutex_lock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  v3 = (__int128 **)off_2557754A0;
  if (!off_2557754A0)
  {
    v4 = operator new(0x38uLL);
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = 0;
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(&v13, (uint64_t)v4);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&off_2557754A0, &v13);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v3 = (__int128 **)off_2557754A0;
  }
  v8 = (std::__shared_weak_count *)off_2557754A8;
  if (off_2557754A8)
  {
    v9 = (unint64_t *)((char *)off_2557754A8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(a1, v3[4], v3[5], 0xAAAAAAAAAAAAAAABLL * (v3[5] - v3[4]));
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_222D45784(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance);
  _Unwind_Resume(a1);
}

std::string *eUICC::Perso::PersoImplementation::DumpTransactions@<X0>(__int128 **this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(a2, this[4], this[5], 0xAAAAAAAAAAAAAAABLL * (this[5] - this[4]));
}

_QWORD *eUICC::Perso::PersoImplementation::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v3;

  v3 = operator new(0x38uLL);
  v3[5] = 0;
  v3[6] = 0;
  v3[4] = 0;
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  return std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(a1, (uint64_t)v3);
}

uint64_t eUICC::Perso::PersoImplementation::ForcePerso(BBUpdaterCommon *a1, uint64_t a2, _QWORD *a3)
{
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
  char v28;
  char v29;
  char v30;
  void *__p;
  void *v32;
  uint64_t v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t ECID;
  _BYTE __ns[281];
  _DWORD __dst[73];

  *(_QWORD *)&__dst[71] = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*((_QWORD *)a1 + 3) + 40))
    return 0;
  v36 = 0;
  ECID = BBUpdaterCommon::getECID(a1);
  v34 = 0;
  v35 = 0;
  __p = 0;
  v32 = 0;
  v33 = 0;
  (*(void (**)(_DWORD *__return_ptr))(*(_QWORD *)*a3 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    goto LABEL_7;
  }
  if (!LOBYTE(__dst[1]))
  {
    if (DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v34))
    {
      gBBULogMaskGet();
LABEL_13:
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"DR_Success == derRet");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to encode ECID\n", v12, v13, v14, v28);
      v5 = 10;
      goto LABEL_14;
    }
    if (DEREncodeItemIntoVector(0x2000000000000010uLL, v35 - (_BYTE *)v34, v34, (unint64_t *)&__p))
    {
      gBBULogMaskGet();
      goto LABEL_13;
    }
    v5 = (*(uint64_t (**)(_QWORD, void **, uint64_t))(*(_QWORD *)*a3 + 56))(*a3, &__p, a2);
    if ((_DWORD)v5)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"kBBUReturnSuccess == ret");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete InitPerso command\n", v19, v20, v21, v29);
      goto LABEL_14;
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)*a3 + 16))(*a3, 0, 1);
    *(_QWORD *)__ns = 10000000000;
    std::this_thread::sleep_for ((const std::chrono::nanoseconds *)__ns);
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)*a3 + 8))(__ns);
    memcpy(__dst, __ns, 0x119uLL);
    if (__dst[0] == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
    {
      if (LOBYTE(__dst[1]))
        goto LABEL_4;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v22, v23, v24, (char)"cardData.contents.perso");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Still persod after force?\n", v25, v26, v27, v30);
LABEL_8:
      v5 = 18;
      goto LABEL_14;
    }
    gBBULogMaskGet();
LABEL_7:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"cardData.Valid()");
    goto LABEL_8;
  }
LABEL_4:
  v5 = 0;
LABEL_14:
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
  return v5;
}

void sub_222D45B60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::InitPersoDevice(BBUpdaterCommon *a1, uint64_t a2, _QWORD *a3)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  void *__p;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  void *v35;
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;
  const void *v41;
  uint64_t ECID;

  v41 = 0;
  ECID = BBUpdaterCommon::getECID(a1);
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  if (DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v38))
  {
    gBBULogMaskGet();
LABEL_5:
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"DR_Success == derRet");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to encode ECID\n", v9, v10, v11, v23);
    v12 = 10;
    goto LABEL_6;
  }
  if (DEREncodeItemIntoVector(0x2000000000000010uLL, v39 - v38, v38, (unint64_t *)&v35))
  {
    gBBULogMaskGet();
    goto LABEL_5;
  }
  v32 = 0;
  v33 = operator new(0x19uLL);
  v34 = xmmword_222D6F490;
  strcpy((char *)v33, "InitPersoDeviceBlob.bin");
  __p = 0;
  v31 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v35, (uint64_t)v36, v36 - (_BYTE *)v35);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v33, (uint64_t)&__p);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v34) < 0)
    operator delete(v33);
  v12 = (*(uint64_t (**)(_QWORD, void **, uint64_t))(*(_QWORD *)*a3 + 56))(*a3, &v35, a2);
  if ((_DWORD)v12)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete InitPerso command\n", v20, v21, v22, v24);
  }
  else
  {
    v27 = 0;
    v28 = operator new(0x20uLL);
    v29 = xmmword_222D6F4A0;
    strcpy((char *)v28, "InitPersoDeviceResponse.bin");
    v25 = 0;
    v26 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v25, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v28, (uint64_t)&v25);
    if (v25)
    {
      v26 = v25;
      operator delete(v25);
    }
    if (SHIBYTE(v29) < 0)
      operator delete(v28);
    v12 = 0;
  }
LABEL_6:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "InitPersoDevice %d\n", v13, v14, v15, v12);
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(&v41);
  return v12;
}

void sub_222D45E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;
  void *v32;
  void *v33;

  if (__p)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  v32 = *(void **)(v30 - 96);
  if (v32)
  {
    *(_QWORD *)(v30 - 88) = v32;
    operator delete(v32);
  }
  v33 = *(void **)(v30 - 72);
  if (v33)
  {
    *(_QWORD *)(v30 - 64) = v33;
    operator delete(v33);
  }
  ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef((const void **)(v30 - 48));
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::InitPersoServer(_QWORD *a1, uint64_t a2, uint64_t a3, void (****a4)(std::string *__return_ptr))
{
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  const __CFString *v34;
  uint64_t (*v35)(uint64_t);
  uint64_t (*v36)(uint64_t);
  __int128 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  char CStringPtr;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  __int128 v56;
  const void *v57;
  const void *v58;
  void *v59;
  __int128 v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __int128 v65;
  std::string v66;
  void *v67;
  void *v68;
  _BYTE *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _BYTE *v73;
  uint64_t v74;
  const void *v75;
  __int128 v76;
  CFDictionaryRef theDict;
  void *v78;
  void *v79;
  void *values[4];
  _BYTE v81[32];
  std::string __p[11];
  char v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  theDict = 0;
  v75 = 0;
  v76 = 0uLL;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v69 = 0;
  v70 = 0;
  v68 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v68, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  memset(v81, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v81, v68, (uint64_t)v69, v69 - (_BYTE *)v68);
  v78 = 0;
  memset(__p, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(__p, *(const void **)v81, *(uint64_t *)&v81[8], *(_QWORD *)&v81[8] - *(_QWORD *)v81);
  v79 = 0;
  if (ctu::cf::convert_copy())
  {
    v8 = v78;
    v78 = v79;
    values[0] = v8;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)values);
  }
  if (__p[0].__r_.__value_.__r.__words[0])
  {
    __p[0].__r_.__value_.__l.__size_ = __p[0].__r_.__value_.__r.__words[0];
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  v71 = v78;
  v78 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v78);
  if (*(_QWORD *)v81)
  {
    *(_QWORD *)&v81[8] = *(_QWORD *)v81;
    operator delete(*(void **)v81);
  }
  if (v68)
  {
    v69 = v68;
    operator delete(v68);
  }
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v66, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v66 = *(std::string *)a3;
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)v81, v66.__r_.__value_.__l.__data_, v66.__r_.__value_.__l.__size_);
  else
    *(std::string *)v81 = v66;
  v78 = 0;
  if ((v81[23] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(__p, *(const std::string::value_type **)v81, *(std::string::size_type *)&v81[8]);
  else
    __p[0] = *(std::string *)v81;
  v79 = 0;
  if (ctu::cf::convert_copy())
  {
    v9 = v78;
    v78 = v79;
    values[0] = v9;
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)values);
  }
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  v67 = v78;
  v78 = 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v78);
  if ((v81[23] & 0x80000000) != 0)
    operator delete(*(void **)v81);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  (***a4)(__p);
  if (LODWORD(__p[0].__r_.__value_.__l.__data_) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"hwType.Valid()");
    v15 = 0;
LABEL_32:
    v11 = 18;
    goto LABEL_33;
  }
  *(_OWORD *)v81 = xmmword_24EB7A338;
  *(_OWORD *)&v81[16] = *(_OWORD *)&off_24EB7A348;
  values[0] = CFSTR("StartSession");
  values[1] = v71;
  v10 = CFSTR("0");
  if (v83)
    v10 = CFSTR("2");
  values[2] = v67;
  values[3] = (void *)v10;
  v11 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)v81, (const void **)values, 4);
  if ((_DWORD)v11)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"kBBUReturnSuccess == ret");
    v15 = 0;
    goto LABEL_33;
  }
  v63 = 0;
  v64 = operator new(0x20uLL);
  v65 = xmmword_222D6F4B0;
  strcpy((char *)v64, "InitPersoServerRequest.plist");
  v61 = 0;
  v62 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v61, v72, (uint64_t)v73, v73 - (_BYTE *)v72);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v64, (uint64_t)&v61);
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  if (SHIBYTE(v65) < 0)
    operator delete(v64);
  eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&v72, (uint64_t)v81);
  v15 = *(std::__shared_weak_count **)&v81[8];
  v25 = *(_QWORD *)v81;
  v76 = *(_OWORD *)v81;
  if (!*(_QWORD *)v81)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v29, v30, v31, (char)"response");
LABEL_66:
    v11 = 53;
    goto LABEL_33;
  }
  v59 = operator new(0x20uLL);
  v60 = xmmword_222D6F4C0;
  strcpy((char *)v59, "InitPersoServerResponse.plist");
  (*(void (**)(const void **__return_ptr, uint64_t))(*(_QWORD *)v25 + 40))(&v58, v25);
  eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (__int128 *)&v59, (CFDataRef *)&v58);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v58);
  if (SHIBYTE(v60) < 0)
    operator delete(v59);
  (*(void (**)(const void **__return_ptr, uint64_t))(*(_QWORD *)v25 + 40))(&v57, v25);
  v11 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v57, &theDict);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v57);
  if ((_DWORD)v11)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v26, v27, v28, (char)"kBBUReturnSuccess == ret");
    goto LABEL_33;
  }
  v32 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!theDict)
    v32 = 0;
  if (!v32)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v49, v50, v51, (char)"respDict");
    goto LABEL_32;
  }
  values[0] = (void *)CFDictionaryGetValue(theDict, CFSTR("SessionId"));
  ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(v81, (CFTypeRef *)values);
  v33 = a1[2];
  a1[2] = *(_QWORD *)v81;
  *(_QWORD *)v81 = v33;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)v81);
  v34 = (const __CFString *)a1[2];
  v35 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v34)
    v35 = 0;
  if (!v35 || !CFStringGetLength(v34))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v40, v41, v42, (char)"this->serverSessionID && CFStringGetLength( this->serverSessionID.get()) != 0");
    gBBULogMaskGet();
    v43 = CFCopyDescription(theDict);
    CStringPtr = CFStringGetCStringPtr(v43, 0x8000100u);
    v48 = "Missing or empty server sssion?! %s\n";
LABEL_65:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v48, v45, v46, v47, CStringPtr);
    goto LABEL_66;
  }
  *(_QWORD *)v81 = CFDictionaryGetValue(theDict, CFSTR("DATA"));
  ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(&v75, (CFTypeRef *)v81);
  v36 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v75)
    v36 = 0;
  if (!v36)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v52, v53, v54, (char)"respDataPayload");
    gBBULogMaskGet();
    v55 = CFCopyDescription(theDict);
    CStringPtr = CFStringGetCStringPtr(v55, 0x8000100u);
    v48 = "Couldn't get response payload %s\n";
    goto LABEL_65;
  }
  memset(v81, 0, 24);
  ctu::cf::assign();
  v37 = *(_OWORD *)v81;
  v38 = *(_QWORD *)&v81[16];
  v39 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v39;
    v56 = v37;
    operator delete(v39);
    v37 = v56;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  v11 = 0;
  *(_OWORD *)a2 = v37;
  *(_QWORD *)(a2 + 16) = v38;
LABEL_33:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "InitPersoServer %d\n", v19, v20, v21, v11);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v67);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v71);
  if (v72)
  {
    v73 = v72;
    operator delete(v72);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v75);
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  return v11;
}

void sub_222D46698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,const void *a31,void *a32,uint64_t a33,uint64_t a34,const void *a35,void *a36,uint64_t a37,uint64_t a38,const void *a39,__int16 a40,uint64_t a41,const void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50)
{
  if (__p)
  {
    a50 = (uint64_t)__p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a31);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a35);
  if (a36)
  {
    a37 = (uint64_t)a36;
    operator delete(a36);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a39);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a40);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a42);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::AuthenticatePersoDevice(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
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
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  void *__p;
  void *v24;
  uint64_t v25;
  char *v26;
  __int128 v27;

  v26 = (char *)operator new(0x28uLL);
  v27 = xmmword_222D6F4D0;
  strcpy(v26, "AuthenticatePersoDeviceRequest.bin");
  v24 = 0;
  v25 = 0;
  __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v26, (uint64_t)&__p);
  if (__p)
  {
    v24 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v27) < 0)
    operator delete(v26);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*a3 + 64))(*a3, a2, a2);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete AuthPerso command\n", v10, v11, v12, v17);
  }
  else
  {
    v20 = 0;
    v21 = operator new(0x28uLL);
    v22 = xmmword_222D6F4E0;
    strcpy((char *)v21, "AuthenticatePersoDeviceResponse.bin");
    v18 = 0;
    v19 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v18, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v21, (uint64_t)&v18);
    if (v18)
    {
      v19 = v18;
      operator delete(v18);
    }
    if (SHIBYTE(v22) < 0)
      operator delete(v21);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "AuthenticatePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_222D469F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23)
{
  if (__p)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::GetWrapKeyServer(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void **v17;
  const void *v18;
  uint64_t (*v19)(uint64_t);
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  char CStringPtr;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  const void *v38;
  const void *v39;
  void *v40;
  __int128 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  void *__p;
  _BYTE *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _BYTE *v52;
  uint64_t v53;
  const void *v54;
  __int128 v55;
  __CFError *v56;
  void *v57;
  __int128 v58;
  uint64_t v59;
  CFTypeRef Value;
  void *values[3];
  __int128 keys;
  const __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v56 = 0;
  v54 = 0;
  v55 = 0uLL;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v48 = 0;
  v49 = 0;
  __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  v63 = 0;
  keys = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&keys, __p, (uint64_t)v48, v48 - (_BYTE *)__p);
  v57 = 0;
  v58 = 0uLL;
  v59 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v58, (const void *)keys, *((uint64_t *)&keys + 1), *((_QWORD *)&keys + 1) - keys);
  Value = 0;
  if (ctu::cf::convert_copy())
  {
    v4 = v57;
    v57 = (void *)Value;
    values[0] = v4;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)values);
  }
  if ((_QWORD)v58)
  {
    *((_QWORD *)&v58 + 1) = v58;
    operator delete((void *)v58);
  }
  v50 = v57;
  v57 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v57);
  if ((_QWORD)keys)
  {
    *((_QWORD *)&keys + 1) = keys;
    operator delete((void *)keys);
  }
  if (__p)
  {
    v48 = __p;
    operator delete(__p);
  }
  keys = xmmword_24EB7A368;
  v63 = CFSTR("SessionId");
  values[0] = CFSTR("GetWrapKey");
  values[1] = v50;
  values[2] = *(void **)(a1 + 16);
  v5 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)&keys, (const void **)values, 3);
  if ((_DWORD)v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"kBBUReturnSuccess == ret");
    v9 = 0;
    goto LABEL_28;
  }
  v44 = 0;
  v45 = operator new(0x20uLL);
  v46 = xmmword_222D6F4C0;
  strcpy((char *)v45, "GetWrapKeyServerRequest.plist");
  v42 = 0;
  v43 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v42, v51, (uint64_t)v52, v52 - (_BYTE *)v51);
  eUICC::Perso::PersoImplementation::logTransactionData((_QWORD *)a1, (__int128 *)&v45, (uint64_t)&v42);
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (SHIBYTE(v46) < 0)
    operator delete(v45);
  eUICC::Perso::PersoImplementation::PostDataSync(a1, (uint64_t)&v51, (uint64_t)&v58);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v58 + 1);
  v10 = v58;
  v55 = v58;
  if (!(_QWORD)v58)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v14, v15, v16, (char)"response");
LABEL_21:
    v5 = 53;
    goto LABEL_28;
  }
  v40 = operator new(0x20uLL);
  v41 = xmmword_222D6F4F0;
  strcpy((char *)v40, "GetWrapKeyServerResponse.plist");
  (*(void (**)(const void **__return_ptr, uint64_t))(*(_QWORD *)v10 + 40))(&v39, v10);
  eUICC::Perso::PersoImplementation::logTransactionCFData((_QWORD *)a1, (__int128 *)&v40, (CFDataRef *)&v39);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v39);
  if (SHIBYTE(v41) < 0)
    operator delete(v40);
  (*(void (**)(const void **__return_ptr, uint64_t))(*(_QWORD *)v10 + 40))(&v38, v10);
  v5 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v38, &v56);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v38);
  if ((_DWORD)v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kBBUReturnSuccess == ret");
    goto LABEL_28;
  }
  Value = CFDictionaryGetValue(v56, CFSTR("DATA"));
  v17 = (const void **)ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v58, &Value);
  v18 = v54;
  v54 = (const void *)v58;
  *(_QWORD *)&v58 = v18;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v17);
  v19 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v54)
    v19 = 0;
  if (!v19)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v29, v30, v31, (char)"respDataPayload");
    gBBULogMaskGet();
    v32 = CFCopyDescription(v56);
    CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Couldn't get response payload %s\n", v34, v35, v36, CStringPtr);
    goto LABEL_21;
  }
  v58 = 0uLL;
  v59 = 0;
  ctu::cf::assign();
  v20 = v58;
  v21 = v59;
  v22 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v22;
    v37 = v20;
    operator delete(v22);
    v20 = v37;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  v5 = 0;
  *(_OWORD *)a2 = v20;
  *(_QWORD *)(a2 + 16) = v21;
LABEL_28:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "GetWrapKeyServer %d\n", v23, v24, v25, v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v50);
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v54);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v56);
  return v5;
}

void sub_222D46F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,uint64_t a38,const void *a39,void *__p,uint64_t a41)
{
  uint64_t v41;
  void *v43;

  v43 = *(void **)(v41 - 144);
  if (v43)
  {
    *(_QWORD *)(v41 - 136) = v43;
    operator delete(v43);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a39);
  if (__p)
  {
    a41 = (uint64_t)__p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v41 - 184));
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v41 - 176);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v41 - 160));
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::FinalizePersoDevice(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
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
  char v17;
  void *__p;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;

  v20 = 0;
  v21 = operator new(0x20uLL);
  v22 = xmmword_222D6F4F0;
  strcpy((char *)v21, "FinalizePersoDeviceRequest.bin");
  __p = 0;
  v19 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v21, (uint64_t)&__p);
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v22) < 0)
    operator delete(v21);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*a3 + 72))(*a3, a2);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete FinalizePerso command\n", v10, v11, v12, v17);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "FinalizePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_222D471E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::GetNonceServer(_QWORD *a1, uint64_t a2, void (****a3)(_QWORD *__return_ptr))
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const void **v27;
  void *v28;
  const __CFString *v29;
  uint64_t (*v30)(uint64_t);
  uint64_t (*v31)(uint64_t);
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  char CStringPtr;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  __int128 v48;
  const void *v49;
  const void *v50;
  void *v51;
  __int128 v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  void *__p;
  _BYTE *v59;
  uint64_t v60;
  const void *v61;
  void *v62;
  void *v63;
  CFDictionaryRef theDict;
  void *values[2];
  _QWORD v66[34];
  char v67;
  void *keys[2];
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v63 = 0;
  theDict = 0;
  v61 = 0;
  v62 = 0;
  __p = 0;
  v59 = 0;
  v60 = 0;
  (***a3)(v66);
  if (LODWORD(v66[0]) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"hwType.Valid()");
    v10 = 0;
    v6 = 18;
    goto LABEL_8;
  }
  *(_OWORD *)keys = xmmword_24EB7A358;
  if (v67)
    v5 = CFSTR("2");
  else
    v5 = CFSTR("0");
  values[0] = CFSTR("GetNonce");
  values[1] = (void *)v5;
  v6 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)keys, (const void **)values, 2);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    v10 = 0;
    goto LABEL_8;
  }
  v55 = 0;
  v56 = operator new(0x20uLL);
  v57 = xmmword_222D6F4A0;
  strcpy((char *)v56, "GetNonceServerRequest.plist");
  v53 = 0;
  v54 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v53, __p, (uint64_t)v59, v59 - (_BYTE *)__p);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v56, (uint64_t)&v53);
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (SHIBYTE(v57) < 0)
    operator delete(v56);
  eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&__p, (uint64_t)keys);
  v20 = keys[0];
  v10 = (std::__shared_weak_count *)keys[1];
  v62 = keys[0];
  v63 = keys[1];
  if (!keys[0])
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"response");
LABEL_38:
    v6 = 53;
    goto LABEL_8;
  }
  v51 = operator new(0x20uLL);
  v52 = xmmword_222D6F4B0;
  strcpy((char *)v51, "GetNonceServerResponse.plist");
  (*(void (**)(const void **__return_ptr, void *))(*(_QWORD *)v20 + 40))(&v50, v20);
  eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (__int128 *)&v51, (CFDataRef *)&v50);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v50);
  if (SHIBYTE(v52) < 0)
    operator delete(v51);
  (*(void (**)(const void **__return_ptr, void *))(*(_QWORD *)v20 + 40))(&v49, v20);
  v6 = eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData((uint64_t *)&v49, &theDict);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v49);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"kBBUReturnSuccess == ret");
    goto LABEL_8;
  }
  values[0] = (void *)CFDictionaryGetValue(theDict, CFSTR("SessionId"));
  v27 = (const void **)ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(keys, (CFTypeRef *)values);
  v28 = (void *)a1[2];
  a1[2] = keys[0];
  keys[0] = v28;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(v27);
  v29 = (const __CFString *)a1[2];
  v30 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v29)
    v30 = 0;
  if (!v30 || !CFStringGetLength(v29))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v35, v36, v37, (char)"this->serverSessionID && CFStringGetLength( this->serverSessionID.get()) != 0");
    gBBULogMaskGet();
    v38 = CFCopyDescription(theDict);
    CStringPtr = CFStringGetCStringPtr(v38, 0x8000100u);
    v43 = "Missing or empty server sssion?! %s\n";
LABEL_37:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v43, v40, v41, v42, CStringPtr);
    goto LABEL_38;
  }
  keys[0] = (void *)CFDictionaryGetValue(theDict, CFSTR("DATA"));
  ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(&v61, (CFTypeRef *)keys);
  v31 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v61)
    v31 = 0;
  if (!v31)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"respDataPayload");
    gBBULogMaskGet();
    v47 = CFCopyDescription(theDict);
    CStringPtr = CFStringGetCStringPtr(v47, 0x8000100u);
    v43 = "Couldn't get response payload %s\n";
    goto LABEL_37;
  }
  keys[0] = 0;
  keys[1] = 0;
  v69 = 0;
  ctu::cf::assign();
  v32 = *(_OWORD *)keys;
  v33 = v69;
  v34 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v34;
    v48 = v32;
    operator delete(v34);
    v32 = v48;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  v6 = 0;
  *(_OWORD *)a2 = v32;
  *(_QWORD *)(a2 + 16) = v33;
LABEL_8:
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "GetNonceServer %d\n", v14, v15, v16, v6);
  if (__p)
  {
    v59 = __p;
    operator delete(__p);
  }
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v61);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&theDict);
  return v6;
}

void sub_222D47784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *__p,uint64_t a36,uint64_t a37,const void *a38,__int16 a39,char a40,char a41,uint64_t a42,const void *a43)
{
  uint64_t v43;
  void *v45;

  v45 = *(void **)(v43 - 80);
  if (v45)
  {
    *(_QWORD *)(v43 - 72) = v45;
    operator delete(v45);
  }
  if (__p)
    operator delete(__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a38);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a39);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a43);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::CreateValidationBlob(BBUpdaterCommon *a1, unint64_t *a2)
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  unint64_t v13[3];
  void *__p;
  _BYTE *v15;
  uint64_t v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  uint64_t v25;
  void *v26;
  _BYTE *v27;
  uint64_t v28;
  void *v29;
  _BYTE *v30;
  uint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];
  int v40;
  char v41;
  uint64_t ECID;
  _QWORD v43[3];
  _BYTE v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  ECID = BBUpdaterCommon::getECID(a1);
  v41 = 4;
  v40 = 17433507;
  v43[0] = 0;
  v43[2] = 512;
  *(_OWORD *)&v44[8] = 0u;
  v43[1] = 12;
  *(_OWORD *)v44 = xmmword_222D6F500;
  *(_WORD *)&v44[16] = 512;
  v39[0] = v43;
  v39[1] = 2;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  __p = 0;
  v15 = 0;
  v16 = 0;
  v3 = a2[1] - *a2;
  v12[0] = *a2;
  v12[1] = v3;
  v4 = DERDecodeItem((uint64_t)v12, v13);
  if (v4)
    goto LABEL_14;
  v4 = DEREncodeItemIntoVector(0xCuLL, 6uLL, "kNonce", (unint64_t *)&v23);
  if (v4)
    goto LABEL_14;
  v37[0] = v23;
  v37[1] = v24 - (_BYTE *)v23;
  v37[2] = v13[1];
  v37[3] = v13[2];
  v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v37, (uint64_t)v39, (unint64_t *)&v29);
  if (v4)
    goto LABEL_14;
  v4 = DEREncodeItemIntoVector(0xCuLL, 0x11uLL, "kDeviceIdentifier", (unint64_t *)&v32);
  if (v4)
    goto LABEL_14;
  v4 = DEREncodeItemIntoVector(4uLL, 8uLL, &ECID, (unint64_t *)&v26);
  if (v4)
    goto LABEL_14;
  v38[0] = v32;
  v38[1] = v33 - (_BYTE *)v32;
  v38[2] = v26;
  v38[3] = v27 - (_BYTE *)v26;
  v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v38, (uint64_t)v39, (unint64_t *)&v20);
  if (v4)
    goto LABEL_14;
  v36[0] = v20;
  v36[1] = v21 - (_BYTE *)v20;
  v36[2] = v29;
  v36[3] = v30 - (_BYTE *)v29;
  v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v36, (uint64_t)v39, (unint64_t *)&v17);
  if (v4
    || (v4 = DEREncodeItemIntoVector(0xA000000000000005, v18 - (_BYTE *)v17, v17, (unint64_t *)&__p)) != 0
    || (v35[0] = &v40,
        v35[1] = 5,
        v35[2] = __p,
        v35[3] = v15 - (_BYTE *)__p,
        (v4 = DEREncodeSequenceIntoVector(0x2000000000000010, (unint64_t)v35, (uint64_t)v39, a2)) != 0))
  {
LABEL_14:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"DR_Success == ret");
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "CreateValidationBlob DR %d\n", v8, v9, v10, v4);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
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
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }
  if (v4)
    return 11;
  else
    return 0;
}

void sub_222D47D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  if (__p)
    operator delete(__p);
  if (a21)
    operator delete(a21);
  if (a24)
    operator delete(a24);
  if (a27)
    operator delete(a27);
  if (a30)
    operator delete(a30);
  if (a33)
    operator delete(a33);
  if (a36)
    operator delete(a36);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::ValidatePersoDevice(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
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
  char v17;
  void *__p;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;

  v20 = 0;
  v21 = operator new(0x20uLL);
  v22 = xmmword_222D6F4F0;
  strcpy((char *)v21, "ValidatePersoDeviceRequest.bin");
  __p = 0;
  v19 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v21, (uint64_t)&__p);
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v22) < 0)
    operator delete(v21);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*a3 + 80))(*a3, a2, a2);
  if ((_DWORD)v6)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"kBBUReturnSuccess == ret");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to complete ValidatePerso command\n", v10, v11, v12, v17);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "ValidatePersoDevice %d\n", v13, v14, v15, v6);
  return v6;
}

void sub_222D47F60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::SendReceiptServer(_QWORD *a1, uint64_t a2)
{
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  const void *v21;
  void *v22;
  __int128 v23;
  const void *v24;
  std::__shared_weak_count *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  void *__p;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  void *v35;
  _BYTE *v36;
  uint64_t v37;
  const void *v38;
  std::__shared_weak_count *v39;
  const void *v40;
  const void *v41;
  void *values;
  _BYTE *v43;
  uint64_t v44;
  void *keys[2];
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v32 = 0;
  v33 = 0;
  __p = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  v43 = 0;
  v44 = 0;
  values = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&values, __p, (uint64_t)v32, v32 - (_BYTE *)__p);
  v40 = 0;
  keys[0] = 0;
  keys[1] = 0;
  v46 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(keys, values, (uint64_t)v43, v43 - (_BYTE *)values);
  v41 = 0;
  if (ctu::cf::convert_copy())
  {
    v4 = v40;
    v40 = v41;
    v24 = v4;
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v24);
  }
  if (keys[0])
  {
    keys[1] = keys[0];
    operator delete(keys[0]);
  }
  v34 = v40;
  v40 = 0;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v40);
  if (values)
  {
    v43 = values;
    operator delete(values);
  }
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  *(_OWORD *)keys = xmmword_24EB7A368;
  v46 = CFSTR("SessionId");
  values = CFSTR("SendReceipt");
  v43 = v34;
  v44 = a1[2];
  v5 = eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData((const void **)keys, (const void **)&values, 3);
  if ((_DWORD)v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"kBBUReturnSuccess == ret");
    v9 = 0;
  }
  else
  {
    v10 = operator new(0x20uLL);
    v28 = 0;
    v29 = v10;
    v30 = xmmword_222D6F4F0;
    strcpy((char *)v10, "SendReceiptServerRequest.plist");
    v26 = 0;
    v27 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v26, v35, (uint64_t)v36, v36 - (_BYTE *)v35);
    eUICC::Perso::PersoImplementation::logTransactionData(a1, (__int128 *)&v29, (uint64_t)&v26);
    if (v26)
    {
      v27 = v26;
      operator delete(v26);
    }
    if (SHIBYTE(v30) < 0)
      operator delete(v29);
    eUICC::Perso::PersoImplementation::PostDataSync((uint64_t)a1, (uint64_t)&v35, (uint64_t)&v24);
    v11 = v24;
    v9 = v25;
    v38 = v24;
    v39 = v25;
    if (v24)
    {
      v22 = operator new(0x20uLL);
      v23 = xmmword_222D6F510;
      strcpy((char *)v22, "SendReceiptServerResponse.plist");
      (*(void (**)(const void **__return_ptr, const void *))(*(_QWORD *)v11 + 40))(&v21, v11);
      eUICC::Perso::PersoImplementation::logTransactionCFData(a1, (__int128 *)&v22, (CFDataRef *)&v21);
      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v21);
      if (SHIBYTE(v23) < 0)
        operator delete(v22);
      v5 = 0;
      *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"response");
      v5 = 53;
    }
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "SendReceiptServer %d\n", v15, v16, v17, v5);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v34);
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v5;
}

void sub_222D48320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,uint64_t a33,const void *a34,void *a35,uint64_t a36)
{
  uint64_t v36;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a13);
  if (a19 < 0)
    operator delete(__p);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a34);
  if (a35)
  {
    a36 = (uint64_t)a35;
    operator delete(a35);
  }
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v36 - 136);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Perso::PersoImplementation::logTransactionData(_QWORD *a1, __int128 *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t result;

  v4 = a1[5];
  if (v4 >= a1[6])
  {
    result = std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(a1 + 4, a2, a3);
  }
  else
  {
    std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>((std::string *)a1[5], a2, a3);
    result = v4 + 48;
    a1[5] = v4 + 48;
  }
  a1[5] = result;
  return result;
}

void sub_222D48444(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 40) = v2;
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t eUICC::Perso::PersoImplementation::SerializeKeyValuePairsIntoPlistData(const void **keys, const void **values, CFIndex numValues)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  uint64_t (*v5)(uint64_t);
  CFDataRef Data;
  CFDataRef v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  int v21;
  char v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFErrorRef *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  void *__p;
  char v34;
  CFErrorRef error[2];
  char v36;
  uint64_t v37;
  CFDataRef v38;
  uint64_t v39;

  v38 = 0;
  v39 = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], keys, values, numValues, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v37 = (uint64_t)v4;
  v5 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v4)
    v5 = 0;
  if (!v5)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"inDict");
    gBBULogMaskGet();
    v16 = "Failed to create dictionary\n";
LABEL_17:
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", v16, v13, v14, v15, v32);
LABEL_18:
    v9 = 11;
    goto LABEL_19;
  }
  error[0] = 0;
  error[1] = (CFErrorRef)&v39;
  Data = CFPropertyListCreateData(v3, v4, kCFPropertyListXMLFormat_v1_0, 0, error);
  v7 = v38;
  v38 = Data;
  __p = v7;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&__p);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  v8 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v38)
    v8 = 0;
  if (!v8)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"outData");
    gBBULogMaskGet();
    ctu::cf::show((ctu::cf *)1, v37, v20);
    v21 = v36;
    v22 = (char)error[0];
    ctu::cf::show((ctu::cf *)1, v39, v23);
    v27 = error;
    if (v21 < 0)
      LOBYTE(v27) = v22;
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to serialize dictionary %s error %s\n", v24, v25, v26, (char)v27);
    if (v34 < 0)
      operator delete(__p);
    if (v36 < 0)
      operator delete(error[0]);
    goto LABEL_18;
  }
  if ((ctu::cf::assign() & 1) == 0)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"success");
    gBBULogMaskGet();
    v16 = "Failed to assign output data\n";
    goto LABEL_17;
  }
  v9 = 0;
LABEL_19:
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v37);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v38);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v39);
  return v9;
}

void sub_222D486D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v25 - 56));
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)(v25 - 48));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v25 - 40));
  _Unwind_Resume(a1);
}

uint64_t *eUICC::Perso::PersoImplementation::PostDataSync@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t v22;
  CFTypeRef cf;
  void *__p[2];
  uint64_t v26;
  const void *v27[3];
  void *aBlock[2];
  uint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  char *v33;

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
  *(_QWORD *)v6 = off_24EB7A408;
  *((_QWORD *)v6 + 1) = 0;
  v32 = (unint64_t *)v6;
  v33 = v6;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v6);
  aBlock[1] = 0;
  v29 = 0;
  v27[2] = 0;
  aBlock[0] = &aBlock[1];
  v27[1] = 0;
  ctu::Http::HttpRequest::create();
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,ctu::Http::case_insensitive_key_comparer,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)aBlock, (_QWORD *)aBlock[1]);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v30 + 8))(v30, *(_QWORD *)a1);
  v7 = v30;
  dispatch::future_callback_impl<std::shared_ptr<ctu::Http::HttpResponse>,std::shared_ptr<ctu::Http::HttpResponse>>(&v32, aBlock);
  (*(void (**)(uint64_t, void *))(*(_QWORD *)v7 + 16))(v7, aBlock[0]);
  if (aBlock[0])
    _Block_release(aBlock[0]);
  (*(void (**)(uint64_t, double))(*(_QWORD *)v30 + 96))(v30, 60.0);
  v8 = v30;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(v27, (const void **)(a1 + 8));
  (*(void (**)(uint64_t, const void **))(*(_QWORD *)v8 + 88))(v8, v27);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v27);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v30 + 56))(v30, a2);
  __p[1] = 0;
  v26 = 0;
  __p[0] = 0;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v30 + 40))(v30, __p);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get((uint64_t *)&v32, aBlock);
  if ((*(unsigned int (**)(void *))(*(_QWORD *)aBlock[0] + 16))(aBlock[0]) == 1
    && (*(unsigned int (**)(void *))(*(_QWORD *)aBlock[0] + 24))(aBlock[0]) == 200)
  {
    *(_OWORD *)a3 = *(_OWORD *)aBlock;
  }
  else
  {
    gBBULogMaskGet();
    v9 = (*(uint64_t (**)(void *))(*(_QWORD *)aBlock[0] + 16))(aBlock[0]);
    (*(void (**)(void *))(*(_QWORD *)aBlock[0] + 24))(aBlock[0]);
    (*(void (**)(void *))(*(_QWORD *)aBlock[0] + 32))(aBlock[0]);
    (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)aBlock[0] + 72))(&cf);
    v10 = CFCopyDescription(cf);
    CFStringGetCStringPtr(v10, 0x8000100u);
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "result %d code %d raw_error %ld error %s\n", v11, v12, v13, v9);
    ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&cf);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v14 = (std::__shared_weak_count *)aBlock[1];
    if (aBlock[1])
    {
      v15 = (unint64_t *)((char *)aBlock[1] + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  v17 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v32;
  if (v32)
  {
    v21 = v32 + 1;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
      (*(void (**)(unint64_t *))(*v20 + 16))(v20);
  }
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v33);
}

void sub_222D48A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *aBlock,uint64_t a28)
{
  uint64_t v28;
  unint64_t *v30;
  unint64_t *v31;
  unint64_t v32;

  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&aBlock);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](v28 - 64);
  v30 = *(unint64_t **)(v28 - 48);
  if (v30)
  {
    v31 = v30 + 1;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
      (*(void (**)(unint64_t *))(*v30 + 16))(v30);
  }
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)(v28 - 40));
  _Unwind_Resume(a1);
}

void eUICC::Perso::PersoImplementation::logTransactionCFData(_QWORD *a1, __int128 *a2, CFDataRef *a3)
{
  uint64_t (*v4)(uint64_t);
  const UInt8 *BytePtr;
  size_t Length;
  unint64_t v9;
  uint64_t v10;
  void *__p;
  void *v12;
  uint64_t v13;

  v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!*a3)
    v4 = 0;
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(*a3);
    Length = CFDataGetLength(*a3);
    v12 = 0;
    v13 = 0;
    __p = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, BytePtr, (uint64_t)&BytePtr[Length], Length);
    v9 = a1[5];
    if (v9 >= a1[6])
    {
      v10 = std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(a1 + 4, a2, (uint64_t)&__p);
    }
    else
    {
      std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>((std::string *)a1[5], a2, (uint64_t)&__p);
      v10 = v9 + 48;
      a1[5] = v9 + 48;
    }
    a1[5] = v10;
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
  }
}

void sub_222D48C2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Perso::PersoImplementation::CreateDictionaryFromPlistData(uint64_t *a1, __CFError **a2)
{
  const __CFData *v3;
  uint64_t (*v4)(uint64_t);
  const __CFAllocator *v6;
  CFPropertyListRef v7;
  void *v8;
  uint64_t (*v9)(uint64_t);
  CFTypeID v10;
  __CFError *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  int v23;
  char v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFErrorRef *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFErrorRef *v37;
  char v39;
  void *__p[2];
  char v41;
  CFErrorRef error[2];
  char v43;
  void *v44;
  ctu::cf *v45;

  v44 = 0;
  v45 = 0;
  v3 = (const __CFData *)*a1;
  v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!*a1)
    v4 = 0;
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"inData");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to create data\n", v16, v17, v18, v39);
LABEL_20:
    v12 = 11;
    goto LABEL_21;
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
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"outPlist");
    gBBULogMaskGet();
    ctu::cf::show((ctu::cf *)1, *a1, v22);
    v23 = v43;
    v24 = (char)error[0];
    ctu::cf::show(v45, v25);
    v29 = error;
    if (v23 < 0)
      LOBYTE(v29) = v24;
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Failed to deserialize dictionary %s error %s\n", v26, v27, v28, (char)v29);
    if (v41 < 0)
      operator delete(__p[0]);
    goto LABEL_18;
  }
  v10 = CFGetTypeID(v44);
  if (v10 != CFDictionaryGetTypeID())
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "PersoImpl", "", "Condition <<%s>> failed %s %s/%d\n", v30, v31, v32, (char)"CFGetTypeID(outPlist.get()) == CFDictionaryGetTypeID()");
    gBBULogMaskGet();
    ctu::cf::show((ctu::cf *)v44, v33);
    if (v43 >= 0)
      v37 = error;
    else
      LOBYTE(v37) = error[0];
    _BBULog(22, 0xFFFFFFFFLL, "PersoImpl", "", "Deserialized plist data is not a dictionary: %s\n", v34, v35, v36, (char)v37);
LABEL_18:
    if (v43 < 0)
      operator delete(error[0]);
    goto LABEL_20;
  }
  __p[0] = v44;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(error, (CFTypeRef *)__p);
  v11 = *a2;
  *a2 = error[0];
  error[0] = v11;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)error);
  v12 = 0;
LABEL_21:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v44);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v45);
  return v12;
}

void sub_222D48F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  if (a24 < 0)
    operator delete(__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v24 - 48));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v24 - 40));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const void **ctu::cf::CFSharedRef<__CFData const>::operator=<void const,void>(const void **a1, CFTypeRef *a2)
{
  const void *v3;
  const void *v5;

  ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&v5, a2);
  v3 = *a1;
  *a1 = v5;
  v5 = v3;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v5);
  return a1;
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

void sub_222D49030(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

_QWORD *ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
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

const void **ctu::SharedRef<__CFData,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
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

const void **ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(const void **a1)
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
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

uint64_t std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>::~PthreadMutexGuardPolicy(uint64_t a1)
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
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

_QWORD *std::shared_ptr<eUICC::Perso::PersoImplementation>::shared_ptr[abi:ne180100]<eUICC::Perso::PersoImplementation,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24EB7A390;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_222D49344(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<eUICC::Perso::PersoImplementation>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<eUICC::Perso::PersoImplementation>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<eUICC::Perso::PersoImplementation *,std::shared_ptr<eUICC::Perso::PersoImplementation>::__shared_ptr_default_delete<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation>,std::allocator<eUICC::Perso::PersoImplementation>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<eUICC::Perso::PersoImplementation>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void **v3;

  if (a2)
  {
    v3 = (void **)(a2 + 32);
    std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(a2 + 16));
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(a2 + 8));
    if (*(_QWORD *)a2)
      dispatch_release(*(dispatch_object_t *)a2);
    operator delete((void *)a2);
  }
}

void std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a2 + 24);
  if (v3)
  {
    *(_QWORD *)(a2 + 32) = v3;
    operator delete(v3);
  }
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
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

void sub_222D49544(_Unwind_Exception *exception_object)
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
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
  return a1;
}

_QWORD *ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFStringGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::SharedRef(a1, v5);
}

_QWORD *ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
{
  CFTypeRef v3;
  CFTypeID v4;
  const void *v5;

  v3 = *a2;
  if (*a2)
  {
    v4 = CFGetTypeID(*a2);
    if (v4 == CFDataGetTypeID())
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  return ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::SharedRef(a1, v5);
}

uint64_t std::vector<std::pair<std::string,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&,std::vector<unsigned char>&>(uint64_t *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  void *v15;
  std::string *v16;
  std::string *v17;
  char *v18;
  uint64_t *v19;

  v4 = *a1;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555)
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  v9 = (uint64_t)(a1 + 2);
  v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 4);
  if (2 * v10 > v6)
    v6 = 2 * v10;
  if (v10 >= 0x2AAAAAAAAAAAAAALL)
    v11 = 0x555555555555555;
  else
    v11 = v6;
  v19 = a1 + 2;
  if (v11)
    v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>(v9, v11);
  else
    v12 = 0;
  v15 = v12;
  v16 = (std::string *)&v12[48 * v5];
  v18 = &v12[48 * v11];
  std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>(v16, a2, a3);
  v17 = v16 + 2;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  v13 = a1[1];
  std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer(&v15);
  return v13;
}

void sub_222D4976C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100]<std::string&,std::vector<unsigned char>&,0>(std::string *this, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  this[1].__r_.__value_.__r.__words[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this[1].__r_.__value_.__r.__words, *(const void **)a3, *(_QWORD *)(a3 + 8), *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
  return this;
}

void sub_222D497E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::pair<std::string,std::vector<unsigned char>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      v8 = *(_OWORD *)(a3 - 48);
      *(_QWORD *)(v7 - 32) = *(_QWORD *)(a3 - 32);
      *(_OWORD *)(v7 - 48) = v8;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 - 8);
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 48;
      *((_QWORD *)&v14 + 1) -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::reverse_iterator<std::pair<std::string,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
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
      std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::pair<std::string,std::vector<unsigned char>>>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v4, i - 48);
  }
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

void sub_222D49AD0(_Unwind_Exception *exception_object)
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
    std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 144));
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
        MEMORY[0x22767DDA8](v8, 4, v4);
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

void sub_222D49CE4(void *a1)
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
  MEMORY[0x22767DDA8](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_222D49D4C(_Unwind_Exception *a1)
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

void sub_222D49DBC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
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
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
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
  *(_QWORD *)v4 = off_24EB7A408;
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
  aBlock[3] = &unk_24EB7A448;
  aBlock[4] = v10;
  *a2 = _Block_copy(aBlock);
  _Block_object_dispose(v10, 8);
  return std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise((uint64_t *)&v11);
}

void sub_222D49F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::promise<std::shared_ptr<ctu::Http::HttpResponse>>::~promise(v7);
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

void sub_222D4A084(_Unwind_Exception *a1)
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

void sub_222D4A134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
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

_QWORD *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef *a2)
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

std::string *std::vector<std::pair<std::string,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::pair<std::string,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_222D4A268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::vector<unsigned char>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<char *>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*,std::pair<std::string,std::vector<unsigned char>>*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
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
      std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100](v4, v6);
      v6 += 3;
      v4 = v11 + 2;
      v11 += 2;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_222D4A364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string,std::vector<unsigned char>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  this[1].__r_.__value_.__r.__words[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this[1].__r_.__value_.__r.__words, *((const void **)a2 + 3), *((_QWORD *)a2 + 4), *((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3));
  return this;
}

void sub_222D4A3DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::vector<unsigned char>>>,std::pair<std::string,std::vector<unsigned char>>*>::operator()[abi:ne180100](uint64_t *a1)
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
      std::allocator<std::pair<std::string,std::vector<unsigned char>>>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

uint64_t __cxx_global_var_init_84()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::Perso::PersoImplementation,eUICC::Perso::PersoImplementation,ctu::PthreadMutexGuardPolicy<eUICC::Perso::PersoImplementation>>::sInstance, &dword_222D3F000);
  }
  return result;
}

const __CFString **VinylGoldFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  ACFULogging *v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  const __CFString **v13;
  ACFULogging *v14;
  void *v15;
  const void **v16;
  std::string v18;
  std::string v19;
  void *__p[2];
  std::string::size_type v21;

  ACFULogging::getLogInstance(a1);
  v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v18, "VinylFirmware");
  v9 = std::string::append(&v18, "::");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v19, "VinylGoldFirmwareCreate");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v21 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  v13 = (const __CFString **)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v13, (uint64_t)CFSTR("/update/gold/firmware.der"), (uint64_t)CFSTR("/update/gold/info.plist"), (uint64_t)CFSTR("/update/gold/profile.bin"), off_24EB7A4C8);
  v14 = (ACFULogging *)VinylFirmware::setFwInfo(v13, a1, a2, a3);
  if ((_DWORD)v14)
  {
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    VinylFirmware::~VinylFirmware((VinylFirmware *)v13);
    operator delete(v15);
    v13 = 0;
  }
  v16 = VinylFirmware::setRecoveryFwInfo((VinylFirmware *)v13, a1, a2, a3, 0, a4);
  ACFULogging::getLogInstance((ACFULogging *)v16);
  ACFULogging::handleMessage();
  return v13;
}

void sub_222D4A6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;

  operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setFwInfo(const __CFString **this, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  ACFULogging *v8;
  __CFString *FWSrcPath;
  __CFString *v10;
  const void **v11;
  uint64_t (*v12)(uint64_t);
  const __CFData *FileDataFromZip;
  __CFError *v14;
  uint64_t (*v15)(uint64_t);
  VinylFirmware *v16;
  const __CFString *v17;
  const __CFAllocator *v18;
  CFMutableDataRef MutableCopy;
  ACFULogging *Im4p;
  uint64_t v21;
  const __CFData *v22;
  CFErrorRef error[2];
  CFDataRef theData;
  __CFString *v26;
  const void *v27;

  v27 = 0;
  ACFULogging::getLogInstance((ACFULogging *)this);
  v8 = (ACFULogging *)ACFULogging::handleMessage();
  theData = 0;
  v26 = 0;
  this[15] = 0;
  if (!a2 || !a3 || !a4)
  {
    ACFULogging::getLogInstance(v8);
LABEL_24:
    ACFULogging::handleMessage();
    v21 = 99;
    goto LABEL_17;
  }
  FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v8, a3, a4);
  v10 = v26;
  v26 = FWSrcPath;
  error[0] = (CFErrorRef)v10;
  v11 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)error);
  v12 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v26)
    v12 = 0;
  if (!v12)
    goto LABEL_23;
  FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v11, a2, v26, this[12]);
  v14 = theData;
  theData = FileDataFromZip;
  error[0] = v14;
  v11 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)error);
  v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!theData)
    v15 = 0;
  if (!v15 || !theData)
  {
LABEL_23:
    ACFULogging::getLogInstance((ACFULogging *)v11);
    goto LABEL_24;
  }
  v16 = (VinylFirmware *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v11, a2, v26, this[13]);
  this[18] = (const __CFString *)v16;
  if (!v16
    || (v17 = (const __CFString *)VinylFirmware::getFileDataFromZip(v16, a2, v26, this[14]), (this[19] = v17) == 0)
    || (v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240],
        MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theData),
        (this[15] = (const __CFString *)MutableCopy) == 0))
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_24;
  }
  Im4p = (ACFULogging *)VinylFirmware::createIm4p((ACFULogging *)this, a2, (uint64_t)(this + 2), (uint64_t)(this + 17));
  v21 = (uint64_t)Im4p;
  if ((_DWORD)Im4p)
  {
    ACFULogging::getLogInstance(Im4p);
    ACFULogging::handleMessage();
    goto LABEL_17;
  }
  v22 = (const __CFData *)this[18];
  error[0] = 0;
  error[1] = (CFErrorRef)&v27;
  this[21] = (const __CFString *)CFPropertyListCreateWithData(v18, v22, 0, 0, error);
  v11 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (!this[21])
    goto LABEL_23;
  v21 = 0;
LABEL_17:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&theData);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v26);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v27);
  return v21;
}

void sub_222D4A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  const void *v5;
  va_list va;
  uint64_t v7;
  const void *v8;
  va_list va1;
  const void *v10;
  va_list va2;
  va_list va3;

  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, const void *);
  v7 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v8 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v10 = va_arg(va3, const void *);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)va1);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va2);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va3);
  _Unwind_Resume(a1);
}

const void **VinylFirmware::setRecoveryFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4, unsigned int a5, const __CFData *a6)
{
  ACFULogging *v9;
  ACFULogging *FwMac;
  const __CFData *v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  __int128 v15;
  ACFULogging *v16;
  std::string *v17;
  __int128 v18;
  std::string *v19;
  __int128 v20;
  const UInt8 *BytePtr;
  const UInt8 *v22;
  CFIndex Length;
  const __CFData *v24;
  size_t v25;
  ACFULogging *v26;
  int v27;
  VinylFirmware *v28;
  __CFString *FWSrcPath;
  uint64_t (*v30)(uint64_t);
  uint64_t (*v31)(uint64_t);
  const std::string::value_type *v32;
  char *v33;
  ACFULogging *v34;
  char *v35;
  uint64_t v36;
  const __CFAllocator *v37;
  const char *v38;
  const std::string::value_type *v39;
  ACFULogging *v40;
  CFStringRef v41;
  const __CFString *v42;
  std::string *v44;
  __int128 v45;
  std::string *v46;
  __int128 v47;
  ACFULogging *v48;
  CFStringRef v49;
  const __CFString *v50;
  std::string *v52;
  __int128 v53;
  std::string *v54;
  __int128 v55;
  VinylFirmware *v56;
  const __CFData *FileDataFromZip;
  CFDataRef v58;
  const void **v59;
  const __CFData *v60;
  CFDataRef v61;
  uint64_t (*v62)(uint64_t);
  uint64_t (*v63)(uint64_t);
  const std::string::value_type *v64;
  const std::string::value_type *v65;
  int v66;
  const char *v67;
  uint64_t (*v68)(uint64_t);
  const __CFAllocator *v69;
  const void **v70;
  const __CFData *v71;
  const UInt8 *v72;
  const UInt8 *v73;
  CFIndex v74;
  size_t v75;
  CFMutableDataRef MutableCopy;
  std::string *v77;
  __int128 v78;
  std::string *v79;
  __int128 v80;
  uint64_t v82;
  char *v83;
  char *v84;
  __CFString *v88;
  std::string v89;
  std::string v90;
  void *__p[2];
  std::string::size_type v92;
  CFDataRef data;
  CFDataRef v94;
  const __CFString *v95;
  const __CFString *v96;
  const void *v97;
  char v98[16];
  char v99[16];
  char v100[16];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v96 = 0;
  v97 = 0;
  v95 = 0;
  data = 0;
  v94 = 0;
  *((_QWORD *)this + 16) = 0;
  ACFULogging::getLogInstance(this);
  v9 = (ACFULogging *)ACFULogging::handleMessage();
  if (!a2 || !a3 || !a4 || !a6)
  {
    ACFULogging::getLogInstance(v9);
LABEL_87:
    ACFULogging::handleMessage();
    goto LABEL_81;
  }
  FwMac = (ACFULogging *)VinylFirmware::getFwMac(v9, *((CFDictionaryRef *)this + 21));
  v11 = FwMac;
  if (!FwMac)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_87;
  }
  ACFULogging::getLogInstance(FwMac);
  std::string::basic_string[abi:ne180100]<0>(&v89, "VinylFirmware");
  v12 = std::string::append(&v89, "::");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v90.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = std::string::append(&v90, "setRecoveryFwInfo");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v92 = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v92) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v90.__r_.__value_.__l.__data_);
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v89.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v16);
  std::string::basic_string[abi:ne180100]<0>(&v89, "VinylFirmware");
  v17 = std::string::append(&v89, "::");
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v90.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  v19 = std::string::append(&v90, "setRecoveryFwInfo");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v92 = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v92) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v90.__r_.__value_.__l.__data_);
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v89.__r_.__value_.__l.__data_);
  BytePtr = CFDataGetBytePtr(v11);
  v22 = CFDataGetBytePtr(a6);
  Length = CFDataGetLength(v11);
  if (Length >= CFDataGetLength(a6))
    v24 = a6;
  else
    v24 = v11;
  v25 = CFDataGetLength(v24);
  v26 = (ACFULogging *)memcmp(BytePtr, v22, v25);
  v27 = (int)v26;
  ACFULogging::getLogInstance(v26);
  v82 = a5;
  v28 = (VinylFirmware *)ACFULogging::handleMessage();
  if (v27)
  {
    if ((a5 & 1) == 0)
    {
      strcpy(v100, "/recovery/gold-");
      strcpy(v99, "/firmware.der");
      strcpy(v98, "/info.plist");
      FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v28, a3, a4);
      v88 = FWSrcPath;
      v30 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      if (FWSrcPath)
        v31 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      else
        v31 = 0;
      v32 = "setRecoveryFwInfo";
      if (v31)
      {
        v33 = (char *)malloc(0x22uLL);
        v34 = (ACFULogging *)malloc(0x20uLL);
        v35 = (char *)v34;
        if (v33 && v34)
        {
          v36 = 0;
          v37 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v38 = "%s%03d%s";
          v39 = "::";
          v83 = (char *)v34;
          v84 = v33;
          while (1)
          {
            v40 = (ACFULogging *)snprintf(v33, 0x22uLL, v38, v100, v36, v99, v82);
            v33[33] = 0;
            ACFULogging::getLogInstance(v40);
            ACFULogging::handleMessage();
            v41 = CFStringCreateWithCString(v37, v33, 0x8000100u);
            v42 = v96;
            v96 = v41;
            __p[0] = (void *)v42;
            v34 = (ACFULogging *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)__p);
            if (!(v96 ? v30 : 0))
              break;
            ACFULogging::getLogInstance(v34);
            std::string::basic_string[abi:ne180100]<0>(&v89, "VinylFirmware");
            v44 = std::string::append(&v89, v39);
            v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
            v90.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v45;
            v44->__r_.__value_.__l.__size_ = 0;
            v44->__r_.__value_.__r.__words[2] = 0;
            v44->__r_.__value_.__r.__words[0] = 0;
            v46 = std::string::append(&v90, v32);
            v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
            v92 = v46->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v47;
            v46->__r_.__value_.__l.__size_ = 0;
            v46->__r_.__value_.__r.__words[2] = 0;
            v46->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType();
            if (SHIBYTE(v92) < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v90.__r_.__value_.__l.__data_);
            if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v89.__r_.__value_.__l.__data_);
            v48 = (ACFULogging *)snprintf(v35, 0x20uLL, v38, v100, v36, v98);
            v35[31] = 0;
            ACFULogging::getLogInstance(v48);
            ACFULogging::handleMessage();
            v49 = CFStringCreateWithCString(v37, v35, 0x8000100u);
            v50 = v95;
            v95 = v49;
            __p[0] = (void *)v50;
            v34 = (ACFULogging *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)__p);
            if (!(v95 ? v30 : 0))
              break;
            ACFULogging::getLogInstance(v34);
            std::string::basic_string[abi:ne180100]<0>(&v89, "VinylFirmware");
            v52 = std::string::append(&v89, v39);
            v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
            v90.__r_.__value_.__r.__words[2] = v52->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v53;
            v52->__r_.__value_.__l.__size_ = 0;
            v52->__r_.__value_.__r.__words[2] = 0;
            v52->__r_.__value_.__r.__words[0] = 0;
            v54 = std::string::append(&v90, v32);
            v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
            v92 = v54->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v55;
            v54->__r_.__value_.__l.__size_ = 0;
            v54->__r_.__value_.__r.__words[2] = 0;
            v54->__r_.__value_.__r.__words[0] = 0;
            v56 = (VinylFirmware *)ACFULogging::handleMessageCFType();
            if (SHIBYTE(v92) < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v90.__r_.__value_.__l.__data_);
            if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v89.__r_.__value_.__l.__data_);
            FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip(v56, a2, v88, v96);
            v58 = v94;
            v94 = FileDataFromZip;
            __p[0] = v58;
            v59 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            v60 = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v59, a2, v88, v95);
            v61 = data;
            data = v60;
            __p[0] = v61;
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            v62 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            if (!v94)
              v62 = 0;
            if (!v62)
              goto LABEL_67;
            v63 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            if (!data)
              v63 = 0;
            if (!v63 || !v94 || !data)
              goto LABEL_67;
            v64 = v32;
            v65 = v39;
            v66 = v36;
            v67 = v38;
            v68 = v30;
            __p[0] = 0;
            __p[1] = &v97;
            v69 = v37;
            v90.__r_.__value_.__r.__words[0] = (std::string::size_type)CFPropertyListCreateWithData(v37, data, 0, 0, (CFErrorRef *)__p);
            v70 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)__p);
            v71 = (const __CFData *)VinylFirmware::getFwMac((VinylFirmware *)v70, (CFDictionaryRef)v90.__r_.__value_.__l.__data_);
            v72 = CFDataGetBytePtr(v71);
            v73 = CFDataGetBytePtr(a6);
            v74 = CFDataGetLength(v71);
            if (v74 >= CFDataGetLength(a6))
              v75 = CFDataGetLength(a6);
            else
              v75 = CFDataGetLength(v71);
            v37 = v69;
            if (!memcmp(v72, v73, v75))
            {
              MutableCopy = CFDataCreateMutableCopy(v69, 0, v94);
              v35 = v83;
              *((_QWORD *)this + 16) = MutableCopy;
              ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v90.__r_.__value_.__l.__data_);
              v33 = v84;
LABEL_67:
              v28 = (VinylFirmware *)ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v88);
              goto LABEL_68;
            }
            v30 = v68;
            v38 = v67;
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v90.__r_.__value_.__l.__data_);
            v36 = (v66 + 1);
            v35 = v83;
            v33 = v84;
            v39 = v65;
            v32 = v64;
            if ((_DWORD)v36 == 1000)
              goto LABEL_67;
          }
        }
        ACFULogging::getLogInstance(v34);
        ACFULogging::handleMessage();
      }
      else
      {
        ACFULogging::getLogInstance((ACFULogging *)FWSrcPath);
        ACFULogging::handleMessage();
        v35 = 0;
        v33 = 0;
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v88);
      if (!v33)
        goto LABEL_79;
      goto LABEL_78;
    }
  }
  else
  {
    *((_QWORD *)this + 16) = *((_QWORD *)this + 15);
    v28 = (VinylFirmware *)AMSupportSafeRetain();
  }
  v35 = 0;
  v33 = 0;
LABEL_68:
  if (!*((_QWORD *)this + 16))
  {
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    goto LABEL_77;
  }
  ACFULogging::getLogInstance(v28);
  std::string::basic_string[abi:ne180100]<0>(&v89, "VinylFirmware");
  v77 = std::string::append(&v89, "::");
  v78 = *(_OWORD *)&v77->__r_.__value_.__l.__data_;
  v90.__r_.__value_.__r.__words[2] = v77->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v78;
  v77->__r_.__value_.__l.__size_ = 0;
  v77->__r_.__value_.__r.__words[2] = 0;
  v77->__r_.__value_.__r.__words[0] = 0;
  v79 = std::string::append(&v90, "setRecoveryFwInfo");
  v80 = *(_OWORD *)&v79->__r_.__value_.__l.__data_;
  v92 = v79->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v80;
  v79->__r_.__value_.__l.__size_ = 0;
  v79->__r_.__value_.__r.__words[2] = 0;
  v79->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v92) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v90.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v89.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_77:
    if (!v33)
      goto LABEL_79;
    goto LABEL_78;
  }
  operator delete(v89.__r_.__value_.__l.__data_);
  if (v33)
LABEL_78:
    free(v33);
LABEL_79:
  if (v35)
    free(v35);
LABEL_81:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&data);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v94);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v95);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v96);
  return ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v97);
}

void sub_222D4B338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, const void *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,const void *a39,const void *a40)
{
  uint64_t v40;

  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a19);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a39);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a40);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(v40 - 168));
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)(v40 - 160));
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)(v40 - 152));
  _Unwind_Resume(a1);
}

const __CFString **VinylMainFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  ACFULogging *v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  const __CFString **v13;
  ACFULogging *v14;
  void *v15;
  const void **v16;
  std::string v18;
  std::string v19;
  void *__p[2];
  std::string::size_type v21;

  ACFULogging::getLogInstance(a1);
  v8 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v8);
  std::string::basic_string[abi:ne180100]<0>(&v18, "VinylFirmware");
  v9 = std::string::append(&v18, "::");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v19, "VinylMainFirmwareCreate");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v21 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  v13 = (const __CFString **)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v13, (uint64_t)CFSTR("/update/main/firmware.der"), (uint64_t)CFSTR("/update/main/info.plist"), (uint64_t)CFSTR("/update/main/profile.bin"), off_24EB7A468);
  v14 = (ACFULogging *)VinylFirmware::setFwInfo(v13, a1, a2, a3);
  if ((_DWORD)v14)
  {
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    VinylFirmware::~VinylFirmware((VinylFirmware *)v13);
    operator delete(v15);
    v13 = 0;
  }
  v16 = VinylFirmware::setRecoveryFwInfo((VinylFirmware *)v13, a1, a2, a3, 1u, a4);
  ACFULogging::getLogInstance((ACFULogging *)v16);
  ACFULogging::handleMessage();
  return v13;
}

void sub_222D4B658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;

  operator delete(v30);
  _Unwind_Resume(a1);
}

VinylFirmware *VinylFirmwareCreate(__CFData *a1, __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFData *a5, const __CFData *a6)
{
  VinylFirmware *v12;
  ACFULogging *v13;
  void *v14;

  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  v12 = (VinylFirmware *)operator new(0xC0uLL);
  v13 = (ACFULogging *)VinylFirmware::VinylFirmware((uint64_t)v12, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, off_24EB7A4C8);
  if (a6)
  {
    v13 = (ACFULogging *)VinylFirmware::setAuthPayload(v12, a6);
    if ((_DWORD)v13)
    {
      ACFULogging::getLogInstance(v13);
      ACFULogging::handleMessage();
      VinylFirmware::~VinylFirmware(v12);
      operator delete(v14);
      v12 = 0;
    }
  }
  ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage();
  return v12;
}

void sub_222D4B7BC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setAuthPayload(VinylFirmware *this, const __CFData *a2)
{
  char *v3;
  void *v5;
  uint64_t v6;
  VinylFirmware *v7;

  v3 = (char *)*((_QWORD *)this + 23);
  if (!v3)
  {
    v6 = 99;
LABEL_11:
    ACFULogging::getLogInstance((ACFULogging *)v3);
    ACFULogging::handleMessage();
    return v6;
  }
  v5 = dlsym(v3, "AMAuthInstallApImg4CreateStitchTicket");
  v3 = dlerror();
  v6 = 99;
  if (v3 || !v5)
    goto LABEL_11;
  v7 = (VinylFirmware *)((uint64_t (*)(_QWORD, _QWORD, const __CFData *))v5)(0, *((_QWORD *)this + 17), a2);
  if (!v7)
    return 3;
  v3 = (char *)VinylFirmware::stitchImg4Vad(v7, v7, *((const __CFData **)this + 19), (const __CFData **)this + 20);
  v6 = (uint64_t)v3;
  if ((_DWORD)v3 || !*((_QWORD *)this + 20))
    goto LABEL_11;
  return 0;
}

uint64_t VinylFirmware::VinylFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v6 = a5[1];
  *(_OWORD *)a1 = *a5;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = a5[2];
  v8 = a5[3];
  v9 = a5[5];
  *(_OWORD *)(a1 + 64) = a5[4];
  *(_OWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 96) = a2;
  *(_QWORD *)(a1 + 104) = a3;
  *(_QWORD *)(a1 + 112) = a4;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = "/usr/lib/libauthinstall.dylib";
  *(_QWORD *)(a1 + 184) = 0;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  *(_QWORD *)(a1 + 184) = dlopen(*(const char **)(a1 + 176), 1);
  return a1;
}

uint64_t VinylFirmware::VinylFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, _OWORD *a7)
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  const __CFAllocator *v13;
  CFErrorRef error[2];
  const void *v16;

  v9 = a7[1];
  *(_OWORD *)a1 = *a7;
  *(_OWORD *)(a1 + 16) = v9;
  v10 = a7[2];
  v11 = a7[3];
  v12 = a7[5];
  *(_OWORD *)(a1 + 64) = a7[4];
  *(_OWORD *)(a1 + 80) = v12;
  *(_OWORD *)(a1 + 32) = v10;
  *(_OWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = a2;
  *(_QWORD *)(a1 + 128) = a3;
  *(_QWORD *)(a1 + 136) = a4;
  *(_QWORD *)(a1 + 144) = a5;
  *(_QWORD *)(a1 + 152) = a6;
  *(_QWORD *)(a1 + 176) = "/usr/lib/libauthinstall.dylib";
  *(_QWORD *)(a1 + 184) = 0;
  v16 = 0;
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  AMSupportSafeRetain();
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  error[0] = 0;
  error[1] = (CFErrorRef)&v16;
  *(_QWORD *)(a1 + 168) = CFPropertyListCreateWithData(v13, a5, 0, 0, error);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  *(_QWORD *)(a1 + 184) = dlopen(*(const char **)(a1 + 176), 1);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef(&v16);
  return a1;
}

void sub_222D4BA1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  v5 = va_arg(va1, _QWORD);
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)va);
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void VinylFirmware::~VinylFirmware(VinylFirmware *this)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;

  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v2 = (const void *)*((_QWORD *)this + 12);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 12) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 13);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 13) = 0;
  }
  v4 = (const void *)*((_QWORD *)this + 14);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)this + 14) = 0;
  }
  v5 = (const void *)*((_QWORD *)this + 15);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 15) = 0;
  }
  v6 = (const void *)*((_QWORD *)this + 16);
  if (v6)
  {
    CFRelease(v6);
    *((_QWORD *)this + 16) = 0;
  }
  v7 = (const void *)*((_QWORD *)this + 17);
  if (v7)
  {
    CFRelease(v7);
    *((_QWORD *)this + 17) = 0;
  }
  v8 = (const void *)*((_QWORD *)this + 18);
  if (v8)
  {
    CFRelease(v8);
    *((_QWORD *)this + 18) = 0;
  }
  v9 = (const void *)*((_QWORD *)this + 19);
  if (v9)
  {
    CFRelease(v9);
    *((_QWORD *)this + 19) = 0;
  }
  v10 = (const void *)*((_QWORD *)this + 21);
  if (v10)
  {
    CFRelease(v10);
    *((_QWORD *)this + 21) = 0;
  }
  v11 = (void *)*((_QWORD *)this + 23);
  if (v11)
  {
    dlclose(v11);
    *((_QWORD *)this + 23) = 0;
  }
}

ACFULogging *VinylFirmware::getFWSrcPath(VinylFirmware *this, const __CFData *a2, const __CFData *a3)
{
  ACFULogging *v5;
  char *v6;
  ACFULogging *MutableCopy;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  const UInt8 *BytePtr;
  CFIndex Length;
  ACFULogging *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  ACFULogging *v19;
  ACFULogging *v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  UInt8 *v25;
  size_t v26;
  char *v27;
  int v28;
  ACFULogging *v29;
  ACFULogging *v30;
  std::string *v31;
  __int128 v32;
  std::string *v33;
  __int128 v34;
  std::string v36;
  std::string v37;
  void *__p[2];
  std::string::size_type v39;
  UInt8 bytes[32];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = (ACFULogging *)malloc(0x41uLL);
  if (!v5)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
  v6 = (char *)v5;
  if (!a2 || !a3)
  {
    ACFULogging::getLogInstance(v5);
    goto LABEL_40;
  }
  MutableCopy = CFDataCreateMutableCopy(0, 0, a2);
  ACFULogging::getLogInstance(MutableCopy);
  if (!MutableCopy)
  {
LABEL_40:
    ACFULogging::handleMessage();
    v30 = 0;
    goto LABEL_36;
  }
  std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
  v8 = std::string::append(&v36, "::");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v37, "getFWSrcPath");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v39 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v39) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  BytePtr = CFDataGetBytePtr(a3);
  Length = CFDataGetLength(a3);
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
  v15 = std::string::append(&v36, "::");
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v17 = std::string::append(&v37, "getFWSrcPath");
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v39 = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v39) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  v19 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v19)
  {
    ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage();
  }
  else
  {
    v20 = CFDataCreate(0, bytes, 32);
    ACFULogging::getLogInstance(v20);
    if (v20)
    {
      std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
      v21 = std::string::append(&v36, "::");
      v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v37.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      v23 = std::string::append(&v37, "getFWSrcPath");
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v39 = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType();
      if (SHIBYTE(v39) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37.__r_.__value_.__l.__data_);
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      v25 = bytes;
      v26 = 65;
      v27 = v6;
      do
      {
        v28 = *v25++;
        v29 = (ACFULogging *)snprintf(v27, v26, "%02x", v28);
        v27 += 2;
        v26 -= 2;
      }
      while (v26 != 1);
      v6[64] = 0;
      ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage();
      v30 = (ACFULogging *)CFStringCreateWithCString(0, v6, 0x8000100u);
      ACFULogging::getLogInstance(v30);
      if (v30)
      {
        std::string::basic_string[abi:ne180100]<0>(&v36, "VinylFirmware");
        v31 = std::string::append(&v36, "::");
        v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        v37.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        v33 = std::string::append(&v37, "getFWSrcPath");
        v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
        v39 = v33->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v34;
        v33->__r_.__value_.__l.__size_ = 0;
        v33->__r_.__value_.__r.__words[2] = 0;
        v33->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType();
        if (SHIBYTE(v39) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v37.__r_.__value_.__l.__data_);
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v36.__r_.__value_.__l.__data_);
      }
      else
      {
        ACFULogging::handleMessage();
      }
      CFRelease(v20);
      goto LABEL_35;
    }
    ACFULogging::handleMessage();
  }
  v30 = 0;
LABEL_35:
  CFRelease(MutableCopy);
LABEL_36:
  free(v6);
  return v30;
}

void sub_222D4C094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

CFTypeRef VinylFirmware::getFileDataFromZip(VinylFirmware *this, const __CFData *a2, const __CFString *a3, const __CFString *a4)
{
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  ACFULogging *v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  __int128 v15;
  __CFString *Mutable;
  __CFString *v17;
  ACFULogging *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  ACFULogging *v23;
  ACFULogging *v24;
  std::string v26;
  std::string v27;
  void *__p[2];
  std::string::size_type v29;
  CFTypeRef v30;

  v30 = 0;
  ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
  v7 = std::string::append(&v26, "::");
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  v9 = std::string::append(&v27, "getFileDataFromZip");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v29 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v29) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v11);
  std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
  v12 = std::string::append(&v26, "::");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = std::string::append(&v27, "getFileDataFromZip");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29 = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  Mutable = (__CFString *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v29) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (a2 && a3 && a4 && (Mutable = CFStringCreateMutable(0, 0)) != 0)
  {
    v17 = Mutable;
    CFStringAppend(Mutable, a3);
    CFStringAppend(v17, a4);
    ACFULogging::getLogInstance(v18);
    std::string::basic_string[abi:ne180100]<0>(&v26, "VinylFirmware");
    v19 = std::string::append(&v26, "::");
    v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    v27.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    v21 = std::string::append(&v27, "getFileDataFromZip");
    v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v29 = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v29) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    v23 = (ACFULogging *)eUICCFwReaderOpen(a2);
    v24 = v23;
    if (!v23 || (v23 = eUICCFwReaderFindAndCopyFileData(v23, v17, &v30), (_DWORD)v23))
    {
      ACFULogging::getLogInstance(v23);
      ACFULogging::handleMessage();
    }
    eUICCFwReaderClose(v24);
    CFRelease(v17);
    return v30;
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)Mutable);
    ACFULogging::handleMessage();
    eUICCFwReaderClose(0);
    return 0;
  }
}

void sub_222D4C444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::createIm4p(ACFULogging *a1, ACFULogging *a2, uint64_t a3, uint64_t a4)
{
  const CFArrayCallBacks *v6;
  CFMutableArrayRef v7;
  CFMutableArrayRef v8;
  const void **v9;
  uint64_t v10;
  const void **v11;
  CFArrayRef v12;
  ACFULogging *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  ACFULogging *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  ACFULogging *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  const __CFArray *v27;
  __int128 v28;
  ACFULogging *v29;
  std::string *v30;
  __int128 v31;
  std::string *v32;
  __int128 v33;
  std::string *v34;
  __int128 v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  __int128 v39;
  std::string *v40;
  __int128 v41;
  std::string *v42;
  __int128 v43;
  std::string *v44;
  __int128 v45;
  ACFULogging *Count;
  CFIndex v47;
  ACFULogging *v48;
  uint64_t v49;
  CFDataRef *v50;
  ACFULogging *v51;
  CFDataRef *v52;
  ACFULogging *EncodedBuffer;
  CFDataRef v54;
  ACFULogging *CString;
  std::string *v56;
  __int128 v57;
  std::string *v58;
  __int128 v59;
  void *v60;
  void *v61;
  char *v62;
  std::string *v63;
  __int128 v64;
  std::string *v65;
  __int128 v66;
  CFArrayRef v67;
  const void *v68;
  const void *v69;
  const __CFArray *theArray;
  CFArrayRef Mutable;
  std::string v75;
  std::string v76;
  void *__p[2];
  std::string::size_type v78;
  _QWORD v79[2];
  char v80[5];
  char buffer[5];
  unsigned int v82;
  UInt8 *v83;
  void *values[4];
  CFRange v85;
  CFRange v86;

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  v83 = 0;
  v82 = 0;
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  v6 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v7 = CFArrayCreateMutable(0, 0, v6);
  v8 = v7;
  v9 = 0;
  values[0] = Mutable;
  values[1] = v7;
  v10 = 1;
  if (!a2 || !a3)
    goto LABEL_104;
  v11 = 0;
  if (!a4)
    goto LABEL_87;
  v9 = 0;
  v10 = 2;
  if (!Mutable)
  {
LABEL_104:
    v11 = 0;
    goto LABEL_87;
  }
  v11 = 0;
  if (!v7)
    goto LABEL_87;
  theArray = v7;
  v12 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x24BDBD690]);
  *(_QWORD *)(a3 + 48) = v12;
  if (!v12)
    goto LABEL_110;
  v79[0] = a1;
  v79[1] = a3;
  v13 = (ACFULogging *)eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderInfoPlistCallback, (uint64_t)v79);
  v10 = (uint64_t)v13;
  if ((_DWORD)v13)
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
LABEL_110:
    v11 = 0;
    v9 = 0;
LABEL_111:
    v8 = theArray;
    v67 = Mutable;
    goto LABEL_88;
  }
  if (!*(_QWORD *)(a3 + 56))
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
LABEL_109:
    v10 = 0;
    goto LABEL_110;
  }
  v10 = eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderCallback, (uint64_t)v79);
  ACFULogging::getLogInstance((ACFULogging *)v10);
  if ((_DWORD)v10)
  {
    ACFULogging::handleMessage();
    goto LABEL_110;
  }
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  v14 = std::string::append(&v75, "::");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = std::string::append(&v76, "createIm4p");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v78 = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v18);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  v19 = std::string::append(&v75, "::");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  v21 = std::string::append(&v76, "createIm4p");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v78 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  v23 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  v24 = std::string::append(&v75, "::");
  v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  v26 = std::string::append(&v76, "createIm4p");
  v27 = Mutable;
  v28 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v78 = v26->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  if (*(_QWORD *)(a3 + 24))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    v30 = std::string::append(&v75, "::");
    v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&v76, "createIm4p");
    v27 = Mutable;
    v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v78 = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (*(_QWORD *)(a3 + 32))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    v34 = std::string::append(&v75, "::");
    v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    v36 = std::string::append(&v76, "createIm4p");
    v27 = Mutable;
    v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    v78 = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (*(_QWORD *)(a3 + 40))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    v38 = std::string::append(&v75, "::");
    v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    v40 = std::string::append(&v76, "createIm4p");
    v27 = Mutable;
    v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    v78 = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    v29 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
  }
  if (*(_QWORD *)(a3 + 48))
  {
    ACFULogging::getLogInstance(v29);
    std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
    v42 = std::string::append(&v75, "::");
    v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
    v76.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v43;
    v42->__r_.__value_.__l.__size_ = 0;
    v42->__r_.__value_.__r.__words[2] = 0;
    v42->__r_.__value_.__r.__words[0] = 0;
    v44 = std::string::append(&v76, "createIm4p");
    v27 = Mutable;
    v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
    v78 = v44->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v45;
    v44->__r_.__value_.__l.__size_ = 0;
    v44->__r_.__value_.__r.__words[2] = 0;
    v44->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v78) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
  }
  Count = (ACFULogging *)CFArrayGetCount(v27);
  v47 = (CFIndex)Count;
  if ((uint64_t)Count <= 0 || (Count = (ACFULogging *)CFArrayGetCount(theArray), (ACFULogging *)v47 != Count))
  {
    ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage();
    goto LABEL_109;
  }
  v11 = (const void **)malloc(8 * v47);
  v48 = (ACFULogging *)malloc(8 * v47);
  v9 = (const void **)v48;
  if (!v11 || !v48)
  {
    ACFULogging::getLogInstance(v48);
    ACFULogging::handleMessage();
    v10 = 0;
    goto LABEL_111;
  }
  v85.location = 0;
  v85.length = v47;
  CFArrayGetValues(Mutable, v85, v11);
  v86.location = 0;
  v86.length = v47;
  CFArrayGetValues(theArray, v86, v9);
  DEREncoderCreate();
  DEREncoderCreate();
  v49 = 0;
  do
  {
    DEREncoderCreate();
    v50 = (CFDataRef *)&v11[v49];
    CFDataGetBytePtr(*v50);
    CFDataGetLength(*v50);
    v51 = (ACFULogging *)DEREncoderAddData();
    if ((_DWORD)v51
      || (v52 = (CFDataRef *)&v9[v49],
          CFDataGetBytePtr(*v52),
          CFDataGetLength(*v52),
          v51 = (ACFULogging *)DEREncoderAddData(),
          (_DWORD)v51)
      || (v51 = (ACFULogging *)DEREncoderAddSequenceFromEncoder(), (_DWORD)v51))
    {
      ACFULogging::getLogInstance(v51);
      ACFULogging::handleMessage();
      v10 = 0;
LABEL_103:
      v8 = theArray;
      goto LABEL_87;
    }
    DEREncoderDestroy();
    ++v49;
  }
  while (v47 != v49);
  EncodedBuffer = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
  if ((_DWORD)EncodedBuffer
    || (DEREncoderDestroy(), EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer(), (_DWORD)EncodedBuffer))
  {
    ACFULogging::getLogInstance(EncodedBuffer);
    ACFULogging::handleMessage();
LABEL_114:
    v10 = 3;
    goto LABEL_103;
  }
  v54 = CFDataCreateWithBytesNoCopy(0, v83, v82, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v54)
  {
    v10 = 2;
    goto LABEL_103;
  }
  if (!CFStringGetCString(*(CFStringRef *)a3, buffer, 5, 0x8000100u))
    goto LABEL_114;
  CString = (ACFULogging *)CFStringGetCString(CFSTR("1.0"), v80, 5, 0x8000100u);
  if (!(_DWORD)CString)
    goto LABEL_114;
  ACFULogging::getLogInstance(CString);
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  v56 = std::string::append(&v75, "::");
  v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v57;
  v56->__r_.__value_.__l.__size_ = 0;
  v56->__r_.__value_.__r.__words[2] = 0;
  v56->__r_.__value_.__r.__words[0] = 0;
  v58 = std::string::append(&v76, "createIm4p");
  v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
  v78 = v58->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v59;
  v58->__r_.__value_.__l.__size_ = 0;
  v58->__r_.__value_.__r.__words[2] = 0;
  v58->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v78) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  v60 = (void *)*((_QWORD *)a1 + 23);
  if (!v60)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
LABEL_118:
    v10 = 99;
    goto LABEL_103;
  }
  v61 = dlsym(v60, "AMAuthInstallApImg4CreatePayload");
  v62 = dlerror();
  if (v62 || !v61)
  {
    ACFULogging::getLogInstance((ACFULogging *)v62);
    ACFULogging::handleMessage();
    goto LABEL_118;
  }
  v10 = ((uint64_t (*)(char *, char *, CFDataRef, _QWORD, _QWORD, uint64_t))v61)(buffer, v80, v54, 0, 0, a4);
  ACFULogging::getLogInstance((ACFULogging *)v10);
  if ((_DWORD)v10)
  {
    ACFULogging::handleMessage();
    goto LABEL_103;
  }
  std::string::basic_string[abi:ne180100]<0>(&v75, "VinylFirmware");
  v63 = std::string::append(&v75, "::");
  v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v63->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v64;
  v63->__r_.__value_.__l.__size_ = 0;
  v63->__r_.__value_.__r.__words[2] = 0;
  v63->__r_.__value_.__r.__words[0] = 0;
  v65 = std::string::append(&v76, "createIm4p");
  v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
  v78 = v65->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v66;
  v65->__r_.__value_.__l.__size_ = 0;
  v65->__r_.__value_.__r.__words[2] = 0;
  v65->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  v8 = theArray;
  if (SHIBYTE(v78) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  v10 = 0;
LABEL_87:
  v67 = Mutable;
  if (Mutable)
LABEL_88:
    CFRelease(v67);
  if (v8)
    CFRelease(v8);
  if (v11)
    free(v11);
  if (v9)
    free(v9);
  DEREncoderDestroy();
  DEREncoderDestroy();
  v68 = *(const void **)(a3 + 48);
  if (v68)
  {
    CFRelease(v68);
    *(_QWORD *)(a3 + 48) = 0;
  }
  v69 = *(const void **)(a3 + 56);
  if (v69)
  {
    CFRelease(v69);
    *(_QWORD *)(a3 + 56) = 0;
  }
  if (v83)
    free(v83);
  return v10;
}

void sub_222D4D1C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

const void *VinylFirmware::getFwMac(CFDictionaryRef *this)
{
  return VinylFirmware::getFwMac((VinylFirmware *)this, this[21]);
}

const void *VinylFirmware::getFwMac(VinylFirmware *this, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  ACFULogging *Length;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  std::string v10;
  std::string v11;
  __int128 v12;
  std::string::size_type v13;

  Value = CFDictionaryGetValue(theDict, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac"));
  if (!Value)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_13;
  }
  TypeID = CFDataGetTypeID();
  Length = (ACFULogging *)CFGetTypeID(Value);
  if ((ACFULogging *)TypeID != Length
    || (Length = (ACFULogging *)CFDataGetLength((CFDataRef)Value), Length != (ACFULogging *)8))
  {
    ACFULogging::getLogInstance(Length);
LABEL_13:
    ACFULogging::handleMessage();
    return Value;
  }
  ACFULogging::getLogInstance((ACFULogging *)8);
  std::string::basic_string[abi:ne180100]<0>(&v10, "VinylFirmware");
  v5 = std::string::append(&v10, "::");
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v11.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  v7 = std::string::append(&v11, "getFwMac");
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v13 = v7->__r_.__value_.__r.__words[2];
  v12 = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v13) < 0)
    operator delete((void *)v12);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  return Value;
}

void sub_222D4D3E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  if (*(char *)(v23 - 25) < 0)
    operator delete(*(void **)(v23 - 48));
  if (a23 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::getIm4p(VinylFirmware *this)
{
  return *((_QWORD *)this + 17);
}

uint64_t VinylFirmware::getFwData(VinylFirmware *this)
{
  return *((_QWORD *)this + 15);
}

uint64_t VinylFirmware::getRecoveryFwData(VinylFirmware *this)
{
  std::string *v2;
  __int128 v3;
  std::string *v4;
  __int128 v5;
  ACFULogging *v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::string v12;
  std::string v13;
  __int128 v14;
  std::string::size_type v15;

  ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
  v2 = std::string::append(&v12, "::");
  v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  v4 = std::string::append(&v13, "getRecoveryFwData");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v15 = v4->__r_.__value_.__r.__words[2];
  v14 = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = (ACFULogging *)ACFULogging::handleMessageCFType();
  if (SHIBYTE(v15) < 0)
    operator delete((void *)v14);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  ACFULogging::getLogInstance(v6);
  std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
  v7 = std::string::append(&v12, "::");
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  v9 = std::string::append(&v13, "getRecoveryFwData");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v15 = v9->__r_.__value_.__r.__words[2];
  v14 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v15) < 0)
    operator delete((void *)v14);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  return *((_QWORD *)this + 16);
}

void sub_222D4D5D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t VinylFirmware::getInfoPlistData(VinylFirmware *this)
{
  return *((_QWORD *)this + 18);
}

uint64_t VinylFirmware::getProfileData(VinylFirmware *this)
{
  return *((_QWORD *)this + 19);
}

uint64_t VinylFirmware::getAuthPayload(VinylFirmware *this)
{
  return *((_QWORD *)this + 20);
}

uint64_t VinylFirmware::stitchImg4Vad(VinylFirmware *this, CFDataRef theData, const __CFData *a3, const __CFData **a4)
{
  uint64_t v4;
  __CFData *MutableCopy;
  CFIndex Length;
  CFIndex v10;
  const UInt8 *BytePtr;
  CFIndex v12;
  ACFULogging *EncodedBuffer;
  const __CFData *v14;

  v4 = 1;
  if (theData && a3)
  {
    MutableCopy = 0;
    if (!a4)
      goto LABEL_10;
    Length = CFDataGetLength(theData);
    v10 = CFDataGetLength(a3);
    MutableCopy = CFDataCreateMutableCopy(0, v10 + Length, theData);
    if (MutableCopy)
    {
      BytePtr = CFDataGetBytePtr(a3);
      v12 = CFDataGetLength(a3);
      CFDataAppendBytes(MutableCopy, BytePtr, v12);
      if (DEREncoderCreate())
      {
        CFDataGetBytePtr(MutableCopy);
        CFDataGetLength(MutableCopy);
        EncodedBuffer = (ACFULogging *)DEREncoderAddData();
        if ((_DWORD)EncodedBuffer
          || (EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer(), (_DWORD)EncodedBuffer))
        {
          ACFULogging::getLogInstance(EncodedBuffer);
          ACFULogging::handleMessage();
          goto LABEL_9;
        }
        v14 = CFDataCreate(0, 0, 0);
        *a4 = v14;
        if (v14)
        {
LABEL_9:
          v4 = 0;
          goto LABEL_10;
        }
      }
    }
    v4 = 2;
  }
  else
  {
    MutableCopy = 0;
  }
LABEL_10:
  DEREncoderDestroy();
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v4;
}

BOOL VinylFirmwareReaderInfoPlistCallback(VinylFirmware *a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
    return VinylFirmware::fwReaderInfoPlistCallback(a1, *((_QWORD **)a1 + 1), theString, a3);
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  return 0;
}

uint64_t VinylFirmwareReaderCallback(void *a1, CFStringRef theString, ACFULogging *a3)
{
  if (a1)
    return VinylFirmware::fwReaderCallback(*(VinylFirmware **)a1, *((void **)a1 + 1), theString, a3);
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  return 0;
}

CFStringRef VinylFirmware::getPathComponent(VinylFirmware *this, const __CFString *a2)
{
  const __CFAllocator *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFURL *PathComponent;
  const __CFURL *v6;
  const __CFString *v7;
  CFStringRef Copy;

  if (!a2)
  {
    ACFULogging::getLogInstance(this);
LABEL_10:
    ACFULogging::handleMessage();
    return 0;
  }
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, kCFURLPOSIXPathStyle, 0);
  if (!v3)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_10;
  }
  v4 = v3;
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(v2, v3);
  if (!PathComponent)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    CFRelease(v4);
    return 0;
  }
  v6 = PathComponent;
  v7 = CFURLGetString(PathComponent);
  Copy = CFStringCreateCopy(v2, v7);
  if (!Copy)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  CFRelease(v4);
  CFRelease(v6);
  return Copy;
}

BOOL VinylFirmware::checkVinylFwLdrVerLegacy(VinylFirmware *this, CFArrayRef theArray)
{
  ACFULogging *Count;
  const __CFString *ValueAtIndex;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v6;
  ACFULogging *v7;
  const __CFString *v8;
  __int16 IntValue;
  const __CFString *v10;
  _BOOL8 v11;

  Count = (ACFULogging *)CFArrayGetCount(theArray);
  if ((uint64_t)Count <= 0)
  {
    ACFULogging::getLogInstance(Count);
LABEL_10:
    ACFULogging::handleMessage();
    return 1;
  }
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex
    || (ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, CFSTR("."))) == 0)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_10;
  }
  v6 = ArrayBySeparatingStrings;
  v7 = (ACFULogging *)CFArrayGetCount(ArrayBySeparatingStrings);
  if (v7 == (ACFULogging *)2)
  {
    v8 = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    IntValue = CFStringGetIntValue(v8);
    v10 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1);
    v11 = (((unsigned __int16)CFStringGetIntValue(v10) | (unsigned __int16)(IntValue << 8)) & 0x7FFFu) < 0x301;
  }
  else
  {
    ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage();
    v11 = 1;
  }
  CFRelease(v6);
  return v11;
}

const __CFData *VinylFirmware::fwLdrVerEqual(VinylFirmware *this, CFArrayRef theArray, const __CFData *a3)
{
  const __CFString *ValueAtIndex;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v7;
  ACFULogging *Count;
  const __CFData *BytePtr;
  int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;

  if (!theArray || (this = (VinylFirmware *)CFArrayGetCount(theArray), (uint64_t)this <= 0))
  {
    ACFULogging::getLogInstance(this);
LABEL_13:
    ACFULogging::handleMessage();
    return 0;
  }
  if (a3)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
    if (ValueAtIndex)
    {
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, CFSTR("."));
      if (ArrayBySeparatingStrings)
      {
        v7 = ArrayBySeparatingStrings;
        Count = (ACFULogging *)CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count == (ACFULogging *)2)
        {
          BytePtr = (const __CFData *)CFDataGetBytePtr(a3);
          a3 = BytePtr;
          if (!BytePtr)
          {
            ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage();
            goto LABEL_16;
          }
          v10 = *(unsigned __int8 *)BytePtr;
          v11 = (const __CFString *)CFArrayGetValueAtIndex(v7, 0);
          if (CFStringGetIntValue(v11) == v10)
          {
            v12 = *((unsigned __int8 *)a3 + 1);
            v13 = (const __CFString *)CFArrayGetValueAtIndex(v7, 1);
            a3 = (const __CFData *)(CFStringGetIntValue(v13) == v12);
LABEL_16:
            CFRelease(v7);
            return a3;
          }
        }
        else
        {
          ACFULogging::getLogInstance(Count);
          ACFULogging::handleMessage();
        }
        a3 = 0;
        goto LABEL_16;
      }
    }
    ACFULogging::getLogInstance(0);
    goto LABEL_13;
  }
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return a3;
}

BOOL VinylFirmware::fwReaderInfoPlistCallback(VinylFirmware *this, _QWORD *a2, CFStringRef theString, ACFULogging *a4)
{
  int v4;
  const __CFString *v8;
  VinylFirmware *HasSuffix;
  CFStringRef PathComponent;
  ACFULogging *v11;
  const __CFAllocator *v12;
  CFPropertyListRef v13;
  __CFDictionary *Mutable;
  CFErrorRef error;
  CFDataRef data;

  data = 0;
  v4 = 1;
  if (!a2 || !theString || !a4)
    return v4 == 0;
  v8 = (const __CFString *)a2[2];
  if (!v8 || (HasSuffix = (VinylFirmware *)CFStringHasSuffix(theString, v8), !(_DWORD)HasSuffix))
  {
    v4 = 0;
    return v4 == 0;
  }
  error = 0;
  PathComponent = VinylFirmware::getPathComponent(HasSuffix, theString);
  if (!PathComponent)
  {
    v13 = 0;
LABEL_21:
    v4 = 2;
    goto LABEL_12;
  }
  v11 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)&data);
  if ((_DWORD)v11)
  {
    v4 = (int)v11;
    ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage();
    v13 = 0;
    goto LABEL_12;
  }
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], data, 0, 0, &error);
  if (!v13)
    goto LABEL_21;
  Mutable = (__CFDictionary *)a2[7];
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    a2[7] = Mutable;
    if (!Mutable)
      goto LABEL_21;
  }
  CFDictionaryAddValue(Mutable, PathComponent, v13);
  v4 = 0;
LABEL_12:
  if (data)
  {
    CFRelease(data);
    data = 0;
  }
  if (PathComponent)
    CFRelease(PathComponent);
  if (v13)
    CFRelease(v13);
  return v4 == 0;
}

uint64_t VinylFirmware::fwReaderCallback(VinylFirmware *this, void *a2, CFStringRef theString, ACFULogging *a4)
{
  CFDataRef v4;
  uint64_t v5;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *MutableCopy;
  CFStringRef PathComponent;
  void *v13;
  uint64_t (*v14)(_QWORD, const void *, CFTypeRef *);
  char *v15;
  const void *ValueAtIndex;
  int v17;
  const __CFString *v18;
  VinylFirmware *HasSuffix;
  const __CFDictionary *Value;
  VinylFirmware *v21;
  _BOOL8 v22;
  const void *v23;
  const __CFData *v24;
  unsigned int v25;
  const UInt8 *BytePtr;
  CFIndex Length;
  ACFULogging *v28;
  ACFULogging *v29;
  const __CFArray *v30;
  __CFArray *v31;
  __CFArray *v32;
  __CFArray *v33;
  ACFULogging *v34;
  CFTypeRef cf1;
  CFDataRef theData;
  UInt8 bytes[32];
  uint64_t v39;

  v4 = 0;
  v5 = 0;
  v39 = *MEMORY[0x24BDAC8D0];
  cf1 = 0;
  theData = 0;
  if (!a2 || !theString)
  {
    ArrayBySeparatingStrings = 0;
LABEL_58:
    MutableCopy = 0;
    PathComponent = 0;
    goto LABEL_39;
  }
  ArrayBySeparatingStrings = 0;
  MutableCopy = 0;
  PathComponent = 0;
  if (!a4)
    goto LABEL_39;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, CFSTR("/"));
  if (!ArrayBySeparatingStrings)
  {
LABEL_55:
    v5 = 0;
    v4 = 0;
    MutableCopy = 0;
    PathComponent = 0;
    goto LABEL_39;
  }
  v13 = (void *)*((_QWORD *)this + 23);
  if (!v13)
  {
    ACFULogging::getLogInstance(0);
LABEL_54:
    ACFULogging::handleMessage();
    goto LABEL_55;
  }
  v14 = (uint64_t (*)(_QWORD, const void *, CFTypeRef *))dlsym(v13, "AMAuthInstallSupportCopyDataFromHexString");
  v15 = dlerror();
  if (v15 || !v14)
  {
    ACFULogging::getLogInstance((ACFULogging *)v15);
    goto LABEL_54;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  v17 = v14(0, ValueAtIndex, &cf1);
  v4 = 0;
  v5 = 0;
  if (!cf1 || v17)
    goto LABEL_58;
  v18 = (const __CFString *)*((_QWORD *)a2 + 1);
  if (!v18 || (HasSuffix = (VinylFirmware *)CFStringHasSuffix(theString, v18), !(_DWORD)HasSuffix))
  {
    v4 = 0;
    MutableCopy = 0;
    PathComponent = 0;
LABEL_38:
    v5 = 1;
    goto LABEL_39;
  }
  PathComponent = VinylFirmware::getPathComponent(HasSuffix, theString);
  if (!PathComponent
    || (Value = (const __CFDictionary *)CFDictionaryGetValue(*((CFDictionaryRef *)a2 + 7), PathComponent)) == 0)
  {
    v5 = 0;
    v4 = 0;
    MutableCopy = 0;
    goto LABEL_39;
  }
  v21 = (VinylFirmware *)CFDictionaryGetValue(Value, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderVersionsSupported"));
  MutableCopy = v21;
  if (!v21)
    goto LABEL_63;
  v22 = VinylFirmware::checkVinylFwLdrVerLegacy(v21, v21);
  v23 = (const void *)*((_QWORD *)a2 + 4);
  if (!v23)
  {
    v4 = 0;
    MutableCopy = 0;
    goto LABEL_28;
  }
  v24 = (const __CFData *)*((_QWORD *)a2 + 5);
  if (!v24
    || v22
    && (v25 = VinylFirmware::fwLdrVerEqual((VinylFirmware *)v22, MutableCopy, v24),
        v23 = (const void *)*((_QWORD *)a2 + 4),
        v25))
  {
    v4 = 0;
    MutableCopy = 0;
    if (!CFEqual(cf1, v23))
      goto LABEL_28;
    goto LABEL_27;
  }
  MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDataRef)v23);
  if (!MutableCopy)
  {
LABEL_63:
    v5 = 0;
    v4 = 0;
    goto LABEL_39;
  }
  BytePtr = CFDataGetBytePtr(*((CFDataRef *)a2 + 5));
  Length = CFDataGetLength(*((CFDataRef *)a2 + 5));
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  v28 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v28)
  {
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    goto LABEL_63;
  }
  v4 = CFDataCreate(0, bytes, 32);
  if (!v4)
    goto LABEL_60;
  if (CFEqual(cf1, v4))
  {
LABEL_27:
    v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)a2 + 3);
    if ((_DWORD)v29)
    {
LABEL_59:
      ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage();
      goto LABEL_60;
    }
  }
LABEL_28:
  v30 = (const __CFArray *)*((_QWORD *)a2 + 6);
  if (!v30)
    goto LABEL_38;
  v31 = (__CFArray *)CFArrayGetValueAtIndex(v30, 0);
  v32 = (__CFArray *)CFArrayGetValueAtIndex(*((CFArrayRef *)a2 + 6), 1);
  v5 = 0;
  if (v31)
  {
    v33 = v32;
    if (v32)
    {
      if (cf1)
      {
        CFArrayAppendValue(v31, cf1);
        v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)&theData);
        if (!(_DWORD)v29)
        {
          CFDataGetBytePtr(theData);
          CFDataGetLength(theData);
          v34 = (ACFULogging *)AMSupportDigestSha256();
          if ((_DWORD)v34)
          {
            ACFULogging::getLogInstance(v34);
            ACFULogging::handleMessage();
            goto LABEL_38;
          }
          if (v4)
            CFRelease(v4);
          v4 = CFDataCreate(0, bytes, 32);
          if (v4)
          {
            CFArrayAppendValue(v33, v4);
            goto LABEL_38;
          }
          goto LABEL_60;
        }
        goto LABEL_59;
      }
LABEL_60:
      v5 = 0;
    }
  }
LABEL_39:
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (cf1)
  {
    CFRelease(cf1);
    cf1 = 0;
  }
  if (v4)
    CFRelease(v4);
  if (ArrayBySeparatingStrings)
    CFRelease(ArrayBySeparatingStrings);
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (PathComponent)
    CFRelease(PathComponent);
  return v5;
}

uint64_t VinylFirmware::generateMeasurement@<X0>(CFDataRef *this@<X0>, CFDataRef *a2@<X8>)
{
  ACFULogging *v4;
  const void **v5;
  std::string *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  ACFULogging *v10;
  std::string v12;
  std::string v13;
  void *__p[2];
  std::string::size_type v15;
  UInt8 bytes[32];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage();
  *a2 = 0;
  CFDataGetBytePtr(this[17]);
  CFDataGetLength(this[17]);
  v4 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v4)
  {
    ACFULogging::getLogInstance(v4);
    return ACFULogging::handleMessage();
  }
  else
  {
    *a2 = CFDataCreate(0, bytes, 32);
    __p[0] = 0;
    v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    ACFULogging::getLogInstance((ACFULogging *)v5);
    std::string::basic_string[abi:ne180100]<0>(&v12, "VinylFirmware");
    v6 = std::string::append(&v12, "::");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v13.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    v8 = std::string::append(&v13, "generateMeasurement");
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    v10 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v15) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v12.__r_.__value_.__l.__data_);
    ACFULogging::getLogInstance(v10);
    return ACFULogging::handleMessage();
  }
}

void sub_222D4E4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  const void **v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v30);
  _Unwind_Resume(a1);
}

void VinylFirmware::getFirmwareAPDUs(VinylFirmware **this@<X0>, uint64_t a2@<X8>)
{
  ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage();
  VinylFirmware::getFirmwareAPDUs(this[15], a2);
}

void VinylFirmware::getFirmwareAPDUs(VinylFirmware *this@<X0>, uint64_t a2@<X8>)
{
  const char *v5;
  ACFULogging *v6;
  ACFULogging *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  ACFULogging *v25;
  _QWORD v26[6];
  unint64_t v27;
  unint64_t v28;
  unint64_t v29[2];
  uint64_t v30;
  _QWORD v31[2];
  char v32[16];
  uint64_t v33;
  __int128 v34;
  char *v35;

  ACFULogging::getLogInstance(this);
  v5 = "VinylFirmware";
  ACFULogging::handleMessage();
  v34 = 0uLL;
  v35 = 0;
  v31[0] = CFDataGetMutableBytePtr(this);
  v31[1] = CFDataGetLength(this);
  v30 = 0;
  v6 = (ACFULogging *)DERParseSequence((uint64_t)v31, 2u, (uint64_t)&eUICC::DER::vinylFirmwareImageItemSpec, (unint64_t)v32, 0x20uLL);
  if ((_DWORD)v6 || (v6 = (ACFULogging *)DERDecodeSeqInit((uint64_t)&v33, &v30, v29), (_DWORD)v6))
  {
    ACFULogging::getLogInstance(v6);
    v25 = (ACFULogging *)ACFULogging::handleMessage();
  }
  else
  {
    while (1)
    {
      v7 = (ACFULogging *)DERDecodeSeqNext(v29, &v27);
      if ((_DWORD)v7 == 1)
      {
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
        *(_OWORD *)a2 = v34;
        *(_QWORD *)(a2 + 16) = v35;
        return;
      }
      if ((_DWORD)v7)
        break;
      v7 = (ACFULogging *)DERParseSequenceContent(&v28, 3u, (uint64_t)&eUICC::DER::vinylFirmwareImageAPDUItemSpec, (unint64_t)v26, 0x30uLL);
      if ((_DWORD)v7)
        break;
      v9 = v26[0];
      v8 = v26[1];
      v11 = v26[2];
      v10 = v26[3];
      v12 = (_QWORD *)*((_QWORD *)&v34 + 1);
      if (*((_QWORD *)&v34 + 1) >= (unint64_t)v35)
      {
        v14 = v5;
        v15 = (uint64_t)(*((_QWORD *)&v34 + 1) - v34) >> 5;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 59)
          std::vector<char *>::__throw_length_error[abi:ne180100]();
        v17 = (uint64_t)&v35[-v34];
        if ((uint64_t)&v35[-v34] >> 4 > v16)
          v16 = v17 >> 4;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0)
          v18 = 0x7FFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        if (v18)
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VinylFirmware::APDU>>((uint64_t)&v35, v18);
        else
          v19 = 0;
        v20 = &v19[32 * v15];
        *(_QWORD *)v20 = v9;
        *((_QWORD *)v20 + 1) = v8;
        *((_QWORD *)v20 + 2) = v11;
        *((_QWORD *)v20 + 3) = v10;
        v21 = (char *)*((_QWORD *)&v34 + 1);
        v22 = (char *)v34;
        v23 = v20;
        v5 = v14;
        if (*((_QWORD *)&v34 + 1) != (_QWORD)v34)
        {
          do
          {
            v24 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v23 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v23 - 1) = v24;
            v23 -= 32;
            v21 -= 32;
          }
          while (v21 != v22);
          v21 = v22;
        }
        v13 = v20 + 32;
        *(_QWORD *)&v34 = v23;
        *((_QWORD *)&v34 + 1) = v20 + 32;
        v35 = &v19[32 * v18];
        if (v21)
          operator delete(v21);
      }
      else
      {
        **((_QWORD **)&v34 + 1) = v26[0];
        v12[1] = v8;
        v13 = v12 + 4;
        v12[2] = v11;
        v12[3] = v10;
      }
      *((_QWORD *)&v34 + 1) = v13;
    }
    ACFULogging::getLogInstance(v7);
    v25 = (ACFULogging *)ACFULogging::handleMessage();
  }
  ACFULogging::getLogInstance(v25);
  ACFULogging::handleMessage();
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if ((_QWORD)v34)
  {
    *((_QWORD *)&v34 + 1) = v34;
    operator delete((void *)v34);
  }
}

void sub_222D4E824(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 112);
  if (v3)
  {
    *(_QWORD *)(v1 - 104) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *VinylFirmware::getVersionString@<X0>(CFMutableDataRef *this@<X0>, _QWORD *a2@<X8>)
{
  ACFULogging *v4;
  _QWORD *result;
  _QWORD v6[2];
  void *v7[6];
  unint64_t v8[4];

  v6[0] = CFDataGetMutableBytePtr(this[15]);
  v6[1] = CFDataGetLength(this[15]);
  v4 = (ACFULogging *)DERParseSequence((uint64_t)v6, 2u, (uint64_t)&eUICC::DER::vinylFirmwareImageItemSpec, (unint64_t)v8, 0x20uLL);
  if (!(_DWORD)v4)
  {
    v4 = (ACFULogging *)DERParseSequenceContent(v8, 3u, (uint64_t)&eUICC::DER::vinylFirmwareImageHeaderItemSpec, (unint64_t)v7, 0x30uLL);
    if (!(_DWORD)v4)
      return std::string::basic_string[abi:ne180100](a2, v7[0], (size_t)v7[1]);
  }
  ACFULogging::getLogInstance(v4);
  result = (_QWORD *)ACFULogging::handleMessage();
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return result;
}

void VinylFirmware::bootloaderVersion(VinylFirmware *this@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  std::string *v5;
  __int128 v6;
  std::string *p_p;
  std::string::size_type size;
  std::string *v9;
  std::string __p;
  std::string v11;
  std::string v12;

  std::to_string(&v11, (int)this);
  v5 = std::string::append(&v11, ".");
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v9 = std::string::append(&v12, (const std::string::value_type *)p_p, size);
  *a3 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

void sub_222D4E9FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

const void **VinylFirmware::generateMeasurementDict@<X0>(VinylFirmware *this@<X0>, const __CFData *a2@<X1>, __CFDictionary **a3@<X8>)
{
  __CFDictionary *Mutable;
  ACFULogging *v8;
  uint64_t (*v9)(uint64_t);
  CFDataRef v10;
  __CFDictionary *v11;
  CFMutableDictionaryRef v12;
  ACFULogging *v13;
  uint64_t (*v14)(uint64_t);
  ACFULogging *v15;
  CFDataRef v16;
  __CFDictionary *v17;
  CFMutableDictionaryRef v18;
  uint64_t (*v19)(uint64_t);
  ACFULogging *v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  ACFULogging *v25;
  std::string v27;
  std::string v28;
  void *__p[2];
  std::string::size_type v30;
  CFMutableDictionaryRef v31;
  CFMutableDictionaryRef theDict;
  UInt8 bytes[32];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v31 = 0;
  theDict = 0;
  *a3 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *a3 = Mutable;
  __p[0] = 0;
  v8 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  if (Mutable)
    v9 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  else
    v9 = 0;
  if (!v9 || (CFDataGetBytePtr(this), CFDataGetLength(this), v8 = (ACFULogging *)AMSupportDigestSha256(), (_DWORD)v8))
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    goto LABEL_26;
  }
  v10 = CFDataCreate(0, bytes, 32);
  v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = theDict;
  theDict = v11;
  __p[0] = v12;
  v13 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
  if (v10
    && ((v13 = theDict) != 0
      ? (v14 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
      : (v14 = 0),
        v14))
  {
    CFDictionarySetValue(theDict, CFSTR("Digest"), v10);
    CFDictionarySetValue(Mutable, CFSTR("eUICC,Gold"), theDict);
    CFDataGetBytePtr(a2);
    CFDataGetLength(a2);
    v15 = (ACFULogging *)AMSupportDigestSha256();
    if (!(_DWORD)v15)
    {
      v16 = CFDataCreate(0, bytes, 32);
      v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v18 = v31;
      v31 = v17;
      __p[0] = v18;
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
      if (v31)
        v19 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
      else
        v19 = 0;
      if (v19 && v16)
      {
        CFDictionarySetValue(v31, CFSTR("Digest"), v16);
        CFDictionarySetValue(Mutable, CFSTR("eUICC,Main"), v31);
        ACFULogging::getLogInstance(v20);
        std::string::basic_string[abi:ne180100]<0>(&v27, "VinylFirmware");
        v21 = std::string::append(&v27, "::");
        v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        v28.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        v23 = std::string::append(&v28, "generateMeasurementDict");
        v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
        v30 = v23->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v24;
        v23->__r_.__value_.__l.__size_ = 0;
        v23->__r_.__value_.__r.__words[2] = 0;
        v23->__r_.__value_.__r.__words[0] = 0;
        v25 = (ACFULogging *)ACFULogging::handleMessageCFType();
        if (SHIBYTE(v30) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v28.__r_.__value_.__l.__data_);
        if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v27.__r_.__value_.__l.__data_);
        ACFULogging::getLogInstance(v25);
        ACFULogging::handleMessage();
      }
      else
      {
        ACFULogging::getLogInstance(v31);
        ACFULogging::handleMessage();
      }
      goto LABEL_24;
    }
    ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage();
  }
  else
  {
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
    if (!v10)
      goto LABEL_26;
  }
  v16 = 0;
LABEL_24:
  CFRelease(v10);
  if (v16)
    CFRelease(v16);
LABEL_26:
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v31);
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
}

void sub_222D4EDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,const void *a31,const void *a32)
{
  const void **v32;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(v32);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a31);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a32);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::generateMeasurement@<X0>(VinylFirmware *this@<X0>, CFDataRef *a2@<X8>)
{
  ACFULogging *v5;
  const void **v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  ACFULogging *v11;
  std::string v13;
  std::string v14;
  void *__p[2];
  std::string::size_type v16;
  UInt8 bytes[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  *a2 = 0;
  CFDataGetBytePtr(this);
  CFDataGetLength(this);
  v5 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v5)
  {
    ACFULogging::getLogInstance(v5);
    return ACFULogging::handleMessage();
  }
  else
  {
    *a2 = CFDataCreate(0, bytes, 32);
    __p[0] = 0;
    v6 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
    ACFULogging::getLogInstance((ACFULogging *)v6);
    std::string::basic_string[abi:ne180100]<0>(&v13, "VinylFirmware");
    v7 = std::string::append(&v13, "::");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v14, "generateMeasurement");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v16 = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v11 = (ACFULogging *)ACFULogging::handleMessageCFType();
    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    ACFULogging::getLogInstance(v11);
    return ACFULogging::handleMessage();
  }
}

void sub_222D4F040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  const void **v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(v30);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<VinylFirmware::APDU>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
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

void sub_222D4F1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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
    block[3] = &unk_24EB7A570;
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

void sub_222D4F588(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  __cxa_free_exception(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_222D4F6F8(_Unwind_Exception *a1)
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
  block[3] = &unk_24EB7A598;
  block[4] = &v11;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v7, block);
  v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_222D4F7F0(_Unwind_Exception *a1)
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

  *(_QWORD *)this = off_24EB7A5C8;
  v2 = *((_QWORD *)this + 4);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 3);
  if (v3)
    dispatch_release(v3);
  eUICC::eUICCVinylValve::~eUICCVinylValve(this);
}

const void **ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

eUICC::eUICCVinylICEValve *eUICC::eUICCVinylICEValve::eUICCVinylICEValve(eUICC::eUICCVinylICEValve *this, void *a2, int a3, char a4)
{
  eUICC::VinylCommandDriver **v5;
  int v6;
  eUICC::VinylCommandDriver *v7;

  *((_BYTE *)this + 288) = 0;
  *((_BYTE *)this + 304) = 0;
  *(_QWORD *)this = &off_24EB7A620;
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

void sub_222D4F958(_Unwind_Exception *a1)
{
  eUICC::eUICCVinylValve *v1;
  eUICC::VinylCommandDriver **v2;
  void *v3;

  operator delete(v3);
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](v2, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve(v1);
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
  v0 = off_255775448;
  if (!off_255775448)
  {
    v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v11, (uint64_t)v1);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&off_255775448, &v11);
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
    v0 = off_255775448;
  }
  v5 = (std::__shared_weak_count *)off_255775450;
  if (off_255775450)
  {
    v6 = (unint64_t *)((char *)off_255775450 + 8);
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

void sub_222D4FA8C(_Unwind_Exception *a1)
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
  return MEMORY[0x22767DC04](v28);
}

void sub_222D4FD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  MEMORY[0x22767DC04](va);
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
  MEMORY[0x22767DCAC](v30);
  return v17;
}

void sub_222D500D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  MEMORY[0x22767DCAC](va);
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
  MEMORY[0x22767DC64](v10);
  return v4;
}

void sub_222D501B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  MEMORY[0x22767DC64](va);
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
  MEMORY[0x22767DBD4](v29);
  return v22;
}

void sub_222D50414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  MEMORY[0x22767DBD4](va);
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

void sub_222D504EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
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
  MEMORY[0x22767DBD4](v31);
  return v26;
}

void sub_222D50758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  MEMORY[0x22767DBD4](va);
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

void sub_222D50834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::InstallTicket(_DWORD *a1, CFDataRef *a2)
{
  uint64_t (*v4)(uint64_t);
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
  uint64_t v17;
  _WORD *v18;
  void *v19;
  _WORD *v20;
  void *v21;
  const UInt8 *BytePtr;
  unint64_t Length;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _WORD *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
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
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  __n128 v50;
  uint64_t v51;
  _DWORD **v52;
  _BYTE v53[64];
  void *v54;
  void *__p;
  void *v56;
  void *v57;
  uint64_t v58;
  const void *__src[37];

  __src[36] = *(const void **)MEMORY[0x24BDAC8D0];
  AriSdk::ARI_IBIVinylInstallVadReq_SDK::ARI_IBIVinylInstallVadReq_SDK((AriSdk::ARI_IBIVinylInstallVadReq_SDK *)v53);
  v52 = 0;
  if (*a2)
    v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v4 = 0;
  if (!v4)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"installTicket");
LABEL_17:
    v8 = 2;
    goto LABEL_18;
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket\n", v5, v6, v7, v47);
  (*(void (**)(const void **__return_ptr, _DWORD *))(*(_QWORD *)a1 + 8))(__src, a1);
  memcpy(a1 + 2, __src, 0x119uLL);
  if (a1[2] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"outData.Valid()");
    v8 = 18;
    goto LABEL_18;
  }
  if (*((_BYTE *)a1 + 31))
  {
    v8 = (*(uint64_t (**)(_DWORD *, _QWORD, _QWORD))(*(_QWORD *)a1 + 16))(a1, 0, 0);
    if ((_DWORD)v8)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"kBBUReturnSuccess == ret");
      goto LABEL_18;
    }
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v54, a1 + 73);
  v18 = operator new(2uLL);
  *v18 = 1;
  v19 = __p;
  __p = v18;
  if (v19)
    operator delete(v19);
  v20 = operator new(2uLL);
  *v20 = 0;
  v21 = v56;
  v56 = v20;
  if (v21)
    operator delete(v21);
  BytePtr = CFDataGetBytePtr(*a2);
  Length = CFDataGetLength(*a2);
  if (Length >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Ticket provided is larger than spec. [ %lu (lenth) > %lu (spec max) ] \n", v24, v25, v26, Length);
    goto LABEL_17;
  }
  v28 = operator new(2uLL);
  *v28 = Length;
  v29 = v57;
  v57 = v28;
  if (v29)
    operator delete(v29);
  memset(__src, 0, 24);
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(__src, BytePtr, (uint64_t)&BytePtr[Length], Length);
  v51 = 0;
  v50 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&v50, __src[0], (uint64_t)__src[1], (char *)__src[1] - (char *)__src[0]);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v58, &v50, v30);
  if (v50.n128_u64[0])
  {
    v50.n128_u64[1] = v50.n128_u64[0];
    operator delete((void *)v50.n128_u64[0]);
  }
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket InstallVad \n", v31, v32, v33, v48);
  v34 = eUICC::VinylCommandDriver::InstallVad();
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "eUICCVinylICEValve::InstallTicket InstallVad status %d\n", v35, v36, v37, v34);
  if ((v34 & 1) != 0)
  {
    if (*v52[9])
    {
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "InstallTicket result 0x%x sw1_sw2 0x%hx\n", v38, v39, v40, *v52[9]);
      v8 = 16;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v41, v42, v43, (char)"status");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "InstallTicket failed to get desired response\n", v44, v45, v46, v49);
    v8 = 11;
  }
  if (__src[0])
  {
    __src[1] = __src[0];
    operator delete((void *)__src[0]);
  }
  if (v52)
    (*((void (**)(_DWORD **))*v52 + 2))(v52);
LABEL_18:
  MEMORY[0x22767DC4C](v53);
  return v8;
}

void sub_222D50CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  if (__p)
    operator delete(__p);
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  MEMORY[0x22767DC4C](&a17);
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

void sub_222D50DD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::StreamFirmware(eUICC::eUICCVinylICEValve *this, __CFData *a2)
{
  char *v3;
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  size_t v22;
  char *v23;
  size_t *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  const void *v29;
  char *v30;
  size_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _WORD *v36;
  void *v37;
  _WORD *v38;
  void *v39;
  _WORD *v40;
  void *v41;
  _BYTE *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  char v66[4];
  unsigned int v67;
  _QWORD *v68;
  uint64_t v69;
  void **v70;
  _DWORD *v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  _DWORD **v77;
  _QWORD v78[38];

  v78[36] = *MEMORY[0x24BDAC8D0];
  v77 = 0;
  VinylFirmware::getFirmwareAPDUs(a2, (uint64_t)&v75);
  v4 = v75;
  v3 = v76;
  (*(void (**)(_QWORD *__return_ptr, eUICC::eUICCVinylICEValve *))(*(_QWORD *)this + 8))(v78, this);
  memcpy((char *)this + 8, v78, 0x119uLL);
  if (*((_DWORD *)this + 2) != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"outData.Valid()");
    v9 = 18;
    goto LABEL_38;
  }
  if (*((_BYTE *)this + 31) == 1)
  {
    v5 = 18;
  }
  else
  {
    v9 = (*(uint64_t (**)(eUICC::eUICCVinylICEValve *, _QWORD, _QWORD))(*(_QWORD *)this + 16))(this, 0, 0);
    if ((_DWORD)v9)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"kBBUReturnSuccess == ret");
      goto LABEL_38;
    }
    v5 = 0;
  }
  v13 = (v3 - v4) >> 5;
  v14 = *((unsigned __int8 *)this + 304);
  v73 = v13;
  if (v13 % v14)
    v15 = v13 / v14 + 1;
  else
    v15 = v13 / v14;
  if (v15)
  {
    v67 = v5;
    v74 = 0;
    v16 = 0;
    v68 = &v78[13];
    v69 = v15;
    v70 = (void **)&v78[8];
    v71 = (_DWORD *)((char *)this + 292);
    while (1)
    {
      v17 = AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK((AriSdk::ARI_IBIVinylInstallFwReq_SDK *)v78);
      v72 = v66;
      v18 = *((unsigned __int8 *)this + 304);
      v19 = v73 - (v16 * v18) >= v18 ? *((unsigned __int8 *)this + 304) : v73 - (v16 * v18);
      MEMORY[0x24BDAC7A8](v17);
      v21 = &v66[-v20];
      bzero(&v66[-v20], v22);
      AriSdk::Tlv<unsigned int>::operator=<int &,void>(v70, v71);
      v23 = v21;
      if (v19)
        break;
LABEL_23:
      gBBULogMaskGet();
      v32 = v69;
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v33, v34, v35, v16);
      v36 = operator new(2uLL);
      *v36 = v32;
      v37 = (void *)v78[9];
      v78[9] = v36;
      if (v37)
        operator delete(v37);
      v38 = operator new(2uLL);
      *v38 = v16;
      v39 = (void *)v78[10];
      v78[10] = v38;
      if (v39)
        operator delete(v39);
      v40 = operator new(2uLL);
      *v40 = (_WORD)v23 - (_WORD)v21;
      v41 = (void *)v78[12];
      v78[12] = v40;
      if (v41)
        operator delete(v41);
      AriSdk::TlvArray<unsigned char,3930ul>::assign<unsigned char *>(v68, v21, v23);
      v42 = operator new(1uLL);
      *v42 = v19;
      v43 = (void *)v78[11];
      v78[11] = v42;
      if (v43)
        operator delete(v43);
      if ((eUICC::VinylCommandDriver::StreamFW() & 1) == 0)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v54, v55, v56, (char)"status");
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "StreamFirmware failed\n", v57, v58, v59, v66[0]);
        v9 = 11;
        goto LABEL_36;
      }
      if (*v77[9])
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v60, v61, v62, (char)"!GET_RSP_FIELD(rsp, result_t3)");
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed StreamAPDU set %d/%zu, status %d sw1_sw2 0x%x \n", v63, v64, v65, v16);
        v9 = 16;
        goto LABEL_36;
      }
      (*((void (**)(_DWORD **))*v77 + 2))(v77);
      v77 = 0;
      MEMORY[0x22767DC34](v78);
      v9 = 0;
      ++v16;
      v74 += 32;
      if (v32 <= v16)
        goto LABEL_38;
    }
    v24 = (size_t *)&v75[v74 * *((unsigned __int8 *)this + 304) + 24];
    v25 = v73 - (v16 * v18);
    if (v25 >= v18)
      v25 = v18;
    v26 = 32 * v25;
    v23 = v21;
    while (1)
    {
      v27 = *(v24 - 2);
      if (v27 > 5 || *v24 >= 0x100)
        break;
      v28 = &v23[v27 + *v24];
      *v23 = v27;
      memcpy(v23 + 1, (const void *)*(v24 - 3), *(v24 - 2));
      v23[*(v24 - 2) + 1] = *(_BYTE *)v24;
      v29 = (const void *)*(v24 - 1);
      v30 = &v23[*(v24 - 2) + 2];
      v31 = *v24;
      v24 += 4;
      memcpy(v30, v29, v31);
      v23 = v28 + 2;
      v26 -= 32;
      if (!v26)
        goto LABEL_23;
    }
    gBBULogMaskGet();
    v9 = v67;
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"f.header.length <= 5 && f.data.length <= 255");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Firmware APDU not within expected bounds : received (header - 5 : %zu data- 255 : %zu\n", v47, v48, v49, *(v24 - 2));
LABEL_36:
    MEMORY[0x22767DC34](v78);
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v50, v51, v52, (char)"apduSetCount");
    v9 = 15;
  }
LABEL_38:
  if (v77)
    (*((void (**)(_DWORD **))*v77 + 2))(v77);
  v77 = 0;
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
  return v9;
}

void sub_222D51424(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  MEMORY[0x22767DC34](v1 + 96);
  v3 = *(void **)(v1 + 64);
  if (v3)
  {
    *(_QWORD *)(v1 + 72) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(a1);
}

BOOL AriSdk::TlvArray<unsigned char,3930ul>::assign<unsigned char *>(_QWORD *a1, char *a2, char *a3)
{
  unint64_t v4;
  const char *v5;
  void *p_p;
  void *__p;
  char v9;

  v4 = a3 - a2;
  if ((unint64_t)(a3 - a2) >= 0xF5B)
  {
    AriOsa::LogSrcInfo((AriOsa *)"/AppleInternal/Library/BuildRoots/1ce10175-54cc-11ef-a474-76625042721f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
    if (v9 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v5, p_p, 385, a1, v4, 3930);
    if (v9 < 0)
      operator delete(__p);
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a1, a2, a3, a3 - a2);
  }
  return v4 < 0xF5B;
}

void sub_222D51520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylICEValve::InitPerso(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  _BYTE *v14;
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

  AriSdk::ARI_IBIVinylInitPsoReq_SDK::ARI_IBIVinylInitPsoReq_SDK((AriSdk::ARI_IBIVinylInitPsoReq_SDK *)v36);
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
  v12 = operator new(1uLL);
  *v12 = 0;
  v13 = __p;
  __p = v12;
  if (v13)
    operator delete(v13);
  v14 = operator new(1uLL);
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
  if ((eUICC::VinylCommandDriver::InitPerso() & 1) != 0)
  {
    if (**(_DWORD **)(v35 + 72) || (v32 = *(_WORD **)(v35 + 88), !*v32))
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"!GET_RSP_FIELD(rsp, result_t3) && GET_RSP_FIELD(rsp, sim_rsp_len_t5)");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to InitPerso status %d SW1_SW2 0x%x rsp_len %u\n", v24, v25, v26, **(_DWORD **)(v35 + 72));
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
  MEMORY[0x22767DC1C](v36);
  return v27;
}

void sub_222D517B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  MEMORY[0x22767DC1C](&a18);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::AuthPerso(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  _BYTE *v14;
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

  AriSdk::ARI_IBIVinylAuthPsoReq_SDK::ARI_IBIVinylAuthPsoReq_SDK((AriSdk::ARI_IBIVinylAuthPsoReq_SDK *)v36);
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
  v12 = operator new(1uLL);
  *v12 = 0;
  v13 = __p;
  __p = v12;
  if (v13)
    operator delete(v13);
  v14 = operator new(1uLL);
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
  if ((eUICC::VinylCommandDriver::AuthPerso() & 1) != 0)
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
  MEMORY[0x22767DBEC](v36);
  return v27;
}

void sub_222D51A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  MEMORY[0x22767DBEC](&a18);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylICEValve::FinalizePerso(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  _WORD *v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  const char *v18;
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
  __n128 v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[64];
  void *v35;
  void *__p;
  void *v37;
  void *v38;
  uint64_t v39;

  AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::ARI_IBIVinylFinalizePsoReq_SDK((AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *)v34);
  v33 = 0;
  v4 = a2[1];
  v5 = v4 - *a2;
  v6 = (unsigned __int16)(v4 - *(_WORD *)a2);
  if (v6 >= 0xE01)
  {
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Payload too large -- payload_size: %d  max allowed: %lu)\n", v7, v8, v9, v5);
LABEL_14:
    v26 = 18;
    goto LABEL_16;
  }
  AriSdk::Tlv<unsigned int>::operator=<int &,void>(&v35, (_DWORD *)(a1 + 292));
  v10 = operator new(1uLL);
  *v10 = 0;
  v11 = __p;
  __p = v10;
  if (v11)
    operator delete(v11);
  v12 = operator new(1uLL);
  *v12 = 0;
  v13 = v37;
  v37 = v12;
  if (v13)
    operator delete(v13);
  v14 = operator new(2uLL);
  *v14 = v5;
  v15 = v38;
  v38 = v14;
  if (v15)
    operator delete(v15);
  v16 = (const void *)*a2;
  v17 = *a2 + v6;
  v32 = 0;
  v31 = 0uLL;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&v31, v16, v17, v6);
  AriSdk::TlvArray<unsigned char,3584ul>::operator=((uint64_t)&v39, &v31, v18);
  if (v31.n128_u64[0])
  {
    v31.n128_u64[1] = v31.n128_u64[0];
    operator delete((void *)v31.n128_u64[0]);
  }
  if ((eUICC::VinylCommandDriver::FinalizePerso() & 1) != 0)
  {
    v19 = v33;
    if (!**(_DWORD **)(v33 + 72))
    {
      v26 = 0;
      goto LABEL_17;
    }
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v20, v21, v22, (char)"!GET_RSP_FIELD(rsp, result_t3)");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Failed to FinalizePerso status %d SW1_SW2 0x%x\n", v23, v24, v25, **(_DWORD **)(v33 + 72));
    goto LABEL_14;
  }
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylICEValve", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"status");
  v26 = 11;
LABEL_16:
  v19 = v33;
  if (v33)
LABEL_17:
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
  MEMORY[0x22767DC7C](v34);
  return v26;
}

void sub_222D51CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p)
    operator delete(__p);
  MEMORY[0x22767DC7C](&a18);
  _Unwind_Resume(a1);
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
  MEMORY[0x22767DC94](v36);
  return v27;
}

void sub_222D51F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  MEMORY[0x22767DC94](&a18);
  _Unwind_Resume(a1);
}

void eUICC::eUICCVinylICEValve::~eUICCVinylICEValve(eUICC::VinylCommandDriver **this)
{
  *this = (eUICC::VinylCommandDriver *)&off_24EB7A620;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);
}

{
  *this = (eUICC::VinylCommandDriver *)&off_24EB7A620;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);
}

{
  void *v2;

  *this = (eUICC::VinylCommandDriver *)&off_24EB7A620;
  std::unique_ptr<eUICC::VinylCommandDriver>::reset[abi:ne180100](this + 39, 0);
  eUICC::eUICCVinylValve::~eUICCVinylValve((eUICC::eUICCVinylValve *)this);
  operator delete(v2);
}

_QWORD *std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24EB7A6C0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_222D520C8(_Unwind_Exception *exception_object)
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
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

void sub_222D523EC(_Unwind_Exception *exception_object)
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
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

_QWORD *BBUCapabilities::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  _DWORD *v3;

  v3 = operator new(4uLL);
  *v3 = TelephonyRadiosGetProduct();
  return std::shared_ptr<BBUCapabilities>::shared_ptr[abi:ne180100]<BBUCapabilities,void>(a1, (uint64_t)v3);
}

void sub_222D524C4(_Unwind_Exception *a1)
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
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(&v12);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v12);
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
  v5 = (std::__shared_weak_count *)off_255775500;
  if (off_255775500)
  {
    v6 = (unint64_t *)((char *)off_255775500 + 8);
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

void sub_222D5261C(_Unwind_Exception *a1)
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
  *v4 = off_24EB7A738;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_222D52724(_Unwind_Exception *exception_object)
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
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100](a1 + 64);
  return a1;
}

uint64_t __cxx_global_var_init_1()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
  }
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

void sub_222D528F8(_Unwind_Exception *a1)
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

void sub_222D5299C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::getEID(uint64_t a1)
{
  __CFDictionary **v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::string *p_p;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  std::string v28;
  const void *v29;
  std::string __p;
  char buffer[8192];
  _QWORD v32[34];
  char v33;
  uint64_t v34;

  v1 = (__CFDictionary **)MEMORY[0x24BDAC7A8](a1);
  v34 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)v2 + 8))(v32);
  if (LODWORD(v32[0]) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    eUICC::stringifyDataBuffer((eUICC *)((char *)v32 + 7), v3);
    gBBULogMaskGet();
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      LOBYTE(p_p) = __p.__r_.__value_.__s.__data_[0];
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "EID: %s\n", v4, v5, v6, (char)p_p);
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v28 = __p;
      v14 = (const void *)eUICC::copyAsCFString();
      v29 = v14;
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
      CFDictionarySetValue(Mutable, CFSTR("EID"), v14);
      *v1 = Mutable;
      v15 = CFStringCreateWithFormat(v8, 0, CFSTR("%@"), Mutable);
      v16 = v15;
      if (v15)
      {
        if (CFStringGetCString(v15, buffer, 0x2000, 0x8000100u))
        {
          gBBULogMaskGet();
          _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "client rsp data: %s\n", v17, v18, v19, (char)buffer);
        }
        CFRelease(v16);
      }
      ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v29);
    }
    else
    {
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "eUICCVinylFactory", "", "check failed: %s, %d, assertion: %s\n", v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/CommandDrivers/eUICCCommon.cpp");
      if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
        _BBULog(0, 1, "eUICCVinylFactory", "", "Failed to allocate shared info dict\n", v23, v24, v25, v27);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    if (!v33)
      return 107;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylFactory", "", "eUICC not stuffed but that's ok!\n", v10, v11, v12, v26);
  }
  return 0;
}

void sub_222D52CB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
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
  return MEMORY[0x22767DF10](&v11);
}

void sub_222D52E28(_Unwind_Exception *a1, uint64_t a2, ...)
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
  v4 = (void *)qword_2557754F8;
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(v23);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, v23);
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
    v4 = (void *)qword_2557754F8;
  }
  v8 = (std::__shared_weak_count *)off_255775500;
  __p[0] = v4;
  __p[1] = off_255775500;
  if (off_255775500)
  {
    v9 = (unint64_t *)((char *)off_255775500 + 8);
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

void sub_222D53048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
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

void sub_222D531A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x22767DF10](v1);
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

void sub_222D5325C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
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
  MEMORY[0x22767DF10](a1 + 128);
  return a1;
}

uint64_t __cxx_global_var_init_2()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

uint64_t __cxx_global_var_init_12()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
  }
  return result;
}

_QWORD *VinylUpdaterCreate(const __CFDictionary *a1, void (*a2)(void *, const char *), void *a3, ACFULogging **a4)
{
  const __CFDictionary **v8;
  ACFULogging *v9;
  const __CFAllocator *v10;
  ACFULogging *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t (*v13)(uint64_t);
  ACFULogging *v14;
  ACFULogging *LogInstance;
  int inited;
  char v17;
  ACFULogging *v18;
  _QWORD *Instance;
  ACFULogging *CFError;
  ACFULogging *v21;
  const __CFDictionary *v22;
  VinylRestore *v23;
  void **v25;
  _QWORD v26[2];
  char v27;
  _QWORD v28[2];
  char v29;
  _QWORD v30[2];
  char v31;
  _QWORD v32[2];
  char v33;
  CFMutableDictionaryRef theDict;
  CFDictionaryRef v35;
  void *values;
  void *keys;
  const void *v38;
  _BYTE v39[16];
  const void *Value;

  MEMORY[0x22767DCD0](v39, CFSTR("VinylUpdaterCreate"));
  Value = CFDictionaryGetValue(a1, CFSTR("RestoreOptions"));
  v8 = (const __CFDictionary **)ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v38, &Value);
  BBULogParseDebugArgs(v8);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v38);
  v9 = (ACFULogging *)BBULogModuleEnabled(22);
  if ((_DWORD)v9)
  {
    values = 0;
    keys = CFSTR("ACFUDebugArgs");
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    values = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("logLevel=%d"), 4);
    v35 = CFDictionaryCreate(v10, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Value = 0;
    ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&Value);
    theDict = CFDictionaryCreateMutable(v10, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    Value = 0;
    v11 = (ACFULogging *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&Value);
    v12 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
    if (!v35)
      v12 = 0;
    if (!v12)
      goto LABEL_25;
    v11 = theDict;
    v13 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
    if (!theDict)
      v13 = 0;
    if (v13)
    {
      CFDictionaryAddValue(theDict, CFSTR("Options"), v35);
      LogInstance = (ACFULogging *)ACFULogging::getLogInstance(v14);
      inited = ACFULogging::initLog(LogInstance, theDict, a2, a3);
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
      v17 = 1;
    }
    else
    {
LABEL_25:
      ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage();
      inited = 0;
      v17 = 0;
    }
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
    v18 = (ACFULogging *)ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v35);
    if ((v17 & 1) == 0)
    {
      Instance = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v21 = (ACFULogging *)ACFULogging::getLogInstance(v9);
    v18 = (ACFULogging *)ACFULogging::initLog(v21, a1, a2, a3);
    inited = (int)v18;
  }
  if (inited)
  {
    ACFULogging::getLogInstance(v18);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v32, "failed to init logging");
    v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v33 & 0x80000000) == 0)
      goto LABEL_13;
    v25 = (void **)v32;
LABEL_34:
    operator delete(*v25);
    goto LABEL_13;
  }
  if (VinylUpdaterCreate::only_once != -1)
    dispatch_once(&VinylUpdaterCreate::only_once, &__block_literal_global_0);
  if (!kVinylRestoreObjTypeID)
  {
    ACFULogging::getLogInstance(v18);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v30, "failed to create Vinyl CFRuntimeClass");
    v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v31 & 0x80000000) == 0)
      goto LABEL_13;
    v25 = (void **)v30;
    goto LABEL_34;
  }
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    std::string::basic_string[abi:ne180100]<0>(v28, "failed to create Vinyl CFType object");
    v18 = (ACFULogging *)ACFUError::addError();
    Instance = 0;
    if ((v29 & 0x80000000) == 0)
      goto LABEL_13;
    v25 = (void **)v28;
    goto LABEL_34;
  }
  v23 = VinylRestore::create(a1, v22);
  Instance[2] = v23;
  if (v23)
  {
    ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage();
    goto LABEL_24;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  std::string::basic_string[abi:ne180100]<0>(v26, "failed to get the Vinyl restore instance");
  v18 = (ACFULogging *)ACFUError::addError();
  if (v27 < 0)
  {
    v25 = (void **)v26;
    goto LABEL_34;
  }
LABEL_13:
  ACFULogging::getLogInstance(v18);
  ACFULogging::handleMessage();
  CFError = (ACFULogging *)ACFUError::getCFError((ACFUError *)v39);
  *a4 = CFError;
  if (Instance)
    CFRelease(Instance);
  ACFULogging::getLogInstance(CFError);
  ACFULogging::handleMessage();
  Instance = 0;
LABEL_24:
  MEMORY[0x22767DCDC](v39);
  return Instance;
}

void sub_222D537DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  uint64_t v37;

  if (a18 < 0)
    operator delete(__p);
  MEMORY[0x22767DCDC](v37 - 88);
  _Unwind_Resume(a1);
}

uint64_t VinylRestoreObjDestroy(ACFULogging *a1)
{
  ACFULogging *v2;
  ACFULogging *v3;

  ACFULogging::getLogInstance(a1);
  v2 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1)
  {
    v2 = (ACFULogging *)*((_QWORD *)a1 + 2);
    if (v2)
    {
      v3 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v2 + 8))(v2);
      ACFULogging::getLogInstance(v3);
      v2 = (ACFULogging *)ACFULogging::handleMessage();
      *((_QWORD *)a1 + 2) = 0;
    }
  }
  ACFULogging::getLogInstance(v2);
  return ACFULogging::handleMessage();
}

ACFULogging *VinylRestoreObjDescribe(ACFULogging *a1)
{
  ACFULogging *v1;
  ACFULogging *v2;
  const __CFAllocator *v3;
  CFAllocatorRef v4;

  v1 = a1;
  ACFULogging::getLogInstance(a1);
  v2 = (ACFULogging *)ACFULogging::handleMessage();
  if (v1)
  {
    v3 = CFGetAllocator(v1);
    v4 = CFGetAllocator(v1);
    v2 = (ACFULogging *)CFStringCreateWithFormat(v3, 0, CFSTR("<VinylRestoreObj %p [%p]>{}"), v1, v4, "VinylRestoreObjDescribe");
    v1 = v2;
  }
  ACFULogging::getLogInstance(v2);
  ACFULogging::handleMessage();
  return v1;
}

uint64_t VinylUpdaterExecCommand(uint64_t a1, __CFString *theString)
{
  ACFULogging *CString;
  ACFULogging *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  char buffer[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CString = (ACFULogging *)CFStringGetCString(theString, buffer, 128, 0x8000100u);
  ACFULogging::getLogInstance(CString);
  v5 = (ACFULogging *)ACFULogging::handleMessage();
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    ACFURestore::restoreCommand((ACFURestore *)theString, v6);
    v7 = ACFURestore::executeCommand();
    if ((v7 & 1) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v7);
      v7 = ACFULogging::handleMessage();
      v8 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v5);
    v7 = ACFULogging::handleMessage();
  }
  v8 = 1;
LABEL_5:
  ACFULogging::getLogInstance((ACFULogging *)v7);
  ACFULogging::handleMessage();
  return v8;
}

uint64_t VinylUpdaterIsDone(ACFULogging *a1, uint64_t *a2)
{
  ACFULogging *v3;
  BBUCapabilities *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  ACFULogging *v11;
  char v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  ACFURestore *v15;
  ACFULogging *isRestoreComplete;
  ACFULogging *v17;
  void *__p;
  char v20;
  BBUCapabilities *v21;
  void *v22;
  __int128 v23;

  v3 = a1;
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v4 = (BBUCapabilities *)qword_2557754F8;
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(&v23);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v23);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v4 = (BBUCapabilities *)qword_2557754F8;
  }
  v8 = (std::__shared_weak_count *)off_255775500;
  v21 = v4;
  v22 = off_255775500;
  if (off_255775500)
  {
    v9 = (unint64_t *)((char *)off_255775500 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  v11 = BBUCapabilities::supportsVinylUpdate(v4);
  v12 = (char)v11;
  if (!v8)
    goto LABEL_15;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (v14)
  {
LABEL_15:
    if ((v11 & 1) != 0)
      goto LABEL_16;
LABEL_23:
    ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage();
    if (a2)
      *a2 = 0;
    return 1;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  if ((v12 & 1) == 0)
    goto LABEL_23;
LABEL_16:
  if (v3)
  {
    v15 = (ACFURestore *)*((_QWORD *)v3 + 2);
    if (v15)
    {
      if (VinylRestore::updateAllowed(*((VinylRestore **)v3 + 2)))
      {
        isRestoreComplete = (ACFULogging *)ACFURestore::isRestoreComplete(v15);
        v3 = isRestoreComplete;
        if (a2)
        {
          if (!(_DWORD)isRestoreComplete)
          {
            *a2 = 0;
            goto LABEL_35;
          }
          ACFURestore::getErrorHandle(v15);
          *a2 = ACFUError::getCFError((ACFUError *)v23);
          isRestoreComplete = (ACFULogging *)std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&v23);
        }
        else if (!(_DWORD)isRestoreComplete)
        {
LABEL_35:
          ACFULogging::getLogInstance(isRestoreComplete);
          ACFULogging::handleMessage();
          return (uint64_t)v3;
        }
        ACFULogging::getLogInstance(isRestoreComplete);
        isRestoreComplete = (ACFULogging *)ACFULogging::handleMessage();
        goto LABEL_35;
      }
    }
    else
    {
      v17 = (ACFULogging *)MEMORY[0x22767DCD0](&v23, CFSTR("VinylUpdaterIsDone"));
      ACFULogging::getLogInstance(v17);
      ACFULogging::handleMessage();
      std::string::basic_string[abi:ne180100]<0>(&__p, "VinylRestore object doesn't exist");
      ACFUError::addError();
      if (v20 < 0)
        operator delete(__p);
      if (a2)
        *a2 = ACFUError::getCFError((ACFUError *)&v23);
      MEMORY[0x22767DCDC](&v23);
    }
    return 1;
  }
  return (uint64_t)v3;
}

void sub_222D53DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, char a20)
{
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

uint64_t __cxx_global_var_init_3()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
  }
  return result;
}

FILE *vinyl_fopen_file_func(int a1, void *__buf, int a3, size_t __size)
{
  if (__buf)
    return fmemopen(__buf, __size, "rb");
  else
    return 0;
}

size_t vinyl_fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t vinyl_fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

void vinyl_ftell_file_func()
{
  JUMPOUT(0x22767E150);
}

uint64_t vinyl_fseek_file_func(int a1, FILE *a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 2)
    return -1;
  fseek(a2, a3, a4);
  return 0;
}

uint64_t vinyl_fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t vinyl_ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**vinyl_fill_fopen_filefunc(FILE *(**result)(int a1, void *__buf, int a3, size_t __size)))(int a1, void *__buf, int a3, size_t __size)
{
  *result = vinyl_fopen_file_func;
  result[1] = (FILE *(*)(int, void *, int, size_t))vinyl_fread_file_func;
  result[2] = (FILE *(*)(int, void *, int, size_t))vinyl_fwrite_file_func;
  result[3] = (FILE *(*)(int, void *, int, size_t))vinyl_ftell_file_func;
  result[4] = (FILE *(*)(int, void *, int, size_t))vinyl_fseek_file_func;
  result[5] = (FILE *(*)(int, void *, int, size_t))vinyl_fclose_file_func;
  result[6] = (FILE *(*)(int, void *, int, size_t))vinyl_ferror_file_func;
  result[7] = 0;
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

void sub_222D54044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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
    block[3] = &__block_descriptor_tmp_2;
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
  v3 = (BBUCapabilities *)qword_2557754F8;
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(&v17);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v17);
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
    v3 = (BBUCapabilities *)qword_2557754F8;
  }
  v7 = (std::__shared_weak_count *)off_255775500;
  if (off_255775500)
  {
    v8 = (unint64_t *)((char *)off_255775500 + 8);
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

void sub_222D5439C(_Unwind_Exception *a1)
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
  v2 = off_255775448;
  if (!off_255775448)
  {
    v3 = operator new(0x28uLL);
    v3[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v12, (uint64_t)v3);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&off_255775448, &v12);
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
    v2 = off_255775448;
  }
  v7 = (std::__shared_weak_count *)off_255775450;
  if (off_255775450)
  {
    v8 = (unint64_t *)((char *)off_255775450 + 8);
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

void sub_222D544DC(_Unwind_Exception *a1)
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
  block[3] = &unk_24EB7A8D8;
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

void sub_222D54768(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_222D548C0(_Unwind_Exception *a1)
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
  v0 = (unsigned __int8 *)off_255775448;
  if (!off_255775448)
  {
    v1 = operator new(0x28uLL);
    v1[32] = 0;
    std::shared_ptr<ICEARIContext>::shared_ptr[abi:ne180100]<ICEARIContext,void>(&v12, (uint64_t)v1);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&off_255775448, &v12);
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
    v0 = (unsigned __int8 *)off_255775448;
  }
  v5 = (std::__shared_weak_count *)off_255775450;
  if (off_255775450)
  {
    v6 = (unint64_t *)((char *)off_255775450 + 8);
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

void sub_222D54A0C(_Unwind_Exception *a1)
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
  block[3] = &unk_24EB7A900;
  block[4] = &v11;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v7, block);
  v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_222D54B20(_Unwind_Exception *a1)
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

  *(_QWORD *)this = off_24EB7A930;
  v2 = *((_QWORD *)this + 5);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 4);
  if (v3)
    dispatch_release(v3);
  eUICC::eUICCVinylValve::~eUICCVinylValve(this);
}

uint64_t __cxx_global_var_init_4()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

uint64_t __cxx_global_var_init_21()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
  }
  return result;
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
  v16[6] = xmmword_222D6FA40;
  v16[7] = unk_222D6FA50;
  v16[8] = xmmword_222D6FA60;
  v16[2] = xmmword_222D6FA00;
  v16[3] = unk_222D6FA10;
  v16[4] = xmmword_222D6FA20;
  v16[5] = unk_222D6FA30;
  v16[0] = xmmword_222D6F9E0;
  v16[1] = unk_222D6F9F0;
  v14[6] = xmmword_222D6FAD0;
  v14[7] = unk_222D6FAE0;
  v14[8] = xmmword_222D6FAF0;
  v14[9] = unk_222D6FB00;
  v14[2] = xmmword_222D6FA90;
  v14[3] = unk_222D6FAA0;
  v14[4] = xmmword_222D6FAB0;
  v14[5] = unk_222D6FAC0;
  v14[0] = xmmword_222D6FA70;
  v14[1] = unk_222D6FA80;
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
      std::vector<char *>::__throw_length_error[abi:ne180100]();
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

uint64_t _BBUException::_BBUException(uint64_t a1, int a2, char *a3, unsigned int a4, ctu::LogMessageBuffer *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(_DWORD *)(a1 + 520) = a2;
  *(_QWORD *)a1 = off_24EB7A988;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

{
  *(_DWORD *)(a1 + 520) = a2;
  *(_QWORD *)a1 = off_24EB7A988;
  _BBUException::constructCommon(a1, a2, a3, a4, a5, &a9);
  return a1;
}

void sub_222D551DC(_Unwind_Exception *a1)
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
  v10 = MEMORY[0x22767D9F4](&v40);
  v11 = *(_OWORD *)v10;
  v42.__r_.__value_.__r.__words[2] = *(_QWORD *)(v10 + 16);
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v11;
  *(_QWORD *)(v10 + 8) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)v10 = 0;
  MEMORY[0x22767DA0C](&v40);
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

void sub_222D554BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
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

void sub_222D555F0(_Unwind_Exception *a1)
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
  *(_QWORD *)this = off_24EB7A988;
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

void sub_222D5599C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
    operator delete(__p);
  if (*(char *)(v25 - 49) < 0)
    operator delete(*(void **)(v25 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t vinyl_unzStringFileNameCompare(const char *a1, const char *a2, int a3)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (a3 == 1)
    return strcmp(a1, a2);
  while (1)
  {
    v5 = *(unsigned __int8 *)a1++;
    v4 = v5;
    v7 = *(unsigned __int8 *)a2++;
    v6 = v7;
    if ((v4 - 97) < 0x1A)
      LOBYTE(v4) = v4 - 32;
    if ((v6 - 97) < 0x1A)
      LOBYTE(v6) = v6 - 32;
    if (!(_BYTE)v4)
      break;
    if (!(_BYTE)v6)
      return 1;
    if ((char)v4 < (char)v6)
      return 0xFFFFFFFFLL;
    if ((char)v4 > (char)v6)
      return 1;
  }
  if ((_BYTE)v6)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

_QWORD *vinyl_unzOpen2(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  _BYTE *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v33;
  int Long;
  int Short;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD __src[22];

  memset(__src, 0, 336);
  if (a2)
  {
    v5 = a2[1];
    __src[0] = *a2;
    __src[1] = v5;
    v6 = a2[3];
    __src[2] = a2[2];
    __src[3] = v6;
    v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&v6 + 1), a1, 5, a3);
  }
  else
  {
    vinyl_fill_fopen_filefunc((FILE *(**)(int, void *, int, size_t))__src);
    v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&__src[3] + 1), a1, 5, a3);
  }
  v8 = (_QWORD *)v7;
  *(_QWORD *)&__src[4] = v7;
  if (v7)
  {
    if (!(*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))&__src[2])(*((_QWORD *)&__src[3] + 1), v7, 0, 2))
    {
      v9 = (*((uint64_t (**)(_QWORD, _QWORD *))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v8);
      v10 = v9;
      v11 = v9 >= 0xFFFF ? 0xFFFFLL : v9;
      v12 = (char *)malloc(0x404uLL);
      if (v12)
      {
        v13 = v12;
        if (v11 >= 5)
        {
          v14 = v12 + 1;
          v15 = 4;
          do
          {
            v16 = v15 + 1024;
            v17 = v15 + 1024 >= v11 ? v11 : v15 + 1024;
            v18 = v17 >= 0x404 ? 1028 : v17;
            if ((*(uint64_t (**)(_QWORD, _QWORD *, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), v8, v10 - v17, 0)|| (*((uint64_t (**)(_QWORD, _QWORD *, _BYTE *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v8, v13, v18) != v18)
            {
              break;
            }
            if (v18 >= 4)
            {
              v19 = (v18 - 4);
              while (v13[v19] != 80 || v14[v19] != 75 || v14[v19 + 1] != 5 || v14[v19 + 2] != 6)
              {
                if (v19-- <= 0)
                  goto LABEL_28;
              }
              if (v10 - v17 + v19)
              {
                free(v13);
                v21 = v15 + 1024;
                if (v10 < v15 + 1024)
                  v21 = v10;
                if (v21 >= 0xFFFF)
                  v21 = 0xFFFFLL;
                v22 = v10 - v21 + v19;
                v37 = 1;
                goto LABEL_38;
              }
            }
LABEL_28:
            v15 = v17;
          }
          while (v11 > v16);
        }
        free(v13);
      }
    }
    v22 = 0;
    v37 = 0;
LABEL_38:
    v39 = 0;
    v40 = 0;
    v38 = 0;
    v33 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v22, 0);
    Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v41);
    Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v40);
    v36 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v39);
    v23 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], (_QWORD *)&__src[4] + 1);
    v24 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v38);
    v26 = v38;
    v25 = v39;
    v27 = v40;
    v28 = *((_QWORD *)&__src[4] + 1);
    v29 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
    v30 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
    v31 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &__src[5]);
    if (v22 < *(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1)
      || v31
      || v30
      || v29
      || v26 != v28
      || v25
      || v27
      || !v37
      || v24
      || v23
      || v36
      || Short
      || Long
      || v33)
    {
      (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
      return 0;
    }
    else
    {
      *((_QWORD *)&__src[5] + 1) = v22 - (*(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1));
      *((_QWORD *)&__src[7] + 1) = v22;
      *(_QWORD *)&__src[18] = 0;
      DWORD2(__src[18]) = 0;
      v8 = malloc(0x150uLL);
      memcpy(v8, __src, 0x150uLL);
      vinyl_unzGoToFirstFile(v8);
    }
  }
  return v8;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int v11;

  v11 = 0;
  if (unzlocal_getByte(a1, a2, &v11)
    || (v6 = v11, unzlocal_getByte(a1, a2, &v11))
    || (v7 = v11, unzlocal_getByte(a1, a2, &v11)))
  {
    v8 = 0;
    result = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v6 + (v7 << 8) + ((uint64_t)v11 << 16);
    result = unzlocal_getByte(a1, a2, &v11);
    v8 = v10 + ((uint64_t)v11 << 24);
    if ((_DWORD)result)
      v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t unzlocal_getShort(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int v9;

  v9 = 0;
  if (unzlocal_getByte(a1, a2, &v9))
  {
    v6 = 0;
    result = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = v9;
    result = unzlocal_getByte(a1, a2, &v9);
    v6 = v8 + ((uint64_t)v9 << 8);
    if ((_DWORD)result)
      v6 = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t vinyl_unzGoToFirstFile(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967194;
  v2 = a1[17];
  a1[12] = 0;
  a1[13] = v2;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

_QWORD *vinyl_unzOpen(uint64_t a1, uint64_t a2)
{
  return vinyl_unzOpen2(a1, 0, a2);
}

uint64_t vinyl_unzClose(uint64_t a1)
{
  if (!a1)
    return 4294967194;
  if (*(_QWORD *)(a1 + 288))
    vinyl_unzCloseCurrentFile(a1);
  (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  free((void *)a1);
  return 0;
}

uint64_t vinyl_unzCloseCurrentFile(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 4294967194;
  v2 = *(_QWORD *)(a1 + 288);
  if (!v2)
    return 4294967194;
  if (*(_QWORD *)(v2 + 184) || *(_DWORD *)(v2 + 280))
  {
    v3 = 0;
  }
  else if (*(_QWORD *)(v2 + 160) == *(_QWORD *)(v2 + 168))
  {
    v3 = 0;
  }
  else
  {
    v3 = 4294967191;
  }
  if (*(_QWORD *)v2)
    free(*(void **)v2);
  *(_QWORD *)v2 = 0;
  if (*(_QWORD *)(v2 + 128))
    inflateEnd((z_streamp)(v2 + 8));
  free((void *)v2);
  *(_QWORD *)(a1 + 288) = 0;
  return v3;
}

uint64_t vinyl_unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 4294967194;
  result = 0;
  *a2 = *(_OWORD *)(a1 + 72);
  return result;
}

uint64_t vinyl_unzGetCurrentFileInfo(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unzlocal_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  int v10;
  uint32x4_t v11;
  int8x16_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int8x16_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int Long;
  int v46;
  int v47;
  int v48;
  int Short;
  unsigned int v50;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int8x16_t v63;
  uint64_t v64;

  if (!a1)
    return 4294967194;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 104), 0)|| (v54 = 0, unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v54)))
  {
    v10 = -1;
  }
  else if (v54 == 33639248)
  {
    v10 = 0;
  }
  else
  {
    v10 = -103;
  }
  v50 = v10;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = 0;
  Short = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v56);
  v48 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v56 + 1);
  v47 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v57);
  v46 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v57 + 1);
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v58);
  LODWORD(v64) = ((v58 >> 21) & 0xF) - 1;
  HIDWORD(v64) = (v58 >> 25) + 1980;
  v11.i32[0] = v58;
  v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v58), (uint32x4_t)xmmword_222D6FB50);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_222D6FB40).u32[0];
  v63 = vandq_s8(v12, (int8x16_t)xmmword_222D6FB60);
  v13 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v58 + 1);
  v14 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v59);
  v15 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v59 + 1);
  v16 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v60);
  v17 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v60 + 1);
  v18 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v61);
  v19 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v61 + 1);
  v20 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v62);
  v21 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v62 + 1);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v55) | v21 | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v13 | Long | v46 | v47 | v48 | Short)
    v22 = 0xFFFFFFFFLL;
  else
    v22 = v50;
  v23 = v60;
  if (a4)
  {
    v25 = a7;
    v24 = a6;
    if ((_DWORD)v22)
    {
      v28 = a2;
      v27 = a3;
      v29 = a8;
    }
    else
    {
      v26 = a5;
      if ((unint64_t)v60 < a5)
      {
        *(_BYTE *)(a4 + v60) = 0;
        v26 = v23;
      }
      v22 = 0;
      if (a5)
      {
        v28 = a2;
        v27 = a3;
        v29 = a8;
        if (v23)
        {
          if ((*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)) == v26)
            v22 = 0;
          else
            v22 = 0xFFFFFFFFLL;
        }
      }
      else
      {
        v28 = a2;
        v27 = a3;
        v29 = a8;
      }
      v23 -= v26;
    }
  }
  else
  {
    v28 = a2;
    v27 = a3;
    v29 = a8;
    v25 = a7;
    v24 = a6;
  }
  v30 = *((_QWORD *)&v60 + 1);
  if (!v24 || (_DWORD)v22)
  {
    v33 = *((_QWORD *)&v60 + 1) + v23;
    if (!v29)
      goto LABEL_60;
    goto LABEL_46;
  }
  if (*((_QWORD *)&v60 + 1) >= v25)
    v31 = v25;
  else
    v31 = *((_QWORD *)&v60 + 1);
  if (!v23)
  {
    v22 = 0;
    if (!v25)
      goto LABEL_45;
    goto LABEL_41;
  }
  v32 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v23, 1);
  if (v32)
    v22 = 0xFFFFFFFFLL;
  else
    v22 = 0;
  if (!v32)
    v23 = 0;
  if (v25)
  {
LABEL_41:
    if (v30)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v24, v31) == v31)v22 = v22;
      else
        v22 = 0xFFFFFFFFLL;
    }
  }
LABEL_45:
  v33 = v30 - v31 + v23;
  if (!v29)
    goto LABEL_60;
LABEL_46:
  if (!(_DWORD)v22)
  {
    v34 = v61;
    v35 = a9;
    if ((unint64_t)v61 < a9)
    {
      *(_BYTE *)(v29 + v61) = 0;
      v35 = v34;
    }
    if (v33)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v33, 1))
      {
        v22 = 0xFFFFFFFFLL;
      }
      else
      {
        v22 = 0;
      }
      if (!a9)
        goto LABEL_60;
LABEL_56:
      if (v34)
      {
        if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v29, v35) == v35)v22 = v22;
        else
          v22 = 0xFFFFFFFFLL;
      }
      goto LABEL_60;
    }
    v22 = 0;
    if (a9)
      goto LABEL_56;
  }
LABEL_60:
  if (v28 && !(_DWORD)v22)
  {
    v36 = v63;
    *(_OWORD *)(v28 + 96) = v62;
    *(int8x16_t *)(v28 + 112) = v36;
    *(_QWORD *)(v28 + 128) = v64;
    v37 = v59;
    *(_OWORD *)(v28 + 32) = v58;
    *(_OWORD *)(v28 + 48) = v37;
    v38 = v61;
    *(_OWORD *)(v28 + 64) = v60;
    *(_OWORD *)(v28 + 80) = v38;
    v39 = v57;
    *(_OWORD *)v28 = v56;
    *(_OWORD *)(v28 + 16) = v39;
  }
  if (v27 && !(_DWORD)v22)
    *v27 = v55;
  return v22;
}

uint64_t vinyl_unzGoToNextFile(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;

  if (!a1)
    return 4294967194;
  if (!a1[14])
    return 4294967196;
  v2 = a1[9];
  v3 = a1[12] + 1;
  if (v2 != 0xFFFF && v3 == v2)
    return 4294967196;
  v5 = a1[26] + a1[27] + a1[28] + a1[13] + 46;
  a1[12] = v3;
  a1[13] = v5;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t vinyl_unzLocateFile(uint64_t a1, char *__s, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20[257];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a1 || strlen(__s) > 0xFF)
    return 4294967194;
  if (!*(_QWORD *)(a1 + 112))
    return 4294967196;
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v17 = *(_OWORD *)(a1 + 240);
  v18 = *(_OWORD *)(a1 + 256);
  v9 = *(_QWORD *)(a1 + 280);
  v19 = *(_QWORD *)(a1 + 272);
  v13 = *(_OWORD *)(a1 + 176);
  v14 = *(_OWORD *)(a1 + 192);
  v15 = *(_OWORD *)(a1 + 208);
  v16 = *(_OWORD *)(a1 + 224);
  v11 = *(_OWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 160);
  v10 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = v10;
  result = unzlocal_GetCurrentFileInfoInternal(a1, a1 + 144, (_QWORD *)(a1 + 280), 0, 0, 0, 0, 0, 0);
  for (*(_QWORD *)(a1 + 112) = (_DWORD)result == 0; !(_DWORD)result; result = vinyl_unzGoToNextFile((_QWORD *)a1))
  {
    result = unzlocal_GetCurrentFileInfoInternal(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
    if ((_DWORD)result)
      break;
    result = vinyl_unzStringFileNameCompare(v20, __s, a3);
    if (!(_DWORD)result)
      return result;
  }
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
  *(_QWORD *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 192) = v14;
  *(_OWORD *)(a1 + 208) = v15;
  *(_OWORD *)(a1 + 224) = v16;
  *(_OWORD *)(a1 + 144) = v11;
  *(_OWORD *)(a1 + 160) = v12;
  *(_QWORD *)(a1 + 280) = v9;
  return result;
}

uint64_t vinyl_unzGetFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result;

  result = 4294967194;
  if (a1 && a2)
  {
    if (a1[7].i64[0])
    {
      result = 0;
      *a2 = vextq_s8(a1[6], a1[6], 8uLL);
    }
    else
    {
      return 4294967196;
    }
  }
  return result;
}

uint64_t vinyl_unzGoToFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result;

  result = 4294967194;
  if (a1)
  {
    if (a2)
    {
      a1[6] = vextq_s8(*a2, *a2, 8uLL);
      result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)a1[9].i64, &a1[17].i64[1], 0, 0, 0, 0, 0, 0);
      a1[7].i64[0] = (_DWORD)result == 0;
    }
  }
  return result;
}

uint64_t vinyl_unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, _BYTE *a5)
{
  int Long;
  uint64_t v11;
  int Short;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  char *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  const z_crc_t *crc_table;
  int v36;
  unsigned __int8 *v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[3];

  v51[2] = *MEMORY[0x24BDAC8D0];
  if (!a1 || !*(_QWORD *)(a1 + 112))
    return 4294967194;
  if (*(_QWORD *)(a1 + 288))
    vinyl_unzCloseCurrentFile(a1);
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  v50 = 0;
  v51[0] = 0;
  v49 = 0;
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), v51);
  v11 = v51[0];
  Short = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v50);
  v13 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v49);
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v50))
  {
    v14 = -1;
  }
  else
  {
    if (v11 == 67324752)
      v18 = 0;
    else
      v18 = -103;
    v19 = v13 | Short | Long;
    if (v19)
      v14 = -1;
    else
      v14 = v18;
    if (!v19 && v11 == 67324752)
    {
      v14 = -103;
      if (v50 == *(_QWORD *)(a1 + 168))
      {
        if ((v50 & 0xFFFFFFFFFFFFFFF7) != 0)
          v14 = -103;
        else
          v14 = 0;
      }
    }
  }
  v15 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v50);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v50))
  {
    v16 = -1;
  }
  else
  {
    if (v15)
      v16 = -1;
    else
      v16 = v14;
    if (!v16)
    {
      if (v50 == *(_QWORD *)(a1 + 184))
      {
        v16 = 0;
      }
      else if ((v49 & 8) != 0)
      {
        v16 = 0;
      }
      else
      {
        v16 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v50))
  {
    v16 = -1;
  }
  else if (!v16)
  {
    if (v50 == *(_QWORD *)(a1 + 192))
    {
      v16 = 0;
    }
    else if ((v49 & 8) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v50))
  {
    v16 = -1;
  }
  else if (!v16)
  {
    if (v50 == *(_QWORD *)(a1 + 200))
    {
      v16 = 0;
    }
    else if ((v49 & 8) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = -103;
    }
  }
  v48 = 0;
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v48))
  {
    v16 = -1;
    v20 = v48;
  }
  else
  {
    v20 = v48;
    if (!v16)
    {
      if (v48 == *(_QWORD *)(a1 + 208))
        v16 = 0;
      else
        v16 = -103;
    }
  }
  v47 = 0;
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v47) || v16)
    return 4294967193;
  v22 = *(_QWORD *)(a1 + 280);
  v23 = v47;
  v24 = (char *)malloc(0x120uLL);
  if (!v24)
    return 4294967192;
  v25 = v24;
  v26 = malloc(0x4000uLL);
  *(_QWORD *)v25 = v26;
  *((_QWORD *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((_QWORD *)v25 + 19) = 0;
  *((_DWORD *)v25 + 70) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192;
  }
  *((_QWORD *)v25 + 16) = 0;
  if (a2)
    *a2 = *(_QWORD *)(a1 + 168);
  if (a3)
  {
    *a3 = 6;
    v27 = *(_QWORD *)(a1 + 160) & 6;
    switch(v27)
    {
      case 2:
        v28 = 9;
        break;
      case 6:
        v28 = 1;
        break;
      case 4:
        v28 = 2;
        break;
      default:
        goto LABEL_71;
    }
    *a3 = v28;
  }
LABEL_71:
  v29 = *(_QWORD *)(a1 + 184);
  *((_QWORD *)v25 + 20) = 0;
  *((_QWORD *)v25 + 21) = v29;
  v30 = *(_QWORD *)(a1 + 168);
  *((_QWORD *)v25 + 32) = *(_QWORD *)(a1 + 64);
  *((_QWORD *)v25 + 33) = v30;
  v31 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v25 + 12) = *(_OWORD *)a1;
  *((_OWORD *)v25 + 13) = v31;
  v32 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 15) = v32;
  *((_QWORD *)v25 + 34) = *(_QWORD *)(a1 + 88);
  *((_QWORD *)v25 + 6) = 0;
  if (!a4 && v30 == 8)
  {
    *((_QWORD *)v25 + 1) = 0;
    *((_DWORD *)v25 + 4) = 0;
    *((_QWORD *)v25 + 10) = 0;
    *((_QWORD *)v25 + 11) = 0;
    *((_QWORD *)v25 + 9) = 0;
    v33 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
    if ((_DWORD)v33)
    {
      v17 = v33;
      free(v25);
      return v17;
    }
    *((_QWORD *)v25 + 16) = 1;
    v22 = *(_QWORD *)(a1 + 280);
  }
  *((_OWORD *)v25 + 11) = *(_OWORD *)(a1 + 192);
  *((_QWORD *)v25 + 15) = v22 + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(_QWORD *)(a1 + 288) = v25;
  if (!a5)
    return 0;
  v34 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_222D6FB70;
  *(_QWORD *)(a1 + 320) = 878082192;
  *(_QWORD *)(a1 + 328) = crc_table;
  v36 = *a5;
  if (*a5)
  {
    v37 = a5 + 1;
    v38 = 305419896;
    v39 = 591751049;
    do
    {
      v38 = crc_table[v36 ^ v38] ^ (v38 >> 8);
      v39 = 134775813 * (v39 + v38) + 1;
      *(_QWORD *)(a1 + 304) = v38;
      *(_QWORD *)(a1 + 312) = v39;
      v34 = crc_table[(v34 ^ BYTE3(v39))] ^ (v34 >> 8);
      *(_QWORD *)(a1 + 320) = v34;
      v40 = *v37++;
      v36 = v40;
    }
    while (v40);
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 288) + 272) + *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(_QWORD, _QWORD, uint64_t *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v51, 12) < 0xC)
  {
    return 4294967192;
  }
  v41 = 0;
  v43 = *(_QWORD *)(a1 + 320);
  v42 = *(_QWORD *)(a1 + 328);
  v44 = *(_QWORD *)(a1 + 304);
  v45 = *(_QWORD *)(a1 + 312);
  do
  {
    v46 = *((_BYTE *)v51 + v41) ^ ((unsigned __int16)((v43 & 0xFFFD ^ 3) * (v43 | 2)) >> 8);
    *((_BYTE *)v51 + v41) = v46;
    v44 = *(_QWORD *)(v42 + 8 * (v46 ^ v44)) ^ (v44 >> 8);
    v45 = 134775813 * (v45 + v44) + 1;
    *(_QWORD *)(a1 + 304) = v44;
    *(_QWORD *)(a1 + 312) = v45;
    v43 = *(_QWORD *)(v42 + 8 * (v43 ^ BYTE3(v45))) ^ (v43 >> 8);
    *(_QWORD *)(a1 + 320) = v43;
    ++v41;
  }
  while (v41 != 12);
  v17 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v17;
}

uint64_t vinyl_unzOpenCurrentFile(uint64_t a1)
{
  return vinyl_unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t vinyl_unzOpenCurrentFilePassword(uint64_t a1, _BYTE *a2)
{
  return vinyl_unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t vinyl_unzOpenCurrentFile2(uint64_t a1, _DWORD *a2, int *a3, int a4)
{
  return vinyl_unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t vinyl_unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  uint64_t v21;
  const Bytef *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  if (!a1)
    return 4294967194;
  v4 = *(_QWORD *)(a1 + 288);
  if (!v4)
    return 4294967194;
  if (!*(_QWORD *)v4)
    return 4294967196;
  if (!a3)
    return 0;
  *(_QWORD *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  v5 = a3;
  v6 = *(_QWORD *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }
  v7 = *(_QWORD *)(v4 + 176);
  v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }
  if (!a3)
    return 0;
  v9 = 0;
  while (1)
  {
    while (1)
    {
      LODWORD(v10) = *(_DWORD *)(v4 + 16);
      if (!(_DWORD)v10)
      {
        v11 = *(_QWORD *)(v4 + 176);
        if (v11)
        {
          if (v11 >= 0x4000)
            v10 = 0x4000;
          else
            v10 = *(_QWORD *)(v4 + 176);
          if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v4 + 224))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)(v4 + 272) + *(_QWORD *)(v4 + 120), 0)|| (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v4 + 200))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)v4, v10) != v10)
          {
            return 0xFFFFFFFFLL;
          }
          if (*(_DWORD *)(a1 + 296))
          {
            v12 = 0;
            do
            {
              v13 = *(_QWORD *)(a1 + 328);
              v14 = *(unsigned __int8 *)(*(_QWORD *)v4 + v12) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
              *(_BYTE *)(*(_QWORD *)v4 + v12) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                  * (*(_WORD *)(a1 + 320) | 2)) >> 8;
              v15 = *(_QWORD *)(v13 + 8 * (v14 ^ *(_QWORD *)(a1 + 304))) ^ (*(_QWORD *)(a1 + 304) >> 8);
              v16 = 134775813 * (*(_QWORD *)(a1 + 312) + v15) + 1;
              *(_QWORD *)(a1 + 304) = v15;
              *(_QWORD *)(a1 + 312) = v16;
              *(_QWORD *)(a1 + 320) = *(_QWORD *)(v13 + 8 * (*(_QWORD *)(a1 + 320) ^ BYTE3(v16))) ^ (*(_QWORD *)(a1 + 320) >> 8);
              *(_BYTE *)(*(_QWORD *)v4 + v12++) = v14;
            }
            while (v10 != v12);
          }
          *(_QWORD *)(v4 + 120) += v10;
          *(_QWORD *)(v4 + 176) -= v10;
          *(_QWORD *)(v4 + 8) = *(_QWORD *)v4;
          *(_DWORD *)(v4 + 16) = v10;
        }
        else
        {
          LODWORD(v10) = 0;
        }
      }
      if (*(_QWORD *)(v4 + 264) && !*(_DWORD *)(v4 + 280))
        break;
      if ((_DWORD)v10 || *(_QWORD *)(v4 + 176))
      {
        v17 = *(_DWORD *)(v4 + 40);
        v10 = v17 >= v10 ? v10 : v17;
        if ((_DWORD)v10)
        {
          for (i = 0; i != v10; ++i)
            *(_BYTE *)(*(_QWORD *)(v4 + 32) + i) = *(_BYTE *)(*(_QWORD *)(v4 + 8) + i);
          v19 = v10;
        }
        else
        {
          v19 = 0;
        }
        *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), *(const Bytef **)(v4 + 32), v10);
        *(_QWORD *)(v4 + 184) -= v19;
        *(_DWORD *)(v4 + 16) -= v10;
        v20 = *(_DWORD *)(v4 + 40) - v10;
        *(_DWORD *)(v4 + 40) = v20;
        *(_QWORD *)(v4 + 32) += v19;
        *(_QWORD *)(v4 + 8) += v19;
        v9 = (v10 + v9);
        *(_QWORD *)(v4 + 48) += v19;
        if (v20)
          continue;
      }
      return v9;
    }
    v21 = *(_QWORD *)(v4 + 48);
    v22 = *(const Bytef **)(v4 + 32);
    v23 = inflate((z_streamp)(v4 + 8), 2);
    if ((v23 & 0x80000000) == 0 && *(_QWORD *)(v4 + 56))
    {
      v26 = *(_QWORD *)(v4 + 48);
      v27 = v26 - v21;
      *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v22, (int)v26 - (int)v21);
      *(_QWORD *)(v4 + 184) -= v27;
      return 4294967293;
    }
    v24 = *(_QWORD *)(v4 + 48) - v21;
    *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v22, v24);
    *(_QWORD *)(v4 + 184) -= v24;
    v9 = (v9 + v24);
    if (v23)
      break;
    if (!*(_DWORD *)(v4 + 40))
      return v9;
  }
  if (v23 == 1)
    return v9;
  else
    return v23;
}

uint64_t vinyl_unztell(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 288)) != 0)
    return *(_QWORD *)(v1 + 48);
  else
    return -102;
}

uint64_t vinyl_unzeof(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 288)) != 0)
    return *(_QWORD *)(v1 + 184) == 0;
  else
    return 4294967194;
}

unint64_t vinyl_unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;

  if (!a1)
    return 4294967194;
  v3 = *(_QWORD *)(a1 + 288);
  if (!v3)
    return 4294967194;
  v5 = *(_QWORD *)(v3 + 152);
  result = *(unsigned int *)(v3 + 144) - v5;
  if (a2)
  {
    if (result >= a3)
      v7 = a3;
    else
      v7 = result;
    if ((_DWORD)v7)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v3 + 224))(*(_QWORD *)(v3 + 248), *(_QWORD *)(v3 + 256), *(_QWORD *)(v3 + 136) + v5, 0))
      {
        return 0xFFFFFFFFLL;
      }
      else if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v3 + 200))(*(_QWORD *)(v3 + 248), *(_QWORD *)(v3 + 256), a2, v7) == v7)
      {
        return v7;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t vinyl_unzGetGlobalComment(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v8;

  if (!a1)
    return 4294967194;
  if (*(_QWORD *)(a1 + 80) >= a3)
    v6 = a3;
  else
    v6 = *(_QWORD *)(a1 + 80);
  if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 120) + 22, 0))
  {
    return 0xFFFFFFFFLL;
  }
  if (v6)
  {
    *a2 = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2, v6) != v6)return 0xFFFFFFFFLL;
  }
  else if (!a2)
  {
    return v6;
  }
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 < a3)
    a2[v8] = 0;
  return v6;
}

uint64_t vinyl_unzGetOffset(_QWORD *a1)
{
  uint64_t v1;
  BOOL v2;

  if (!a1)
    return -102;
  if (a1[14])
  {
    v1 = a1[9];
    v2 = !v1 || v1 == 0xFFFF;
    if (v2 || a1[12] != v1)
      return a1[13];
  }
  return 0;
}

uint64_t vinyl_unzSetOffset(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 4294967194;
  a1[12] = a1[9];
  a1[13] = a2;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t unzlocal_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  unsigned __int8 v7;

  v7 = 0;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v7, 1) == 1)
  {
    result = 0;
    *a3 = v7;
  }
  else if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::eUICCVinylMAVValve(uint64_t this, void *a2, int a3, char a4)
{
  *(_BYTE *)(this + 288) = 0;
  *(_QWORD *)this = off_24EB7A9C8;
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

uint64_t eUICC::eUICCVinylMAVValve::StoreData(uint64_t a1)
{
  _WORD *v1;
  _WORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  char v16[6003];
  uint64_t v17;

  MEMORY[0x24BDAC7A8](a1);
  v2 = v1;
  v4 = v3;
  v17 = *MEMORY[0x24BDAC8D0];
  eUICC::StoreData::Perform();
  if (v12 || v13 != 1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"rsp.Valid()");
    gBBULogMaskGet();
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v9, v10, v11, v13);
    result = 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v4, v16, &v16[v15], v15);
    result = 0;
  }
  *v2 = bswap32(v14) >> 16;
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::InstallTicket(uint64_t a1, CFDataRef *a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (*a2)
    v2 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v2 = 0;
  if (v2)
  {
    v4 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 16))(a1, 0, 0);
    if ((_DWORD)v4)
    {
      v5 = v4;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"kBBUReturnSuccess == ret");
    }
    else
    {
      CFDataGetBytePtr(*a2);
      CFDataGetLength(*a2);
      v12 = eUICC::InstallTicket::Perform();
      v14 = v12;
      if (v12 || (v13 & 0xFF00000000) != 0x100000000)
      {
        gBBULogMaskGet();
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "InstallTicket failed error %d status %hhu sw1 0x%x sw2 0x%x\n", v15, v16, v17, v14);
        return 16;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"installTicket");
    return 2;
  }
  return v5;
}

uint64_t eUICC::eUICCVinylMAVValve::StreamFirmware(eUICC::eUICCVinylMAVValve *this, __CFData *a2)
{
  _BYTE *v3;
  _BYTE *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
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
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  size_t __sz;
  void *v54;
  _BYTE *v55;
  _QWORD __src[38];

  __src[36] = *MEMORY[0x24BDAC8D0];
  VinylFirmware::getFirmwareAPDUs(a2, (uint64_t)&v54);
  v4 = v54;
  v3 = v55;
  (*(void (**)(_QWORD *__return_ptr, eUICC::eUICCVinylMAVValve *))(*(_QWORD *)this + 8))(__src, this);
  memcpy((char *)this + 8, __src, 0x119uLL);
  if (*((_DWORD *)this + 2) == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    v5 = *((unsigned __int8 *)this + 284);
    if (!*((_BYTE *)this + 284))
      v5 = *((unsigned __int8 *)this + 304);
    gBBULogMaskGet();
    v6 = v5;
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "~~~~ MAX APDU PER SET: %zu  ~~~~\n", v7, v8, v9, v5);
    v10 = (v3 - v4) >> 5;
    if (v10 % v5)
      v11 = v10 / v5 + 1;
    else
      v11 = v10 / v5;
    if (v11)
    {
      v12 = (*(uint64_t (**)(eUICC::eUICCVinylMAVValve *, uint64_t, _QWORD))(*(_QWORD *)this + 16))(this, 1, 0);
      if ((_DWORD)v12)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v13, v14, v15, (char)"kBBUReturnSuccess == ret");
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v24 = 480;
        if (v5)
          v24 = 32 * v5;
        v52 = 32 * v5;
        __sz = v24;
        v25 = v10;
        while (1)
        {
          v26 = v25 - v6;
          v27 = v25 >= v6 ? v6 : v25;
          v28 = v10 - v23 * v6 >= v6 ? v6 : v10 - v23 * v6;
          LODWORD(__src[4]) = 15000;
          __src[2] = operator new[](__sz);
          __src[3] = v6;
          __src[0] = *((_QWORD *)this + 37);
          LOBYTE(__src[1]) = *((_DWORD *)this + 73);
          WORD1(__src[1]) = v11;
          WORD2(__src[1]) = v23;
          BYTE6(__src[1]) = v28;
          gBBULogMaskGet();
          _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v29, v30, v31, v23);
          if (v28)
          {
            v32 = 0;
            v33 = 0;
            v34 = v22;
            while (__src[3] >= v33)
            {
              v35 = *(_QWORD *)((char *)v54 + v34);
              v36 = *(_QWORD *)((char *)v54 + v34 + 16);
              v37 = *(_QWORD *)((char *)v54 + v34 + 24);
              v38 = (_QWORD *)(__src[2] + v32);
              *v38 = *(_QWORD *)((char *)v54 + v34 + 8);
              v38[1] = v35;
              v38[2] = v37;
              v38[3] = v36;
              ++v33;
              v34 += 32;
              v32 += 32;
              if (v27 == v33)
                goto LABEL_25;
            }
            gBBULogMaskGet();
            _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"j <= req.apdu_payload.apdu_data_size");
            gBBULogMaskGet();
            _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed SteamAPDU index '%d' is greater than max array size '%zu'", v47, v48, v49, v33);
            v40 = 0;
          }
          else
          {
LABEL_25:
            if (eUICC::StreamAPDU::Perform() || (v39 & 0xFF00000000) != 0x100000000)
            {
              gBBULogMaskGet();
              _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed StreamAPDU set %d/%zu, error %d status %hhu sw1 0x%x sw2 0x%x\n", v41, v42, v43, v23);
              v40 = 0;
              v12 = 16;
            }
            else
            {
              v40 = 1;
            }
          }
          v50 = (void *)__src[2];
          __src[2] = 0;
          if (v50)
            operator delete[](v50);
          if ((v40 & 1) == 0)
            break;
          ++v23;
          v22 += v52;
          v25 = v26;
          if (v23 == v11)
          {
            v12 = 0;
            break;
          }
        }
      }
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v19, v20, v21, (char)"apduSetCount");
      v12 = 15;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"outData.Valid()");
    v12 = 18;
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  return v12;
}

void sub_222D58234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylMAVValve::InitPerso(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  _BYTE __dst[18];
  uint64_t v25;
  char v26;
  __int16 v27;
  char v28;
  __int16 v29;
  __int128 v30;
  __int16 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&__dst[6] = 0;
  *(_QWORD *)__dst = 0;
  *(_DWORD *)&__dst[14] = 30000;
  v4 = *(_QWORD *)(a1 + 296);
  v5 = *(_DWORD *)(a1 + 292);
  v6 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8) - (_QWORD)v6;
  if (v8 >= 0xC)
    v9 = 12;
  else
    v9 = v8;
  memcpy(__dst, v6, v9);
  v25 = v4;
  v26 = v5;
  v27 = 0;
  v28 = 0;
  v29 = v9;
  v30 = *(_OWORD *)__dst;
  v31 = *(_WORD *)&__dst[16];
  eUICC::InitPersoSession::Perform();
  if (*(_QWORD *)__dst)
  {
    if (!**(_DWORD **)__dst && *(_BYTE *)(*(_QWORD *)__dst + 8) == 1 && *(_WORD *)(*(_QWORD *)__dst + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(*(_QWORD *)__dst + 13), (char *)(*(_QWORD *)__dst + 13 + *(unsigned __int16 *)(*(_QWORD *)__dst + 11)), *(unsigned __int16 *)(*(_QWORD *)__dst + 11));
      v10 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to InitPerso status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v14, v15, v16, *(_BYTE *)(*(_QWORD *)__dst + 8));
      v10 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    v10 = 11;
  }
  v20 = *(std::__shared_weak_count **)&__dst[8];
  if (*(_QWORD *)&__dst[8])
  {
    v21 = (unint64_t *)(*(_QWORD *)&__dst[8] + 8);
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

void sub_222D58480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylMAVValve::AuthPerso(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _DWORD *v6;
  const void *v7;
  size_t v8;
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
  unint64_t *p_shared_owners;
  unint64_t v20;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v6 = operator new(0x818uLL);
  bzero(v6 + 2, 0x810uLL);
  bzero(v6 + 3, 0x802uLL);
  v6[516] = 30000;
  *(_QWORD *)v6 = *(_QWORD *)(a1 + 296);
  *((_BYTE *)v6 + 8) = *(_DWORD *)(a1 + 292);
  v7 = *(const void **)a2;
  if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 >= 0x800uLL)
    v8 = 2048;
  else
    v8 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  memcpy((char *)v6 + 14, v7, v8);
  *((_WORD *)v6 + 6) = v8;
  eUICC::AuthPersoSession::Perform();
  if (v22)
  {
    if (!*(_DWORD *)v22 && *(_BYTE *)(v22 + 8) == 1 && *(_WORD *)(v22 + 11))
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(v22 + 13), (char *)(v22 + 13 + *(unsigned __int16 *)(v22 + 11)), *(unsigned __int16 *)(v22 + 11));
      v9 = 0;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v13, v14, v15, *(_BYTE *)(v22 + 8));
      v9 = 18;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"rsp");
    v9 = 11;
  }
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)())v23->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  operator delete(v6);
  return v9;
}

void sub_222D58684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  void *v13;

  operator delete(v13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::FinalizePerso(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  const void *v5;
  unint64_t v7;
  size_t v8;
  char v9;
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
  _OWORD __dst[17];
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  __int16 v30;
  _BYTE v31[266];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  memset(__dst, 0, 266);
  *(_DWORD *)((char *)&__dst[16] + 2) = 30000;
  v3 = *(_QWORD *)(a1 + 296);
  v4 = *(_DWORD *)(a1 + 292);
  v5 = *(const void **)a2;
  v7 = *(_QWORD *)(a2 + 8) - (_QWORD)v5;
  if (v7 >= 0x100)
    v8 = 256;
  else
    v8 = v7;
  memcpy(__dst, v5, v8);
  v9 = *(_BYTE *)(a1 + 289);
  v25 = v3;
  v26 = v4;
  v27 = 0;
  v28 = v9;
  v29 = 0;
  v30 = v8;
  memcpy(v31, __dst, sizeof(v31));
  eUICC::FinalizePersoSession::Perform();
  if (*(_QWORD *)&__dst[0])
  {
    if (**(_DWORD **)&__dst[0] || *(_BYTE *)(*(_QWORD *)&__dst[0] + 8) != 1)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"rsp->Valid()");
      gBBULogMaskGet();
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to FinalizePersoDevice status %hhu SW1 0x%x SW2 0x%x\n", v14, v15, v16, *(_BYTE *)(*(_QWORD *)&__dst[0] + 8));
      v10 = 18;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"rsp");
    v10 = 11;
  }
  v20 = (std::__shared_weak_count *)*((_QWORD *)&__dst[0] + 1);
  if (*((_QWORD *)&__dst[0] + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&__dst[0] + 1) + 8);
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

void sub_222D588CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Unwind_Resume(exception_object);
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

void sub_222D58B08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Unwind_Resume(exception_object);
}

void eUICC::eUICCVinylMAVValve::~eUICCVinylMAVValve(eUICC::eUICCVinylMAVValve *this)
{
  void *v1;

  eUICC::eUICCVinylValve::~eUICCVinylValve(this);
  operator delete(v1);
}

void eUICCStateMachine::eUICCStateMachine(eUICCStateMachine *this)
{
  *(_DWORD *)this = 0;
}

BOOL eUICCStateMachine::Done(eUICCStateMachine *this)
{
  return *(_DWORD *)this > 6u;
}

uint64_t eUICCStateMachine::Run(eUICCStateMachine *this, eUICC::VinylFactory *a2, VinylFirmware *a3, VinylFirmware *a4, const __CFDictionary *a5)
{
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *__p[2];
  char v44;
  const void *v45;
  void *v46;
  unsigned __int8 v47;
  char v48;
  void *v49;
  char v50;
  char v51;
  unsigned __int8 v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  const void *v59[2];

  v59[0] = 0;
  if (a5)
  {
    v46 = a5;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(v59, (CFTypeRef *)&v46);
    v45 = v59[0];
    if (v59[0])
      CFRetain(v59[0]);
  }
  else
  {
    v45 = 0;
  }
  Options::Options(&v46, &v45);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v45);
  if (v52 | v47)
    v8 = 0;
  else
    v8 = v48 == 0;
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)&v46);
  if (v44 >= 0)
    v12 = __p;
  else
    LOBYTE(v12) = __p[0];
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Options:\n%s\n", v9, v10, v11, (char)v12);
  if (v44 < 0)
    operator delete(__p[0]);
  eUICC::VinylFactory::GetValve(a2, (void *)v46, v51, (eUICC::eUICCVinylICEValve **)__p);
  if (__p[0])
  {
    v13 = *(int *)this;
    *(_DWORD *)this = 0;
    gBBULogMaskGet();
    if (v13 > 8)
      v17 = "??????";
    else
      v17 = off_24EB7AB38[v13];
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Resetting state machine: %s --> %s\n", v14, v15, v16, (char)v17);
    while (1)
    {
      if (*(_DWORD *)this > 6u)
      {
        v28 = 0;
        goto LABEL_33;
      }
      gBBULogMaskGet();
      v26 = *(int *)this;
      v27 = "??????";
      if (v26 <= 8)
        v27 = off_24EB7AB38[v26];
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Running at state %s\n", v23, v24, v25, (char)v27);
      v28 = eUICCStateMachine::Step((int *)this, (uint64_t)a3, (uint64_t)a4);
      if ((_DWORD)v28 == 45)
        break;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Result %d next state %s allowRetry %d\n", v29, v30, v31, v28);
      if ((_DWORD)v28 != 0 && v8)
      {
        v28 = 0;
        v8 = 0;
        *(_DWORD *)this = 6;
      }
      if ((_DWORD)v28)
        goto LABEL_33;
    }
    gBBULogMaskGet();
    v35 = *(int *)this;
    if (v35 > 8)
      v36 = "??????";
    else
      v36 = off_24EB7AB38[v35];
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "eUICC -- back to host to personalize in state %s\n", v32, v33, v34, (char)v36);
    v28 = 0;
  }
  else
  {
    gBBULogMaskGet();
    v21 = *(int *)this;
    if (v21 > 8)
      v22 = "??????";
    else
      v22 = off_24EB7AB38[v21];
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Fatal Error: Error creating vinyl valve! Current State: %s\n", v18, v19, v20, (char)v22);
    *(_DWORD *)this = 7;
    v28 = 9;
LABEL_33:
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "ret = %d\n", v37, v38, v39, v28);
  }
  v40 = __p[0];
  __p[0] = 0;
  if (v40)
    (*(void (**)(void *))(*(_QWORD *)v40 + 96))(v40);
  if (v58 < 0)
    operator delete(v57);
  if (v56 < 0)
    operator delete(v55);
  if (v54 < 0)
    operator delete(v53);
  if (v50 < 0)
    operator delete(v49);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(v59);
  return v28;
}

void sub_222D58F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v23 - 96));
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

const char *eUICCStateMachine::StateAsString(unsigned int a1)
{
  if (a1 > 8)
    return "??????";
  else
    return off_24EB7AB38[a1];
}

uint64_t eUICCStateMachine::Step(int *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  _DWORD *v11;
  _DWORD *v12;
  _DWORD *v13;
  int v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  void *exception;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  _BYTE v28[8];
  _DWORD v29[5];
  int v30;
  int v31;
  _QWORD v32[4];
  int v33;
  _QWORD v34[4];
  int v35;
  _QWORD v36[4];
  int v37;
  _QWORD v38[4];
  int v39;
  _QWORD v40[4];
  int v41;
  _QWORD v42[4];
  int v43;
  _QWORD v44[4];
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v30 = 7;
  v31 = 0;
  v32[0] = off_24EB7AA58;
  v32[1] = eUICCStateMachine::Start;
  v32[3] = v32;
  v33 = 2;
  v34[0] = off_24EB7AA58;
  v34[1] = eUICCStateMachine::Perso;
  v34[3] = v34;
  v35 = 1;
  v36[0] = off_24EB7AA58;
  v36[1] = eUICCStateMachine::Recovery;
  v36[3] = v36;
  v37 = 3;
  v38[0] = off_24EB7AA58;
  v38[1] = eUICCStateMachine::UpdateGold;
  v38[3] = v38;
  v39 = 4;
  v40[0] = off_24EB7AA58;
  v40[1] = eUICCStateMachine::UpdateMain;
  v40[3] = v40;
  v41 = 5;
  v42[0] = off_24EB7AA58;
  v42[1] = eUICCStateMachine::PostProcess;
  v42[3] = v42;
  v43 = 6;
  v44[0] = off_24EB7AA58;
  v44[1] = eUICCStateMachine::Retry;
  v44[3] = v44;
  v45 = 7;
  v46 = 0;
  v47 = 8;
  v48 = 0;
  std::map<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>::map[abi:ne180100]((uint64_t)v28, &v31, 9);
  v6 = 360;
  do
  {
    v7 = *(_BYTE **)&v29[v6 / 4 + 4];
    if (&v28[v6] == v7)
    {
      v7 = &v28[v6];
      v8 = 4;
    }
    else
    {
      if (!v7)
        goto LABEL_7;
      v8 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_7:
    v6 -= 40;
  }
  while (v6);
  v9 = *(_DWORD **)v29;
  if (!*(_QWORD *)v29)
    goto LABEL_26;
  v10 = *a1;
  v11 = v29;
  do
  {
    v12 = v9;
    v13 = v11;
    v14 = v9[8];
    if (v14 >= v10)
      v11 = v9;
    else
      v9 += 2;
    v9 = *(_DWORD **)v9;
  }
  while (v9);
  if (v11 == v29 || (v14 >= v10 ? (v15 = v12) : (v15 = v13), v10 < v15[8] || !*((_QWORD *)v11 + 8)))
  {
LABEL_26:
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Update/StateMachine/eUICCStateMachine.cpp", 0x87u, (ctu::LogMessageBuffer *)"Assertion failure(((stateMap.end() != def) && def->second) && \"eUICCStateMachine is corrupted.\")", v24, v25, v26, v27);
  }
  v16 = std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()((uint64_t)(v11 + 10), a2, a3);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Ret %d from state %s next %s\n", v17, v18, v19, v16);
  v20 = (_DWORD)v16 == 45 || (_DWORD)v16 == 0;
  v21 = v30;
  if (!v20)
    v21 = 7;
  *a1 = v21;
  std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy((uint64_t)v28, *(_QWORD **)v29);
  return v16;
}

void sub_222D59344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  eUICCStateMachine::Step(v9 + 360, (uint64_t)va);
  _Unwind_Resume(a1);
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

uint64_t eUICCStateMachine::Start(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5)
{
  int v7;
  int v8;
  uint64_t result;
  int v10;
  int v11;
  _BYTE v12[289];

  *(_QWORD *)&v12[281] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_BYTE *__return_ptr))(**(_QWORD **)a5 + 8))(v12);
  v7 = HowToProceed((uint64_t)v12, a3);
  if (!v7)
    return 18;
  v8 = v7;
  result = 0;
  if (v8 == 2)
    v10 = 5;
  else
    v10 = 2;
  if (v8 == 3)
    v11 = 8;
  else
    v11 = v10;
  *a4 = v11;
  return result;
}

uint64_t eUICCStateMachine::Perso(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, void (****a5)(std::string *__return_ptr))
{
  uint64_t v9;
  void (***v10)(std::string *__return_ptr);
  int v11;
  std::string __p;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  (**a5)[1]((std::string *)&v14);
  if (BYTE4(v14) != 1 && *(_BYTE *)(a3 + 40) == 0)
  {
    v9 = 0;
  }
  else
  {
    VinylFirmware::bootloaderVersion((VinylFirmware *)v15, v16, &__p);
    v9 = eUICC::Perso::Perform(a3, (uint64_t)&__p, a5);
    v10 = *a5;
    *(_OWORD *)++v10 = 0u;
    *((_OWORD *)v10 + 15) = 0u;
    *((_OWORD *)v10 + 16) = 0u;
    *((_OWORD *)v10 + 13) = 0u;
    *((_OWORD *)v10 + 14) = 0u;
    *((_OWORD *)v10 + 11) = 0u;
    *((_OWORD *)v10 + 12) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    *((_OWORD *)v10 + 10) = 0u;
    *((_OWORD *)v10 + 7) = 0u;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 5) = 0u;
    *((_OWORD *)v10 + 6) = 0u;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_OWORD *)v10 + 2) = 0u;
    *(_OWORD *)((char *)v10 + 265) = 0u;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*(_BYTE *)(a3 + 9))
    v11 = 5;
  else
    v11 = 1;
  *a4 = v11;
  return v9;
}

void sub_222D595B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICCStateMachine::Recovery(VinylFirmware *a1, VinylFirmware *a2, uint64_t a3, _DWORD *a4, _QWORD *a5)
{
  VinylFirmware *v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **p_p;
  void *__p;
  char v24;
  uint64_t v25;
  char v26;
  _BYTE v27[145];

  *(_QWORD *)&v27[137] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)*a5 + 8))(&v25);
  if ((_DWORD)v25 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    if (!v26)
    {
LABEL_16:
      v10 = 0;
      *a4 = 3;
      return v10;
    }
    if (VinylFirmware::getRecoveryFwData(a2))
      v9 = a2;
    else
      v9 = a1;
    if (VinylFirmware::getRecoveryFwData(v9))
    {
      v10 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a5 + 48))(*a5);
      v11 = (_OWORD *)*a5;
      *(_OWORD *)((char *)v11 + 8) = 0u;
      v11 = (_OWORD *)((char *)v11 + 8);
      v11[15] = 0u;
      v11[16] = 0u;
      v11[13] = 0u;
      v11[14] = 0u;
      v11[11] = 0u;
      v11[12] = 0u;
      v11[9] = 0u;
      v11[10] = 0u;
      v11[7] = 0u;
      v11[8] = 0u;
      v11[5] = 0u;
      v11[6] = 0u;
      v11[3] = 0u;
      v11[4] = 0u;
      v11[1] = 0u;
      v11[2] = 0u;
      *(_OWORD *)((char *)v11 + 265) = 0u;
      if (!(_DWORD)v10)
      {
        v10 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)*a5 + 16))(*a5, 0, 0);
        if (!(_DWORD)v10)
          goto LABEL_16;
      }
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"kBBUReturnSuccess == ret");
    }
    else
    {
      ctu::hex((ctu *)v27, (const void *)8);
      gBBULogMaskGet();
      p_p = &__p;
      if (v24 < 0)
        LOBYTE(p_p) = (_BYTE)__p;
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "SM::Recovery Missing gold with hash %s\n", v18, v19, v20, (char)p_p);
      if (v24 < 0)
        operator delete(__p);
      return 15;
    }
  }
  else
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"euiccData.Valid()");
    return 18;
  }
  return v10;
}

void sub_222D59840(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICCStateMachine::UpdateGold(CFDictionaryRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  CFTypeRef cf[2];
  __int128 v18;
  _DWORD __dst[73];

  *(_QWORD *)&__dst[71] = *MEMORY[0x24BDAC8D0];
  cf[0] = 0;
  (*(void (**)(_DWORD *__return_ptr))(**(_QWORD **)a5 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"euiccData.Valid()");
    v15 = 18;
LABEL_6:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(cf);
    return v15;
  }
  if (!a1)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"goldFirmware");
    v15 = 15;
    goto LABEL_6;
  }
  VinylFirmware::getFwMac(a1);
  cf[1] = 0;
  v18 = 0uLL;
  ctu::cf::assign();
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v12, v13, v14, (char)"bundMac.size() == kFWMacSize");
  v15 = 1;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(cf);
  return v15;
}

void sub_222D59EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,const void *a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;

  if (a19 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a22);
  if (v28)
    operator delete(v28);
  _Unwind_Resume(a1);
}

uint64_t eUICCStateMachine::UpdateMain(uint64_t a1, CFMutableDataRef *a2, uint64_t a3, int *a4, _QWORD *a5)
{
  _OWORD *v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **p_s1;
  uint64_t v16;
  size_t v17;
  void *v18;
  void **v19;
  void **v20;
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
  const void *AuthPayload;
  CFTypeRef v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  _OWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t FwData;
  _OWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  char v75;
  CFTypeRef v76;
  CFTypeRef cf;
  void *__s1;
  size_t __n[2];
  void *__p[2];
  uint64_t v81;
  _BYTE __src[281];
  _DWORD __dst[73];

  *(_QWORD *)&__dst[71] = *MEMORY[0x24BDAC8D0];
  __p[0] = 0;
  __p[1] = 0;
  v81 = 0;
  __s1 = 0;
  __n[0] = 0;
  __n[1] = 0;
  cf = 0;
  (*(void (**)(_DWORD *__return_ptr))(*(_QWORD *)*a5 + 8))(__dst);
  if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"euiccData.Valid()");
    v24 = 18;
LABEL_28:
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
    goto LABEL_49;
  }
  if (!a2)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v25, v26, v27, (char)"mainFirmware");
    v24 = 15;
    goto LABEL_28;
  }
  VinylFirmware::getVersionString(a2, __src);
  if (SHIBYTE(v81) < 0)
    operator delete(__p[0]);
  *(_OWORD *)__p = *(_OWORD *)__src;
  v81 = *(_QWORD *)&__src[16];
  v9 = operator new(0x28uLL);
  v10 = *(_OWORD *)&__dst[10];
  *v9 = *(_OWORD *)&__dst[6];
  v9[1] = v10;
  *((_BYTE *)v9 + 32) = 0;
  if (SHIBYTE(__n[1]) < 0)
    operator delete(__s1);
  __s1 = v9;
  *(_OWORD *)__n = xmmword_222D6FC00;
  VinylFirmware::getFwMac(a2);
  memset(__src, 0, 24);
  ctu::cf::assign();
  v11 = *(_QWORD **)__src;
  if (*(_QWORD *)&__src[8] - *(_QWORD *)__src != 8)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v28, v29, v30, (char)"bundMac.size() == kFWMacSize");
    v24 = 1;
    goto LABEL_47;
  }
  gBBULogMaskGet();
  p_s1 = &__s1;
  if ((__n[1] & 0x8000000000000000) != 0)
    LOBYTE(p_s1) = (_BYTE)__s1;
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Update Main:Card %s Bundle %s\n", v12, v13, v14, (char)p_s1);
  if (!*(_BYTE *)(a3 + 10))
  {
    v16 = HIBYTE(__n[1]);
    if ((__n[1] & 0x8000000000000000) == 0)
      v17 = HIBYTE(__n[1]);
    else
      v17 = __n[0];
    v18 = (void *)HIBYTE(v81);
    if (v81 < 0)
      v18 = __p[1];
    if ((void *)v17 == v18)
    {
      if (v81 >= 0)
        v19 = __p;
      else
        v19 = (void **)__p[0];
      if ((__n[1] & 0x8000000000000000) != 0)
      {
        if (memcmp(__s1, v19, __n[0]))
          goto LABEL_31;
      }
      else if (HIBYTE(__n[1]))
      {
        v20 = &__s1;
        while (*(unsigned __int8 *)v20 == *(unsigned __int8 *)v19)
        {
          v20 = (void **)((char *)v20 + 1);
          v19 = (void **)((char *)v19 + 1);
          if (!--v16)
            goto LABEL_44;
        }
        goto LABEL_31;
      }
LABEL_44:
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Main FW versions already matching (no forceMain)\n", v46, v47, v48, v73);
      v24 = 0;
LABEL_45:
      v39 = 5;
      goto LABEL_46;
    }
  }
LABEL_31:
  AuthPayload = (const void *)VinylFirmware::getAuthPayload((VinylFirmware *)a2);
  v32 = cf;
  cf = AuthPayload;
  *(_QWORD *)__src = v32;
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__src);
  v33 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!cf)
    v33 = 0;
  if (!v33)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Install main but no ticket -- back to restored please\n", v36, v37, v38, v73);
    v24 = 45;
    v39 = 4;
LABEL_46:
    *a4 = v39;
    goto LABEL_47;
  }
  if (*(_BYTE *)(a3 + 10) || *(_QWORD *)&__dst[18] != *v11)
  {
    v34 = *a5;
    v76 = cf;
    if (cf)
      CFRetain(cf);
    v24 = (*(uint64_t (**)(uint64_t, CFTypeRef *))(*(_QWORD *)v34 + 40))(v34, &v76);
    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v76);
    v35 = (_OWORD *)*a5;
    *(_OWORD *)((char *)v35 + 8) = 0u;
    v35 = (_OWORD *)((char *)v35 + 8);
    v35[15] = 0u;
    v35[16] = 0u;
    v35[13] = 0u;
    v35[14] = 0u;
    v35[11] = 0u;
    v35[12] = 0u;
    v35[9] = 0u;
    v35[10] = 0u;
    v35[7] = 0u;
    v35[8] = 0u;
    v35[5] = 0u;
    v35[6] = 0u;
    v35[3] = 0u;
    v35[4] = 0u;
    v35[1] = 0u;
    v35[2] = 0u;
    *(_OWORD *)((char *)v35 + 265) = 0u;
    if ((_DWORD)v24)
      goto LABEL_55;
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully pushed Install Ticket\n", v40, v41, v42, v73);
  }
  v43 = *a5;
  FwData = VinylFirmware::getFwData((VinylFirmware *)a2);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v43 + 48))(v43, FwData);
  v45 = (_OWORD *)*a5;
  *(_OWORD *)((char *)v45 + 8) = 0u;
  v45 = (_OWORD *)((char *)v45 + 8);
  v45[15] = 0u;
  v45[16] = 0u;
  v45[13] = 0u;
  v45[14] = 0u;
  v45[11] = 0u;
  v45[12] = 0u;
  v45[9] = 0u;
  v45[10] = 0u;
  v45[7] = 0u;
  v45[8] = 0u;
  v45[5] = 0u;
  v45[6] = 0u;
  v45[3] = 0u;
  v45[4] = 0u;
  v45[1] = 0u;
  v45[2] = 0u;
  *(_OWORD *)((char *)v45 + 265) = 0u;
  if (!(_DWORD)v24)
  {
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully streamed Firmware\n", v50, v51, v52, v73);
    v24 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)*a5 + 16))(*a5, 0, 0);
    v53 = (_OWORD *)*a5;
    *(_OWORD *)((char *)v53 + 8) = 0u;
    v53 = (_OWORD *)((char *)v53 + 8);
    v53[15] = 0u;
    v53[16] = 0u;
    v53[13] = 0u;
    v53[14] = 0u;
    v53[11] = 0u;
    v53[12] = 0u;
    v53[9] = 0u;
    v53[10] = 0u;
    v53[7] = 0u;
    v53[8] = 0u;
    v53[5] = 0u;
    v53[6] = 0u;
    v53[3] = 0u;
    v53[4] = 0u;
    v53[1] = 0u;
    v53[2] = 0u;
    *(_OWORD *)((char *)v53 + 265) = 0u;
    if (!(_DWORD)v24)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "successfully switched back to Normal\n", v57, v58, v59, v74);
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)*a5 + 8))(__src);
      memcpy(__dst, __src, 0x119uLL);
      v60 = operator new(0x28uLL);
      *(_QWORD *)__src = v60;
      *(_OWORD *)&__src[8] = xmmword_222D6FC00;
      v61 = *(_OWORD *)&__dst[10];
      *v60 = *(_OWORD *)&__dst[6];
      v60[1] = v61;
      *((_BYTE *)v60 + 32) = 0;
      if (__dst[0] == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
      {
        if (std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__src, (unsigned __int8 *)__p))
        {
          gBBULogMaskGet();
          v65 = __src;
          if (__src[23] < 0)
            LOBYTE(v65) = __src[0];
          _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Main version strings mismatched: Card %s Bundle %s", v62, v63, v64, (char)v65);
          v66 = 0;
          v24 = 22;
        }
        else
        {
          v24 = 0;
          v66 = 1;
        }
      }
      else
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v67, v68, v69, (char)"euiccData.Valid()");
        v66 = 0;
        v24 = 18;
      }
      if ((__src[23] & 0x80000000) != 0)
        operator delete(*(void **)__src);
      if (!v66)
        goto LABEL_47;
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Success!\n", v70, v71, v72, v75);
      goto LABEL_45;
    }
  }
LABEL_55:
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Condition <<%s>> failed %s %s/%d\n", v54, v55, v56, (char)"kBBUReturnSuccess == ret");
LABEL_47:
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&cf);
  if (v11)
    operator delete(v11);
LABEL_49:
  if (SHIBYTE(__n[1]) < 0)
    operator delete(__s1);
  if (SHIBYTE(v81) < 0)
    operator delete(__p[0]);
  return v24;
}

void sub_222D5A730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, int a17, const void *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  void *v37;

  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a18);
  if (v37)
    operator delete(v37);
  if (a24 < 0)
    operator delete(__p);
  if (a30 < 0)
    operator delete(a25);
  _Unwind_Resume(a1);
}

uint64_t eUICCStateMachine::PostProcess(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "Empty implementation for PostProcess. Non updater takes care of refurb options!\n", v5, v6, v7, v9);
  *a4 = 8;
  return 0;
}

uint64_t eUICCStateMachine::Retry(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  std::chrono::nanoseconds __ns;

  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)*a5 + 16))(*a5, 0, 1);
  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "eUICCeUICCStateMachine", "", "...waiting patiently for reset\n", v6, v7, v8, v10);
  __ns.__rep_ = 10000000000;
  std::this_thread::sleep_for (&__ns);
  *a4 = 0;
  return 0;
}

uint64_t std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = a3;
  v6 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

uint64_t HowToProceed(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BBUCapabilities *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  __int128 v27;
  _QWORD v28[2];
  char v29;
  std::string __p;
  __int128 v31;

  *(_QWORD *)&v31 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 8))
  {
    gBBULogMaskGet();
    v5 = "eUICC Skip All\n";
LABEL_3:
    _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", v5, v2, v3, v4, v26);
    return 3;
  }
  if (*(_DWORD *)a1 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "0.1");
    v27 = 0uLL;
    v28[0] = 0;
    v28[1] = &v27;
    v29 = 0;
    *(_QWORD *)&v27 = operator new(0x18uLL);
    *((_QWORD *)&v27 + 1) = v27;
    v28[0] = v27 + 24;
    *((_QWORD *)&v27 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)v28, (__int128 *)&__p, &v31, (std::string *)v27);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    VinylFirmware::bootloaderVersion((VinylFirmware *)*(unsigned __int8 *)(a1 + 240), *(unsigned __int8 *)(a1 + 241), &__p);
    v8 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(v27, *((uint64_t *)&v27 + 1), (unsigned __int8 **)&__p);
    if (v8 == *((_QWORD *)&v27 + 1))
    {
      v6 = 1;
    }
    else
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", "eUICC HW present is too old so we will skip updating it\n", v9, v10, v11, v26);
      v6 = 3;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  else
  {
    if (*(_BYTE *)(a1 + 278))
    {
      gBBULogMaskGet();
      v5 = "eUICC not stuffed but that's ok!\n";
      goto LABEL_3;
    }
    pthread_mutex_lock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    v12 = (BBUCapabilities *)qword_2557754F8;
    if (!qword_2557754F8)
    {
      BBUCapabilities::create_default_global(&v27);
      std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v27);
      v13 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
      if (*((_QWORD *)&v27 + 1))
      {
        v14 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      v12 = (BBUCapabilities *)qword_2557754F8;
    }
    v16 = (std::__shared_weak_count *)off_255775500;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)off_255775500;
    if (off_255775500)
    {
      v17 = (unint64_t *)((char *)off_255775500 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
    v19 = BBUCapabilities::supportsVinylUpdate(v12);
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    if (v19)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "eUICC", "", "Bailing on eUICC error due to status %u\n", v22, v23, v24, *(_DWORD *)a1);
      return 0;
    }
    else
    {
      return 2;
    }
  }
  return v6;
}

void sub_222D5ABD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  _Unwind_Resume(a1);
}

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 1;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) != 0;
  if (a1[23])
  {
    v6 = v2 - 1;
    do
    {
      v8 = *a1++;
      v7 = v8;
      v9 = *a2++;
      v10 = v7 == v9;
      v2 = v7 != v9;
      v10 = !v10 || v6-- == 0;
    }
    while (!v10);
  }
  return v2;
}

_QWORD *std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = off_24EB7AA58;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = off_24EB7AA58;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::operator()(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(a1 + 8))(*a2, *a3, a4, a5, a6);
}

uint64_t std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &),std::allocator<BBUReturn (*)(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>,BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::target_type()
{
}

uint64_t std::map<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
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
      std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__emplace_hint_unique_key_args<eUICCStateMachine::State,std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_222D5AE2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__emplace_hint_unique_key_args<eUICCStateMachine::State,std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__find_equal<eUICCStateMachine::State>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__construct_node<std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__find_equal<eUICCStateMachine::State>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
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

uint64_t std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::__construct_node<std::pair<eUICCStateMachine::State const,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>> const&>@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _DWORD *v6;
  uint64_t result;

  v5 = a1 + 8;
  v6 = operator new(0x48uLL);
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 16) = 0;
  v6[8] = *a2;
  result = std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__value_func[abi:ne180100]((uint64_t)(v6 + 10), (uint64_t)(a2 + 2));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_222D5B0D8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State &,std::unique_ptr<eUICC::eUICCVinylValve> &)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  _QWORD *v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (_QWORD *)__p[8];
    if (v3 == __p + 5)
    {
      v4 = 4;
      v3 = __p + 5;
      goto LABEL_8;
    }
    if (v3)
    {
      v4 = 5;
LABEL_8:
      (*(void (**)(void))(*v3 + 8 * v4))();
    }
LABEL_9:
    operator delete(__p);
    return;
  }
  if (__p)
    goto LABEL_9;
}

void std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t v5;

  if (a2)
  {
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::__map_value_compare<eUICCStateMachine::State,std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>,std::less<eUICCStateMachine::State>,true>,std::allocator<std::__value_type<eUICCStateMachine::State,std::function<BBUReturn ()(VinylFirmware *,VinylFirmware *,Options const&,eUICCStateMachine::State&,std::unique_ptr<eUICC::eUICCVinylValve> &)>>>>::destroy(a1, a2[1]);
    v4 = (_QWORD *)a2[8];
    if (v4 == a2 + 5)
    {
      v5 = 4;
      v4 = a2 + 5;
    }
    else
    {
      if (!v4)
      {
LABEL_8:
        operator delete(a2);
        return;
      }
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
    goto LABEL_8;
  }
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  void *v1;

  std::exception::~exception(this);
  operator delete(v1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
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

void sub_222D5B324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

uint64_t std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(uint64_t a1, uint64_t a2, unsigned __int8 **a3)
{
  uint64_t v3;
  char v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;

  v3 = a1;
  if (a1 != a2)
  {
    v5 = *((_BYTE *)a3 + 23);
    if (v5 >= 0)
      v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    else
      v6 = a3[1];
    if (v5 >= 0)
      v7 = (unsigned __int8 *)a3;
    else
      v7 = *a3;
    do
    {
      v8 = *(unsigned __int8 *)(v3 + 23);
      if ((v8 & 0x80u) == 0)
        v9 = (unsigned __int8 *)*(unsigned __int8 *)(v3 + 23);
      else
        v9 = *(unsigned __int8 **)(v3 + 8);
      if (v9 == v6)
      {
        if ((v8 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v3, v7, *(_QWORD *)(v3 + 8)))
            return v3;
        }
        else
        {
          if (!*(_BYTE *)(v3 + 23))
            return v3;
          v10 = 0;
          while (*(unsigned __int8 *)(v3 + v10) == v7[v10])
          {
            if (v8 == ++v10)
              return v3;
          }
        }
      }
      v3 += 24;
    }
    while (v3 != a2);
    return a2;
  }
  return v3;
}

uint64_t __cxx_global_var_init_5()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

uint64_t __cxx_global_var_init_47()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
  }
  return result;
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

void sub_222D5B5A0(_Unwind_Exception *a1)
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

  *(_QWORD *)a1 = off_24EB7AB90;
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

void sub_222D5B6B4(_Unwind_Exception *a1)
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
  *(_QWORD *)this = off_24EB7AB90;
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

void sub_222D5B744(_Unwind_Exception *a1)
{
  const void **v1;

  ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::getParamUpdateOperation(const void **this, __CFDictionary *a2, const __CFDictionary *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  int TransportNoEvents;
  char v10;
  uint64_t v11;
  const __CFAllocator *v12;
  CFDataRef v13;
  void *v14;
  uint64_t (*v15)(uint64_t);
  CFNumberRef v16;
  void *v17;
  uint64_t (*v18)(uint64_t);
  CFDataRef v19;
  void *v20;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v22;
  uint64_t (*v23)(uint64_t);
  uint64_t (*v24)(uint64_t);
  CFDataRef v25;
  void *v26;
  __CFDictionary *v27;
  CFMutableDictionaryRef v28;
  uint64_t (*v29)(uint64_t);
  uint64_t (*v30)(uint64_t);
  CFDataRef v31;
  void *v32;
  uint64_t (*v33)(uint64_t);
  CFDataRef v34;
  void *v35;
  uint64_t (*v36)(uint64_t);
  CFDataRef v37;
  void *v38;
  uint64_t (*v39)(uint64_t);
  CFDataRef v40;
  void *v41;
  uint64_t (*v42)(uint64_t);
  const void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
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
  uint64_t v74;
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
  char v93;
  const void *v94;
  void *v95[4];
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  CFMutableDictionaryRef theDict;
  CFMutableDictionaryRef v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *value;
  _BYTE __p[281];
  _DWORD __dst[71];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  LOBYTE(__dst[70]) = 0;
  v111 = 0;
  value = 0;
  v109 = 0;
  v110 = 0;
  v107 = 0;
  v108 = 0;
  theDict = 0;
  v106 = 0;
  v103 = 0;
  v104 = 0;
  if (a3)
  {
    *(_QWORD *)__p = a3;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 16, (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v94, this + 16);
  Options::Options(v95, &v94);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v94);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)v95);
  if (__p[23] >= 0)
    v8 = __p;
  else
    LOBYTE(v8) = __p[0];
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v5, v6, v7, (char)v8);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (a2)
  {
    TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)this);
    v10 = TransportNoEvents;
    if (!TransportNoEvents)
    {
      eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(this + 4), (void *)LODWORD(v95[0]), 0, (eUICC::eUICCVinylICEValve **)__p);
      v11 = *(_QWORD *)__p;
      if (*(_QWORD *)__p)
      {
        (*(void (**)(_BYTE *__return_ptr, _QWORD))(**(_QWORD **)__p + 8))(__p, *(_QWORD *)__p);
        memcpy(__dst, __p, 0x119uLL);
        if (__dst[0] != ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2))
        {
          if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
            _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v75, v76, v77, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
          gBBULogMaskGet();
          v56 = "eUICC not detected, skipping\n";
          goto LABEL_120;
        }
        v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&__dst[1] + 3, 16);
        v14 = value;
        value = v13;
        *(_QWORD *)__p = v14;
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
        if (value)
          v15 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        else
          v15 = 0;
        if (v15)
        {
          CFDictionarySetValue(a2, CFSTR("eUICC,EID"), value);
          v16 = CFNumberCreate(v12, kCFNumberSInt8Type, (char *)&__dst[68] + 3);
          v17 = v111;
          v111 = v16;
          *(_QWORD *)__p = v17;
          ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)__p);
          v18 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
          if (!v111)
            v18 = 0;
          if (v18)
          {
            CFDictionarySetValue(a2, CFSTR("eUICC,ChipID"), v111);
            v19 = CFDataCreate(v12, (const UInt8 *)&__dst[14], 8);
            v20 = v110;
            v110 = v19;
            *(_QWORD *)__p = v20;
            ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
            Mutable = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v22 = theDict;
            theDict = Mutable;
            *(_QWORD *)__p = v22;
            ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
            if (v110)
              v23 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            else
              v23 = 0;
            if (v23
              && (theDict
                ? (v24 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
                : (v24 = 0),
                  v24))
            {
              CFDictionarySetValue(theDict, CFSTR("Nonce"), v110);
              CFDictionarySetValue(a2, CFSTR("eUICC,Main"), theDict);
              v25 = CFDataCreate(v12, (const UInt8 *)&__dst[16], 8);
              v26 = v109;
              v109 = v25;
              *(_QWORD *)__p = v26;
              ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
              v27 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              v28 = v106;
              v106 = v27;
              *(_QWORD *)__p = v28;
              ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)__p);
              if (v109)
                v29 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
              else
                v29 = 0;
              if (v29
                && (v106
                  ? (v30 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
                  : (v30 = 0),
                    v30))
              {
                CFDictionarySetValue(v106, CFSTR("Nonce"), v109);
                CFDictionarySetValue(a2, CFSTR("eUICC,Gold"), v106);
                CFDictionarySetValue(a2, CFSTR("@eUICC,Ticket"), (const void *)*MEMORY[0x24BDBD270]);
                v31 = CFDataCreate(v12, (const UInt8 *)&__dst[60] + 3, 20);
                v32 = v108;
                v108 = v31;
                *(_QWORD *)__p = v32;
                ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                if (v108)
                  v33 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                else
                  v33 = 0;
                if (v33)
                {
                  CFDictionarySetValue(a2, CFSTR("eUICC,RootKeyIdentifier"), v108);
                  v34 = CFDataCreate(v12, (const UInt8 *)&__dst[60], 3);
                  v35 = v107;
                  v107 = v34;
                  *(_QWORD *)__p = v35;
                  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                  if (v107)
                    v36 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                  else
                    v36 = 0;
                  if (v36)
                  {
                    CFDictionarySetValue(a2, CFSTR("eUICC,FirmwareLoaderVersion"), v107);
                    v37 = CFDataCreate(v12, (const UInt8 *)&__dst[18], 16);
                    v38 = v104;
                    v104 = v37;
                    *(_QWORD *)__p = v38;
                    ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                    if (v104)
                      v39 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                    else
                      v39 = 0;
                    if (v39)
                    {
                      CFDictionarySetValue(a2, CFSTR("eUICC,MainFwMac"), v104);
                      v40 = CFDataCreate(v12, (const UInt8 *)&__dst[36] + 3, 16);
                      v41 = v103;
                      v103 = v40;
                      *(_QWORD *)__p = v41;
                      ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)__p);
                      if (v103)
                        v42 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
                      else
                        v42 = 0;
                      if (v42)
                      {
                        CFDictionarySetValue(a2, CFSTR("eUICC,GoldFwMac"), v103);
                        v43 = (const void *)MGCopyAnswer();
                        if (v43)
                        {
                          CFDictionarySetValue(a2, CFSTR("eUICC,ApProductionMode"), v43);
                        }
                        else
                        {
                          gBBULogMaskGet();
                          _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "MobileGestalt returned NULL for SigningFuse", v45, v46, v47, v93);
                        }
                        LODWORD(v44) = 0;
                        goto LABEL_55;
                      }
                      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v90, v91, v92, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                      gBBULogMaskGet();
                      v56 = "failed to create goldFwMac\n";
                    }
                    else
                    {
                      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v87, v88, v89, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                      gBBULogMaskGet();
                      v56 = "failed to create mainFwMac\n";
                    }
                  }
                  else
                  {
                    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v84, v85, v86, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                    gBBULogMaskGet();
                    v56 = "failed to create firmwareLoaderVersion\n";
                  }
                }
                else
                {
                  if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                    _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v81, v82, v83, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                  gBBULogMaskGet();
                  v56 = "failed to create certIdentifier\n";
                }
              }
              else
              {
                if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                  _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v57, v58, v59, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
                gBBULogMaskGet();
                v56 = "failed to create goldDict\n";
              }
            }
            else
            {
              if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
                _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v50, v51, v52, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
              gBBULogMaskGet();
              v56 = "failed to create mainDict\n";
            }
            goto LABEL_120;
          }
          if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity < 6)
            goto LABEL_103;
        }
        else if ((*(_BYTE *)gBBULogMaskGet() & 2) == 0 || gBBULogVerbosity <= 5)
        {
          goto LABEL_103;
        }
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v78, v79, v80, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
LABEL_103:
        gBBULogMaskGet();
        v56 = "failed to create euiccCSN\n";
LABEL_120:
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", v56, v53, v54, v55, v93);
        goto LABEL_121;
      }
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v72, v73, v74, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      gBBULogMaskGet();
      v10 = 0;
      v44 = 0xFFFFFFFFLL;
LABEL_92:
      v11 = 0;
      _BBULog(0, v44, "VinylController", "", "Fail to create transport: %d\n", v69, v70, v71, v10);
LABEL_121:
      LODWORD(v44) = 1;
      goto LABEL_55;
    }
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v66, v67, v68, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    v11 = 0;
    v44 = 1;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity > 0)
      goto LABEL_92;
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v60, v61, v62, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    v11 = 0;
    LODWORD(v44) = 1;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      v11 = 0;
      _BBULog(0, 1, "VinylController", "", "deviceInfoDict passed is NULL:\n", v63, v64, v65, v93);
    }
  }
LABEL_55:
  v48 = VinylController::freeTransport((VinylController *)this);
  if (v102 < 0)
    operator delete(v101);
  if (v100 < 0)
    operator delete(v99);
  if (v98 < 0)
    operator delete(v97);
  if (v96 < 0)
    operator delete(v95[2]);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v103);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v104);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v106);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v107);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v108);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v109);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&v110);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v111);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef((const void **)&value);
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 96))(v11);
  if (v48)
    return v48;
  else
    return v44;
}

void sub_222D5C2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,const void *a29,const void *a30,const void *a31,const void *a32,const void *a33,const void *a34,const void *a35,const void *a36,const void *a37,const void *a38)
{
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a29);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a30);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a31);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a32);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a33);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a34);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a35);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a36);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(&a37);
  ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&a38);
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

uint64_t VinylController::checkVinylPresence(const void **this, const __CFDictionary *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  unsigned int TransportNoEvents;
  void *v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  const void *v35;
  void *v36[4];
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *__p[2];
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    __p[0] = a2;
    ctu::cf::CFSharedRef<__CFDictionary const>::reset(this + 16, (CFTypeRef *)__p);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(&v35, this + 16);
  Options::Options(v36, &v35);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v35);
  gBBULogMaskGet();
  Options::ToString((uint64_t *)__p, (Options *)v36);
  if (v45 >= 0)
    v8 = __p;
  else
    LOBYTE(v8) = __p[0];
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "VinylRestore Options:\n%s\n", v5, v6, v7, (char)v8);
  if (v45 < 0)
    operator delete(__p[0]);
  if (a3)
  {
    *a3 = 0;
    TransportNoEvents = VinylController::createTransportNoEvents((VinylController *)this);
    if (TransportNoEvents)
    {
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v21, v22, v23, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      v24 = (_BYTE *)gBBULogMaskGet();
      v10 = 0;
      v12 = 0;
      if ((*v24 & 1) != 0 && gBBULogVerbosity >= 1)
      {
        _BBULog(0, 1, "VinylController", "", "Fail to create transport: %d\n", v25, v26, v27, TransportNoEvents);
        v12 = 0;
        v10 = 0;
      }
    }
    else
    {
      eUICC::VinylFactory::GetValve((eUICC::VinylFactory *)(this + 4), (void *)LODWORD(v36[0]), 0, (eUICC::eUICCVinylICEValve **)__p);
      v10 = __p[0];
      if (__p[0])
      {
        (*(void (**)(void **__return_ptr, void *))(*(_QWORD *)__p[0] + 8))(__p, __p[0]);
        v11 = (int)__p[0];
        TransportNoEvents = 0;
        v12 = v11 == ((TelephonyRadiosGetRadioVendor() & 0xFFFFFFFE) != 2);
      }
      else
      {
        if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to create transport: %d\n", v31, v32, v33, 0);
        v12 = 0;
        v10 = 0;
        TransportNoEvents = 1;
      }
    }
    *a3 = v12;
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    v10 = 0;
    TransportNoEvents = 2;
    if ((*(_BYTE *)gBBULogMaskGet() & 1) != 0 && gBBULogVerbosity >= 1)
    {
      _BBULog(0, 1, "VinylController", "", "Invalid input parameter\n", v18, v19, v20, v34);
      v10 = 0;
      TransportNoEvents = 2;
    }
  }
  v13 = VinylController::freeTransport((VinylController *)this);
  if (v43 < 0)
    operator delete(v42);
  if (v41 < 0)
    operator delete(v40);
  if (v39 < 0)
    operator delete(v38);
  if (v37 < 0)
    operator delete(v36[2]);
  if (v10)
    (*(void (**)(void *))(*(_QWORD *)v10 + 96))(v10);
  if (v13)
    return v13;
  else
    return TransportNoEvents;
}

void sub_222D5CAB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  _Unwind_Resume(exception_object);
}

uint64_t VinylController::updateFw(VinylController *this, VinylFirmware *a2, VinylFirmware *a3, const __CFDictionary *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int TransportNoEvents;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
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
  uint64_t v37;
  char v38;
  char v39;
  eUICCStateMachine *v40;
  std::__shared_weak_count *v41;

  eUICCStateMachine::create_default_global(&v40);
  gBBULogMaskGet();
  _BBULog(22, 0xFFFFFFFFLL, "VinylController", "", "entering VinylController::updateFw\n", v8, v9, v10, v38);
  if (a2 && a3 && a4)
  {
    TransportNoEvents = VinylController::createTransportNoEvents(this);
    if (TransportNoEvents)
    {
      if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
        _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v26, v27, v28, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to create transport: %d\n", v29, v30, v31, TransportNoEvents);
    }
    else
    {
      TransportNoEvents = eUICCStateMachine::Run(v40, (VinylController *)((char *)this + 32), a2, a3, a4);
      if (TransportNoEvents)
      {
        if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
          _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v32, v33, v34, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Fail to run eUICC state machine: %d\n", v35, v36, v37, TransportNoEvents);
      }
      else
      {
        TransportNoEvents = 0;
        if ((*(_BYTE *)(gBBULogMaskGet() + 2) & 0x40) != 0 && gBBULogVerbosity >= 1)
        {
          _BBULog(22, 1, "VinylController", "", "returning VinylController::updateFw\n", v12, v13, v14, v39);
          TransportNoEvents = 0;
        }
      }
    }
  }
  else
  {
    if ((*(_BYTE *)gBBULogMaskGet() & 2) != 0 && gBBULogVerbosity >= 6)
      _BBULog(1, 6, "VinylController", "", "check failed: %s, %d, assertion: %s\n", v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/VinylRestore/Controller/VinylController.cpp");
    gBBULogMaskGet();
    _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "invalid input params", v23, v24, v25, v39);
    TransportNoEvents = 2;
  }
  v15 = VinylController::freeTransport(this);
  v16 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (v15)
    return v15;
  else
    return TransportNoEvents;
}

void sub_222D5CE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *eUICCStateMachine::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  eUICCStateMachine *v3;

  v3 = (eUICCStateMachine *)operator new(4uLL);
  eUICCStateMachine::eUICCStateMachine(v3);
  return std::shared_ptr<eUICCStateMachine>::shared_ptr[abi:ne180100]<eUICCStateMachine,void>(a1, (uint64_t)v3);
}

void sub_222D5CE7C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylController::Refurb(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  gBBULogMaskGet();
  _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "refurbAction: %d\n", v5, v6, v7, a2);
  v8 = 0;
  if ((a2 - 3) >= 2)
  {
    if (a2 == 2)
    {
      v9 = *(uint64_t (**)(void))(**(_QWORD **)a3 + 24);
    }
    else
    {
      if (a2 != 1)
      {
        gBBULogMaskGet();
        _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "default case\n", v13, v14, v15, v17);
        return 0;
      }
      v9 = *(uint64_t (**)(void))(**(_QWORD **)a3 + 24);
    }
    v8 = v9();
    if ((_DWORD)v8)
    {
      gBBULogMaskGet();
      _BBULog(0, 0xFFFFFFFFLL, "VinylController", "", "Failed to handle Refurb operation, ret %d\n", v10, v11, v12, v8);
    }
  }
  return v8;
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
  v5 = (BBUCapabilities *)qword_2557754F8;
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(&v28);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v28);
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
    v5 = (BBUCapabilities *)qword_2557754F8;
  }
  v9 = (std::__shared_weak_count *)off_255775500;
  v27 = (std::__shared_weak_count *)off_255775500;
  if (off_255775500)
  {
    v10 = (unint64_t *)((char *)off_255775500 + 8);
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
  v13 = (BBUCapabilities *)qword_2557754F8;
  if (!qword_2557754F8)
  {
    BBUCapabilities::create_default_global(&v28);
    std::shared_ptr<eUICC::Perso::PersoImplementation>::operator=[abi:ne180100]((uint64_t)&qword_2557754F8, &v28);
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
    v13 = (BBUCapabilities *)qword_2557754F8;
  }
  v17 = (std::__shared_weak_count *)off_255775500;
  if (off_255775500)
  {
    v18 = (unint64_t *)((char *)off_255775500 + 8);
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

void sub_222D5D228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  pthread_mutex_unlock(&ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
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

  *this = off_24EB7AB90;
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

_QWORD *std::shared_ptr<eUICCStateMachine>::shared_ptr[abi:ne180100]<eUICCStateMachine,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_24EB7ABC0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_222D5D2E4(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<eUICCStateMachine *,std::shared_ptr<eUICCStateMachine>::__shared_ptr_default_delete<eUICCStateMachine,eUICCStateMachine>,std::allocator<eUICCStateMachine>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_6()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_222D3F000);
  }
  return result;
}

uint64_t __cxx_global_var_init_69()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUCapabilities>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUCapabilities,BBUCapabilities,ctu::PthreadMutexGuardPolicy<BBUCapabilities>>::sInstance, &dword_222D3F000);
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

void sub_222D5D510(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t VinylCommunication::VinylCommunication(uint64_t result, int a2, uint64_t a3)
{
  *(_QWORD *)result = off_24EB7AC38;
  *(_DWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  return result;
}

uint64_t VinylEURCommunication::VinylEURCommunication(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)a1 = off_24EB7A5C8;
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
  *(_QWORD *)a1 = off_24EB7A930;
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = dispatch_queue_create("com.apple.VinylCommunication", 0);
  *(_QWORD *)(a1 + 40) = dispatch_queue_create("com.apple.VinylStatuscallback", 0);
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 34;
  return a1;
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
  v44[3] = __Block_byref_object_copy__0;
  v44[4] = __Block_byref_object_dispose__0;
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
  *(_QWORD *)v4 = off_24EB7ACB0;
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
  MEMORY[0x22767D7F0](v9);
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

void sub_222D5DB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,const void *a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
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

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__0(uint64_t a1)
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

void sub_222D5DD1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(v1);
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
        MEMORY[0x22767DDA8](v8, 4, v4);
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

void sub_222D5DF70(_Unwind_Exception *a1)
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

void sub_222D5E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
}

void getVinylTatsuTagToFileNameMap(uint64_t a1@<X8>)
{
  uint64_t i;
  const __CFString *v3;
  _QWORD v4[4];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("eUICC,Gold");
  std::string::basic_string[abi:ne180100]<0>(v4, "euig");
  v4[3] = CFSTR("eUICC,Main");
  std::string::basic_string[abi:ne180100]<0>(v5, "euim");
  std::map<__CFString const*,std::string>::map[abi:ne180100](a1, (unint64_t *)&v3, 2);
  for (i = 0; i != -8; i -= 4)
  {
    if (SHIBYTE(v5[i + 2]) < 0)
      operator delete((void *)v5[i]);
  }
}

void sub_222D5E27C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  uint64_t v18;

  v18 = 0;
  while (1)
  {
    if (*(char *)(v16 + v18 + 63) < 0)
      operator delete(*(void **)(v16 + v18 + 40));
    v18 -= 32;
    if (v18 == -64)
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

void sub_222D5E330(_Unwind_Exception *a1)
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, v10, v6, v8);
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

void sub_222D5E5FC(_Unwind_Exception *a1)
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

void VinylTransport::createTransport(uint64_t *a1@<X0>, uint64_t a2@<X1>, ACFUTransport **a3@<X8>)
{
  ACFUTransport *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ACFULogging *v11;
  char v12;
  unint64_t *v13;
  unint64_t v14;
  ACFUTransport *v15;
  _QWORD v16[2];

  v6 = (ACFUTransport *)operator new(0x28uLL);
  ACFUTransport::ACFUTransport(v6);
  *(_QWORD *)v6 = &off_24EB7ACF8;
  *a3 = v6;
  v7 = *a1;
  v8 = (std::__shared_weak_count *)a1[1];
  v16[0] = v7;
  v16[1] = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (ACFULogging *)VinylTransport::init((uint64_t)v6, (uint64_t)v16, a2);
  v12 = (char)v11;
  if (v8)
  {
    v13 = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if ((v12 & 1) == 0)
  {
    ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage();
    v15 = *a3;
    *a3 = 0;
    if (v15)
      (*(void (**)(ACFUTransport *))(*(_QWORD *)v15 + 64))(v15);
  }
}

void sub_222D5E774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t *v11;
  uint64_t v13;

  v13 = *v11;
  *v11 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 64))(v13);
  _Unwind_Resume(exception_object);
}

void VinylTransport::VinylTransport(VinylTransport *this)
{
  _QWORD *v1;

  ACFUTransport::ACFUTransport(this);
  *v1 = &off_24EB7ACF8;
}

uint64_t VinylTransport::init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v11;

  *(_QWORD *)(a1 + 24) = a3;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a1 + 32) = ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)a2);
    AMSupportSafeRetain();
    AMSupportSafeRetain();
    v4 = *(std::__shared_weak_count **)(a2 + 8);
    v11 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v7 = ACFUTransport::init();
    if (v11)
    {
      v8 = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 0;
  }
  return v7;
}

void sub_222D5E8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ACFUFirmware>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t VinylTransport::getBoardParameters@<X0>(VinylTransport *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  ACFULogging::getLogInstance(this);
  result = ACFULogging::handleMessage();
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 2;
  return result;
}

ACFULogging *VinylTransport::getPersoParameters@<X0>(const __CFDictionary **this@<X0>, uint64_t a2@<X8>)
{
  __CFDictionary *Mutable;
  const void **v5;
  uint64_t v6;
  int ParamUpdateOperation;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ACFULogging *result;
  char v16;
  char v17;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable || (v5 = (const void **)VinylController::create(0, 0)) == 0)
  {
    ACFULogging::getLogInstance(0);
LABEL_9:
    result = (ACFULogging *)ACFULogging::handleMessage();
    v16 = 0;
    goto LABEL_5;
  }
  v6 = (uint64_t)v5;
  ParamUpdateOperation = VinylController::getParamUpdateOperation(v5, Mutable, this[3]);
  result = (ACFULogging *)VinylControllerObjDestroy(v6, v8, v9, v10, v11, v12, v13, v14, v17);
  if (ParamUpdateOperation)
  {
    ACFULogging::getLogInstance(result);
    goto LABEL_9;
  }
  v16 = 1;
LABEL_5:
  *(_QWORD *)a2 = Mutable;
  *(_BYTE *)(a2 + 8) = v16;
  return result;
}

BOOL VinylTransport::checkVinylPresence(const __CFDictionary **this)
{
  const void **v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ACFULogging *v12;
  char v14;
  BOOL v15;

  v15 = 0;
  v2 = (const void **)VinylController::create(0, 0);
  if (!v2)
  {
    ACFULogging::getLogInstance(0);
LABEL_7:
    ACFULogging::handleMessage();
    return 0;
  }
  v3 = (uint64_t)v2;
  v4 = VinylController::checkVinylPresence(v2, this[3], &v15);
  v12 = (ACFULogging *)VinylControllerObjDestroy(v3, v5, v6, v7, v8, v9, v10, v11, v14);
  if (v4)
  {
    ACFULogging::getLogInstance(v12);
    goto LABEL_7;
  }
  return v15;
}

uint64_t VinylTransport::createGoldFw(VinylTransport *this, CFDictionaryRef theDict, VinylFirmware **a3)
{
  ACFULogging *Value;
  const __CFData *v6;
  CFTypeID v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  const __CFData *v12;
  CFPropertyListRef v13;
  void *v14;
  ACFULogging *TypeID;
  uint64_t (*v16)(uint64_t);
  CFTypeID v17;
  const __CFDictionary *v18;
  ACFULogging *v19;
  uint64_t (*v20)(uint64_t);
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  const __CFData *v25;
  CFTypeID v26;
  const __CFData *v27;
  CFTypeID v28;
  const __CFData *v29;
  CFTypeID v30;
  __CFData *v31;
  CFTypeID v32;
  __CFData *v33;
  VinylFirmware *v34;
  uint64_t v35;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  __int128 v40;
  std::string v41;
  std::string v42;
  void *__p[2];
  std::string::size_type v44;
  CFErrorRef error;
  void *v46;
  const __CFDictionary *v47;

  v46 = 0;
  v47 = 0;
  error = 0;
  Value = (ACFULogging *)CFDictionaryGetValue(theDict, CFSTR("eUICC,Ticket"));
  v6 = Value;
  if (!Value || (v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v7 != Value))
  {
    ACFULogging::getLogInstance(Value);
LABEL_45:
    ACFULogging::handleMessage();
LABEL_46:
    v35 = 1;
    goto LABEL_33;
  }
  ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
  v8 = std::string::append(&v41, "::");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v42, "createGoldFw");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v44 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v44) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
  v12 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("FirmwareData"));
  if (!v12)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_45;
  }
  v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, 0, 0, &error);
  v14 = v46;
  v46 = (void *)v13;
  __p[0] = v14;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  TypeID = (ACFULogging *)v46;
  v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!v46)
    v16 = 0;
  if (!v16 || (v17 = CFGetTypeID(v46), TypeID = (ACFULogging *)CFDictionaryGetTypeID(), (ACFULogging *)v17 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
    v37 = std::string::append(&v41, "::");
    v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v38;
    v37->__r_.__value_.__l.__size_ = 0;
    v37->__r_.__value_.__r.__words[2] = 0;
    v37->__r_.__value_.__r.__words[0] = 0;
    v39 = std::string::append(&v42, "createGoldFw");
    v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
    v44 = v39->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v40;
    v39->__r_.__value_.__l.__size_ = 0;
    v39->__r_.__value_.__r.__words[2] = 0;
    v39->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v44) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v41.__r_.__value_.__l.__data_);
    goto LABEL_46;
  }
  v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v42.__r_.__value_.__l.__data_);
  v18 = v47;
  v47 = (const __CFDictionary *)__p[0];
  __p[0] = v18;
  v19 = (ACFULogging *)ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__p);
  if (v47)
    v20 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v20 = 0;
  if (!v20)
    goto LABEL_44;
  ACFULogging::getLogInstance(v19);
  std::string::basic_string[abi:ne180100]<0>(&v41, "VinylTransport");
  v21 = std::string::append(&v41, "::");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  v23 = std::string::append(&v42, "createGoldFw");
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v44 = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v44) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
  v19 = (ACFULogging *)CFDictionaryGetValue(v47, CFSTR("eUICC,Im4pGold"));
  v25 = v19;
  if (!v19)
    goto LABEL_44;
  v26 = CFGetTypeID(v19);
  v19 = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v26 != v19)
    goto LABEL_44;
  v19 = (ACFULogging *)CFDictionaryGetValue(v47, CFSTR("eUICC,InfoPlistDataGold"));
  v27 = v19;
  if (!v19)
    goto LABEL_44;
  v28 = CFGetTypeID(v19);
  v19 = (ACFULogging *)CFDataGetTypeID();
  if ((ACFULogging *)v28 != v19)
    goto LABEL_44;
  v19 = (ACFULogging *)CFDictionaryGetValue(v47, CFSTR("eUICC,ProfileDataGold"));
  v29 = v19;
  if (!v19
    || (v30 = CFGetTypeID(v19), v19 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v30 != v19)
    || (v19 = (ACFULogging *)CFDictionaryGetValue(v47, CFSTR("eUICC,Gold")), (v31 = v19) == 0)
    || (v32 = CFGetTypeID(v19), v19 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v32 != v19))
  {
LABEL_44:
    ACFULogging::getLogInstance(v19);
    goto LABEL_45;
  }
  v33 = (__CFData *)CFDictionaryGetValue(v47, CFSTR("eUICC,GoldRecoveryFw"));
  v34 = VinylFirmwareCreate(v31, v33, v25, v27, v29, v6);
  v35 = 0;
  *a3 = v34;
LABEL_33:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v46);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v47);
  return v35;
}

void sub_222D5F060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 80));
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v30 - 72));
  _Unwind_Resume(a1);
}

uint64_t VinylTransport::createMainFw(VinylTransport *this, CFDictionaryRef theDict, VinylFirmware **a3)
{
  ACFULogging *Value;
  const __CFData *v6;
  CFTypeID v7;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  const __CFData *v12;
  CFPropertyListRef v13;
  void *v14;
  ACFULogging *TypeID;
  uint64_t (*v16)(uint64_t);
  CFTypeID v17;
  const __CFDictionary *v18;
  const __CFData *v19;
  uint64_t (*v20)(uint64_t);
  const __CFData *v21;
  CFTypeID v22;
  const __CFData *v23;
  CFTypeID v24;
  const __CFData *v25;
  CFTypeID v26;
  __CFData *v27;
  CFTypeID v28;
  __CFData *v29;
  VinylFirmware *v30;
  uint64_t v31;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  __int128 v36;
  std::string v37;
  std::string v38;
  void *__p[2];
  std::string::size_type v40;
  CFErrorRef error;
  void *v42;
  const __CFDictionary *v43;

  v42 = 0;
  v43 = 0;
  error = 0;
  Value = (ACFULogging *)CFDictionaryGetValue(theDict, CFSTR("eUICC,Ticket"));
  v6 = Value;
  if (!Value || (v7 = CFGetTypeID(Value), Value = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v7 != Value))
  {
    ACFULogging::getLogInstance(Value);
LABEL_39:
    ACFULogging::handleMessage();
LABEL_40:
    v31 = 1;
    goto LABEL_26;
  }
  ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylTransport");
  v8 = std::string::append(&v37, "::");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v38, "createMainFw");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v40 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType();
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  v12 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("FirmwareData"));
  if (!v12)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_39;
  }
  v13 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, 0, 0, &error);
  v14 = v42;
  v42 = (void *)v13;
  __p[0] = v14;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  TypeID = (ACFULogging *)v42;
  v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!v42)
    v16 = 0;
  if (!v16 || (v17 = CFGetTypeID(v42), TypeID = (ACFULogging *)CFDictionaryGetTypeID(), (ACFULogging *)v17 != TypeID))
  {
    ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v37, "VinylTransport");
    v33 = std::string::append(&v37, "::");
    v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    v35 = std::string::append(&v38, "createMainFw");
    v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    v40 = v35->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v40) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    goto LABEL_40;
  }
  v38.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v38.__r_.__value_.__l.__data_);
  v18 = v43;
  v43 = (const __CFDictionary *)__p[0];
  __p[0] = v18;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)__p);
  v19 = v43;
  v20 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v43)
    v20 = 0;
  if (!v20)
    goto LABEL_38;
  v19 = (const __CFData *)CFDictionaryGetValue(v43, CFSTR("eUICC,Im4pMain"));
  v21 = v19;
  if (!v19)
    goto LABEL_38;
  v22 = CFGetTypeID(v19);
  v19 = (const __CFData *)CFDataGetTypeID();
  if ((const __CFData *)v22 != v19)
    goto LABEL_38;
  v19 = (const __CFData *)CFDictionaryGetValue(v43, CFSTR("eUICC,InfoPlistDataMain"));
  v23 = v19;
  if (!v19)
    goto LABEL_38;
  v24 = CFGetTypeID(v19);
  v19 = (const __CFData *)CFDataGetTypeID();
  if ((const __CFData *)v24 != v19)
    goto LABEL_38;
  v19 = (const __CFData *)CFDictionaryGetValue(v43, CFSTR("eUICC,ProfileDataMain"));
  v25 = v19;
  if (!v19
    || (v26 = CFGetTypeID(v19), v19 = (const __CFData *)CFDataGetTypeID(), (const __CFData *)v26 != v19)
    || (v19 = (const __CFData *)CFDictionaryGetValue(v43, CFSTR("eUICC,Main")), (v27 = v19) == 0)
    || (v28 = CFGetTypeID(v19), v19 = (const __CFData *)CFDataGetTypeID(), (const __CFData *)v28 != v19))
  {
LABEL_38:
    ACFULogging::getLogInstance(v19);
    goto LABEL_39;
  }
  v29 = (__CFData *)CFDictionaryGetValue(v43, CFSTR("eUICC,MainRecoveryFw"));
  v30 = VinylFirmwareCreate(v27, v29, v21, v23, v25, v6);
  v31 = 0;
  *a3 = v30;
LABEL_26:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v42);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v43);
  return v31;
}

void sub_222D5F5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 80));
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)(v30 - 72));
  _Unwind_Resume(a1);
}

ACFULogging *VinylTransport::updateFw(const __CFDictionary **this, const __CFDictionary *a2)
{
  ACFULogging *v4;
  ACFULogging *v5;
  VinylFirmware *v6;
  VinylFirmware *v7;
  VinylController *v8;
  uint64_t v9;
  int updated;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ACFULogging *v18;
  char v20;
  VinylFirmware *v21;
  VinylFirmware *v22;

  v21 = 0;
  v22 = 0;
  v4 = (ACFULogging *)VinylTransport::createGoldFw((VinylTransport *)this, a2, &v21);
  v5 = v4;
  if ((_DWORD)v4
    || (v6 = v21) == 0
    || (v4 = (ACFULogging *)VinylTransport::createMainFw(v4, a2, &v22), v5 = v4, (_DWORD)v4)
    || (v7 = v22) == 0)
  {
    ACFULogging::getLogInstance(v4);
    ACFULogging::handleMessage();
    return v5;
  }
  v8 = (VinylController *)VinylController::create(0, 0);
  if (!v8)
  {
    ACFULogging::getLogInstance(0);
LABEL_12:
    ACFULogging::handleMessage();
    return (ACFULogging *)1;
  }
  v9 = (uint64_t)v8;
  updated = VinylController::updateFw(v8, v6, v7, this[3]);
  v18 = (ACFULogging *)VinylControllerObjDestroy(v9, v11, v12, v13, v14, v15, v16, v17, v20);
  if (updated)
  {
    ACFULogging::getLogInstance(v18);
    goto LABEL_12;
  }
  return 0;
}

uint64_t VinylTransport::setNonce(VinylTransport *this, void *a2)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 2;
}

uint64_t VinylTransport::pushFirmware(ACFULogging *a1)
{
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return 2;
}

uint64_t VinylTransport::pingCheck(VinylTransport *this)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 2;
}

uint64_t VinylTransport::reset(VinylTransport *this)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 2;
}

uint64_t VinylTransport::getDebugInfo(const __CFDictionary ***a1, uint64_t a2, int a3)
{
  char v3;
  CFTypeRef cf;

  if (a3)
  {
    cf = 0;
    v3 = BBUpdaterCommon::collectCoreDump((BBUpdaterCommon *)&cf, a1[4], (const __CFString *)1);
    a1 = (const __CFDictionary ***)cf;
    if (cf)
      CFRelease(cf);
    if ((v3 & 1) != 0)
      return 0;
  }
  ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage();
  return 1;
}

void VinylTransport::~VinylTransport(VinylTransport *this)
{
  const void *v2;
  void *v3;

  *(_QWORD *)this = &off_24EB7ACF8;
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 3) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 4) = 0;
  }
  ACFULogging::getLogInstance((ACFULogging *)v3);
  ACFULogging::handleMessage();
  ACFUTransport::~ACFUTransport(this);
}

{
  void *v1;

  VinylTransport::~VinylTransport(this);
  operator delete(v1);
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

void *vinyl_zipOpen2(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  int v45;
  unint64_t v46;
  int v47;
  _QWORD *v49;
  uint64_t v50;
  int Long;
  int Short;
  int v53;
  int v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _OWORD __src[1046];
  uint64_t v67;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v4 = v3;
  v6 = v5;
  v7 = v1;
  v67 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, 512);
  if (v2)
  {
    v8 = v2[1];
    __src[0] = *v2;
    __src[1] = v8;
    v9 = v2[3];
    __src[2] = v2[2];
    __src[3] = v9;
  }
  else
  {
    vinyl_fill_fopen_filefunc((FILE *(**)(int, void *, int, size_t))__src);
  }
  if (v6)
    v10 = 7;
  else
    v10 = 11;
  v11 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&__src[3] + 1), v7, v10, 1000);
  *(_QWORD *)&__src[4] = v11;
  if (!v11)
    return 0;
  *(_QWORD *)&__src[1044] = (*((uint64_t (**)(_QWORD, uint64_t))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v11);
  LODWORD(__src[13]) = 0;
  v12 = malloc(0x4160uLL);
  *(_OWORD *)((char *)&__src[4] + 8) = 0u;
  DWORD2(__src[5]) = 0;
  *(_OWORD *)((char *)&__src[1044] + 8) = 0u;
  if (!v12)
  {
    (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
    return v12;
  }
  *((_QWORD *)&__src[1045] + 1) = 0;
  if (v6 == 2)
  {
    v49 = v4;
    v64 = 0;
    v65 = 0;
    v61 = 0;
    v62 = 0;
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v13 = *(_QWORD *)&__src[4];
    if (!(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], 0, 2))
    {
      v14 = (*((uint64_t (**)(_QWORD, uint64_t))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v13);
      v56 = v14;
      if (v14 >= 0xFFFF)
        v15 = 0xFFFFLL;
      else
        v15 = v14;
      v16 = (char *)malloc(0x404uLL);
      v17 = v16;
      if (!v16)
        goto LABEL_50;
      if (v15 >= 5)
      {
        v18 = v16 + 1;
        v19 = 4;
        do
        {
          v20 = v19 + 1024;
          v21 = v19 + 1024 >= v15 ? v15 : v19 + 1024;
          v22 = v21 >= 0x404 ? 1028 : v21;
          if ((*(uint64_t (**)(_QWORD, uint64_t, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), v13, v56 - v21, 0)|| (*((uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v13, v17, v22) != v22)
          {
            break;
          }
          if (v22 >= 4)
          {
            v23 = (v22 - 4);
            while (v17[v23] != 80 || v18[v23] != 75 || v18[v23 + 1] != 5 || v18[v23 + 2] != 6)
            {
              if (v23-- <= 0)
                goto LABEL_33;
            }
            if (v56 - v21 + v23)
            {
              free(v17);
              v25 = v19 + 1024;
              if (v56 < v19 + 1024)
                v25 = v56;
              if (v25 >= 0xFFFF)
                v25 = 0xFFFFLL;
              v17 = (_BYTE *)(v56 - v25 + v23);
              v55 = 1;
              goto LABEL_51;
            }
          }
LABEL_33:
          v19 = v21;
        }
        while (v15 > v20);
      }
      free(v17);
    }
    v17 = 0;
LABEL_50:
    v55 = 0;
LABEL_51:
    v50 = (*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v17, 0);
    Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v63);
    Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v62);
    v53 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v61);
    v54 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v60);
    v27 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v59);
    v28 = v60;
    v57 = v59;
    v30 = v61;
    v29 = v62;
    v31 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&v65);
    v32 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v64);
    v33 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v58);
    v35 = v64;
    v34 = v65;
    v36 = (unint64_t)v17 >= v65 + v64;
    v37 = &v17[-v65 - v64];
    if (!v36 || v33 || v32 || v31 || v57 != v28 || v30 || v29 || !v55 || v27 || v54 || v53 || Short || Long || v50)
    {
      (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
LABEL_82:
      free(v12);
      return 0;
    }
    v38 = v58;
    if (v58)
    {
      v39 = malloc(v58 + 1);
      *((_QWORD *)&__src[1045] + 1) = v39;
      if (v39)
      {
        v40 = (*((uint64_t (**)(_QWORD, _QWORD, void *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v39, v38);
        *(_BYTE *)(*((_QWORD *)&__src[1045] + 1) + v40) = 0;
      }
    }
    *((_QWORD *)&__src[1044] + 1) = v37;
    v41 = (char *)malloc(0xFF0uLL);
    v42 = v37;
    v43 = &v37[v35];
    v44 = (*(uint64_t (**)(_QWORD, _QWORD, char *, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], &v37[v35], 0);
    if (v44)
      v45 = -1;
    else
      v45 = 0;
    if (v34 && !v44)
    {
      while (1)
      {
        v46 = v34 >= 0xFF0 ? 4080 : v34;
        if ((*((uint64_t (**)(_QWORD, _QWORD, char *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v41, v46) != v46)break;
        v47 = add_data_in_datablock((_QWORD *)&__src[4] + 1, v41, v46);
        v45 = v47;
        v34 -= v46;
        if (!v34 || v47)
          goto LABEL_86;
      }
      v45 = -1;
    }
LABEL_86:
    if (v41)
      free(v41);
    *(_QWORD *)&__src[1044] = v42;
    *(_QWORD *)&__src[1045] = v57;
    if ((*(uint64_t (**)(_QWORD, _QWORD, char *, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v43, 0))
    {
      v26 = -1;
    }
    else
    {
      v26 = v45;
    }
    v4 = v49;
    if (!v49)
      goto LABEL_44;
    goto LABEL_43;
  }
  v26 = 0;
  if (v4)
LABEL_43:
    *v4 = *((_QWORD *)&__src[1045] + 1);
LABEL_44:
  if (v26)
  {
    if (*((_QWORD *)&__src[1045] + 1))
      free(*((void **)&__src[1045] + 1));
    goto LABEL_82;
  }
  memcpy(v12, __src, 0x4160uLL);
  return v12;
}

uint64_t add_data_in_datablock(_QWORD *a1, char *a2, unint64_t a3)
{
  unint64_t v3;
  _QWORD *v6;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  _BYTE *v13;
  uint64_t v14;
  char *v15;
  char v16;

  if (!a1)
    return 4294967192;
  v3 = a3;
  v6 = (_QWORD *)a1[1];
  if (v6)
  {
    if (!a3)
      return 0;
  }
  else
  {
    v8 = (char *)malloc(0x1010uLL);
    if (!v8)
    {
      *a1 = 0;
      a1[1] = 0;
      return 4294967192;
    }
    v6 = v8;
    *(_QWORD *)v8 = 0;
    *(_OWORD *)(v8 + 8) = xmmword_222D70010;
    *a1 = v8;
    a1[1] = v8;
    if (!v3)
      return 0;
  }
  v9 = v6[1];
  while (v9)
  {
    v10 = v6[2];
LABEL_13:
    if (v9 >= v3)
      v12 = v3;
    else
      v12 = v9;
    if (v12)
    {
      v13 = (char *)v6 + v10 + 32;
      v14 = v12;
      v15 = a2;
      do
      {
        v16 = *v15++;
        *v13++ = v16;
        --v14;
      }
      while (v14);
      v9 = v6[1];
      v10 = v6[2];
    }
    v9 -= v12;
    v6[1] = v9;
    v6[2] = v10 + v12;
    a2 += v12;
    v3 -= v12;
    if (!v3)
      return 0;
  }
  v11 = (char *)malloc(0x1010uLL);
  if (v11)
  {
    v10 = 0;
    *(_QWORD *)v11 = 0;
    *(_OWORD *)(v11 + 8) = xmmword_222D70010;
    *v6 = v11;
    v9 = 4080;
    v6 = v11;
    a1[1] = v11;
    goto LABEL_13;
  }
  *v6 = 0;
  return 4294967192;
}

void *vinyl_zipOpen(uint64_t a1)
{
  return vinyl_zipOpen2(a1);
}

uint64_t vinyl_zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *__s, int a9, int a10, int a11, int a12, int a13, int a14, _BYTE *a15, uint64_t a16)
{
  uint64_t result;
  const char *v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  _DWORD *v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  _DWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t i;
  uint64_t v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  unsigned int v70;
  _DWORD *v71;
  _BYTE *v72;
  const z_crc_t *crc_table;
  int v75;
  uint64_t j;
  unsigned int v77;
  unint64_t v78;
  z_crc_t v79;
  uint64_t v80;
  uint64_t v81;
  z_crc_t v82;
  z_crc_t v83;
  uint64_t v84;
  __int16 v85;
  char v86;
  int v87;
  z_crc_t v88;
  uint64_t v89;
  z_crc_t v90;
  z_crc_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  unsigned int v95;
  _DWORD v96[2];
  char v97;
  char v98;
  _BYTE v99[10];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  result = 4294967194;
  if (!a1)
    return result;
  if ((a9 & 0xFFFFFFF7) != 0)
    return result;
  if (*(_DWORD *)(a1 + 88) == 1)
  {
    result = vinyl_zipCloseFileInZipRaw(a1, 0, 0);
    if ((_DWORD)result)
      return result;
  }
  v95 = a5;
  if (a2)
    v25 = a2;
  else
    v25 = "-";
  v94 = a4;
  if (__s)
    v26 = strlen(__s);
  else
    v26 = 0;
  v27 = strlen(v25);
  if (a3)
  {
    v28 = *(_QWORD *)(a3 + 24);
    if (!v28)
    {
      v29 = *(unsigned int *)(a3 + 20);
      v30 = v29 - 80;
      if (v29 <= 0x50)
        v30 = *(unsigned int *)(a3 + 20);
      if (v29 <= 0x7BC)
        v31 = v30;
      else
        v31 = v29 - 1980;
      v28 = ((32 * *(_DWORD *)(a3 + 4) + (*(_DWORD *)a3 >> 1))
           + ((unint64_t)*(unsigned int *)(a3 + 8) << 11)) | (((unint64_t)(*(_DWORD *)(a3 + 12) + 32 * *(_DWORD *)(a3 + 16) + 32) << 16)
                                                                   + (v31 << 25));
    }
  }
  else
  {
    v28 = 0;
  }
  *(_QWORD *)(a1 + 16640) = v28;
  v32 = 2 * ((a10 & 0xFFFFFFFE) == 8);
  *(_QWORD *)(a1 + 240) = v32;
  if (a10 == 1)
  {
    v32 = 6;
  }
  else
  {
    if (a10 != 2)
      goto LABEL_25;
    v32 |= 4uLL;
  }
  *(_QWORD *)(a1 + 240) = v32;
LABEL_25:
  if (a15)
    *(_QWORD *)(a1 + 240) = v32 | 1;
  *(_QWORD *)(a1 + 16648) = 0;
  *(_DWORD *)(a1 + 16656) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 248) = a9;
  *(_DWORD *)(a1 + 252) = a11;
  v33 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(a1 + 216) = v33;
  v34 = a7 + v26 + v27 + 46;
  *(_QWORD *)(a1 + 232) = v34;
  v35 = malloc(v34);
  *(_QWORD *)(a1 + 224) = v35;
  *v35 = 33639248;
  v35[1] = 1310720;
  v36 = *(_QWORD *)(a1 + 240);
  *((_WORD *)v35 + 4) = v36;
  if (v36 >= 0x10000)
    *((_WORD *)v35 + 4) = -1;
  v37 = *(_DWORD *)(a1 + 248);
  *((_WORD *)v35 + 5) = v37;
  if (v37 >= 0x10000)
    *((_WORD *)v35 + 5) = -1;
  v38 = 0;
  v39 = v35 + 3;
  v40 = *(_QWORD *)(a1 + 16640);
  do
  {
    v41 = v40;
    *((_BYTE *)v39 + v38) = v40;
    v40 >>= 8;
    ++v38;
  }
  while (v38 != 4);
  if (v41 >= 0x100)
    *v39 = -1;
  *((_QWORD *)v35 + 2) = 0;
  v35[6] = 0;
  *((_WORD *)v35 + 14) = v27;
  if (v27 >= 0x10000uLL)
    *((_WORD *)v35 + 14) = -1;
  *((_WORD *)v35 + 15) = a7;
  if (a7 >= 0x10000)
    *((_WORD *)v35 + 15) = -1;
  *((_WORD *)v35 + 16) = v26;
  if (v26 >= 0x10000)
    *((_WORD *)v35 + 16) = -1;
  *((_WORD *)v35 + 17) = 0;
  v42 = v26;
  if (a3)
  {
    v43 = *(_QWORD *)(a3 + 32);
    *((_WORD *)v35 + 18) = v43;
    if (v43 >= 0x10000)
      *((_WORD *)v35 + 18) = -1;
    v44 = 0;
    v45 = (_DWORD *)((char *)v35 + 38);
    v46 = *(_QWORD *)(a3 + 40);
    do
    {
      v47 = v46;
      *((_BYTE *)v45 + v44) = v46;
      v46 >>= 8;
      ++v44;
    }
    while (v44 != 4);
    if (v47 >= 0x100)
      *v45 = -1;
  }
  else
  {
    *((_WORD *)v35 + 18) = 0;
    *(_DWORD *)((char *)v35 + 38) = 0;
  }
  v48 = 0;
  v49 = (_DWORD *)((char *)v35 + 42);
  v50 = v33 - *(_QWORD *)(a1 + 16712);
  do
  {
    v51 = v50;
    *((_BYTE *)v49 + v48) = v50;
    v50 >>= 8;
    ++v48;
  }
  while (v48 != 4);
  if (v51 >= 0x100)
    *v49 = -1;
  if (v27)
  {
    for (i = 0; i != v27; ++i)
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + i + 46) = v25[i];
  }
  if (a7)
  {
    v53 = v27 + 46;
    v54 = a7;
    do
    {
      v55 = *a6++;
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + v53++) = v55;
      --v54;
    }
    while (v54);
  }
  if (v26)
  {
    v56 = a7 + (unint64_t)v27 + 46;
    do
    {
      v57 = *__s++;
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + v56++) = v57;
      --v42;
    }
    while (v42);
  }
  if (!*(_QWORD *)(a1 + 224))
    return 4294967192;
  v96[0] = 67324752;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 4) != 4)goto LABEL_91;
  LOWORD(v96[0]) = 20;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 2) != 2)goto LABEL_91;
  v58 = *(_QWORD *)(a1 + 64);
  v59 = *(_QWORD *)(a1 + 240);
  LOWORD(v96[0]) = v59;
  if (v59 >= 0x10000)
    LOWORD(v96[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v58, v96, 2) != 2)
    goto LABEL_91;
  v60 = *(_QWORD *)(a1 + 64);
  v61 = *(_DWORD *)(a1 + 248);
  LOWORD(v96[0]) = v61;
  if (v61 >= 0x10000)
    LOWORD(v96[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v60, v96, 2) != 2)
    goto LABEL_91;
  v62 = 0;
  v63 = *(_QWORD *)(a1 + 64);
  v64 = *(_QWORD *)(a1 + 16640);
  do
  {
    v65 = v64;
    *((_BYTE *)v96 + v62) = v64;
    v64 >>= 8;
    ++v62;
  }
  while (v62 != 4);
  if (v65 >= 0x100)
    v96[0] = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v63, v96, 4) != 4)
    goto LABEL_91;
  v96[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 4) != 4)goto LABEL_91;
  v96[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 4) != 4)goto LABEL_91;
  v96[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 4) != 4)goto LABEL_91;
  v66 = *(_QWORD *)(a1 + 64);
  LOWORD(v96[0]) = v27;
  if (v27 >= 0x10000uLL)
    LOWORD(v96[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v66, v96, 2) != 2)
    goto LABEL_91;
  v67 = *(_QWORD *)(a1 + 64);
  LOWORD(v96[0]) = v95;
  if (v95 >= 0x10000)
    LOWORD(v96[0]) = -1;
  v68 = (*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v67, v96, 2);
  v69 = v68 != 2;
  if (v68 == 2 && v27)
    v69 = (*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v25, v27) != v27;
  v70 = v95;
  if (v95 && !v69)
  {
    if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v94, v95) == v70)
    {
      *(_DWORD *)(a1 + 104) = 0;
      *(_DWORD *)(a1 + 128) = 0x4000;
      *(_QWORD *)(a1 + 112) = 0;
      *(_QWORD *)(a1 + 120) = a1 + 256;
      *(_QWORD *)(a1 + 136) = 0;
      v71 = (_DWORD *)(a1 + 16656);
      v72 = a15;
      goto LABEL_97;
    }
LABEL_91:
    *(_DWORD *)(a1 + 104) = 0;
    *(_DWORD *)(a1 + 128) = 0x4000;
    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 120) = a1 + 256;
    result = 0xFFFFFFFFLL;
    *(_QWORD *)(a1 + 136) = 0;
    v71 = (_DWORD *)(a1 + 16656);
    goto LABEL_92;
  }
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0x4000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = a1 + 256;
  *(_QWORD *)(a1 + 136) = 0;
  v71 = (_DWORD *)(a1 + 16656);
  v72 = a15;
  if (v69)
  {
    result = 0xFFFFFFFFLL;
    goto LABEL_92;
  }
LABEL_97:
  if (*(_DWORD *)(a1 + 248) != 8 || *(_DWORD *)(a1 + 252))
    goto LABEL_99;
  if (a12 < 0)
    v93 = a12;
  else
    v93 = -a12;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  result = deflateInit2_((z_streamp)(a1 + 96), a10, 8, v93, a13, a14, "1.2.12", 112);
  if ((_DWORD)result)
  {
LABEL_92:
    v71[10] = 0;
    return result;
  }
  *(_DWORD *)(a1 + 208) = 1;
  v72 = a15;
LABEL_99:
  v71[10] = 0;
  if (!v72)
    goto LABEL_107;
  *v71 = 1;
  crc_table = get_crc_table();
  *(_QWORD *)(a1 + 16688) = crc_table;
  if (!crypthead_calls++)
  {
    v75 = time(0);
    srand(v75 ^ 0xBB40E64E);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  for (j = 0; j != 10; v99[j++] = ((unsigned __int16)((v78 & 0xFFFD ^ 3) * (v78 | 2)) >> 8) ^ (v77 >> 7))
  {
    v77 = rand();
    v78 = *(_QWORD *)(a1 + 16680);
    v79 = crc_table[(*(_QWORD *)(a1 + 16664) ^ (v77 >> 7))] ^ (*(_QWORD *)(a1 + 16664) >> 8);
    *(_QWORD *)(a1 + 16664) = v79;
    v80 = 134775813 * (*(_QWORD *)(a1 + 16672) + v79) + 1;
    *(_QWORD *)(a1 + 16672) = v80;
    *(_QWORD *)(a1 + 16680) = crc_table[(v78 ^ BYTE3(v80))] ^ (v78 >> 8);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  v81 = 0;
  v82 = *(_QWORD *)(a1 + 16680);
  v83 = *(_QWORD *)(a1 + 16664);
  v84 = *(_QWORD *)(a1 + 16672);
  do
  {
    v85 = (v82 & 0xFFFD ^ 3) * (v82 | 2);
    v86 = v99[v81];
    v83 = crc_table[(v86 ^ v83)] ^ (v83 >> 8);
    *(_QWORD *)(a1 + 16664) = v83;
    v84 = 134775813 * (v84 + v83) + 1;
    *(_QWORD *)(a1 + 16672) = v84;
    v82 = crc_table[(v82 ^ BYTE3(v84))] ^ (v82 >> 8);
    *(_QWORD *)(a1 + 16680) = v82;
    *((_BYTE *)v96 + v81++) = v86 ^ HIBYTE(v85);
  }
  while (v81 != 10);
  v87 = ((v82 & 0xFFFFFFFD ^ 3) * (v82 | 2)) >> 8;
  v88 = crc_table[(v83 ^ BYTE2(a16))] ^ (v83 >> 8);
  *(_QWORD *)(a1 + 16664) = v88;
  v89 = 134775813 * (v84 + v88) + 1;
  *(_QWORD *)(a1 + 16672) = v89;
  v90 = crc_table[(v82 ^ BYTE3(v89))] ^ (v82 >> 8);
  *(_QWORD *)(a1 + 16680) = v90;
  v97 = v87 ^ BYTE2(a16);
  v91 = crc_table[v88 ^ BYTE3(a16)] ^ (v88 >> 8);
  *(_QWORD *)(a1 + 16664) = v91;
  v92 = 134775813 * (v89 + v91) + 1;
  *(_QWORD *)(a1 + 16672) = v92;
  *(_QWORD *)(a1 + 16680) = crc_table[(v90 ^ BYTE3(v92))] ^ (v90 >> 8);
  v98 = ((unsigned __int16)((v90 & 0xFFFD ^ 3) * (v90 | 2)) >> 8) ^ BYTE3(a16);
  *(_DWORD *)(a1 + 16696) = 12;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v96, 12) != 12)return 0xFFFFFFFFLL;
LABEL_107:
  result = 0;
  *(_DWORD *)(a1 + 88) = 1;
  return result;
}

uint64_t vinyl_zipCloseFileInZip(uint64_t a1)
{
  return vinyl_zipCloseFileInZipRaw(a1, 0, 0);
}

uint64_t vinyl_zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, int a11)
{
  return vinyl_zipOpenNewFileInZip3(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0);
}

uint64_t vinyl_zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10)
{
  return vinyl_zipOpenNewFileInZip3(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0);
}

uint64_t vinyl_zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  int v11;

  if (!a1)
    return 4294967194;
  if (!*(_DWORD *)(a1 + 88))
    return 4294967194;
  *(_QWORD *)(a1 + 96) = a2;
  *(_DWORD *)(a1 + 104) = a3;
  *(_QWORD *)(a1 + 16648) = crc32(*(_QWORD *)(a1 + 16648), a2, a3);
  while (*(_DWORD *)(a1 + 104))
  {
    v4 = *(_DWORD *)(a1 + 128);
    if (v4
      || (result = zipFlushWriteBuffer(a1),
          v4 = 0x4000,
          *(_DWORD *)(a1 + 128) = 0x4000,
          *(_QWORD *)(a1 + 120) = a1 + 256,
          (_DWORD)result != -1))
    {
      if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
      {
        v11 = *(_DWORD *)(a1 + 136);
        result = deflate((z_streamp)(a1 + 96), 0);
        LODWORD(v7) = *(_DWORD *)(a1 + 136) - v11;
      }
      else
      {
        v6 = *(_DWORD *)(a1 + 104);
        v7 = v6 >= v4 ? v4 : v6;
        if ((_DWORD)v7)
        {
          for (i = 0; i != v7; ++i)
            *(_BYTE *)(*(_QWORD *)(a1 + 120) + i) = *(_BYTE *)(*(_QWORD *)(a1 + 96) + i);
          v6 = *(_DWORD *)(a1 + 104);
          v4 = *(_DWORD *)(a1 + 128);
          v9 = v7;
        }
        else
        {
          v9 = 0;
        }
        result = 0;
        *(_DWORD *)(a1 + 104) = v6 - v7;
        *(_DWORD *)(a1 + 128) = v4 - v7;
        *(_QWORD *)(a1 + 96) += v9;
        v10 = *(_QWORD *)(a1 + 120) + v9;
        *(_QWORD *)(a1 + 112) += v9;
        *(_QWORD *)(a1 + 120) = v10;
        *(_QWORD *)(a1 + 136) += v9;
      }
      *(_DWORD *)(a1 + 212) += v7;
      if (!(_DWORD)result)
        continue;
    }
    return result;
  }
  return 0;
}

uint64_t zipFlushWriteBuffer(uint64_t a1)
{
  unsigned int v2;
  _BYTE *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 212);
  if (*(_DWORD *)(a1 + 16656) && v2)
  {
    v3 = (_BYTE *)(a1 + 256);
    v4 = *(unsigned int *)(a1 + 212);
    do
    {
      v5 = *(_QWORD *)(a1 + 16680);
      v6 = *(_QWORD *)(a1 + 16688);
      v7 = *(_QWORD *)(v6 + 8 * (*v3 ^ *(_QWORD *)(a1 + 16664))) ^ (*(_QWORD *)(a1 + 16664) >> 8);
      *(_QWORD *)(a1 + 16664) = v7;
      v8 = 134775813 * (*(_QWORD *)(a1 + 16672) + v7) + 1;
      *(_QWORD *)(a1 + 16672) = v8;
      *(_QWORD *)(a1 + 16680) = *(_QWORD *)(v6 + 8 * (v5 ^ BYTE3(v8))) ^ (v5 >> 8);
      *v3++ ^= (unsigned __int16)((v5 & 0xFFFD ^ 3) * (v5 | 2)) >> 8;
      --v4;
    }
    while (v4);
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a1 + 256, v2) == *(_DWORD *)(a1 + 212))result = 0;
  else
    result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 212) = 0;
  return result;
}

uint64_t vinyl_zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  int v33;
  int v34;
  unsigned int v35;
  int v37;
  int v38;
  int v39;

  if (!a1 || !*(_DWORD *)(a1 + 88))
    return 4294967194;
  v6 = 0;
  *(_DWORD *)(a1 + 104) = 0;
  if (*(_DWORD *)(a1 + 248) == 8)
  {
    if (*(_DWORD *)(a1 + 252))
    {
      v6 = 0;
    }
    else
    {
      do
      {
        if (!*(_DWORD *)(a1 + 128))
        {
          v33 = zipFlushWriteBuffer(a1);
          *(_DWORD *)(a1 + 128) = 0x4000;
          *(_QWORD *)(a1 + 120) = a1 + 256;
          if (v33 == -1)
          {
            v6 = 0xFFFFFFFFLL;
            goto LABEL_10;
          }
        }
        v34 = *(_DWORD *)(a1 + 136);
        v35 = deflate((z_streamp)(a1 + 96), 4);
        *(_DWORD *)(a1 + 212) += *(_DWORD *)(a1 + 136) - v34;
      }
      while (!v35);
      if (v35 == 1)
        v6 = 0;
      else
        v6 = v35;
      if ((_DWORD)v6)
        goto LABEL_10;
    }
  }
  if (*(_DWORD *)(a1 + 212))
  {
    if (zipFlushWriteBuffer(a1) == -1)
      v6 = 0xFFFFFFFFLL;
    else
      v6 = 0;
  }
LABEL_10:
  if (*(_DWORD *)(a1 + 248) == 8 && !(*(_DWORD *)(a1 + 252) | v6))
  {
    v6 = deflateEnd((z_streamp)(a1 + 96));
    *(_DWORD *)(a1 + 208) = 0;
  }
  if (!*(_DWORD *)(a1 + 252))
  {
    a3 = *(_QWORD *)(a1 + 16648);
    a2 = *(_QWORD *)(a1 + 112);
  }
  v7 = 0;
  v8 = *(_QWORD *)(a1 + 136);
  v9 = *(int *)(a1 + 16696);
  v10 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 16);
  v11 = a3;
  do
  {
    v12 = v11;
    *((_BYTE *)v10 + v7) = v11;
    v11 >>= 8;
    ++v7;
  }
  while (v7 != 4);
  v13 = v8 + v9;
  if (v12 >= 0x100)
    *v10 = -1;
  v14 = 0;
  v15 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 20);
  v16 = v8 + v9;
  do
  {
    v17 = v16;
    *((_BYTE *)v15 + v14) = v16;
    v16 >>= 8;
    ++v14;
  }
  while (v14 != 4);
  if (v17 >= 0x100)
    *v15 = -1;
  if (*(_DWORD *)(a1 + 184) == 1)
    *(_WORD *)(*(_QWORD *)(a1 + 224) + 36) = 1;
  v18 = 0;
  v19 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 24);
  v20 = a2;
  do
  {
    v21 = v20;
    *((_BYTE *)v19 + v18) = v20;
    v20 >>= 8;
    ++v18;
  }
  while (v18 != 4);
  if (v21 >= 0x100)
    *v19 = -1;
  if ((_DWORD)v6)
  {
    free(*(void **)(a1 + 224));
  }
  else
  {
    v6 = add_data_in_datablock((_QWORD *)(a1 + 72), *(char **)(a1 + 224), *(_QWORD *)(a1 + 232));
    free(*(void **)(a1 + 224));
    if (!(_DWORD)v6)
    {
      v22 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 216) + 14, 0))
      {
        goto LABEL_59;
      }
      v23 = 0;
      v24 = *(_QWORD *)(a1 + 64);
      do
      {
        v25 = a3;
        *((_BYTE *)&v37 + v23) = a3;
        a3 >>= 8;
        ++v23;
      }
      while (v23 != 4);
      if (v25 >= 0x100)
        v37 = -1;
      if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v24, &v37, 4) != 4)
        goto LABEL_59;
      v26 = 0;
      v27 = *(_QWORD *)(a1 + 64);
      do
      {
        v28 = v13;
        *((_BYTE *)&v38 + v26) = v13;
        v13 >>= 8;
        ++v26;
      }
      while (v26 != 4);
      if (v28 >= 0x100)
        v38 = -1;
      if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v27, &v38, 4) == 4)
      {
        v29 = 0;
        v30 = *(_QWORD *)(a1 + 64);
        do
        {
          v31 = a2;
          *((_BYTE *)&v39 + v29) = a2;
          a2 >>= 8;
          ++v29;
        }
        while (v29 != 4);
        if (v31 >= 0x100)
          v39 = -1;
        if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v30, &v39, 4) == 4)v32 = 0;
        else
          v32 = -1;
      }
      else
      {
LABEL_59:
        v32 = -1;
      }
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v22, 0))
      {
        v6 = 0xFFFFFFFFLL;
      }
      else
      {
        v6 = v32;
      }
    }
  }
  ++*(_QWORD *)(a1 + 16720);
  *(_DWORD *)(a1 + 88) = 0;
  return v6;
}

uint64_t vinyl_zipClose(uint64_t a1, const char *a2)
{
  const char *v2;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  void *v29;
  int v31;

  if (!a1)
    return 4294967194;
  v2 = a2;
  if (*(_DWORD *)(a1 + 88) != 1)
  {
    v4 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_8:
    v6 = strlen(v2);
    goto LABEL_9;
  }
  v4 = vinyl_zipCloseFileInZipRaw(a1, 0, 0);
  if (v2)
    goto LABEL_8;
LABEL_7:
  v2 = *(const char **)(a1 + 16728);
  if (v2)
    goto LABEL_8;
  v6 = 0;
LABEL_9:
  v7 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (!v4)
  {
    v9 = *(_QWORD **)(a1 + 72);
    if (v9)
    {
      v8 = 0;
      v4 = 0;
      do
      {
        v10 = v9[2];
        if (v4)
        {
          v4 = -1;
        }
        else if (v10)
        {
          v11 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD *))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9 + 4);
          v10 = v9[2];
          if (v11 == v10)
            v4 = 0;
          else
            v4 = -1;
        }
        else
        {
          v4 = 0;
        }
        v8 += v10;
        v9 = (_QWORD *)*v9;
      }
      while (v9);
      goto LABEL_21;
    }
    v4 = 0;
  }
  v8 = 0;
LABEL_21:
  v12 = *(_QWORD **)(a1 + 72);
  if (v12)
  {
    do
    {
      v13 = (_QWORD *)*v12;
      free(v12);
      v12 = v13;
    }
    while (v13);
  }
  if (!v4)
  {
    v31 = 101010256;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 4) != 4)goto LABEL_53;
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 2) != 2)goto LABEL_53;
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 2) != 2)goto LABEL_53;
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 16720);
    LOWORD(v31) = v15;
    if (v15 >= 0x10000)
      LOWORD(v31) = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v14, &v31, 2) != 2)
      goto LABEL_53;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 16720);
    LOWORD(v31) = v17;
    if (v17 >= 0x10000)
      LOWORD(v31) = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v16, &v31, 2) != 2)
      goto LABEL_53;
    v18 = 0;
    v19 = *(_QWORD *)(a1 + 64);
    do
    {
      v20 = v8;
      *((_BYTE *)&v31 + v18) = v8;
      v8 >>= 8;
      ++v18;
    }
    while (v18 != 4);
    if (v20 >= 0x100)
      v31 = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v19, &v31, 4) != 4)
      goto LABEL_53;
    v21 = 0;
    v22 = *(_QWORD *)(a1 + 64);
    v23 = v7 - *(_QWORD *)(a1 + 16712);
    do
    {
      v24 = v23;
      *((_BYTE *)&v31 + v21) = v23;
      v23 >>= 8;
      ++v21;
    }
    while (v21 != 4);
    if (v24 >= 0x100)
      v31 = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v22, &v31, 4) == 4)
    {
      v25 = *(_QWORD *)(a1 + 64);
      LOWORD(v31) = v6;
      if (v6 >= 0x10000)
        LOWORD(v31) = -1;
      v26 = (*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v25, &v31, 2);
      if (v26 == 2)
        v4 = 0;
      else
        v4 = -1;
      if (v26 == 2 && v6)
      {
        if ((*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2, v6) == v6)v4 = 0;
        else
          v4 = -1;
      }
    }
    else
    {
LABEL_53:
      v4 = -1;
    }
  }
  v27 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (v4)
    v28 = v4;
  else
    v28 = -1;
  if (v27)
    v5 = v28;
  else
    v5 = v4;
  v29 = *(void **)(a1 + 16728);
  if (v29)
    free(v29);
  free((void *)a1);
  return v5;
}

_BYTE *init_keys(_BYTE *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned __int8 *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;

  v3 = 878082192;
  *(_OWORD *)a2 = xmmword_222D6FB70;
  *(_QWORD *)(a2 + 16) = 878082192;
  v4 = *result;
  if (*result)
  {
    v5 = result + 1;
    v6 = 305419896;
    v7 = 591751049;
    do
    {
      v6 = *(_QWORD *)(a3 + 8 * (v4 ^ v6)) ^ (v6 >> 8);
      v7 = 134775813 * (v7 + v6) + 1;
      *(_QWORD *)a2 = v6;
      *(_QWORD *)(a2 + 8) = v7;
      v3 = *(_QWORD *)(a3 + 8 * (v3 ^ BYTE3(v7))) ^ (v3 >> 8);
      *(_QWORD *)(a2 + 16) = v3;
      v8 = *v5++;
      v4 = v8;
    }
    while (v8);
  }
  return result;
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
    MEMORY[0x22767DA3C](v50);
    MEMORY[0x22767DA3C](v51);
  }
  return a1;
}

void sub_222D61A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, char *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
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
  MEMORY[0x22767DA3C](&a20);
  MEMORY[0x22767DA3C](&a22);
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

_QWORD *Options::StringifyPostProcess@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;

  if ((a1 - 1) > 3)
    v2 = "No Action";
  else
    v2 = off_24EB7B150[a1 - 1];
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
    v28 = off_24EB7B150[v27];
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
  return MEMORY[0x22767DF10](&v61);
}

void sub_222D61FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
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

void sub_222D620AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x22767DF10](v1);
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
  MEMORY[0x22767DF10](a1 + 112);
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

void sub_222D621BC(_Unwind_Exception *a1)
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
    std::__tree<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::__map_value_compare<ACFURestore::UpdateSteps,std::__value_type<ACFURestore::UpdateSteps,RestoreStep>,std::less<ACFURestore::UpdateSteps>,true>,std::allocator<std::__value_type<ACFURestore::UpdateSteps,RestoreStep>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
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

void sub_222D624B4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,VinylRefurbAction>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
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

  MEMORY[0x22767DDC0](v13, a1);
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
  MEMORY[0x22767DDCC](v13);
  return a1;
}

void sub_222D62804(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x22767DDCC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x222D627E4);
}

void sub_222D6284C(_Unwind_Exception *a1)
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

void sub_222D62980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

unint64_t BBULogModuleEnabled(char a1)
{
  return ((unint64_t)sLogInternalMask >> a1) & 1;
}

uint64_t gBBULogMaskGet(void)
{
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  return gBBULogMaskGet(void)::sBBULogMask;
}

void BBULogSetMask(unsigned int a1)
{
  uint64_t v1;

  v1 = a1;
  sLogInternalMask = a1;
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    MEMORY[0x22767DF10](&v38);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_222D62F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
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
    MEMORY[0x22767DF10](v25);
  }
  return BBUpdaterCommon::BBUMutex::unlock(v11);
}

void sub_222D634A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    MEMORY[0x22767DA3C](v15);
    MEMORY[0x22767DA3C](v16);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
  }
}

void sub_222D63C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (__p)
    operator delete(__p);
  MEMORY[0x22767DA3C](&a13);
  MEMORY[0x22767DA3C](&a15);
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
    std::shared_ptr<BBULogBuffer>::reset[abi:ne180100]((_QWORD *)sLogBufferGet(void)::sLogBuffer);
}

void std::shared_ptr<BBULogBuffer>::reset[abi:ne180100](_QWORD *a1)
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

void sub_222D63EB4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_222D63F60(_Unwind_Exception *a1)
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
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
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
    MEMORY[0x22767DD9C](__p, "(snipped)");
    v6 = 2048;
  }
  gettimeofday(&v13, 0);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    _BBULogPlain(a1, "%u.%03u: %s: %u%s\n", v7, v8, v9, v10, v11, v12, v13.tv_sec);
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_1);
  }
  if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULogBinary(a1, 0, "BBULog", "", a3, v6, 32, v12);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
}

void sub_222D64254(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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

uint64_t std::future<std::shared_ptr<ctu::Http::HttpResponse>>::get(uint64_t result)
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

_QWORD *eUICCStateMachine::Step(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;

  do
  {
    result = *(_QWORD **)(a1 - 8);
    if ((_QWORD *)(a1 - 32) == result)
    {
      result = (_QWORD *)(a1 - 32);
      v5 = 4;
    }
    else
    {
      if (!result)
        goto LABEL_6;
      v5 = 5;
    }
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
LABEL_6:
    a1 -= 40;
  }
  while (a1 != a2);
  return result;
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x24BED9FF0]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x24BEDA0E8]();
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
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

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x24BEDA110]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x24BEDA138]();
}

uint64_t DEREncoderCreate()
{
  return MEMORY[0x24BEDA158]();
}

uint64_t DEREncoderCreateEncodedBuffer()
{
  return MEMORY[0x24BEDA160]();
}

uint64_t DEREncoderDestroy()
{
  return MEMORY[0x24BEDA168]();
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
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

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x24BE05BD8]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x24BE05BE8](this, a2, a3, a4);
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x24BE05C28](this);
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

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x24BE05CA0](this, a2, a3);
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

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x24BE05D28]();
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

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x24BE05D78]();
}

uint64_t ACFUDiagnostics::copyDiagnosticsPath(ACFUDiagnostics *this)
{
  return MEMORY[0x24BE05D90](this);
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

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x24BED9AC8](this, a2);
}

uint64_t ctu::cf::show(ctu::cf *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x24BED9AD0](this, a2, a3);
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

uint64_t eUICC::StreamAPDU::Perform()
{
  return MEMORY[0x24BED3FC8]();
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

uint64_t eUICC::InstallTicket::Perform()
{
  return MEMORY[0x24BED3FE8]();
}

uint64_t eUICC::ValidatePerso::Perform()
{
  return MEMORY[0x24BED3FF0]();
}

uint64_t eUICC::AuthPersoSession::Perform()
{
  return MEMORY[0x24BED3FF8]();
}

uint64_t eUICC::InitPersoSession::Perform()
{
  return MEMORY[0x24BED4000]();
}

uint64_t eUICC::VinylCommandDriver::InstallVad()
{
  return MEMORY[0x24BED4DE0]();
}

uint64_t eUICC::VinylCommandDriver::GetVinylType()
{
  return MEMORY[0x24BED4DE8]();
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile()
{
  return MEMORY[0x24BED4DF0]();
}

uint64_t eUICC::VinylCommandDriver::FinalizePerso()
{
  return MEMORY[0x24BED4DF8]();
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

uint64_t eUICC::VinylCommandDriver::StreamFW()
{
  return MEMORY[0x24BED4E18]();
}

uint64_t eUICC::VinylCommandDriver::AuthPerso()
{
  return MEMORY[0x24BED4E20]();
}

uint64_t eUICC::VinylCommandDriver::InitPerso()
{
  return MEMORY[0x24BED4E28]();
}

uint64_t eUICC::VinylCommandDriver::VinylCommandDriver()
{
  return MEMORY[0x24BED4E30]();
}

void eUICC::VinylCommandDriver::~VinylCommandDriver(eUICC::VinylCommandDriver *this)
{
  MEMORY[0x24BED4E38](this);
}

uint64_t eUICC::FinalizePersoSession::Perform()
{
  return MEMORY[0x24BED4008]();
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

uint64_t AriSdk::ARI_IBIVinylAuthPsoReq_SDK::ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
  return MEMORY[0x24BECF090](this);
}

void AriSdk::ARI_IBIVinylAuthPsoReq_SDK::~ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
  MEMORY[0x24BECF098](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  return MEMORY[0x24BECF0A0](this);
}

void AriSdk::ARI_IBIVinylGetDataReq_SDK::~ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  MEMORY[0x24BECF0A8](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoReq_SDK::ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
  return MEMORY[0x24BECF0B0](this);
}

void AriSdk::ARI_IBIVinylInitPsoReq_SDK::~ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
  MEMORY[0x24BECF0B8](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  return MEMORY[0x24BECF638](this);
}

void AriSdk::ARI_IBIVinylInstallFwReq_SDK::~ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  MEMORY[0x24BECF640](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadReq_SDK::ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
  return MEMORY[0x24BECF998](this);
}

void AriSdk::ARI_IBIVinylInstallVadReq_SDK::~ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
  MEMORY[0x24BECF9A0](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  return MEMORY[0x24BECF9B8](this);
}

void AriSdk::ARI_IBIVinylSwitchModeReq_SDK::~ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  MEMORY[0x24BECF9C0](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
  return MEMORY[0x24BECFDD0](this);
}

void AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::~ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
  MEMORY[0x24BECFDD8](this);
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

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x24BE05EA8](this);
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

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
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
  off_24EB79DA8(__p);
}

void operator delete(void *__p)
{
  off_24EB79DB0(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24EB79DB8(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EB79DC0(__sz);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
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

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
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

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE3E8](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x24BEDF1F8]();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x24BDAE6B0](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
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

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

