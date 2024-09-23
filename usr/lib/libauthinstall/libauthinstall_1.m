void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    SavageCFDictionarySetInteger32_cold_1();
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t result;
  char buffer[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if ((_DWORD)result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  const __CFAllocator *v7;
  CFStringRef v8;
  const void *v9;
  CFStringRef v10;
  CFStringRef v11;
  __CFDictionary *Mutable;
  CFErrorRef v13;

  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@: %s"), a4, a1);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = CFStringCreateWithFormat(v7, 0, CFSTR("%@: Input Options: %@"), v8, a3);
  if (!v10)
  {
    v13 = 0;
    goto LABEL_4;
  }
  v11 = v10;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v9);
  v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  v9 = Mutable;
  if (Mutable)
LABEL_4:
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, __CFString **a2, __CFString **a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  int v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const UInt8 *BytePtr;
  unsigned int v15;
  int v16;
  __CFString **v17;
  __CFString **v18;
  __CFString **v19;
  __CFString **v20;
  __CFString **v21;
  BOOL v22;
  __CFString **v23;
  __CFString **v24;
  __CFString *v25;

  result = 2;
  if (theDict && a2 && a3)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Savage,ProductionMode"));
    if (!Value)
      return 17;
    v8 = Value;
    v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID())
      return 17;
    v10 = CFBooleanGetValue(v8);
    v11 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("Savage,Revision"));
    if (!v11)
      return 17;
    v12 = v11;
    v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID())
      return 17;
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      v15 = *BytePtr;
      v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        v19 = kSavageTagMeasurementB2ProdPatch;
        v20 = kSavageTagMeasurementB2DevPatch;
LABEL_23:
        v22 = v10 == 0;
        if (!v10)
          v19 = v20;
        *a2 = *v19;
        v23 = kSavageTagMeasurementBFProdPatch;
        v24 = kSavageTagMeasurementBFDevPatch;
LABEL_26:
        if (v22)
          v23 = v24;
        v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        v21 = kSavageTagMeasurementBAProdPatch;
        v22 = v10 == 0;
        if (!v10)
          v21 = kSavageTagMeasurementBADevPatch;
        *a2 = *v21;
        v23 = kSavageTagMeasurementBEProdPatch;
        v24 = kSavageTagMeasurementBEDevPatch;
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        v17 = kSavageTagMeasurementBEProdPatch;
        v18 = kSavageTagMeasurementBEDevPatch;
LABEL_19:
        if (!v10)
          v17 = v18;
        v25 = *v17;
        *a2 = v25;
LABEL_29:
        result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        v17 = kSavageTagMeasurementBFProdPatch;
        v18 = kSavageTagMeasurementBFDevPatch;
        goto LABEL_19;
      }
    }
    v19 = kSavageTagMeasurementB0ProdPatch;
    v20 = kSavageTagMeasurementB0DevPatch;
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  _BOOL4 v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  int valuePtr;

  valuePtr = 0;
  result = 2;
  if (theDict && a2)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Yonkers,ProductionMode"));
    if (Value
      && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (v10 = CFBooleanGetValue(v8) != 0,
          (v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Yonkers,FabRevision"))) != 0)
      && (v12 = v11, v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8;
  uint64_t v9;
  CFStringRef v10;
  CFStringRef v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  const __CFAllocator *v15;
  uint64_t v16;
  int *v17;
  int v18;
  _BOOL8 v19;
  int v20;
  uint64_t v21;
  const __CFAllocator *v22;

  v8 = 0;
  v9 = 0;
  while (dword_20D112D10[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      v10 = 0;
      v11 = 0;
      v12 = 2;
      goto LABEL_6;
    }
  }
  v13 = a2 != 0;
  v14 = v13 | (8 * (v9 < 4));
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), (v13 - v8));
  v11 = CFStringCreateWithFormat(v15, 0, CFSTR("Yonkers,SysTopPatch%X"), v14);
  v12 = 0;
LABEL_6:
  v16 = 0;
  v17 = &dword_20D112D28;
  while (1)
  {
    v18 = *v17++;
    if (v18 == a1)
      break;
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v19 = a2 != 0;
  if ((v19 - v16) < 8)
    v20 = 8;
  else
    v20 = -8;
  v21 = (v20 | v19) - v16;
  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), v19 - v16);
  v11 = CFStringCreateWithFormat(v22, 0, CFSTR("Yonkers,SysTopPatch%X"), v21);
  v12 = 0;
  if (!a3)
    goto LABEL_17;
LABEL_15:
  if (v10)
    *a3 = CFRetain(v10);
LABEL_17:
  if (a4 && v11)
    *a4 = CFRetain(v11);
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  return v12;
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void VinylRestoreHost::create(VinylRestoreHost *this@<X0>, const __CFDictionary *a2@<X1>, VinylRestoreHost **a3@<X8>)
{
  void *LogInstance;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ACFULogging *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  VinylRestoreHost *v20;
  ACFULogging *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v8, v9, v10, v11, v12, (char)"VinylRestoreHost");
  v14 = ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage((uint64_t)v14, 0, "%s::%s: VinylUpdater Version: %s\n", v15, v16, v17, v18, v19, (char)"VinylRestoreHost");
  v20 = (VinylRestoreHost *)operator new(0xE8uLL);
  VinylRestoreHost::VinylRestoreHost(v20);
  *a3 = v20;
  if (((*(uint64_t (**)(VinylRestoreHost *, VinylRestoreHost *, const __CFDictionary *))(*(_QWORD *)v20 + 32))(v20, this, a2) & 1) == 0)
  {
    *a3 = 0;
    v21 = (ACFULogging *)(*(uint64_t (**)(VinylRestoreHost *))(*(_QWORD *)v20 + 24))(v20);
    v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v23, v24, v25, v26, v27, (char)"VinylRestoreHost");
  }
}

void sub_20D0E4718(_Unwind_Exception *exception_object)
{
  _QWORD *v1;

  *v1 = 0;
  _Unwind_Resume(exception_object);
}

ACFULogging *VinylRestoreHost::createRequest(ACFULogging *a1, const __CFData *a2)
{
  void *LogInstance;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ACFULogging *v10;
  ACFULogging *v11;
  uint64_t (*v12)(uint64_t);
  CFTypeID v13;
  ACFULogging *TypeID;
  const __CFDictionary *v15;
  const void **v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  ACFULogging *RequestDict;
  ACFULogging *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  __int128 v36;
  void *v37;
  std::string *v38;
  __int128 v39;
  std::string *v40;
  __int128 v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  std::string v49;
  std::string v50;
  void *__p[2];
  std::string::size_type v52;
  CFErrorRef error;
  ACFULogging *v54;
  const __CFDictionary *v55;

  v54 = 0;
  v55 = 0;
  error = 0;
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: entering: %s\n", v5, v6, v7, v8, v9, (char)"VinylRestoreHost");
  v10 = (ACFULogging *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0, 0, &error);
  v11 = v54;
  v54 = v10;
  __p[0] = v11;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  v12 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!v54)
    v12 = 0;
  if (!v12)
  {
    v32 = ACFULogging::getLogInstance(v54);
    std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
    v33 = std::string::append(&v49, "::");
    v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v50.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    v35 = std::string::append(&v50, "createRequest");
    v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    v52 = v35->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 2, (uint64_t)"Failed to create propertylist from data, error: ", (uint64_t)error);
LABEL_19:
    if (SHIBYTE(v52) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v50.__r_.__value_.__l.__data_);
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v49.__r_.__value_.__l.__data_);
    goto LABEL_28;
  }
  v13 = CFGetTypeID(v54);
  TypeID = (ACFULogging *)CFDictionaryGetTypeID();
  if ((ACFULogging *)v13 != TypeID)
  {
    v37 = ACFULogging::getLogInstance(TypeID);
    std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
    v38 = std::string::append(&v49, "::");
    v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v50.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    v40 = std::string::append(&v50, "createRequest");
    v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    v52 = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v37, (uint64_t *)__p, 2, (uint64_t)"Deserialized plist data is not a dictionary firmwarePlist: ", (uint64_t)v54);
    goto LABEL_19;
  }
  v50.__r_.__value_.__r.__words[0] = (std::string::size_type)v54;
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(__p, (CFTypeRef *)&v50.__r_.__value_.__l.__data_);
  v15 = v55;
  v55 = (const __CFDictionary *)__p[0];
  __p[0] = v15;
  v16 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  if (v55)
    v17 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v17 = 0;
  if (!v17)
  {
    v42 = ACFULogging::getLogInstance((ACFULogging *)v16);
    v48 = "%s::%s: Failed fo retain firmwareDict\n";
LABEL_27:
    ACFULogging::handleMessage((uint64_t)v42, 2u, v48, v43, v44, v45, v46, v47, (char)"VinylRestoreHost");
LABEL_28:
    v24 = 0;
    goto LABEL_16;
  }
  v18 = ACFULogging::getLogInstance((ACFULogging *)v16);
  std::string::basic_string[abi:ne180100]<0>(&v49, "VinylRestoreHost");
  v19 = std::string::append(&v49, "::");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v50.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  v21 = std::string::append(&v50, "createRequest");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v52 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 0, (uint64_t)"firmwareDict: ", (uint64_t)v55);
  if (SHIBYTE(v52) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v50.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  RequestDict = VinylRestoreHost::createRequestDict((CFDictionaryRef *)a1, v55);
  v24 = RequestDict;
  if (!RequestDict)
  {
    v42 = ACFULogging::getLogInstance(0);
    v48 = "%s::%s: failed to create output request dictionary\n";
    goto LABEL_27;
  }
LABEL_16:
  v25 = ACFULogging::getLogInstance(RequestDict);
  ACFULogging::handleMessage((uint64_t)v25, 4u, "%s::%s: leaving: %s\n", v26, v27, v28, v29, v30, (char)"VinylRestoreHost");
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v54);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v55);
  return v24;
}

void sub_20D0E4AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 48));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v30 - 40));
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

