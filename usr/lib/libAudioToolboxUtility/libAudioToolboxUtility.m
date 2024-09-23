_DWORD *CrashIfClientProvidedBogusAudioBufferList(unsigned int *a1, char a2)
{
  _DWORD *result;
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;
  _DWORD *v7;
  _BYTE *v8;
  int v9;

  v4 = *a1;
  result = a1 + 2;
  v3 = v4;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = &result[4 * v3];
    while (1)
    {
      v8 = (_BYTE *)*((_QWORD *)result + 1);
      if (v8)
      {
        v9 = result[1];
        if (v9)
          v6 |= (char)(v8[v9 - 1] | *v8);
      }
      else
      {
        if ((a2 & 1) == 0)
        {
          __break(1u);
          return result;
        }
        v5 = 1;
      }
      result += 4;
      if (result >= v7)
        return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
    }
  }
  v6 = 0;
  v5 = 0;
  return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
}

uint64_t BaseOpaqueObject::checkRTTI(uint64_t a1)
{
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1))
    return a1;
  else
    return 0;
}

void CASerializer::~CASerializer(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void CASerializer::CASerializer(CASerializer *this, CFTypeRef cf)
{
  *(_QWORD *)this = 0;
  if (cf)
  {
    *(_QWORD *)this = cf;
    CFRetain(cf);
  }
}

{
  *(_QWORD *)this = 0;
  if (cf)
  {
    *(_QWORD *)this = cf;
    CFRetain(cf);
  }
}

void CADeserializer::CADeserializer(CADeserializer *this, char *a2, uint64_t a3)
{
  *((_BYTE *)this + 32) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = &a2[a3];
}

{
  *((_BYTE *)this + 32) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = &a2[a3];
}

void CADeserializer::~CADeserializer(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  *(_QWORD *)this = &off_1E54253D0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_1E54253D0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_1E54253D0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
  JUMPOUT(0x1A85D2980);
}

uint64_t CACFString::operator=(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4;
  BOOL v5;

  v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4)
      v5 = *(_BYTE *)(a1 + 8) == 0;
    else
      v5 = 1;
    if (!v5)
      CFRelease(v4);
    *(_QWORD *)a1 = cf;
  }
  *(_BYTE *)(a1 + 8) = 1;
  CFRetain(cf);
  return a1;
}

uint64_t ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
    mach_absolute_time();
  return dispatch_mig_server();
}

BOOL MinimalSafetyCheck(const AudioStreamBasicDescription *a1)
{
  _BOOL8 result;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  AudioFormatID mFormatID;
  _BOOL4 v8;

  result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240)
      return 0;
    mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240)
      return 0;
    mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240)
      return 0;
    result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400)
      return result;
    mFormatID = a1->mFormatID;
    if (!mFormatID)
      return 0;
    v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

void CABundleLocker::~CABundleLocker(CABundleLocker *this)
{
  pthread_mutex_unlock(&sCABundleLocker);
}

{
  pthread_mutex_unlock(&sCABundleLocker);
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt32(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetDictionary(CFArrayRef *this, unsigned int a2, const __CFDictionary **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFDictionary *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFDictionary *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFDictionaryGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFArray *CACFArray::GetCFType(CFArrayRef *this, unsigned int a2, const void **a3)
{
  const __CFArray *result;
  const void *ValueAtIndex;

  result = *this;
  if (result)
  {
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*this, a2);
      *a3 = ValueAtIndex;
      return (const __CFArray *)(ValueAtIndex != 0);
    }
  }
  return result;
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  uint64_t result;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeID v8;
  BOOL v9;
  int valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFBoolean *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFBooleanGetTypeID())
      {
        v7 = CFBooleanGetValue(v5) == 0;
      }
      else
      {
        v8 = CFGetTypeID(v5);
        if (v8 != CFNumberGetTypeID())
          return 0;
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        v7 = valuePtr == 0;
      }
      v9 = !v7;
      *a3 = v9;
      return 1;
    }
  }
  return result;
}

void BaseOpaqueObject::~BaseOpaqueObject(BaseOpaqueObject *this)
{
  int v2;

  *(_QWORD *)this = off_1E5425110;
  v2 = *((_DWORD *)this + 2);
  if (v2)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::remove(OpaqueObjectMgr::sInstance, v2);
    *((_DWORD *)this + 2) = 0;
  }
}

void CASerializer::Write(CFMutableDataRef *this, const UInt8 *a2, unsigned int a3, int a4)
{
  CASerializer::PrepareToWrite(this, a4);
  CFDataAppendBytes(*this, a2, a3);
}

CFMutableDataRef *operator<<(CFMutableDataRef *a1, const UInt8 *a2)
{
  unsigned int *v4;
  unint64_t v5;
  const UInt8 *v6;

  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 4, 4);
  v4 = (unsigned int *)(a2 + 8);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 8, 4);
  if (*((_DWORD *)a2 + 2))
  {
    v5 = 0;
    v6 = a2 + 28;
    do
    {
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 16, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 12, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 8, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6 - 4, 4);
      CASerializer::PrepareToWrite(a1, 4);
      CFDataAppendBytes(*a1, v6, 4);
      ++v5;
      v6 += 20;
    }
    while (v5 < *v4);
  }
  return a1;
}

{
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2, 8);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 8, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 12, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 16, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 20, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 24, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 28, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 32, 4);
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, a2 + 36, 4);
  return a1;
}

{
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2, 8);
  CASerializer::PrepareToWrite(a1, 8);
  CFDataAppendBytes(*a1, a2 + 8, 8);
  return a1;
}

void CASerializer::PrepareToWrite(CFMutableDataRef *this, int a2)
{
  const __CFData *Mutable;
  int v5;

  Mutable = *this;
  if (Mutable)
  {
    if (!a2)
      return;
  }
  else
  {
    Mutable = CFDataCreateMutable(0, 0);
    *this = Mutable;
    if (!a2)
      return;
  }
  v5 = (a2 - 1) & CFDataGetLength(Mutable);
  if (v5)
    CFDataAppendBytes(*this, CASerializer::PrepareToWrite::pad, (a2 - v5));
}

BOOL CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CASmartPreferences *v4;
  BOOL *v5;
  CASmartPreferences *v6;
  BOOL *v7;
  _BOOL8 v8;
  char v10;

  v4 = (CASmartPreferences *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretBoolean(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

BOOL CASmartPreferences::InterpretBoolean(CASmartPreferences *this, _BYTE *a2, BOOL *a3)
{
  const __CFBoolean *v4;
  CFTypeID v5;
  char v7;
  char *v8;
  int v9;
  BOOL v10;
  int valuePtr;
  char buffer[4];
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    v4 = this;
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      LODWORD(this) = CFBooleanGetValue(v4);
LABEL_6:
      *a2 = 1;
      return (_DWORD)this != 0;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      LODWORD(this) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v5 != CFStringGetTypeID())
    {
      LODWORD(this) = 0;
      return (_DWORD)this != 0;
    }
    CFStringGetCString((CFStringRef)v4, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(this) = valuePtr != 0;
      return (_DWORD)this != 0;
    }
    v7 = buffer[0];
    if (buffer[0])
    {
      v8 = &buffer[1];
      do
      {
        *(v8 - 1) = __tolower(v7);
        v9 = *v8++;
        v7 = v9;
      }
      while (v9);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (v10 = v13 == 101) : (v10 = 0), v10))
    {
      LODWORD(this) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v13))
    {
      LODWORD(this) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(this) = valuePtr;
    }
  }
  return (_DWORD)this != 0;
}

const __CFDictionary *CACFDictionary::GetCACFString(const __CFDictionary **a1, void *key, uint64_t a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  if (*(_QWORD *)a3)
  {
    if (*(_BYTE *)(a3 + 8))
      CFRelease(*(CFTypeRef *)a3);
    *(_QWORD *)a3 = 0;
  }
  *(_BYTE *)(a3 + 8) = 1;
  result = *a1;
  if (*a1)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFString::operator=(a3, v7);
    }
  }
  return result;
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  uint64_t result;
  const __CFArray *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFArray *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFArrayGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t XOSTransactor::beginTransaction(uint64_t this)
{
  _QWORD *v1;
  const char *v2;
  unsigned int v3;
  std::string *p_p;
  std::string __p;
  char __str[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)this)
  {
    v1 = (_QWORD *)this;
    if (!*(_QWORD *)(this + 24))
    {
      v2 = *(const char **)(this + 8);
      v3 = *(_DWORD *)(this + 16);
      PlatformUtilities::processName((PlatformUtilities *)v3, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      snprintf(__str, 0x80uLL, "%s %p (%d:%s)", v2, v1, v3, (const char *)p_p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      this = os_transaction_create();
      v1[3] = this;
    }
  }
  return this;
}

void PlatformUtilities::processName(PlatformUtilities *this@<X0>, std::string *a2@<X8>)
{
  size_t v3;
  int v4[2];
  int v5;
  int v6;
  _BYTE v7[243];
  std::string::value_type v8[405];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v3 = 648;
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = (int)this;
  if (sysctl(v4, 4u, v7, &v3, 0, 0) == -1)
  {
    perror("sysctl");
  }
  else if (v3)
  {
    std::string::__assign_external(a2, v8);
  }
}

void sub_1A836F044(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

int *swix::encode_message::encode_message(int *a1, uint64_t a2)
{
  xpc_object_t reply;
  xpc_object_t v5;
  xpc_object_t v6;

  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a2 + 8));
  if ((reply || (reply = xpc_null_create()) != 0) && MEMORY[0x1A85D32E0](reply) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(reply);
    v5 = reply;
  }
  else
  {
    v5 = xpc_null_create();
  }
  *(_QWORD *)a1 = -*(_DWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  v6 = xpc_null_create();
  *((_QWORD *)a1 + 2) = 0;
  xpc_release(v6);
  xpc_release(reply);
  xpc_dictionary_set_int64(*((xpc_object_t *)a1 + 1), "#", *a1);
  return a1;
}

void sub_1A836F110(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  swix::message::~message(v1);
  _Unwind_Resume(a1);
}

void CADeprecated::XMachPortDeathListener::SetDeathNotificationDispatchQueue(uint64_t *a1, dispatch_queue_t *a2)
{
  __CFMachPort *PortDeathCFPort;
  mach_port_t Port;
  NSObject *v6;
  _QWORD handler[5];
  mach_port_t v8;
  dispatch_object_t v9;

  PortDeathCFPort = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort((CADeprecated::XMachPortDeathListener *)a1);
  Port = CFMachPortGetPort(PortDeathCFPort);
  v6 = dispatch_source_create(MEMORY[0x1E0C80D98], Port, 0, *a2);
  v9 = v6;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN12CADeprecated22XMachPortDeathListener33SetDeathNotificationDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = a1;
  v8 = Port;
  dispatch_source_set_event_handler(v6, handler);
  CADeprecated::XMachPortServicer::SetQueueAndSource(a1 + 1, a2, &v9);
  if (v6)
    dispatch_release(v6);
}

void sub_1A836F1E8(_Unwind_Exception *exception_object)
{
  NSObject *v1;

  if (v1)
    dispatch_release(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::XRemoteMachServer::SetServerPort(CADeprecated::XRemoteMachServer *this, mach_port_name_t a2, int a3)
{
  char *v6;
  int v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (char *)this + 80;
  v7 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  *((_DWORD *)v6 - 8) = a2;
  *((_DWORD *)v6 - 7) = a3;
  if (a2)
  {
    v9 = (_QWORD *)*((_QWORD *)this + 8);
    v8 = *((_QWORD *)this + 9);
    if ((unint64_t)v9 >= v8)
    {
      v11 = (_QWORD *)*((_QWORD *)this + 7);
      v12 = v9 - v11;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 61)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v14 = v8 - (_QWORD)v11;
      if (v14 >> 2 > v13)
        v13 = v14 >> 2;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v15 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        if (v15 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v16 = (char *)operator new(8 * v15);
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[8 * v12];
      *(_QWORD *)v17 = *((_QWORD *)this + 6);
      v10 = v17 + 8;
      if (v9 != v11)
      {
        do
        {
          v18 = *--v9;
          *((_QWORD *)v17 - 1) = v18;
          v17 -= 8;
        }
        while (v9 != v11);
        v9 = (_QWORD *)*((_QWORD *)this + 7);
      }
      *((_QWORD *)this + 7) = v17;
      *((_QWORD *)this + 8) = v10;
      *((_QWORD *)this + 9) = &v16[8 * v15];
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v9 = *((_QWORD *)this + 6);
      v10 = v9 + 1;
    }
    *((_QWORD *)this + 8) = v10;
    CADeprecated::XMachPortDeathListener::RequestPortDeathNotification(this, a2);
  }
  if (v7)
    (*(void (**)(char *))(*(_QWORD *)v6 + 24))(v6);
}

void sub_1A836F348(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::XMachServer::AddMachClient(_QWORD *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  CADeprecated::XMachPortDeathListener::RequestPortDeathNotification((CADeprecated::XMachPortDeathListener *)(a1 + 10), *(_DWORD *)(a2 + 12));
  v4 = (*(uint64_t (**)(_QWORD *))(a1[14] + 16))(a1 + 14);
  v6 = (_QWORD *)a1[26];
  v5 = a1[27];
  if ((unint64_t)v6 >= v5)
  {
    v8 = (_QWORD *)a1[25];
    v9 = v6 - v8;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = (char *)operator new(8 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    *(_QWORD *)v14 = a2;
    v7 = v14 + 8;
    if (v6 != v8)
    {
      do
      {
        v15 = *--v6;
        *((_QWORD *)v14 - 1) = v15;
        v14 -= 8;
      }
      while (v6 != v8);
      v6 = (_QWORD *)a1[25];
    }
    a1[25] = v14;
    a1[26] = v7;
    a1[27] = &v13[8 * v12];
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = a2;
    v7 = v6 + 1;
  }
  a1[26] = v7;
  if (v4)
    (*(void (**)(_QWORD *))(a1[14] + 24))(a1 + 14);
}

void sub_1A836F4A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t CADeprecated::XMachServer::DoForEachClient(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;
  int v6;
  _QWORD *i;
  _QWORD *v8;

  v4 = (_QWORD *)(a1 + 112);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 112) + 16))(a1 + 112);
  v6 = result;
  v8 = (_QWORD *)v4[11];
  for (i = (_QWORD *)v4[12]; v8 != i; i = *(_QWORD **)(a1 + 208))
    result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *v8++);
  if (v6)
    return (*(uint64_t (**)(_QWORD *))(*v4 + 24))(v4);
  return result;
}

void sub_1A836F54C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::XMachPortDeathListener::RequestPortDeathNotification(CADeprecated::XMachPortDeathListener *this, mach_port_name_t a2)
{
  ipc_space_t *v4;
  ipc_space_t v5;
  __CFMachPort *PortDeathCFPort;
  mach_port_t Port;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  mach_port_name_t v11;
  uint64_t v12;
  mach_port_t previous;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  mach_port_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this))
  {
    previous = 0;
    v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    v5 = *MEMORY[0x1E0C83DA0];
    PortDeathCFPort = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this);
    Port = CFMachPortGetPort(PortDeathCFPort);
    v8 = mach_port_request_notification(v5, a2, 72, 1u, Port, 0x15u, &previous);
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v10 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(_QWORD *)this + 24))(this);
        *(_DWORD *)buf = 136315906;
        v15 = "XMachServer.cpp";
        v16 = 1024;
        v17 = 103;
        v18 = 2080;
        v19 = v10;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: XMachServer couldn't request port-death notification (0x%x)", buf, 0x22u);
      }
    }
    v11 = previous;
    if (previous)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v12 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(_QWORD *)this + 24))(this);
        *(_DWORD *)buf = 136315906;
        v15 = "XMachServer.cpp";
        v16 = 1024;
        v17 = 116;
        v18 = 2080;
        v19 = v12;
        v20 = 1024;
        v21 = previous;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%25s:%-5d %s is deallocating notification port (0x%x) because a new notification port has been registered.", buf, 0x22u);
        v11 = previous;
      }
      mach_port_deallocate(*v4, v11);
    }
  }
}

CFMachPortRef CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(CADeprecated::XMachPortDeathListener *this)
{
  CFMachPortRef result;
  CFMachPortContext v3;
  Boolean shouldFreeInfo;

  result = (CFMachPortRef)*((_QWORD *)this + 2);
  if (!result)
  {
    shouldFreeInfo = 0;
    v3.version = 0;
    v3.info = this;
    memset(&v3.retain, 0, 24);
    result = CFMachPortCreate(0, (CFMachPortCallBack)CADeprecated::XMachPortDeathListener::PortDeathListenerProc, &v3, &shouldFreeInfo);
    *((_QWORD *)this + 2) = result;
  }
  return result;
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  _opaque_pthread_t *v4;
  _opaque_pthread_t *v5;
  BOOL v6;
  int v7;
  uint64_t result;
  int v9;
  _DWORD *exception;
  _BYTE v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  v4 = pthread_self();
  v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (pthread_equal(v4, v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v7 == 16)
    {
      v6 = 0;
      result = 0;
      goto LABEL_7;
    }
    if (v7)
    {
      v11[0] = HIBYTE(v7);
      v11[1] = BYTE2(v7);
      v11[2] = BYTE1(v7);
      v9 = v7;
      v11[3] = v7;
      v11[4] = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v13 = "CAMutex.cpp";
        v14 = 1024;
        v15 = 224;
        v16 = 1024;
        v17 = v9;
        v18 = 2080;
        v19 = v11;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", buf, 0x22u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_1E5424FE8;
      exception[2] = v9;
    }
    atomic_store((unint64_t)v4, (unint64_t *)this + 2);
    v6 = 1;
  }
  result = 1;
LABEL_7:
  *a2 = v6;
  return result;
}

void swix::connection::audit_token(os_unfair_lock_s **this@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  void *v4;

  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v4);
  v3 = v4;
  if (MEMORY[0x1A85D32E0](v4) == MEMORY[0x1E0C812E0])
  {
    xpc_connection_get_audit_token();
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_BYTE *)(a2 + 32) = 1;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 32) = 0;
  }
  xpc_release(v3);
}

void sub_1A836F99C(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

_QWORD *CALog::Scope::SetPriorityThresholdFromPreference(CALog::Scope *this, const __CFString *a2, const __CFString *a3)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v9)(const __CFString *, BOOL *, BOOL *);
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t (*v19)(const __CFString *, BOOL *, BOOL *);
  _QWORD v20[3];
  _QWORD *v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17[0] = &off_1E5425660;
  v17[1] = this;
  v18 = v17;
  CASmartPreferences::instance(this);
  v19 = CALog::PrefValueToPriority;
  v5 = v20;
  v6 = (uint64_t)v18;
  if (!v18)
    goto LABEL_4;
  if (v18 != v17)
  {
    v6 = (*(uint64_t (**)(void))(*v18 + 16))();
LABEL_4:
    v21 = (_QWORD *)v6;
    goto LABEL_6;
  }
  v21 = v20;
  (*(void (**)(_QWORD *, _QWORD *))(v17[0] + 24))(v17, v20);
LABEL_6:
  v23 = 0;
  v7 = operator new(0x30uLL);
  v8 = v7;
  v9 = v19;
  v10 = v21;
  *v7 = &off_1E5425618;
  v7[1] = v9;
  if (!v10)
  {
    v11 = v7 + 5;
    goto LABEL_10;
  }
  if (v10 != v20)
  {
    v11 = &v21;
    v7[5] = v10;
LABEL_10:
    *v11 = 0;
    goto LABEL_12;
  }
  v7[5] = v7 + 2;
  (*(void (**)(_QWORD *))(v20[0] + 24))(v20);
LABEL_12:
  v23 = v8;
  CASmartPreferences::_RegisterFirstHandler((uint64_t)&CASmartPreferences::instance(void)::global, a3, a2, v22);
  v12 = v23;
  if (v23 == v22)
  {
    v13 = 4;
    v12 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_17;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_17:
  if (v21 == v20)
  {
    v14 = 4;
  }
  else
  {
    if (!v21)
      goto LABEL_22;
    v14 = 5;
    v5 = v21;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v14))(v5);
LABEL_22:
  result = v18;
  if (v18 == v17)
  {
    v16 = 4;
    result = v17;
  }
  else
  {
    if (!v18)
      return result;
    v16 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v16))();
}

void sub_1A836FB94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 16;
  v3 = (char *)*((_QWORD *)__p + 5);
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

void *CASmartPreferences::instance(CASmartPreferences *this)
{
  unsigned __int8 v1;

  {
    CASmartPreferences::CASmartPreferences((CASmartPreferences *)&CASmartPreferences::instance(void)::global);
  }
  return &CASmartPreferences::instance(void)::global;
}

void sub_1A836FCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CASmartPreferences::_RegisterFirstHandler(uint64_t a1, const void *a2, const __CFString *a3, _QWORD *a4)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int64x2_t v26;
  char *v27;
  char *v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  std::mutex::lock((std::mutex *)a1);
  if ((CASmartPreferences::HavePref((CASmartPreferences *)a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    v8 = *(_QWORD *)(a1 + 88);
    v9 = *(_QWORD *)(a1 + 80);
    if (v9 < v8)
    {
      std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(*(_QWORD **)(a1 + 80), (uint64_t)a2, (uint64_t)a3, a4);
      v10 = v9 + 48;
      *(_QWORD *)(a1 + 80) = v9 + 48;
LABEL_26:
      *(_QWORD *)(a1 + 80) = v10;
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), a3);
      CASmartPreferences::Pref::Load((CFStringRef *)(*(_QWORD *)(a1 + 80) - 48));
      goto LABEL_27;
    }
    v11 = *(_QWORD *)(a1 + 72);
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 4);
    if (v12 + 1 > 0x555555555555555)
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - v11) >> 4);
    v14 = 2 * v13;
    if (2 * v13 <= v12 + 1)
      v14 = v12 + 1;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v15 = 0x555555555555555;
    else
      v15 = v14;
    v31 = a1 + 88;
    if (v15)
    {
      if (v15 > 0x555555555555555)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v16 = (char *)operator new(48 * v15);
    }
    else
    {
      v16 = 0;
    }
    v28 = v16;
    v29.i64[0] = (uint64_t)&v16[48 * v12];
    v30 = &v16[48 * v15];
    std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(v29.i64[0], (uint64_t)a2, (uint64_t)a3, a4);
    v17 = v29.i64[0];
    v10 = v29.i64[0] + 48;
    v29.i64[1] = v29.i64[0] + 48;
    v19 = *(_QWORD *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    if (v18 == v19)
    {
      v26 = vdupq_n_s64(v18);
LABEL_25:
      *(_QWORD *)(a1 + 72) = v17;
      *(_QWORD *)(a1 + 80) = v10;
      v29 = v26;
      v27 = *(char **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v30;
      v30 = v27;
      v28 = (char *)v26.i64[0];
      std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)&v28);
      goto LABEL_26;
    }
    v20 = 0;
    v21 = *(_QWORD *)(a1 + 80);
    while (1)
    {
      v22 = v17 + v20;
      v23 = v18 + v20;
      *(_OWORD *)(v17 + v20 - 48) = *(_OWORD *)(v18 + v20 - 48);
      v24 = *(_QWORD *)(v18 + v20 - 8);
      if (v24)
      {
        if (v23 - 32 == v24)
        {
          *(_QWORD *)(v22 - 8) = v22 - 32;
          (*(void (**)(_QWORD))(**(_QWORD **)(v23 - 8) + 24))(*(_QWORD *)(v23 - 8));
          goto LABEL_22;
        }
        v25 = (_QWORD *)(v21 - 8);
        *(_QWORD *)(v22 - 8) = v24;
      }
      else
      {
        v25 = (_QWORD *)(v22 - 8);
      }
      *v25 = 0;
LABEL_22:
      v21 -= 48;
      v20 -= 48;
      if (v18 + v20 == v19)
      {
        v17 += v20;
        v26 = *(int64x2_t *)(a1 + 72);
        v10 = v29.i64[1];
        goto LABEL_25;
      }
    }
  }
LABEL_27:
  std::mutex::unlock((std::mutex *)a1);
}

void sub_1A836FF4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::mutex *v2;
  va_list va;

  va_start(va, a2);
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)va);
  std::mutex::unlock(v2);
  _Unwind_Resume(a1);
}

uint64_t CASmartPreferences::HavePref(CASmartPreferences *this, CFTypeRef cf1, const __CFString *a3)
{
  CFTypeRef *v3;
  CFTypeRef *v4;

  v3 = (CFTypeRef *)*((_QWORD *)this + 9);
  v4 = (CFTypeRef *)*((_QWORD *)this + 10);
  if (v3 == v4)
    return 0;
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4)
      return 0;
  }
  return 1;
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = operator new(0x30uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *v2 = &off_1E5425618;
  v2[1] = v3;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_1A8370030(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E5425660;
  a2[1] = v2;
  return result;
}

CFPropertyListRef CASmartPreferences::Pref::Load(CFStringRef *this)
{
  CFPropertyListRef result;
  CFStringRef v3;
  CFPropertyListRef v4;

  result = CFPreferencesCopyAppValue(*this, this[1]);
  if (result)
  {
    v4 = result;
    v3 = this[5];
    if (!v3)
      std::__throw_bad_function_call[abi:ne180100]();
    return (CFPropertyListRef)(*((uint64_t (**)(CFStringRef, CFPropertyListRef *))v3->isa + 6))(v3, &v4);
  }
  return result;
}

uint64_t std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 48;
    v4 = *(_QWORD **)(v2 - 8);
    if (v4 == (_QWORD *)(v2 - 32))
    {
      v4 = (_QWORD *)(v2 - 32);
      v5 = 4;
LABEL_7:
      (*(void (**)(void))(*v4 + 8 * v5))();
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      if (v4)
      {
        v5 = 5;
        goto LABEL_7;
      }
      v2 -= 48;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void CASmartPreferences::CASmartPreferences(CASmartPreferences *this)
{
  NSObject *global_queue;
  NSObject *v3;
  uint64_t v4;
  _QWORD handler[5];

  *(_QWORD *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  v3 = dispatch_source_create(MEMORY[0x1E0C80DC0], 1uLL, 0, global_queue);
  v4 = MEMORY[0x1E0C809B0];
  *((_QWORD *)this + 12) = v3;
  handler[0] = v4;
  handler[1] = 0x40000000;
  handler[2] = ___ZN18CASmartPreferencesC2Ev_block_invoke;
  handler[3] = &__block_descriptor_tmp_350;
  handler[4] = this;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*((dispatch_object_t *)this + 12));
}

void sub_1A8370200(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

swix::encode_message *swix::encode_message::encode_message(swix::encode_message *this, int a2)
{
  xpc_object_t v4;
  void *v5;
  xpc_object_t v6;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    v4 = xpc_null_create();
    if (!v4)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x1A85D32E0](v4) != MEMORY[0x1E0C812F8])
  {
    v5 = v4;
LABEL_7:
    v4 = xpc_null_create();
    goto LABEL_8;
  }
  xpc_retain(v4);
  v5 = v4;
LABEL_8:
  xpc_release(v5);
  *(_DWORD *)this = a2;
  *((_DWORD *)this + 1) = 0;
  *((_QWORD *)this + 1) = v4;
  v6 = xpc_null_create();
  *((_QWORD *)this + 2) = 0;
  xpc_release(v6);
  xpc_dictionary_set_int64(*((xpc_object_t *)this + 1), "#", *(int *)this);
  return this;
}

void sub_1A83702D4(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  swix::message::~message(v1);
  _Unwind_Resume(a1);
}

void CADeprecated::XBasicMIGServer::SetServerDispatchQueue(uint64_t a1, dispatch_queue_t *a2)
{
  uintptr_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *(*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _QWORD handler[5];
  dispatch_object_t object;
  dispatch_object_t v30;

  if (atomic_load(*(unsigned int **)(a1 + 40)))
  {
    v5 = atomic_load(*(unsigned int **)(a1 + 40));
    v6 = dispatch_source_create(MEMORY[0x1E0C80D98], v5, 0, *a2);
    v7 = v6;
    v30 = v6;
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 1174405120;
    handler[2] = ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke;
    handler[3] = &__block_descriptor_tmp_8;
    handler[4] = a1;
    object = v6;
    if (v6)
      dispatch_retain(v6);
    dispatch_source_set_event_handler(v7, handler);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(std::__shared_weak_count **)(a1 + 48);
    v26 = v9;
    v27 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      v21 = 1174405120;
      v22 = ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke_9;
      v23 = &__block_descriptor_tmp_10;
      v24 = v9;
      v25 = v10;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    else
    {
      v21 = 1174405120;
      v22 = ___ZN12CADeprecated15XBasicMIGServer22SetServerDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke_9;
      v23 = &__block_descriptor_tmp_10;
      v24 = v9;
      v25 = 0;
    }
    v20 = v8;
    dispatch_source_set_cancel_handler(v7, &v20);
    CADeprecated::XMachPortServicer::SetQueueAndSource((uint64_t *)(a1 + 56), a2, &v30);
    v14 = v25;
    if (v25)
    {
      v15 = (unint64_t *)&v25->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v27;
    if (v27)
    {
      v18 = (unint64_t *)&v27->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (object)
      dispatch_release(object);
    if (v30)
      dispatch_release(v30);
  }
}

void sub_1A83704D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,dispatch_object_t object)
{
  NSObject *v23;
  uint64_t v24;

  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100](v24);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  if (object)
    dispatch_release(object);
  if (v23)
    dispatch_release(v23);
  _Unwind_Resume(a1);
}

void ___ZN4swix10connection5state11set_handlerEP17_xpc_connection_sU13block_pointerFvPvE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  NSObject *v9;
  dispatch_time_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v3 = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 168);
  v5 = *v3;
  v4 = (std::__shared_weak_count *)v3[1];
  if (!v4 || (v7 = std::__shared_weak_count::lock(v4)) == 0)
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v8 = v7;
  v9 = *(NSObject **)(v5 + 64);
  v10 = dispatch_time(0, *(_QWORD *)(v5 + 16));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, *(uint64_t *)(v5 + 16) >> 6);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
  dispatch_source_set_timer(*(dispatch_source_t *)(v5 + 64), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
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

void sub_1A83705FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  swix::detail::watchdog_timer::transaction::~transaction((swix::detail::watchdog_timer::transaction *)&a9);
  _Unwind_Resume(a1);
}

void ___ZN4swix12ipc_endpointC2ERKNS_17connection_configERNS_13ipc_interfaceE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v2;
  xpc_object_t objecta;

  v2 = *(_QWORD *)(a1 + 32);
  objecta = object;
  if (object)
    xpc_retain(object);
  else
    objecta = xpc_null_create();
  swix::ipc_endpoint::handle_event_or_error(v2, &objecta);
  xpc_release(objecta);
}

void swix::ipc_endpoint::handle_event_or_error(uint64_t a1, _QWORD *a2)
{
  xpc_object_t v4;
  uint64_t v5;
  xpc_object_t v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v4 = (xpc_object_t)*a2;
  v5 = MEMORY[0x1E0C812F8];
  if (*a2 && MEMORY[0x1A85D32E0](*a2) == v5)
    xpc_retain(v4);
  else
    v4 = xpc_null_create();
  if (MEMORY[0x1A85D32E0](v4) == v5)
  {
    v7[0] = v4;
    if (v4)
    {
      xpc_retain(v4);
      v6 = v4;
    }
    else
    {
      v6 = xpc_null_create();
      v7[0] = v6;
    }
    swix::ipc_endpoint::handle_event(a1, v7);
    xpc_release(v6);
  }
  else
  {
    swix::ipc_endpoint::handle_error(a1, a2);
  }
  xpc_release(v4);
}

void sub_1A8370764(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void swix::ipc_endpoint::handle_event(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  NSObject *v5;
  xpc_object_t v6;
  char *v7;
  void **v8;
  xpc_object_t v9;
  uint64_t v10;
  void *__p[2];
  char v12;
  xpc_object_t object;
  _BYTE buf[22];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 8);
  if (*(_BYTE *)(v4 + 88))
  {
    v5 = *(NSObject **)(v4 + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      swix::connection::xpc_connection((os_unfair_lock_s **)a1, (swix::detail::connection_impl *)&object);
      v6 = object;
      v7 = (char *)MEMORY[0x1A85D3280](*a2);
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      free(v7);
      if (v12 >= 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEFAULT, "%p received event %s", buf, 0x16u);
      if (v12 < 0)
        operator delete(__p[0]);
      xpc_release(object);
    }
  }
  v9 = (xpc_object_t)*a2;
  *(_QWORD *)buf = v9;
  v10 = MEMORY[0x1E0C812F8];
  if (v9 && MEMORY[0x1A85D32E0](v9) == v10)
  {
    xpc_retain(v9);
  }
  else
  {
    v9 = xpc_null_create();
    *(_QWORD *)buf = v9;
  }
  swix::decode_message::decode_message((uint64_t)__p, (xpc_object_t *)buf, *(_QWORD *)(*(_QWORD *)(a1 + 8) + 80));
  xpc_release(v9);
  (*(void (**)(_BYTE *__return_ptr, _QWORD, void **))(**(_QWORD **)(a1 + 56) + 16))(buf, *(_QWORD *)(a1 + 56), __p);
  if (MEMORY[0x1A85D32E0](*(_QWORD *)&buf[8]) == v10)
    swix::connection::send((os_unfair_lock_s **)a1, (const swix::encode_message *)buf);
  xpc_release(*(xpc_object_t *)&buf[8]);
  xpc_release(__p[1]);
}

void sub_1A8370A34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, xpc_object_t a16)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void swix::connection::send(os_unfair_lock_s **this, const swix::encode_message *a2)
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  _BOOL4 v6;
  xpc_object_t v7;
  xpc_connection_t v8;
  char *v9;
  void **v10;
  void *__p[2];
  char v12;
  xpc_object_t message;
  xpc_connection_t connection;
  uint8_t buf[4];
  xpc_connection_t v16;
  __int16 v17;
  void **v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  swix::connection::xpc_connection(this, (swix::detail::connection_impl *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  v4 = this[1];
  if (LOBYTE(v4[22]._os_unfair_lock_opaque))
  {
    v5 = *(NSObject **)&v4[20]._os_unfair_lock_opaque;
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    v7 = message;
    if (v6)
    {
      v8 = connection;
      v9 = (char *)MEMORY[0x1A85D3280](message);
      std::string::basic_string[abi:ne180100]<0>(__p, v9);
      free(v9);
      if (v12 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      *(_DWORD *)buf = 134218242;
      v16 = v8;
      v17 = 2080;
      v18 = v10;
      _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
      if (v12 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    v7 = message;
  }
  xpc_connection_send_message(connection, v7);
  xpc_release(v7);
  xpc_release(connection);
}

void sub_1A8370BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object)
{
  void *v14;

  xpc_release(v14);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::remove(uint64_t a1, int a2)
{
  std::mutex *v4;
  unint64_t v5;
  unint64_t SlotForKey;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  int v10;
  int v13;
  unsigned int v14;
  unsigned int v15;

  v4 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  v5 = atomic_load((unint64_t *)(a1 + 40));
  if (v5)
  {
    SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v5, a2);
    if ((SlotForKey & 1) != 0)
    {
      v8 = v7;
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v5 + 8 * HIDWORD(SlotForKey) + 16));
      if (v7)
      {
        v9 = atomic_load((unsigned int *)(a1 + 48));
        if (v9 >= 1)
        {
          do
          {
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(50);
            v10 = atomic_load((unsigned int *)(a1 + 48));
          }
          while (v10 > 0);
        }
        if ((unsigned __int16)atomic_load(v8))
        {
          std::mutex::unlock(v4);
          while ((unsigned __int16)atomic_load(v8))
            std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(500);
          std::mutex::lock(v4);
          v5 = atomic_load((unint64_t *)(a1 + 40));
        }
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(v8);
        v13 = *(_DWORD *)(a1 + 32) - 1;
        *(_DWORD *)(a1 + 32) = v13;
        if (v5)
        {
          v14 = 16 * v13;
          v15 = *(_DWORD *)(v5 + 8);
          if (v14 / v15 <= 2 && v15 >= 9)
            caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v15 >> 1);
        }
      }
    }
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::emptyReleasePool(a1);
  std::mutex::unlock(v4);
}

void sub_1A8370D60(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this)
{
  OpaqueObjectMgr *v2;

  *(_QWORD *)this = off_1E5425110;
  v2 = (OpaqueObjectMgr *)OpaqueObjectMgrInstance();
  *((_DWORD *)this + 2) = OpaqueObjectMgr::add(v2, this);
}

uint64_t OpaqueObjectMgr::add(OpaqueObjectMgr *this, BaseOpaqueObject *a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t *v8;
  char v9;

  v4 = (unsigned int *)((char *)this + 144);
  do
  {
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    if ((v5 & 0x80000000) != 0)
    {
      v6 = (v5 - 2147479552);
      while (1)
      {
        v7 = __ldaxr(v4);
        if (v7 != (_DWORD)v5)
          break;
        if (!__stlxr(v6, v4))
          goto LABEL_10;
      }
      __clrex();
    }
    else
    {
      v6 = v5;
    }
LABEL_10:
    v8 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>((uint64_t)this, v6);
  }
  while (v9 && v8);
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::_addOrReplace((uint64_t)this, v6, (uint64_t)a2);
  return v6;
}

uint64_t BaseOpaqueObject::ResolveOpaqueRef(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t *v4;
  char v5;
  BOOL v6;
  uint64_t *v7;

  result = OpaqueObjectMgr::sInstance;
  if (OpaqueObjectMgr::sInstance)
  {
    v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>(OpaqueObjectMgr::sInstance, a2);
    if (v5)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {
      return 0;
    }
    else
    {
      v7 = v4;
      if ((*(unsigned int (**)(uint64_t *, uint64_t))(*v4 + 24))(v4, a1))
        return (uint64_t)v7;
      else
        return 0;
    }
  }
  return result;
}

uint64_t *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>(uint64_t a1, int a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t *result;
  uint64_t v5;
  unsigned int v6;

  v2 = (unsigned int *)(a1 + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  result = (uint64_t *)atomic_load((unint64_t *)(a1 + 40));
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey(result, a2);
    if (v5)
      result = *(uint64_t **)(v5 + 8);
    else
      result = 0;
  }
  do
    v6 = __ldaxr(v2);
  while (__stlxr(v6 - 1, v2));
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl::findSlotForKey(uint64_t *a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v17;

  v3 = *((_DWORD *)a1 + 2);
  v4 = *a1;
  v17 = a2;
  v5 = *(_QWORD *)(v4 + 24);
  if (!v5)
    goto LABEL_24;
  v7 = (*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, &v17) % *((_DWORD *)a1 + 2);
  if ((int)v7 >= 3)
    v8 = 0;
  else
    v8 = v3;
  v9 = (v7 + v8 - 3);
  v10 = 0xFFFFFFFFLL;
  v11 = 1;
  v12 = v7;
  while (1)
  {
    v13 = v9;
    v14 = atomic_load((unint64_t *)&a1[v12 + 2]);
    if (v14 != -1)
      break;
    if ((int)v10 >= 0)
      v10 = v10;
    else
      v10 = v12;
LABEL_13:
    if ((int)v9 >= 3)
      v15 = 0;
    else
      v15 = v3;
    v9 = (v9 + v15 - 3);
    v12 = v13;
    if ((_DWORD)v13 == (_DWORD)v7)
    {
      if ((v10 & 0x80000000) == 0)
      {
        v11 = 0;
        v12 = v10;
        return v11 | (v12 << 32);
      }
      __break(1u);
LABEL_24:
      std::__throw_bad_function_call[abi:ne180100]();
    }
  }
  if (v14)
  {
    if (*(_DWORD *)(v14 + 4) == a2)
      return v11 | (v12 << 32);
    goto LABEL_13;
  }
  v11 = 0;
  if ((int)v10 >= 0)
    v12 = v10;
  else
    v12 = v12;
  return v11 | (v12 << 32);
}

uint64_t std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::operator()(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

void caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::_addOrReplace(uint64_t a1, int a2, uint64_t a3)
{
  std::mutex *v6;
  uint64_t *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t SlotForKey;
  unint64_t v13;

  v6 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  v7 = (uint64_t *)atomic_load((unint64_t *)(a1 + 40));
  v8 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (v7)
  {
    v9 = 16 * v8;
    v10 = *((_DWORD *)v7 + 2);
    if (v9 / v10 < 0xB)
      goto LABEL_6;
    v11 = 2 * v10;
  }
  else
  {
    v11 = 8;
  }
  v7 = (uint64_t *)caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v11);
LABEL_6:
  SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey(v7, a2);
  if ((SlotForKey & 1) != 0)
  {
    --*(_DWORD *)(a1 + 32);
  }
  else
  {
    v13 = operator new();
    *(_DWORD *)v13 = 0x10000;
    *(_DWORD *)(v13 + 4) = a2;
    *(_QWORD *)(v13 + 8) = a3;
    atomic_store(v13, (unint64_t *)&v7[HIDWORD(SlotForKey) + 2]);
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::emptyReleasePool(a1);
  }
  std::mutex::unlock(v6);
}

void sub_1A8371108(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::emptyReleasePool(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t *v4;

  v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    v2 = result;
    v4 = *(uint64_t **)(result + 56);
    for (i = *(uint64_t **)(result + 64);
          i != v4;
          result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](i))
    {
      --i;
    }
    *(_QWORD *)(v2 + 64) = v4;
  }
  return result;
}

uint64_t OpaqueObjectMgrInstance(void)
{
  unint64_t v0;
  char v2;
  char **v3;
  char *v4;

  v0 = atomic_load(&OpaqueObjectMgrInstance(void)::onceflag);
  if (v0 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&OpaqueObjectMgrInstance(void)::onceflag, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>);
  }
  return OpaqueObjectMgr::sInstance;
}

void swix::connection::send_and_await_reply(os_unfair_lock_s **this@<X0>, const swix::encode_message *a2@<X1>, uint64_t a3@<X8>)
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  _BOOL4 v8;
  xpc_object_t v9;
  xpc_connection_t v10;
  char *v11;
  std::string *v12;
  xpc_object_t v13;
  os_unfair_lock_s *v14;
  NSObject *v15;
  xpc_connection_t v16;
  char *v17;
  std::string *v18;
  xpc_object_t v19;
  int v20;
  NSObject *v21;
  std::string *v22;
  std::string::size_type size;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  __int128 v27;
  std::string *v28;
  std::string::size_type v29;
  std::string *v30;
  __int128 v31;
  std::string *v32;
  __int128 v33;
  xpc_object_t v34;
  xpc_object_t message;
  xpc_connection_t connection;
  std::string v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string buf;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  swix::connection::xpc_connection(this, (swix::detail::connection_impl *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  v6 = this[1];
  if (LOBYTE(v6[22]._os_unfair_lock_opaque))
  {
    v7 = *(NSObject **)&v6[20]._os_unfair_lock_opaque;
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    v9 = message;
    if (v8)
    {
      v10 = connection;
      v11 = (char *)MEMORY[0x1A85D3280](message);
      std::string::basic_string[abi:ne180100]<0>(&v42, v11);
      free(v11);
      v12 = (v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v42
          : (std::string *)v42.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v10;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
      _os_log_impl(&dword_1A836D000, v7, OS_LOG_TYPE_DEFAULT, "%p send msg %s", (uint8_t *)&buf, 0x16u);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v42.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    v9 = message;
  }
  v13 = xpc_connection_send_message_with_reply_sync(connection, v9);
  v34 = v13;
  if (!v13)
  {
    v13 = xpc_null_create();
    v34 = v13;
  }
  v14 = this[1];
  if (LOBYTE(v14[22]._os_unfair_lock_opaque))
  {
    v15 = *(NSObject **)&v14[20]._os_unfair_lock_opaque;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = connection;
      v17 = (char *)MEMORY[0x1A85D3280](v13);
      std::string::basic_string[abi:ne180100]<0>(&v42, v17);
      free(v17);
      v18 = (v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v42
          : (std::string *)v42.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v18;
      _os_log_impl(&dword_1A836D000, v15, OS_LOG_TYPE_DEFAULT, "%p msg reply %s", (uint8_t *)&buf, 0x16u);
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v42.__r_.__value_.__l.__data_);
    }
  }
  swix::connection::check_valid_reply((uint64_t)this, &v34);
  v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  if (v13 && MEMORY[0x1A85D32E0](v13) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v13);
    v19 = v13;
  }
  else
  {
    v19 = xpc_null_create();
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  }
  swix::decode_message::decode_message(a3, (xpc_object_t *)&v42.__r_.__value_.__l.__data_, *(_QWORD *)&this[1][20]._os_unfair_lock_opaque);
  xpc_release(v19);
  v20 = *(_DWORD *)a2;
  if (*(_DWORD *)a3 + *(_DWORD *)a2)
  {
    v21 = *(NSObject **)(a3 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v39, "unexpected message ID (");
    std::to_string(&v38, -v20);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v38;
    else
      v22 = (std::string *)v38.__r_.__value_.__r.__words[0];
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    else
      size = v38.__r_.__value_.__l.__size_;
    v24 = std::string::append(&v39, (const std::string::value_type *)v22, size);
    v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    v26 = std::string::append(&v40, "/", 1uLL);
    v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v27;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v26->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v37, *(_DWORD *)a3);
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v28 = &v37;
    else
      v28 = (std::string *)v37.__r_.__value_.__r.__words[0];
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v29 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
    else
      v29 = v37.__r_.__value_.__l.__size_;
    v30 = std::string::append(&v41, (const std::string::value_type *)v28, v29);
    v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    buf.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&buf, ")", 1uLL);
    v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    swix::decode_message::throw_error(v21, -301, &v42);
  }
  xpc_release(v13);
  xpc_release(message);
  xpc_release(connection);
}

void sub_1A8371578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  xpc_object_t *v42;
  void *v43;
  uint64_t v44;

  if (*(char *)(v44 - 121) < 0)
    operator delete(*(void **)(v44 - 144));
  if (*(char *)(v44 - 89) < 0)
    operator delete(*(void **)(v44 - 112));
  if (a17 < 0)
    operator delete(__p);
  if (a42 < 0)
    operator delete(a37);
  if (a35 < 0)
    operator delete(a30);
  if (a23 < 0)
    operator delete(a18);
  if (a29 < 0)
    operator delete(a24);
  swix::decode_message::~decode_message(v42);
  xpc_release(v43);
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

BOOL CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  int v5;
  int v7;
  _DWORD *exception;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  v4 = pthread_equal(v2, v3);
  if (!v4)
  {
    v5 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    if (v5)
    {
      v7 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "CAMutex.cpp";
        v11 = 1024;
        v12 = 106;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Lock: Could not lock the mutex", (uint8_t *)&v9, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_1E5424FE8;
      exception[2] = v7;
    }
    atomic_store((unint64_t)v2, (unint64_t *)this + 2);
  }
  return v4 == 0;
}

void CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  int v5;
  _DWORD *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (pthread_equal(v2, v3))
  {
    atomic_store(0, (unint64_t *)this + 2);
    v4 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v7 = 136315394;
        v8 = "CAMutex.cpp";
        v9 = 1024;
        v10 = 152;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::Unlock: Could not unlock the mutex", (uint8_t *)&v7, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_1E5424FE8;
      exception[2] = v5;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "CAMutex.cpp";
    v9 = 1024;
    v10 = 160;
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", (uint8_t *)&v7, 0x12u);
  }
}

void swix::connection::xpc_connection(os_unfair_lock_s **this@<X0>, swix::detail::connection_impl *a2@<X8>)
{
  xpc_object_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  std::runtime_error *exception;
  std::string v10;
  void (*v11[3])(uint64_t, swix::detail::connection_impl *);
  xpc_object_t v12;

  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v12);
  v4 = v12;
  if (MEMORY[0x1A85D32E0](v12) == MEMORY[0x1E0C812E0])
  {
    *(_QWORD *)a2 = v4;
    v4 = xpc_null_create();
    v12 = v4;
  }
  else
  {
    v5 = (uint64_t)this[1];
    v6 = *(unsigned __int8 *)(v5 + 89);
    v7 = *(NSObject **)(v5 + 80);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v8)
      {
        LOWORD(v10.__r_.__value_.__l.__data_) = 0;
        _os_log_error_impl(&dword_1A836D000, v7, OS_LOG_TYPE_ERROR, "null connection", (uint8_t *)&v10, 2u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x18uLL);
      std::string::basic_string[abi:ne180100]<0>(&v10, "null connection");
      std::runtime_error::runtime_error(exception, &v10);
      exception->__vftable = (std::runtime_error_vtbl *)&off_1E5425580;
      LODWORD(exception[1].__vftable) = -2;
    }
    if (v8)
    {
      LOWORD(v10.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_1A836D000, v7, OS_LOG_TYPE_ERROR, "rebuilding null connection", (uint8_t *)&v10, 2u);
      v5 = (uint64_t)this[1];
    }
    v10.__r_.__value_.__r.__words[0] = (std::string::size_type)this;
    v11[0] = (void (*)(uint64_t, swix::detail::connection_impl *))caulk::function_ref<void ()(applesauce::xpc::connection const&)>::functor_invoker<swix::connection::xpc_connection(void)::$_0>;
    v11[1] = (void (*)(uint64_t, swix::detail::connection_impl *))&v10;
    swix::connection::state::rebuild_connection(v5, v11, a2);
  }
  xpc_release(v4);
}

void sub_1A8371AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  void *v15;
  int v16;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
    {
LABEL_6:
      xpc_release(v14);
      _Unwind_Resume(a1);
    }
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void swix::connection::state::xpc_connection(os_unfair_lock_s *this@<X0>, swix::detail::connection_impl *a2@<X8>)
{
  os_unfair_lock_s *v4;
  uint64_t v5;

  v4 = this + 38;
  os_unfair_lock_lock(this + 38);
  v5 = *(_QWORD *)&this[40]._os_unfair_lock_opaque;
  if (v5)
    swix::detail::connection_impl::get(a2, *(void **)(v5 + 16));
  else
    *(_QWORD *)a2 = xpc_null_create();
  os_unfair_lock_unlock(v4);
}

xpc_object_t swix::detail::connection_impl::get(swix::detail::connection_impl *this, void *a2)
{
  xpc_object_t result;

  *(_QWORD *)this = a2;
  if (a2)
    return xpc_retain(a2);
  result = xpc_null_create();
  *(_QWORD *)this = result;
  return result;
}

xpc_object_t swix::encode_message::xpc_message@<X0>(swix::encode_message *this@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  xpc_object_t result;

  if (*((_DWORD *)this + 1))
    xpc_dictionary_set_uint64(*((xpc_object_t *)this + 1), ".optionals", *((_QWORD *)this + 2));
  v4 = (void *)*((_QWORD *)this + 1);
  *a2 = v4;
  if (v4)
    return xpc_retain(v4);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t swix::decode_message::decode_message(uint64_t a1, xpc_object_t *a2, uint64_t a3)
{
  xpc_object_t v5;
  xpc_object_t v6;
  int64_t int64;
  NSObject *v9;
  _QWORD *exception;
  NSObject *v11;
  std::string v12;

  v5 = *a2;
  if (*a2)
    xpc_retain(*a2);
  else
    v5 = xpc_null_create();
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = xpc_null_create();
  *(_QWORD *)(a1 + 16) = 0;
  xpc_release(v6);
  *(_QWORD *)(a1 + 24) = a3;
  if (MEMORY[0x1A85D32E0](*(_QWORD *)(a1 + 8)) != MEMORY[0x1E0C812F8])
  {
    v9 = *(NSObject **)(a1 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v12, "!(is_valid())");
    swix::decode_message::throw_error(v9, -304, &v12);
  }
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 8), "#");
  if (int64 != (int)int64)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = &off_1E54254B0;
  }
  *(_DWORD *)a1 = int64;
  if (!(_DWORD)int64)
  {
    v11 = *(NSObject **)(a1 + 24);
    std::string::basic_string[abi:ne180100]<0>(&v12, "!(mMessageID != 0)");
    swix::decode_message::throw_error(v11, -303, &v12);
  }
  return a1;
}

void sub_1A8371D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  xpc_object_t *v15;

  if (a15 < 0)
    operator delete(__p);
  swix::message::~message(v15);
  _Unwind_Resume(a1);
}

void swix::connection::check_valid_reply(uint64_t a1, _QWORD *a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*a2 == MEMORY[0x1E0C81258])
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 8) + 80);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = a1;
      v4 = "%p reply: XPC_ERROR_CONNECTION_INTERRUPTED";
      goto LABEL_8;
    }
  }
  else if (*a2 == MEMORY[0x1E0C81260])
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 8) + 80);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = a1;
      v4 = "%p reply: XPC_ERROR_CONNECTION_INVALID";
LABEL_8:
      _os_log_error_impl(&dword_1A836D000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v5, 0xCu);
    }
  }
}

unsigned int *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::element_t::release(unsigned int *result)
{
  unsigned int v1;

  do
    v1 = __ldaxr(result);
  while (__stlxr(v1 - 0x10000, result));
  if ((v1 & 0xFFFF0000) == 0x10000)
  {
    if (atomic_load(result))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

uint64_t CADeprecated::XMachPortServicer::SetQueueAndSource(uint64_t *a1, dispatch_queue_t *a2, dispatch_object_t *a3)
{
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)operator new();
  CADeprecated::XMachPortServicer::DispatchImpl::DispatchImpl(v6, a2, a3);
  result = *a1;
  *a1 = (uint64_t)v6;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

_QWORD *CADeprecated::XMachPortServicer::DispatchImpl::DispatchImpl(_QWORD *a1, dispatch_queue_t *a2, dispatch_object_t *a3)
{
  NSObject *v6;
  NSObject *v7;

  v6 = *a2;
  *a1 = &off_1E54252D8;
  a1[1] = v6;
  if (v6)
    dispatch_retain(v6);
  v7 = *a3;
  a1[2] = *a3;
  if (v7)
    dispatch_retain(v7);
  dispatch_set_target_queue(*a3, *a2);
  dispatch_resume(*a3);
  return a1;
}

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::rehash(unint64_t *a1, unsigned int a2)
{
  unint64_t *v4;
  unint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t SlotForKey;
  unsigned int v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t *v25;

  v4 = a1 + 5;
  v5 = atomic_load(a1 + 5);
  v6 = operator new(8 * (a2 - 1) + 24);
  *(_QWORD *)v6 = a1;
  v6[2] = a2;
  *((_QWORD *)v6 + 2) = 0;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    v7 = *(unsigned int *)(v5 + 8);
    if ((_DWORD)v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v9 = *(_QWORD *)(v5 + 8 * i + 16);
        if (v9 + 1 >= 2)
        {
          SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::findSlotForKey((uint64_t *)v6, *(_DWORD *)(v9 + 4));
          if ((SlotForKey & 1) == 0)
          {
            do
              v11 = __ldaxr((unsigned int *)v9);
            while (__stlxr(v11 + 0x10000, (unsigned int *)v9));
            atomic_store(v9, (unint64_t *)&v6[2 * HIDWORD(SlotForKey) + 4]);
          }
        }
      }
    }
    atomic_store((unint64_t)v6, a1 + 5);
    v13 = (unint64_t *)a1[8];
    v12 = a1[9];
    if ((unint64_t)v13 >= v12)
    {
      v15 = (_QWORD *)a1[7];
      v16 = v13 - v15;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v18 = v12 - (_QWORD)v15;
      if (v18 >> 2 > v17)
        v17 = v18 >> 2;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v17;
      if (v19)
      {
        if (v19 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v20 = (char *)operator new(8 * v19);
      }
      else
      {
        v20 = 0;
      }
      v21 = (unint64_t *)&v20[8 * v16];
      *v21 = v5;
      v14 = v21 + 1;
      while (v13 != v15)
      {
        v22 = *--v13;
        *v13 = 0;
        *--v21 = v22;
      }
      v23 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v21;
      a1[8] = (unint64_t)v14;
      a1[9] = (unint64_t)&v20[8 * v19];
      v24 = (uint64_t *)*((_QWORD *)&v23 + 1);
      v25 = (uint64_t *)v23;
      while (v24 != v25)
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v24);
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v13 = v5;
      v14 = v13 + 1;
    }
    a1[8] = (unint64_t)v14;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t PowerMeter::Reset(uint64_t this)
{
  *(_QWORD *)(this + 64) = 0;
  *(_WORD *)(this + 56) = 0;
  *(_QWORD *)(this + 80) = 0;
  *(_QWORD *)(this + 88) = 0;
  *(_QWORD *)(this + 96) = 0;
  *(_QWORD *)(this + 104) = 0;
  *(_QWORD *)(this + 112) = 0;
  *(_QWORD *)(this + 120) = 0;
  *(_QWORD *)(this + 48) = 0xFFFFFFFFLL;
  return this;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, unsigned int **a2)
{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::operator=((unsigned int **)this, a2);
}

{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::operator=((unsigned int **)this, a2);
}

void CABundleLocker::CABundleLocker(CABundleLocker *this)
{
  pthread_mutex_lock(&sCABundleLocker);
}

{
  pthread_mutex_lock(&sCABundleLocker);
}

uint64_t MSHMIGDispatchMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v4[2];
  uint64_t v5;

  memset(v4, 0, sizeof(v4));
  v5 = a3;
  return mshMIGPerform(a1, a2, a3, v4);
}

uint64_t mshMIGPerform(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v6;
  int v7;
  int v8;
  int v10;
  mach_msg_header_t *v11;
  int v12;
  void (*v13)(uint64_t, mach_msg_header_t *);
  size_t v14;
  uint64_t v15;
  unsigned int v16;
  mach_port_t msgh_remote_port;
  int v18;
  uint64_t (*v19)(uint64_t, uint64_t, _QWORD);
  uint64_t v20;
  mach_port_mscount_t v21;
  mach_port_name_t v22;
  ipc_space_t v23;
  void (*v24)(uint64_t, _QWORD);
  mach_msg_option_t v25;
  mach_msg_return_t v26;
  FILE *v27;
  pid_t v28;
  uint64_t v30;
  mach_port_t previous;
  mach_port_mscount_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = *((_QWORD *)a4 + 4);
  v7 = *(_DWORD *)(a1 + 20);
  v8 = *(_DWORD *)(v6 + 8);
  if (*(_DWORD *)(v6 + 12) <= v7 || v7 < v8)
  {
    MEMORY[0x1E0C80A78]();
    v11 = (mach_msg_header_t *)&v30;
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v13 = *(void (**)(uint64_t, mach_msg_header_t *))(v6 + 40 * (v7 - v8) + 40);
    v14 = MEMORY[0x1E0C80A78]();
    v11 = (mach_msg_header_t *)((char *)&previous - v15);
    if (v14 <= 0x2000)
    {
      v12 = 0;
    }
    else
    {
      v11 = (mach_msg_header_t *)malloc_type_malloc(v14, 0x4EC6FE9BuLL);
      v10 = *(_DWORD *)(a1 + 20);
      v12 = 1;
    }
  }
  v11->msgh_bits = *(_DWORD *)a1 & 0x1F;
  v16 = *(_DWORD *)(a1 + 8);
  v11->msgh_size = 36;
  *(_QWORD *)&v11->msgh_remote_port = v16;
  v11->msgh_id = v10 + 100;
  if (!v13)
  {
    v18 = *(_DWORD *)(a1 + 20);
    if (v18 == 71)
    {
      v24 = (void (*)(uint64_t, _QWORD))*((_QWORD *)a4 + 3);
      if (v24)
        v24(a1, *((_QWORD *)a4 + 1));
    }
    else
    {
      if (v18 != 70)
      {
        *(_QWORD *)&v11[1].msgh_bits = *MEMORY[0x1E0C804E8];
        v11[1].msgh_remote_port = -303;
        goto LABEL_28;
      }
      v19 = (uint64_t (*)(uint64_t, uint64_t, _QWORD))*((_QWORD *)a4 + 2);
      if (v19)
      {
        v20 = *(unsigned int *)(a1 + 32);
        v32 = *(_DWORD *)(a1 + 32);
        if (*(unsigned __int8 *)(a1 + 28) != *(unsigned __int8 *)(MEMORY[0x1E0C804E8] + 4))
          v20 = bswap32(v32);
        v21 = v19(v20, a1, *((_QWORD *)a4 + 1));
        v32 = v21;
        if (v21)
        {
          previous = 0;
          v22 = *a4;
          v23 = *MEMORY[0x1E0C83DA0];
          mach_port_request_notification(*MEMORY[0x1E0C83DA0], v22, 70, v21, v22, 0x15u, &previous);
          if (previous)
            mach_port_mod_refs(v23, previous, 2u, -1);
        }
        else
        {
          *((_QWORD *)a4 + 2) = 0;
        }
      }
    }
    if ((v12 & 1) == 0)
      return 0;
    goto LABEL_39;
  }
  if ((a4[1] & 2) != 0)
    *(_DWORD *)(a1 + 12) = *((_QWORD *)a4 + 1);
  v13(a1, v11);
  if ((v11->msgh_bits & 0x80000000) != 0)
    goto LABEL_30;
  msgh_remote_port = v11[1].msgh_remote_port;
  if (!msgh_remote_port)
    goto LABEL_30;
  if (msgh_remote_port == -305)
  {
    v11->msgh_remote_port = 0;
    goto LABEL_38;
  }
LABEL_28:
  if ((*(_DWORD *)a1 & 0x80000000) != 0)
  {
    *(_DWORD *)(a1 + 8) = 0;
    mach_msg_destroy((mach_msg_header_t *)a1);
  }
LABEL_30:
  if (v11->msgh_remote_port)
  {
    if ((v11->msgh_bits & 0x1F) == 0x12)
      v25 = 1;
    else
      v25 = 17;
    v26 = mach_msg(v11, v25, v11->msgh_size, 0, 0, 0, 0);
    if ((v26 - 268435459) >= 2)
    {
      if (v26)
      {
        v27 = (FILE *)*MEMORY[0x1E0C80C10];
        v28 = getpid();
        fprintf(v27, "%d: badly generated MIG reply for port %x\n", v28, *a4);
      }
    }
    else
    {
      mach_msg_destroy(v11);
    }
  }
LABEL_38:
  if (v12)
LABEL_39:
    free(v11);
  return 0;
}

uint64_t CACFArray::AppendString(CACFArray *this, const __CFString *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

unsigned int **CAAudioChannelLayout::operator=(unsigned int **a1, unsigned int **a2)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;

  v3 = *a1;
  v4 = *a2;
  if (v3 != *a2)
  {
    if (v3)
    {
      v6 = v3 + 2;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v4 = *a2;
    }
    *a1 = v4;
    if (v4)
    {
      v9 = v4 + 2;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
  }
  return a1;
}

unsigned int **CAAudioChannelLayout::operator=(unsigned int **a1, CAAudioChannelLayout::RefCountedLayout *this)
{
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;

  v4 = *a1;
  if (v4)
  {
    if (v4 + 4 == (unsigned int *)this)
      return a1;
    v5 = v4 + 2;
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  }
  if (this)
    v8 = CAAudioChannelLayout::RefCountedLayout::CreateWithLayout(this, (const AudioChannelLayout *)this);
  else
    v8 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  *a1 = v8;
  return a1;
}

_DWORD *CAAudioChannelLayout::RefCountedLayout::CreateWithLayout(CAAudioChannelLayout::RefCountedLayout *this, const AudioChannelLayout *a2)
{
  int v3;
  unsigned int v4;
  _DWORD *v5;

  v3 = caulk::numeric::exceptional_mul<unsigned int>(*((_DWORD *)this + 2));
  v4 = caulk::numeric::exceptional_add<unsigned int>(v3);
  v5 = CAAudioChannelLayout::RefCountedLayout::operator new((CAAudioChannelLayout::RefCountedLayout *)v4);
  *(_QWORD *)v5 = off_1E5425488;
  v5[2] = 1;
  v5[3] = v4;
  bzero(v5 + 4, v4);
  memcpy(v5 + 4, this, v4);
  return v5;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this)
{
  *(_QWORD *)this = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
}

{
  *(_QWORD *)this = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
}

_DWORD *CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(CAAudioChannelLayout::RefCountedLayout *this)
{
  int v1;
  unsigned int v2;
  _DWORD *v3;

  v1 = caulk::numeric::exceptional_mul<unsigned int>(this);
  v2 = caulk::numeric::exceptional_add<unsigned int>(v1);
  v3 = CAAudioChannelLayout::RefCountedLayout::operator new((CAAudioChannelLayout::RefCountedLayout *)v2);
  *(_QWORD *)v3 = off_1E5425488;
  v3[2] = 1;
  v3[3] = v2;
  bzero(v3 + 4, v2);
  return v3;
}

uint64_t caulk::numeric::exceptional_mul<unsigned int>(unsigned int a1)
{
  uint64_t result;
  std::runtime_error *exception;

  result = 20 * a1;
  if ((result & 0xFFFFFFFF00000000) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic multiplication overflow");
  }
  return result;
}

void sub_1A83727D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::numeric::exceptional_add<unsigned int>(int a1)
{
  BOOL v1;
  uint64_t result;
  std::runtime_error *exception;

  v1 = __CFADD__(a1, 12);
  result = (a1 + 12);
  if (v1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::overflow_error::overflow_error[abi:ne180100](exception, "arithmetic addition overflow");
  }
  return result;
}

void sub_1A8372838(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *CAAudioChannelLayout::RefCountedLayout::operator new(CAAudioChannelLayout::RefCountedLayout *this)
{
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v3;

  result = malloc_type_malloc((size_t)this + 16, 0x7C51E058uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v3 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

void CAAudioChannelLayout::~CAAudioChannelLayout(unsigned int **this)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *this;
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
    *this = 0;
  }
}

uint64_t CAReferenceCounted::releaseObject(uint64_t this)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t SharableMemoryBlock::MachClientToken::Reset(uint64_t this)
{
  uint64_t v1;
  mach_port_name_t v2;

  v1 = this;
  v2 = *(_DWORD *)(this + 16);
  if (v2)
  {
    this = mach_port_deallocate(*MEMORY[0x1E0C83DA0], v2);
    if ((_DWORD)this)
      this = LogMachError("mach_port_deallocate", this);
    *(_DWORD *)(v1 + 16) = 0;
  }
  *(_DWORD *)(v1 + 12) = 0;
  return this;
}

CFPropertyListRef CADeserializer::ReadPlist(CADeserializer *this)
{
  CFDataRef v1;
  CFPropertyListRef v2;
  CFDataRef data;

  data = 0;
  operator>>((uint64_t)this, &data);
  v1 = data;
  if (!data)
    return 0;
  v2 = CFPropertyListCreateWithData(0, data, 0, 0, 0);
  CFRelease(v1);
  return v2;
}

uint64_t operator>>(uint64_t a1, CFDataRef *a2)
{
  unsigned int *Ptr;
  unsigned int v5;
  CFDataRef v6;
  const UInt8 *v8;

  Ptr = (unsigned int *)CADeserializer::GetAndAdvanceReadPtr((CADeserializer *)a1, 4u, 4);
  if (Ptr)
  {
    v5 = *Ptr;
    if ((*Ptr & 0x80000000) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
  if (!*(_BYTE *)(a1 + 32))
  {
    v8 = *(const UInt8 **)(a1 + 16);
    if (*(_QWORD *)(a1 + 24) - (_QWORD)v8 < (uint64_t)v5)
    {
      v6 = 0;
      *(_BYTE *)(a1 + 32) = 1;
      goto LABEL_7;
    }
    *(_QWORD *)(a1 + 16) = &v8[v5];
    if (v8)
    {
      v6 = CFDataCreate(0, v8, v5);
      goto LABEL_7;
    }
  }
LABEL_6:
  v6 = 0;
LABEL_7:
  *a2 = v6;
  return a1;
}

uint64_t operator>>(uint64_t a1, CFStringRef *a2)
{
  unsigned int *Ptr;
  unsigned int v5;
  CFStringRef v6;
  unint64_t v8;
  const UniChar *v9;

  Ptr = (unsigned int *)CADeserializer::GetAndAdvanceReadPtr((CADeserializer *)a1, 4u, 4);
  if (Ptr)
  {
    v5 = *Ptr;
    if ((*Ptr & 0x80000000) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
  if (!*(_BYTE *)(a1 + 32))
  {
    v8 = 2 * v5;
    v9 = *(const UniChar **)(a1 + 16);
    if (*(_QWORD *)(a1 + 24) - (_QWORD)v9 < (int64_t)v8)
    {
      v6 = 0;
      *(_BYTE *)(a1 + 32) = 1;
      goto LABEL_7;
    }
    *(_QWORD *)(a1 + 16) = &v9[v8 / 2];
    if (v9)
    {
      v6 = CFStringCreateWithCharacters(0, v9, v5);
      goto LABEL_7;
    }
  }
LABEL_6:
  v6 = 0;
LABEL_7:
  *a2 = v6;
  return a1;
}

BOOL CADeserializer::Read(CADeserializer *this, void *a2, unsigned int a3, int a4)
{
  const void *Ptr;

  Ptr = (const void *)CADeserializer::GetAndAdvanceReadPtr(this, a3, a4);
  if (Ptr)
    memcpy(a2, Ptr, a3);
  else
    bzero(a2, a3);
  return Ptr != 0;
}

uint64_t Read(CADeserializer *a1, AudioChannelLayout **a2, unint64_t *a3)
{
  AudioChannelLayoutTag *Ptr;
  AudioChannelLayoutTag v7;
  AudioChannelBitmap *v8;
  AudioChannelBitmap v9;
  UInt32 *v10;
  UInt32 v11;
  uint64_t result;
  size_t v13;
  AudioChannelLayout *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int *v18;
  int v19;
  char *v20;
  int *v21;
  int v22;
  char *v23;
  int *v24;
  int v25;
  char *v26;
  int *v27;
  int v28;
  char *v29;
  int *v30;
  int v31;

  *a2 = 0;
  *a3 = 0;
  Ptr = (AudioChannelLayoutTag *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (Ptr)
    v7 = *Ptr;
  else
    v7 = 0;
  v8 = (AudioChannelBitmap *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v8)
    v9 = *v8;
  else
    v9 = 0;
  v10 = (UInt32 *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v10)
  {
    v11 = *v10;
    if (*v10 > 0x400)
      return 0;
  }
  else
  {
    v11 = 0;
  }
  if (*((_BYTE *)a1 + 32))
    return 0;
  v13 = 20 * v11 + 12;
  *a3 = v13;
  v14 = (AudioChannelLayout *)malloc_type_malloc(v13, 0xE884350DuLL);
  *a2 = v14;
  v14->mChannelLayoutTag = v7;
  v14->mChannelBitmap = v9;
  v14->mNumberChannelDescriptions = v11;
  if (v11)
  {
    v15 = 0;
    v16 = 20 * v11;
    do
    {
      v17 = (char *)*a2;
      v18 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v18)
        v19 = *v18;
      else
        v19 = 0;
      *(_DWORD *)&v17[v15 + 12] = v19;
      v20 = (char *)*a2;
      v21 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v21)
        v22 = *v21;
      else
        v22 = 0;
      *(_DWORD *)&v20[v15 + 16] = v22;
      v23 = (char *)*a2;
      v24 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v24)
        v25 = *v24;
      else
        v25 = 0;
      *(_DWORD *)&v23[v15 + 20] = v25;
      v26 = (char *)*a2;
      v27 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v27)
        v28 = *v27;
      else
        v28 = 0;
      *(_DWORD *)&v26[v15 + 24] = v28;
      v29 = (char *)*a2;
      v30 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
      if (v30)
        v31 = *v30;
      else
        v31 = 0;
      *(_DWORD *)&v29[v15 + 28] = v31;
      v15 += 20;
    }
    while (v16 != v15);
  }
  if (!*((_BYTE *)a1 + 32))
    return 1;
  free(*a2);
  result = 0;
  *a2 = 0;
  *a3 = 0;
  return result;
}

uint64_t CADeserializer::GetAndAdvanceReadPtr(CADeserializer *this, unsigned int a2, int a3)
{
  uint64_t result;
  int v5;
  uint64_t v6;

  result = *((_QWORD *)this + 2);
  if (a3)
  {
    v5 = (a3 - 1) & (result - *((_DWORD *)this + 2));
    if (v5)
    {
      v6 = (a3 - v5);
      if (*((_QWORD *)this + 3) - result < v6)
      {
LABEL_6:
        result = 0;
        *((_BYTE *)this + 32) = 1;
        return result;
      }
      result += v6;
      *((_QWORD *)this + 2) = result;
    }
  }
  if (*((_QWORD *)this + 3) - result < a2)
    goto LABEL_6;
  *((_QWORD *)this + 2) = result + a2;
  return result;
}

void XPC_Object::~XPC_Object(XPC_Object *this)
{
  unsigned __int8 v1;

  *(_QWORD *)this = &off_1E5424FB0;
  if (*((_QWORD *)this + 1))
  {
    v1 = atomic_load((unsigned __int8 *)this + 16);
    if ((v1 & 1) != 0)
      xpc_release(*((xpc_object_t *)this + 1));
  }
}

{
  XPC_Object::~XPC_Object(this);
  JUMPOUT(0x1A85D2980);
}

void __copy_helper_block_e8_40c37_ZTSN10applesauce8dispatch2v16sourceE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

uint64_t PropertyMarshaller::Serialize(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  BOOL v6;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a1[3];
  if (a1[5])
    v6 = 1;
  else
    v6 = v5 == 0;
  if (v6)
    return 829646194;
  v12 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*a1 + 16))(a1);
  v13 = a1[5];
  a1[5] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    v12 = (_BYTE *)a1[5];
  }
  if (v12)
  {
    if (a5 == 1)
      v12[32] = 1;
    if (((*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 16))(v12, v5, a3, a4) & 1) != 0)
      return 0;
    v14 = 4;
  }
  else
  {
    v14 = 3;
  }
  return (*(uint64_t (**)(_QWORD *))(*a1 + 8 * v14))(a1);
}

uint64_t __copy_helper_block_e8_32c60_ZTSNSt3__110shared_ptrIN12CADeprecated16XMachReceivePortEEE(uint64_t result, uint64_t a2)
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

void RateRamp::RateRamp(RateRamp *this)
{
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)this = _Q1;
  *((_OWORD *)this + 1) = xmmword_1A839E510;
  *((_OWORD *)this + 2) = xmmword_1A839E510;
  *((_QWORD *)this + 6) = 0;
}

{
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)this = _Q1;
  *((_OWORD *)this + 1) = xmmword_1A839E510;
  *((_OWORD *)this + 2) = xmmword_1A839E510;
  *((_QWORD *)this + 6) = 0;
}

BOOL PlatformUtilities_iOS::ProductIsAppleTV(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 4;
}

void BaseOpaqueObject::destroyOpaqueRef(BaseOpaqueObject *this)
{
  int v1;

  v1 = *((_DWORD *)this + 2);
  if (v1)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::remove(OpaqueObjectMgr::sInstance, v1);
    *((_DWORD *)this + 2) = 0;
  }
}

uint64_t ___ZN14XPC_Connection10InitializeEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

void sub_1A8372FA0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t XPC_Connection::ProcessMessage(XPC_Connection *this, void *a2)
{
  uint64_t result;

  if (MEMORY[0x1A85D32E0](a2) != MEMORY[0x1E0C81310])
  {
    result = *((_QWORD *)this + 3);
    if (!result)
      return result;
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  }
  result = *((_QWORD *)this + 5);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  return result;
}

uint64_t CAAudioChannelLayout::NumberChannels(CAAudioChannelLayout *this, const AudioChannelLayout *a2)
{
  uint8x8_t v3;

  if (*(_DWORD *)this == 0x10000)
  {
    v3 = (uint8x8_t)vcnt_s8((int8x8_t)*((unsigned int *)this + 1));
    v3.i16[0] = vaddlv_u8(v3);
    return v3.u32[0];
  }
  else if (*(_DWORD *)this)
  {
    return (unsigned __int16)*(_DWORD *)this;
  }
  else
  {
    return *((unsigned int *)this + 2);
  }
}

uint64_t PropertyMarshaller::Deserialize(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  BOOL v6;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);

  v5 = a1[4];
  if (a1[5])
    v6 = 1;
  else
    v6 = v5 == 0;
  if (v6)
    return 829646194;
  v12 = (*(uint64_t (**)(_QWORD *))(*a1 + 16))(a1);
  v13 = a1[5];
  a1[5] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    v12 = a1[5];
  }
  if (!v12)
  {
    v14 = *(uint64_t (**)(_QWORD *))(*a1 + 24);
    return v14(a1);
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 24))(v12, v5, a3, a4))
  {
    v14 = *(uint64_t (**)(_QWORD *))(*a1 + 32);
    return v14(a1);
  }
  result = 0;
  if (!a5)
    *(_QWORD *)(a1[5] + 16) = *(_QWORD *)(a1[5] + 8);
  return result;
}

void XOSTransactor::endTransaction(XOSTransactor *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    os_release(v2);
    *((_QWORD *)this + 3) = 0;
  }
}

void PowerMeter::SetSampleRate(PowerMeter *this, double a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  *((double *)this + 1) = a2;
  v4 = a2 * 2.5;
  if (v4 >= 2.22507386e-308)
    v5 = -6.90775528 / v4;
  else
    v5 = -INFINITY;
  v6 = exp(v5);
  if (v5 < -708.4)
    v6 = 0.0;
  *((double *)this + 2) = v6;
  if (a2 * 1.24 >= 2.22507386e-308)
    v7 = -6.90775528 / (a2 * 1.24);
  else
    v7 = -INFINITY;
  v8 = exp(v7);
  if (v7 < -708.4)
    v8 = 0.0;
  *((double *)this + 4) = v8;
}

void RampList::~RampList(RampList *this)
{
  RampList::clear(this);
}

{
  RampList::clear(this);
}

CADeprecated::XRemoteMachServer *CADeprecated::XRemoteMachServer::XRemoteMachServer(CADeprecated::XRemoteMachServer *this, const char *a2, const char *a3)
{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = off_1E54252F8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 4) = a2;
  *((_QWORD *)this + 5) = a3;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::XRemoteMachServer *)((char *)this + 80), "XRemoteMachServer.mLock");
  *((_QWORD *)this + 6) = 0;
  return this;
}

void sub_1A83732B0(_Unwind_Exception *a1)
{
  CADeprecated::XMachPortDeathListener *v1;
  void **v2;
  void **v3;
  void *v5;

  v3 = v2;
  v5 = *v3;
  if (*v3)
  {
    *((_QWORD *)v1 + 8) = v5;
    operator delete(v5);
  }
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(v1);
  _Unwind_Resume(a1);
}

CADeprecated::CAGuard *CADeprecated::CAGuard::CAGuard(CADeprecated::CAGuard *this, const char *a2)
{
  CADeprecated::CAMutex *v3;
  int v4;
  int v6;
  _DWORD *exception;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CADeprecated::CAMutex::CAMutex(this, a2);
  *(_QWORD *)v3 = &off_1E5425360;
  v4 = pthread_cond_init((pthread_cond_t *)((char *)v3 + 88), 0);
  if (v4)
  {
    v6 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "CAGuard.cpp";
      v10 = 1024;
      v11 = 66;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::CAGuard: Could not init the cond var", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v6;
  }
  return this;
}

void sub_1A83733E0(_Unwind_Exception *a1)
{
  CADeprecated::CAMutex *v1;

  CADeprecated::CAMutex::~CAMutex(v1);
  _Unwind_Resume(a1);
}

CADeprecated::CAMutex *CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  int v3;
  int v5;
  _DWORD *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E54253D0;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = 0;
  v3 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v3)
  {
    v5 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "CAMutex.cpp";
      v9 = 1024;
      v10 = 56;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAMutex::CAMutex: Could not init the mutex", (uint8_t *)&v7, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v5;
  }
  return this;
}

uint64_t PlatformUtilities_iOS::ProductIsMuseDevice(PlatformUtilities_iOS *this)
{
  unsigned __int8 v1;
  uint64_t v3;
  PlatformUtilities_iOS *ProductType;
  BOOL v5;

  if ((v1 & 1) == 0
  {
    v3 = MGGetBoolAnswer();
    v5 = (v3 & 1) != 0
      || (ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)v3),
          (_DWORD)ProductType == 173)
      || PlatformUtilities_iOS::GetProductType(ProductType) == 188;
    PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice = v5;
  }
  return PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice;
}

void sub_1A8373580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CADeprecated::XMachReceivePort::CreateMachPort(CADeprecated::XMachReceivePort *this, integer_t a2)
{
  ipc_space_t *v4;
  uint64_t v5;
  uint64_t inserted;
  ipc_space_read_t v7;
  mach_port_name_t v8;
  kern_return_t attributes;
  mach_error_t v10;
  char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  mach_error_t v16;
  mach_error_t v17;
  char *v18;
  uint64_t v19;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out;
  mach_port_name_t name;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  CADeprecated::XMachReceivePort::SetMachPort((unsigned int *)this, 0);
  name = 0;
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v5 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
  if ((_DWORD)v5)
  {
    v19 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "XMachServer.cpp";
      v26 = 1024;
      v27 = 149;
      v28 = 2080;
      v29 = "ret = mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &port)";
      v30 = 1024;
      v31 = v19;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_verify_noerr: [%s, %d]", buf, 0x22u);
    }
  }
  else
  {
    inserted = mach_port_insert_right(*v4, name, name, 0x14u);
    if (!(_DWORD)inserted)
    {
      atomic_store(name, (unsigned int *)this);
      if (a2 >= 1)
      {
        port_info_outCnt = 1;
        v7 = *v4;
        v8 = atomic_load((unsigned int *)this);
        attributes = mach_port_get_attributes(v7, v8, 1, &port_info_out, &port_info_outCnt);
        if (!attributes)
        {
          port_info_out = a2;
          v14 = *v4;
          v15 = atomic_load((unsigned int *)this);
          v16 = MEMORY[0x1A85D2D88](v14, v15, 1, &port_info_out, 1);
          if (!v16)
            return 0;
          v17 = v16;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            return 0;
          v18 = mach_error_string(v17);
          *(_DWORD *)buf = 136315650;
          v25 = "XMachServer.cpp";
          v26 = 1024;
          v27 = 169;
          v28 = 2080;
          v29 = v18;
          v12 = MEMORY[0x1E0C81028];
          v13 = "%25s:%-5d couldn't set mach port limits info (%s)";
          goto LABEL_10;
        }
        v10 = attributes;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v11 = mach_error_string(v10);
          *(_DWORD *)buf = 136315650;
          v25 = "XMachServer.cpp";
          v26 = 1024;
          v27 = 164;
          v28 = 2080;
          v29 = v11;
          v12 = MEMORY[0x1E0C81028];
          v13 = "%25s:%-5d couldn't get mach port limits info (%s)";
LABEL_10:
          _os_log_impl(&dword_1A836D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x1Cu);
        }
      }
      return 0;
    }
    v19 = inserted;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "XMachServer.cpp";
      v26 = 1024;
      v27 = 153;
      v28 = 2080;
      v29 = "ret = mach_port_insert_right(mach_task_self(), port, port, MACH_MSG_TYPE_MAKE_SEND)";
      v30 = 1024;
      v31 = v19;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_verify_noerr: [%s, %d]", buf, 0x22u);
    }
    mach_port_mod_refs(*v4, name, 1u, -1);
  }
  return v19;
}

unsigned int *CADeprecated::XMachReceivePort::SetMachPort(unsigned int *this, unsigned int a2)
{
  mach_port_name_t v2;
  ipc_space_t *v3;

  do
    v2 = __ldaxr(this);
  while (__stlxr(a2, this));
  if (v2)
  {
    v3 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v2, 1u, -1);
    return (unsigned int *)mach_port_deallocate(*v3, v2);
  }
  return this;
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  uint64_t result;
  const __CFDictionary *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFDictionary *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDictionaryGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CADeprecated::CAGuard::NotifyAll(CADeprecated::CAGuard *this)
{
  uint64_t result;
  _DWORD *exception;
  int v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = pthread_cond_broadcast((pthread_cond_t *)((char *)this + 88));
  if ((_DWORD)result)
  {
    v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v5 = "CAGuard.cpp";
      v6 = 1024;
      v7 = 320;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::NotifyAll: failed", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v3;
  }
  return result;
}

uint64_t PowerMeter::Process(PowerMeter *this, float *a2, int a3, int a4)
{
  float *v6;
  double v8;
  uint64_t result;
  float v10;
  int v11;
  float v12;
  int v13;
  float64x2_t v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  float64x2_t v24;
  double v25;
  double v27;
  float v28;
  double v29;
  int v30;
  float *v31;

  v6 = a2;
  v31 = a2;
  PowerMeter::ScaleDecayConstants(this, a4);
  v30 = a4;
  v8 = *((double *)this + 8);
  v29 = v8;
  v28 = 0.0;
  result = gCAVectorUnitType;
  if (gCAVectorUnitType == -1)
    result = CAVectorUnit_Examine();
  v10 = 0.0;
  v11 = a4;
  if ((v6 & 0xF) == 0 && (int)result >= 1)
  {
    result = (uint64_t)PowerMeter::ProcessVector((float32x4_t *)this, (const float **)&v31, &v30, &v28, &v29);
    v11 = v30;
    v6 = v31;
    v10 = v28;
    v8 = v29;
  }
  if (v11 >= 1)
  {
    do
    {
      v12 = *v6;
      if (*v6 < 0.0)
        v12 = -*v6;
      if (v12 > v10)
        v10 = v12;
      v8 = v8 + ((float)(v12 * v12) - v8) * 0.03;
      v6 += a3;
      --v11;
    }
    while (v11);
  }
  if (v10 > *((float *)this + 13))
    *((float *)this + 13) = v10;
  if (v8 != 0.0 && fabs(v8) == INFINITY)
  {
    *((_BYTE *)this + 56) = 1;
    v8 = 0.0;
    v10 = 1.0;
  }
  v13 = *(unsigned __int8 *)this;
  if (*(_BYTE *)this)
  {
    v14.f64[0] = v10;
  }
  else
  {
    v15 = *((double *)this + 13);
    v14.f64[0] = v10;
    if (v15 > v14.f64[0])
      v14.f64[0] = v15 + (v14.f64[0] - v15) * *((double *)this + 5);
  }
  v16 = *((_DWORD *)this + 25) + a4;
  *((_DWORD *)this + 25) = v16;
  v17 = *((double *)this + 15);
  if (v16 >= (int)(*((double *)this + 1) * 0.907029478))
    v17 = v17 - v17 * *((double *)this + 3);
  v18 = sqrt(v8);
  if (v17 < v14.f64[0])
  {
    *((_DWORD *)this + 25) = 0;
    v17 = v14.f64[0];
  }
  v19 = v18 * 1.41421356;
  if (!v13)
  {
    v20 = *((double *)this + 14);
    if (v20 > v19)
      v19 = v20 + (v19 - v20) * *((double *)this + 5);
  }
  if (v19 > v17)
    v19 = v17;
  v21 = fabs(v8);
  if (v21 >= 1.0e15 || v21 <= 1.0e-15)
    v23 = 0.0;
  else
    v23 = v8;
  v14.f64[1] = v19;
  *((double *)this + 8) = v23;
  v24 = vabsq_f64(v14);
  *(int8x16_t *)((char *)this + 104) = vandq_s8((int8x16_t)v14, vandq_s8((int8x16_t)vcgtq_f64(v24, (float64x2_t)vdupq_n_s64(0x3CD203AF9EE75616uLL)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x430C6BF526340000uLL), v24)));
  v25 = fabs(v17);
  if (v25 >= 1.0e15 || v25 <= 1.0e-15)
    v27 = 0.0;
  else
    v27 = v17;
  *((double *)this + 15) = v27;
  return result;
}

float32x4_t *PowerMeter::ProcessVector(float32x4_t *this, const float **a2, int *a3, float *a4, double *a5)
{
  float32x4_t v5;
  int v6;
  const float *v7;
  float32x4_t v8;
  int v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t *v12;
  float32x4_t v13;
  float v14;
  float v15;
  float v16;
  float32x4_t v17;
  float32x4_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  int v23;

  v5 = this[5];
  v6 = *a3;
  v7 = *a2;
  v8 = 0uLL;
  if ((*a3 + 3) >= 7)
  {
    if (v6 < 0)
      v6 = *a3 + 3;
    v9 = v6 >> 2;
    v10 = 16 * (v9 - 1);
    v11 = (float32x4_t)vdupq_n_s32(0x3DEAEB81u);
    v12 = (float32x4_t *)*a2;
    do
    {
      v13 = *v12++;
      v8 = vmaxq_f32(v8, vabsq_f32(v13));
      v5 = vmlaq_f32(v5, v11, vsubq_f32(vmulq_f32(v13, v13), v5));
      --v9;
    }
    while (v9);
    v7 = (const float *)((char *)v7 + v10 + 16);
  }
  *a2 = v7;
  this[5] = v8;
  *a4 = v8.f32[0];
  v14 = this[5].f32[1];
  if (v14 > v8.f32[0])
  {
    *a4 = v14;
    v8.f32[0] = v14;
  }
  v15 = this[5].f32[2];
  if (v15 > v8.f32[0])
  {
    *a4 = v15;
    v8.f32[0] = v15;
  }
  v16 = this[5].f32[3];
  if (v16 > v8.f32[0])
    *a4 = v16;
  this[5] = v5;
  *a5 = vaddq_f32(vaddq_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1), v5), (float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2)), (float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 3)).f32[0]* 0.25;
  v17 = this[5];
  v18 = vabsq_f32(v17);
  v19 = vcvt_hight_f64_f32(v18);
  v20 = vcvtq_f64_f32(*(float32x2_t *)v18.f32);
  v21 = (float64x2_t)vdupq_n_s64(0x3CD203AF9EE75616uLL);
  v22 = (float64x2_t)vdupq_n_s64(0x430C6BF526340000uLL);
  this[5] = (float32x4_t)vandq_s8((int8x16_t)v17, (int8x16_t)vuzp1q_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_f64(v20, v21), (int8x16_t)vcgtq_f64(v22, v20)), (int32x4_t)vandq_s8((int8x16_t)vcgtq_f64(v19, v21), (int8x16_t)vcgtq_f64(v22, v19))));
  v23 = *a3 & 3;
  if (*a3 <= 0)
    v23 = -(-*a3 & 3);
  *a3 = v23;
  return this;
}

void PowerMeter::ScaleDecayConstants(PowerMeter *this, int a2)
{
  long double v4;
  long double v5;

  if (*((_DWORD *)this + 12) != a2)
  {
    if (*((double *)this + 1) == 0.0)
    {
      *(_OWORD *)((char *)this + 8) = xmmword_1A839E570;
      *((_QWORD *)this + 4) = 0x3FEFFEF71A09F35FLL;
      v4 = 0.999937347;
      v5 = 0.999873687;
    }
    else
    {
      v4 = *((double *)this + 2);
      v5 = *((double *)this + 4);
    }
    *((long double *)this + 3) = 1.0 - pow(v4, (double)a2);
    *((long double *)this + 5) = 1.0 - pow(v5, (double)a2);
    *((_DWORD *)this + 12) = a2;
  }
}

void CASerializer::WritePlist(CFMutableDataRef *this, const void *a2)
{
  const __CFData *Data;
  CFDataRef v4;

  Data = CFPropertyListCreateData(0, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  v4 = Data;
  operator<<(this, &v4);
  if (Data)
    CFRelease(Data);
}

CFMutableDataRef *operator<<(CFMutableDataRef *a1, CFDataRef *a2)
{
  int Length;
  const UInt8 *BytePtr;
  CFIndex v6;
  __CFData *Mutable;
  UInt8 bytes[4];

  if (*a2)
    Length = CFDataGetLength(*a2);
  else
    Length = -1;
  *(_DWORD *)bytes = Length;
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, bytes, 4);
  if (*(int *)bytes >= 1)
  {
    BytePtr = CFDataGetBytePtr(*a2);
    v6 = *(unsigned int *)bytes;
    Mutable = *a1;
    if (!*a1)
    {
      Mutable = CFDataCreateMutable(0, 0);
      *a1 = Mutable;
    }
    CFDataAppendBytes(Mutable, BytePtr, v6);
  }
  return a1;
}

CFDataRef CADeserializer::ReadAllData(CADeserializer *this)
{
  const UInt8 *v1;
  CFIndex v2;

  v1 = (const UInt8 *)*((_QWORD *)this + 2);
  v2 = (*((_DWORD *)this + 6) - (_DWORD)v1);
  if (*((_QWORD *)this + 3) - (_QWORD)v1 >= v2)
  {
    *((_QWORD *)this + 2) = &v1[v2];
  }
  else
  {
    v1 = 0;
    *((_BYTE *)this + 32) = 1;
  }
  return CFDataCreate(0, v1, v2);
}

void SharableMemoryBlock::XPCServerToken::~XPCServerToken(xpc_object_t *this)
{
  *this = &off_1E5425468;
  xpc_release(this[2]);
  this[2] = 0;
}

{
  SharableMemoryBlock::XPCServerToken::~XPCServerToken(this);
  JUMPOUT(0x1A85D2980);
}

void SharableMemoryBlock::XPCClientToken::~XPCClientToken(xpc_object_t *this)
{
  *this = &off_1E5425440;
  xpc_release(this[2]);
  this[2] = 0;
}

{
  SharableMemoryBlock::XPCClientToken::~XPCClientToken(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

CFMutableDataRef *operator<<(CFMutableDataRef *a1, CFStringRef *a2)
{
  int Length;
  CFIndex v5;
  const __CFString *v6;
  UInt8 *v7;
  UInt8 bytes[4];
  CFRange v10;

  if (*a2)
    Length = CFStringGetLength(*a2);
  else
    Length = -1;
  *(_DWORD *)bytes = Length;
  CASerializer::PrepareToWrite(a1, 4);
  CFDataAppendBytes(*a1, bytes, 4);
  v5 = *(unsigned int *)bytes;
  if (*(int *)bytes >= 1)
  {
    v6 = *a2;
    v7 = CASerializer::AllocWritePtr(a1, 2 * *(_DWORD *)bytes, 0);
    v10.location = 0;
    v10.length = v5;
    CFStringGetCharacters(v6, v10, (UniChar *)v7);
  }
  return a1;
}

UInt8 *CASerializer::AllocWritePtr(CFMutableDataRef *this, unsigned int a2, int a3)
{
  int Length;

  CASerializer::PrepareToWrite(this, a3);
  Length = CFDataGetLength(*this);
  CFDataIncreaseLength(*this, a2);
  return &CFDataGetMutableBytePtr(*this)[Length];
}

uint64_t CACFPreferencesGetAppIntegerValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  BOOL *v5;
  const __CFString *v6;
  BOOL *v7;
  uint64_t v8;
  char v10;

  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretInteger(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

uint64_t CASmartPreferences::InterpretInteger(const __CFString *this, _BYTE *a2, BOOL *a3)
{
  CFTypeID v5;
  int valuePtr;
  char buffer[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      valuePtr = CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1)
        goto LABEL_6;
    }
  }
  return valuePtr;
}

void OpaqueObjectMgr::OpaqueObjectMgr(OpaqueObjectMgr *this)
{
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &off_1E54255D0;
  v2[3] = v2;
  *((_QWORD *)this + 3) = this;
  std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()>::__clone((uint64_t)v2, this);
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 850045863;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_QWORD *)this + 17) = 0;
  *((_DWORD *)this + 36) = 0;
  atomic_store((getpid() & 0x3FFFF) << 12, (unsigned int *)this + 36);
}

void sub_1A83743B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::~guarded_lookup_hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E54255D0;
}

uint64_t SharableMemoryBlock::InitServer(uint64_t a1, size_t a2, _DWORD *a3)
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  pid_t v9;
  int v10;
  void *v11;
  uint64_t memory_entry_64;
  uint64_t v13;
  uint64_t v14;
  memory_object_size_t v15;
  vm_map_t *v16;
  void *v17;
  int v18;
  memory_object_offset_t v19;
  xpc_object_t v20;
  void *v21;
  xpc_object_t v22;
  void *v23;
  memory_object_size_t size;
  char __str[8];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v6 = a3[2];
  if (!v6)
  {
    v13 = a2 + *MEMORY[0x1E0C85AD8] - 1;
    v14 = -*MEMORY[0x1E0C85AD8];
    *(_QWORD *)__str = 0;
    v15 = v13 & v14;
    if ((v13 & v14) != 0)
    {
      v16 = (vm_map_t *)MEMORY[0x1E0C83DA0];
      memory_entry_64 = vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)__str, v13 & v14, 1);
      if ((_DWORD)memory_entry_64)
      {
        LogMachError("vm_allocate", memory_entry_64);
        return memory_entry_64;
      }
      size = v15;
      memory_entry_64 = mach_make_memory_entry_64(*v16, &size, *(memory_object_offset_t *)__str, 3, (mach_port_t *)(a1 + 32), 0);
      if ((_DWORD)memory_entry_64)
      {
        MEMORY[0x1A85D31B4](*v16, *(_QWORD *)__str, v15);
        LogMachError("mach_make_memory_entry_64", memory_entry_64);
        return memory_entry_64;
      }
      ++debugSerial;
      v19 = *(_QWORD *)__str;
      **(_DWORD **)__str = debugSerial;
      v18 = *(_DWORD *)(a1 + 32);
    }
    else
    {
      v18 = 0;
      v19 = 0;
      *(_DWORD *)(a1 + 32) = 0;
    }
    memory_entry_64 = 0;
    *(_WORD *)(a1 + 8) = 257;
    *(_QWORD *)(a1 + 16) = v15;
    *(_QWORD *)(a1 + 24) = v19;
    a3[3] = v15;
LABEL_23:
    a3[4] = v18;
    return memory_entry_64;
  }
  if (v6 == 1)
  {
    *(_QWORD *)(a1 + 16) = a2;
    v17 = mmap(0, a2, 3, 4097, -1, 0);
    *(_QWORD *)(a1 + 24) = v17;
    if ((unint64_t)v17 + 1 <= 1)
    {
      memory_entry_64 = *__error();
      LogPosixError("mmap");
      return memory_entry_64;
    }
    *(_WORD *)(a1 + 8) = 257;
    v20 = xpc_shmem_create(v17, *(_QWORD *)(a1 + 16));
    if (!v20)
      v20 = xpc_null_create();
    v21 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v20;
    xpc_release(v21);
    a3[3] = *(_QWORD *)(a1 + 16);
    v22 = *(xpc_object_t *)(a1 + 48);
    if (v22)
      xpc_retain(v22);
    else
      v22 = xpc_null_create();
    v23 = (void *)*((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = v22;
    xpc_release(v23);
    return 0;
  }
  if (v6 != 2)
    return 0;
  do
  {
    v7 = __ldxr(&SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum);
    v8 = v7 + 1;
  }
  while (__stxr(v7 + 1, &SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum));
  *(_DWORD *)(a1 + 40) = v8;
  v9 = getpid();
  snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
  v10 = shm_open(__str, 514, 511);
  *(_DWORD *)(a1 + 36) = v10;
  if (v10 == -1)
  {
    LogPosixError("shm_open");
    return *__error();
  }
  ftruncate(v10, a2);
  *(_QWORD *)(a1 + 16) = a2;
  v11 = mmap(0, a2, 3, 1, *(_DWORD *)(a1 + 36), 0);
  *(_QWORD *)(a1 + 24) = v11;
  if ((unint64_t)v11 + 1 > 1)
  {
    memory_entry_64 = 0;
    *(_WORD *)(a1 + 8) = 257;
    a3[3] = *(_QWORD *)(a1 + 16);
    v18 = *(_DWORD *)(a1 + 36);
    goto LABEL_23;
  }
  memory_entry_64 = *__error();
  LogPosixError("mmap");
  close(*(_DWORD *)(a1 + 36));
  *(_DWORD *)(a1 + 36) = -1;
  shm_unlink(__str);
  return memory_entry_64;
}

void sub_1A83746F8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t SharableMemoryBlock::InitClient(uint64_t a1, _DWORD *a2)
{
  int v4;
  mem_entry_name_port_t v5;
  vm_size_t v6;
  ipc_space_t *v7;
  uint64_t v8;
  xpc_object_t v9;
  int v10;
  size_t v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  xpc_object_t v18;
  void *v19;
  _BYTE address[12];
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = a2[2];
  if (v4 == 2)
  {
    v10 = a2[4];
    *(_DWORD *)(a1 + 36) = v10;
    a2[4] = -1;
    v11 = a2[3];
    *(_QWORD *)(a1 + 16) = v11;
    v12 = mmap(0, v11, 3, 1, v10, 0);
    *(_QWORD *)(a1 + 24) = v12;
    if ((unint64_t)v12 + 1 < 2)
    {
      v8 = *__error();
      LogPosixError("mmap");
      close(*(_DWORD *)(a1 + 36));
      *(_DWORD *)(a1 + 36) = -1;
      return v8;
    }
    goto LABEL_13;
  }
  if (v4 != 1)
  {
    if (v4)
      return 0;
    *(_QWORD *)address = 0;
    v5 = a2[4];
    v6 = (*MEMORY[0x1E0C85AD8] + a2[3] - 1) & -*MEMORY[0x1E0C85AD8];
    *(_DWORD *)(a1 + 32) = v5;
    a2[4] = 0;
    v7 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    v8 = vm_map(*MEMORY[0x1E0C83DA0], (vm_address_t *)address, v6, 0xFuLL, 1, v5, 0, 0, 3, 3, 1u);
    if ((_DWORD)v8)
    {
      mach_port_deallocate(*v7, *(_DWORD *)(a1 + 32));
      *(_DWORD *)(a1 + 32) = 0;
      LogMachError("vm_map", v8);
    }
    else
    {
      *(_WORD *)(a1 + 8) = 256;
      v17 = *(_QWORD *)address;
      *(_QWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 24) = v17;
    }
    return v8;
  }
  v9 = (xpc_object_t)*((_QWORD *)a2 + 2);
  if (v9)
    xpc_retain(*((xpc_object_t *)a2 + 2));
  else
    v9 = xpc_null_create();
  v13 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v9;
  xpc_release(v13);
  v14 = xpc_null_create();
  v15 = (void *)*((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v14;
  xpc_release(v15);
  v16 = xpc_shmem_map(*(xpc_object_t *)(a1 + 48), (void **)(a1 + 24));
  *(_QWORD *)(a1 + 16) = v16;
  if (v16)
  {
LABEL_13:
    v8 = 0;
    *(_WORD *)(a1 + 8) = 256;
    return v8;
  }
  v18 = xpc_null_create();
  v19 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v18;
  xpc_release(v19);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)address = 136315394;
    *(_QWORD *)&address[4] = "SharableMemory.cpp";
    v22 = 1024;
    v23 = 211;
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d xpc_shmem_map failed", address, 0x12u);
  }
  return 0xFFFFFFFFLL;
}

void sub_1A8374988(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void SharableMemoryBlock::Free(SharableMemoryBlock *this)
{
  ipc_space_t *v2;
  uint64_t v3;
  mach_port_name_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  int v8;
  pid_t v9;
  char __str[64];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)this + 3))
  {
    if (*((_BYTE *)this + 9))
    {
      if (*((_DWORD *)this + 8))
      {
        v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
        v3 = MEMORY[0x1A85D31B4](*MEMORY[0x1E0C83DA0]);
        if ((_DWORD)v3)
          LogMachError("vm_deallocate", v3);
        v4 = *((_DWORD *)this + 8);
        if (v4)
        {
          v5 = mach_port_deallocate(*v2, v4);
          if ((_DWORD)v5)
            LogMachError("mach_port_deallocate", v5);
        }
        *((_BYTE *)this + 9) = 0;
        *((_DWORD *)this + 8) = 0;
      }
      else if (MEMORY[0x1A85D32E0](*((_QWORD *)this + 6)) == MEMORY[0x1E0C81350])
      {
        if (*((_DWORD *)this + 9) != -1)
        {
          if (munmap(*((void **)this + 3), *((_QWORD *)this + 2)))
            LogPosixError("munmap");
          if (close(*((_DWORD *)this + 9)))
            LogPosixError("close");
          if (*((_BYTE *)this + 8))
          {
            v8 = *((_DWORD *)this + 10);
            v9 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
            if (shm_unlink(__str))
              LogPosixError("shm_unlink");
          }
          *((_DWORD *)this + 9) = -1;
        }
      }
      else
      {
        v6 = xpc_null_create();
        v7 = (void *)*((_QWORD *)this + 6);
        *((_QWORD *)this + 6) = v6;
        xpc_release(v7);
        if (munmap(*((void **)this + 3), *((_QWORD *)this + 2)))
          LogPosixError("munmap");
      }
    }
    else if (*((_BYTE *)this + 8))
    {
      free(*((void **)this + 3));
    }
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
}

void sub_1A8374B64(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

BOOL CADeprecated::CAMutex::IsOwnedByCurrentThread(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;

  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  return pthread_equal(v2, v3) != 0;
}

void XPC_Connection::Initialize(XPC_Connection *this)
{
  _xpc_connection_s *v2;
  _QWORD handler[5];

  v2 = (_xpc_connection_s *)*((_QWORD *)this + 1);
  if (v2)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = ___ZN14XPC_Connection10InitializeEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_291;
    handler[4] = this;
    xpc_connection_set_event_handler(v2, handler);
    xpc_connection_set_context(*((xpc_connection_t *)this + 1), this);
  }
}

CFDictionaryRef CACFPreferences::CopyMultipleValues(CACFPreferences *this, const __CFArray *a2, int a3)
{
  int v4;
  const __CFString **v6;
  const __CFString *v7;
  CFStringRef *v8;

  v4 = (int)a2;
  CACFPreferences::Synchronize(a2, a3, 0);
  v6 = (const __CFString **)MEMORY[0x1E0C9B260];
  if (!v4)
    v6 = (const __CFString **)MEMORY[0x1E0C9B240];
  v7 = *v6;
  v8 = (CFStringRef *)MEMORY[0x1E0C9B250];
  if (!a3)
    v8 = (CFStringRef *)MEMORY[0x1E0C9B230];
  return CFPreferencesCopyMultiple(this, (CFStringRef)*MEMORY[0x1E0C9B228], v7, *v8);
}

uint64_t CACFPreferences::Synchronize(CACFPreferences *this, int a2, char a3)
{
  int v4;
  uint64_t result;
  const __CFString **v6;
  const __CFString *v7;
  CFStringRef *v8;
  char *v9;

  v4 = (int)this;
  if ((a3 & 1) != 0 || (result = CACFPreferences::ArePrefsOutOfDate(this, a2), (_DWORD)result))
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B260];
    if (!v4)
      v6 = (const __CFString **)MEMORY[0x1E0C9B240];
    v7 = *v6;
    v8 = (CFStringRef *)MEMORY[0x1E0C9B250];
    if (!a2)
      v8 = (CFStringRef *)MEMORY[0x1E0C9B230];
    result = CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], v7, *v8);
    if ((v4 & 1) != 0 || a2)
    {
      if (((a2 ^ 1) & 1) != 0 || v4)
      {
        if (((v4 ^ 1) & 1) != 0 || a2)
        {
          if (((v4 ^ 1 | a2 ^ 1) & 1) != 0)
            return result;
          v9 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
        }
        else
        {
          v9 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
        }
      }
      else
      {
        v9 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
      }
    }
    else
    {
      v9 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
    }
    *v9 = 0;
  }
  return result;
}

BOOL CACFPreferences::ArePrefsOutOfDate(CACFPreferences *this, int a2)
{
  int v2;

  if ((this & 1) != 0 || (a2 & 1) != 0)
  {
    if (((a2 ^ 1) & 1) != 0 || (this & 1) != 0)
    {
      if (((this ^ 1) & 1) != 0 || (a2 & 1) != 0)
      {
        if (((this ^ 1 | a2 ^ 1) & 1) != 0)
          return 0;
        v2 = CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        v2 = CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      v2 = CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    v2 = CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  return v2 != 0;
}

BOOL CADeprecated::CAGuard::WaitFor(CADeprecated::CAGuard *this, unint64_t a2)
{
  _opaque_pthread_t *v4;
  _opaque_pthread_t *v5;
  __darwin_time_t v6;
  unint64_t *v7;
  int v8;
  int v9;
  _DWORD *exception;
  timespec v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = pthread_self();
  v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v4, v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "CAGuard.cpp";
      v15 = 1024;
      v16 = 130;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::WaitFor: A thread has to have locked a guard be for it can wait", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = 1;
LABEL_14:
  }
  if (a2 <= 0x3B9AC9FF)
  {
    v6 = 0;
  }
  else
  {
    v6 = a2 / 0x3B9ACA00;
    a2 %= 0x3B9ACA00uLL;
  }
  v12.tv_sec = v6;
  v12.tv_nsec = a2;
  v7 = (unint64_t *)((char *)this + 16);
  atomic_store(0, (unint64_t *)this + 2);
  v8 = pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24), &v12);
  v9 = v8;
  if (v8 && v8 != 60)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "CAGuard.cpp";
      v15 = 1024;
      v16 = 169;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::WaitFor: Wait got an error", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v9;
    goto LABEL_14;
  }
  atomic_store((unint64_t)pthread_self(), v7);
  return v9 == 60;
}

_QWORD *RampList::Writer::clear(RampList **this)
{
  return RampList::clear(this[1]);
}

void PowerMeter::PowerMeter(PowerMeter *this)
{
  *(_BYTE *)this = 0;
  *(_OWORD *)((char *)this + 8) = xmmword_1A839E550;
  *(_OWORD *)((char *)this + 24) = xmmword_1A839E560;
  *((_QWORD *)this + 8) = 0;
  *((_WORD *)this + 28) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 5) = 0x3F90624DD2F1A9FCLL;
  *((_QWORD *)this + 6) = 0xFFFFFFFFLL;
}

{
  *(_BYTE *)this = 0;
  *(_OWORD *)((char *)this + 8) = xmmword_1A839E550;
  *(_OWORD *)((char *)this + 24) = xmmword_1A839E560;
  *((_QWORD *)this + 8) = 0;
  *((_WORD *)this + 28) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 5) = 0x3F90624DD2F1A9FCLL;
  *((_QWORD *)this + 6) = 0xFFFFFFFFLL;
}

uint64_t SincKernelFactory::ReferenceSincKernel(SincKernelFactory *this, int a2, int a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;

  v10 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  if (v10)
  {
    v11 = 0;
    v12 = v10 >> 3;
    v13 = 1;
    while (1)
    {
      v14 = *(_QWORD *)(*(_QWORD *)this + 8 * v11);
      if (*(double *)(v14 + 32) == a5
        && *(double *)(v14 + 24) == a4
        && *(_DWORD *)(v14 + 12) == a2
        && *(_DWORD *)(v14 + 16) == a3)
      {
        break;
      }
      v11 = v13;
      if (v12 <= v13++)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v14 = operator new();
    SincKernel::SincKernel((SincKernel *)v14, a2, a3, a4, a5);
    v17 = (uint64_t *)*((_QWORD *)this + 1);
    v16 = *((_QWORD *)this + 2);
    if ((unint64_t)v17 >= v16)
    {
      v19 = *(uint64_t **)this;
      v20 = ((uint64_t)v17 - *(_QWORD *)this) >> 3;
      v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 61)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v22 = v16 - (_QWORD)v19;
      if (v22 >> 2 > v21)
        v21 = v22 >> 2;
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
        v23 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v23 = v21;
      if (v23)
      {
        if (v23 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v24 = (char *)operator new(8 * v23);
      }
      else
      {
        v24 = 0;
      }
      v25 = (uint64_t *)&v24[8 * v20];
      *v25 = v14;
      v18 = v25 + 1;
      if (v17 != v19)
      {
        do
        {
          v26 = *--v17;
          *--v25 = v26;
        }
        while (v17 != v19);
        v17 = *(uint64_t **)this;
      }
      *(_QWORD *)this = v25;
      *((_QWORD *)this + 1) = v18;
      *((_QWORD *)this + 2) = &v24[8 * v23];
      if (v17)
        operator delete(v17);
    }
    else
    {
      *v17 = v14;
      v18 = v17 + 1;
    }
    *((_QWORD *)this + 1) = v18;
  }
  ++*(_DWORD *)(v14 + 8);
  return v14;
}

void sub_1A83751D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A85D2980](v1, 0x1080C4003DAF236);
  _Unwind_Resume(a1);
}

void SincKernel::CalculateFilterCoefficients(SincKernel *this)
{
  double v2;
  uint64_t v3;
  double v4;
  _DWORD *v5;
  uint64_t Kaiser;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  float v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  uint64_t v18;
  double v19;
  double v20;
  float v21;
  float v22;
  int v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  double v29;
  uint64_t v30;

  v2 = *((double *)this + 4);
  v3 = (*((_DWORD *)this + 3) * *((_DWORD *)this + 4));
  v4 = (double)(int)v3 * 0.5;
  v5 = (_DWORD *)operator new[]();
  Kaiser = GetKaiser((int)v3 - 1, *((double *)this + 3));
  v7 = *((unsigned int *)this + 4);
  v8 = *((int *)this + 3);
  v9 = 3.14159265 / (double)(int)v7;
  v10 = v2 * v9;
  v11 = *((unsigned int *)this + 3);
  if ((int)v8 < 128)
  {
    v14 = cos(v2 * v9);
    if ((int)v3 >= 1)
    {
      v15 = v14 + v14;
      v16 = v2 * sin(v2 * ((-2.0 - v4) * v9));
      v17 = sin(v2 * ((-1.0 - v4) * v9));
      v18 = 0;
      v19 = v2 * v17;
      do
      {
        v20 = -(v16 - v15 * v19);
        v21 = v20 * *(float *)(Kaiser + 4 * v18) / (v10 * ((double)(int)v18 - v4));
        *(float *)&v5[v18++] = v21;
        v16 = v19;
        v19 = v20;
      }
      while (v3 != v18);
    }
  }
  else if ((int)v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      v13 = v2 * sin(v10 * ((double)(int)i - v4)) * *(float *)(Kaiser + 4 * i) / (v10 * ((double)(int)i - v4));
      *(float *)&v5[i] = v13;
    }
  }
  *v5 = 0;
  v22 = v2;
  *(float *)&v5[(int)v4] = v22;
  v5[(int)v3] = 0;
  if ((int)v11 >= 0)
    v23 = v11;
  else
    v23 = v11 + 1;
  *((_DWORD *)this + 5) = (v23 >> 1) - 1;
  if ((v7 & 0x80000000) == 0)
  {
    v24 = 0;
    v25 = *(double *)this;
    v26 = v7 + 1;
    v27 = 4 * v7;
    do
    {
      if ((int)v8 >= 1)
      {
        v28 = &v5[(int)v7];
        v29 = v25;
        v30 = v11;
        do
        {
          **(_DWORD **)&v29 = *v28;
          *(_QWORD *)&v29 += 4;
          v28 = (_DWORD *)((char *)v28 + v27);
          --v30;
        }
        while (v30);
      }
      ++v24;
      LODWORD(v7) = v7 - 1;
      *(_QWORD *)&v25 += 4 * v8;
    }
    while (v24 != v26);
  }
  JUMPOUT(0x1A85D2968);
}

uint64_t GetKaiser(int a1, double a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  int64_t v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  _BYTE v29[24];
  uint64_t *v30;
  _QWORD v31[3];
  char v32;
  __int128 v33;
  __int128 v34;

  {
    GetKaiser(unsigned int,double)::sKaiserWindows = 0;
    qword_1ECEF39E8 = 0;
    xmmword_1ECEF39D8 = 0uLL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  v5 = *((_QWORD *)&xmmword_1ECEF39D8 + 1);
  if ((_QWORD)xmmword_1ECEF39D8 == *((_QWORD *)&xmmword_1ECEF39D8 + 1))
  {
LABEL_7:
    if (*((_QWORD *)&xmmword_1ECEF39D8 + 1) >= (unint64_t)qword_1ECEF39E8)
    {
      v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)&xmmword_1ECEF39D8 + 1) - xmmword_1ECEF39D8) >> 3);
      if (v8 + 1 > 0x666666666666666)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v9 = 0x999999999999999ALL * ((qword_1ECEF39E8 - (uint64_t)xmmword_1ECEF39D8) >> 3);
      if (v9 <= v8 + 1)
        v9 = v8 + 1;
      if (0xCCCCCCCCCCCCCCCDLL * ((qword_1ECEF39E8 - (uint64_t)xmmword_1ECEF39D8) >> 3) >= 0x333333333333333)
        v10 = 0x666666666666666;
      else
        v10 = v9;
      v30 = &qword_1ECEF39E8;
      if (v10)
      {
        if (v10 > 0x666666666666666)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v11 = (char *)operator new(40 * v10);
      }
      else
      {
        v11 = 0;
      }
      v28 = v11;
      *(_QWORD *)v29 = &v11[40 * v8];
      *(_QWORD *)&v29[16] = &v11[40 * v10];
      KaiserWindow::KaiserWindow(*(KaiserWindow **)v29, a1, a2);
      v13 = *(_QWORD *)v29;
      *(_QWORD *)&v29[8] = *(_QWORD *)v29 + 40;
      v14 = *((_QWORD *)&xmmword_1ECEF39D8 + 1);
      v15 = xmmword_1ECEF39D8;
      *(_QWORD *)&v34 = *(_QWORD *)v29;
      *((_QWORD *)&v34 + 1) = *(_QWORD *)v29;
      v33 = v34;
      v31[0] = &qword_1ECEF39E8;
      v31[1] = &v33;
      v31[2] = &v34;
      v32 = 0;
      while (v14 != v15)
      {
        v16 = *(_OWORD *)(v14 - 40);
        *(_QWORD *)(v13 - 24) = 0;
        v17 = v13 - 24;
        *(_OWORD *)(v13 - 40) = v16;
        *(_QWORD *)(v17 + 8) = 0;
        *(_QWORD *)(v17 + 16) = 0;
        v19 = *(_BYTE **)(v14 - 24);
        v18 = *(_BYTE **)(v14 - 16);
        v20 = v18 - v19;
        if (v18 != v19)
        {
          std::vector<float>::__vallocate[abi:ne180100]((_QWORD *)(v13 - 24), v20 >> 2);
          v21 = *(char **)(v13 - 16);
          memmove(v21, v19, v20);
          *(_QWORD *)(v13 - 16) = &v21[4 * (v20 >> 2)];
        }
        v14 -= 40;
        v13 = *((_QWORD *)&v34 + 1) - 40;
        *((_QWORD *)&v34 + 1) -= 40;
      }
      v32 = 1;
      std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<KaiserWindow>,std::reverse_iterator<KaiserWindow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v31);
      v22 = qword_1ECEF39E8;
      v23 = *(_OWORD *)&v29[8];
      v27 = *(_QWORD *)&v29[8];
      v24 = xmmword_1ECEF39D8;
      *(_QWORD *)&xmmword_1ECEF39D8 = v13;
      *(_OWORD *)v29 = v24;
      *(__int128 *)((char *)&xmmword_1ECEF39D8 + 8) = v23;
      *(_QWORD *)&v29[16] = v22;
      v28 = (char *)v24;
      std::__split_buffer<KaiserWindow>::~__split_buffer((uint64_t)&v28);
      v7 = v27;
    }
    else
    {
      KaiserWindow::KaiserWindow(*((KaiserWindow **)&xmmword_1ECEF39D8 + 1), a1, a2);
      v7 = v5 + 40;
      *((_QWORD *)&xmmword_1ECEF39D8 + 1) = v5 + 40;
    }
    *((_QWORD *)&xmmword_1ECEF39D8 + 1) = v7;
    v12 = (uint64_t *)(v7 - 24);
  }
  else
  {
    v6 = xmmword_1ECEF39D8;
    while (*(_DWORD *)v6 != a1 || *(double *)(v6 + 8) != a2)
    {
      v6 += 40;
      if (v6 == *((_QWORD *)&xmmword_1ECEF39D8 + 1))
        goto LABEL_7;
    }
    v12 = (uint64_t *)(v6 + 16);
  }
  v25 = *v12;
  os_unfair_lock_unlock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  return v25;
}

void sub_1A83756D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::__split_buffer<KaiserWindow>::~__split_buffer((uint64_t)va);
  os_unfair_lock_unlock((os_unfair_lock_t)&GetKaiser(unsigned int,double)::sKaiserWindows);
  _Unwind_Resume(a1);
}

_QWORD *SincKernelFactory::ReleaseSincKernel(_QWORD *result, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    v3 = *(_DWORD *)(a2 + 8) - 1;
    *(_DWORD *)(a2 + 8) = v3;
    if (!v3)
    {
      v4 = result;
      v6 = *result;
      v5 = result[1];
      if (v5 != *result)
      {
        v7 = 0;
        v8 = 1;
        do
        {
          if (*(_QWORD *)(v6 + 8 * v7) == a2)
          {
            v10 = v6 + 8 * v7;
            v11 = v5 - (v10 + 8);
            if (v5 != v10 + 8)
              memmove((void *)(v6 + 8 * v7), (const void *)(v10 + 8), v5 - (v10 + 8));
            v4[1] = v10 + v11;
            free(*(void **)a2);
            JUMPOUT(0x1A85D2980);
          }
          v7 = v8;
        }
        while ((v5 - *result) >> 3 > (unint64_t)v8++);
      }
    }
  }
  return result;
}

pthread_t CADeprecated::CAGuard::Wait(CADeprecated::CAGuard *this)
{
  _opaque_pthread_t *v2;
  _opaque_pthread_t *v3;
  int v4;
  pthread_t result;
  _DWORD *exception;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = pthread_self();
  v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 2);
  if (!pthread_equal(v2, v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "CAGuard.cpp";
      v10 = 1024;
      v11 = 88;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Wait: A thread has to have locked a guard before it can wait", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = 1;
LABEL_10:
  }
  atomic_store(0, (unint64_t *)this + 2);
  v4 = pthread_cond_wait((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24));
  if (v4)
  {
    v7 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "CAGuard.cpp";
      v10 = 1024;
      v11 = 97;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Wait: Could not wait for a signal", (uint8_t *)&v8, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v7;
    goto LABEL_10;
  }
  result = pthread_self();
  atomic_store((unint64_t)result, (unint64_t *)this + 2);
  return result;
}

swix::ipc_interface *swix::ipc_interface::ipc_interface(swix::ipc_interface *a1, const swix::connection_config *a2)
{
  swix::ipc_endpoint *v4;
  uint64_t v5;

  *(_QWORD *)a1 = off_1E5425528;
  *((_QWORD *)a1 + 1) = 0;
  if (*((_BYTE *)a2 + 128))
  {
    v4 = (swix::ipc_endpoint *)operator new();
    swix::ipc_endpoint::ipc_endpoint(v4, a2, a1);
    v5 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v4;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
  return a1;
}

void sub_1A8375A0C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x1A85D2980](v2, 0x10A1C404C29359ELL);
  v4 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  _Unwind_Resume(a1);
}

swix::ipc_endpoint *swix::ipc_endpoint::ipc_endpoint(swix::ipc_endpoint *this, const swix::connection_config *a2, swix::ipc_interface *a3)
{
  swix::connection *v5;
  _QWORD v7[5];
  _xpc_connection_s *v8;

  v5 = swix::connection::connection(this, a2);
  *(_QWORD *)v5 = &off_1E5425500;
  *((_QWORD *)v5 + 6) = 0;
  *((_QWORD *)v5 + 7) = a3;
  swix::connection::xpc_connection((os_unfair_lock_s **)v5, (swix::detail::connection_impl *)&v8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZN4swix12ipc_endpointC2ERKNS_17connection_configERNS_13ipc_interfaceE_block_invoke;
  v7[3] = &__block_descriptor_tmp_9;
  v7[4] = this;
  swix::connection::state::set_handler(*((_QWORD *)this + 1), v8, v7);
  xpc_release(v8);
  return this;
}

void sub_1A8375AE4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  xpc_release(*(xpc_object_t *)(v2 - 24));
  v4 = (_QWORD *)v1[6];
  if (v4 == v1 + 3)
  {
    v5 = 4;
    v4 = v1 + 3;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  *v1 = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 1));
  _Unwind_Resume(a1);
}

swix::connection::state *swix::connection::state::state(swix::connection::state *this, const swix::connection_config *a2, xpc_object_t *a3)
{
  swix::detail::connection_impl *v6;
  const applesauce::xpc::connection *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
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
  uint64_t v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v6 = (swix::connection::state *)((char *)this + 16);
  swix::connection_config::connection_config((std::string *)((char *)this + 16), a2);
  *((_QWORD *)this + 18) = 0;
  v8 = swix::detail::connection_impl::create(v6, a3, v7);
  *((_DWORD *)this + 38) = 0;
  *((_QWORD *)this + 20) = v8;
  if (!*((_BYTE *)a2 + 120))
  {
    *((_QWORD *)this + 21) = 0;
    *((_QWORD *)this + 22) = 0;
    return this;
  }
  v9 = (std::__shared_weak_count *)operator new(0x60uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257B0;
  v22 = *((_QWORD *)a2 + 10);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)a2 + 88);
  swix::detail::watchdog_timer::watchdog_timer((uint64_t)&v9[1], &v22);
  v11 = v24;
  if (v24 == v23)
  {
    v12 = 4;
    v11 = v23;
    goto LABEL_7;
  }
  if (v24)
  {
    v12 = 5;
LABEL_7:
    (*(void (**)(_QWORD *))(*v11 + 8 * v12))(v11);
  }
  *((_QWORD *)this + 21) = v9 + 1;
  *((_QWORD *)this + 22) = v9;
  shared_owners = (std::__shared_weak_count *)v9[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1)
      return this;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&v9[1];
    v9[1].__shared_owners_ = (uint64_t)v9;
    std::__shared_weak_count::__release_weak(shared_owners);
  }
  else
  {
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v18 = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&v9[1];
    v9[1].__shared_owners_ = (uint64_t)v9;
  }
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  return this;
}

void sub_1A8375D10(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  swix::connection_config *v3;
  void *v5;
  const void *v6;
  std::__shared_weak_count *v7;

  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v5);
  v6 = *(const void **)(v1 + 144);
  if (v6)
    _Block_release(v6);
  swix::connection_config::~connection_config(v3);
  v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
  _Unwind_Resume(a1);
}

uint64_t swix::detail::connection_impl::create(swix::detail::connection_impl *this, xpc_object_t *a2, const applesauce::xpc::connection *a3)
{
  uint64_t v5;
  int8x16_t v6;
  xpc_object_t v7;
  xpc_connection_t *v8;
  xpc_object_t v9;
  _BOOL4 v10;
  NSObject *v11;
  void **v12;
  void *__p[2];
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void **v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = operator new();
  v6 = *(int8x16_t *)((char *)this + 56);
  *(int8x16_t *)v5 = vextq_s8(v6, v6, 8uLL);
  if (v6.i64[0])
    dispatch_retain((dispatch_object_t)v6.i64[0]);
  v7 = *a2;
  *(_QWORD *)(v5 + 16) = *a2;
  v8 = (xpc_connection_t *)(v5 + 16);
  if (v7)
    xpc_retain(v7);
  else
    *v8 = (xpc_connection_t)xpc_null_create();
  v9 = xpc_null_create();
  v10 = xpc_equal(*a2, v9);
  xpc_release(v9);
  if (v10 || xpc_connection_get_context(*v8))
    std::terminate();
  xpc_connection_set_target_queue(*(xpc_connection_t *)(v5 + 16), *(dispatch_queue_t *)(v5 + 8));
  v11 = *(NSObject **)v5;
  if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEFAULT))
  {
    applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)__p, (uint64_t)*v8);
    if (v15 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    *(_DWORD *)buf = 134218242;
    v17 = v5;
    v18 = 2080;
    v19 = v12;
    _os_log_impl(&dword_1A836D000, v11, OS_LOG_TYPE_DEFAULT, "created connimpl %p: %s", buf, 0x16u);
    if (v15 < 0)
      operator delete(__p[0]);
  }
  xpc_connection_set_context(*(xpc_connection_t *)(v5 + 16), (void *)v5);
  xpc_connection_set_finalizer_f(*v8, (xpc_finalizer_t)swix::detail::connection_impl::connection_impl(swix::connection_config const&,applesauce::xpc::connection const&)::{lambda(void *)#1}::__invoke);
  return v5;
}

void sub_1A8375EFC(_Unwind_Exception *a1)
{
  uint64_t v1;
  xpc_object_t *v2;
  NSObject *v4;

  applesauce::xpc::connection::~connection(v2);
  v4 = *(NSObject **)(v1 + 8);
  if (v4)
    dispatch_release(v4);
  MEMORY[0x1A85D2980](v1, 0xE0C40F9C386F3);
  _Unwind_Resume(a1);
}

void applesauce::xpc::connection::to_debug_string(applesauce::xpc::connection *this, uint64_t a2)
{
  char *v3;

  v3 = (char *)MEMORY[0x1A85D3280](a2);
  std::string::basic_string[abi:ne180100]<0>(this, v3);
  free(v3);
}

void swix::connection::description(os_unfair_lock_s **this@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;

  swix::connection::state::xpc_connection(this[1], (swix::detail::connection_impl *)&v7);
  v3 = v7;
  v4 = MEMORY[0x1A85D32E0](v7);
  v5 = MEMORY[0x1E0C812E0];
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v6 = (char *)MEMORY[0x1A85D3280](v3);
    std::string::basic_string[abi:ne180100]<0>(a2, v6);
    free(v6);
  }
  xpc_release(v3);
  if (v4 != v5)
    std::string::basic_string[abi:ne180100]<0>(a2, "(destroyed connection)");
}

void sub_1A8376058(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

swix::connection *swix::connection::connection(swix::connection *this, const swix::connection_config *a2)
{
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  __int128 v7;
  std::__shared_weak_count *shared_owners;
  unint64_t v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  xpc_object_t v24;
  std::string v25;
  void *__p;
  char v27;
  xpc_object_t v28;
  dispatch_object_t object;
  _BYTE v30[24];
  _BYTE *v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E54254D8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  swix::connection_config::connection_config(&v25, a2);
  if (!object)
  {
    v3 = dispatch_queue_create("", 0);
    v4 = object;
    object = v3;
    if (v4)
      dispatch_release(v4);
  }
  swix::make_connection(&v24, (uint64_t)&v25);
  v5 = (std::__shared_weak_count *)operator new(0xD0uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425778;
  *(_QWORD *)&v7 = swix::connection::state::state((swix::connection::state *)&v5[1], (const swix::connection_config *)&v25, &v24);
  *((_QWORD *)&v7 + 1) = v5;
  shared_owners = (std::__shared_weak_count *)v5[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1)
      goto LABEL_17;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v22 = v7;
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v11 = __ldxr(p_shared_weak_owners);
    while (__stxr(v11 + 1, p_shared_weak_owners));
    v5[1].__vftable = (std::__shared_weak_count_vtbl *)&v5[1];
    v5[1].__shared_owners_ = (uint64_t)v5;
    std::__shared_weak_count::__release_weak(shared_owners);
    v7 = v22;
  }
  else
  {
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    v13 = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
    v5[1].__vftable = (std::__shared_weak_count_vtbl *)&v5[1];
    v5[1].__shared_owners_ = (uint64_t)v5;
  }
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    v23 = v7;
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    v7 = v23;
  }
LABEL_17:
  v16 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  *(_OWORD *)((char *)this + 8) = v7;
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  xpc_release(v24);
  if (v32)
  {
    v19 = v31;
    if (v31 == v30)
    {
      v20 = 4;
      v19 = v30;
    }
    else
    {
      if (!v31)
        goto LABEL_28;
      v20 = 5;
    }
    (*(void (**)(void))(*v19 + 8 * v20))();
  }
LABEL_28:
  if (object)
    dispatch_release(object);
  xpc_release(v28);
  v28 = 0;
  if (v27 < 0)
    operator delete(__p);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  return this;
}

void sub_1A83762C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

std::string *swix::connection_config::connection_config(std::string *this, const swix::connection_config *a2)
{
  __int128 v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  std::string::size_type v8;

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
  v6 = (void *)*((_QWORD *)a2 + 6);
  this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  if (v6)
    xpc_retain(v6);
  else
    this[2].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  v7 = *((_QWORD *)a2 + 7);
  this[2].__r_.__value_.__l.__size_ = (std::string::size_type)v7;
  if (v7)
    dispatch_retain(v7);
  v8 = *((_QWORD *)a2 + 8);
  LOWORD(this[3].__r_.__value_.__l.__data_) = *((_WORD *)a2 + 36);
  this[2].__r_.__value_.__r.__words[2] = v8;
  this[3].__r_.__value_.__s.__data_[8] = 0;
  this[5].__r_.__value_.__s.__data_[0] = 0;
  if (*((_BYTE *)a2 + 120))
  {
    this[3].__r_.__value_.__l.__size_ = *((_QWORD *)a2 + 10);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)&this[3].__r_.__value_.__r.__words[2], (uint64_t)a2 + 88);
    this[5].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_1A8376420(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
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

void swix::make_connection(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  xpc_connection_t mach_service;
  xpc_object_t v13;
  const char *v14;
  xpc_connection_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  void *v18;

  v4 = MEMORY[0x1A85D32E0](*(_QWORD *)(a2 + 48));
  v5 = MEMORY[0x1E0C812E0];
  v6 = v4 == MEMORY[0x1E0C812E0];
  v7 = *(char *)(a2 + 23);
  v8 = *(_QWORD *)(a2 + 8);
  if (v7 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = *(unsigned __int8 *)(a2 + 47);
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0)
    v9 = *(_QWORD *)(a2 + 32);
  if (v8)
    ++v6;
  if (v9)
    ++v6;
  if (v6 != 1)
    std::terminate();
  if (v8)
  {
    if (v7 >= 0)
      v11 = (const char *)a2;
    else
      v11 = *(const char **)a2;
    mach_service = xpc_connection_create_mach_service(v11, 0, 0);
    if (mach_service)
    {
      v13 = mach_service;
      *a1 = mach_service;
      goto LABEL_23;
    }
    v13 = xpc_null_create();
    *a1 = v13;
    if (v13)
    {
LABEL_23:
      if (MEMORY[0x1A85D32E0](v13) != v5)
        goto LABEL_29;
LABEL_30:
      xpc_retain(v13);
      goto LABEL_31;
    }
  }
  else
  {
    if (!v9)
    {
      v16 = xpc_null_create();
      *a1 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a2 + 48) = xpc_null_create();
      v17 = xpc_null_create();
      v18 = *(void **)(a2 + 48);
      *(_QWORD *)(a2 + 48) = v16;
      xpc_release(v18);
      xpc_release(v17);
      return;
    }
    if (v10 >= 0)
      v14 = (const char *)(a2 + 24);
    else
      v14 = *(const char **)(a2 + 24);
    v15 = xpc_connection_create(v14, 0);
    v13 = v15;
    if (v15)
    {
      *a1 = v15;
    }
    else
    {
      v13 = xpc_null_create();
      *a1 = v13;
      if (!v13)
        goto LABEL_29;
    }
    if (MEMORY[0x1A85D32E0](v13) == v5)
      goto LABEL_30;
  }
LABEL_29:
  *a1 = xpc_null_create();
LABEL_31:
  xpc_release(v13);
}

void swix::connection::state::set_handler(uint64_t a1, _xpc_connection_s *a2, void *aBlock)
{
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  _QWORD v9[6];

  if (*(_QWORD *)(a1 + 168))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = ___ZN4swix10connection5state11set_handlerEP17_xpc_connection_sU13block_pointerFvPvE_block_invoke;
    v9[3] = &unk_1E54259C8;
    v9[4] = aBlock;
    v9[5] = a1;
    v5 = _Block_copy(v9);
    v6 = *(const void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v5;
    if (v6)
      _Block_release(v6);
  }
  else
  {
    if (aBlock)
      v7 = _Block_copy(aBlock);
    else
      v7 = 0;
    v8 = *(const void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v7;
    if (v8)
      _Block_release(v8);
  }
  xpc_connection_set_event_handler(a2, *(xpc_handler_t *)(a1 + 144));
}

void ___ZN4swix8listenerC2ERKNS_17connection_configE_block_invoke(uint64_t a1, void *a2)
{
  swix::listener::handle_connection_event(*(swix::listener **)(a1 + 32), a2);
}

void sub_1A83767C8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void swix::listener::handle_connection_event(swix::listener *this, xpc_object_t object)
{
  xpc_object_t v2;
  xpc_object_t v4;
  NSObject *v5;
  xpc_object_t v6;
  char *v7;
  void **v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *__p[2];
  char v13;
  xpc_object_t objecta;
  uint8_t buf[4];
  xpc_object_t v16;
  __int16 v17;
  void **v18;
  uint64_t v19;

  v2 = object;
  v19 = *MEMORY[0x1E0C80C00];
  if (object)
  {
    xpc_retain(object);
    v4 = v2;
  }
  else
  {
    v4 = xpc_null_create();
  }
  v5 = *(NSObject **)(*((_QWORD *)this + 1) + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    swix::connection::xpc_connection((os_unfair_lock_s **)this, (swix::detail::connection_impl *)&objecta);
    v6 = objecta;
    v7 = (char *)MEMORY[0x1A85D3280](v4);
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    free(v7);
    if (v13 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    *(_DWORD *)buf = 134218242;
    v16 = v6;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEFAULT, "%p connection event %s", buf, 0x16u);
    if (v13 < 0)
      operator delete(__p[0]);
    xpc_release(objecta);
  }
  v9 = MEMORY[0x1E0C812E0];
  if (v2)
  {
    xpc_retain(v2);
    __p[0] = v2;
  }
  else
  {
    v2 = xpc_null_create();
    __p[0] = v2;
    if (!v2)
    {
LABEL_15:
      __p[0] = xpc_null_create();
      goto LABEL_17;
    }
  }
  if (MEMORY[0x1A85D32E0](v2) != v9)
    goto LABEL_15;
  xpc_retain(v2);
LABEL_17:
  xpc_release(v2);
  if (MEMORY[0x1A85D32E0](__p[0]) == v9)
  {
    if (((*(uint64_t (**)(swix::listener *, void **))(*(_QWORD *)this + 24))(this, __p) & 1) != 0)
    {
      xpc_connection_activate((xpc_connection_t)__p[0]);
    }
    else
    {
      v11 = *(NSObject **)(*((_QWORD *)this + 1) + 80);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A836D000, v11, OS_LOG_TYPE_ERROR, "rejecting connection", buf, 2u);
      }
      xpc_connection_cancel((xpc_connection_t)__p[0]);
    }
  }
  else
  {
    v10 = *(NSObject **)(*((_QWORD *)this + 1) + 80);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A836D000, v10, OS_LOG_TYPE_ERROR, "object not a connection?", buf, 2u);
    }
  }
  xpc_release(__p[0]);
  xpc_release(v4);
}

void sub_1A8376A3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t swix::detail::watchdog_timer::watchdog_timer(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  NSObject **v5;
  NSObject *global_queue;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[5];

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = *a2;
  v3 = a2 + 4;
  v4 = (_QWORD *)a2[4];
  if (!v4)
  {
    v3 = (_QWORD *)(a1 + 48);
    goto LABEL_5;
  }
  if (v4 != a2 + 1)
  {
    *(_QWORD *)(a1 + 48) = v4;
LABEL_5:
    *v3 = 0;
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + 48) = a1 + 24;
  (*(void (**)(_QWORD))(*(_QWORD *)*v3 + 24))(*v3);
LABEL_7:
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  v5 = (NSObject **)(a1 + 56);
  if (!*(_QWORD *)(a1 + 48))
    std::terminate();
  global_queue = dispatch_get_global_queue(25, 0);
  v7 = dispatch_queue_create_with_target_V2("", 0, global_queue);
  v8 = *v5;
  *v5 = v7;
  if (v8)
  {
    dispatch_release(v8);
    v7 = *v5;
  }
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
  v10 = *(NSObject **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v9;
  if (v10)
  {
    dispatch_release(v10);
    v9 = *(NSObject **)(a1 + 64);
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN4swix6detail14watchdog_timerC2ENS_14timeout_configE_block_invoke;
  handler[3] = &__block_descriptor_tmp_194;
  handler[4] = a1;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 64));
  return a1;
}

CADeprecated::CAPThread *CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, int a4, char a5, char a6, const char *a7)
{
  _opaque_pthread_t *v14;
  char *v15;

  *(_QWORD *)this = &off_1E5425418;
  *((_QWORD *)this + 1) = 0;
  v14 = pthread_self();
  *((_DWORD *)this + 4) = CADeprecated::CAPThread::getScheduledPriority(v14, 0);
  *((_QWORD *)this + 3) = a2;
  *((_QWORD *)this + 4) = a3;
  *((_DWORD *)this + 26) = a4;
  *((_DWORD *)this + 27) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_WORD *)this + 60) = 1;
  *((_BYTE *)this + 122) = a5;
  v15 = (char *)this + 40;
  *((_BYTE *)this + 123) = a6;
  if (a7)
  {
    strlcpy(v15, a7, 0x40uLL);
  }
  else
  {
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)v15 = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
  }
  return this;
}

double CADeprecated::CAPThread::SetName(CADeprecated::CAPThread *this, const char *a2)
{
  char *v2;
  double result;

  v2 = (char *)this + 40;
  if (a2)
  {
    strlcpy(v2, a2, 0x40uLL);
  }
  else
  {
    result = 0.0;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *(_OWORD *)v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
  }
  return result;
}

uint64_t CADeprecated::CAPThread::Start(uint64_t this)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  _DWORD *exception;
  unint64_t v11;
  sched_param v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  pthread_attr_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (atomic_load((unint64_t *)(this + 8)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v17.__sig) = 136315394;
      *(uint64_t *)((char *)&v17.__sig + 4) = (uint64_t)"CAPThread.cpp";
      *(_WORD *)&v17.__opaque[4] = 1024;
      *(_DWORD *)&v17.__opaque[6] = 248;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAPThread::Start: can't start because the thread is already running", (uint8_t *)&v17, 0x12u);
    }
    __break(1u);
  }
  if (!atomic_load((unint64_t *)(this + 8)))
  {
    v3 = this;
    v4 = pthread_attr_init(&v17);
    if (v4)
    {
      v7 = v4;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 136315394;
      v14 = "CAPThread.cpp";
      v15 = 1024;
      v16 = 255;
      v8 = MEMORY[0x1E0C81028];
      v9 = "%25s:%-5d  CAPThread::Start: Thread attributes could not be created.";
    }
    else
    {
      v5 = pthread_attr_setdetachstate(&v17, 2);
      if (v5)
      {
        v7 = v5;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_DWORD *)buf = 136315394;
        v14 = "CAPThread.cpp";
        v15 = 1024;
        v16 = 258;
        v8 = MEMORY[0x1E0C81028];
        v9 = "%25s:%-5d  CAPThread::Start: A thread could not be created in the detached state.";
      }
      else
      {
        pthread_attr_getschedparam(&v17, &v12);
        v12.sched_priority = *(_DWORD *)(v3 + 104);
        pthread_attr_setschedparam(&v17, &v12);
        if (*(_BYTE *)(v3 + 122))
          pthread_attr_setschedpolicy(&v17, 4);
        v11 = 0;
        v6 = pthread_create((pthread_t *)&v11, &v17, (void *(__cdecl *)(void *))CADeprecated::CAPThread::Entry, (void *)v3);
        if (!v6 && v11)
        {
          atomic_store(v11, (unint64_t *)(v3 + 8));
          return pthread_attr_destroy(&v17);
        }
        v7 = v6;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_21:
          exception = __cxa_allocate_exception(0x10uLL);
          *(_QWORD *)exception = &off_1E5424FE8;
          exception[2] = v7;
        }
        *(_DWORD *)buf = 136315394;
        v14 = "CAPThread.cpp";
        v15 = 1024;
        v16 = 272;
        v8 = MEMORY[0x1E0C81028];
        v9 = "%25s:%-5d  CAPThread::Start: Could not create a thread.";
      }
    }
    _os_log_impl(&dword_1A836D000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_21;
  }
  return this;
}

_opaque_pthread_t *CADeprecated::CAPThread::getScheduledPriority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  int v2;
  _opaque_pthread_t *v3;
  thread_inspect_t v4;
  thread_inspect_t v5;
  thread_inspect_t v6;
  thread_inspect_t v7;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t v9[5];
  integer_t v10[5];
  integer_t v11[4];
  integer_t thread_info_out[5];
  int v13;

  if (this)
  {
    v2 = (int)a2;
    v3 = this;
    thread_info_outCnt = 10;
    v4 = pthread_mach_thread_np(this);
    thread_info(v4, 3u, thread_info_out, &thread_info_outCnt);
    switch(v13)
    {
      case 4:
        thread_info_outCnt = 4;
        v6 = pthread_mach_thread_np(v3);
        thread_info(v6, 0xCu, v11, &thread_info_outCnt);
        if (v2 == 1 && v11[2])
          return (_opaque_pthread_t *)v11[3];
        else
          return (_opaque_pthread_t *)v11[1];
      case 2:
        thread_info_outCnt = 5;
        v7 = pthread_mach_thread_np(v3);
        thread_info(v7, 0xBu, v10, &thread_info_outCnt);
        if (v2 == 1 && v10[3])
          return (_opaque_pthread_t *)v10[4];
        else
          return (_opaque_pthread_t *)v10[1];
      case 1:
        thread_info_outCnt = 5;
        v5 = pthread_mach_thread_np(v3);
        thread_info(v5, 0xAu, v9, &thread_info_outCnt);
        if (v2 == 1)
          return (_opaque_pthread_t *)v9[2];
        else
          return (_opaque_pthread_t *)v9[1];
      default:
        return 0;
    }
  }
  return this;
}

uint64_t CADeprecated::CAGuard::Notify(CADeprecated::CAGuard *this)
{
  uint64_t result;
  _DWORD *exception;
  int v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = pthread_cond_signal((pthread_cond_t *)((char *)this + 88));
  if ((_DWORD)result)
  {
    v3 = result;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v5 = "CAGuard.cpp";
      v6 = 1024;
      v7 = 302;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAGuard::Notify: failed", buf, 0x12u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(_QWORD *)exception = &off_1E5424FE8;
    exception[2] = v3;
  }
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void *MIDIPacketList_New(const MIDIPacketList *a1)
{
  unint64_t packet;
  UInt32 v3;
  size_t v4;
  void *v5;

  packet = (unint64_t)a1->packet;
  if ((int)a1->numPackets >= 1)
  {
    v3 = a1->numPackets + 1;
    do
    {
      packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v3;
    }
    while (v3 > 1);
  }
  v4 = packet - (_QWORD)a1;
  v5 = malloc_type_malloc(packet - (_QWORD)a1, 0x6BE2FA03uLL);
  return memcpy(v5, a1, v4);
}

unint64_t MIDIPacketList_Size(const MIDIPacketList *a1)
{
  unint64_t packet;
  UInt32 v2;

  packet = (unint64_t)a1->packet;
  if ((int)a1->numPackets >= 1)
  {
    v2 = a1->numPackets + 1;
    do
    {
      packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v2;
    }
    while (v2 > 1);
  }
  return packet - (_QWORD)a1;
}

char *MIDIPacketList_New(uint64_t a1, size_t a2, const unsigned __int8 *a3)
{
  char *v6;

  v6 = (char *)malloc_type_malloc(a2 + 14, 0x6BE2FA03uLL);
  *(_DWORD *)v6 = 1;
  *(_QWORD *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

_WORD *MIDIPacketList_Split(MIDIPacketList *a1, unint64_t a2)
{
  unint64_t packet;
  UInt32 numPackets;
  UInt32 v5;
  unsigned __int16 *v6;
  uint64_t v7;
  unint64_t v8;
  _WORD *v9;
  _WORD *result;
  MIDIPacketList *v11;
  UInt32 v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  size_t v16;
  unsigned __int16 *v17;
  UInt32 v18;

  if (a2 <= 0x11)
    __assert_rtn("MIDIPacketList_Split", "MIDIPacket.cpp", 46, "maxLen >= offsetof(MIDIPacketList, packet[0].data[4])");
  packet = (unint64_t)a1->packet;
  numPackets = a1->numPackets;
  if ((int)a1->numPackets < 1)
    return 0;
  v5 = 0;
  v6 = (unsigned __int16 *)a1->packet;
  while (1)
  {
    v7 = v6[4];
    v8 = ((unint64_t)v6 + v7 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    if (v8 - (unint64_t)a1 > a2)
      break;
    ++v5;
    v6 = (unsigned __int16 *)(((unint64_t)v6 + v7 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    if (numPackets == v5)
      return 0;
  }
  if (!v5)
  {
    v13 = (char *)a1 + a2;
    if ((unint64_t)a1 + a2 < v8 && (*v13 & 0x80000000) == 0)
    {
      if (*(v13 - 1) < 0)
      {
        --v13;
      }
      else if (*(v13 - 2) < 0)
      {
        v13 -= 2;
      }
    }
    v14 = numPackets + 1;
    do
    {
      packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v14;
    }
    while (v14 > 1);
    v15 = v13 - (char *)v6 - 10;
    v16 = v7 - v15;
    v9 = malloc_type_malloc(packet - ((_QWORD)a1 + v15) + 8, 0x6BE2FA03uLL);
    *(_DWORD *)v9 = a1->numPackets;
    *(_QWORD *)(v9 + 2) = *(_QWORD *)v6;
    v17 = v9 + 2;
    v9[6] = v16;
    memcpy(v9 + 7, v13, v16);
    v18 = a1->numPackets;
    if ((signed int)(a1->numPackets - 1) >= 1)
    {
      do
      {
        v6 = (unsigned __int16 *)(((unint64_t)v6 + v6[4] + 13) & 0xFFFFFFFFFFFFFFFCLL);
        v17 = (unsigned __int16 *)(((unint64_t)v17 + v17[4] + 13) & 0xFFFFFFFFFFFFFFFCLL);
        memcpy(v17, v6, v6[4] + 10);
        --v18;
      }
      while (v18 > 1);
    }
    a1->numPackets = 1;
    a1->packet[0].length = v15;
    return v9;
  }
  v12 = *((_DWORD *)v6 - 1);
  v11 = (MIDIPacketList *)(v6 - 2);
  v11->numPackets = numPackets - v5;
  result = MIDIPacketList_New(v11);
  v11->numPackets = v12;
  a1->numPackets = v5;
  return result;
}

const unsigned __int8 *NextMIDIEvent(const MIDIPacket *a1, Byte *a2)
{
  const unsigned __int8 *v2;

  v2 = &a1->data[a1->length];
  if (a1->data <= a2 && v2 > a2)
    return NextMIDIEvent(a2, v2);
  else
    return &a1->data[a1->length];
}

const unsigned __int8 *NextMIDIEvent(const unsigned __int8 *a1, const unsigned __int8 *a2)
{
  unsigned int v2;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  int v6;
  int v7;
  BOOL v9;

  v2 = *a1 >> 4;
  if (v2 > 0xF)
    goto LABEL_8;
  if (((1 << v2) & 0x4F00) != 0)
  {
LABEL_3:
    v3 = a1 + 3;
    goto LABEL_18;
  }
  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_5:
    v3 = a1 + 2;
    goto LABEL_18;
  }
  if (v2 == 15)
  {
    switch(*a1)
    {
      case 0xF0u:
        goto LABEL_8;
      case 0xF1u:
      case 0xF3u:
        goto LABEL_5;
      case 0xF2u:
        goto LABEL_3;
      default:
        v3 = a1 + 1;
        break;
    }
  }
  else
  {
LABEL_8:
    v4 = a1 + 1;
    v5 = a1 + 1;
    do
    {
      v7 = *v5++;
      v6 = v7;
      v9 = (v7 & 0x80u) == 0 || v6 == 247;
      if (v4 >= a2)
        break;
      v4 = v5;
    }
    while (v9);
    v3 = v5 - 1;
  }
LABEL_18:
  if (v3 >= a2)
    return a2;
  else
    return v3;
}

void MIDIPacketList_Dump(__sFILE *a1, const MIDIPacketList *a2, const char *a3)
{
  void *v5;
  FILE *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    DumpMIDIPacketList(a1, a2, a3);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v6 = funopen(&v6, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
    DumpMIDIPacketList(v6, a2, a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      fflush(v6);
      v5 = v7;
      if (!v7)
      {
        v5 = malloc_type_malloc(1uLL, 0xADAE35E5uLL);
        v7 = v5;
        v9 = 1;
      }
      *((_BYTE *)v5 + v8) = 0;
      *(_DWORD *)buf = 136315138;
      v11 = v7;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    fclose(v6);
    free(v7);
  }
}

void sub_1A8377690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, FILE *a9, void *a10)
{
  fclose(a9);
  free(a10);
  _Unwind_Resume(a1);
}

const char *CAMemoryStream::Write(CAMemoryStream *this, void *a2, const char *a3)
{
  const char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v3 = a3;
  if ((int)a3 >= 1)
  {
    v6 = *((_QWORD *)this + 2);
    v7 = v6 + a3;
    if ((unint64_t)(v7 + 1) <= *((_QWORD *)this + 3))
    {
      v8 = (char *)*((_QWORD *)this + 1);
    }
    else
    {
      v8 = (char *)malloc_type_realloc(*((void **)this + 1), (v7 & 0xFFFFFFFFFFFFFF80) + 128, 0x2426ABB1uLL);
      if (!v8)
      {
        fwrite("realloc failed", 0xEuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        return (const char *)0xFFFFFFFFLL;
      }
      *((_QWORD *)this + 1) = v8;
      *((_QWORD *)this + 3) = (v7 & 0xFFFFFFFFFFFFFF80) + 128;
      v6 = *((_QWORD *)this + 2);
    }
    memcpy(&v8[v6], a2, v3);
    *((_QWORD *)this + 2) = v7;
  }
  return v3;
}

uint64_t DumpMIDIPacketList(__sFILE *a1, const MIDIPacketList *a2, const char *a3)
{
  __int128 v6;
  uint64_t result;
  uint64_t v8;
  UInt32 numPackets;
  UInt32 v10;
  unint64_t packet;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  unint64_t v17;
  char __str[20];
  _OWORD v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  fprintf(a1, "%s ", a3);
  *(_QWORD *)&v6 = 0x2020202020202020;
  *((_QWORD *)&v6 + 1) = 0x2020202020202020;
  v19[3] = v6;
  v19[4] = v6;
  v19[1] = v6;
  v19[2] = v6;
  v19[0] = v6;
  result = strlen(a3);
  v8 = 79;
  if ((unint64_t)(result + 1) < 0x4F)
    v8 = result + 1;
  *((_BYTE *)v19 + v8) = 0;
  numPackets = a2->numPackets;
  if (DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime)
  {
    if (!numPackets)
      return result;
  }
  else
  {
    if (!numPackets)
      return result;
    DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime = a2->packet[0].timeStamp;
  }
  v10 = 0;
  packet = (unint64_t)a2->packet;
  do
  {
    v12 = *(_QWORD *)packet;
    if (*(_QWORD *)packet)
    {
      v13 = DumpMIDIPacketList(__sFILE *,MIDIPacketList const*,char const*)::baseTime;
      v14 = __udivti3();
      if (v12 >= v13)
        v15 = v14;
      else
        v15 = -v14;
      snprintf(__str, 0x14uLL, "%.3f", (double)v15 * 0.000000001);
    }
    else
    {
      strcpy(__str, "---");
    }
    v16 = "";
    if (v10)
      v16 = (const char *)v19;
    fprintf(a1, "%s[%2d] %s : ", v16, v10, __str);
    if (*(_WORD *)(packet + 8))
    {
      v17 = 0;
      do
        fprintf(a1, "%02X ", *(unsigned __int8 *)(packet + 10 + v17++));
      while (v17 < *(unsigned __int16 *)(packet + 8));
    }
    result = fputc(10, a1);
    packet = (packet + *(unsigned __int16 *)(packet + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    ++v10;
  }
  while (v10 < a2->numPackets);
  return result;
}

void TuningPListMgr::TuningPListMgr(TuningPListMgr *this)
{
  std::string *v2;
  const __CFAllocator *v3;
  uint64_t v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  void *__p;
  char v8;
  char v9;
  std::string v10;

  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 6) = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "0");
  CAFileSystemUtilities::GetTemporaryDirectorySubpathString((uint64_t)&__p, &v10);
  if (v9 < 0)
    operator delete(__p);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v2 = &v10;
  else
    v2 = (std::string *)v10.__r_.__value_.__r.__words[0];
  __p = (void *)CFStringCreateWithCString(0, (const char *)v2, 0x600u);
  v8 = 1;
  CACFString::operator=((uint64_t)this, (uint64_t)&__p);
  CACFString::~CACFString((CACFString *)&__p);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = 16;
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  do
  {
    *(_QWORD *)((char *)this + v4) = CFDictionaryCreateMutable(v3, 0, v5, v6);
    v4 += 8;
  }
  while (v4 != 48);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

void sub_1A8377A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  CACFString *v20;

  CACFString::~CACFString((CACFString *)&a9);
  if (a20 < 0)
    operator delete(__p);
  CACFString::~CACFString(v20);
  _Unwind_Resume(a1);
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

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  const void *v3;
  BOOL v5;
  int v6;
  BOOL v7;

  v3 = *(const void **)a2;
  if (*(_QWORD *)a2 != *(_QWORD *)a1)
  {
    if (*(_QWORD *)a1)
      v5 = *(_BYTE *)(a1 + 8) == 0;
    else
      v5 = 1;
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      v3 = *(const void **)a2;
    }
    *(_QWORD *)a1 = v3;
    v6 = *(unsigned __int8 *)(a2 + 8);
    *(_BYTE *)(a1 + 8) = v6;
    if (v6)
      v7 = v3 == 0;
    else
      v7 = 1;
    if (!v7)
      CFRetain(v3);
  }
  return a1;
}

void CACFString::~CACFString(CACFString *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
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
}

void sub_1A8377C74(_Unwind_Exception *a1)
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

void TuningPListMgr::~TuningPListMgr(TuningPListMgr *this)
{
  uint64_t i;
  const void *v3;
  PListLogger *v4;

  for (i = 16; i != 48; i += 8)
  {
    v3 = *(const void **)((char *)this + i);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)((char *)this + i) = 0;
    }
  }
  v4 = (PListLogger *)*((_QWORD *)this + 6);
  if (v4)
  {
    PListLogger::~PListLogger(v4);
    MEMORY[0x1A85D2980]();
  }
  CACFString::~CACFString(this);
}

void PListLogger::~PListLogger(PListLogger *this)
{
  if (*(_DWORD *)this != -1)
  {
    PListLogger::log(this, "*** done.\n");
    close(*(_DWORD *)this);
    *(_DWORD *)this = -1;
  }
}

uint64_t PListLogger::log(PListLogger *this, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return vdprintf(*(_DWORD *)this, a2, va);
}

void TuningPListMgr::enableLogging(TuningPListMgr *this, int a2)
{
  PListLogger *v3;
  PListLogger *v4;

  v3 = (PListLogger *)*((_QWORD *)this + 6);
  if (a2)
  {
    if (v3)
      return;
    v4 = (PListLogger *)operator new();
    PListLogger::PListLogger(v4);
  }
  else
  {
    if (!v3)
      return;
    PListLogger::~PListLogger(v3);
    MEMORY[0x1A85D2980]();
    v4 = 0;
  }
  *((_QWORD *)this + 6) = v4;
}

void sub_1A8377E08(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A85D2980](v1, 0x1000C4005A209FELL);
  _Unwind_Resume(a1);
}

void PListLogger::PListLogger(PListLogger *this)
{
  std::string *v2;
  void *__p[2];
  char v4;
  std::string v5;

  *(_QWORD *)this = 0xFFFFFFFFLL;
  *((_BYTE *)this + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "plist-logger.log");
  CAFileSystemUtilities::GetTemporaryDirectorySubpathString((uint64_t)__p, &v5);
  if (v4 < 0)
    operator delete(__p[0]);
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v2 = &v5;
  else
    v2 = (std::string *)v5.__r_.__value_.__r.__words[0];
  *(_DWORD *)this = open((const char *)v2, 522, 420);
  PListLogger::log(this, "\n***\n*** New Sesssion\n***\n");
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
}

void sub_1A8377ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t TuningPListMgr::loadPListFile_(TuningPListMgr *this, const __CFString *a2, __CFDictionary **a3)
{
  TuningPListMgr *Mutable;
  TuningPListMgr *v6;
  NSObject **v8;
  NSObject *v9;
  __CFDictionary *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  Mutable = (TuningPListMgr *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512);
  v6 = Mutable;
  if (!a3)
  {
    v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      v9 = *v8;
      if (!*v8)
        goto LABEL_10;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "TuningPListMgr.cpp";
      v13 = 1024;
      v14 = 109;
      _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid parameter", buf, 0x12u);
    }
    goto LABEL_10;
  }
  if ((TuningPListMgr::createPlistFromFile_(Mutable, a2, &v10, (__CFString *)Mutable) & 1) != 0)
  {
    *a3 = v10;
    CFRelease(v6);
    return 0;
  }
LABEL_10:
  CFRelease(v6);
  return 0xFFFFFFFFLL;
}

uint64_t logSubsystem(void)
{
  unint64_t v0;
  char v2;
  char **v3;
  char *v4;

  v0 = atomic_load(&logSubsystem(void)::onceflag);
  if (v0 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&logSubsystem(void)::onceflag, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>);
  }
  return logSubsystem(void)::scope;
}

uint64_t TuningPListMgr::createPlistFromFile_(TuningPListMgr *this, const __CFString *a2, const __CFDictionary **a3, __CFString *a4)
{
  const __CFAllocator *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  __CFReadStream *v10;
  const __CFDictionary *v11;

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, kCFURLPOSIXPathStyle, 0);
  if (v8
    && (v9 = v8, v10 = CFReadStreamCreateWithFile(v7, v8), CFRelease(v9), v10)
    && (CFReadStreamOpen(v10),
        v11 = (const __CFDictionary *)CFPropertyListCreateWithStream(v7, v10, 0, 0, 0, 0),
        CFReadStreamClose(v10),
        CFRelease(v10),
        v11))
  {
    *a3 = v11;
    return 1;
  }
  else
  {
    if (a4)
    {
      CFStringAppend(a4, CFSTR("Error loading plist file "));
      CFStringAppend(a4, a2);
      CFStringAppend(a4, CFSTR("\n"));
    }
    return 0;
  }
}

os_log_t std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.coreaudio.utility", "TPLM");
  *v0 = result;
  logSubsystem(void)::scope = (uint64_t)v0;
  return result;
}

uint64_t TuningPListMgr::loadTuningInSubdirs_(CFStringRef *a1, const __CFString ***a2, unsigned int a3, signed int a4)
{
  const __CFString *v8;
  const __CFString *v9;
  __CFString *MutableCopy;
  uint64_t v11;
  CFStringRef **v12;
  size_t v13;
  const __CFString *v14;
  TuningPListMgr *HasSuffix;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  CFMutableStringRef v19;
  CFMutableStringRef theString;
  char v22;
  CFTypeRef cf;

  cf = 0;
  if (a3)
  {
    v8 = **a2;
    if (v8 && CFStringHasPrefix(v8, CFSTR("/")))
      v9 = &stru_1E5425B80;
    else
      v9 = *a1;
    MutableCopy = CFStringCreateMutableCopy(0, 0, v9);
    theString = MutableCopy;
    v22 = 1;
    v11 = a3 - 1;
    v12 = a2;
    if (!MutableCopy)
      goto LABEL_9;
LABEL_7:
    CFStringAppend(MutableCopy, CFSTR("/"));
    if (theString)
      CFStringAppend(theString, **v12);
LABEL_9:
    while (v11)
    {
      MutableCopy = theString;
      --v11;
      ++v12;
      if (theString)
        goto LABEL_7;
    }
  }
  else
  {
    theString = CFStringCreateMutableCopy(0, 0, *a1);
    v22 = 1;
  }
  if (a4 > 4)
    a4 = 0;
  v13 = strlen(TuningPListMgr::kTuningFileTypeSuffixMap[a4]);
  v14 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)TuningPListMgr::kTuningFileTypeSuffixMap[a4], v13, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  HasSuffix = (TuningPListMgr *)theString;
  if (theString)
  {
    HasSuffix = (TuningPListMgr *)CFStringHasSuffix(theString, v14);
    v16 = theString;
    if (!(_DWORD)HasSuffix)
    {
      CFStringAppend(theString, v14);
      v16 = theString;
    }
  }
  else
  {
    v16 = 0;
  }
  if (TuningPListMgr::loadPListFile_(HasSuffix, v16, (__CFDictionary **)&cf))
  {
    v18 = 0xFFFFFFFFLL;
    if (!v14)
      goto LABEL_26;
LABEL_25:
    CFRelease(v14);
    goto LABEL_26;
  }
  v19 = (CFMutableStringRef)*a2[a3 - 1];
  if (!a4)
  {
    TuningPListMgr::addLegacyStripNameKeys_(&cf, (const void **)&v19->isa, v17);
    v19 = theString;
  }
  TuningPListMgr::installTuning_((uint64_t)a1, v19, (CFDictionaryRef)cf, a4);
  v18 = 0;
  if (v14)
    goto LABEL_25;
LABEL_26:
  if (cf)
    CFRelease(cf);
  CACFMutableString::~CACFMutableString((CACFMutableString *)&theString);
  return v18;
}

void sub_1A83783C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFMutableString::~CACFMutableString((CACFMutableString *)va);
  _Unwind_Resume(a1);
}

void TuningPListMgr::addLegacyStripNameKeys_(CFTypeRef *this, const void **a2, const __CFString *a3)
{
  uint64_t v5;
  __CFDictionary *MutableCopy;
  __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFAllocator *v9;
  __CFString *v10;
  CFIndex Count;

  v5 = 0;
  MutableCopy = 0;
  v7 = 0;
  v8 = (const __CFDictionary *)*this;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v10 = kLegacyStripNameKeys[v5];
    if (!CFDictionaryContainsKey(v8, v10))
    {
      if (!v7)
      {
        Count = CFDictionaryGetCount(v8);
        MutableCopy = CFDictionaryCreateMutableCopy(v9, Count + 2, v8);
      }
      CFDictionaryAddValue(MutableCopy, v10, a2);
      v7 = MutableCopy;
    }
    ++v5;
  }
  while (v5 != 2);
  if (MutableCopy)
  {
    CFRelease(*this);
    *this = MutableCopy;
  }
}

void sub_1A83784BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t TuningPListMgr::installTuning_(uint64_t a1, const void *a2, CFDictionaryRef theDict, unsigned int a4)
{
  const __CFString *Value;
  uint64_t v9;
  const __CFString *v10;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v13;
  const void **v14;
  const void **v15;
  uint64_t i;
  const __CFDictionary *v17;
  CFTypeID v18;
  const __CFString *v19;
  const __CFString *v20;
  CFTypeID v21;
  const __CFString **v22;
  __CFDictionary *v23;
  void *v24;
  PListLogger *v25;
  const void *v27;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("name"));
  v9 = a1 + 8 * a4;
  if (Value)
  {
    v10 = Value;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v10))
    {
      Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v9 + 16));
      if (Count >= 1)
      {
        v13 = Count;
        v27 = a2;
        v14 = (const void **)operator new[]();
        v15 = (const void **)operator new[]();
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v9 + 16), v14, v15);
        for (i = 0; v13 != i; ++i)
        {
          if (!v14[i])
            break;
          v17 = (const __CFDictionary *)v15[i];
          if (!v17)
            break;
          v18 = CFDictionaryGetTypeID();
          if (v18 == CFGetTypeID(v17))
          {
            v19 = (const __CFString *)CFDictionaryGetValue(v17, CFSTR("name"));
            if (v19)
            {
              v20 = v19;
              v21 = CFStringGetTypeID();
              if (v21 == CFGetTypeID(v20) && CFStringCompare(v20, v10, 0) == kCFCompareEqualTo)
              {
                CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v9 + 16), v14[i]);
                break;
              }
            }
          }
        }
        MEMORY[0x1A85D2968](v14, 0xC0C80B8AA526DLL);
        MEMORY[0x1A85D2968](v15, 0xC0C80B8AA526DLL);
        a2 = v27;
      }
    }
  }
  v23 = *(__CFDictionary **)(v9 + 16);
  v22 = (const __CFString **)(v9 + 16);
  CFDictionarySetValue(v23, a2, theDict);
  v25 = *(PListLogger **)(a1 + 48);
  if (v25)
    PListLogger::logItemEntry(*v22, "@@ Strips Aug  3 2024 08:45:27", v25, v24);
  return 0;
}

void CACFMutableString::~CACFMutableString(CACFMutableString *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

void PListLogger::logItemEntry(const __CFString *this, const char *a2, PListLogger *a3, void *a4)
{
  CFTypeID v7;

  v7 = CFGetTypeID(this);
  if (CFStringGetTypeID() == v7)
  {
    PListLogger::logItem(a3, this, a2);
  }
  else if (CFNumberGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (CFNumberRef)this, a2);
  }
  else if (CFDictionaryGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (const __CFDictionary *)this, a2);
  }
  else if (CFArrayGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (CFArrayRef)this, a2);
  }
  else if (CFDataGetTypeID() == v7)
  {
    PListLogger::logItem(a3, (const __CFData *)this, a2);
  }
  else
  {
    PListLogger::logItemUnknown(a3, a2, v7);
  }
}

uint64_t PListLogger::logItem(PListLogger *this, const __CFString *a2, const char *a3)
{
  int v6;
  size_t v7;
  int v8;
  const char *CStringPtr;
  char v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = *((_DWORD *)this + 1);
  if (v6 >= 127)
    v7 = 127;
  else
    v7 = v6;
  v11[(int)v7] = 0;
  if ((_DWORD)v7)
    memset(&v11[(int)v7 - 1 - (v7 - 1)], 32, v7);
  PListLogger::log(this, "%s", v11);
  v8 = CFGetRetainCount(a2);
  CStringPtr = CFStringGetCStringPtr(a2, 0);
  return PListLogger::log(this, "'%s' | String{%d} | \"%s\"\n", a3, v8, CStringPtr);
}

uint64_t PListLogger::logItem(PListLogger *this, CFNumberRef number, const char *a3)
{
  CFNumberType Type;
  int v7;
  size_t v8;
  CFIndex v10;
  _QWORD valuePtr[17];

  valuePtr[16] = *MEMORY[0x1E0C80C00];
  Type = CFNumberGetType(number);
  v7 = *((_DWORD *)this + 1);
  if (v7 >= 127)
    v8 = 127;
  else
    v8 = v7;
  *((_BYTE *)valuePtr + (int)v8) = 0;
  if ((_DWORD)v8)
    memset((char *)valuePtr + (int)v8 - (v8 - 1) - 1, 32, v8);
  PListLogger::log(this, "%s", (const char *)valuePtr);
  if ((unint64_t)Type <= kCFNumberDoubleType)
  {
    if (((1 << Type) & 0x3060) != 0)
    {
      valuePtr[0] = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(float){%d} | %f\n");
    }
    if (((1 << Type) & 0x82) != 0)
    {
      LOBYTE(valuePtr[0]) = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(SInt8){%d} | 0x%02x\n");
    }
    if (((1 << Type) & 0x104) != 0)
    {
      LOWORD(valuePtr[0]) = 0;
      CFNumberGetValue(number, Type, valuePtr);
      CFGetRetainCount(number);
      return PListLogger::log(this, "'%s' | Number(SInt16){%d} | 0x%04x\n");
    }
  }
  LODWORD(valuePtr[0]) = 0;
  CFNumberGetValue(number, Type, valuePtr);
  v10 = CFGetRetainCount(number);
  return PListLogger::log(this, "'%s' | Number(SInt32){%d} | %-6d 0x%08x %c%c%c%c\n", a3, v10);
}

void PListLogger::logItem(PListLogger *this, const __CFDictionary *a2, const char *a3)
{
  int v6;
  size_t v7;
  int v8;
  int Count;
  char v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = *((_DWORD *)this + 1);
  if (v6 >= 127)
    v7 = 127;
  else
    v7 = v6;
  v10[(int)v7] = 0;
  if ((_DWORD)v7)
    memset(&v10[(int)v7 - 1 - (v7 - 1)], 32, v7);
  PListLogger::log(this, "%s", v10);
  v8 = CFGetRetainCount(a2);
  Count = CFDictionaryGetCount(a2);
  PListLogger::log(this, "'%s' | Dictionary{%d} | %d key/value pairs\n", a3, v8, Count);
  if (!strcmp("aupreset", a3))
    *((_BYTE *)this + 8) = 1;
  *((_DWORD *)this + 1) += 4;
  CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)PListLogger::logDictEntry, this);
  *((_DWORD *)this + 1) -= 4;
  *((_BYTE *)this + 8) = 0;
}

uint64_t PListLogger::logItem(PListLogger *this, CFArrayRef theArray, const char *a3)
{
  CFIndex Count;
  int v7;
  size_t v8;
  int v9;
  uint64_t result;
  int v11;
  CFIndex i;
  PListLogger *ValueAtIndex;
  void *v14;
  char __str[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  Count = CFArrayGetCount(theArray);
  v7 = *((_DWORD *)this + 1);
  if (v7 >= 127)
    v8 = 127;
  else
    v8 = v7;
  __str[(int)v8] = 0;
  if ((_DWORD)v8)
    memset(&__str[(int)v8 - 1 - (v8 - 1)], 32, v8);
  PListLogger::log(this, "%s", __str);
  v9 = CFGetRetainCount(theArray);
  result = PListLogger::log(this, "'%s' | Array{%d} | %d ordered objects\n", a3, v9, Count);
  v11 = *((_DWORD *)this + 1);
  *((_DWORD *)this + 1) = v11 + 4;
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (PListLogger *)CFArrayGetValueAtIndex(theArray, i);
      snprintf(__str, 0x10uLL, "[%u]", i);
      result = PListLogger::logItemEntry(ValueAtIndex, __str, (const char *)this, v14);
    }
    v11 = *((_DWORD *)this + 1) - 4;
  }
  *((_DWORD *)this + 1) = v11;
  return result;
}

uint64_t PListLogger::logItem(PListLogger *this, const __CFData *a2, const char *a3)
{
  int v6;
  size_t v7;
  const char *v8;
  int v9;
  int Length;
  char v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = *((_DWORD *)this + 1);
  if (v6 >= 127)
    v7 = 127;
  else
    v7 = v6;
  v12[(int)v7] = 0;
  if ((_DWORD)v7)
    memset(&v12[(int)v7 - 1 - (v7 - 1)], 32, v7);
  PListLogger::log(this, "%s", v12);
  if (*((_BYTE *)this + 8))
    v8 = "AUPreset";
  else
    v8 = "";
  v9 = CFGetRetainCount(a2);
  Length = CFDataGetLength(a2);
  return PListLogger::log(this, "'%s' | %sData{%d} | %d bytes\n", a3, v8, v9, Length);
}

uint64_t PListLogger::logItemUnknown(PListLogger *this, const char *a2, int a3)
{
  int v6;
  size_t v7;
  char v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = *((_DWORD *)this + 1);
  if (v6 >= 127)
    v7 = 127;
  else
    v7 = v6;
  v9[(int)v7] = 0;
  if ((_DWORD)v7)
    memset(&v9[(int)v7 - 1 - (v7 - 1)], 32, v7);
  PListLogger::log(this, "%s", v9);
  return PListLogger::log(this, "'%s' | <unknown type id: %d)>\n", a2, a3);
}

uint64_t PListLogger::logDictEntry(const __CFString *this, PListLogger *a2, const char *a3, void *a4)
{
  const char *CStringPtr;
  void *v7;

  CStringPtr = CFStringGetCStringPtr(this, 0);
  return PListLogger::logItemEntry(a2, CStringPtr, a3, v7);
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t TuningPListMgr::cfGetString_(uint64_t this, _QWORD *a2, const __CFString **a3)
{
  const void *v4;
  CFTypeID TypeID;

  if (this)
  {
    v4 = (const void *)this;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      *a2 = v4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return this;
}

uint64_t TuningPListMgr::cfGetDictionary_(TuningPListMgr *this, TuningPListMgr **a2, const __CFDictionary **a3)
{
  TuningPListMgr *v4;
  CFTypeID TypeID;
  uint64_t result;

  if (this && (v4 = this, TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v4)))
  {
    result = 1;
  }
  else
  {
    v4 = 0;
    result = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TuningPListMgr::loadTunings(const __CFString **this)
{
  DIR *v2;
  uint64_t result;
  const char *v4;
  CFStringRef v5;
  NSObject **v6;
  NSObject *v7;
  NSObject **v8;
  NSObject *v9;
  int *v10;
  char *v11;
  int v12;
  NSObject **v13;
  NSObject *v14;
  int *v15;
  char *v16;
  int v17;
  char v18[4];
  stat v19;
  const __CFString **v20;
  _BYTE buf[12];
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  char __dst[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __CFString __source[32];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v18 = 1024;
  CACFString::GetCString(*this, __source, v18, (unsigned int *)0x8000100);
  v2 = opendir((const char *)__source);
  if (v2)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          result = (uint64_t)readdir(v2);
          if (!result)
            return result;
          v4 = (const char *)(result + 21);
        }
        while (!strcmp((const char *)(result + 21), ".") || !strcmp(v4, ".."));
        strlcpy(__dst, (const char *)__source, 0x400uLL);
        strlcat(__dst, "/", 0x400uLL);
        strlcat(__dst, v4, 0x400uLL);
        if (lstat(__dst, &v19) < 0)
          break;
        if ((v19.st_mode & 0xF000) == 0x8000)
        {
          v5 = CFStringCreateWithCString(0, __dst, 0x600u);
          buf[8] = 1;
          v20 = (const __CFString **)buf;
          *(_QWORD *)buf = v5;
          TuningPListMgr::loadTuningInSubdirs_(this, &v20, 1u, 0);
          CACFString::~CACFString((CACFString *)buf);
        }
        else
        {
          v8 = (NSObject **)logSubsystem();
          if (!v8)
          {
            v9 = MEMORY[0x1E0C81028];
            goto LABEL_18;
          }
          v9 = *v8;
          if (*v8)
          {
LABEL_18:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "TuningPListMgr.cpp";
              v22 = 1024;
              v23 = 267;
              v24 = 2080;
              v25 = __dst;
              _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d \"%s\" exists but is not a regular file\n", buf, 0x1Cu);
            }
          }
        }
      }
      v6 = (NSObject **)logSubsystem();
      if (!v6)
        break;
      v7 = *v6;
      if (*v6)
      {
LABEL_15:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v10 = __error();
          v11 = strerror(*v10);
          v12 = *__error();
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "TuningPListMgr.cpp";
          v22 = 1024;
          v23 = 262;
          v24 = 2080;
          v25 = __dst;
          v26 = 2080;
          v27 = v11;
          v28 = 1024;
          v29 = v12;
          _os_log_impl(&dword_1A836D000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to lstat() \"%s\", errno: %s(%d)\n", buf, 0x2Cu);
        }
      }
    }
    v7 = MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  v13 = (NSObject **)logSubsystem();
  if (!v13)
  {
    v14 = MEMORY[0x1E0C81028];
LABEL_24:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      v17 = *__error();
      *(_DWORD *)__dst = 136316162;
      v31 = "TuningPListMgr.cpp";
      v32 = 1024;
      v33 = 247;
      v34 = 2080;
      v35 = __source;
      v36 = 2080;
      v37 = v16;
      v38 = 1024;
      v39 = v17;
      _os_log_impl(&dword_1A836D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to open dir \"%s\", errno: %s(%d)\n", (uint8_t *)__dst, 0x2Cu);
    }
    return 0xFFFFFFFFLL;
  }
  v14 = *v13;
  if (*v13)
    goto LABEL_24;
  return 0xFFFFFFFFLL;
}

void sub_1A83793B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  CACFString::~CACFString((CACFString *)&a33);
  _Unwind_Resume(a1);
}

BOOL TuningPListMgr::cfGetUInt32_(TuningPListMgr *this, void *a2, unsigned int *a3)
{
  CFTypeID TypeID;
  _BOOL8 result;

  result = 0;
  if (this)
  {
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(this))
    {
      if (CFNumberGetValue(this, kCFNumberSInt32Type, a2))
        return 1;
    }
  }
  return result;
}

uint64_t TuningPListMgr::cfGetArray_(uint64_t this, _QWORD *a2, const __CFArray **a3)
{
  const void *v4;
  CFTypeID TypeID;

  if (this)
  {
    v4 = (const void *)this;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      *a2 = v4;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return this;
}

uint64_t TuningPListMgr::_replaceAUPreset(TuningPListMgr *this, __CFDictionary *a2, const __CFDictionary *a3)
{
  const __CFDictionary *AUPresetFromUnit;
  const __CFDictionary *v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  NSObject **v14;
  NSObject *v15;
  NSObject **v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  __int128 v21;
  uint64_t valuePtr;
  _BYTE v23[16];
  _BYTE v24[16];
  _BYTE v25[16];
  _BYTE v26[16];
  _BYTE v27[16];
  uint8_t v28[16];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint8_t *v34;
  __int16 v35;
  _BYTE *v36;
  __int16 v37;
  _BYTE *v38;
  __int16 v39;
  _BYTE *v40;
  __int16 v41;
  _BYTE *v42;
  __int16 v43;
  _BYTE *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  AUPresetFromUnit = (const __CFDictionary *)TuningPListMgr::getAUPresetFromUnit(this, a2);
  if (AUPresetFromUnit)
  {
    v6 = AUPresetFromUnit;
    valuePtr = 0;
    v21 = 0uLL;
    Value = (const __CFNumber *)CFDictionaryGetValue(AUPresetFromUnit, CFSTR("type"));
    v8 = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("subtype"));
    v9 = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("manufacturer"));
    CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    CFNumberGetValue(v9, kCFNumberSInt32Type, (char *)&v21 + 12);
    v10 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("type"));
    v11 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("subtype"));
    v12 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("manufacturer"));
    CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)&v21 + 8);
    CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)&v21 + 4);
    CFNumberGetValue(v12, kCFNumberSInt32Type, &v21);
    if (valuePtr == *(_QWORD *)((char *)&v21 + 4) && HIDWORD(v21) == (_DWORD)v21)
    {
      CFDictionaryReplaceValue(a2, CFSTR("aupreset"), a3);
      CFRelease(CFSTR("aupreset"));
      return 0;
    }
    v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      v15 = *v14;
      if (!*v14)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v28, HIDWORD(valuePtr));
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, valuePtr);
      CAX4CCString::CAX4CCString((CAX4CCString *)v26, HIDWORD(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v25, DWORD2(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v24, DWORD1(v21));
      CAX4CCString::CAX4CCString((CAX4CCString *)v23, v21);
      *(_DWORD *)buf = 136316930;
      v30 = "TuningPListMgr.cpp";
      v31 = 1024;
      v32 = 366;
      v33 = 2080;
      v34 = v28;
      v35 = 2080;
      v36 = v27;
      v37 = 2080;
      v38 = v26;
      v39 = 2080;
      v40 = v25;
      v41 = 2080;
      v42 = v24;
      v43 = 2080;
      v44 = v23;
      v18 = "%25s:%-5d au tuple mismatch: tuple in strip: %s - %s - %s, tuple in preset: %s - %s - %s";
      v19 = v15;
      v20 = 78;
LABEL_17:
      _os_log_impl(&dword_1A836D000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
  }
  else
  {
    v16 = (NSObject **)logSubsystem();
    if (v16)
    {
      v17 = *v16;
      if (!*v16)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "TuningPListMgr.cpp";
      v31 = 1024;
      v32 = 344;
      v18 = "%25s:%-5d cannot find preset in au";
      v19 = v17;
      v20 = 18;
      goto LABEL_17;
    }
  }
  return 0xFFFFFFFFLL;
}

const void *TuningPListMgr::getAUPresetFromUnit(TuningPListMgr *this, CFDictionaryRef theDict)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  if (!theDict)
    return 0;
  result = CFDictionaryGetValue(theDict, CFSTR("aupreset"));
  if (result)
  {
    v3 = result;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

void CAX4CCString::CAX4CCString(CAX4CCString *this, unsigned int a2)
{
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v4 = bswap32(a2);
  *(_DWORD *)((char *)this + 1) = v4;
  v5 = MEMORY[0x1E0C80978];
  if ((v4 & 0x80) != 0)
  {
    if (!__maskrune((char)v4, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (char)v4 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  v6 = *((char *)this + 2);
  if ((v6 & 0x80000000) != 0)
  {
    if (!__maskrune(v6, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(v5 + 4 * v6 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  v7 = *((char *)this + 3);
  if ((v7 & 0x80000000) != 0)
  {
    if (!__maskrune(v7, 0x40000uLL))
      goto LABEL_17;
LABEL_13:
    v8 = *((char *)this + 4);
    if ((v8 & 0x80000000) != 0)
    {
      if (!__maskrune(v8, 0x40000uLL))
        goto LABEL_17;
    }
    else if ((*(_DWORD *)(v5 + 4 * v8 + 60) & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    *(_WORD *)((char *)this + 5) = 39;
    *(_BYTE *)this = 39;
    return;
  }
  if ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x40000) != 0)
    goto LABEL_13;
LABEL_17:
  if (a2 + 199999 > 0x61A7E)
    snprintf((char *)this, 0x10uLL, "0x%x");
  else
    snprintf((char *)this, 0x10uLL, "%d");
}

const __CFDictionary *TuningPListMgr::lookupPlist_(uint64_t a1, const char *a2, int a3)
{
  uint64_t v4;
  CFDictionaryRef *v5;
  uint64_t v6;
  CFStringRef v7;
  const __CFString *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  CFTypeID v12;
  CFIndex Count;
  CFIndex v14;
  const void **v15;
  const void **v16;
  uint64_t i;
  CFTypeID TypeID;
  const __CFString *Value;
  const __CFString *v20;
  CFTypeID v21;
  const __CFDictionary **v22;
  NSObject **v23;
  NSObject *v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3 > 3)
    return 0;
  v4 = a1 + 8 * a3;
  v6 = *(_QWORD *)(v4 + 16);
  v5 = (CFDictionaryRef *)(v4 + 16);
  if (!v6)
    return 0;
  v7 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *v5;
  if ((a3 - 1) > 2)
  {
    Count = CFDictionaryGetCount(v9);
    if (Count <= 0)
    {
      CFRelease(v8);
      return 0;
    }
    v14 = Count;
    v15 = (const void **)operator new[]();
    v16 = (const void **)operator new[]();
    CFDictionaryGetKeysAndValues(*v5, v15, v16);
    for (i = 0; i != v14; ++i)
    {
      if (!v15[i])
        break;
      v11 = (const __CFDictionary *)v16[i];
      if (!v11)
        break;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v11))
      {
        Value = (const __CFString *)CFDictionaryGetValue(v11, CFSTR("name"));
        if (Value)
        {
          v20 = Value;
          v21 = CFStringGetTypeID();
          if (v21 == CFGetTypeID(v20) && CFStringCompare(v20, v8, 0) == kCFCompareEqualTo)
            goto LABEL_26;
        }
      }
    }
    v22 = (const __CFDictionary **)logSubsystem();
    if (v22)
    {
      v11 = *v22;
      if (!*v22)
        goto LABEL_26;
    }
    else
    {
      v11 = (const __CFDictionary *)MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315394;
      v27 = "TuningPListMgr.cpp";
      v28 = 1024;
      v29 = 424;
      _os_log_impl(&dword_1A836D000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Did not match strip name field to file name!", (uint8_t *)&v26, 0x12u);
    }
    v11 = 0;
LABEL_26:
    MEMORY[0x1A85D2968](v15, 0xC0C80B8AA526DLL);
    MEMORY[0x1A85D2968](v16, 0xC0C80B8AA526DLL);
    CFRelease(v8);
    if (v11)
      return v11;
LABEL_27:
    v23 = (NSObject **)logSubsystem();
    if (v23)
    {
      v24 = *v23;
      if (!*v23)
        return 0;
    }
    else
    {
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315394;
      v27 = "TuningPListMgr.cpp";
      v28 = 1024;
      v29 = 435;
      _os_log_impl(&dword_1A836D000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d return dictionary is null", (uint8_t *)&v26, 0x12u);
    }
    return 0;
  }
  v10 = (const __CFDictionary *)CFDictionaryGetValue(v9, v8);
  if (!v10 || (v11 = v10, v12 = CFDictionaryGetTypeID(), v12 != CFGetTypeID(v11)))
  {
    CFRelease(v8);
    goto LABEL_27;
  }
  CFRelease(v8);
  return v11;
}

CFIndex TuningPListMgr::getNumEffects(TuningPListMgr *this, CFDictionaryRef theDict)
{
  const __CFArray *Value;
  const __CFArray *v3;
  CFTypeID TypeID;

  if (theDict
    && (Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("strips"))) != 0
    && (v3 = Value, TypeID = CFArrayGetTypeID(), TypeID == CFGetTypeID(v3)))
  {
    return CFArrayGetCount(v3);
  }
  else
  {
    return 0;
  }
}

const void *TuningPListMgr::getEffect(TuningPListMgr *this, CFDictionaryRef theDict, CFIndex a3)
{
  const void *result;
  const void *v5;
  CFTypeID TypeID;
  const void *v7;
  CFTypeID v8;
  const void *v9;
  CFTypeID v10;

  if (!theDict)
    return 0;
  result = CFDictionaryGetValue(theDict, CFSTR("strips"));
  if (!result)
    return result;
  v5 = result;
  TypeID = CFArrayGetTypeID();
  if (TypeID != CFGetTypeID(v5) || CFArrayGetCount((CFArrayRef)v5) <= a3)
    return 0;
  result = CFArrayGetValueAtIndex((CFArrayRef)v5, a3);
  if (!result)
    return result;
  v7 = result;
  v8 = CFDictionaryGetTypeID();
  if (v8 != CFGetTypeID(v7))
    return 0;
  result = CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("effects"));
  if (result)
  {
    v9 = result;
    v10 = CFArrayGetTypeID();
    if (v10 == CFGetTypeID(v9))
      return v9;
    else
      return 0;
  }
  return result;
}

CFIndex TuningPListMgr::getNumUnits(TuningPListMgr *this, CFArrayRef theArray)
{
  if (theArray)
    return CFArrayGetCount(theArray);
  else
    return 0;
}

const void *TuningPListMgr::getUnitByNumber(TuningPListMgr *this, CFArrayRef theArray, CFIndex a3)
{
  const void *result;
  const void *v6;
  CFTypeID TypeID;

  if (!theArray)
    return 0;
  if (CFArrayGetCount(theArray) <= a3)
    return 0;
  result = CFArrayGetValueAtIndex(theArray, a3);
  if (result)
  {
    v6 = result;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v6))
      return v6;
    else
      return 0;
  }
  return result;
}

const __CFDictionary *TuningPListMgr::getUnitByName(TuningPListMgr *this, CFArrayRef theArray, const char *a3)
{
  CFIndex Count;
  CFIndex v6;
  CFStringRef v7;
  const __CFString *v8;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  CFTypeID TypeID;
  const __CFString *Value;
  const __CFString *v14;
  CFTypeID v15;

  if (!theArray)
    return 0;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return 0;
  v6 = Count;
  v7 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v9);
    if (ValueAtIndex)
    {
      v11 = ValueAtIndex;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v11))
      {
        Value = (const __CFString *)CFDictionaryGetValue(v11, CFSTR("displayname"));
        if (Value)
        {
          v14 = Value;
          v15 = CFStringGetTypeID();
          if (v15 == CFGetTypeID(v14) && CFStringCompare(v8, v14, 0) == kCFCompareEqualTo)
            break;
        }
      }
    }
    if (v6 == ++v9)
    {
      v11 = 0;
      break;
    }
  }
  CFRelease(v8);
  return v11;
}

CFIndex TuningPListMgr::getUnitIndexByName(TuningPListMgr *this, CFArrayRef theArray, const __CFString *a3)
{
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  CFTypeID TypeID;
  const __CFString *Value;
  const __CFString *v12;
  CFTypeID v13;
  NSObject **v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!theArray)
    return -1;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return -1;
  if (!a3)
  {
    v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      v15 = *v14;
      if (!*v14)
        return -1;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "TuningPListMgr.cpp";
      v19 = 1024;
      v20 = 553;
      _os_log_impl(&dword_1A836D000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid nickname passed", (uint8_t *)&v17, 0x12u);
    }
    return -1;
  }
  v6 = Count;
  v7 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v7);
    if (ValueAtIndex)
    {
      v9 = ValueAtIndex;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        Value = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("displayname"));
        if (Value)
        {
          v12 = Value;
          v13 = CFStringGetTypeID();
          if (v13 == CFGetTypeID(v12) && CFStringCompare(a3, v12, 0) == kCFCompareEqualTo)
            break;
        }
      }
    }
    if (v6 == ++v7)
      return v6;
  }
  return v7;
}

const __CFDictionary *TuningPListMgr::getUnitByTuple(TuningPListMgr *this, CFArrayRef theArray, unsigned int a3, unsigned int a4, int a5, int a6)
{
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v15;
  CFTypeID TypeID;
  const __CFDictionary *Value;
  const __CFDictionary *v18;
  CFTypeID v19;
  TuningPListMgr *v20;
  unsigned int *v21;
  TuningPListMgr *v22;
  unsigned int *v23;
  TuningPListMgr *v24;
  unsigned int *v25;
  int v27;
  int v28;
  uint64_t v29;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v12 = Count;
      v27 = a5;
      for (i = 0; i != v12; ++i)
      {
        v29 = 0;
        v28 = 0;
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
        if (ValueAtIndex)
        {
          v15 = ValueAtIndex;
          TypeID = CFDictionaryGetTypeID();
          if (TypeID == CFGetTypeID(v15))
          {
            Value = (const __CFDictionary *)CFDictionaryGetValue(v15, CFSTR("unit"));
            if (Value)
            {
              v18 = Value;
              v19 = CFDictionaryGetTypeID();
              if (v19 == CFGetTypeID(v18))
              {
                v20 = (TuningPListMgr *)CFDictionaryGetValue(v18, CFSTR("manufacturer"));
                if (TuningPListMgr::cfGetUInt32_(v20, (char *)&v29 + 4, v21))
                {
                  v22 = (TuningPListMgr *)CFDictionaryGetValue(v18, CFSTR("type"));
                  if (TuningPListMgr::cfGetUInt32_(v22, &v29, v23))
                  {
                    v24 = (TuningPListMgr *)CFDictionaryGetValue(v18, CFSTR("subtype"));
                    if (TuningPListMgr::cfGetUInt32_(v24, &v28, v25) && v29 == __PAIR64__(a3, a4) && v28 == v27)
                    {
                      if (!a6)
                        return v15;
                      --a6;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

uint64_t TuningPListMgr::getAUBypassStateFromUnit(TuningPListMgr *this, CFDictionaryRef theDict)
{
  TuningPListMgr *Value;
  unsigned int *v3;
  unsigned int v5;

  if (!theDict)
    return 0;
  v5 = 0;
  Value = (TuningPListMgr *)CFDictionaryGetValue(theDict, CFSTR("bypass"));
  if (TuningPListMgr::cfGetUInt32_(Value, &v5, v3))
    return v5;
  else
    return 0;
}

const void *TuningPListMgr::getAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex a3, CFIndex a4)
{
  TuningPListMgr *v6;
  TuningPListMgr *Effect;
  TuningPListMgr *UnitByNumber;

  v6 = TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (v6
    && (Effect = (TuningPListMgr *)TuningPListMgr::getEffect(v6, v6, a3)) != 0
    && (UnitByNumber = (TuningPListMgr *)TuningPListMgr::getUnitByNumber(Effect, Effect, a4)) != 0)
  {
    return TuningPListMgr::getAUPresetFromUnit(UnitByNumber, UnitByNumber);
  }
  else
  {
    return 0;
  }
}

const void *TuningPListMgr::getAUPresetByTuple(TuningPListMgr *this, const char *a2, char *a3, unsigned int a4, unsigned int a5, int a6, int a7)
{
  uint64_t Value;
  const __CFDictionary *v13;
  char *v14;
  CFTypeID TypeID;
  char *v16;

  Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value)
    return 0;
  v13 = (const __CFDictionary *)Value;
  v14 = a3;
  if (a3 == (char *)-1)
  {
    Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("strips"));
    v14 = (char *)Value;
    if (Value)
    {
      TypeID = CFArrayGetTypeID();
      Value = CFGetTypeID(v14);
      if (TypeID == Value)
      {
        Value = CFArrayGetCount((CFArrayRef)v14);
        a3 = (char *)(Value - 1);
        if (Value < 1)
          return 0;
      }
      else
      {
        a3 = 0;
      }
      v14 = 0;
    }
    else
    {
      a3 = 0;
    }
  }
  v16 = a3 + 1;
  while (1)
  {
    Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v13, (CFIndex)v14);
    if (Value)
    {
      Value = (uint64_t)TuningPListMgr::getUnitByTuple((TuningPListMgr *)Value, (CFArrayRef)Value, a4, a5, a6, a7);
      if (Value)
        break;
    }
    if (v16 == ++v14)
      return 0;
  }
  return TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
}

const void *TuningPListMgr::getAUPresetAndBypassStateByTuple(TuningPListMgr *this, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6, int a7, unsigned int *a8)
{
  uint64_t Value;
  const __CFDictionary *v15;
  char *v16;
  CFTypeID TypeID;
  const __CFDictionary *v19;
  const void *AUPresetFromUnit;
  TuningPListMgr *v21;
  unsigned int *v22;
  _BOOL4 UInt32;
  unsigned int v24;
  unsigned int v25;

  Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value)
    return 0;
  v15 = (const __CFDictionary *)Value;
  v16 = (char *)a3;
  if (a3 == -1)
  {
    Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("strips"));
    v16 = (char *)Value;
    if (!Value)
    {
      a3 = 0;
      goto LABEL_10;
    }
    TypeID = CFArrayGetTypeID();
    Value = CFGetTypeID(v16);
    if (TypeID == Value)
    {
      Value = CFArrayGetCount((CFArrayRef)v16);
      a3 = Value - 1;
      if (Value < 1)
        return 0;
    }
    else
    {
      a3 = 0;
    }
    v16 = 0;
  }
LABEL_10:
  while (1)
  {
    Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v15, (CFIndex)v16);
    if (Value)
    {
      Value = (uint64_t)TuningPListMgr::getUnitByTuple((TuningPListMgr *)Value, (CFArrayRef)Value, a4, a5, a6, a7);
      if (Value)
        break;
    }
    if ((char *)(a3 + 1) == ++v16)
      return 0;
  }
  v19 = (const __CFDictionary *)Value;
  AUPresetFromUnit = TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
  v25 = 0;
  v21 = (TuningPListMgr *)CFDictionaryGetValue(v19, CFSTR("bypass"));
  UInt32 = TuningPListMgr::cfGetUInt32_(v21, &v25, v22);
  v24 = v25;
  if (!UInt32)
    v24 = 0;
  *a8 = v24;
  return AUPresetFromUnit;
}

const void *TuningPListMgr::getAUPresetByName(TuningPListMgr *this, const char *a2, char *a3, const char *a4)
{
  uint64_t Value;
  const __CFDictionary *v7;
  char *v8;
  CFTypeID TypeID;
  char *v10;

  Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value)
    return 0;
  v7 = (const __CFDictionary *)Value;
  v8 = a3;
  if (a3 == (char *)-1)
  {
    Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("strips"));
    v8 = (char *)Value;
    if (Value)
    {
      TypeID = CFArrayGetTypeID();
      Value = CFGetTypeID(v8);
      if (TypeID == Value)
      {
        Value = CFArrayGetCount((CFArrayRef)v8);
        a3 = (char *)(Value - 1);
        if (Value < 1)
          return 0;
      }
      else
      {
        a3 = 0;
      }
      v8 = 0;
    }
    else
    {
      a3 = 0;
    }
  }
  v10 = a3 + 1;
  while (1)
  {
    Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v7, (CFIndex)v8);
    if (Value)
    {
      Value = (uint64_t)TuningPListMgr::getUnitByName((TuningPListMgr *)Value, (CFArrayRef)Value, a4);
      if (Value)
        break;
    }
    if (v10 == ++v8)
      return 0;
  }
  return TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
}

const __CFDictionary *TuningPListMgr::getAUPresetByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 1);
}

const __CFDictionary *TuningPListMgr::getAUPListByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 2);
}

const __CFDictionary *TuningPListMgr::getPropertyStripByName(TuningPListMgr *this, const char *a2)
{
  return TuningPListMgr::lookupPlist_((uint64_t)this, a2, 3);
}

const void *TuningPListMgr::getAUPresetAndBypassStateByName(TuningPListMgr *this, const char *a2, uint64_t a3, const char *a4, unsigned int *a5)
{
  uint64_t Value;
  const __CFDictionary *v9;
  char *v10;
  CFTypeID TypeID;
  const __CFDictionary *v13;
  const void *AUPresetFromUnit;
  TuningPListMgr *v15;
  unsigned int *v16;
  _BOOL4 UInt32;
  unsigned int v18;
  unsigned int v19;

  *a5 = 0;
  Value = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!Value)
    return 0;
  v9 = (const __CFDictionary *)Value;
  v10 = (char *)a3;
  if (a3 == -1)
  {
    Value = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("strips"));
    v10 = (char *)Value;
    if (!Value)
    {
      a3 = 0;
      goto LABEL_10;
    }
    TypeID = CFArrayGetTypeID();
    Value = CFGetTypeID(v10);
    if (TypeID == Value)
    {
      Value = CFArrayGetCount((CFArrayRef)v10);
      a3 = Value - 1;
      if (Value < 1)
        return 0;
    }
    else
    {
      a3 = 0;
    }
    v10 = 0;
  }
LABEL_10:
  while (1)
  {
    Value = (uint64_t)TuningPListMgr::getEffect((TuningPListMgr *)Value, v9, (CFIndex)v10);
    if (Value)
    {
      Value = (uint64_t)TuningPListMgr::getUnitByName((TuningPListMgr *)Value, (CFArrayRef)Value, a4);
      if (Value)
        break;
    }
    if ((char *)(a3 + 1) == ++v10)
      return 0;
  }
  v13 = (const __CFDictionary *)Value;
  AUPresetFromUnit = TuningPListMgr::getAUPresetFromUnit((TuningPListMgr *)Value, (CFDictionaryRef)Value);
  v19 = 0;
  v15 = (TuningPListMgr *)CFDictionaryGetValue(v13, CFSTR("bypass"));
  UInt32 = TuningPListMgr::cfGetUInt32_(v15, &v19, v16);
  v18 = v19;
  if (!UInt32)
    v18 = 0;
  *a5 = v18;
  return AUPresetFromUnit;
}

uint64_t TuningPListMgr::addAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex Count, const __CFDictionary *a4)
{
  uint64_t result;
  const __CFArray *Effect;
  __CFArray *v8;
  NSObject **v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!result)
    return result;
  Effect = (const __CFArray *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
  if (!Effect)
  {
    v9 = (NSObject **)logSubsystem();
    if (v9)
    {
      v10 = *v9;
      if (!*v9)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "TuningPListMgr.cpp";
      v13 = 1024;
      v14 = 869;
      v15 = 1024;
      v16 = Count;
      _os_log_impl(&dword_1A836D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot add preset at the index: %d", (uint8_t *)&v11, 0x18u);
    }
    return 0xFFFFFFFFLL;
  }
  v8 = Effect;
  if (Count == -1)
    Count = CFArrayGetCount(Effect);
  CFArrayInsertValueAtIndex(v8, Count, a4);
  return 0;
}

uint64_t TuningPListMgr::removeAUPresetByName(TuningPListMgr *this, const char *a2, const __CFString *a3)
{
  uint64_t result;
  TuningPListMgr *Effect;
  __CFArray *v6;
  CFIndex UnitIndexByName;
  CFIndex v8;
  NSObject **v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (result)
  {
    Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
    if (Effect)
    {
      v6 = Effect;
      UnitIndexByName = TuningPListMgr::getUnitIndexByName(Effect, Effect, a3);
      if ((UnitIndexByName & 0x8000000000000000) == 0)
      {
        v8 = UnitIndexByName;
        if (UnitIndexByName <= CFArrayGetCount(v6))
        {
          CFArrayRemoveValueAtIndex(v6, v8);
          return 0;
        }
      }
      return 0xFFFFFFFFLL;
    }
    v9 = (NSObject **)logSubsystem();
    if (v9)
    {
      v10 = *v9;
      if (!*v9)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "TuningPListMgr.cpp";
      v13 = 1024;
      v14 = 898;
      _os_log_impl(&dword_1A836D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot get the effects array", (uint8_t *)&v11, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByNumber(TuningPListMgr *this, const char *a2, CFIndex a3, const __CFDictionary *a4)
{
  uint64_t result;
  TuningPListMgr *Effect;
  NSObject **v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (result)
  {
    Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
    if (Effect)
    {
      result = (uint64_t)TuningPListMgr::getUnitByNumber(Effect, Effect, a3);
      if (result)
        return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a4);
      return result;
    }
    v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      v9 = *v8;
      if (!*v8)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "TuningPListMgr.cpp";
      v12 = 1024;
      v13 = 928;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by index: %d", (uint8_t *)&v10, 0x18u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByTuple(TuningPListMgr *this, const char *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6, const __CFDictionary *a7)
{
  uint64_t result;
  TuningPListMgr *Effect;
  NSObject **v14;
  NSObject *v15;
  _BYTE v16[16];
  _BYTE v17[16];
  uint8_t v18[16];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint8_t *v24;
  __int16 v25;
  _BYTE *v26;
  __int16 v27;
  _BYTE *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (result)
  {
    Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
    if (Effect)
    {
      result = (uint64_t)TuningPListMgr::getUnitByTuple(Effect, Effect, a5, a3, a4, a6);
      if (result)
        return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a7);
      return result;
    }
    v14 = (NSObject **)logSubsystem();
    if (v14)
    {
      v15 = *v14;
      if (!*v14)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v18, a3);
      CAX4CCString::CAX4CCString((CAX4CCString *)v17, a4);
      CAX4CCString::CAX4CCString((CAX4CCString *)v16, a5);
      *(_DWORD *)buf = 136316162;
      v20 = "TuningPListMgr.cpp";
      v21 = 1024;
      v22 = 958;
      v23 = 2080;
      v24 = v18;
      v25 = 2080;
      v26 = v17;
      v27 = 2080;
      v28 = v16;
      _os_log_impl(&dword_1A836D000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by tuple: %s-%s-%s", buf, 0x30u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t TuningPListMgr::replaceAUPresetByName(TuningPListMgr *this, const char *a2, const char *a3, const __CFDictionary *a4)
{
  uint64_t result;
  TuningPListMgr *Effect;
  NSObject **v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = (uint64_t)TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (result)
  {
    Effect = (TuningPListMgr *)TuningPListMgr::getEffect((TuningPListMgr *)result, (CFDictionaryRef)result, 0);
    if (Effect)
    {
      result = (uint64_t)TuningPListMgr::getUnitByName(Effect, Effect, a3);
      if (result)
        return TuningPListMgr::_replaceAUPreset((TuningPListMgr *)result, (__CFDictionary *)result, a4);
      return result;
    }
    v8 = (NSObject **)logSubsystem();
    if (v8)
    {
      v9 = *v8;
      if (!*v8)
        return 0xFFFFFFFFLL;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "TuningPListMgr.cpp";
      v12 = 1024;
      v13 = 989;
      v14 = 2080;
      v15 = a3;
      _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get au by name: %s", (uint8_t *)&v10, 0x1Cu);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t TuningPListMgr::flushTuning(TuningPListMgr *this, const char *a2, const char *a3)
{
  CFMutableStringRef Mutable;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  BOOL v9;
  uint64_t v10;
  NSObject **v11;
  NSObject *v12;
  NSObject **v13;
  NSObject *v14;
  FILE *v15;
  const char *CStringPtr;
  _BYTE buf[12];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512);
  v7 = TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  if (!v7)
  {
    v11 = (NSObject **)logSubsystem();
    if (v11)
    {
      v12 = *v11;
      if (!*v11)
      {
LABEL_18:
        v10 = 0xFFFFFFFFLL;
        goto LABEL_19;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "TuningPListMgr.cpp";
      v19 = 1024;
      v20 = 1010;
      _os_log_impl(&dword_1A836D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot get strip data", buf, 0x12u);
    }
    goto LABEL_18;
  }
  v8 = v7;
  *(_QWORD *)buf = CFStringCreateWithCString(0, a3, 0x600u);
  buf[8] = 1;
  v9 = TuningPListMgr::savePlistFile_(*(TuningPListMgr **)buf, *(const __CFString **)buf, v8, Mutable);
  CACFString::~CACFString((CACFString *)buf);
  if (!v9)
  {
    v13 = (NSObject **)logSubsystem();
    if (v13)
    {
      v14 = *v13;
      if (!*v13)
      {
LABEL_16:
        if (Mutable)
        {
          v15 = (FILE *)*MEMORY[0x1E0C80C10];
          CStringPtr = CFStringGetCStringPtr(Mutable, 0);
          fprintf(v15, "errorString: %s\n", CStringPtr);
        }
        goto LABEL_18;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "TuningPListMgr.cpp";
      v19 = 1024;
      v20 = 1017;
      _os_log_impl(&dword_1A836D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing xml data to file", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v10 = 0;
LABEL_19:
  CFRelease(Mutable);
  return v10;
}

void sub_1A837AFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  CACFString::~CACFString((CACFString *)va);
  _Unwind_Resume(a1);
}

BOOL TuningPListMgr::savePlistFile_(TuningPListMgr *this, const __CFString *a2, const __CFDictionary *a3, __CFString *a4)
{
  const __CFAllocator *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  __CFWriteStream *v10;
  _BOOL8 v11;

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, kCFURLPOSIXPathStyle, 0);
  if (!v8)
  {
    v11 = 0;
LABEL_6:
    if (!a4)
      return v11;
    goto LABEL_10;
  }
  v9 = v8;
  v10 = CFWriteStreamCreateWithFile(v7, v8);
  v11 = v10 != 0;
  CFRelease(v9);
  if (!v10)
    goto LABEL_6;
  if (CFWriteStreamOpen(v10))
    v11 = CFPropertyListWrite(a3, v10, kCFPropertyListXMLFormat_v1_0, 0, 0) != 0;
  else
    v11 = 0;
  CFWriteStreamClose(v10);
  CFRelease(v10);
  if (a4)
  {
LABEL_10:
    if (!v11)
    {
      CFStringAppend(a4, CFSTR("Error saving plist file "));
      CFStringAppend(a4, a2);
      CFStringAppend(a4, CFSTR("\n"));
    }
  }
  return v11;
}

uint64_t TuningPListMgr::changeStripName(TuningPListMgr *this, const char *a2, char *a3)
{
  __CFDictionary *v4;
  void **v5;
  CFIndex v6;
  CFStringRef v7;
  uint64_t i;
  std::runtime_error *exception;
  void *__p[2];
  unsigned __int8 v12;

  v4 = TuningPListMgr::lookupPlist_((uint64_t)this, a2, 0);
  std::string::basic_string[abi:ne180100]<0>(__p, a3);
  if ((v12 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v12 & 0x80u) == 0)
    v6 = v12;
  else
    v6 = (CFIndex)__p[1];
  v7 = CFStringCreateWithBytes(0, (const UInt8 *)v5, v6, 0x8000100u, 0);
  if (!v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
  for (i = 0; i != 2; ++i)
    CFDictionaryReplaceValue(v4, kLegacyStripNameKeys[i], v7);
  CFRelease(v7);
  return 0;
}

void sub_1A837B204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t PListLogger::vlog(PListLogger *this, const char *a2, va_list a3)
{
  return vdprintf(*(_DWORD *)this, a2, a3);
}

void PListLogger::logArrayEntry(const __CFString *this, const void *a2, PListLogger *a3, void *a4)
{
  void *v6;
  char __str[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x10uLL, "[%u]", (_DWORD)a2);
  PListLogger::logItemEntry(this, __str, a3, v6);
}

float CACFNumber::GetFixed32(const __CFNumber **this)
{
  const __CFNumber *v1;
  int v2;
  float v3;
  int valuePtr;

  valuePtr = 0;
  v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    v2 = valuePtr;
    v3 = 1.0;
    if (valuePtr < 0)
      v3 = -1.0;
  }
  else
  {
    v2 = 0;
    v3 = 1.0;
  }
  return v3
       * (float)((float)((float)(unsigned __int16)(v2 * (int)v3) * 0.000015259)
               + (float)(((v2 * (int)v3) >> 16) & 0x7FFF));
}

double CACFNumber::GetFixed64(const __CFNumber **this)
{
  const __CFNumber *v1;
  uint64_t v2;
  double v3;
  uint64_t valuePtr;

  valuePtr = 0;
  v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
    v2 = valuePtr;
    v3 = 1.0;
    if (valuePtr < 0)
      v3 = -1.0;
  }
  else
  {
    v2 = 0;
    v3 = 1.0;
  }
  return v3
       * ((double)(v2 * (uint64_t)v3) * 2.32830644e-10
        + (double)(((unint64_t)(v2 * (uint64_t)v3) >> 32) & 0x7FFFFFFF));
}

void CACFNumber::PrintToLog(CACFNumber *this, const __CFNumber *a2)
{
  uint64_t v2;
  CFNumberType Type;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  double valuePtr;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BYTE *v14;
  __int16 v15;
  double v16;
  _BYTE __b[256];
  uint64_t v18;

  LODWORD(v2) = (_DWORD)a2;
  v18 = *MEMORY[0x1E0C80C00];
  Type = CFNumberGetType(this);
  if ((_DWORD)v2)
  {
    v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    v2 = 0;
  }
  __b[v2] = 0;
  switch(Type)
  {
    case kCFNumberSInt8Type:
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 62;
        v13 = 2080;
        v14 = __b;
        v15 = 1024;
        LODWORD(v16) = SLOBYTE(valuePtr);
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt16Type:
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 70;
        v13 = 2080;
        v14 = __b;
        v15 = 1024;
        LODWORD(v16) = SLOWORD(valuePtr);
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 86;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat32Type:
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 94;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = *(float *)&valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat64Type:
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 102;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 109;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%li";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongLongType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 116;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberCFIndexType, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 123;
        v13 = 2080;
        v14 = __b;
        v15 = 2048;
        v16 = valuePtr;
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%li";
LABEL_24:
        v7 = 38;
        goto LABEL_25;
      }
      break;
    default:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = "CACFNumber.cpp";
        v11 = 1024;
        v12 = 79;
        v13 = 2080;
        v14 = __b;
        v15 = 1024;
        LODWORD(v16) = LODWORD(valuePtr);
        v5 = MEMORY[0x1E0C81028];
        v6 = "%25s:%-5d  %s%i";
LABEL_15:
        v7 = 34;
LABEL_25:
        _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
      }
      break;
  }
}

void CACFBoolean::PrintToLog(CACFBoolean *this, const __CFBoolean *a2)
{
  uint64_t v2;
  int Value;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _BYTE *v12;
  _BYTE __b[256];
  uint64_t v14;

  LODWORD(v2) = (_DWORD)a2;
  v14 = *MEMORY[0x1E0C80C00];
  Value = CFBooleanGetValue(this);
  if ((_DWORD)v2)
  {
    v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    v2 = 0;
  }
  __b[v2] = 0;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (Value)
  {
    if (!v4)
      return;
    v7 = 136315650;
    v8 = "CACFNumber.cpp";
    v9 = 1024;
    v10 = 143;
    v11 = 2080;
    v12 = __b;
    v5 = MEMORY[0x1E0C81028];
    v6 = "%25s:%-5d  %strue";
  }
  else
  {
    if (!v4)
      return;
    v7 = 136315650;
    v8 = "CACFNumber.cpp";
    v9 = 1024;
    v10 = 147;
    v11 = 2080;
    v12 = __b;
    v5 = MEMORY[0x1E0C81028];
    v6 = "%25s:%-5d  %sfalse";
  }
  _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x1Cu);
}

void XPC_Service::ConnectionHandler(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);

}

void sub_1A837BB3C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1A837BB28);
}

void sub_1A837BB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void *CADeprecated::XMachServer::RemoveMachClient(_QWORD *a1, uint64_t a2)
{
  void *result;
  int v5;
  char *v6;
  char *v7;
  int64_t v8;

  CADeprecated::XMachPortDeathListener::CancelPortDeathNotification((CADeprecated::XMachPortDeathListener *)(a1 + 10), *(_DWORD *)(a2 + 12));
  result = (void *)(*(uint64_t (**)(_QWORD *))(a1[14] + 16))(a1 + 14);
  v5 = (int)result;
  v7 = (char *)a1[25];
  v6 = (char *)a1[26];
  while (v7 != v6)
  {
    if (*(_QWORD *)v7 == a2)
    {
      v8 = v6 - (v7 + 8);
      if (v6 != v7 + 8)
        result = memmove(v7, v7 + 8, v6 - (v7 + 8));
      a1[26] = &v7[v8];
      break;
    }
    v7 += 8;
  }
  if (v5)
    return (void *)(*(uint64_t (**)(_QWORD *))(a1[14] + 24))(a1 + 14);
  return result;
}

uint64_t CADeprecated::XMachServer::GetDebugName(CADeprecated::XMachServer *this)
{
  return *((_QWORD *)this + 1);
}

void *CADeprecated::XMachServer::PortDied(CADeprecated::XMachServer *this, int a2)
{
  _QWORD *v4;
  void *result;
  int v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (_QWORD *)((char *)this + 112);
  result = (void *)(*(uint64_t (**)(char *))(*((_QWORD *)this + 14) + 16))((char *)this + 112);
  v6 = (int)result;
  v8 = (uint64_t *)v4[11];
  v7 = (uint64_t *)v4[12];
  while (1)
  {
    if (v8 == v7)
    {
      v9 = 0;
      if (!(_DWORD)result)
        goto LABEL_11;
      goto LABEL_10;
    }
    v9 = *v8;
    if (*(_DWORD *)(*v8 + 12) == a2)
      break;
    ++v8;
  }
  v10 = (char *)v7 - (char *)(v8 + 1);
  if (v7 != v8 + 1)
    result = memmove(v8, v8 + 1, (char *)v7 - (char *)(v8 + 1));
  *((_QWORD *)this + 26) = (char *)v8 + v10;
  if (v6)
LABEL_10:
    result = (void *)(*(uint64_t (**)(_QWORD *))(*v4 + 24))(v4);
LABEL_11:
  if (v9)
    return (void *)(*(uint64_t (**)(CADeprecated::XMachServer *, uint64_t))(*(_QWORD *)this + 32))(this, v9);
  return result;
}

void *`non-virtual thunk to'CADeprecated::XMachServer::PortDied(CADeprecated::XMachServer *this, int a2)
{
  return CADeprecated::XMachServer::PortDied((CADeprecated::XMachServer *)((char *)this - 80), a2);
}

uint64_t `non-virtual thunk to'CADeprecated::XMachServer::GetDebugName(CADeprecated::XMachServer *this)
{
  return *((_QWORD *)this - 9);
}

void CADeprecated::XMachPortDeathListener::CancelPortDeathNotification(CADeprecated::XMachPortDeathListener *this, mach_port_name_t a2)
{
  ipc_space_t *v3;
  kern_return_t v4;
  kern_return_t v5;
  uint64_t v6;
  mach_port_t previous;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  previous = 0;
  v3 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v4 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], a2, 72, 1u, 0, 0x15u, &previous);
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *))(*(_QWORD *)this + 24))(this);
      *(_DWORD *)buf = 136315906;
      v9 = "XMachServer.cpp";
      v10 = 1024;
      v11 = 128;
      v12 = 2080;
      v13 = v6;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: XMachServer couldn't cancel port-death notification (0x%x)", buf, 0x22u);
    }
  }
  else
  {
    mach_port_deallocate(*v3, previous);
  }
}

void std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t CADeprecated::XMachPortDeathListener::PortDeathListenerProc(CADeprecated::XMachPortDeathListener *this, const mach_dead_name_notification_t *a2, void *a3, CADeprecated::XMachPortDeathListener *a4, void *a5)
{
  return CADeprecated::XMachPortDeathListener::DispatchPortDeathMessage((uint64_t)a4, a2);
}

uint64_t CADeprecated::XMachPortDeathListener::DispatchPortDeathMessage(uint64_t this, const mach_dead_name_notification_t *a2)
{
  uint64_t v2;
  uint64_t not_port;

  if (a2->not_header.msgh_id == 72)
  {
    v2 = this;
    not_port = a2->not_port;
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], a2->not_port);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 16))(v2, not_port);
  }
  return this;
}

uint64_t CADeprecated::XRemoteMachServer::PortDied(CADeprecated::XRemoteMachServer *this, int a2)
{
  char *v4;
  int v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int64_t v9;

  v4 = (char *)this + 80;
  v5 = (*(uint64_t (**)(char *))(*((_QWORD *)this + 10) + 16))((char *)this + 80);
  v7 = (char *)*((_QWORD *)v4 - 3);
  v6 = (char *)*((_QWORD *)v4 - 2);
  while (1)
  {
    if (v7 == v6)
      goto LABEL_8;
    if (*(_DWORD *)v7 == a2)
      break;
    v7 += 8;
  }
  v8 = *((unsigned int *)v7 + 1);
  v9 = v6 - (v7 + 8);
  if (v6 != v7 + 8)
    memmove(v7, v7 + 8, v6 - (v7 + 8));
  *((_QWORD *)this + 8) = &v7[v9];
  if (!(_DWORD)v8)
  {
LABEL_8:
    if (*((_DWORD *)this + 12) == a2)
      v8 = *((unsigned int *)this + 13);
    else
      v8 = 0;
  }
  *((_QWORD *)this + 6) = 0;
  if (v5)
    (*(void (**)(char *))(*(_QWORD *)v4 + 24))(v4);
  return (*(uint64_t (**)(CADeprecated::XRemoteMachServer *, uint64_t))(*(_QWORD *)this + 32))(this, v8);
}

uint64_t CADeprecated::XRemoteMachServer::GetDebugName(CADeprecated::XRemoteMachServer *this)
{
  return *((_QWORD *)this + 4);
}

void CADeprecated::XMachPortServicer::DispatchImpl::~DispatchImpl(CADeprecated::XMachPortServicer::DispatchImpl *this)
{
  CADeprecated::XMachPortServicer::DispatchImpl::~DispatchImpl(this);
  JUMPOUT(0x1A85D2980);
}

{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  *(_QWORD *)this = &off_1E54252D8;
  v2 = *((_QWORD *)this + 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN12CADeprecated17XMachPortServicer12DispatchImplD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_7;
  block[4] = this;
  dispatch_barrier_sync(v2, block);
  v3 = *((_QWORD *)this + 2);
  if (v3)
    dispatch_release(v3);
  v4 = *((_QWORD *)this + 1);
  if (v4)
    dispatch_release(v4);
}

void ___ZN12CADeprecated17XMachPortServicer12DispatchImplD2Ev_block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
}

_QWORD *CADeprecated::XMachPortDeathListener::XMachPortDeathListener(_QWORD *this)
{
  *this = off_1E5425330;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(CADeprecated::XMachPortDeathListener *this)
{
  const void *v2;
  const void *v3;
  uint64_t v4;

  *(_QWORD *)this = off_1E5425330;
  v2 = (const void *)*((_QWORD *)this + 2);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)*((_QWORD *)this + 3);
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
}

uint64_t CADeprecated::XMachPortDeathListener::SetDeathNotificationRunLoopAndMode(CADeprecated::XMachPortDeathListener *this, __CFRunLoop *a2, const __CFString *a3)
{
  CFRunLoopSourceRef RunLoopSource;
  __CFMachPort *PortDeathCFPort;
  _QWORD *v8;
  _QWORD *v9;
  const __CFString **v10;
  const __CFString *v11;
  uint64_t result;

  RunLoopSource = (CFRunLoopSourceRef)*((_QWORD *)this + 3);
  if (!RunLoopSource)
  {
    PortDeathCFPort = CADeprecated::XMachPortDeathListener::GetPortDeathCFPort(this);
    RunLoopSource = CFMachPortCreateRunLoopSource(0, PortDeathCFPort, 1);
    *((_QWORD *)this + 3) = RunLoopSource;
  }
  v8 = (_QWORD *)operator new();
  v9 = v8;
  v10 = (const __CFString **)MEMORY[0x1E0C9B280];
  *v8 = &off_1E54252B8;
  v8[1] = a2;
  v11 = *v10;
  if (a3)
    v11 = a3;
  v8[2] = v11;
  v8[3] = RunLoopSource;
  CFRetain(a2);
  CFRetain((CFTypeRef)v9[2]);
  CFRetain((CFTypeRef)v9[3]);
  CFRunLoopAddSource((CFRunLoopRef)v9[1], (CFRunLoopSourceRef)v9[3], (CFRunLoopMode)v9[2]);
  result = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v9;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_1A837C1D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A85D2980](v1, 0xE1C405CB88AE7);
  _Unwind_Resume(a1);
}

void CADeprecated::XMachPortServicer::RunLoopImpl::~RunLoopImpl(CADeprecated::XMachPortServicer::RunLoopImpl *this)
{
  CADeprecated::XMachPortServicer::RunLoopImpl::~RunLoopImpl(this);
  JUMPOUT(0x1A85D2980);
}

{
  *(_QWORD *)this = &off_1E54252B8;
  CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), *((CFRunLoopSourceRef *)this + 3), *((CFRunLoopMode *)this + 2));
  CFRelease(*((CFTypeRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 2));
  CFRelease(*((CFTypeRef *)this + 3));
}

uint64_t ___ZN12CADeprecated22XMachPortDeathListener33SetDeathNotificationDispatchQueueERKN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  return CADeprecated::XMachPortDeathListener::ReadPortDeathMessage(*(CADeprecated::XMachPortDeathListener **)(a1 + 32), *(_DWORD *)(a1 + 40));
}

uint64_t CADeprecated::XMachPortDeathListener::ReadPortDeathMessage(CADeprecated::XMachPortDeathListener *this, mach_port_name_t rcv_name)
{
  uint64_t result;
  uint64_t v4;
  mach_msg_header_t msg;
  mach_port_name_t name;

  msg.msgh_bits = 0;
  msg.msgh_remote_port = 0;
  msg.msgh_local_port = rcv_name;
  *(_QWORD *)&msg.msgh_voucher_port = 0;
  result = mach_msg(&msg, 2, 0, 0x38u, rcv_name, 0, 0);
  if (msg.msgh_id == 72)
  {
    v4 = name;
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], name);
    return (*(uint64_t (**)(CADeprecated::XMachPortDeathListener *, uint64_t))(*(_QWORD *)this + 16))(this, v4);
  }
  return result;
}

void CADeprecated::XMachReceivePort::~XMachReceivePort(CADeprecated::XMachReceivePort *this)
{
  atomic_load((unsigned int *)this);
  CADeprecated::XMachReceivePort::SetMachPort((unsigned int *)this, 0);
}

void CADeprecated::XMachPortSendRight::~XMachPortSendRight(mach_port_name_t *this)
{
  if (*this)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], *this);
}

mach_port_name_t *CADeprecated::XMachPortSendRight::SetMachPort(mach_port_name_t *this, mach_port_name_t a2)
{
  mach_port_name_t *v3;

  v3 = this;
  if (*this)
    this = (mach_port_name_t *)mach_port_deallocate(*MEMORY[0x1E0C83DA0], *this);
  *v3 = a2;
  return this;
}

uint64_t CADeprecated::XMachServer::CreateServerPort(CADeprecated::XMachServer *this, const char *a2, kern_return_t *a3, int *a4)
{
  char v5;
  ipc_space_t *v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  kern_return_t v11;
  char *v12;
  kern_return_t inserted;
  mach_port_t special_port[2];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  CADeprecated::XMachServer *v21;
  __int16 v22;
  kern_return_t v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v5 = (char)a2;
  v26 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)special_port = 0;
  v7 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v8 = task_get_special_port(*MEMORY[0x1E0C83DA0], 4, special_port);
  if (v8)
  {
    v9 = v8;
    goto LABEL_3;
  }
  if ((v5 & 1) != 0)
  {
    v11 = bootstrap_check_in(special_port[0], (const char *)this, &special_port[1]);
    if (!v11)
    {
      inserted = mach_port_insert_right(*v7, special_port[1], special_port[1], 0x14u);
      v10 = special_port[1];
      if (inserted | special_port[1])
        goto LABEL_16;
      v9 = 0;
      if ((v5 & 2) == 0)
        goto LABEL_3;
LABEL_11:
      inserted = mach_port_allocate(*v7, 1u, &special_port[1]);
      v10 = special_port[1];
      if (!inserted)
      {
        v9 = mach_port_insert_right(*v7, special_port[1], special_port[1], 0x14u);
        v10 = special_port[1];
        goto LABEL_17;
      }
LABEL_16:
      v9 = inserted;
      goto LABEL_17;
    }
    v9 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = mach_error_string(v9);
      *(_DWORD *)buf = 136316162;
      v17 = "XMachServer.cpp";
      v18 = 1024;
      v19 = 227;
      v20 = 2080;
      v21 = this;
      v22 = 1024;
      v23 = v9;
      v24 = 2080;
      v25 = v12;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d bootstrap_check_in(%s) failed: 0x%x; %s",
        buf,
        0x2Cu);
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = special_port[1];
  if (special_port[1])
    goto LABEL_17;
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_3:
  v10 = 0;
LABEL_17:
  *a3 = v9;
  return v10;
}

uint64_t CADeprecated::XMachServer::XMachServer(uint64_t a1, __int128 *a2, CADeprecated::XMachServer *a3, const char *a4)
{
  __int128 v7;
  _QWORD *v8;
  unsigned int *v9;
  int *v10;
  unsigned int v11;
  char *v13;
  CAXException *exception;
  mach_error_t v15;
  mach_error_t error_value;
  uint8_t v17[16];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint8_t *v23;
  __int16 v24;
  char *v25;
  char __str[512];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a1 = &off_1E5425298;
  v7 = *a2;
  *(_OWORD *)(a1 + 24) = a2[1];
  *(_OWORD *)(a1 + 8) = v7;
  v8 = operator new(0x20uLL);
  v8[1] = 0;
  v8[2] = 0;
  *v8 = &off_1E5425740;
  *((_DWORD *)v8 + 6) = 0;
  *(_QWORD *)(a1 + 40) = v8 + 3;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 80) = &unk_1E5425268;
  *(_BYTE *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)a1 = off_1E5425220;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)(a1 + 112), "XMachServer.mLock");
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  error_value = 0;
  v9 = *(unsigned int **)(a1 + 40);
  v11 = CADeprecated::XMachServer::CreateServerPort(a3, a4, &error_value, v10);
  CADeprecated::XMachReceivePort::SetMachPort(v9, v11);
  if (error_value)
  {
    v15 = error_value;
    v13 = mach_error_string(error_value);
    snprintf(__str, 0x200uLL, "XMachServer init for service %s failed: %s", (const char *)a3, v13);
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v17, v15);
      *(_DWORD *)buf = 136315906;
      v19 = "XMachServer.cpp";
      v20 = 1024;
      v21 = 262;
      v22 = 2080;
      v23 = v17;
      v24 = 2080;
      v25 = __str;
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, __str, v15);
  }
  return a1;
}

void sub_1A837C774(_Unwind_Exception *a1)
{
  CADeprecated::XBasicMIGServer *v1;
  CADeprecated::XMachPortDeathListener *v2;
  CADeprecated::CAMutex *v3;
  void **v4;
  void *v6;

  v6 = *v4;
  if (*v4)
  {
    *((_QWORD *)v1 + 26) = v6;
    operator delete(v6);
  }
  CADeprecated::CAMutex::~CAMutex(v3);
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(v2);
  CADeprecated::XBasicMIGServer::~XBasicMIGServer(v1);
  _Unwind_Resume(a1);
}

void CAXException::CAXException(CAXException *this, const char *__s, int a3)
{
  size_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  *(_QWORD *)this = &off_1E5425040;
  *((_DWORD *)this + 66) = a3;
  if (__s)
  {
    v5 = strlen(__s);
    v6 = (char *)this + 8;
    if (v5 < 0x100)
    {
      strlcpy(v6, __s, 0x100uLL);
    }
    else
    {
      v7 = *(_OWORD *)__s;
      v8 = *((_OWORD *)__s + 1);
      v9 = *((_OWORD *)__s + 3);
      *(_OWORD *)((char *)this + 40) = *((_OWORD *)__s + 2);
      *(_OWORD *)((char *)this + 56) = v9;
      *(_OWORD *)v6 = v7;
      *(_OWORD *)((char *)this + 24) = v8;
      v10 = *((_OWORD *)__s + 4);
      v11 = *((_OWORD *)__s + 5);
      v12 = *((_OWORD *)__s + 7);
      *(_OWORD *)((char *)this + 104) = *((_OWORD *)__s + 6);
      *(_OWORD *)((char *)this + 120) = v12;
      *(_OWORD *)((char *)this + 72) = v10;
      *(_OWORD *)((char *)this + 88) = v11;
      v13 = *((_OWORD *)__s + 8);
      v14 = *((_OWORD *)__s + 9);
      v15 = *((_OWORD *)__s + 11);
      *(_OWORD *)((char *)this + 168) = *((_OWORD *)__s + 10);
      *(_OWORD *)((char *)this + 184) = v15;
      *(_OWORD *)((char *)this + 136) = v13;
      *(_OWORD *)((char *)this + 152) = v14;
      v16 = *((_OWORD *)__s + 12);
      v17 = *((_OWORD *)__s + 13);
      v18 = *((_OWORD *)__s + 14);
      *(_OWORD *)((char *)this + 247) = *(_OWORD *)(__s + 239);
      *(_OWORD *)((char *)this + 216) = v17;
      *(_OWORD *)((char *)this + 232) = v18;
      *(_OWORD *)((char *)this + 200) = v16;
      *((_BYTE *)this + 263) = 0;
    }
  }
  else
  {
    *((_BYTE *)this + 8) = 0;
  }
}

void sub_1A837C880(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void CADeprecated::XBasicMIGServer::~XBasicMIGServer(CADeprecated::XBasicMIGServer *this)
{
  const void *v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E5425298;
  v2 = (const void *)*((_QWORD *)this + 8);
  if (v2)
    CFRelease(v2);
  v3 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
}

{
  CADeprecated::XBasicMIGServer::~XBasicMIGServer(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425740;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425740;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<CADeprecated::XMachReceivePort>::__on_zero_shared(uint64_t a1)
{
  CADeprecated::XMachReceivePort::~XMachReceivePort((CADeprecated::XMachReceivePort *)(a1 + 24));
}

uint64_t CADeprecated::XMachServer::DoForEachClient(uint64_t a1, uint64_t (*a2)(_QWORD, uint64_t), uint64_t a3)
{
  _QWORD *v6;
  uint64_t result;
  int v8;
  _QWORD *i;
  _QWORD *v10;

  v6 = (_QWORD *)(a1 + 112);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 112) + 16))(a1 + 112);
  v8 = result;
  v10 = (_QWORD *)v6[11];
  for (i = (_QWORD *)v6[12]; v10 != i; i = *(_QWORD **)(a1 + 208))
    result = a2(*v10++, a3);
  if (v8)
    return (*(uint64_t (**)(_QWORD *))(*v6 + 24))(v6);
  return result;
}

void sub_1A837CA44(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void CADeprecated::XRemoteMachServer::~XRemoteMachServer(CADeprecated::XRemoteMachServer *this)
{
  void *v2;

  *(_QWORD *)this = off_1E54252F8;
  *((_QWORD *)this + 10) = &off_1E54253D0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 104));
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  CADeprecated::XMachPortDeathListener::~XMachPortDeathListener(this);
}

uint64_t __destroy_helper_block_e8_32c60_ZTSNSt3__110shared_ptrIN12CADeprecated16XMachReceivePortEEE(uint64_t a1)
{
  return std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100](a1 + 32);
}

void __destroy_helper_block_e8_40c37_ZTSN10applesauce8dispatch2v16sourceE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

CADeprecated::RealtimeMessenger *CADeprecated::RealtimeMessenger::RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  dispatch_object_t object;

  object = 0;
  CADeprecated::RealtimeMessenger::RealtimeMessenger((uint64_t)this, &object);
  if (object)
    dispatch_release(object);
  return this;
}

{
  dispatch_object_t object;

  object = 0;
  CADeprecated::RealtimeMessenger::RealtimeMessenger((uint64_t)this, &object);
  if (object)
    dispatch_release(object);
  return this;
}

void sub_1A837CB24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  _Unwind_Resume(exception_object);
}

uint64_t CADeprecated::RealtimeMessenger::RealtimeMessenger(uint64_t a1, dispatch_queue_t *a2)
{
  uint64_t *v4;
  dispatch_queue_t *v5;
  NSObject *v6;
  NSObject *v7;
  uintptr_t v8;
  NSObject *v9;
  NSObject *global_queue;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  dispatch_object_t v15;

  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  v5 = (dispatch_queue_t *)(a1 + 16);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 8;
  *(_BYTE *)(a1 + 64) = 0;
  MEMORY[0x1A85D289C](a1 + 72);
  CADeprecated::XMachReceivePort::CreateMachPort((CADeprecated::XMachReceivePort *)a1, 0);
  if (!*a2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    if (global_queue)
    {
      v12 = global_queue;
      dispatch_retain(global_queue);
      v13 = *a2;
      *a2 = v12;
      if (v13)
        dispatch_release(v13);
    }
    else
    {
      *a2 = 0;
    }
  }
  v6 = dispatch_queue_create("RealtimeMessenger.mServiceQueue", 0);
  v7 = *v5;
  *v5 = v6;
  if (v7)
  {
    dispatch_release(v7);
    v6 = *v5;
  }
  dispatch_set_target_queue(v6, *a2);
  v8 = atomic_load((unsigned int *)a1);
  v9 = dispatch_source_create(MEMORY[0x1E0C80D98], v8, 0, *(dispatch_queue_t *)(a1 + 16));
  v14[4] = a1;
  v15 = v9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 0x40000000;
  v14[2] = ___ZN12CADeprecated17RealtimeMessengerC2EN10applesauce8dispatch2v15queueE_block_invoke;
  v14[3] = &__block_descriptor_tmp_60;
  dispatch_source_set_event_handler(v9, v14);
  CADeprecated::XMachPortServicer::SetQueueAndSource(v4, v5, &v15);
  if (v9)
    dispatch_release(v9);
  return a1;
}

void sub_1A837CC94(_Unwind_Exception *a1)
{
  CADeprecated::XMachReceivePort *v1;
  uint64_t *v2;
  dispatch_object_t *v3;
  std::recursive_mutex *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;

  v6 = v5;
  if (v6)
    dispatch_release(v6);
  std::recursive_mutex::~recursive_mutex(v4);
  if (*v3)
    dispatch_release(*v3);
  v8 = *v2;
  *v2 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  CADeprecated::XMachReceivePort::~XMachReceivePort(v1);
  _Unwind_Resume(a1);
}

void ___ZN12CADeprecated17RealtimeMessengerC2EN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1)
{
  CADeprecated::RealtimeMessenger::ReceivePing(*(CADeprecated::RealtimeMessenger **)(a1 + 32));
}

void CADeprecated::RealtimeMessenger::ReceivePing(CADeprecated::RealtimeMessenger *this)
{
  mach_port_t v2;
  mach_port_name_t v3;
  mach_msg_header_t msg;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  msg.msgh_bits = 0;
  v2 = atomic_load((unsigned int *)this);
  msg.msgh_remote_port = 0;
  msg.msgh_local_port = v2;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 0;
  v3 = atomic_load((unsigned int *)this);
  mach_msg(&msg, 2, 0, 0x2Cu, v3, 0, 0);
  atomic_store(0, (unsigned __int8 *)this + 64);
  CADeprecated::RealtimeMessenger::_PerformPendingMessages(this);
}

void CADeprecated::RealtimeMessenger::_PerformPendingMessages(CADeprecated::RealtimeMessenger *this)
{
  std::recursive_mutex *v2;
  _BYTE *v3;

  v2 = (std::recursive_mutex *)((char *)this + 72);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)this + 72));
  while (1)
  {
    v3 = OSAtomicDequeue((OSQueueHead *)this + 2, *((_QWORD *)this + 6));
    if (!v3)
      break;
    v3[16] = 0;
    (*(void (**)(_BYTE *))(*(_QWORD *)v3 + 16))(v3);
  }
  std::recursive_mutex::unlock(v2);
}

void sub_1A837CDE8(_Unwind_Exception *a1)
{
  std::recursive_mutex *v1;

  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A837CE3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  _Unwind_Resume(exception_object);
}

void CADeprecated::RealtimeMessenger::~RealtimeMessenger(CADeprecated::RealtimeMessenger *this)
{
  NSObject *v2;
  uint64_t v3;

  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)this + 72));
  v2 = *((_QWORD *)this + 2);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  CADeprecated::XMachReceivePort::~XMachReceivePort(this);
}

void CADeprecated::RealtimeMessenger::PerformAsync(uint64_t a1, _BYTE *__new)
{
  unsigned __int8 *v4;
  unsigned __int8 v5;
  unsigned int v6;
  _BYTE v7[12];
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__new[16])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v7 = 136315650;
      *(_QWORD *)&v7[4] = "RealtimeMessenger.cpp";
      v8 = 0x800000000490400;
      v9 = __new;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d RealtimeMessenger: trying to enqueue duplicate invocation on message %p", v7, 0x1Cu);
    }
  }
  else
  {
    __new[16] = 1;
    OSAtomicEnqueue((OSQueueHead *)(a1 + 32), __new, *(_QWORD *)(a1 + 48));
    v4 = (unsigned __int8 *)(a1 + 64);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(1u, v4));
    if ((v5 & 1) == 0)
    {
      *(_QWORD *)v7 = 0x1C00000013;
      v6 = atomic_load((unsigned int *)a1);
      *(_DWORD *)&v7[8] = v6;
      v9 = 0;
      v8 = 0;
      mach_msg((mach_msg_header_t *)v7, 1, 0x1Cu, 0, 0, 0, 0);
    }
  }
}

void SincKernel::SincKernel(SincKernel *this, int a2, int a3, double a4, double a5)
{
  *(_QWORD *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a3;
  *((_DWORD *)this + 5) = 0;
  *((double *)this + 3) = a4;
  *((double *)this + 4) = a5;
  *(_QWORD *)this = malloc_type_calloc(a2 + a2 * a3, 4uLL, 0x100004052888210uLL);
  SincKernel::CalculateFilterCoefficients(this);
}

void SincKernel::~SincKernel(void **this)
{
  free(*this);
}

{
  free(*this);
}

double SincKernel::SincKernel(uint64_t *a1, uint64_t *a2)
{
  a1[4] = 0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return SincKernel::operator=(a1, a2);
}

{
  a1[4] = 0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return SincKernel::operator=(a1, a2);
}

double SincKernel::operator=(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  double result;

  v2 = *a1;
  *a1 = *a2;
  *a2 = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 2);
  *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 3);
  *((_DWORD *)a1 + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 4);
  *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v2;
  LODWORD(v2) = *((_DWORD *)a1 + 5);
  *((_DWORD *)a1 + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v2;
  v3 = a1[3];
  a1[3] = a2[3];
  a2[3] = v3;
  result = *((double *)a1 + 4);
  a1[4] = a2[4];
  *((double *)a2 + 4) = result;
  return result;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

char *PlatformUtilities::ProcessName(PlatformUtilities *this)
{
  std::string *p_p;
  std::string __p;

  PlatformUtilities::processName(this, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  strlcpy(PlatformUtilities::ProcessName(int)::namebuf, (const char *)p_p, 0x20uLL);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return PlatformUtilities::ProcessName(int)::namebuf;
}

void sub_1A837D284(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFString *PlatformUtilities::CopyHardwareModelFullName(PlatformUtilities *this)
{
  __CFString *Mutable;
  size_t v3;
  char cStr[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (Mutable)
  {
    v6 = 0u;
    v7 = 0u;
    *(_OWORD *)cStr = 0u;
    v5 = 0u;
    v3 = 64;
    sysctlbyname("hw.model", cStr, &v3, 0, 0);
    CFStringAppendCString(Mutable, cStr, 0);
  }
  return Mutable;
}

__CFString *PlatformUtilities::CopyHardwareModelShortName(PlatformUtilities *this)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *MutableCopy;
  __CFString *v4;

  v1 = PlatformUtilities::CopyHardwareModelFullName(this);
  if (!v1)
    return 0;
  v2 = v1;
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v1);
  CFRelease(v2);
  PlatformUtilities_iOS::TrimHardwareModelShortName(MutableCopy, v4);
  return MutableCopy;
}

uint64_t PlatformUtilities::IsInternalBuild(PlatformUtilities *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_67);
  return gIsInternal;
}

uint64_t CAIsDebuggerAttached(void)
{
  size_t v1;
  _BYTE v2[32];
  unsigned int v3;
  int v4[2];
  int v5;
  pid_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = getpid();
  v1 = 648;
  v3 = 0;
  sysctl(v4, 4u, v2, &v1, 0, 0);
  return (v3 >> 11) & 1;
}

char *CAStringForOSType(unsigned int a1, char *__dst, size_t a3, int16x8_t a4)
{
  int32x4_t v5;
  uint32x4_t v6;
  char __source[8];
  char v9;

  a4.i32[0] = bswap32(a1);
  *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)a4.i8);
  v5.i64[0] = 0x1F0000001FLL;
  v5.i64[1] = 0x1F0000001FLL;
  v6.i64[0] = 0x5F0000005FLL;
  v6.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
  v9 = 4;
  *(_DWORD *)__source = vmovn_s16(a4).u32[0];
  __source[4] = 0;
  strlcpy(__dst, __source, a3);
  if (v9 < 0)
    operator delete(*(void **)__source);
  return __dst;
}

void sub_1A837D50C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  int v2;

  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  int v3;
  int v4;

  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if ((_DWORD)this)
      v3 = 9;
    else
      v3 = 11;
    v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  double result;

  *((_DWORD *)this + 8) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0)
    *(Float64 *)this = a2->mSampleRate;
  if (!*(_DWORD *)(this + 8))
    *(_DWORD *)(this + 8) = a2->mFormatID;
  if (!*(_DWORD *)(this + 12))
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  if (!*(_DWORD *)(this + 16))
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  if (!*(_DWORD *)(this + 20))
    *(_DWORD *)(this + 20) = a2->mFramesPerPacket;
  if (!*(_DWORD *)(this + 24))
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  if (!*(_DWORD *)(this + 28))
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  if (!*(_DWORD *)(this + 32))
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  return this;
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  double v3;
  BOOL v4;
  int v5;
  AudioFormatID mFormatID;
  int v7;
  UInt32 mBytesPerPacket;
  int v9;
  UInt32 mFramesPerPacket;
  int v11;
  UInt32 mBytesPerFrame;
  int v13;
  UInt32 mChannelsPerFrame;
  int v15;
  UInt32 mBitsPerChannel;

  v3 = *(double *)this;
  if ((_DWORD)a3)
  {
    if (v3 == 0.0 || (a2->mSampleRate != 0.0 ? (v4 = v3 == a2->mSampleRate) : (v4 = 1), v4))
    {
      v5 = *((_DWORD *)this + 2);
      if (!v5 || (mFormatID = a2->mFormatID) == 0 || v5 == mFormatID)
      {
        v7 = *((_DWORD *)this + 4);
        if (!v7 || (mBytesPerPacket = a2->mBytesPerPacket) == 0 || v7 == mBytesPerPacket)
        {
          v9 = *((_DWORD *)this + 5);
          if (!v9 || (mFramesPerPacket = a2->mFramesPerPacket) == 0 || v9 == mFramesPerPacket)
          {
            v11 = *((_DWORD *)this + 6);
            if (!v11 || (mBytesPerFrame = a2->mBytesPerFrame) == 0 || v11 == mBytesPerFrame)
            {
              v13 = *((_DWORD *)this + 7);
              if (!v13 || (mChannelsPerFrame = a2->mChannelsPerFrame) == 0 || v13 == mChannelsPerFrame)
              {
                v15 = *((_DWORD *)this + 8);
                if (!v15)
                  return CA::Implementation::EquivalentFormatFlags(this, a2, a3);
                mBitsPerChannel = a2->mBitsPerChannel;
                if (!mBitsPerChannel || v15 == mBitsPerChannel)
                  return CA::Implementation::EquivalentFormatFlags(this, a2, a3);
              }
            }
          }
        }
      }
    }
  }
  else if (v3 == a2->mSampleRate
         && *((_DWORD *)this + 2) == a2->mFormatID
         && *((_DWORD *)this + 3) == a2->mFormatFlags
         && *((_DWORD *)this + 4) == a2->mBytesPerPacket
         && *((_DWORD *)this + 5) == a2->mFramesPerPacket
         && *((_DWORD *)this + 6) == a2->mBytesPerFrame
         && *((_DWORD *)this + 7) == a2->mChannelsPerFrame)
  {
    return *((_DWORD *)this + 8) == a2->mBitsPerChannel;
  }
  return 0;
}

{
  int v4;
  AudioFormatID mFormatID;
  int v7;
  UInt32 mBytesPerPacket;
  int v9;
  UInt32 mFramesPerPacket;
  int v11;
  UInt32 mBytesPerFrame;
  int v13;
  UInt32 mChannelsPerFrame;
  int v15;
  UInt32 mBitsPerChannel;

  if (*(double *)this != 0.0 && a2->mSampleRate != 0.0 && *(double *)this != a2->mSampleRate)
    return 0;
  v4 = *((_DWORD *)this + 2);
  if (v4)
  {
    mFormatID = a2->mFormatID;
    if (mFormatID && v4 != mFormatID)
      return 0;
  }
  v7 = *((_DWORD *)this + 4);
  if (v7)
  {
    mBytesPerPacket = a2->mBytesPerPacket;
    if (mBytesPerPacket)
    {
      if (v7 != mBytesPerPacket)
        return 0;
    }
  }
  v9 = *((_DWORD *)this + 5);
  if (v9)
  {
    mFramesPerPacket = a2->mFramesPerPacket;
    if (mFramesPerPacket)
    {
      if (v9 != mFramesPerPacket)
        return 0;
    }
  }
  v11 = *((_DWORD *)this + 6);
  if (v11)
  {
    mBytesPerFrame = a2->mBytesPerFrame;
    if (mBytesPerFrame)
    {
      if (v11 != mBytesPerFrame)
        return 0;
    }
  }
  v13 = *((_DWORD *)this + 7);
  if (v13)
  {
    mChannelsPerFrame = a2->mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      if (v13 != mChannelsPerFrame)
        return 0;
    }
  }
  v15 = *((_DWORD *)this + 8);
  return (!v15 || (mBitsPerChannel = a2->mBitsPerChannel) == 0 || v15 == mBitsPerChannel)
      && CA::Implementation::EquivalentFormatFlags(this, a2, a3);
}

BOOL CA::Implementation::EquivalentFormatFlags(CA::Implementation *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  uint64_t v3;
  __int128 v4;
  int32x4_t v5;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  BOOL v14;
  BOOL v16;
  unsigned int v17;
  BOOL v18;
  int v19;
  unsigned int v20;
  int v21;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  UInt32 v24;
  UInt32 mBitsPerChannel;
  int v26;
  BOOL v27;
  BOOL v28;
  unsigned int v29;
  BOOL v30;

  v3 = *((_QWORD *)this + 1);
  v4 = *(_OWORD *)&a2->mFormatID;
  v5.i64[0] = *(_QWORD *)&a2->mFormatID;
  v5.i64[1] = v3;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v5))) & 1) != 0)
    return 1;
  v7 = HIDWORD(*(_QWORD *)&a2->mFormatID);
  if ((_DWORD)v3 != 1819304813)
    return HIDWORD(v3) == DWORD1(v4);
  if ((v3 & 0x7FFFFFFF00000000) != 0)
    v8 = HIDWORD(v3) & 0x7FFFFFFF;
  else
    v8 = HIDWORD(v3);
  v9 = *((_DWORD *)this + 6);
  if (v9)
  {
    v10 = *((_DWORD *)this + 7);
    if ((v3 & 0x2000000000) != 0)
      v11 = 1;
    else
      v11 = *((_DWORD *)this + 7);
    if (v11)
    {
      v9 = 8 * (v9 / v11);
      v12 = *((_DWORD *)this + 8);
      v13 = v8 | 8;
      v14 = v9 == v12;
      goto LABEL_17;
    }
    v9 = 0;
    v12 = *((_DWORD *)this + 8);
    v13 = v8 | 8;
  }
  else
  {
    v13 = v8 | 8;
    v10 = *((_DWORD *)this + 7);
    v12 = *((_DWORD *)this + 8);
  }
  v14 = v12 == 0;
LABEL_17:
  if (v14)
    v8 = v13;
  v16 = (v12 & 7) == 0 && v9 == v12;
  v17 = v8 & 0xFFFFFFEF;
  if (!v16)
    v17 = v8;
  if ((v17 & 1) != 0)
    v17 &= ~4u;
  v18 = (v17 & 8) == 0 || v12 > 8;
  v19 = v17 & 2;
  if (v18)
    v19 = v17;
  if (v10 == 1)
    v20 = v19 & 0xFFFFFFDF;
  else
    v20 = v19;
  if (!v20)
    v20 = 0x80000000;
  if ((_DWORD)v4 != 1819304813)
    return v20 == v7;
  if ((DWORD1(v4) & 0x7FFFFFFF) != 0)
    v21 = DWORD1(v4) & 0x7FFFFFFF;
  else
    v21 = HIDWORD(*(_QWORD *)&a2->mFormatID);
  mBytesPerFrame = a2->mBytesPerFrame;
  if (!mBytesPerFrame)
  {
    v26 = v21 | 8;
    mChannelsPerFrame = a2->mChannelsPerFrame;
    mBitsPerChannel = a2->mBitsPerChannel;
LABEL_48:
    v27 = mBitsPerChannel == 0;
    goto LABEL_49;
  }
  mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((BYTE4(v4) & 0x20) != 0)
    v24 = 1;
  else
    v24 = a2->mChannelsPerFrame;
  if (!v24)
  {
    mBytesPerFrame = 0;
    mBitsPerChannel = a2->mBitsPerChannel;
    v26 = v21 | 8;
    goto LABEL_48;
  }
  mBytesPerFrame = 8 * (mBytesPerFrame / v24);
  mBitsPerChannel = a2->mBitsPerChannel;
  v26 = v21 | 8;
  v27 = mBytesPerFrame == mBitsPerChannel;
LABEL_49:
  if (v27)
    v21 = v26;
  v28 = (mBitsPerChannel & 7) == 0 && mBytesPerFrame == mBitsPerChannel;
  v29 = v21 & 0xFFFFFFEF;
  if (!v28)
    v29 = v21;
  if ((v29 & 1) != 0)
    v29 &= ~4u;
  v30 = (v29 & 8) == 0 || mBitsPerChannel > 8;
  v7 = v29 & 2;
  if (v30)
    v7 = v29;
  if (mChannelsPerFrame == 1)
    v7 &= ~0x20u;
  if (!v7)
    v7 = 0x80000000;
  return v20 == v7;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  CAStreamBasicDescription *v5;
  int v6;
  uint64_t v7;
  int i;
  FILE **v9;
  int v10;
  int v11;
  CAStreamBasicDescription *v12;
  int v13;
  uint64_t v14;
  CAStreamBasicDescription *v15;
  int v16;
  int v17;
  CAStreamBasicDescription *v18;
  unsigned __int8 v19;
  int v20;
  FILE *v21;
  const char *v22;
  size_t v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  double v29;
  int v30;
  int v31;
  int v32;
  int v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  char *v41;
  int v42;
  char *v43;
  int v44;
  int v45;
  int v46;
  uint64_t result;
  int v48;
  int __c;

  if (*(_BYTE *)this == 45)
    v5 = (CAStreamBasicDescription *)((char *)this + 1);
  else
    v5 = this;
  v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    v7 = 2 * (*((_BYTE *)v5 + 1) == 69);
    i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      i = 12;
      goto LABEL_12;
    }
    v7 = 2 * (*((_BYTE *)v5 + 1) == 69);
    if (*((_BYTE *)v5 + 1) == 69)
      i = 14;
    else
      i = 12;
  }
  v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  v6 = *(unsigned __int8 *)v5;
LABEL_12:
  v9 = (FILE **)MEMORY[0x1E0C80C10];
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      v10 = *((unsigned __int8 *)v5 + 1);
      v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      v6 = v10;
      break;
    case 'F':
      i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      v12 = (CAStreamBasicDescription *)((char *)v5 + 1);
      v11 = *((char *)v5 + 1);
      if (v11 < 0)
      {
        v13 = 0;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *((unsigned __int8 *)v5 + 1) + 60) & 0x400) != 0)
      {
        v13 = 0;
        v12 = (CAStreamBasicDescription *)((char *)v5 + 2);
        while (1)
        {
          v13 = 10 * v13 + v11 - 48;
          v11 = *(char *)v12;
          if (v11 < 0)
            break;
          v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
          if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v11 + 60) & 0x400) == 0)
          {
            v5 = (CAStreamBasicDescription *)((char *)v12 - 2);
            v12 = (CAStreamBasicDescription *)((char *)v12 - 1);
            goto LABEL_33;
          }
        }
      }
      else
      {
        v13 = 0;
LABEL_33:
        if (v11 == 46)
        {
          v20 = *((char *)v5 + 2);
          v18 = (CAStreamBasicDescription *)((char *)v5 + 2);
          v19 = v20;
          if (v20 < 0 || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v19 + 60) & 0x400) == 0)
          {
            v21 = (FILE *)*MEMORY[0x1E0C80C10];
            v22 = "Expected fractional bits following '.'\n";
            v23 = 39;
LABEL_37:
            fwrite(v22, v23, 1uLL, v21);
            goto LABEL_102;
          }
          v27 = 0;
          v12 = v18;
          while ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v19 + 60) & 0x400) != 0)
          {
            v28 = *((char *)v12 + 1);
            v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
            LOBYTE(v11) = v28;
            v27 = 10 * v27 + v19 - 48;
            v19 = v28;
            if (v28 < 0)
              goto LABEL_49;
          }
          LOBYTE(v11) = v19;
LABEL_49:
          v13 += v27;
          i |= v27 << 7;
        }
      }
      v26 = 1819304813;
      v24 = (v13 + 7) >> 3;
      if ((v13 & 7) != 0)
        i = i & 0xFFFFFFE7 | 0x10;
      v25 = 1;
      goto LABEL_53;
  }
  v14 = 0;
  __c = 538976288;
  v15 = this;
  v12 = this;
  while (1)
  {
    v17 = *(unsigned __int8 *)v12;
    v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
    v16 = v17;
    if (v17 == 92)
    {
      if (*(_BYTE *)v12 != 120)
        return 0;
      v48 = 0;
      if (sscanf((const char *)v15 + 2, "%02X", &v48) != 1)
        return 0;
      *((_BYTE *)&__c + v14) = v48;
      v12 = (CAStreamBasicDescription *)((char *)v15 + 4);
      goto LABEL_26;
    }
    *((_BYTE *)&__c + v14) = v16;
    if (!v16)
      break;
LABEL_26:
    ++v14;
    v15 = v12;
    if (v14 == 4)
      goto LABEL_41;
  }
  if ((_DWORD)v14 != 3)
    return 0;
  *((_BYTE *)&__c + v14) = 32;
  v12 = v15;
LABEL_41:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    v12 = (CAStreamBasicDescription *)((char *)v12 - 1);
  }
  i = 0;
  v24 = 0;
  v25 = 0;
  v13 = 0;
  v26 = bswap32(__c);
  LOBYTE(v11) = *(_BYTE *)v12;
LABEL_53:
  v29 = 0.0;
  if (v11 != 64)
  {
LABEL_58:
    if (v11 == 47)
    {
      for (i = 0; ; i = (v33 + v32) | (16 * i))
      {
        v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        v32 = *(char *)v12;
        if ((v32 - 48) >= 0xA)
        {
          v11 = *(unsigned __int8 *)v12;
          if ((v11 - 65) >= 6)
          {
            if ((v11 - 97) > 5)
              break;
            v33 = -87;
          }
          else
          {
            v33 = -55;
          }
        }
        else
        {
          v33 = -48;
        }
      }
    }
    if (v11 == 35)
    {
      v35 = *((char *)v12 + 1);
      v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
      v34 = v35;
      if (v35 < 0)
        goto LABEL_101;
      v36 = v25;
      while ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v34 + 60) & 0x400) != 0)
      {
        v36 = 10 * v36 + v34 - 48;
        v37 = *((char *)v12 + 1);
        v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        v34 = v37;
        if (v37 < 0)
          goto LABEL_101;
      }
    }
    else
    {
      v34 = v11;
      v36 = v25;
    }
    if (v34 == 58)
    {
      i &= 0xFFFFFFE7;
      v38 = *((unsigned __int8 *)v12 + 1);
      if (v38 != 76)
      {
        if (v38 != 72)
          goto LABEL_102;
        i |= 0x10u;
      }
      v39 = *((char *)v12 + 2);
      v12 = (CAStreamBasicDescription *)((char *)v12 + 2);
      v34 = v39;
      if (v39 < 0)
        goto LABEL_101;
      v24 = 0;
      while ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v34 + 60) & 0x400) != 0)
      {
        v40 = *((char *)v12 + 1);
        v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
        v24 = 10 * v24 + v34 - 48;
        v34 = v40;
        if (v40 < 0)
          goto LABEL_101;
      }
    }
    if (v34 != 44)
      goto LABEL_100;
    v41 = (char *)v12 + 1;
    v42 = *((unsigned __int8 *)v12 + 1);
    if ((*((char *)v12 + 1) & 0x80000000) == 0
      && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *((unsigned __int8 *)v12 + 1) + 60) & 0x400) != 0)
    {
      v25 = 0;
      v43 = (char *)v12 + 2;
      do
      {
        v41 = v43;
        v25 = v42 + 10 * v25 - 48;
        v44 = *v43;
        v42 = v44;
        if (v44 < 0)
          break;
        v45 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v44 + 60);
        v43 = v41 + 1;
      }
      while ((v45 & 0x400) != 0);
      v12 = (CAStreamBasicDescription *)(v41 - 1);
    }
    else
    {
      v25 = 0;
    }
    if (v42 == 73)
    {
      v41 = (char *)v12 + 2;
    }
    else if (v42 == 68)
    {
      if (v26 != 1819304813)
      {
        v21 = *v9;
        v22 = "non-interleaved flag invalid for non-PCM formats\n";
        v23 = 49;
        goto LABEL_37;
      }
      v12 = (CAStreamBasicDescription *)((char *)v12 + 2);
      i |= 0x20u;
LABEL_100:
      if (*(_BYTE *)v12)
        goto LABEL_101;
      *(double *)a2 = v29;
      *((_DWORD *)a2 + 2) = v26;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v24;
      *((_DWORD *)a2 + 5) = v36;
      *((_DWORD *)a2 + 6) = v24;
      *((_DWORD *)a2 + 7) = v25;
      result = 1;
      *((_DWORD *)a2 + 8) = v13;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v26 == 1819304813)
      v46 = v25;
    else
      v46 = 1;
    v24 *= v46;
    v12 = (CAStreamBasicDescription *)v41;
    goto LABEL_100;
  }
  v30 = *((char *)v12 + 1);
  v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
  LOBYTE(v11) = v30;
  if ((v30 & 0x80000000) == 0)
  {
    while ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v11 + 60) & 0x400) != 0)
    {
      v29 = (double)(v11 - 48) + v29 * 10.0;
      v31 = *((char *)v12 + 1);
      v12 = (CAStreamBasicDescription *)((char *)v12 + 1);
      LOBYTE(v11) = v31;
      if (v31 < 0)
        goto LABEL_101;
    }
    goto LABEL_58;
  }
LABEL_101:
  fprintf(*v9, "extra characters at end of format string: %s\n", (const char *)v12);
LABEL_102:
  fprintf(*v9, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, *v9);
  return 0;
}

const __CFString *CACFString::GetStringByteLength(const __CFString *this, const __CFString *a2)
{
  CFStringEncoding v2;
  const __CFString *v3;
  CFIndex usedBufLen;
  CFRange v5;

  usedBufLen = 0;
  if (this)
  {
    v2 = a2;
    v3 = this;
    v5.length = CFStringGetLength(this);
    v5.location = 0;
    CFStringGetBytes(v3, v5, v2, 0, 0, 0, 0x7FFFFFFFLL, &usedBufLen);
    return (const __CFString *)usedBufLen;
  }
  return this;
}

const __CFString *CACFString::GetCString(const __CFString *theString, __CFString *a2, char *a3, unsigned int *a4)
{
  const __CFString *v6;
  CFStringEncoding v7;
  int v8;
  int v9;
  CFIndex usedBufLen;
  CFRange v11;

  if (*(_DWORD *)a3)
  {
    v6 = theString;
    if (theString)
    {
      v7 = a4;
      usedBufLen = 0;
      v11.length = CFStringGetLength(theString);
      v11.location = 0;
      theString = (const __CFString *)CFStringGetBytes(v6, v11, v7, 0, 0, (UInt8 *)a2, (*(_DWORD *)a3 - 1), &usedBufLen);
      v8 = usedBufLen;
      *((_BYTE *)&a2->isa + usedBufLen) = 0;
      v9 = v8 + 1;
    }
    else
    {
      LOBYTE(a2->isa) = 0;
      v9 = 1;
    }
    *(_DWORD *)a3 = v9;
  }
  return theString;
}

void CACFString::GetUnicodeString(CFStringRef theString, __CFString *a2, unsigned __int16 *a3, unsigned int *a4)
{
  CFIndex Length;
  CFIndex v8;
  CFRange v9;

  if (*(_DWORD *)a3)
  {
    if (theString)
    {
      Length = CFStringGetLength(theString);
      if (*(_DWORD *)a3 >= Length)
        v8 = Length;
      else
        v8 = *(unsigned int *)a3;
      v9.location = 0;
      v9.length = v8;
      CFStringGetCharacters(theString, v9, (UniChar *)a2);
    }
    else
    {
      LODWORD(v8) = 0;
      LOWORD(a2->isa) = 0;
    }
    *(_DWORD *)a3 = v8;
  }
}

void CACFString::PrintToLog(const __CFString *this, const __CFString *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  _OWORD *v8;
  __int16 v9;
  char *v10;
  _OWORD __b[16];
  char buffer[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  LODWORD(v2) = (_DWORD)a2;
  v44 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)buffer = 0u;
  v13 = 0u;
  memset(__b, 0, sizeof(__b));
  if (CFStringGetCString(this, buffer, 512, 0x600u))
  {
    if ((_DWORD)v2)
    {
      v2 = v2;
      memset(__b, 9, v2);
    }
    else
    {
      v2 = 0;
    }
    *((_BYTE *)__b + v2) = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315906;
      v4 = "CACFString.cpp";
      v5 = 1024;
      v6 = 81;
      v7 = 2080;
      v8 = __b;
      v9 = 2080;
      v10 = buffer;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  %s%s", (uint8_t *)&v3, 0x26u);
    }
  }
}

void swix::message::~message(xpc_object_t *this)
{
  xpc_release(this[1]);
  this[1] = 0;
}

void swix::decode_message::throw_error(NSObject *a1, int a2, std::string *a3)
{
  std::string *v6;
  std::runtime_error *exception;
  int v8;
  std::string *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = a3;
    else
      v6 = (std::string *)a3->__r_.__value_.__r.__words[0];
    v8 = 136315138;
    v9 = v6;
    _os_log_error_impl(&dword_1A836D000, a1, OS_LOG_TYPE_ERROR, "throwing swix::exception: %s", (uint8_t *)&v8, 0xCu);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x18uLL);
  swix::exception::exception(exception, a2, a3);
}

void sub_1A837E324(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void gsl::narrowing_error::~narrowing_error(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85D2980);
}

std::runtime_error *swix::exception::exception(std::runtime_error *a1, int a2, std::string *a3)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a3);
  result->__vftable = (std::runtime_error_vtbl *)&off_1E5425580;
  LODWORD(result[1].__vftable) = a2;
  return result;
}

void swix::exception::~exception(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t CATimeUtilities::GetCurrentGregorianDate(CATimeUtilities *this)
{
  CFAbsoluteTime Current;
  CATimeUtilities *v2;

  Current = CFAbsoluteTimeGetCurrent();
  return CATimeUtilities::GregorianDateFromAbsoluteTime(v2, Current);
}

uint64_t CATimeUtilities::GregorianDateFromAbsoluteTime(CATimeUtilities *this, CFAbsoluteTime a2)
{
  unsigned __int8 v3;

  if ((v3 & 1) == 0
  {
    CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz = (uint64_t)CFTimeZoneCopySystem();
  }
  return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, (CFTimeZoneRef)CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz);
}

void sub_1A837E444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::runtime_error *std::overflow_error::overflow_error[abi:ne180100](std::runtime_error *a1, const char *a2)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x1E0DE5030] + 16);
  return result;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, CAAudioChannelLayout::RefCountedLayout *a2, int a3)
{
  unsigned int v3;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  _DWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;

  v3 = a2;
  v5 = 6553601;
  switch((int)a2)
  {
    case 1:
      goto LABEL_17;
    case 2:
      v6 = 6619138;
      v7 = 6946818;
      v8 = a3 == 0;
      goto LABEL_12;
    case 4:
      if (a3)
        v5 = 7012356;
      else
        v5 = 7077892;
      goto LABEL_17;
    case 5:
      v8 = a3 == 0;
      v6 = 7143429;
      v7 = 7733253;
      goto LABEL_12;
    case 6:
      v8 = a3 == 0;
      v6 = 7208966;
      v7 = 9109510;
LABEL_12:
      if (v8)
        v5 = v6;
      else
        v5 = v7;
      goto LABEL_17;
    case 7:
      v5 = 9175047;
      goto LABEL_17;
    case 8:
      v5 = 7274504;
LABEL_17:
      v12 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
      v12[4] = v5;
      *(_QWORD *)this = v12;
      break;
    default:
      v9 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(a2);
      *(_QWORD *)this = v9;
      *((_QWORD *)v9 + 2) = 0;
      v9[6] = v3;
      if (v3)
      {
        v10 = v3;
        v11 = v9 + 8;
        do
        {
          *((_DWORD *)v11 - 1) = -1;
          *v11 = 0;
          v11[1] = 0;
          v11 = (_QWORD *)((char *)v11 + 20);
          --v10;
        }
        while (v10);
      }
      break;
  }
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, unsigned int a2)
{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::SetWithTag((unsigned int **)this, a2);
}

{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::SetWithTag((unsigned int **)this, a2);
}

unsigned int *CAAudioChannelLayout::SetWithTag(unsigned int **this, unsigned int a2)
{
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *result;

  v4 = *this;
  if (v4)
  {
    v5 = v4 + 2;
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
  }
  result = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  result[4] = a2;
  *this = result;
  return result;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, CAAudioChannelLayout::RefCountedLayout *a2)
{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::operator=((unsigned int **)this, a2);
}

{
  *(_QWORD *)this = 0;
  CAAudioChannelLayout::operator=((unsigned int **)this, a2);
}

uint64_t CAAudioChannelLayout::Clear(CAAudioChannelLayout *this)
{
  return CAAudioChannelLayout::Set(this, 0, 0);
}

uint64_t CAAudioChannelLayout::Set(CAAudioChannelLayout *this, AudioChannelLayout *a2, unint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  const AudioChannelLayout *v11;
  _DWORD *v12;
  uint64_t result;
  _DWORD *v14;

  v6 = *(_QWORD *)this;
  if (v6)
  {
    if ((AudioChannelLayout *)(v6 + 16) == a2)
      return 1;
    v7 = (unsigned int *)(v6 + 8);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
  }
  if (!a2)
  {
    v14 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
LABEL_13:
    v12 = v14;
    result = 1;
    goto LABEL_14;
  }
  v10 = caulk::numeric::exceptional_mul<unsigned int>(a2->mNumberChannelDescriptions);
  if (caulk::numeric::exceptional_add<unsigned int>(v10) <= a3)
  {
    v14 = CAAudioChannelLayout::RefCountedLayout::CreateWithLayout((CAAudioChannelLayout::RefCountedLayout *)a2, v11);
    goto LABEL_13;
  }
  v12 = CAAudioChannelLayout::RefCountedLayout::CreateWithNumberChannelDescriptions(0);
  result = 0;
LABEL_14:
  *(_QWORD *)this = v12;
  return result;
}

BOOL CAAudioChannelLayout::operator==(_QWORD *a1, _QWORD *a2)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  _BOOL8 result;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  BOOL v9;

  v2 = (_DWORD *)*a1;
  v3 = (_DWORD *)*a2;
  if (*a1 == *a2)
    return 1;
  v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000)
        return v2[5] == v3[5];
      return 1;
    }
    v6 = v2[6];
    if ((_DWORD)v6 == v3[6])
    {
      if ((_DWORD)v6)
      {
        v7 = v3 + 7;
        v8 = v2 + 7;
        result = 1;
        while (*v8 == *v7)
        {
          if (*v8 == 100)
          {
            v9 = *(_QWORD *)v8 == *(_QWORD *)v7 && *((_QWORD *)v8 + 1) == *((_QWORD *)v7 + 1);
            if (!v9 || v8[4] != (unint64_t)v7[4])
              break;
          }
          v7 += 5;
          v8 += 5;
          if (!--v6)
            return result;
        }
        return 0;
      }
      return 1;
    }
  }
  return 0;
}

BOOL CAAudioChannelLayout::operator!=(_QWORD *a1, _QWORD *a2)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  _BOOL8 result;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *i;
  BOOL v9;

  v2 = (_DWORD *)*a1;
  v3 = (_DWORD *)*a2;
  if (*a1 == *a2)
    return 0;
  v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000)
        return v2[5] != v3[5];
      return 0;
    }
    v6 = v2[6];
    if ((_DWORD)v6 == v3[6])
    {
      if ((_DWORD)v6)
      {
        v7 = v3 + 7;
        for (i = v2 + 7; *i == *v7; i += 5)
        {
          if (*i == 100)
          {
            v9 = *(_QWORD *)i == *(_QWORD *)v7 && *((_QWORD *)i + 1) == *((_QWORD *)v7 + 1);
            if (!v9 || i[4] != (unint64_t)v7[4])
              break;
          }
          result = 0;
          v7 += 5;
          if (!--v6)
            return result;
        }
        return 1;
      }
      return 0;
    }
  }
  return 1;
}

size_t CAAudioChannelLayout::Print(CAAudioChannelLayout *this, __sFILE *__stream)
{
  return CAShowAudioChannelLayout(__stream, (_DWORD *)(*(_QWORD *)this + 16));
}

void TruePeak::TruePeak(TruePeak *this)
{
  *((_WORD *)this + 56) = 1;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 18) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

{
  *((_WORD *)this + 56) = 1;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 18) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

double TruePeak::Reset(TruePeak *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 17) = 0;
  *((_DWORD *)this + 18) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  return result;
}

double TruePeak::ResetStats(TruePeak *this)
{
  double result;

  *((_DWORD *)this + 17) = 0;
  *((_DWORD *)this + 18) = 0;
  result = 0.0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  return result;
}

float TruePeak::GetStats(uint64_t a1, uint64_t a2)
{
  float v4;
  float v5;
  float v6;
  float result;

  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 80);
  v4 = *(float *)(a1 + 68);
  if (v4 < 1.1755e-38)
    v4 = 1.1755e-38;
  *(float *)a2 = fmaxf(log10f(v4) * 20.0, -200.0);
  if (*(_BYTE *)(a1 + 112))
  {
    v5 = *(float *)(a1 + 72);
  }
  else
  {
    v5 = *(float *)(a1 + 96);
    if (v5 <= *(float *)(a1 + 100))
      v5 = *(float *)(a1 + 100);
    v6 = *(float *)(a1 + 104);
    if (v6 <= *(float *)(a1 + 108))
      v6 = *(float *)(a1 + 108);
    if (v5 <= v6)
      v5 = v6;
  }
  if (v5 < *(float *)(a1 + 68))
    v5 = *(float *)(a1 + 68);
  if (v5 < 1.1755e-38)
    v5 = 1.1755e-38;
  result = fmaxf(log10f(v5) * 20.0, -200.0);
  *(float *)(a2 + 4) = result;
  return result;
}

uint64_t TruePeak::Process(uint64_t this, int a2, const float *a3, int8x16_t a4, int8x16_t a5)
{
  float v5;
  float v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  char v12;
  char v13;
  float v14;
  char v15;
  float v16;
  uint64_t v17;
  float v18;
  char v19;
  float v20;
  float v21;
  int8x16_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int8x16_t v32;
  float32x4_t v33;
  int v34;
  float32x4_t v35;
  __int32 v36;
  float32x4_t v37;
  int v38;
  float32x4_t v39;
  int8x16_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  float v46;
  char v47;
  float v48;
  uint64_t v49;
  float v50;
  float v51;
  uint64_t v52;
  _BOOL4 v53;
  float v54;
  float v55;
  uint64_t v56;
  float v57;
  char v58;
  float v59;
  float v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  int8x16_t v64;
  float32x4_t v65;
  int8x16_t v66;
  float32x4_t v67;
  int8x16_t v68;
  float32x4_t v69;
  int8x16_t v70;
  float32x4_t v71;
  int8x16_t v72;
  float32x4_t v73;
  int8x16_t v74;
  float32x4_t v75;
  unsigned int v76;
  int v77;
  int8x16_t v78;
  int8x16_t v79;
  int8x16_t v80;
  int8x16_t v81;
  float32x4_t v82;
  float32x4_t v83;

  if (!*(_BYTE *)(this + 112))
  {
    a4.i32[0] = 0;
    a5.i32[0] = *(unsigned __int8 *)(this + 113);
    v23 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(a5, a4), 0);
    v24 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E460, (int8x16_t)xmmword_1A839E450);
    v25 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E480, (int8x16_t)xmmword_1A839E470);
    v26 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E4A0, (int8x16_t)xmmword_1A839E490);
    v27 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E4C0, (int8x16_t)xmmword_1A839E4B0);
    v28 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E4E0, (int8x16_t)xmmword_1A839E4D0);
    v29 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_1A839E500, (int8x16_t)xmmword_1A839E4F0);
    v30 = *(float32x4_t *)this;
    v31 = *(float32x4_t *)(this + 16);
    v32 = *(int8x16_t *)(this + 32);
    v33 = *(float32x4_t *)(this + 96);
    v34 = *(_DWORD *)(this + 68);
    if (*(_BYTE *)(this + 113))
    {
      if (a2 >= 1)
      {
        v35 = 0uLL;
        do
        {
          v36 = *(_DWORD *)a3++;
          v30 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v31, 4uLL);
          v31 = (float32x4_t)vextq_s8((int8x16_t)v31, v32, 4uLL);
          v37.i32[0] = vdupq_lane_s32(*(int32x2_t *)v32.i8, 1).u32[0];
          *(uint64_t *)((char *)v37.i64 + 4) = v32.i64[1];
          v37.i32[3] = v36;
          v38 = v36 & 0x7FFFFFFF;
          if ((v36 & 0x7FFFFFFF) > v34)
            v34 = v38;
          v39 = vmlaq_f32(vmlaq_f32(vmulq_f32(v24, v30), v25, v31), v26, v37);
          v40 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v29, v30), v28, v31), v27, v37);
          *(float32x2_t *)v39.f32 = vadd_f32(*(float32x2_t *)v39.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v39, (int8x16_t)v39, 8uLL));
          *(float32x2_t *)v40.i8 = vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
          *(float32x2_t *)v39.f32 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v39.f32, *(int32x2_t *)v40.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v39.f32, *(int32x2_t *)v40.i8));
          v39.i64[1] = vextq_s8((int8x16_t)v35, (int8x16_t)v35, 8uLL).u64[0];
          v35 = vabsq_f32(v39);
          v33 = vmaxq_f32(v33, v35);
          v32 = (int8x16_t)v37;
          --a2;
        }
        while (a2);
        goto LABEL_78;
      }
    }
    else if (a2 >= 1)
    {
      v64 = (int8x16_t)vrev64q_s32((int32x4_t)v26);
      v65 = (float32x4_t)vextq_s8(v64, v64, 8uLL);
      v66 = (int8x16_t)vrev64q_s32((int32x4_t)v25);
      v67 = (float32x4_t)vextq_s8(v66, v66, 8uLL);
      v68 = (int8x16_t)vrev64q_s32((int32x4_t)v24);
      v69 = (float32x4_t)vextq_s8(v68, v68, 8uLL);
      v70 = (int8x16_t)vrev64q_s32((int32x4_t)v29);
      v71 = (float32x4_t)vextq_s8(v70, v70, 8uLL);
      v72 = (int8x16_t)vrev64q_s32((int32x4_t)v28);
      v73 = (float32x4_t)vextq_s8(v72, v72, 8uLL);
      v74 = (int8x16_t)vrev64q_s32((int32x4_t)v27);
      v75 = (float32x4_t)vextq_s8(v74, v74, 8uLL);
      do
      {
        v76 = *(_DWORD *)a3++;
        v30 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v31, 4uLL);
        v37.i32[0] = vdupq_lane_s32(*(int32x2_t *)v32.i8, 1).u32[0];
        v37.i32[1] = v32.i32[2];
        v37.i64[1] = __PAIR64__(v76, v32.u32[3]);
        v31 = (float32x4_t)vextq_s8((int8x16_t)v31, v32, 4uLL);
        v77 = v76 & 0x7FFFFFFF;
        v78 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v24, v30), v25, v31), v26, v37);
        v79 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v65, v30), v67, v31), v69, v37);
        *(float32x2_t *)v78.i8 = vadd_f32(*(float32x2_t *)v78.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
        *(float32x2_t *)v79.i8 = vadd_f32(*(float32x2_t *)v79.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v79, v79, 8uLL));
        v80 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v27, v30), v28, v31), v29, v37);
        v81 = (int8x16_t)vmlaq_f32(vmlaq_f32(vmulq_f32(v71, v30), v73, v31), v75, v37);
        *(float32x2_t *)v80.i8 = vadd_f32(*(float32x2_t *)v80.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v80, v80, 8uLL));
        *(float32x2_t *)v81.i8 = vadd_f32(*(float32x2_t *)v81.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v81, v81, 8uLL));
        *(int32x2_t *)v82.f32 = vzip1_s32(*(int32x2_t *)v78.i8, *(int32x2_t *)v79.i8);
        v82.i64[1] = __PAIR64__(v81.u32[0], v80.u32[0]);
        *(int32x2_t *)v83.f32 = vzip2_s32(*(int32x2_t *)v78.i8, *(int32x2_t *)v79.i8);
        v83.i64[1] = __PAIR64__(v81.u32[1], vdup_lane_s32(*(int32x2_t *)v80.i8, 1).u32[0]);
        if ((int)(v76 & 0x7FFFFFFF) > v34)
          v34 = v77;
        v33 = vmaxq_f32(v33, vabsq_f32(vaddq_f32(v82, v83)));
        v32 = (int8x16_t)v37;
        --a2;
      }
      while (a2);
      goto LABEL_78;
    }
    v37 = *(float32x4_t *)(this + 32);
LABEL_78:
    *(float32x4_t *)this = v30;
    *(float32x4_t *)(this + 16) = v31;
    *(float32x4_t *)(this + 32) = v37;
    *(float32x4_t *)(this + 96) = v33;
    *(_DWORD *)(this + 68) = v34;
    return this;
  }
  v5 = *(float *)(this + 68);
  v6 = *(float *)(this + 72);
  v7 = *(_DWORD *)(this + 64);
  if (*(_BYTE *)(this + 113))
  {
    if (a2 >= 1)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = 0;
        v12 = v7;
        *(float *)(this + 4 * v7) = a3[v8];
        v13 = v7 + 1;
        v7 = ((_BYTE)v7 + 1) & 0xF;
        v14 = fabsf(*(float *)(this + 4 * ((v12 + 11) & 0xF)));
        v15 = (v13 & 0xF) - 12;
        v16 = 0.0;
        do
        {
          v16 = v16 + (float)(TruePeak::sSincByTwo[v11] * *(float *)(this + 4 * ((v15 + (_BYTE)v11) & 0xF)));
          ++v11;
        }
        while (v11 != 12);
        v17 = 0;
        v18 = fabsf(v16);
        v19 = ((v12 + 1) & 0xF) - 12;
        v20 = 0.0;
        do
        {
          v20 = v20 + (float)(TruePeak::sSincByTwo[v17 + 12] * *(float *)(this + 4 * ((v19 + (_BYTE)v17) & 0xF)));
          ++v17;
        }
        while (v17 != 12);
        if (v5 < v14)
          v5 = v14;
        if (v6 < v18)
          v6 = v18;
        v21 = fabsf(v20);
        if (v21 <= 1.0)
        {
          if (v6 < v21)
            v6 = v21;
          if (v14 <= 1.0 && v18 <= 1.0)
            goto LABEL_24;
        }
        else if (v6 < v21)
        {
          v6 = v21;
        }
        ++v9;
LABEL_24:
        v10 += v14 > 1.0;
        if (++v8 == a2)
          goto LABEL_70;
      }
    }
    goto LABEL_69;
  }
  if (a2 >= 1)
  {
    v41 = 0;
    v9 = 0;
    v10 = 0;
    v42 = a2;
    while (1)
    {
      v43 = 0;
      v44 = v7;
      *(float *)(this + 4 * v7) = a3[v41];
      v45 = v7 + 1;
      v7 = ((_BYTE)v7 + 1) & 0xF;
      v46 = fabsf(*(float *)(this + 4 * ((v44 + 11) & 0xF)));
      v47 = (v45 & 0xF) - 12;
      v48 = 0.0;
      do
      {
        v48 = v48 + (float)(TruePeak::sSinc[v43] * *(float *)(this + 4 * ((v47 + (_BYTE)v43) & 0xF)));
        ++v43;
      }
      while (v43 != 12);
      v49 = 0;
      v50 = fabsf(v48);
      v51 = 0.0;
      do
      {
        v51 = v51
            + (float)(TruePeak::sSinc[v49 + 12] * *(float *)(this + 4 * ((((v44 + 1) & 0xF) - 12 + (_BYTE)v49) & 0xF)));
        ++v49;
      }
      while (v49 != 12);
      v52 = 0;
      if (v5 < v46)
        v5 = v46;
      v10 += v46 > 1.0;
      v53 = v46 > 1.0 || v50 > 1.0;
      if (v6 < v50)
        v6 = v50;
      v54 = fabsf(v51);
      if (v54 > 1.0)
        v53 = 1;
      v55 = 0.0;
      do
      {
        v55 = v55
            + (float)(TruePeak::sSinc[v52 + 24] * *(float *)(this + 4 * ((((v44 + 1) & 0xF) - 12 + (_BYTE)v52) & 0xF)));
        ++v52;
      }
      while (v52 != 12);
      v56 = 0;
      v57 = fabsf(v55);
      v58 = ((v44 + 1) & 0xF) - 12;
      v59 = 0.0;
      do
      {
        v59 = v59 + (float)(TruePeak::sSinc[v56 + 36] * *(float *)(this + 4 * ((v58 + (_BYTE)v56) & 0xF)));
        ++v56;
      }
      while (v56 != 12);
      if (v6 < v54)
        v6 = v54;
      if (v6 < v57)
        v6 = v57;
      v60 = fabsf(v59);
      if (v60 <= 1.0)
      {
        v61 = v57 > 1.0 || v53;
        if (v6 < v60)
          v6 = v60;
        if (v61 != 1)
          goto LABEL_67;
      }
      else if (v6 < v60)
      {
        v6 = v60;
      }
      ++v9;
LABEL_67:
      if (++v41 == v42)
        goto LABEL_70;
    }
  }
LABEL_69:
  v10 = 0;
  v9 = 0;
LABEL_70:
  *(_DWORD *)(this + 64) = v7;
  *(float *)(this + 68) = v5;
  *(float *)(this + 72) = v6;
  v62 = *(_QWORD *)(this + 80) + v10;
  v63 = *(_QWORD *)(this + 88) + v9;
  *(_QWORD *)(this + 80) = v62;
  *(_QWORD *)(this + 88) = v63;
  return this;
}

BOOL PlatformUtilities_iOS::ProductIsAPhone(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 1;
}

BOOL PlatformUtilities_iOS::ProductIsAppleWatch(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 6;
}

BOOL PlatformUtilities_iOS::ProductIsiPod(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 2;
}

BOOL PlatformUtilities_iOS::ProductIsiPad(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 3;
}

BOOL PlatformUtilities_iOS::ProductIsHomePod(PlatformUtilities_iOS *this)
{
  PlatformUtilities_iOS *ProductType;
  PlatformUtilities_iOS *v2;
  PlatformUtilities_iOS *v3;

  ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(this);
  if ((_DWORD)ProductType == 2)
    return 1;
  v2 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(ProductType);
  if ((_DWORD)v2 == 3)
    return 1;
  v3 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v2);
  return (_DWORD)v3 == 4 || PlatformUtilities_iOS::GetProductType(v3) == 5;
}

uint64_t PlatformUtilities_iOS::GetProductType(PlatformUtilities_iOS *this)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck == 1)
    return PlatformUtilities_iOS::GetProductType(void)::sType;
  PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck = 1;
  v2 = MGGetProductType();
  if (v2 > 2158787295)
  {
    if (v2 > 3196805750)
    {
      if (v2 > 3711192743)
      {
        if (v2 > 3885279869)
        {
          if (v2 > 4068102501)
          {
            if (v2 <= 4231109336)
            {
              switch(v2)
              {
                case 4068102502:
                  result = 168;
                  goto LABEL_472;
                case 4172444931:
                  result = 132;
                  goto LABEL_472;
                case 4201643249:
                  result = 35;
                  goto LABEL_472;
              }
              goto LABEL_471;
            }
            if (v2 > 4240173201)
            {
              if (v2 == 4240173202)
              {
                result = 2;
                goto LABEL_472;
              }
              if (v2 == 4242862982)
              {
                result = 80;
                goto LABEL_472;
              }
              goto LABEL_471;
            }
            if (v2 != 4231109337)
            {
              if (v2 == 4232256925)
              {
                result = 114;
                goto LABEL_472;
              }
              goto LABEL_471;
            }
            goto LABEL_377;
          }
          if (v2 <= 3953847431)
          {
            if (v2 == 3885279870)
            {
              result = 32;
              goto LABEL_472;
            }
            if (v2 != 3933865620)
            {
              if (v2 == 3933982784)
              {
                result = 53;
                goto LABEL_472;
              }
              goto LABEL_471;
            }
            goto LABEL_372;
          }
          if (v2 > 4055323050)
          {
            if (v2 == 4055323051)
            {
              result = 58;
              goto LABEL_472;
            }
            if (v2 == 4067129264)
            {
              result = 139;
              goto LABEL_472;
            }
          }
          else
          {
            if (v2 == 3953847432)
            {
              result = 170;
              goto LABEL_472;
            }
            if (v2 == 4025247511)
            {
              result = 133;
              goto LABEL_472;
            }
          }
LABEL_471:
          result = 0;
          goto LABEL_472;
        }
        if (v2 <= 3825599859)
        {
          if (v2 <= 3767261005)
          {
            switch(v2)
            {
              case 3711192744:
                result = 84;
                goto LABEL_472;
              case 3742999858:
                result = 159;
                goto LABEL_472;
              case 3743999268:
                result = 24;
                goto LABEL_472;
            }
            goto LABEL_471;
          }
          if (v2 == 3767261006)
          {
            result = 153;
            goto LABEL_472;
          }
          if (v2 != 3801472101)
          {
            if (v2 == 3819635030)
            {
              result = 160;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          goto LABEL_344;
        }
        if (v2 <= 3863625341)
        {
          switch(v2)
          {
            case 3825599860:
              result = 20;
              goto LABEL_472;
            case 3839750255:
              result = 169;
              goto LABEL_472;
            case 3856877970:
              result = 110;
              goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 > 3865922941)
        {
          if (v2 == 3865922942)
          {
            result = 56;
            goto LABEL_472;
          }
          if (v2 == 3867318491)
          {
            result = 162;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 != 3863625342)
        {
          if (v2 == 3865897231)
          {
            result = 79;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
LABEL_385:
        result = 97;
        goto LABEL_472;
      }
      if (v2 <= 3540156651)
      {
        if (v2 > 3300281075)
        {
          if (v2 <= 3397214290)
          {
            if (v2 == 3300281076)
            {
              result = 54;
              goto LABEL_472;
            }
            if (v2 == 3348380076)
            {
              result = 4;
              goto LABEL_472;
            }
            if (v2 != 3361025853)
              goto LABEL_471;
            goto LABEL_381;
          }
          if (v2 <= 3417429876)
          {
            if (v2 == 3397214291)
            {
              result = 74;
              goto LABEL_472;
            }
            if (v2 == 3402870384)
            {
              result = 70;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          if (v2 != 3417429877)
          {
            if (v2 == 3455223061)
            {
              result = 83;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          goto LABEL_371;
        }
        if (v2 <= 3228373940)
        {
          if (v2 == 3196805751)
          {
            result = 7;
            goto LABEL_472;
          }
          if (v2 == 3215673114)
          {
            result = 75;
            goto LABEL_472;
          }
          v9 = 3217792190;
LABEL_151:
          if (v2 != v9)
            goto LABEL_471;
          goto LABEL_372;
        }
        if (v2 == 3228373941)
        {
LABEL_383:
          result = 104;
          goto LABEL_472;
        }
        if (v2 != 3241053352)
        {
          if (v2 == 3242623367)
          {
            result = 15;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
LABEL_384:
        result = 107;
        goto LABEL_472;
      }
      if (v2 > 3637438249)
      {
        if (v2 <= 3670339450)
        {
          if (v2 == 3637438250)
          {
            result = 52;
            goto LABEL_472;
          }
          if (v2 != 3645319985)
          {
            if (v2 == 3663011141)
            {
              result = 156;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          goto LABEL_380;
        }
        if (v2 > 3683904381)
        {
          if (v2 == 3683904382)
          {
            result = 137;
            goto LABEL_472;
          }
          v6 = 3707345671;
          goto LABEL_359;
        }
        if (v2 == 3670339451)
          goto LABEL_372;
        v7 = 3677894691;
LABEL_96:
        if (v2 == v7)
        {
          result = 102;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
      if (v2 <= 3585085678)
      {
        if (v2 == 3540156652)
        {
          result = 93;
          goto LABEL_472;
        }
        if (v2 != 3543203160)
        {
          if (v2 == 3571532206)
          {
            result = 151;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_372;
      }
      if (v2 == 3585085679)
      {
        result = 10;
        goto LABEL_472;
      }
      if (v2 == 3599094683)
        goto LABEL_385;
      v12 = 3636345305;
      goto LABEL_366;
    }
    if (v2 > 2688879998)
    {
      if (v2 <= 2940697644)
      {
        if (v2 <= 2781508712)
        {
          if (v2 > 2722529671)
          {
            switch(v2)
            {
              case 2722529672:
                result = 28;
                goto LABEL_472;
              case 2730762296:
                result = 112;
                goto LABEL_472;
              case 2751865418:
                result = 143;
                goto LABEL_472;
            }
            goto LABEL_471;
          }
          if (v2 == 2688879999)
          {
            result = 39;
            goto LABEL_472;
          }
          if (v2 != 2692844695)
          {
            if (v2 == 2702125347)
            {
              result = 3;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
LABEL_256:
          result = 197;
          goto LABEL_472;
        }
        if (v2 <= 2797549162)
        {
          switch(v2)
          {
            case 2781508713:
              result = 6;
              goto LABEL_472;
            case 2793418701:
              result = 19;
              goto LABEL_472;
            case 2795618603:
              result = 42;
              goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 > 2880863277)
        {
          if (v2 != 2880863278)
          {
            if (v2 == 2903084588)
            {
              result = 85;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
LABEL_360:
          result = 51;
          goto LABEL_472;
        }
        if (v2 == 2797549163)
        {
          result = 113;
          goto LABEL_472;
        }
        v5 = 2823174122;
        goto LABEL_280;
      }
      if (v2 <= 3101941569)
      {
        if (v2 <= 2979575959)
        {
          switch(v2)
          {
            case 2940697645:
              result = 38;
              goto LABEL_472;
            case 2941181571:
              result = 41;
              goto LABEL_472;
            case 2943112657:
              result = 149;
              goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 == 2979575960)
        {
          result = 155;
          goto LABEL_472;
        }
        if (v2 == 3001488778)
        {
          result = 34;
          goto LABEL_472;
        }
        v11 = 3054476161;
LABEL_315:
        if (v2 != v11)
          goto LABEL_471;
        goto LABEL_316;
      }
      if (v2 <= 3133873108)
      {
        if (v2 == 3101941570)
          goto LABEL_272;
        if (v2 != 3104290450)
        {
          v10 = 3128362815;
          goto LABEL_370;
        }
        goto LABEL_337;
      }
      if (v2 <= 3184375230)
      {
        if (v2 == 3133873109)
        {
          result = 62;
          goto LABEL_472;
        }
        if (v2 == 3143587592)
        {
          result = 166;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
      if (v2 == 3184375231)
      {
LABEL_389:
        result = 77;
        goto LABEL_472;
      }
      v12 = 3196158497;
LABEL_366:
      if (v2 != v12)
        goto LABEL_471;
      goto LABEL_367;
    }
    if (v2 <= 2454275342)
    {
      if (v2 > 2288107368)
      {
        if (v2 <= 2336512886)
        {
          if (v2 != 2288107369)
          {
            if (v2 == 2309863438)
            {
              result = 37;
              goto LABEL_472;
            }
            if (v2 == 2311900306)
            {
              result = 14;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          goto LABEL_363;
        }
        if (v2 > 2418348557)
        {
          if (v2 == 2418348558)
          {
            result = 135;
            goto LABEL_472;
          }
          if (v2 == 2445473385)
          {
            result = 124;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 == 2336512887)
        {
LABEL_378:
          result = 121;
          goto LABEL_472;
        }
        v4 = 2385671069;
LABEL_300:
        if (v2 == v4)
        {
          result = 50;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
      if (v2 <= 2236272847)
      {
        if (v2 != 2158787296)
        {
          if (v2 == 2159747553)
          {
            result = 26;
            goto LABEL_472;
          }
          if (v2 != 2162679683)
            goto LABEL_471;
          goto LABEL_386;
        }
LABEL_217:
        result = 69;
        goto LABEL_472;
      }
      if (v2 != 2236272848)
      {
        if (v2 != 2262113699)
        {
          if (v2 == 2270970153)
          {
            result = 21;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_382;
      }
LABEL_367:
      result = 87;
      goto LABEL_472;
    }
    if (v2 <= 2619317133)
    {
      if (v2 <= 2487868871)
      {
        if (v2 == 2454275343)
        {
          result = 63;
          goto LABEL_472;
        }
        if (v2 != 2458172802)
        {
          v3 = 2468178735;
LABEL_168:
          if (v2 == v3)
          {
            result = 120;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_367;
      }
      if (v2 == 2487868872)
        goto LABEL_384;
      if (v2 != 2516717268)
      {
        v4 = 2614323575;
        goto LABEL_300;
      }
    }
    else
    {
      if (v2 <= 2628394913)
      {
        if (v2 == 2619317134)
          goto LABEL_388;
        if (v2 != 2622433984)
        {
          if (v2 == 2625074843)
          {
            result = 161;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_379;
      }
      if (v2 <= 2644487443)
      {
        if (v2 == 2628394914)
          goto LABEL_316;
        v7 = 2634105757;
        goto LABEL_96;
      }
      if (v2 == 2644487444)
      {
        result = 92;
        goto LABEL_472;
      }
      if (v2 != 2673319456)
        goto LABEL_471;
    }
    result = 73;
    goto LABEL_472;
  }
  if (v2 <= 1309571157)
  {
    if (v2 <= 676119127)
    {
      if (v2 <= 337183580)
      {
        if (v2 > 133314239)
        {
          if (v2 > 228444037)
          {
            if (v2 > 262180326)
            {
              if (v2 == 262180327)
              {
                result = 123;
                goto LABEL_472;
              }
              if (v2 == 330877086)
              {
                result = 43;
                goto LABEL_472;
              }
              goto LABEL_471;
            }
            if (v2 != 228444038)
            {
              v3 = 253148925;
              goto LABEL_168;
            }
LABEL_380:
            result = 72;
            goto LABEL_472;
          }
          if (v2 == 133314240)
          {
            result = 40;
            goto LABEL_472;
          }
          if (v2 != 157833461)
          {
            if (v2 == 173258742)
            {
              result = 59;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
LABEL_249:
          result = 78;
          goto LABEL_472;
        }
        if (v2 <= 42878381)
        {
          switch(v2)
          {
            case 23433786:
              result = 61;
              goto LABEL_472;
            case 33245053:
              result = 68;
              goto LABEL_472;
            case 40511012:
              result = 134;
              goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 == 42878382)
        {
          result = 12;
          goto LABEL_472;
        }
        if (v2 != 79936591)
        {
          if (v2 != 88647037)
            goto LABEL_471;
          goto LABEL_389;
        }
LABEL_382:
        result = 76;
        goto LABEL_472;
      }
      if (v2 <= 363237282)
      {
        if (v2 > 344862119)
        {
          switch(v2)
          {
            case 344862120:
              result = 115;
              goto LABEL_472;
            case 355234908:
              result = 129;
              goto LABEL_472;
            case 358923952:
              result = 126;
              goto LABEL_472;
          }
          goto LABEL_471;
        }
        if (v2 == 337183581)
        {
          result = 11;
          goto LABEL_472;
        }
        if (v2 == 340218669)
        {
          result = 111;
          goto LABEL_472;
        }
        v8 = 341800273;
        goto LABEL_162;
      }
      if (v2 <= 502329936)
      {
        if (v2 != 363237283)
        {
          if (v2 == 425046865)
          {
            result = 157;
            goto LABEL_472;
          }
          if (v2 == 445396642)
          {
            result = 117;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_372;
      }
      if (v2 <= 555503453)
      {
        if (v2 == 502329937)
        {
          result = 22;
          goto LABEL_472;
        }
        v6 = 551446205;
LABEL_359:
        if (v2 != v6)
          goto LABEL_471;
        goto LABEL_360;
      }
      if (v2 != 555503454)
      {
        if (v2 == 574536383)
        {
          result = 30;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
LABEL_388:
      result = 106;
      goto LABEL_472;
    }
    if (v2 <= 952317140)
    {
      if (v2 > 776033018)
      {
        if (v2 > 851437780)
        {
          if (v2 <= 910181309)
          {
            if (v2 == 851437781)
            {
              result = 29;
              goto LABEL_472;
            }
            if (v2 == 896202454)
            {
              result = 71;
              goto LABEL_472;
            }
            goto LABEL_471;
          }
          if (v2 == 910181310)
            goto LABEL_387;
          if (v2 != 910313402)
            goto LABEL_471;
LABEL_337:
          result = 195;
          goto LABEL_472;
        }
        if (v2 == 776033019)
        {
          result = 57;
          goto LABEL_472;
        }
        if (v2 != 810906663)
        {
          if (v2 != 820711327)
            goto LABEL_471;
          goto LABEL_217;
        }
LABEL_379:
        result = 98;
        goto LABEL_472;
      }
      if (v2 <= 746003605)
      {
        if (v2 == 676119128)
        {
          result = 146;
          goto LABEL_472;
        }
        if (v2 == 689804742)
        {
          result = 36;
          goto LABEL_472;
        }
        v10 = 698697055;
LABEL_370:
        if (v2 != v10)
          goto LABEL_471;
        goto LABEL_371;
      }
      if (v2 == 746003606)
      {
LABEL_316:
        result = 101;
        goto LABEL_472;
      }
      if (v2 == 749116821)
      {
        result = 165;
        goto LABEL_472;
      }
      v5 = 761631964;
LABEL_280:
      if (v2 == v5)
      {
        result = 109;
        goto LABEL_472;
      }
      goto LABEL_471;
    }
    if (v2 > 1169082143)
    {
      if (v2 <= 1280909811)
      {
        if (v2 == 1169082144)
        {
          result = 33;
          goto LABEL_472;
        }
        if (v2 == 1234705395)
        {
          result = 125;
          goto LABEL_472;
        }
        if (v2 != 1280441783)
          goto LABEL_471;
        goto LABEL_249;
      }
      if (v2 <= 1294429941)
      {
        if (v2 == 1280909812)
        {
          result = 152;
          goto LABEL_472;
        }
        if (v2 != 1293446025)
          goto LABEL_471;
        goto LABEL_373;
      }
      if (v2 == 1294429942)
      {
        result = 147;
        goto LABEL_472;
      }
      if (v2 != 1302273958)
        goto LABEL_471;
LABEL_363:
      result = 108;
      goto LABEL_472;
    }
    if (v2 > 1110205731)
    {
      if (v2 == 1110205732)
      {
        result = 48;
        goto LABEL_472;
      }
      if (v2 == 1114644381)
      {
        result = 82;
        goto LABEL_472;
      }
      v6 = 1119807502;
      goto LABEL_359;
    }
    if (v2 != 952317141)
    {
      if (v2 == 1060988941)
      {
        result = 9;
        goto LABEL_472;
      }
      if (v2 == 1085318934)
      {
        result = 131;
        goto LABEL_472;
      }
      goto LABEL_471;
    }
    goto LABEL_378;
  }
  if (v2 <= 1733600852)
  {
    if (v2 <= 1434404432)
    {
      if (v2 > 1380747800)
      {
        if (v2 <= 1412429327)
        {
          switch(v2)
          {
            case 1380747801:
              result = 127;
              goto LABEL_472;
            case 1402208364:
              result = 130;
              goto LABEL_472;
            case 1408738134:
              result = 150;
              goto LABEL_472;
          }
        }
        else if (v2 > 1419435330)
        {
          if (v2 == 1419435331)
          {
            result = 142;
            goto LABEL_472;
          }
          if (v2 == 1429914406)
          {
            result = 23;
            goto LABEL_472;
          }
        }
        else
        {
          if (v2 == 1412429328)
          {
            result = 65;
            goto LABEL_472;
          }
          if (v2 == 1415625992)
          {
            result = 136;
            goto LABEL_472;
          }
        }
        goto LABEL_471;
      }
      if (v2 <= 1364038515)
      {
        if (v2 == 1309571158)
        {
          result = 141;
          goto LABEL_472;
        }
        if (v2 == 1325975682)
        {
          result = 67;
          goto LABEL_472;
        }
        v8 = 1353145733;
LABEL_162:
        if (v2 != v8)
          goto LABEL_471;
        goto LABEL_344;
      }
      if (v2 != 1364038516)
      {
        if (v2 == 1371389549)
        {
          result = 27;
          goto LABEL_472;
        }
        if (v2 != 1373516433)
          goto LABEL_471;
        goto LABEL_272;
      }
LABEL_371:
      result = 194;
      goto LABEL_472;
    }
    if (v2 <= 1573906121)
    {
      if (v2 > 1549248875)
      {
        switch(v2)
        {
          case 1549248876:
            result = 172;
            goto LABEL_472;
          case 1554479185:
            result = 167;
            goto LABEL_472;
          case 1559256613:
            result = 55;
            goto LABEL_472;
        }
      }
      else
      {
        switch(v2)
        {
          case 1434404433:
            result = 17;
            goto LABEL_472;
          case 1517755655:
            result = 171;
            goto LABEL_472;
          case 1540760353:
            result = 5;
            goto LABEL_472;
        }
      }
      goto LABEL_471;
    }
    if (v2 <= 1625227433)
    {
      switch(v2)
      {
        case 1573906122:
          result = 138;
          goto LABEL_472;
        case 1602181456:
          result = 154;
          goto LABEL_472;
        case 1608945770:
          result = 192;
          goto LABEL_472;
      }
      goto LABEL_471;
    }
    if (v2 > 1701146936)
    {
      if (v2 == 1701146937)
      {
        result = 49;
        goto LABEL_472;
      }
      if (v2 == 1721691077)
      {
        result = 16;
        goto LABEL_472;
      }
      goto LABEL_471;
    }
    if (v2 != 1625227434)
    {
      if (v2 == 1644180312)
      {
        result = 145;
        goto LABEL_472;
      }
      goto LABEL_471;
    }
    goto LABEL_383;
  }
  if (v2 <= 2023824666)
  {
    if (v2 > 1868379042)
    {
      if (v2 <= 1908832378)
      {
        if (v2 != 1868379043)
        {
          if (v2 == 1878257790)
          {
            result = 81;
            goto LABEL_472;
          }
          if (v2 == 1895344378)
          {
            result = 86;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
        goto LABEL_272;
      }
      if (v2 <= 2001966016)
      {
        if (v2 != 1908832379)
        {
          if (v2 == 1990293942)
          {
            result = 140;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
LABEL_377:
        result = 196;
        goto LABEL_472;
      }
      if (v2 != 2001966017)
      {
        if (v2 == 2021146989)
        {
          result = 18;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
LABEL_344:
      result = 88;
      goto LABEL_472;
    }
    if (v2 <= 1756509289)
    {
      if (v2 == 1733600853)
      {
        result = 128;
        goto LABEL_472;
      }
      if (v2 == 1737882206)
      {
        result = 116;
        goto LABEL_472;
      }
      v9 = 1744899922;
      goto LABEL_151;
    }
    if (v2 == 1756509290)
    {
      result = 144;
      goto LABEL_472;
    }
    if (v2 == 1770142589)
    {
      result = 163;
      goto LABEL_472;
    }
    v11 = 1834147427;
    goto LABEL_315;
  }
  if (v2 > 2085054104)
  {
    if (v2 > 2103978417)
    {
      if (v2 <= 2141052861)
      {
        if (v2 != 2103978418)
        {
          if (v2 == 2132302344)
          {
            result = 148;
            goto LABEL_472;
          }
          goto LABEL_471;
        }
LABEL_373:
        result = 96;
        goto LABEL_472;
      }
      if (v2 != 2141052862)
      {
        v10 = 2144123136;
        goto LABEL_370;
      }
LABEL_372:
      result = 193;
      goto LABEL_472;
    }
    if (v2 == 2085054105)
    {
      result = 158;
      goto LABEL_472;
    }
    if (v2 != 2089455188)
    {
      if (v2 != 2095883268)
        goto LABEL_471;
      goto LABEL_256;
    }
LABEL_381:
    result = 105;
    goto LABEL_472;
  }
  if (v2 <= 2078329140)
  {
    if (v2 != 2023824667)
    {
      if (v2 != 2032616841)
      {
        if (v2 == 2048538371)
        {
          result = 60;
          goto LABEL_472;
        }
        goto LABEL_471;
      }
LABEL_387:
      result = 25;
      goto LABEL_472;
    }
LABEL_272:
    result = 100;
    goto LABEL_472;
  }
  if (v2 > 2081274471)
  {
    if (v2 != 2081274472)
    {
      if (v2 == 2084894489)
      {
        result = 164;
        goto LABEL_472;
      }
      goto LABEL_471;
    }
LABEL_386:
    result = 122;
    goto LABEL_472;
  }
  if (v2 == 2078329141)
  {
    result = 31;
    goto LABEL_472;
  }
  if (v2 != 2080700391)
    goto LABEL_471;
  result = 46;
LABEL_472:
  PlatformUtilities_iOS::GetProductType(void)::sType = result;
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsAssistant(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsCarPlay(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsLivePhoto(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsVibrator(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriBargeIn(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsWirelessCharging(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsPictureInPicture(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::CopyProductAssignedName(PlatformUtilities_iOS *this)
{
  return MGGetStringAnswer();
}

uint64_t PlatformUtilities_iOS::IsTelephonyCaptureAllowed(int a1)
{
  uint64_t result;
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_67);
  if (!gIsInternal && !gIsCarrier)
    return 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
  result = CACFPreferencesGetAppIntegerValue(CFSTR("EnableTelephonyMonitor"), CFSTR("com.apple.coreaudio"), 0);
  if (result)
  {
    switch(a1)
    {
      case 0:
        v3 = CFSTR("com.apple.coreaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
        v4 = CFSTR("EnableVPTelephonyMonitor");
        break;
      case 1:
        v3 = CFSTR("com.apple.audio.virtualaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.audio.virtualaudio"));
        v4 = CFSTR("EnableVADTelephonyMonitor");
        break;
      case 2:
        v3 = CFSTR("com.apple.coreaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
        v4 = CFSTR("EnableHALTelephonyMonitor");
        break;
      case 3:
        v3 = CFSTR("com.apple.audio.virtualaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.audio.virtualaudio"));
        v4 = CFSTR("EnableEANCTelephonyMonitor");
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v5 = 136315394;
          v6 = "PlatformUtilities_iOS.cpp";
          v7 = 1024;
          v8 = 253;
          _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  Unhandled case in switch", (uint8_t *)&v5, 0x12u);
        }
        __break(1u);
        JUMPOUT(0x1A83809E4);
    }
    return CACFPreferencesGetAppIntegerValue(v4, v3, 0) != 0;
  }
  return result;
}

void ___ZL14queryBuildTypev_block_invoke()
{
  const void *v0;
  CFTypeRef *v1;
  BOOL v2;
  const __CFString *v3;
  BOOL v4;
  const void *v5;
  BOOL v6;
  const void *v7;
  char v8;
  const __CFString *v9;
  char v10;
  const void *v11;
  char v12;

  v0 = (const void *)MGCopyAnswer();
  v11 = v0;
  v12 = 1;
  v1 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if (v0)
    v2 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v2 = 0;
  gIsInternal = v2;
  v3 = (const __CFString *)MGCopyAnswer();
  v9 = v3;
  v10 = 1;
  if (v3)
    v4 = CFStringCompare(CFSTR("Carrier"), v3, 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  gIsCarrier = v4;
  v5 = (const void *)MGCopyAnswer();
  v7 = v5;
  v8 = 1;
  if (v5)
    v6 = CFEqual(v5, *v1) != 0;
  else
    v6 = 0;
  gIsUI = v6;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  CACFString::~CACFString((CACFString *)&v9);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
}

void sub_1A8380B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  CACFString::~CACFString((CACFString *)&a11);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a13);
  _Unwind_Resume(a1);
}

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

uint64_t PlatformUtilities_iOS::IsInternalBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_67);
  return gIsInternal;
}

uint64_t PlatformUtilities_iOS::IsCarrierBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_67);
  return gIsCarrier;
}

uint64_t PlatformUtilities_iOS::ProductSupportsTelephonyOverUSB(PlatformUtilities_iOS *this)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    return MGGetBoolAnswer();
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriSpeaks(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsStereoRecording(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsBrook(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::IsUIBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_67);
  return gIsUI;
}

uint64_t PlatformUtilities_iOS::_eaJyFmO(PlatformUtilities_iOS *this)
{
  if (PlatformUtilities_iOS::_eaJyFmO(void)::once != -1)
    dispatch_once(&PlatformUtilities_iOS::_eaJyFmO(void)::once, &__block_literal_global);
  return PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware;
}

void ___ZN21PlatformUtilities_iOS8_eaJyFmOEv_block_invoke()
{
  const void *v0;
  BOOL v1;
  const void *v2;
  char v3;

  v0 = (const void *)MGCopyAnswer();
  v2 = v0;
  v3 = 1;
  if (v0)
    v1 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v1 = 0;
  PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware = v1;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v2);
}

void sub_1A8380D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::ProductHasAOP(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductHasBaseband(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

void PlatformUtilities_iOS::TrimHardwareModelShortName(__CFString *this, __CFString *a2)
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  CFIndex Length;
  CFStringRef v7;
  char v8;
  CFStringRef suffix;
  char v10;
  CFRange v11;

  if (!this)
    return;
  v3 = CFSTR("AP");
  if (CFStringHasSuffix(this, CFSTR("AP"))
    || (v3 = CFSTR("DEV"), CFStringHasSuffix(this, CFSTR("DEV")))
    || (v3 = CFSTR("ap"), CFStringHasSuffix(this, CFSTR("ap")))
    || (v3 = CFSTR("dev"), CFStringHasSuffix(this, CFSTR("dev"))))
  {
    CFStringTrim(this, v3);
  }
  suffix = 0;
  v10 = 1;
  v4 = MGGetProductType();
  if (v4 == 952317141)
  {
    v7 = CFStringCreateWithCString(0, "u", 0x600u);
    v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  else
  {
    if (v4 != 2081274472 && v4 != 2468178735)
      goto LABEL_14;
    v7 = CFStringCreateWithCString(0, "m", 0x600u);
    v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  CACFString::~CACFString((CACFString *)&v7);
LABEL_14:
  v5 = suffix;
  if (suffix)
  {
    if (CFStringHasSuffix(this, suffix))
    {
      Length = CFStringGetLength(this);
      v11.length = CFStringGetLength(v5);
      v11.location = Length - v11.length;
      CFStringFindAndReplace(this, v5, &stru_1E5425B80, v11, 1uLL);
    }
  }
  CACFString::~CACFString((CACFString *)&suffix);
}

void sub_1A8380F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  CACFString::~CACFString((CACFString *)&a9);
  CACFString::~CACFString((CACFString *)&a11);
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::GetBuiltInMicCount(PlatformUtilities_iOS *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount = PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()();
  }
  return PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount;
}

void sub_1A8380FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const __CFNumber *PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()()
{
  const __CFNumber *result;
  const __CFNumber *v1;
  unsigned int valuePtr;

  result = (const __CFNumber *)MGCopyAnswer();
  valuePtr = 0;
  if (result)
  {
    v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v1);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFStringRef PlatformUtilities_iOS::CopyAcousticIDFilePrefix(PlatformUtilities_iOS *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  int v13;
  const std::locale::facet *v14;
  char *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  size_t v19;
  std::locale::__imp *p_b;
  uint64_t v21;
  uint64_t v22;
  void *locale;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  void **v27;
  unint64_t v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  CFStringRef v33;
  uint64_t v34;
  void *__dst[2];
  int64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[6];
  unint64_t v41;
  void *__p[2];
  __int128 v43;
  int v44;
  uint64_t v45[19];
  std::locale __b;
  size_t v47;
  int64_t v48;

  if (MGIsQuestionValid())
    MGGetSInt32Answer();
  v1 = MEMORY[0x1E0DE4FD0];
  v2 = MEMORY[0x1E0DE4FD0] + 104;
  v45[0] = MEMORY[0x1E0DE4FD0] + 104;
  v3 = MEMORY[0x1E0DE4FD0] + 64;
  v4 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
  v39 = MEMORY[0x1E0DE4FD0] + 64;
  v38[0] = v5;
  *(_QWORD *)((char *)v38 + *(_QWORD *)(v5 - 24)) = v6;
  v38[1] = 0;
  v7 = (std::ios_base *)((char *)v38 + *(_QWORD *)(v38[0] - 24));
  std::ios_base::init(v7, v40);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v8 = v4[5];
  v39 = v4[4];
  *(_QWORD *)((char *)&v40[-1] + *(_QWORD *)(v39 - 24)) = v8;
  v38[0] = v4[1];
  *(_QWORD *)((char *)v38 + *(_QWORD *)(v38[0] - 24)) = v4[6];
  v45[0] = v2;
  v38[0] = v1 + 24;
  v39 = v3;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x1E0DE4FB8];
  v40[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v43 = 0u;
  v44 = 24;
  MEMORY[0x1A85D283C](__dst, &v39);
  if (LOBYTE(__dst[0]))
  {
    v10 = (char *)&v40[-1] + *(_QWORD *)(v39 - 24);
    v11 = *((_QWORD *)v10 + 5);
    v12 = *((_DWORD *)v10 + 2);
    v13 = *((_DWORD *)v10 + 36);
    if (v13 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v40[-1] + *(_QWORD *)(v39 - 24)));
      v14 = std::locale::use_facet(&__b, MEMORY[0x1E0DE4A90]);
      v13 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v10 + 36) = v13;
    }
    if ((v12 & 0xB0) == 0x20)
      v15 = "";
    else
      v15 = "AID";
    if (!v11)
      goto LABEL_31;
    v16 = *((_QWORD *)v10 + 3);
    v17 = v16 <= 3;
    v18 = v16 - 3;
    v19 = v17 ? 0 : v18;
    if (v15 - "AID" >= 1
      && (*(uint64_t (**)(uint64_t, const char *, int64_t))(*(_QWORD *)v11 + 96))(v11, "AID", v15 - "AID") != v15 - "AID")
    {
      goto LABEL_31;
    }
    if ((uint64_t)v19 >= 1)
    {
      if (v19 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      if (v19 >= 0x17)
      {
        v21 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v19 | 7) != 0x17)
          v21 = v19 | 7;
        v22 = v21 + 1;
        p_b = (std::locale::__imp *)operator new(v21 + 1);
        v47 = v19;
        v48 = v22 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v48) = v19;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v13, v19);
      *((_BYTE *)p_b + v19) = 0;
      if (v48 >= 0)
        locale = &__b;
      else
        locale = __b.__locale_;
      v24 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v11 + 96))(v11, locale, v19);
      if (SHIBYTE(v48) < 0)
        operator delete(__b.__locale_);
      if (v24 != v19)
        goto LABEL_31;
    }
    v25 = "AID" - v15 + 3;
    if (v25 < 1
      || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v11 + 96))(v11, v15, "AID" - v15 + 3) == v25)
    {
      *((_QWORD *)v10 + 3) = 0;
      v9 = MEMORY[0x1E0DE4FB8];
    }
    else
    {
LABEL_31:
      v9 = MEMORY[0x1E0DE4FB8];
      std::ios_base::clear((std::ios_base *)((char *)&v40[-1] + *(_QWORD *)(v39 - 24)), *(_DWORD *)((char *)&v40[3] + *(_QWORD *)(v39 - 24)) | 5);
    }
  }
  MEMORY[0x1A85D2848](__dst);
  std::ostream::operator<<();
  if ((v44 & 0x10) != 0)
  {
    v28 = *((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1) < v41)
    {
      *((_QWORD *)&v43 + 1) = v41;
      v28 = v41;
    }
    v29 = (const void *)v40[5];
  }
  else
  {
    if ((v44 & 8) == 0)
    {
      v26 = 0;
      HIBYTE(v37) = 0;
      v27 = __dst;
      goto LABEL_47;
    }
    v29 = (const void *)v40[2];
    v28 = v40[4];
  }
  v26 = v28 - (_QWORD)v29;
  if (v28 - (unint64_t)v29 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v26 >= 0x17)
  {
    v30 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17)
      v30 = v26 | 7;
    v31 = v30 + 1;
    v27 = (void **)operator new(v30 + 1);
    __dst[1] = (void *)v26;
    v37 = v31 | 0x8000000000000000;
    __dst[0] = v27;
    goto LABEL_46;
  }
  HIBYTE(v37) = v28 - (_BYTE)v29;
  v27 = __dst;
  if (v26)
LABEL_46:
    memmove(v27, v29, v26);
LABEL_47:
  *((_BYTE *)v27 + v26) = 0;
  if (v37 >= 0)
    v32 = (const char *)__dst;
  else
    v32 = (const char *)__dst[0];
  v33 = CFStringCreateWithCString(0, v32, 0x600u);
  if (SHIBYTE(v37) < 0)
    operator delete(__dst[0]);
  v38[0] = *v4;
  v34 = v4[9];
  *(_QWORD *)((char *)v38 + *(_QWORD *)(v38[0] - 24)) = v4[8];
  v39 = v34;
  v40[0] = v9 + 16;
  if (SBYTE7(v43) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A85D292C](v45);
  return v33;
}

void sub_1A83814A8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;

  if (*(char *)(v23 - 89) < 0)
    operator delete(*(void **)(v23 - 112));
  MEMORY[0x1A85D2848](&__p);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)(v22 + *(_QWORD *)(a22 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1A8381334);
}

void sub_1A8381538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __cxa_end_catch();
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A8381548()
{
  uint64_t v0;

  std::iostream::~basic_iostream();
  MEMORY[0x1A85D292C](v0);
  JUMPOUT(0x1A838157CLL);
}

void sub_1A838156C()
{
  JUMPOUT(0x1A8381574);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A85D292C](a1 + 128);
  return a1;
}

CFStringRef PlatformUtilities_iOS::CopyProductTypeFilePrefix(int a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
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
  CFStringRef result;
  uint64_t v27;
  char __str[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  __str[0] = 0;
  switch(a1)
  {
    case 1:
      v27 = 0;
      v1 = 184;
      goto LABEL_8;
    case 2:
      v27 = 0;
      goto LABEL_5;
    case 3:
      v27 = 97;
LABEL_5:
      v1 = 238;
      goto LABEL_8;
    case 4:
      v27 = 0;
      v1 = 520;
      goto LABEL_8;
    case 5:
      v27 = 0;
      v1 = 620;
LABEL_8:
      v2 = 98;
      goto LABEL_233;
    case 6:
      v27 = 0;
      v1 = 10;
      goto LABEL_50;
    case 7:
      v27 = 0;
      v1 = 11;
      goto LABEL_50;
    case 8:
      v27 = 0;
      v1 = 12;
      goto LABEL_50;
    case 9:
      v27 = 0;
      v1 = 16;
      goto LABEL_50;
    case 10:
      v27 = 0;
      v1 = 17;
      goto LABEL_50;
    case 11:
      v27 = 0;
      v1 = 101;
      goto LABEL_50;
    case 12:
      v27 = 0;
      v1 = 111;
      goto LABEL_50;
    case 13:
      v27 = 0;
      v1 = 121;
      goto LABEL_50;
    case 14:
      v27 = 0;
      v1 = 20;
      goto LABEL_50;
    case 15:
      v27 = 0;
      v1 = 21;
      goto LABEL_50;
    case 16:
      v27 = 0;
      v1 = 22;
      goto LABEL_50;
    case 17:
      v27 = 0;
      goto LABEL_49;
    case 18:
      v27 = 0;
      v1 = 28;
      goto LABEL_50;
    case 19:
      v27 = 0;
      v1 = 37;
      goto LABEL_50;
    case 20:
      v27 = 0;
      v1 = 38;
      goto LABEL_50;
    case 21:
      v27 = 0;
      v1 = 201;
      goto LABEL_50;
    case 22:
      v27 = 0;
      v1 = 211;
      goto LABEL_50;
    case 23:
      v27 = 0;
      v1 = 221;
      goto LABEL_50;
    case 24:
      v27 = 0;
      v1 = 32;
      goto LABEL_50;
    case 25:
      v27 = 0;
      v1 = 33;
      goto LABEL_50;
    case 26:
      v27 = 0;
      v1 = 79;
      goto LABEL_50;
    case 27:
      v27 = 0;
      v1 = 42;
      goto LABEL_50;
    case 28:
      v27 = 0;
      v1 = 43;
      goto LABEL_50;
    case 29:
      v27 = 0;
      v1 = 47;
      goto LABEL_50;
    case 30:
      v27 = 0;
      v1 = 48;
      goto LABEL_50;
    case 31:
      v27 = 0;
      v1 = 49;
      goto LABEL_50;
    case 32:
      v27 = 103;
      v1 = 52;
      goto LABEL_50;
    case 33:
      v3 = 103;
      goto LABEL_38;
    case 34:
      v3 = 112;
LABEL_38:
      v27 = v3;
      v1 = 53;
      goto LABEL_50;
    case 35:
      v27 = 112;
      v1 = 54;
      goto LABEL_50;
    case 36:
      v27 = 0;
      v1 = 63;
      goto LABEL_50;
    case 37:
      v27 = 0;
      v1 = 64;
      goto LABEL_50;
    case 38:
      v27 = 0;
      v1 = 73;
      goto LABEL_50;
    case 39:
      v27 = 0;
      v1 = 74;
      goto LABEL_50;
    case 40:
      v27 = 0;
      v1 = 83;
      goto LABEL_50;
    case 41:
      v27 = 0;
      v1 = 84;
      goto LABEL_50;
    case 42:
      v27 = 0;
      v1 = 93;
      goto LABEL_50;
    case 43:
      v27 = 0;
      v1 = 94;
      goto LABEL_50;
    case 44:
      v27 = 117;
LABEL_49:
      v1 = 27;
LABEL_50:
      v2 = 100;
      goto LABEL_233;
    case 45:
      v27 = 0;
      v1 = 59;
      goto LABEL_243;
    case 46:
      v27 = 0;
      v1 = 104;
      goto LABEL_232;
    case 47:
      v27 = 0;
      goto LABEL_55;
    case 48:
      v27 = 100;
LABEL_55:
      v1 = 42;
      goto LABEL_123;
    case 49:
      v27 = 0;
      goto LABEL_60;
    case 50:
      v4 = 98;
      goto LABEL_59;
    case 51:
      v4 = 115;
LABEL_59:
      v27 = v4;
LABEL_60:
      v1 = 71;
      goto LABEL_123;
    case 52:
      v27 = 0;
      v1 = 72;
      goto LABEL_123;
    case 53:
      v27 = 0;
      v1 = 73;
      goto LABEL_123;
    case 54:
      v27 = 0;
      v1 = 81;
      goto LABEL_123;
    case 55:
      v27 = 0;
      v1 = 82;
      goto LABEL_123;
    case 56:
      v27 = 0;
      goto LABEL_67;
    case 57:
      v27 = 109;
LABEL_67:
      v1 = 85;
      goto LABEL_123;
    case 58:
      v27 = 0;
      goto LABEL_70;
    case 59:
      v27 = 109;
LABEL_70:
      v1 = 86;
      goto LABEL_123;
    case 60:
      v27 = 0;
      goto LABEL_73;
    case 61:
      v27 = 109;
LABEL_73:
      v1 = 87;
      goto LABEL_123;
    case 62:
      v27 = 0;
      v1 = 96;
      goto LABEL_123;
    case 63:
      v27 = 0;
      v1 = 97;
      goto LABEL_123;
    case 64:
      v27 = 0;
      goto LABEL_78;
    case 65:
      v27 = 97;
LABEL_78:
      v1 = 98;
      goto LABEL_123;
    case 66:
      v27 = 0;
      goto LABEL_81;
    case 67:
      v27 = 97;
LABEL_81:
      v1 = 99;
      goto LABEL_123;
    case 68:
      v27 = 97;
      v1 = 105;
      goto LABEL_123;
    case 69:
      v27 = 0;
      v1 = 120;
      goto LABEL_123;
    case 70:
      v27 = 0;
      v1 = 127;
      goto LABEL_123;
    case 71:
      v27 = 0;
      v1 = 128;
      goto LABEL_123;
    case 72:
      v27 = 0;
      goto LABEL_88;
    case 73:
      v27 = 97;
LABEL_88:
      v1 = 171;
      goto LABEL_123;
    case 74:
      v27 = 0;
      v1 = 181;
      goto LABEL_123;
    case 75:
      v27 = 0;
      v1 = 182;
      goto LABEL_123;
    case 76:
      v27 = 0;
      v1 = 207;
      goto LABEL_123;
    case 77:
      v27 = 0;
      v1 = 210;
      goto LABEL_123;
    case 78:
      v27 = 0;
      v1 = 217;
      goto LABEL_123;
    case 79:
      v27 = 0;
      v1 = 255;
      goto LABEL_123;
    case 80:
      v27 = 0;
      v1 = 271;
      goto LABEL_123;
    case 81:
      v27 = 0;
      v1 = 272;
      goto LABEL_123;
    case 82:
      v27 = 0;
      v1 = 305;
      goto LABEL_123;
    case 83:
      v27 = 0;
      v1 = 307;
      goto LABEL_123;
    case 84:
      v27 = 0;
      v1 = 308;
      goto LABEL_123;
    case 85:
      v27 = 0;
      v1 = 310;
      goto LABEL_123;
    case 86:
      v27 = 0;
      v1 = 311;
      goto LABEL_123;
    case 87:
      v27 = 0;
      v1 = 317;
      goto LABEL_123;
    case 88:
      v27 = 0;
      v1 = 320;
      goto LABEL_123;
    case 89:
      v27 = 0;
      v1 = 348;
      goto LABEL_123;
    case 90:
      v27 = 0;
      v1 = 381;
      goto LABEL_123;
    case 91:
      v27 = 0;
      v1 = 382;
      goto LABEL_123;
    case 92:
      v27 = 0;
      v1 = 407;
      goto LABEL_123;
    case 93:
      v27 = 0;
      v1 = 408;
      goto LABEL_123;
    case 94:
      v27 = 0;
      v1 = 410;
      goto LABEL_123;
    case 95:
      v27 = 0;
      v1 = 411;
      goto LABEL_123;
    case 96:
      v27 = 0;
      v1 = 417;
      goto LABEL_123;
    case 97:
      v27 = 0;
      v1 = 420;
      goto LABEL_123;
    case 98:
      v27 = 0;
      v1 = 507;
      goto LABEL_123;
    case 99:
      v27 = 0;
      v1 = 508;
      goto LABEL_123;
    case 100:
      v27 = 0;
      v1 = 517;
      goto LABEL_123;
    case 101:
      v27 = 0;
      v1 = 522;
      goto LABEL_123;
    case 102:
      v27 = 0;
      v1 = 537;
      goto LABEL_123;
    case 103:
      v27 = 0;
      v1 = 538;
      goto LABEL_123;
    case 104:
      v27 = 0;
      v1 = 617;
      goto LABEL_123;
    case 105:
      v27 = 0;
      v1 = 620;
      goto LABEL_123;
    case 106:
      v27 = 0;
      v1 = 717;
      goto LABEL_123;
    case 107:
      v27 = 0;
      v1 = 720;
LABEL_123:
      v2 = 106;
      goto LABEL_233;
    case 108:
      v27 = 97;
      v1 = 27;
      goto LABEL_232;
    case 109:
      v27 = 97;
      v1 = 28;
      goto LABEL_232;
    case 110:
      v27 = 0;
      v1 = 41;
      goto LABEL_232;
    case 111:
      v27 = 0;
      v1 = 42;
      goto LABEL_232;
    case 112:
      v27 = 0;
      v1 = 48;
      goto LABEL_232;
    case 113:
      v27 = 0;
      v1 = 49;
      goto LABEL_232;
    case 114:
      v27 = 0;
      v1 = 51;
      goto LABEL_232;
    case 115:
      v27 = 0;
      v1 = 53;
      goto LABEL_232;
    case 116:
      v27 = 0;
      v1 = 56;
      goto LABEL_232;
    case 117:
      v27 = 0;
      v1 = 61;
      goto LABEL_232;
    case 118:
      v27 = 0;
      v1 = 64;
      goto LABEL_232;
    case 119:
      v27 = 0;
      v1 = 65;
      goto LABEL_232;
    case 120:
      v27 = 0;
      v1 = 66;
      goto LABEL_232;
    case 121:
      v27 = 0;
      v1 = 69;
      goto LABEL_232;
    case 122:
      v27 = 0;
      v1 = 71;
      goto LABEL_232;
    case 123:
      v27 = 0;
      v1 = 74;
      goto LABEL_232;
    case 124:
      v27 = 0;
      v1 = 75;
      goto LABEL_232;
    case 125:
      v27 = 0;
      v1 = 841;
      goto LABEL_232;
    case 126:
      v27 = 0;
      v1 = 102;
      goto LABEL_232;
    case 127:
      v27 = 0;
      v1 = 112;
      goto LABEL_232;
    case 128:
      v5 = 115;
      goto LABEL_146;
    case 129:
      v5 = 98;
LABEL_146:
      v27 = v5;
      v1 = 111;
      goto LABEL_232;
    case 130:
      v6 = 115;
      goto LABEL_149;
    case 131:
      v6 = 98;
LABEL_149:
      v27 = v6;
      v1 = 121;
      goto LABEL_232;
    case 132:
      v7 = 115;
      goto LABEL_152;
    case 133:
      v7 = 98;
LABEL_152:
      v27 = v7;
      v1 = 131;
      goto LABEL_232;
    case 134:
      v8 = 115;
      goto LABEL_155;
    case 135:
      v8 = 98;
LABEL_155:
      v27 = v8;
      v1 = 140;
      goto LABEL_232;
    case 136:
      v9 = 115;
      goto LABEL_158;
    case 137:
      v9 = 98;
LABEL_158:
      v27 = v9;
      v1 = 141;
      goto LABEL_232;
    case 138:
      v10 = 115;
      goto LABEL_161;
    case 139:
      v10 = 98;
LABEL_161:
      v27 = v10;
      v1 = 142;
      goto LABEL_232;
    case 140:
      v11 = 98;
      goto LABEL_164;
    case 141:
      v11 = 115;
LABEL_164:
      v27 = v11;
      v1 = 143;
      goto LABEL_232;
    case 142:
      v12 = 115;
      goto LABEL_167;
    case 143:
      v12 = 98;
LABEL_167:
      v27 = v12;
      v1 = 144;
      goto LABEL_232;
    case 144:
      v13 = 115;
      goto LABEL_170;
    case 145:
      v13 = 98;
LABEL_170:
      v27 = v13;
      v1 = 146;
      goto LABEL_232;
    case 146:
      v14 = 98;
      goto LABEL_173;
    case 147:
      v14 = 115;
LABEL_173:
      v27 = v14;
      v1 = 149;
      goto LABEL_232;
    case 148:
      v15 = 115;
      goto LABEL_176;
    case 149:
      v15 = 98;
LABEL_176:
      v27 = v15;
      v1 = 157;
      goto LABEL_232;
    case 150:
      v16 = 115;
      goto LABEL_179;
    case 151:
      v16 = 98;
LABEL_179:
      v27 = v16;
      v1 = 158;
      goto LABEL_232;
    case 152:
      v17 = 115;
      goto LABEL_182;
    case 153:
      v17 = 98;
LABEL_182:
      v27 = v17;
      v1 = 187;
      goto LABEL_232;
    case 154:
      v18 = 115;
      goto LABEL_185;
    case 155:
      v18 = 98;
LABEL_185:
      v27 = v18;
      v1 = 188;
      goto LABEL_232;
    case 156:
      v19 = 115;
      goto LABEL_188;
    case 157:
      v19 = 98;
LABEL_188:
      v27 = v19;
      v1 = 197;
      goto LABEL_232;
    case 158:
      v20 = 115;
      goto LABEL_191;
    case 159:
      v20 = 98;
LABEL_191:
      v27 = v20;
      v1 = 198;
      goto LABEL_232;
    case 160:
      v27 = 0;
      v1 = 199;
      goto LABEL_232;
    case 161:
      v21 = 115;
      goto LABEL_195;
    case 162:
      v21 = 98;
LABEL_195:
      v27 = v21;
      v1 = 207;
      goto LABEL_232;
    case 163:
      v22 = 115;
      goto LABEL_198;
    case 164:
      v22 = 98;
LABEL_198:
      v27 = v22;
      v1 = 208;
      goto LABEL_232;
    case 165:
      v23 = 115;
      goto LABEL_201;
    case 166:
      v23 = 98;
LABEL_201:
      v27 = v23;
      v1 = 217;
      goto LABEL_232;
    case 167:
      v24 = 115;
      goto LABEL_204;
    case 168:
      v24 = 98;
LABEL_204:
      v27 = v24;
      v1 = 218;
      goto LABEL_232;
    case 169:
      v27 = 0;
      v1 = 210;
      goto LABEL_232;
    case 170:
      v27 = 0;
      v1 = 101;
      goto LABEL_209;
    case 171:
      v27 = 0;
      v1 = 102;
      goto LABEL_209;
    case 172:
      v27 = 0;
      v1 = 103;
LABEL_209:
      v2 = 112;
      goto LABEL_233;
    case 173:
      v25 = 110;
      goto LABEL_212;
    case 174:
      v25 = 112;
LABEL_212:
      v27 = v25;
      v1 = 398;
      goto LABEL_229;
    case 175:
      v27 = 0;
      v1 = 456;
      goto LABEL_229;
    case 176:
      v27 = 112;
      v1 = 698;
      goto LABEL_229;
    case 177:
      v27 = 0;
      v1 = 720;
      goto LABEL_229;
    case 178:
      v27 = 0;
      v1 = 721;
      goto LABEL_229;
    case 179:
      v27 = 0;
      v1 = 734;
      goto LABEL_229;
    case 180:
      v27 = 0;
      v1 = 742;
      goto LABEL_229;
    case 181:
      v27 = 0;
      v1 = 1125;
      goto LABEL_229;
    case 182:
      v27 = 0;
      v1 = 1153;
      goto LABEL_229;
    case 183:
      v27 = 0;
      v1 = 1232;
      goto LABEL_229;
    case 184:
      v27 = 0;
      v1 = 1250;
      goto LABEL_229;
    case 185:
      v27 = 0;
      v1 = 1251;
      goto LABEL_229;
    case 186:
      v27 = 0;
      v1 = 1252;
      goto LABEL_229;
    case 187:
      v27 = 0;
      v1 = 1253;
      goto LABEL_229;
    case 188:
      snprintf(__str, 0x18uLL, "%c%d%c", 116, 698, 116);
      goto LABEL_234;
    case 189:
      v27 = 0;
      v1 = 6502;
      goto LABEL_229;
    case 190:
      v27 = 0;
      v1 = 6809;
LABEL_229:
      v2 = 116;
      goto LABEL_233;
    case 191:
      v27 = 0;
      v1 = 100;
      v2 = 113;
      goto LABEL_233;
    case 192:
      v27 = 0;
      v1 = 301;
LABEL_232:
      v2 = 110;
      goto LABEL_233;
    case 193:
      v27 = 0;
      v1 = 101;
      goto LABEL_243;
    case 194:
      v27 = 0;
      v1 = 201;
      goto LABEL_243;
    case 195:
      v27 = 0;
      v1 = 301;
      goto LABEL_243;
    case 196:
      v27 = 0;
      v1 = 401;
      goto LABEL_243;
    case 197:
      v27 = 0;
      v1 = 501;
LABEL_243:
      v2 = 118;
LABEL_233:
      snprintf(__str, 0x18uLL, "%c%d%c", v2, v1, v27);
LABEL_234:
      if (!__str[0])
        goto LABEL_236;
      result = CFStringCreateWithCString(0, __str, 0x600u);
      break;
    default:
LABEL_236:
      result = 0;
      break;
  }
  return result;
}

void CADeprecated::CAPThread::~CAPThread(CADeprecated::CAPThread *this)
{
  JUMPOUT(0x1A85D2980);
}

uint64_t CADeprecated::CAPThread::Entry(CADeprecated::CAPThread *this, void *a2)
{
  uint64_t (*v3)(_QWORD);
  uint64_t v4;

  atomic_store((unint64_t)pthread_self(), (unint64_t *)this + 1);
  if (*((_BYTE *)this + 40))
    pthread_setname_np((const char *)this + 40);
  if (*((_BYTE *)this + 121))
    CADeprecated::CAPThread::SetTimeConstraints(this, *((_DWORD *)this + 27), *((_DWORD *)this + 28), *((_DWORD *)this + 29), *((_BYTE *)this + 120));
  v3 = (uint64_t (*)(_QWORD))*((_QWORD *)this + 3);
  if (v3)
    v4 = v3(*((_QWORD *)this + 4));
  else
    v4 = 0;
  atomic_store(0, (unint64_t *)this + 1);
  if (*((_BYTE *)this + 123))
    (*(void (**)(CADeprecated::CAPThread *))(*(_QWORD *)this + 8))(this);
  return v4;
}

void CADeprecated::CAPThread::SetTimeConstraints(CADeprecated::CAPThread *this, int a2, int a3, int a4, char a5)
{
  int v6;
  _opaque_pthread_t *v7;
  thread_act_t v8;
  kern_return_t v9;
  kern_return_t v10;
  _BYTE v11[5];
  integer_t policy_info[2];
  int v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  kern_return_t v20;
  __int16 v21;
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)this + 27) = a2;
  *((_DWORD *)this + 28) = a3;
  *((_DWORD *)this + 29) = a4;
  *((_BYTE *)this + 120) = a5;
  *((_BYTE *)this + 121) = 1;
  if (atomic_load((unint64_t *)this + 1))
  {
    *(_QWORD *)policy_info = *(_QWORD *)((char *)this + 108);
    v6 = *((unsigned __int8 *)this + 120);
    v13 = *((_DWORD *)this + 29);
    v14 = v6;
    v7 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
    v8 = pthread_mach_thread_np(v7);
    v9 = thread_policy_set(v8, 2u, policy_info, 4u);
    if (v9)
    {
      v11[0] = HIBYTE(v9);
      v11[1] = BYTE2(v9);
      v11[2] = BYTE1(v9);
      v10 = v9;
      v11[3] = v9;
      v11[4] = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v16 = "CAPThread.cpp";
        v17 = 1024;
        v18 = 219;
        v19 = 1024;
        v20 = v10;
        v21 = 2080;
        v22 = v11;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  CAPThread::SetTimeConstraints: thread_policy_set failed, Error: %d (%s)", buf, 0x22u);
      }
      __break(1u);
    }
  }
}

CADeprecated::CAPThread *CADeprecated::CAPThread::CAPThread(CADeprecated::CAPThread *this, void *(*a2)(void *), void *a3, int a4, int a5, int a6, char a7, char a8, const char *a9)
{
  _opaque_pthread_t *v17;
  char *v18;

  *(_QWORD *)this = &off_1E5425418;
  *((_QWORD *)this + 1) = 0;
  v17 = pthread_self();
  *((_DWORD *)this + 4) = CADeprecated::CAPThread::getScheduledPriority(v17, 0);
  *((_QWORD *)this + 3) = a2;
  *((_QWORD *)this + 4) = a3;
  *((_DWORD *)this + 26) = 31;
  *((_DWORD *)this + 27) = a4;
  *((_DWORD *)this + 28) = a5;
  *((_DWORD *)this + 29) = a6;
  *((_BYTE *)this + 120) = a7;
  *(_WORD *)((char *)this + 121) = 1;
  v18 = (char *)this + 40;
  *((_BYTE *)this + 123) = a8;
  if (a9)
  {
    strlcpy(v18, a9, 0x40uLL);
  }
  else
  {
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)v18 = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
  }
  return this;
}

{
  return CADeprecated::CAPThread::CAPThread(this, a2, a3, a4, a5, a6, a7, a8, a9);
}

_opaque_pthread_t *CADeprecated::CAPThread::GetScheduledPriority(CADeprecated::CAPThread *this)
{
  _opaque_pthread_t *v1;

  v1 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
  return CADeprecated::CAPThread::getScheduledPriority(v1, (_opaque_pthread_t *)1);
}

_opaque_pthread_t *CADeprecated::CAPThread::GetScheduledPriority(_opaque_pthread_t *this, _opaque_pthread_t *a2)
{
  return CADeprecated::CAPThread::getScheduledPriority(this, (_opaque_pthread_t *)1);
}

void CADeprecated::CAPThread::SetPriority(CADeprecated::CAPThread *this, int a2, char a3)
{
  _opaque_pthread_t *v4;

  *((_DWORD *)this + 26) = a2;
  *((_BYTE *)this + 121) = 0;
  *((_BYTE *)this + 122) = a3;
  if (atomic_load((unint64_t *)this + 1))
  {
    v4 = (_opaque_pthread_t *)atomic_load((unint64_t *)this + 1);
    CADeprecated::CAPThread::SetPriority(v4, (_opaque_pthread_t *)*((unsigned int *)this + 26), *((unsigned __int8 *)this + 122));
  }
}

void CADeprecated::CAPThread::SetPriority(pthread_t this, _opaque_pthread_t *a2, int a3)
{
  int v3;
  thread_act_t v5;
  kern_return_t v6;
  _opaque_pthread_t *v7;
  thread_act_t v8;
  kern_return_t v9;
  kern_return_t v10;
  NSObject *v11;
  const char *v12;
  kern_return_t v13;
  integer_t policy_info;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  kern_return_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (this)
  {
    v3 = (int)a2;
    if (a3
      && (policy_info = 0, v5 = pthread_mach_thread_np(this), (v6 = thread_policy_set(v5, 1u, &policy_info, 1u)) != 0))
    {
      v13 = v6;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "CAPThread.cpp";
        v17 = 1024;
        v18 = 161;
        v19 = 1024;
        v20 = v13;
        v11 = MEMORY[0x1E0C81028];
        v12 = "%25s:%-5d  CAPThread::SetPriority: failed to set the fixed-priority policy, Error: 0x%X";
        goto LABEL_10;
      }
    }
    else
    {
      v7 = pthread_self();
      policy_info = v3 - CADeprecated::CAPThread::getScheduledPriority(v7, 0);
      v8 = pthread_mach_thread_np(this);
      v9 = thread_policy_set(v8, 3u, &policy_info, 1u);
      if (!v9)
        return;
      v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "CAPThread.cpp";
        v17 = 1024;
        v18 = 168;
        v19 = 1024;
        v20 = v10;
        v11 = MEMORY[0x1E0C81028];
        v12 = "%25s:%-5d  CAPThread::SetPriority: failed to set the precedence policy, Error: 0x%X";
LABEL_10:
        _os_log_impl(&dword_1A836D000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x18u);
      }
    }
    __break(1u);
  }
}

BOOL SharableMemoryBlock::XPCClientToken::IsValid(SharableMemoryBlock::XPCClientToken *this)
{
  return MEMORY[0x1A85D32E0](*((_QWORD *)this + 2)) != MEMORY[0x1E0C81350];
}

void SharableMemoryBlock::~SharableMemoryBlock(xpc_object_t *this)
{
  SharableMemoryBlock::~SharableMemoryBlock(this);
  JUMPOUT(0x1A85D2980);
}

{
  *this = &off_1E5425140;
  SharableMemoryBlock::Free((SharableMemoryBlock *)this);
  xpc_release(this[6]);
  this[6] = 0;
}

uint64_t LogMachError(const char *a1, uint64_t a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 136316162;
    v6 = "SharableMemory.cpp";
    v7 = 1024;
    v8 = 52;
    v9 = 2080;
    v10 = a1;
    v11 = 1024;
    v12 = a2;
    v13 = 2080;
    v14 = mach_error_string(a2);
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: 0x%x (%s)", (uint8_t *)&v5, 0x2Cu);
  }
  return a2;
}

void LogPosixError(const char *a1)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = *__error();
    v3 = 136315906;
    v4 = "SharableMemory.cpp";
    v5 = 1024;
    v6 = 58;
    v7 = 2080;
    v8 = a1;
    v9 = 1024;
    v10 = v2;
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: errno %d", (uint8_t *)&v3, 0x22u);
  }
}

uint64_t SharableMemoryBase::AllocNonShared(SharableMemoryBase *this, size_t size)
{
  void *v4;
  std::bad_alloc *exception;
  std::bad_alloc *v7;

  *((_BYTE *)this + 8) = 1;
  v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v7 = std::bad_alloc::bad_alloc(exception);
  }
  *((_QWORD *)this + 2) = size;
  *((_QWORD *)this + 3) = v4;
  if (v4)
    return 0;
  else
    return 4294967188;
}

uint64_t SharableMemoryBase::Set(uint64_t this, void *a2, uint64_t a3)
{
  *(_BYTE *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a3;
  *(_QWORD *)(this + 24) = a2;
  return this;
}

void SharableMemoryBlock::XPCClientToken::Reset(SharableMemoryBlock::XPCClientToken *this)
{
  xpc_object_t v2;
  void *v3;

  v2 = xpc_null_create();
  v3 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v2;
  xpc_release(v3);
  *((_DWORD *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::FDClientToken::Reset(SharableMemoryBlock::FDClientToken *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 4);
  if ((_DWORD)result != -1)
  {
    result = close(result);
    *((_DWORD *)this + 4) = -1;
  }
  *((_DWORD *)this + 3) = 0;
  return result;
}

void KaiserWindow::KaiserWindow(KaiserWindow *this, int a2, double a3)
{
  _DWORD *v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;

  v6 = 0;
  *(_DWORD *)this = a2;
  *((double *)this + 1) = a3;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  v7 = (a2 + 1);
  if (a2 != -1)
  {
    std::vector<float>::__vallocate[abi:ne180100]((_QWORD *)this + 2, (a2 + 1));
    v8 = (char *)*((_QWORD *)this + 3);
    bzero(v8, 4 * v7);
    *((_QWORD *)this + 3) = &v8[4 * v7];
    v6 = (_DWORD *)*((_QWORD *)this + 2);
  }
  if (a3 >= 50.0)
  {
    v9 = (a3 + -8.7) * 0.1102;
  }
  else
  {
    v9 = 0.0;
    if (a3 > 21.0)
      v9 = (a3 + -21.0) * 0.07886 + pow(a3 + -21.0, 0.4) * 0.5842;
  }
  bessi0(v9);
  if (a2)
  {
    v11 = 0;
    v12 = 1.0 / v10;
    do
    {
      bessi0(v9* sqrt(1.0- ((double)v11 - (double)((a2 - 1) >> 1))/ (double)((a2 - 1) >> 1)* (((double)v11 - (double)((a2 - 1) >> 1))/ (double)((a2 - 1) >> 1))));
      *(float *)&v13 = v12 * v13;
      v6[++v11] = LODWORD(v13);
    }
    while (a2 != v11);
  }
  *v6 = 0;
}

void sub_1A8382990(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__split_buffer<KaiserWindow>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 40;
    v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 40;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<KaiserWindow>,std::reverse_iterator<KaiserWindow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
    while (v3 != v4)
    {
      v5 = *(void **)(v3 + 16);
      if (v5)
      {
        *(_QWORD *)(v3 + 24) = v5;
        operator delete(v5);
      }
      v3 += 40;
    }
  }
  return a1;
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 62)
    std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

void bessi0(double a1)
{
  double v1;

  v1 = fabs(a1);
  if (v1 >= 3.75)
    exp(v1);
}

void KaiserWindow::~KaiserWindow(KaiserWindow *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
  {
    *((_QWORD *)this + 3) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
  {
    *((_QWORD *)this + 3) = v2;
    operator delete(v2);
  }
}

CFRunLoopSourceRef MSHCreateMachServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int perform_high;
  _DWORD *v12;
  ipc_space_t v13;
  CFRunLoopSourceRef result;
  CFRunLoopSourceContext v15;

  perform_high = a5;
  HIDWORD(v15.perform) = a5;
  v12 = malloc_type_malloc(0x18uLL, 0x1080040D2F62047uLL);
  v15.version = 1;
  v15.info = v12;
  v15.retain = 0;
  v15.release = (void (__cdecl *)(const void *))mshRelease;
  v15.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v15.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v15.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v15.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v15.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshPerform;
  v13 = *MEMORY[0x1E0C83DA0];
  if (!perform_high)
  {
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)&v15.perform + 1))
      goto LABEL_9;
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v15.perform), HIDWORD(v15.perform), 0x14u))
      goto LABEL_8;
    a4 &= ~1u;
    perform_high = HIDWORD(v15.perform);
  }
  *((_QWORD *)v12 + 1) = a6;
  *((_QWORD *)v12 + 2) = a3;
  *v12 = perform_high;
  v12[1] = a4;
  result = CFRunLoopSourceCreate(a1, a2, &v15);
  if (result)
    return result;
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 0, -1);
LABEL_8:
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 1u, -1);
  }
LABEL_9:
  free(v12);
  return 0;
}

void mshRelease(mach_port_name_t *a1)
{
  mach_port_name_t v2;
  ipc_space_t v3;
  mach_port_name_t v4;

  v2 = a1[1];
  if ((v2 & 1) == 0)
  {
    v3 = *MEMORY[0x1E0C83DA0];
    v4 = *a1;
    if ((v2 & 4) == 0)
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *a1, 0, -1);
    mach_port_mod_refs(v3, v4, 1u, -1);
  }
  free(a1);
}

CFStringRef mshCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<MSHRunLoopSource %p> {port = %x, callback = %p}"), a1, *a1, *((_QWORD *)a1 + 2));
}

BOOL mshEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t mshHash(unsigned int *a1)
{
  return *a1;
}

uint64_t mshGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t mshPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a1, a2, *(_QWORD *)(a4 + 8));
  return 0;
}

CFRunLoopSourceRef MSHCreateMIGServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int perform_high;
  _DWORD *v12;
  ipc_space_t v13;
  CFRunLoopSourceRef result;
  CFRunLoopSourceContext v15;

  perform_high = a5;
  HIDWORD(v15.perform) = a5;
  v12 = malloc_type_malloc(0x28uLL, 0x10A0040C7231A41uLL);
  v15.version = 1;
  v15.info = v12;
  v15.retain = 0;
  v15.release = (void (__cdecl *)(const void *))mshRelease;
  v15.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v15.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v15.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v15.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v15.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshMIGPerform;
  v13 = *MEMORY[0x1E0C83DA0];
  if (!perform_high)
  {
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)&v15.perform + 1))
      goto LABEL_9;
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v15.perform), HIDWORD(v15.perform), 0x14u))
      goto LABEL_8;
    a4 &= ~1u;
    perform_high = HIDWORD(v15.perform);
  }
  *v12 = perform_high;
  v12[1] = a4;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = a3;
  *((_QWORD *)v12 + 1) = a6;
  *((_QWORD *)v12 + 2) = 0;
  result = CFRunLoopSourceCreate(a1, a2, &v15);
  if (result)
    return result;
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 0, -1);
LABEL_8:
    mach_port_mod_refs(v13, HIDWORD(v15.perform), 1u, -1);
  }
LABEL_9:
  free(v12);
  return 0;
}

uint64_t MSHGetMachPortFromSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext v2;

  memset(&v2, 0, sizeof(v2));
  CFRunLoopSourceGetContext(a1, &v2);
  if (v2.version == 1)
    return ((uint64_t (*)(void *))v2.schedule)(v2.info);
  else
    return 0;
}

BOOL MSHMIGSourceSetNoSendersCallback(__CFRunLoopSource *a1, uint64_t a2, mach_port_mscount_t a3)
{
  _QWORD *info;
  BOOL v7;
  mach_port_name_t v9;
  ipc_space_t v10;
  uint64_t v11;
  kern_return_t v12;
  mach_port_t v13;
  ipc_space_t v14;
  mach_port_name_t v15;
  mach_port_mscount_t v16;
  mach_msg_type_name_t v17;
  mach_port_t previous;
  CFRunLoopSourceContext context;

  memset(&context, 0, sizeof(context));
  CFRunLoopSourceGetContext(a1, &context);
  info = context.info;
  if (context.info)
    v7 = context.version == 1;
  else
    v7 = 0;
  if (!v7)
    return 0;
  v9 = MSHGetMachPortFromSource(a1);
  previous = 0;
  v10 = *MEMORY[0x1E0C83DA0];
  v11 = info[2];
  if (a2)
  {
    if (!v11)
      goto LABEL_13;
    v12 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], v9, 70, 0, 0, 0x12u, &previous);
    if (v12)
    {
LABEL_15:
      info[2] = a2;
      goto LABEL_16;
    }
    v13 = previous;
    if (previous)
    {
      v14 = v10;
      v15 = v9;
      v16 = a3;
      v17 = 18;
    }
    else
    {
LABEL_13:
      v14 = v10;
      v15 = v9;
      v16 = a3;
      v13 = v9;
      v17 = 21;
    }
    v12 = mach_port_request_notification(v14, v15, 70, v16, v13, v17, &previous);
    goto LABEL_15;
  }
  if (!v11)
    return 0;
  info[2] = 0;
  v12 = mach_port_request_notification(v10, v9, 70, 0, 0, 0x12u, &previous);
LABEL_16:
  if (previous)
    mach_port_mod_refs(v10, previous, 2u, -1);
  return v12 == 0;
}

void MSHMIGSourceSetSendOnceCallback(__CFRunLoopSource *a1, uint64_t a2)
{
  BOOL v3;
  CFRunLoopSourceContext v4;

  memset(&v4, 0, sizeof(v4));
  CFRunLoopSourceGetContext(a1, &v4);
  if (v4.info)
    v3 = v4.version == 1;
  else
    v3 = 0;
  if (v3)
    *((_QWORD *)v4.info + 3) = a2;
}

uint64_t MSHMIGReceiveAndDispatchMessage(uint64_t a1, uint64_t a2)
{
  mach_port_t v3;
  mach_msg_size_t v4;
  mach_port_name_t v5;
  mach_msg_timeout_t v6;
  uint64_t v7;
  mach_msg_header_t *v8;
  mach_msg_option_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C80A78]();
  v8 = (mach_msg_header_t *)((char *)v14 - v7);
  v8->msgh_bits = 0;
  v8->msgh_remote_port = 0;
  v8->msgh_local_port = v3;
  *(_QWORD *)&v8->msgh_voucher_port = 0;
  if (v6)
    v9 = 117441794;
  else
    v9 = 117440514;
  v12 = mach_msg(v8, v9, 0, v4, v5, v6, 0);
  if (!(_DWORD)v12)
  {
    memset(v14, 0, sizeof(v14));
    v15 = a2;
    mshMIGPerform((uint64_t)v8, v10, v11, v14);
  }
  return v12;
}

void CACFDistributedNotification::AddObserver(CACFDistributedNotification *this, void (__cdecl *a2)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef), const __CFString *a3, const __CFString *a4, CFNotificationSuspensionBehavior a5)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, a2, a3, 0, (CFNotificationSuspensionBehavior)0);
}

void CACFDistributedNotification::RemoveObserver(CACFDistributedNotification *this, const __CFString *a2, const __CFString *a3)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, this, a2, 0);
}

void CACFDistributedNotification::PostNotification(const __CFString *this, const __CFString *a2, const __CFDictionary *a3)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v7 = 136315394;
    v8 = "CACFDistributedNotification.cpp";
    v9 = 1024;
    v10 = 52;
    v5 = MEMORY[0x1E0C81028];
    v6 = "%25s:%-5d  CACFDistributedNotification::PostNotification: distributed notifications do not support a payload";
    goto LABEL_8;
  }
  if ((a3 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v7 = 136315394;
    v8 = "CACFDistributedNotification.cpp";
    v9 = 1024;
    v10 = 53;
    v5 = MEMORY[0x1E0C81028];
    v6 = "%25s:%-5d  CACFDistributedNotification::PostNotification: distributed notifications do not support per-session delivery";
LABEL_8:
    _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v7, 0x12u);
LABEL_9:
    __break(1u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, this, 0, 0, 0);
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85D2980);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

void CAXException::~CAXException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t CAXException::what(CAXException *this)
{
  return (uint64_t)this + 8;
}

void `virtual thunk to'CAException::~CAException(CAException *this)
{
  std::exception::~exception((std::exception *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)));
}

{
  std::exception::~exception((std::exception *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)));
  JUMPOUT(0x1A85D2980);
}

uint64_t CAFileSystemUtilities::FileExistsAtPath(uint64_t a1, _BYTE *a2)
{
  void *v4;
  const char *v5;
  CFStringRef v6;
  uint64_t v7;
  char v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(char *)(a1 + 23) >= 0)
    v5 = (const char *)a1;
  else
    v5 = *(const char **)a1;
  v6 = CFStringCreateWithCString(0, v5, 0x8000100u);
  v7 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v6, &v9);
  CFRelease(v6);

  if (a2)
    *a2 = v9;
  return v7;
}

void sub_1A8383580(_Unwind_Exception *a1)
{
  void *v1;
  const void *v2;

  CFRelease(v2);

  _Unwind_Resume(a1);
}

uint64_t CAFileSystemUtilities::CreateDirectoryAtPath(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v8;
  const char *v9;
  CFStringRef v10;
  uint64_t v11;
  id v12;
  id v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(char *)(a1 + 23) >= 0)
    v9 = (const char *)a1;
  else
    v9 = *(const char **)a1;
  v10 = CFStringCreateWithCString(0, v9, 0x8000100u);
  v15 = 0;
  v11 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, a2, a3, &v15);
  v12 = v15;
  CFRelease(v10);

  if (a4)
  {
    if (v12)
      v13 = v12;
    *a4 = v12;
  }

  return v11;
}

void sub_1A8383670(_Unwind_Exception *a1)
{
  void *v1;
  const void *v2;

  CFRelease(v2);

  _Unwind_Resume(a1);
}

void CAFileSystemUtilities::ContentsOfDirectoryAtPath(uint64_t a1@<X0>, _QWORD *a2@<X1>, int64x2_t *a3@<X8>)
{
  void *v5;
  const char *v6;
  CFStringRef v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  std::string *v21;
  std::__split_buffer<std::string>::pointer v22;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer end;
  __int128 v25;
  int64x2_t v26;
  std::string *v27;
  id v28;
  id v30;
  id obj;
  void *__p[2];
  std::string::size_type v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  std::__split_buffer<std::string> v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(char *)(a1 + 23) >= 0)
    v6 = (const char *)a1;
  else
    v6 = *(const char **)a1;
  v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
  v38 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v38;
  CFRelease(v7);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i));
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v12, "UTF8String"));
        v14 = a3->u64[1];
        v13 = a3[1].u64[0];
        if (v14 >= v13)
        {
          v16 = a3->i64[0];
          v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - a3->i64[0]) >> 3);
          v18 = v17 + 1;
          if (v17 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
          v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - v16) >> 3);
          if (2 * v19 > v18)
            v18 = 2 * v19;
          if (v19 >= 0x555555555555555)
            v20 = 0xAAAAAAAAAAAAAAALL;
          else
            v20 = v18;
          v39.__end_cap_.__value_ = (std::allocator<std::string> *)&a3[1];
          if (v20)
          {
            if (v20 > 0xAAAAAAAAAAAAAAALL)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v21 = (std::string *)operator new(24 * v20);
          }
          else
          {
            v21 = 0;
          }
          begin = v21 + v17;
          v39.__first_ = v21;
          v39.__begin_ = begin;
          v39.__end_ = begin;
          v39.__end_cap_.__value_ = &v21[v20];
          if (SHIBYTE(v33) < 0)
          {
            std::string::__init_copy_ctor_external(begin, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
            v16 = a3->i64[0];
            v14 = a3->u64[1];
            begin = v39.__begin_;
            end = v39.__end_;
          }
          else
          {
            *(_OWORD *)&begin->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            begin->__r_.__value_.__r.__words[2] = v33;
            end = v21 + v17;
          }
          v22 = end + 1;
          v39.__end_ = end + 1;
          if (v14 == v16)
          {
            v26 = vdupq_n_s64(v16);
          }
          else
          {
            do
            {
              v25 = *(_OWORD *)(v14 - 24);
              begin[-1].__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 - 8);
              *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v25;
              --begin;
              *(_QWORD *)(v14 - 16) = 0;
              *(_QWORD *)(v14 - 8) = 0;
              *(_QWORD *)(v14 - 24) = 0;
              v14 -= 24;
            }
            while (v14 != v16);
            v26 = *a3;
            v22 = v39.__end_;
          }
          a3->i64[0] = (uint64_t)begin;
          a3->i64[1] = (uint64_t)v22;
          *(int64x2_t *)&v39.__begin_ = v26;
          v27 = (std::string *)a3[1].i64[0];
          a3[1].i64[0] = (uint64_t)v39.__end_cap_.__value_;
          v39.__end_cap_.__value_ = v27;
          v39.__first_ = (std::__split_buffer<std::string>::pointer)v26.i64[0];
          std::__split_buffer<std::string>::~__split_buffer(&v39);
        }
        else
        {
          if (SHIBYTE(v33) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a3->i64[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            v15 = *(_OWORD *)__p;
            *(_QWORD *)(v14 + 16) = v33;
            *(_OWORD *)v14 = v15;
          }
          v22 = (std::__split_buffer<std::string>::pointer)(v14 + 24);
          a3->i64[1] = v14 + 24;
        }
        a3->i64[1] = (uint64_t)v22;
        if (SHIBYTE(v33) < 0)
          operator delete(__p[0]);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  if (a2)
  {
    if (v30)
      v28 = v30;
    *a2 = v30;
  }

}

void sub_1A8383A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *__p, uint64_t a7, int a8, __int16 a9, char a10, char a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *__pa, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__split_buffer<std::string> *a21)
{

  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void CAFileSystemUtilities::GetTemporaryDirectoryPathString(_QWORD *a1@<X8>)
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(a1, (char *)objc_msgSend(v4, "UTF8String"));

}

void sub_1A8383C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void CAFileSystemUtilities::GetTemporaryDirectorySubpathString(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v4;
  std::string *p_p;
  std::string::size_type size;
  std::string __p;
  std::string v8;
  std::string v9;
  __int128 v10;
  std::string::size_type v11;

  CAFileSystemUtilities::GetTemporaryDirectoryPathString(&v10);
  v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v8, (uint64_t)&v10);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, a1);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v9, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    else
      v9 = v8;
    if (std::__fs::filesystem::path::__root_directory((const std::__fs::filesystem::path *)&__p).__size_)
    {
      std::string::operator=(&v9, &__p);
    }
    else
    {
      if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)&v9).__size_)
        std::string::push_back(&v9, 47);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      std::string::append(&v9, (const std::string::value_type *)p_p, size);
    }
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
      if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v9.__r_.__value_.__l.__data_);
    }
    else
    {
      *a2 = v9;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8.__r_.__value_.__l.__data_);
    if (SHIBYTE(v11) < 0)
      operator delete((void *)v10);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v10;
    a2->__r_.__value_.__r.__words[2] = v11;
  }
}

void sub_1A8383D98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (a26 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v26 - 17) < 0)
    operator delete(*(void **)(v26 - 40));
  _Unwind_Resume(exception_object);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *this, uint64_t a2)
{
  int v3;
  std::string *v4;
  std::string::size_type v5;
  std::string *v7;
  uint64_t i;
  std::string::value_type *p_p;
  uint64_t v10;
  uint64_t v11;
  std::string::value_type v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  void *__p;
  std::string::size_type v17;
  int64_t v18;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *(char *)(a2 + 23);
  if (v3 >= 0)
    v4 = (std::string *)a2;
  else
    v4 = *(std::string **)a2;
  if (v3 >= 0)
    v5 = *(unsigned __int8 *)(a2 + 23);
  else
    v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    if (v4 >= this && (std::string *)((char *)&this->__r_.__value_.__l.__data_ + 1) > v4)
    {
      if (v5 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v5 > 0x16)
      {
        v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v5 | 7) != 0x17)
          v10 = v5 | 7;
        v11 = v10 + 1;
        p_p = (std::string::value_type *)operator new(v10 + 1);
        v17 = v5;
        v18 = v11 | 0x8000000000000000;
        __p = p_p;
      }
      else
      {
        HIBYTE(v18) = v5;
        p_p = (std::string::value_type *)&__p;
      }
      do
      {
        v12 = v4->__r_.__value_.__s.__data_[0];
        v4 = (std::string *)((char *)v4 + 1);
        *p_p++ = v12;
        --v5;
      }
      while (v5);
      *p_p = 0;
      if (v18 >= 0)
        v13 = (const std::string::value_type *)&__p;
      else
        v13 = (const std::string::value_type *)__p;
      if (v18 >= 0)
        v14 = HIBYTE(v18);
      else
        v14 = v17;
      std::string::append(this, v13, v14);
      if (SHIBYTE(v18) < 0)
        operator delete(__p);
    }
    else
    {
      v7 = this;
      if (v5 >= 0x17)
      {
        std::string::__grow_by(this, 0x16uLL, v5 - 22, 0, 0, 0, 0);
        this->__r_.__value_.__l.__size_ = 0;
        v7 = this;
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
          v7 = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      for (i = 0; i != v5; ++i)
        v7->__r_.__value_.__s.__data_[i] = v4->__r_.__value_.__s.__data_[i];
      v7->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = v5;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = v5 & 0x7F;
    }
  }
  return this;
}

void sub_1A8383F78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

uint64_t CAFileSystemUtilities::GetTemporarySubDirectory@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t result;
  char v4;

  CAFileSystemUtilities::GetTemporaryDirectorySubpathString(a1, a2);
  v4 = 0;
  result = CAFileSystemUtilities::FileExistsAtPath((uint64_t)a2, &v4);
  if ((result & 1) == 0)
    return CAFileSystemUtilities::CreateDirectoryAtPath((uint64_t)a2, 1, 0, 0);
  return result;
}

void sub_1A8383FFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void swix::connection::~connection(swix::connection *this)
{
  *(_QWORD *)this = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x1A85D2980);
}

{
  *(_QWORD *)this = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

void swix::connection::configure_rebuilt_connection()
{
  std::terminate();
}

void swix::ipc_endpoint::~ipc_endpoint(swix::ipc_endpoint *this)
{
  char *v2;
  char *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E5425500;
  v2 = (char *)this + 24;
  v3 = (char *)*((_QWORD *)this + 6);
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
  *(_QWORD *)this = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  char *v2;
  char *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E5425500;
  v2 = (char *)this + 24;
  v3 = (char *)*((_QWORD *)this + 6);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
    {
LABEL_6:
      *(_QWORD *)this = &off_1E54254D8;
      std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
      JUMPOUT(0x1A85D2980);
    }
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  goto LABEL_6;
}

void swix::ipc_endpoint::configure_rebuilt_connection(uint64_t a1, xpc_connection_t *a2)
{
  _xpc_connection_s *v3;
  _QWORD aBlock[5];

  v3 = *a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN4swix12ipc_endpoint28configure_rebuilt_connectionERKN10applesauce3xpc10connectionE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_10_180;
  aBlock[4] = a1;
  swix::connection::state::set_handler(*(_QWORD *)(a1 + 8), v3, aBlock);
  xpc_connection_activate(*a2);
}

void ___ZN4swix12ipc_endpoint28configure_rebuilt_connectionERKN10applesauce3xpc10connectionE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v2;
  xpc_object_t objecta;

  v2 = *(_QWORD *)(a1 + 32);
  objecta = object;
  if (object)
    xpc_retain(object);
  else
    objecta = xpc_null_create();
  swix::ipc_endpoint::handle_event_or_error(v2, &objecta);
  xpc_release(objecta);
}

void swix::detail::watchdog_timer::transaction::~transaction(swix::detail::watchdog_timer::transaction *this)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)this + 64), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x1E0DE4F80] + 16;
}

void swix::ipc_endpoint::handle_error(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  void **v16;
  _BYTE __p[12];
  char v18;
  uint8_t buf[4];
  void **v20;
  __int16 v21;
  _BYTE *v22;
  void *v23[2];
  char v24;
  void **v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(NSObject **)(v4 + 80);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    swix::connection::description((os_unfair_lock_s **)a1, v23);
    if (v24 >= 0)
      v13 = v23;
    else
      v13 = (void **)v23[0];
    v14 = (char *)MEMORY[0x1A85D3280](*a2);
    std::string::basic_string[abi:ne180100]<0>(__p, v14);
    free(v14);
    if (v18 >= 0)
      v15 = __p;
    else
      v15 = *(_BYTE **)__p;
    *(_DWORD *)buf = 136315394;
    v20 = v13;
    v21 = 2080;
    v22 = v15;
    _os_log_error_impl(&dword_1A836D000, v5, OS_LOG_TYPE_ERROR, "connection %s : error %s", buf, 0x16u);
    if (v18 < 0)
      operator delete(*(void **)__p);
    if (v24 < 0)
      operator delete(v23[0]);
    v4 = *(_QWORD *)(a1 + 8);
  }
  v6 = *(unsigned __int8 *)(v4 + 89);
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
  {
    v25 = 0;
    goto LABEL_13;
  }
  if (v7 == a1 + 24)
  {
    v25 = v23;
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v7 + 24))(v7, v23);
    v8 = (uint64_t)v25;
    if (!v25)
      goto LABEL_13;
  }
  else
  {
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
    v25 = (void **)v8;
    if (!v8)
      goto LABEL_13;
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v8 + 48))(v8, a1, a2);
  v9 = v25;
  if (v25 == v23)
  {
    v10 = 4;
    v9 = v23;
  }
  else
  {
    if (!v25)
      goto LABEL_13;
    v10 = 5;
  }
  (*((void (**)(void))*v9 + v10))();
LABEL_13:
  if (v6)
  {
    v11 = *(_QWORD *)(a1 + 8);
    v12 = *(NSObject **)(v11 + 80);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      swix::connection::description((os_unfair_lock_s **)a1, v23);
      if (v24 >= 0)
        v16 = v23;
      else
        v16 = (void **)v23[0];
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v16;
      _os_log_error_impl(&dword_1A836D000, v12, OS_LOG_TYPE_ERROR, "auto-cancelling %s", __p, 0xCu);
      if (v24 < 0)
        operator delete(v23[0]);
      v11 = *(_QWORD *)(a1 + 8);
    }
    swix::connection::state::cancel_connection(v11, 0);
  }
}

void sub_1A8384524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void **a22)
{
  void **p_p;
  uint64_t v24;

  p_p = a22;
  if (a22 == &__p)
  {
    v24 = 4;
    p_p = &__p;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v24 = 5;
  }
  (*((void (**)(void))*p_p + v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void swix::connection::state::cancel_connection(uint64_t a1, int a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  void **v14;
  _BYTE *v15;
  void *block[2];
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  xpc_object_t object;
  void *v21;
  _BYTE buf[12];
  char v23;
  uint8_t v24[4];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)(a1 + 152);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  v5 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 160) = 0;
  os_unfair_lock_unlock(v4);
  if (v5)
  {
    swix::detail::connection_impl::get((swix::detail::connection_impl *)&v21, *(void **)(v5 + 16));
    v6 = v21;
    if (MEMORY[0x1A85D32E0](v21) == MEMORY[0x1E0C812E0])
    {
      v7 = *(NSObject **)v5;
      if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEBUG))
      {
        applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)block, *(_QWORD *)(v5 + 16));
        v14 = SHIBYTE(v17) >= 0 ? block : (void **)block[0];
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v14;
        _os_log_debug_impl(&dword_1A836D000, v7, OS_LOG_TYPE_DEBUG, "canceling connection %s", buf, 0xCu);
        if (SHIBYTE(v17) < 0)
          operator delete(block[0]);
      }
      block[0] = (void *)MEMORY[0x1E0C809B0];
      block[1] = (void *)1174405120;
      v17 = ___ZN4swix6detail15connection_impl6cancelENS_19CancellationContextE_block_invoke;
      v18 = &__block_descriptor_tmp_14;
      v19 = v5;
      object = v6;
      if (v6)
        xpc_retain(v6);
      else
        object = xpc_null_create();
      v8 = *(NSObject **)(v5 + 8);
      if (a2)
      {
        if (v8)
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
        dispatch_assert_queue_not_V2(v8);
        if (v8)
          dispatch_release(v8);
        v9 = *(NSObject **)(v5 + 8);
        if (v9)
        {
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
          dispatch_barrier_async_and_wait(v9, block);
          dispatch_release(v9);
        }
        else
        {
          dispatch_barrier_async_and_wait(0, block);
        }
      }
      else
      {
        if (v8)
          dispatch_retain(*(dispatch_object_t *)(v5 + 8));
        dispatch_assert_queue_V2(v8);
        if (v8)
          dispatch_release(v8);
        ___ZN4swix6detail15connection_impl6cancelENS_19CancellationContextE_block_invoke((uint64_t)block);
      }
      v10 = *(NSObject **)v5;
      if (os_log_type_enabled(*(os_log_t *)v5, OS_LOG_TYPE_DEBUG))
      {
        applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)buf, *(_QWORD *)(v5 + 16));
        if (v23 >= 0)
          v15 = buf;
        else
          v15 = *(_BYTE **)buf;
        *(_DWORD *)v24 = 136315138;
        v25 = v15;
        _os_log_debug_impl(&dword_1A836D000, v10, OS_LOG_TYPE_DEBUG, "proceeding after canceling %s", v24, 0xCu);
        if (v23 < 0)
          operator delete(*(void **)buf);
      }
      v11 = xpc_null_create();
      v12 = xpc_null_create();
      v13 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v11;
      xpc_release(v13);
      xpc_release(v12);
      xpc_release(object);
      object = 0;
    }
    xpc_release(v6);
  }
}

void sub_1A8384834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t object)
{
  void *v16;

  xpc_release(v16);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN4swix6detail15connection_impl6cancelENS_19CancellationContextE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void **v4;
  void *__p[2];
  char v6;
  uint8_t buf[4];
  void **v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_13);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  v3 = *(NSObject **)v2;
  if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
  {
    applesauce::xpc::connection::to_debug_string((applesauce::xpc::connection *)__p, *(_QWORD *)(v2 + 16));
    if (v6 >= 0)
      v4 = __p;
    else
      v4 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v8 = v4;
    _os_log_debug_impl(&dword_1A836D000, v3, OS_LOG_TYPE_DEBUG, "canceled connection %s", buf, 0xCu);
    if (v6 < 0)
      operator delete(__p[0]);
  }
}

xpc_object_t __copy_helper_block_e8_40c35_ZTSKN10applesauce3xpc10connectionE(uint64_t a1, uint64_t a2)
{
  void *v3;
  xpc_object_t result;

  v3 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    return xpc_retain(v3);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c35_ZTSKN10applesauce3xpc10connectionE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

uint64_t caulk::function_ref<void ()(applesauce::xpc::connection const&)>::functor_invoker<swix::connection::xpc_connection(void)::$_0>(_QWORD **a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)**a1 + 16))(**a1);
}

void swix::connection::state::rebuild_connection(uint64_t a1@<X0>, void (**a2)(uint64_t, swix::detail::connection_impl *)@<X1>, swix::detail::connection_impl *a3@<X8>)
{
  os_unfair_lock_s *v6;
  uint64_t v7;
  const applesauce::xpc::connection *v8;
  _QWORD *v9;
  uint64_t v10;
  std::string v11;
  void *__p;
  char v13;
  xpc_object_t v14;
  dispatch_object_t object;
  _BYTE v16[24];
  _BYTE *v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (os_unfair_lock_s *)(a1 + 152);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  v7 = *(_QWORD *)(a1 + 160);
  if (v7)
  {
    swix::detail::connection_impl::get(a3, *(void **)(v7 + 16));
    goto LABEL_15;
  }
  swix::connection_config::connection_config(&v11, (const swix::connection_config *)(a1 + 16));
  swix::make_connection(a3, (uint64_t)&v11);
  *(_QWORD *)(a1 + 160) = swix::detail::connection_impl::create((swix::detail::connection_impl *)&v11, (xpc_object_t *)a3, v8);
  (*a2)((uint64_t)(a2 + 1), a3);
  if (v18)
  {
    v9 = v17;
    if (v17 == v16)
    {
      v10 = 4;
      v9 = v16;
      goto LABEL_8;
    }
    if (v17)
    {
      v10 = 5;
LABEL_8:
      (*(void (**)(void))(*v9 + 8 * v10))();
    }
  }
  if (object)
    dispatch_release(object);
  xpc_release(v14);
  v14 = 0;
  if (v13 < 0)
    operator delete(__p);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
LABEL_15:
  os_unfair_lock_unlock(v6);
}

void sub_1A8384B5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void applesauce::xpc::connection::~connection(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

void swix::connection_config::~connection_config(swix::connection_config *this)
{
  swix::connection_config *v2;
  uint64_t v3;
  NSObject *v4;

  if (*((_BYTE *)this + 120))
  {
    v2 = (swix::connection_config *)*((_QWORD *)this + 14);
    if (v2 == (swix::connection_config *)((char *)this + 88))
    {
      v3 = 4;
      v2 = (swix::connection_config *)((char *)this + 88);
    }
    else
    {
      if (!v2)
        goto LABEL_7;
      v3 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
  }
LABEL_7:
  v4 = *((_QWORD *)this + 7);
  if (v4)
    dispatch_release(v4);
  xpc_release(*((xpc_object_t *)this + 6));
  *((_QWORD *)this + 6) = 0;
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

os_log_t *swix::detail::connection_impl::connection_impl(swix::connection_config const&,applesauce::xpc::connection const&)::{lambda(void *)#1}::__invoke(os_log_t *result)
{
  os_log_t *v1;
  NSObject *v2;
  NSObject *v3;
  int v4;
  os_log_t *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *result;
    if (os_log_type_enabled(*result, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = v1;
      _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEFAULT, "destructor connimpl %p", (uint8_t *)&v4, 0xCu);
    }
    xpc_release(v1[2]);
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
      dispatch_release(v3);
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

void sub_1A8384D54(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void swix::xpc_object_description(swix *this@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;

  v4 = (char *)MEMORY[0x1A85D3280](this, a2);
  std::string::basic_string[abi:ne180100]<0>(a3, v4);
  free(v4);
}

uint64_t ___ZN4swix6detail14watchdog_timerC2ENS_14timeout_configE_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t swix::detail::watchdog_timer::timer_fired(swix::detail::watchdog_timer *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 6);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

void swix::detail::watchdog_timer::~watchdog_timer(dispatch_source_t *this)
{
  NSObject *v2;
  NSObject *v3;
  swix::detail::watchdog_timer *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;

  dispatch_source_cancel(this[8]);
  dispatch_sync(this[7], &__block_literal_global_195);
  v2 = this[8];
  if (v2)
    dispatch_release(v2);
  v3 = this[7];
  if (v3)
    dispatch_release(v3);
  v4 = (swix::detail::watchdog_timer *)this[6];
  if (v4 == (swix::detail::watchdog_timer *)(this + 3))
  {
    v5 = 4;
    v4 = (swix::detail::watchdog_timer *)(this + 3);
  }
  else
  {
    if (!v4)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_10:
  v6 = (std::__shared_weak_count *)this[1];
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<swix::detail::watchdog_timer>::__on_zero_shared(uint64_t a1)
{
  swix::detail::watchdog_timer::~watchdog_timer((dispatch_source_t *)(a1 + 24));
}

void swix::connection::state::~state(swix::connection::state *this)
{
  const void *v2;
  swix::connection::state *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  swix::connection::state::cancel_connection((uint64_t)this, 1);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 168);
  v2 = (const void *)*((_QWORD *)this + 18);
  if (v2)
    _Block_release(v2);
  if (*((_BYTE *)this + 136))
  {
    v3 = (swix::connection::state *)*((_QWORD *)this + 16);
    if (v3 == (swix::connection::state *)((char *)this + 104))
    {
      v4 = 4;
      v3 = (swix::connection::state *)((char *)this + 104);
    }
    else
    {
      if (!v3)
        goto LABEL_9;
      v4 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
LABEL_9:
  v5 = *((_QWORD *)this + 9);
  if (v5)
    dispatch_release(v5);
  xpc_release(*((xpc_object_t *)this + 8));
  *((_QWORD *)this + 8) = 0;
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void std::__shared_ptr_emplace<swix::connection::state>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425778;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<swix::connection::state>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425778;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<swix::connection::state>::__on_zero_shared(uint64_t a1)
{
  swix::connection::state::~state((swix::connection::state *)(a1 + 24));
}

void swix::decode_message::~decode_message(xpc_object_t *this)
{
  xpc_release(this[1]);
  this[1] = 0;
}

void swix::connection::send_with_async_reply(uint64_t a1, swix::encode_message *a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  xpc_object_t v9;
  xpc_connection_t v10;
  char *v11;
  void **v12;
  _QWORD handler[6];
  void *__p[2];
  char v15;
  xpc_object_t message;
  xpc_connection_t connection;
  uint8_t buf[4];
  xpc_connection_t v19;
  __int16 v20;
  void **v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  swix::connection::xpc_connection((os_unfair_lock_s **)a1, (swix::detail::connection_impl *)&connection);
  swix::encode_message::xpc_message(a2, &message);
  v6 = *(_QWORD *)(a1 + 8);
  if (*(_BYTE *)(v6 + 88))
  {
    v7 = *(NSObject **)(v6 + 80);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    v9 = message;
    if (v8)
    {
      v10 = connection;
      v11 = (char *)MEMORY[0x1A85D3280](message);
      std::string::basic_string[abi:ne180100]<0>(__p, v11);
      free(v11);
      if (v15 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      *(_DWORD *)buf = 134218242;
      v19 = v10;
      v20 = 2080;
      v21 = v12;
      _os_log_impl(&dword_1A836D000, v7, OS_LOG_TYPE_DEFAULT, "%p send msg %s", buf, 0x16u);
      if (v15 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    v9 = message;
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke;
  handler[3] = &unk_1E54259F0;
  handler[4] = a3;
  handler[5] = a1;
  xpc_connection_send_message_with_reply(connection, v9, 0, handler);
  xpc_release(v9);
  xpc_release(connection);
}

void sub_1A8385290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, xpc_object_t object)
{
  void *v20;

  xpc_release(v20);
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t ___ZN4swix10connection21send_with_async_replyERKNS_14encode_messageEU13block_pointerFvPvE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v7;

  v4 = *(_QWORD *)(a1 + 40);
  v7 = object;
  if (object)
  {
    xpc_retain(object);
    v5 = object;
  }
  else
  {
    v5 = xpc_null_create();
    v7 = v5;
  }
  swix::connection::check_valid_reply(v4, &v7);
  xpc_release(v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

swix::listener *swix::listener::listener(swix::listener *this, const swix::connection_config *a2)
{
  os_unfair_lock_s **v3;
  _QWORD v5[5];
  _xpc_connection_s *v6;

  v3 = (os_unfair_lock_s **)swix::connection::connection(this, a2);
  *v3 = (os_unfair_lock_s *)off_1E5425550;
  swix::connection::xpc_connection(v3, (swix::detail::connection_impl *)&v6);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZN4swix8listenerC2ERKNS_17connection_configE_block_invoke;
  v5[3] = &__block_descriptor_tmp_8_209;
  v5[4] = this;
  swix::connection::state::set_handler(*((_QWORD *)this + 1), v6, v5);
  xpc_release(v6);
  return this;
}

void sub_1A83853E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  xpc_release(*(xpc_object_t *)(v2 - 24));
  *v1 = &off_1E54254D8;
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 1));
  _Unwind_Resume(a1);
}

void swix::ipc_interface::~ipc_interface(swix::ipc_interface *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = off_1E5425528;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

void RateRamp::RateRamp(RateRamp *this, double a2)
{
  *(double *)this = a2;
  *((double *)this + 1) = a2;
  *((_OWORD *)this + 1) = xmmword_1A839E510;
  *((_OWORD *)this + 2) = xmmword_1A839E510;
  *((_QWORD *)this + 6) = 0;
}

{
  *(double *)this = a2;
  *((double *)this + 1) = a2;
  *((_OWORD *)this + 1) = xmmword_1A839E510;
  *((_OWORD *)this + 2) = xmmword_1A839E510;
  *((_QWORD *)this + 6) = 0;
}

void RateRamp::RateRamp(RateRamp *this, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;

  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  v6 = (a5 - a4) / ((a2 + a3) * 0.5);
  *((double *)this + 4) = a6;
  *((double *)this + 5) = v6 + a6;
  v7 = 0.0;
  if (v6 != 0.0)
    v7 = (a3 - a2) / v6;
  *((double *)this + 6) = v7;
}

{
  double v6;
  double v7;

  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  v6 = (a5 - a4) / ((a2 + a3) * 0.5);
  *((double *)this + 4) = a6;
  *((double *)this + 5) = v6 + a6;
  v7 = 0.0;
  if (v6 != 0.0)
    v7 = (a3 - a2) / v6;
  *((double *)this + 6) = v7;
}

double *RateRamp::UpdateSlopeAndOutputEndTime(double *this)
{
  double v1;
  double v2;
  double v3;
  double v4;

  v1 = *this;
  v2 = this[1];
  v3 = (this[3] - this[2]) / ((*this + v2) * 0.5);
  this[5] = this[4] + v3;
  v4 = 0.0;
  if (v3 != 0.0)
    v4 = (v2 - v1) / v3;
  this[6] = v4;
  return this;
}

float64x2_t *RateRamp::RateRamp(float64x2_t *result, float64x2_t *a2, double a3, double a4, double a5)
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = vmulq_n_f64(*a2, a3);
  v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
  v7 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v6), (int8x16_t)v5, (int8x16_t)v6);
  v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
  v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7), (int8x16_t)v7, (int8x16_t)v8);
  *result = v9;
  v8.f64[0] = a2[1].f64[0];
  v10 = a2[1].f64[1];
  result[1].f64[0] = v8.f64[0];
  result[1].f64[1] = v10;
  v11 = a2[2].f64[0];
  v12 = (v10 - v8.f64[0]) / (vaddvq_f64(v9) * 0.5);
  result[2].f64[0] = v11;
  result[2].f64[1] = v11 + v12;
  v13 = 0.0;
  if (v12 != 0.0)
    v13 = (v9.f64[1] - v9.f64[0]) / v12;
  result[3].f64[0] = v13;
  return result;
}

{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = vmulq_n_f64(*a2, a3);
  v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
  v7 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, v6), (int8x16_t)v5, (int8x16_t)v6);
  v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
  v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7), (int8x16_t)v7, (int8x16_t)v8);
  *result = v9;
  v8.f64[0] = a2[1].f64[0];
  v10 = a2[1].f64[1];
  result[1].f64[0] = v8.f64[0];
  result[1].f64[1] = v10;
  v11 = a2[2].f64[0];
  v12 = (v10 - v8.f64[0]) / (vaddvq_f64(v9) * 0.5);
  result[2].f64[0] = v11;
  result[2].f64[1] = v11 + v12;
  v13 = 0.0;
  if (v12 != 0.0)
    v13 = (v9.f64[1] - v9.f64[0]) / v12;
  result[3].f64[0] = v13;
  return result;
}

double RateRamp::AdjustStartTime(RateRamp *this, double result)
{
  double v2;
  double v3;
  double v4;

  v2 = result - *((double *)this + 4);
  v3 = *((double *)this + 6) * v2;
  v4 = *(double *)this;
  *((double *)this + 2) = *((double *)this + 2) + v2 * (*(double *)this + v3 * 0.5);
  *(double *)this = v4 + v3;
  *((double *)this + 4) = result;
  return result;
}

double *RateRamp::AdjustEndTime(double *this, double a2)
{
  double v2;
  double v3;

  this[5] = a2;
  v2 = a2 - a2;
  v3 = this[1];
  this[3] = v2 * v3 + this[3];
  this[1] = v3;
  return this;
}

double RateRamp::InputTimeForOutputTime(RateRamp *this, double a2)
{
  double v2;
  double v3;
  double v4;

  v2 = *((double *)this + 5);
  if (v2 <= a2)
  {
    v4 = (a2 - v2) * *((double *)this + 1);
    v3 = *((double *)this + 3);
  }
  else
  {
    v3 = (a2 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (a2 - *((double *)this + 4)));
    v4 = *((double *)this + 2);
  }
  return v4 + v3;
}

double RateRamp::RateForOutputTime(RateRamp *this, double a2)
{
  if (*((double *)this + 5) <= a2)
    return *((double *)this + 1);
  else
    return *(double *)this + *((double *)this + 6) * (a2 - *((double *)this + 4));
}

double *RateRamp::StartAfter(double *this, const RateRamp *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = *((double *)a2 + 3);
  this[2] = v2;
  v3 = *((double *)a2 + 5);
  v4 = this[3] - v2;
  v5 = *this;
  v6 = this[1];
  v7 = v4 / ((*this + v6) * 0.5);
  this[4] = v3;
  this[5] = v3 + v7;
  v8 = 0.0;
  if (v7 != 0.0)
    v8 = (v6 - v5) / v7;
  this[6] = v8;
  return this;
}

float64x2_t RateRamp::OffsetTimes(float64x2_t *this, double a2, double a3)
{
  float64x2_t result;
  float64x2_t v4;

  result = vaddq_f64(this[1], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  v4 = vaddq_f64(this[2], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  this[1] = result;
  this[2] = v4;
  return result;
}

float64x2_t RateRamp::ScaleRates(float64x2_t *this, double a2)
{
  float64x2_t result;

  result = vmulq_n_f64(*this, a2);
  *this = result;
  return result;
}

double *RateRamp::operator=(double *result, double *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = *a2;
  v3 = a2[1];
  *result = *a2;
  result[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  result[2] = v4;
  result[3] = v5;
  v6 = a2[4];
  v7 = (v5 - v4) / ((v2 + v3) * 0.5);
  result[4] = v6;
  result[5] = v6 + v7;
  v8 = 0.0;
  if (v7 != 0.0)
    v8 = (v3 - v2) / v7;
  result[6] = v8;
  return result;
}

__n128 RateRamp::operator AURateRampStruct@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

BOOL RateRamp::IsInputTimeInRange(RateRamp *this, double a2)
{
  return *((double *)this + 2) <= a2 && *((double *)this + 3) > a2;
}

BOOL RateRamp::IsOutputTimeInRange(RateRamp *this, double a2)
{
  return *((double *)this + 4) <= a2 && *((double *)this + 5) > a2;
}

double RateRamp::OutputTimeForInputTime(RateRamp *this, double a2)
{
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double *v8;

  v2 = *((double *)this + 3);
  if (v2 <= a2)
  {
    v8 = (double *)((char *)this + 40);
    v7 = (a2 - v2) / *((double *)this + 1);
  }
  else
  {
    v3 = a2 - *((double *)this + 2);
    v4 = *((double *)this + 6);
    v5 = v4 == 0.0;
    v6 = (sqrt(*(double *)this * *(double *)this + (v4 + v4) * v3) - *(double *)this) / v4;
    v7 = v3 / *(double *)this;
    if (!v5)
      v7 = v6;
    v8 = (double *)((char *)this + 32);
  }
  return v7 + *v8;
}

uint64_t RateRamp::Segment(RateRamp *this, double a2, double *a3, double a4, RateRamp *a5)
{
  double v9;
  double v10;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v9 = *a3;
  if (*a3 > a4)
    v9 = a4;
  *a3 = v9;
  v10 = *((double *)this + 5);
  if (v10 <= a2)
  {
    *((_QWORD *)a5 + 6) = 0;
    v12 = *((_QWORD *)this + 1);
    *(_QWORD *)a5 = v12;
    *((_QWORD *)a5 + 1) = v12;
    *((double *)a5 + 4) = a2;
    v13 = *((double *)this + 1);
    v14 = (a2 - v10) * v13;
    v15 = *((double *)this + 3);
    *((double *)a5 + 2) = v14 + v15;
    v16 = floor(v10 + (v14 + a4) / v13);
    if (*a3 + a2 < v16)
      v16 = *a3 + a2;
    *((double *)a5 + 5) = v16;
    v17 = *((double *)this + 5);
    if (v17 <= v16)
    {
      v18 = v13 * (v16 - v17);
    }
    else
    {
      v15 = (v16 - *((double *)this + 4))
          * (*(double *)this + *((double *)this + 6) * 0.5 * (v16 - *((double *)this + 4)));
      v18 = *((double *)this + 2);
    }
    *((double *)a5 + 3) = v15 + v18;
    *a3 = v16 - a2;
  }
  else
  {
    if (*((double *)this + 4) > a2)
      return 0;
    *((_QWORD *)a5 + 6) = *((_QWORD *)this + 6);
    *((double *)a5 + 4) = a2;
    v19 = *((double *)this + 4);
    v20 = *((double *)this + 6) * 0.5;
    v21 = *(double *)this;
    v22 = *((double *)this + 2) + (a2 - v19) * (*(double *)this + v20 * (a2 - v19));
    *((double *)a5 + 2) = v22;
    v23 = floor(RateRamp::OutputTimeForInputTime(this, v22 + a4));
    if (v10 < v23)
      v23 = v10;
    if (*a3 + a2 < v23)
      v23 = *a3 + a2;
    *((double *)a5 + 5) = v23;
    v24 = *((double *)this + 5);
    if (v24 <= v23)
    {
      v26 = (v23 - v24) * *((double *)this + 1);
      v25 = *((double *)this + 3);
    }
    else
    {
      v25 = (v23 - v19) * (v21 + v20 * (v23 - v19));
      v26 = *((double *)this + 2);
    }
    *((double *)a5 + 3) = v25 + v26;
    *a3 = v23 - a2;
    v27 = *((double *)a5 + 4);
    v28 = *((double *)this + 5);
    if (v28 <= v27)
      v29 = *((double *)this + 1);
    else
      v29 = *(double *)this + *((double *)this + 6) * (v27 - *((double *)this + 4));
    *(double *)a5 = v29;
    v30 = *((double *)a5 + 5);
    if (v28 <= v30)
      v31 = *((double *)this + 1);
    else
      v31 = *(double *)this + *((double *)this + 6) * (v30 - *((double *)this + 4));
    *((double *)a5 + 1) = v31;
  }
  return 1;
}

double RateRamp::OutputDuration(RateRamp *this)
{
  return *((double *)this + 5) - *((double *)this + 4);
}

double RateRamp::InputDuration(RateRamp *this)
{
  return *((double *)this + 3) - *((double *)this + 2);
}

_QWORD *RampList::clear(RampList *this)
{
  _QWORD *result;
  _QWORD *v3;

  result = (_QWORD *)*((_QWORD *)this + 1);
  if (result)
  {
    do
    {
      v3 = (_QWORD *)*result;
      MEMORY[0x1A85D2980]();
      *((_QWORD *)this + 1) = v3;
      result = v3;
    }
    while (v3);
  }
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  return result;
}

uint64_t RampList::Writer::push(RampList::Writer *this, const RateRamp *a2)
{
  uint64_t result;
  __int128 v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  result = operator new();
  *(_QWORD *)result = 0;
  v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(result + 8) = *(_OWORD *)a2;
  *(_OWORD *)(result + 24) = v5;
  *(_OWORD *)(result + 40) = *((_OWORD *)a2 + 2);
  *(_QWORD *)(result + 56) = *((_QWORD *)a2 + 6);
  v6 = (_QWORD *)*((_QWORD *)this + 1);
  v8 = v6[1];
  v7 = (_QWORD *)v6[2];
  v6[2] = result;
  if (!v8)
    v6[1] = result;
  ++v6[3];
  __dmb(0xBu);
  if (v7)
    v6 = v7;
  *v6 = result;
  return result;
}

uint64_t RampList::Writer::front(RampList::Writer *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 1) + 8) + 8;
}

{
  return *(_QWORD *)(*((_QWORD *)this + 1) + 8) + 8;
}

uint64_t RampList::Writer::back(RampList::Writer *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16) + 8;
}

{
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16) + 8;
}

uint64_t RampList::Reader::front(RampList::Reader *this)
{
  return **((_QWORD **)this + 1) + 8;
}

{
  return **((_QWORD **)this + 1) + 8;
}

uint64_t RampList::Reader::AdvanceOutputTime(uint64_t this, double a2)
{
  double **v2;
  double *v3;
  double *v4;

  v2 = *(double ***)(this + 8);
  v3 = *v2;
  if (*v2)
  {
    do
    {
      v4 = v3;
      v3 = *(double **)v3;
    }
    while (v3 && v4[6] < a2);
    *v2 = v4;
  }
  return this;
}

uint64_t RampList::Reader::Segment(RampList::Reader *this, double a2, double *a3, double a4, RateRamp *a5)
{
  uint64_t *v5;
  _QWORD *v6;

  v5 = **(uint64_t ***)(*(_QWORD *)this + 8);
  do
  {
    v6 = v5;
    if (!v5)
      break;
    if (*((double *)v5 + 6) > a2)
      break;
    v5 = (uint64_t *)*v5;
  }
  while (*v6);
  return RateRamp::Segment((RateRamp *)(v6 + 1), a2, a3, a4, a5);
}

unsigned int RateRamp::GetNumberOfInputFrames(RateRamp *this, double a2, unsigned int a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *((double *)this + 5);
  if (v3 <= a2)
  {
    v5 = (a2 - v3) * *((double *)this + 1);
    v4 = *((double *)this + 3);
  }
  else
  {
    v4 = (a2 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (a2 - *((double *)this + 4)));
    v5 = *((double *)this + 2);
  }
  v6 = (double)a3 + a2;
  if (v3 <= v6)
  {
    v8 = (v6 - v3) * *((double *)this + 1);
    v7 = *((double *)this + 3);
  }
  else
  {
    v7 = (v6 - *((double *)this + 4)) * (*(double *)this + *((double *)this + 6) * 0.5 * (v6 - *((double *)this + 4)));
    v8 = *((double *)this + 2);
  }
  return vcvtpd_u64_f64(v7 + v8 - (v4 + v5));
}

unsigned int RampList::Reader::GetNumberOfInputFrames(RampList::Reader *this, double a2, unsigned int a3)
{
  double *v5;
  double v6;

  v5 = **(double ***)(*(_QWORD *)this + 8);
  v6 = RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(v5, a2);
  return vcvtpd_u64_f64(RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(v5, (double)a3 + a2) - v6);
}

double RampList::RampListTimeFunctions<RampList::Reader>::InputTimeForOutputTime(double *a1, double result)
{
  double *v2;
  double v3;
  double v4;
  double v5;

  if (a1)
  {
    do
    {
      v2 = a1;
      v3 = a1[6];
      if (v3 > result)
        break;
      a1 = *(double **)a1;
    }
    while (*(_QWORD *)v2);
    if (v3 <= result)
    {
      v5 = (result - v3) * v2[2];
      v4 = v2[4];
    }
    else
    {
      v4 = (result - v2[5]) * (v2[1] + v2[7] * 0.5 * (result - v2[5]));
      v5 = v2[3];
    }
    return v4 + v5;
  }
  return result;
}

uint64_t RampList::Writer::AddRamp(RampList::Writer *this, RateRamp *a2)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[7];

  v4 = *((_QWORD *)this + 1);
  v5 = *(double *)(v4 + 32);
  v7 = *((double *)a2 + 2);
  v6 = *((double *)a2 + 3);
  v8 = *(double *)a2;
  v9 = *((double *)a2 + 1);
  v10 = (v6 - v7) / ((*(double *)a2 + v9) * 0.5);
  *((double *)a2 + 4) = v5;
  *((double *)a2 + 5) = v5 + v10;
  v11 = 0.0;
  if (v10 != 0.0)
    v11 = (v9 - v8) / v10;
  *((double *)a2 + 6) = v11;
  if (*(_QWORD *)(v4 + 8))
  {
    v12 = *(double **)(v4 + 16);
    v13 = v12[4];
    if (v6 < v13)
      return 0;
    if (v7 - v13 <= 1.0)
    {
      RateRamp::StartAfter((double *)a2, (const RateRamp *)(v12 + 1));
    }
    else
    {
      v15 = v12[2];
      v16 = v12[6];
      *(double *)v24 = v15;
      *(double *)&v24[1] = v15;
      *(double *)&v24[2] = v13;
      *(double *)&v24[3] = v7;
      v17 = (v7 - v13) / ((v15 + v15) * 0.5);
      v18 = v16 + v17;
      *(double *)&v24[4] = v16;
      *(double *)&v24[5] = v16 + v17;
      v19 = 0.0;
      v20 = 0.0;
      if (v17 != 0.0)
        v20 = (v15 - v15) / v17;
      *(double *)&v24[6] = v20;
      RampList::Writer::push(this, (const RateRamp *)v24);
      *((double *)a2 + 2) = v7;
      v21 = *(double *)a2;
      v22 = *((double *)a2 + 1);
      v23 = (*((double *)a2 + 3) - v7) / ((*(double *)a2 + v22) * 0.5);
      *((double *)a2 + 4) = v18;
      *((double *)a2 + 5) = v18 + v23;
      if (v23 != 0.0)
        v19 = (v22 - v21) / v23;
      *((double *)a2 + 6) = v19;
    }
  }
  RampList::Writer::push(this, a2);
  *(_QWORD *)(*((_QWORD *)this + 1) + 32) = *((_QWORD *)a2 + 5);
  return 1;
}

_QWORD *RampList::Writer::AddRamps(RampList::Writer *a1, int a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v7;
  _QWORD *result;
  double *v10;
  const double *v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  float64x2_t v23;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v28;
  float64_t v29;
  float64_t v30;
  __int128 v31;
  double v32;

  LODWORD(v7) = a2;
  result = RampList::Writer::AdvanceOutputTime(a1);
  if ((_DWORD)v7)
  {
    v7 = v7;
    v25 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
    v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a6, 0);
    v10 = (double *)(a3 + 32);
    v23 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    do
    {
      v11 = (const double *)(*((_QWORD *)a1 + 1) + 40);
      v12 = vld1q_dup_f64(v11);
      v13 = *(float64x2_t *)(v10 - 4);
      v14 = vaddq_f64(v12, *(float64x2_t *)(v10 - 2));
      *((float64x2_t *)v10 - 1) = v14;
      v15 = vmulq_n_f64(v13, a6);
      v16 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v15, v25), (int8x16_t)v15, (int8x16_t)v25);
      v17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v23, v16), (int8x16_t)v16, (int8x16_t)v23);
      v28 = v17;
      v13.f64[0] = *(v10 - 1);
      v18 = *v10;
      v29 = v14.f64[0];
      v30 = v13.f64[0];
      v19 = (v13.f64[0] - v14.f64[0]) / (vaddvq_f64(v17) * 0.5);
      *(double *)&v31 = v18;
      *((double *)&v31 + 1) = v18 + v19;
      v20 = 0.0;
      if (v19 != 0.0)
        v20 = (v17.f64[1] - v17.f64[0]) / v19;
      v32 = v20;
      result = (_QWORD *)RampList::Writer::AddRamp(a1, (RateRamp *)&v28);
      v21 = v31;
      *((float64x2_t *)v10 - 2) = vdivq_f64(v28, v26);
      *(_OWORD *)v10 = v21;
      v10 += 6;
      --v7;
    }
    while (v7);
  }
  return result;
}

_QWORD *RampList::Writer::AdvanceOutputTime(RampList::Writer *this)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  v3 = (_QWORD *)**((_QWORD **)this + 1);
  result = *(_QWORD **)(*((_QWORD *)this + 1) + 8);
  if (result != v3)
  {
    do
    {
      v4 = (_QWORD *)*result;
      MEMORY[0x1A85D2980]();
      v5 = (_QWORD *)*((_QWORD *)this + 1);
      --v5[3];
      v5[1] = v4;
      result = v4;
    }
    while (v4 != (_QWORD *)*v5);
  }
  return result;
}

uint64_t RampList::Writer::GetRamps(uint64_t result, unsigned int *a2, uint64_t a3, double a4)
{
  unint64_t v4;
  uint64_t *v5;
  BOOL v6;
  _OWORD *v7;
  unint64_t v8;
  float64x2_t v9;
  __int128 v10;

  v4 = *a2;
  v5 = *(uint64_t **)(*(_QWORD *)(result + 8) + 8);
  if ((_DWORD)v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (_OWORD *)(a3 + 32);
    v8 = 1;
    do
    {
      v9 = *(float64x2_t *)(v5 + 1);
      v10 = *(_OWORD *)(v5 + 5);
      *(v7 - 1) = *(_OWORD *)(v5 + 3);
      *v7 = v10;
      *(v7 - 2) = vmulq_n_f64(v9, a4);
      if (v8 >= v4)
        break;
      v5 = (uint64_t *)*v5;
      ++v8;
      v7 += 3;
    }
    while (v5);
  }
  return result;
}

uint64_t RampList::Writer::SetOrigin(uint64_t this, double a2, double a3)
{
  uint64_t v3;
  uint64_t *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;

  v3 = *(_QWORD *)(this + 8);
  v4 = *(uint64_t **)(v3 + 8);
  if (v4)
  {
    v5 = *(double *)(v3 + 40);
    v6 = *(double *)(v3 + 48);
    *(double *)(v3 + 40) = a2;
    *(double *)(v3 + 48) = a3;
    *(double *)&v7 = a2 - v5;
    v8 = a3 - v6;
    v9 = (float64x2_t)vdupq_lane_s64(v7, 0);
    v10 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v8, 0);
    do
    {
      *(float64x2_t *)(v4 + 3) = vaddq_f64(v9, *(float64x2_t *)(v4 + 3));
      *(float64x2_t *)(v4 + 5) = vaddq_f64(v10, *(float64x2_t *)(v4 + 5));
      v4 = (uint64_t *)*v4;
    }
    while (v4);
    *(double *)(v3 + 32) = v8 + *(double *)(v3 + 32);
  }
  else
  {
    *(double *)(v3 + 32) = a3;
  }
  return this;
}

uint64_t RampList::Writer::ScaleRates(uint64_t this, double a2)
{
  uint64_t *i;

  for (i = *(uint64_t **)(*(_QWORD *)(this + 8) + 8); i; i = (uint64_t *)*i)
    *(float64x2_t *)(i + 1) = vmulq_n_f64(*(float64x2_t *)(i + 1), a2);
  return this;
}

uint64_t RampList::Writer::Print(uint64_t this, __sFILE *a2)
{
  _QWORD *i;

  for (i = *(_QWORD **)(*(_QWORD *)(this + 8) + 8); i; i = (_QWORD *)*i)
    this = RateRamp::Print((RateRamp *)(i + 1), a2);
  return this;
}

uint64_t RateRamp::Print(RateRamp *this, __sFILE *a2)
{
  fprintf(a2, "RateRamp %p\n", this);
  fprintf(a2, "    StartingRate              %12.6f\n", *(double *)this);
  fprintf(a2, "    EndingRate                %12.6f\n", *((double *)this + 1));
  fprintf(a2, "    StartingInputSampleTime   %12.2f\n", *((double *)this + 2));
  fprintf(a2, "    EndingInputSampleTime     %12.2f\n", *((double *)this + 3));
  fprintf(a2, "    StartingOutputSampleTime  %12.2f\n", *((double *)this + 4));
  fprintf(a2, "    EndingOutputSampleTime    %12.2f\n", *((double *)this + 5));
  return fprintf(a2, "    Slope                     %12.6f\n", *((double *)this + 6));
}

uint64_t RampList::Reader::Print(uint64_t this, __sFILE *a2)
{
  _QWORD *i;

  for (i = **(_QWORD ***)(this + 8); i; i = (_QWORD *)*i)
    this = RateRamp::Print((RateRamp *)(i + 1), a2);
  return this;
}

BOOL CACFDictionary::HasKey(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(*this, a2) != 0;
}

const __CFDictionary *CACFDictionary::Size(const __CFDictionary **this)
{
  const __CFDictionary *result;

  result = *this;
  if (result)
    return (const __CFDictionary *)CFDictionaryGetCount(result);
  return result;
}

void CACFDictionary::GetKeys(CFDictionaryRef *this, const void **a2)
{
  CFDictionaryGetKeysAndValues(*this, a2, 0);
}

void CACFDictionary::GetKeysAndValues(CFDictionaryRef *this, const void **a2, const void **a3)
{
  CFDictionaryGetKeysAndValues(*this, a2, a3);
}

const __CFDictionary *CACFDictionary::GetCFType(const __CFDictionary **this, const __CFString *a2, const void **a3)
{
  const __CFDictionary *result;
  const void *Value;

  result = *this;
  if (result)
  {
    Value = CFDictionaryGetValue(result, a2);
    *a3 = Value;
    return (const __CFDictionary *)(Value != 0);
  }
  return result;
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetSInt64(CACFDictionary *this, const __CFString *a2, uint64_t *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat32FromString(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;
  float DoubleValue;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        DoubleValue = CFStringGetDoubleValue(v5);
        *a3 = DoubleValue;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetUInt32FromString(CACFDictionary *this, const __CFString *a2, SInt32 *a3)
{
  uint64_t result;
  const __CFString *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFString *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = CFStringGetIntValue(v5);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFloat64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  float v7;
  int valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        v7 = 1.0;
        if (valuePtr < 0)
          v7 = -1.0;
        *a3 = v7
            * (float)((float)((float)(unsigned __int16)(valuePtr * (int)v7) * 0.000015259)
                    + (float)(((valuePtr * (int)v7) >> 16) & 0x7FFF));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t valuePtr;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        *a3 = (double)valuePtr * 2.32830644e-10 + (double)(valuePtr >> 32);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::Get4CC(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  CFTypeID v7;
  char buffer[4];

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFNumber *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, buffer, 5, 0x600u);
        *a3 = bswap32(*(unsigned int *)buffer);
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t CACFDictionary::GetData(CACFDictionary *this, const __CFString *a2, const __CFData **a3)
{
  uint64_t result;
  const __CFData *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFData *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFDataGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::GetURL(CACFDictionary *this, const __CFString *a2, const __CFURL **a3)
{
  uint64_t result;
  const __CFURL *v5;
  CFTypeID v6;

  result = *(_QWORD *)this;
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    if (result)
    {
      v5 = (const __CFURL *)result;
      v6 = CFGetTypeID((CFTypeRef)result);
      if (v6 == CFURLGetTypeID())
      {
        *a3 = v5;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFDictionary::GetCFTypeWithCStringKey(CFDictionaryRef *this, const char *a2, const void **a3)
{
  CFStringRef v5;
  const void *Value;
  _BOOL8 v7;
  CFStringRef v9;
  char v10;

  if (!*this)
    return 0;
  v5 = CFStringCreateWithCString(0, a2, 0x600u);
  v9 = v5;
  v10 = 1;
  if (v5 && *this)
  {
    Value = CFDictionaryGetValue(*this, v5);
    *a3 = Value;
    v7 = Value != 0;
  }
  else
  {
    v7 = 0;
  }
  CACFString::~CACFString((CACFString *)&v9);
  return v7;
}

void sub_1A8386978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

const __CFDictionary *CACFDictionary::GetCACFArray(const __CFDictionary **this, const __CFString *a2, CACFArray *a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  CACFArray::operator=((uint64_t)a3, 0);
  result = *this;
  if (*this)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::operator=(uint64_t a1, const void *a2)
{
  const void *v4;
  int v5;

  if (!*(_BYTE *)(a1 + 8))
  {
    *(_QWORD *)a1 = a2;
    *(_BYTE *)(a1 + 9) = 0;
    return a1;
  }
  v4 = *(const void **)a1;
  if (!*(_QWORD *)a1)
  {
    *(_QWORD *)a1 = a2;
    *(_BYTE *)(a1 + 9) = 0;
    if (!a2)
      return a1;
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  v5 = *(unsigned __int8 *)(a1 + 8);
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 9) = 0;
  if (a2 && v5)
    goto LABEL_8;
  return a1;
}

const __CFDictionary *CACFDictionary::GetCACFDictionary(const __CFDictionary **this, const __CFString *a2, CACFDictionary *a3)
{
  const __CFDictionary *result;
  const __CFDictionary *v7;
  CFTypeID v8;

  CACFArray::operator=((uint64_t)a3, 0);
  result = *this;
  if (*this)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v7 = result;
      v8 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFDictionaryGetTypeID();
      if ((const __CFDictionary *)v8 == result)
        return (const __CFDictionary *)CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *key, int a3)
{
  const void **v5;
  const void *v6;
  __CFDictionary *v7;
  BOOL v8;
  uint64_t v9;
  const void *v11;
  char v12;

  v5 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v5 = (const void **)MEMORY[0x1E0C9AE40];
  v6 = *v5;
  v11 = v6;
  v12 = 1;
  if (v6)
    CFRetain(v6);
  if (!*((_BYTE *)this + 9) || ((v7 = *(__CFDictionary **)this, v6) ? (v8 = v7 == 0) : (v8 = 1), v8))
  {
    v9 = 0;
  }
  else
  {
    CFDictionarySetValue(v7, key, v6);
    v9 = 1;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v9;
}

void sub_1A8386B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddCFType(CACFDictionary *this, const __CFString *a2, const void *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddSInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386C74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFNumber::~CACFNumber(CACFNumber *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

uint64_t CACFDictionary::AddUInt32(CFMutableDictionaryRef *this, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386D4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddSInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386DEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt64(CFMutableDictionaryRef *this, const __CFString *a2, uint64_t a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386E8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat32(CFMutableDictionaryRef *this, const __CFString *a2, float a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  float valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386F2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat64(CFMutableDictionaryRef *this, const __CFString *a2, double a3)
{
  CFNumberRef v5;
  uint64_t v6;
  CFNumberRef v8;
  char v9;
  double valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (*((_BYTE *)this + 9))
  {
    v6 = 0;
    if (v5 && *this)
    {
      CFDictionarySetValue(*this, a2, v5);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return v6;
}

void sub_1A8386FCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddNumber(CACFDictionary *this, const __CFString *a2, const __CFNumber *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddData(CACFDictionary *this, const __CFString *a2, const __CFData *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddURL(CACFDictionary *this, const __CFString *a2, const __CFURL *a3)
{
  uint64_t result;
  __CFDictionary *v5;

  if (!*((_BYTE *)this + 9))
    return 0;
  result = 0;
  if (a3)
  {
    v5 = *(__CFDictionary **)this;
    if (v5)
    {
      CFDictionarySetValue(v5, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddCFTypeWithCStringKey(CFMutableDictionaryRef *this, const char *a2, const void *a3)
{
  CFStringRef v5;
  uint64_t v6;
  CFStringRef v8;
  char v9;

  if (!a2)
    return 0;
  v5 = CFStringCreateWithCString(0, a2, 0x600u);
  v8 = v5;
  v9 = 1;
  if (v5 && *((_BYTE *)this + 9))
  {
    v6 = 0;
    if (a3 && *this)
    {
      CFDictionarySetValue(*this, v5, a3);
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_1A83871F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddCString(CFMutableDictionaryRef *this, const __CFString *a2, const char *cStr)
{
  CFStringRef v5;
  uint64_t v6;
  CFStringRef v8;
  char v9;

  if (!cStr)
    return 0;
  v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  v8 = v5;
  v9 = 1;
  if (v5 && *((_BYTE *)this + 9) && *this)
  {
    CFDictionarySetValue(*this, a2, v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  CACFString::~CACFString((CACFString *)&v8);
  return v6;
}

void sub_1A8387290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFString::~CACFString((CACFString *)&a9);
  _Unwind_Resume(a1);
}

void CACFDictionary::PrintToLog(CACFDictionary *this, const __CFString *a2)
{
  unint64_t Count;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  CFTypeID v9;
  unsigned int v10;

  Count = CFDictionaryGetCount(this);
  if (Count)
  {
    v5 = Count;
    if (Count >> 61)
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    v6 = operator new(8 * Count);
    bzero(v6, 8 * v5);
    v7 = operator new(8 * v5);
    bzero(v7, 8 * v5);
    CFDictionaryGetKeysAndValues(this, (const void **)v6, (const void **)v7);
    for (i = 0; i != v5; ++i)
    {
      CACFString::PrintToLog(*((const __CFString **)v6 + i), a2);
      v9 = CFGetTypeID(*((CFTypeRef *)v7 + i));
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog(*((CACFBoolean **)v7 + i), (const __CFBoolean *)((_DWORD)a2 + 1));
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog(*((CACFNumber **)v7 + i), (const __CFNumber *)((_DWORD)a2 + 1));
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(*((const __CFString **)v7 + i), (const __CFString *)((_DWORD)a2 + 1));
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog(*((CACFDictionary **)v7 + i), (const __CFDictionary *)((_DWORD)a2 + 1), v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog(*((CACFArray **)v7 + i), (const __CFArray *)((_DWORD)a2 + 1));
      }
    }
    operator delete(v7);
    operator delete(v6);
  }
}

void sub_1A8387408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void RamstadKernel::RamstadKernel(RamstadKernel *this, int a2, int a3, double a4, int a5)
{
  double v6;
  char **v7;
  int v8;
  char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  _OWORD v14[27];
  uint64_t v15;
  _OWORD v16[2];

  *(double *)this = a4;
  v6 = 1.0 / (double)a3;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  memset(v16, 0, sizeof(v16));
  v15 = 0;
  v7 = (char **)((char *)this + 40);
  v8 = a5 + a3;
  memset(v14, 0, sizeof(v14));
  if (a2 > 10)
  {
    *((_DWORD *)this + 2) = 11;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 2, 0, 4uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, *v7, 4 * v8, (char *)v16);
    v11 = *((_QWORD *)this + 2);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v14, (float *)v11, (float *)(v11 + 64), *(double *)this);
    *(_OWORD *)(v11 + 48) = *(_OWORD *)(v11 + 32);
    *(_OWORD *)(v11 + 112) = *(_OWORD *)(v11 + 96);
    if (v8 >= 1)
    {
      v12 = (uint64_t)(*v7 + 64);
      v13 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)v14, (float *)(v12 - 64), (_DWORD *)v12, v13);
        *(_OWORD *)(v12 - 16) = *(_OWORD *)(v12 - 32);
        *(_OWORD *)(v12 + 48) = *(_OWORD *)(v12 + 32);
        v12 += 128;
        v13 = v6 + v13;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 8;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 2, 0, 2uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, *v7, 2 * v8, (char *)v16);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v14, *((float **)this + 2), (float *)(*((_QWORD *)this + 2) + 32), *(double *)this);
    if (v8 >= 1)
    {
      v9 = *v7;
      v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 2), (uint64_t)v14, (float *)v9, (_DWORD *)v9 + 8, v10);
        v9 += 64;
        v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_1A838763C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v5;
    operator delete(v5);
  }
  v6 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(_QWORD *a1, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  __int128 v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  char *v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  char *v38;
  char *v39;

  if (a3)
  {
    v4 = a4;
    v6 = __src;
    v9 = (char *)a1[1];
    v8 = a1[2];
    if (a3 <= (v8 - (uint64_t)v9) >> 5)
    {
      v15 = v9 - __src;
      v16 = (char *)a1[1];
      v17 = a3;
      if (a3 <= (v9 - __src) >> 5)
        goto LABEL_16;
      v18 = 0;
      v17 = v15 >> 5;
      v16 = &v9[32 * (a3 - (v15 >> 5))];
      v19 = 32 * a3 - 32 * (v15 >> 5);
      do
      {
        v20 = &v9[v18];
        v21 = *((_OWORD *)a4 + 1);
        *(_OWORD *)v20 = *(_OWORD *)a4;
        *((_OWORD *)v20 + 1) = v21;
        v18 += 32;
      }
      while (v19 != v18);
      a1[1] = v16;
      if (v9 != __src)
      {
LABEL_16:
        v22 = &__src[32 * a3];
        v23 = &v16[-32 * a3];
        v24 = v16;
        if (v23 < v9)
        {
          v24 = v16;
          do
          {
            v25 = *(_OWORD *)v23;
            v26 = *((_OWORD *)v23 + 1);
            v23 += 32;
            *(_OWORD *)v24 = v25;
            *((_OWORD *)v24 + 1) = v26;
            v24 += 32;
          }
          while (v23 < v9);
        }
        a1[1] = v24;
        if (v16 != v22)
          memmove(&v16[-32 * ((v16 - v22) >> 5)], __src, v16 - v22);
        if (v6 <= v4)
        {
          if (a1[1] <= (unint64_t)v4)
            v27 = 0;
          else
            v27 = a3;
          v4 += 32 * v27;
        }
        do
        {
          v28 = *((_OWORD *)v4 + 1);
          *(_OWORD *)v6 = *(_OWORD *)v4;
          *((_OWORD *)v6 + 1) = v28;
          v6 += 32;
          --v17;
        }
        while (v17);
      }
    }
    else
    {
      v10 = (char *)*a1;
      v11 = a3 + ((uint64_t)&v9[-*a1] >> 5);
      if (v11 >> 59)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v12 = v8 - (_QWORD)v10;
      if (v12 >> 4 > v11)
        v11 = v12 >> 4;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0)
        v13 = 0x7FFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        if (v13 >> 59)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v14 = (char *)operator new(32 * v13);
      }
      else
      {
        v14 = 0;
      }
      v29 = &v14[32 * ((v6 - v10) >> 5)];
      v30 = &v29[32 * a3];
      v31 = 32 * a3;
      v32 = v29;
      do
      {
        v33 = *((_OWORD *)v4 + 1);
        *(_OWORD *)v32 = *(_OWORD *)v4;
        *((_OWORD *)v32 + 1) = v33;
        v32 += 32;
        v31 -= 32;
      }
      while (v31);
      v34 = (char *)*a1;
      if ((char *)*a1 != v6)
      {
        v35 = v6;
        do
        {
          v36 = *((_OWORD *)v35 - 2);
          v37 = *((_OWORD *)v35 - 1);
          v35 -= 32;
          *((_OWORD *)v29 - 2) = v36;
          *((_OWORD *)v29 - 1) = v37;
          v29 -= 32;
        }
        while (v35 != v34);
        v9 = (char *)a1[1];
      }
      v38 = &v14[32 * v13];
      if (v9 != v6)
        memmove(v30, v6, v9 - v6);
      v39 = (char *)*a1;
      *a1 = v29;
      a1[1] = &v30[v9 - v6];
      a1[2] = v38;
      if (v39)
        operator delete(v39);
    }
  }
}

void ramstadPrecalculateCoeffs<float>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5, float *a6, double a7)
{
  double v9;
  uint64_t v10;
  double *v11;
  double *v12;
  double *v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  long double v20;
  double v21;
  long double v22;

  if (a1 >= 1)
  {
    v9 = a7 * 3.14159265;
    v10 = a1;
    v11 = (double *)(a2 + 8);
    v12 = (double *)(a3 + 8);
    v13 = (double *)(a4 + 176);
    do
    {
      v14 = v9 * *(v11 - 1);
      v15 = *v11;
      v11 += 2;
      v16 = v9 * v15;
      v17 = exp(v14);
      v18 = (v17 + v17) * cos(v9 * v15);
      *a5++ = v18;
      v19 = exp(v14 + v14);
      *a6++ = -v19;
      v20 = v9 * *(v12 - 1);
      v21 = *v12;
      v12 += 2;
      v22 = hypot(v20, v9 * v21);
      *(v13 - 22) = v22 + v22;
      *(v13 - 11) = atan2(v9 * v21, v20);
      *v13 = v14;
      v13[22] = v17;
      v13[11] = v16;
      ++v13;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<float>(int a1, uint64_t a2, float *a3, _DWORD *a4, double a5)
{
  uint64_t v8;
  double *v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  float v17;

  if (a1 >= 1)
  {
    v8 = a1;
    v9 = (double *)(a2 + 176);
    do
    {
      v10 = *(v9 - 22);
      v11 = v10 * exp(*v9 * a5);
      v12 = *(v9 - 11);
      v13 = v9[11];
      v14 = cos(v12 + v13 * a5);
      v15 = v9[22];
      v16 = cos(v12 - v13 + v13 * a5);
      v17 = v11 * v14;
      *a3++ = v17;
      *(float *)&v16 = v11 * -(v15 * v16);
      *a4++ = LODWORD(v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadKernelD::RamstadKernelD(RamstadKernelD *this, int a2, int a3, double a4, int a5)
{
  double v6;
  double **v7;
  int v8;
  double *v9;
  double v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  double v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[27];
  uint64_t v19;
  _OWORD v20[4];

  *(double *)this = a4;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  v6 = 1.0 / (double)a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  memset(v20, 0, sizeof(v20));
  v19 = 0;
  v7 = (double **)((char *)this + 40);
  v8 = a5 + a3;
  memset(v18, 0, sizeof(v18));
  if (a2 > 10)
  {
    *((_DWORD *)this + 2) = 11;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 2, 0, 4uLL, (char *)v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, (char *)*v7, 4 * v8, (char *)v20);
    v11 = *((_QWORD *)this + 2);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v18, (long double *)v11, (long double *)(v11 + 128), *(double *)this);
    v12 = *(_OWORD *)(v11 + 80);
    *(_OWORD *)(v11 + 96) = *(_OWORD *)(v11 + 64);
    *(_OWORD *)(v11 + 112) = v12;
    v13 = *(_OWORD *)(v11 + 208);
    *(_OWORD *)(v11 + 224) = *(_OWORD *)(v11 + 192);
    *(_OWORD *)(v11 + 240) = v13;
    if (v8 >= 1)
    {
      v14 = (uint64_t)(*v7 + 16);
      v15 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)v18, (double *)(v14 - 128), (double *)v14, v15);
        v16 = *(_OWORD *)(v14 - 48);
        *(_OWORD *)(v14 - 32) = *(_OWORD *)(v14 - 64);
        *(_OWORD *)(v14 - 16) = v16;
        v17 = *(_OWORD *)(v14 + 80);
        *(_OWORD *)(v14 + 96) = *(_OWORD *)(v14 + 64);
        *(_OWORD *)(v14 + 112) = v17;
        v14 += 256;
        v15 = v6 + v15;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 2) = 8;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 2, 0, 2uLL, (char *)v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(v7, (char *)*v7, 2 * v8, (char *)v20);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v18, *((long double **)this + 2), (long double *)(*((_QWORD *)this + 2) + 64), *(double *)this);
    if (v8 >= 1)
    {
      v9 = *v7;
      v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 2), (uint64_t)v18, v9, v9 + 8, v10);
        v9 += 16;
        v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_1A8387C40(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v5;
    operator delete(v5);
  }
  v6 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(_QWORD *a1, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  char *v35;
  unint64_t v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char *v47;
  char *v48;

  if (a3)
  {
    v4 = a4;
    v6 = __src;
    v9 = (char *)a1[1];
    v8 = a1[2];
    if (a3 <= (v8 - (uint64_t)v9) >> 6)
    {
      v15 = v9 - __src;
      v16 = (char *)a1[1];
      v17 = a3;
      if (a3 <= (v9 - __src) >> 6)
        goto LABEL_16;
      v18 = 0;
      v17 = v15 >> 6;
      v16 = &v9[64 * (a3 - (v15 >> 6))];
      v19 = (a3 << 6) - (v15 >> 6 << 6);
      do
      {
        v20 = &v9[v18];
        v22 = *(_OWORD *)a4;
        v21 = *((_OWORD *)a4 + 1);
        v23 = *((_OWORD *)a4 + 3);
        *((_OWORD *)v20 + 2) = *((_OWORD *)a4 + 2);
        *((_OWORD *)v20 + 3) = v23;
        *(_OWORD *)v20 = v22;
        *((_OWORD *)v20 + 1) = v21;
        v18 += 64;
      }
      while (v19 != v18);
      a1[1] = v16;
      if (v9 != __src)
      {
LABEL_16:
        v24 = &__src[64 * a3];
        v25 = &v16[-64 * a3];
        v26 = v16;
        if (v25 < v9)
        {
          v26 = v16;
          do
          {
            v28 = *(_OWORD *)v25;
            v27 = *((_OWORD *)v25 + 1);
            v29 = *((_OWORD *)v25 + 3);
            *((_OWORD *)v26 + 2) = *((_OWORD *)v25 + 2);
            *((_OWORD *)v26 + 3) = v29;
            *(_OWORD *)v26 = v28;
            *((_OWORD *)v26 + 1) = v27;
            v26 += 64;
            v25 += 64;
          }
          while (v25 < v9);
        }
        a1[1] = v26;
        if (v16 != v24)
          memmove(&v16[-64 * ((v16 - v24) >> 6)], __src, v16 - v24);
        if (v6 <= v4)
        {
          if (a1[1] <= (unint64_t)v4)
            v30 = 0;
          else
            v30 = a3;
          v4 += 64 * v30;
        }
        do
        {
          v32 = *(_OWORD *)v4;
          v31 = *((_OWORD *)v4 + 1);
          v33 = *((_OWORD *)v4 + 3);
          *((_OWORD *)v6 + 2) = *((_OWORD *)v4 + 2);
          *((_OWORD *)v6 + 3) = v33;
          *(_OWORD *)v6 = v32;
          *((_OWORD *)v6 + 1) = v31;
          v6 += 64;
          --v17;
        }
        while (v17);
      }
    }
    else
    {
      v10 = (char *)*a1;
      v11 = a3 + ((uint64_t)&v9[-*a1] >> 6);
      if (v11 >> 58)
        std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
      v12 = v8 - (_QWORD)v10;
      if (v12 >> 5 > v11)
        v11 = v12 >> 5;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFC0)
        v13 = 0x3FFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        if (v13 >> 58)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v14 = (char *)operator new(v13 << 6);
      }
      else
      {
        v14 = 0;
      }
      v34 = &v14[64 * ((v6 - v10) >> 6)];
      v35 = &v34[64 * a3];
      v36 = a3 << 6;
      v37 = v34;
      do
      {
        v39 = *(_OWORD *)v4;
        v38 = *((_OWORD *)v4 + 1);
        v40 = *((_OWORD *)v4 + 3);
        *((_OWORD *)v37 + 2) = *((_OWORD *)v4 + 2);
        *((_OWORD *)v37 + 3) = v40;
        *(_OWORD *)v37 = v39;
        *((_OWORD *)v37 + 1) = v38;
        v37 += 64;
        v36 -= 64;
      }
      while (v36);
      v41 = (char *)*a1;
      if ((char *)*a1 != v6)
      {
        v42 = v6;
        do
        {
          v43 = *((_OWORD *)v42 - 4);
          v42 -= 64;
          v45 = *((_OWORD *)v42 + 2);
          v44 = *((_OWORD *)v42 + 3);
          v46 = *((_OWORD *)v42 + 1);
          *((_OWORD *)v34 - 4) = v43;
          v34 -= 64;
          *((_OWORD *)v34 + 2) = v45;
          *((_OWORD *)v34 + 3) = v44;
          *((_OWORD *)v34 + 1) = v46;
        }
        while (v42 != v41);
        v9 = (char *)a1[1];
      }
      v47 = &v14[64 * v13];
      if (v9 != v6)
        memmove(v35, v6, v9 - v6);
      v48 = (char *)*a1;
      *a1 = v34;
      a1[1] = &v35[v9 - v6];
      a1[2] = v47;
      if (v48)
        operator delete(v48);
    }
  }
}

void ramstadPrecalculateCoeffs<double>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, long double *a5, long double *a6, double a7)
{
  double v9;
  uint64_t v10;
  double *v11;
  double *v12;
  double *v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  long double v20;

  if (a1 >= 1)
  {
    v9 = a7 * 3.14159265;
    v10 = a1;
    v11 = (double *)(a2 + 8);
    v12 = (double *)(a3 + 8);
    v13 = (double *)(a4 + 176);
    do
    {
      v14 = v9 * *(v11 - 1);
      v15 = *v11;
      v11 += 2;
      v16 = v9 * v15;
      v17 = exp(v14);
      *a5++ = (v17 + v17) * cos(v9 * v15);
      *a6++ = -exp(v14 + v14);
      v18 = v9 * *(v12 - 1);
      v19 = *v12;
      v12 += 2;
      v20 = hypot(v18, v9 * v19);
      *(v13 - 22) = v20 + v20;
      *(v13 - 11) = atan2(v9 * v19, v18);
      *v13 = v14;
      v13[22] = v17;
      v13[11] = v16;
      ++v13;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<double>(int a1, uint64_t a2, double *a3, double *a4, double a5)
{
  uint64_t v8;
  double *v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;

  if (a1 >= 1)
  {
    v8 = a1;
    v9 = (double *)(a2 + 176);
    do
    {
      v10 = *(v9 - 22);
      v11 = v10 * exp(*v9 * a5);
      v12 = *(v9 - 11);
      v13 = v9[11];
      v14 = cos(v12 + v13 * a5);
      v15 = v9[22];
      v16 = cos(v12 - v13 + v13 * a5);
      *a3++ = v11 * v14;
      *a4++ = v11 * -(v15 * v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, unsigned int a5)
{
  int v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  signed int v19;
  uint64_t v20;
  signed int v21;

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((double *)this + 4) = a2;
  *((double *)this + 5) = a3;
  *((_DWORD *)this + 12) = a4;
  *((_DWORD *)this + 18) = 0;
  *((_DWORD *)this + 22) = 1;
  *((_BYTE *)this + 92) = 0;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_QWORD *)this + 32) = -1;
  if (a5 <= 0x3F)
    v5 = 8;
  else
    v5 = 11;
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 14) = v5;
  *((_BYTE *)this + 93) = a5 > 0x5F;
  v6 = floor(a2);
  v7 = v6 == a2;
  v8 = a2 / a3;
  *((double *)this + 13) = dbl_1A839E520[a5 - 33 < 2];
  if (!v7 || (v9 = floor(a3), v9 != a3))
  {
    *((_QWORD *)this + 12) = 0x3E80000000000000;
    *((_BYTE *)this + 92) = 0;
    *((_DWORD *)this + 13) = 256;
    v18 = vcvtmd_s64_f64(v8);
    *((_DWORD *)this + 15) = v18;
    v19 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
    *((_DWORD *)this + 17) = v19;
    *((_QWORD *)this + 10) = (v18 << 32 >> 1) + v19;
    *((_QWORD *)this + 32) = -1;
LABEL_26:
    *((_DWORD *)this + 66) = -1;
    goto LABEL_27;
  }
  v10 = (int)v6;
  v11 = (int)v9;
  if ((int)v6 >= 0)
    v12 = (int)v6;
  else
    v12 = -v10;
  if (v11 >= 0)
    v13 = (int)v9;
  else
    v13 = -v11;
  v14 = 1;
  if (v12 >= 2 && v13 >= 2)
  {
    v14 = v13;
    do
    {
      if (v12 <= v14)
        v15 = v14;
      else
        v15 = v12;
      if (v12 < v14)
        v14 = v12;
      v12 = v15 % v14;
    }
    while ((int)(v15 % v14) > 0);
  }
  v16 = v11 / v14;
  if (v16 > 1280)
  {
    *((_QWORD *)this + 12) = 0x3E80000000000000;
    *((_BYTE *)this + 92) = 0;
    *((_DWORD *)this + 13) = 256;
    v20 = vcvtmd_s64_f64(v8);
    *((_DWORD *)this + 15) = v20;
    v21 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
    *((_DWORD *)this + 17) = v21;
    *((_QWORD *)this + 10) = (v20 << 32 >> 1) + v21;
    *((_QWORD *)this + 32) = -1;
    goto LABEL_26;
  }
  *((_BYTE *)this + 92) = 1;
  v17 = v10 / v14;
  *((_DWORD *)this + 13) = v16;
  *((_DWORD *)this + 15) = v17 / v16;
  *((_DWORD *)this + 16) = v17;
  *((_DWORD *)this + 17) = v17 % v16;
LABEL_27:
  *((_DWORD *)this + 18) = 0;
  RamstadSRC::initFilter(this, 1.0 / v8, a5);
}

void sub_1A838825C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)v1[29];
  if (v4)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  v5 = (void *)v1[26];
  if (v5)
  {
    v1[27] = v5;
    operator delete(v5);
  }
  v6 = (void *)v1[23];
  if (v6)
  {
    v1[24] = v6;
    operator delete(v6);
  }
  v7 = (void *)v1[20];
  if (v7)
  {
    v1[21] = v7;
    operator delete(v7);
  }
  v8 = (void *)v1[17];
  if (v8)
  {
    v1[18] = v8;
    operator delete(v8);
  }
  v9 = *v2;
  if (*v2)
  {
    v1[15] = v9;
    operator delete(v9);
  }
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 2));
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  _Unwind_Resume(a1);
}

char *RamstadSRC::initFilter(RamstadSRC *this, double a2, int a3)
{
  unsigned int v4;
  double v5;
  unsigned int v6;
  unint64_t v7;
  unsigned __int8 v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  BOOL v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  unsigned __int8 v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  BOOL v38;
  _QWORD *v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  _QWORD *v42;
  uint64_t v43;
  __int128 v44;
  unint64_t *v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  __int128 v60;
  unint64_t *p_shared_owners;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  int v81;
  int v82;
  double v83;
  char v84;

  if (a3 == 34)
    v4 = vcvtpd_s64_f64(*((double *)this + 4) / *((double *)this + 5));
  else
    v4 = 1;
  *((_DWORD *)this + 22) = v4;
  v5 = fmin(a2, 1.0) * *((double *)this + 13);
  v6 = *((_DWORD *)this + 12);
  if (*((_DWORD *)this + 14) == 8)
    v7 = v6;
  else
    v7 = (3 * v6 + 1) >> 1;
  if (!*((_BYTE *)this + 93))
  {
    v76 = 0u;
    v77 = 0u;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 14, *((char **)this + 14), v7, (char *)&v76);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 17, *((char **)this + 17), v7, (char *)&v76);
    {
      GetKernelFactory(void)::sFactory.__m_.__sig = 850045863;
      *(_OWORD *)GetKernelFactory(void)::sFactory.__m_.__opaque = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[16] = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[32] = 0u;
      *(_OWORD *)&GetKernelFactory(void)::sFactory.__m_.__opaque[48] = 0u;
      *(_OWORD *)&qword_1EE99C040 = 0u;
    }
    v27 = *((_DWORD *)this + 13);
    v26 = *((_DWORD *)this + 14);
    v28 = *((unsigned __int8 *)this + 92) ^ 1;
    std::mutex::lock(&GetKernelFactory(void)::sFactory);
    v30 = qword_1EE99C038;
    v29 = qword_1EE99C040;
    v31 = qword_1EE99C038;
    if (!qword_1EE99C038 && qword_1EE99C040)
LABEL_55:
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    while (1)
    {
      v32 = v30 + 40 * v29;
      if (v31 == v32)
        break;
      v33 = *(_QWORD *)(v31 + 32);
      if (!v33 || *(_QWORD *)(v33 + 8) == -1)
      {
        if (v30 > v31)
          goto LABEL_104;
        if (!v30 && v29)
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        if (v31 >= v32)
LABEL_104:
          __assert_rtn("erase", "vector.hpp", 2092, "this->priv_in_range(position)");
        if (v31 + 40 != v32)
        {
          v34 = v31;
          do
          {
            v35 = v34 + 40;
            v36 = boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v34, v34 + 40)+ 80;
            v34 = v35;
          }
          while (v36 != v32);
        }
        v37 = *(std::__shared_weak_count **)(v32 - 8);
        if (v37)
          std::__shared_weak_count::__release_weak(v37);
        v30 = qword_1EE99C038;
        v29 = --qword_1EE99C040;
      }
      else
      {
        v31 += 40;
      }
      if (v30)
        v38 = 1;
      else
        v38 = v29 == 0;
      if (!v38)
        goto LABEL_55;
    }
    v81 = v26;
    v82 = v27;
    v83 = v5;
    v84 = v28;
    v39 = (_QWORD *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v81);
    v75 = 0uLL;
    v40 = (std::__shared_weak_count *)v39[1];
    if (v40)
    {
      v41 = std::__shared_weak_count::lock(v40);
      *((_QWORD *)&v75 + 1) = v41;
      if (v41)
      {
        *(_QWORD *)&v75 = *v39;
        if ((_QWORD)v75)
        {
LABEL_96:
          std::mutex::unlock(&GetKernelFactory(void)::sFactory);
          std::shared_ptr<RamstadKernelD>::operator=[abi:ne180100]((uint64_t)this, &v75);
          v55 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
          if (!*((_QWORD *)&v75 + 1))
            goto LABEL_101;
          v71 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
          do
            v57 = __ldaxr(v71);
          while (__stlxr(v57 - 1, v71));
          goto LABEL_99;
        }
      }
    }
    else
    {
      v41 = 0;
    }
    v58 = operator new(0x58uLL);
    v58[1] = 0;
    v58[2] = 0;
    *v58 = &off_1E54256D0;
    RamstadKernel::RamstadKernel((RamstadKernel *)(v58 + 3), v26, v27, v5, v28 != 0);
    *(_QWORD *)&v80 = v59;
    *((_QWORD *)&v80 + 1) = v58;
    v60 = v80;
    v80 = 0uLL;
    v75 = v60;
    if (v41)
    {
      p_shared_owners = (unint64_t *)&v41->__shared_owners_;
      do
        v62 = __ldaxr(p_shared_owners);
      while (__stlxr(v62 - 1, p_shared_owners));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    v63 = (_QWORD *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v81);
    v64 = *((_QWORD *)&v75 + 1);
    if (*((_QWORD *)&v75 + 1))
    {
      v65 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 16);
      do
        v66 = __ldxr(v65);
      while (__stxr(v66 + 1, v65));
    }
    v67 = (std::__shared_weak_count *)v63[1];
    *v63 = v75;
    v63[1] = v64;
    if (v67)
      std::__shared_weak_count::__release_weak(v67);
    v68 = (std::__shared_weak_count *)*((_QWORD *)&v80 + 1);
    if (*((_QWORD *)&v80 + 1))
    {
      v69 = (unint64_t *)(*((_QWORD *)&v80 + 1) + 8);
      do
        v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
    goto LABEL_96;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 20, *((char **)this + 20), v7, (char *)&v76);
  _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((_QWORD *)this + 23, *((char **)this + 23), v7, (char *)&v76);
  {
    GetKernelFactoryD(void)::sFactory.__m_.__sig = 850045863;
    *(_OWORD *)GetKernelFactoryD(void)::sFactory.__m_.__opaque = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[16] = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[32] = 0u;
    *(_OWORD *)&GetKernelFactoryD(void)::sFactory.__m_.__opaque[48] = 0u;
    *(_OWORD *)&qword_1EE99BFE0 = 0u;
  }
  v10 = *((_DWORD *)this + 13);
  v9 = *((_DWORD *)this + 14);
  v11 = *((unsigned __int8 *)this + 92) ^ 1;
  std::mutex::lock(&GetKernelFactoryD(void)::sFactory);
  v13 = qword_1EE99BFD8;
  v12 = qword_1EE99BFE0;
  v14 = qword_1EE99BFD8;
  if (!qword_1EE99BFD8 && qword_1EE99BFE0)
LABEL_29:
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  while (1)
  {
    v15 = v13 + 40 * v12;
    if (v14 == v15)
      break;
    v16 = *(_QWORD *)(v14 + 32);
    if (!v16 || *(_QWORD *)(v16 + 8) == -1)
    {
      if (v13 > v14)
        goto LABEL_102;
      if (!v13 && v12)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      if (v14 >= v15)
LABEL_102:
        __assert_rtn("erase", "vector.hpp", 2092, "this->priv_in_range(position)");
      if (v14 + 40 != v15)
      {
        v17 = v14;
        do
        {
          v18 = v17 + 40;
          v19 = boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v17, v17 + 40)+ 80;
          v17 = v18;
        }
        while (v19 != v15);
      }
      v20 = *(std::__shared_weak_count **)(v15 - 8);
      if (v20)
        std::__shared_weak_count::__release_weak(v20);
      v13 = qword_1EE99BFD8;
      v12 = --qword_1EE99BFE0;
    }
    else
    {
      v14 += 40;
    }
    if (v13)
      v21 = 1;
    else
      v21 = v12 == 0;
    if (!v21)
      goto LABEL_29;
  }
  v81 = v9;
  v82 = v10;
  v83 = v5;
  v84 = v11;
  v22 = (_QWORD *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v81);
  v75 = 0uLL;
  v23 = (std::__shared_weak_count *)v22[1];
  if (!v23)
  {
    v24 = 0;
LABEL_61:
    v42 = operator new(0x58uLL);
    v42[1] = 0;
    v42[2] = 0;
    *v42 = &off_1E5425708;
    RamstadKernelD::RamstadKernelD((RamstadKernelD *)(v42 + 3), v9, v10, v5, v11 != 0);
    *(_QWORD *)&v80 = v43;
    *((_QWORD *)&v80 + 1) = v42;
    v44 = v80;
    v80 = 0uLL;
    v75 = v44;
    if (v24)
    {
      v45 = (unint64_t *)&v24->__shared_owners_;
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v47 = (_QWORD *)boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript((uint64_t)&v81);
    v48 = *((_QWORD *)&v75 + 1);
    if (*((_QWORD *)&v75 + 1))
    {
      v49 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 16);
      do
        v50 = __ldxr(v49);
      while (__stxr(v50 + 1, v49));
    }
    v51 = (std::__shared_weak_count *)v47[1];
    *v47 = v75;
    v47[1] = v48;
    if (v51)
      std::__shared_weak_count::__release_weak(v51);
    v52 = (std::__shared_weak_count *)*((_QWORD *)&v80 + 1);
    if (*((_QWORD *)&v80 + 1))
    {
      v53 = (unint64_t *)(*((_QWORD *)&v80 + 1) + 8);
      do
        v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    goto LABEL_76;
  }
  v24 = std::__shared_weak_count::lock(v23);
  *((_QWORD *)&v75 + 1) = v24;
  if (!v24)
    goto LABEL_61;
  *(_QWORD *)&v75 = *v22;
  if (!(_QWORD)v75)
    goto LABEL_61;
LABEL_76:
  std::mutex::unlock(&GetKernelFactoryD(void)::sFactory);
  std::shared_ptr<RamstadKernelD>::operator=[abi:ne180100]((uint64_t)this + 16, &v75);
  v55 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
  if (!*((_QWORD *)&v75 + 1))
    goto LABEL_101;
  v56 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
  do
    v57 = __ldaxr(v56);
  while (__stlxr(v57 - 1, v56));
LABEL_99:
  if (!v57)
  {
    ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
    std::__shared_weak_count::__release_weak(v55);
  }
LABEL_101:
  v72 = *((unsigned int *)this + 12);
  LODWORD(v76) = 0;
  std::vector<float>::assign((char **)this + 26, v72, &v76);
  v73 = *((unsigned int *)this + 12);
  LODWORD(v76) = 0;
  return std::vector<float>::assign((char **)this + 29, v73, &v76);
}

void sub_1A83889F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::mutex::unlock(&GetKernelFactory(void)::sFactory);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<RamstadKernelD>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 2;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 2;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      v17 = &v13[4 * (a2 - v14)];
      v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    v8 = v6 >> 1;
    if (v6 >> 1 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[4 * a2];
    v12 = 4 * a2;
    do
    {
      *(_DWORD *)v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

unint64_t boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  BOOL v3;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  const char *v8;
  unsigned __int8 v9;
  uint64_t v10;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  std::__shared_weak_count *v22;
  __int128 v23;
  const char *v25;
  int v26;
  const char *v27;
  const char *v28;
  char *v29;
  unint64_t v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  std::__shared_weak_count *v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v1 = qword_1EE99C038;
  v2 = qword_1EE99C040;
  if (qword_1EE99C038)
    v3 = 1;
  else
    v3 = qword_1EE99C040 == 0;
  if (!v3)
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  v5 = qword_1EE99C038;
  if (qword_1EE99C040)
  {
    v5 = qword_1EE99C038;
    v6 = qword_1EE99C040;
    do
    {
      if (v6 != 1 && !v5)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      if (!v5)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v7 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v5 + 40 * (v6 >> 1), a1);
      if (v7 != 129 && (v7 & 0x80u) != 0)
      {
        v5 += 40 * (v6 >> 1) + 40;
        v6 += ~(v6 >> 1);
      }
      else
      {
        v6 >>= 1;
      }
    }
    while (v6);
  }
  v8 = (const char *)(v1 + 40 * v2);
  if ((const char *)v5 == v8)
    goto LABEL_19;
  if (!v5)
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a1, v5);
  if (v9 != 129 && (char)v9 < 0)
  {
LABEL_19:
    v32 = *(_OWORD *)a1;
    v10 = *(_QWORD *)(a1 + 16);
    v34[0] = 0;
    v34[1] = 0;
    v33 = v10;
    if (v1 > v5 || v5 > (unint64_t)v8)
    {
      v25 = "this->priv_in_range_or_end(hint)";
      v26 = 879;
      v27 = "flat_tree.hpp";
      v28 = "insert_unique";
      goto LABEL_66;
    }
    v29 = 0;
    if ((const char *)v5 != v8)
    {
      if (!v5)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v12 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, v5);
      if (v12 == 129 || ((char)v12 & 0x80000000) == 0)
      {
        v30 = v1 + 40 * v2;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(v5, &v30, (uint64_t)&v32, (uint64_t *)&v29))goto LABEL_51;
LABEL_37:
        v15 = v29;
        v16 = qword_1EE99C038;
        if (qword_1EE99C038 > (unint64_t)v29)
          goto LABEL_63;
        v17 = qword_1EE99C040;
        if (!qword_1EE99C038 && qword_1EE99C040)
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        v18 = qword_1EE99C038 + 40 * qword_1EE99C040;
        if ((unint64_t)v29 > v18)
        {
LABEL_63:
          v25 = "this->priv_in_range_or_end(position)";
          v26 = 1862;
          v27 = "vector.hpp";
          v28 = "emplace";
        }
        else
        {
          if (qword_1EE99C048 >= (unint64_t)qword_1EE99C040)
          {
            if (qword_1EE99C048 == qword_1EE99C040)
            {
              boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>((boost::container *)&v31, v29, &v32);
            }
            else
            {
              if ((char *)v18 == v29)
              {
                v23 = v32;
                *((_QWORD *)v29 + 2) = v33;
                *(_OWORD *)v15 = v23;
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                ++qword_1EE99C040;
              }
              else
              {
                v19 = v18 - 40;
                *(_OWORD *)v18 = *(_OWORD *)(v18 - 40);
                *(_QWORD *)(v18 + 16) = *(_QWORD *)(v18 - 24);
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)(v18 - 16);
                *(_QWORD *)(v18 - 16) = 0;
                *(_QWORD *)(v18 - 8) = 0;
                ++qword_1EE99C040;
                if ((char *)(v18 - 40) != v15)
                {
                  do
                  {
                    v20 = (char *)(v19 - 40);
                    boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v19, v19 - 40);
                    v19 = (uint64_t)v20;
                  }
                  while (v20 != v15);
                }
                *(_OWORD *)v15 = v32;
                v15[16] = v33;
                v21 = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                v22 = (std::__shared_weak_count *)*((_QWORD *)v15 + 4);
                *(_OWORD *)(v15 + 24) = v21;
                if (v22)
                  std::__shared_weak_count::__release_weak(v22);
              }
              v31 = v15;
            }
            goto LABEL_54;
          }
          v25 = "this->m_holder.capacity() >= this->m_holder.m_size";
          v26 = 2821;
          v27 = "vector.hpp";
          v28 = "priv_insert_forward_range";
        }
LABEL_66:
        __assert_rtn(v28, v27, v26, v25);
      }
      v8 = (const char *)v5;
    }
    v29 = (char *)v8;
    if (v8 != (const char *)v1)
    {
      if (!v8)
        __assert_rtn("operator--", "vector.hpp", 174, "!!m_ptr");
      v13 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)(v8 - 40), (uint64_t)&v32);
      if (v13 == 129 || ((char)v13 & 0x80000000) == 0)
      {
        v14 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, (uint64_t)(v8 - 40));
        if (v14 == 129 || ((char)v14 & 0x80000000) == 0)
        {
          v29 = (char *)(v8 - 40);
          goto LABEL_51;
        }
        v31 = v8 - 40;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(v1, &v31, (uint64_t)&v32, (uint64_t *)&v29))
        {
LABEL_51:
          if (!qword_1EE99C038 && v29)
            __assert_rtn("operator+", "vector.hpp", 188, "x.m_ptr || !off");
          v31 = v29;
LABEL_54:
          if (v34[1])
            std::__shared_weak_count::__release_weak(v34[1]);
          v5 = (unint64_t)v31;
          if (!v31)
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          return v5 + 24;
        }
      }
    }
    goto LABEL_37;
  }
  return v5 + 24;
}

void sub_1A8389114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void std::__shared_ptr_emplace<RamstadKernel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54256D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<RamstadKernel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54256D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<RamstadKernel>::__on_zero_shared(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
}

uint64_t std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  BOOL v5;
  double v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  if (*(_DWORD *)a1 < *(_DWORD *)a2)
    v2 = 0xFFFFFFFFLL;
  else
    v2 = 1;
  if (*(_DWORD *)a1 == *(_DWORD *)a2)
  {
    v3 = *(_DWORD *)(a1 + 4);
    v4 = *(_DWORD *)(a2 + 4);
    v5 = v3 == v4;
    v2 = v3 < v4 ? 0xFFFFFFFFLL : 1;
    if (v5)
    {
      v6 = *(double *)(a1 + 8);
      v7 = *(double *)(a2 + 8);
      if (v6 == v7)
        LODWORD(v2) = 0;
      else
        LODWORD(v2) = -127;
      if (v6 > v7)
        LODWORD(v2) = 1;
      if (v6 < v7)
        v2 = 0xFFFFFFFFLL;
      else
        v2 = v2;
      if (!(_DWORD)v2)
      {
        v8 = *(unsigned __int8 *)(a1 + 16);
        v9 = *(unsigned __int8 *)(a2 + 16);
        v10 = v8 == v9;
        if (v8 < v9)
          LODWORD(v2) = -1;
        else
          LODWORD(v2) = 1;
        if (v10)
          return 0;
        else
          return v2;
      }
    }
  }
  return v2;
}

uint64_t boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>(boost::container *a1, const char *a2, __int128 *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _OWORD *v18;
  const char *v19;
  __int128 v20;
  uint64_t v21;
  std::__shared_weak_count **v22;

  if (qword_1EE99C048 != qword_1EE99C040)
    __assert_rtn("next_capacity", "vector.hpp", 473, "additional_objects > size_type(this->m_capacity - this->m_size)");
  if (qword_1EE99C048 == 0x333333333333333)
    goto LABEL_30;
  if ((unint64_t)qword_1EE99C048 >> 61 > 4)
    v3 = -1;
  else
    v3 = 8 * qword_1EE99C048;
  if ((unint64_t)qword_1EE99C048 >> 61)
    v4 = v3;
  else
    v4 = 8 * qword_1EE99C048 / 5uLL;
  if (v4 >= 0x333333333333333)
    v4 = 0x333333333333333;
  v5 = qword_1EE99C048 + 1 > v4 ? qword_1EE99C048 + 1 : v4;
  if (v5 > 0x333333333333333)
LABEL_30:
    boost::container::throw_length_error(a1, a2);
  v9 = qword_1EE99C038;
  v10 = (char *)operator new(40 * v5);
  v11 = (uint64_t)v10;
  v12 = qword_1EE99C038;
  v13 = qword_1EE99C038 + 40 * qword_1EE99C040;
  v14 = v10;
  if ((const char *)qword_1EE99C038 != a2)
  {
    v15 = qword_1EE99C038;
    v14 = v10;
    do
    {
      v16 = *(_OWORD *)v15;
      *((_QWORD *)v14 + 2) = *(_QWORD *)(v15 + 16);
      *(_OWORD *)v14 = v16;
      *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
      *(_QWORD *)(v15 + 24) = 0;
      *(_QWORD *)(v15 + 32) = 0;
      v14 += 40;
      v15 += 40;
    }
    while ((const char *)v15 != a2);
  }
  v17 = *a3;
  *((_QWORD *)v14 + 2) = *((_QWORD *)a3 + 2);
  *(_OWORD *)v14 = v17;
  *(_OWORD *)(v14 + 24) = *(__int128 *)((char *)a3 + 24);
  *((_QWORD *)a3 + 3) = 0;
  *((_QWORD *)a3 + 4) = 0;
  if ((const char *)v13 != a2)
  {
    v18 = v14 + 64;
    v19 = a2;
    do
    {
      v20 = *(_OWORD *)v19;
      *((_QWORD *)v18 - 1) = *((_QWORD *)v19 + 2);
      *(_OWORD *)((char *)v18 - 24) = v20;
      *v18 = *(_OWORD *)(v19 + 24);
      v18 = (_OWORD *)((char *)v18 + 40);
      *((_QWORD *)v19 + 3) = 0;
      *((_QWORD *)v19 + 4) = 0;
      v19 += 40;
    }
    while (v19 != (const char *)v13);
  }
  if (v12)
  {
    v21 = qword_1EE99C040;
    if (qword_1EE99C040)
    {
      v22 = (std::__shared_weak_count **)(v12 + 32);
      do
      {
        if (*v22)
          std::__shared_weak_count::__release_weak(*v22);
        v22 += 5;
        --v21;
      }
      while (v21);
    }
    operator delete((void *)qword_1EE99C038);
  }
  qword_1EE99C038 = v11;
  ++qword_1EE99C040;
  qword_1EE99C048 = v5;
  *(_QWORD *)a1 = &a2[v11 - v9];
}

void boost::container::throw_length_error(boost::container *this, const char *a2)
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(0x10uLL);
  *exception = &off_1E54255A8;
  exception[1] = "get_next_capacity, allocator's max size reached";
}

void boost::container::out_of_range::~out_of_range(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1A85D2980);
}

const char *boost::container::exception::what(boost::container::exception *this)
{
  if (*((_QWORD *)this + 1))
    return (const char *)*((_QWORD *)this + 1);
  else
    return "unknown boost::container exception";
}

BOOL boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>>>::priv_insert_unique_prepare(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v7 = a1;
  if (*a2 != a1)
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((*a2 - a1) >> 3);
    do
    {
      if (v8 != 1 && !v7)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      if (!v7)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v7 + 40 * (v8 >> 1), a3);
      if (v9 != 129 && (v9 & 0x80u) != 0)
      {
        v7 += 40 * (v8 >> 1) + 40;
        v8 += ~(v8 >> 1);
      }
      else
      {
        v8 >>= 1;
      }
    }
    while (v8);
  }
  *a4 = v7;
  if (v7 == *a2)
    return 1;
  if (!v7)
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  v10 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a3, v7);
  return v10 != 129 && (v10 & 0x80u) != 0;
}

unint64_t boost::container::flat_map<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>,std::less<std::tuple<int,int,double,BOOL>>,void>::priv_subscript(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  BOOL v3;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  const char *v8;
  unsigned __int8 v9;
  uint64_t v10;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  std::__shared_weak_count *v22;
  __int128 v23;
  const char *v25;
  int v26;
  const char *v27;
  const char *v28;
  char *v29;
  unint64_t v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  std::__shared_weak_count *v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v1 = qword_1EE99BFD8;
  v2 = qword_1EE99BFE0;
  if (qword_1EE99BFD8)
    v3 = 1;
  else
    v3 = qword_1EE99BFE0 == 0;
  if (!v3)
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  v5 = qword_1EE99BFD8;
  if (qword_1EE99BFE0)
  {
    v5 = qword_1EE99BFD8;
    v6 = qword_1EE99BFE0;
    do
    {
      if (v6 != 1 && !v5)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      if (!v5)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v7 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v5 + 40 * (v6 >> 1), a1);
      if (v7 != 129 && (v7 & 0x80u) != 0)
      {
        v5 += 40 * (v6 >> 1) + 40;
        v6 += ~(v6 >> 1);
      }
      else
      {
        v6 >>= 1;
      }
    }
    while (v6);
  }
  v8 = (const char *)(v1 + 40 * v2);
  if ((const char *)v5 == v8)
    goto LABEL_19;
  if (!v5)
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a1, v5);
  if (v9 != 129 && (char)v9 < 0)
  {
LABEL_19:
    v32 = *(_OWORD *)a1;
    v10 = *(_QWORD *)(a1 + 16);
    v34[0] = 0;
    v34[1] = 0;
    v33 = v10;
    if (v1 > v5 || v5 > (unint64_t)v8)
    {
      v25 = "this->priv_in_range_or_end(hint)";
      v26 = 879;
      v27 = "flat_tree.hpp";
      v28 = "insert_unique";
      goto LABEL_66;
    }
    v29 = 0;
    if ((const char *)v5 != v8)
    {
      if (!v5)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v12 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, v5);
      if (v12 == 129 || ((char)v12 & 0x80000000) == 0)
      {
        v30 = v1 + 40 * v2;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(v5, &v30, (uint64_t)&v32, (uint64_t *)&v29))goto LABEL_51;
LABEL_37:
        v15 = v29;
        v16 = qword_1EE99BFD8;
        if (qword_1EE99BFD8 > (unint64_t)v29)
          goto LABEL_63;
        v17 = qword_1EE99BFE0;
        if (!qword_1EE99BFD8 && qword_1EE99BFE0)
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        v18 = qword_1EE99BFD8 + 40 * qword_1EE99BFE0;
        if ((unint64_t)v29 > v18)
        {
LABEL_63:
          v25 = "this->priv_in_range_or_end(position)";
          v26 = 1862;
          v27 = "vector.hpp";
          v28 = "emplace";
        }
        else
        {
          if (qword_1EE99BFE8 >= (unint64_t)qword_1EE99BFE0)
          {
            if (qword_1EE99BFE8 == qword_1EE99BFE0)
            {
              boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>((boost::container *)&v31, v29, &v32);
            }
            else
            {
              if ((char *)v18 == v29)
              {
                v23 = v32;
                *((_QWORD *)v29 + 2) = v33;
                *(_OWORD *)v15 = v23;
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                ++qword_1EE99BFE0;
              }
              else
              {
                v19 = v18 - 40;
                *(_OWORD *)v18 = *(_OWORD *)(v18 - 40);
                *(_QWORD *)(v18 + 16) = *(_QWORD *)(v18 - 24);
                *(_OWORD *)(v16 + 40 * v17 + 24) = *(_OWORD *)(v18 - 16);
                *(_QWORD *)(v18 - 16) = 0;
                *(_QWORD *)(v18 - 8) = 0;
                ++qword_1EE99BFE0;
                if ((char *)(v18 - 40) != v15)
                {
                  do
                  {
                    v20 = (char *)(v19 - 40);
                    boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernel>>::operator=(v19, v19 - 40);
                    v19 = (uint64_t)v20;
                  }
                  while (v20 != v15);
                }
                *(_OWORD *)v15 = v32;
                v15[16] = v33;
                v21 = *(_OWORD *)v34;
                v34[0] = 0;
                v34[1] = 0;
                v22 = (std::__shared_weak_count *)*((_QWORD *)v15 + 4);
                *(_OWORD *)(v15 + 24) = v21;
                if (v22)
                  std::__shared_weak_count::__release_weak(v22);
              }
              v31 = v15;
            }
            goto LABEL_54;
          }
          v25 = "this->m_holder.capacity() >= this->m_holder.m_size";
          v26 = 2821;
          v27 = "vector.hpp";
          v28 = "priv_insert_forward_range";
        }
LABEL_66:
        __assert_rtn(v28, v27, v26, v25);
      }
      v8 = (const char *)v5;
    }
    v29 = (char *)v8;
    if (v8 != (const char *)v1)
    {
      if (!v8)
        __assert_rtn("operator--", "vector.hpp", 174, "!!m_ptr");
      v13 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)(v8 - 40), (uint64_t)&v32);
      if (v13 == 129 || ((char)v13 & 0x80000000) == 0)
      {
        v14 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>((uint64_t)&v32, (uint64_t)(v8 - 40));
        if (v14 == 129 || ((char)v14 & 0x80000000) == 0)
        {
          v29 = (char *)(v8 - 40);
          goto LABEL_51;
        }
        v31 = v8 - 40;
        if (!boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(v1, &v31, (uint64_t)&v32, (uint64_t *)&v29))
        {
LABEL_51:
          if (!qword_1EE99BFD8 && v29)
            __assert_rtn("operator+", "vector.hpp", 188, "x.m_ptr || !off");
          v31 = v29;
LABEL_54:
          if (v34[1])
            std::__shared_weak_count::__release_weak(v34[1]);
          v5 = (unint64_t)v31;
          if (!v31)
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          return v5 + 24;
        }
      }
    }
    goto LABEL_37;
  }
  return v5 + 24;
}

void sub_1A8389B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void std::__shared_ptr_emplace<RamstadKernelD>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425708;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<RamstadKernelD>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5425708;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<RamstadKernelD>::__on_zero_shared(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
}

void boost::container::vector<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>*,boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>(boost::container *a1, const char *a2, __int128 *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _OWORD *v18;
  const char *v19;
  __int128 v20;
  uint64_t v21;
  std::__shared_weak_count **v22;

  if (qword_1EE99BFE8 != qword_1EE99BFE0)
    __assert_rtn("next_capacity", "vector.hpp", 473, "additional_objects > size_type(this->m_capacity - this->m_size)");
  if (qword_1EE99BFE8 == 0x333333333333333)
    goto LABEL_30;
  if ((unint64_t)qword_1EE99BFE8 >> 61 > 4)
    v3 = -1;
  else
    v3 = 8 * qword_1EE99BFE8;
  if ((unint64_t)qword_1EE99BFE8 >> 61)
    v4 = v3;
  else
    v4 = 8 * qword_1EE99BFE8 / 5uLL;
  if (v4 >= 0x333333333333333)
    v4 = 0x333333333333333;
  v5 = qword_1EE99BFE8 + 1 > v4 ? qword_1EE99BFE8 + 1 : v4;
  if (v5 > 0x333333333333333)
LABEL_30:
    boost::container::throw_length_error(a1, a2);
  v9 = qword_1EE99BFD8;
  v10 = (char *)operator new(40 * v5);
  v11 = (uint64_t)v10;
  v12 = qword_1EE99BFD8;
  v13 = qword_1EE99BFD8 + 40 * qword_1EE99BFE0;
  v14 = v10;
  if ((const char *)qword_1EE99BFD8 != a2)
  {
    v15 = qword_1EE99BFD8;
    v14 = v10;
    do
    {
      v16 = *(_OWORD *)v15;
      *((_QWORD *)v14 + 2) = *(_QWORD *)(v15 + 16);
      *(_OWORD *)v14 = v16;
      *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
      *(_QWORD *)(v15 + 24) = 0;
      *(_QWORD *)(v15 + 32) = 0;
      v14 += 40;
      v15 += 40;
    }
    while ((const char *)v15 != a2);
  }
  v17 = *a3;
  *((_QWORD *)v14 + 2) = *((_QWORD *)a3 + 2);
  *(_OWORD *)v14 = v17;
  *(_OWORD *)(v14 + 24) = *(__int128 *)((char *)a3 + 24);
  *((_QWORD *)a3 + 3) = 0;
  *((_QWORD *)a3 + 4) = 0;
  if ((const char *)v13 != a2)
  {
    v18 = v14 + 64;
    v19 = a2;
    do
    {
      v20 = *(_OWORD *)v19;
      *((_QWORD *)v18 - 1) = *((_QWORD *)v19 + 2);
      *(_OWORD *)((char *)v18 - 24) = v20;
      *v18 = *(_OWORD *)(v19 + 24);
      v18 = (_OWORD *)((char *)v18 + 40);
      *((_QWORD *)v19 + 3) = 0;
      *((_QWORD *)v19 + 4) = 0;
      v19 += 40;
    }
    while (v19 != (const char *)v13);
  }
  if (v12)
  {
    v21 = qword_1EE99BFE0;
    if (qword_1EE99BFE0)
    {
      v22 = (std::__shared_weak_count **)(v12 + 32);
      do
      {
        if (*v22)
          std::__shared_weak_count::__release_weak(*v22);
        v22 += 5;
        --v21;
      }
      while (v21);
    }
    operator delete((void *)qword_1EE99BFD8);
  }
  qword_1EE99BFD8 = v11;
  ++qword_1EE99BFE0;
  qword_1EE99BFE8 = v5;
  *(_QWORD *)a1 = &a2[v11 - v9];
}

BOOL boost::container::dtl::flat_tree<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>,boost::container::dtl::select1st<std::tuple<int,int,double,BOOL>>,std::less<std::tuple<int,int,double,BOOL>>,boost::container::new_allocator<boost::container::dtl::pair<std::tuple<int,int,double,BOOL>,std::weak_ptr<RamstadKernelD>>>>::priv_insert_unique_prepare(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v7 = a1;
  if (*a2 != a1)
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((*a2 - a1) >> 3);
    do
    {
      if (v8 != 1 && !v7)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      if (!v7)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      v9 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(v7 + 40 * (v8 >> 1), a3);
      if (v9 != 129 && (v9 & 0x80u) != 0)
      {
        v7 += 40 * (v8 >> 1) + 40;
        v8 += ~(v8 >> 1);
      }
      else
      {
        v8 >>= 1;
      }
    }
    while (v8);
  }
  *a4 = v7;
  if (v7 == *a2)
    return 1;
  if (!v7)
    __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
  v10 = std::__tuple_compare_three_way[abi:ne180100]<int,int,double,BOOL,int,int,double,BOOL,0ul,1ul,2ul,3ul>(a3, v7);
  return v10 != 129 && (v10 & 0x80u) != 0;
}

uint64_t RamstadSRC::initQuality(uint64_t this, unsigned int a2)
{
  int v2;

  if (a2 <= 0x3F)
    v2 = 8;
  else
    v2 = 11;
  *(_DWORD *)(this + 56) = v2;
  *(_BYTE *)(this + 93) = a2 > 0x5F;
  return this;
}

double RamstadSRC::initPassbandWidth(RamstadSRC *this, int a2)
{
  double result;

  result = dbl_1A839E520[(a2 - 33) < 2];
  *((double *)this + 13) = result;
  return result;
}

double RamstadSRC::useInterpolationMethod(RamstadSRC *this, double a2)
{
  uint64_t v2;
  signed int v3;
  double result;

  *((_QWORD *)this + 12) = 0x3E80000000000000;
  *((_BYTE *)this + 92) = 0;
  *((_DWORD *)this + 13) = 256;
  v2 = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 15) = v2;
  v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((_QWORD *)this + 10) = (v2 << 32 >> 1) + v3;
  result = NAN;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 17) = v3;
  *((_DWORD *)this + 18) = 0;
  return result;
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, unsigned int a5, double a6)
{
  int v6;
  double v7;
  double v8;
  uint64_t v9;
  signed int v10;

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  if (a5 <= 0x3F)
    v6 = 8;
  else
    v6 = 11;
  v7 = dbl_1A839E520[a5 - 33 < 2];
  *((_DWORD *)this + 22) = 1;
  *((double *)this + 4) = a2;
  *((double *)this + 5) = a3;
  *((_BYTE *)this + 93) = a5 > 0x5F;
  *((double *)this + 13) = v7;
  v8 = a2 / a3;
  *((_QWORD *)this + 12) = 0x3E80000000000000;
  *((_BYTE *)this + 92) = 0;
  *((_DWORD *)this + 12) = a4;
  *((_DWORD *)this + 13) = 256;
  v9 = vcvtmd_s64_f64(v8);
  *((_DWORD *)this + 14) = v6;
  *((_DWORD *)this + 15) = v9;
  v10 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
  *((_QWORD *)this + 10) = (v9 << 32 >> 1) + v10;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  *((_DWORD *)this + 17) = v10;
  *((_DWORD *)this + 18) = 0;
  RamstadSRC::initFilter(this, (1.0 - a6) / v8, a5);
}

void sub_1A838A11C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)v1[29];
  if (v4)
  {
    v1[30] = v4;
    operator delete(v4);
  }
  v5 = (void *)v1[26];
  if (v5)
  {
    v1[27] = v5;
    operator delete(v5);
  }
  v6 = (void *)v1[23];
  if (v6)
  {
    v1[24] = v6;
    operator delete(v6);
  }
  v7 = (void *)v1[20];
  if (v7)
  {
    v1[21] = v7;
    operator delete(v7);
  }
  v8 = (void *)v1[17];
  if (v8)
  {
    v1[18] = v8;
    operator delete(v8);
  }
  v9 = *v2;
  if (*v2)
  {
    v1[15] = v9;
    operator delete(v9);
  }
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 2));
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  _Unwind_Resume(a1);
}

double RamstadSRC::setRate@<D0>(RamstadSRC *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  signed int v3;
  double result;

  LODWORD(a3) = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 15) = a3;
  v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((_DWORD *)this + 17) = v3;
  *((_QWORD *)this + 10) = (a3 << 32 >> 1) + v3;
  result = NAN;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void RamstadSRC::~RamstadSRC(RamstadSRC *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)*((_QWORD *)this + 29);
  if (v2)
  {
    *((_QWORD *)this + 30) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 26);
  if (v3)
  {
    *((_QWORD *)this + 27) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 23);
  if (v4)
  {
    *((_QWORD *)this + 24) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 20);
  if (v5)
  {
    *((_QWORD *)this + 21) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 17);
  if (v6)
  {
    *((_QWORD *)this + 18) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 14);
  if (v7)
  {
    *((_QWORD *)this + 15) = v7;
    operator delete(v7);
  }
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
  std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void RamstadSRC::reset(RamstadSRC *this)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  *((_DWORD *)this + 18) = 0;
  *((_DWORD *)this + 22) = 1;
  if (*((_BYTE *)this + 93))
  {
    v2 = (void *)*((_QWORD *)this + 20);
    v3 = *((_QWORD *)this + 21) - (_QWORD)v2;
    if (v3 >= 1)
      bzero(v2, ((((unint64_t)v3 >> 6) - ((unint64_t)v3 > 0x3F)) << 6) + 64);
    v4 = (void *)*((_QWORD *)this + 23);
    v5 = *((_QWORD *)this + 24) - (_QWORD)v4;
    if (v5 >= 1)
    {
      v6 = (unint64_t)v5 >> 6;
      v7 = (unint64_t)v5 > 0x3F;
      v8 = 6;
LABEL_10:
      bzero(v4, (v6 - v7 + 1) << v8);
    }
  }
  else
  {
    v9 = (void *)*((_QWORD *)this + 14);
    v10 = *((_QWORD *)this + 15) - (_QWORD)v9;
    if (v10 >= 1)
      bzero(v9, 32 * (((unint64_t)v10 >> 5) - ((unint64_t)v10 > 0x1F)) + 32);
    v4 = (void *)*((_QWORD *)this + 17);
    v11 = *((_QWORD *)this + 18) - (_QWORD)v4;
    if (v11 >= 1)
    {
      v6 = (unint64_t)v11 >> 5;
      v7 = (unint64_t)v11 > 0x1F;
      v8 = 5;
      goto LABEL_10;
    }
  }
}

double RamstadSRC::processMono(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  double result;
  std::runtime_error *exception;

  if (*((_DWORD *)this + 12) != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC::processMono, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((_BYTE *)this + 93))
  {
    if (*((_BYTE *)this + 92))
      RamstadSRC::processMonoIntD(this, a2, a3, a4, a5, a6, a7);
    else
      RamstadSRC::processMonoFracD(this, a2, a3, a4, a5, a6, a7);
  }
  else if (*((_BYTE *)this + 92))
  {
    RamstadSRC::processMonoInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMonoFrac(this, a2, a3, a4, a5, a6, a7);
  }
  result = NAN;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1A838A448(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  __cxa_free_exception(v2);
  *(_QWORD *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(a1);
}

_DWORD *RamstadSRC::checkPreflight(_DWORD *this, int a2, int a3)
{
  _DWORD *v4;
  int v5;
  std::runtime_error *exception;
  int v7;

  v4 = this;
  v5 = this[66];
  if (v5 == -1)
  {
    this = (_DWORD *)RamstadSRC::outputSamplesForInputSamples((RamstadSRC *)this, a2, &v7);
    if (v4[66] == a3)
      return this;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called without preflight and arguments don't match preflight.");
LABEL_10:
  }
  if (v5 != a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called for different number of output samples than preflight.");
    goto LABEL_10;
  }
  if (this[64] > a2 || this[65] < a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC process called for number of input samples than outside range of preflight.");
    goto LABEL_10;
  }
  return this;
}

void sub_1A838A548(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::processMonoIntD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  float64x2_t *v11;
  uint64_t v12;
  float64x2_t *v13;
  float64x2_t *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  int v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t *v32;
  float v33;
  int v34;
  int v35;
  int v36;
  int v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t *v56;
  float64x2_t v57;
  int64x2_t v58;
  int64x2_t v59;
  int v60;
  int v61;
  int v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  int v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  int v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *((_QWORD *)this + 2);
  v11 = *(float64x2_t **)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 40);
  v13 = (float64x2_t *)*((_QWORD *)this + 20);
  v14 = (float64x2_t *)*((_QWORD *)this + 23);
  v15 = *((_DWORD *)this + 13);
  v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v18 = 0;
    }
    else
    {
      v17 = 0;
      LODWORD(v18) = 0;
      do
      {
        v20 = v13[2];
        v19 = v13[3];
        v21 = v9;
        v23 = *v13;
        v22 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            v24 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            v25 = vmlaq_f64(v24, v20, v11[2]);
            v26 = vmlaq_f64(v24, v19, v11[3]);
            v27 = vmlaq_f64(v24, v23, *v11);
            v28 = vmlaq_f64(vmlaq_f64(v24, v22, v11[1]), v14[1], v11[5]);
            v29 = vmlaq_f64(v27, *v14, v11[4]);
            v30 = vmlaq_f64(v26, v14[3], v11[7]);
            v31 = vmlaq_f64(v25, v14[2], v11[6]);
            *v14 = v23;
            v14[1] = v22;
            v14[2] = v20;
            v14[3] = v19;
            v13[2] = v31;
            v13[3] = v30;
            a2 += a6;
            v23 = v29;
            *v13 = v29;
            v13[1] = v28;
            v22 = v28;
            v20 = v31;
            v19 = v30;
            --v21;
          }
          while (v21);
        }
        v18 = (v18 + v9);
        v32 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
        v33 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v23, *v32), vmlaq_f64(vmulq_f64(v32[6], v14[2]), v20, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v14[1]), v22, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v14[3]), v19, v32[3]))));
        *a3 = v33;
        a3 += a7;
        v34 = v7 + v8;
        if (v34 < v15)
          v9 = v16;
        else
          v9 = v16 + 1;
        if (v34 < v15)
          v35 = 0;
        else
          v35 = v15;
        v7 = v34 - v35;
        ++v17;
      }
      while (v17 != a5);
    }
    v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62)
        v62 = v9;
      if (v62 >= 1)
      {
        v64 = v13[2];
        v63 = v13[3];
        v66 = *v13;
        v65 = v13[1];
        v67 = v62;
        do
        {
          v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          v69 = vmlaq_f64(v68, v64, v11[2]);
          v70 = vmlaq_f64(v68, v63, v11[3]);
          v71 = vmlaq_f64(v68, v66, *v11);
          v72 = vmlaq_f64(vmlaq_f64(v68, v65, v11[1]), v14[1], v11[5]);
          v73 = vmlaq_f64(v71, *v14, v11[4]);
          v74 = vmlaq_f64(v70, v14[3], v11[7]);
          v75 = vmlaq_f64(v69, v14[2], v11[6]);
          *v14 = v66;
          v14[1] = v65;
          v14[2] = v64;
          v14[3] = v63;
          v13[2] = v75;
          v13[3] = v74;
          a2 += a6;
          v66 = v73;
          *v13 = v73;
          v13[1] = v72;
          v65 = v72;
          v64 = v75;
          v63 = v74;
          --v67;
        }
        while (v67);
      }
LABEL_44:
      v9 -= v62;
      v18 = (v62 + v18);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v18 = 0;
    }
    else
    {
      v36 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v9 < 1)
        {
          v53 = v13[6];
          v52 = v13[7];
          v55 = v13[4];
          v54 = v13[5];
        }
        else
        {
          v37 = v9;
          do
          {
            v38 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            v39 = *v13;
            v40 = v13[1];
            v41 = v13[2];
            v42 = v13[3];
            v43 = vmlaq_f64(vmlaq_f64(v38, *v13, *v11), *v14, v11[8]);
            v44 = vmlaq_f64(vmlaq_f64(v38, v40, v11[1]), v14[1], v11[9]);
            v45 = vmlaq_f64(vmlaq_f64(v38, v41, v11[2]), v14[2], v11[10]);
            v46 = vmlaq_f64(vmlaq_f64(v38, v42, v11[3]), v14[3], v11[11]);
            v14[2] = v41;
            v14[3] = v42;
            *v14 = v39;
            v14[1] = v40;
            v13[2] = v45;
            v13[3] = v46;
            *v13 = v43;
            v13[1] = v44;
            v48 = v13[4];
            v47 = v13[5];
            v50 = v13[6];
            v49 = v13[7];
            v51 = vmlaq_f64(v38, v48, v11[4]);
            v52 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v49, v11[7]), v14[7], v11[15]);
            v53 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v50, v11[6]), v14[6], v11[14]);
            v54 = vmlaq_f64(vmlaq_f64(v38, v47, v11[5]), v14[5], v11[13]);
            v55 = vmlaq_f64(v51, v14[4], v11[12]);
            v14[4] = v48;
            v14[5] = v47;
            v14[6] = v50;
            v14[7] = v49;
            v13[6] = v53;
            v13[7] = v52;
            v13[4] = v55;
            v13[5] = v54;
            a2 += a6;
            --v37;
          }
          while (v37);
        }
        v18 = (v18 + v9);
        v56 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        v57 = vmlaq_f64(vmulq_f64(v56[13], v14[5]), v54, v56[5]);
        v58 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[8], *v14), *v13, *v56), vmlaq_f64(vmulq_f64(v56[10], v14[2]), v13[2], v56[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v56[9], v14[1]), v13[1], v56[1]), vmlaq_f64(vmulq_f64(v56[11], v14[3]), v13[3], v56[3])));
        v59 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[12], v14[4]), v55, v56[4]), vmlaq_f64(vmulq_f64(v56[14], v14[6]), v53, v56[6])), vaddq_f64(v57, vmlaq_f64(vmulq_f64(v56[15], v14[7]), v52, v56[7])));
        *(float *)v58.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v58, v59), (float64x2_t)vzip2q_s64(v58, v59)));
        *a3 = *(float *)v58.i32;
        a3 += a7;
        v60 = v7 + v8;
        if (v60 < v15)
          v9 = v16;
        else
          v9 = v16 + 1;
        if (v60 < v15)
          v61 = 0;
        else
          v61 = v15;
        v7 = v60 - v61;
        ++v36;
      }
      while (v36 != a5);
    }
    v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62)
        v62 = v9;
      if (v62 >= 1)
      {
        v76 = v62;
        do
        {
          v77 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          v78 = *v13;
          v79 = v13[1];
          v80 = v13[2];
          v81 = v13[3];
          v82 = vmlaq_f64(vmlaq_f64(v77, *v13, *v11), *v14, v11[8]);
          v83 = vmlaq_f64(vmlaq_f64(v77, v79, v11[1]), v14[1], v11[9]);
          v84 = vmlaq_f64(vmlaq_f64(v77, v80, v11[2]), v14[2], v11[10]);
          v85 = vmlaq_f64(vmlaq_f64(v77, v81, v11[3]), v14[3], v11[11]);
          v14[2] = v80;
          v14[3] = v81;
          *v14 = v78;
          v14[1] = v79;
          v13[2] = v84;
          v13[3] = v85;
          *v13 = v82;
          v13[1] = v83;
          v87 = v13[4];
          v86 = v13[5];
          v89 = v13[6];
          v88 = v13[7];
          v90 = vmlaq_f64(v77, v87, v11[4]);
          v91 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v88, v11[7]), v14[7], v11[15]);
          v92 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v89, v11[6]), v14[6], v11[14]);
          v93 = vmlaq_f64(vmlaq_f64(v77, v86, v11[5]), v14[5], v11[13]);
          v94 = vmlaq_f64(v90, v14[4], v11[12]);
          v14[4] = v87;
          v14[5] = v86;
          v14[6] = v89;
          v14[7] = v88;
          v13[6] = v92;
          v13[7] = v91;
          v13[4] = v94;
          v13[5] = v93;
          a2 += a6;
          --v76;
        }
        while (v76);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v18;
}

uint64_t RamstadSRC::processMonoFracD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  float64x2_t *v11;
  uint64_t v12;
  float64x2_t *v13;
  float64x2_t *v14;
  int v15;
  uint64_t v16;
  int i;
  float64x2_t v18;
  float64x2_t v19;
  int v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  uint64_t v31;
  float64x2_t *v32;
  float64x2_t *v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  float64x2_t v39;
  int j;
  int v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  uint64_t v60;
  float64x2_t *v61;
  float64x2_t *v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  float64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  float64x2_t v78;
  int v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  int v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  int v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *((_QWORD *)this + 2);
  v11 = *(float64x2_t **)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 40);
  v13 = (float64x2_t *)*((_QWORD *)this + 20);
  v14 = (float64x2_t *)*((_QWORD *)this + 23);
  v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (i = 0; i != a5; ++i)
      {
        v19 = v13[2];
        v18 = v13[3];
        v20 = v9;
        v22 = *v13;
        v21 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            v24 = vmlaq_f64(v23, v19, v11[2]);
            v25 = vmlaq_f64(v23, v18, v11[3]);
            v26 = vmlaq_f64(v23, v22, *v11);
            v27 = vmlaq_f64(vmlaq_f64(v23, v21, v11[1]), v14[1], v11[5]);
            v28 = vmlaq_f64(v26, *v14, v11[4]);
            v29 = vmlaq_f64(v25, v14[3], v11[7]);
            v30 = vmlaq_f64(v24, v14[2], v11[6]);
            *v14 = v22;
            v14[1] = v21;
            v14[2] = v19;
            v14[3] = v18;
            v13[2] = v30;
            v13[3] = v29;
            a2 += a6;
            v22 = v28;
            *v13 = v28;
            v13[1] = v27;
            v21 = v27;
            v19 = v30;
            v18 = v29;
            --v20;
          }
          while (v20);
        }
        v16 = (v16 + v9);
        v31 = (v7 >> 22) & 0x1FE;
        v32 = (float64x2_t *)(v12 + (v31 << 6));
        v33 = (float64x2_t *)(v12 + ((unint64_t)(v31 + 2) << 6));
        v34 = v14[2];
        v35 = v14[3];
        v36 = v14[1];
        v37 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v22, *v32), vmlaq_f64(vmulq_f64(v32[6], v34), v19, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v36), v21, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v35), v18, v32[3])));
        v38 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v33[4]), v22, *v33), vmlaq_f64(vmulq_f64(v34, v33[6]), v19, v33[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v36, v33[5]), v21, v33[1]), vmlaq_f64(vmulq_f64(v35, v33[7]), v18, v33[3])));
        v39 = vaddq_f64((float64x2_t)vzip1q_s64(v38, v37), (float64x2_t)vzip2q_s64(v38, v37));
        *(float *)v39.f64 = v39.f64[1] + *((double *)this + 12) * (double)(v7 & 0x7FFFFF) * (v39.f64[0] - v39.f64[1]);
        *a3 = *(float *)v39.f64;
        a3 += a7;
        LODWORD(v33) = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v15 + (v33 >> 31);
      }
    }
    v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79)
        v79 = v9;
      if (v79 >= 1)
      {
        v81 = v13[2];
        v80 = v13[3];
        v83 = *v13;
        v82 = v13[1];
        v84 = v79;
        do
        {
          v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          v86 = vmlaq_f64(v85, v81, v11[2]);
          v87 = vmlaq_f64(v85, v80, v11[3]);
          v88 = vmlaq_f64(v85, v83, *v11);
          v89 = vmlaq_f64(vmlaq_f64(v85, v82, v11[1]), v14[1], v11[5]);
          v90 = vmlaq_f64(v88, *v14, v11[4]);
          v91 = vmlaq_f64(v87, v14[3], v11[7]);
          v92 = vmlaq_f64(v86, v14[2], v11[6]);
          *v14 = v83;
          v14[1] = v82;
          v14[2] = v81;
          v14[3] = v80;
          v13[2] = v92;
          v13[3] = v91;
          a2 += a6;
          v83 = v90;
          *v13 = v90;
          v13[1] = v89;
          v82 = v89;
          v81 = v92;
          v80 = v91;
          --v84;
        }
        while (v84);
      }
LABEL_32:
      v9 -= v79;
      v16 = (v79 + v16);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          v57 = v13[6];
          v56 = v13[7];
          v59 = v13[4];
          v58 = v13[5];
        }
        else
        {
          v41 = v9;
          do
          {
            v42 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            v43 = *v13;
            v44 = v13[1];
            v45 = v13[2];
            v46 = v13[3];
            v47 = vmlaq_f64(vmlaq_f64(v42, *v13, *v11), *v14, v11[8]);
            v48 = vmlaq_f64(vmlaq_f64(v42, v44, v11[1]), v14[1], v11[9]);
            v49 = vmlaq_f64(vmlaq_f64(v42, v45, v11[2]), v14[2], v11[10]);
            v50 = vmlaq_f64(vmlaq_f64(v42, v46, v11[3]), v14[3], v11[11]);
            v14[2] = v45;
            v14[3] = v46;
            *v14 = v43;
            v14[1] = v44;
            v13[2] = v49;
            v13[3] = v50;
            *v13 = v47;
            v13[1] = v48;
            v52 = v13[4];
            v51 = v13[5];
            v54 = v13[6];
            v53 = v13[7];
            v55 = vmlaq_f64(v42, v52, v11[4]);
            v56 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v53, v11[7]), v14[7], v11[15]);
            v57 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v54, v11[6]), v14[6], v11[14]);
            v58 = vmlaq_f64(vmlaq_f64(v42, v51, v11[5]), v14[5], v11[13]);
            v59 = vmlaq_f64(v55, v14[4], v11[12]);
            v14[4] = v52;
            v14[5] = v51;
            v14[6] = v54;
            v14[7] = v53;
            v13[6] = v57;
            v13[7] = v56;
            v13[4] = v59;
            v13[5] = v58;
            a2 += a6;
            --v41;
          }
          while (v41);
        }
        v16 = (v16 + v9);
        v60 = (v7 >> 21) & 0x3FC;
        v61 = (float64x2_t *)(v12 + (v60 << 6));
        v62 = (float64x2_t *)(v12 + ((unint64_t)(v60 + 4) << 6));
        v63 = v13[1];
        v65 = v13[2];
        v64 = v13[3];
        v66 = v14[2];
        v67 = v14[3];
        v68 = v14[1];
        v69 = v14[6];
        v70 = v14[7];
        v71 = v14[4];
        v72 = v14[5];
        v73 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[8], *v14), *v13, *v61), vmlaq_f64(vmulq_f64(v61[10], v66), v65, v61[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[9], v68), v63, v61[1]), vmlaq_f64(vmulq_f64(v61[11], v67), v64, v61[3])));
        v74 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[12], v71), v59, v61[4]), vmlaq_f64(vmulq_f64(v61[14], v69), v57, v61[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[13], v72), v58, v61[5]), vmlaq_f64(vmulq_f64(v61[15], v70), v56, v61[7])));
        v75 = vmlaq_f64(vmulq_f64(v72, v62[13]), v58, v62[5]);
        v76 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v62[8]), *v13, *v62), vmlaq_f64(vmulq_f64(v66, v62[10]), v65, v62[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v68, v62[9]), v63, v62[1]), vmlaq_f64(vmulq_f64(v67, v62[11]), v64, v62[3])));
        v77 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v71, v62[12]), v59, v62[4]), vmlaq_f64(vmulq_f64(v69, v62[14]), v57, v62[6])), vaddq_f64(v75, vmlaq_f64(vmulq_f64(v70, v62[15]), v56, v62[7])));
        v78 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v76, v73), (float64x2_t)vzip2q_s64(v76, v73)), vaddq_f64((float64x2_t)vzip1q_s64(v77, v74), (float64x2_t)vzip2q_s64(v77, v74)));
        *(float *)v78.f64 = v78.f64[1] + *((double *)this + 12) * (double)(v7 & 0x7FFFFF) * (v78.f64[0] - v78.f64[1]);
        *a3 = *(float *)v78.f64;
        a3 += a7;
        LODWORD(v62) = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v15 + (v62 >> 31);
      }
    }
    v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79)
        v79 = v9;
      if (v79 >= 1)
      {
        v93 = v79;
        do
        {
          v94 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          v95 = *v13;
          v96 = v13[1];
          v97 = v13[2];
          v98 = v13[3];
          v99 = vmlaq_f64(vmlaq_f64(v94, *v13, *v11), *v14, v11[8]);
          v100 = vmlaq_f64(vmlaq_f64(v94, v96, v11[1]), v14[1], v11[9]);
          v101 = vmlaq_f64(vmlaq_f64(v94, v97, v11[2]), v14[2], v11[10]);
          v102 = vmlaq_f64(vmlaq_f64(v94, v98, v11[3]), v14[3], v11[11]);
          v14[2] = v97;
          v14[3] = v98;
          *v14 = v95;
          v14[1] = v96;
          v13[2] = v101;
          v13[3] = v102;
          *v13 = v99;
          v13[1] = v100;
          v104 = v13[4];
          v103 = v13[5];
          v106 = v13[6];
          v105 = v13[7];
          v107 = vmlaq_f64(v94, v104, v11[4]);
          v108 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v105, v11[7]), v14[7], v11[15]);
          v109 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v106, v11[6]), v14[6], v11[14]);
          v110 = vmlaq_f64(vmlaq_f64(v94, v103, v11[5]), v14[5], v11[13]);
          v111 = vmlaq_f64(v107, v14[4], v11[12]);
          v14[4] = v104;
          v14[5] = v103;
          v14[6] = v106;
          v14[7] = v105;
          v13[6] = v109;
          v13[7] = v108;
          v13[4] = v111;
          v13[5] = v110;
          a2 += a6;
          --v93;
        }
        while (v93);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v16;
}

uint64_t RamstadSRC::processMonoInt(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v7;
  int v8;
  int v9;
  float32x4_t *v10;
  uint64_t v11;
  float32x4_t *v12;
  float32x4_t *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  int8x16_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t *v40;
  float32x4_t v41;
  int8x16_t v42;
  int8x16_t v43;
  int v44;
  int v45;
  int v46;
  float32x4_t v47;
  float32x4_t v48;
  uint64_t v49;
  int v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  int v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v11 = *(_QWORD *)(*(_QWORD *)this + 40);
  v12 = (float32x4_t *)*((_QWORD *)this + 14);
  v13 = (float32x4_t *)*((_QWORD *)this + 17);
  v14 = *((_DWORD *)this + 13);
  v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v17 = 0;
    }
    else
    {
      v16 = 0;
      LODWORD(v17) = 0;
      do
      {
        v19 = *v12;
        v20 = v12[1];
        v21 = v9;
        if (v9 >= 1)
        {
          do
          {
            v22 = vld1q_dup_f32(a2);
            v18 = 4 * a6;
            a2 = (const float *)((char *)a2 + v18);
            v23 = vmlaq_f32(v22, v20, v10[1]);
            v24 = vmlaq_f32(vmlaq_f32(v22, v19, *v10), *v13, v10[2]);
            v25 = vmlaq_f32(v23, v13[1], v10[3]);
            *v13 = v19;
            v13[1] = v20;
            *v12 = v24;
            v12[1] = v25;
            v19 = v24;
            v20 = v25;
            --v21;
          }
          while (v21);
        }
        v17 = (v17 + v9);
        v26 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), *v13), v19, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v13[1]), v20, *(float32x4_t *)(v11 + 64 * v7 + 16)));
        *a3 = vaddv_f32(vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)));
        a3 += a7;
        v27 = v7 + v8;
        if (v27 < v14)
          v9 = v15;
        else
          v9 = v15 + 1;
        if (v27 < v14)
          v28 = 0;
        else
          v28 = v14;
        v7 = v27 - v28;
        ++v16;
      }
      while (v16 != a5);
    }
    v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46)
        v46 = v9;
      if (v46 >= 1)
      {
        v48 = *v12;
        v47 = v12[1];
        v50 = v46;
        do
        {
          v51 = vld1q_dup_f32(a2);
          v49 = 4 * a6;
          a2 = (const float *)((char *)a2 + v49);
          v52 = vmlaq_f32(v51, v47, v10[1]);
          v53 = vmlaq_f32(vmlaq_f32(v51, v48, *v10), *v13, v10[2]);
          v54 = vmlaq_f32(v52, v13[1], v10[3]);
          *v13 = v48;
          v13[1] = v47;
          *v12 = v53;
          v12[1] = v54;
          v48 = v53;
          v47 = v54;
          --v50;
        }
        while (v50);
      }
LABEL_44:
      v9 -= v46;
      v17 = (v46 + v17);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v17 = 0;
    }
    else
    {
      v29 = 0;
      LODWORD(v17) = 0;
      do
      {
        if (v9 < 1)
        {
          v39 = v12[2];
          v38 = v12[3];
        }
        else
        {
          v31 = v9;
          do
          {
            v32 = vld1q_dup_f32(a2);
            v30 = 4 * a6;
            a2 = (const float *)((char *)a2 + v30);
            v33 = v12[1];
            v34 = vmlaq_f32(vmlaq_f32(v32, *v12, *v10), *v13, v10[4]);
            v35 = vmlaq_f32(vmlaq_f32(v32, v33, v10[1]), v13[1], v10[5]);
            *v13 = *v12;
            v13[1] = v33;
            *v12 = v34;
            v12[1] = v35;
            v36 = v12[2];
            v37 = v12[3];
            v38 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v37, v10[3]), v13[3], v10[7]);
            v39 = vmlaq_f32(vmlaq_f32(v32, v36, v10[2]), v13[2], v10[6]);
            v13[2] = v36;
            v13[3] = v37;
            v12[2] = v39;
            v12[3] = v38;
            --v31;
          }
          while (v31);
        }
        v17 = (v17 + v9);
        v40 = (float32x4_t *)(v11 + 128 * v7);
        v41 = vmlaq_f32(vmulq_f32(v40[6], v13[2]), v39, v40[2]);
        v42 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40[4], *v13), *v12, *v40), vmlaq_f32(vmulq_f32(v40[5], v13[1]), v12[1], v40[1]));
        *(float32x2_t *)v42.i8 = vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL));
        v43 = (int8x16_t)vaddq_f32(v41, vmlaq_f32(vmulq_f32(v40[7], v13[3]), v38, v40[3]));
        *(float32x2_t *)v43.i8 = vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v43, v43, 8uLL));
        *a3 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8)));
        a3 += a7;
        v44 = v7 + v8;
        if (v44 < v14)
          v9 = v15;
        else
          v9 = v15 + 1;
        if (v44 < v14)
          v45 = 0;
        else
          v45 = v14;
        v7 = v44 - v45;
        ++v29;
      }
      while (v29 != a5);
    }
    v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46)
        v46 = v9;
      if (v46 >= 1)
      {
        v56 = v46;
        do
        {
          v57 = vld1q_dup_f32(a2);
          v55 = 4 * a6;
          a2 = (const float *)((char *)a2 + v55);
          v58 = v12[1];
          v59 = vmlaq_f32(vmlaq_f32(v57, *v12, *v10), *v13, v10[4]);
          v60 = vmlaq_f32(vmlaq_f32(v57, v58, v10[1]), v13[1], v10[5]);
          *v13 = *v12;
          v13[1] = v58;
          *v12 = v59;
          v12[1] = v60;
          v61 = v12[2];
          v62 = v12[3];
          v63 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v62, v10[3]), v13[3], v10[7]);
          v64 = vmlaq_f32(vmlaq_f32(v57, v61, v10[2]), v13[2], v10[6]);
          v13[2] = v61;
          v13[3] = v62;
          v12[2] = v64;
          v12[3] = v63;
          --v56;
        }
        while (v56);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v17;
}

uint64_t RamstadSRC::processMonoFrac(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  unsigned int v7;
  int v8;
  int v9;
  float32x4_t *v10;
  uint64_t v11;
  float32x4_t *v12;
  float32x4_t *v13;
  int v14;
  uint64_t v15;
  int i;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  uint64_t v26;
  float32x4_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int j;
  uint64_t v31;
  int v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float v41;
  uint64_t v42;
  float32x4_t *v43;
  float32x4_t *v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  int8x16_t v49;
  int8x16_t v50;
  float32x4_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int v54;
  float32x4_t v55;
  float32x4_t v56;
  uint64_t v57;
  int v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  uint64_t v63;
  int v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v11 = *(_QWORD *)(*(_QWORD *)this + 40);
  v12 = (float32x4_t *)*((_QWORD *)this + 14);
  v13 = (float32x4_t *)*((_QWORD *)this + 17);
  v14 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (i = 0; i != a5; ++i)
      {
        v18 = *v12;
        v19 = v12[1];
        v20 = v9;
        if (v9 >= 1)
        {
          do
          {
            v21 = vld1q_dup_f32(a2);
            v17 = 4 * a6;
            a2 = (const float *)((char *)a2 + v17);
            v22 = vmlaq_f32(v21, v19, v10[1]);
            v23 = vmlaq_f32(vmlaq_f32(v21, v18, *v10), *v13, v10[2]);
            v24 = vmlaq_f32(v22, v13[1], v10[3]);
            *v13 = v18;
            v13[1] = v19;
            *v12 = v23;
            v12[1] = v24;
            v18 = v23;
            v19 = v24;
            --v20;
          }
          while (v20);
        }
        v15 = (v15 + v9);
        v25 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
        v26 = (v7 >> 22) & 0x1FE;
        v27 = v13[1];
        v28 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 32), *v13), v18, *(float32x4_t *)(v11 + 32 * v26)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 48), v27), v19, *(float32x4_t *)(v11 + 32 * v26 + 16)));
        *(float32x2_t *)v28.i8 = vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
        v29 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 32)), v18, *(float32x4_t *)(v11 + 32 * (v26 + 2))), vmlaq_f32(vmulq_f32(v27, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 48)), v19, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 16)));
        *(float32x2_t *)v29.i8 = vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
        *(float32x2_t *)v29.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8));
        *a3 = *(float *)&v29.i32[1] + (float)(v25 * (float)(*(float *)v29.i32 - *(float *)&v29.i32[1]));
        a3 += a7;
        LODWORD(v26) = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v14 + (v26 >> 31);
      }
    }
    v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54)
        v54 = v9;
      if (v54 >= 1)
      {
        v56 = *v12;
        v55 = v12[1];
        v58 = v54;
        do
        {
          v59 = vld1q_dup_f32(a2);
          v57 = 4 * a6;
          a2 = (const float *)((char *)a2 + v57);
          v60 = vmlaq_f32(v59, v55, v10[1]);
          v61 = vmlaq_f32(vmlaq_f32(v59, v56, *v10), *v13, v10[2]);
          v62 = vmlaq_f32(v60, v13[1], v10[3]);
          *v13 = v56;
          v13[1] = v55;
          *v12 = v61;
          v12[1] = v62;
          v56 = v61;
          v55 = v62;
          --v58;
        }
        while (v58);
      }
LABEL_32:
      v9 -= v54;
      v15 = (v54 + v15);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          v40 = v12[2];
          v39 = v12[3];
        }
        else
        {
          v32 = v9;
          do
          {
            v33 = vld1q_dup_f32(a2);
            v31 = 4 * a6;
            a2 = (const float *)((char *)a2 + v31);
            v34 = v12[1];
            v35 = vmlaq_f32(vmlaq_f32(v33, *v12, *v10), *v13, v10[4]);
            v36 = vmlaq_f32(vmlaq_f32(v33, v34, v10[1]), v13[1], v10[5]);
            *v13 = *v12;
            v13[1] = v34;
            *v12 = v35;
            v12[1] = v36;
            v37 = v12[2];
            v38 = v12[3];
            v39 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v38, v10[3]), v13[3], v10[7]);
            v40 = vmlaq_f32(vmlaq_f32(v33, v37, v10[2]), v13[2], v10[6]);
            v13[2] = v37;
            v13[3] = v38;
            v12[2] = v40;
            v12[3] = v39;
            --v32;
          }
          while (v32);
        }
        v15 = (v15 + v9);
        v41 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
        v42 = (v7 >> 21) & 0x3FC;
        v43 = (float32x4_t *)(v11 + 32 * v42);
        v44 = (float32x4_t *)(v11 + 32 * (v42 + 4));
        v45 = v12[1];
        v46 = v13[1];
        v48 = v13[2];
        v47 = v13[3];
        v49 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[4], *v13), *v12, *v43), vmlaq_f32(vmulq_f32(v43[5], v46), v45, v43[1]));
        *(float32x2_t *)v49.i8 = vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v49, v49, 8uLL));
        v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[6], v48), v40, v43[2]), vmlaq_f32(vmulq_f32(v43[7], v47), v39, v43[3]));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        v51 = vmlaq_f32(vmulq_f32(v48, v44[6]), v40, v44[2]);
        v52 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, v44[4]), *v12, *v44), vmlaq_f32(vmulq_f32(v46, v44[5]), v45, v44[1]));
        *(float32x2_t *)v52.i8 = vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL));
        v53 = (int8x16_t)vaddq_f32(v51, vmlaq_f32(vmulq_f32(v47, v44[7]), v39, v44[3]));
        *(float32x2_t *)v53.i8 = vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL));
        *(float32x2_t *)v52.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8)));
        *a3 = *(float *)&v52.i32[1] + (float)(v41 * (float)(*(float *)v52.i32 - *(float *)&v52.i32[1]));
        a3 += a7;
        LODWORD(v44) = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v14 + (v44 >> 31);
      }
    }
    v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54)
        v54 = v9;
      if (v54 >= 1)
      {
        v64 = v54;
        do
        {
          v65 = vld1q_dup_f32(a2);
          v63 = 4 * a6;
          a2 = (const float *)((char *)a2 + v63);
          v66 = v12[1];
          v67 = vmlaq_f32(vmlaq_f32(v65, *v12, *v10), *v13, v10[4]);
          v68 = vmlaq_f32(vmlaq_f32(v65, v66, v10[1]), v13[1], v10[5]);
          *v13 = *v12;
          v13[1] = v66;
          *v12 = v67;
          v12[1] = v68;
          v69 = v12[2];
          v70 = v12[3];
          v71 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v70, v10[3]), v13[3], v10[7]);
          v72 = vmlaq_f32(vmlaq_f32(v65, v69, v10[2]), v13[2], v10[6]);
          v13[2] = v69;
          v13[3] = v70;
          v12[2] = v72;
          v12[3] = v71;
          --v64;
        }
        while (v64);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v15;
}

uint64_t RamstadSRC::outputSamplesForInputSamples(RamstadSRC *this, int a2, int *a3)
{
  int v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int i;

  v5 = 0;
  v6 = 0;
  *a3 = 0;
  v7 = *((_DWORD *)this + 22);
  v8 = __OFSUB__(a2, v7);
  v9 = a2 - v7;
  if (v9 < 0 == v8)
  {
    if (*((_BYTE *)this + 92))
    {
      v11 = *((int *)this + 13) * (uint64_t)v9;
      v12 = *((int *)this + 18);
      v13 = *((int *)this + 16);
    }
    else
    {
      v12 = (uint64_t)v9 << 31;
      v11 = *((int *)this + 18);
      v13 = *((_QWORD *)this + 10);
    }
    v14 = ((v12 + v11 + v13 - 1) / v13) + 1;
    v15 = vcvtpd_s64_f64(*((double *)this + 5) / *((double *)this + 4));
    v16 = v14 + 2 * v15;
    for (i = v14 - 2 * v15; ; i = v6)
    {
      while (1)
      {
        v6 = v14;
        v5 = RamstadSRC::inputSamplesForOutputSamples(this, v14);
        if (v5 <= a2)
          break;
        v14 = (i + (((int)v6 - i) >> 1));
        v16 = v6;
        if ((_DWORD)v14 == (_DWORD)v6)
          goto LABEL_11;
      }
      if ((v16 - v6) < 2)
        break;
      v14 = (v6 + ((v16 - (int)v6) >> 1));
    }
LABEL_11:
    *a3 = v5;
  }
  *((_DWORD *)this + 64) = v5;
  *((_DWORD *)this + 65) = a2;
  *((_DWORD *)this + 66) = v6;
  return v6;
}

uint64_t RamstadSRC::inputSamplesForOutputSamples(RamstadSRC *this, int a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (a2 - 1);
  if (a2 < 1)
    return 0;
  if (*((_BYTE *)this + 92))
    v3 = (*((int *)this + 18) + *((int *)this + 16) * v2) / *((int *)this + 13);
  else
    v3 = (unint64_t)(*((int *)this + 18) + *((_QWORD *)this + 10) * v2) >> 31;
  v4 = (*((_DWORD *)this + 22) + v3);
  *((_DWORD *)this + 64) = v4;
  *((_DWORD *)this + 65) = v4;
  *((_DWORD *)this + 66) = a2;
  return v4;
}

uint64_t RamstadSRC::crashIfClientProvidedBogusBuffer(RamstadSRC *this, const float *a2, int a3)
{
  uint64_t result;

  if (a3 < 1)
    return 0;
  if (a2)
    return (LODWORD(a2[a3 - 1]) + *(_DWORD *)a2);
  return result;
}

double RamstadSRC::processStereo(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  double result;
  std::runtime_error *exception;

  if (*((_DWORD *)this + 12) != 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "RamstadSRC::processStereo, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a6, a7);
  if (*((_BYTE *)this + 93))
  {
    if (*((_BYTE *)this + 92))
      RamstadSRC::processStereoIntD(this, a2, a3, a4, a5, a6, a7, a8, a9);
    else
      RamstadSRC::processStereoFracD(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else if (*((_BYTE *)this + 92))
  {
    RamstadSRC::processStereoInt(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    RamstadSRC::processStereoFrac(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  result = NAN;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1A838BAC8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(exception_object);
}

uint64_t RamstadSRC::processStereoIntD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  float64x2_t *v13;
  uint64_t v14;
  float64x2_t *v15;
  float64x2_t *v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t *v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float v59;
  float v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  int v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t *v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  int64x2_t v113;
  int64x2_t v114;
  int64x2_t v115;
  int64x2_t v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  uint64_t v146;
  int v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t v175;

  v10 = *((_DWORD *)this + 17);
  v9 = *((_DWORD *)this + 18);
  v11 = *((_DWORD *)this + 22);
  v12 = *((_QWORD *)this + 2);
  v13 = *(float64x2_t **)(v12 + 16);
  v14 = *(_QWORD *)(v12 + 40);
  v15 = (float64x2_t *)*((_QWORD *)this + 20);
  v16 = (float64x2_t *)*((_QWORD *)this + 23);
  v17 = *((_DWORD *)this + 13);
  v18 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      v20 = 0;
    }
    else
    {
      v19 = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v11 < 1)
        {
          v46 = v15[6];
          v45 = v15[7];
          v44 = v15[4];
          v43 = v15[5];
        }
        else
        {
          v21 = 0;
          v22 = v11;
          do
          {
            v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v21]), 0);
            v24 = *v15;
            v25 = v15[1];
            v26 = v15[2];
            v27 = v15[3];
            v28 = vmlaq_f64(v23, v27, v13[3]);
            v29 = vmlaq_f64(v23, v26, v13[2]);
            v30 = vmlaq_f64(v23, v25, v13[1]);
            v31 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v21]), 0);
            v32 = vmlaq_f64(vmlaq_f64(v23, *v15, *v13), *v16, v13[4]);
            v33 = vmlaq_f64(v30, v16[1], v13[5]);
            v34 = vmlaq_f64(v29, v16[2], v13[6]);
            v35 = vmlaq_f64(v28, v16[3], v13[7]);
            v16[2] = v26;
            v16[3] = v27;
            *v16 = v24;
            v16[1] = v25;
            v15[2] = v34;
            v15[3] = v35;
            *v15 = v32;
            v15[1] = v33;
            v37 = v15[4];
            v36 = v15[5];
            v39 = v15[6];
            v38 = v15[7];
            v40 = vmlaq_f64(v31, v39, v13[2]);
            v41 = vmlaq_f64(v31, v38, v13[3]);
            v42 = vmlaq_f64(v31, v37, *v13);
            v43 = vmlaq_f64(vmlaq_f64(v31, v36, v13[1]), v16[5], v13[5]);
            v44 = vmlaq_f64(v42, v16[4], v13[4]);
            v45 = vmlaq_f64(v41, v16[7], v13[7]);
            v46 = vmlaq_f64(v40, v16[6], v13[6]);
            v16[4] = v37;
            v16[5] = v36;
            v16[6] = v39;
            v16[7] = v38;
            v15[6] = v46;
            v15[7] = v45;
            v15[4] = v44;
            v15[5] = v43;
            v21 += a8;
            --v22;
          }
          while (v22);
          a2 = (const float *)((char *)a2 + v21 * 4);
          a3 = (const float *)((char *)a3 + v21 * 4);
        }
        v20 = (v20 + v11);
        v47 = (float64x2_t *)(v14 + ((uint64_t)(2 * v9) << 6));
        v48 = v47[1];
        v50 = v47[2];
        v49 = v47[3];
        v51 = v47[6];
        v52 = v47[7];
        v53 = v47[4];
        v54 = v47[5];
        v55 = vmlaq_f64(vmulq_f64(v51, v16[6]), v46, v50);
        v56 = vmlaq_f64(vmulq_f64(v53, v16[4]), v44, *v47);
        v57 = vmlaq_f64(vmulq_f64(v52, v16[7]), v45, v49);
        v58 = vmlaq_f64(vmulq_f64(v54, v16[5]), v43, v48);
        v59 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v53, *v16), *v15, *v47), vmlaq_f64(vmulq_f64(v51, v16[2]), v15[2], v50)), vaddq_f64(vmlaq_f64(vmulq_f64(v54, v16[1]), v15[1], v48), vmlaq_f64(vmulq_f64(v52, v16[3]), v15[3], v49))));
        *a4 = v59;
        v60 = vaddvq_f64(vaddq_f64(vaddq_f64(v56, v55), vaddq_f64(v58, v57)));
        *a5 = v60;
        a4 += a9;
        a5 += a9;
        v61 = v9 + v10;
        if (v61 < v17)
          v11 = v18;
        else
          v11 = v18 + 1;
        if (v61 < v17)
          v62 = 0;
        else
          v62 = v17;
        v9 = v61 - v62;
        ++v19;
      }
      while (v19 != a7);
    }
    v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119)
        v119 = v11;
      if (v119 >= 1)
      {
        v120 = 0;
        v121 = v119;
        do
        {
          v122 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v120]), 0);
          v123 = *v15;
          v124 = v15[1];
          v125 = v15[2];
          v126 = v15[3];
          v127 = vmlaq_f64(v122, v126, v13[3]);
          v128 = vmlaq_f64(v122, v125, v13[2]);
          v129 = vmlaq_f64(v122, v124, v13[1]);
          v130 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v120]), 0);
          v131 = vmlaq_f64(vmlaq_f64(v122, *v15, *v13), *v16, v13[4]);
          v132 = vmlaq_f64(v129, v16[1], v13[5]);
          v133 = vmlaq_f64(v128, v16[2], v13[6]);
          v134 = vmlaq_f64(v127, v16[3], v13[7]);
          v16[2] = v125;
          v16[3] = v126;
          *v16 = v123;
          v16[1] = v124;
          v15[2] = v133;
          v15[3] = v134;
          *v15 = v131;
          v15[1] = v132;
          v136 = v15[4];
          v135 = v15[5];
          v138 = v15[6];
          v137 = v15[7];
          v139 = vmlaq_f64(v130, v138, v13[2]);
          v140 = vmlaq_f64(v130, v137, v13[3]);
          v141 = vmlaq_f64(v130, v136, *v13);
          v142 = vmlaq_f64(vmlaq_f64(v130, v135, v13[1]), v16[5], v13[5]);
          v143 = vmlaq_f64(v141, v16[4], v13[4]);
          v144 = vmlaq_f64(v140, v16[7], v13[7]);
          v145 = vmlaq_f64(v139, v16[6], v13[6]);
          v16[4] = v136;
          v16[5] = v135;
          v16[6] = v138;
          v16[7] = v137;
          v15[6] = v145;
          v15[7] = v144;
          v15[4] = v143;
          v15[5] = v142;
          v120 += a8;
          --v121;
        }
        while (v121);
      }
LABEL_47:
      v11 -= v119;
      v20 = (v119 + v20);
    }
  }
  else
  {
    if (a7 < 1)
    {
      v20 = 0;
    }
    else
    {
      v63 = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v11 < 1)
        {
          v93 = v15[10];
          v92 = v15[11];
          v91 = v15[8];
          v90 = v15[9];
        }
        else
        {
          v64 = 0;
          v65 = v11;
          do
          {
            v66 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v64]), 0);
            v67 = *v15;
            v68 = v15[1];
            v69 = v15[2];
            v70 = v15[3];
            v71 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v64]), 0);
            v72 = vmlaq_f64(vmlaq_f64(v66, *v15, *v13), *v16, v13[8]);
            v73 = vmlaq_f64(vmlaq_f64(v66, v68, v13[1]), v16[1], v13[9]);
            v74 = vmlaq_f64(vmlaq_f64(v66, v69, v13[2]), v16[2], v13[10]);
            v75 = vmlaq_f64(vmlaq_f64(v66, v70, v13[3]), v16[3], v13[11]);
            v16[2] = v69;
            v16[3] = v70;
            *v16 = v67;
            v16[1] = v68;
            v15[2] = v74;
            v15[3] = v75;
            *v15 = v72;
            v15[1] = v73;
            v76 = v15[4];
            v77 = v15[5];
            v78 = v15[6];
            v79 = v15[7];
            v80 = vmlaq_f64(vmlaq_f64(v71, v76, *v13), v16[4], v13[8]);
            v81 = vmlaq_f64(vmlaq_f64(v71, v77, v13[1]), v16[5], v13[9]);
            v82 = vmlaq_f64(vmlaq_f64(v71, v78, v13[2]), v16[6], v13[10]);
            v83 = vmlaq_f64(vmlaq_f64(v71, v79, v13[3]), v16[7], v13[11]);
            v16[4] = v76;
            v16[5] = v77;
            v16[6] = v78;
            v16[7] = v79;
            v15[6] = v82;
            v15[7] = v83;
            v15[4] = v80;
            v15[5] = v81;
            v85 = v15[8];
            v84 = v15[9];
            v87 = v15[10];
            v86 = v15[11];
            v88 = vmlaq_f64(v71, v87, v13[6]);
            v89 = vmlaq_f64(v66, v85, v13[4]);
            v90 = vmlaq_f64(vmlaq_f64(v66, v84, v13[5]), v16[9], v13[13]);
            v91 = vmlaq_f64(v89, v16[8], v13[12]);
            v92 = vmlaq_f64(vmlaq_f64(v71, v86, v13[7]), v16[11], v13[15]);
            v93 = vmlaq_f64(v88, v16[10], v13[14]);
            v16[8] = v85;
            v16[9] = v84;
            v16[10] = v87;
            v16[11] = v86;
            v15[10] = v93;
            v15[11] = v92;
            v15[8] = v91;
            v15[9] = v90;
            v64 += a8;
            --v65;
          }
          while (v65);
          a2 = (const float *)((char *)a2 + v64 * 4);
          a3 = (const float *)((char *)a3 + v64 * 4);
        }
        v20 = (v20 + v11);
        v94 = (float64x2_t *)(v14 + ((uint64_t)(4 * v9) << 6));
        v95 = v94[1];
        v97 = v94[2];
        v96 = v94[3];
        v98 = v94[10];
        v99 = v94[11];
        v100 = v94[8];
        v101 = v94[9];
        v102 = vmlaq_f64(vmulq_f64(v98, v16[2]), v15[2], v97);
        v103 = vmlaq_f64(vmulq_f64(v100, *v16), *v15, *v94);
        v104 = vmlaq_f64(vmulq_f64(v99, v16[3]), v15[3], v96);
        v105 = vmlaq_f64(vmulq_f64(v101, v16[1]), v15[1], v95);
        v106 = vmlaq_f64(vmulq_f64(v98, v16[6]), v15[6], v97);
        v107 = vmlaq_f64(vmulq_f64(v100, v16[4]), v15[4], *v94);
        v108 = vmlaq_f64(vmulq_f64(v99, v16[7]), v15[7], v96);
        v109 = vmlaq_f64(vmulq_f64(v101, v16[5]), v15[5], v95);
        v110 = vmlaq_f64(vmulq_f64(v94[15], v16[11]), v92, v94[7]);
        v111 = vmlaq_f64(vmulq_f64(v94[14], v16[10]), v93, v94[6]);
        v112 = vmlaq_f64(vmulq_f64(v94[13], v16[9]), v90, v94[5]);
        v113 = (int64x2_t)vaddq_f64(vaddq_f64(v103, v102), vaddq_f64(v105, v104));
        v114 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v94[12], v16[8]), v91, v94[4]), v112);
        *(float *)v113.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v113, v114), (float64x2_t)vzip2q_s64(v113, v114)));
        *a4 = *(float *)v113.i32;
        v115 = (int64x2_t)vaddq_f64(vaddq_f64(v107, v106), vaddq_f64(v109, v108));
        v116 = (int64x2_t)vaddq_f64(v111, v110);
        *(float *)v115.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v115, v116), (float64x2_t)vzip2q_s64(v115, v116)));
        *a5 = *(float *)v115.i32;
        a4 += a9;
        a5 += a9;
        v117 = v9 + v10;
        if (v117 < v17)
          v11 = v18;
        else
          v11 = v18 + 1;
        if (v117 < v17)
          v118 = 0;
        else
          v118 = v17;
        v9 = v117 - v118;
        ++v63;
      }
      while (v63 != a7);
    }
    v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119)
        v119 = v11;
      if (v119 >= 1)
      {
        v146 = 0;
        v147 = v119;
        do
        {
          v148 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v146]), 0);
          v149 = *v15;
          v150 = v15[1];
          v151 = v15[2];
          v152 = v15[3];
          v153 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v146]), 0);
          v154 = vmlaq_f64(vmlaq_f64(v148, *v15, *v13), *v16, v13[8]);
          v155 = vmlaq_f64(vmlaq_f64(v148, v150, v13[1]), v16[1], v13[9]);
          v156 = vmlaq_f64(vmlaq_f64(v148, v151, v13[2]), v16[2], v13[10]);
          v157 = vmlaq_f64(vmlaq_f64(v148, v152, v13[3]), v16[3], v13[11]);
          v16[2] = v151;
          v16[3] = v152;
          *v16 = v149;
          v16[1] = v150;
          v15[2] = v156;
          v15[3] = v157;
          *v15 = v154;
          v15[1] = v155;
          v158 = v15[4];
          v159 = v15[5];
          v160 = v15[6];
          v161 = v15[7];
          v162 = vmlaq_f64(vmlaq_f64(v153, v158, *v13), v16[4], v13[8]);
          v163 = vmlaq_f64(vmlaq_f64(v153, v159, v13[1]), v16[5], v13[9]);
          v164 = vmlaq_f64(vmlaq_f64(v153, v160, v13[2]), v16[6], v13[10]);
          v165 = vmlaq_f64(vmlaq_f64(v153, v161, v13[3]), v16[7], v13[11]);
          v16[4] = v158;
          v16[5] = v159;
          v16[6] = v160;
          v16[7] = v161;
          v15[6] = v164;
          v15[7] = v165;
          v15[4] = v162;
          v15[5] = v163;
          v167 = v15[8];
          v166 = v15[9];
          v169 = v15[10];
          v168 = v15[11];
          v170 = vmlaq_f64(v153, v169, v13[6]);
          v171 = vmlaq_f64(v148, v167, v13[4]);
          v172 = vmlaq_f64(vmlaq_f64(v148, v166, v13[5]), v16[9], v13[13]);
          v173 = vmlaq_f64(v171, v16[8], v13[12]);
          v174 = vmlaq_f64(vmlaq_f64(v153, v168, v13[7]), v16[11], v13[15]);
          v175 = vmlaq_f64(v170, v16[10], v13[14]);
          v16[8] = v167;
          v16[9] = v166;
          v16[10] = v169;
          v16[11] = v168;
          v15[10] = v175;
          v15[11] = v174;
          v15[8] = v173;
          v15[9] = v172;
          v146 += a8;
          --v147;
        }
        while (v147);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v20;
}

uint64_t RamstadSRC::processStereoFracD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  float64x2_t *v13;
  uint64_t v14;
  float64x2_t *v15;
  float64x2_t *v16;
  int v17;
  uint64_t v18;
  int i;
  uint64_t v20;
  int v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float v46;
  uint64_t v47;
  float64x2_t *v48;
  float64x2_t *v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  int64x2_t v80;
  int64x2_t v81;
  int v82;
  uint64_t v83;
  int v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  uint64_t v113;
  float64x2_t *v114;
  float64x2_t *v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  int64x2_t v167;
  int64x2_t v168;
  int64x2_t v169;
  int64x2_t v170;
  int64x2_t v171;
  int64x2_t v172;
  float64x2_t v173;
  int64x2_t v174;
  int64x2_t v175;
  float v176;
  unsigned int v177;
  int v178;
  uint64_t v179;
  int v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  float64x2_t v187;
  float64x2_t v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  float64x2_t v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t v203;
  float64x2_t v204;
  uint64_t v205;
  int v206;
  float64x2_t v207;
  float64x2_t v208;
  float64x2_t v209;
  float64x2_t v210;
  float64x2_t v211;
  float64x2_t v212;
  float64x2_t v213;
  float64x2_t v214;
  float64x2_t v215;
  float64x2_t v216;
  float64x2_t v217;
  float64x2_t v218;
  float64x2_t v219;
  float64x2_t v220;
  float64x2_t v221;
  float64x2_t v222;
  float64x2_t v223;
  float64x2_t v224;
  float64x2_t v225;
  float64x2_t v226;
  float64x2_t v227;
  float64x2_t v228;
  float64x2_t v229;
  float64x2_t v230;
  float64x2_t v231;
  float64x2_t v232;
  float64x2_t v233;
  float64x2_t v234;
  float64x2_t v236;

  v10 = *((_DWORD *)this + 17);
  v9 = *((_DWORD *)this + 18);
  v11 = *((_DWORD *)this + 22);
  v12 = *((_QWORD *)this + 2);
  v13 = *(float64x2_t **)(v12 + 16);
  v14 = *(_QWORD *)(v12 + 40);
  v15 = (float64x2_t *)*((_QWORD *)this + 20);
  v16 = (float64x2_t *)*((_QWORD *)this + 23);
  v17 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      v18 = 0;
    }
    else
    {
      LODWORD(v18) = 0;
      for (i = 0; i != a7; ++i)
      {
        if (v11 < 1)
        {
          v45 = v15[6];
          v44 = v15[7];
          v43 = v15[4];
          v42 = v15[5];
        }
        else
        {
          v20 = 0;
          v21 = v11;
          do
          {
            v22 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v20]), 0);
            v23 = *v15;
            v24 = v15[1];
            v25 = v15[2];
            v26 = v15[3];
            v27 = vmlaq_f64(v22, v26, v13[3]);
            v28 = vmlaq_f64(v22, v25, v13[2]);
            v29 = vmlaq_f64(v22, v24, v13[1]);
            v30 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v20]), 0);
            v31 = vmlaq_f64(vmlaq_f64(v22, *v15, *v13), *v16, v13[4]);
            v32 = vmlaq_f64(v29, v16[1], v13[5]);
            v33 = vmlaq_f64(v28, v16[2], v13[6]);
            v34 = vmlaq_f64(v27, v16[3], v13[7]);
            v16[2] = v25;
            v16[3] = v26;
            *v16 = v23;
            v16[1] = v24;
            v15[2] = v33;
            v15[3] = v34;
            *v15 = v31;
            v15[1] = v32;
            v36 = v15[4];
            v35 = v15[5];
            v38 = v15[6];
            v37 = v15[7];
            v39 = vmlaq_f64(v30, v38, v13[2]);
            v40 = vmlaq_f64(v30, v37, v13[3]);
            v41 = vmlaq_f64(v30, v36, *v13);
            v42 = vmlaq_f64(vmlaq_f64(v30, v35, v13[1]), v16[5], v13[5]);
            v43 = vmlaq_f64(v41, v16[4], v13[4]);
            v44 = vmlaq_f64(v40, v16[7], v13[7]);
            v45 = vmlaq_f64(v39, v16[6], v13[6]);
            v16[4] = v36;
            v16[5] = v35;
            v16[6] = v38;
            v16[7] = v37;
            v15[6] = v45;
            v15[7] = v44;
            v15[4] = v43;
            v15[5] = v42;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        v18 = (v18 + v11);
        v46 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        v47 = (v9 >> 22) & 0x1FE;
        v48 = (float64x2_t *)(v14 + (v47 << 6));
        v49 = (float64x2_t *)(v14 + ((unint64_t)(v47 + 2) << 6));
        v50 = v48[1];
        v52 = v48[2];
        v51 = v48[3];
        v53 = v15[1];
        v55 = v15[2];
        v54 = v15[3];
        v56 = v48[6];
        v57 = v48[7];
        v58 = v48[4];
        v59 = v48[5];
        v60 = v16[2];
        v61 = v16[3];
        v62 = v16[1];
        v63 = vmlaq_f64(vmulq_f64(v59, v62), v53, v50);
        v64 = v16[6];
        v65 = v16[7];
        v66 = v16[4];
        v67 = v16[5];
        v68 = vmlaq_f64(vmulq_f64(v59, v67), v42, v50);
        v69 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, *v16), *v15, *v48), vmlaq_f64(vmulq_f64(v56, v60), v55, v52)), vaddq_f64(v63, vmlaq_f64(vmulq_f64(v57, v61), v54, v51)));
        v70 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, v66), v43, *v48), vmlaq_f64(vmulq_f64(v56, v64), v45, v52)), vaddq_f64(v68, vmlaq_f64(vmulq_f64(v57, v65), v44, v51)));
        v71 = v49[1];
        v73 = v49[2];
        v72 = v49[3];
        v74 = v49[6];
        v75 = v49[7];
        v76 = v49[4];
        v77 = v49[5];
        v78 = vmlaq_f64(vmulq_f64(v62, v77), v53, v71);
        v79 = vmlaq_f64(vmulq_f64(v67, v77), v42, v71);
        v80 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v16, v76), *v15, *v49), vmlaq_f64(vmulq_f64(v60, v74), v55, v73)), vaddq_f64(v78, vmlaq_f64(vmulq_f64(v61, v75), v54, v72)));
        *(float32x2_t *)v80.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v80, v69), (float64x2_t)vzip2q_s64(v80, v69)));
        v81 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v66, v76), v43, *v49), vmlaq_f64(vmulq_f64(v64, v74), v45, v73)), vaddq_f64(v79, vmlaq_f64(vmulq_f64(v65, v75), v44, v72)));
        *(float32x2_t *)v81.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v81, v70), (float64x2_t)vzip2q_s64(v81, v70)));
        *a4 = *(float *)&v80.i32[1] + (float)(v46 * (float)(*(float *)v80.i32 - *(float *)&v80.i32[1]));
        *a5 = *(float *)&v81.i32[1] + (float)(v46 * (float)(*(float *)v81.i32 - *(float *)&v81.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v49) = v9 + v10;
        v9 = (v9 + v10) & 0x7FFFFFFF;
        v11 = v17 + (v49 >> 31);
      }
    }
    v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178)
        v178 = v11;
      if (v178 >= 1)
      {
        v179 = 0;
        v180 = v178;
        do
        {
          v181 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v179]), 0);
          v182 = *v15;
          v183 = v15[1];
          v184 = v15[2];
          v185 = v15[3];
          v186 = vmlaq_f64(v181, v185, v13[3]);
          v187 = vmlaq_f64(v181, v184, v13[2]);
          v188 = vmlaq_f64(v181, v183, v13[1]);
          v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v179]), 0);
          v190 = vmlaq_f64(vmlaq_f64(v181, *v15, *v13), *v16, v13[4]);
          v191 = vmlaq_f64(v188, v16[1], v13[5]);
          v192 = vmlaq_f64(v187, v16[2], v13[6]);
          v193 = vmlaq_f64(v186, v16[3], v13[7]);
          v16[2] = v184;
          v16[3] = v185;
          *v16 = v182;
          v16[1] = v183;
          v15[2] = v192;
          v15[3] = v193;
          *v15 = v190;
          v15[1] = v191;
          v195 = v15[4];
          v194 = v15[5];
          v197 = v15[6];
          v196 = v15[7];
          v198 = vmlaq_f64(v189, v197, v13[2]);
          v199 = vmlaq_f64(v189, v196, v13[3]);
          v200 = vmlaq_f64(v189, v195, *v13);
          v201 = vmlaq_f64(vmlaq_f64(v189, v194, v13[1]), v16[5], v13[5]);
          v202 = vmlaq_f64(v200, v16[4], v13[4]);
          v203 = vmlaq_f64(v199, v16[7], v13[7]);
          v204 = vmlaq_f64(v198, v16[6], v13[6]);
          v16[4] = v195;
          v16[5] = v194;
          v16[6] = v197;
          v16[7] = v196;
          v15[6] = v204;
          v15[7] = v203;
          v15[4] = v202;
          v15[5] = v201;
          v179 += a8;
          --v180;
        }
        while (v180);
      }
LABEL_35:
      v11 -= v178;
      v18 = (v178 + v18);
    }
  }
  else
  {
    if (a7 < 1)
    {
      v18 = 0;
    }
    else
    {
      v82 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v11 < 1)
        {
          v112 = v15[10];
          v111 = v15[11];
          v110 = v15[8];
          v109 = v15[9];
        }
        else
        {
          v83 = 0;
          v84 = v11;
          do
          {
            v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v83]), 0);
            v86 = *v15;
            v87 = v15[1];
            v88 = v15[2];
            v89 = v15[3];
            v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v83]), 0);
            v91 = vmlaq_f64(vmlaq_f64(v85, *v15, *v13), *v16, v13[8]);
            v92 = vmlaq_f64(vmlaq_f64(v85, v87, v13[1]), v16[1], v13[9]);
            v93 = vmlaq_f64(vmlaq_f64(v85, v88, v13[2]), v16[2], v13[10]);
            v94 = vmlaq_f64(vmlaq_f64(v85, v89, v13[3]), v16[3], v13[11]);
            v16[2] = v88;
            v16[3] = v89;
            *v16 = v86;
            v16[1] = v87;
            v15[2] = v93;
            v15[3] = v94;
            *v15 = v91;
            v15[1] = v92;
            v95 = v15[4];
            v96 = v15[5];
            v97 = v15[6];
            v98 = v15[7];
            v99 = vmlaq_f64(vmlaq_f64(v90, v95, *v13), v16[4], v13[8]);
            v100 = vmlaq_f64(vmlaq_f64(v90, v96, v13[1]), v16[5], v13[9]);
            v101 = vmlaq_f64(vmlaq_f64(v90, v97, v13[2]), v16[6], v13[10]);
            v102 = vmlaq_f64(vmlaq_f64(v90, v98, v13[3]), v16[7], v13[11]);
            v16[4] = v95;
            v16[5] = v96;
            v16[6] = v97;
            v16[7] = v98;
            v15[6] = v101;
            v15[7] = v102;
            v15[4] = v99;
            v15[5] = v100;
            v104 = v15[8];
            v103 = v15[9];
            v106 = v15[10];
            v105 = v15[11];
            v107 = vmlaq_f64(v90, v106, v13[6]);
            v108 = vmlaq_f64(v85, v104, v13[4]);
            v109 = vmlaq_f64(vmlaq_f64(v85, v103, v13[5]), v16[9], v13[13]);
            v110 = vmlaq_f64(v108, v16[8], v13[12]);
            v111 = vmlaq_f64(vmlaq_f64(v90, v105, v13[7]), v16[11], v13[15]);
            v112 = vmlaq_f64(v107, v16[10], v13[14]);
            v16[8] = v104;
            v16[9] = v103;
            v16[10] = v106;
            v16[11] = v105;
            v15[10] = v112;
            v15[11] = v111;
            v15[8] = v110;
            v15[9] = v109;
            v83 += a8;
            --v84;
          }
          while (v84);
          a2 = (const float *)((char *)a2 + v83 * 4);
          a3 = (const float *)((char *)a3 + v83 * 4);
        }
        v113 = (v9 >> 21) & 0x3FC;
        v114 = (float64x2_t *)(v14 + (v113 << 6));
        v115 = (float64x2_t *)(v14 + ((unint64_t)(v113 + 4) << 6));
        v116 = v114[1];
        v118 = v114[2];
        v117 = v114[3];
        v236 = v15[1];
        v120 = v15[2];
        v119 = v15[3];
        v122 = v114[10];
        v121 = v114[11];
        v124 = v114[8];
        v123 = v114[9];
        v126 = v16[2];
        v125 = v16[3];
        v127 = v16[1];
        v128 = vmlaq_f64(vmulq_f64(v122, v126), v120, v118);
        v129 = vmlaq_f64(vmulq_f64(v124, *v16), *v15, *v114);
        v130 = vmlaq_f64(vmulq_f64(v121, v125), v119, v117);
        v131 = vmlaq_f64(vmulq_f64(v123, v127), v236, v116);
        v132 = v15[4];
        v133 = v15[5];
        v134 = v15[6];
        v135 = v15[7];
        v136 = v16[6];
        v137 = v16[7];
        v138 = v16[4];
        v139 = v16[5];
        v140 = vmlaq_f64(vmulq_f64(v122, v136), v134, v118);
        v141 = vmlaq_f64(vmulq_f64(v124, v138), v132, *v114);
        v142 = vmlaq_f64(vmulq_f64(v121, v137), v135, v117);
        v143 = vmlaq_f64(vmulq_f64(v123, v139), v133, v116);
        v144 = v115[2];
        v145 = v115[10];
        v146 = v115[11];
        v147 = vmlaq_f64(vmulq_f64(v126, v145), v120, v144);
        v149 = v115[8];
        v148 = v115[9];
        v150 = vmlaq_f64(vmulq_f64(*v16, v149), *v15, *v115);
        v151 = vmulq_f64(v138, v149);
        v152 = vmlaq_f64(vmulq_f64(v136, v145), v134, v144);
        v153 = vmlaq_f64(v151, v132, *v115);
        v155 = v16[10];
        v154 = v16[11];
        v156 = vmlaq_f64(vmulq_f64(v114[15], v154), v111, v114[7]);
        v157 = vmlaq_f64(vmulq_f64(v114[14], v155), v112, v114[6]);
        v158 = v115[3];
        v159 = vmlaq_f64(vmulq_f64(v125, v146), v119, v158);
        v160 = v115[1];
        v161 = vmlaq_f64(vmulq_f64(v127, v148), v236, v160);
        v162 = vmlaq_f64(vmulq_f64(v139, v148), v133, v160);
        v163 = vmlaq_f64(vmulq_f64(v154, v115[15]), v111, v115[7]);
        v165 = v16[8];
        v164 = v16[9];
        v166 = vmlaq_f64(vmulq_f64(v155, v115[14]), v112, v115[6]);
        v167 = (int64x2_t)vaddq_f64(vaddq_f64(v129, v128), vaddq_f64(v131, v130));
        v168 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v114[12], v165), v110, v114[4]), vmlaq_f64(vmulq_f64(v114[13], v164), v109, v114[5]));
        v169 = (int64x2_t)vaddq_f64(vaddq_f64(v141, v140), vaddq_f64(v143, v142));
        v170 = (int64x2_t)vaddq_f64(v157, v156);
        v171 = (int64x2_t)vaddq_f64(vaddq_f64(v150, v147), vaddq_f64(v161, v159));
        v172 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v165, v115[12]), v110, v115[4]), vmlaq_f64(vmulq_f64(v164, v115[13]), v109, v115[5]));
        v173 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v171, v167), (float64x2_t)vzip2q_s64(v171, v167)), vaddq_f64((float64x2_t)vzip1q_s64(v172, v168), (float64x2_t)vzip2q_s64(v172, v168)));
        v174 = (int64x2_t)vaddq_f64(vaddq_f64(v153, v152), vaddq_f64(v162, vmlaq_f64(vmulq_f64(v137, v146), v135, v158)));
        v175 = (int64x2_t)vaddq_f64(v166, v163);
        v176 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        *(float32x2_t *)&v173.f64[0] = vcvt_f32_f64(v173);
        *(float32x2_t *)v174.i8 = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v174, v169), (float64x2_t)vzip2q_s64(v174, v169)), vaddq_f64((float64x2_t)vzip1q_s64(v175, v170), (float64x2_t)vzip2q_s64(v175, v170))));
        *a4 = *((float *)v173.f64 + 1) + (float)(v176 * (float)(*(float *)v173.f64 - *((float *)v173.f64 + 1)));
        *a5 = *(float *)&v174.i32[1] + (float)(v176 * (float)(*(float *)v174.i32 - *(float *)&v174.i32[1]));
        v18 = (v18 + v11);
        a4 += a9;
        a5 += a9;
        v177 = v9 + v10;
        v9 = (v9 + v10) & 0x7FFFFFFF;
        v11 = v17 + (v177 >> 31);
        ++v82;
      }
      while (v82 != a7);
    }
    v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178)
        v178 = v11;
      if (v178 >= 1)
      {
        v205 = 0;
        v206 = v178;
        do
        {
          v207 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v205]), 0);
          v208 = *v15;
          v209 = v15[1];
          v210 = v15[2];
          v211 = v15[3];
          v212 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v205]), 0);
          v213 = vmlaq_f64(vmlaq_f64(v207, *v15, *v13), *v16, v13[8]);
          v214 = vmlaq_f64(vmlaq_f64(v207, v209, v13[1]), v16[1], v13[9]);
          v215 = vmlaq_f64(vmlaq_f64(v207, v210, v13[2]), v16[2], v13[10]);
          v216 = vmlaq_f64(vmlaq_f64(v207, v211, v13[3]), v16[3], v13[11]);
          v16[2] = v210;
          v16[3] = v211;
          *v16 = v208;
          v16[1] = v209;
          v15[2] = v215;
          v15[3] = v216;
          *v15 = v213;
          v15[1] = v214;
          v217 = v15[4];
          v218 = v15[5];
          v219 = v15[6];
          v220 = v15[7];
          v221 = vmlaq_f64(vmlaq_f64(v212, v217, *v13), v16[4], v13[8]);
          v222 = vmlaq_f64(vmlaq_f64(v212, v218, v13[1]), v16[5], v13[9]);
          v223 = vmlaq_f64(vmlaq_f64(v212, v219, v13[2]), v16[6], v13[10]);
          v224 = vmlaq_f64(vmlaq_f64(v212, v220, v13[3]), v16[7], v13[11]);
          v16[4] = v217;
          v16[5] = v218;
          v16[6] = v219;
          v16[7] = v220;
          v15[6] = v223;
          v15[7] = v224;
          v15[4] = v221;
          v15[5] = v222;
          v226 = v15[8];
          v225 = v15[9];
          v228 = v15[10];
          v227 = v15[11];
          v229 = vmlaq_f64(v212, v228, v13[6]);
          v230 = vmlaq_f64(v207, v226, v13[4]);
          v231 = vmlaq_f64(vmlaq_f64(v207, v225, v13[5]), v16[9], v13[13]);
          v232 = vmlaq_f64(v230, v16[8], v13[12]);
          v233 = vmlaq_f64(vmlaq_f64(v212, v227, v13[7]), v16[11], v13[15]);
          v234 = vmlaq_f64(v229, v16[10], v13[14]);
          v16[8] = v226;
          v16[9] = v225;
          v16[10] = v228;
          v16[11] = v227;
          v15[10] = v234;
          v15[11] = v233;
          v15[8] = v232;
          v15[9] = v231;
          v205 += a8;
          --v206;
        }
        while (v206);
      }
      goto LABEL_35;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v18;
}

uint64_t RamstadSRC::processStereoInt(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v9;
  int v10;
  int v11;
  float32x4_t *v12;
  uint64_t v13;
  float32x4_t *v14;
  float32x4_t *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const float *v22;
  const float *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t *v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int8x16_t v41;
  int8x16_t v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  const float *v48;
  const float *v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t *v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  int8x16_t v71;
  int8x16_t v72;
  int8x16_t v73;
  int32x2_t v74;
  int8x16_t v75;
  int32x2_t v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  int v81;
  const float *v82;
  const float *v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  uint64_t v95;
  int v96;
  const float *v97;
  const float *v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;

  v10 = *((_DWORD *)this + 17);
  v9 = *((_DWORD *)this + 18);
  v11 = *((_DWORD *)this + 22);
  v12 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v13 = *(_QWORD *)(*(_QWORD *)this + 40);
  v14 = (float32x4_t *)*((_QWORD *)this + 14);
  v15 = (float32x4_t *)*((_QWORD *)this + 17);
  v16 = *((_DWORD *)this + 13);
  v17 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 < 1)
    {
      v19 = 0;
    }
    else
    {
      v18 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          v33 = v14[2];
          v34 = v14[3];
        }
        else
        {
          v20 = 0;
          v21 = v11;
          do
          {
            v22 = &a2[v20];
            v23 = &a3[v20];
            v24 = vld1q_dup_f32(v22);
            v25 = vld1q_dup_f32(v23);
            v26 = v14[1];
            v27 = vmlaq_f32(v24, v26, v12[1]);
            v28 = vmlaq_f32(vmlaq_f32(v24, *v14, *v12), *v15, v12[2]);
            v29 = vmlaq_f32(v27, v15[1], v12[3]);
            *v15 = *v14;
            v15[1] = v26;
            *v14 = v28;
            v14[1] = v29;
            v30 = v14[2];
            v31 = v14[3];
            v32 = vmlaq_f32(v25, v31, v12[1]);
            v33 = vmlaq_f32(vmlaq_f32(v25, v30, *v12), v15[2], v12[2]);
            v34 = vmlaq_f32(v32, v15[3], v12[3]);
            v15[2] = v30;
            v15[3] = v31;
            v14[2] = v33;
            v14[3] = v34;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        v19 = (v19 + v11);
        v35 = (float32x4_t *)(v13 + 64 * v9);
        v36 = v35[1];
        v38 = v35[2];
        v37 = v35[3];
        v39 = vmlaq_f32(vmulq_f32(v37, v15[3]), v34, v36);
        v40 = vmlaq_f32(vmulq_f32(v38, v15[2]), v33, *v35);
        v41 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v38, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v37, v15[1]), v14[1], v36));
        *a4 = vaddv_f32(vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL)));
        v42 = (int8x16_t)vaddq_f32(v40, v39);
        *a5 = vaddv_f32(vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)));
        a4 += a9;
        a5 += a9;
        v43 = v9 + v10;
        if (v43 < v16)
          v11 = v17;
        else
          v11 = v17 + 1;
        if (v43 < v16)
          v44 = 0;
        else
          v44 = v16;
        v9 = v43 - v44;
        ++v18;
      }
      while (v18 != a7);
    }
    v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79)
        v79 = v11;
      if (v79 >= 1)
      {
        v80 = 0;
        v81 = v79;
        do
        {
          v82 = &a2[v80];
          v83 = &a3[v80];
          v84 = vld1q_dup_f32(v82);
          v85 = vld1q_dup_f32(v83);
          v86 = v14[1];
          v87 = vmlaq_f32(v84, v86, v12[1]);
          v88 = vmlaq_f32(vmlaq_f32(v84, *v14, *v12), *v15, v12[2]);
          v89 = vmlaq_f32(v87, v15[1], v12[3]);
          *v15 = *v14;
          v15[1] = v86;
          *v14 = v88;
          v14[1] = v89;
          v90 = v14[2];
          v91 = v14[3];
          v92 = vmlaq_f32(v85, v91, v12[1]);
          v93 = vmlaq_f32(vmlaq_f32(v85, v90, *v12), v15[2], v12[2]);
          v94 = vmlaq_f32(v92, v15[3], v12[3]);
          v15[2] = v90;
          v15[3] = v91;
          v14[2] = v93;
          v14[3] = v94;
          v80 += a8;
          --v81;
        }
        while (v81);
      }
LABEL_47:
      v11 -= v79;
      v19 = (v79 + v19);
    }
  }
  else
  {
    if (a7 < 1)
    {
      v19 = 0;
    }
    else
    {
      v45 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          v61 = v14[4];
          v62 = v14[5];
        }
        else
        {
          v46 = 0;
          v47 = v11;
          do
          {
            v48 = &a2[v46];
            v49 = &a3[v46];
            v50 = vld1q_dup_f32(v48);
            v51 = v14[1];
            v52 = vld1q_dup_f32(v49);
            v53 = vmlaq_f32(vmlaq_f32(v50, *v14, *v12), *v15, v12[4]);
            v54 = vmlaq_f32(vmlaq_f32(v50, v51, v12[1]), v15[1], v12[5]);
            *v15 = *v14;
            v15[1] = v51;
            *v14 = v53;
            v14[1] = v54;
            v55 = v14[2];
            v56 = v14[3];
            v57 = vmlaq_f32(vmlaq_f32(v52, v55, *v12), v15[2], v12[4]);
            v58 = vmlaq_f32(vmlaq_f32(v52, v56, v12[1]), v15[3], v12[5]);
            v15[2] = v55;
            v15[3] = v56;
            v14[2] = v57;
            v14[3] = v58;
            v59 = v14[4];
            v60 = v14[5];
            v61 = vmlaq_f32(vmlaq_f32(v50, v59, v12[2]), v15[4], v12[6]);
            v62 = vmlaq_f32(vmlaq_f32(v52, v60, v12[3]), v15[5], v12[7]);
            v15[4] = v59;
            v15[5] = v60;
            v14[4] = v61;
            v14[5] = v62;
            v46 += a8;
            --v47;
          }
          while (v47);
          a2 = (const float *)((char *)a2 + v46 * 4);
          a3 = (const float *)((char *)a3 + v46 * 4);
        }
        v19 = (v19 + v11);
        v63 = (float32x4_t *)(v13 + 128 * v9);
        v64 = v63[1];
        v66 = v63[4];
        v65 = v63[5];
        v67 = vmlaq_f32(vmulq_f32(v65, v15[1]), v14[1], v64);
        v68 = vmlaq_f32(vmulq_f32(v66, *v15), *v14, *v63);
        v69 = vmlaq_f32(vmulq_f32(v65, v15[3]), v14[3], v64);
        v70 = vmlaq_f32(vmulq_f32(v66, v15[2]), v14[2], *v63);
        v71 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[7], v15[5]), v62, v63[3]);
        v72 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[6], v15[4]), v61, v63[2]);
        v73 = (int8x16_t)vaddq_f32(v68, v67);
        *(float32x2_t *)v73.i8 = vadd_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL));
        v74 = (int32x2_t)vadd_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL));
        *a4 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v73.i8, v74), (float32x2_t)vzip2_s32(*(int32x2_t *)v73.i8, v74)));
        v75 = (int8x16_t)vaddq_f32(v70, v69);
        *(float32x2_t *)v75.i8 = vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v75, v75, 8uLL));
        v76 = (int32x2_t)vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v71, v71, 8uLL));
        *a5 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v75.i8, v76), (float32x2_t)vzip2_s32(*(int32x2_t *)v75.i8, v76)));
        a4 += a9;
        a5 += a9;
        v77 = v9 + v10;
        if (v77 < v16)
          v11 = v17;
        else
          v11 = v17 + 1;
        if (v77 < v16)
          v78 = 0;
        else
          v78 = v16;
        v9 = v77 - v78;
        ++v45;
      }
      while (v45 != a7);
    }
    v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79)
        v79 = v11;
      if (v79 >= 1)
      {
        v95 = 0;
        v96 = v79;
        do
        {
          v97 = &a2[v95];
          v98 = &a3[v95];
          v99 = vld1q_dup_f32(v97);
          v100 = v14[1];
          v101 = vld1q_dup_f32(v98);
          v102 = vmlaq_f32(vmlaq_f32(v99, *v14, *v12), *v15, v12[4]);
          v103 = vmlaq_f32(vmlaq_f32(v99, v100, v12[1]), v15[1], v12[5]);
          *v15 = *v14;
          v15[1] = v100;
          *v14 = v102;
          v14[1] = v103;
          v104 = v14[2];
          v105 = v14[3];
          v106 = vmlaq_f32(vmlaq_f32(v101, v104, *v12), v15[2], v12[4]);
          v107 = vmlaq_f32(vmlaq_f32(v101, v105, v12[1]), v15[3], v12[5]);
          v15[2] = v104;
          v15[3] = v105;
          v14[2] = v106;
          v14[3] = v107;
          v108 = v14[4];
          v109 = v14[5];
          v110 = vmlaq_f32(vmlaq_f32(v99, v108, v12[2]), v15[4], v12[6]);
          v111 = vmlaq_f32(vmlaq_f32(v101, v109, v12[3]), v15[5], v12[7]);
          v15[4] = v108;
          v15[5] = v109;
          v14[4] = v110;
          v14[5] = v111;
          v95 += a8;
          --v96;
        }
        while (v96);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v19;
}

uint64_t RamstadSRC::processStereoFrac(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  unsigned int v9;
  int v10;
  int v11;
  float32x4_t *v12;
  uint64_t v13;
  float32x4_t *v14;
  float32x4_t *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  const float *v20;
  const float *v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  uint64_t v34;
  float32x4_t *v35;
  float32x4_t *v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  int8x16_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int v52;
  uint64_t v53;
  const float *v54;
  const float *v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float v69;
  uint64_t v70;
  float32x4_t *v71;
  float32x4_t *v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  int8x16_t v86;
  int8x16_t v87;
  int8x16_t v88;
  int8x16_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  int8x16_t v96;
  int8x16_t v97;
  int8x16_t v98;
  int32x2_t v99;
  int8x16_t v100;
  int v101;
  uint64_t v102;
  int v103;
  const float *v104;
  const float *v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  uint64_t v117;
  int v118;
  const float *v119;
  const float *v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  std::runtime_error *exception;

  v10 = *((_DWORD *)this + 17);
  v9 = *((_DWORD *)this + 18);
  v11 = *((_DWORD *)this + 22);
  v12 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v13 = *(_QWORD *)(*(_QWORD *)this + 40);
  v14 = (float32x4_t *)*((_QWORD *)this + 14);
  v15 = (float32x4_t *)*((_QWORD *)this + 17);
  v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a7 >= 1)
    {
      LODWORD(v17) = 0;
      v18 = 0;
      while (1)
      {
        v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 64))
          goto LABEL_39;
        if (v11 < 1)
        {
          v31 = v14[2];
          v32 = v14[3];
        }
        else
        {
          v19 = 0;
          do
          {
            v20 = &a2[v19];
            v21 = &a3[v19];
            v22 = vld1q_dup_f32(v20);
            v23 = vld1q_dup_f32(v21);
            v24 = v14[1];
            v25 = vmlaq_f32(v22, v24, v12[1]);
            v26 = vmlaq_f32(vmlaq_f32(v22, *v14, *v12), *v15, v12[2]);
            v27 = vmlaq_f32(v25, v15[1], v12[3]);
            *v15 = *v14;
            v15[1] = v24;
            *v14 = v26;
            v14[1] = v27;
            v28 = v14[2];
            v29 = v14[3];
            v30 = vmlaq_f32(v23, v29, v12[1]);
            v31 = vmlaq_f32(vmlaq_f32(v23, v28, *v12), v15[2], v12[2]);
            v32 = vmlaq_f32(v30, v15[3], v12[3]);
            v15[2] = v28;
            v15[3] = v29;
            v14[2] = v31;
            v14[3] = v32;
            v19 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v19 * 4);
          a3 = (const float *)((char *)a3 + v19 * 4);
        }
        v33 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        v34 = (v9 >> 22) & 0x1FE;
        v35 = (float32x4_t *)(v13 + 32 * v34);
        v36 = (float32x4_t *)(v13 + 32 * (v34 + 2));
        v37 = v35[1];
        v38 = v14[1];
        v40 = v35[2];
        v39 = v35[3];
        v41 = v15[1];
        v43 = v15[2];
        v42 = v15[3];
        v44 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v39, v41), v38, v37));
        *(float32x2_t *)v44.i8 = vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, v43), v31, *v35), vmlaq_f32(vmulq_f32(v39, v42), v32, v37));
        *(float32x2_t *)v45.i8 = vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
        v46 = v36[1];
        v48 = v36[2];
        v47 = v36[3];
        v49 = vmlaq_f32(vmulq_f32(v43, v48), v31, *v36);
        v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v48), *v14, *v36), vmlaq_f32(vmulq_f32(v41, v47), v38, v46));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        *(float32x2_t *)v50.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8));
        v51 = (int8x16_t)vaddq_f32(v49, vmlaq_f32(vmulq_f32(v42, v47), v32, v46));
        *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
        *(float32x2_t *)v51.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8));
        *a4 = *(float *)&v50.i32[1] + (float)(v33 * (float)(*(float *)v50.i32 - *(float *)&v50.i32[1]));
        *a5 = *(float *)&v51.i32[1] + (float)(v33 * (float)(*(float *)v51.i32 - *(float *)&v51.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v36) = v9 + v10;
        v9 = (v9 + v10) & 0x7FFFFFFF;
        v11 = v16 + (v36 >> 31);
        if (++v18 == a7)
          goto LABEL_23;
      }
    }
    v17 = 0;
LABEL_23:
    v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101)
        v101 = v11;
      if (v101 >= 1)
      {
        v102 = 0;
        v103 = v101;
        do
        {
          v104 = &a2[v102];
          v105 = &a3[v102];
          v106 = vld1q_dup_f32(v104);
          v107 = vld1q_dup_f32(v105);
          v108 = v14[1];
          v109 = vmlaq_f32(v106, v108, v12[1]);
          v110 = vmlaq_f32(vmlaq_f32(v106, *v14, *v12), *v15, v12[2]);
          v111 = vmlaq_f32(v109, v15[1], v12[3]);
          *v15 = *v14;
          v15[1] = v108;
          *v14 = v110;
          v14[1] = v111;
          v112 = v14[2];
          v113 = v14[3];
          v114 = vmlaq_f32(v107, v113, v12[1]);
          v115 = vmlaq_f32(vmlaq_f32(v107, v112, *v12), v15[2], v12[2]);
          v116 = vmlaq_f32(v114, v15[3], v12[3]);
          v15[2] = v112;
          v15[3] = v113;
          v14[2] = v115;
          v14[3] = v116;
          v102 += a8;
          --v103;
        }
        while (v103);
      }
LABEL_37:
      v11 -= v101;
      v17 = (v101 + v17);
    }
  }
  else
  {
    if (a7 >= 1)
    {
      v52 = 0;
      LODWORD(v17) = 0;
      while (1)
      {
        v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 64))
          break;
        if (v11 < 1)
        {
          v67 = v14[4];
          v68 = v14[5];
        }
        else
        {
          v53 = 0;
          do
          {
            v54 = &a2[v53];
            v55 = &a3[v53];
            v56 = vld1q_dup_f32(v54);
            v57 = v14[1];
            v58 = vld1q_dup_f32(v55);
            v59 = vmlaq_f32(vmlaq_f32(v56, *v14, *v12), *v15, v12[4]);
            v60 = vmlaq_f32(vmlaq_f32(v56, v57, v12[1]), v15[1], v12[5]);
            *v15 = *v14;
            v15[1] = v57;
            *v14 = v59;
            v14[1] = v60;
            v61 = v14[2];
            v62 = v14[3];
            v63 = vmlaq_f32(vmlaq_f32(v58, v61, *v12), v15[2], v12[4]);
            v64 = vmlaq_f32(vmlaq_f32(v58, v62, v12[1]), v15[3], v12[5]);
            v15[2] = v61;
            v15[3] = v62;
            v14[2] = v63;
            v14[3] = v64;
            v65 = v14[4];
            v66 = v14[5];
            v67 = vmlaq_f32(vmlaq_f32(v56, v65, v12[2]), v15[4], v12[6]);
            v68 = vmlaq_f32(vmlaq_f32(v58, v66, v12[3]), v15[5], v12[7]);
            v15[4] = v65;
            v15[5] = v66;
            v14[4] = v67;
            v14[5] = v68;
            v53 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v53 * 4);
          a3 = (const float *)((char *)a3 + v53 * 4);
        }
        v69 = *((double *)this + 12) * (double)(v9 & 0x7FFFFF);
        v70 = (v9 >> 21) & 0x3FC;
        v71 = (float32x4_t *)(v13 + 32 * v70);
        v72 = (float32x4_t *)(v13 + 32 * (v70 + 4));
        v73 = v71[1];
        v74 = v14[1];
        v76 = v71[4];
        v75 = v71[5];
        v77 = v15[1];
        v78 = vmlaq_f32(vmulq_f32(v75, v77), v74, v73);
        v79 = v14[2];
        v80 = v14[3];
        v82 = v15[2];
        v81 = v15[3];
        v83 = vmlaq_f32(vmulq_f32(v75, v81), v80, v73);
        v85 = v15[4];
        v84 = v15[5];
        v86 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[7], v84), v68, v71[3]);
        v87 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[6], v85), v67, v71[2]);
        v88 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, *v15), *v14, *v71), v78);
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v88, v88, 8uLL));
        *(float32x2_t *)v73.f32 = vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v87, v87, 8uLL));
        v89 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, v82), v79, *v71), v83);
        *(float32x2_t *)v89.i8 = vadd_f32(*(float32x2_t *)v89.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v89, v89, 8uLL));
        *(float32x2_t *)v76.f32 = vadd_f32(*(float32x2_t *)v86.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v86, v86, 8uLL));
        v90 = v72[1];
        v92 = v72[4];
        v91 = v72[5];
        v93 = vmlaq_f32(vmulq_f32(v77, v91), v74, v90);
        v94 = vmlaq_f32(vmulq_f32(v81, v91), v80, v90);
        v95 = vmlaq_f32(vmulq_f32(v82, v92), v79, *v72);
        v96 = (int8x16_t)vmlaq_f32(vmulq_f32(v84, v72[7]), v68, v72[3]);
        v97 = (int8x16_t)vmlaq_f32(vmulq_f32(v85, v72[6]), v67, v72[2]);
        v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v92), *v14, *v72), v93);
        *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
        v99 = (int32x2_t)vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
        *(float32x2_t *)v98.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8)), vadd_f32((float32x2_t)vzip1_s32(v99, *(int32x2_t *)v73.f32), (float32x2_t)vzip2_s32(v99, *(int32x2_t *)v73.f32)));
        v100 = (int8x16_t)vaddq_f32(v95, v94);
        *(float32x2_t *)v100.i8 = vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v100, v100, 8uLL));
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
        *(float32x2_t *)v100.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32), (float32x2_t)vzip2_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32)));
        *a4 = *(float *)&v98.i32[1] + (float)(v69 * (float)(*(float *)v98.i32 - *(float *)&v98.i32[1]));
        *a5 = *(float *)&v100.i32[1] + (float)(v69 * (float)(*(float *)v100.i32 - *(float *)&v100.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v72) = v9 + v10;
        v9 = (v9 + v10) & 0x7FFFFFFF;
        v11 = v16 + (v72 >> 31);
        if (++v52 == a7)
          goto LABEL_31;
      }
LABEL_39:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "RamstadSRC::processStereoFrac preflight prediction failed.");
    }
    v17 = 0;
LABEL_31:
    v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101)
        v101 = v11;
      if (v101 >= 1)
      {
        v117 = 0;
        v118 = v101;
        do
        {
          v119 = &a2[v117];
          v120 = &a3[v117];
          v121 = vld1q_dup_f32(v119);
          v122 = v14[1];
          v123 = vld1q_dup_f32(v120);
          v124 = vmlaq_f32(vmlaq_f32(v121, *v14, *v12), *v15, v12[4]);
          v125 = vmlaq_f32(vmlaq_f32(v121, v122, v12[1]), v15[1], v12[5]);
          *v15 = *v14;
          v15[1] = v122;
          *v14 = v124;
          v14[1] = v125;
          v126 = v14[2];
          v127 = v14[3];
          v128 = vmlaq_f32(vmlaq_f32(v123, v126, *v12), v15[2], v12[4]);
          v129 = vmlaq_f32(vmlaq_f32(v123, v127, v12[1]), v15[3], v12[5]);
          v15[2] = v126;
          v15[3] = v127;
          v14[2] = v128;
          v14[3] = v129;
          v130 = v14[4];
          v131 = v14[5];
          v132 = vmlaq_f32(vmlaq_f32(v121, v130, v12[2]), v15[4], v12[6]);
          v133 = vmlaq_f32(vmlaq_f32(v123, v131, v12[3]), v15[5], v12[7]);
          v15[4] = v130;
          v15[5] = v131;
          v14[4] = v132;
          v14[5] = v133;
          v117 += a8;
          --v118;
        }
        while (v118);
      }
      goto LABEL_37;
    }
  }
  *((_DWORD *)this + 18) = v9;
  *((_DWORD *)this + 22) = v11;
  return v17;
}

void sub_1A838D6C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double RamstadSRC::processMulti(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  double result;

  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((_BYTE *)this + 93))
  {
    if (*((_BYTE *)this + 92))
      RamstadSRC::processMultiIntD(this, a2, a3, a4, a5, a6, a7);
    else
      RamstadSRC::processMultiFracD(this, a2, a3, a4, a5, a6, a7);
  }
  else if (*((_BYTE *)this + 92))
  {
    RamstadSRC::processMultiInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMultiFrac(this, a2, a3, a4, a5, a6, a7);
  }
  result = NAN;
  *((_QWORD *)this + 32) = -1;
  *((_DWORD *)this + 66) = -1;
  return result;
}

void sub_1A838D78C(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 256) = -1;
  *(_DWORD *)(v1 + 264) = -1;
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::processMultiIntD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  float64x2_t *v11;
  uint64_t v12;
  float64x2_t *v13;
  float64x2_t *v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const float *const *v23;
  float64x2_t *v24;
  float64x2_t *v25;
  uint64_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  uint64_t v39;
  float64x2_t *v40;
  float64x2_t *v41;
  float64x2_t *v42;
  float *const *v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  uint64_t v48;
  float v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  float64x2_t *v57;
  float64x2_t *v58;
  unint64_t v59;
  unint64_t v60;
  const float *const *v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t *v108;
  int v109;
  float64x2_t *v110;
  float64x2_t *v111;
  unint64_t v112;
  unint64_t v113;
  float *const *v114;
  float64x2_t v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  uint64_t v123;
  float *v124;
  int64x2_t v125;
  int64x2_t v126;
  int64x2_t v127;
  int64x2_t v128;
  int64x2_t v129;
  int64x2_t v130;
  int v131;
  int v132;
  int v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const float *const *v138;
  float64x2_t *v139;
  float64x2_t *v140;
  uint64_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  float64x2_t *v158;
  float64x2_t *v159;
  unint64_t v160;
  unint64_t v161;
  const float *const *v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t v175;
  float64x2_t v176;
  float64x2_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  float64x2_t v187;
  float64x2_t v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  float64x2_t v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t v203;
  float64x2_t v204;
  float64x2_t v205;
  float64x2_t v206;
  float64x2_t v207;
  float64x2_t v208;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *((_QWORD *)this + 2);
  v11 = *(float64x2_t **)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 40);
  v13 = (float64x2_t *)*((_QWORD *)this + 20);
  v14 = (float64x2_t *)*((_QWORD *)this + 23);
  v15 = *((_DWORD *)this + 13);
  v16 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v20 = 0;
      LODWORD(v19) = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      LODWORD(v19) = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v9 >= 1)
        {
          v21 = 0;
          v19 = (int)v19;
          do
          {
            v22 = *((unsigned int *)this + 12);
            if ((_DWORD)v22)
            {
              v23 = a2;
              v24 = v13;
              v25 = v14;
              do
              {
                v26 = (uint64_t)*v23++;
                v27 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v26 + 4 * v19)), 0);
                v29 = *v24;
                v28 = v24[1];
                v31 = v24[2];
                v30 = v24[3];
                v32 = vmlaq_f64(v27, v31, v11[2]);
                v33 = vmlaq_f64(v27, v30, v11[3]);
                v34 = vmlaq_f64(v27, *v24, *v11);
                v35 = vmlaq_f64(vmlaq_f64(v27, v28, v11[1]), v25[1], v11[5]);
                v36 = vmlaq_f64(v34, *v25, v11[4]);
                v37 = vmlaq_f64(v33, v25[3], v11[7]);
                v38 = vmlaq_f64(v32, v25[2], v11[6]);
                v25[2] = v31;
                v25[3] = v30;
                *v25 = v29;
                v25[1] = v28;
                v25 += 4;
                v24[2] = v38;
                v24[3] = v37;
                *v24 = v36;
                v24[1] = v35;
                v24 += 4;
                --v22;
              }
              while (v22);
            }
            v19 += a6;
            ++v21;
          }
          while (v21 != v9);
        }
        v39 = *((unsigned int *)this + 12);
        if ((_DWORD)v39)
        {
          v41 = v13;
          v42 = v14;
          v43 = a3;
          do
          {
            v44 = v42[2];
            v45 = v42[3];
            v46 = *v42;
            v47 = v42[1];
            v42 += 4;
            v48 = (uint64_t)*v43++;
            v40 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
            v49 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v40[4], v46), *v41, *v40), vmlaq_f64(vmulq_f64(v40[6], v44), v41[2], v40[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v40[5], v47), v41[1], v40[1]), vmlaq_f64(vmulq_f64(v40[7], v45), v41[3], v40[3]))));
            *(float *)(v48 + 4 * v17) = v49;
            v41 += 4;
            --v39;
          }
          while (v39);
        }
        v20 = (v20 + v9);
        v50 = v7 + v8;
        if (v50 < v15)
          v9 = v16;
        else
          v9 = v16 + 1;
        if (v50 < v15)
          v51 = 0;
        else
          v51 = v15;
        v7 = v50 - v51;
        ++v18;
        v17 += a7;
      }
      while (v18 != a5);
    }
    v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133)
        v133 = v9;
      if (v133 >= 1)
      {
        v134 = 0;
        v135 = (int)v19;
        v136 = a6;
        do
        {
          v137 = *((unsigned int *)this + 12);
          if ((_DWORD)v137)
          {
            v138 = a2;
            v139 = v13;
            v140 = v14;
            do
            {
              v141 = (uint64_t)*v138++;
              v142 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v141 + 4 * v135)), 0);
              v144 = *v139;
              v143 = v139[1];
              v146 = v139[2];
              v145 = v139[3];
              v147 = vmlaq_f64(v142, v146, v11[2]);
              v148 = vmlaq_f64(v142, v145, v11[3]);
              v149 = vmlaq_f64(v142, *v139, *v11);
              v150 = vmlaq_f64(vmlaq_f64(v142, v143, v11[1]), v140[1], v11[5]);
              v151 = vmlaq_f64(v149, *v140, v11[4]);
              v152 = vmlaq_f64(v148, v140[3], v11[7]);
              v153 = vmlaq_f64(v147, v140[2], v11[6]);
              v140[2] = v146;
              v140[3] = v145;
              *v140 = v144;
              v140[1] = v143;
              v140 += 4;
              v139[2] = v153;
              v139[3] = v152;
              *v139 = v151;
              v139[1] = v150;
              v139 += 4;
              --v137;
            }
            while (v137);
          }
          v135 += v136;
          ++v134;
        }
        while (v134 != v133);
      }
LABEL_67:
      v9 -= v133;
      v20 = (v133 + v20);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v20 = 0;
      LODWORD(v54) = 0;
    }
    else
    {
      v52 = 0;
      v53 = 0;
      LODWORD(v54) = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v9 >= 1)
        {
          v55 = 0;
          v54 = (int)v54;
          do
          {
            v56 = *((_DWORD *)this + 12);
            v57 = v13;
            v58 = v14;
            v59 = v56 - (v56 != 0);
            if ((_DWORD)v59)
            {
              v60 = 0;
              v58 = v14;
              v57 = v13;
              do
              {
                v61 = &a2[v60];
                v62 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v61)[v54]), 0);
                v63 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((_QWORD *)v61 + 1) + 4 * v54)), 0);
                v64 = *v57;
                v65 = v57[1];
                v66 = v57[2];
                v67 = v57[3];
                v68 = vmlaq_f64(vmlaq_f64(v62, *v57, *v11), *v58, v11[8]);
                v69 = vmlaq_f64(vmlaq_f64(v62, v65, v11[1]), v58[1], v11[9]);
                v70 = vmlaq_f64(vmlaq_f64(v62, v66, v11[2]), v58[2], v11[10]);
                v71 = vmlaq_f64(vmlaq_f64(v62, v67, v11[3]), v58[3], v11[11]);
                v58[2] = v66;
                v58[3] = v67;
                *v58 = v64;
                v58[1] = v65;
                v57[2] = v70;
                v57[3] = v71;
                *v57 = v68;
                v57[1] = v69;
                v72 = v57[4];
                v73 = v57[5];
                v74 = v57[6];
                v75 = v57[7];
                v76 = vmlaq_f64(vmlaq_f64(v63, v72, *v11), v58[4], v11[8]);
                v77 = vmlaq_f64(vmlaq_f64(v63, v73, v11[1]), v58[5], v11[9]);
                v78 = vmlaq_f64(vmlaq_f64(v63, v74, v11[2]), v58[6], v11[10]);
                v79 = vmlaq_f64(vmlaq_f64(v63, v75, v11[3]), v58[7], v11[11]);
                v58[4] = v72;
                v58[5] = v73;
                v58[6] = v74;
                v58[7] = v75;
                v57[6] = v78;
                v57[7] = v79;
                v57[4] = v76;
                v57[5] = v77;
                v81 = v57[8];
                v80 = v57[9];
                v83 = v57[10];
                v82 = v57[11];
                v84 = vmlaq_f64(v63, v83, v11[6]);
                v85 = vmlaq_f64(v62, v81, v11[4]);
                v86 = vmlaq_f64(vmlaq_f64(v62, v80, v11[5]), v58[9], v11[13]);
                v87 = vmlaq_f64(v85, v58[8], v11[12]);
                v88 = vmlaq_f64(vmlaq_f64(v63, v82, v11[7]), v58[11], v11[15]);
                v89 = vmlaq_f64(v84, v58[10], v11[14]);
                v58[8] = v81;
                v58[9] = v80;
                v58[10] = v83;
                v58[11] = v82;
                v57[10] = v89;
                v57[11] = v88;
                v57[8] = v87;
                v57[9] = v86;
                v57 += 12;
                v58 += 12;
                v60 += 2;
              }
              while (v60 < v59);
            }
            if ((v56 & 1) != 0)
            {
              v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v56 - 1][v54]), 0);
              v91 = *v57;
              v92 = v57[1];
              v93 = v57[2];
              v94 = v57[3];
              v95 = vmlaq_f64(vmlaq_f64(v90, *v57, *v11), *v58, v11[8]);
              v96 = vmlaq_f64(vmlaq_f64(v90, v92, v11[1]), v58[1], v11[9]);
              v97 = vmlaq_f64(vmlaq_f64(v90, v93, v11[2]), v58[2], v11[10]);
              v98 = vmlaq_f64(vmlaq_f64(v90, v94, v11[3]), v58[3], v11[11]);
              v58[2] = v93;
              v58[3] = v94;
              *v58 = v91;
              v58[1] = v92;
              v57[2] = v97;
              v57[3] = v98;
              *v57 = v95;
              v57[1] = v96;
              v100 = v57[4];
              v99 = v57[5];
              v102 = v57[6];
              v101 = v57[7];
              v103 = vmlaq_f64(v90, v100, v11[4]);
              v104 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v101, v11[7]), v58[7], v11[15]);
              v105 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v102, v11[6]), v58[6], v11[14]);
              v106 = vmlaq_f64(vmlaq_f64(v90, v99, v11[5]), v58[5], v11[13]);
              v107 = vmlaq_f64(v103, v58[4], v11[12]);
              v58[4] = v100;
              v58[5] = v99;
              v58[6] = v102;
              v58[7] = v101;
              v57[6] = v105;
              v57[7] = v104;
              v57[4] = v107;
              v57[5] = v106;
            }
            v54 += a6;
            ++v55;
          }
          while (v55 != v9);
        }
        v108 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        v109 = *((_DWORD *)this + 12);
        v110 = v13;
        v111 = v14;
        v112 = v109 - (v109 != 0);
        if ((_DWORD)v112)
        {
          v113 = 0;
          v111 = v14;
          v110 = v13;
          do
          {
            v114 = &a3[v113];
            v115 = v108[1];
            v117 = v108[2];
            v116 = v108[3];
            v118 = v108[10];
            v119 = v108[11];
            v120 = v108[8];
            v121 = v108[9];
            v122 = vmlaq_f64(vmulq_f64(v121, v111[5]), v110[5], v115);
            v124 = *v114;
            v123 = *((_QWORD *)v114 + 1);
            v125 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v118, v111[2]), v110[2], v117)), vaddq_f64(vmlaq_f64(vmulq_f64(v121, v111[1]), v110[1], v115), vmlaq_f64(vmulq_f64(v119, v111[3]), v110[3], v116)));
            v126 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[8]), v110[8], v108[4]), vmlaq_f64(vmulq_f64(v108[13], v111[9]), v110[9], v108[5]));
            *(double *)v126.i64 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v125, v126), (float64x2_t)vzip2q_s64(v125, v126)));
            v127 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, v111[4]), v110[4], *v108), vmlaq_f64(vmulq_f64(v118, v111[6]), v110[6], v117)), vaddq_f64(v122, vmlaq_f64(vmulq_f64(v119, v111[7]), v110[7], v116)));
            v128 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[14], v111[10]), v110[10], v108[6]), vmlaq_f64(vmulq_f64(v108[15], v111[11]), v110[11], v108[7]));
            *(float *)v126.i32 = *(double *)v126.i64;
            *(float *)v127.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v127, v128), (float64x2_t)vzip2q_s64(v127, v128)));
            v124[v52] = *(float *)v126.i32;
            *(_DWORD *)(v123 + 4 * v52) = v127.i32[0];
            v110 += 12;
            v111 += 12;
            v113 += 2;
          }
          while (v113 < v112);
        }
        if ((v109 & 1) != 0)
        {
          v129 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[8], *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v108[10], v111[2]), v110[2], v108[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[9], v111[1]), v110[1], v108[1]), vmlaq_f64(vmulq_f64(v108[11], v111[3]), v110[3], v108[3])));
          v130 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[4]), v110[4], v108[4]), vmlaq_f64(vmulq_f64(v108[14], v111[6]), v110[6], v108[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[13], v111[5]), v110[5], v108[5]), vmlaq_f64(vmulq_f64(v108[15], v111[7]), v110[7], v108[7])));
          *(float *)v129.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v129, v130), (float64x2_t)vzip2q_s64(v129, v130)));
          LODWORD(a3[v109 - 1][v52]) = v129.i32[0];
        }
        v20 = (v20 + v9);
        v131 = v7 + v8;
        if (v131 < v15)
          v9 = v16;
        else
          v9 = v16 + 1;
        if (v131 < v15)
          v132 = 0;
        else
          v132 = v15;
        v7 = v131 - v132;
        ++v53;
        v52 += a7;
      }
      while (v53 != a5);
    }
    v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133)
        v133 = v9;
      if (v133 >= 1)
      {
        v154 = 0;
        v155 = (int)v54;
        v156 = a6;
        do
        {
          v157 = *((_DWORD *)this + 12);
          v158 = v13;
          v159 = v14;
          v160 = v157 - (v157 != 0);
          if ((_DWORD)v160)
          {
            v161 = 0;
            v159 = v14;
            v158 = v13;
            do
            {
              v162 = &a2[v161];
              v163 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v162)[v155]), 0);
              v164 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((_QWORD *)v162 + 1) + 4 * v155)), 0);
              v165 = *v158;
              v166 = v158[1];
              v167 = v158[2];
              v168 = v158[3];
              v169 = vmlaq_f64(vmlaq_f64(v163, *v158, *v11), *v159, v11[8]);
              v170 = vmlaq_f64(vmlaq_f64(v163, v166, v11[1]), v159[1], v11[9]);
              v171 = vmlaq_f64(vmlaq_f64(v163, v167, v11[2]), v159[2], v11[10]);
              v172 = vmlaq_f64(vmlaq_f64(v163, v168, v11[3]), v159[3], v11[11]);
              v159[2] = v167;
              v159[3] = v168;
              *v159 = v165;
              v159[1] = v166;
              v158[2] = v171;
              v158[3] = v172;
              *v158 = v169;
              v158[1] = v170;
              v173 = v158[4];
              v174 = v158[5];
              v175 = v158[6];
              v176 = v158[7];
              v177 = vmlaq_f64(vmlaq_f64(v164, v173, *v11), v159[4], v11[8]);
              v178 = vmlaq_f64(vmlaq_f64(v164, v174, v11[1]), v159[5], v11[9]);
              v179 = vmlaq_f64(vmlaq_f64(v164, v175, v11[2]), v159[6], v11[10]);
              v180 = vmlaq_f64(vmlaq_f64(v164, v176, v11[3]), v159[7], v11[11]);
              v159[4] = v173;
              v159[5] = v174;
              v159[6] = v175;
              v159[7] = v176;
              v158[6] = v179;
              v158[7] = v180;
              v158[4] = v177;
              v158[5] = v178;
              v182 = v158[8];
              v181 = v158[9];
              v184 = v158[10];
              v183 = v158[11];
              v185 = vmlaq_f64(v164, v184, v11[6]);
              v186 = vmlaq_f64(v163, v182, v11[4]);
              v187 = vmlaq_f64(vmlaq_f64(v163, v181, v11[5]), v159[9], v11[13]);
              v188 = vmlaq_f64(v186, v159[8], v11[12]);
              v189 = vmlaq_f64(vmlaq_f64(v164, v183, v11[7]), v159[11], v11[15]);
              v190 = vmlaq_f64(v185, v159[10], v11[14]);
              v159[8] = v182;
              v159[9] = v181;
              v159[10] = v184;
              v159[11] = v183;
              v158[10] = v190;
              v158[11] = v189;
              v158[8] = v188;
              v158[9] = v187;
              v158 += 12;
              v159 += 12;
              v161 += 2;
            }
            while (v161 < v160);
          }
          if ((v157 & 1) != 0)
          {
            v191 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v157 - 1][v155]), 0);
            v192 = *v158;
            v193 = v158[1];
            v194 = v158[2];
            v195 = v158[3];
            v196 = vmlaq_f64(vmlaq_f64(v191, *v158, *v11), *v159, v11[8]);
            v197 = vmlaq_f64(vmlaq_f64(v191, v193, v11[1]), v159[1], v11[9]);
            v198 = vmlaq_f64(vmlaq_f64(v191, v194, v11[2]), v159[2], v11[10]);
            v199 = vmlaq_f64(vmlaq_f64(v191, v195, v11[3]), v159[3], v11[11]);
            v159[2] = v194;
            v159[3] = v195;
            *v159 = v192;
            v159[1] = v193;
            v158[2] = v198;
            v158[3] = v199;
            *v158 = v196;
            v158[1] = v197;
            v201 = v158[4];
            v200 = v158[5];
            v203 = v158[6];
            v202 = v158[7];
            v204 = vmlaq_f64(v191, v201, v11[4]);
            v205 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v202, v11[7]), v159[7], v11[15]);
            v206 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v203, v11[6]), v159[6], v11[14]);
            v207 = vmlaq_f64(vmlaq_f64(v191, v200, v11[5]), v159[5], v11[13]);
            v208 = vmlaq_f64(v204, v159[4], v11[12]);
            v159[4] = v201;
            v159[5] = v200;
            v159[6] = v203;
            v159[7] = v202;
            v158[6] = v206;
            v158[7] = v205;
            v158[4] = v208;
            v158[5] = v207;
          }
          v155 += v156;
          ++v154;
        }
        while (v154 != v133);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v20;
}

uint64_t RamstadSRC::processMultiFracD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  float64x2_t *v11;
  uint64_t v12;
  float64x2_t *v13;
  float64x2_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int i;
  int v20;
  uint64_t v21;
  const float *const *v22;
  float64x2_t *v23;
  float64x2_t *v24;
  uint64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  float64x2_t *v41;
  float64x2_t *v42;
  float *v43;
  float64x2_t *v44;
  float64x2_t *v45;
  float *v46;
  uint64_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float v52;
  float *v53;
  float64x2_t *v54;
  float64x2_t *v55;
  float *v56;
  uint64_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float v62;
  float *const *v63;
  float v64;
  float v65;
  float v66;
  float v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  float64x2_t *v75;
  float64x2_t *v76;
  unint64_t v77;
  unint64_t v78;
  const float *const *v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  double v126;
  uint64_t v127;
  float64x2_t *v128;
  uint64_t v129;
  float *v130;
  float64x2_t *v131;
  float64x2_t *v132;
  unint64_t v133;
  unint64_t v134;
  float32x2_t *v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  int64x2_t v145;
  int64x2_t v146;
  int64x2_t v147;
  int64x2_t v148;
  int64x2_t v149;
  int64x2_t v150;
  float64x2_t *v151;
  float *v152;
  float64x2_t *v153;
  float64x2_t *v154;
  unint64_t v155;
  float32x2_t *v156;
  float64x2_t v157;
  float64x2_t v158;
  float64x2_t v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  float64x2_t v164;
  float64x2_t v165;
  int64x2_t v166;
  int64x2_t v167;
  int64x2_t v168;
  int64x2_t v169;
  float v170;
  float *const *v171;
  int64x2_t v172;
  int64x2_t v173;
  float v174;
  float v175;
  float v176;
  float v177;
  uint64_t v178;
  unsigned int v179;
  int v180;
  int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const float *const *v185;
  float64x2_t *v186;
  float64x2_t *v187;
  uint64_t v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  float64x2_t v200;
  int v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  float64x2_t *v205;
  float64x2_t *v206;
  unint64_t v207;
  unint64_t v208;
  const float *const *v209;
  float64x2_t v210;
  float64x2_t v211;
  float64x2_t v212;
  float64x2_t v213;
  float64x2_t v214;
  float64x2_t v215;
  float64x2_t v216;
  float64x2_t v217;
  float64x2_t v218;
  float64x2_t v219;
  float64x2_t v220;
  float64x2_t v221;
  float64x2_t v222;
  float64x2_t v223;
  float64x2_t v224;
  float64x2_t v225;
  float64x2_t v226;
  float64x2_t v227;
  float64x2_t v228;
  float64x2_t v229;
  float64x2_t v230;
  float64x2_t v231;
  float64x2_t v232;
  float64x2_t v233;
  float64x2_t v234;
  float64x2_t v235;
  float64x2_t v236;
  float64x2_t v237;
  float64x2_t v238;
  float64x2_t v239;
  float64x2_t v240;
  float64x2_t v241;
  float64x2_t v242;
  float64x2_t v243;
  float64x2_t v244;
  float64x2_t v245;
  float64x2_t v246;
  float64x2_t v247;
  float64x2_t v248;
  float64x2_t v249;
  float64x2_t v250;
  float64x2_t v251;
  float64x2_t v252;
  float64x2_t v253;
  float64x2_t v254;
  float64x2_t v255;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *((_QWORD *)this + 2);
  v11 = *(float64x2_t **)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 40);
  v13 = (float64x2_t *)*((_QWORD *)this + 20);
  v14 = (float64x2_t *)*((_QWORD *)this + 23);
  v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v18) = 0;
      v17 = 0;
    }
    else
    {
      v16 = 0;
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      for (i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          v20 = 0;
          v18 = (int)v18;
          do
          {
            v21 = *((unsigned int *)this + 12);
            if ((_DWORD)v21)
            {
              v22 = a2;
              v23 = v13;
              v24 = v14;
              do
              {
                v25 = (uint64_t)*v22++;
                v26 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v25 + 4 * v18)), 0);
                v28 = *v23;
                v27 = v23[1];
                v30 = v23[2];
                v29 = v23[3];
                v31 = vmlaq_f64(v26, v30, v11[2]);
                v32 = vmlaq_f64(v26, v29, v11[3]);
                v33 = vmlaq_f64(v26, *v23, *v11);
                v34 = vmlaq_f64(vmlaq_f64(v26, v27, v11[1]), v24[1], v11[5]);
                v35 = vmlaq_f64(v33, *v24, v11[4]);
                v36 = vmlaq_f64(v32, v24[3], v11[7]);
                v37 = vmlaq_f64(v31, v24[2], v11[6]);
                v24[2] = v30;
                v24[3] = v29;
                *v24 = v28;
                v24[1] = v27;
                v24 += 4;
                v23[2] = v37;
                v23[3] = v36;
                *v23 = v35;
                v23[1] = v34;
                v23 += 4;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        v38 = *((unsigned int *)this + 12);
        if ((_DWORD)v38)
        {
          v39 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
          v40 = (v7 >> 22) & 0x1FE;
          v41 = (float64x2_t *)(v12 + (v40 << 6));
          v42 = (float64x2_t *)(v12 + ((unint64_t)(v40 + 2) << 6));
          v43 = (float *)*((_QWORD *)this + 26);
          v44 = v13;
          v45 = v14;
          v46 = v43;
          v47 = *((unsigned int *)this + 12);
          do
          {
            v48 = v45[2];
            v49 = v45[3];
            v50 = *v45;
            v51 = v45[1];
            v45 += 4;
            v52 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v41[4], v50), *v44, *v41), vmlaq_f64(vmulq_f64(v41[6], v48), v44[2], v41[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v41[5], v51), v44[1], v41[1]), vmlaq_f64(vmulq_f64(v41[7], v49), v44[3], v41[3]))));
            *v46++ = v52;
            v44 += 4;
            --v47;
          }
          while (v47);
          v53 = (float *)*((_QWORD *)this + 29);
          v54 = v13;
          v55 = v14;
          v56 = v53;
          v57 = v38;
          do
          {
            v58 = v55[2];
            v59 = v55[3];
            v60 = *v55;
            v61 = v55[1];
            v55 += 4;
            v62 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v42[4], v60), *v54, *v42), vmlaq_f64(vmulq_f64(v42[6], v58), v54[2], v42[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v42[5], v61), v54[1], v42[1]), vmlaq_f64(vmulq_f64(v42[7], v59), v54[3], v42[3]))));
            *v56++ = v62;
            v54 += 4;
            --v57;
          }
          while (v57);
          v63 = a3;
          do
          {
            v64 = *v43++;
            v65 = v64;
            v66 = *v53++;
            v67 = v65 + (float)(v39 * (float)(v66 - v65));
            v68 = (uint64_t)*v63++;
            *(float *)(v68 + 4 * v16) = v67;
            --v38;
          }
          while (v38);
        }
        v17 = (v17 + v9);
        v69 = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v15 + (v69 >> 31);
        v16 += a7;
      }
    }
    v180 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v180)
        v180 = v9;
      if (v180 >= 1)
      {
        v181 = 0;
        v182 = (int)v18;
        v183 = a6;
        do
        {
          v184 = *((unsigned int *)this + 12);
          if ((_DWORD)v184)
          {
            v185 = a2;
            v186 = v13;
            v187 = v14;
            do
            {
              v188 = (uint64_t)*v185++;
              v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v188 + 4 * v182)), 0);
              v191 = *v186;
              v190 = v186[1];
              v193 = v186[2];
              v192 = v186[3];
              v194 = vmlaq_f64(v189, v193, v11[2]);
              v195 = vmlaq_f64(v189, v192, v11[3]);
              v196 = vmlaq_f64(v189, *v186, *v11);
              v197 = vmlaq_f64(vmlaq_f64(v189, v190, v11[1]), v187[1], v11[5]);
              v198 = vmlaq_f64(v196, *v187, v11[4]);
              v199 = vmlaq_f64(v195, v187[3], v11[7]);
              v200 = vmlaq_f64(v194, v187[2], v11[6]);
              v187[2] = v193;
              v187[3] = v192;
              *v187 = v191;
              v187[1] = v190;
              v187 += 4;
              v186[2] = v200;
              v186[3] = v199;
              *v186 = v198;
              v186[1] = v197;
              v186 += 4;
              --v184;
            }
            while (v184);
          }
          v182 += v183;
          ++v181;
        }
        while (v181 != v180);
      }
LABEL_67:
      v9 -= v180;
      v17 = (v180 + v17);
      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (a5 >= 1)
  {
    v70 = 0;
    LODWORD(v17) = 0;
    v71 = 0;
    LODWORD(v72) = 0;
    while (1)
    {
      if (v9 >= 1)
      {
        v73 = 0;
        v72 = (int)v72;
        do
        {
          v74 = *((_DWORD *)this + 12);
          v75 = v13;
          v76 = v14;
          v77 = v74 - (v74 != 0);
          if ((_DWORD)v77)
          {
            v78 = 0;
            v76 = v14;
            v75 = v13;
            do
            {
              v79 = &a2[v78];
              v80 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v79)[v72]), 0);
              v81 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((_QWORD *)v79 + 1) + 4 * v72)), 0);
              v82 = *v75;
              v83 = v75[1];
              v84 = v75[2];
              v85 = v75[3];
              v86 = vmlaq_f64(vmlaq_f64(v80, *v75, *v11), *v76, v11[8]);
              v87 = vmlaq_f64(vmlaq_f64(v80, v83, v11[1]), v76[1], v11[9]);
              v88 = vmlaq_f64(vmlaq_f64(v80, v84, v11[2]), v76[2], v11[10]);
              v89 = vmlaq_f64(vmlaq_f64(v80, v85, v11[3]), v76[3], v11[11]);
              v76[2] = v84;
              v76[3] = v85;
              *v76 = v82;
              v76[1] = v83;
              v75[2] = v88;
              v75[3] = v89;
              *v75 = v86;
              v75[1] = v87;
              v90 = v75[4];
              v91 = v75[5];
              v92 = v75[6];
              v93 = v75[7];
              v94 = vmlaq_f64(vmlaq_f64(v81, v90, *v11), v76[4], v11[8]);
              v95 = vmlaq_f64(vmlaq_f64(v81, v91, v11[1]), v76[5], v11[9]);
              v96 = vmlaq_f64(vmlaq_f64(v81, v92, v11[2]), v76[6], v11[10]);
              v97 = vmlaq_f64(vmlaq_f64(v81, v93, v11[3]), v76[7], v11[11]);
              v76[4] = v90;
              v76[5] = v91;
              v76[6] = v92;
              v76[7] = v93;
              v75[6] = v96;
              v75[7] = v97;
              v75[4] = v94;
              v75[5] = v95;
              v99 = v75[8];
              v98 = v75[9];
              v101 = v75[10];
              v100 = v75[11];
              v102 = vmlaq_f64(v81, v101, v11[6]);
              v103 = vmlaq_f64(v80, v99, v11[4]);
              v104 = vmlaq_f64(vmlaq_f64(v80, v98, v11[5]), v76[9], v11[13]);
              v105 = vmlaq_f64(v103, v76[8], v11[12]);
              v106 = vmlaq_f64(vmlaq_f64(v81, v100, v11[7]), v76[11], v11[15]);
              v107 = vmlaq_f64(v102, v76[10], v11[14]);
              v76[8] = v99;
              v76[9] = v98;
              v76[10] = v101;
              v76[11] = v100;
              v75[10] = v107;
              v75[11] = v106;
              v75[8] = v105;
              v75[9] = v104;
              v75 += 12;
              v76 += 12;
              v78 += 2;
            }
            while (v78 < v77);
          }
          if ((v74 & 1) != 0)
          {
            v108 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v74 - 1][v72]), 0);
            v109 = *v75;
            v110 = v75[1];
            v111 = v75[2];
            v112 = v75[3];
            v113 = vmlaq_f64(vmlaq_f64(v108, *v75, *v11), *v76, v11[8]);
            v114 = vmlaq_f64(vmlaq_f64(v108, v110, v11[1]), v76[1], v11[9]);
            v115 = vmlaq_f64(vmlaq_f64(v108, v111, v11[2]), v76[2], v11[10]);
            v116 = vmlaq_f64(vmlaq_f64(v108, v112, v11[3]), v76[3], v11[11]);
            v76[2] = v111;
            v76[3] = v112;
            *v76 = v109;
            v76[1] = v110;
            v75[2] = v115;
            v75[3] = v116;
            *v75 = v113;
            v75[1] = v114;
            v118 = v75[4];
            v117 = v75[5];
            v120 = v75[6];
            v119 = v75[7];
            v121 = vmlaq_f64(v108, v118, v11[4]);
            v122 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v119, v11[7]), v76[7], v11[15]);
            v123 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v120, v11[6]), v76[6], v11[14]);
            v124 = vmlaq_f64(vmlaq_f64(v108, v117, v11[5]), v76[5], v11[13]);
            v125 = vmlaq_f64(v121, v76[4], v11[12]);
            v76[4] = v118;
            v76[5] = v117;
            v76[6] = v120;
            v76[7] = v119;
            v75[6] = v123;
            v75[7] = v122;
            v75[4] = v125;
            v75[5] = v124;
          }
          v72 += a6;
          ++v73;
        }
        while (v73 != v9);
      }
      v126 = *((double *)this + 12);
      v127 = (v7 >> 21) & 0x3FC;
      v128 = (float64x2_t *)(v12 + (v127 << 6));
      v129 = *((unsigned int *)this + 12);
      v130 = (float *)*((_QWORD *)this + 26);
      v131 = v13;
      v132 = v14;
      v133 = v129 - (*((_DWORD *)this + 12) != 0);
      if ((_DWORD)v133)
      {
        v134 = 0;
        v135 = (float32x2_t *)*((_QWORD *)this + 26);
        v132 = v14;
        v131 = v13;
        do
        {
          v136 = v128[1];
          v138 = v128[2];
          v137 = v128[3];
          v139 = v128[10];
          v140 = v128[11];
          v141 = v128[8];
          v142 = v128[9];
          v143 = vmlaq_f64(vmulq_f64(v142, v132[1]), v131[1], v136);
          v144 = vmlaq_f64(vmulq_f64(v142, v132[5]), v131[5], v136);
          v145 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[8]), v131[8], v128[4]), vmlaq_f64(vmulq_f64(v128[13], v132[9]), v131[9], v128[5]));
          v146 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v139, v132[2]), v131[2], v138)), vaddq_f64(v143, vmlaq_f64(vmulq_f64(v140, v132[3]), v131[3], v137)));
          v147 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, v132[4]), v131[4], *v128), vmlaq_f64(vmulq_f64(v139, v132[6]), v131[6], v138)), vaddq_f64(v144, vmlaq_f64(vmulq_f64(v140, v132[7]), v131[7], v137)));
          v148 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[14], v132[10]), v131[10], v128[6]), vmlaq_f64(vmulq_f64(v128[15], v132[11]), v131[11], v128[7]));
          *v135++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v146, v147), (float64x2_t)vzip2q_s64(v146, v147)), vaddq_f64((float64x2_t)vzip1q_s64(v145, v148), (float64x2_t)vzip2q_s64(v145, v148))));
          v131 += 12;
          v132 += 12;
          v134 += 2;
        }
        while (v134 < v133);
      }
      if ((v129 & 1) != 0)
      {
        v149 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[8], *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v128[10], v132[2]), v131[2], v128[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[9], v132[1]), v131[1], v128[1]), vmlaq_f64(vmulq_f64(v128[11], v132[3]), v131[3], v128[3])));
        v150 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[4]), v131[4], v128[4]), vmlaq_f64(vmulq_f64(v128[14], v132[6]), v131[6], v128[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[13], v132[5]), v131[5], v128[5]), vmlaq_f64(vmulq_f64(v128[15], v132[7]), v131[7], v128[7])));
        *(float *)v149.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v149, v150), (float64x2_t)vzip2q_s64(v149, v150)));
        v130[(v129 - 1)] = *(float *)v149.i32;
      }
      v151 = (float64x2_t *)(v12 + ((unint64_t)(v127 + 4) << 6));
      v152 = (float *)*((_QWORD *)this + 29);
      v153 = v13;
      v154 = v14;
      if ((_DWORD)v133)
      {
        v155 = 0;
        v156 = (float32x2_t *)*((_QWORD *)this + 29);
        v154 = v14;
        v153 = v13;
        do
        {
          v157 = v151[1];
          v159 = v151[2];
          v158 = v151[3];
          v160 = v151[10];
          v161 = v151[11];
          v162 = v151[8];
          v163 = v151[9];
          v164 = vmlaq_f64(vmulq_f64(v163, v154[1]), v153[1], v157);
          v165 = vmlaq_f64(vmulq_f64(v163, v154[5]), v153[5], v157);
          v166 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[8]), v153[8], v151[4]), vmlaq_f64(vmulq_f64(v151[13], v154[9]), v153[9], v151[5]));
          v167 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v160, v154[2]), v153[2], v159)), vaddq_f64(v164, vmlaq_f64(vmulq_f64(v161, v154[3]), v153[3], v158)));
          v168 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, v154[4]), v153[4], *v151), vmlaq_f64(vmulq_f64(v160, v154[6]), v153[6], v159)), vaddq_f64(v165, vmlaq_f64(vmulq_f64(v161, v154[7]), v153[7], v158)));
          v169 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[14], v154[10]), v153[10], v151[6]), vmlaq_f64(vmulq_f64(v151[15], v154[11]), v153[11], v151[7]));
          *v156++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v167, v168), (float64x2_t)vzip2q_s64(v167, v168)), vaddq_f64((float64x2_t)vzip1q_s64(v166, v169), (float64x2_t)vzip2q_s64(v166, v169))));
          v153 += 12;
          v154 += 12;
          v155 += 2;
        }
        while (v155 < v133);
      }
      v170 = v126 * (double)(v7 & 0x7FFFFF);
      if ((v129 & 1) != 0)
        break;
      v171 = a3;
      if ((_DWORD)v129)
        goto LABEL_41;
LABEL_42:
      v17 = (v17 + v9);
      v179 = v7 + v8;
      v7 = (v7 + v8) & 0x7FFFFFFF;
      v9 = v15 + (v179 >> 31);
      ++v71;
      v70 += a7;
      if (v71 == a5)
        goto LABEL_56;
    }
    v172 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[8], *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v151[10], v154[2]), v153[2], v151[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[9], v154[1]), v153[1], v151[1]), vmlaq_f64(vmulq_f64(v151[11], v154[3]), v153[3], v151[3])));
    v173 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[4]), v153[4], v151[4]), vmlaq_f64(vmulq_f64(v151[14], v154[6]), v153[6], v151[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[13], v154[5]), v153[5], v151[5]), vmlaq_f64(vmulq_f64(v151[15], v154[7]), v153[7], v151[7])));
    *(float *)v172.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v172, v173), (float64x2_t)vzip2q_s64(v172, v173)));
    v152[(v129 - 1)] = *(float *)v172.i32;
    v171 = a3;
    do
    {
LABEL_41:
      v174 = *v130++;
      v175 = v174;
      v176 = *v152++;
      v177 = v175 + (float)(v170 * (float)(v176 - v175));
      v178 = (uint64_t)*v171++;
      *(float *)(v178 + 4 * v70) = v177;
      --v129;
    }
    while (v129);
    goto LABEL_42;
  }
  LODWORD(v72) = 0;
  v17 = 0;
LABEL_56:
  v180 = a4 - v17;
  if (a4 > (int)v17)
  {
    if (v9 < v180)
      v180 = v9;
    if (v180 >= 1)
    {
      v201 = 0;
      v202 = (int)v72;
      v203 = a6;
      do
      {
        v204 = *((_DWORD *)this + 12);
        v205 = v13;
        v206 = v14;
        v207 = v204 - (v204 != 0);
        if ((_DWORD)v207)
        {
          v208 = 0;
          v206 = v14;
          v205 = v13;
          do
          {
            v209 = &a2[v208];
            v210 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v209)[v202]), 0);
            v211 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((_QWORD *)v209 + 1) + 4 * v202)), 0);
            v212 = *v205;
            v213 = v205[1];
            v214 = v205[2];
            v215 = v205[3];
            v216 = vmlaq_f64(vmlaq_f64(v210, *v205, *v11), *v206, v11[8]);
            v217 = vmlaq_f64(vmlaq_f64(v210, v213, v11[1]), v206[1], v11[9]);
            v218 = vmlaq_f64(vmlaq_f64(v210, v214, v11[2]), v206[2], v11[10]);
            v219 = vmlaq_f64(vmlaq_f64(v210, v215, v11[3]), v206[3], v11[11]);
            v206[2] = v214;
            v206[3] = v215;
            *v206 = v212;
            v206[1] = v213;
            v205[2] = v218;
            v205[3] = v219;
            *v205 = v216;
            v205[1] = v217;
            v220 = v205[4];
            v221 = v205[5];
            v222 = v205[6];
            v223 = v205[7];
            v224 = vmlaq_f64(vmlaq_f64(v211, v220, *v11), v206[4], v11[8]);
            v225 = vmlaq_f64(vmlaq_f64(v211, v221, v11[1]), v206[5], v11[9]);
            v226 = vmlaq_f64(vmlaq_f64(v211, v222, v11[2]), v206[6], v11[10]);
            v227 = vmlaq_f64(vmlaq_f64(v211, v223, v11[3]), v206[7], v11[11]);
            v206[4] = v220;
            v206[5] = v221;
            v206[6] = v222;
            v206[7] = v223;
            v205[6] = v226;
            v205[7] = v227;
            v205[4] = v224;
            v205[5] = v225;
            v229 = v205[8];
            v228 = v205[9];
            v231 = v205[10];
            v230 = v205[11];
            v232 = vmlaq_f64(v211, v231, v11[6]);
            v233 = vmlaq_f64(v210, v229, v11[4]);
            v234 = vmlaq_f64(vmlaq_f64(v210, v228, v11[5]), v206[9], v11[13]);
            v235 = vmlaq_f64(v233, v206[8], v11[12]);
            v236 = vmlaq_f64(vmlaq_f64(v211, v230, v11[7]), v206[11], v11[15]);
            v237 = vmlaq_f64(v232, v206[10], v11[14]);
            v206[8] = v229;
            v206[9] = v228;
            v206[10] = v231;
            v206[11] = v230;
            v205[10] = v237;
            v205[11] = v236;
            v205[8] = v235;
            v205[9] = v234;
            v205 += 12;
            v206 += 12;
            v208 += 2;
          }
          while (v208 < v207);
        }
        if ((v204 & 1) != 0)
        {
          v238 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v204 - 1][v202]), 0);
          v239 = *v205;
          v240 = v205[1];
          v241 = v205[2];
          v242 = v205[3];
          v243 = vmlaq_f64(vmlaq_f64(v238, *v205, *v11), *v206, v11[8]);
          v244 = vmlaq_f64(vmlaq_f64(v238, v240, v11[1]), v206[1], v11[9]);
          v245 = vmlaq_f64(vmlaq_f64(v238, v241, v11[2]), v206[2], v11[10]);
          v246 = vmlaq_f64(vmlaq_f64(v238, v242, v11[3]), v206[3], v11[11]);
          v206[2] = v241;
          v206[3] = v242;
          *v206 = v239;
          v206[1] = v240;
          v205[2] = v245;
          v205[3] = v246;
          *v205 = v243;
          v205[1] = v244;
          v248 = v205[4];
          v247 = v205[5];
          v250 = v205[6];
          v249 = v205[7];
          v251 = vmlaq_f64(v238, v248, v11[4]);
          v252 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v249, v11[7]), v206[7], v11[15]);
          v253 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v250, v11[6]), v206[6], v11[14]);
          v254 = vmlaq_f64(vmlaq_f64(v238, v247, v11[5]), v206[5], v11[13]);
          v255 = vmlaq_f64(v251, v206[4], v11[12]);
          v206[4] = v248;
          v206[5] = v247;
          v206[6] = v250;
          v206[7] = v249;
          v205[6] = v253;
          v205[7] = v252;
          v205[4] = v255;
          v205[5] = v254;
        }
        v202 += v203;
        ++v201;
      }
      while (v201 != v180);
    }
    goto LABEL_67;
  }
LABEL_68:
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v17;
}

uint64_t RamstadSRC::processMultiInt(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v7;
  int v8;
  int v9;
  float32x4_t *v10;
  uint64_t v11;
  float32x4_t *v12;
  float32x4_t *v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  const float *const *v22;
  float32x4_t *v23;
  float32x4_t *v24;
  uint64_t v25;
  const float *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  uint64_t v32;
  float32x4_t *v33;
  float32x4_t *v34;
  float *const *v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  int8x16_t v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  float32x4_t *v49;
  float32x4_t *v50;
  unint64_t v51;
  unint64_t v52;
  const float *const *v53;
  const float *v54;
  const float *v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  const float *v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t *v78;
  int v79;
  float32x4_t *v80;
  float32x4_t *v81;
  unint64_t v82;
  unint64_t v83;
  float *const *v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  uint64_t v90;
  float *v91;
  int8x16_t v92;
  int8x16_t v93;
  int8x16_t v94;
  int32x2_t v95;
  int8x16_t v96;
  int8x16_t v97;
  int8x16_t v98;
  int v99;
  int v100;
  int v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const float *const *v106;
  float32x4_t *v107;
  float32x4_t *v108;
  uint64_t v109;
  const float *v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  float32x4_t *v120;
  float32x4_t *v121;
  unint64_t v122;
  unint64_t v123;
  const float *const *v124;
  const float *v125;
  const float *v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  const float *v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v11 = *(_QWORD *)(*(_QWORD *)this + 40);
  v12 = (float32x4_t *)*((_QWORD *)this + 14);
  v13 = (float32x4_t *)*((_QWORD *)this + 17);
  v14 = *((_DWORD *)this + 13);
  v15 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      v19 = 0;
      LODWORD(v18) = 0;
    }
    else
    {
      v16 = 0;
      v17 = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          v20 = 0;
          v18 = (int)v18;
          do
          {
            v21 = *((unsigned int *)this + 12);
            if ((_DWORD)v21)
            {
              v22 = a2;
              v23 = v12;
              v24 = v13;
              do
              {
                v25 = (uint64_t)*v22++;
                v26 = (const float *)(v25 + 4 * v18);
                v27 = vld1q_dup_f32(v26);
                v28 = v23[1];
                v29 = vmlaq_f32(v27, v28, v10[1]);
                v30 = vmlaq_f32(vmlaq_f32(v27, *v23, *v10), *v24, v10[2]);
                v31 = vmlaq_f32(v29, v24[1], v10[3]);
                *v24 = *v23;
                v24[1] = v28;
                v24 += 2;
                *v23 = v30;
                v23[1] = v31;
                v23 += 2;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        v32 = *((unsigned int *)this + 12);
        if ((_DWORD)v32)
        {
          v33 = v12;
          v34 = v13;
          v35 = a3;
          do
          {
            v36 = *v33;
            v37 = v33[1];
            v33 += 2;
            v39 = *v34;
            v38 = v34[1];
            v34 += 2;
            v40 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), v39), v36, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v38), v37, *(float32x4_t *)(v11 + 64 * v7 + 16)));
            v41 = (uint64_t)*v35++;
            *(float *)(v41 + 4 * v16) = vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)));
            --v32;
          }
          while (v32);
        }
        v19 = (v19 + v9);
        v42 = v7 + v8;
        if (v42 < v14)
          v9 = v15;
        else
          v9 = v15 + 1;
        if (v42 < v14)
          v43 = 0;
        else
          v43 = v14;
        v7 = v42 - v43;
        ++v17;
        v16 += a7;
      }
      while (v17 != a5);
    }
    v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101)
        v101 = v9;
      if (v101 >= 1)
      {
        v102 = 0;
        v103 = (int)v18;
        v104 = a6;
        do
        {
          v105 = *((unsigned int *)this + 12);
          if ((_DWORD)v105)
          {
            v106 = a2;
            v107 = v12;
            v108 = v13;
            do
            {
              v109 = (uint64_t)*v106++;
              v110 = (const float *)(v109 + 4 * v103);
              v111 = vld1q_dup_f32(v110);
              v112 = v107[1];
              v113 = vmlaq_f32(v111, v112, v10[1]);
              v114 = vmlaq_f32(vmlaq_f32(v111, *v107, *v10), *v108, v10[2]);
              v115 = vmlaq_f32(v113, v108[1], v10[3]);
              *v108 = *v107;
              v108[1] = v112;
              v108 += 2;
              *v107 = v114;
              v107[1] = v115;
              v107 += 2;
              --v105;
            }
            while (v105);
          }
          v103 += v104;
          ++v102;
        }
        while (v102 != v101);
      }
LABEL_67:
      v9 -= v101;
      v19 = (v101 + v19);
    }
  }
  else
  {
    if (a5 < 1)
    {
      v19 = 0;
      LODWORD(v46) = 0;
    }
    else
    {
      v44 = 0;
      v45 = 0;
      LODWORD(v46) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          v47 = 0;
          v46 = (int)v46;
          do
          {
            v48 = *((_DWORD *)this + 12);
            v49 = v12;
            v50 = v13;
            v51 = v48 - (v48 != 0);
            if ((_DWORD)v51)
            {
              v52 = 0;
              v50 = v13;
              v49 = v12;
              do
              {
                v53 = &a2[v52];
                v54 = &(*v53)[v46];
                v55 = (const float *)(*((_QWORD *)v53 + 1) + 4 * v46);
                v56 = vld1q_dup_f32(v54);
                v57 = vld1q_dup_f32(v55);
                v58 = v49[1];
                v59 = vmlaq_f32(vmlaq_f32(v56, *v49, *v10), *v50, v10[4]);
                v60 = vmlaq_f32(vmlaq_f32(v56, v58, v10[1]), v50[1], v10[5]);
                *v50 = *v49;
                v50[1] = v58;
                *v49 = v59;
                v49[1] = v60;
                v61 = v49[2];
                v62 = v49[3];
                v63 = vmlaq_f32(vmlaq_f32(v57, v61, *v10), v50[2], v10[4]);
                v64 = vmlaq_f32(vmlaq_f32(v57, v62, v10[1]), v50[3], v10[5]);
                v50[2] = v61;
                v50[3] = v62;
                v49[2] = v63;
                v49[3] = v64;
                v65 = v49[4];
                v66 = v49[5];
                v67 = vmlaq_f32(vmlaq_f32(v56, v65, v10[2]), v50[4], v10[6]);
                v68 = vmlaq_f32(vmlaq_f32(v57, v66, v10[3]), v50[5], v10[7]);
                v50[4] = v65;
                v50[5] = v66;
                v49[4] = v67;
                v49[5] = v68;
                v49 += 6;
                v50 += 6;
                v52 += 2;
              }
              while (v52 < v51);
            }
            if ((v48 & 1) != 0)
            {
              v69 = &a2[v48 - 1][v46];
              v70 = vld1q_dup_f32(v69);
              v71 = v49[1];
              v72 = vmlaq_f32(vmlaq_f32(v70, *v49, *v10), *v50, v10[4]);
              v73 = vmlaq_f32(vmlaq_f32(v70, v71, v10[1]), v50[1], v10[5]);
              *v50 = *v49;
              v50[1] = v71;
              *v49 = v72;
              v49[1] = v73;
              v74 = v49[2];
              v75 = v49[3];
              v76 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v75, v10[3]), v50[3], v10[7]);
              v77 = vmlaq_f32(vmlaq_f32(v70, v74, v10[2]), v50[2], v10[6]);
              v50[2] = v74;
              v50[3] = v75;
              v49[2] = v77;
              v49[3] = v76;
            }
            v46 += a6;
            ++v47;
          }
          while (v47 != v9);
        }
        v78 = (float32x4_t *)(v11 + 128 * v7);
        v79 = *((_DWORD *)this + 12);
        v80 = v12;
        v81 = v13;
        v82 = v79 - (v79 != 0);
        if ((_DWORD)v82)
        {
          v83 = 0;
          v81 = v13;
          v80 = v12;
          do
          {
            v84 = &a3[v83];
            v85 = v78[1];
            v87 = v78[4];
            v86 = v78[5];
            v88 = vmlaq_f32(vmulq_f32(v86, v81[1]), v80[1], v85);
            v89 = vmlaq_f32(vmulq_f32(v86, v81[3]), v80[3], v85);
            v91 = *v84;
            v90 = *((_QWORD *)v84 + 1);
            v92 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[7], v81[5]), v80[5], v78[3]);
            v93 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[6], v81[4]), v80[4], v78[2]);
            v94 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, *v81), *v80, *v78), v88);
            *(float32x2_t *)v94.i8 = vadd_f32(*(float32x2_t *)v94.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v94, v94, 8uLL));
            v95 = (int32x2_t)vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v93, v93, 8uLL));
            *(float32x2_t *)v94.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v94.i8, v95), (float32x2_t)vzip2_s32(*(int32x2_t *)v94.i8, v95));
            v96 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, v81[2]), v80[2], *v78), v89);
            *(float32x2_t *)v96.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
            *(float32x2_t *)v92.i8 = vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v92, v92, 8uLL));
            v91[v44] = vaddv_f32(*(float32x2_t *)v94.i8);
            *(float *)(v90 + 4 * v44) = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8)));
            v80 += 6;
            v81 += 6;
            v83 += 2;
          }
          while (v83 < v82);
        }
        if ((v79 & 1) != 0)
        {
          v97 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[4], *v81), *v80, *v78), vmlaq_f32(vmulq_f32(v78[5], v81[1]), v80[1], v78[1]));
          *(float32x2_t *)v97.i8 = vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
          v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[6], v81[2]), v80[2], v78[2]), vmlaq_f32(vmulq_f32(v78[7], v81[3]), v80[3], v78[3]));
          *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
          a3[v79 - 1][v44] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8)));
        }
        v19 = (v19 + v9);
        v99 = v7 + v8;
        if (v99 < v14)
          v9 = v15;
        else
          v9 = v15 + 1;
        if (v99 < v14)
          v100 = 0;
        else
          v100 = v14;
        v7 = v99 - v100;
        ++v45;
        v44 += a7;
      }
      while (v45 != a5);
    }
    v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101)
        v101 = v9;
      if (v101 >= 1)
      {
        v116 = 0;
        v117 = (int)v46;
        v118 = a6;
        do
        {
          v119 = *((_DWORD *)this + 12);
          v120 = v12;
          v121 = v13;
          v122 = v119 - (v119 != 0);
          if ((_DWORD)v122)
          {
            v123 = 0;
            v121 = v13;
            v120 = v12;
            do
            {
              v124 = &a2[v123];
              v125 = &(*v124)[v117];
              v126 = (const float *)(*((_QWORD *)v124 + 1) + 4 * v117);
              v127 = vld1q_dup_f32(v125);
              v128 = vld1q_dup_f32(v126);
              v129 = v120[1];
              v130 = vmlaq_f32(vmlaq_f32(v127, *v120, *v10), *v121, v10[4]);
              v131 = vmlaq_f32(vmlaq_f32(v127, v129, v10[1]), v121[1], v10[5]);
              *v121 = *v120;
              v121[1] = v129;
              *v120 = v130;
              v120[1] = v131;
              v132 = v120[2];
              v133 = v120[3];
              v134 = vmlaq_f32(vmlaq_f32(v128, v132, *v10), v121[2], v10[4]);
              v135 = vmlaq_f32(vmlaq_f32(v128, v133, v10[1]), v121[3], v10[5]);
              v121[2] = v132;
              v121[3] = v133;
              v120[2] = v134;
              v120[3] = v135;
              v136 = v120[4];
              v137 = v120[5];
              v138 = vmlaq_f32(vmlaq_f32(v127, v136, v10[2]), v121[4], v10[6]);
              v139 = vmlaq_f32(vmlaq_f32(v128, v137, v10[3]), v121[5], v10[7]);
              v121[4] = v136;
              v121[5] = v137;
              v120[4] = v138;
              v120[5] = v139;
              v120 += 6;
              v121 += 6;
              v123 += 2;
            }
            while (v123 < v122);
          }
          if ((v119 & 1) != 0)
          {
            v140 = &a2[v119 - 1][v117];
            v141 = vld1q_dup_f32(v140);
            v142 = v120[1];
            v143 = vmlaq_f32(vmlaq_f32(v141, *v120, *v10), *v121, v10[4]);
            v144 = vmlaq_f32(vmlaq_f32(v141, v142, v10[1]), v121[1], v10[5]);
            *v121 = *v120;
            v121[1] = v142;
            *v120 = v143;
            v120[1] = v144;
            v145 = v120[2];
            v146 = v120[3];
            v147 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v146, v10[3]), v121[3], v10[7]);
            v148 = vmlaq_f32(vmlaq_f32(v141, v145, v10[2]), v121[2], v10[6]);
            v121[2] = v145;
            v121[3] = v146;
            v120[2] = v148;
            v120[3] = v147;
          }
          v117 += v118;
          ++v116;
        }
        while (v116 != v101);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v19;
}

uint64_t RamstadSRC::processMultiFrac(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  unsigned int v7;
  int v8;
  int v9;
  float32x4_t *v10;
  uint64_t v11;
  float32x4_t *v12;
  float32x4_t *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int i;
  int v19;
  uint64_t v20;
  const float *const *v21;
  float32x4_t *v22;
  float32x4_t *v23;
  uint64_t v24;
  const float *v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  float32x4_t *v34;
  float32x4_t *v35;
  float *v36;
  float32x4_t *v37;
  float32x4_t *v38;
  float *v39;
  uint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int8x16_t v45;
  float *v46;
  float32x4_t *v47;
  float32x4_t *v48;
  float *v49;
  uint64_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  int8x16_t v55;
  float *const *v56;
  float v57;
  float v58;
  float v59;
  float v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  float32x4_t *v68;
  float32x4_t *v69;
  unint64_t v70;
  unint64_t v71;
  const float *const *v72;
  const float *v73;
  const float *v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  const float *v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  double v97;
  uint64_t v98;
  float32x4_t *v99;
  uint64_t v100;
  float *v101;
  float32x4_t *v102;
  float32x4_t *v103;
  unint64_t v104;
  unint64_t v105;
  float32x2_t *v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  int8x16_t v112;
  int8x16_t v113;
  int8x16_t v114;
  int8x16_t v115;
  int8x16_t v116;
  int8x16_t v117;
  float32x4_t *v118;
  float *v119;
  float32x4_t *v120;
  float32x4_t *v121;
  unint64_t v122;
  float32x2_t *v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  int8x16_t v129;
  int8x16_t v130;
  int8x16_t v131;
  int8x16_t v132;
  float v133;
  float *const *v134;
  int8x16_t v135;
  int8x16_t v136;
  float v137;
  float v138;
  float v139;
  float v140;
  uint64_t v141;
  unsigned int v142;
  int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const float *const *v148;
  float32x4_t *v149;
  float32x4_t *v150;
  uint64_t v151;
  const float *v152;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  float32x4_t *v162;
  float32x4_t *v163;
  unint64_t v164;
  unint64_t v165;
  const float *const *v166;
  const float *v167;
  const float *v168;
  float32x4_t v169;
  float32x4_t v170;
  float32x4_t v171;
  float32x4_t v172;
  float32x4_t v173;
  float32x4_t v174;
  float32x4_t v175;
  float32x4_t v176;
  float32x4_t v177;
  float32x4_t v178;
  float32x4_t v179;
  float32x4_t v180;
  float32x4_t v181;
  const float *v182;
  float32x4_t v183;
  float32x4_t v184;
  float32x4_t v185;
  float32x4_t v186;
  float32x4_t v187;
  float32x4_t v188;
  float32x4_t v189;
  float32x4_t v190;

  v8 = *((_DWORD *)this + 17);
  v7 = *((_DWORD *)this + 18);
  v9 = *((_DWORD *)this + 22);
  v10 = *(float32x4_t **)(*(_QWORD *)this + 16);
  v11 = *(_QWORD *)(*(_QWORD *)this + 40);
  v12 = (float32x4_t *)*((_QWORD *)this + 14);
  v13 = (float32x4_t *)*((_QWORD *)this + 17);
  v14 = *((_DWORD *)this + 15);
  if (*((_DWORD *)this + 14) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v17) = 0;
      v16 = 0;
    }
    else
    {
      v15 = 0;
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      for (i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          v19 = 0;
          v17 = (int)v17;
          do
          {
            v20 = *((unsigned int *)this + 12);
            if ((_DWORD)v20)
            {
              v21 = a2;
              v22 = v12;
              v23 = v13;
              do
              {
                v24 = (uint64_t)*v21++;
                v25 = (const float *)(v24 + 4 * v17);
                v26 = vld1q_dup_f32(v25);
                v27 = v22[1];
                v28 = vmlaq_f32(v26, v27, v10[1]);
                v29 = vmlaq_f32(vmlaq_f32(v26, *v22, *v10), *v23, v10[2]);
                v30 = vmlaq_f32(v28, v23[1], v10[3]);
                *v23 = *v22;
                v23[1] = v27;
                v23 += 2;
                *v22 = v29;
                v22[1] = v30;
                v22 += 2;
                --v20;
              }
              while (v20);
            }
            v17 += a6;
            ++v19;
          }
          while (v19 != v9);
        }
        v31 = *((unsigned int *)this + 12);
        if ((_DWORD)v31)
        {
          v32 = *((double *)this + 12) * (double)(v7 & 0x7FFFFF);
          v33 = (v7 >> 22) & 0x1FE;
          v34 = (float32x4_t *)(v11 + 32 * v33);
          v35 = (float32x4_t *)(v11 + 32 * (v33 + 2));
          v36 = (float *)*((_QWORD *)this + 26);
          v37 = v12;
          v38 = v13;
          v39 = v36;
          v40 = *((unsigned int *)this + 12);
          do
          {
            v41 = *v37;
            v42 = v37[1];
            v37 += 2;
            v44 = *v38;
            v43 = v38[1];
            v38 += 2;
            v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v34[2], v44), v41, *v34), vmlaq_f32(vmulq_f32(v34[3], v43), v42, v34[1]));
            *v39++ = vaddv_f32(vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL)));
            --v40;
          }
          while (v40);
          v46 = (float *)*((_QWORD *)this + 29);
          v47 = v12;
          v48 = v13;
          v49 = v46;
          v50 = v31;
          do
          {
            v51 = *v47;
            v52 = v47[1];
            v47 += 2;
            v54 = *v48;
            v53 = v48[1];
            v48 += 2;
            v55 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v35[2], v54), v51, *v35), vmlaq_f32(vmulq_f32(v35[3], v53), v52, v35[1]));
            *v49++ = vaddv_f32(vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v55, v55, 8uLL)));
            --v50;
          }
          while (v50);
          v56 = a3;
          do
          {
            v57 = *v36++;
            v58 = v57;
            v59 = *v46++;
            v60 = v58 + (float)(v32 * (float)(v59 - v58));
            v61 = (uint64_t)*v56++;
            *(float *)(v61 + 4 * v15) = v60;
            --v31;
          }
          while (v31);
        }
        v16 = (v16 + v9);
        v62 = v7 + v8;
        v7 = (v7 + v8) & 0x7FFFFFFF;
        v9 = v14 + (v62 >> 31);
        v15 += a7;
      }
    }
    v143 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v143)
        v143 = v9;
      if (v143 >= 1)
      {
        v144 = 0;
        v145 = (int)v17;
        v146 = a6;
        do
        {
          v147 = *((unsigned int *)this + 12);
          if ((_DWORD)v147)
          {
            v148 = a2;
            v149 = v12;
            v150 = v13;
            do
            {
              v151 = (uint64_t)*v148++;
              v152 = (const float *)(v151 + 4 * v145);
              v153 = vld1q_dup_f32(v152);
              v154 = v149[1];
              v155 = vmlaq_f32(v153, v154, v10[1]);
              v156 = vmlaq_f32(vmlaq_f32(v153, *v149, *v10), *v150, v10[2]);
              v157 = vmlaq_f32(v155, v150[1], v10[3]);
              *v150 = *v149;
              v150[1] = v154;
              v150 += 2;
              *v149 = v156;
              v149[1] = v157;
              v149 += 2;
              --v147;
            }
            while (v147);
          }
          v145 += v146;
          ++v144;
        }
        while (v144 != v143);
      }
LABEL_67:
      v9 -= v143;
      v16 = (v143 + v16);
      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (a5 >= 1)
  {
    v63 = 0;
    LODWORD(v16) = 0;
    v64 = 0;
    LODWORD(v65) = 0;
    while (1)
    {
      if (v9 >= 1)
      {
        v66 = 0;
        v65 = (int)v65;
        do
        {
          v67 = *((_DWORD *)this + 12);
          v68 = v12;
          v69 = v13;
          v70 = v67 - (v67 != 0);
          if ((_DWORD)v70)
          {
            v71 = 0;
            v69 = v13;
            v68 = v12;
            do
            {
              v72 = &a2[v71];
              v73 = &(*v72)[v65];
              v74 = (const float *)(*((_QWORD *)v72 + 1) + 4 * v65);
              v75 = vld1q_dup_f32(v73);
              v76 = vld1q_dup_f32(v74);
              v77 = v68[1];
              v78 = vmlaq_f32(vmlaq_f32(v75, *v68, *v10), *v69, v10[4]);
              v79 = vmlaq_f32(vmlaq_f32(v75, v77, v10[1]), v69[1], v10[5]);
              *v69 = *v68;
              v69[1] = v77;
              *v68 = v78;
              v68[1] = v79;
              v80 = v68[2];
              v81 = v68[3];
              v82 = vmlaq_f32(vmlaq_f32(v76, v80, *v10), v69[2], v10[4]);
              v83 = vmlaq_f32(vmlaq_f32(v76, v81, v10[1]), v69[3], v10[5]);
              v69[2] = v80;
              v69[3] = v81;
              v68[2] = v82;
              v68[3] = v83;
              v84 = v68[4];
              v85 = v68[5];
              v86 = vmlaq_f32(vmlaq_f32(v75, v84, v10[2]), v69[4], v10[6]);
              v87 = vmlaq_f32(vmlaq_f32(v76, v85, v10[3]), v69[5], v10[7]);
              v69[4] = v84;
              v69[5] = v85;
              v68[4] = v86;
              v68[5] = v87;
              v68 += 6;
              v69 += 6;
              v71 += 2;
            }
            while (v71 < v70);
          }
          if ((v67 & 1) != 0)
          {
            v88 = &a2[v67 - 1][v65];
            v89 = vld1q_dup_f32(v88);
            v90 = v68[1];
            v91 = vmlaq_f32(vmlaq_f32(v89, *v68, *v10), *v69, v10[4]);
            v92 = vmlaq_f32(vmlaq_f32(v89, v90, v10[1]), v69[1], v10[5]);
            *v69 = *v68;
            v69[1] = v90;
            *v68 = v91;
            v68[1] = v92;
            v93 = v68[2];
            v94 = v68[3];
            v95 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v94, v10[3]), v69[3], v10[7]);
            v96 = vmlaq_f32(vmlaq_f32(v89, v93, v10[2]), v69[2], v10[6]);
            v69[2] = v93;
            v69[3] = v94;
            v68[2] = v96;
            v68[3] = v95;
          }
          v65 += a6;
          ++v66;
        }
        while (v66 != v9);
      }
      v97 = *((double *)this + 12);
      v98 = (v7 >> 21) & 0x3FC;
      v99 = (float32x4_t *)(v11 + 32 * v98);
      v100 = *((unsigned int *)this + 12);
      v101 = (float *)*((_QWORD *)this + 26);
      v102 = v12;
      v103 = v13;
      v104 = v100 - (*((_DWORD *)this + 12) != 0);
      if ((_DWORD)v104)
      {
        v105 = 0;
        v106 = (float32x2_t *)*((_QWORD *)this + 26);
        v103 = v13;
        v102 = v12;
        do
        {
          v107 = v99[1];
          v109 = v99[4];
          v108 = v99[5];
          v110 = vmlaq_f32(vmulq_f32(v108, v103[1]), v102[1], v107);
          v111 = vmlaq_f32(vmulq_f32(v108, v103[3]), v102[3], v107);
          v112 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[7], v103[5]), v102[5], v99[3]);
          v113 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[6], v103[4]), v102[4], v99[2]);
          v114 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, *v103), *v102, *v99), v110);
          *(float32x2_t *)v113.i8 = vadd_f32(*(float32x2_t *)v113.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v113, v113, 8uLL));
          *(float32x2_t *)v114.i8 = vadd_f32(*(float32x2_t *)v114.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v114, v114, 8uLL));
          v115 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, v103[2]), v102[2], *v99), v111);
          *(float32x2_t *)v115.i8 = vadd_f32(*(float32x2_t *)v115.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v115, v115, 8uLL));
          *(float32x2_t *)v112.i8 = vadd_f32(*(float32x2_t *)v112.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v112, v112, 8uLL));
          *v106++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8)));
          v102 += 6;
          v103 += 6;
          v105 += 2;
        }
        while (v105 < v104);
      }
      if ((v100 & 1) != 0)
      {
        v116 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[4], *v103), *v102, *v99), vmlaq_f32(vmulq_f32(v99[5], v103[1]), v102[1], v99[1]));
        *(float32x2_t *)v116.i8 = vadd_f32(*(float32x2_t *)v116.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v116, v116, 8uLL));
        v117 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[6], v103[2]), v102[2], v99[2]), vmlaq_f32(vmulq_f32(v99[7], v103[3]), v102[3], v99[3]));
        *(float32x2_t *)v117.i8 = vadd_f32(*(float32x2_t *)v117.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v117, v117, 8uLL));
        v101[(v100 - 1)] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8)));
      }
      v118 = (float32x4_t *)(v11 + 32 * (v98 + 4));
      v119 = (float *)*((_QWORD *)this + 29);
      v120 = v12;
      v121 = v13;
      if ((_DWORD)v104)
      {
        v122 = 0;
        v123 = (float32x2_t *)*((_QWORD *)this + 29);
        v121 = v13;
        v120 = v12;
        do
        {
          v124 = v118[1];
          v126 = v118[4];
          v125 = v118[5];
          v127 = vmlaq_f32(vmulq_f32(v125, v121[1]), v120[1], v124);
          v128 = vmlaq_f32(vmulq_f32(v125, v121[3]), v120[3], v124);
          v129 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[7], v121[5]), v120[5], v118[3]);
          v130 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[6], v121[4]), v120[4], v118[2]);
          v131 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, *v121), *v120, *v118), v127);
          *(float32x2_t *)v130.i8 = vadd_f32(*(float32x2_t *)v130.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v130, v130, 8uLL));
          *(float32x2_t *)v131.i8 = vadd_f32(*(float32x2_t *)v131.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v131, v131, 8uLL));
          v132 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, v121[2]), v120[2], *v118), v128);
          *(float32x2_t *)v132.i8 = vadd_f32(*(float32x2_t *)v132.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v132, v132, 8uLL));
          *(float32x2_t *)v129.i8 = vadd_f32(*(float32x2_t *)v129.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v129, v129, 8uLL));
          *v123++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8)));
          v120 += 6;
          v121 += 6;
          v122 += 2;
        }
        while (v122 < v104);
      }
      v133 = v97 * (double)(v7 & 0x7FFFFF);
      if ((v100 & 1) != 0)
        break;
      v134 = a3;
      if ((_DWORD)v100)
        goto LABEL_41;
LABEL_42:
      v16 = (v16 + v9);
      v142 = v7 + v8;
      v7 = (v7 + v8) & 0x7FFFFFFF;
      v9 = v14 + (v142 >> 31);
      ++v64;
      v63 += a7;
      if (v64 == a5)
        goto LABEL_56;
    }
    v135 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[4], *v121), *v120, *v118), vmlaq_f32(vmulq_f32(v118[5], v121[1]), v120[1], v118[1]));
    *(float32x2_t *)v135.i8 = vadd_f32(*(float32x2_t *)v135.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v135, v135, 8uLL));
    v136 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[6], v121[2]), v120[2], v118[2]), vmlaq_f32(vmulq_f32(v118[7], v121[3]), v120[3], v118[3]));
    *(float32x2_t *)v136.i8 = vadd_f32(*(float32x2_t *)v136.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v136, v136, 8uLL));
    v119[(v100 - 1)] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v135.i8, *(int32x2_t *)v136.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v135.i8, *(int32x2_t *)v136.i8)));
    v134 = a3;
    do
    {
LABEL_41:
      v137 = *v101++;
      v138 = v137;
      v139 = *v119++;
      v140 = v138 + (float)(v133 * (float)(v139 - v138));
      v141 = (uint64_t)*v134++;
      *(float *)(v141 + 4 * v63) = v140;
      --v100;
    }
    while (v100);
    goto LABEL_42;
  }
  LODWORD(v65) = 0;
  v16 = 0;
LABEL_56:
  v143 = a4 - v16;
  if (a4 > (int)v16)
  {
    if (v9 < v143)
      v143 = v9;
    if (v143 >= 1)
    {
      v158 = 0;
      v159 = (int)v65;
      v160 = a6;
      do
      {
        v161 = *((_DWORD *)this + 12);
        v162 = v12;
        v163 = v13;
        v164 = v161 - (v161 != 0);
        if ((_DWORD)v164)
        {
          v165 = 0;
          v163 = v13;
          v162 = v12;
          do
          {
            v166 = &a2[v165];
            v167 = &(*v166)[v159];
            v168 = (const float *)(*((_QWORD *)v166 + 1) + 4 * v159);
            v169 = vld1q_dup_f32(v167);
            v170 = vld1q_dup_f32(v168);
            v171 = v162[1];
            v172 = vmlaq_f32(vmlaq_f32(v169, *v162, *v10), *v163, v10[4]);
            v173 = vmlaq_f32(vmlaq_f32(v169, v171, v10[1]), v163[1], v10[5]);
            *v163 = *v162;
            v163[1] = v171;
            *v162 = v172;
            v162[1] = v173;
            v174 = v162[2];
            v175 = v162[3];
            v176 = vmlaq_f32(vmlaq_f32(v170, v174, *v10), v163[2], v10[4]);
            v177 = vmlaq_f32(vmlaq_f32(v170, v175, v10[1]), v163[3], v10[5]);
            v163[2] = v174;
            v163[3] = v175;
            v162[2] = v176;
            v162[3] = v177;
            v178 = v162[4];
            v179 = v162[5];
            v180 = vmlaq_f32(vmlaq_f32(v169, v178, v10[2]), v163[4], v10[6]);
            v181 = vmlaq_f32(vmlaq_f32(v170, v179, v10[3]), v163[5], v10[7]);
            v163[4] = v178;
            v163[5] = v179;
            v162[4] = v180;
            v162[5] = v181;
            v162 += 6;
            v163 += 6;
            v165 += 2;
          }
          while (v165 < v164);
        }
        if ((v161 & 1) != 0)
        {
          v182 = &a2[v161 - 1][v159];
          v183 = vld1q_dup_f32(v182);
          v184 = v162[1];
          v185 = vmlaq_f32(vmlaq_f32(v183, *v162, *v10), *v163, v10[4]);
          v186 = vmlaq_f32(vmlaq_f32(v183, v184, v10[1]), v163[1], v10[5]);
          *v163 = *v162;
          v163[1] = v184;
          *v162 = v185;
          v162[1] = v186;
          v187 = v162[2];
          v188 = v162[3];
          v189 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v188, v10[3]), v163[3], v10[7]);
          v190 = vmlaq_f32(vmlaq_f32(v183, v187, v10[2]), v163[2], v10[6]);
          v163[2] = v187;
          v163[3] = v188;
          v162[2] = v190;
          v162[3] = v189;
        }
        v159 += v160;
        ++v158;
      }
      while (v158 != v143);
    }
    goto LABEL_67;
  }
LABEL_68:
  *((_DWORD *)this + 18) = v7;
  *((_DWORD *)this + 22) = v9;
  return v16;
}

double RamstadSRC::latencySeconds(RamstadSRC *this)
{
  double v1;
  double v2;
  double v3;

  v1 = *((double *)this + 5);
  v2 = *((double *)this + 4) / v1;
  if (v2 >= 1.0)
    v3 = dbl_1A839E540[*((_DWORD *)this + 14) == 8];
  else
    v3 = dbl_1A839E530[*((_DWORD *)this + 14) == 8] / v2;
  return v3 / v1;
}

double RamstadSRC::latencySamples(RamstadSRC *this)
{
  double v1;

  v1 = *((double *)this + 4) / *((double *)this + 5);
  if (v1 >= 1.0)
    return dbl_1A839E540[*((_DWORD *)this + 14) == 8];
  else
    return dbl_1A839E530[*((_DWORD *)this + 14) == 8] / v1;
}

void TFileBSD::~TFileBSD(TFileBSD *this)
{
  TFileBSD::~TFileBSD(this);
  JUMPOUT(0x1A85D2980);
}

{
  NSObject *v2;
  void (**v3)(TFileBSD *__hidden);
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  TFileBSD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E5425168;
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315906;
    v7 = "TFileBSD.cpp";
    v8 = 1024;
    v9 = 132;
    v10 = 2080;
    v11 = "~TFileBSD";
    v12 = 2048;
    v13 = this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
    v3 = *(void (***)(TFileBSD *__hidden))this;
    goto LABEL_8;
  }
LABEL_7:
  v3 = &off_1E5425168;
LABEL_8:
  if (((unsigned int (*)(TFileBSD *))v3[15])(this))
    (*(void (**)(TFileBSD *))(*(_QWORD *)this + 112))(this);
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v6 = 136315906;
          v7 = "TFileBSD.cpp";
          v8 = 1024;
          v9 = 141;
          v10 = 2080;
          v11 = "~TFileBSD";
          v12 = 2048;
          v13 = this;
          _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
  v5 = (void *)*((_QWORD *)this + 1);
  if (v5)
  {
    free(v5);
    *((_QWORD *)this + 1) = 0;
  }
}

size_t TFileBSD::Read(FILE **this, void *a2, size_t a3)
{
  NSObject *v6;
  size_t v7;
  int v8;
  NSObject *v9;
  CAXException *exception;
  unsigned int v12;
  CAXException *v13;
  _BYTE v14[16];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v6 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "TFileBSD.cpp";
    v17 = 1024;
    v18 = 449;
    v19 = 2080;
    v20 = "Read";
    v21 = 2048;
    v22 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v14, 0xFFFFFFDA);
      *(_DWORD *)buf = 136315906;
      v16 = "TFileBSD.cpp";
      v17 = 1024;
      v18 = 452;
      v19 = 2080;
      v20 = v14;
      v21 = 2080;
      v22 = "Read - file not open";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Read - file not open", -38);
  }
  if (a3)
  {
    v7 = fread(a2, 1uLL, a3, this[2]);
    if (v7 < a3 && !feof(this[2]))
    {
      v8 = ferror(this[2]);
      if (v8)
      {
        v12 = v8;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12);
          *(_DWORD *)buf = 136315906;
          v16 = "TFileBSD.cpp";
          v17 = 1024;
          v18 = 463;
          v19 = 2080;
          v20 = v14;
          v21 = 2080;
          v22 = "Read::fread";
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        v13 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v13, "Read::fread", v12);
      }
    }
    this[3] = (FILE *)((char *)this[3] + v7);
  }
  else
  {
    v7 = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v9 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v16 = "TFileBSD.cpp";
          v17 = 1024;
          v18 = 469;
          v19 = 2080;
          v20 = "Read";
          v21 = 2048;
          v22 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
  return v7;
}

void sub_1A839026C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

size_t TFileBSD::Write(FILE **this, void *a2, size_t a3)
{
  NSObject *v6;
  size_t v7;
  int v8;
  NSObject *v9;
  CAXException *exception;
  unsigned int v12;
  CAXException *v13;
  _BYTE v14[16];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v6 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "TFileBSD.cpp";
    v17 = 1024;
    v18 = 479;
    v19 = 2080;
    v20 = "Write";
    v21 = 2048;
    v22 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v14, 0xFFFFFFDA);
      *(_DWORD *)buf = 136315906;
      v16 = "TFileBSD.cpp";
      v17 = 1024;
      v18 = 482;
      v19 = 2080;
      v20 = v14;
      v21 = 2080;
      v22 = "Write - file not open";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Write - file not open", -38);
  }
  if (a3)
  {
    v7 = fwrite(a2, 1uLL, a3, this[2]);
    if (v7 < a3)
    {
      v8 = ferror(this[2]);
      if (v8)
      {
        v12 = v8;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12);
          *(_DWORD *)buf = 136315906;
          v16 = "TFileBSD.cpp";
          v17 = 1024;
          v18 = 492;
          v19 = 2080;
          v20 = v14;
          v21 = 2080;
          v22 = "Write::fwrite";
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        v13 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v13, "Write::fwrite", v12);
      }
    }
    this[3] = (FILE *)((char *)this[3] + v7);
  }
  else
  {
    v7 = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v9 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v16 = "TFileBSD.cpp";
          v17 = 1024;
          v18 = 498;
          v19 = 2080;
          v20 = "Write";
          v21 = 2048;
          v22 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
  return v7;
}

void sub_1A8390604(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t TFileBSD::ReadAsync(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  TFileBSD *v16;
  _BYTE *FreeRequestBlock;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v10 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315906;
    v23 = "TFileBSD.cpp";
    v24 = 1024;
    v25 = 508;
    v26 = 2080;
    v27 = "ReadAsync";
    v28 = 2048;
    v29 = a1;
    _os_log_impl(&dword_1A836D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v22, 0x26u);
  }
LABEL_7:
  if (((*(uint64_t (**)(_QWORD *))(*a1 + 120))(a1) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "TFileBSD.cpp";
      v24 = 1024;
      v25 = 511;
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(IsOpen()) != 0 is false]: ", (uint8_t *)&v22, 0x12u);
    }
    __break(1u);
  }
  if (!(*(unsigned int (**)(_QWORD *))(*a1 + 120))(a1))
    return 4294967258;
  v11 = a1[5];
  v12 = a1[3];
  v13 = v12 + a3;
  v14 = v11 - v12;
  if (v13 <= (int)v11)
    v15 = a3;
  else
    v15 = v14;
  if (v15 < 1)
  {
    v19 = 0;
    if (!v15)
      --*(_DWORD *)sReadCounter_BSD;
  }
  else
  {
    LOBYTE(v22) = 0;
    v16 = (TFileBSD *)(*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)TFileBSD::sGuard + 32))(TFileBSD::sGuard, &v22);
    if ((_DWORD)v16)
    {
      FreeRequestBlock = TFileBSD::GetFreeRequestBlock(v16);
      if (!FreeRequestBlock)
        return 0xFFFFFFFFLL;
      *((_QWORD *)FreeRequestBlock + 1) = a4;
      *((_QWORD *)FreeRequestBlock + 2) = a5;
      v18 = a1[3];
      *((_DWORD *)FreeRequestBlock + 6) = v18;
      a1[3] = v18 + v15;
      *((_DWORD *)FreeRequestBlock + 7) = v15;
      *((_QWORD *)FreeRequestBlock + 4) = a2;
      *((_QWORD *)FreeRequestBlock + 5) = a1;
      *FreeRequestBlock = 1;
      (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sGuard + 80))(TFileBSD::sGuard);
      if ((_BYTE)v22)
        (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sGuard + 24))(TFileBSD::sGuard);
      v19 = 0;
    }
    else
    {
      v19 = 0xFFFFFFFFLL;
    }
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v20 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v22 = 136315906;
          v23 = "TFileBSD.cpp";
          v24 = 1024;
          v25 = 561;
          v26 = 2080;
          v27 = "ReadAsync";
          v28 = 2048;
          v29 = a1;
          _os_log_impl(&dword_1A836D000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v22, 0x26u);
        }
      }
    }
  }
  return v19;
}

void TFileBSD::Seek(FILE **this, FILE *a2)
{
  NSObject *v4;
  NSObject *v5;
  CAXException *exception;
  int v7;
  CAXException *v8;
  _BYTE v9[16];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "TFileBSD.cpp";
    v12 = 1024;
    v13 = 364;
    v14 = 2080;
    v15 = "Seek";
    v16 = 2048;
    v17 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, 0xFFFFFFDA);
      *(_DWORD *)buf = 136315906;
      v11 = "TFileBSD.cpp";
      v12 = 1024;
      v13 = 367;
      v14 = 2080;
      v15 = v9;
      v16 = 2080;
      v17 = "Seek - file not open";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Seek - file not open", -38);
  }
  if (fseeko(this[2], (off_t)a2 + (_QWORD)this[4], 0))
  {
    v7 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, v7);
      *(_DWORD *)buf = 136315906;
      v11 = "TFileBSD.cpp";
      v12 = 1024;
      v13 = 369;
      v14 = 2080;
      v15 = v9;
      v16 = 2080;
      v17 = "Seek::fseeko failed";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    v8 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v8, "Seek::fseeko failed", v7);
  }
  this[3] = a2;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v11 = "TFileBSD.cpp";
          v12 = 1024;
          v13 = 374;
          v14 = 2080;
          v15 = "Seek";
          v16 = 2048;
          v17 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1A8390C74(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::SeekAsync(TFileBSD *this, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  TFileBSD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
    {
      *((_QWORD *)this + 3) = a2;
LABEL_8:
      if ((*(_BYTE *)(v4 + 8) & 1) != 0)
      {
        v6 = *(NSObject **)v4;
        if (*(_QWORD *)v4)
        {
          if (os_log_type_enabled(*(os_log_t *)v4, OS_LOG_TYPE_DEBUG))
          {
            v7 = 136315906;
            v8 = "TFileBSD.cpp";
            v9 = 1024;
            v10 = 387;
            v11 = 2080;
            v12 = "SeekAsync";
            v13 = 2048;
            v14 = this;
            _os_log_impl(&dword_1A836D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v7, 0x26u);
          }
        }
      }
      return;
    }
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315906;
    v8 = "TFileBSD.cpp";
    v9 = 1024;
    v10 = 383;
    v11 = 2080;
    v12 = "SeekAsync";
    v13 = 2048;
    v14 = this;
    _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v7, 0x26u);
    v4 = kTFileBSDSubsystem;
  }
  *((_QWORD *)this + 3) = a2;
  if (v4)
    goto LABEL_8;
}

uint64_t TFileBSD::GetPosition(TFileBSD *this)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  TFileBSD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
    {
LABEL_8:
      if ((*(_BYTE *)(v2 + 8) & 1) != 0)
      {
        v4 = *(NSObject **)v2;
        if (*(_QWORD *)v2)
        {
          if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
          {
            v6 = 136315906;
            v7 = "TFileBSD.cpp";
            v8 = 1024;
            v9 = 399;
            v10 = 2080;
            v11 = "GetPosition";
            v12 = 2048;
            v13 = this;
            _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
          }
        }
      }
      return *((_QWORD *)this + 3);
    }
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315906;
    v7 = "TFileBSD.cpp";
    v8 = 1024;
    v9 = 397;
    v10 = 2080;
    v11 = "GetPosition";
    v12 = 2048;
    v13 = this;
    _os_log_impl(&dword_1A836D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
    v2 = kTFileBSDSubsystem;
  }
  if (v2)
    goto LABEL_8;
  return *((_QWORD *)this + 3);
}

void TFileBSD::Skip(FILE **this, off_t a2)
{
  NSObject *v4;
  NSObject *v5;
  CAXException *exception;
  int v7;
  CAXException *v8;
  _BYTE v9[16];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "TFileBSD.cpp";
    v12 = 1024;
    v13 = 409;
    v14 = 2080;
    v15 = "Skip";
    v16 = 2048;
    v17 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, 0xFFFFFFDA);
      *(_DWORD *)buf = 136315906;
      v11 = "TFileBSD.cpp";
      v12 = 1024;
      v13 = 412;
      v14 = 2080;
      v15 = v9;
      v16 = 2080;
      v17 = "Skip - file not open";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Skip - file not open", -38);
  }
  if (fseeko(this[2], a2, 1))
  {
    v7 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v9, v7);
      *(_DWORD *)buf = 136315906;
      v11 = "TFileBSD.cpp";
      v12 = 1024;
      v13 = 414;
      v14 = 2080;
      v15 = v9;
      v16 = 2080;
      v17 = "Skip::fseeko failed";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    v8 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v8, "Skip::fseeko failed", v7);
  }
  this[3] = (FILE *)((char *)this[3] + a2);
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v11 = "TFileBSD.cpp";
          v12 = 1024;
          v13 = 420;
          v14 = 2080;
          v15 = "Skip";
          v16 = 2048;
          v17 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1A839130C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

off_t TFileBSD::GetLength(FILE **this)
{
  NSObject *v2;
  int v3;
  off_t st_size;
  NSObject *v5;
  CAXException *exception;
  int v8;
  CAXException *v9;
  _BYTE v10[16];
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  stat buf;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    buf.st_dev = 136315906;
    *(_QWORD *)&buf.st_mode = "TFileBSD.cpp";
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = 429;
    HIWORD(buf.st_uid) = 2080;
    *(_QWORD *)&buf.st_gid = "GetLength";
    *((_WORD *)&buf.st_rdev + 2) = 2048;
    *(_QWORD *)((char *)&buf.st_rdev + 6) = this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&buf, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) == 0)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v11, 0xFFFFFFDA);
      buf.st_dev = 136315906;
      *(_QWORD *)&buf.st_mode = "TFileBSD.cpp";
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = 433;
      HIWORD(buf.st_uid) = 2080;
      *(_QWORD *)&buf.st_gid = v11;
      *((_WORD *)&buf.st_rdev + 2) = 2080;
      *(_QWORD *)((char *)&buf.st_rdev + 6) = "GetLength - file not open";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)&buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "GetLength - file not open", -38);
  }
  v3 = fileno(this[2]);
  if (fstat(v3, &buf))
  {
    v8 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v10, v8);
      *(_DWORD *)v11 = 136315906;
      v12 = "TFileBSD.cpp";
      v13 = 1024;
      v14 = 436;
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = "GetLength::fstat failed";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", v11, 0x26u);
    }
    v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(v9, "GetLength::fstat failed", v8);
  }
  st_size = buf.st_size;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v11 = 136315906;
          v12 = "TFileBSD.cpp";
          v13 = 1024;
          v14 = 439;
          v15 = 2080;
          v16 = "GetLength";
          v17 = 2048;
          v18 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", v11, 0x26u);
        }
      }
    }
  }
  return st_size;
}

void sub_1A8391674(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL TFileBSD::Exists(const char **this)
{
  NSObject *v2;
  _BOOL8 v3;
  NSObject *v4;
  stat v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6.st_dev = 136315906;
    *(_QWORD *)&v6.st_mode = "TFileBSD.cpp";
    WORD2(v6.st_ino) = 1024;
    *(_DWORD *)((char *)&v6.st_ino + 6) = 236;
    HIWORD(v6.st_uid) = 2080;
    *(_QWORD *)&v6.st_gid = "Exists";
    *((_WORD *)&v6.st_rdev + 2) = 2048;
    *(_QWORD *)((char *)&v6.st_rdev + 6) = this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
  }
LABEL_7:
  v3 = ((*((uint64_t (**)(const char **))*this + 15))(this) & 1) != 0 || stat(this[1], &v6) == 0;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v6.st_dev = 136315906;
          *(_QWORD *)&v6.st_mode = "TFileBSD.cpp";
          WORD2(v6.st_ino) = 1024;
          *(_DWORD *)((char *)&v6.st_ino + 6) = 252;
          HIWORD(v6.st_uid) = 2080;
          *(_QWORD *)&v6.st_gid = "Exists";
          *((_WORD *)&v6.st_rdev + 2) = 2048;
          *(_QWORD *)((char *)&v6.st_rdev + 6) = this;
          _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
  return v3;
}

void TFileBSD::Create(TFileBSD *this)
{
  NSObject *v2;
  const char *v3;
  FILE *v4;
  NSObject *v5;
  int v6;
  CAXException *exception;
  int v8;
  CAXException *v9;
  _BYTE v10[16];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v12 = "TFileBSD.cpp";
    v13 = 1024;
    v14 = 262;
    v15 = 2080;
    v16 = "Create";
    v17 = 2048;
    v18 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if (((*(uint64_t (**)(TFileBSD *))(*(_QWORD *)this + 80))(this) & 1) == 0)
  {
    v3 = (const char *)*((_QWORD *)this + 1);
    if (v3)
    {
      v4 = fopen(v3, "w+b");
      if (!v4)
      {
        v6 = *__error() + 100000;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v10, v6);
          *(_DWORD *)buf = 136315906;
          v12 = "TFileBSD.cpp";
          v13 = 1024;
          v14 = 268;
          v15 = 2080;
          v16 = v10;
          v17 = 2080;
          v18 = "Create::fopen failed";
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(exception, "Create::fopen failed", v6);
      }
      if (fclose(v4))
      {
        v8 = *__error() + 100000;
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v10, v8);
          *(_DWORD *)buf = 136315906;
          v12 = "TFileBSD.cpp";
          v13 = 1024;
          v14 = 269;
          v15 = 2080;
          v16 = v10;
          v17 = 2080;
          v18 = "Create::fclose failed";
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v9, "Create::fclose failed", v8);
      }
    }
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v12 = "TFileBSD.cpp";
          v13 = 1024;
          v14 = 281;
          v15 = 2080;
          v16 = "Create";
          v17 = 2048;
          v18 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1A8391BAC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::DeleteFile(const std::__fs::filesystem::path **this)
{
  NSObject *v2;
  std::error_code *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const std::__fs::filesystem::path **v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315906;
    v6 = "TFileBSD.cpp";
    v7 = 1024;
    v8 = 290;
    v9 = 2080;
    v10 = "DeleteFile";
    v11 = 2048;
    v12 = this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v5, 0x26u);
  }
LABEL_7:
  if (((unsigned int (*)(const std::__fs::filesystem::path **))(*this)[5].__pn_.__r_.__value_.__l.__data_)(this))
    ((void (*)(const std::__fs::filesystem::path **))(*this)[4].__pn_.__r_.__value_.__r.__words[2])(this);
  remove(this[1], v3);
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v5 = 136315906;
          v6 = "TFileBSD.cpp";
          v7 = 1024;
          v8 = 301;
          v9 = 2080;
          v10 = "DeleteFile";
          v11 = 2048;
          v12 = this;
          _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v5, 0x26u);
        }
      }
    }
  }
}

void TFileBSD::Open(const char **this, unsigned int a2)
{
  NSObject *v4;
  int v5;
  const char *v6;
  FILE *v7;
  NSObject *v8;
  CAXException *v9;
  CAXException *exception;
  int v11;
  CAXException *v12;
  _BYTE v13[16];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v4 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "TFileBSD.cpp";
    v16 = 1024;
    v17 = 310;
    v18 = 2080;
    v19 = "Open";
    v20 = 2048;
    v21 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  if (((*((uint64_t (**)(const char **))*this + 15))(this) & 1) == 0)
  {
    if (a2 >= 2)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v13, 0xFFFFFFCE);
        *(_DWORD *)buf = 136315906;
        v15 = "TFileBSD.cpp";
        v16 = 1024;
        v17 = 315;
        v18 = 2080;
        v19 = v13;
        v20 = 2080;
        v21 = "Open - file open invalid file permission";
        _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
      CAXException::CAXException(exception, "Open - file open invalid file permission", -50);
    }
    if (access(this[1], 2 * (a2 != 0)))
    {
      v5 = *__error();
      if (v5 == 13 || v5 == 1)
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v13, 0xFFFFFFCA);
          *(_DWORD *)buf = 136315906;
          v15 = "TFileBSD.cpp";
          v16 = 1024;
          v17 = 321;
          v18 = 2080;
          v19 = v13;
          v20 = 2080;
          v21 = "Open: Permission denied";
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        v9 = (CAXException *)__cxa_allocate_exception(0x110uLL);
        CAXException::CAXException(v9, "Open: Permission denied", -54);
      }
    }
    if (a2)
      v6 = "r+b";
    else
      v6 = "rb";
    v7 = fopen(this[1], v6);
    this[2] = (const char *)v7;
    if (!v7)
    {
      v11 = *__error() + 100000;
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v13, v11);
        *(_DWORD *)buf = 136315906;
        v15 = "TFileBSD.cpp";
        v16 = 1024;
        v17 = 327;
        v18 = 2080;
        v19 = v13;
        v20 = 2080;
        v21 = "Open::fopen failed";
        _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      v12 = (CAXException *)__cxa_allocate_exception(0x110uLL);
      CAXException::CAXException(v12, "Open::fopen failed", v11);
    }
    if ((uint64_t)this[4] >= 1)
      (*((void (**)(const char **, _QWORD))*this + 5))(this, 0);
    this[5] = (const char *)(*((uint64_t (**)(const char **))*this + 9))(this);
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v8 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v15 = "TFileBSD.cpp";
          v16 = 1024;
          v17 = 338;
          v18 = 2080;
          v19 = "Open";
          v20 = 2048;
          v21 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1A8392204(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void TFileBSD::Close(TFileBSD *this)
{
  NSObject *v2;
  FILE *v3;
  NSObject *v4;
  int v5;
  CAXException *exception;
  _BYTE v7[16];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "TFileBSD.cpp";
    v10 = 1024;
    v11 = 347;
    v12 = 2080;
    v13 = "Close";
    v14 = 2048;
    v15 = (const char *)this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", buf, 0x26u);
  }
LABEL_7:
  v3 = (FILE *)*((_QWORD *)this + 2);
  if (v3 && fclose(v3))
  {
    v5 = *__error() + 100000;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v7, v5);
      *(_DWORD *)buf = 136315906;
      v9 = "TFileBSD.cpp";
      v10 = 1024;
      v11 = 351;
      v12 = 2080;
      v13 = v7;
      v14 = 2080;
      v15 = "Close::fclose failed";
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Close::fclose failed", v5);
  }
  *((_QWORD *)this + 2) = 0;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v4 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v9 = "TFileBSD.cpp";
          v10 = 1024;
          v11 = 354;
          v12 = 2080;
          v13 = "Close";
          v14 = 2048;
          v15 = (const char *)this;
          _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", buf, 0x26u);
        }
      }
    }
  }
}

void sub_1A8392494(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL TFileBSD::IsOpen(TFileBSD *this)
{
  return *((_QWORD *)this + 2) != 0;
}

void TFileBSD::Clear(FILE **this)
{
  NSObject *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  FILE **v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v2 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315906;
    v7 = "TFileBSD.cpp";
    v8 = 1024;
    v9 = 571;
    v10 = 2080;
    v11 = "Clear";
    v12 = 2048;
    v13 = this;
    _os_log_impl(&dword_1A836D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v6, 0x26u);
  }
LABEL_7:
  if ((((uint64_t (*)(FILE **))(*this)->_lb._base)(this) & 1) != 0)
  {
    v3 = fileno(this[2]);
    ftruncate(v3, 0);
  }
  else
  {
    ((void (*)(FILE **, uint64_t))(*this)->_extra)(this, 1);
    v4 = fileno(this[2]);
    ftruncate(v4, 0);
    (*(void (**)(FILE **))&(*this)->_ur)(this);
  }
  this[3] = 0;
  this[4] = 0;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v6 = 136315906;
          v7 = "TFileBSD.cpp";
          v8 = 1024;
          v9 = 589;
          v10 = 2080;
          v11 = "Clear";
          v12 = 2048;
          v13 = this;
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v6, 0x26u);
        }
      }
    }
  }
}

_BYTE *TFileBSD::GetFreeRequestBlock(TFileBSD *this)
{
  NSObject *v1;
  _BYTE *v2;
  int v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v1 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v1 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315650;
    v7 = "TFileBSD.cpp";
    v8 = 1024;
    v9 = 598;
    v10 = 2080;
    v11 = "GetFreeRequestBlock";
    _os_log_impl(&dword_1A836D000, v1, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", (uint8_t *)&v6, 0x1Cu);
  }
LABEL_7:
  v2 = (_BYTE *)(*(_QWORD *)TFileBSD::sRequestBlockList + 48 * TFileBSD::sAsyncRequestWriteIndex);
  if (*v2)
    return 0;
  v4 = (TFileBSD::sAsyncRequestWriteIndex + 1) & 0x7F;
  if (TFileBSD::sAsyncRequestWriteIndex + 1 <= 0)
    v4 = -(-(TFileBSD::sAsyncRequestWriteIndex + 1) & 0x7F);
  TFileBSD::sAsyncRequestWriteIndex = v4;
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v5 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v6 = 136315650;
          v7 = "TFileBSD.cpp";
          v8 = 1024;
          v9 = 605;
          v10 = 2080;
          v11 = "GetFreeRequestBlock";
          _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", (uint8_t *)&v6, 0x1Cu);
        }
      }
    }
  }
  return v2;
}

void sub_1A8392A30(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10)
{
  uint64_t v10;
  NSObject **v11;
  NSObject *v12;

  if (!a2)
    _Unwind_Resume(a1);
  __cxa_begin_catch(a1);
  v11 = *(NSObject ***)(v10 + 96);
  if (v11)
  {
    v12 = *v11;
    if (!*v11)
      goto LABEL_8;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(a9) = 136315906;
    *(_QWORD *)((char *)&a9 + 4) = "TFileBSD.cpp";
    WORD6(a9) = 1024;
    *(_DWORD *)((char *)&a9 + 14) = 138;
    WORD1(a10) = 2080;
    *(_QWORD *)((char *)&a10 + 4) = "~TFileBSD";
    WORD6(a10) = 2048;
    _os_log_impl(&dword_1A836D000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d <-%s %p: Swallowed exception from Close()", (uint8_t *)&a9, 0x26u);
  }
LABEL_8:
  __cxa_end_catch();
  JUMPOUT(0x1A8392958);
}

void TFileBSD::TFileBSD(TFileBSD *this, const __CFURL *a2)
{
  void **v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  TFileBSD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E5425168;
  *((_QWORD *)this + 1) = 0;
  v4 = (void **)((char *)this + 8);
  if (TFileBSD::TFileBSD(__CFURL const*)::once != -1)
    dispatch_once(&TFileBSD::TFileBSD(__CFURL const*)::once, &__block_literal_global_272);
  if (kTFileBSDSubsystem)
  {
    v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_9;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315906;
    v8 = "TFileBSD.cpp";
    v9 = 1024;
    v10 = 77;
    v11 = 2080;
    v12 = "TFileBSD";
    v13 = 2048;
    v14 = this;
    _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v7, 0x26u);
  }
LABEL_9:
  TFileBSD::Initialize(this);
  if (a2)
  {
    CADeprecated::CAAutoFree<char>::allocBytes(v4);
    if (*v4)
    {
      if (CFURLGetFileSystemRepresentation(a2, 1u, (UInt8 *)*v4, 1024) != 1 && *v4)
        *(_BYTE *)*v4 = 0;
    }
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v6 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v7 = 136315906;
          v8 = "TFileBSD.cpp";
          v9 = 1024;
          v10 = 102;
          v11 = 2080;
          v12 = "TFileBSD";
          v13 = 2048;
          v14 = this;
          _os_log_impl(&dword_1A836D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v7, 0x26u);
        }
      }
    }
  }
}

void sub_1A8392CF8(_Unwind_Exception *exception_object)
{
  void **v1;

  if (*v1)
  {
    free(*v1);
    *v1 = 0;
  }
  _Unwind_Resume(exception_object);
}

void TFileBSD::Initialize(TFileBSD *this)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  TFileBSD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = kTFileBSDSubsystem;
  if (kTFileBSDSubsystem)
  {
    v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
    {
      *((_OWORD *)this + 1) = 0u;
      *((_OWORD *)this + 2) = 0u;
LABEL_8:
      if ((*(_BYTE *)(v2 + 8) & 1) != 0)
      {
        v4 = *(NSObject **)v2;
        if (*(_QWORD *)v2)
        {
          if (os_log_type_enabled(*(os_log_t *)v2, OS_LOG_TYPE_DEBUG))
          {
            v5 = 136315906;
            v6 = "TFileBSD.cpp";
            v7 = 1024;
            v8 = 155;
            v9 = 2080;
            v10 = "Initialize";
            v11 = 2048;
            v12 = this;
            _os_log_impl(&dword_1A836D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v5, 0x26u);
          }
        }
      }
      return;
    }
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315906;
    v6 = "TFileBSD.cpp";
    v7 = 1024;
    v8 = 150;
    v9 = 2080;
    v10 = "Initialize";
    v11 = 2048;
    v12 = this;
    _os_log_impl(&dword_1A836D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v5, 0x26u);
    v2 = kTFileBSDSubsystem;
  }
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  if (v2)
    goto LABEL_8;
}

void *CADeprecated::CAAutoFree<char>::allocBytes(void **a1)
{
  void *v2;
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v5;

  v2 = *a1;
  if (v2)
  {
    free(v2);
    *a1 = 0;
  }
  result = malloc_type_malloc(0x400uLL, 0x7C51E058uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v5 = std::bad_alloc::bad_alloc(exception);
  }
  *a1 = result;
  return result;
}

os_log_t ___ZN8TFileBSDC2EPK7__CFURL_block_invoke()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.coreaudio", "tfbsd");
  *v0 = result;
  kTFileBSDSubsystem = (uint64_t)v0;
  return result;
}

void TFileBSD::TFileBSD(TFileBSD *this, const char **a2)
{
  void **v4;
  NSObject *v5;
  void *v6;
  size_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  TFileBSD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = &off_1E5425168;
  *((_QWORD *)this + 1) = 0;
  v4 = (void **)((char *)this + 8);
  if (kTFileBSDSubsystem)
  {
    v5 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315906;
    v10 = "TFileBSD.cpp";
    v11 = 1024;
    v12 = 112;
    v13 = 2080;
    v14 = "TFileBSD";
    v15 = 2048;
    v16 = this;
    _os_log_impl(&dword_1A836D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s %p", (uint8_t *)&v9, 0x26u);
  }
LABEL_7:
  TFileBSD::Initialize(this);
  if (a2[1])
  {
    CADeprecated::CAAutoFree<char>::allocBytes(v4);
    v6 = *v4;
    if (v6)
    {
      v7 = strlen(a2[1]);
      memcpy(v6, a2[1], v7 + 1);
    }
  }
  *((_QWORD *)this + 4) = a2[4];
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v8 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v9 = 136315906;
          v10 = "TFileBSD.cpp";
          v11 = 1024;
          v12 = 123;
          v13 = 2080;
          v14 = "TFileBSD";
          v15 = 2048;
          v16 = this;
          _os_log_impl(&dword_1A836D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s %p", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void sub_1A839315C(_Unwind_Exception *exception_object)
{
  void **v1;

  if (*v1)
  {
    free(*v1);
    *v1 = 0;
  }
  _Unwind_Resume(exception_object);
}

uint64_t TFileBSD::InitializeAsync(TFileBSD *this, int *a2)
{
  NSObject *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _opaque_pthread_t *v9;
  CADeprecated::CAGuard *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v3 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315650;
    v14 = "TFileBSD.cpp";
    v15 = 1024;
    v16 = 177;
    v17 = 2080;
    v18 = "InitializeAsync";
    _os_log_impl(&dword_1A836D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", (uint8_t *)&v13, 0x1Cu);
  }
LABEL_7:
  pthread_mutex_lock(&sTFileMutex);
  if (!sReadCounter_BSD)
  {
    sReadCounter_BSD = (uint64_t)this;
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    v5 = operator new(0x1800uLL);
    *v4 = v5;
    v4[1] = v5;
    v6 = (char *)(v5 + 768);
    v4[2] = v5 + 768;
    v7 = 128;
    do
    {
      *(_BYTE *)v5 = 0;
      v5[2] = 0;
      v5[5] = 0;
      v5 += 6;
      --v7;
    }
    while (v7);
    v4[1] = v6;
    TFileBSD::sRequestBlockList = (uint64_t)v4;
    v8 = operator new();
    *(_QWORD *)v8 = &off_1E5425418;
    *(_QWORD *)(v8 + 8) = 0;
    v9 = pthread_self();
    *(_DWORD *)(v8 + 16) = CADeprecated::CAPThread::getScheduledPriority(v9, 0);
    *(_QWORD *)(v8 + 24) = TFileBSD::AsyncFileIOHandler;
    *(_QWORD *)(v8 + 32) = 0;
    *(_QWORD *)(v8 + 104) = 31;
    *(_QWORD *)(v8 + 112) = 0;
    *(_DWORD *)(v8 + 120) = 1;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    *(_OWORD *)(v8 + 88) = 0u;
    TFileBSD::sAsyncCommandThread = v8;
    CADeprecated::CAPThread::SetPriority((CADeprecated::CAPThread *)v8, 63, 0);
    v10 = (CADeprecated::CAGuard *)operator new();
    CADeprecated::CAGuard::CAGuard(v10, "TFileBSD async guard");
    TFileBSD::sGuard = (uint64_t)v10;
    TFileBSD::sAsyncRequestReadIndex = 0;
    TFileBSD::sAsyncRequestWriteIndex = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sAsyncCommandThread + 16))(TFileBSD::sAsyncCommandThread);
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v11 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v13 = 136315650;
          v14 = "TFileBSD.cpp";
          v15 = 1024;
          v16 = 194;
          v17 = 2080;
          v18 = "InitializeAsync";
          _os_log_impl(&dword_1A836D000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", (uint8_t *)&v13, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock(&sTFileMutex);
}

void sub_1A839344C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A85D2980](v1, 0x10F1C4021999281);
  pthread_mutex_unlock(&sTFileMutex);
  _Unwind_Resume(a1);
}

uint64_t TFileBSD::AsyncFileIOHandler(TFileBSD *this, void *a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (uint64_t *)TFileBSD::sRequestBlockList;
  if (TFileBSD::sRequestBlockList)
  {
    if (!TFileBSD::sKillAsyncThread)
    {
      v3 = TFileBSD::sGuard;
      v4 = TFileBSD::sAsyncRequestReadIndex;
      do
      {
        v5 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)v3 + 16))(v3, a2);
        if (!(*(unsigned __int8 *)(*v2 + 48 * v4) | TFileBSD::sKillAsyncThread))
          (*(void (**)(uint64_t))(*(_QWORD *)v3 + 56))(v3);
        if (v5)
          (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
        v6 = v4;
        v7 = *v2;
        for (i = 48 * v4; *(_BYTE *)(v7 + i) && TFileBSD::sKillAsyncThread == 0; i = 48 * v4)
        {
          v10 = 3 * v6;
          v11 = v7 + 16 * v10;
          v12 = 16 * v10;
          fseek(*(FILE **)(*(_QWORD *)(v11 + 40) + 16), *(unsigned int *)(v11 + 24), 0);
          fread(*(void **)(v11 + 32), 1uLL, *(unsigned int *)(v11 + 28), *(FILE **)(*(_QWORD *)(v11 + 40) + 16));
          --*(_DWORD *)sReadCounter_BSD;
          v7 = *v2;
          *(_BYTE *)(*v2 + v12) = 0;
          if (v4 + 1 <= 0)
            v4 = -(-(v4 + 1) & 0x7F);
          else
            v4 = (v4 + 1) & 0x7F;
          v6 = v4;
        }
        TFileBSD::sAsyncRequestReadIndex = v4;
      }
      while (!TFileBSD::sKillAsyncThread);
    }
    TFileBSD::sKillAsyncThread = 0;
  }
  return 0;
}

void sub_1A8393640(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  int v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

uint64_t TFileBSD::ShutdownAsync(TFileBSD *this)
{
  NSObject *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (kTFileBSDSubsystem)
  {
    v1 = *(NSObject **)kTFileBSDSubsystem;
    if (!*(_QWORD *)kTFileBSDSubsystem)
      goto LABEL_7;
  }
  else
  {
    v1 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "TFileBSD.cpp";
    v10 = 1024;
    v11 = 203;
    v12 = 2080;
    v13 = "ShutdownAsync";
    _os_log_impl(&dword_1A836D000, v1, OS_LOG_TYPE_DEBUG, "%25s:%-5d ->%s", (uint8_t *)&v8, 0x1Cu);
  }
LABEL_7:
  pthread_mutex_lock(&sTFileMutex);
  if (sReadCounter_BSD)
  {
    v2 = TFileBSD::sGuard;
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)TFileBSD::sGuard + 16))(TFileBSD::sGuard);
    TFileBSD::sKillAsyncThread = 1;
    (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sGuard + 80))(TFileBSD::sGuard);
    if ((v3 & 1) != 0)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    while (TFileBSD::sKillAsyncThread)
      usleep(0x2710u);
    if (TFileBSD::sAsyncCommandThread)
      (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sAsyncCommandThread + 8))(TFileBSD::sAsyncCommandThread);
    if (TFileBSD::sGuard)
      (*(void (**)(uint64_t))(*(_QWORD *)TFileBSD::sGuard + 8))(TFileBSD::sGuard);
    v4 = TFileBSD::sRequestBlockList;
    if (TFileBSD::sRequestBlockList)
    {
      v5 = *(void **)TFileBSD::sRequestBlockList;
      if (*(_QWORD *)TFileBSD::sRequestBlockList)
      {
        *(_QWORD *)(TFileBSD::sRequestBlockList + 8) = v5;
        operator delete(v5);
      }
      MEMORY[0x1A85D2980](v4, 0x20C40960023A9);
    }
    TFileBSD::sRequestBlockList = 0;
    sReadCounter_BSD = 0;
  }
  if (kTFileBSDSubsystem)
  {
    if ((*(_BYTE *)(kTFileBSDSubsystem + 8) & 1) != 0)
    {
      v6 = *(NSObject **)kTFileBSDSubsystem;
      if (*(_QWORD *)kTFileBSDSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kTFileBSDSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v8 = 136315650;
          v9 = "TFileBSD.cpp";
          v10 = 1024;
          v11 = 227;
          v12 = 2080;
          v13 = "ShutdownAsync";
          _os_log_impl(&dword_1A836D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d <-%s", (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock(&sTFileMutex);
}

void sub_1A83938C4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t CAVectorUnit_Examine()
{
  uint64_t result;

  if (getenv("CA_NoVector"))
  {
    fwrite("CA_NoVector set; Vector unit optimized routines will be bypassed\n",
      0x41uLL,
      1uLL,
      (FILE *)*MEMORY[0x1E0C80C10]);
    return 0;
  }
  else
  {
    result = 200;
    gCAVectorUnitType = 200;
  }
  return result;
}

uint64_t CAVectorUnit_GetByteWidth(int a1)
{
  int v1;
  unsigned int v2;

  if (a1 == 112)
    v1 = 64;
  else
    v1 = 16;
  if (a1 == 111)
    v2 = 32;
  else
    v2 = v1;
  if (a1)
    return v2;
  else
    return 0;
}

void XPC_Connection::~XPC_Connection(XPC_Connection *this)
{
  XPC_Connection::~XPC_Connection(this);
  JUMPOUT(0x1A85D2980);
}

{
  const void *v2;
  const void *v3;

  *(_QWORD *)this = &off_1E54250C8;
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
  {
    _Block_release(v2);
    *((_QWORD *)this + 3) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
  {
    _Block_release(v3);
    *((_QWORD *)this + 5) = 0;
  }
  XPC_Object::~XPC_Object(this);
}

uint64_t XPC_Connection::Finalize(uint64_t this, XPC_Connection *a2)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t CALog::PrefValueToPriority(const __CFString *this, BOOL *a2, BOOL *a3)
{
  CFTypeID v5;
  int v6;
  int v7;
  int valuePtr;
  int v10;
  char buffer[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  valuePtr = -1;
  v5 = CFGetTypeID(this);
  if (v5 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
    v6 = valuePtr + 3;
  }
  else
  {
    if (v5 != CFStringGetTypeID())
      goto LABEL_22;
    if (CFEqual(this, CFSTR("error")))
    {
      v6 = 1;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("warning")))
    {
      v6 = 2;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("note")) || CFEqual(this, CFSTR("notice")))
    {
      v6 = 3;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("info")))
    {
      v6 = 4;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("details")))
    {
      v6 = 5;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("minutiae")))
    {
      v6 = 6;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("spew")))
    {
      v6 = 7;
      goto LABEL_23;
    }
    if (!CFStringGetCString(this, buffer, 64, 0x8000100u))
    {
LABEL_22:
      v6 = -1;
      goto LABEL_23;
    }
    v10 = 0;
    v7 = sscanf(buffer, "%d", &v10);
    v6 = v10 + 3;
    if (v7 != 1)
      v6 = -1;
  }
LABEL_23:
  *a2 = v6 > 0;
  return v6 & ~(v6 >> 31);
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_1E5425618;
  v2 = a1 + 2;
  v3 = (_QWORD *)a1[5];
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

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_1E5425618;
  v1 = a1 + 2;
  v2 = (_QWORD *)a1[5];
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
  JUMPOUT(0x1A85D2980);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *a2 = &off_1E5425618;
  a2[1] = v2;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 16);
  result = *(_QWORD **)(a1 + 40);
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

BOOL std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  char v7;
  int v8;

  v3 = *a2;
  v7 = 0;
  v4 = (*(uint64_t (**)(uint64_t, char *))(a1 + 8))(v3, &v7);
  if (!v7)
    return 0;
  v8 = v4;
  v5 = *(_QWORD *)(a1 + 40);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, &v8);
  return v7 != 0;
}

void std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::~__func()
{
  JUMPOUT(0x1A85D2980);
}

_QWORD *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E5425660;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::operator()(uint64_t result, int *a2)
{
  uint64_t v2;

  v2 = 3;
  if (*a2 <= 6)
    v2 = 1;
  *(_QWORD *)(*(_QWORD *)(result + 8) + 8) = v2;
  return result;
}

void XPC_Service::~XPC_Service(XPC_Service *this)
{
  JUMPOUT(0x1A85D2980);
}

uint64_t XPC_Service::ConnectionHandler(XPC_Service *this, _xpc_connection_s *a2)
{
  return (*(uint64_t (**)(XPC_Service *, _xpc_connection_s *))(*(_QWORD *)this + 16))(this, a2);
}

void sub_1A8393E3C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void CAVolumeCurve::CAVolumeCurve(CAVolumeCurve *this)
{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_BYTE *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((_QWORD *)this + 5) = 0x3F80000040000000;
}

{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = (char *)this + 16;
  *((_BYTE *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((_QWORD *)this + 5) = 0x3F80000040000000;
}

uint64_t CAVolumeCurve::GetMinimumRaw(CAVolumeCurve *this)
{
  if (*((_QWORD *)this + 3))
    return *(unsigned int *)(*((_QWORD *)this + 1) + 28);
  else
    return 0;
}

uint64_t CAVolumeCurve::GetMaximumRaw(CAVolumeCurve *this)
{
  uint64_t v1;
  _QWORD *v3;

  v1 = *((_QWORD *)this + 3);
  if (!v1)
    return 0;
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&v3, (int)v1 - 1);
  return *((unsigned int *)v3 + 8);
}

_QWORD **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(_QWORD **result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  _QWORD *v7;
  _QWORD *v8;

  if (a2 < 0)
  {
    v7 = *result;
    do
    {
      v8 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v4 = v8;
          v8 = (_QWORD *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v7[2];
          v5 = *v4 == (_QWORD)v7;
          v7 = v4;
        }
        while (v5);
      }
      v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2)
      return result;
    v2 = *result;
    do
    {
      v3 = (_QWORD *)v2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v2[2];
          v5 = *v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
    }
    while (a2-- > 1);
  }
  *result = v4;
  return result;
}

float CAVolumeCurve::GetMinimumDB(CAVolumeCurve *this)
{
  if (*((_QWORD *)this + 3))
    return *(float *)(*((_QWORD *)this + 1) + 36);
  else
    return 0.0;
}

float CAVolumeCurve::GetMaximumDB(CAVolumeCurve *this)
{
  uint64_t v1;
  float *v3;

  v1 = *((_QWORD *)this + 3);
  if (!v1)
    return 0.0;
  v3 = (float *)*((_QWORD *)this + 1);
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>((_QWORD **)&v3, (int)v1 - 1);
  return v3[10];
}

uint64_t CAVolumeCurve::SetTransferFunction(uint64_t this, unsigned int a2)
{
  char v2;
  float v3;
  float v4;

  *(_DWORD *)(this + 36) = a2;
  if (a2 > 0xF)
  {
    v4 = 1.0;
    v3 = 2.0;
    v2 = 1;
  }
  else
  {
    v2 = byte_1A839E580[a2];
    v3 = flt_1A839DEA0[a2];
    v4 = flt_1A839DEE0[a2];
  }
  *(_BYTE *)(this + 32) = v2;
  *(float *)(this + 40) = v3;
  *(float *)(this + 44) = v4;
  return this;
}

void CAVolumeCurve::AddRange(CAVolumeCurve *this, signed int a2, signed int a3, double a4, float a5)
{
  void **v6;
  void **v7;
  int v8;
  BOOL v9;
  char v10;
  void **v11;
  void **v12;
  BOOL v13;
  char v14;
  char *v15;
  char **v16;
  char **v17;
  int v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  double v34;
  unint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (void **)*((_QWORD *)this + 1);
  v7 = (void **)((char *)this + 16);
  if (v6 == (void **)((char *)this + 16))
    goto LABEL_25;
  do
  {
    v8 = *((_DWORD *)v6 + 7);
    v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    v10 = v9;
    if (v9 || v8 <= a2)
    {
      v12 = v6;
    }
    else
    {
      v11 = (void **)v6[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (void **)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (void **)v6[2];
          v13 = *v12 == v6;
          v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == v7)
      v14 = 1;
    else
      v14 = v10;
    if ((v14 & 1) != 0)
      break;
    v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    v15 = (char *)*v7;
    v16 = (char **)((char *)this + 16);
    v17 = (char **)((char *)this + 16);
    if (*v7)
    {
      while (1)
      {
        while (1)
        {
          v17 = (char **)v15;
          v18 = *((_DWORD *)v15 + 7);
          if (v18 <= a2)
            break;
          v15 = *v17;
          v16 = v17;
          if (!*v17)
            goto LABEL_32;
        }
        if (v18 >= a2)
          break;
        v15 = v17[1];
        if (!v15)
        {
          v16 = v17 + 1;
          goto LABEL_32;
        }
      }
    }
    else
    {
LABEL_32:
      *((float *)&a4 + 1) = a5;
      v34 = a4;
      v35 = __PAIR64__(a3, a2);
      v19 = (char *)operator new(0x30uLL);
      *(_QWORD *)(v19 + 28) = v35;
      *(double *)(v19 + 36) = v34;
      *(_QWORD *)v19 = 0;
      *((_QWORD *)v19 + 1) = 0;
      *((_QWORD *)v19 + 2) = v17;
      *v16 = v19;
      v20 = **((_QWORD **)this + 1);
      if (v20)
      {
        *((_QWORD *)this + 1) = v20;
        v19 = *v16;
      }
      v21 = *v7;
      v13 = v19 == *v7;
      v19[24] = v13;
      if (!v13)
      {
        do
        {
          v22 = *((_QWORD *)v19 + 2);
          if (*(_BYTE *)(v22 + 24))
            break;
          v23 = *(_BYTE **)(v22 + 16);
          v24 = *(_QWORD *)v23;
          if (*(_QWORD *)v23 == v22)
          {
            v27 = *((_QWORD *)v23 + 1);
            if (!v27 || (v28 = *(unsigned __int8 *)(v27 + 24), v25 = (_BYTE *)(v27 + 24), v28))
            {
              if (*(char **)v22 == v19)
              {
                v29 = (uint64_t *)*((_QWORD *)v19 + 2);
              }
              else
              {
                v29 = *(uint64_t **)(v22 + 8);
                v30 = *v29;
                *(_QWORD *)(v22 + 8) = *v29;
                if (v30)
                {
                  *(_QWORD *)(v30 + 16) = v22;
                  v23 = *(_BYTE **)(v22 + 16);
                }
                v29[2] = (uint64_t)v23;
                *(_QWORD *)(*(_QWORD *)(v22 + 16) + 8 * (**(_QWORD **)(v22 + 16) != v22)) = v29;
                *v29 = v22;
                *(_QWORD *)(v22 + 16) = v29;
                v23 = (_BYTE *)v29[2];
                v22 = *(_QWORD *)v23;
              }
              *((_BYTE *)v29 + 24) = 1;
              v23[24] = 0;
              v33 = *(_QWORD *)(v22 + 8);
              *(_QWORD *)v23 = v33;
              if (v33)
                *(_QWORD *)(v33 + 16) = v23;
              *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
              *(_QWORD *)(*((_QWORD *)v23 + 2) + 8 * (**((_QWORD **)v23 + 2) != (_QWORD)v23)) = v22;
              *(_QWORD *)(v22 + 8) = v23;
              goto LABEL_60;
            }
          }
          else if (!v24 || (v26 = *(unsigned __int8 *)(v24 + 24), v25 = (_BYTE *)(v24 + 24), v26))
          {
            if (*(char **)v22 == v19)
            {
              v31 = *((_QWORD *)v19 + 1);
              *(_QWORD *)v22 = v31;
              if (v31)
              {
                *(_QWORD *)(v31 + 16) = v22;
                v23 = *(_BYTE **)(v22 + 16);
              }
              *((_QWORD *)v19 + 2) = v23;
              *(_QWORD *)(*(_QWORD *)(v22 + 16) + 8 * (**(_QWORD **)(v22 + 16) != v22)) = v19;
              *((_QWORD *)v19 + 1) = v22;
              *(_QWORD *)(v22 + 16) = v19;
              v23 = (_BYTE *)*((_QWORD *)v19 + 2);
            }
            else
            {
              v19 = (char *)*((_QWORD *)v19 + 2);
            }
            v19[24] = 1;
            v23[24] = 0;
            v22 = *((_QWORD *)v23 + 1);
            v32 = *(char **)v22;
            *((_QWORD *)v23 + 1) = *(_QWORD *)v22;
            if (v32)
              *((_QWORD *)v32 + 2) = v23;
            *(_QWORD *)(v22 + 16) = *((_QWORD *)v23 + 2);
            *(_QWORD *)(*((_QWORD *)v23 + 2) + 8 * (**((_QWORD **)v23 + 2) != (_QWORD)v23)) = v22;
            *(_QWORD *)v22 = v23;
LABEL_60:
            *((_QWORD *)v23 + 2) = v22;
            break;
          }
          *(_BYTE *)(v22 + 24) = 1;
          v19 = v23;
          v23[24] = v23 == v21;
          *v25 = 1;
        }
        while (v23 != v21);
      }
      ++*((_QWORD *)this + 3);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "CAVolumeCurve.cpp";
    v38 = 1024;
    v39 = 214;
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CAVolumeCurve::AddRange: new point overlaps", buf, 0x12u);
  }
}

void CAVolumeCurve::ResetRange(CAVolumeCurve *this)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)this + 16);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(*((_QWORD **)this + 2));
  *(v1 - 1) = v1;
  *v1 = 0;
  v1[1] = 0;
}

void std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(*a1);
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

BOOL CAVolumeCurve::CheckForContinuity(CAVolumeCurve *this)
{
  char *v1;
  char *v2;
  int v3;
  float v4;
  char *v5;
  char *v6;
  char *v7;
  int v8;
  float v9;
  BOOL v10;
  _BOOL8 result;

  v1 = (char *)*((_QWORD *)this + 1);
  v2 = (char *)this + 16;
  if (v1 == (char *)this + 16)
    return 1;
  v3 = *((_DWORD *)v1 + 7);
  v4 = *((float *)v1 + 9);
  do
  {
    v5 = (char *)*((_QWORD *)v1 + 1);
    v6 = v1;
    if (v5)
    {
      do
      {
        v7 = v5;
        v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v7 = (char *)*((_QWORD *)v6 + 2);
        v10 = *(_QWORD *)v7 == (_QWORD)v6;
        v6 = v7;
      }
      while (!v10);
    }
    v8 = *((_DWORD *)v1 + 7);
    v9 = *((float *)v1 + 9);
    v10 = v4 == v9 && v3 == v8;
    result = v10;
    if (v7 == v2)
      break;
    v3 = v3 - v8 + *((_DWORD *)v1 + 8);
    v4 = v4 + (float)(*((float *)v1 + 10) - v9);
    v1 = v7;
  }
  while (result);
  return result;
}

uint64_t CAVolumeCurve::ConvertDBToRaw(CAVolumeCurve *this, float a2)
{
  float v4;
  float MaximumDB;
  float v6;
  _QWORD *v7;
  uint64_t result;
  int v9;
  float v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;

  if (*((_QWORD *)this + 3))
    v4 = *(float *)(*((_QWORD *)this + 1) + 36);
  else
    v4 = 0.0;
  MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 <= MaximumDB)
    MaximumDB = v6;
  v7 = (_QWORD *)*((_QWORD *)this + 1);
  result = *((unsigned int *)v7 + 7);
  if (v7 != (_QWORD *)((char *)this + 16))
  {
    do
    {
      v9 = *((_DWORD *)v7 + 8) - *((_DWORD *)v7 + 7);
      v10 = *((float *)v7 + 10);
      if (MaximumDB > v10)
      {
        result = (v9 + result);
      }
      else
      {
        v11 = llroundf((float)(MaximumDB - *((float *)v7 + 9)) / (float)((float)(v10 - *((float *)v7 + 9)) / (float)v9));
        v12 = __OFADD__((_DWORD)result, v11);
        v13 = result + v11;
        v14 = ((int)(result | v11) >> 31) ^ 0x7FFFFFFF;
        if (v12)
          result = v14;
        else
          result = v13;
      }
      v15 = (_QWORD *)v7[1];
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
          v16 = (_QWORD *)v7[2];
          v17 = *v16 == (_QWORD)v7;
          v7 = v16;
        }
        while (!v17);
      }
      v17 = MaximumDB <= v10 || v16 == (_QWORD *)((char *)this + 16);
      v7 = v16;
    }
    while (!v17);
  }
  return result;
}

uint64_t CAVolumeCurve::ConvertRawToDB(CAVolumeCurve *this, int a2)
{
  int v4;
  uint64_t result;
  int v6;
  int v7;
  float *v8;
  float v9;
  float *v10;
  BOOL v11;
  int v12;
  int v13;
  float *v14;
  float *v15;
  float *v16;

  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  result = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= (int)result)
    v6 = result;
  v7 = v6 - v4;
  v8 = (float *)*((_QWORD *)this + 1);
  v9 = v8[9];
  v10 = (float *)((char *)this + 16);
  v11 = v7 < 1 || v8 == v10;
  if (!v11)
  {
    do
    {
      v12 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      if (v7 >= v12)
        v13 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      else
        v13 = v7;
      v14 = (float *)*((_QWORD *)v8 + 1);
      v15 = v8;
      if (v14)
      {
        do
        {
          v16 = v14;
          v14 = *(float **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v16 = (float *)*((_QWORD *)v15 + 2);
          v11 = *(_QWORD *)v16 == (_QWORD)v15;
          v15 = v16;
        }
        while (!v11);
      }
      v9 = v9 + (float)((float)v13 * (float)((float)(v8[10] - v8[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1)
        break;
      v8 = v16;
    }
    while (v16 != v10);
  }
  return result;
}

float CAVolumeCurve::ConvertRawToScalar(CAVolumeCurve *this, int a2)
{
  int v4;
  int MaximumRaw;
  int v6;
  float v7;

  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2)
    v6 = a2;
  else
    v6 = v4;
  if (v6 >= MaximumRaw)
    v6 = MaximumRaw;
  v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this))
    return powf(v7, *((float *)this + 10) / *((float *)this + 11));
  else
    return v7;
}

BOOL CAVolumeCurve::GetIsApplyingTransferFunction(CAVolumeCurve *this)
{
  float v2;

  if (*((_QWORD *)this + 3))
    v2 = *(float *)(*((_QWORD *)this + 1) + 36);
  else
    v2 = 0.0;
  return (float)(CAVolumeCurve::GetMaximumDB(this) - v2) > 30.0 && *((_BYTE *)this + 32) != 0;
}

float CAVolumeCurve::ConvertDBToScalar(CAVolumeCurve *this, float a2)
{
  int v3;

  v3 = CAVolumeCurve::ConvertDBToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t CAVolumeCurve::ConvertScalarToRaw(CAVolumeCurve *this, float a2)
{
  float v3;
  int v4;
  float v5;
  int MaximumRaw;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;

  v3 = fmaxf(a2, 0.0);
  if (*((_QWORD *)this + 3))
    v4 = *(_DWORD *)(*((_QWORD *)this + 1) + 28);
  else
    v4 = 0;
  v5 = fminf(v3, 1.0);
  MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this))
    v5 = powf(v5, *((float *)this + 11) / *((float *)this + 10));
  v7 = llroundf(v5 * (float)(MaximumRaw - v4));
  v8 = __OFADD__(v4, v7);
  v9 = v4 + v7;
  v10 = ((int)(v4 | v7) >> 31) ^ 0x7FFFFFFF;
  if (v8)
    return v10;
  else
    return v9;
}

uint64_t CAVolumeCurve::ConvertScalarToDB(CAVolumeCurve *this, float a2)
{
  int v3;

  v3 = CAVolumeCurve::ConvertScalarToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToDB(this, v3);
}

void ResamplerInitLocker::ResamplerInitLocker(ResamplerInitLocker *this)
{
  pthread_mutex_lock(&sInitLocker);
}

{
  pthread_mutex_lock(&sInitLocker);
}

void ResamplerInitLocker::~ResamplerInitLocker(ResamplerInitLocker *this)
{
  pthread_mutex_unlock(&sInitLocker);
}

{
  pthread_mutex_unlock(&sInitLocker);
}

void CADeserializer::CADeserializer(CADeserializer *this, CFTypeRef cf)
{
  const UInt8 *BytePtr;

  *((_BYTE *)this + 32) = 0;
  *(_QWORD *)this = cf;
  CFRetain(cf);
  BytePtr = CFDataGetBytePtr((CFDataRef)cf);
  *((_QWORD *)this + 1) = BytePtr;
  *((_QWORD *)this + 2) = BytePtr;
  *((_QWORD *)this + 3) = &BytePtr[CFDataGetLength((CFDataRef)cf)];
}

void CASerializer::WriteData(__CFData **this, CFDataRef theData)
{
  __CFData *v3;
  const UInt8 *BytePtr;
  CFIndex Length;

  v3 = *this;
  if (*this)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(theData);
    CFDataAppendBytes(v3, BytePtr, Length);
  }
  else
  {
    *this = CFDataCreateMutableCopy(0, 0, theData);
  }
}

CFMutableDataRef *operator<<(CFMutableDataRef *a1, CFURLRef *a2)
{
  const __CFURL *v3;
  CFStringRef v5;

  v3 = CFURLCopyAbsoluteURL(*a2);
  v5 = CFURLGetString(v3);
  operator<<(a1, &v5);
  CFRelease(v3);
  return a1;
}

uint64_t operator>>(uint64_t a1, CFURLRef *a2)
{
  CFStringRef v4;
  CFStringRef URLString;

  URLString = 0;
  operator>>(a1, &URLString);
  v4 = URLString;
  if (URLString)
  {
    *a2 = CFURLCreateWithString(0, URLString, 0);
    CFRelease(v4);
  }
  else
  {
    *a2 = 0;
  }
  return a1;
}

CADeserializer *operator>>(CADeserializer *a1, uint64_t a2)
{
  uint64_t *Ptr;
  uint64_t v5;
  int *v6;
  int v7;
  int *v8;
  int v9;
  int *v10;
  int v11;
  int *v12;
  int v13;
  int *v14;
  int v15;
  int *v16;
  int v17;
  int *v18;
  int v19;
  int *v20;
  int v21;

  Ptr = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (Ptr)
    v5 = *Ptr;
  else
    v5 = 0;
  *(_QWORD *)a2 = v5;
  v6 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v6)
    v7 = *v6;
  else
    v7 = 0;
  *(_DWORD *)(a2 + 8) = v7;
  v8 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v8)
    v9 = *v8;
  else
    v9 = 0;
  *(_DWORD *)(a2 + 12) = v9;
  v10 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v10)
    v11 = *v10;
  else
    v11 = 0;
  *(_DWORD *)(a2 + 16) = v11;
  v12 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v12)
    v13 = *v12;
  else
    v13 = 0;
  *(_DWORD *)(a2 + 20) = v13;
  v14 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v14)
    v15 = *v14;
  else
    v15 = 0;
  *(_DWORD *)(a2 + 24) = v15;
  v16 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v16)
    v17 = *v16;
  else
    v17 = 0;
  *(_DWORD *)(a2 + 28) = v17;
  v18 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v18)
    v19 = *v18;
  else
    v19 = 0;
  *(_DWORD *)(a2 + 32) = v19;
  v20 = (int *)CADeserializer::GetAndAdvanceReadPtr(a1, 4u, 4);
  if (v20)
    v21 = *v20;
  else
    v21 = 0;
  *(_DWORD *)(a2 + 36) = v21;
  return a1;
}

CADeserializer *operator>>(CADeserializer *a1, _QWORD *a2)
{
  uint64_t *Ptr;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  Ptr = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (Ptr)
    v5 = *Ptr;
  else
    v5 = 0;
  *a2 = v5;
  v6 = (uint64_t *)CADeserializer::GetAndAdvanceReadPtr(a1, 8u, 8);
  if (v6)
    v7 = *v6;
  else
    v7 = 0;
  a2[1] = v7;
  return a1;
}

BOOL CADeprecated::CAMutex::IsFree(CADeprecated::CAMutex *this)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)this + 2);
  return v1 == 0;
}

CADeprecated::CAMutex::Unlocker *CADeprecated::CAMutex::Unlocker::Unlocker(CADeprecated::CAMutex::Unlocker *this, CADeprecated::CAMutex *a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = a2;
  *((_BYTE *)this + 8) = 0;
  if (((*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)a2 + 48))(a2) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "CAMutex.cpp";
      v6 = 1024;
      v7 = 304;
      _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  Major problem: Unlocker attempted to unlock a mutex not owned by the current thread!", (uint8_t *)&v4, 0x12u);
    }
    __break(1u);
  }
  (*(void (**)(_QWORD))(**(_QWORD **)this + 24))(*(_QWORD *)this);
  *((_BYTE *)this + 8) = 1;
  return this;
}

void CADeprecated::CAMutex::Unlocker::~Unlocker(CADeprecated::CAMutex::Unlocker *this)
{
  if (*((_BYTE *)this + 8))
    (*(void (**)(void))(**(_QWORD **)this + 16))();
}

{
  if (*((_BYTE *)this + 8))
    (*(void (**)(void))(**(_QWORD **)this + 16))();
}

uint64_t PowerMeter::ClearClipping(uint64_t this)
{
  *(_WORD *)(this + 56) = 0;
  *(_DWORD *)(this + 52) = 0;
  return this;
}

double PowerMeter::ProcessSilence(PowerMeter *this)
{
  double result;

  *((_QWORD *)this + 8) = 0;
  result = 0.0;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  return result;
}

long double PowerMeter::LinearToDB(PowerMeter *this, long double a2)
{
  if (a2 <= 0.000001)
    return -120.0;
  if (a2 < 2.22507386e-308)
    a2 = 2.22507386e-308;
  return log10(a2) * 20.0;
}

unsigned __int8 *PowerMeter::SavePeaks(unsigned __int8 *this, int a2, int a3, int a4)
{
  float v4;
  int v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = (double)a4 * 0.0000305175781;
  *((_DWORD *)this + 24) = a3;
  v5 = *this;
  if (*this)
  {
    v6 = v4;
  }
  else
  {
    v7 = *((double *)this + 13);
    v6 = v4;
    if (v7 > v6)
      v6 = v7 + (v6 - v7) * *((double *)this + 5);
  }
  *((double *)this + 13) = v6;
  v8 = *((_DWORD *)this + 25) + a2;
  *((_DWORD *)this + 25) = v8;
  v9 = *((double *)this + 15);
  if (v8 >= (int)(*((double *)this + 1) * 0.907029478))
  {
    v9 = v9 - v9 * *((double *)this + 3);
    *((double *)this + 15) = v9;
  }
  v10 = sqrt((double)a3 * 9.31322575e-10);
  if (v9 < v6)
  {
    *((double *)this + 15) = v6;
    *((_DWORD *)this + 25) = 0;
    v9 = v6;
  }
  v11 = v10 * 1.41421356;
  if (!v5)
  {
    v12 = *((double *)this + 14);
    if (v12 > v11)
      v11 = v12 + (v11 - v12) * *((double *)this + 5);
  }
  *((double *)this + 14) = v11;
  if (v11 > v9)
    *((double *)this + 14) = v9;
  return this;
}

unsigned __int8 *PowerMeter::Process_Int16(PowerMeter *this, const __int16 *a2, int a3, int a4)
{
  int v8;
  int v9;
  unsigned int v10;
  int v11;

  PowerMeter::ScaleDecayConstants(this, a4);
  v8 = *((_DWORD *)this + 24);
  if (a4 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = a4 + 1;
    do
    {
      v11 = *a2;
      if (v11 < 0)
        v11 = -v11;
      if (v9 <= v11)
        v9 = v11;
      v8 += (v11 * v11 - v8) >> 5;
      --v10;
      a2 += a3;
    }
    while (v10 > 1);
  }
  return PowerMeter::SavePeaks((unsigned __int8 *)this, a4, v8, v9);
}

unsigned __int8 *PowerMeter::Process_Int32(PowerMeter *this, const int *a2, int a3, int a4)
{
  int v8;
  int v9;
  unsigned int v10;
  int v11;

  PowerMeter::ScaleDecayConstants(this, a4);
  v8 = *((_DWORD *)this + 24);
  if (a4 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = a4 + 1;
    do
    {
      if (*a2 >= 0)
        v11 = *a2 >> 9;
      else
        v11 = -(*a2 >> 9);
      if (v11 > v9)
        v9 = v11;
      v8 += (v11 * v11 - v8) >> 5;
      --v10;
      a2 += a3;
    }
    while (v10 > 1);
  }
  return PowerMeter::SavePeaks((unsigned __int8 *)this, a4, v8, v9);
}

uint64_t TStream::ReadByte(TStream *this)
{
  unsigned __int8 v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned __int8 *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 1);
  return v2;
}

uint64_t TStream::ReadBig16(TStream *this)
{
  unsigned __int16 v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned __int16 *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 2);
  return bswap32(v2) >> 16;
}

uint64_t TStream::ReadBig32(TStream *this)
{
  unsigned int v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 4);
  return bswap32(v2);
}

float TStream::ReadBigFloat32(TStream *this)
{
  unsigned int v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 4);
  return COERCE_FLOAT(bswap32(v2));
}

double TStream::ReadBigFloat64(TStream *this)
{
  unint64_t v2;

  v2 = 0;
  (*(void (**)(TStream *, unint64_t *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 8);
  return COERCE_DOUBLE(bswap64(v2));
}

uint64_t TStream::ReadLittle16(TStream *this)
{
  unsigned __int16 v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned __int16 *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 2);
  return v2;
}

uint64_t TStream::ReadLittle32(TStream *this)
{
  unsigned int v2;

  v2 = 0;
  (*(void (**)(TStream *, unsigned int *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 4);
  return v2;
}

float TStream::ReadLittleFloat32(TStream *this)
{
  float v2;

  v2 = 0.0;
  (*(void (**)(TStream *, float *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 4);
  return v2;
}

double TStream::ReadLittleFloat64(TStream *this)
{
  double v2;

  v2 = 0.0;
  (*(void (**)(TStream *, double *, uint64_t))(*(_QWORD *)this + 16))(this, &v2, 8);
  return v2;
}

uint64_t TStream::WriteByte(TStream *this, char a2)
{
  char v3;

  v3 = a2;
  return (*(uint64_t (**)(TStream *, char *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 1);
}

uint64_t TStream::WriteBig16(TStream *this, unsigned int a2)
{
  __int16 v3;

  v3 = __rev16(a2);
  return (*(uint64_t (**)(TStream *, __int16 *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 2);
}

uint64_t TStream::WriteBig32(TStream *this, unsigned int a2)
{
  unsigned int v3;

  v3 = bswap32(a2);
  return (*(uint64_t (**)(TStream *, unsigned int *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteBigFloat32(TStream *this, float a2)
{
  unsigned int v3;

  v3 = bswap32(LODWORD(a2));
  return (*(uint64_t (**)(TStream *, unsigned int *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteBigFloat64(TStream *this, double a2)
{
  unint64_t v3;

  v3 = bswap64(*(unint64_t *)&a2);
  return (*(uint64_t (**)(TStream *, unint64_t *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 8);
}

uint64_t TStream::WriteLittle16(TStream *this, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  return (*(uint64_t (**)(TStream *, __int16 *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 2);
}

uint64_t TStream::WriteLittle32(TStream *this, int a2)
{
  int v3;

  v3 = a2;
  return (*(uint64_t (**)(TStream *, int *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteLittleFloat32(TStream *this, float a2)
{
  float v3;

  v3 = a2;
  return (*(uint64_t (**)(TStream *, float *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 4);
}

uint64_t TStream::WriteLittleFloat64(TStream *this, double a2)
{
  double v3;

  v3 = a2;
  return (*(uint64_t (**)(TStream *, double *, uint64_t))(*(_QWORD *)this + 24))(this, &v3, 8);
}

uint64_t CADeprecated::CABufferList::AllocateBuffers(uint64_t this, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  size_t v5;
  char *v6;
  int v7;
  const void **v8;
  char *v9;
  size_t v10;

  if (*(_DWORD *)(this + 36) < a2)
  {
    v2 = this;
    v3 = *(_DWORD *)(this + 24);
    if (v3 <= 1)
      v4 = a2;
    else
      v4 = (a2 + 15) & 0xFFFFFFE0 | 0x10;
    v5 = v4 * v3;
    v6 = (char *)operator new[]();
    bzero(v6, v5);
    v7 = *(_DWORD *)(v2 + 24);
    if (v7)
    {
      v8 = (const void **)(v2 + 40);
      v9 = v6;
      do
      {
        if (*v8)
        {
          v10 = *((unsigned int *)v8 - 1);
          if ((_DWORD)v10)
            memcpy(v9, *v8, v10);
        }
        *((_DWORD *)v8 - 1) = v4;
        *v8 = v9;
        v8 += 2;
        v9 += v4;
        --v7;
      }
      while (v7);
    }
    this = *(_QWORD *)(v2 + 8);
    *(_QWORD *)(v2 + 8) = v6;
    *(_DWORD *)(v2 + 16) = v4;
    if (this)
      JUMPOUT(0x1A85D2968);
  }
  return this;
}

void CADeprecated::CABufferList::AllocateBuffersAndCopyFrom(CADeprecated::CABufferList *this, unsigned int a2, CADeprecated::CABufferList *a3, CADeprecated::CABufferList *a4)
{
  int v4;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  int v14;
  unsigned int *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  const void *v19;
  size_t v20;
  int v21;
  uint64_t v22;
  _QWORD *v23;
  unsigned int *v24;
  void **v25;
  void *v26;
  unsigned int v27;

  v4 = *((_DWORD *)this + 6);
  if (v4 == *((_DWORD *)a3 + 6) && v4 == *((_DWORD *)a4 + 6))
  {
    v9 = *((_DWORD *)this + 9);
    CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(*((_QWORD *)a4 + 1));
    v10 = *((_DWORD *)a3 + 9);
    v11 = *((_DWORD *)this + 6);
    if (v9 >= a2)
    {
      if (v11)
      {
        v23 = (_QWORD *)((char *)a4 + 40);
        v24 = (unsigned int *)((char *)a3 + 36);
        v25 = (void **)((char *)this + 40);
        do
        {
          --v11;
          memmove(*v25, *(const void **)(v24 + 1), *v24);
          v26 = *v25;
          v25 += 2;
          *v23 = v26;
          LODWORD(v26) = *v24;
          v24 += 4;
          *((_DWORD *)v23 - 1) = (_DWORD)v26;
          v23 += 2;
        }
        while (v11);
      }
      if (a3 != a4)
        CADeprecated::CABufferList::BytesConsumed(a3, v10);
    }
    else
    {
      v27 = *((_DWORD *)a3 + 9);
      if (v11 <= 1)
        v12 = a2;
      else
        v12 = (a2 + 15) & 0xFFFFFFE0 | 0x10;
      v13 = (char *)operator new[]();
      bzero(v13, v12 * v11);
      v14 = *((_DWORD *)this + 6);
      if (v14)
      {
        v15 = (unsigned int *)((char *)a3 + 36);
        v16 = (_QWORD *)((char *)a4 + 40);
        v17 = (_QWORD *)((char *)this + 40);
        v18 = v13;
        do
        {
          v19 = *(const void **)(v15 + 1);
          if (v19)
          {
            v20 = *v15;
            if ((_DWORD)v20)
              memmove(v18, v19, v20);
          }
          *((_DWORD *)v17 - 1) = v12;
          *v17 = v18;
          v17 += 2;
          v21 = *v15;
          v15 += 4;
          *((_DWORD *)v16 - 1) = v21;
          *v16 = v18;
          v16 += 2;
          v18 += v12;
          --v14;
        }
        while (v14);
      }
      v22 = *((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v13;
      *((_DWORD *)this + 4) = v12;
      if (a3 != a4)
        CADeprecated::CABufferList::BytesConsumed(a3, v27);
      if (v22)
        JUMPOUT(0x1A85D2968);
    }
  }
}

uint64_t CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(uint64_t this)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (this)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      v1 = 136315394;
      v2 = "CABufferList.h";
      v3 = 1024;
      v4 = 276;
      _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(mBufferMemory == __null) != 0 is false]: ", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return this;
}

uint64_t CADeprecated::CABufferList::BytesConsumed(CADeprecated::CABufferList *this, unsigned int a2)
{
  uint64_t result;
  int v5;
  _QWORD *v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = CADeprecated::CABufferList::VerifyNotTrashingOwnedBuffer(*((_QWORD *)this + 1));
  v5 = *((_DWORD *)this + 6);
  if (v5)
  {
    v6 = (_QWORD *)((char *)this + 40);
    do
    {
      v7 = *((_DWORD *)v6 - 1);
      v8 = v7 >= a2;
      v9 = v7 - a2;
      if (!v8)
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          v11 = 136315394;
          v12 = "CABufferList.h";
          v13 = 1024;
          v14 = 184;
          _os_log_impl(&dword_1A836D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(nBytes <= buf->mDataByteSize) != 0 is false]: ", (uint8_t *)&v11, 0x12u);
        }
        __break(1u);
      }
      *v6 += a2;
      *((_DWORD *)v6 - 1) = v9;
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t CADeprecated::CABufferList::DeallocateBuffers(CADeprecated::CABufferList *this)
{
  int v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    v3 = (_QWORD *)((char *)this + 40);
    do
    {
      *v3 = 0;
      *((_DWORD *)v3 - 1) = 0;
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  result = *((_QWORD *)this + 1);
  if (result)
  {
    result = MEMORY[0x1A85D2968](result, 0x1000C8077774924);
    *((_QWORD *)this + 1) = 0;
    *((_DWORD *)this + 4) = 0;
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, const AudioStreamBasicDescription *a3, const char *a4)
{
  AudioFormatID mFormatID;
  AudioFormatFlags mFormatFlags;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  UInt32 mBitsPerChannel;
  int v12;
  const char *v14;
  char __str[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  mFormatID = a3->mFormatID;
  mFormatFlags = a3->mFormatFlags;
  mBytesPerFrame = a3->mBytesPerFrame;
  mChannelsPerFrame = a3->mChannelsPerFrame;
  mBitsPerChannel = a3->mBitsPerChannel;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)__str = 0u;
  if (mFormatID != 1819304813)
    goto LABEL_10;
  if ((mFormatFlags & 1) != 0)
  {
    if (mBitsPerChannel == 32)
    {
      if ((mFormatFlags & 2) != 0)
      {
        strcpy(__str, ", BEF");
        v12 = 10;
      }
      else
      {
        strcpy(__str, ", LEF");
        v12 = -10;
      }
      return show(a1, a2, v12, a4, __str);
    }
LABEL_10:
    v12 = 1;
    return show(a1, a2, v12, a4, __str);
  }
  if (!mBytesPerFrame)
  {
LABEL_6:
    v12 = 0;
    return show(a1, a2, v12, a4, __str);
  }
  if ((mFormatFlags & 0x20) != 0)
  {
    mChannelsPerFrame = 1;
  }
  else if (!mChannelsPerFrame)
  {
    goto LABEL_6;
  }
  v12 = mBytesPerFrame / mChannelsPerFrame;
  if ((int)(mBytesPerFrame / mChannelsPerFrame) >= 1)
  {
    if (((mFormatFlags >> 7) & 0x3F) != 0)
      snprintf(__str, 0x50uLL, ", %d.%d-bit");
    else
      snprintf(__str, 0x50uLL, ", %d-bit");
    if ((mFormatFlags & 2) != 0)
    {
      v14 = " BEI";
    }
    else
    {
      v12 = -v12;
      v14 = " LEI";
    }
    strlcat(__str, v14, 0x50uLL);
  }
  return show(a1, a2, v12, a4, __str);
}

uint64_t show(const AudioBufferList *a1, int a2, int a3, const char *a4, const char *a5)
{
  const char *v8;
  const char *v9;
  uint64_t result;
  UInt32 v11;
  AudioBuffer *mBuffers;
  int v13;
  unsigned __int8 *mData;
  unsigned int v15;
  int v16;
  int v17;

  v8 = "AudioBufferList";
  if (a4)
    v8 = a4;
  v9 = "";
  if (a5)
    v9 = a5;
  result = printf("%s %p (%d fr%s):\n", v8, a1, a2, v9);
  if (a1->mNumberBuffers)
  {
    v11 = 0;
    mBuffers = a1->mBuffers;
    do
    {
      printf("    [%2d] %5dbytes %dch @ %p", v11, mBuffers->mDataByteSize, mBuffers->mNumberChannels, mBuffers->mData);
      if (a2)
      {
        if (mBuffers->mData)
        {
          putchar(58);
          v13 = mBuffers->mNumberChannels * a2;
          if (v13 >= 1)
          {
            mData = (unsigned __int8 *)mBuffers->mData;
            v15 = v13 + 1;
            do
            {
              switch(a3)
              {
                case -10:
                case 0:
                  mData += 4;
                  goto LABEL_24;
                case -4:
                  mData += 4;
                  goto LABEL_22;
                case -3:
                  v16 = (mData[2] << 16) | (mData[1] << 8);
                  v17 = *mData;
                  goto LABEL_20;
                case -2:
                  mData += 2;
                  goto LABEL_18;
                case -1:
                case 1:
                  ++mData;
                  printf(" %02X");
                  break;
                case 2:
                  mData += 2;
LABEL_18:
                  printf(" %04X");
                  break;
                case 3:
                  v16 = (*mData << 16) | (mData[1] << 8);
                  v17 = mData[2];
LABEL_20:
                  printf(" %06X", v16 | v17);
                  mData += 3;
                  break;
                case 4:
                  mData += 4;
LABEL_22:
                  printf(" %08X");
                  break;
                case 10:
                  mData += 4;
LABEL_24:
                  printf(" %6.3f");
                  break;
                default:
                  break;
              }
              --v15;
            }
            while (v15 > 1);
          }
        }
      }
      result = putchar(10);
      ++v11;
      ++mBuffers;
    }
    while (v11 < a1->mNumberBuffers);
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3, const char *a4)
{
  return show(a1, a2, a3, a4, 0);
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3)
{
  return show(a1, a2, a3, 0, 0);
}

const __CFArray *CACFArray::HasItem(CFArrayRef *this, const void *a2)
{
  const __CFArray *result;
  CFRange v5;

  result = *this;
  if (result)
  {
    v5.length = CFArrayGetCount(result);
    v5.location = 0;
    return (const __CFArray *)(CFArrayContainsValue(*this, v5, a2) != 0);
  }
  return result;
}

const __CFArray *CACFArray::GetIndexOfItem(CFArrayRef *this, const void *a2, unsigned int *a3)
{
  const __CFArray *result;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  *a3 = 0;
  result = *this;
  if (result)
  {
    v8.length = CFArrayGetCount(result);
    v8.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*this, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      *a3 = FirstIndexOfValue;
      return (const __CFArray *)1;
    }
  }
  return result;
}

uint64_t CACFArray::GetBool(CFArrayRef *this, unsigned int a2, BOOL *a3)
{
  uint64_t result;
  CFTypeRef v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeID v8;
  BOOL v9;
  int valuePtr;
  CFTypeRef cf;

  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (!(_DWORD)result)
    return result;
  v5 = cf;
  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  if (v6 != CFBooleanGetTypeID())
  {
    v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
      v7 = valuePtr == 0;
      goto LABEL_7;
    }
    return 0;
  }
  v7 = CFBooleanGetValue((CFBooleanRef)v5) == 0;
LABEL_7:
  v9 = !v7;
  *a3 = v9;
  return 1;
}

uint64_t CACFArray::GetSInt32(CFArrayRef *this, unsigned int a2, int *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt64(CFArrayRef *this, unsigned int a2, uint64_t *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt64(CFArrayRef *this, unsigned int a2, unint64_t *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat32(CFArrayRef *this, unsigned int a2, float *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat64(CFArrayRef *this, unsigned int a2, double *a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFNumber *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::Get4CC(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  CFTypeID v7;
  unsigned int v8;
  CFTypeRef cf;

  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v5 = (const __CFNumber *)cf;
    if (cf)
    {
      v6 = CFGetTypeID(cf);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return 1;
      }
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, (char *)&v8, 5, 0x600u);
        *a3 = bswap32(v8);
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t CACFArray::GetString(CFArrayRef *this, unsigned int a2, const __CFString **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFString *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFString *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFStringGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetArray(CFArrayRef *this, unsigned int a2, const __CFArray **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFArray *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFArray *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFArrayGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetData(CFArrayRef *this, unsigned int a2, const __CFData **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFData *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFData *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFDataGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUUID(CFArrayRef *this, unsigned int a2, const __CFUUID **a3)
{
  unsigned int CFType;
  uint64_t result;
  const __CFUUID *v6;
  CFTypeID v7;
  CFTypeRef cf;

  cf = 0;
  CFType = CACFArray::GetCFType(this, a2, &cf);
  result = 0;
  if (CFType)
  {
    v6 = (const __CFUUID *)cf;
    if (cf)
    {
      v7 = CFGetTypeID(cf);
      if (v7 == CFUUIDGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFString(CFArrayRef *this, unsigned int a2, CFTypeRef *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  if (*a3)
  {
    if (*((_BYTE *)a3 + 8))
      CFRelease(*a3);
    *a3 = 0;
  }
  *((_BYTE *)a3 + 8) = 1;
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFStringGetTypeID();
      if (v8 == result)
        return CACFString::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFArray(CFArrayRef *this, unsigned int a2, CACFArray *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  CACFArray::operator=((uint64_t)a3, 0);
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFArrayGetTypeID();
      if (v8 == result)
        return CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFDictionary(CFArrayRef *this, unsigned int a2, CACFDictionary *a3)
{
  uint64_t result;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeRef cf;

  CACFArray::operator=((uint64_t)a3, 0);
  cf = 0;
  result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if ((_DWORD)result)
  {
    v7 = cf;
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      result = CFDictionaryGetTypeID();
      if (v8 == result)
        return CACFArray::operator=((uint64_t)a3, v7);
    }
  }
  return result;
}

uint64_t CACFArray::AppendBool(CACFArray *this, int a2)
{
  const void **v3;
  const void *v4;
  uint64_t v5;
  const void *v7;
  char v8;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  v3 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v3 = (const void **)MEMORY[0x1E0C9AE40];
  v4 = *v3;
  v7 = v4;
  v8 = 1;
  if (v4 && (CFRetain(v4), *(_QWORD *)this) && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  return v5;
}

void sub_1A83967D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendCFType(CACFArray *this, const void *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendSInt32(CACFArray *this, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A83968A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A839694C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendSInt64(CACFArray *this, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A83969F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt64(CACFArray *this, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A8396A94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat32(CACFArray *this, float a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  float valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A8396B38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat64(CACFArray *this, double a2)
{
  CFNumberRef v3;
  uint64_t v4;
  CFNumberRef v6;
  char v7;
  double valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v6 = v3;
  v7 = 1;
  if (v3 && *(_QWORD *)this && *((_BYTE *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
  return v4;
}

void sub_1A8396BDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendArray(CACFArray *this, const __CFArray *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendData(CACFArray *this, const __CFData *a2)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      CFArrayAppendValue((CFMutableArrayRef)result, a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertBool(CACFArray *this, unsigned int a2, int a3)
{
  const void **v4;
  const void *v5;
  const __CFArray *inserted;
  const void *v9;
  char v10;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  v9 = v5;
  v10 = 1;
  if (v5)
  {
    CFRetain(v5);
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  }
  else
  {
    inserted = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v9);
  return inserted;
}

void sub_1A8396D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertCFType(__CFArray **this, unsigned int a2, const void *a3)
{
  const __CFArray *result;
  unsigned int Count;
  __CFArray *v8;

  result = *this;
  if (result)
  {
    if (*((_BYTE *)this + 9))
    {
      Count = CFArrayGetCount(result);
      v8 = *this;
      if (Count <= a2)
        CFArrayAppendValue(v8, a3);
      else
        CFArrayInsertValueAtIndex(v8, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertSInt32(CACFArray *this, unsigned int a2, int a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A8396E44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt32(CACFArray *this, unsigned int a2, int a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  int valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A8396EE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertSInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A8396F84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  uint64_t valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A8397024(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat32(CACFArray *this, unsigned int a2, float a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  float valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A83970C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat64(CACFArray *this, unsigned int a2, double a3)
{
  CFNumberRef v5;
  const __CFArray *inserted;
  CFNumberRef v8;
  char v9;
  double valuePtr;

  if (!*(_QWORD *)this || !*((_BYTE *)this + 9))
    return 0;
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v8 = v5;
  v9 = 1;
  if (v5)
    inserted = CACFArray::InsertCFType((__CFArray **)this, a2, v5);
  else
    inserted = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v8);
  return inserted;
}

void sub_1A8397164(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetBool(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  const void **v9;
  const void *v10;
  const void *v11;
  char v12;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  v9 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v9 = (const void **)MEMORY[0x1E0C9AE40];
  v10 = *v9;
  v11 = v10;
  v12 = 1;
  if (v10)
  {
    CFRetain(v10);
    v7 = CACFArray::SetCFType(this, a2, v10);
  }
  else
  {
    v7 = 0;
  }
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
  return v7;
}

void sub_1A839723C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetCFType(CFMutableArrayRef *this, unsigned int a2, const void *a3)
{
  const __CFArray *result;

  result = *this;
  if (result)
  {
    if (*((_BYTE *)this + 9) && CFArrayGetCount(result) >= a2)
    {
      CFArraySetValueAtIndex(*this, a2, a3);
      return (const __CFArray *)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::SetSInt32(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  int valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A8397358(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt32(const __CFArray **this, unsigned int a2, int a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  int valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A8397410(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetSInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  uint64_t valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A83974C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  uint64_t valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A8397580(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat32(const __CFArray **this, unsigned int a2, float a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  float valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A8397638(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat64(const __CFArray **this, unsigned int a2, double a3)
{
  const __CFArray *v4;
  const __CFArray *v7;
  CFNumberRef v9;
  CFNumberRef v10;
  char v11;
  double valuePtr;

  v4 = *this;
  if (!v4 || !*((_BYTE *)this + 9) || CFArrayGetCount(v4) < a2)
    return 0;
  valuePtr = a3;
  v9 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  v10 = v9;
  v11 = 1;
  if (v9)
    v7 = CACFArray::SetCFType(this, a2, v9);
  else
    v7 = 0;
  CACFNumber::~CACFNumber((CACFNumber *)&v10);
  return v7;
}

void sub_1A83976F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void CACFArray::PrintToLog(CACFArray *this, const __CFArray *a2)
{
  CFIndex Count;
  uint64_t v5;
  CFIndex v6;
  NSObject *v7;
  __CFString *ValueAtIndex;
  CFTypeID v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BYTE *v18;
  __int16 v19;
  int v20;
  _BYTE __b[256];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Count = CFArrayGetCount(this);
  if ((_DWORD)a2)
  {
    v5 = a2;
    memset(__b, 9, a2);
  }
  else
  {
    v5 = 0;
  }
  __b[v5] = 0;
  if (Count >= 1)
  {
    v6 = 0;
    v7 = MEMORY[0x1E0C81028];
    v12 = (_DWORD)a2 + 1;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v14 = "CACFArray.cpp";
        v15 = 1024;
        v16 = 795;
        v17 = 2080;
        v18 = __b;
        v19 = 1024;
        v20 = v6;
        _os_log_impl(&dword_1A836D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d  %sitem %d", buf, 0x22u);
      }
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(this, v6);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)ValueAtIndex, a2);
      }
      else if (v9 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)ValueAtIndex, a2);
      }
      else if (v9 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(ValueAtIndex, (const __CFString *)a2);
      }
      else if (v9 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)ValueAtIndex, (const __CFDictionary *)v12, v10);
      }
      else if (v9 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)ValueAtIndex, (const __CFArray *)v12, v11);
      }
      ++v6;
    }
    while (Count != v6);
  }
}

unint64_t MultiRadixFFT::NearestSupportedSizes(MultiRadixFFT *this)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  char v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  if (this >= 0x11)
  {
    if (this >> 20)
    {
      LODWORD(this) = 0x100000;
      v1 = 0x100000;
    }
    else
    {
      v2 = 1 << (__clz(this) ^ 0x1F);
      v3 = (1 << -(char)__clz((_DWORD)this - 1));
      if (v2 >= v3)
      {
        LODWORD(this) = v2;
        v1 = v3;
      }
      else
      {
        v4 = __clz(this / 0xF);
        v5 = 15 << ~v4;
        v6 = __clz(this / 5);
        v7 = 5 << ~v6;
        v8 = __clz(this / 3);
        if (v7 <= 3 << ~v8)
          v7 = 3 << ~v8;
        if (v5 <= v7)
          v5 = v7;
        if (v2 <= v5)
          v2 = v5;
        v1 = (uint64_t)this;
        if (v2 != (_DWORD)this)
        {
          v9 = 30 << (31 - v4);
          v10 = 10 << (31 - v6);
          v11 = 6 << (31 - v8);
          if (v11 < v10)
            v10 = v11;
          if (v10 < v9)
            v9 = v10;
          if (v9 >= v3)
            v1 = v3;
          else
            v1 = v9;
          LODWORD(this) = v2;
        }
      }
    }
  }
  else
  {
    LODWORD(this) = 16;
    v1 = 16;
  }
  return this | (unint64_t)(v1 << 32);
}

uint64_t MultiRadixFFT::Initialize(MultiRadixFFT *this, unsigned int a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  uint64_t shared_weak_owners;
  unint64_t *v13;
  unint64_t v14;
  vDSP_DFT_SetupStruct *Setup;
  vDSP_DFT_SetupStruct *v16;
  vDSP_DFT_Setup v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;

  {
    v34 = operator new();
    *(_DWORD *)v34 = 0;
    *(_QWORD *)(v34 + 16) = 0;
    *(_QWORD *)(v34 + 24) = 0;
    *(_QWORD *)(v34 + 8) = 0;
    DFTSetupList<true>::instance(void)::global = v34;
  }
  v5 = DFTSetupList<true>::instance(void)::global;
  os_unfair_lock_lock((os_unfair_lock_t)DFTSetupList<true>::instance(void)::global);
  v6 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v5 + 8), *(uint64_t **)(v5 + 16));
  std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v5 + 8, (uint64_t)v6, *(_QWORD *)(v5 + 16));
  v7 = *(_QWORD **)(v5 + 8);
  v8 = *(_QWORD **)(v5 + 16);
  while (1)
  {
    if (v7 == v8)
    {
      Setup = vDSP_DFT_zop_CreateSetup(0, a2, vDSP_DFT_FORWARD);
      v16 = Setup;
      if (Setup)
        v17 = vDSP_DFT_zop_CreateSetup(Setup, a2, vDSP_DFT_INVERSE);
      else
        v17 = 0;
      v18 = operator new();
      *(_DWORD *)v18 = a2;
      *(_QWORD *)(v18 + 8) = v16;
      *(_QWORD *)(v18 + 16) = v17;
      v11 = (std::__shared_weak_count *)operator new(0x38uLL);
      v11->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      v11->__shared_weak_owners_ = 0;
      v11[1].__vftable = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257E8;
      v11[1].__shared_owners_ = 0;
      v11[1].__shared_weak_owners_ = v18;
      v11[2].__vftable = (std::__shared_weak_count_vtbl *)v5;
      *(_QWORD *)&v35 = v11 + 1;
      *((_QWORD *)&v35 + 1) = v11;
      std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__enable_weak_this[abi:ne180100]<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,void>((uint64_t)&v35, (_QWORD *)v35, v35);
      std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::emplace_back<std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> &>(v5 + 8, &v35);
      shared_weak_owners = v11[1].__shared_weak_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
        goto LABEL_20;
      goto LABEL_21;
    }
    v9 = (std::__shared_weak_count *)v7[1];
    if (v9)
    {
      v10 = std::__shared_weak_count::lock(v9);
      if (v10)
        break;
    }
LABEL_12:
    v7 += 2;
  }
  v11 = v10;
  if (!*v7 || (shared_weak_owners = *(_QWORD *)(*v7 + 16), *(_DWORD *)shared_weak_owners != a2))
  {
    v13 = (unint64_t *)&v10->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v11);
    }
    goto LABEL_12;
  }
  v31 = (unint64_t *)&v10->__shared_owners_;
  do
    v32 = __ldxr(v31);
  while (__stxr(v32 + 1, v31));
  do
    v33 = __ldaxr(v31);
  while (__stlxr(v33 - 1, v31));
  if (!v33)
  {
LABEL_20:
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_21:
  v22 = 1936292453;
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
  if (*(_QWORD *)(shared_weak_owners + 8) && *(_QWORD *)(shared_weak_owners + 16))
  {
    v23 = (unint64_t *)&v11->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    v22 = 0;
    v25 = v11;
  }
  else
  {
    shared_weak_owners = 0;
    v25 = 0;
  }
  v26 = (unint64_t *)&v11->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  std::shared_ptr<DFTSetups>::operator=[abi:ne180100](this, shared_weak_owners, (uint64_t)v25);
  if (v25)
  {
    v28 = (unint64_t *)&v25->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  return v22;
}

void sub_1A8397D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<DFTSetups>::operator=[abi:ne180100](_QWORD *a1, uint64_t a2, uint64_t a3)
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

void std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__enable_weak_this[abi:ne180100]<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
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

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::emplace_back<std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> &>(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  __int128 v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;

  v5 = *(_QWORD **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v10 = *(_QWORD **)a1;
    v11 = ((uint64_t)v5 - *(_QWORD *)a1) >> 4;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<CADeprecated::XMachServer::Client *>::__throw_length_error[abi:ne180100]();
    v13 = v4 - (_QWORD)v10;
    if (v13 >> 3 > v12)
      v12 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v15 = (char *)operator new(16 * v14);
    v16 = &v15[16 * v11];
    v17 = *a2;
    *(_OWORD *)v16 = *a2;
    if (*((_QWORD *)&v17 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 16);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
      v10 = *(_QWORD **)a1;
      v5 = *(_QWORD **)(a1 + 8);
    }
    v20 = &v15[16 * v14];
    v9 = v16 + 16;
    if (v5 == v10)
    {
      *(_QWORD *)a1 = v16;
      *(_QWORD *)(a1 + 8) = v9;
      *(_QWORD *)(a1 + 16) = v20;
    }
    else
    {
      do
      {
        v21 = *((_OWORD *)v5 - 1);
        v5 -= 2;
        *((_OWORD *)v16 - 1) = v21;
        v16 -= 16;
        *v5 = 0;
        v5[1] = 0;
      }
      while (v5 != v10);
      v10 = *(_QWORD **)a1;
      v22 = *(_QWORD **)(a1 + 8);
      *(_QWORD *)a1 = v16;
      *(_QWORD *)(a1 + 8) = v9;
      *(_QWORD *)(a1 + 16) = v20;
      while (v22 != v10)
      {
        v23 = (std::__shared_weak_count *)*(v22 - 1);
        if (v23)
          std::__shared_weak_count::__release_weak(v23);
        v22 -= 2;
      }
    }
    if (v10)
      operator delete(v10);
  }
  else
  {
    v6 = *((_QWORD *)a2 + 1);
    *v5 = *(_QWORD *)a2;
    v5[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 16);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v9 = v5 + 2;
  }
  *(_QWORD *)(a1 + 8) = v9;
}

uint64_t *std::unique_ptr<DFTSetups>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1;
  vDSP_DFT_SetupStruct *v2;
  vDSP_DFT_SetupStruct *v3;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    v2 = *(vDSP_DFT_SetupStruct **)(v1 + 16);
    if (v2)
      vDSP_DFT_DestroySetup(v2);
    v3 = *(vDSP_DFT_SetupStruct **)(v1 + 8);
    if (v3)
      vDSP_DFT_DestroySetup(v3);
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257E8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85D2980);
}

void std::__shared_ptr_emplace<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__on_zero_shared(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  std::__shared_weak_count *v4;

  v2 = a1[6];
  if (os_unfair_lock_trylock((os_unfair_lock_t)v2))
  {
    v3 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v2 + 8), *(uint64_t **)(v2 + 16));
    std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v2 + 8, (uint64_t)v3, *(_QWORD *)(v2 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
  std::unique_ptr<DFTSetups>::reset[abi:ne180100](a1 + 5);
  v4 = (std::__shared_weak_count *)a1[4];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

uint64_t *std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  if (a1 == a2)
    return a2;
  v3 = a1;
  while (1)
  {
    v4 = v3[1];
    if (!v4 || *(_QWORD *)(v4 + 8) == -1)
      break;
    v3 += 2;
    if (v3 == a2)
      return a2;
  }
  if (v3 != a2)
  {
    for (i = v3 + 2; i != a2; i += 2)
    {
      v7 = i[1];
      if (v7 && *(_QWORD *)(v7 + 8) != -1)
      {
        v8 = *i;
        *i = 0;
        i[1] = 0;
        v9 = (std::__shared_weak_count *)v3[1];
        *v3 = v8;
        v3[1] = v7;
        if (v9)
          std::__shared_weak_count::__release_weak(v9);
        v3 += 2;
      }
    }
  }
  return v3;
}

void std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;

  if (a2 != a3)
  {
    v3 = a3;
    v4 = a2;
    v6 = *(_QWORD *)(a1 + 8);
    if (a3 != v6)
    {
      v7 = 16 * ((a3 - a2) >> 4);
      do
      {
        v8 = (_QWORD *)(v4 + v7);
        v9 = *(_OWORD *)(v4 + v7);
        *v8 = 0;
        v8[1] = 0;
        v10 = *(std::__shared_weak_count **)(v4 + 8);
        *(_OWORD *)v4 = v9;
        if (v10)
          std::__shared_weak_count::__release_weak(v10);
        v4 += 16;
      }
      while (v4 + v7 != v6);
      v3 = *(_QWORD *)(a1 + 8);
    }
    while (v3 != v4)
    {
      v11 = *(std::__shared_weak_count **)(v3 - 8);
      if (v11)
        std::__shared_weak_count::__release_weak(v11);
      v3 -= 16;
    }
    *(_QWORD *)(a1 + 8) = v4;
  }
}

uint64_t MultiRadixFFT::Size(MultiRadixFFT *this)
{
  if (*(_QWORD *)this)
    return **(unsigned int **)this;
  else
    return 0;
}

uint64_t MultiRadixRealFFT::Initialize(MultiRadixRealFFT *this, unsigned int a2)
{
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  uint64_t shared_weak_owners;
  unint64_t *v13;
  unint64_t v14;
  vDSP_DFT_SetupStruct *Setup;
  vDSP_DFT_SetupStruct *v16;
  vDSP_DFT_Setup v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;

  {
    v34 = operator new();
    *(_DWORD *)v34 = 0;
    *(_QWORD *)(v34 + 16) = 0;
    *(_QWORD *)(v34 + 24) = 0;
    *(_QWORD *)(v34 + 8) = 0;
    DFTSetupList<false>::instance(void)::global = v34;
  }
  v5 = DFTSetupList<false>::instance(void)::global;
  os_unfair_lock_lock((os_unfair_lock_t)DFTSetupList<false>::instance(void)::global);
  v6 = std::remove_if[abi:ne180100]<std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *>,caulk::shared_instance_manager<DFTSetups>::remove_expired(void)::{lambda(std::__wrap_iter<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> *> const&)#1}>(*(uint64_t **)(v5 + 8), *(uint64_t **)(v5 + 16));
  std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::erase(v5 + 8, (uint64_t)v6, *(_QWORD *)(v5 + 16));
  v7 = *(_QWORD **)(v5 + 8);
  v8 = *(_QWORD **)(v5 + 16);
  while (1)
  {
    if (v7 == v8)
    {
      Setup = vDSP_DFT_zrop_CreateSetup(0, a2, vDSP_DFT_FORWARD);
      v16 = Setup;
      if (Setup)
        v17 = vDSP_DFT_zrop_CreateSetup(Setup, a2, vDSP_DFT_INVERSE);
      else
        v17 = 0;
      v18 = operator new();
      *(_DWORD *)v18 = a2;
      *(_QWORD *)(v18 + 8) = v16;
      *(_QWORD *)(v18 + 16) = v17;
      v11 = (std::__shared_weak_count *)operator new(0x38uLL);
      v11->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      v11->__shared_weak_owners_ = 0;
      v11[1].__vftable = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E54257E8;
      v11[1].__shared_owners_ = 0;
      v11[1].__shared_weak_owners_ = v18;
      v11[2].__vftable = (std::__shared_weak_count_vtbl *)v5;
      *(_QWORD *)&v35 = v11 + 1;
      *((_QWORD *)&v35 + 1) = v11;
      std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>::__enable_weak_this[abi:ne180100]<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>,void>((uint64_t)&v35, (_QWORD *)v35, v35);
      std::vector<std::weak_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>>>::emplace_back<std::shared_ptr<caulk::lifetime_observed<std::unique_ptr<DFTSetups>,caulk::shared_instance_manager<DFTSetups>::observer>> &>(v5 + 8, &v35);
      shared_weak_owners = v11[1].__shared_weak_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
        goto LABEL_20;
      goto LABEL_21;
    }
    v9 = (std::__shared_weak_count *)v7[1];
    if (v9)
    {
      v10 = std::__shared_weak_count::lock(v9);
      if (v10)
        break;
    }
LABEL_12:
    v7 += 2;
  }
  v11 = v10;
  if (!*v7 || (shared_weak_owners = *(_QWORD *)(*v7 + 16), *(_DWORD *)shared_weak_owners != a2))
  {
    v13 = (unint64_t *)&v10->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v11);
    }
    goto LABEL_12;
  }
  v31 = (unint64_t *)&v10->__shared_owners_;
  do
    v32 = __ldxr(v31);
  while (__stxr(v32 + 1, v31));
  do
    v33 = __ldaxr(v31);
  while (__stlxr(v33 - 1, v31));
  if (!v33)
  {
LABEL_20:
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_21:
  v22 = 1936292453;
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
  if (*(_QWORD *)(shared_weak_owners + 8) && *(_QWORD *)(shared_weak_owners + 16))
  {
    v23 = (unint64_t *)&v11->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    v22 = 0;
    v25 = v11;
  }
  else
  {
    shared_weak_owners = 0;
    v25 = 0;
  }
  v26 = (unint64_t *)&v11->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  std::shared_ptr<DFTSetups>::operator=[abi:ne180100](this, shared_weak_owners, (uint64_t)v25);
  if (v25)
  {
    v28 = (unint64_t *)&v25->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  return v22;
}

void sub_1A83985B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MultiRadixRealFFT::Size(MultiRadixRealFFT *this)
{
  if (*(_QWORD *)this)
    return **(unsigned int **)this;
  else
    return 0;
}

uint64_t MultiRadixFFT::CplxInPlaceTransform(MultiRadixFFT *this, DSPSplitComplex *a2, int a3)
{
  MultiRadixFFT::CplxOutOfPlaceTransform(this, a2, a2, a3);
  return 0;
}

uint64_t MultiRadixFFT::CplxOutOfPlaceTransform(MultiRadixFFT *this, const DSPSplitComplex *a2, DSPSplitComplex *a3, int a4)
{
  uint64_t v4;

  if (!*(_QWORD *)this)
    abort();
  v4 = 16;
  if (a4 == 1)
    v4 = 8;
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(*(_QWORD *)this + v4), a2->realp, a2->imagp, a3->realp, a3->imagp);
  return 0;
}

uint64_t MultiRadixRealFFT::RealInPlaceTransform(MultiRadixRealFFT *this, DSPSplitComplex *a2, int a3, float a4)
{
  uint64_t v8;
  float __B;

  if (!*(_QWORD *)this)
    abort();
  v8 = 16;
  if (a3 == 1)
    v8 = 8;
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(*(_QWORD *)this + v8), a2->realp, a2->imagp, a2->realp, a2->imagp);
  if (a3 == 1)
  {
    __B = a4 * 0.5;
    vDSP_vsmul(a2->realp, 1, &__B, a2->realp, 1, (unint64_t)**(unsigned int **)this >> 1);
    vDSP_vsmul(a2->imagp, 1, &__B, a2->imagp, 1, (unint64_t)**(unsigned int **)this >> 1);
  }
  return 0;
}

uint64_t MultiRadixRealFFT::RealOutOfPlaceForwardTransform(MultiRadixRealFFT *this, DSPComplex *__C, DSPSplitComplex *a3, float a4)
{
  vDSP_ctoz(__C, 2, a3, 1, (unint64_t)**(unsigned int **)this >> 1);
  MultiRadixRealFFT::RealInPlaceTransform(this, a3, 1, a4);
  return 0;
}

uint64_t MultiRadixRealFFT::RealOutOfPlaceInverseTransform(MultiRadixRealFFT *this, const DSPSplitComplex *a2, DSPComplex *a3)
{
  uint64_t v5;
  float *v6;
  uint64_t v7;
  uint64_t v8;
  const float **v9;
  vDSP_Length v10;
  uint64_t v12;
  DSPSplitComplex __Z;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)this)
    abort();
  MEMORY[0x1E0C80A78]();
  v6 = (float *)((char *)&v12 - ((v5 + 15) & 0x7FFFFFFF0));
  __Z.realp = v6;
  __Z.imagp = (float *)((char *)v6 + ((2 * v7) & 0x1FFFFFFFCLL));
  vDSP_DFT_Execute(*(const vDSP_DFT_SetupStruct **)(v8 + 16), *v9, v9[1], v6, __Z.imagp);
  if (*(_QWORD *)this)
    v10 = (unint64_t)**(unsigned int **)this >> 1;
  else
    v10 = 0;
  vDSP_ztoc(&__Z, 1, a3, 2, v10);
  return 0;
}

uint64_t MultiRadixFFT_Create(unsigned int a1, MultiRadixFFT **a2)
{
  MultiRadixFFT *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (MultiRadixFFT *)operator new();
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = MultiRadixFFT::Initialize(v4, a1);
  if ((_DWORD)v5)
  {
    v6 = std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)v4);
    MEMORY[0x1A85D2980](v6, 0x20C40A4A59CD2);
  }
  else
  {
    *a2 = v4;
  }
  return v5;
}

uint64_t MultiRadixFFT_Dispose(uint64_t result)
{
  if (result)
  {
    std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100](result);
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

unsigned int **MultiRadixFFT_Size(unsigned int **result)
{
  if (result)
  {
    if (*result)
      return (unsigned int **)**result;
    else
      return 0;
  }
  return result;
}

uint64_t MultiRadixFFT_CplxInPlaceTransform(MultiRadixFFT *a1, DSPSplitComplex *a2, int a3)
{
  if (!a1)
    return 561214580;
  MultiRadixFFT::CplxOutOfPlaceTransform(a1, a2, a2, a3);
  return 0;
}

uint64_t MultiRadixFFT_CplxOutOfPlaceTransform(MultiRadixFFT *a1, const DSPSplitComplex *a2, DSPSplitComplex *a3, int a4)
{
  if (!a1)
    return 561214580;
  MultiRadixFFT::CplxOutOfPlaceTransform(a1, a2, a3, a4);
  return 0;
}

uint64_t MultiRadixRealFFT_Create(unsigned int a1, MultiRadixRealFFT **a2)
{
  MultiRadixRealFFT *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (MultiRadixRealFFT *)operator new();
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = MultiRadixRealFFT::Initialize(v4, a1);
  if ((_DWORD)v5)
  {
    v6 = std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100]((uint64_t)v4);
    MEMORY[0x1A85D2980](v6, 0x20C40A4A59CD2);
  }
  else
  {
    *a2 = v4;
  }
  return v5;
}

uint64_t MultiRadixRealFFT_Dispose(uint64_t result)
{
  if (result)
  {
    std::shared_ptr<CADeprecated::XMachReceivePort>::~shared_ptr[abi:ne180100](result);
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

unsigned int **MultiRadixRealFFT_Size(unsigned int **result)
{
  if (result)
  {
    if (*result)
      return (unsigned int **)**result;
    else
      return 0;
  }
  return result;
}

uint64_t MultiRadixRealFFT_RealInPlaceTransform(MultiRadixRealFFT *a1, DSPSplitComplex *a2, int a3)
{
  if (!a1)
    return 561214580;
  MultiRadixRealFFT::RealInPlaceTransform(a1, a2, a3, 1.0);
  return 0;
}

uint64_t MultiRadixRealFFT_RealOutOfPlaceForwardTransform(MultiRadixRealFFT *a1, DSPComplex *__C, DSPSplitComplex *a3)
{
  if (!a1)
    return 561214580;
  vDSP_ctoz(__C, 2, a3, 1, (unint64_t)**(unsigned int **)a1 >> 1);
  MultiRadixRealFFT::RealInPlaceTransform(a1, a3, 1, 1.0);
  return 0;
}

uint64_t MultiRadixRealFFT_RealOutOfPlaceInverseTransform(MultiRadixRealFFT *a1, const DSPSplitComplex *a2, DSPComplex *a3)
{
  if (!a1)
    return 561214580;
  MultiRadixRealFFT::RealOutOfPlaceInverseTransform(a1, a2, a3);
  return 0;
}

float realFFTMultiply(float *a1, float *a2, float *a3, float *a4, float *a5, float *a6, unsigned int a7)
{
  float v7;
  float v8;
  float v9;
  float v10;
  float *imagp;
  float result;
  DSPSplitComplex v13;
  DSPSplitComplex __B;
  DSPSplitComplex __A;

  __A.realp = a1;
  __A.imagp = a2;
  __B.realp = a3;
  __B.imagp = a4;
  v13.realp = a5;
  v13.imagp = a6;
  v7 = *a1;
  v8 = *a2;
  v9 = *a3;
  v10 = *a4;
  vDSP_zvmul(&__A, 1, &__B, 1, &v13, 1, a7 >> 1, 1);
  imagp = v13.imagp;
  *v13.realp = v7 * v9;
  result = v8 * v10;
  *imagp = v8 * v10;
  return result;
}

void realFFTZeroPad(const DSPComplex *a1, float *a2, float *a3, unsigned int a4, int a5, MultiRadixRealFFT *a6)
{
  vDSP_Length v9;
  size_t v10;
  DSPSplitComplex v11;

  v11.realp = a2;
  v11.imagp = a3;
  v9 = a4 >> 1;
  vDSP_ctoz(a1, 2, &v11, 1, v9);
  if (a5 - a4 >= 2)
  {
    v10 = 4 * (((a5 - a4) >> 1) - 1) + 4;
    bzero(&v11.realp[v9], v10);
    bzero(&v11.imagp[v9], v10);
  }
  if (a6)
    MultiRadixRealFFT::RealInPlaceTransform(a6, &v11, 1, 1.0);
}

void realIFFTUnload(float *a1, float *a2, DSPComplex *__C, unsigned int a4, unsigned int a5, MultiRadixRealFFT *this, float a7)
{
  DSPSplitComplex __Z;
  float __B;
  DSPSplitComplex v11;

  v11.realp = a1;
  v11.imagp = a2;
  __B = a7;
  __Z.realp = &a1[a5 >> 1];
  __Z.imagp = &a2[a5 >> 1];
  if (this)
    MultiRadixRealFFT::RealInPlaceTransform(this, &v11, -1, 1.0);
  vDSP_ztoc(&__Z, 1, __C, 2, a4 >> 1);
  vDSP_vsmul((const float *)__C, 1, &__B, (float *)__C, 1, a4);
}

uint64_t CADeprecated::XThread::RunHelper(CADeprecated::XThread *this, void *a2)
{
  (*(void (**)(CADeprecated::XThread *, void *))(*(_QWORD *)this + 32))(this, a2);
  return 0;
}

uint64_t CADeprecated::XThread::Stop(CADeprecated::XThread *this)
{
  int v2;
  uint64_t result;

  v2 = *((unsigned __int8 *)this + 123);
  *((_BYTE *)this + 123) = 0;
  for (result = (*(uint64_t (**)(CADeprecated::XThread *))(*(_QWORD *)this + 24))(this);
        atomic_load((unint64_t *)this + 1);
  if (v2)
    return (*(uint64_t (**)(CADeprecated::XThread *))(*(_QWORD *)this + 8))(this);
  return result;
}

void XPC_Dictionary::~XPC_Dictionary(XPC_Dictionary *this)
{
  XPC_Object::~XPC_Object(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t XPC_Dictionary::GetArray(uint64_t a1, char *key, uint64_t a3)
{
  unsigned __int8 v6;
  uint64_t result;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if (*(_QWORD *)(a3 + 8))
  {
    v6 = atomic_load((unsigned __int8 *)(a3 + 16));
    if ((v6 & 1) != 0)
      xpc_release(*(xpc_object_t *)(a3 + 8));
    *(_QWORD *)(a3 + 8) = 0;
    atomic_store(0, (unsigned __int8 *)(a3 + 16));
  }
  result = *(_QWORD *)(a1 + 8);
  if (result)
  {
    result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, key);
    if (result)
    {
      v8 = result;
      if (MEMORY[0x1A85D32E0]() == MEMORY[0x1E0C812C8])
      {
        if (*(_QWORD *)(a3 + 8))
        {
          v9 = atomic_load((unsigned __int8 *)(a3 + 16));
          if ((v9 & 1) != 0)
            xpc_release(*(xpc_object_t *)(a3 + 8));
        }
        *(_QWORD *)(a3 + 8) = v8;
        atomic_store(0, (unsigned __int8 *)(a3 + 16));
        v10 = atomic_load((unsigned __int8 *)(a3 + 16));
        if ((v10 & 1) != 0)
          xpc_retain(*(xpc_object_t *)(a3 + 8));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t XPC_Dictionary::GetDictionary(XPC_Dictionary *this, const char *key, XPC_Dictionary *a3)
{
  unsigned __int8 v6;
  uint64_t result;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if (*((_QWORD *)a3 + 1))
  {
    v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if ((v6 & 1) != 0)
      xpc_release(*((xpc_object_t *)a3 + 1));
    *((_QWORD *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  result = *((_QWORD *)this + 1);
  if (result)
  {
    result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, key);
    if (result)
    {
      v8 = result;
      if (MEMORY[0x1A85D32E0]() == MEMORY[0x1E0C812F8])
      {
        if (*((_QWORD *)a3 + 1))
        {
          v9 = atomic_load((unsigned __int8 *)a3 + 16);
          if ((v9 & 1) != 0)
            xpc_release(*((xpc_object_t *)a3 + 1));
        }
        *((_QWORD *)a3 + 1) = v8;
        atomic_store(0, (unsigned __int8 *)a3 + 16);
        v10 = atomic_load((unsigned __int8 *)a3 + 16);
        if ((v10 & 1) != 0)
          xpc_retain(*((xpc_object_t *)a3 + 1));
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void MemoryStream::~MemoryStream(MemoryStream *this)
{
  MemoryStream::~MemoryStream(this);
  JUMPOUT(0x1A85D2980);
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E5425068;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
  {
    CFRelease(v2);
  }
  else
  {
    v3 = (void *)*((_QWORD *)this + 2);
    if (v3)
    {
      if (*((_BYTE *)this + 40))
        free(v3);
    }
  }
}

size_t MemoryStream::Read(MemoryStream *this, void *__dst, size_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  _DWORD *exception;

  v3 = *((_QWORD *)this + 4);
  v4 = *((_QWORD *)this + 2);
  if (v4)
    v5 = *((_QWORD *)this + 3) - v3 >= a3;
  else
    v5 = 0;
  if (!v5)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = -39;
  }
  memcpy(__dst, (const void *)(v4 + v3), a3);
  *((_QWORD *)this + 4) += a3;
  return a3;
}

void MemoryStream::Write(MemoryStream *this, const UInt8 *__src, size_t __n)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  int Length;
  CFRange v11;
  _DWORD *exception;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *((_QWORD *)this + 2);
  if (!v6)
  {
    Length = CFDataGetLength(*((CFDataRef *)this + 1));
    v9 = (_QWORD *)((char *)this + 32);
    v11.location = *((_QWORD *)this + 4);
    if (v11.location == Length)
    {
      CFDataAppendBytes(*((CFMutableDataRef *)this + 1), __src, __n);
      *((_QWORD *)this + 3) = CFDataGetLength(*((CFDataRef *)this + 1));
    }
    else
    {
      v11.length = (int)__n;
      CFDataReplaceBytes(*((CFMutableDataRef *)this + 1), v11, __src, (int)__n);
    }
    goto LABEL_8;
  }
  if (!*((_BYTE *)this + 41))
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = -54;
  }
  v8 = (char *)this + 32;
  v7 = *((_QWORD *)this + 4);
  if (*((_QWORD *)this + 3) - v7 >= __n)
  {
    memcpy((void *)(v6 + v7), __src, __n);
    v9 = v8;
LABEL_8:
    *v9 += __n;
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "MemoryStream.cpp";
    v15 = 1024;
    v16 = 184;
    _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d  failed assertion: goodToCopy", (uint8_t *)&v13, 0x12u);
  }
  __break(1u);
}

uint64_t TStream::ReadAsync()
{
  return 4294967292;
}

uint64_t MemoryStream::Seek(uint64_t this, uint64_t a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    *(_QWORD *)(this + 32) = 0;
  }
  else
  {
    v2 = *(_QWORD *)(this + 24);
    if (v2 <= a2)
      *(_QWORD *)(this + 32) = v2;
    else
      *(_QWORD *)(this + 32) = a2;
  }
  return this;
}

uint64_t MemoryStream::GetPosition(MemoryStream *this)
{
  return *((_QWORD *)this + 4);
}

uint64_t MemoryStream::Skip(uint64_t this, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(this + 24);
  v3 = *(_QWORD *)(this + 32);
  v4 = -v3;
  v5 = v2 - v3;
  v6 = v3 + a2;
  if (v5 > a2)
    v2 = v6;
  if (v4 >= a2)
    v2 = 0;
  *(_QWORD *)(this + 32) = v2;
  return this;
}

uint64_t MemoryStream::GetLength(MemoryStream *this)
{
  return *((_QWORD *)this + 3);
}

void MemoryStream::MemoryStream(MemoryStream *this, TStream *a2, int a3)
{
  uint64_t v5;
  void *v6;

  v5 = a3;
  v6 = malloc_type_malloc(a3, 0x217192ADuLL);
  *((_QWORD *)this + 2) = v6;
  *((_QWORD *)this + 3) = v5;
  *((_QWORD *)this + 4) = 0;
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 40) = 1;
  if (v6)
    (*(void (**)(TStream *, void *, uint64_t))(*(_QWORD *)a2 + 16))(a2, v6, v5);
}

{
  uint64_t v5;
  void *v6;

  v5 = a3;
  v6 = malloc_type_malloc(a3, 0x217192ADuLL);
  *((_QWORD *)this + 2) = v6;
  *((_QWORD *)this + 3) = v5;
  *((_QWORD *)this + 4) = 0;
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 40) = 1;
  if (v6)
    (*(void (**)(TStream *, void *, uint64_t))(*(_QWORD *)a2 + 16))(a2, v6, v5);
}

void sub_1A839927C(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1A8399308(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

uint64_t MemoryStream::MemoryStream(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v5;
  void *v6;

  v5 = a3;
  v6 = malloc_type_malloc(a3, 0xEE979C34uLL);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &off_1E5425068;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  if (v6)
    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, v6, v5);
  return a1;
}

{
  uint64_t v5;
  void *v6;

  v5 = a3;
  v6 = malloc_type_malloc(a3, 0xEE979C34uLL);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &off_1E5425068;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  if (v6)
    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, v6, v5);
  return a1;
}

void sub_1A8399394(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1A8399420(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void MemoryStream::MemoryStream(MemoryStream *this, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 2) = BytePtr;
  *((_QWORD *)this + 3) = Length;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 1) = CFRetain(theData);
  *((_BYTE *)this + 40) = 1;
}

{
  const UInt8 *BytePtr;
  CFIndex Length;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 2) = BytePtr;
  *((_QWORD *)this + 3) = Length;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 1) = CFRetain(theData);
  *((_BYTE *)this + 40) = 1;
}

void sub_1A839949C(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1A8399518(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void MemoryStream::MemoryStream(MemoryStream *this)
{
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = CFDataCreateMutable(0, 0);
  *((_BYTE *)this + 40) = 1;
}

{
  *(_QWORD *)this = &off_1E5425068;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = CFDataCreateMutable(0, 0);
  *((_BYTE *)this + 40) = 1;
}

void sub_1A8399578(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

void sub_1A83995D8(_Unwind_Exception *a1)
{
  MemoryStream *v1;

  MemoryStream::~MemoryStream(v1);
  _Unwind_Resume(a1);
}

CFTypeRef MemoryStream::GetData(CFTypeRef *this)
{
  return CFRetain(this[1]);
}

void ___ZN18CASmartPreferencesC2Ev_block_invoke(uint64_t a1)
{
  CASmartPreferences::RereadPrefs(*(CASmartPreferences **)(a1 + 32));
}

void CASmartPreferences::RereadPrefs(CASmartPreferences *this)
{
  CFStringRef *v2;
  CFStringRef *v3;

  std::mutex::lock((std::mutex *)this);
  CFSetApplyFunction(*((CFSetRef *)this + 8), (CFSetApplierFunction)SynchronizePrefDomain, 0);
  v2 = (CFStringRef *)*((_QWORD *)this + 9);
  v3 = (CFStringRef *)*((_QWORD *)this + 10);
  while (v2 != v3)
  {
    CASmartPreferences::Pref::Load(v2);
    v2 += 6;
  }
  std::mutex::unlock((std::mutex *)this);
}

void sub_1A8399658(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t SynchronizePrefDomain(const __CFString *a1, void *a2)
{
  return CFPreferencesSynchronize(a1, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

double CACFPreferencesGetAppFloatValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  BOOL *v5;
  const __CFString *v6;
  BOOL *v7;
  double v8;
  char v10;

  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretFloat(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

double CASmartPreferences::InterpretFloat(const __CFString *this, _BYTE *a2, BOOL *a3)
{
  CFTypeID v5;
  double valuePtr;
  char buffer[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  valuePtr = 0.0;
  *a2 = 0;
  if (this)
  {
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      valuePtr = (double)CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberDoubleType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%lf", &valuePtr) == 1)
        goto LABEL_6;
    }
  }
  return valuePtr;
}

uint64_t CACFPreferencesGetAppFourCCValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t v7;
  BOOL v8;
  char buffer[4];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    v7 = 0;
    v8 = 0;
    if (!a3)
      return v7;
    goto LABEL_7;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID() && (CFStringGetCString(v5, buffer, 64, 0x600u), strlen(buffer) == 4))
  {
    v7 = bswap32(*(unsigned int *)buffer);
    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  CFRelease(v5);
  if (a3)
LABEL_7:
    *a3 = v8;
  return v7;
}

_QWORD *std::construct_at[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &,CASmartPreferences::Pref*>(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)a4[3];
  if (!v7)
  {
    v13 = 0;
    *a1 = a2;
    a1[1] = a3;
LABEL_9:
    a1[5] = 0;
    return a1;
  }
  if (v7 == a4)
  {
    v13 = v12;
    (*(void (**)(_QWORD *, _QWORD *))(*a4 + 24))(a4, v12);
    v8 = v13;
  }
  else
  {
    v8 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
    v13 = v8;
  }
  *a1 = a2;
  a1[1] = a3;
  if (!v8)
    goto LABEL_9;
  if (v8 == v12)
  {
    a1[5] = a1 + 2;
    (*(void (**)(_QWORD *))(v12[0] + 24))(v12);
  }
  else
  {
    a1[5] = (*(uint64_t (**)(_QWORD *))(*v8 + 16))(v8);
  }
  v9 = v13;
  if (v13 == v12)
  {
    v10 = 4;
    v9 = v12;
    goto LABEL_15;
  }
  if (v13)
  {
    v10 = 5;
LABEL_15:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  return a1;
}

void sub_1A83999EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _Unwind_Resume(exception_object);
}

void *CASharedLibrary::LoadLibraryAndGetRoutineAddress(CASharedLibrary *this, const char *a2, const char *__path, const char *a4)
{
  void *result;

  result = dlopen(__path, 1);
  if (result)
    return dlsym(result, (const char *)this + 1);
  return result;
}

void *CASharedLibrary::GetRoutineAddressIfLibraryLoaded(CASharedLibrary *this, const char *a2, const char *__path, const char *a4)
{
  void *result;

  result = dlopen(__path, 17);
  if (result)
    return dlsym(result, (const char *)this + 1);
  return result;
}

CFPropertyListRef CACFPreferences::CopyValue(const __CFString *this, __CFString *a2, int a3)
{
  int v4;
  const __CFString **v6;
  const __CFString *v7;
  CFStringRef *v8;

  v4 = (int)a2;
  CACFPreferences::Synchronize((CACFPreferences *)a2, a3, 0);
  v6 = (const __CFString **)MEMORY[0x1E0C9B260];
  if (!v4)
    v6 = (const __CFString **)MEMORY[0x1E0C9B240];
  v7 = *v6;
  v8 = (CFStringRef *)MEMORY[0x1E0C9B250];
  if (!a3)
    v8 = (CFStringRef *)MEMORY[0x1E0C9B230];
  return CFPreferencesCopyValue(this, (CFStringRef)*MEMORY[0x1E0C9B228], v7, *v8);
}

const void *CACFPreferences::CopyStringValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CACFPreferences::CopyValue(this, a2, a3);
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = "CACFPreferences.cpp";
        v9 = 1024;
        v10 = 49;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyStringValue: not a CFString", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyNumberValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CACFPreferences::CopyValue(this, a2, a3);
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFNumberGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = "CACFPreferences.cpp";
        v9 = 1024;
        v10 = 75;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyNumberValue: not a CFNumber", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyArrayValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CACFPreferences::CopyValue(this, a2, a3);
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFArrayGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = "CACFPreferences.cpp";
        v9 = 1024;
        v10 = 101;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyArrayValue: not a CFArray", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyDictionaryValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CACFPreferences::CopyValue(this, a2, a3);
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFDictionaryGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = "CACFPreferences.cpp";
        v9 = 1024;
        v10 = 127;
        _os_log_impl(&dword_1A836D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  CACFPreferences::CopyDictionaryValue: not a CFDictionary", (uint8_t *)&v7, 0x12u);
      }
      return 0;
    }
  }
  return v4;
}

void CACFPreferences::SetValue(const __CFString *this, const __CFString *a2, CACFPreferences *a3, int a4, int a5)
{
  const __CFString **v8;
  const __CFString *v9;
  CFStringRef *v10;

  v8 = (const __CFString **)MEMORY[0x1E0C9B260];
  if (!(_DWORD)a3)
    v8 = (const __CFString **)MEMORY[0x1E0C9B240];
  v9 = *v8;
  v10 = (CFStringRef *)MEMORY[0x1E0C9B250];
  if (!a4)
    v10 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(this, a2, (CFStringRef)*MEMORY[0x1E0C9B228], v9, *v10);
  if (a5)
    CACFPreferences::Synchronize(a3, a4, 1);
}

void CACFPreferences::DeleteValue(const __CFString *this, const __CFString *a2, int a3, int a4)
{
  const __CFString **v6;
  const __CFString *v7;
  CFStringRef *v8;

  v6 = (const __CFString **)MEMORY[0x1E0C9B260];
  if (!(_DWORD)a2)
    v6 = (const __CFString **)MEMORY[0x1E0C9B240];
  v7 = *v6;
  v8 = (CFStringRef *)MEMORY[0x1E0C9B250];
  if (!a3)
    v8 = (CFStringRef *)MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(this, 0, (CFStringRef)*MEMORY[0x1E0C9B228], v7, *v8);
  if (a4)
    CACFPreferences::Synchronize((CACFPreferences *)(v7 != 0), a3, 1);
}

uint64_t CACFPreferences::MarkPrefsClean(uint64_t this, int a2)
{
  char *v2;

  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || (_DWORD)this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if (((this ^ 1 | a2 ^ 1) & 1) != 0)
          return this;
        v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  *v2 = 0;
  return this;
}

uint64_t CACFPreferences::MarkPrefsOutOfDate(uint64_t this, int a2)
{
  char *v2;

  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || (_DWORD)this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if (((this ^ 1 | a2 ^ 1) & 1) != 0)
          return this;
        v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  *v2 = 1;
  return this;
}

void CACFPreferences::SendNotification(const __CFString *this, const __CFString *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, this, 0, 0, 0);
}

BOOL BaseOpaqueObject::isa(uint64_t a1, void *a2)
{
  return a2 == &BaseOpaqueObject::sBaseRTTI;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;

  if (!atomic_load((unsigned int *)(a1 + 48)))
  {
    v3 = atomic_load((unint64_t *)(a1 + 40));
    if (v3)
    {
      v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(v3);
      MEMORY[0x1A85D2980](v4, 0x1060C402CF69088);
    }
    std::mutex::~mutex((std::mutex *)(a1 + 80));
    v5 = *(uint64_t **)(a1 + 56);
    if (v5)
    {
      v6 = *(uint64_t **)(a1 + 64);
      v7 = *(void **)(a1 + 56);
      if (v6 != v5)
      {
        do
          std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v6);
        while (v6 != v5);
        v7 = *(void **)(a1 + 56);
      }
      *(_QWORD *)(a1 + 64) = v5;
      operator delete(v7);
    }
    v8 = *(_QWORD **)(a1 + 24);
    if (v8 == (_QWORD *)a1)
    {
      v9 = 4;
      v8 = (_QWORD *)a1;
    }
    else
    {
      if (!v8)
        return a1;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
    return a1;
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2;
  unsigned int **v3;

  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2)
  {
    v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2)
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::element_t::release(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()(unsigned int)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::table_impl::~table_impl(result);
    JUMPOUT(0x1A85D2980);
  }
  return result;
}

void std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::~__func()
{
  JUMPOUT(0x1A85D2980);
}

_QWORD *std::__function::__func<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0,std::allocator<OpaqueObjectMgr::OpaqueObjectMgr(void)::$_0>,unsigned int ()(unsigned int)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E54255D0;
  return result;
}

uint64_t *OpaqueObjectMgr::lookup(OpaqueObjectMgr *this, int a2)
{
  uint64_t *result;
  char v3;

  result = caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::lookup<(caulk::concurrent::guarded_lookup_hash_table_options)0,void>((uint64_t)this, a2);
  if (!v3)
    return 0;
  return result;
}

void std::this_thread::sleep_for[abi:ne180100]<long long,std::ratio<1l,1000000l>>(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5;
  std::chrono::nanoseconds __ns;
  uint64_t v7;
  uint64_t v8;

  if (a1 >= 1)
  {
    v7 = v1;
    v8 = v2;
    if ((double)a1 == 9.22337204e15)
      v3 = 0;
    else
      v3 = -127;
    if ((double)a1 > 9.22337204e15)
      v3 = 1;
    if ((double)a1 < 9.22337204e15)
      v3 = -1;
    v4 = v3 >= 0 || v3 == -127;
    v5 = 1000 * a1;
    if (v4)
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    __ns.__rep_ = v5;
    std::this_thread::sleep_for (&__ns);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<OpaqueObjectMgrInstance(void)::$_0 &&>>()
{
  OpaqueObjectMgr *v0;

  v0 = (OpaqueObjectMgr *)operator new();
  OpaqueObjectMgr::OpaqueObjectMgr(v0);
  OpaqueObjectMgr::sInstance = (uint64_t)v0;
}

void sub_1A839A36C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A85D2980](v1, 0x1020C400FEAF0FDLL);
  _Unwind_Resume(a1);
}

void BaseOpaqueObject::BaseOpaqueObject(BaseOpaqueObject *this, int a2)
{
  uint64_t v4;

  *(_QWORD *)this = off_1E5425110;
  *((_DWORD *)this + 2) = a2;
  v4 = OpaqueObjectMgrInstance();
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,BaseOpaqueObject *,(caulk::concurrent::guarded_lookup_hash_table_options)0,std::function<unsigned int ()>>::_addOrReplace(v4, a2, (uint64_t)this);
}

float DFT_split_180_execute(vDSP_DFT_SetupStruct *__Setup, float32x2_t *a2, float32x2_t *a3, float *a4, float *a5, vDSP_DFT_Direction a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,uint64_t a45,uint64_t a46)
{
  unint64_t v47;
  float *v48;
  float *v49;
  float32x2_t *v50;
  const float *v51;
  unint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t *v65;
  float32x4_t *v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t *v71;
  float32x4_t *v72;
  float32x2_t v73;
  float32x2_t v74;
  float32x2_t v75;
  float32x2_t v76;
  uint64_t v77;
  unint64_t v78;
  _OWORD *v79;
  int32x4_t *v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t *v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  uint64_t v94;
  float *v95;
  _DWORD *v96;
  float result;
  uint64_t v98;

  v47 = 0;
  if (a6 == vDSP_DFT_INVERSE)
    v48 = a4;
  else
    v48 = a5;
  if (a6 == vDSP_DFT_INVERSE)
    v49 = a5;
  else
    v49 = a4;
  if (a6 == vDSP_DFT_INVERSE)
    v50 = a2;
  else
    v50 = a3;
  if (a6 == vDSP_DFT_INVERSE)
    v51 = (const float *)a3;
  else
    v51 = (const float *)a2;
  v52 = -8;
  do
  {
    v54 = *(float32x4_t *)&v51[v47 / 4];
    v53 = *(float32x4_t *)&v51[v47 / 4 + 4];
    v56 = *(float32x4_t *)v50[v47 / 8].f32;
    v55 = *(float32x4_t *)v50[v47 / 8 + 2].f32;
    v58 = *(float32x4_t *)&v51[v47 / 4 + 90];
    v57 = *(float32x4_t *)&v51[v47 / 4 + 94];
    v60 = *(float32x4_t *)v50[v47 / 8 + 45].f32;
    v59 = *(float32x4_t *)v50[v47 / 8 + 47].f32;
    v62 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kCos_2PiOver180
                         + v47);
    v61 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kCos_2PiOver180
                         + v47
                         + 16);
    v63 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kSin_2PiOver180
                         + v47);
    v64 = *(float32x4_t *)((char *)&DFT_split_180_execute(vDSP_DFT_SetupStruct *,float const*,float const*,float *,float *,vDSP_DFT_Direction)::kSin_2PiOver180
                         + v47
                         + 16);
    v65 = (float32x4_t *)((char *)&STACK[0x890] + v47);
    *v65 = vaddq_f32(v54, v58);
    v65[1] = vaddq_f32(v53, v57);
    v66 = (float32x4_t *)((char *)&v98 + v47);
    *v66 = vaddq_f32(v56, v60);
    v66[1] = vaddq_f32(v55, v59);
    v67 = vsubq_f32(v53, v57);
    v68 = vsubq_f32(v54, v58);
    v69 = vsubq_f32(v56, v60);
    v70 = vsubq_f32(v55, v59);
    v71 = (float32x4_t *)((char *)&STACK[0x890] + v47 + 360);
    *v71 = vmlaq_f32(vmulq_f32(v69, v63), v62, v68);
    v71[1] = vmlaq_f32(vmulq_f32(v70, v64), v61, v67);
    v72 = (float32x4_t *)((char *)&a44 + v47);
    *v72 = vmlaq_f32(vmulq_f32(v63, vnegq_f32(v68)), v62, v69);
    v72[1] = vmlaq_f32(vmulq_f32(v64, vnegq_f32(v67)), v61, v70);
    v52 += 8;
    v47 += 32;
  }
  while (v52 < 0x4B);
  v73 = *(float32x2_t *)(v51 + 88);
  v74 = *(float32x2_t *)(v51 + 178);
  v75 = vsub_f32(v73, v74);
  v76 = vsub_f32(v50[44], v50[89]);
  STACK[0x9F0] = (unint64_t)vadd_f32(v73, v74);
  STACK[0xB58] = (unint64_t)vmla_f32(vmul_f32(v76, (float32x2_t)0x3D0EF2AD3D8EDC7BLL), (float32x2_t)0xBF7FD814BF7F605CLL, v75);
  STACK[0x878] = (unint64_t)vmla_f32(vmul_f32(v75, (float32x2_t)0xBD0EF2ADBD8EDC7BLL), (float32x2_t)0xBF7FD814BF7F605CLL, v76);
  vDSP_DFT_Execute(__Setup, (const float *)&STACK[0x890], (const float *)&v98, (float *)&STACK[0x890], (float *)&v98);
  vDSP_DFT_Execute(__Setup, (const float *)&STACK[0x9F8], (const float *)&a44, (float *)&STACK[0x9F8], (float *)&a44);
  v77 = 0;
  v78 = -8;
  v79 = v49;
  v80 = (int32x4_t *)v48;
  do
  {
    v82 = *(int32x4_t *)((char *)&STACK[0x890] + v77);
    v81 = *(int32x4_t *)((char *)&STACK[0x890] + v77 + 16);
    v84 = *(int32x4_t *)((char *)&v98 + v77);
    v83 = *(int32x4_t *)((char *)&v98 + v77 + 16);
    v85 = (int32x4_t *)((char *)&STACK[0x890] + v77 + 360);
    v86 = *(int32x4_t *)((char *)&STACK[0x890] + v77 + 376);
    v87 = vzip1q_s32(v82, *v85);
    v88 = vzip2q_s32(v82, *v85);
    v89 = vzip1q_s32(v81, v86);
    v90 = vzip2q_s32(v81, v86);
    v91 = *(int32x4_t *)((char *)&a46 + v77);
    v92 = vzip2q_s32(v84, *(int32x4_t *)((char *)&a44 + v77));
    v93 = vzip1q_s32(v84, *(int32x4_t *)((char *)&a44 + v77));
    v79[2] = v89;
    v79[3] = v90;
    *v79 = v87;
    v79[1] = v88;
    v79 += 4;
    v80[2] = vzip1q_s32(v83, v91);
    v80[3] = vzip2q_s32(v83, v91);
    v78 += 8;
    *v80 = v93;
    v80[1] = v92;
    v80 += 4;
    v77 += 32;
  }
  while (v78 < 0x4B);
  v94 = 0;
  v95 = v48 + 177;
  v96 = v49 + 177;
  do
  {
    *(v96 - 1) = *(_DWORD *)((char *)&STACK[0x890] + v94 + 352);
    *(v95 - 1) = *(float *)((char *)&v98 + v94 + 352);
    *v96 = *(_DWORD *)((char *)&STACK[0x890] + v94 + 712);
    v96 += 2;
    result = *(float *)((char *)&STACK[0x878] + v94);
    *v95 = result;
    v95 += 2;
    v94 += 4;
  }
  while (v94 != 8);
  return result;
}

void CADeprecated::CAGuard::~CAGuard(CADeprecated::CAGuard *this)
{
  CADeprecated::CAGuard::~CAGuard(this);
  JUMPOUT(0x1A85D2980);
}

{
  *(_QWORD *)this = &off_1E5425360;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));
  *(_QWORD *)this = &off_1E54253D0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

uint64_t CADeprecated::CAGuard::WaitUntil(CADeprecated::CAGuard *this, unint64_t a2)
{
  unint64_t v4;

  mach_absolute_time();
  v4 = __udivti3();
  if (a2 <= v4)
    return 1;
  else
    return (*(uint64_t (**)(CADeprecated::CAGuard *, unint64_t))(*(_QWORD *)this + 64))(this, a2 - v4);
}

void XPC_Array::~XPC_Array(XPC_Array *this)
{
  XPC_Object::~XPC_Object(this);
  JUMPOUT(0x1A85D2980);
}

uint64_t XPC_Array::GetArray(XPC_Array *this, size_t a2, XPC_Array *a3)
{
  unsigned __int8 v6;
  uint64_t result;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if (*((_QWORD *)a3 + 1))
  {
    v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if ((v6 & 1) != 0)
      xpc_release(*((xpc_object_t *)a3 + 1));
    *((_QWORD *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  result = *((_QWORD *)this + 1);
  if (result)
  {
    if (xpc_array_get_count((xpc_object_t)result) <= a2)
      return 0;
    result = (uint64_t)xpc_array_get_value(*((xpc_object_t *)this + 1), a2);
    if (!result)
      return result;
    v8 = result;
    if (MEMORY[0x1A85D32E0]() == MEMORY[0x1E0C812C8])
    {
      if (*((_QWORD *)a3 + 1))
      {
        v9 = atomic_load((unsigned __int8 *)a3 + 16);
        if ((v9 & 1) != 0)
          xpc_release(*((xpc_object_t *)a3 + 1));
      }
      *((_QWORD *)a3 + 1) = v8;
      atomic_store(0, (unsigned __int8 *)a3 + 16);
      v10 = atomic_load((unsigned __int8 *)a3 + 16);
      if ((v10 & 1) != 0)
        xpc_retain(*((xpc_object_t *)a3 + 1));
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t XPC_Array::GetDictionary(XPC_Array *this, size_t a2, XPC_Dictionary *a3)
{
  unsigned __int8 v6;
  uint64_t result;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if (*((_QWORD *)a3 + 1))
  {
    v6 = atomic_load((unsigned __int8 *)a3 + 16);
    if ((v6 & 1) != 0)
      xpc_release(*((xpc_object_t *)a3 + 1));
    *((_QWORD *)a3 + 1) = 0;
    atomic_store(0, (unsigned __int8 *)a3 + 16);
  }
  result = *((_QWORD *)this + 1);
  if (result)
  {
    if (xpc_array_get_count((xpc_object_t)result) <= a2)
      return 0;
    result = (uint64_t)xpc_array_get_value(*((xpc_object_t *)this + 1), a2);
    if (!result)
      return result;
    v8 = result;
    if (MEMORY[0x1A85D32E0]() == MEMORY[0x1E0C812F8])
    {
      if (*((_QWORD *)a3 + 1))
      {
        v9 = atomic_load((unsigned __int8 *)a3 + 16);
        if ((v9 & 1) != 0)
          xpc_release(*((xpc_object_t *)a3 + 1));
      }
      *((_QWORD *)a3 + 1) = v8;
      atomic_store(0, (unsigned __int8 *)a3 + 16);
      v10 = atomic_load((unsigned __int8 *)a3 + 16);
      if ((v10 & 1) != 0)
        xpc_retain(*((xpc_object_t *)a3 + 1));
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

char *CAAudioChannelLayout::Create(CAAudioChannelLayout *this)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  std::bad_alloc *exception;
  std::bad_alloc *v10;

  v1 = this;
  v2 = caulk::numeric::exceptional_mul<unsigned int>(this);
  v3 = caulk::numeric::exceptional_add<unsigned int>(v2);
  v4 = (char *)malloc_type_malloc(v3, 0x2C8E6D5CuLL);
  v5 = v4;
  if (v3 && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v10 = std::bad_alloc::bad_alloc(exception);
  }
  bzero(v4, v3);
  if (v5)
  {
    *(_QWORD *)v5 = 0;
    *((_DWORD *)v5 + 2) = v1;
    if (v1)
    {
      v6 = v1;
      v7 = v5 + 16;
      do
      {
        *((_DWORD *)v7 - 1) = -1;
        *v7 = 0;
        v7[1] = 0;
        v7 = (_QWORD *)((char *)v7 + 20);
        --v6;
      }
      while (v6);
    }
  }
  return v5;
}

uint64_t CAAudioChannelLayout::SetAllToUnknown(uint64_t this, AudioChannelLayout *a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = (_DWORD)a2;
  if ((_DWORD)a2)
  {
    v2 = a2;
    v3 = (_QWORD *)(this + 16);
    do
    {
      *((_DWORD *)v3 - 1) = -1;
      *v3 = 0;
      v3[1] = 0;
      v3 = (_QWORD *)((char *)v3 + 20);
      --v2;
    }
    while (v2);
  }
  return this;
}

size_t CAShowAudioChannelLayout(FILE *__stream, _DWORD *a2)
{
  size_t result;
  unsigned int v5;
  float *v6;

  if (!a2)
    return fwrite("\tNULL layout\n", 0xDuLL, 1uLL, __stream);
  fprintf(__stream, "\tTag=0x%X, ", *a2);
  if (*a2 == 0x10000)
    return fprintf(__stream, "Using Bitmap:0x%X\n", a2[1]);
  result = fprintf(__stream, "Num Chan Descs=%d\n", a2[2]);
  if (a2[2])
  {
    v5 = 0;
    v6 = (float *)(a2 + 3);
    do
    {
      fprintf(__stream, "\t\tLabel=%d, Flags=0x%X, ", *(_DWORD *)v6, *((_DWORD *)v6 + 1));
      result = fprintf(__stream, "[az=%f,el=%f,dist=%f]\n", v6[2], v6[3], v6[4]);
      ++v5;
      v6 += 5;
    }
    while (v5 < a2[2]);
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x1E0C98428](theData, range.location, range.length, newBytes, newLength);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C985F8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98810](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x1E0C988E8](center, name, object, userInfo, options);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
  MEMORY[0x1E0C99250](theString, trimString);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1E0C99560]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1E0C80658](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  MEMORY[0x1E0C80660](__list, __new, a3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4220](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x1E0DE43C0](__ns);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4700]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4820](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4828](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1E0DE4838](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
  MEMORY[0x1E0DE4840](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E5424698();
}

void operator delete(void *__p)
{
  off_1E54246A0(__p);
}

uint64_t operator delete()
{
  return off_1E54246A8();
}

uint64_t operator new[]()
{
  return off_1E54246B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E54246B8(__sz);
}

uint64_t operator new()
{
  return off_1E54246C0();
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

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
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

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C30](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

uint64_t dispatch_mig_server()
{
  return MEMORY[0x1E0C82DF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1E0C835C8](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C83C98](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C83D20](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D40](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1E0C84D80](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E30](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C853A8](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1E0C853B0](a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
  MEMORY[0x1E0C8BF50](__Setup);
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
  MEMORY[0x1E0C8BF60](__Setup, __Ir, __Ii, __Or, __Oi);
}

vDSP_DFT_Setup vDSP_DFT_zop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1E0C8BFA0](__Previous, __Length, *(_QWORD *)&__Direction);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1E0C8BFB0](__Previous, __Length, *(_QWORD *)&__Direction);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA50](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x1E0C8CAE8](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A60](*(_QWORD *)&a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C85AB0](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