CFMutableDictionaryRef VinylRestoreHost::createRequestDict(CFDictionaryRef *this, const __CFDictionary *a2)
{
  void *LogInstance;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ACFULogging *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ACFULogging *v17;
  void *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  VinylFirmware *Value;
  ACFULogging *v24;
  VinylFirmware *v25;
  const void **v26;
  uint64_t (*v27)(uint64_t);
  uint64_t (*v28)(uint64_t);
  const __CFAllocator *v29;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  CFMutableDictionaryRef v34;
  const void **v35;
  uint64_t (*v36)(uint64_t);
  uint64_t (*v37)(uint64_t);
  const __CFDictionary *v38;
  const void **v39;
  const void **v40;
  const void *v41;
  const void *v42;
  const void **v43;
  const void **v44;
  const void *v45;
  const void *v46;
  const __CFDictionary *v47;
  ACFULogging *v48;
  ACFULogging *v49;
  void *v50;
  std::string *v51;
  __int128 v52;
  std::string *v53;
  __int128 v54;
  const __CFDictionary *v55;
  ACFULogging *v56;
  ACFULogging *v57;
  void *v58;
  std::string *v59;
  __int128 v60;
  std::string *v61;
  __int128 v62;
  uint64_t (*v63)(uint64_t);
  ACFULogging *v64;
  void *v65;
  std::string *v66;
  __int128 v67;
  std::string *v68;
  __int128 v69;
  ACFULogging *v70;
  uint64_t (*v71)(uint64_t);
  ACFULogging *v72;
  void *v73;
  std::string *v74;
  __int128 v75;
  std::string *v76;
  __int128 v77;
  void *v78;
  std::string *v79;
  __int128 v80;
  std::string *v81;
  __int128 v82;
  ACFULogging *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  std::string *v92;
  __int128 v93;
  std::string *v94;
  __int128 v95;
  void *v96;
  std::string *v97;
  __int128 v98;
  std::string *v99;
  __int128 v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  std::string v121;
  std::string v122;
  void *__p[2];
  std::string::size_type v124;
  CFMutableDictionaryRef theDict;
  __CFDictionary *v126;
  void *v127;
  void *v128;

  LogInstance = ACFULogging::getLogInstance((ACFULogging *)this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v5, v6, v7, v8, v9, (char)"VinylRestoreHost");
  v127 = 0;
  v128 = 0;
  v126 = 0;
  theDict = 0;
  v11 = ACFULogging::getLogInstance(v10);
  ACFULogging::handleMessage((uint64_t)v11, 4u, "%s::%s: VinylRestoreHost::createRequestDict\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
  v18 = ACFULogging::getLogInstance(v17);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v19 = std::string::append(&v121, "::");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  v21 = std::string::append(&v122, "createRequestDict");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v124 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 4, (uint64_t)"firmwareInfoDict: ", (uint64_t)a2);
  if (SHIBYTE(v124) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v121.__r_.__value_.__l.__data_);
  Value = (VinylFirmware *)CFDictionaryGetValue(a2, CFSTR("eUICC,Im4pGold"));
  v24 = (ACFULogging *)CFDictionaryGetValue(a2, CFSTR("eUICC,Im4pMain"));
  if (!Value || (v25 = v24) == 0)
  {
    v108 = ACFULogging::getLogInstance(v24);
    v114 = "%s::%s: failed to get im4p values\n";
    goto LABEL_89;
  }
  VinylFirmware::generateMeasurement(Value, (CFDataRef *)&v122);
  __p[0] = v128;
  v128 = (void *)v122.__r_.__value_.__r.__words[0];
  v122.__r_.__value_.__r.__words[0] = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v122.__r_.__value_.__l.__data_);
  VinylFirmware::generateMeasurement(v25, (CFDataRef *)&v122);
  __p[0] = v127;
  v127 = (void *)v122.__r_.__value_.__r.__words[0];
  v122.__r_.__value_.__r.__words[0] = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  v26 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v122.__r_.__value_.__l.__data_);
  v27 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (v128)
    v28 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v28 = 0;
  if (!v28)
    goto LABEL_87;
  if (!v127)
    v27 = 0;
  if (!v27)
  {
LABEL_87:
    v108 = ACFULogging::getLogInstance((ACFULogging *)v26);
    v114 = "%s::%s: failed to get measurements\n";
LABEL_89:
    ACFULogging::handleMessage((uint64_t)v108, 2u, v114, v109, v110, v111, v112, v113, (char)"VinylRestoreHost");
LABEL_96:
    Mutable = 0;
    goto LABEL_77;
  }
  v29 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v31 = CFDictionaryCreateMutable(v29, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v32 = v126;
  v126 = v31;
  __p[0] = v32;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  v33 = CFDictionaryCreateMutable(v29, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v34 = theDict;
  theDict = v33;
  __p[0] = v34;
  v35 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  if (!Mutable
    || (v126
      ? (v36 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
      : (v36 = 0),
        !v36
     || (theDict
       ? (v37 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get)
       : (v37 = 0),
         !v37)))
  {
    v101 = ACFULogging::getLogInstance((ACFULogging *)v35);
    v107 = "%s::%s: failed to get create request Dictionary\n";
LABEL_93:
    ACFULogging::handleMessage((uint64_t)v101, 2u, v107, v102, v103, v104, v105, v106, (char)"VinylRestoreHost");
LABEL_94:
    if (!Mutable)
      goto LABEL_77;
    goto LABEL_95;
  }
  v38 = (const __CFDictionary *)CFDictionaryGetValue(this[2], CFSTR("DeviceInfo"));
  if (!v38)
  {
    v115 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v115, 2u, "%s::%s: failed to get deviceInfoDict\n", v116, v117, v118, v119, v120, (char)"VinylRestoreHost");
LABEL_95:
    CFRelease(Mutable);
    goto LABEL_96;
  }
  v39 = (const void **)this[8];
  v40 = (const void **)this[9];
  while (v39 != v40)
  {
    v41 = *v39;
    if (!CFDictionaryGetValue(v38, *v39))
    {
      v91 = ACFULogging::getLogInstance(0);
      std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
      v92 = std::string::append(&v121, "::");
      v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
      v122.__r_.__value_.__r.__words[2] = v92->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v93;
      v92->__r_.__value_.__l.__size_ = 0;
      v92->__r_.__value_.__r.__words[2] = 0;
      v92->__r_.__value_.__r.__words[0] = 0;
      v94 = std::string::append(&v122, "createRequestDict");
      v95 = *(_OWORD *)&v94->__r_.__value_.__l.__data_;
      v124 = v94->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v95;
      v94->__r_.__value_.__l.__size_ = 0;
      v94->__r_.__value_.__r.__words[2] = 0;
      v94->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v91, (uint64_t *)__p, 2, (uint64_t)"Failed to find deviceTag: ", (uint64_t)v41);
LABEL_80:
      if (SHIBYTE(v124) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v122.__r_.__value_.__l.__data_);
      if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v121.__r_.__value_.__l.__data_);
      goto LABEL_94;
    }
    v42 = CFDictionaryGetValue(v38, v41);
    CFDictionarySetValue(Mutable, v41, v42);
    ++v39;
  }
  v43 = (const void **)this[11];
  v44 = (const void **)this[12];
  while (v43 != v44)
  {
    v45 = *v43;
    if (!CFDictionaryGetValue(v38, *v43))
    {
      v96 = ACFULogging::getLogInstance(0);
      std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
      v97 = std::string::append(&v121, "::");
      v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
      v122.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v98;
      v97->__r_.__value_.__l.__size_ = 0;
      v97->__r_.__value_.__r.__words[2] = 0;
      v97->__r_.__value_.__r.__words[0] = 0;
      v99 = std::string::append(&v122, "createRequestDict");
      v100 = *(_OWORD *)&v99->__r_.__value_.__l.__data_;
      v124 = v99->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v100;
      v99->__r_.__value_.__l.__size_ = 0;
      v99->__r_.__value_.__r.__words[2] = 0;
      v99->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v96, (uint64_t *)__p, 2, (uint64_t)"Failed to find requestTag: ", (uint64_t)v45);
      goto LABEL_80;
    }
    v46 = CFDictionaryGetValue(v38, v45);
    CFDictionarySetValue(Mutable, v45, v46);
    ++v43;
  }
  v47 = (const __CFDictionary *)CFDictionaryGetValue(Mutable, CFSTR("eUICC,Gold"));
  v48 = (ACFULogging *)CFDictionaryGetValue(v47, CFSTR("Nonce"));
  v49 = v48;
  if (!v48)
  {
    v101 = ACFULogging::getLogInstance(0);
    v107 = "%s::%s: failed to get goldNonce\n";
    goto LABEL_93;
  }
  v50 = ACFULogging::getLogInstance(v48);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v51 = std::string::append(&v121, "::");
  v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  v53 = std::string::append(&v122, "createRequestDict");
  v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  v124 = v53->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v54;
  v53->__r_.__value_.__l.__size_ = 0;
  v53->__r_.__value_.__r.__words[2] = 0;
  v53->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v50, (uint64_t *)__p, 4, (uint64_t)"goldNonce: ", (uint64_t)v49);
  if (SHIBYTE(v124) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v121.__r_.__value_.__l.__data_);
  v55 = (const __CFDictionary *)CFDictionaryGetValue(Mutable, CFSTR("eUICC,Main"));
  v56 = (ACFULogging *)CFDictionaryGetValue(v55, CFSTR("Nonce"));
  v57 = v56;
  if (!v56)
  {
    v101 = ACFULogging::getLogInstance(0);
    v107 = "%s::%s: failed to get mainNonce\n";
    goto LABEL_93;
  }
  v58 = ACFULogging::getLogInstance(v56);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v59 = std::string::append(&v121, "::");
  v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  v61 = std::string::append(&v122, "createRequestDict");
  v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
  v124 = v61->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v62;
  v61->__r_.__value_.__l.__size_ = 0;
  v61->__r_.__value_.__r.__words[2] = 0;
  v61->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v58, (uint64_t *)__p, 4, (uint64_t)"mainNonce: ", (uint64_t)v57);
  if (SHIBYTE(v124) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v121.__r_.__value_.__l.__data_);
  if (v126)
    v63 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  else
    v63 = 0;
  if (v63)
  {
    CFDictionarySetValue(v126, CFSTR("Digest"), v128);
    CFDictionarySetValue(v126, CFSTR("Nonce"), v49);
    v65 = ACFULogging::getLogInstance(v64);
    std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
    v66 = std::string::append(&v121, "::");
    v67 = *(_OWORD *)&v66->__r_.__value_.__l.__data_;
    v122.__r_.__value_.__r.__words[2] = v66->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v67;
    v66->__r_.__value_.__l.__size_ = 0;
    v66->__r_.__value_.__r.__words[2] = 0;
    v66->__r_.__value_.__r.__words[0] = 0;
    v68 = std::string::append(&v122, "createRequestDict");
    v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
    v124 = v68->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v69;
    v68->__r_.__value_.__l.__size_ = 0;
    v68->__r_.__value_.__r.__words[2] = 0;
    v68->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v65, (uint64_t *)__p, 4, (uint64_t)"goldDict: ", (uint64_t)v126);
    if (SHIBYTE(v124) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v122.__r_.__value_.__l.__data_);
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v121.__r_.__value_.__l.__data_);
    CFDictionaryReplaceValue(Mutable, CFSTR("eUICC,Gold"), v126);
  }
  v70 = theDict;
  if (theDict)
    v71 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  else
    v71 = 0;
  if (v71)
  {
    CFDictionarySetValue(theDict, CFSTR("Digest"), v127);
    CFDictionarySetValue(theDict, CFSTR("Nonce"), v57);
    v73 = ACFULogging::getLogInstance(v72);
    std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
    v74 = std::string::append(&v121, "::");
    v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
    v122.__r_.__value_.__r.__words[2] = v74->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v75;
    v74->__r_.__value_.__l.__size_ = 0;
    v74->__r_.__value_.__r.__words[2] = 0;
    v74->__r_.__value_.__r.__words[0] = 0;
    v76 = std::string::append(&v122, "createRequestDict");
    v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
    v124 = v76->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v77;
    v76->__r_.__value_.__l.__size_ = 0;
    v76->__r_.__value_.__r.__words[2] = 0;
    v76->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v73, (uint64_t *)__p, 4, (uint64_t)"mainDict: ", (uint64_t)theDict);
    if (SHIBYTE(v124) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v122.__r_.__value_.__l.__data_);
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v121.__r_.__value_.__l.__data_);
    CFDictionaryReplaceValue(Mutable, CFSTR("eUICC,Main"), theDict);
  }
  v78 = ACFULogging::getLogInstance(v70);
  std::string::basic_string[abi:ne180100]<0>(&v121, "VinylRestoreHost");
  v79 = std::string::append(&v121, "::");
  v80 = *(_OWORD *)&v79->__r_.__value_.__l.__data_;
  v122.__r_.__value_.__r.__words[2] = v79->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v122.__r_.__value_.__l.__data_ = v80;
  v79->__r_.__value_.__l.__size_ = 0;
  v79->__r_.__value_.__r.__words[2] = 0;
  v79->__r_.__value_.__r.__words[0] = 0;
  v81 = std::string::append(&v122, "createRequestDict");
  v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
  v124 = v81->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v82;
  v81->__r_.__value_.__l.__size_ = 0;
  v81->__r_.__value_.__r.__words[2] = 0;
  v81->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v78, (uint64_t *)__p, 4, (uint64_t)"requestDict after digest: ", (uint64_t)Mutable);
  if (SHIBYTE(v124) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v121.__r_.__value_.__l.__data_);
  v84 = ACFULogging::getLogInstance(v83);
  ACFULogging::handleMessage((uint64_t)v84, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v85, v86, v87, v88, v89, (char)"VinylRestoreHost");
LABEL_77:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&theDict);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v126);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v127);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v128);
  return Mutable;
}

void sub_20D0E5540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,const void *a32)
{
  uint64_t v32;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a32);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v32 - 104));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v32 - 96));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v32 - 88));
  _Unwind_Resume(a1);
}

void VinylRestoreHost::~VinylRestoreHost(VinylRestoreHost *this)
{
  void *LogInstance;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24C5FF160;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylRestoreHost: destructor\n", v3, v4, v5, v6, v7, (char)"VinylRestoreHost");
  ACFURestoreHost::~ACFURestoreHost(this);
}

{
  void *v1;

  VinylRestoreHost::~VinylRestoreHost(this);
  operator delete(v1);
}

void VinylRestoreHost::VinylRestoreHost(VinylRestoreHost *this)
{
  ACFULogging *v1;
  void *LogInstance;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  ACFURestoreHost::ACFURestoreHost(this);
  *(_QWORD *)v1 = &off_24C5FF160;
  LogInstance = ACFULogging::getLogInstance(v1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylRestoreHost: constructor\n", v3, v4, v5, v6, v7, (char)"VinylRestoreHost");
}

void sub_20D0E5718(_Unwind_Exception *a1)
{
  ACFURestoreHost *v1;

  ACFURestoreHost::~ACFURestoreHost(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylRestoreHost::init(VinylRestoreHost *this, const __CFDictionary *a2, const __CFString *a3)
{
  void *LogInstance;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeID TypeID;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  CFTypeID v16;
  ACFULogging *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 __src;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  unint64_t v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v7, v8, v9, v10, v11, (char)"VinylRestoreHost");
  __src = xmmword_24C5FF190;
  *(_QWORD *)&v26 = CFSTR("eUICC,Main");
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 40, (char *)&__src, (uint64_t)&v26 + 8, 3uLL);
  __src = xmmword_24C5FF1A8;
  v26 = *(_OWORD *)&off_24C5FF1B8;
  v27 = xmmword_24C5FF1C8;
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 64, (char *)&__src, (uint64_t)v28, 6uLL);
  *(_QWORD *)&__src = CFSTR("@eUICC,Ticket");
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 88, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
  *(_QWORD *)&__src = CFSTR("eUICC,Ticket");
  std::vector<__CFString const*>::__assign_with_size[abi:ne180100]<__CFString const* const*,__CFString const* const*>((char *)this + 112, (char *)&__src, (uint64_t)&__src + 8, 1uLL);
  TypeID = CFNumberGetTypeID();
  *(_QWORD *)&__src = CFSTR("eUICC,ChipID");
  *((_QWORD *)&__src + 1) = TypeID;
  v13 = CFDataGetTypeID();
  *(_QWORD *)&v26 = CFSTR("eUICC,EID");
  *((_QWORD *)&v26 + 1) = v13;
  v14 = CFDataGetTypeID();
  *(_QWORD *)&v27 = CFSTR("eUICC,GoldNonce");
  *((_QWORD *)&v27 + 1) = v14;
  v15 = CFDataGetTypeID();
  v28[0] = CFSTR("eUICC,MainNonce");
  v28[1] = v15;
  v16 = CFDataGetTypeID();
  v28[2] = CFSTR("eUICC,RootKeyIdentifier");
  v28[3] = v16;
  std::__tree<std::__value_type<__CFString const*,unsigned long>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,unsigned long>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,unsigned long>>>::__assign_unique<std::pair<__CFString const* const,unsigned long> const*>((uint64_t **)this + 20, (unint64_t *)&__src, v29);
  *(_QWORD *)&__src = CFSTR("eUICC,Gold");
  WORD4(__src) = 0;
  *(_QWORD *)&v26 = CFSTR("eUICC,Main");
  WORD4(v26) = 0;
  std::__tree<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,ACFURestoreHost::DemoteConfig>>>::__assign_unique<std::pair<__CFString const* const,ACFURestoreHost::DemoteConfig> const*>((uint64_t **)this + 25, (unint64_t *)&__src, (unint64_t *)&v27);
  __src = xmmword_24C5FF1D8;
  v26 = *(_OWORD *)&off_24C5FF1E8;
  std::vector<ACFURestoreHost::FileList>::__assign_with_size[abi:ne180100]<ACFURestoreHost::FileList const*,ACFURestoreHost::FileList const*>((char *)this + 136, (char *)&__src, (uint64_t)&v27, 2uLL);
  *((_QWORD *)this + 28) = CFSTR("Vinyl");
  v17 = (ACFULogging *)ACFURestoreHost::init((const void **)this, a2, a3);
  v18 = ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage((uint64_t)v18, 4u, "%s::%s: leaving: VinylRestoreHost: %s\n", v19, v20, v21, v22, v23, (char)"VinylRestoreHost");
  return v17;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

ACFULogging *VinylRestoreHost::copyFirmwareUpdater(ACFULogging **a1, const __CFDictionary *a2, int a3)
{
  void *LogInstance;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ACFULogging *v12;
  ACFULogging *Value;
  const __CFDictionary *v14;
  CFTypeID v15;
  void *v16;
  std::string *v17;
  __int128 v18;
  std::string *v19;
  __int128 v20;
  ACFULogging *TypeID;
  const __CFData *v22;
  CFTypeID v23;
  void *v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  __int128 v28;
  ACFULogging *v29;
  const __CFData *v30;
  CFTypeID v31;
  void *v32;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  __int128 v36;
  ACFULogging *v37;
  const __CFData *v38;
  CFTypeID v39;
  void *v40;
  std::string *v41;
  __int128 v42;
  std::string *v43;
  __int128 v44;
  ACFULogging *v45;
  const __CFData *v46;
  CFTypeID v47;
  void *v48;
  std::string *v49;
  __int128 v50;
  std::string *v51;
  __int128 v52;
  ACFULogging *v53;
  void *v54;
  std::string *v55;
  __int128 v56;
  std::string *v57;
  __int128 v58;
  ACFULogging *v59;
  ACFULogging *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  std::string *v68;
  __int128 v69;
  std::string *v70;
  __int128 v71;
  VinylFirmware *v72;
  ACFULogging *v73;
  VinylFirmware *v74;
  const __CFAllocator *v75;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v77;
  const void *Im4p;
  const void *FwData;
  const void *RecoveryFwData;
  const void *InfoPlistData;
  const void *ProfileData;
  const void *v83;
  const void *v84;
  const void *v85;
  const void *v86;
  const void *v87;
  ACFULogging *v88;
  void *v89;
  std::string *v90;
  __int128 v91;
  std::string *v92;
  __int128 v93;
  ACFULogging *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  std::string *v153;
  __int128 v154;
  std::string *v155;
  __int128 v156;
  std::string v157;
  std::string v158;
  void *__p[2];
  std::string::size_type v160;
  CFErrorRef error;

  LogInstance = ACFULogging::getLogInstance((ACFULogging *)a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreHost: %s\n", v7, v8, v9, v10, v11, (char)"VinylRestoreHost");
  error = 0;
  if (!a2)
  {
    v135 = ACFULogging::getLogInstance(v12);
    ACFULogging::handleMessage((uint64_t)v135, 2u, "%s::%s: firmwareFileDictionary is null\n", v136, v137, v138, v139, v140, (char)"VinylRestoreHost");
    return 0;
  }
  Value = (ACFULogging *)CFDictionaryGetValue(a1[2], CFSTR("DeviceInfo"));
  if (!Value
    || (v14 = Value,
        v15 = CFGetTypeID(Value),
        Value = (ACFULogging *)CFDictionaryGetTypeID(),
        (ACFULogging *)v15 != Value))
  {
    v105 = ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage((uint64_t)v105, 2u, "%s::%s: Deviceinfo is not a dictionary\n", v106, v107, v108, v109, v110, (char)"VinylRestoreHost");
    return 0;
  }
  v16 = ACFULogging::getLogInstance(Value);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v17 = std::string::append(&v157, "::");
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  v19 = std::string::append(&v158, "copyFirmwareUpdater");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v160 = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v16, (uint64_t *)__p, 4, (uint64_t)"VinylRestore::copyFirmwareUpdater kUpdaterDeviceInfo value : ", (uint64_t)v14);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  TypeID = (ACFULogging *)CFDictionaryGetValue(v14, CFSTR("eUICC,RootKeyIdentifier"));
  if (!TypeID
    || (v22 = TypeID, v23 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v23 != TypeID))
  {
    v111 = ACFULogging::getLogInstance(TypeID);
    ACFULogging::handleMessage((uint64_t)v111, 2u, "%s::%s: certIdentifier is not a CFData type\n", v112, v113, v114, v115, v116, (char)"VinylRestoreHost");
    return 0;
  }
  v24 = ACFULogging::getLogInstance(TypeID);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v25 = std::string::append(&v157, "::");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = std::string::append(&v158, "copyFirmwareUpdater");
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v160 = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v24, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  certIdentifier: ", (uint64_t)v22);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  v29 = (ACFULogging *)CFDictionaryGetValue(v14, CFSTR("eUICC,FirmwareLoaderVersion"));
  if (!v29 || (v30 = v29, v31 = CFGetTypeID(v29), v29 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v31 != v29))
  {
    v117 = ACFULogging::getLogInstance(v29);
    ACFULogging::handleMessage((uint64_t)v117, 2u, "%s::%s: firmwareLoaderVersion is not a CFData type\n", v118, v119, v120, v121, v122, (char)"VinylRestoreHost");
    return 0;
  }
  v32 = ACFULogging::getLogInstance(v29);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v33 = std::string::append(&v157, "::");
  v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v35 = std::string::append(&v158, "copyFirmwareUpdater");
  v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v160 = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  firmwareLoaderVersion: ", (uint64_t)v30);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  v37 = (ACFULogging *)CFDictionaryGetValue(v14, CFSTR("eUICC,MainFwMac"));
  if (!v37 || (v38 = v37, v39 = CFGetTypeID(v37), v37 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v39 != v37))
  {
    v123 = ACFULogging::getLogInstance(v37);
    ACFULogging::handleMessage((uint64_t)v123, 2u, "%s::%s: mainFwMac is not a CFData type\n", v124, v125, v126, v127, v128, (char)"VinylRestoreHost");
    return 0;
  }
  v40 = ACFULogging::getLogInstance(v37);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v41 = std::string::append(&v157, "::");
  v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  v43 = std::string::append(&v158, "copyFirmwareUpdater");
  v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  v160 = v43->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v40, (uint64_t *)__p, 4, (uint64_t)"VinylTransport::getTicket  mainFwMac: ", (uint64_t)v38);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  v45 = (ACFULogging *)CFDictionaryGetValue(v14, CFSTR("eUICC,GoldFwMac"));
  if (!v45 || (v46 = v45, v47 = CFGetTypeID(v45), v45 = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v47 != v45))
  {
    v129 = ACFULogging::getLogInstance(v45);
    ACFULogging::handleMessage((uint64_t)v129, 2u, "%s::%s: goldFwMac is not a CFData type\n", v130, v131, v132, v133, v134, (char)"VinylRestoreHost");
    return 0;
  }
  v48 = ACFULogging::getLogInstance(v45);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v49 = std::string::append(&v157, "::");
  v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v50;
  v49->__r_.__value_.__l.__size_ = 0;
  v49->__r_.__value_.__r.__words[2] = 0;
  v49->__r_.__value_.__r.__words[0] = 0;
  v51 = std::string::append(&v158, "copyFirmwareUpdater");
  v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  v160 = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v48, (uint64_t *)__p, 0, (uint64_t)"VinylTransport::getTicket  goldFwMac: ", (uint64_t)v46);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  v54 = ACFULogging::getLogInstance(v53);
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v55 = std::string::append(&v157, "::");
  v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v55->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v56;
  v55->__r_.__value_.__l.__size_ = 0;
  v55->__r_.__value_.__r.__words[2] = 0;
  v55->__r_.__value_.__r.__words[0] = 0;
  v57 = std::string::append(&v158, "copyFirmwareUpdater");
  v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
  v160 = v57->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v58;
  v57->__r_.__value_.__l.__size_ = 0;
  v57->__r_.__value_.__r.__words[2] = 0;
  v57->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v54, (uint64_t *)__p, 4, (uint64_t)"Firmware File Dictionary: ", (uint64_t)a2);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  if (CFDictionaryContainsKey(a2, a1[1]))
    v59 = a1[1];
  else
    v59 = (ACFULogging *)CFSTR("eUICC,Gold");
  v60 = (ACFULogging *)ACFURestoreHost::copyDataFromFileDictionary(v59, a2, a3);
  v61 = ACFULogging::getLogInstance(v60);
  v67 = (uint64_t)v61;
  if (!v60)
  {
    ACFULogging::handleMessage((uint64_t)v61, 2u, "%s::%s: failed to get fwZipData\n", v62, v63, v64, v65, v66, (char)"VinylRestoreHost");
    return v60;
  }
  std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
  v68 = std::string::append(&v157, "::");
  v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
  v158.__r_.__value_.__r.__words[2] = v68->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v69;
  v68->__r_.__value_.__l.__size_ = 0;
  v68->__r_.__value_.__r.__words[2] = 0;
  v68->__r_.__value_.__r.__words[0] = 0;
  v70 = std::string::append(&v158, "copyFirmwareUpdater");
  v71 = *(_OWORD *)&v70->__r_.__value_.__l.__data_;
  v160 = v70->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v71;
  v70->__r_.__value_.__l.__size_ = 0;
  v70->__r_.__value_.__r.__words[2] = 0;
  v70->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v67, (uint64_t *)__p, 4, (uint64_t)"fwData: ", (uint64_t)v60);
  if (SHIBYTE(v160) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v158.__r_.__value_.__l.__data_);
  if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v157.__r_.__value_.__l.__data_);
  v72 = VinylGoldFirmwareCreate(v60, v22, v30, v46);
  v73 = VinylMainFirmwareCreate(v60, v22, v30, v38);
  v74 = v73;
  if (v72 && v73)
  {
    v75 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v77 = Mutable;
      Im4p = (const void *)VinylFirmware::getIm4p(v72);
      CFDictionarySetValue(v77, CFSTR("eUICC,Im4pGold"), Im4p);
      FwData = (const void *)VinylFirmware::getFwData(v72);
      CFDictionarySetValue(v77, CFSTR("eUICC,Gold"), FwData);
      if (VinylFirmware::getRecoveryFwData(v72))
      {
        RecoveryFwData = (const void *)VinylFirmware::getRecoveryFwData(v72);
        CFDictionarySetValue(v77, CFSTR("eUICC,GoldRecoveryFw"), RecoveryFwData);
      }
      InfoPlistData = (const void *)VinylFirmware::getInfoPlistData(v72);
      CFDictionarySetValue(v77, CFSTR("eUICC,InfoPlistDataGold"), InfoPlistData);
      ProfileData = (const void *)VinylFirmware::getProfileData(v72);
      CFDictionarySetValue(v77, CFSTR("eUICC,ProfileDataGold"), ProfileData);
      v83 = (const void *)VinylFirmware::getIm4p(v74);
      CFDictionarySetValue(v77, CFSTR("eUICC,Im4pMain"), v83);
      v84 = (const void *)VinylFirmware::getFwData(v74);
      CFDictionarySetValue(v77, CFSTR("eUICC,Main"), v84);
      if (VinylFirmware::getRecoveryFwData(v74))
      {
        v85 = (const void *)VinylFirmware::getRecoveryFwData(v74);
        CFDictionarySetValue(v77, CFSTR("eUICC,MainRecoveryFw"), v85);
      }
      v86 = (const void *)VinylFirmware::getInfoPlistData(v74);
      CFDictionarySetValue(v77, CFSTR("eUICC,InfoPlistDataMain"), v86);
      v87 = (const void *)VinylFirmware::getProfileData(v74);
      CFDictionarySetValue(v77, CFSTR("eUICC,ProfileDataMain"), v87);
      v88 = CFPropertyListCreateData(v75, v77, kCFPropertyListXMLFormat_v1_0, 0, &error);
      v89 = ACFULogging::getLogInstance(v88);
      std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
      v90 = std::string::append(&v157, "::");
      v91 = *(_OWORD *)&v90->__r_.__value_.__l.__data_;
      v158.__r_.__value_.__r.__words[2] = v90->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v91;
      v90->__r_.__value_.__l.__size_ = 0;
      v90->__r_.__value_.__r.__words[2] = 0;
      v90->__r_.__value_.__r.__words[0] = 0;
      v92 = std::string::append(&v158, "copyFirmwareUpdater");
      v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
      v160 = v92->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v93;
      v92->__r_.__value_.__l.__size_ = 0;
      v92->__r_.__value_.__r.__words[2] = 0;
      v92->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)v89, (uint64_t *)__p, 0, (uint64_t)"firmwareInfoDict: ", (uint64_t)v77);
      if (SHIBYTE(v160) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v158.__r_.__value_.__l.__data_);
      if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v157.__r_.__value_.__l.__data_);
      v95 = ACFULogging::getLogInstance(v94);
      v101 = (uint64_t)v95;
      if (v88)
      {
        ACFULogging::handleMessage((uint64_t)v95, 0, "%s::%s: leaving: VinylRestoreHost: %s\n", v96, v97, v98, v99, v100, (char)"VinylRestoreHost");
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(&v157, "VinylRestoreHost");
        v153 = std::string::append(&v157, "::");
        v154 = *(_OWORD *)&v153->__r_.__value_.__l.__data_;
        v158.__r_.__value_.__r.__words[2] = v153->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v158.__r_.__value_.__l.__data_ = v154;
        v153->__r_.__value_.__l.__size_ = 0;
        v153->__r_.__value_.__r.__words[2] = 0;
        v153->__r_.__value_.__r.__words[0] = 0;
        v155 = std::string::append(&v158, "copyFirmwareUpdater");
        v156 = *(_OWORD *)&v155->__r_.__value_.__l.__data_;
        v160 = v155->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v156;
        v155->__r_.__value_.__l.__size_ = 0;
        v155->__r_.__value_.__r.__words[2] = 0;
        v155->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType(v101, (uint64_t *)__p, 2, (uint64_t)"Failed to serialize dictionary, error: ", (uint64_t)error);
        if (SHIBYTE(v160) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v158.__r_.__value_.__l.__data_);
        if (SHIBYTE(v157.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v157.__r_.__value_.__l.__data_);
      }
      CFRelease(v77);
    }
    else
    {
      v147 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v147, 2u, "%s::%s: failed to get create firmwareInfoDict\n", v148, v149, v150, v151, v152, (char)"VinylRestoreHost");
      v88 = 0;
    }
    CFRelease(v60);
    goto LABEL_75;
  }
  v141 = ACFULogging::getLogInstance(v73);
  ACFULogging::handleMessage((uint64_t)v141, 2u, "%s::%s: failed to get firmware object\n", v142, v143, v144, v145, v146, (char)"VinylRestoreHost");
  CFRelease(v60);
  v88 = 0;
  v60 = 0;
  if (v72)
  {
LABEL_75:
    VinylFirmware::~VinylFirmware(v72);
    operator delete(v102);
    v60 = v88;
  }
  if (v74)
  {
    VinylFirmware::~VinylFirmware(v74);
    operator delete(v103);
  }
  return v60;
}

void sub_20D0E6460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(_QWORD *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
    CFRetain(cf);
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
      amai_unzGoToFirstFile(v8);
    }
  }
  return v8;
}

_QWORD *vinyl_unzOpen(uint64_t a1, uint64_t a2)
{
  return vinyl_unzOpen2(a1, 0, a2);
}

_QWORD *eUICCFwReaderOpen(ACFULogging *a1)
{
  void *LogInstance;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v3, v4, v5, v6, v7, (char)"eUICCFwReader");
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v10 = vinyl_unzOpen((uint64_t)BytePtr, Length);
  if (!v10)
  {
    v11 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: failed to open bbfw archive for reading eUICCFwReaderOpen\n", v12, v13, v14, v15, v16, (char)"eUICCFwReader");
  }
  return v10;
}

uint64_t eUICCFwReaderClose(ACFULogging *a1)
{
  void *LogInstance;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v3, v4, v5, v6, v7, (char)"eUICCFwReader");
  if (a1)
    amai_unzClose((uint64_t)a1);
  return 0;
}

ACFULogging *eUICCFwReaderFindAndCopyFileData(ACFULogging *a1, CFStringRef theString, CFTypeRef *a3)
{
  void *LogInstance;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  ACFULogging *File;
  ACFULogging *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ACFULogging *v19;
  ACFULogging *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFTypeRef v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::string v35;
  std::string v36;
  void *__p[2];
  std::string::size_type v38;
  CFTypeRef v39;

  v39 = 0;
  if (theString)
  {
    LogInstance = ACFULogging::getLogInstance(a1);
    std::string::basic_string[abi:ne180100]<0>(&v35, "eUICCFwReader");
    v7 = std::string::append(&v35, "::");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v36, "eUICCFwReaderFindAndCopyFileData");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v38 = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)__p, 4, (uint64_t)"filename ", (uint64_t)theString);
    if (SHIBYTE(v38) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
  }
  File = (ACFULogging *)BbfwReaderFindFile((uint64_t)a1, theString);
  if ((_DWORD)File)
  {
    v12 = File;
    v13 = ACFULogging::getLogInstance(File);
    ACFULogging::handleMessage((uint64_t)v13, 2u, "%s::%s: failed to find bbfw item status %d\n", v14, v15, v16, v17, v18, (char)"eUICCFwReader");
    return v12;
  }
  else
  {
    v20 = (ACFULogging *)eUICCFwReaderCopyFileData((uint64_t)a1, &v39);
    v19 = v20;
    if ((_DWORD)v20)
    {
      v21 = ACFULogging::getLogInstance(v20);
      ACFULogging::handleMessage((uint64_t)v21, 2u, "%s::%s: failed to extract bbfw item status %d\n", v22, v23, v24, v25, v26, (char)"eUICCFwReader");
      v27 = v39;
      if (!v39)
        return v19;
    }
    else
    {
      v27 = v39;
      if (!v39)
      {
        v29 = ACFULogging::getLogInstance(v20);
        ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to extract bbfw item fileData is NULL\n", v30, v31, v32, v33, v34, (char)"eUICCFwReader");
        return 0;
      }
      *a3 = CFRetain(v39);
    }
    CFRelease(v27);
  }
  return v19;
}

void sub_20D0E6C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  if (amai_unzGetCurrentFileInfo(a1, (uint64_t)&v10, (uint64_t)v12, 0x400uLL, 0, 0, 0, 0))
    return 15;
  v4 = (const UInt8 *)malloc(__size);
  if (!v4)
    return 2;
  v5 = v4;
  if (amai_unzOpenCurrentFile(a1))
    return 15;
  CurrentFile = amai_unzReadCurrentFile(a1, (uint64_t)v5, __size);
  if (__size != CurrentFile)
    return 4;
  if (amai_unzCloseCurrentFile(a1))
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
  void *LogInstance;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ACFULogging *v12;
  const __CFAllocator *v13;
  CFStringRef v14;
  CFStringRef v15;
  char v16;
  uint64_t v17;
  ACFULogging *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[136];
  char cStr[1024];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v7, v8, v9, v10, v11, (char)"eUICCFwReader");
  v12 = (ACFULogging *)eUICCFwReaderOpen(a1);
  if (!v12)
  {
    v26 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to open bbfw archive for reading\n", v27, v28, v29, v30, v31, (char)"eUICCFwReader");
    v17 = 4;
    goto LABEL_9;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    if (amai_unzGetCurrentFileInfo((uint64_t)v12, (uint64_t)v32, (uint64_t)cStr, 0x400uLL, 0, 0, 0, 0))
    {
      v17 = 15;
      goto LABEL_9;
    }
    if (cStr[0])
      break;
LABEL_7:
    if (amai_unzGoToNextFile(v12))
    {
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  v14 = CFStringCreateWithCString(v13, cStr, 0x8000100u);
  if (v14)
  {
    v15 = v14;
    v16 = a2(a3, v14, v12);
    CFRelease(v15);
    if ((v16 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v17 = 3;
LABEL_9:
  v18 = (ACFULogging *)eUICCFwReaderClose(v12);
  v19 = ACFULogging::getLogInstance(v18);
  ACFULogging::handleMessage((uint64_t)v19, 4u, "%s::%s: leaving: %s\n", v20, v21, v22, v23, v24, (char)"eUICCFwReader");
  return v17;
}

ACFULogging *VinylUpdaterGetTags(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, ACFULogging **a4)
{
  ACFULogging *LogInstance;
  ACFULogging *inited;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ACFULogging *v17;
  ACFURestoreHost *v18;
  ACFULogging *Error;
  ACFULogging *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  VinylRestoreHost *v46;

  LogInstance = (ACFULogging *)ACFULogging::getLogInstance(a1);
  inited = (ACFULogging *)ACFULogging::initLog(LogInstance, a1, a2, a3);
  if (a4)
  {
    v10 = (int)inited;
    v11 = ACFULogging::getLogInstance(inited);
    if (v10)
    {
      ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: failed to init logging\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
      Error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("VinylRestoreInfo"), v10, 0);
      v18 = 0;
    }
    else
    {
      ACFULogging::handleMessage((uint64_t)v11, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v12, v13, v14, v15, v16, (char)"VinylRestoreHost");
      VinylRestoreHost::create(a1, (const __CFDictionary *)CFSTR("VinylRestoreInfo"), &v46);
      v18 = v46;
      if (v46)
      {
        Error = (ACFULogging *)(**(uint64_t (***)(VinylRestoreHost *))v46)(v46);
        v20 = Error;
        if (Error)
          goto LABEL_5;
        v40 = ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage((uint64_t)v40, 2u, "%s::%s: failed to get tags\n", v41, v42, v43, v44, v45, (char)"VinylRestoreHost");
        Error = ACFURestoreHost::getError(v18);
      }
      else
      {
        v34 = ACFULogging::getLogInstance(v17);
        ACFULogging::handleMessage((uint64_t)v34, 2u, "%s::%s: failed to create host object\n", v35, v36, v37, v38, v39, (char)"VinylRestoreHost");
        Error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("VinylRestoreInfo"), 4000, 0);
      }
    }
    v20 = 0;
    *a4 = Error;
  }
  else
  {
    v28 = ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: invalid error parameter passed\n", v29, v30, v31, v32, v33, (char)"VinylRestoreHost");
    v18 = 0;
    v20 = 0;
  }
LABEL_5:
  v21 = ACFULogging::getLogInstance(Error);
  ACFULogging::handleMessage((uint64_t)v21, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v22, v23, v24, v25, v26, (char)"VinylRestoreHost");
  if (v18)
    (*(void (**)(ACFURestoreHost *))(*(_QWORD *)v18 + 24))(v18);
  return v20;
}

void sub_20D0E70C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylUpdaterCopyFirmware(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, CFErrorRef *a4)
{
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ACFULogging *v14;
  ACFULogging *v15;
  ACFULogging *inited;
  ACFULogging *v17;
  ACFURestoreHost *v18;
  ACFULogging *v19;
  ACFULogging *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFAllocator *v35;
  CFIndex v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  ACFURestoreHost *v49;

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v9, v10, v11, v12, v13, (char)"VinylRestoreHost");
  v15 = (ACFULogging *)ACFULogging::getLogInstance(v14);
  inited = (ACFULogging *)ACFULogging::initLog(v15, a1, a2, a3);
  if ((_DWORD)inited)
  {
    v28 = (int)inited;
    v29 = ACFULogging::getLogInstance(inited);
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: failed to init logging\n", v30, v31, v32, v33, v34, (char)"VinylRestoreHost");
    if (a4)
    {
      v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v36 = v28;
LABEL_11:
      v20 = 0;
      *a4 = CFErrorCreate(v35, CFSTR("VinylRestoreInfo"), v36, 0);
      return v20;
    }
    return 0;
  }
  VinylRestoreHost::create(a1, (const __CFDictionary *)CFSTR("VinylRestoreInfo"), &v49);
  v18 = v49;
  if (!v49)
  {
    v37 = ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage((uint64_t)v37, 2u, "%s::%s: failed to create host object\n", v38, v39, v40, v41, v42, (char)"VinylRestoreHost");
    if (a4)
    {
      v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v36 = 4000;
      goto LABEL_11;
    }
    return 0;
  }
  v19 = ACFURestoreHost::copyFirmware(v49);
  v20 = v19;
  if (v19)
  {
    v21 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v21, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v22, v23, v24, v25, v26, (char)"VinylRestoreHost");
  }
  else
  {
    v43 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: failed to copy firmware\n", v44, v45, v46, v47, v48, (char)"VinylRestoreHost");
    if (a4)
      *a4 = ACFURestoreHost::getError(v18);
  }
  (*(void (**)(ACFURestoreHost *))(*(_QWORD *)v18 + 24))(v18);
  return v20;
}

void sub_20D0E7288(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

ACFULogging *VinylUpdaterCreateRequest(ACFULogging *a1, void (*a2)(void *, const char *), void *a3, CFErrorRef *a4)
{
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ACFULogging *v14;
  ACFULogging *v15;
  ACFULogging *inited;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  ACFULogging *v23;
  ACFULogging *v24;
  ACFULogging *v25;
  const __CFData *Value;
  ACFULogging *Request;
  ACFULogging *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFIndex v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *__p[2];
  char v62;
  VinylRestoreHost *v63[3];
  __int16 v64;
  _BYTE v65[16];

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: VinylRestoreInfo: %s\n", v9, v10, v11, v12, v13, (char)"VinylRestoreHost");
  v14 = ACFUError::ACFUError((ACFUError *)v65, CFSTR("VinylRestoreInfo"));
  v64 = 0;
  v63[1] = (VinylRestoreHost *)CFSTR("eUICC,ApProductionMode");
  v63[2] = (VinylRestoreHost *)CFSTR("eUICC,ApSecMode");
  v15 = (ACFULogging *)ACFULogging::getLogInstance(v14);
  inited = (ACFULogging *)ACFULogging::initLog(v15, a1, a2, a3);
  v17 = ACFULogging::getLogInstance(inited);
  ACFULogging::handleMessage((uint64_t)v17, 4u, "%s::%s: VinylUpdaterCreateRequest  ACFUInitLog returning %d\n", v18, v19, v20, v21, v22, (char)"VinylRestoreHost");
  if ((_DWORD)inited)
  {
    v36 = ACFULogging::getLogInstance(v23);
    ACFULogging::handleMessage((uint64_t)v36, 2u, "%s::%s: failed to init logging\n", v37, v38, v39, v40, v41, (char)"VinylRestoreHost");
    v42 = (int)inited;
    goto LABEL_11;
  }
  VinylRestoreHost::create(a1, (const __CFDictionary *)CFSTR("VinylRestoreInfo"), v63);
  v25 = v63[0];
  if (!v63[0])
  {
    v43 = ACFULogging::getLogInstance(v24);
    ACFULogging::handleMessage((uint64_t)v43, 2u, "%s::%s: failed to create host object\n", v44, v45, v46, v47, v48, (char)"VinylRestoreHost");
    if (!a4)
    {
LABEL_12:
      v28 = 0;
      goto LABEL_7;
    }
    v42 = 4000;
LABEL_11:
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("VinylRestoreInfo"), v42, 0);
    goto LABEL_12;
  }
  Value = (const __CFData *)CFDictionaryGetValue(a1, CFSTR("FirmwareData"));
  if (!Value)
  {
    v49 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v49, 0, "%s::%s: Invalid or no firmware file present in restore options\n", v50, v51, v52, v53, v54, (char)"VinylRestoreHost");
    goto LABEL_18;
  }
  Request = VinylRestoreHost::createRequest(v25, Value);
  v28 = Request;
  if (!Request)
  {
    v55 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v55, 2u, "%s::%s: failed to create request dict\n", v56, v57, v58, v59, v60, (char)"VinylRestoreHost");
    std::string::basic_string[abi:ne180100]<0>(__p, "VinylUpdaterCreateRequest: failed to create request dict");
    ACFUError::addError((uint64_t)v65, (uint64_t)__p, 0xFA1uLL, 0);
    if (v62 < 0)
      operator delete(__p[0]);
    if (a4)
    {
      v28 = 0;
      *a4 = ACFURestoreHost::getError(v25);
      goto LABEL_6;
    }
LABEL_18:
    v28 = 0;
    goto LABEL_6;
  }
  v29 = ACFULogging::getLogInstance(Request);
  ACFULogging::handleMessage((uint64_t)v29, 4u, "%s::%s: leaving: VinylRestoreInfo: %s\n", v30, v31, v32, v33, v34, (char)"VinylRestoreHost");
LABEL_6:
  (*(void (**)(ACFULogging *))(*(_QWORD *)v25 + 24))(v25);
LABEL_7:
  ACFUError::~ACFUError((ACFUError *)v65);
  return v28;
}

void sub_20D0E74E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;
  uint64_t v18;

  if (a17 < 0)
    operator delete(__p);
  (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
  ACFUError::~ACFUError((ACFUError *)(v18 - 64));
  _Unwind_Resume(a1);
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
  JUMPOUT(0x212B9C7ECLL);
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

VinylFirmware *VinylGoldFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ACFULogging *v14;
  void *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  VinylFirmware *v20;
  ACFULogging *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void **v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  std::string v37;
  std::string v38;
  void *__p[2];
  std::string::size_type v40;

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  v15 = ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylFirmware");
  v16 = std::string::append(&v37, "::");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v38, "VinylGoldFirmwareCreate");
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v40 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v15, (uint64_t *)__p, 0, (uint64_t)"fwZipData: ", (uint64_t)a1);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  v20 = (VinylFirmware *)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v20, (uint64_t)CFSTR("/update/gold/firmware.der"), (uint64_t)CFSTR("/update/gold/info.plist"), (uint64_t)CFSTR("/update/gold/profile.bin"), off_24C5FF270);
  v21 = (ACFULogging *)VinylFirmware::setFwInfo(v20, a1, a2, a3);
  if ((_DWORD)v21)
  {
    v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: setFwInfo failed delete vinylFirmware object\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    VinylFirmware::~VinylFirmware(v20);
    operator delete(v28);
    v20 = 0;
  }
  v29 = VinylFirmware::setRecoveryFwInfo(v20, a1, a2, a3, 0, a4);
  v30 = ACFULogging::getLogInstance((ACFULogging *)v29);
  ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: leaving: %s\n", v31, v32, v33, v34, v35, (char)"VinylFirmware");
  return v20;
}

void sub_20D0E77E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;

  operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t VinylFirmware::setFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ACFULogging *v14;
  __CFString *FWSrcPath;
  __CFString *v16;
  const void **v17;
  uint64_t (*v18)(uint64_t);
  const __CFData *FileDataFromZip;
  __CFError *v20;
  const void **v21;
  uint64_t (*v22)(uint64_t);
  VinylFirmware *v23;
  CFTypeRef v24;
  const __CFAllocator *v25;
  CFMutableDataRef MutableCopy;
  ACFULogging *Im4p;
  uint64_t v28;
  const __CFData *v29;
  const void **v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFErrorRef error[2];
  CFDataRef theData;
  __CFString *v47;
  const void *v48;

  v48 = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  theData = 0;
  v47 = 0;
  *((_QWORD *)this + 15) = 0;
  if (!a2 || !a3 || !a4)
  {
    v32 = ACFULogging::getLogInstance(v14);
    v38 = "%s::%s: invalid params passed\n";
    goto LABEL_26;
  }
  FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v14, a3, a4);
  v16 = v47;
  v47 = FWSrcPath;
  error[0] = (CFErrorRef)v16;
  v17 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)error);
  v18 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v47)
    v18 = 0;
  if (!v18)
  {
    v32 = ACFULogging::getLogInstance((ACFULogging *)v17);
    v38 = "%s::%s: Get FW source path failed\n";
    goto LABEL_26;
  }
  FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v17, a2, v47, *((const __CFString **)this + 12));
  v20 = theData;
  theData = FileDataFromZip;
  error[0] = v20;
  v21 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)error);
  v22 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!theData)
    v22 = 0;
  if (!v22 || !theData)
  {
    v32 = ACFULogging::getLogInstance((ACFULogging *)v21);
    v38 = "%s::%s: Get FW Data from Zip failed\n";
LABEL_26:
    ACFULogging::handleMessage((uint64_t)v32, 2u, v38, v33, v34, v35, v36, v37, (char)"VinylFirmware");
    v28 = 99;
    goto LABEL_17;
  }
  v23 = (VinylFirmware *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v21, a2, v47, *((const __CFString **)this + 13));
  *((_QWORD *)this + 18) = v23;
  if (!v23)
  {
    v32 = ACFULogging::getLogInstance(0);
    v38 = "%s::%s: Get InfoPlist Data from Zip failed\n";
    goto LABEL_26;
  }
  v24 = VinylFirmware::getFileDataFromZip(v23, a2, v47, *((const __CFString **)this + 14));
  *((_QWORD *)this + 19) = v24;
  if (!v24)
  {
    v32 = ACFULogging::getLogInstance(0);
    v38 = "%s::%s: Get Profile Data from Zip failed\n";
    goto LABEL_26;
  }
  v25 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theData);
  *((_QWORD *)this + 15) = MutableCopy;
  if (!MutableCopy)
  {
    v32 = ACFULogging::getLogInstance(0);
    v38 = "%s::%s: Create FwData copy failed\n";
    goto LABEL_26;
  }
  Im4p = (ACFULogging *)VinylFirmware::createIm4p(this, a2, (uint64_t *)this + 2, (uint64_t *)this + 17);
  v28 = (uint64_t)Im4p;
  if ((_DWORD)Im4p)
  {
    v39 = ACFULogging::getLogInstance(Im4p);
    ACFULogging::handleMessage((uint64_t)v39, 2u, "%s::%s: error getting properlylist\n", v40, v41, v42, v43, v44, (char)"VinylFirmware");
    goto LABEL_17;
  }
  v29 = (const __CFData *)*((_QWORD *)this + 18);
  error[0] = 0;
  error[1] = (CFErrorRef)&v48;
  *((_QWORD *)this + 21) = CFPropertyListCreateWithData(v25, v29, 0, 0, error);
  v30 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)error);
  if (!*((_QWORD *)this + 21))
  {
    v32 = ACFULogging::getLogInstance((ACFULogging *)v30);
    v38 = "%s::%s: error getting properlylist\n";
    goto LABEL_26;
  }
  v28 = 0;
LABEL_17:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&theData);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v47);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v48);
  return v28;
}

void sub_20D0E7A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
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
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va3);
  _Unwind_Resume(a1);
}

const void **VinylFirmware::setRecoveryFwInfo(VinylFirmware *this, const __CFData *a2, const __CFData *a3, const __CFData *a4, unsigned int a5, const __CFData *a6)
{
  void *LogInstance;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ACFULogging *v15;
  ACFULogging *FwMac;
  const __CFData *v17;
  void *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  ACFULogging *v23;
  void *v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  __int128 v28;
  const UInt8 *BytePtr;
  const UInt8 *v30;
  CFIndex Length;
  const __CFData *v32;
  size_t v33;
  ACFULogging *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  VinylFirmware *v42;
  __CFString *FWSrcPath;
  uint64_t (*v44)(uint64_t);
  uint64_t (*v45)(uint64_t);
  const std::string::value_type *v46;
  char *v47;
  ACFULogging *v48;
  char *v49;
  uint64_t v50;
  const __CFAllocator *v51;
  const char *v52;
  const std::string::value_type *v53;
  ACFULogging *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CFStringRef v61;
  const __CFString *v62;
  const void **v63;
  uint64_t (*v64)(uint64_t);
  void *v65;
  std::string *v66;
  __int128 v67;
  std::string *v68;
  __int128 v69;
  ACFULogging *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CFStringRef v77;
  const __CFString *v78;
  const void **v79;
  void *v81;
  std::string *v82;
  __int128 v83;
  std::string *v84;
  __int128 v85;
  VinylFirmware *v86;
  const __CFData *FileDataFromZip;
  CFDataRef v88;
  const void **v89;
  const __CFData *v90;
  CFDataRef v91;
  uint64_t (*v92)(uint64_t);
  uint64_t (*v93)(uint64_t);
  const std::string::value_type *v94;
  const std::string::value_type *v95;
  int v96;
  const char *v97;
  uint64_t (*v98)(uint64_t);
  const __CFAllocator *v99;
  const void **v100;
  const __CFData *v101;
  const UInt8 *v102;
  const UInt8 *v103;
  CFIndex v104;
  size_t v105;
  CFMutableDataRef MutableCopy;
  void *v107;
  std::string *v108;
  __int128 v109;
  std::string *v110;
  __int128 v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  __CFString *v151;
  std::string v152;
  std::string v153;
  void *__p[2];
  std::string::size_type v155;
  CFDataRef data;
  CFDataRef v157;
  const __CFString *v158;
  const __CFString *v159;
  const void *v160;
  char v161[16];
  char v162[16];
  char v163[16];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v159 = 0;
  v160 = 0;
  v158 = 0;
  data = 0;
  v157 = 0;
  *((_QWORD *)this + 16) = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 0, "%s::%s: entering: %s\n", v10, v11, v12, v13, v14, (char)"VinylFirmware");
  if (!a2 || !a3 || !a4 || !a6)
  {
    v126 = ACFULogging::getLogInstance(v15);
    v132 = "%s::%s: invalid params passed\n";
LABEL_89:
    ACFULogging::handleMessage((uint64_t)v126, 2u, v132, v127, v128, v129, v130, v131, (char)"VinylFirmware");
    goto LABEL_81;
  }
  FwMac = (ACFULogging *)VinylFirmware::getFwMac(v15, *((CFDictionaryRef *)this + 21));
  v17 = FwMac;
  if (!FwMac)
  {
    v126 = ACFULogging::getLogInstance(0);
    v132 = "%s::%s: Failed getting FW MAC\n";
    goto LABEL_89;
  }
  v18 = ACFULogging::getLogInstance(FwMac);
  std::string::basic_string[abi:ne180100]<0>(&v152, "VinylFirmware");
  v19 = std::string::append(&v152, "::");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v153.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v153.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  v21 = std::string::append(&v153, "setRecoveryFwInfo");
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v155 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v18, (uint64_t *)__p, 0, (uint64_t)"fwMac : ", (uint64_t)v17);
  if (SHIBYTE(v155) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v153.__r_.__value_.__l.__data_);
  if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v152.__r_.__value_.__l.__data_);
  v24 = ACFULogging::getLogInstance(v23);
  std::string::basic_string[abi:ne180100]<0>(&v152, "VinylFirmware");
  v25 = std::string::append(&v152, "::");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v153.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v153.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = std::string::append(&v153, "setRecoveryFwInfo");
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v155 = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v24, (uint64_t *)__p, 0, (uint64_t)"mac : ", (uint64_t)a6);
  if (SHIBYTE(v155) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v153.__r_.__value_.__l.__data_);
  if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v152.__r_.__value_.__l.__data_);
  BytePtr = CFDataGetBytePtr(v17);
  v30 = CFDataGetBytePtr(a6);
  Length = CFDataGetLength(v17);
  if (Length >= CFDataGetLength(a6))
    v32 = a6;
  else
    v32 = v17;
  v33 = CFDataGetLength(v32);
  v34 = (ACFULogging *)memcmp(BytePtr, v30, v33);
  v35 = (int)v34;
  v36 = ACFULogging::getLogInstance(v34);
  v145 = a5;
  ACFULogging::handleMessage((uint64_t)v36, 0, "%s::%s: SM::Recovery -- normal? %d macMatchRequired %d\n", v37, v38, v39, v40, v41, (char)"VinylFirmware");
  if (v35)
  {
    if ((a5 & 1) == 0)
    {
      strcpy(v163, "/recovery/gold-");
      strcpy(v162, "/firmware.der");
      strcpy(v161, "/info.plist");
      FWSrcPath = (__CFString *)VinylFirmware::getFWSrcPath(v42, a3, a4);
      v151 = FWSrcPath;
      v44 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      if (FWSrcPath)
        v45 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      else
        v45 = 0;
      v46 = "setRecoveryFwInfo";
      if (v45)
      {
        v47 = (char *)malloc(0x22uLL);
        v48 = (ACFULogging *)malloc(0x20uLL);
        v49 = (char *)v48;
        if (v47 && v48)
        {
          v50 = 0;
          v51 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v52 = "%s%03d%s";
          v53 = "::";
          v146 = (char *)v48;
          v147 = v47;
          while (1)
          {
            v54 = (ACFULogging *)snprintf(v47, 0x22uLL, v52, v163, v50, v162, v145);
            v47[33] = 0;
            v55 = ACFULogging::getLogInstance(v54);
            ACFULogging::handleMessage((uint64_t)v55, 0, "%s::%s: fwFileName %s\n", v56, v57, v58, v59, v60, (char)"VinylFirmware");
            v61 = CFStringCreateWithCString(v51, v47, 0x8000100u);
            v62 = v159;
            v159 = v61;
            __p[0] = (void *)v62;
            v63 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            if (v159)
              v64 = v44;
            else
              v64 = 0;
            if (!v64)
            {
              v119 = ACFULogging::getLogInstance((ACFULogging *)v63);
              v125 = "%s::%s: Failed to alloc create fwFilePath CFString\n";
              goto LABEL_84;
            }
            v65 = ACFULogging::getLogInstance((ACFULogging *)v63);
            std::string::basic_string[abi:ne180100]<0>(&v152, "VinylFirmware");
            v66 = std::string::append(&v152, v53);
            v67 = *(_OWORD *)&v66->__r_.__value_.__l.__data_;
            v153.__r_.__value_.__r.__words[2] = v66->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v153.__r_.__value_.__l.__data_ = v67;
            v66->__r_.__value_.__l.__size_ = 0;
            v66->__r_.__value_.__r.__words[2] = 0;
            v66->__r_.__value_.__r.__words[0] = 0;
            v68 = std::string::append(&v153, v46);
            v69 = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
            v155 = v68->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v69;
            v68->__r_.__value_.__l.__size_ = 0;
            v68->__r_.__value_.__r.__words[2] = 0;
            v68->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType((uint64_t)v65, (uint64_t *)__p, 0, (uint64_t)"fwFilePath : ", (uint64_t)v159);
            if (SHIBYTE(v155) < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v153.__r_.__value_.__l.__data_);
            if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v152.__r_.__value_.__l.__data_);
            v70 = (ACFULogging *)snprintf(v49, 0x20uLL, v52, v163, v50, v161);
            v49[31] = 0;
            v71 = ACFULogging::getLogInstance(v70);
            ACFULogging::handleMessage((uint64_t)v71, 0, "%s::%s: plistFileName %s\n", v72, v73, v74, v75, v76, (char)"VinylFirmware");
            v77 = CFStringCreateWithCString(v51, v49, 0x8000100u);
            v78 = v158;
            v158 = v77;
            __p[0] = (void *)v78;
            v79 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            if (!(v158 ? v44 : 0))
              break;
            v81 = ACFULogging::getLogInstance((ACFULogging *)v79);
            std::string::basic_string[abi:ne180100]<0>(&v152, "VinylFirmware");
            v82 = std::string::append(&v152, v53);
            v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
            v153.__r_.__value_.__r.__words[2] = v82->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v153.__r_.__value_.__l.__data_ = v83;
            v82->__r_.__value_.__l.__size_ = 0;
            v82->__r_.__value_.__r.__words[2] = 0;
            v82->__r_.__value_.__r.__words[0] = 0;
            v84 = std::string::append(&v153, v46);
            v85 = *(_OWORD *)&v84->__r_.__value_.__l.__data_;
            v155 = v84->__r_.__value_.__r.__words[2];
            *(_OWORD *)__p = v85;
            v84->__r_.__value_.__l.__size_ = 0;
            v84->__r_.__value_.__r.__words[2] = 0;
            v84->__r_.__value_.__r.__words[0] = 0;
            ACFULogging::handleMessageCFType((uint64_t)v81, (uint64_t *)__p, 0, (uint64_t)"plistFilePath : ", (uint64_t)v158);
            if (SHIBYTE(v155) < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v153.__r_.__value_.__l.__data_);
            if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v152.__r_.__value_.__l.__data_);
            FileDataFromZip = (const __CFData *)VinylFirmware::getFileDataFromZip(v86, a2, v151, v159);
            v88 = v157;
            v157 = FileDataFromZip;
            __p[0] = v88;
            v89 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            v90 = (const __CFData *)VinylFirmware::getFileDataFromZip((VinylFirmware *)v89, a2, v151, v158);
            v91 = data;
            data = v90;
            __p[0] = v91;
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
            v92 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            if (!v157)
              v92 = 0;
            if (!v92)
              goto LABEL_67;
            v93 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
            if (!data)
              v93 = 0;
            if (!v93 || !v157 || !data)
              goto LABEL_67;
            v94 = v46;
            v95 = v53;
            v96 = v50;
            v97 = v52;
            v98 = v44;
            __p[0] = 0;
            __p[1] = &v160;
            v99 = v51;
            v153.__r_.__value_.__r.__words[0] = (std::string::size_type)CFPropertyListCreateWithData(v51, data, 0, 0, (CFErrorRef *)__p);
            v100 = ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy((const void **)__p);
            v101 = (const __CFData *)VinylFirmware::getFwMac((VinylFirmware *)v100, (CFDictionaryRef)v153.__r_.__value_.__l.__data_);
            v102 = CFDataGetBytePtr(v101);
            v103 = CFDataGetBytePtr(a6);
            v104 = CFDataGetLength(v101);
            if (v104 >= CFDataGetLength(a6))
              v105 = CFDataGetLength(a6);
            else
              v105 = CFDataGetLength(v101);
            v51 = v99;
            if (!memcmp(v102, v103, v105))
            {
              MutableCopy = CFDataCreateMutableCopy(v99, 0, v157);
              v49 = v146;
              *((_QWORD *)this + 16) = MutableCopy;
              ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v153.__r_.__value_.__l.__data_);
              v47 = v147;
LABEL_67:
              v42 = (VinylFirmware *)ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v151);
              goto LABEL_68;
            }
            v44 = v98;
            v52 = v97;
            ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v153.__r_.__value_.__l.__data_);
            v50 = (v96 + 1);
            v49 = v146;
            v47 = v147;
            v53 = v95;
            v46 = v94;
            if ((_DWORD)v50 == 1000)
              goto LABEL_67;
          }
          v119 = ACFULogging::getLogInstance((ACFULogging *)v79);
          v125 = "%s::%s: Failed to alloc create plistFilePath CFString\n";
LABEL_84:
          ACFULogging::handleMessage((uint64_t)v119, 2u, v125, v120, v121, v122, v123, v124, (char)"VinylFirmware");
        }
        else
        {
          v139 = ACFULogging::getLogInstance(v48);
          ACFULogging::handleMessage((uint64_t)v139, 2u, "%s::%s: Failed to alloc memory for filename\n", v140, v141, v142, v143, v144, (char)"VinylFirmware");
        }
      }
      else
      {
        v133 = ACFULogging::getLogInstance((ACFULogging *)FWSrcPath);
        ACFULogging::handleMessage((uint64_t)v133, 2u, "%s::%s: Get FW source path failed\n", v134, v135, v136, v137, v138, (char)"VinylFirmware");
        v49 = 0;
        v47 = 0;
      }
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v151);
      if (!v47)
        goto LABEL_79;
      goto LABEL_78;
    }
  }
  else
  {
    *((_QWORD *)this + 16) = *((_QWORD *)this + 15);
    v42 = (VinylFirmware *)AMSupportSafeRetain();
  }
  v49 = 0;
  v47 = 0;
LABEL_68:
  if (!*((_QWORD *)this + 16))
  {
    v112 = ACFULogging::getLogInstance(v42);
    ACFULogging::handleMessage((uint64_t)v112, 0, "%s::%s: Recovery Fw is not available\n", v113, v114, v115, v116, v117, (char)"VinylFirmware");
    goto LABEL_77;
  }
  v107 = ACFULogging::getLogInstance(v42);
  std::string::basic_string[abi:ne180100]<0>(&v152, "VinylFirmware");
  v108 = std::string::append(&v152, "::");
  v109 = *(_OWORD *)&v108->__r_.__value_.__l.__data_;
  v153.__r_.__value_.__r.__words[2] = v108->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v153.__r_.__value_.__l.__data_ = v109;
  v108->__r_.__value_.__l.__size_ = 0;
  v108->__r_.__value_.__r.__words[2] = 0;
  v108->__r_.__value_.__r.__words[0] = 0;
  v110 = std::string::append(&v153, "setRecoveryFwInfo");
  v111 = *(_OWORD *)&v110->__r_.__value_.__l.__data_;
  v155 = v110->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v111;
  v110->__r_.__value_.__l.__size_ = 0;
  v110->__r_.__value_.__r.__words[2] = 0;
  v110->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v107, (uint64_t *)__p, 0, (uint64_t)"recoveryFwData : ", *((_QWORD *)this + 16));
  if (SHIBYTE(v155) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v153.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v152.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_77:
    if (!v47)
      goto LABEL_79;
    goto LABEL_78;
  }
  operator delete(v152.__r_.__value_.__l.__data_);
  if (v47)
LABEL_78:
    free(v47);
LABEL_79:
  if (v49)
    free(v49);
LABEL_81:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&data);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v157);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v158);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&v159);
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v160);
}

void sub_20D0E8460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, const void *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,const void *a39,const void *a40)
{
  uint64_t v40;

  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a19);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a39);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a40);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v40 - 168));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v40 - 160));
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)(v40 - 152));
  _Unwind_Resume(a1);
}

VinylFirmware *VinylMainFirmwareCreate(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4)
{
  void *LogInstance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ACFULogging *v14;
  void *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  VinylFirmware *v20;
  ACFULogging *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void **v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  std::string v37;
  std::string v38;
  void *__p[2];
  std::string::size_type v40;

  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
  v15 = ACFULogging::getLogInstance(v14);
  std::string::basic_string[abi:ne180100]<0>(&v37, "VinylFirmware");
  v16 = std::string::append(&v37, "::");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v38, "VinylMainFirmwareCreate");
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v40 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v15, (uint64_t *)__p, 0, (uint64_t)"fwZipData: ", (uint64_t)a1);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  v20 = (VinylFirmware *)operator new(0xC0uLL);
  VinylFirmware::VinylFirmware((uint64_t)v20, (uint64_t)CFSTR("/update/main/firmware.der"), (uint64_t)CFSTR("/update/main/info.plist"), (uint64_t)CFSTR("/update/main/profile.bin"), off_24C5FF210);
  v21 = (ACFULogging *)VinylFirmware::setFwInfo(v20, a1, a2, a3);
  if ((_DWORD)v21)
  {
    v22 = ACFULogging::getLogInstance(v21);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: setFwInfo failed delete vinylFirmware object\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    VinylFirmware::~VinylFirmware(v20);
    operator delete(v28);
    v20 = 0;
  }
  v29 = VinylFirmware::setRecoveryFwInfo(v20, a1, a2, a3, 1u, a4);
  v30 = ACFULogging::getLogInstance((ACFULogging *)v29);
  ACFULogging::handleMessage((uint64_t)v30, 4u, "%s::%s: leaving: %s\n", v31, v32, v33, v34, v35, (char)"VinylFirmware");
  return v20;
}

void sub_20D0E8780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;

  operator delete(v30);
  _Unwind_Resume(a1);
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

void VinylFirmware::~VinylFirmware(VinylFirmware *this)
{
  void *LogInstance;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  void *v17;

  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: VinylFirmware destructor called\n", v3, v4, v5, v6, v7, (char)"VinylFirmware");
  v8 = (const void *)*((_QWORD *)this + 12);
  if (v8)
  {
    CFRelease(v8);
    *((_QWORD *)this + 12) = 0;
  }
  v9 = (const void *)*((_QWORD *)this + 13);
  if (v9)
  {
    CFRelease(v9);
    *((_QWORD *)this + 13) = 0;
  }
  v10 = (const void *)*((_QWORD *)this + 14);
  if (v10)
  {
    CFRelease(v10);
    *((_QWORD *)this + 14) = 0;
  }
  v11 = (const void *)*((_QWORD *)this + 15);
  if (v11)
  {
    CFRelease(v11);
    *((_QWORD *)this + 15) = 0;
  }
  v12 = (const void *)*((_QWORD *)this + 16);
  if (v12)
  {
    CFRelease(v12);
    *((_QWORD *)this + 16) = 0;
  }
  v13 = (const void *)*((_QWORD *)this + 17);
  if (v13)
  {
    CFRelease(v13);
    *((_QWORD *)this + 17) = 0;
  }
  v14 = (const void *)*((_QWORD *)this + 18);
  if (v14)
  {
    CFRelease(v14);
    *((_QWORD *)this + 18) = 0;
  }
  v15 = (const void *)*((_QWORD *)this + 19);
  if (v15)
  {
    CFRelease(v15);
    *((_QWORD *)this + 19) = 0;
  }
  v16 = (const void *)*((_QWORD *)this + 21);
  if (v16)
  {
    CFRelease(v16);
    *((_QWORD *)this + 21) = 0;
  }
  v17 = (void *)*((_QWORD *)this + 23);
  if (v17)
  {
    dlclose(v17);
    *((_QWORD *)this + 23) = 0;
  }
}

ACFULogging *VinylFirmware::getFWSrcPath(VinylFirmware *this, const __CFData *a2, const __CFData *a3)
{
  ACFULogging *v5;
  char *v6;
  ACFULogging *MutableCopy;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  const UInt8 *BytePtr;
  CFIndex Length;
  ACFULogging *v21;
  void *v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  ACFULogging *v27;
  ACFULogging *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  __int128 v39;
  UInt8 *v40;
  size_t v41;
  char *v42;
  int v43;
  ACFULogging *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  ACFULogging *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  std::string *v59;
  __int128 v60;
  std::string *v61;
  __int128 v62;
  void *LogInstance;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  std::string v82;
  std::string v83;
  void *__p[2];
  std::string::size_type v85;
  UInt8 bytes[32];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v5 = (ACFULogging *)malloc(0x41uLL);
  if (!v5)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: srcPath memory alloc failed\n", v65, v66, v67, v68, v69, (char)"VinylFirmware");
    return 0;
  }
  v6 = (char *)v5;
  if (!a2 || !a3)
  {
    v70 = ACFULogging::getLogInstance(v5);
    ACFULogging::handleMessage((uint64_t)v70, 2u, "%s::%s: invalid params passed\n", v71, v72, v73, v74, v75, (char)"VinylFirmware");
LABEL_41:
    v51 = 0;
    goto LABEL_36;
  }
  MutableCopy = CFDataCreateMutableCopy(0, 0, a2);
  v8 = ACFULogging::getLogInstance(MutableCopy);
  v14 = (uint64_t)v8;
  if (!MutableCopy)
  {
    ACFULogging::handleMessage((uint64_t)v8, 2u, "%s::%s: certPlusLdrVer memory alloc failed\n", v9, v10, v11, v12, v13, (char)"VinylFirmware");
    goto LABEL_41;
  }
  std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
  v15 = std::string::append(&v82, "::");
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v83.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v17 = std::string::append(&v83, "getFWSrcPath");
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v85 = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v14, (uint64_t *)__p, 4, (uint64_t)"vinylgetFwData certPlusLdrVer just certIdentifier: ", (uint64_t)MutableCopy);
  if (SHIBYTE(v85) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v82.__r_.__value_.__l.__data_);
  BytePtr = CFDataGetBytePtr(a3);
  Length = CFDataGetLength(a3);
  CFDataAppendBytes(MutableCopy, BytePtr, Length - 1);
  v22 = ACFULogging::getLogInstance(v21);
  std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
  v23 = std::string::append(&v82, "::");
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v83.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  v25 = std::string::append(&v83, "getFWSrcPath");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v85 = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v22, (uint64_t *)__p, 0, (uint64_t)"vinylgetFwData certPlusLdrVer: ", (uint64_t)MutableCopy);
  if (SHIBYTE(v85) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v82.__r_.__value_.__l.__data_);
  CFDataGetBytePtr(MutableCopy);
  CFDataGetLength(MutableCopy);
  v27 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v27)
  {
    v76 = ACFULogging::getLogInstance(v27);
    ACFULogging::handleMessage((uint64_t)v76, 0, "%s::%s: AMSupportDigestSha256 failed:\n", v77, v78, v79, v80, v81, (char)"VinylFirmware");
  }
  else
  {
    v28 = CFDataCreate(0, bytes, 32);
    v29 = ACFULogging::getLogInstance(v28);
    v35 = (uint64_t)v29;
    if (v28)
    {
      std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
      v36 = std::string::append(&v82, "::");
      v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      v83.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v37;
      v36->__r_.__value_.__l.__size_ = 0;
      v36->__r_.__value_.__r.__words[2] = 0;
      v36->__r_.__value_.__r.__words[0] = 0;
      v38 = std::string::append(&v83, "getFWSrcPath");
      v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
      v85 = v38->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v39;
      v38->__r_.__value_.__l.__size_ = 0;
      v38->__r_.__value_.__r.__words[2] = 0;
      v38->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType(v35, (uint64_t *)__p, 0, (uint64_t)"digestRef: ", (uint64_t)v28);
      if (SHIBYTE(v85) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v83.__r_.__value_.__l.__data_);
      if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v82.__r_.__value_.__l.__data_);
      v40 = bytes;
      v41 = 65;
      v42 = v6;
      do
      {
        v43 = *v40++;
        v44 = (ACFULogging *)snprintf(v42, v41, "%02x", v43);
        v42 += 2;
        v41 -= 2;
      }
      while (v41 != 1);
      v6[64] = 0;
      v45 = ACFULogging::getLogInstance(v44);
      ACFULogging::handleMessage((uint64_t)v45, 4u, "%s::%s: vinylgetFwData srcPath %s:\n", v46, v47, v48, v49, v50, (char)"VinylFirmware");
      v51 = (ACFULogging *)CFStringCreateWithCString(0, v6, 0x8000100u);
      v52 = ACFULogging::getLogInstance(v51);
      v58 = (uint64_t)v52;
      if (v51)
      {
        std::string::basic_string[abi:ne180100]<0>(&v82, "VinylFirmware");
        v59 = std::string::append(&v82, "::");
        v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
        v83.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v60;
        v59->__r_.__value_.__l.__size_ = 0;
        v59->__r_.__value_.__r.__words[2] = 0;
        v59->__r_.__value_.__r.__words[0] = 0;
        v61 = std::string::append(&v83, "getFWSrcPath");
        v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
        v85 = v61->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v62;
        v61->__r_.__value_.__l.__size_ = 0;
        v61->__r_.__value_.__r.__words[2] = 0;
        v61->__r_.__value_.__r.__words[0] = 0;
        ACFULogging::handleMessageCFType(v58, (uint64_t *)__p, 0, (uint64_t)"vinylgetFwData fwSrcpath: ", (uint64_t)v51);
        if (SHIBYTE(v85) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v83.__r_.__value_.__l.__data_);
        if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v82.__r_.__value_.__l.__data_);
      }
      else
      {
        ACFULogging::handleMessage((uint64_t)v52, 2u, "%s::%s: fwSrcPath memory alloc failed\n", v53, v54, v55, v56, v57, (char)"VinylFirmware");
      }
      CFRelease(v28);
      goto LABEL_35;
    }
    ACFULogging::handleMessage((uint64_t)v29, 2u, "%s::%s: digestRef memory alloc failed\n", v30, v31, v32, v33, v34, (char)"VinylFirmware");
  }
  v51 = 0;
LABEL_35:
  CFRelease(MutableCopy);
LABEL_36:
  free(v6);
  return v51;
}

void sub_20D0E8EAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
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
  void *LogInstance;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  ACFULogging *v12;
  void *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  ACFULogging *Mutable;
  const char *v19;
  __CFString *v20;
  ACFULogging *v21;
  void *v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  ACFULogging *v27;
  ACFULogging *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::string v43;
  std::string v44;
  void *__p[2];
  std::string::size_type v46;
  CFTypeRef v47;

  v47 = 0;
  LogInstance = ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  v8 = std::string::append(&v43, "::");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v44, "getFileDataFromZip");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v46 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip fwSrcPath: ", (uint64_t)a3);
  if (SHIBYTE(v46) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  v13 = ACFULogging::getLogInstance(v12);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  v14 = std::string::append(&v43, "::");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = std::string::append(&v44, "getFileDataFromZip");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v46 = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v13, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip filePath: ", (uint64_t)a4);
  if (SHIBYTE(v46) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  v19 = "%s::%s: invalid params passed\n";
  if (!a2 || !a3 || !a4)
    goto LABEL_28;
  Mutable = (ACFULogging *)CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    v19 = "%s::%s: Unable to allocate memory for fullPath:\n";
LABEL_28:
    v30 = ACFULogging::getLogInstance(Mutable);
    ACFULogging::handleMessage((uint64_t)v30, 2u, v19, v31, v32, v33, v34, v35, (char)"VinylFirmware");
    eUICCFwReaderClose(0);
    return 0;
  }
  v20 = (__CFString *)Mutable;
  CFStringAppend((CFMutableStringRef)Mutable, a3);
  CFStringAppend(v20, a4);
  v22 = ACFULogging::getLogInstance(v21);
  std::string::basic_string[abi:ne180100]<0>(&v43, "VinylFirmware");
  v23 = std::string::append(&v43, "::");
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  v25 = std::string::append(&v44, "getFileDataFromZip");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v46 = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v22, (uint64_t *)__p, 4, (uint64_t)"getFileDataFromZip fullPath: ", (uint64_t)v20);
  if (SHIBYTE(v46) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  v27 = (ACFULogging *)eUICCFwReaderOpen(a2);
  v28 = v27;
  if (!v27)
  {
    v36 = "%s::%s: Unable to unzip the fwdata:\n";
LABEL_31:
    v37 = ACFULogging::getLogInstance(v27);
    ACFULogging::handleMessage((uint64_t)v37, 2u, v36, v38, v39, v40, v41, v42, (char)"VinylFirmware");
    goto LABEL_25;
  }
  v27 = eUICCFwReaderFindAndCopyFileData(v27, v20, &v47);
  if ((_DWORD)v27)
  {
    v36 = "%s::%s: Unable to copy the firmware:\n";
    goto LABEL_31;
  }
LABEL_25:
  eUICCFwReaderClose(v28);
  CFRelease(v20);
  return v47;
}

void sub_20D0E925C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t VinylFirmware::createIm4p(ACFULogging *a1, ACFULogging *a2, uint64_t *a3, uint64_t *a4)
{
  void *LogInstance;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const CFArrayCallBacks *v12;
  CFMutableArrayRef v13;
  CFMutableArrayRef v14;
  const void **v15;
  uint64_t v16;
  const void **v17;
  CFArrayRef v18;
  ACFULogging *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  __int128 v30;
  ACFULogging *v31;
  void *v32;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  __int128 v36;
  ACFULogging *v37;
  void *v38;
  std::string *v39;
  __int128 v40;
  std::string *v41;
  const __CFArray *v42;
  __int128 v43;
  ACFULogging *v44;
  void *v45;
  std::string *v46;
  __int128 v47;
  std::string *v48;
  __int128 v49;
  void *v50;
  std::string *v51;
  __int128 v52;
  std::string *v53;
  __int128 v54;
  void *v55;
  std::string *v56;
  __int128 v57;
  std::string *v58;
  __int128 v59;
  void *v60;
  std::string *v61;
  __int128 v62;
  std::string *v63;
  __int128 v64;
  ACFULogging *Count;
  CFIndex v66;
  ACFULogging *v67;
  ACFULogging *v68;
  uint64_t v69;
  CFDataRef *v70;
  ACFULogging *v71;
  CFDataRef *v72;
  ACFULogging *v73;
  ACFULogging *v74;
  ACFULogging *v75;
  ACFULogging *EncodedBuffer;
  CFDataRef v77;
  ACFULogging *CString;
  void *v79;
  std::string *v80;
  __int128 v81;
  std::string *v82;
  __int128 v83;
  void *v84;
  void *v85;
  char *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  std::string *v94;
  __int128 v95;
  std::string *v96;
  __int128 v97;
  CFArrayRef v98;
  const void *v99;
  const void *v100;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const __CFArray *theArray;
  CFArrayRef Mutable;
  std::string v178;
  std::string v179;
  void *__p[2];
  std::string::size_type v181;
  _QWORD v182[2];
  char v183[5];
  char buffer[5];
  unsigned int v185;
  UInt8 *v186;
  void *values[4];
  CFRange v188;
  CFRange v189;

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  v186 = 0;
  v185 = 0;
  LogInstance = ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v7, v8, v9, v10, v11, (char)"VinylFirmware");
  v12 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v13 = CFArrayCreateMutable(0, 0, v12);
  v14 = v13;
  v15 = 0;
  values[0] = Mutable;
  values[1] = v13;
  v16 = 1;
  if (!a2 || !a3)
    goto LABEL_107;
  v17 = 0;
  if (!a4)
    goto LABEL_87;
  v15 = 0;
  v16 = 2;
  if (!Mutable)
  {
LABEL_107:
    v17 = 0;
    goto LABEL_87;
  }
  v17 = 0;
  if (!v13)
    goto LABEL_87;
  theArray = v13;
  v18 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x24BDBD690]);
  a3[6] = (uint64_t)v18;
  if (!v18)
    goto LABEL_114;
  v182[0] = a1;
  v182[1] = a3;
  v19 = (ACFULogging *)eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderInfoPlistCallback, (uint64_t)v182);
  v16 = (uint64_t)v19;
  if ((_DWORD)v19)
  {
    v120 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v120, 2u, "%s::%s: failed to read zip file\n", v121, v122, v123, v124, v125, (char)"VinylFirmware");
LABEL_114:
    v17 = 0;
    v15 = 0;
LABEL_115:
    v14 = theArray;
    v98 = Mutable;
    goto LABEL_88;
  }
  if (!a3[7])
  {
    v126 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v126, 2u, "%s::%s: Failed to build vinyl info.plist dictionary\n", v127, v128, v129, v130, v131, (char)"VinylFirmware");
LABEL_113:
    v16 = 0;
    goto LABEL_114;
  }
  v16 = eUICCFwReaderStart(a2, (uint64_t (*)(uint64_t, CFStringRef, ACFULogging *))VinylFirmwareReaderCallback, (uint64_t)v182);
  v20 = ACFULogging::getLogInstance((ACFULogging *)v16);
  v26 = (uint64_t)v20;
  if ((_DWORD)v16)
  {
    ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: failed to read zip file\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
    goto LABEL_114;
  }
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v27 = std::string::append(&v178, "::");
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  v29 = std::string::append(&v179, "createIm4p");
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v181 = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v26, (uint64_t *)__p, 0, (uint64_t)"tag4cc : ", *a3);
  if (SHIBYTE(v181) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v179.__r_.__value_.__l.__data_);
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v178.__r_.__value_.__l.__data_);
  v32 = ACFULogging::getLogInstance(v31);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v33 = std::string::append(&v178, "::");
  v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v35 = std::string::append(&v179, "createIm4p");
  v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v181 = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v32, (uint64_t *)__p, 0, (uint64_t)"filename : ", a3[1]);
  if (SHIBYTE(v181) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v179.__r_.__value_.__l.__data_);
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v178.__r_.__value_.__l.__data_);
  v38 = ACFULogging::getLogInstance(v37);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v39 = std::string::append(&v178, "::");
  v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v40;
  v39->__r_.__value_.__l.__size_ = 0;
  v39->__r_.__value_.__r.__words[2] = 0;
  v39->__r_.__value_.__r.__words[0] = 0;
  v41 = std::string::append(&v179, "createIm4p");
  v42 = Mutable;
  v43 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v181 = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v43;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v38, (uint64_t *)__p, 0, (uint64_t)"plist_filename : ", a3[2]);
  if (SHIBYTE(v181) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v179.__r_.__value_.__l.__data_);
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v178.__r_.__value_.__l.__data_);
  if (a3[3])
  {
    v45 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    v46 = std::string::append(&v178, "::");
    v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    v48 = std::string::append(&v179, "createIm4p");
    v42 = Mutable;
    v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
    v181 = v48->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v49;
    v48->__r_.__value_.__l.__size_ = 0;
    v48->__r_.__value_.__r.__words[2] = 0;
    v48->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v45, (uint64_t *)__p, 0, (uint64_t)"data : ", a3[3]);
    if (SHIBYTE(v181) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v179.__r_.__value_.__l.__data_);
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v178.__r_.__value_.__l.__data_);
  }
  if (a3[4])
  {
    v50 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    v51 = std::string::append(&v178, "::");
    v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v52;
    v51->__r_.__value_.__l.__size_ = 0;
    v51->__r_.__value_.__r.__words[2] = 0;
    v51->__r_.__value_.__r.__words[0] = 0;
    v53 = std::string::append(&v179, "createIm4p");
    v42 = Mutable;
    v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
    v181 = v53->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v54;
    v53->__r_.__value_.__l.__size_ = 0;
    v53->__r_.__value_.__r.__words[2] = 0;
    v53->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v50, (uint64_t *)__p, 0, (uint64_t)"certIdToFind : ", a3[4]);
    if (SHIBYTE(v181) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v179.__r_.__value_.__l.__data_);
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v178.__r_.__value_.__l.__data_);
  }
  if (a3[5])
  {
    v55 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    v56 = std::string::append(&v178, "::");
    v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v56->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v57;
    v56->__r_.__value_.__l.__size_ = 0;
    v56->__r_.__value_.__r.__words[2] = 0;
    v56->__r_.__value_.__r.__words[0] = 0;
    v58 = std::string::append(&v179, "createIm4p");
    v42 = Mutable;
    v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
    v181 = v58->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v59;
    v58->__r_.__value_.__l.__size_ = 0;
    v58->__r_.__value_.__r.__words[2] = 0;
    v58->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v55, (uint64_t *)__p, 0, (uint64_t)"tafwLdrVerToFindg4cc : ", a3[5]);
    if (SHIBYTE(v181) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v179.__r_.__value_.__l.__data_);
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v178.__r_.__value_.__l.__data_);
  }
  if (a3[6])
  {
    v60 = ACFULogging::getLogInstance(v44);
    std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
    v61 = std::string::append(&v178, "::");
    v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
    v179.__r_.__value_.__r.__words[2] = v61->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v62;
    v61->__r_.__value_.__l.__size_ = 0;
    v61->__r_.__value_.__r.__words[2] = 0;
    v61->__r_.__value_.__r.__words[0] = 0;
    v63 = std::string::append(&v179, "createIm4p");
    v42 = Mutable;
    v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
    v181 = v63->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v64;
    v63->__r_.__value_.__l.__size_ = 0;
    v63->__r_.__value_.__r.__words[2] = 0;
    v63->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v60, (uint64_t *)__p, 0, (uint64_t)"array : ", a3[6]);
    if (SHIBYTE(v181) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v179.__r_.__value_.__l.__data_);
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v178.__r_.__value_.__l.__data_);
  }
  Count = (ACFULogging *)CFArrayGetCount(v42);
  v66 = (CFIndex)Count;
  if ((uint64_t)Count <= 0)
  {
    v132 = ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage((uint64_t)v132, 2u, "%s::%s: No sources found \n", v133, v134, v135, v136, v137, (char)"VinylFirmware");
    goto LABEL_113;
  }
  v67 = (ACFULogging *)CFArrayGetCount(theArray);
  if ((ACFULogging *)v66 != v67)
  {
    v138 = ACFULogging::getLogInstance(v67);
    ACFULogging::handleMessage((uint64_t)v138, 2u, "%s::%s: Count of certID != hashVad \n", v139, v140, v141, v142, v143, (char)"VinylFirmware");
    goto LABEL_113;
  }
  v17 = (const void **)malloc(8 * v66);
  v68 = (ACFULogging *)malloc(8 * v66);
  v15 = (const void **)v68;
  if (!v17 || !v68)
  {
    v144 = ACFULogging::getLogInstance(v68);
    ACFULogging::handleMessage((uint64_t)v144, 2u, "%s::%s: Memory alloc failed certIds/VadDigest\n", v145, v146, v147, v148, v149, (char)"VinylFirmware");
    v16 = 0;
    goto LABEL_115;
  }
  v188.location = 0;
  v188.length = v66;
  CFArrayGetValues(Mutable, v188, v17);
  v189.location = 0;
  v189.length = v66;
  CFArrayGetValues(theArray, v189, v15);
  DEREncoderCreate();
  DEREncoderCreate();
  v69 = 0;
  do
  {
    DEREncoderCreate();
    v70 = (CFDataRef *)&v17[v69];
    CFDataGetBytePtr(*v70);
    CFDataGetLength(*v70);
    v71 = (ACFULogging *)DEREncoderAddData();
    if ((_DWORD)v71)
    {
      v102 = ACFULogging::getLogInstance(v71);
      ACFULogging::handleMessage((uint64_t)v102, 2u, "%s::%s: failed to add certId\n", v103, v104, v105, v106, v107, (char)"VinylFirmware");
LABEL_105:
      v16 = 0;
LABEL_106:
      v14 = theArray;
      goto LABEL_87;
    }
    v72 = (CFDataRef *)&v15[v69];
    CFDataGetBytePtr(*v72);
    CFDataGetLength(*v72);
    v73 = (ACFULogging *)DEREncoderAddData();
    if ((_DWORD)v73)
    {
      v108 = ACFULogging::getLogInstance(v73);
      ACFULogging::handleMessage((uint64_t)v108, 2u, "%s::%s: failed to add VAD\n", v109, v110, v111, v112, v113, (char)"VinylFirmware");
      goto LABEL_105;
    }
    v74 = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
    if ((_DWORD)v74)
    {
      v114 = ACFULogging::getLogInstance(v74);
      ACFULogging::handleMessage((uint64_t)v114, 2u, "%s::%s: failed to add certId-VAD sequence\n", v115, v116, v117, v118, v119, (char)"VinylFirmware");
      goto LABEL_105;
    }
    DEREncoderDestroy();
    ++v69;
  }
  while (v66 != v69);
  v75 = (ACFULogging *)DEREncoderAddSequenceFromEncoder();
  if ((_DWORD)v75)
  {
    v150 = ACFULogging::getLogInstance(v75);
    ACFULogging::handleMessage((uint64_t)v150, 2u, "%s::%s: failed to add top-level sequence\n", v151, v152, v153, v154, v155, (char)"VinylFirmware");
LABEL_119:
    v16 = 3;
    goto LABEL_106;
  }
  DEREncoderDestroy();
  EncodedBuffer = (ACFULogging *)DEREncoderCreateEncodedBuffer();
  if ((_DWORD)EncodedBuffer)
  {
    v156 = ACFULogging::getLogInstance(EncodedBuffer);
    ACFULogging::handleMessage((uint64_t)v156, 2u, "%s::%s: failed to encode DER buffer\n", v157, v158, v159, v160, v161, (char)"VinylFirmware");
    goto LABEL_119;
  }
  v77 = CFDataCreateWithBytesNoCopy(0, v186, v185, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v77)
  {
    v16 = 2;
    goto LABEL_106;
  }
  if (!CFStringGetCString((CFStringRef)*a3, buffer, 5, 0x8000100u))
    goto LABEL_119;
  CString = (ACFULogging *)CFStringGetCString(CFSTR("1.0"), v183, 5, 0x8000100u);
  if (!(_DWORD)CString)
    goto LABEL_119;
  v79 = ACFULogging::getLogInstance(CString);
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v80 = std::string::append(&v178, "::");
  v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v80->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v81;
  v80->__r_.__value_.__l.__size_ = 0;
  v80->__r_.__value_.__r.__words[2] = 0;
  v80->__r_.__value_.__r.__words[0] = 0;
  v82 = std::string::append(&v179, "createIm4p");
  v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
  v181 = v82->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v83;
  v82->__r_.__value_.__l.__size_ = 0;
  v82->__r_.__value_.__r.__words[2] = 0;
  v82->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v79, (uint64_t *)__p, 0, (uint64_t)"measurementSeq : ", (uint64_t)v77);
  if (SHIBYTE(v181) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v179.__r_.__value_.__l.__data_);
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v178.__r_.__value_.__l.__data_);
  v84 = (void *)*((_QWORD *)a1 + 23);
  if (!v84)
  {
    v162 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v162, 2u, "%s::%s: failed to open libauthinstall dylib\n", v163, v164, v165, v166, v167, (char)"VinylFirmware");
LABEL_123:
    v16 = 99;
    goto LABEL_106;
  }
  v85 = dlsym(v84, "AMAuthInstallApImg4CreatePayload");
  v86 = dlerror();
  if (v86 || !v85)
  {
    v168 = ACFULogging::getLogInstance((ACFULogging *)v86);
    ACFULogging::handleMessage((uint64_t)v168, 2u, "%s::%s: failed to initialize LAI lib create function\n", v169, v170, v171, v172, v173, (char)"VinylFirmware");
    goto LABEL_123;
  }
  v16 = ((uint64_t (*)(char *, char *, CFDataRef, _QWORD, _QWORD, uint64_t *))v85)(buffer, v183, v77, 0, 0, a4);
  v87 = ACFULogging::getLogInstance((ACFULogging *)v16);
  v93 = (uint64_t)v87;
  if ((_DWORD)v16)
  {
    ACFULogging::handleMessage((uint64_t)v87, 0, "%s::%s: failed to create im4p\n", v88, v89, v90, v91, v92, (char)"VinylFirmware");
    goto LABEL_106;
  }
  std::string::basic_string[abi:ne180100]<0>(&v178, "VinylFirmware");
  v94 = std::string::append(&v178, "::");
  v95 = *(_OWORD *)&v94->__r_.__value_.__l.__data_;
  v179.__r_.__value_.__r.__words[2] = v94->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v179.__r_.__value_.__l.__data_ = v95;
  v94->__r_.__value_.__l.__size_ = 0;
  v94->__r_.__value_.__r.__words[2] = 0;
  v94->__r_.__value_.__r.__words[0] = 0;
  v96 = std::string::append(&v179, "createIm4p");
  v97 = *(_OWORD *)&v96->__r_.__value_.__l.__data_;
  v181 = v96->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v97;
  v96->__r_.__value_.__l.__size_ = 0;
  v96->__r_.__value_.__r.__words[2] = 0;
  v96->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType(v93, (uint64_t *)__p, 0, (uint64_t)"outPayload : ", *a4);
  v14 = theArray;
  if (SHIBYTE(v181) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v179.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v179.__r_.__value_.__l.__data_);
  if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v178.__r_.__value_.__l.__data_);
  v16 = 0;
LABEL_87:
  v98 = Mutable;
  if (Mutable)
LABEL_88:
    CFRelease(v98);
  if (v14)
    CFRelease(v14);
  if (v17)
    free(v17);
  if (v15)
    free(v15);
  DEREncoderDestroy();
  DEREncoderDestroy();
  v99 = (const void *)a3[6];
  if (v99)
  {
    CFRelease(v99);
    a3[6] = 0;
  }
  v100 = (const void *)a3[7];
  if (v100)
  {
    CFRelease(v100);
    a3[7] = 0;
  }
  if (v186)
    free(v186);
  return v16;
}

void sub_20D0E9FE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

const void *VinylFirmware::getFwMac(VinylFirmware *this, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  ACFULogging *Length;
  void *LogInstance;
  std::string *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::string v23;
  std::string v24;
  __int128 v25;
  std::string::size_type v26;

  Value = CFDictionaryGetValue(theDict, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac"));
  if (Value)
  {
    TypeID = CFDataGetTypeID();
    Length = (ACFULogging *)CFGetTypeID(Value);
    if ((ACFULogging *)TypeID == Length
      && (Length = (ACFULogging *)CFDataGetLength((CFDataRef)Value), Length == (ACFULogging *)8))
    {
      LogInstance = ACFULogging::getLogInstance((ACFULogging *)8);
      std::string::basic_string[abi:ne180100]<0>(&v23, "VinylFirmware");
      v6 = std::string::append(&v23, "::");
      v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      v24.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v7;
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      v8 = std::string::append(&v24, "getFwMac");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v26 = v8->__r_.__value_.__r.__words[2];
      v25 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)&v25, 0, (uint64_t)"fwMacData: ", (uint64_t)Value);
      if (SHIBYTE(v26) < 0)
        operator delete((void *)v25);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v23.__r_.__value_.__l.__data_);
    }
    else
    {
      v11 = ACFULogging::getLogInstance(Length);
      ACFULogging::handleMessage((uint64_t)v11, 2u, "%s::%s: fwMacData is wrong type\n", v12, v13, v14, v15, v16, (char)"VinylFirmware");
    }
  }
  else
  {
    v17 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v17, 2u, "%s::%s: Missing firmwareMac in info.plist -- firmware too old\n", v18, v19, v20, v21, v22, (char)"VinylFirmware");
  }
  return Value;
}

void sub_20D0EA1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
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
  void *LogInstance;
  std::string *v3;
  __int128 v4;
  std::string *v5;
  __int128 v6;
  ACFULogging *v7;
  void *v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string v14;
  std::string v15;
  __int128 v16;
  std::string::size_type v17;

  LogInstance = ACFULogging::getLogInstance(this);
  std::string::basic_string[abi:ne180100]<0>(&v14, "VinylFirmware");
  v3 = std::string::append(&v14, "::");
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  v5 = std::string::append(&v15, "getRecoveryFwData");
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v17 = v5->__r_.__value_.__r.__words[2];
  v16 = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)LogInstance, (uint64_t *)&v16, 0, (uint64_t)"recoveryFwData : ", *((_QWORD *)this + 16));
  if (SHIBYTE(v17) < 0)
    operator delete((void *)v16);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  v8 = ACFULogging::getLogInstance(v7);
  std::string::basic_string[abi:ne180100]<0>(&v14, "VinylFirmware");
  v9 = std::string::append(&v14, "::");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v15, "getRecoveryFwData");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v17 = v11->__r_.__value_.__r.__words[2];
  v16 = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  ACFULogging::handleMessageCFType((uint64_t)v8, (uint64_t *)&v16, 0, (uint64_t)"fwData : ", *((_QWORD *)this + 15));
  if (SHIBYTE(v17) < 0)
    operator delete((void *)v16);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return *((_QWORD *)this + 16);
}

void sub_20D0EA3E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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

BOOL VinylFirmwareReaderInfoPlistCallback(VinylFirmware *a1, CFStringRef theString, ACFULogging *a3)
{
  void *LogInstance;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
    return VinylFirmware::fwReaderInfoPlistCallback(a1, *((_QWORD **)a1 + 1), theString, a3);
  LogInstance = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: context passed is null\n", v5, v6, v7, v8, v9, (char)"VinylFirmware");
  return 0;
}

uint64_t VinylFirmwareReaderCallback(void *a1, CFStringRef theString, ACFULogging *a3)
{
  void *LogInstance;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
    return VinylFirmware::fwReaderCallback(*(VinylFirmware **)a1, *((void **)a1 + 1), theString, a3);
  LogInstance = ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: context passed is null\n", v5, v6, v7, v8, v9, (char)"VinylFirmware");
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
  void *LogInstance;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (!a2)
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: fullPath is null\n", v11, v12, v13, v14, v15, (char)"VinylFirmware");
    return 0;
  }
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, kCFURLPOSIXPathStyle, 0);
  if (!v3)
  {
    v16 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v16, 2u, "%s::%s: failed to create fullURL\n", v17, v18, v19, v20, v21, (char)"VinylFirmware");
    return 0;
  }
  v4 = v3;
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(v2, v3);
  if (!PathComponent)
  {
    v22 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v22, 2u, "%s::%s: failed to create dirURL\n", v23, v24, v25, v26, v27, (char)"VinylFirmware");
    CFRelease(v4);
    return 0;
  }
  v6 = PathComponent;
  v7 = CFURLGetString(PathComponent);
  Copy = CFStringCreateCopy(v2, v7);
  if (!Copy)
  {
    v28 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v28, 2u, "%s::%s: failed to create dirPath\n", v29, v30, v31, v32, v33, (char)"VinylFirmware");
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
  void *LogInstance;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  Count = (ACFULogging *)CFArrayGetCount(theArray);
  if ((uint64_t)Count <= 0)
  {
    LogInstance = ACFULogging::getLogInstance(Count);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: ldrVers count is zero\n", v14, v15, v16, v17, v18, (char)"VinylFirmware");
    return 1;
  }
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex)
  {
    v19 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v19, 2u, "%s::%s: failed to get ldrVer\n", v20, v21, v22, v23, v24, (char)"VinylFirmware");
    return 1;
  }
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, ValueAtIndex, CFSTR("."));
  if (!ArrayBySeparatingStrings)
  {
    v25 = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)v25, 2u, "%s::%s: ldrVerComponents count is not expected\n", v26, v27, v28, v29, v30, (char)"VinylFirmware");
    return 1;
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
    v31 = ACFULogging::getLogInstance(v7);
    ACFULogging::handleMessage((uint64_t)v31, 2u, "%s::%s: ldrVerComponents count is not expected\n", v32, v33, v34, v35, v36, (char)"VinylFirmware");
    v11 = 1;
  }
  CFRelease(v6);
  return v11;
}

const __CFData *VinylFirmware::fwLdrVerEqual(VinylFirmware *this, CFArrayRef theArray, const UInt8 *a3)
{
  const __CFString *ValueAtIndex;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v7;
  ACFULogging *Count;
  const UInt8 *BytePtr;
  int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  void *LogInstance;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (!theArray || (this = (VinylFirmware *)CFArrayGetCount(theArray), (uint64_t)this <= 0))
  {
    LogInstance = ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: ldrVersStrArray count is zero\n", v15, v16, v17, v18, v19, (char)"VinylFirmware");
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
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          a3 = BytePtr;
          if (!BytePtr)
          {
            v45 = ACFULogging::getLogInstance(0);
            ACFULogging::handleMessage((uint64_t)v45, 2u, "%s::%s: failed to get byte ptr of fwldrver\n", v46, v47, v48, v49, v50, (char)"VinylFirmware");
            goto LABEL_17;
          }
          v10 = *BytePtr;
          v11 = (const __CFString *)CFArrayGetValueAtIndex(v7, 0);
          if (CFStringGetIntValue(v11) == v10)
          {
            v12 = a3[1];
            v13 = (const __CFString *)CFArrayGetValueAtIndex(v7, 1);
            a3 = (const UInt8 *)(CFStringGetIntValue(v13) == v12);
LABEL_17:
            CFRelease(v7);
            return (const __CFData *)a3;
          }
        }
        else
        {
          v38 = ACFULogging::getLogInstance(Count);
          ACFULogging::handleMessage((uint64_t)v38, 2u, "%s::%s: ldrVerComponents count is not expected\n", v39, v40, v41, v42, v43, (char)"VinylFirmware");
        }
        a3 = 0;
        goto LABEL_17;
      }
      v32 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v32, 2u, "%s::%s: ldrVerComponents count is not expected\n", v33, v34, v35, v36, v37, (char)"VinylFirmware");
    }
    else
    {
      v26 = ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to get ldrVer\n", v27, v28, v29, v30, v31, (char)"VinylFirmware");
    }
    return 0;
  }
  v20 = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)v20, 2u, "%s::%s: fwldrver is null\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
  return (const __CFData *)a3;
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
  void *LogInstance;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
    LogInstance = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to find and/or copy data\n", v17, v18, v19, v20, v21, (char)"VinylFirmware");
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
  const UInt8 *v24;
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
  void *LogInstance;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CFTypeRef cf1;
  CFDataRef theData;
  UInt8 bytes[32];
  uint64_t v69;

  v4 = 0;
  v5 = 0;
  v69 = *MEMORY[0x24BDAC8D0];
  cf1 = 0;
  theData = 0;
  if (!a2 || !theString)
  {
    ArrayBySeparatingStrings = 0;
LABEL_57:
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
LABEL_54:
    v5 = 0;
    v4 = 0;
    MutableCopy = 0;
    PathComponent = 0;
    goto LABEL_39;
  }
  v13 = (void *)*((_QWORD *)this + 23);
  if (!v13)
  {
    LogInstance = ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage((uint64_t)LogInstance, 2u, "%s::%s: failed to open libauthinstall dylib\n", v37, v38, v39, v40, v41, (char)"VinylFirmware");
    goto LABEL_54;
  }
  v14 = (uint64_t (*)(_QWORD, const void *, CFTypeRef *))dlsym(v13, "AMAuthInstallSupportCopyDataFromHexString");
  v15 = dlerror();
  if (v15 || !v14)
  {
    v42 = ACFULogging::getLogInstance((ACFULogging *)v15);
    ACFULogging::handleMessage((uint64_t)v42, 2u, "%s::%s: failed to initialize LAI lib create function\n", v43, v44, v45, v46, v47, (char)"VinylFirmware");
    goto LABEL_54;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
  v17 = v14(0, ValueAtIndex, &cf1);
  v4 = 0;
  v5 = 0;
  if (!cf1 || v17)
    goto LABEL_57;
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
    goto LABEL_62;
  v22 = VinylFirmware::checkVinylFwLdrVerLegacy(v21, v21);
  v23 = (const void *)*((_QWORD *)a2 + 4);
  if (!v23)
  {
    v4 = 0;
    MutableCopy = 0;
    goto LABEL_28;
  }
  v24 = (const UInt8 *)*((_QWORD *)a2 + 5);
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
LABEL_62:
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
    v60 = ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage((uint64_t)v60, 2u, "%s::%s: failed to compute digest\n", v61, v62, v63, v64, v65, (char)"VinylFirmware");
    goto LABEL_62;
  }
  v4 = CFDataCreate(0, bytes, 32);
  if (!v4)
    goto LABEL_59;
  if (CFEqual(cf1, v4))
  {
LABEL_27:
    v29 = eUICCFwReaderFindAndCopyFileData(a4, theString, (CFTypeRef *)a2 + 3);
    if ((_DWORD)v29)
    {
LABEL_58:
      v48 = ACFULogging::getLogInstance(v29);
      ACFULogging::handleMessage((uint64_t)v48, 2u, "%s::%s: failed to find and/or copy data\n", v49, v50, v51, v52, v53, (char)"VinylFirmware");
      goto LABEL_59;
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
            v54 = ACFULogging::getLogInstance(v34);
            ACFULogging::handleMessage((uint64_t)v54, 2u, "%s::%s: failed to compute digest\n", v55, v56, v57, v58, v59, (char)"VinylFirmware");
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
          goto LABEL_59;
        }
        goto LABEL_58;
      }
LABEL_59:
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

void VinylFirmware::generateMeasurement(VinylFirmware *this@<X0>, CFDataRef *a2@<X8>)
{
  void *LogInstance;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ACFULogging *v11;
  CFDataRef v12;
  const void **v13;
  void *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  ACFULogging *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  std::string v32;
  std::string v33;
  void *__p[2];
  std::string::size_type v35;
  UInt8 bytes[32];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  LogInstance = ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage((uint64_t)LogInstance, 4u, "%s::%s: entering: %s\n", v6, v7, v8, v9, v10, (char)"VinylFirmware");
  *a2 = 0;
  CFDataGetBytePtr(this);
  CFDataGetLength(this);
  v11 = (ACFULogging *)AMSupportDigestSha256();
  if ((_DWORD)v11)
  {
    v26 = ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage((uint64_t)v26, 2u, "%s::%s: failed to compute digest\n", v27, v28, v29, v30, v31, (char)"VinylFirmware");
  }
  else
  {
    v12 = CFDataCreate(0, bytes, 32);
    *a2 = v12;
    __p[0] = 0;
    v13 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
    v14 = ACFULogging::getLogInstance((ACFULogging *)v13);
    std::string::basic_string[abi:ne180100]<0>(&v32, "VinylFirmware");
    v15 = std::string::append(&v32, "::");
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v33.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v33, "generateMeasurement");
    v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v35 = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType((uint64_t)v14, (uint64_t *)__p, 0, (uint64_t)"digestRef: ", (uint64_t)v12);
    if (SHIBYTE(v35) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v32.__r_.__value_.__l.__data_);
    v20 = ACFULogging::getLogInstance(v19);
    ACFULogging::handleMessage((uint64_t)v20, 4u, "%s::%s: leaving: %s\n", v21, v22, v23, v24, v25, (char)"VinylFirmware");
  }
}

void sub_20D0EB130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  const void **v30;

  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v30);
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
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&v6);
  return a1;
}

void _AMAuthInstallFinalize_cold_1()
{
  __assert_rtn("_AMAuthInstallFinalize", "AMAuthInstall.c", 686, "type != NULL");
}

void _AMAuthInstallCopyFormattingDescription_cold_1()
{
  __assert_rtn("_AMAuthInstallCopyFormattingDescription", "AMAuthInstall.c", 741, "type != NULL");
}

void AMAuthInstallApImg4Stitch_cold_1(uint64_t a1)
{
  int *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __error();
  v3 = OUTLINED_FUNCTION_0(v2);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", a1, v4, v5, v6, v7, v8, v3);
  perror("error:");
}

void AMAuthInstallApImg4Stitch_cold_2()
{
  int *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  v1 = OUTLINED_FUNCTION_0(v0);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", (uint64_t)"failed to write img4 string to dst file: %s", v2, v3, v4, v5, v6, v1);
  perror("error:");
}

void AMAuthInstallApImg4Stitch_cold_3()
{
  int *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  v1 = OUTLINED_FUNCTION_0(v0);
  AMAuthInstallLog(3, (uint64_t)"AMAuthInstallApImg4Stitch", (uint64_t)"failed to write header to dst file: %s", v2, v3, v4, v5, v6, v1);
  perror("error:");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_1()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1364, "item->objectTag != NULL");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_2()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1370, "defaultTag->tag != NULL");
}

void AMAuthInstallApImg4StitchRestoreInfoWithAMAI_cold_3()
{
  __assert_rtn("_AMAuthInstallApImg4CreateDefaultRestoreInfo", "AMAuthInstallApImg4.c", 1371, "defaultTag->copyValue != NULL");
}

void _AMAuthInstallCopyPsiMeasurementAndVersion_cold_1()
{
  __assert_rtn("_AMAuthInstallCopyPsiMeasurementAndVersion", "AMAuthInstallBasebandICE3.c", 135, "outPartialHash != NULL");
}

void _AMAuthInstallCopyPsiMeasurementAndVersion_cold_2()
{
  __assert_rtn("_AMAuthInstallCopyPsiMeasurementAndVersion", "AMAuthInstallBasebandICE3.c", 136, "outVersionStr != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_1()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2393, "entryName != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_2()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2539, "relativePath != NULL");
}

void _AMAuthInstallBundlePopulatePersonalizedBundle_cold_3()
{
  __assert_rtn("_AMAuthInstallBundlePopulatePersonalizedBundle", "AMAuthInstallBundle.c", 2464, "entryName != NULL");
}

void AMAuthInstallBundleSetPropertiesWithBoardConfig_cold_1()
{
  __assert_rtn("AMAuthInstallBundleSetPropertiesWithBoardConfig", "AMAuthInstallBundle.c", 4825, "variant != NULL");
}

void _DefaultLogHandler_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_20D05A000, v0, OS_LOG_TYPE_FAULT, "%{public}s", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _DefaultLogHandler_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20D05A000, v0, OS_LOG_TYPE_ERROR, "%{public}s", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _DefaultLogHandler_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D05A000, v0, v1, "%{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _DefaultLogHandler_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D05A000, v0, v1, "%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _AMAuthInstallPlatformConstantsInitialize_cold_1()
{
  __assert_rtn("_AMAuthInstallPlatformTempDirURLInitialize", "AMAuthInstallPlatform.c", 714, "_tempDirURL != NULL");
}

void _CFDictionarySetInteger64_cold_1()
{
  __assert_rtn("_CFDictionarySetInteger64", "AMAuthInstallSupport.c", 222, "num != NULL");
}

void _CFDictionarySetInteger32_cold_1()
{
  __assert_rtn("_CFDictionarySetInteger32", "AMAuthInstallSupport.c", 233, "num != NULL");
}

void _AMAuthInstallUpdaterFinalize_cold_1()
{
  __assert_rtn("_AMAuthInstallUpdaterFinalize", "AMAuthInstallUpdater.c", 324, "type != NULL");
}

void DERDecoderInitialize_cold_1()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 348, "decoder != NULL");
}

void DERDecoderInitialize_cold_2()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 349, "buffer != NULL");
}

void DERDecoderInitialize_cold_3()
{
  __assert_rtn("DERDecoderInitialize", "DERDecoder.c", 350, "ioBufferLength != NULL");
}

void _DERDecodeTag_cold_1()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 62, "buffer != NULL");
}

void _DERDecodeTag_cold_2()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 63, "outTagClass != NULL");
}

void _DERDecodeTag_cold_3()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 64, "outTag != NULL");
}

void _DERDecodeTag_cold_4()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 65, "outIsConstructed != NULL");
}

void _DERDecodeTag_cold_5()
{
  __assert_rtn("_DERDecodeTag", "DERDecoder.c", 66, "outConsumed != NULL");
}

void _DERDecodeLength_cold_1()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 146, "buffer != NULL");
}

void _DERDecodeLength_cold_2()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 147, "outLength != NULL");
}

void _DERDecodeLength_cold_3()
{
  __assert_rtn("_DERDecodeLength", "DERDecoder.c", 148, "outConsumed != NULL");
}

void DERDecoderGetDataWithTag_cold_1()
{
  __assert_rtn("DERDecoderGetDataWithTag", "DERDecoder.c", 418, "decoder != NULL");
}

void DERDecoderGetDataWithTag_cold_2()
{
  __assert_rtn("DERDecoderGetDataWithTag", "DERDecoder.c", 434, "callbackData.foundItem.data != NULL");
}

void _DERDecoderTraverseAllItems_cold_1()
{
  __assert_rtn("_DERDecoderTraverseAllItems", "DERDecoder.c", 223, "decoder != NULL");
}

void _DERDecoderTraverseAllItems_cold_2()
{
  __assert_rtn("_DERDecoderTraverseAllItems", "DERDecoder.c", 251, "nconsumed > 0");
}

void _DERDecoderTraverseAllItems_cold_3()
{
  __assert_rtn("_DERDecoderTraverseAllItems", "DERDecoder.c", 268, "nconsumed > 0");
}

void DERDecoderGetEncodingWithTag_cold_1()
{
  __assert_rtn("DERDecoderGetEncodingWithTag", "DERDecoder.c", 468, "decoder != NULL");
}

void DERDecoderGetEncodingWithTag_cold_2()
{
  __assert_rtn("DERDecoderGetEncodingWithTag", "DERDecoder.c", 484, "callbackData.foundItem.buffer != NULL");
}

void _FlsParserFinalize()
{
  __assert_rtn("_FlsParserFinalize", "FlsParser.cpp", 125, "type != NULL");
}

void _FlsParserCopyFormattingDescription()
{
  __assert_rtn("_FlsParserCopyFormattingDescription", "FlsParser.cpp", 143, "type != NULL");
}

void _FlsParserCopyDebugDescription()
{
  __assert_rtn("_FlsParserCopyDebugDescription", "FlsParser.cpp", 159, "type != NULL");
}

uint64_t AMSupportCFDictionaryGetBoolean()
{
  return MEMORY[0x24BED9F48]();
}

uint64_t AMSupportCFDictionarySetBoolean()
{
  return MEMORY[0x24BED9F50]();
}

uint64_t AMSupportCFDictionarySetInteger32()
{
  return MEMORY[0x24BED9F58]();
}

uint64_t AMSupportCopyDataFromAsciiEncodedHex()
{
  return MEMORY[0x24BED9F68]();
}

uint64_t AMSupportCopyURLWithAppendedComponent()
{
  return MEMORY[0x24BED9F98]();
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x24BED9FA8]();
}

uint64_t AMSupportCreateDigest()
{
  return MEMORY[0x24BED9FB8]();
}

uint64_t AMSupportCreateErrorInternal()
{
  return MEMORY[0x24BED9FC0]();
}

uint64_t AMSupportCreateMergedDictionary()
{
  return MEMORY[0x24BED9FC8]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x24BED9FD8]();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x24BED9FF0]();
}

uint64_t AMSupportFileURLExists()
{
  return MEMORY[0x24BEDA020]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x24BEDA030]();
}

uint64_t AMSupportHttpSendSync()
{
  return MEMORY[0x24BEDA040]();
}

uint64_t AMSupportLogInternal()
{
  return MEMORY[0x24BEDA060]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x24BEDA070]();
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent()
{
  return MEMORY[0x24BEDA078]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x24BEDA080]();
}

uint64_t AMSupportRemoveFile()
{
  return MEMORY[0x24BEDA098]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x24BEDA0D8]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x24BEDA0E0]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x24BEDA0E8]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x24BEDA0F0]();
}

uint64_t AMSupportWriteDictionarytoFileURL()
{
  return MEMORY[0x24BEDA0F8]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC378](data, *(_QWORD *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC398](data, *(_QWORD *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB798](allocator, context);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
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

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
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

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x24BDBBCC8](theData, range.location, range.length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
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

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x24BDBBD18](theData, range.location, range.length, newBytes, newLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
  MEMORY[0x24BDB7308](message, bodyData);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x24BDBC0B8](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x24BDBC0C0](allocator, formatter, string, rangep, options);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1D8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x24BDBC1F8](allocator, propertyList);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x24BDBC518](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
  MEMORY[0x24BDBC6D8](theString, padString, length, indexIntoPad);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E0](theString, range.location, range.length, replacement);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7C0](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7D8](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x24BDBC800](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC810](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x24BDBC8B8](anURL);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC940](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x24BEDA110]();
}

uint64_t DEREncoderAddDataFromEncoderNoCopy()
{
  return MEMORY[0x24BEDA120]();
}

uint64_t DEREncoderAddDataNoCopy()
{
  return MEMORY[0x24BEDA128]();
}

uint64_t DEREncoderAddPrivateFromEncoder()
{
  return MEMORY[0x24BEDA130]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x24BEDA138]();
}

uint64_t DEREncoderAddSetFromEncoder()
{
  return MEMORY[0x24BEDA140]();
}

uint64_t DEREncoderAddUInt32()
{
  return MEMORY[0x24BEDA148]();
}

uint64_t DEREncoderAddUInt64()
{
  return MEMORY[0x24BEDA150]();
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

uint64_t DeviceIdentityCreateClientCertificateRequest()
{
  return MEMORY[0x24BE2C368]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
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

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
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
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF70]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
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

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB390](__str, __idx, *(_QWORD *)&__base);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB628](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_24C5FB728(__p);
}

void operator delete(void *__p)
{
  off_24C5FB730(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24C5FB738(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C5FB740(__sz);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE3E8](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
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

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB0](__ptr, __size);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
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

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

