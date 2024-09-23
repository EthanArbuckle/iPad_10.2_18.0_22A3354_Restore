id VSGetLogDefault()
{
  if (VSGetLogDefault_onceToken != -1)
    dispatch_once(&VSGetLogDefault_onceToken, &__block_literal_global_109);
  return (id)VSGetLogDefault___profile_log_default;
}

void sub_1DE162074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE166B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1DE16854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1DE1695BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE169CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t VSRecognitionGetTypeID()
{
  pthread_once(&VSRecognitionGetTypeID___VSRecognitionRegisterOnce, (void (*)(void))_VSRecognitionRegisterClass);
  return __VSRecognitionTypeID;
}

uint64_t _VSRecognitionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __VSRecognitionTypeID = result;
  return result;
}

uint64_t _VSRecognitionDestroy(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  void *v9;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(_QWORD *)(a1 + 80);
  if (v3)
  {
    _VSServerConnectionInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 80));
  }
  v4 = *(const void **)(a1 + 88);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 176);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 184);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 136);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 152);
  if (v8)
    CFRelease(v8);
  v9 = *(void **)(a1 + 168);
  if (v9)
    munmap(v9, 4uLL);
  pthread_mutex_unlock(v2);
  return pthread_mutex_destroy(v2);
}

BOOL _VSRecognitionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _VSRecognitionCopyDescription(_QWORD *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<VSRecognition: %p model=%@>"), a1, a1[11]);
}

uint64_t VSRecognitionCreate(const __CFAllocator *a1, const __CFString *a2, __int128 *a3, uint64_t a4)
{
  return _VSRecognitionCreate(a1, a2, 0, a3, a4);
}

uint64_t _VSRecognitionCreate(const __CFAllocator *a1, const __CFString *a2, const void *a3, __int128 *a4, uint64_t a5)
{
  uint64_t Instance;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;

  if (!a2)
    return 0;
  pthread_once(&VSRecognitionGetTypeID___VSRecognitionRegisterOnce, (void (*)(void))_VSRecognitionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v11 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 850045863;
    *(_OWORD *)(Instance + 24) = 0u;
    *(_OWORD *)(Instance + 40) = 0u;
    *(_OWORD *)(Instance + 56) = 0u;
    *(_OWORD *)(Instance + 72) = 0u;
    *(_DWORD *)(Instance + 96) = -1;
    *(_QWORD *)(Instance + 176) = 0;
    *(_QWORD *)(Instance + 88) = CFStringCreateCopy(a1, a2);
    *(_DWORD *)(v11 + 128) = 0;
    *(_QWORD *)(v11 + 136) = 0;
    *(_WORD *)(v11 + 144) = 0;
    *(_QWORD *)(v11 + 160) = 0;
    *(_QWORD *)(v11 + 168) = 0;
    *(_QWORD *)(v11 + 152) = 0;
    v12 = (_OWORD *)(v11 + 104);
    *(_QWORD *)(v11 + 192) = a5;
    if (a4)
    {
      v13 = *a4;
      *(_QWORD *)(v11 + 120) = *((_QWORD *)a4 + 2);
      *v12 = v13;
      if (a3)
      {
LABEL_5:
        *(_QWORD *)(v11 + 184) = a3;
        CFRetain(a3);
        return v11;
      }
    }
    else
    {
      *(_QWORD *)v12 = 0;
      *(_QWORD *)(v11 + 112) = 0;
      *(_QWORD *)(v11 + 120) = 0;
      if (a3)
        goto LABEL_5;
    }
    *(_QWORD *)(v11 + 184) = 0;
  }
  return v11;
}

uint64_t VSRecognitionSetPreferredEngine(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(_DWORD *)(a1 + 128) = a2;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionGetPreferredEngine(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t VSRecognitionSetDebugDumpPath(uint64_t a1, const void *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  const void *v6;
  const __CFAllocator *v7;
  const __CFURL *v8;
  const __CFURL *v9;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) != -1)
    goto LABEL_2;
  v6 = *(const void **)(a1 + 136);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 136) = 0;
  }
  if ((const void *)*MEMORY[0x1E0C9B0D0] != a2)
  {
    if (a2)
    {
      CFRetain(a2);
      *(_QWORD *)(a1 + 136) = a2;
    }
    goto LABEL_10;
  }
  v7 = CFGetAllocator((CFTypeRef)a1);
  v8 = VSLogBundleCreate(v7);
  if (v8)
  {
    v9 = v8;
    *(_QWORD *)(a1 + 136) = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
    CFRelease(v9);
LABEL_10:
    v5 = 1;
    goto LABEL_11;
  }
LABEL_2:
  v5 = 0;
LABEL_11:
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionCopyDebugDumpPath(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;
  uint64_t v4;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(const void **)(a1 + 136);
  if (v3)
  {
    CFRetain(v3);
    v4 = *(_QWORD *)(a1 + 136);
  }
  else
  {
    v4 = 0;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

uint64_t VSRecognitionSetEngineResetRequired(uint64_t a1, char a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(_BYTE *)(a1 + 144) = a2;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionSetAudioInputPath(uint64_t a1, const void *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  const void *v6;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    v6 = *(const void **)(a1 + 152);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 152) = a2;
    if (a2)
      CFRetain(a2);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionSetBluetoothInputAllowed(uint64_t a1, char a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(_BYTE *)(a1 + 145) = a2;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t VSRecognitionPrepare(char *a1, _QWORD *a2)
{
  return _VSRecognitionPrepareAndBegin(a1, 0, a2);
}

uint64_t _VSRecognitionPrepareAndBegin(char *cf, int a2, _QWORD *a3)
{
  uint64_t v3;
  const __CFAllocator *v6;
  int v7;
  const __CFAllocator *v8;
  CFIndex v9;
  _BOOL4 v11;
  uint64_t v13;
  uint64_t v14;
  __CFMachPort *v15;
  __CFMachPort *v16;
  __CFMachPort *v17;
  mach_port_t Port;
  mach_port_t reply_port;
  mach_msg_return_t v20;
  CFErrorRef v21;
  void *v22;
  uint64_t v23;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v25;
  CFTypeRef BinaryXMLData;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  CFIndex Length;
  uint64_t MaximumSizeForEncoding;
  UInt8 *v32;
  mach_port_t v33;
  int v34;
  double v35;
  int v36;
  const UInt8 *BytePtr;
  int v38;
  uint64_t v39;
  void *v40;
  int v42;
  int v43;
  mach_port_t v44;
  int v45;
  const __CFData *theData;
  CFIndex usedBufLen;
  char v48;
  UInt8 buffer[8];
  void *userInfoValues[128];
  mach_msg_header_t userInfoKeys;
  int v52;
  mach_port_t v53;
  __int128 v54;
  void *v55;
  void *v56[3];
  CFRange v57;

  v3 = (uint64_t)a3;
  v56[1] = *(void **)MEMORY[0x1E0C80C00];
  v48 = 1;
  if (a3)
    *a3 = 0;
  usedBufLen = 0;
  v6 = CFGetAllocator(cf);
  pthread_mutex_lock((pthread_mutex_t *)(cf + 16));
  v7 = *((_DWORD *)cf + 24);
  if ((v7 - 1) <= 1)
  {
    if (v3)
    {
      *(_QWORD *)&userInfoKeys.msgh_bits = *MEMORY[0x1E0C9AFB0];
      userInfoValues[0] = CFSTR("recognition is already active");
      v8 = v6;
      v9 = -4000;
LABEL_20:
      v14 = 0;
      *(_QWORD *)v3 = CFErrorCreateWithUserInfoKeysAndValues(v8, CFSTR("VSErrorDomain"), v9, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
      goto LABEL_90;
    }
    goto LABEL_37;
  }
  v11 = a2 == 1 && v7 == 0;
  if (v7 != -1 && !v11)
  {
LABEL_18:
    if (v3)
    {
      v8 = CFGetAllocator(cf);
      *(_QWORD *)&userInfoKeys.msgh_bits = *MEMORY[0x1E0C9AFB0];
      userInfoValues[0] = CFSTR("recognition reuse attempted");
      v9 = -4003;
      goto LABEL_20;
    }
LABEL_37:
    v14 = 0;
    goto LABEL_90;
  }
  v13 = *((_QWORD *)cf + 10);
  if (v13)
  {
    if (v7 == -1)
      goto LABEL_18;
  }
  else
  {
    v13 = _VSServerConnectionCreate(v6, (uint64_t)_VSRecognitionNotificationCallBack, (uint64_t)cf);
    *((_QWORD *)cf + 10) = v13;
    if (!v13)
    {
      if (v3)
      {
        *(_QWORD *)&userInfoKeys.msgh_bits = *MEMORY[0x1E0C9AFB0];
        userInfoValues[0] = CFSTR("couldn't establish connection");
        v8 = v6;
        v9 = -4004;
        goto LABEL_20;
      }
      goto LABEL_37;
    }
  }
  v15 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v13);
  v16 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*((_QWORD *)cf + 10));
  v17 = v16;
  if (v15 && v16)
  {
    if (*((_DWORD *)cf + 24) != -1)
    {
      Port = CFMachPortGetPort(v15);
      v54 = 0u;
      v52 = 1;
      v53 = CFMachPortGetPort(v17);
      DWORD1(v54) = 1245184;
      reply_port = mig_get_reply_port();
      userInfoKeys.msgh_local_port = reply_port;
      *(_QWORD *)&userInfoKeys.msgh_bits = 2147489043;
      userInfoKeys.msgh_remote_port = Port;
      *(_QWORD *)&userInfoKeys.msgh_voucher_port = 0xF54BF00000000;
      if (MEMORY[0x1E0C85B60])
      {
        voucher_mach_msg_set(&userInfoKeys);
        reply_port = userInfoKeys.msgh_local_port;
      }
      v20 = mach_msg(&userInfoKeys, 3, 0x28u, 0x30u, reply_port, 0, 0);
      if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(userInfoKeys.msgh_local_port);
      }
      else if (v20)
      {
        mig_dealloc_reply_port(userInfoKeys.msgh_local_port);
      }
      else if (userInfoKeys.msgh_id != 1004835
             || (userInfoKeys.msgh_bits & 0x80000000) != 0
             || *(_QWORD *)&userInfoKeys.msgh_size != 40
             || (_DWORD)v54)
      {
        mach_msg_destroy(&userInfoKeys);
      }
      else
      {
        v48 = BYTE4(v54);
      }
      goto LABEL_82;
    }
    v23 = *((_QWORD *)cf + 23);
    if (v23)
    {
      DictionaryRepresentation = VSRecognitionDisambiguationContextCreateDictionaryRepresentation(v6, v23);
      if (!DictionaryRepresentation)
      {
        if (v3)
        {
          *(_QWORD *)&userInfoKeys.msgh_bits = *MEMORY[0x1E0C9AFB0];
          userInfoValues[0] = CFSTR("error converting disambiguation context to server");
          *(_QWORD *)v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("VSErrorDomain"), -4007, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
        }
        BinaryXMLData = 0;
        v48 = 0;
        LOBYTE(userInfoKeys.msgh_bits) = 0;
        LOBYTE(userInfoValues[0]) = 0;
        goto LABEL_64;
      }
      v25 = DictionaryRepresentation;
      BinaryXMLData = VSCFPropertyListCreateBinaryXMLData(v6, DictionaryRepresentation);
      CFRelease(v25);
    }
    else
    {
      BinaryXMLData = 0;
    }
    v27 = (const __CFString *)*((_QWORD *)cf + 17);
    if (!v27 || !CFStringGetFileSystemRepresentation(v27, (char *)&userInfoKeys, 1024))
      LOBYTE(userInfoKeys.msgh_bits) = 0;
    v28 = (const __CFString *)*((_QWORD *)cf + 19);
    if (v28)
    {
      if (!CFStringGetFileSystemRepresentation(v28, (char *)userInfoValues, 1024))
      {
        if (v3)
        {
          *(_QWORD *)buffer = *MEMORY[0x1E0C9AFB0];
          v56[0] = CFSTR("error converting audio input path to server");
          *(_QWORD *)v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("VSErrorDomain"), -4007, (const void *const *)buffer, (const void *const *)v56, 1);
        }
        v48 = 0;
LABEL_64:
        v32 = 0;
        usedBufLen = 0;
LABEL_77:
        if (BinaryXMLData)
          CFRelease(BinaryXMLData);
        if (v32 && v32 != buffer)
          free(v32);
LABEL_82:
        if (v48 == 1)
        {
          *((_DWORD *)cf + 24) = a2 != 0;
          v3 = 1;
          goto LABEL_87;
        }
        if (!v3)
          goto LABEL_87;
        if (!*(_QWORD *)v3)
          goto LABEL_32;
        goto LABEL_33;
      }
    }
    else
    {
      LOBYTE(userInfoValues[0]) = 0;
    }
    theData = (const __CFData *)BinaryXMLData;
    v29 = (const __CFString *)*((_QWORD *)cf + 11);
    if (v29)
    {
      Length = CFStringGetLength(v29);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      usedBufLen = MaximumSizeForEncoding;
      if (MaximumSizeForEncoding >= 257)
        v32 = (UInt8 *)malloc_type_malloc(Length, 0xD3D88AF1uLL);
      else
        v32 = buffer;
      v57.location = 0;
      v57.length = Length;
      if (!CFStringGetBytes(*((CFStringRef *)cf + 11), v57, 0x8000100u, 0, 0, v32, MaximumSizeForEncoding, &usedBufLen))
      {
        if (v3)
        {
          v40 = (void *)*MEMORY[0x1E0C9AFB0];
          v55 = CFSTR("error converting model identifier");
          v56[0] = v40;
          *(_QWORD *)v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("VSErrorDomain"), -4007, (const void *const *)v56, (const void *const *)&v55, 1);
        }
        v48 = 0;
        goto LABEL_76;
      }
    }
    else
    {
      v32 = 0;
      usedBufLen = 0;
    }
    v45 = CFMachPortGetPort(v15);
    v33 = CFMachPortGetPort(v17);
    v34 = *((_DWORD *)cf + 32);
    v35 = *((double *)cf + 20);
    v36 = usedBufLen;
    if (theData)
    {
      v43 = *((_DWORD *)cf + 32);
      v44 = v33;
      v42 = usedBufLen;
      BytePtr = CFDataGetBytePtr(theData);
      v38 = CFDataGetLength(theData);
      v39 = (uint64_t)BytePtr;
      v36 = v42;
      v34 = v43;
      v33 = v44;
    }
    else
    {
      v39 = 0;
      v38 = 0;
    }
    remote_VSRecognitionPrepareOrBegin(v45, v33, v34, (char *)&userInfoKeys, (const char *)userInfoValues, (uint64_t)v32, v36, v39, v35, v38, a2 == 0, *((_WORD *)cf + 72), HIBYTE(*((_WORD *)cf + 72)), &v48);
LABEL_76:
    BinaryXMLData = theData;
    goto LABEL_77;
  }
  CFRelease(*((CFTypeRef *)cf + 10));
  *((_QWORD *)cf + 10) = 0;
  if (v3)
  {
    *(_QWORD *)&userInfoKeys.msgh_bits = *MEMORY[0x1E0C9AFB0];
    userInfoValues[0] = CFSTR("connection failure");
    v21 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("VSErrorDomain"), -4004, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
    *(_QWORD *)v3 = v21;
    if (!v21)
    {
LABEL_32:
      v22 = (void *)*MEMORY[0x1E0C9AFB0];
      v55 = CFSTR("recognition request denied");
      v56[0] = v22;
      *(_QWORD *)v3 = CFErrorCreateWithUserInfoKeysAndValues(v6, CFSTR("VSErrorDomain"), -4000, (const void *const *)v56, (const void *const *)&v55, 1);
    }
  }
LABEL_33:
  v3 = 0;
  v14 = 0;
  if (v15)
  {
LABEL_87:
    CFRelease(v15);
    v14 = v3;
  }
  if (v17)
    CFRelease(v17);
LABEL_90:
  pthread_mutex_unlock((pthread_mutex_t *)(cf + 16));
  return v14;
}

void _VSRecognitionNotificationCallBack(int a1, CFStringRef theString1, const __CFDictionary *Mutable, uint64_t a4)
{
  unsigned int v7;
  const void *v8;
  const __CFAllocator *v9;
  CFIndex v10;
  unsigned int v11;
  void (*v12)(uint64_t, _QWORD);
  int v13;
  const __CFAllocator *v14;
  const __CFArray *Value;
  const __CFArray *v16;
  CFIndex Count;
  CFIndex v18;
  CFTypeID TypeID;
  CFIndex v20;
  CFIndex v21;
  NSObject *v22;
  CFErrorRef v23;
  CFIndex v24;
  int v25;
  void *v26;
  const __CFNumber *v27;
  void *v28;
  const void *v29;
  char v30;
  void (*v31)(uint64_t, const __CFDictionary *, CFErrorRef, _QWORD);
  uint64_t valuePtr;
  _BYTE userInfoKeys[12];
  void *userInfoValues[2];
  CFRange v35;

  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  valuePtr = -4001;
  if (!a4)
    return;
  if (CFStringCompare(theString1, CFSTR("note.recog.prepare"), 0) == kCFCompareEqualTo)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    v11 = *(_DWORD *)(a4 + 96);
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v11 > 1)
      return;
    v12 = *(void (**)(uint64_t, _QWORD))(a4 + 104);
    if (!v12)
      return;
LABEL_17:
    v12(a4, *(_QWORD *)(a4 + 192));
    return;
  }
  if (CFStringCompare(theString1, CFSTR("note.recog.start"), 0) == kCFCompareEqualTo)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    v13 = *(_DWORD *)(a4 + 96);
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v13 != 1)
      return;
    v12 = *(void (**)(uint64_t, _QWORD))(a4 + 112);
    if (!v12)
      return;
    goto LABEL_17;
  }
  if (CFStringCompare(theString1, CFSTR("note.recog.results"), 0) == kCFCompareEqualTo)
  {
    if (Mutable)
    {
      v14 = CFGetAllocator((CFTypeRef)a4);
      Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("key.recog.results"));
      if (!Value
        || (v16 = Value, Count = CFArrayGetCount(Value), Count < 1)
        || (v18 = Count, TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(v16)))
      {
        v23 = 0;
        Mutable = 0;
        goto LABEL_30;
      }
      Mutable = CFArrayCreateMutable(v14, 0, MEMORY[0x1E0C9B378]);
      v35.location = 0;
      v35.length = v18;
      CFArrayApplyFunction(v16, v35, (CFArrayApplierFunction)_ConvertSingleRecognitionResultDictionaryRepresentation, Mutable);
      if (Mutable)
      {
        v20 = CFArrayGetCount(Mutable);
        v21 = v18 - v20;
        if (v18 != v20)
        {
          v22 = VSGetLogDefault();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)userInfoKeys = 134217984;
            *(_QWORD *)&userInfoKeys[4] = v21;
            _os_log_error_impl(&dword_1DE15E000, v22, OS_LOG_TYPE_ERROR, "Failed to convert %ld recognition results\n", userInfoKeys, 0xCu);
          }
        }
      }
    }
    v23 = 0;
LABEL_30:
    v25 = 2;
    goto LABEL_37;
  }
  if (CFStringCompare(theString1, CFSTR("note.recog.cancel"), 0) == kCFCompareEqualTo)
  {
    v9 = CFGetAllocator((CFTypeRef)a4);
    *(_QWORD *)userInfoKeys = *MEMORY[0x1E0C9AFB0];
    userInfoValues[0] = CFSTR("recognition cancelled");
    v10 = -4002;
    goto LABEL_28;
  }
  if (CFStringCompare(theString1, CFSTR("note.recog.error"), 0) == kCFCompareEqualTo)
  {
    if (Mutable)
    {
      v26 = (void *)CFDictionaryGetValue(Mutable, CFSTR("key.recog.errordesc"));
      v27 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("key.recog.errorcode"));
      if (v27)
        CFNumberGetValue(v27, kCFNumberCFIndexType, &valuePtr);
    }
    else
    {
      v26 = 0;
    }
    v9 = CFGetAllocator((CFTypeRef)a4);
    v10 = valuePtr;
    *(_QWORD *)userInfoKeys = *MEMORY[0x1E0C9AFB0];
    userInfoValues[0] = v26;
    v24 = v26 != 0;
    goto LABEL_36;
  }
  if (CFStringCompare(theString1, CFSTR("note.server.died"), 0) == kCFCompareEqualTo)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
    v7 = *(_DWORD *)(a4 + 96);
    v8 = *(const void **)(a4 + 80);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a4 + 80) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
    if (v7 <= 1)
    {
      v9 = CFGetAllocator((CFTypeRef)a4);
      *(_QWORD *)userInfoKeys = *MEMORY[0x1E0C9AFB0];
      userInfoValues[0] = CFSTR("connection lost");
      v10 = -4004;
LABEL_28:
      v24 = 1;
LABEL_36:
      v23 = CFErrorCreateWithUserInfoKeysAndValues(v9, CFSTR("VSErrorDomain"), v10, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v24);
      Mutable = 0;
      v25 = -1;
LABEL_37:
      pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
      *(_DWORD *)(a4 + 96) = v25;
      v28 = *(void **)(a4 + 168);
      if (v28)
        munmap(v28, 4uLL);
      v29 = *(const void **)(a4 + 176);
      if (Mutable)
      {
        if (v29)
          CFRelease(v29);
        *(_QWORD *)(a4 + 176) = Mutable;
      }
      else
      {
        Mutable = *(const __CFDictionary **)(a4 + 176);
        if (!v29)
        {
          v30 = 1;
          goto LABEL_45;
        }
      }
      CFRetain(Mutable);
      v30 = 0;
LABEL_45:
      pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
      v31 = *(void (**)(uint64_t, const __CFDictionary *, CFErrorRef, _QWORD))(a4 + 120);
      if (v31)
        v31(a4, Mutable, v23, *(_QWORD *)(a4 + 192));
      if ((v30 & 1) == 0)
        CFRelease(Mutable);
      if (v23)
        CFRelease(v23);
    }
  }
}

void _ConvertSingleRecognitionResultDictionaryRepresentation(const __CFDictionary *a1, void *a2)
{
  CFTypeID TypeID;
  int v5;
  _QWORD *v6;
  const void *v7;

  if (a1)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      v5 = CFGetAllocator(a2);
      v6 = VSRecognitionResultCreateFromDictionaryRepresentation(v5, a1);
      if (v6)
      {
        v7 = v6;
        CFArrayAppendValue((CFMutableArrayRef)a2, v6);
        CFRelease(v7);
      }
    }
  }
}

uint64_t VSRecognitionBegin(char *a1, _QWORD *a2)
{
  return _VSRecognitionPrepareAndBegin(a1, 1, a2);
}

BOOL VSRecognitionCancel(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v4;
  __CFMachPort *v5;
  __CFMachPort *v6;
  __CFMachPort *v7;
  mach_port_t Port;
  mach_msg_return_t v9;
  _BOOL8 v10;
  CFIndex v11;
  const __CFAllocator *v12;
  CFErrorRef v13;
  _BYTE msg[28];
  mach_port_t v16;
  int v17;
  int v18;
  void *userInfoValues[2];

  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  if (a2)
    *a2 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 80);
  if (!v4 || *(_DWORD *)(a1 + 96) > 1u)
  {
    v10 = 1;
    goto LABEL_21;
  }
  v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(_QWORD *)(a1 + 80));
  v7 = v6;
  if (v5 && v6)
  {
    Port = CFMachPortGetPort(v5);
    v17 = 0;
    *(_OWORD *)&msg[4] = 0u;
    v16 = CFMachPortGetPort(v7);
    v18 = 1245184;
    *(_DWORD *)msg = -2147483629;
    *(_DWORD *)&msg[8] = Port;
    *(_QWORD *)&msg[20] = 0x1000F54C2;
    if (MEMORY[0x1E0C85B60])
      voucher_mach_msg_set((mach_msg_header_t *)msg);
    v9 = mach_msg((mach_msg_header_t *)msg, 1, 0x28u, 0, 0, 0, 0);
    v10 = v9 == 0;
    if (!a2 || !v9)
      goto LABEL_17;
    v11 = -4001;
  }
  else
  {
    if (!a2)
    {
      v10 = 0;
      goto LABEL_17;
    }
    v11 = -4004;
  }
  v12 = CFGetAllocator((CFTypeRef)a1);
  *(_QWORD *)msg = *MEMORY[0x1E0C9AFB0];
  userInfoValues[0] = 0;
  v13 = CFErrorCreateWithUserInfoKeysAndValues(v12, CFSTR("VSErrorDomain"), v11, (const void *const *)msg, (const void *const *)userInfoValues, 0);
  v10 = 0;
  *a2 = v13;
LABEL_17:
  *(_DWORD *)(a1 + 96) = -1;
  _VSServerConnectionInvalidate(*(_QWORD *)(a1 + 80));
  CFRelease(*(CFTypeRef *)(a1 + 80));
  *(_QWORD *)(a1 + 80) = 0;
  if (v5)
    CFRelease(v5);
  if (v7)
    CFRelease(v7);
LABEL_21:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return v10;
}

BOOL VSRecognitionIsActive(uint64_t a1)
{
  return *(_DWORD *)(a1 + 96) == 1;
}

uint64_t VSRecognitionSetInputLevelUpdateInterval(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == -1)
  {
    *(double *)(a1 + 160) = a2;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

float VSRecognitionGetInputLevel(uint64_t a1)
{
  pthread_mutex_t *v2;
  float v3;
  uint64_t v4;
  __CFMachPort *v5;
  __CFMachPort *v6;
  __CFMachPort *v7;
  mach_port_t Port;
  mach_port_t reply_port;
  mach_msg_return_t v10;
  mach_msg_header_t v12;
  int v13;
  mach_port_t v14;
  __int128 v15;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = 0.0;
  if (*(_DWORD *)(a1 + 96) != 1)
    goto LABEL_24;
  v4 = *(_QWORD *)(a1 + 80);
  if (!v4)
    goto LABEL_24;
  v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(_QWORD *)(a1 + 80));
  v7 = v6;
  if (v5 && v6)
  {
    Port = CFMachPortGetPort(v5);
    v13 = 1;
    v15 = 0u;
    v12.msgh_size = 0;
    v14 = CFMachPortGetPort(v7);
    DWORD1(v15) = 1245184;
    reply_port = mig_get_reply_port();
    v12.msgh_remote_port = Port;
    v12.msgh_local_port = reply_port;
    v12.msgh_bits = -2147478253;
    *(_QWORD *)&v12.msgh_voucher_port = 0xF54C000000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&v12);
      reply_port = v12.msgh_local_port;
    }
    v10 = mach_msg(&v12, 3, 0x28u, 0x30u, reply_port, 0, 0);
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v12.msgh_local_port);
    }
    else if (v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
    }
    else if (v12.msgh_id != 1004836
           || (v12.msgh_bits & 0x80000000) != 0
           || v12.msgh_size != 40
           || v12.msgh_remote_port
           || (_DWORD)v15)
    {
      mach_msg_destroy(&v12);
    }
    else
    {
      v3 = *((float *)&v15 + 1);
    }
    goto LABEL_21;
  }
  if (v5)
LABEL_21:
    CFRelease(v5);
  if (v7)
    CFRelease(v7);
LABEL_24:
  pthread_mutex_unlock(v2);
  return v3;
}

float VSRecognitionGetInputLevelDB(uint64_t a1)
{
  pthread_mutex_t *v2;
  float v3;
  uint64_t v4;
  __CFMachPort *v5;
  __CFMachPort *v6;
  __CFMachPort *v7;
  mach_port_t Port;
  mach_port_t reply_port;
  mach_msg_return_t v10;
  mach_msg_header_t v12;
  int v13;
  mach_port_t v14;
  __int128 v15;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = 0.0;
  if (*(_DWORD *)(a1 + 96) != 1)
    goto LABEL_24;
  v4 = *(_QWORD *)(a1 + 80);
  if (!v4)
    goto LABEL_24;
  v5 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
  v6 = (__CFMachPort *)_VSServerConnectionCopyClientPort(*(_QWORD *)(a1 + 80));
  v7 = v6;
  if (v5 && v6)
  {
    Port = CFMachPortGetPort(v5);
    v13 = 1;
    v15 = 0u;
    v12.msgh_size = 0;
    v14 = CFMachPortGetPort(v7);
    DWORD1(v15) = 1245184;
    reply_port = mig_get_reply_port();
    v12.msgh_remote_port = Port;
    v12.msgh_local_port = reply_port;
    v12.msgh_bits = -2147478253;
    *(_QWORD *)&v12.msgh_voucher_port = 0xF54C100000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&v12);
      reply_port = v12.msgh_local_port;
    }
    v10 = mach_msg(&v12, 3, 0x28u, 0x30u, reply_port, 0, 0);
    if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v12.msgh_local_port);
    }
    else if (v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
    }
    else if (v12.msgh_id != 1004837
           || (v12.msgh_bits & 0x80000000) != 0
           || v12.msgh_size != 40
           || v12.msgh_remote_port
           || (_DWORD)v15)
    {
      mach_msg_destroy(&v12);
    }
    else
    {
      v3 = *((float *)&v15 + 1);
    }
    goto LABEL_21;
  }
  if (v5)
LABEL_21:
    CFRelease(v5);
  if (v7)
    CFRelease(v7);
LABEL_24:
  pthread_mutex_unlock(v2);
  return v3;
}

BOOL VSRecognitionIsPrepared(uint64_t a1)
{
  return *(_DWORD *)(a1 + 96) == 0;
}

uint64_t VSRecognitionGetModelIdentifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t VSRecognitionCopyResults(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;
  uint64_t v4;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 96) == 2 && (v3 = *(const void **)(a1 + 176)) != 0)
  {
    CFRetain(v3);
    v4 = *(_QWORD *)(a1 + 176);
  }
  else
  {
    v4 = 0;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

id VSGetLogEvent()
{
  if (VSGetLogEvent_onceToken != -1)
    dispatch_once(&VSGetLogEvent_onceToken, &__block_literal_global_3);
  return (id)VSGetLogEvent___profile_log_event;
}

double VSAbsoluteTimeToSecond(unint64_t a1)
{
  if (VSAbsoluteTimeToSecond_onceToken != -1)
    dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_5);
  return *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)a1;
}

uint64_t _VSServerConnectionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __VSServerConnectionTypeID = result;
  return result;
}

uint64_t _VSServerConnectionDestroy(uint64_t a1)
{
  _VSServerConnectionInvalidate(a1);
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

BOOL _VSServerConnectionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _VSServerConnectionInvalidate(uint64_t a1)
{
  pthread_mutex_t *v2;
  __CFRunLoopSource *v3;
  __CFRunLoopSource *v4;
  const void *v5;
  uint64_t v6;
  __CFMachPort *v7;
  mach_port_t Port;
  mach_port_name_t v9;
  ipc_space_t *v10;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(__CFRunLoopSource **)(a1 + 96);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 96));
    *(_QWORD *)(a1 + 96) = 0;
  }
  v4 = *(__CFRunLoopSource **)(a1 + 104);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    CFRelease(*(CFTypeRef *)(a1 + 104));
    *(_QWORD *)(a1 + 104) = 0;
  }
  v5 = *(const void **)(a1 + 112);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 112) = 0;
  }
  v6 = *(_QWORD *)(a1 + 80);
  if (v6)
  {
    pthread_mutex_lock(&__ServerPortLock);
    if (__ServerInvalidationSet && __ServerPort == v6)
      CFSetRemoveValue((CFMutableSetRef)__ServerInvalidationSet, (const void *)a1);
    pthread_mutex_unlock(&__ServerPortLock);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
  }
  v7 = *(__CFMachPort **)(a1 + 88);
  if (v7)
  {
    CFMachPortSetInvalidationCallBack(v7, 0);
    CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 88));
    Port = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 88));
    if (Port - 1 <= 0xFFFFFFFD)
    {
      v9 = Port;
      v10 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], Port, 1u, -1);
      mach_port_deallocate(*v10, v9);
    }
    CFRelease(*(CFTypeRef *)(a1 + 88));
    *(_QWORD *)(a1 + 88) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t _VSServerConnectionCreate(const __CFAllocator *a1, uint64_t a2, uint64_t a3)
{
  ipc_space_t *v6;
  uint64_t v7;
  uint64_t Instance;
  uint64_t v9;
  CFRunLoopRef Current;
  __CFRunLoopSource *v11;
  ipc_space_t v12;
  mach_port_t Port;
  __CFMachPort *v14;
  CFMachPortRef v15;
  int v16;
  __CFSet *Mutable;
  __CFMachPort *v19;
  __CFRunLoopSource *v20;
  CFRunLoopSourceContext v21;
  CFMachPortContext v22;
  mach_port_name_t name;
  int v24;
  CFMachPortContext context;
  mach_port_t special_port[2];
  mach_port_type_t ptype;

  v6 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  name = 0;
  v7 = *MEMORY[0x1E0C83DA0];
  memset(&v22, 0, sizeof(v22));
  pthread_once(&_VSServerConnectionGetTypeID___VSServerConnectionRegisterOnce, (void (*)(void))_VSServerConnectionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v9 = Instance;
  if (!Instance)
    return v9;
  v24 = 0;
  v21.version = 0;
  memset(&v21.retain, 0, 56);
  v21.info = (void *)Instance;
  v21.perform = (void (__cdecl *)(void *))_VSServerConnectionProcessInvalidation;
  *(_QWORD *)(Instance + 16) = 850045863;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_QWORD *)(Instance + 120) = a2;
  *(_QWORD *)(Instance + 72) = 0;
  *(_QWORD *)(Instance + 80) = 0;
  *(_QWORD *)(Instance + 88) = 0;
  *(_QWORD *)(Instance + 96) = 0;
  *(_QWORD *)(Instance + 104) = CFRunLoopSourceCreate(a1, 0, &v21);
  *(_QWORD *)(v9 + 128) = a3;
  Current = CFRunLoopGetCurrent();
  *(_QWORD *)(v9 + 112) = Current;
  CFRetain(Current);
  v11 = *(__CFRunLoopSource **)(v9 + 104);
  if (v11)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), v11, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), *(CFRunLoopSourceRef *)(v9 + 104), CFSTR("com.apple.voiceservices"));
  }
  ptype = 0x10000;
  v12 = *v6;
  pthread_mutex_lock(&__ServerPortLock);
  if (__ServerPort)
  {
    Port = CFMachPortGetPort((CFMachPortRef)__ServerPort);
    if (Port - 1 > 0xFFFFFFFD || mach_port_type(v12, Port, &ptype) || (ptype & 0x100000) != 0)
    {
      v14 = (__CFMachPort *)__ServerPort;
      pthread_mutex_unlock(&__ServerPortLock);
      _VSServerConnectionServerPortInvalidated(v14);
      pthread_mutex_lock(&__ServerPortLock);
    }
    v15 = (CFMachPortRef)__ServerPort;
    if (__ServerPort)
    {
      v16 = 0;
LABEL_16:
      CFRetain(v15);
      Mutable = (__CFSet *)__ServerInvalidationSet;
      if (!__ServerInvalidationSet)
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
        __ServerInvalidationSet = (uint64_t)Mutable;
      }
      CFSetAddValue(Mutable, (const void *)v9);
      goto LABEL_19;
    }
  }
  *(_QWORD *)special_port = 0;
  memset(&context, 0, sizeof(context));
  task_get_special_port(v12, 4, &special_port[1]);
  if (special_port[1] && !bootstrap_look_up(special_port[1], "com.apple.voiced", special_port))
  {
    v15 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E0C9AE00], special_port[0], (CFMachPortCallBack)_VSServerConnectionPortEmptyCallback, &context, 0);
    __ServerPort = (uint64_t)v15;
    v16 = 1;
    if (v15)
      goto LABEL_16;
  }
  else
  {
    v16 = 0;
    v15 = (CFMachPortRef)__ServerPort;
    if (__ServerPort)
      goto LABEL_16;
  }
LABEL_19:
  pthread_mutex_unlock(&__ServerPortLock);
  if (v16 && v15)
  {
    CFMachPortSetInvalidationCallBack(v15, (CFMachPortInvalidationCallBack)_VSServerConnectionServerPortInvalidated);
  }
  else if (!v15)
  {
LABEL_25:
    *(_QWORD *)(v9 + 80) = v15;
    *(_QWORD *)(v9 + 88) = 0;
LABEL_26:
    CFRelease((CFTypeRef)v9);
    return 0;
  }
  if (mach_port_allocate(v7, 1u, &name) || mach_port_insert_right(v7, name, name, 0x14u))
    goto LABEL_25;
  v22.info = (void *)v9;
  v19 = CFMachPortCreateWithPort(a1, name, (CFMachPortCallBack)_VSServerConnectionPortEmptyCallback, &v22, 0);
  v24 = 16;
  MEMORY[0x1DF0E9204](v7, name, 1, &v24, 1);
  *(_QWORD *)(v9 + 80) = v15;
  *(_QWORD *)(v9 + 88) = v19;
  if (!v19)
    goto LABEL_26;
  CFMachPortGetPort(v19);
  v20 = (__CFRunLoopSource *)CPCreateMIGServerSourceWithContext();
  *(_QWORD *)(v9 + 96) = v20;
  if (v20)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), v20, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRunLoopAddSource(*(CFRunLoopRef *)(v9 + 112), *(CFRunLoopSourceRef *)(v9 + 96), CFSTR("com.apple.voiceservices"));
  }
  return v9;
}

uint64_t _VSServerConnectionProcessInvalidation(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, const __CFString *, _QWORD, _QWORD))(a1 + 120))(a1, CFSTR("note.server.died"), 0, *(_QWORD *)(a1 + 128));
}

void _VSServerConnectionServerPortInvalidated(__CFMachPort *a1)
{
  const __CFSet *v2;
  mach_port_t Port;

  pthread_mutex_lock(&__ServerPortLock);
  if ((__CFMachPort *)__ServerPort == a1)
  {
    v2 = (const __CFSet *)__ServerInvalidationSet;
    __ServerInvalidationSet = 0;
    __ServerPort = 0;
    pthread_mutex_unlock(&__ServerPortLock);
    if (a1)
    {
      CFMachPortSetInvalidationCallBack(a1, 0);
      CFMachPortInvalidate(a1);
      Port = CFMachPortGetPort(a1);
      if (Port - 1 <= 0xFFFFFFFD)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], Port);
      CFRelease(a1);
    }
    if (v2)
    {
      CFSetApplyFunction(v2, (CFSetApplierFunction)_InvalidateSingleConnection, 0);
      CFRelease(v2);
    }
  }
  else
  {
    pthread_mutex_unlock(&__ServerPortLock);
  }
}

uint64_t _InvalidateSingleConnection(uint64_t result)
{
  uint64_t v1;
  pthread_mutex_t *v2;
  const void *v3;
  __CFRunLoopSource *v4;

  if (result)
  {
    v1 = result;
    v2 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    v3 = *(const void **)(v1 + 80);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(v1 + 80) = 0;
    }
    v4 = *(__CFRunLoopSource **)(v1 + 104);
    if (v4)
    {
      if (*(_QWORD *)(v1 + 112))
      {
        CFRunLoopSourceSignal(v4);
        CFRunLoopWakeUp(*(CFRunLoopRef *)(v1 + 112));
      }
    }
    return pthread_mutex_unlock(v2);
  }
  return result;
}

const void *_VSServerConnectionCopyServerPort(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(const void **)(a1 + 80);
  if (v3)
    CFRetain(v3);
  pthread_mutex_unlock(v2);
  return v3;
}

const void *_VSServerConnectionCopyClientPort(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = *(const void **)(a1 + 88);
  if (v3)
    CFRetain(v3);
  pthread_mutex_unlock(v2);
  return v3;
}

void client_VSPostNotification(const char *a1, const UInt8 *a2, unsigned int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  const __CFString *v10;
  const void *v11;
  const __CFData *v12;
  const __CFData *v13;
  CFPropertyListRef v14;
  CFTypeID v15;

  v6 = (_QWORD *)CPGetContextForCalloutCurrentMIGServerSource();
  if (v6)
  {
    v7 = v6;
    if (v6[15])
    {
      v8 = CFGetAllocator(v6);
      v9 = CFStringCreateWithCString(v8, a1, 0x8000100u);
      if (v9)
      {
        v10 = v9;
        if (CFStringGetLength(v9))
        {
          v11 = 0;
          if (!a2 || !a3)
            goto LABEL_13;
          v12 = CFDataCreateWithBytesNoCopy(v8, a2, a3, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
          if (v12)
          {
            v13 = v12;
            v14 = VSCFPropertyListCreateFromBinaryXMLData(v8, v12);
            v11 = v14;
            if (v14)
            {
              v15 = CFGetTypeID(v14);
              if (v15 != CFDictionaryGetTypeID())
              {
                CFRelease(v11);
                v11 = 0;
              }
            }
            CFRelease(v13);
            goto LABEL_13;
          }
        }
        v11 = 0;
LABEL_13:
        ((void (*)(_QWORD *, const __CFString *, const void *, _QWORD))v7[15])(v7, v10, v11, v7[16]);
        CFRelease(v10);
        if (v11)
          CFRelease(v11);
      }
    }
  }
}

const __CFURL *VSLogBundleCreate(const __CFAllocator *a1)
{
  const __CFURL *v2;
  __CFDateFormatter *v3;
  BOOL v4;
  CFAbsoluteTime Current;
  const __CFString *StringWithAbsoluteTime;
  const __CFString *v7;
  CFURLRef v8;
  const __CFURL *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  uint64_t v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  __CFArray *MutableCopy;
  const __CFArray *v17;
  const __CFString *PathComponent;
  const __CFString *v19;
  const __CFURL *v20;
  const __CFAllocator *v21;
  const __CFURL *v22;
  const __CFURL *v23;
  char v25;
  UInt8 buffer[1024];
  _QWORD valuePtr[129];
  CFRange v28;
  CFRange v29;

  valuePtr[128] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
  v2 = (const __CFURL *)__MainDirectory;
  v3 = (__CFDateFormatter *)__DateFormatter;
  if (__MainDirectory)
    v4 = __DateFormatter == 0;
  else
    v4 = 1;
  if (v4)
    return 0;
  Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(a1, v3, Current);
  if (!StringWithAbsoluteTime)
    return 0;
  v7 = StringWithAbsoluteTime;
  v8 = CFURLCreateCopyAppendingPathComponent(a1, v2, StringWithAbsoluteTime, 1u);
  v9 = v8;
  if (v8)
  {
    if (VSDirectoryExistsAtURL((uint64_t)v8, 1, &v25)
      || VSCreateDirectory(v2) && VSDirectoryExistsAtURL((uint64_t)v9, 1, &v25))
    {
      pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
      v10 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(__MainDirectory, 0);
      v11 = v10;
      if (v10)
        Count = CFArrayGetCount(v10);
      else
        Count = 0;
      v13 = 25;
      valuePtr[0] = 25;
      v14 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("MaxLogCount"), CFSTR("com.apple.voiceservices"));
      if (v14)
      {
        v15 = v14;
        CFNumberGetValue(v14, kCFNumberCFIndexType, valuePtr);
        if (valuePtr[0] <= 24)
          valuePtr[0] = 25;
        CFRelease(v15);
        v13 = valuePtr[0];
      }
      if (Count > v13)
      {
        MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v11);
        if (MutableCopy)
        {
          v17 = MutableCopy;
          v28.location = 0;
          v28.length = Count;
          CFArraySortValues(MutableCopy, v28, (CFComparatorFunction)_CompareURLsByModificationDate, 0);
          v29.length = Count - valuePtr[0];
          v29.location = 0;
          CFArrayApplyFunction(v17, v29, (CFArrayApplierFunction)_DeleteLogURL, 0);
          CFRelease(v17);
        }
      }
      if (v11)
        CFRelease(v11);
      if (v25)
      {
        PathComponent = CFURLCopyLastPathComponent(v9);
        if (PathComponent)
        {
          v19 = PathComponent;
          if (CFStringGetFileSystemRepresentation(PathComponent, (char *)valuePtr, 1024))
          {
            pthread_once(&_VSLogBundleGetMainDirectoryURL___CreateMainDirectoryOnce, _VSLogBundleCreateMainLogDirectory);
            v20 = (const __CFURL *)__MainDirectory;
            if (__MainDirectory)
            {
              v21 = CFGetAllocator(v9);
              v22 = CFURLCreateCopyAppendingPathComponent(v21, v20, CFSTR("Latest.vslog"), 0);
              if (v22)
              {
                v23 = v22;
                if (CFURLGetFileSystemRepresentation(v22, 1u, buffer, 1024))
                {
                  unlink((const char *)buffer);
                  symlink((const char *)valuePtr, (const char *)buffer);
                }
                CFRelease(v23);
              }
            }
          }
          CFRelease(v19);
        }
      }
    }
    else
    {
      CFRelease(v9);
      v9 = 0;
    }
  }
  CFRelease(v7);
  return v9;
}

void _VSLogBundleCreateMainLogDirectory()
{
  const __CFLocale *v0;
  __CFDateFormatter *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  CFTypeRef v4;
  CFTypeRef cf;
  CFTypeRef v6;

  v0 = CFLocaleCopyCurrent();
  cf = 0;
  v6 = 0;
  v4 = 0;
  v1 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  __DateFormatter = (uint64_t)v1;
  if (v1)
    CFDateFormatterSetFormat(v1, CFSTR("yyyy-MM-dd-HH-mm-ss'.vslog'"));
  if (v0)
    CFRelease(v0);
  v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    v3 = v2;
    if (VSCreateURLAndDirectory(v2, CFSTR("Library"), (const __CFURL **)&v6) && v6)
    {
      if (VSCreateURLAndDirectory((CFURLRef)v6, CFSTR("Logs"), (const __CFURL **)&v4) && v4)
      {
        if (VSCreateURLAndDirectory((CFURLRef)v4, CFSTR("CrashReporter"), (const __CFURL **)&cf) && cf)
        {
          VSCreateURLAndDirectory((CFURLRef)cf, CFSTR("VoiceServicesRecognition"), (const __CFURL **)&__MainDirectory);
          CFRelease(cf);
        }
        if (v4)
          CFRelease(v4);
      }
      if (v6)
        CFRelease(v6);
    }
    CFRelease(v3);
  }
}

uint64_t _CompareURLsByModificationDate(void *a1, void *a2)
{
  const __CFDate *v3;
  const __CFDate *v4;
  const __CFDate *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  v3 = (const __CFDate *)VSCopyModificationDateForFileAtURL(a1);
  v4 = (const __CFDate *)VSCopyModificationDateForFileAtURL(a2);
  v5 = v4;
  if (v3 && v4)
  {
    v6 = CFDateCompare(v3, v4, 0);
  }
  else if (!v3 || v4)
  {
    if (v4)
      v7 = v3 == 0;
    else
      v7 = 0;
    v8 = v7;
    v6 = v8 << 63 >> 63;
    if (!v3)
      goto LABEL_15;
  }
  else
  {
    v6 = 1;
  }
  CFRelease(v3);
LABEL_15:
  if (v5)
    CFRelease(v5);
  return v6;
}

uint64_t _DeleteLogURL(uint64_t a1)
{
  VSCFURLDeleteDirectoryContents(a1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a1, 0);
}

CFURLRef VSLogBundleCreateFromPath(const __CFAllocator *a1, const __CFString *a2)
{
  CFURLRef v2;
  CFURLRef v3;

  v2 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 1u);
  v3 = v2;
  if (v2 && !VSDirectoryExistsAtURL((uint64_t)v2, 1, 0))
  {
    CFRelease(v3);
    return 0;
  }
  return v3;
}

const __CFURL *VSLogBundleCopyPath(const __CFURL *result)
{
  if (result)
    return (const __CFURL *)CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
  return result;
}

CFTypeRef VSLogBundleCopyURL(CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  return cf;
}

const __CFURL *VSLogBundleCopyPathForFile(const __CFURL *a1, const __CFString *a2, int a3)
{
  const __CFURL *result;
  const __CFURL *v4;
  CFStringRef v5;

  result = VSLogBundleCopyURLForFile(a1, a2, a3);
  if (result)
  {
    v4 = result;
    v5 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v4);
    return (const __CFURL *)v5;
  }
  return result;
}

CFURLRef VSLogBundleCopyURLForFile(const __CFURL *cf, const __CFString *a2, int a3)
{
  const __CFURL *v3;
  const __CFAllocator *v6;
  __CFDateFormatter *v7;
  CFAbsoluteTime Current;
  const __CFString *StringWithAbsoluteTime;
  const __CFString *v10;
  __CFString *MutableCopy;
  __CFString *v12;

  v3 = cf;
  if (!cf)
    return v3;
  v6 = CFGetAllocator(cf);
  if (a3)
  {
    pthread_once(&VSLogBundleCopyURLForFile___CreateTimeFormatterOnce, _VSLogBundleCreateTimeFormatter);
    v7 = (__CFDateFormatter *)__TimeFormatter;
    if (__TimeFormatter)
    {
      Current = CFAbsoluteTimeGetCurrent();
      StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v6, v7, Current);
      if (StringWithAbsoluteTime)
      {
        v10 = StringWithAbsoluteTime;
        MutableCopy = CFStringCreateMutableCopy(v6, 0, StringWithAbsoluteTime);
        v12 = MutableCopy;
        if (MutableCopy)
        {
          CFStringAppend(MutableCopy, a2);
          a2 = v12;
        }
        CFRelease(v10);
        v3 = CFURLCreateCopyAppendingPathComponent(v6, v3, a2, 0);
        if (v12)
          CFRelease(v12);
        return v3;
      }
    }
  }
  return CFURLCreateCopyAppendingPathComponent(v6, v3, a2, 0);
}

void _VSLogBundleCreateTimeFormatter()
{
  const __CFLocale *v0;
  __CFDateFormatter *v1;

  v0 = CFLocaleCopyCurrent();
  v1 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  __TimeFormatter = (uint64_t)v1;
  if (v0)
  {
    CFRelease(v0);
    v1 = (__CFDateFormatter *)__TimeFormatter;
  }
  if (v1)
    CFDateFormatterSetFormat(v1, CFSTR("HH-mm-ss-"));
}

uint64_t VSRecognitionResultGetTypeID()
{
  pthread_once(&VSRecognitionResultGetTypeID___VSRecognitionResultRegisterOnce, (void (*)(void))_VSRecognitionResultRegisterClass);
  return __VSRecognitionResultTypeID;
}

uint64_t _VSRecognitionResultRegisterClass()
{
  __VSRecognitionResultTypeID = _CFRuntimeRegisterClass();
  return _CFRuntimeBridgeClasses();
}

void _VSRecognitionResultDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = (const void *)a1[2];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[4];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
}

BOOL _VSRecognitionResultEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

__CFString *_VSRecognitionResultCopyDescription(uint64_t a1)
{
  return VSRecognitionResultCopyDescriptionWithIndent(a1, 0);
}

__CFString *VSRecognitionResultCopyDescriptionWithIndent(uint64_t a1, uint64_t a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v6;
  const __CFAllocator *v7;
  __CFString *Mutable;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFArray *v11;
  CFIndex v12;
  uint64_t v13;
  CFIndex j;
  const __CFString *v15;
  const __CFString *v16;

  v3 = *(const __CFArray **)(a1 + 24);
  if (!v3)
    return 0;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
    return 0;
  v6 = Count;
  v7 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v7, 0);
  for (i = 0; i != v6; ++i)
  {
    if (i)
      CFStringAppend(Mutable, CFSTR(" + "));
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 24), i);
    CFStringAppend(Mutable, ValueAtIndex);
  }
  CFStringAppend(Mutable, CFSTR("\n"));
  v11 = *(const __CFArray **)(a1 + 16);
  if (v11)
  {
    v12 = CFArrayGetCount(v11);
    if (v12)
    {
      v13 = v12;
      if (a2 >= 1)
      {
        do
        {
          CFStringAppend(Mutable, CFSTR(" "));
          --a2;
        }
        while (a2);
      }
      if (v13 >= 1)
      {
        for (j = 0; j != v13; ++j)
        {
          if (j)
            v15 = CFSTR(" + ");
          else
            v15 = CFSTR("  (");
          CFStringAppend(Mutable, v15);
          v16 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), j);
          CFStringAppend(Mutable, v16);
        }
        CFStringAppendFormat(Mutable, 0, CFSTR(") <%@>"), *(_QWORD *)(a1 + 32));
      }
    }
  }
  return Mutable;
}

_QWORD *VSRecognitionResultCreate(int a1, const void *a2, const void *a3, const __CFArray *a4)
{
  return VSRecognitionResultCreateWithHandlerInfo(a1, a2, a3, a4, 0);
}

_QWORD *VSRecognitionResultCreateWithHandlerInfo(int a1, const void *a2, const void *a3, CFArrayRef theArray, const void *a5)
{
  _QWORD *v5;
  CFIndex Count;
  uint64_t Instance;

  v5 = 0;
  if (a3 && theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount((CFArrayRef)a3))
    {
      pthread_once(&VSRecognitionResultGetTypeID___VSRecognitionResultRegisterOnce, (void (*)(void))_VSRecognitionResultRegisterClass);
      Instance = _CFRuntimeCreateInstance();
      v5 = (_QWORD *)Instance;
      if (Instance)
      {
        *(_QWORD *)(Instance + 16) = a3;
        CFRetain(a3);
        v5[3] = theArray;
        CFRetain(theArray);
        v5[4] = a2;
        if (a2)
          CFRetain(a2);
        v5[5] = a5;
        if (a5)
          CFRetain(a5);
        v5[6] = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

_QWORD *VSRecognitionResultCreateFromDictionaryRepresentation(int a1, CFDictionaryRef theDict)
{
  const void *Value;
  const __CFArray *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID v11;

  Value = CFDictionaryGetValue(theDict, CFSTR("classes"));
  v5 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("phrases"));
  v6 = CFDictionaryGetValue(theDict, CFSTR("modelid"));
  v7 = CFDictionaryGetValue(theDict, CFSTR("handler"));
  if (v5
    && Value
    && v6
    && (v8 = v7, v9 = CFGetTypeID(v5), v9 == CFArrayGetTypeID())
    && (v10 = CFGetTypeID(Value), v10 == CFArrayGetTypeID())
    && (v11 = CFGetTypeID(v6), v11 == CFStringGetTypeID()))
  {
    return VSRecognitionResultCreateWithHandlerInfo(a1, v6, Value, v5, v8);
  }
  else
  {
    return 0;
  }
}

uint64_t VSRecognitionResultGetModelIdentifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

const __CFArray *VSRecognitionResultGetPhraseCount(uint64_t a1)
{
  const __CFArray *result;

  result = *(const __CFArray **)(a1 + 24);
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

const __CFArray *VSRecognitionResultGetPhraseAtIndex(uint64_t a1, CFIndex a2, const __CFArray **a3, const __CFArray **a4)
{
  const __CFArray *result;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  result = *(const __CFArray **)(a1 + 24);
  if (result)
  {
    result = (const __CFArray *)CFArrayGetCount(result);
    if ((uint64_t)result > a2)
    {
      if (a4)
      {
        result = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 24), a2);
        *a4 = result;
      }
      if (a3)
      {
        result = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), a2);
        *a3 = result;
      }
    }
  }
  return result;
}

CFTypeRef *VSRecognitionResultCopyClassIDsAndPhrases(CFTypeRef *result, _QWORD *a2, _QWORD *a3)
{
  CFTypeRef *v4;

  v4 = result;
  if (a2)
  {
    *a2 = result[2];
    result = (CFTypeRef *)CFRetain(result[2]);
  }
  if (a3)
  {
    *a3 = v4[3];
    return (CFTypeRef *)CFRetain(v4[3]);
  }
  return result;
}

uint64_t VSRecognitionResultSetContext(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = a2;
  return result;
}

uint64_t VSRecognitionResultGetContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t VSRecognitionResultGetHandlerInfoString(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

__CFDictionary *VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo(_QWORD *a1, const void *a2)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  v4 = CFGetAllocator(a1);
  Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = Mutable;
  v7 = (const void *)a1[3];
  if (v7)
    CFDictionarySetValue(Mutable, CFSTR("phrases"), v7);
  v8 = (const void *)a1[2];
  if (v8)
    CFDictionarySetValue(v6, CFSTR("classes"), v8);
  v9 = (const void *)a1[4];
  if (v9)
    CFDictionarySetValue(v6, CFSTR("modelid"), v9);
  if (a2)
    CFDictionarySetValue(v6, CFSTR("handler"), a2);
  return v6;
}

__CFDictionary *VSRecognitionResultCreateDictionaryRepresentation(_QWORD *a1)
{
  return VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo(a1, 0);
}

BOOL VSPluginRegistryRebuild(char a1)
{
  uint64_t v2;
  const void *v3;
  __CFMachPort *v4;
  __CFMachPort *v5;
  mach_port_t Port;
  _BOOL8 v7;
  mach_msg_header_t msg;
  uint64_t v10;
  char v11;
  __int16 v12;
  char v13;

  v2 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 0, 0);
  if (!v2)
    return 0;
  v3 = (const void *)v2;
  v4 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v2);
  if (v4)
  {
    v5 = v4;
    Port = CFMachPortGetPort(v4);
    v10 = *MEMORY[0x1E0C804E8];
    v11 = a1;
    v12 = 0;
    v13 = 0;
    *(_QWORD *)&msg.msgh_bits = 19;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1004742;
    msg.msgh_remote_port = Port;
    msg.msgh_local_port = 0;
    if (MEMORY[0x1E0C85B60])
      voucher_mach_msg_set(&msg);
    v7 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0) == 0;
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  _VSServerConnectionInvalidate((uint64_t)v3);
  CFRelease(v3);
  return v7;
}

BOOL VSRecognitionConfigurationCacheUpdate(const __CFString *a1, const __CFString *a2)
{
  uint64_t v4;
  const void *v5;
  __CFMachPort *v6;
  __CFMachPort *v7;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v10;
  UInt8 *v11;
  _BOOL8 v12;
  _BOOL4 v13;
  UInt8 *v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  mach_port_t Port;
  CFIndex v20;
  CFIndex usedBufLen;
  _BYTE msg[28];
  UInt8 *v23;
  int v24;
  int v25;
  UInt8 *v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  UInt8 v33[256];
  UInt8 buffer[256];
  uint64_t v35;
  CFRange v36;
  CFRange v37;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 0, 0);
  if (v4)
  {
    v5 = (const void *)v4;
    v20 = 0;
    usedBufLen = 0;
    v6 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v4);
    if (!v6)
    {
      v12 = 0;
LABEL_28:
      _VSServerConnectionInvalidate((uint64_t)v5);
      CFRelease(v5);
      return v12;
    }
    v7 = v6;
    if (a1)
    {
      Length = CFStringGetLength(a1);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      v10 = MaximumSizeForEncoding;
      usedBufLen = MaximumSizeForEncoding;
      if (MaximumSizeForEncoding >= 257)
        v11 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0x59F980F3uLL);
      else
        v11 = buffer;
      v36.location = 0;
      v36.length = Length;
      v13 = CFStringGetBytes(a1, v36, 0x8000100u, 0, 0, v11, v10, &usedBufLen) != 0;
      if (a2)
      {
LABEL_12:
        v15 = CFStringGetLength(a2);
        v16 = CFStringGetMaximumSizeForEncoding(v15, 0x8000100u);
        v17 = v16;
        v20 = v16;
        if (v16 >= 257)
          v14 = (UInt8 *)malloc_type_malloc(v16, 0x178D8BDBuLL);
        else
          v14 = v33;
        v37.location = 0;
        v37.length = v15;
        if (!CFStringGetBytes(a2, v37, 0x8000100u, 0, 0, v14, v17, &v20))
          goto LABEL_20;
        goto LABEL_16;
      }
    }
    else
    {
      v11 = 0;
      usedBufLen = 0;
      v13 = 1;
      if (a2)
        goto LABEL_12;
    }
    v14 = 0;
    v20 = 0;
LABEL_16:
    if (v13)
    {
      Port = CFMachPortGetPort(v7);
      v23 = v11;
      v24 = 16777472;
      v25 = usedBufLen;
      v26 = v14;
      v27 = 16777472;
      v28 = v20;
      v29 = *MEMORY[0x1E0C804E8];
      v30 = 0;
      v31 = usedBufLen;
      v32 = v20;
      *(_QWORD *)msg = 2147483667;
      *(_DWORD *)&msg[8] = Port;
      *(_OWORD *)&msg[12] = xmmword_1DE1A1940;
      if (MEMORY[0x1E0C85B60])
        voucher_mach_msg_set((mach_msg_header_t *)msg);
      v12 = mach_msg((mach_msg_header_t *)msg, 1, 0x50u, 0, 0, 0, 0) == 0;
      goto LABEL_21;
    }
LABEL_20:
    v12 = 0;
LABEL_21:
    if (v11 && v11 != buffer)
      free(v11);
    if (v14 && v14 != v33)
      free(v14);
    CFRelease(v7);
    goto LABEL_28;
  }
  return 0;
}

const void *VSCopyUpdatableRecognitionModelDataProviderInfos()
{
  const __CFAllocator *v0;
  uint64_t v1;
  const void *v2;
  __CFMachPort *v3;
  __CFMachPort *v4;
  mach_port_t Port;
  mach_port_t reply_port;
  mach_msg_return_t v7;
  const void *v8;
  vm_size_t v9;
  vm_address_t v10;
  const __CFData *v11;
  const __CFData *v12;
  CFPropertyListRef v13;
  CFTypeID v14;
  int msg;
  int msg_4;
  mach_port_t msg_8;
  mach_port_t msg_12;
  _BYTE msg_16[48];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = _VSServerConnectionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 0, 0);
  if (v1)
  {
    v2 = (const void *)v1;
    v3 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v1);
    if (!v3)
    {
      v8 = 0;
LABEL_28:
      _VSServerConnectionInvalidate((uint64_t)v2);
      CFRelease(v2);
      return v8;
    }
    v4 = v3;
    Port = CFMachPortGetPort(v3);
    memset(&msg_16[4], 0, 44);
    msg_4 = 0;
    reply_port = mig_get_reply_port();
    msg_8 = Port;
    msg_12 = reply_port;
    msg = 5395;
    *(_QWORD *)msg_16 = 0xF54C400000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      reply_port = msg_12;
    }
    v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x18u, 0x40u, reply_port, 0, 0);
    if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg_12);
    }
    else if (v7)
    {
      mig_dealloc_reply_port(msg_12);
    }
    else
    {
      if (*(_DWORD *)&msg_16[4] == 1004840
        && msg < 0
        && *(_DWORD *)&msg_16[8] == 1
        && msg_4 == 56
        && !msg_8
        && msg_16[23] == 1)
      {
        v9 = *(unsigned int *)&msg_16[24];
        if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
        {
          v8 = 0;
          v10 = *(_QWORD *)&msg_16[12];
          if (*(_QWORD *)&msg_16[12])
          {
            v11 = CFDataCreateWithBytesNoCopy(v0, *(const UInt8 **)&msg_16[12], *(unsigned int *)&msg_16[24], (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
            if (v11)
            {
              v12 = v11;
              v13 = VSCFPropertyListCreateFromBinaryXMLData(v0, v11);
              v8 = v13;
              if (v13)
              {
                v14 = CFGetTypeID(v13);
                if (v14 != CFDictionaryGetTypeID())
                {
                  CFRelease(v8);
                  v8 = 0;
                }
              }
              CFRelease(v12);
            }
            else
            {
              v8 = 0;
            }
            mig_deallocate(v10, v9);
          }
          goto LABEL_27;
        }
      }
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    v8 = 0;
LABEL_27:
    CFRelease(v4);
    goto LABEL_28;
  }
  return 0;
}

CFStringRef VSRecognitionPluginInfoCreateString(const __CFURL *a1, uint64_t a2)
{
  CFStringRef v3;
  CFStringRef v4;
  CFStringRef v5;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  v3 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@"), a2, v3);
  CFRelease(v4);
  return v5;
}

uint64_t VSRecognitionPluginStringCopyInfo(CFStringRef theString, CFURLRef *a2, CFStringRef *a3)
{
  CFRange v6;
  CFIndex Length;
  uint64_t v8;
  CFIndex v9;
  CFAllocatorRef *v10;
  const __CFAllocator *v11;
  const __CFString *v12;
  const __CFString *v13;
  CFRange v15;
  CFRange v16;

  if (a3)
    *a3 = 0;
  if (a2)
    *a2 = 0;
  if (!theString)
    return 0;
  v6 = CFStringFind(theString, CFSTR(":"), 0);
  if (v6.location == -1)
    return 0;
  Length = CFStringGetLength(theString);
  v8 = 0;
  if (v6.location >= 1)
  {
    v9 = Length - (v6.location + v6.length);
    if (Length > v6.location + v6.length)
    {
      v10 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
      if (a3)
      {
        v15.location = 0;
        v15.length = v6.location;
        *a3 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, v15);
      }
      if (a2
        && (v11 = *v10,
            v16.location = v6.location + v6.length,
            v16.length = v9,
            (v12 = CFStringCreateWithSubstring(*v10, theString, v16)) != 0))
      {
        v13 = v12;
        v8 = 1;
        *a2 = CFURLCreateWithFileSystemPath(v11, v12, kCFURLPOSIXPathStyle, 1u);
        CFRelease(v13);
      }
      else
      {
        return 1;
      }
    }
  }
  return v8;
}

uint64_t VSRecognitionDisambiguationContextGetTypeID()
{
  pthread_once(&VSRecognitionDisambiguationContextGetTypeID___VSRecognitionDisambiguationContextRegisterOnce, (void (*)(void))_VSRecognitionDisambiguationContextRegisterClass);
  return __VSRecognitionDisambiguationContextTypeID;
}

uint64_t _VSRecognitionDisambiguationContextRegisterClass()
{
  __VSRecognitionDisambiguationContextTypeID = _CFRuntimeRegisterClass();
  return _CFRuntimeBridgeClasses();
}

void _VSRecognitionDisambiguationContextDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = (const void *)a1[2];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[4];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[6];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[7];
  if (v7)
    CFRelease(v7);
}

BOOL _VSRecognitionDisambiguationContextEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

__CFString *_VSRecognitionDisambiguationContextDescribe(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  uint64_t v4;
  __CFString *context;
  uint64_t v7;

  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<VSRecognitionDisambiguationContext %p [%@]> "), a1, *(_QWORD *)(a1 + 16));
  CFStringAppendFormat(Mutable, 0, CFSTR(" will disambiguate with sequence tag %@\n"), *(_QWORD *)(a1 + 24));
  v4 = *(_QWORD *)(a1 + 40);
  context = Mutable;
  v7 = v4;
  CFStringAppend(Mutable, CFSTR(" known class values:\n"));
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 32), (CFDictionaryApplierFunction)_AppendKnownValueToString, &context);
  v7 = *(_QWORD *)(a1 + 56);
  CFStringAppend(Mutable, CFSTR(" \nconstrained ambiguous classes:\n"));
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 48), (CFDictionaryApplierFunction)_AppendAmbiguousClassToString, &context);
  return Mutable;
}

void _AppendKnownValueToString(void *key, uint64_t a2, uint64_t a3)
{
  const __CFDictionary *v6;
  const __CFString *Value;
  const __CFString *v8;

  v6 = *(const __CFDictionary **)(a3 + 8);
  if (v6
    && (Value = (const __CFString *)CFDictionaryGetValue(v6, key)) != 0
    && (v8 = Value, CFStringGetLength(Value)))
  {
    CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, CFSTR("  %@ = \"%@\" (%@)\n"), key, a2, v8);
  }
  else
  {
    CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, CFSTR("  %@ = \"%@\"\n"), key, a2);
  }
}

void _AppendAmbiguousClassToString(void *key, const __CFArray *a2, uint64_t a3)
{
  const __CFDictionary *v6;
  const __CFArray *Value;
  CFIndex Count;
  CFIndex i;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  const void *ValueAtIndex;
  const void *v15;
  uint64_t v16;

  v6 = *(const __CFDictionary **)(a3 + 8);
  if (v6)
    Value = (const __CFArray *)CFDictionaryGetValue(v6, key);
  else
    Value = 0;
  Count = CFArrayGetCount(a2);
  CFStringAppendFormat(*(CFMutableStringRef *)a3, 0, CFSTR("  %@ =\n"), key);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      if (Value
        && (v10 = (const __CFString *)CFArrayGetValueAtIndex(Value, i)) != 0
        && (v11 = v10, CFStringGetLength(v10)))
      {
        v12 = *(__CFString **)a3;
        ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
        CFStringAppendFormat(v12, 0, CFSTR("     \"%@\" (%@)\n"), ValueAtIndex, v11);
      }
      else
      {
        v13 = *(__CFString **)a3;
        v15 = CFArrayGetValueAtIndex(a2, i);
        CFStringAppendFormat(v13, 0, CFSTR("     \"%@\"\n"), v15, v16);
      }
    }
  }
}

_QWORD *VSRecognitionDisambiguationContextCreate(int a1, const void *a2, const void *a3, CFDictionaryRef theDict, const void *a5, const void *a6, const void *a7)
{
  _QWORD *Instance;
  CFIndex Count;

  Instance = 0;
  if (a2)
  {
    if (a3)
    {
      if (theDict)
      {
        Count = CFDictionaryGetCount(theDict);
        Instance = 0;
        if (a6)
        {
          if (Count)
          {
            if (CFDictionaryGetCount((CFDictionaryRef)a6))
            {
              pthread_once(&VSRecognitionDisambiguationContextGetTypeID___VSRecognitionDisambiguationContextRegisterOnce, (void (*)(void))_VSRecognitionDisambiguationContextRegisterClass);
              Instance = (_QWORD *)_CFRuntimeCreateInstance();
              Instance[2] = a2;
              CFRetain(a2);
              Instance[3] = a3;
              CFRetain(a3);
              Instance[4] = theDict;
              CFRetain(theDict);
              Instance[5] = a5;
              if (a5)
                CFRetain(a5);
              Instance[6] = a6;
              CFRetain(a6);
              Instance[7] = a7;
              if (a7)
                CFRetain(a7);
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return Instance;
}

_QWORD *VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation(int a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  CFTypeID TypeID;
  CFTypeID v11;
  CFTypeID v12;
  int v13;
  const void *v14;
  const void *v15;
  const __CFDictionary *v16;
  const void *v17;
  const void *v18;
  const void *v19;

  Value = CFDictionaryGetValue(theDict, CFSTR("modelid"));
  v5 = CFDictionaryGetValue(theDict, CFSTR("seqtag"));
  v6 = CFDictionaryGetValue(theDict, CFSTR("known"));
  v7 = CFDictionaryGetValue(theDict, CFSTR("knownp"));
  v8 = CFDictionaryGetValue(theDict, CFSTR("ambig"));
  v9 = CFDictionaryGetValue(theDict, CFSTR("ambigp"));
  TypeID = CFStringGetTypeID();
  v11 = CFDictionaryGetTypeID();
  if (!Value)
    return 0;
  if (!v5)
    return 0;
  if (!v6)
    return 0;
  if (!v8)
    return 0;
  v12 = v11;
  if (CFGetTypeID(Value) != TypeID
    || CFGetTypeID(v5) != TypeID
    || CFGetTypeID(v6) != v12
    || CFGetTypeID(v8) != v12
    || v7 && CFGetTypeID(v7) != v12)
  {
    return 0;
  }
  if (!v9)
  {
    v13 = a1;
    v14 = Value;
    v15 = v5;
    v16 = (const __CFDictionary *)v6;
    v17 = v7;
    v18 = v8;
    v19 = 0;
    return VSRecognitionDisambiguationContextCreate(v13, v14, v15, v16, v17, v18, v19);
  }
  if (CFGetTypeID(v9) != v12)
    return 0;
  v13 = a1;
  v14 = Value;
  v15 = v5;
  v16 = (const __CFDictionary *)v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  return VSRecognitionDisambiguationContextCreate(v13, v14, v15, v16, v17, v18, v19);
}

CFDictionaryRef VSRecognitionDisambiguationContextCreateDictionaryRepresentation(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  CFIndex v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *keys[2];
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1EA8AF6A0;
  v13 = *(_OWORD *)&off_1EA8AF6B0;
  v2 = *(_QWORD *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = v3;
  v14 = xmmword_1EA8AF6C0;
  v7 = *(_OWORD *)(a2 + 16);
  v10 = 0;
  v11 = 0;
  if (v2)
  {
    *(_QWORD *)&v14 = CFSTR("knownp");
    v10 = v2;
    v4 = 5;
  }
  else
  {
    v4 = 4;
  }
  v5 = *(_QWORD *)(a2 + 56);
  if (v5)
  {
    keys[v4] = CFSTR("ambigp");
    *((_QWORD *)&v7 + v4++) = v5;
  }
  return CFDictionaryCreate(a1, (const void **)keys, (const void **)&v7, v4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
}

uint64_t VSRecognitionDisambiguationContextGetModelIdentifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t VSRecognitionDisambiguationContextGetSequenceTag(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValues(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValues(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValue(uint64_t a1, void *key, _QWORD *a3, const void **a4)
{
  uint64_t result;
  const __CFDictionary *v9;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, key);
    if (result)
    {
      if (a3)
        *a3 = result;
      if (a4)
      {
        v9 = *(const __CFDictionary **)(a1 + 40);
        if (v9)
          *a4 = CFDictionaryGetValue(v9, key);
      }
      return 1;
    }
  }
  return result;
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex(uint64_t a1, void *key, CFIndex a3, const void **a4, const void **a5)
{
  uint64_t result;
  const __CFArray *v11;
  const __CFDictionary *v12;
  const __CFArray *Value;

  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, key);
    if (result)
    {
      v11 = (const __CFArray *)result;
      if (CFArrayGetCount((CFArrayRef)result) <= a3)
      {
        return 0;
      }
      else
      {
        if (a4)
          *a4 = CFArrayGetValueAtIndex(v11, a3);
        if (a5)
        {
          v12 = *(const __CFDictionary **)(a1 + 56);
          if (v12)
          {
            Value = (const __CFArray *)CFDictionaryGetValue(v12, key);
            if (Value)
              *a5 = CFArrayGetValueAtIndex(Value, a3);
          }
        }
        return 1;
      }
    }
  }
  return result;
}

CFTypeRef VSCFPropertyListCreateBinaryXMLData(CFAllocatorRef bufferAllocator, const void *a2)
{
  __CFWriteStream *v3;
  __CFWriteStream *v4;
  CFTypeRef v5;

  v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    if (CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0))
      v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
    else
      v5 = 0;
    CFWriteStreamClose(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef VSCFPropertyListCreateFromBinaryXMLData(const __CFAllocator *a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  __CFReadStream *v6;
  __CFReadStream *v7;
  CFPropertyListRef v8;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v6 = CFReadStreamCreateWithBytesNoCopy(a1, BytePtr, Length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v6)
    return 0;
  v7 = v6;
  if (CFReadStreamOpen(v6))
  {
    v8 = CFPropertyListCreateWithStream(a1, v7, 0, 0, 0, 0);
    CFReadStreamClose(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v7);
  return v8;
}

void sub_1DE1718A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  void *v21;

  if (a20 < 0)
    operator delete(__p);

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

uint64_t std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA8AE5A0, MEMORY[0x1E0DE42D0]);
}

void sub_1DE171C20(_Unwind_Exception *a1)
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

CFMutableDictionaryRef VSKeywordIndexCreate(const __CFAllocator *a1)
{
  return CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
}

const void *VSKeywordIndexCreateWithURL(const __CFAllocator *a1, const __CFURL *a2)
{
  __CFReadStream *v3;
  __CFReadStream *v4;
  CFPropertyListRef v5;
  const void *v6;
  CFTypeID v7;

  if (!a2)
    return 0;
  v3 = CFReadStreamCreateWithFile(a1, a2);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFReadStreamOpen(v3))
  {
    v5 = CFPropertyListCreateWithStream(a1, v4, 0, 1uLL, 0, 0);
    v6 = v5;
    if (v5)
    {
      v7 = CFGetTypeID(v5);
      if (v7 != CFDictionaryGetTypeID())
      {
        CFRelease(v6);
        v6 = 0;
      }
    }
    CFReadStreamClose(v4);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

CFURLRef VSKeywordIndexCopyDefaultURL(const __CFAllocator *a1)
{
  uint64_t v2;
  const void *v3;
  __CFMachPort *v4;
  __CFMachPort *v5;
  mach_port_t Port;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  CFURLRef v9;
  BOOL v10;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  _OWORD v16[64];
  int msg;
  int msg_4;
  mach_port_t msg_8;
  mach_port_t msg_12;
  _BYTE msg_16[20];
  _DWORD v22[260];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = _VSServerConnectionCreate(a1, 0, 0);
  if (v2)
  {
    v3 = (const void *)v2;
    memset(v16, 0, 512);
    v4 = (__CFMachPort *)_VSServerConnectionCopyServerPort(v2);
    if (!v4)
    {
      v9 = 0;
LABEL_34:
      _VSServerConnectionInvalidate((uint64_t)v3);
      CFRelease(v3);
      return v9;
    }
    v5 = v4;
    Port = CFMachPortGetPort(v4);
    memset(v22, 0, 476);
    *(_OWORD *)&msg_16[4] = 0u;
    msg_4 = 0;
    reply_port = mig_get_reply_port();
    msg_12 = reply_port;
    msg = 5395;
    msg_8 = Port;
    *(_QWORD *)msg_16 = 0xF54C500000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      reply_port = msg_12;
    }
    v8 = mach_msg((mach_msg_header_t *)&msg, 3, 0x18u, 0x434u, reply_port, 0, 0);
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg_12);
      goto LABEL_32;
    }
    if (v8)
    {
      mig_dealloc_reply_port(msg_12);
      goto LABEL_32;
    }
    if (*(_DWORD *)&msg_16[4] == 71)
    {
      v12 = -308;
      goto LABEL_29;
    }
    if (*(_DWORD *)&msg_16[4] != 1004841)
    {
      v12 = -301;
      goto LABEL_29;
    }
    if ((msg & 0x80000000) == 0)
    {
      if ((msg_4 - 1069) <= 0xFFFFFBFE)
      {
        if (msg_8)
          v10 = 1;
        else
          v10 = *(_DWORD *)&msg_16[16] == 0;
        if (!v10 && msg_4 == 36)
          v12 = *(_DWORD *)&msg_16[16];
        else
          v12 = -300;
        goto LABEL_29;
      }
      if (!msg_8)
      {
        v12 = *(_DWORD *)&msg_16[16];
        if (!*(_DWORD *)&msg_16[16])
        {
          v12 = -300;
          if (v22[1] <= 0x400u && (msg_4 - 44) >= v22[1] && msg_4 == ((v22[1] + 3) & 0xFFFFFFFC) + 44)
          {
            mig_strncpy((char *)v16, (const char *)&v22[2], 1024);
LABEL_30:
            v13 = CFStringCreateWithFileSystemRepresentation(a1, (const char *)v16);
            if (v13)
            {
              v14 = v13;
              v9 = CFURLCreateWithFileSystemPath(a1, v13, kCFURLPOSIXPathStyle, 0);
              CFRelease(v14);
LABEL_33:
              CFRelease(v5);
              goto LABEL_34;
            }
LABEL_32:
            v9 = 0;
            goto LABEL_33;
          }
        }
LABEL_29:
        mach_msg_destroy((mach_msg_header_t *)&msg);
        if (v12)
          goto LABEL_32;
        goto LABEL_30;
      }
    }
    v12 = -300;
    goto LABEL_29;
  }
  return 0;
}

BOOL VSKeywordIndexSaveToURL(const void *a1, const __CFURL *a2)
{
  _BOOL8 v2;
  const __CFAllocator *v5;
  __CFWriteStream *v6;
  __CFWriteStream *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v5 = CFGetAllocator(a1);
    v6 = CFWriteStreamCreateWithFile(v5, a2);
    if (v6)
    {
      v7 = v6;
      if (CFWriteStreamOpen(v6))
      {
        v2 = CFPropertyListWrite(a1, v7, kCFPropertyListBinaryFormat_v1_0, 0, 0) != 0;
        CFWriteStreamClose(v7);
      }
      else
      {
        v2 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void VSKeywordIndexSetKeywordsForClassIdentifier(const __CFDictionary *a1, int a2, void *key, const void *a4, const __CFArray *a5)
{
  __CFDictionary *Value;
  __CFDictionary *v11;
  CFIndex Count;
  _BOOL4 v13;
  const __CFAllocator *v14;
  __CFDictionary *Mutable;
  const void **v16;
  CFTypeID TypeID;
  void *ValueIfType;
  char v19;
  const __CFAllocator *v20;

  Value = (__CFDictionary *)CFDictionaryGetValue(a1, key);
  v11 = Value;
  if (!a5)
  {
    v13 = 1;
    if (!Value)
      return;
    goto LABEL_10;
  }
  Count = CFArrayGetCount(a5);
  v13 = Count == 0;
  if (!v11 && Count)
  {
    v14 = CFGetAllocator(a1);
    Mutable = CFDictionaryCreateMutable(v14, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v11 = Mutable;
    v16 = (const void **)MEMORY[0x1E0C9AE50];
    if (!a2)
      v16 = (const void **)MEMORY[0x1E0C9AE40];
    CFDictionarySetValue(Mutable, CFSTR("top-level"), *v16);
    CFDictionarySetValue(a1, key, v11);
    CFRelease(v11);
    v13 = 0;
  }
  if (v11)
  {
LABEL_10:
    TypeID = CFDictionaryGetTypeID();
    ValueIfType = (void *)VSCFDictionaryGetValueIfType(v11, CFSTR("class-kws"), TypeID);
    if (ValueIfType)
      v19 = 1;
    else
      v19 = v13;
    if ((v19 & 1) == 0)
    {
      v20 = CFGetAllocator(a1);
      ValueIfType = CFDictionaryCreateMutable(v20, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(v11, CFSTR("class-kws"), ValueIfType);
      CFRelease(ValueIfType);
    }
    if (ValueIfType)
    {
      if (v13)
        CFDictionaryRemoveValue((CFMutableDictionaryRef)ValueIfType, a4);
      else
        CFDictionarySetValue((CFMutableDictionaryRef)ValueIfType, a4, a5);
    }
  }
}

void VSKeywordIndexSetKeywordsForModelIdentifier(const __CFDictionary *a1, int a2, void *a3, const __CFArray *a4)
{
  VSKeywordIndexSetKeywordsForClassIdentifier(a1, a2, a3, CFSTR("__model-kws"), a4);
}

CFMutableArrayRef VSKeywordIndexCopyKeywordsForModelIdentifier(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID;
  const __CFDictionary *ValueIfType;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFArray *v9;
  CFMutableArrayRef Mutable;
  const __CFAllocator *v11;

  TypeID = CFDictionaryGetTypeID();
  ValueIfType = (const __CFDictionary *)VSCFDictionaryGetValueIfType(a1, a2, TypeID);
  if (!ValueIfType)
    return 0;
  v6 = (const __CFDictionary *)VSCFDictionaryGetValueIfType(ValueIfType, CFSTR("class-kws"), TypeID);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CFArrayGetTypeID();
  v9 = (const __CFArray *)VSCFDictionaryGetValueIfType(v7, CFSTR("__model-kws"), v8);
  if (v9 && (Mutable = v9, CFArrayGetCount(v9)))
  {
    CFRetain(Mutable);
  }
  else
  {
    v11 = CFGetAllocator(a1);
    Mutable = CFArrayCreateMutable(v11, 0, MEMORY[0x1E0C9B378]);
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)_FoldClassKeywordsIntoArray, Mutable);
  }
  return Mutable;
}

void _FoldClassKeywordsIntoArray(uint64_t a1, const void *a2, __CFArray *a3)
{
  CFTypeID TypeID;
  uint64_t v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  const void *ValueAtIndexIfType;

  TypeID = CFStringGetTypeID();
  if (a2)
  {
    v6 = TypeID;
    v7 = CFGetTypeID(a2);
    if (v7 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)a2);
      if (Count >= 1)
      {
        v9 = Count;
        for (i = 0; i != v9; ++i)
        {
          ValueAtIndexIfType = VSCFArrayGetValueAtIndexIfType((const __CFArray *)a2, i, v6);
          if (ValueAtIndexIfType)
            CFArrayAppendValue(a3, ValueAtIndexIfType);
        }
      }
    }
  }
}

CFMutableArrayRef VSKeywordIndexCopyKeywordsForTopLevelModels(const void *a1)
{
  const __CFAllocator *v2;
  CFMutableArrayRef Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFArrayCreateMutable(v2, 0, MEMORY[0x1E0C9B378]);
  CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)_FoldTopLevelModelKeywordsIntoArray, Mutable);
  return Mutable;
}

void _FoldTopLevelModelKeywordsIntoArray(uint64_t a1, const __CFDictionary *a2, __CFArray *a3)
{
  CFTypeID TypeID;
  uint64_t v6;
  CFTypeID v7;
  const void *ValueIfType;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CFTypeID v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFMutableArrayRef Mutable;

  TypeID = CFDictionaryGetTypeID();
  if (a2)
  {
    v6 = TypeID;
    if (CFGetTypeID(a2) == TypeID)
    {
      v7 = CFBooleanGetTypeID();
      ValueIfType = VSCFDictionaryGetValueIfType(a2, CFSTR("top-level"), v7);
      if (ValueIfType)
      {
        if (CFEqual(ValueIfType, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
        {
          v9 = (const __CFDictionary *)VSCFDictionaryGetValueIfType(a2, CFSTR("class-kws"), v6);
          if (v9)
          {
            v10 = v9;
            v11 = CFArrayGetTypeID();
            v12 = (const __CFArray *)VSCFDictionaryGetValueIfType(v10, CFSTR("__model-kws"), v11);
            if (v12 && (v13 = v12, CFArrayGetCount(v12)))
            {
              CFArrayAppendValue(a3, v13);
            }
            else
            {
              Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
              CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)_FoldClassKeywordsIntoArray, Mutable);
              if (CFArrayGetCount(Mutable))
                CFArrayAppendValue(a3, Mutable);
              CFRelease(Mutable);
            }
          }
        }
      }
    }
  }
}

CFMutableArrayRef VSCFSetCreateMutableArray(const __CFAllocator *a1, CFSetRef theSet, CFIndex a3, const CFArrayCallBacks *a4)
{
  CFMutableArrayRef Mutable;

  if (!theSet || CFSetGetCount(theSet) < 1)
    return 0;
  Mutable = CFArrayCreateMutable(a1, a3, a4);
  CFSetApplyFunction(theSet, (CFSetApplierFunction)_AddSetElementsToArray, Mutable);
  return Mutable;
}

void _AddSetElementsToArray(void *value, CFMutableArrayRef theArray)
{
  if (theArray)
    CFArrayAppendValue(theArray, value);
}

void VSCFSetSendDifferences(const __CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD context[3];

  context[0] = a2;
  context[1] = a3;
  context[2] = a4;
  CFSetApplyFunction(a1, (CFSetApplierFunction)_SendDifferenceElements, context);
}

uint64_t _SendDifferenceElements(uint64_t value, uint64_t *a2)
{
  const void *v3;
  uint64_t (*v4)(const void *, uint64_t);

  if (a2)
  {
    v3 = (const void *)value;
    value = *a2;
    if (!*a2 || (value = CFSetContainsValue((CFSetRef)value, v3), !(_DWORD)value))
    {
      v4 = (uint64_t (*)(const void *, uint64_t))a2[1];
      if (v4)
        return v4(v3, a2[2]);
    }
  }
  return value;
}

const void *VSCFDictionaryGetValueIfType(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const void *result;
  const void *v5;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v5 = result;
    if (CFGetTypeID(result) == a3)
      return v5;
    else
      return 0;
  }
  return result;
}

const void *VSCFArrayGetValueAtIndexIfType(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  const void *result;
  const void *v5;

  result = CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    v5 = result;
    if (CFGetTypeID(result) == a3)
      return v5;
    else
      return 0;
  }
  return result;
}

void __assign_helper_atomic_property_(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v3 = *a2;
  v2 = a2[1];
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v3;
  a1[1] = v2;
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
}

_QWORD *__copy_helper_atomic_property_(_QWORD *result, _QWORD *a2)
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

void sub_1DE172958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DE172E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DE173124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1DE1731F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
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

void std::vector<TTSSynthesizer::Marker>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1DE1738B4()
{
  void *v0;
  void *v1;
  void *v2;
  _Unwind_Exception *v3;

  _Unwind_Resume(v3);
}

void sub_1DE1738D0()
{
  void *v0;
  void *v1;
  void *v2;
  _Unwind_Exception *v3;

  _Unwind_Resume(v3);
}

void sub_1DE1738D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  JUMPOUT(0x1DE1738F0);
}

void sub_1DE173B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint8_t buf,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1DE17429C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;

  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void sub_1DE174608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DE1747AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DE1751B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  _QWORD *v63;
  uint64_t v64;

  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  v63 = *(_QWORD **)(v61 - 120);
  if (v63 == (_QWORD *)(v61 - 144))
  {
    v64 = 4;
    v63 = (_QWORD *)(v61 - 144);
  }
  else
  {
    if (!v63)
      goto LABEL_6;
    v64 = 5;
  }
  (*(void (**)(void))(*v63 + 8 * v64))();
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_1DE17546C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1DE1756AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DE175BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__split_buffer<std::string> *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a12);
  *(_QWORD *)(v13 + 8) = v12;
  _Unwind_Resume(a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2)
    return 1;
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2))
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
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

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0)
        operator delete(*(void **)(v3 - 24));
      v3 -= 24;
    }
  }
  return a1;
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{

  JUMPOUT(0x1DF0E8FC4);
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone()
{
  return 0;
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_1EA8AEE50;
  result = MEMORY[0x1DF0E94A4](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::destroy(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"U13block_pointerFiN14TTSSynthesizer15CallbackMessageEE"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target_type()
{
}

void sub_1DE1762E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DE176364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1DE1763F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFPropertyListRef VSPreferencesCopyValueForKey(const __CFString *a1)
{
  return CFPreferencesCopyAppValue(a1, CFSTR("com.apple.voiceservices"));
}

uint64_t VSPreferencesSetValueForKey(const __CFString *a1, const void *a2)
{
  CFPreferencesSetAppValue(a1, a2, CFSTR("com.apple.voiceservices"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.voiceservices"));
}

void VSPreferencesSetSpokenLanguageIdentifier(const __CFString *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  v3 = v2;
  if (v2 == a1)
    goto LABEL_10;
  if (!a1 || !v2 || CFStringCompare(v2, a1, 0))
  {
    CFPreferencesSetAppValue(CFSTR("lang-id"), a1, CFSTR("com.apple.voiceservices"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voiceservices"));
    pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
    if (__VSPreferencesSpokenLanguage)
      CFRelease((CFTypeRef)__VSPreferencesSpokenLanguage);
    __VSPreferencesSpokenLanguage = (uint64_t)a1;
    if (a1)
      CFRetain(a1);
    ++__VSPreferencesSpokenLanguageChangedCount;
    pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.voiceservices.language"), 0, 0, 1u);
LABEL_10:
    if (!v3)
      return;
  }
  CFRelease(v3);
}

void *VSPreferencesCopySpokenLanguageIdentifier()
{
  void *SpokenLanguageIdentifier;
  void *v1;

  VSPreferencesInitialize();
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  SpokenLanguageIdentifier = _VSPreferencesGetSpokenLanguageIdentifier();
  v1 = SpokenLanguageIdentifier;
  if (SpokenLanguageIdentifier)
    CFRetain(SpokenLanguageIdentifier);
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v1;
}

uint64_t VSPreferencesInitialize()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;

  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  if ((VSPreferencesInitialize___ObservingChanges & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_VSPreferencesSpokenLanguageChangedHandler, CFSTR("com.apple.voiceservices.language"), 0, CFNotificationSuspensionBehaviorDrop);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_VSPreferencesSpokenLanguageChangedHandler, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDrop);
    VSPreferencesInitialize___ObservingChanges = 1;
  }
  return pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
}

void *_VSPreferencesGetSpokenLanguageIdentifier()
{
  void *result;

  result = (void *)__VSPreferencesSpokenLanguage;
  if (!__VSPreferencesSpokenLanguage)
  {
    result = (void *)CFPreferencesCopyAppValue(CFSTR("lang-id"), CFSTR("com.apple.voiceservices"));
    __VSPreferencesSpokenLanguage = (uint64_t)result;
    if (!result)
    {
      result = (void *)_VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences();
      __VSPreferencesSpokenLanguage = (uint64_t)result;
      if (!result)
      {
        result = (void *)_VSPreferencesCopySystemLanguageIdentifier();
        __VSPreferencesSpokenLanguage = (uint64_t)result;
      }
    }
  }
  return result;
}

const void *_VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences()
{
  const void *result;
  const __CFLocale *v1;
  const __CFLocale *v2;
  CFStringRef v3;
  CFStringRef v4;
  __CFSet *v5;
  const __CFURL *v6;
  const __CFURL *v7;

  result = (const void *)__VSPreferencesDefaultSpokenLanguage;
  if (!__VSPreferencesDefaultSpokenLanguage)
  {
    v1 = CFLocaleCopyCurrent();
    if (!v1)
      goto LABEL_14;
    v2 = v1;
    v3 = _VSCopyLanguageIdentifierForLocale(v1);
    __VSPreferencesDefaultSpokenLanguage = (uint64_t)v3;
    if (!v3)
      goto LABEL_11;
    v4 = v3;
    v5 = (__CFSet *)__VSPreferencesValidSpokenLanguageIds;
    if (!__VSPreferencesValidSpokenLanguageIds)
    {
      v5 = _VSCopyAvailableLanguageIdentifiers();
      __VSPreferencesValidSpokenLanguageIds = (uint64_t)v5;
      if (!v5)
        goto LABEL_10;
      v4 = (CFStringRef)__VSPreferencesDefaultSpokenLanguage;
    }
    if (CFSetContainsValue(v5, v4))
    {
      if (__VSPreferencesDefaultSpokenLanguage)
      {
LABEL_13:
        CFRelease(v2);
LABEL_14:
        result = (const void *)__VSPreferencesDefaultSpokenLanguage;
        if (!__VSPreferencesDefaultSpokenLanguage)
          return result;
        goto LABEL_15;
      }
LABEL_11:
      pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
      v6 = CFBundleCopyResourceURL((CFBundleRef)__VSBundle, CFSTR("language_fallbacks.plist"), 0, CFSTR("RecognitionResources/Express"));
      if (v6)
      {
        v7 = v6;
        __VSPreferencesDefaultSpokenLanguage = (uint64_t)_VSCopyFallbackLanguageIdentifierForLocale(v2, v6);
        CFRelease(v7);
      }
      goto LABEL_13;
    }
LABEL_10:
    CFRelease((CFTypeRef)__VSPreferencesDefaultSpokenLanguage);
    __VSPreferencesDefaultSpokenLanguage = 0;
    goto LABEL_11;
  }
LABEL_15:
  CFRetain(result);
  return (const void *)__VSPreferencesDefaultSpokenLanguage;
}

CFStringRef _VSPreferencesCopySystemLanguageIdentifier()
{
  const __CFArray *v0;
  const __CFString *ValueAtIndex;
  CFStringRef Copy;

  v0 = CFLocaleCopyPreferredLanguages();
  if (CFArrayGetCount(v0))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v0, 0);
    Copy = CFStringCreateCopy(0, ValueAtIndex);
  }
  else
  {
    Copy = 0;
  }
  CFRelease(v0);
  return Copy;
}

void _VSPreferencesSpokenLanguageChangedHandler()
{
  const __CFString *v0;
  const __CFString *SpokenLanguageIdentifier;
  CFComparisonResult v2;
  __CFNotificationCenter *LocalCenter;

  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  if (__VSPreferencesSpokenLanguageChangedCount >= 1)
  {
    --__VSPreferencesSpokenLanguageChangedCount;
    pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
    return;
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.voiceservices"));
  if (__VSPreferencesDefaultSpokenLanguage)
  {
    CFRelease((CFTypeRef)__VSPreferencesDefaultSpokenLanguage);
    __VSPreferencesDefaultSpokenLanguage = 0;
  }
  if (__VSPreferencesDefaultOutputLanguage)
  {
    CFRelease((CFTypeRef)__VSPreferencesDefaultOutputLanguage);
    __VSPreferencesDefaultOutputLanguage = 0;
  }
  v0 = (const __CFString *)__VSPreferencesSpokenLanguage;
  if (!__VSPreferencesSpokenLanguage)
  {
    pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
    goto LABEL_11;
  }
  __VSPreferencesSpokenLanguage = 0;
  SpokenLanguageIdentifier = (const __CFString *)_VSPreferencesGetSpokenLanguageIdentifier();
  v2 = CFStringCompare(v0, SpokenLanguageIdentifier, 0);
  CFRelease(v0);
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  if (v2)
  {
LABEL_11:
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.voiceservices.language"), 0, 0, 1u);
  }
}

uint64_t VSPreferencesGetLogging()
{
  CFIndex AppIntegerValue;
  uint64_t v1;

  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("VSLogLevel"), CFSTR("com.apple.voiceservices.logging"), 0);
  v1 = MEMORY[0x1E0C9AE50];
  if (AppIntegerValue <= 0)
    v1 = MEMORY[0x1E0C9AE40];
  return *(_QWORD *)v1;
}

CFIndex VSPreferencesGetLoggingLevel()
{
  return CFPreferencesGetAppIntegerValue(CFSTR("VSLogLevel"), CFSTR("com.apple.voiceservices.logging"), 0);
}

void VSPreferencesSetLogging(uint64_t a1)
{
  id v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = CFSTR("/");
  v8 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("%@Library/Managed Preferences/mobile/%@.plist"), CFSTR("/"), CFSTR("com.apple.voiceservices.logging"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v8);
  objc_msgSend(v4, "objectForKey:", CFSTR("VSLogLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("VSLogLevel"));
    _CFPreferencesWriteManagedDomainForUser();
  }
  if (*MEMORY[0x1E0C9AE50] != a1 || a1 == 0)
    v7 = -1;
  else
    v7 = 6;
  VSPreferencesSetLoggingLevel(v7);

}

uint64_t VSPreferencesSetLoggingLevel(uint64_t a1)
{
  const void *v2;
  const __CFString *v3;

  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1);
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("VSLogLevel"), v2, CFSTR("com.apple.voiceservices.logging"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSetValue(CFSTR("VSOutputLevel"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1), CFSTR("com.apple.voiceservices.logging"), CFSTR("mobile"), v3);
  CFPreferencesSynchronize(CFSTR("com.apple.voiceservices.logging"), CFSTR("mobile"), v3);
  return notify_post("com.apple.AppSupport.loggingDefaultsChanged");
}

const __CFString *VSPreferencesCopySpokenLanguageIdentifierArray()
{
  const __CFString *result;
  const __CFString *v1;
  CFArrayRef v2;

  result = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  if (result)
  {
    v1 = result;
    v2 = _VSCopyLanguageArrayForLanguageIdentifier(result);
    CFRelease(v1);
    return (const __CFString *)v2;
  }
  return result;
}

const void *VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences()
{
  const void *v0;

  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  v0 = _VSPreferencesCopyDefaultSpokenLanguageIdentifierForUserPreferences();
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

CFStringRef VSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  const __CFString *v0;
  const __CFLocale *v1;
  const __CFLocale *v2;
  CFStringRef v3;
  CFStringRef v4;
  __CFSet *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  CFStringRef Copy;

  VSPreferencesInitialize();
  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  v0 = (const __CFString *)__VSPreferencesDefaultOutputLanguage;
  if (__VSPreferencesDefaultOutputLanguage)
    goto LABEL_16;
  v1 = CFLocaleCopyCurrent();
  if (v1)
  {
    v2 = v1;
    v3 = _VSCopyLanguageIdentifierForLocale(v1);
    __VSPreferencesDefaultOutputLanguage = (uint64_t)v3;
    if (!v3)
      goto LABEL_11;
    v4 = v3;
    v5 = (__CFSet *)__VSPreferencesValidOutputLanguageIds;
    if (!__VSPreferencesValidOutputLanguageIds)
    {
      v5 = _VSCopyAvailableOutputLanguageIdentifiers();
      __VSPreferencesValidOutputLanguageIds = (uint64_t)v5;
      if (!v5)
        goto LABEL_10;
      v4 = (CFStringRef)__VSPreferencesDefaultOutputLanguage;
    }
    if (CFSetContainsValue(v5, v4))
    {
      if (__VSPreferencesDefaultOutputLanguage)
      {
LABEL_13:
        CFRelease(v2);
        goto LABEL_14;
      }
LABEL_11:
      pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
      v6 = CFBundleCopyResourceURL((CFBundleRef)__VSBundle, CFSTR("language_fallbacks.plist"), 0, CFSTR("TTSResources"));
      if (v6)
      {
        v7 = v6;
        __VSPreferencesDefaultOutputLanguage = (uint64_t)_VSCopyFallbackLanguageIdentifierForLocale(v2, v6);
        CFRelease(v7);
      }
      goto LABEL_13;
    }
LABEL_10:
    CFRelease((CFTypeRef)__VSPreferencesDefaultOutputLanguage);
    __VSPreferencesDefaultOutputLanguage = 0;
    goto LABEL_11;
  }
LABEL_14:
  v0 = (const __CFString *)__VSPreferencesDefaultOutputLanguage;
  if (!__VSPreferencesDefaultOutputLanguage)
  {
    v0 = _VSPreferencesCopySystemLanguageIdentifier();
    __VSPreferencesDefaultOutputLanguage = (uint64_t)v0;
    if (!v0)
    {
      Copy = 0;
      goto LABEL_17;
    }
  }
LABEL_16:
  Copy = CFStringCreateCopy(0, v0);
LABEL_17:
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return Copy;
}

__CFSet *VSPreferencesCopyAvailableLanguageIdentifiers()
{
  __CFSet *v0;

  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  v0 = (__CFSet *)__VSPreferencesValidSpokenLanguageIds;
  if (__VSPreferencesValidSpokenLanguageIds
    || (v0 = _VSCopyAvailableLanguageIdentifiers(), (__VSPreferencesValidSpokenLanguageIds = (uint64_t)v0) != 0))
  {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

__CFSet *VSPreferencesCopyAvailableOutputLanguageIdentifiers()
{
  __CFSet *v0;

  pthread_mutex_lock(&__VSPreferencesSpokenLanguageLock);
  v0 = (__CFSet *)__VSPreferencesValidOutputLanguageIds;
  if (__VSPreferencesValidOutputLanguageIds
    || (v0 = _VSCopyAvailableOutputLanguageIdentifiers(), (__VSPreferencesValidOutputLanguageIds = (uint64_t)v0) != 0))
  {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&__VSPreferencesSpokenLanguageLock);
  return v0;
}

CFStringRef _VSCopyLanguageCodeFromLanguageIdentifier(const __CFString *a1)
{
  CFIndex location;
  CFRange v4;

  location = CFStringFind(a1, CFSTR("-"), 0).location;
  if (location == -1)
    return (CFStringRef)CFRetain(a1);
  v4.length = location;
  v4.location = 0;
  return CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v4);
}

BOOL _VSLanguageIdentifierIsLanguageOnly(const __CFString *a1)
{
  return CFStringFind(a1, CFSTR("-"), 0).location == -1;
}

CFStringRef _VSCopyLocalizedString(const __CFString *a1, const __CFString *a2)
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  if (__VSBundle)
    return CFBundleCopyLocalizedString((CFBundleRef)__VSBundle, a1, a1, a2);
  else
    return (CFStringRef)CFRetain(a1);
}

CFBundleRef _VSSetFrameworkBundle()
{
  CFBundleRef result;

  result = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.voiceservices"));
  __VSBundle = (uint64_t)result;
  if (result)
    return (CFBundleRef)CFRetain(result);
  return result;
}

const void *_VSCopyFallbackLanguageIdentifierForLocale(const __CFLocale *a1, const __CFURL *a2)
{
  const __CFAllocator *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  CFStringRef v9;
  CFStringRef v10;
  const void *Value;
  void *v12;
  void *key;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (v4)
  {
    v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0, 0, 0, 0);
      if (v6)
      {
        v7 = v6;
        v8 = CFGetTypeID(v6);
        if (v8 == CFDictionaryGetTypeID())
        {
          v9 = _VSCopyLanguageIdentifierForLocale(a1);
          if (v9)
          {
            v10 = v9;
            Value = CFDictionaryGetValue(v7, v9);
            CFRelease(v10);
            if (Value)
              goto LABEL_9;
          }
          key = 0;
          _VSCopyLanguageCodes(&key, 0);
          v12 = key;
          if (key)
          {
            Value = CFDictionaryGetValue(v7, key);
            CFRelease(v12);
            if (!Value)
            {
LABEL_14:
              CFReadStreamClose(v5);
              CFRelease(v7);
              goto LABEL_15;
            }
LABEL_9:
            CFRetain(Value);
            goto LABEL_14;
          }
        }
        Value = 0;
        goto LABEL_14;
      }
      CFReadStreamClose(v5);
    }
    Value = 0;
LABEL_15:
    CFRelease(v5);
    return Value;
  }
  return 0;
}

CFStringRef _VSCopyLanguageIdentifierForLocale(const __CFLocale *a1)
{
  CFComparisonResult v2;
  const __CFString *Value;
  const __CFString *v4;
  CFTypeRef cf;
  CFStringRef theString1;

  cf = 0;
  theString1 = 0;
  _VSCopyLanguageCodes(&cf, &theString1);
  if (theString1)
  {
    v2 = CFStringCompare(theString1, CFSTR("en-GB"), 1uLL);
    if (!a1 || v2)
      goto LABEL_14;
  }
  else if (!a1)
  {
    goto LABEL_14;
  }
  if (!cf)
    return theString1;
  Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  if (Value)
  {
    v4 = Value;
    if (theString1)
    {
      if (CFStringCompare(Value, CFSTR("AU"), 1uLL) && CFStringCompare(v4, CFSTR("NZ"), 1uLL))
        goto LABEL_14;
      if (theString1)
        CFRelease(theString1);
    }
    theString1 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@-%@"), cf, v4);
  }
LABEL_14:
  if (cf)
    CFRelease(cf);
  return theString1;
}

uint64_t _VSCopyLanguageCodes(_QWORD *a1, _QWORD *a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  const __CFString *ValueAtIndex;
  CFRange v7;
  const void *v8;
  const void *v9;

  pthread_mutex_lock(&__VSLanguageLock);
  if (!__VSLanguage)
  {
    pthread_once(&_VSCopyLanguageCodes___SetLanguageOnce, _VSRegisterLanguageChanges);
    v4 = CFLocaleCopyPreferredLanguages();
    if (v4)
    {
      v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, 0);
        v7 = CFStringFind(ValueAtIndex, CFSTR("-"), 0);
        if (v7.location != -1 && v7.location + v7.length == CFStringGetLength(ValueAtIndex) - 2)
        {
          __VSLanguageCode = (uint64_t)ValueAtIndex;
          CFRetain(ValueAtIndex);
        }
        if (CFStringFind(ValueAtIndex, CFSTR("zh-Hans"), 8uLL).location != -1)
        {
          __VSLanguageCode = (uint64_t)CFSTR("zh-CN");
          CFRetain(CFSTR("zh-CN"));
        }
        __VSLanguage = (uint64_t)_VSCopyLanguageCodeFromLanguageIdentifier(ValueAtIndex);
      }
      CFRelease(v5);
    }
  }
  if (a1)
  {
    v8 = (const void *)__VSLanguage;
    *a1 = __VSLanguage;
    if (v8)
      CFRetain(v8);
  }
  if (a2)
  {
    v9 = (const void *)__VSLanguageCode;
    *a2 = __VSLanguageCode;
    if (v9)
      CFRetain(v9);
  }
  return pthread_mutex_unlock(&__VSLanguageLock);
}

void _VSRegisterLanguageChanges()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_VSDeviceLanguageChangedHandler, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDrop);
}

uint64_t _VSDeviceLanguageChangedHandler()
{
  uint64_t v0;

  pthread_mutex_lock(&__VSLanguageLock);
  if (__VSLanguage)
  {
    CFRelease((CFTypeRef)__VSLanguage);
    __VSLanguage = 0;
  }
  if (__VSLanguageCode)
  {
    CFRelease((CFTypeRef)__VSLanguageCode);
    __VSLanguageCode = 0;
  }
  v0 = pthread_mutex_unlock(&__VSLanguageLock);
  return _VSPreferencesSpokenLanguageChangedHandler(v0);
}

CFStringRef _VSCopyQualifiedLanguageIdentifierForLanguageCode(const void *a1, CFStringRef theString)
{
  CFRange v4;
  CFIndex Length;
  const __CFAllocator *v6;
  CFStringRef v7;
  CFStringRef v8;
  const __CFLocale *v9;
  const __CFLocale *v10;
  const __CFString *Value;
  CFStringRef v12;
  CFRange v14;

  if (theString)
  {
    v4 = CFStringFind(theString, CFSTR("-"), 0);
    if (v4.location != -1)
    {
      Length = CFStringGetLength(theString);
      if (Length > v4.location + v4.length)
      {
        v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v14.location = v4.location + v4.length;
        v14.length = Length - (v4.location + v4.length);
        v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, v14);
        if (v7)
        {
          v8 = v7;
          goto LABEL_9;
        }
      }
    }
  }
  v9 = CFLocaleCopyCurrent();
  if (!v9)
  {
LABEL_12:
    CFRetain(a1);
    return (CFStringRef)a1;
  }
  v10 = v9;
  Value = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  if (!Value)
  {
    CFRelease(v10);
    goto LABEL_12;
  }
  v8 = Value;
  CFRetain(Value);
  CFRelease(v10);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
LABEL_9:
  v12 = CFStringCreateWithFormat(v6, 0, CFSTR("%@-%@"), a1, v8);
  CFRelease(v8);
  if (!v12)
    goto LABEL_12;
  return v12;
}

const void *_VSCopyFallbackLanguageIdentifierForLanguageIdentifier(const __CFString *a1, const __CFURL *a2)
{
  const __CFAllocator *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  const void *Value;
  CFStringRef v10;
  CFStringRef v11;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (v4)
  {
    v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0, 0, 0, 0);
      if (v6)
      {
        v7 = v6;
        v8 = CFGetTypeID(v6);
        if (v8 == CFDictionaryGetTypeID())
        {
          Value = CFDictionaryGetValue(v7, a1);
          if (Value)
          {
LABEL_6:
            CFRetain(Value);
LABEL_14:
            CFReadStreamClose(v5);
            CFRelease(v7);
            goto LABEL_15;
          }
          v10 = _VSCopyLanguageCodeFromLanguageIdentifier(a1);
          if (v10)
          {
            v11 = v10;
            Value = CFDictionaryGetValue(v7, v10);
            CFRelease(v11);
            if (!Value)
              goto LABEL_14;
            goto LABEL_6;
          }
        }
        Value = 0;
        goto LABEL_14;
      }
      CFReadStreamClose(v5);
    }
    Value = 0;
LABEL_15:
    CFRelease(v5);
    return Value;
  }
  return 0;
}

CFArrayRef _VSCopyLanguageArrayForLanguageIdentifier(const __CFString *a1)
{
  const __CFString *v1;
  CFStringRef v2;
  CFIndex v3;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = 0;
  if (a1)
  {
    v2 = _VSCopyLanguageCodeFromLanguageIdentifier(a1);
    v5 = v1;
    if (CFStringCompare(v1, CFSTR("zh-HK"), 0))
    {
      v3 = 1;
      if (v2)
      {
LABEL_4:
        *(&v5 + v3) = v2;
        v1 = (const __CFString *)CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v5, v3 + 1, MEMORY[0x1E0C9B378]);
        CFRelease(v2);
        return (CFArrayRef)v1;
      }
    }
    else
    {
      v6 = CFSTR("zh-TW");
      v3 = 2;
      if (v2)
        goto LABEL_4;
    }
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v5, v3, MEMORY[0x1E0C9B378]);
  }
  return (CFArrayRef)v1;
}

__CFSet *_VSCopyAvailableLanguageIdentifiers()
{
  const __CFArray *v0;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  __CFSet *Mutable;
  CFIndex v5;
  const __CFAllocator *v6;
  const CFSetCallBacks *v7;
  const __CFURL *ValueAtIndex;
  const __CFString *PathComponent;
  const __CFString *v10;
  CFIndex location;
  CFStringRef v12;
  CFRange v14;

  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  v0 = CFBundleCopyResourceURLsOfType((CFBundleRef)__VSBundle, CFSTR("bin"), CFSTR("RecognitionResources/Express"));
  if (!v0)
    return 0;
  v1 = v0;
  Count = CFArrayGetCount(v0);
  if (Count >= 1)
  {
    v3 = Count;
    Mutable = 0;
    v5 = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = (const CFSetCallBacks *)MEMORY[0x1E0C9B3B0];
    while (1)
    {
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, v5);
      PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent)
        break;
LABEL_10:
      if (v3 == ++v5)
        goto LABEL_16;
    }
    v10 = PathComponent;
    location = CFStringFind(PathComponent, CFSTR("."), 0).location;
    if ((unint64_t)(location - 1) >= 0xFFFFFFFFFFFFFFFELL)
    {
      CFRetain(v10);
      v12 = v10;
      if (Mutable)
        goto LABEL_8;
    }
    else
    {
      v14.length = location;
      v14.location = 0;
      v12 = CFStringCreateWithSubstring(v6, v10, v14);
      if (!v12)
      {
LABEL_9:
        CFRelease(v10);
        goto LABEL_10;
      }
      if (Mutable)
      {
LABEL_8:
        CFSetAddValue(Mutable, v12);
        CFRelease(v12);
        goto LABEL_9;
      }
    }
    Mutable = CFSetCreateMutable(v6, 0, v7);
    goto LABEL_8;
  }
  Mutable = 0;
LABEL_16:
  CFRelease(v1);
  return Mutable;
}

__CFSet *_VSCopyAvailableOutputLanguageIdentifiers()
{
  const __CFArray *v0;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  __CFSet *Mutable;
  CFIndex v5;
  const __CFAllocator *v6;
  const CFSetCallBacks *v7;
  const __CFURL *ValueAtIndex;
  const __CFString *PathComponent;
  const __CFString *v10;

  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  v0 = CFBundleCopyResourceURLsOfType((CFBundleRef)__VSBundle, 0, CFSTR("TTSResources"));
  if (!v0)
    return 0;
  v1 = v0;
  Count = CFArrayGetCount(v0);
  if (Count < 1)
  {
    Mutable = 0;
  }
  else
  {
    v3 = Count;
    Mutable = 0;
    v5 = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = (const CFSetCallBacks *)MEMORY[0x1E0C9B3B0];
    do
    {
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, v5);
      PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
      if (PathComponent)
      {
        v10 = PathComponent;
        if (CFStringFind(PathComponent, CFSTR("-"), 0).location != -1)
        {
          if (!Mutable)
            Mutable = CFSetCreateMutable(v6, 0, v7);
          CFSetAddValue(Mutable, v10);
        }
        CFRelease(v10);
      }
      ++v5;
    }
    while (v3 != v5);
  }
  CFRelease(v1);
  return Mutable;
}

CFURLRef _VSCopyDefaultLanguageIdentifierFallbackMapURL()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  return CFBundleCopyResourceURL((CFBundleRef)__VSBundle, CFSTR("language_fallbacks.plist"), 0, CFSTR("RecognitionResources/Express"));
}

CFURLRef _VSCopyDefaultOutputLanguageIdentifierFallbackMapURL()
{
  pthread_once(&_VSFrameworkBundle_bundleInitOnce, (void (*)(void))_VSSetFrameworkBundle);
  return CFBundleCopyResourceURL((CFBundleRef)__VSBundle, CFSTR("language_fallbacks.plist"), 0, CFSTR("TTSResources"));
}

CFURLRef _VSBundleCopyResourceURL(CFBundleRef bundle, void *a2, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  CFArrayRef v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const __CFString *ValueAtIndex;
  CFURLRef v14;
  void *values;

  values = a2;
  if (!a2)
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, 0);
  v10 = CFBundleCopyBundleLocalizations(bundle);
  if (!v10 || (v11 = v10, v12 = CFBundleCopyLocalizationsForPreferences(v10, v9), CFRelease(v11), !v12))
  {
    CFRelease(v9);
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  }
  if (CFArrayGetCount(v12) < 1)
  {
    v14 = 0;
  }
  else
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v12, 0);
    v14 = CFBundleCopyResourceURLForLocalization(bundle, resourceName, resourceType, subDirName, ValueAtIndex);
  }
  CFRelease(v12);
  CFRelease(v9);
  if (!v14)
    return CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
  return v14;
}

__CFArray *VSAttributedStringCreateSerializedAttributes(const __CFAllocator *a1, CFAttributedStringRef aStr)
{
  CFIndex Length;
  CFIndex v5;
  __CFArray *Mutable;
  CFIndex v7;
  const CFArrayCallBacks *v8;
  CFDictionaryRef AttributesAndLongestEffectiveRange;
  const __CFDictionary *v10;
  CFDataRef v11;
  CFDataRef v12;
  __CFDictionary *MutableCopy;
  __CFDictionary *v14;
  CFIndex v15;
  CFRange v17;
  CFRange v18;

  if (!aStr)
    return 0;
  Length = CFAttributedStringGetLength(aStr);
  if (Length < 1)
    return 0;
  v5 = Length;
  Mutable = 0;
  v7 = 0;
  v17.location = 0;
  v17.length = 0;
  v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  do
  {
    v18.length = v5 - v7;
    v18.location = v7;
    AttributesAndLongestEffectiveRange = CFAttributedStringGetAttributesAndLongestEffectiveRange(aStr, v7, v18, &v17);
    if (AttributesAndLongestEffectiveRange)
    {
      v10 = AttributesAndLongestEffectiveRange;
      v11 = CFDataCreate(a1, (const UInt8 *)&v17, 16);
      if (v11)
      {
        v12 = v11;
        MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, v10);
        if (MutableCopy)
        {
          v14 = MutableCopy;
          CFDictionarySetValue(MutableCopy, CFSTR("range"), v12);
          if (!Mutable)
            Mutable = CFArrayCreateMutable(a1, 0, v8);
          CFArrayAppendValue(Mutable, v14);
          CFRelease(v14);
        }
        CFRelease(v12);
      }
      v15 = v17.length;
    }
    else
    {
      v15 = 1;
    }
    v7 += v15;
  }
  while (v7 < v5);
  return Mutable;
}

__CFAttributedString *VSAttributedStringCreateFromSerializedAttributes(const __CFAllocator *a1, CFStringRef theString, const __CFArray *a3)
{
  uint64_t Length;
  CFIndex v7;
  __CFAttributedString *Mutable;
  CFIndex Count;
  CFTypeID TypeID;
  uint64_t v11;
  CFIndex i;
  const __CFDictionary *ValueAtIndexIfType;
  const __CFDictionary *v14;
  const __CFData *Value;
  const __CFData *v16;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v18;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  if (!theString)
    return 0;
  Length = CFStringGetLength(theString);
  v20.location = 0;
  v20.length = 0;
  if (Length < 1)
    return 0;
  v7 = Length;
  Mutable = CFAttributedStringCreateMutable(a1, Length);
  v21.location = 0;
  v21.length = 0;
  CFAttributedStringReplaceString(Mutable, v21, theString);
  if (a3)
  {
    Count = CFArrayGetCount(a3);
    TypeID = CFDictionaryGetTypeID();
    if (Count >= 1)
    {
      v11 = TypeID;
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndexIfType = (const __CFDictionary *)VSCFArrayGetValueAtIndexIfType(a3, i, v11);
        if (ValueAtIndexIfType)
        {
          v14 = ValueAtIndexIfType;
          Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndexIfType, CFSTR("range"));
          if (Value)
          {
            v16 = Value;
            if (CFDataGetLength(Value) == 16)
            {
              v22.location = 0;
              v22.length = 16;
              CFDataGetBytes(v16, v22, (UInt8 *)&v20);
              if ((v20.location & 0x8000000000000000) == 0 && v20.length + v20.location <= v7)
              {
                MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, v14);
                if (MutableCopy)
                {
                  v18 = MutableCopy;
                  CFDictionaryRemoveValue(MutableCopy, CFSTR("range"));
                  CFAttributedStringSetAttributes(Mutable, v20, v18, 1u);
                  CFRelease(v18);
                }
              }
            }
          }
        }
      }
    }
  }
  return Mutable;
}

CFTypeRef VSCFAttributedStringGetAttributeAndLongestEffectiveRange(const __CFAttributedString *a1, CFIndex a2, const __CFString *a3, CFIndex a4, CFIndex a5, CFRange *effectiveRange)
{
  CFTypeRef result;
  CFIndex v13;
  CFIndex i;
  CFRange v15;
  CFIndex v16;
  CFIndex location;
  CFIndex v18;
  CFIndex length;
  CFIndex v20;
  CFIndex v21;
  CFRange v22;
  CFRange v23;

  result = CFAttributedStringGetAttribute(a1, a2, a3, effectiveRange);
  if (effectiveRange)
  {
    if (result)
    {
      v23.location = a4;
      v23.length = a5;
      return CFAttributedStringGetAttributeAndLongestEffectiveRange(a1, a2, a3, v23, effectiveRange);
    }
    else
    {
      v22 = *effectiveRange;
      v13 = a4 + a5;
      for (i = v22.length + v22.location; i > v13; i = v15.length + v15.location)
      {
        result = CFAttributedStringGetAttribute(a1, i, a3, &v22);
        if (result)
          goto LABEL_9;
        v15 = v22;
        effectiveRange->length += v22.length;
      }
      result = 0;
LABEL_9:
      v22 = *effectiveRange;
      if (!result)
      {
        v16 = v22.location - 1;
        if (v22.location - 1 > a4)
        {
          while (1)
          {
            result = CFAttributedStringGetAttribute(a1, v16, a3, &v22);
            if (result)
              break;
            location = v22.location;
            v18 = effectiveRange->length + v22.length;
            effectiveRange->location = v22.location;
            effectiveRange->length = v18;
            v16 = location - 1;
            if (location - 1 <= a4)
            {
              result = 0;
              break;
            }
          }
        }
      }
      v20 = effectiveRange->location;
      length = effectiveRange->length;
      if (effectiveRange->location < a4)
      {
        length += effectiveRange->location - a4;
        effectiveRange->location = a4;
        effectiveRange->length = length;
        v20 = a4;
      }
      v21 = length + v20;
      if (v21 > v13)
        effectiveRange->length = length + v13 - v21;
    }
  }
  return result;
}

__CFString *VSCFAttributedStringCreateStringByBracketingAttributeWithString(const __CFAllocator *a1, CFAttributedStringRef aStr, const __CFString *a3, const __CFString *a4)
{
  CFIndex Length;
  CFStringRef String;
  const __CFString *v10;
  __CFString *Mutable;
  CFIndex v12;
  BOOL v13;
  char v14;
  const __CFString *v15;
  const __CFString *v16;
  CFRange effectiveRange;

  Length = CFAttributedStringGetLength(aStr);
  String = CFAttributedStringGetString(aStr);
  if (Length >= 1)
  {
    v10 = String;
    Mutable = 0;
    v12 = 0;
    while (1)
    {
      effectiveRange = (CFRange)xmmword_1DE1A1970;
      if (VSCFAttributedStringGetAttributeAndLongestEffectiveRange(aStr, v12, a3, v12, Length - v12, &effectiveRange))
        v13 = effectiveRange.length < 1;
      else
        v13 = 1;
      v14 = v13;
      if (Mutable)
      {
        if ((v14 & 1) == 0)
          goto LABEL_13;
      }
      else
      {
        Mutable = CFStringCreateMutable(a1, 0);
        if ((v14 & 1) == 0)
        {
LABEL_13:
          CFStringAppend(Mutable, a4);
          v16 = CFStringCreateWithSubstring(a1, v10, effectiveRange);
          CFStringAppend(Mutable, v16);
          CFRelease(v16);
          CFStringAppend(Mutable, a4);
          goto LABEL_14;
        }
      }
      v15 = CFStringCreateWithSubstring(a1, v10, effectiveRange);
      CFStringAppend(Mutable, v15);
      CFRelease(v15);
LABEL_14:
      v12 += effectiveRange.length;
      if (v12 >= Length)
        return Mutable;
    }
  }
  return 0;
}

void sub_1DE177F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!TextToSpeechLibraryCore_frameworkLibrary)
    TextToSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)TextToSpeechLibraryCore_frameworkLibrary;
  if (!TextToSpeechLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TextToSpeechLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("NSString+VSSpeechService.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "TTSSpeechTransformTextWithLanguage");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

const __CFURL *VSVocalizerCopyPathForResources()
{
  const __CFURL *result;
  const __CFURL *v1;
  CFStringRef v2;

  result = _VSVocalizerCopyURLForFrameworkResources();
  if (result)
  {
    v1 = result;
    v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (const __CFURL *)v2;
  }
  return result;
}

const __CFURL *_VSVocalizerCopyURLForFrameworkResources()
{
  const __CFAllocator *v0;
  const __CFURL *result;
  const __CFURL *v2;
  CFURLRef v3;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  result = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/System/Library/PrivateFrameworks/VoiceServices.framework/"), kCFURLPOSIXPathStyle, 1u);
  if (result)
  {
    v2 = result;
    v3 = CFURLCreateCopyAppendingPathComponent(v0, result, CFSTR("TTSResources"), 1u);
    CFRelease(v2);
    return v3;
  }
  return result;
}

CFStringRef VSVocalizerCopyPathForCommonResources()
{
  const __CFURL *v0;
  const __CFURL *v1;
  const __CFURL *v2;
  CFStringRef v3;

  v0 = _VSVocalizerCopyURLForFrameworkResources();
  v1 = _VSVocalizerCopyURLForResourcesInDirectory(CFSTR("common"), v0);
  if (!v1)
  {
    v3 = 0;
    if (!v0)
      return v3;
    goto LABEL_3;
  }
  v2 = v1;
  v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  CFRelease(v2);
  if (v0)
LABEL_3:
    CFRelease(v0);
  return v3;
}

const __CFURL *_VSVocalizerCopyURLForResourcesInDirectory(CFStringRef pathComponent, const __CFURL *a2)
{
  const __CFURL *v2;
  const __CFURL *v3;
  stat v5;
  UInt8 buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, pathComponent, 1u);
  v3 = v2;
  if (v2)
  {
    memset(&v5, 0, sizeof(v5));
    if (!CFURLGetFileSystemRepresentation(v2, 1u, buffer, 1024) || stat((const char *)buffer, &v5))
    {
      CFRelease(v3);
      return 0;
    }
  }
  return v3;
}

CFStringRef VSVocalizerCopyPathForBuiltInVoice(const __CFString *a1, _QWORD *a2)
{
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFString *v6;
  CFStringRef v7;

  v4 = _VSVocalizerCopyURLForFrameworkResources();
  v5 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v4);
  if (!v5)
  {
    v6 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(a1, a1);
    v5 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v6, a2, v4);
    if (v6)
      CFRelease(v6);
    if (!v5)
    {
      v7 = 0;
      if (!v4)
        return v7;
      goto LABEL_6;
    }
  }
  v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  CFRelease(v5);
  if (v4)
LABEL_6:
    CFRelease(v4);
  return v7;
}

const __CFURL *_VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(CFStringRef pathComponent, _QWORD *a2, const __CFURL *a3)
{
  const __CFURL *v5;
  const __CFURL *v6;

  if (a2)
    *a2 = 0;
  v5 = 0;
  if (pathComponent)
  {
    if (a3)
    {
      v6 = _VSVocalizerCopyURLForResourcesInDirectory(pathComponent, a3);
      v5 = v6;
      if (a2)
      {
        if (v6)
        {
          *a2 = pathComponent;
          CFRetain(pathComponent);
        }
      }
    }
  }
  return v5;
}

const void *_VSVocalizerCopyFallbackLanguageIdentifier(const __CFString *a1, const __CFString *a2)
{
  const __CFURL *v4;
  CFURLRef v5;
  const __CFURL *v6;
  const __CFString *v7;
  const void *v8;

  v4 = _VSVocalizerCopyURLForFrameworkResources();
  v5 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, CFSTR("language_fallbacks.plist"), 0);
  if (!v5)
  {
    v8 = 0;
    if (!v4)
      return v8;
    goto LABEL_10;
  }
  v6 = v5;
  v7 = 0;
  if (CFStringFind(a1, CFSTR("-"), 0).location == -1)
    v7 = _VSCopyQualifiedLanguageIdentifierForLanguageCode(a1, a2);
  if (a1 && !v7)
  {
    CFRetain(a1);
    v7 = a1;
  }
  v8 = _VSCopyFallbackLanguageIdentifierForLanguageIdentifier(v7, v6);
  CFRelease(v6);
  if (v7)
    CFRelease(v7);
  if (v4)
LABEL_10:
    CFRelease(v4);
  return v8;
}

CFStringRef VSVocalizerCopyPathForLocalizedResources(const __CFString *a1, _QWORD *a2, const __CFString *a3, int a4)
{
  const __CFURL *v8;
  const __CFURL *v9;
  NSObject *v10;
  const __CFURL *v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  const __CFURL *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  CFStringRef v22;
  CFStringRef v24;
  CFStringRef v25;
  CFStringRef v26;
  CFStringRef v27;
  CFStringRef v28;
  int v29;
  CFStringRef v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = _VSVocalizerCopyURLForFrameworkResources();
  v9 = VSVocalizerCopyURLForAssets();
  if (!a1)
    goto LABEL_38;
  if (a4)
  {
    v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v29) = 0;
      _os_log_debug_impl(&dword_1DE15E000, v10, OS_LOG_TYPE_DEBUG, "compact explicitly specified, look at framework asset first\n", (uint8_t *)&v29, 2u);
    }
    v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v8);
    if (v11)
      goto LABEL_9;
  }
  if (!VSVocalizerShouldUseAssetForLanguage((_BOOL8)a1))
  {
    v11 = 0;
LABEL_12:
    v13 = 1;
    goto LABEL_13;
  }
  _VSVocalizerFinishInstallingAssetForLang(a1);
  v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
      v26 = CFURLGetString(v9);
    else
      v26 = 0;
    v29 = 138412290;
    v30 = v26;
    _os_log_debug_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
  }
  v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v9);
  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (_VSVocalizerIsValidAssetAtURLMigratingIfNeeded(v11))
    goto LABEL_31;
  v13 = 0;
LABEL_13:
  v14 = VSGetLogDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
      v25 = CFURLGetString(v8);
    else
      v25 = 0;
    v29 = 138412290;
    v30 = v25;
    _os_log_debug_impl(&dword_1DE15E000, v14, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
    if ((v13 & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((v13 & 1) == 0)
LABEL_15:
    CFRelease(v11);
LABEL_16:
  v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(a1, a2, v8);
  if (v11)
    goto LABEL_31;
  v15 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(a1, a3);
  v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412290;
    v30 = v15;
    _os_log_debug_impl(&dword_1DE15E000, v16, OS_LOG_TYPE_DEBUG, "Now looking for the fallback language: %@\n", (uint8_t *)&v29, 0xCu);
  }
  if (!VSVocalizerShouldUseAssetForLanguage((_BOOL8)v15))
    goto LABEL_23;
  _VSVocalizerFinishInstallingAssetForLang(v15);
  v17 = VSGetLogDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
      v28 = CFURLGetString(v9);
    else
      v28 = 0;
    v29 = 138412290;
    v30 = v28;
    _os_log_debug_impl(&dword_1DE15E000, v17, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
  }
  v18 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v15, a2, v9);
  if (!v18 || (v11 = v18, !_VSVocalizerIsValidAssetAtURLMigratingIfNeeded(v18)))
  {
LABEL_23:
    v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      if (v8)
        v27 = CFURLGetString(v8);
      else
        v27 = 0;
      v29 = 138412290;
      v30 = v27;
      _os_log_debug_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_DEBUG, "Looking for the resources in %@\n", (uint8_t *)&v29, 0xCu);
    }
    v11 = _VSVocalizerCopyURLForLocalizedResourcesFoundAtURL(v15, a2, v8);
    if (!v11)
    {
      v20 = VSGetLogDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v29) = 0;
        _os_log_error_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_ERROR, "Can't find the resources anywhere!\n", (uint8_t *)&v29, 2u);
      }
      v11 = 0;
    }
  }
  if (v15)
    CFRelease(v15);
  if (v11)
  {
LABEL_31:
    v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v24 = CFURLGetString(v11);
      v29 = 138412290;
      v30 = v24;
      _os_log_debug_impl(&dword_1DE15E000, v21, OS_LOG_TYPE_DEBUG, "Found the resources here: %@\n", (uint8_t *)&v29, 0xCu);
    }
    v22 = CFURLCopyFileSystemPath(v11, kCFURLPOSIXPathStyle);
    CFRelease(v11);
    if (v8)
      goto LABEL_34;
    goto LABEL_35;
  }
LABEL_38:
  v22 = 0;
  if (v8)
LABEL_34:
    CFRelease(v8);
LABEL_35:
  if (v9)
    CFRelease(v9);
  return v22;
}

const __CFURL *VSVocalizerCopyURLForAssets()
{
  const __CFURL *result;
  const __CFURL *v1;
  CFURLRef v2;

  result = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (result)
  {
    v1 = result;
    v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result, CFSTR("Library/VoiceServices/Assets"), 1u);
    CFRelease(v1);
    return v2;
  }
  return result;
}

uint64_t VSVocalizerShouldUseAssetForLanguage(_BOOL8 a1)
{
  _BOOL8 v1;
  const __CFArray *v2;
  const __CFArray *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  CFRange v8;

  v1 = a1;
  if (a1)
  {
    v2 = _VSVocalizerCopyAssetLanguages();
    if (v2
      && (v3 = v2,
          v8.length = CFArrayGetCount(v2),
          v8.location = 0,
          v4 = CFArrayContainsValue(v3, v8, (const void *)v1),
          CFRelease(v3),
          v4))
    {
      return 1;
    }
    else
    {
      v5 = VSVocalizerCopyDefaultAssetLanguage();
      if (v5)
      {
        v6 = v5;
        v1 = CFStringCompare(v5, (CFStringRef)v1, 0) == kCFCompareEqualTo;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v1;
}

void _VSVocalizerFinishInstallingAssetForLang(const __CFString *a1)
{
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  int v6;
  int v7;
  std::error_code *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  const char *v18;
  std::__fs::filesystem::path *v19;
  NSObject *v20;
  uint32_t v21;
  stat v22;
  uint8_t buf[4];
  std::__fs::filesystem::path *v24;
  __int16 v25;
  std::__fs::filesystem::path *v26;
  __int16 v27;
  int v28;
  std::__fs::filesystem::path v29[43];
  std::__fs::filesystem::path buffer[42];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = _VSVocalizerCopyTemporaryAssetURLForLang((uint64_t)a1);
    if (v2)
    {
      v3 = v2;
      memset(&v22, 0, sizeof(v22));
      if (!CFURLGetFileSystemRepresentation(v2, 1u, (UInt8 *)buffer, 1024))
        goto LABEL_19;
      if (stat((const char *)buffer, &v22))
        goto LABEL_19;
      v4 = _VSVocalizerCopyAssetURLForLang(a1);
      if (!v4)
        goto LABEL_19;
      v5 = v4;
      v6 = open((const char *)buffer, 32, *(_OWORD *)&v22.st_dev, *(_OWORD *)&v22.st_uid, *(_OWORD *)&v22.st_atimespec, *(_OWORD *)&v22.st_mtimespec, *(_OWORD *)&v22.st_ctimespec, *(_OWORD *)&v22.st_birthtimespec, *(_OWORD *)&v22.st_size, *(_OWORD *)&v22.st_blksize, *(_OWORD *)v22.st_qspare);
      if (v6 < 0)
      {
        v14 = VSGetLogDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = *__error();
          LODWORD(v29[0].__pn_.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)v29[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)buffer;
          WORD2(v29[0].__pn_.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&v29[0].__pn_.__r_.__value_.__r.__words[1] + 6) = v15;
          _os_log_debug_impl(&dword_1DE15E000, v14, OS_LOG_TYPE_DEBUG, "Unable to lock temporary asset: %s; presumably peer was first - error: %d\n",
            (uint8_t *)v29,
            0x12u);
        }
        goto LABEL_18;
      }
      v7 = v6;
      if (stat((const char *)buffer, &v22) < 0)
      {
        v16 = VSGetLogDefault();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_17;
        v17 = *__error();
        LODWORD(v29[0].__pn_.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v29[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)buffer;
        WORD2(v29[0].__pn_.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v29[0].__pn_.__r_.__value_.__r.__words[1] + 6) = v17;
        v18 = "Temporary asset: %s has moved; presumably peer was first - error: %d\n";
        v19 = v29;
        v20 = v16;
        v21 = 18;
      }
      else
      {
        _VSVocalizerDeleteAssetAtURL(v5);
        if (!CFURLGetFileSystemRepresentation(v5, 1u, (UInt8 *)v29, 1024))
          goto LABEL_17;
        rename(buffer, v29, v8);
        v10 = v9;
        v11 = VSGetLogDefault();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v13 = *__error();
            *(_DWORD *)buf = 136315650;
            v24 = buffer;
            v25 = 2080;
            v26 = v29;
            v27 = 1024;
            v28 = v13;
            _os_log_error_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_ERROR, "Couldn't move the temporary asset: %s to the real asset: %s - error: %d\n", buf, 0x1Cu);
          }
          goto LABEL_17;
        }
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
LABEL_17:
          close(v7);
LABEL_18:
          CFRelease(v5);
LABEL_19:
          CFRelease(v3);
          return;
        }
        *(_DWORD *)buf = 136315394;
        v24 = buffer;
        v25 = 2080;
        v26 = v29;
        v18 = "Moved the temporary asset: %s to the real asset: %s\n";
        v19 = (std::__fs::filesystem::path *)buf;
        v20 = v12;
        v21 = 22;
      }
      _os_log_debug_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)v19, v21);
      goto LABEL_17;
    }
  }
}

BOOL _VSVocalizerIsValidAssetAtURLMigratingIfNeeded(const __CFURL *a1)
{
  NSObject *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFString *PathComponent;
  const __CFString *v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const __CFURL *ValueAtIndex;
  const __CFString *v16;
  const __CFString *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  const __CFURL *v20;
  int *v21;
  char *v22;
  CFURLRef v23;
  const __CFURL *v24;
  CFURLRef v25;
  CFURLRef v26;
  CFURLRef v27;
  const __CFData *v28;
  const __CFData *v29;
  const __CFData *v30;
  const UInt8 *BytePtr;
  const __CFData *v32;
  const UInt8 *v33;
  CFIndex Length;
  __CFWriteStream *v35;
  __CFWriteStream *v36;
  UInt8 *MutableBytePtr;
  CFIndex v38;
  CFIndex v39;
  NSObject *v40;
  NSObject *v41;
  const __CFURL *v42;
  NSObject *v43;
  CFStringRef v44;
  std::error_code *v45;
  int v46;
  NSObject *v47;
  const __CFURL *v48;
  const __CFURL *v49;
  int v50;
  _BOOL8 result;
  NSObject *v52;
  int *v53;
  char *v54;
  int v55;
  int *v56;
  char *v57;
  int v58;
  const __CFData *v59;
  int streama;
  __CFWriteStream *stream;
  NSObject *log;
  NSObject *loga;
  os_log_t logb;
  const __CFData *v65;
  __CFData *theData;
  const __CFURL *url;
  uint8_t v68[4];
  uint8_t *v69;
  __int16 v70;
  std::__fs::filesystem::path *v71;
  uint8_t buf[4];
  int v73;
  __int16 v74;
  char *v75;
  __int16 v76;
  std::__fs::filesystem::path *v77;
  __int16 v78;
  std::__fs::filesystem::path *v79;
  std::__fs::filesystem::path v80[42];
  std::__fs::filesystem::path buffer[43];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (_VSVocalizerIsValidAssetAtURL(a1))
    return 1;
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buffer[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)CFURLGetString(a1);
    _os_log_debug_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEBUG, "Trying to migrate asset because it's not valid: %@\n", (uint8_t *)buffer, 0xCu);
  }
  v3 = _VSVocalizerCopyURLForFrameworkResources();
  if (!v3)
    goto LABEL_88;
  v4 = v3;
  PathComponent = CFURLCopyLastPathComponent(a1);
  if (PathComponent)
  {
    v6 = PathComponent;
    if (!_VSVocalizerStringIsALanguageString(PathComponent))
      goto LABEL_86;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    url = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, v6, 1u);
    if (!url)
      goto LABEL_86;
    v8 = CFURLCopyLastPathComponent(a1);
    if (v8)
    {
      v9 = v8;
      if (_VSVocalizerStringIsALanguageString(v8))
        _VSVocalizerFinishInstallingAssetForLang(v9);
      CFRelease(v9);
    }
    if (!_VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(a1))
    {
      v43 = VSGetLogDefault();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v44 = CFURLGetString(a1);
        LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)buffer[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)v44;
        _os_log_debug_impl(&dword_1DE15E000, v43, OS_LOG_TYPE_DEBUG, "Deleting the asset located here: %@ because the format versions don't match\n", (uint8_t *)buffer, 0xCu);
      }
      _VSVocalizerDeleteAssetAtURL(a1);
      goto LABEL_85;
    }
    v10 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL((uint64_t)url, 0);
    if (v10)
    {
      v11 = v10;
      Count = CFArrayGetCount(v10);
      if (Count >= 1)
      {
        v13 = Count;
        v14 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v11, v14);
          v16 = CFURLCopyLastPathComponent(ValueAtIndex);
          if (v16)
            break;
LABEL_31:
          if (v13 == ++v14)
            goto LABEL_35;
        }
        v17 = v16;
        if (CFStringCompare(v16, CFSTR("broker.hdr"), 0) == kCFCompareEqualTo)
        {
LABEL_30:
          CFRelease(v17);
          goto LABEL_31;
        }
        v18 = CFURLCreateCopyAppendingPathComponent(v7, url, v17, 0);
        v19 = CFURLCreateCopyAppendingPathComponent(v7, a1, v17, 0);
        v20 = v19;
        if (v18 && v19)
        {
          if (CFURLGetFileSystemRepresentation(v19, 0, (UInt8 *)buffer, 1024)
            && CFURLGetFileSystemRepresentation(v18, 0, (UInt8 *)v80, 1024))
          {
            if (symlink((const char *)v80, (const char *)buffer))
            {
              if (*__error() != 17)
              {
                log = VSGetLogDefault();
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  streama = *__error();
                  v21 = __error();
                  v22 = strerror(*v21);
                  *(_DWORD *)buf = 67109890;
                  v73 = streama;
                  v74 = 2080;
                  v75 = v22;
                  v76 = 2080;
                  v77 = v80;
                  v78 = 2080;
                  v79 = buffer;
                  _os_log_error_impl(&dword_1DE15E000, log, OS_LOG_TYPE_ERROR, "***ERROR*** There was an error (%d - %s) when trying to symlink %s to %s\n", buf, 0x26u);
                }
              }
            }
            else
            {
              CFStringGetCString(v17, (char *)buf, 1024, 0x8000100u);
              loga = VSGetLogDefault();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v68 = 136315394;
                v69 = buf;
                v70 = 2080;
                v71 = buffer;
                _os_log_debug_impl(&dword_1DE15E000, loga, OS_LOG_TYPE_DEBUG, "Symlinked %s to %s\n", v68, 0x16u);
              }
            }
          }
        }
        else if (!v18)
        {
          goto LABEL_28;
        }
        CFRelease(v18);
LABEL_28:
        if (v20)
          CFRelease(v20);
        goto LABEL_30;
      }
LABEL_35:
      CFRelease(v11);
    }
    v23 = CFURLCreateCopyAppendingPathComponent(v7, a1, CFSTR("broker.hdr"), 0);
    v24 = CFURLCreateCopyAppendingPathComponent(v7, a1, CFSTR("broker.hdr.tmp"), 0);
    v25 = CFURLCreateCopyAppendingPathComponent(v7, url, CFSTR("broker.hdr"), 0);
    v26 = CFURLCreateCopyAppendingPathComponent(v7, a1, CFSTR("broker.hdr.asset"), 0);
    v27 = v26;
    if (!v23 || !v24 || !v26 || !v25)
    {
      if (!v23)
        goto LABEL_74;
      goto LABEL_73;
    }
    v28 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v26);
    v29 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v25);
    v30 = v29;
    if (v28 && v29)
    {
      theData = CFDataCreateMutableCopy(v7, 0, v29);
      if (theData)
      {
        v65 = v30;
        BytePtr = CFDataGetBytePtr(v28);
        v32 = v28;
        if (BytePtr)
        {
          v33 = BytePtr;
          Length = CFDataGetLength(v32);
          CFDataAppendBytes(theData, v33, Length);
        }
        v35 = CFWriteStreamCreateWithFile(v7, v24);
        v28 = v32;
        v30 = v65;
        if (v35)
        {
          logb = (os_log_t)v23;
          v36 = v35;
          if (CFWriteStreamOpen(v35))
          {
            v59 = v28;
            MutableBytePtr = CFDataGetMutableBytePtr(theData);
            v38 = CFDataGetLength(theData);
            stream = v36;
            v39 = CFWriteStreamWrite(v36, MutableBytePtr, v38);
            v40 = VSGetLogDefault();
            v41 = v40;
            if (v39 < 1)
            {
              v42 = (const __CFURL *)logb;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v58 = *__error();
                v53 = __error();
                v54 = strerror(*v53);
                LODWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 67109378;
                HIDWORD(buffer[0].__pn_.__r_.__value_.__r.__words[0]) = v58;
                LOWORD(buffer[0].__pn_.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&buffer[0].__pn_.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v54;
                _os_log_error_impl(&dword_1DE15E000, v41, OS_LOG_TYPE_ERROR, "***ERROR*** couldn't append broker header files (%d - %s)\n", (uint8_t *)buffer, 0x12u);
              }
            }
            else
            {
              v42 = (const __CFURL *)logb;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 0;
                _os_log_debug_impl(&dword_1DE15E000, v41, OS_LOG_TYPE_DEBUG, "Successfully appended broker header files\n", (uint8_t *)buffer, 2u);
              }
            }
            CFWriteStreamClose(stream);
            v28 = v59;
            if (CFURLGetFileSystemRepresentation(v24, 1u, (UInt8 *)buffer, 1024))
            {
              if (v39 < 1)
              {
                unlink((const char *)buffer);
              }
              else
              {
                if (CFURLGetFileSystemRepresentation(v42, 1u, (UInt8 *)v80, 1024))
                {
                  rename(buffer, v80, v45);
                  if (v46 < 0)
                  {
                    v47 = VSGetLogDefault();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                    {
                      v55 = *__error();
                      v56 = __error();
                      v57 = strerror(*v56);
                      *(_DWORD *)buf = 67109378;
                      v73 = v55;
                      v74 = 2080;
                      v75 = v57;
                      _os_log_error_impl(&dword_1DE15E000, v47, OS_LOG_TYPE_ERROR, "***ERROR*** couldn't move broker header file to final location (%d - %s)\n", buf, 0x12u);
                    }
                  }
                }
                v28 = v59;
              }
            }
            v30 = v65;
            v36 = stream;
          }
          CFRelease(v36);
          v23 = (CFURLRef)logb;
        }
        CFRelease(theData);
      }
    }
    else if (!v28)
    {
LABEL_71:
      if (v30)
        CFRelease(v30);
LABEL_73:
      CFRelease(v23);
LABEL_74:
      if (v24)
        CFRelease(v24);
      if (v25)
        CFRelease(v25);
      if (v27)
        CFRelease(v27);
      v48 = CFURLCreateCopyAppendingPathComponent(v7, a1, CFSTR(".migrated"), 0);
      if (v48)
      {
        v49 = v48;
        if (CFURLGetFileSystemRepresentation(v48, 1u, (UInt8 *)buffer, 1024))
        {
          v50 = open((const char *)buffer, 512, 384);
          if (v50 != -1)
            close(v50);
        }
        CFRelease(v49);
      }
LABEL_85:
      CFRelease(url);
LABEL_86:
      CFRelease(v6);
      goto LABEL_87;
    }
    CFRelease(v28);
    goto LABEL_71;
  }
LABEL_87:
  CFRelease(v4);
LABEL_88:
  if (_VSVocalizerIsValidAssetAtURL(a1))
    return 1;
  v52 = VSGetLogDefault();
  result = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    LOWORD(buffer[0].__pn_.__r_.__value_.__l.__data_) = 0;
    _os_log_debug_impl(&dword_1DE15E000, v52, OS_LOG_TYPE_DEBUG, "After migrating asset, it's still not valid -- sorry\n", (uint8_t *)buffer, 2u);
    return 0;
  }
  return result;
}

const __CFURL *_VSVocalizerIsValidAssetAtURL(CFURLRef url)
{
  const __CFURL *result;
  const __CFURL *v3;
  int v4;
  stat v5;
  UInt8 buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], url, CFSTR(".migrated"), 0);
  if (result)
  {
    v3 = result;
    memset(&v5, 0, sizeof(v5));
    if (CFURLGetFileSystemRepresentation(result, 1u, buffer, 1024))
    {
      v4 = stat((const char *)buffer, &v5);
      CFRelease(v3);
      if (!v4)
        return (const __CFURL *)(_VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(url) != 0);
    }
    else
    {
      CFRelease(v3);
    }
    return 0;
  }
  return result;
}

BOOL _VSVocalizerStringIsALanguageString(const __CFString *a1)
{
  return CFStringGetLength(a1) == 5 && CFStringGetCharacterAtIndex(a1, 2) == 45;
}

uint64_t _VSVocalizerEngineFormatVersionMatchesAssetFormatVersionAtURL(const __CFURL *a1)
{
  const __CFDictionary *v1;
  const __CFArray *v2;
  const __CFArray *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const __CFDictionary *ValueAtIndex;
  CFTypeRef cf;
  uint8_t buf[4];
  const __CFDictionary *v14;
  uint64_t v15;
  CFRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v1 = _VSVocalizerCopyVoiceAssetFormatVersionFoundAtURL(a1, &cf);
  if (v1 && cf)
  {
    v2 = _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(cf);
    v3 = v2;
    if (!v2 || (v16.length = CFArrayGetCount(v2), v16.location = 0, CFArrayGetFirstIndexOfValue(v3, v16, v1) == -1))
    {
      v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v1;
        _os_log_debug_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEBUG, "---> asset's version is %@\n", buf, 0xCu);
      }
      v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, 0);
        *(_DWORD *)buf = 138412290;
        v14 = ValueAtIndex;
        _os_log_debug_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEBUG, "---> engine's version is %@\n", buf, 0xCu);
      }
      v4 = 0;
      v6 = 0;
      if (!v3)
        goto LABEL_16;
    }
    else
    {
      v4 = 1;
    }
    CFRelease(v3);
    v6 = v4;
LABEL_16:
    CFRelease(v1);
    v7 = v6;
    goto LABEL_17;
  }
  v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "Couldn't get asset's version and/or language\n", buf, 2u);
  }
  v6 = 0;
  v7 = 0;
  if (v1)
    goto LABEL_16;
LABEL_17:
  if (cf)
    CFRelease(cf);
  return v7;
}

uint64_t _VSVocalizerDeleteAssetAtURL(const __CFURL *a1)
{
  NSObject *v2;
  CFURLRef v3;
  CFURLRef v4;
  int v6;
  CFStringRef v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = CFURLGetString(a1);
    _os_log_debug_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEBUG, "Deleting asset at url: %@\n", (uint8_t *)&v6, 0xCu);
  }
  v3 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, CFSTR("voice_format_version.plist"), 0);
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v3, 0);
    CFRelease(v4);
  }
  VSCFURLDeleteDirectoryContents((uint64_t)a1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a1, 0);
}

const __CFDictionary *_VSVocalizerCopyVoiceAssetFormatVersionFoundAtURL(const __CFURL *a1, _QWORD *a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  const void *v7;
  unint64_t v8;
  const void **v9;
  size_t v10;
  const void *v11;
  CFTypeID v12;
  const __CFDictionary *v13;
  CFTypeID v14;
  const __CFBoolean *v15;
  const __CFDictionary *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (a2)
    *a2 = 0;
  v3 = (const __CFDictionary *)_VSVocalizerCopyFormatVersionInfoFoundAtURL(a1);
  if (v3)
  {
    v4 = v3;
    if (CFDictionaryContainsKey(v3, CFSTR("FormatVersion")))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("FormatVersion"));
      v6 = Value;
      if (Value)
        CFRetain(Value);
      if (a2)
      {
        if (CFDictionaryContainsKey(v4, CFSTR("Language")))
        {
          v7 = CFDictionaryGetValue(v4, CFSTR("Language"));
          *a2 = v7;
          if (v7)
            CFRetain(v7);
        }
      }
      goto LABEL_25;
    }
    if (CFDictionaryGetCount(v4) < 1)
    {
      v6 = 0;
    }
    else
    {
      MEMORY[0x1E0C80A78]();
      v9 = (const void **)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
      if (v8 >= 0x200)
        v10 = 512;
      else
        v10 = v8;
      bzero((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
      CFDictionaryGetKeysAndValues(v4, v9, 0);
      v11 = *v9;
      if (!*v9 || (v12 = CFGetTypeID(*v9), v12 != CFStringGetTypeID()))
      {
LABEL_22:
        v6 = 0;
        goto LABEL_25;
      }
      v13 = (const __CFDictionary *)CFDictionaryGetValue(v4, v11);
      v6 = v13;
      if (v13)
      {
        v14 = CFGetTypeID(v13);
        if (v14 == CFDictionaryGetTypeID())
        {
          v15 = (const __CFBoolean *)CFDictionaryGetValue(v6, CFSTR("NotForSiri"));
          if (!v15 || !CFBooleanGetValue(v15))
          {
            v17 = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("FormatVersion"));
            v6 = v17;
            if (v17)
              CFRetain(v17);
            if (a2)
            {
              *a2 = v11;
              CFRetain(v11);
            }
            goto LABEL_25;
          }
        }
        goto LABEL_22;
      }
    }
LABEL_25:
    CFRelease(v4);
    return v6;
  }
  return 0;
}

CFArrayRef _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(const void *a1)
{
  const __CFDictionary *Value;
  const __CFString *v3;
  CFArrayRef result;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  int v10;
  const void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  pthread_once(&_VSVocalizerCopyVoiceEngineFormatVersionsForLanguage___InitializeVoiceFormatVersionOnce, _VSVocalizerInitializeVoiceEngineFormatVersions);
  if (!a1)
    return 0;
  if (!__VoiceEngineFormatVersions)
  {
    v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      v6 = "VoiceEngineFormatVersions hasn't been initialized, voices may not be compatible\n";
      v7 = v9;
      v8 = 2;
      goto LABEL_12;
    }
    return 0;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)__VoiceEngineFormatVersions, a1);
  if (!Value
    || (v3 = (const __CFString *)CFDictionaryGetValue(Value, CFSTR("FormatVersion"))) == 0
    || (result = CFStringCreateArrayBySeparatingStrings(0, v3, CFSTR(","))) == 0)
  {
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = a1;
      v6 = "Couldn't get the engine format version for language %{public}@\n";
      v7 = v5;
      v8 = 12;
LABEL_12:
      _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
      return 0;
    }
    return 0;
  }
  return result;
}

void _VSVocalizerInitializeVoiceEngineFormatVersions()
{
  const __CFURL *v0;
  const __CFURL *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = _VSVocalizerCopyURLForFrameworkResources();
  if (v0)
  {
    v1 = v0;
    __VoiceEngineFormatVersions = (uint64_t)_VSVocalizerCopyFormatVersionInfoFoundAtURL(v0);
    if (!__VoiceEngineFormatVersions)
    {
      v2 = VSGetLogDefault();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v3 = 0;
        _os_log_error_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_ERROR, "Couldn't initialize the engine voice format versions\n", v3, 2u);
      }
      __VoiceEngineFormatVersions = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    }
    CFRelease(v1);
  }
}

const void *_VSVocalizerCopyFormatVersionInfoFoundAtURL(CFURLRef url)
{
  const __CFAllocator *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  const void *v7;
  CFTypeID v8;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], url, CFSTR("voice_format_version.plist"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFReadStreamCreateWithFile(v1, v2);
  if (v4)
  {
    v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      v6 = CFPropertyListCreateWithStream(v1, v5, 0, 0, 0, 0);
      v7 = v6;
      if (v6)
      {
        v8 = CFGetTypeID(v6);
        if (v8 != CFDictionaryGetTypeID())
        {
          CFRelease(v7);
          v7 = 0;
        }
      }
      CFReadStreamClose(v5);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

CFURLRef _VSVocalizerCopyTemporaryAssetURLForLang(uint64_t a1)
{
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFAllocator *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFURLRef v7;

  v2 = VSVocalizerCopyURLForAssets();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@%@"), a1, CFSTR(".tmp"));
  if (v5)
  {
    v6 = v5;
    v7 = CFURLCreateCopyAppendingPathComponent(v4, v3, v5, 1u);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

const __CFURL *_VSVocalizerCopyAssetURLForLang(const __CFString *a1)
{
  const __CFURL *result;
  const __CFURL *v3;
  CFURLRef v4;

  result = VSVocalizerCopyURLForAssets();
  if (result)
  {
    v3 = result;
    v4 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result, a1, 1u);
    CFRelease(v3);
    return v4;
  }
  return result;
}

const __CFArray *_VSVocalizerCopyAssetLanguages()
{
  const __CFURL *v0;
  const __CFURL *v1;
  id v2;
  const void *v3;
  BOOL v4;
  NSObject *v5;
  const __CFArray *Mutable;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const __CFURL *ValueAtIndex;
  const __CFURL *v11;
  const __CFString *v12;
  const __CFString *v13;
  CFURLRef v14;
  const __CFURL *v15;
  const __CFArray *v16;
  CFURLRef v17;
  CFURLRef v18;
  CFURLRef v19;
  _BOOL4 v20;
  _BOOL4 v21;
  const __CFString *PathComponent;
  const __CFString *v23;
  CFIndex Code;
  const __CFURL *v26;
  const void *v27;
  CFTypeRef cf;
  uint8_t buf[4];
  CFIndex v30;
  uint64_t v31;
  CFRange v32;

  v31 = *MEMORY[0x1E0C80C00];
  v0 = VSVocalizerCopyURLForAssets();
  if (!v0)
    return 0;
  v1 = v0;
  cf = 0;
  v2 = VSCopyContentsOfDirectoryAtURL((uint64_t)v0, &cf);
  v3 = v2;
  if (cf)
    v4 = 1;
  else
    v4 = v2 == 0;
  if (v4)
  {
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      Code = (CFIndex)cf;
      if (cf)
        Code = CFErrorGetCode((CFErrorRef)cf);
      *(_DWORD *)buf = 134217984;
      v30 = Code;
      _os_log_debug_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEBUG, "Couldn't get the contents of the assets directory (error %ld)\n", buf, 0xCu);
    }
    if (cf)
      CFRelease(cf);
    Mutable = 0;
    if (!v3)
      goto LABEL_37;
LABEL_36:
    CFRelease(v3);
    goto LABEL_37;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  Count = CFArrayGetCount((CFArrayRef)v3);
  if (Count < 1)
    goto LABEL_36;
  v8 = Count;
  v26 = v1;
  v27 = v3;
  for (i = 0; i != v8; ++i)
  {
    ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex((CFArrayRef)v3, i);
    if (!ValueAtIndex)
      continue;
    v11 = ValueAtIndex;
    v12 = _VSVocalizerCopyLangFromTemporaryAssetURL(ValueAtIndex);
    if (!v12)
      goto LABEL_28;
    v13 = v12;
    v14 = _VSVocalizerCopyTemporaryAssetURLForLang((uint64_t)v12);
    if (!v14)
    {
      CFRelease(v13);
      goto LABEL_28;
    }
    v15 = v14;
    v16 = Mutable;
    v17 = CFURLCopyAbsoluteURL(v11);
    v18 = CFURLCopyAbsoluteURL(v15);
    v19 = v18;
    if (v17 && v18)
    {
      v20 = CFEqual(v17, v18) != 0;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      if (!v17)
        goto LABEL_24;
    }
    CFRelease(v17);
    v21 = v20;
LABEL_24:
    if (v19)
      CFRelease(v19);
    CFRelease(v15);
    CFRelease(v13);
    Mutable = v16;
    v3 = v27;
    if (v21)
    {
      PathComponent = _VSVocalizerCopyLangFromTemporaryAssetURL(v11);
      goto LABEL_29;
    }
LABEL_28:
    PathComponent = CFURLCopyLastPathComponent(v11);
LABEL_29:
    v23 = PathComponent;
    if (PathComponent)
    {
      if (_VSVocalizerStringIsALanguageString(PathComponent))
      {
        v32.length = CFArrayGetCount(Mutable);
        v32.location = 0;
        if (!CFArrayContainsValue(Mutable, v32, v23))
          CFArrayAppendValue(Mutable, v23);
      }
      CFRelease(v23);
    }
  }
  v1 = v26;
  if (v3)
    goto LABEL_36;
LABEL_37:
  CFRelease(v1);
  return Mutable;
}

const __CFString *VSVocalizerCopyDefaultAssetLanguage()
{
  const __CFString *v0;
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  v1 = _VSVocalizerCopyURLForFrameworkResources();
  v2 = v1;
  if (v0 && v1 && (v3 = _VSVocalizerCopyURLForResourcesInDirectory(v0, v1)) != 0)
  {
    v4 = v3;
    CFRelease(v2);
    CFRelease(v4);
    return v0;
  }
  else
  {
    v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v0;
      _os_log_debug_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEBUG, "No TTS resources for asset. Trying fallback language for %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = (const __CFString *)_VSVocalizerCopyFallbackLanguageIdentifier(v0, 0);
    if (v7)
    {
      v5 = v7;
      if (v0)
        CFRelease(v0);
      v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_debug_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEBUG, "Using asset fallback language %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      v5 = v0;
    }
    if (v2)
      CFRelease(v2);
  }
  return v5;
}

const __CFString *_VSVocalizerCopyLangFromTemporaryAssetURL(CFURLRef url)
{
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFString *PathComponent;
  const __CFString *v4;

  v1 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x1E0C9AE00], url);
  if (!v1)
    return 0;
  v2 = v1;
  PathComponent = CFURLCopyLastPathComponent(v1);
  v4 = PathComponent;
  if (PathComponent && !_VSVocalizerStringIsALanguageString(PathComponent))
  {
    CFRelease(v4);
    v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

BOOL VSVocalizerAssetExistsForLanguage(const __CFString *a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  _BOOL8 v4;
  CFIndex Count;
  CFIndex v6;
  uint64_t v7;
  const __CFString *ValueAtIndex;

  v2 = _VSVocalizerCopyAssetLanguages();
  v3 = v2;
  v4 = 0;
  if (!a1 || !v2)
    goto LABEL_10;
  Count = CFArrayGetCount(v2);
  if (Count >= 1)
  {
    v6 = Count;
    v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v7 - 1);
      if (ValueAtIndex)
        v4 = CFStringCompare(a1, ValueAtIndex, 0) == kCFCompareEqualTo;
      else
        v4 = 0;
      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v4);
LABEL_10:
    if (!v3)
      return v4;
    goto LABEL_13;
  }
  v4 = 0;
LABEL_13:
  CFRelease(v3);
  return v4;
}

void VSVocalizerDeleteAssetForLanguage(const __CFString *a1)
{
  const __CFURL *v2;
  const __CFURL *v3;

  if (a1 && !VSVocalizerShouldUseAssetForLanguage((_BOOL8)a1) && _VSVocalizerStringIsALanguageString(a1))
  {
    _VSVocalizerFinishInstallingAssetForLang(a1);
    v2 = _VSVocalizerCopyAssetURLForLang(a1);
    if (v2)
    {
      v3 = v2;
      _VSVocalizerDeleteAssetAtURL(v2);
      CFRelease(v3);
    }
  }
}

const __CFURL *VSVocalizerCopyPathForTones()
{
  const __CFURL *result;
  const __CFURL *v1;
  CFStringRef v2;

  result = _VSVocalizerCopyURLForTones();
  if (result)
  {
    v1 = result;
    v2 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return (const __CFURL *)v2;
  }
  return result;
}

const __CFURL *_VSVocalizerCopyURLForTones()
{
  const __CFURL *result;
  const __CFURL *v1;
  const __CFURL *v2;

  result = _VSVocalizerCopyURLForFrameworkResources();
  if (result)
  {
    v1 = result;
    v2 = _VSVocalizerCopyURLForResourcesInDirectory(CFSTR("Tones"), result);
    CFRelease(v1);
    return v2;
  }
  return result;
}

const void *VSVocalizerCopyFileNameForToneName(const void *a1)
{
  const void *Value;
  const void *v3;

  pthread_once(&VSVocalizerCopyFileNameForToneName___InitializeTonePathsOnce, _VSVocalizerInitializeToneDictionary);
  if (!__ToneMapping)
    return 0;
  Value = CFDictionaryGetValue((CFDictionaryRef)__ToneMapping, a1);
  v3 = Value;
  if (Value)
    CFRetain(Value);
  return v3;
}

void _VSVocalizerInitializeToneDictionary()
{
  const __CFURL *v0;
  const __CFAllocator *v1;
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFURL *ValueAtIndex;
  const __CFURL *v8;
  const __CFString *PathComponent;
  const __CFString *v10;
  CFIndex Length;
  CFStringRef v12;
  CFStringRef v13;
  CFRange v14;

  v0 = _VSVocalizerCopyURLForTones();
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __ToneMapping = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v0)
  {
    v2 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL((uint64_t)v0, 0);
    if (v2)
    {
      v3 = v2;
      Count = CFArrayGetCount(v2);
      if (Count >= 1)
      {
        v5 = Count;
        v6 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v3, v6);
          if (ValueAtIndex)
            break;
LABEL_15:
          if (v5 == ++v6)
            goto LABEL_16;
        }
        v8 = ValueAtIndex;
        PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
        v10 = CFURLCopyPathExtension(v8);
        if (v10 && PathComponent)
        {
          if (CFStringFind(PathComponent, v10, 0xCuLL).location != -1)
          {
            Length = CFStringGetLength(PathComponent);
            v14.length = Length + ~CFStringGetLength(v10);
            v14.location = 0;
            v12 = CFStringCreateWithSubstring(v1, PathComponent, v14);
            if (v12)
            {
              v13 = v12;
              CFDictionarySetValue((CFMutableDictionaryRef)__ToneMapping, v12, PathComponent);
              CFRelease(v13);
            }
          }
        }
        else if (!PathComponent)
        {
          goto LABEL_13;
        }
        CFRelease(PathComponent);
LABEL_13:
        if (v10)
          CFRelease(v10);
        goto LABEL_15;
      }
LABEL_16:
      CFRelease(v3);
    }
    CFRelease(v0);
  }
}

CFDictionaryRef VSVocalizerCopyVoiceEngineFormatVersions()
{
  NSObject *v1;
  uint8_t v2[16];

  pthread_once(&_VSVocalizerCopyVoiceEngineFormatVersionsForLanguage___InitializeVoiceFormatVersionOnce, _VSVocalizerInitializeVoiceEngineFormatVersions);
  if (__VoiceEngineFormatVersions)
    return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)__VoiceEngineFormatVersions);
  v1 = VSGetLogDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1DE15E000, v1, OS_LOG_TYPE_ERROR, "VoiceEngineFormatVersions hasn't been initialized, voices may not be compatible\n", v2, 2u);
  }
  return 0;
}

const void *VSVocalizerCopyVoiceEngineFormatVersionForLanguage(const void *a1)
{
  const __CFArray *v1;
  const __CFArray *v2;
  const void *ValueAtIndex;

  v1 = _VSVocalizerCopyVoiceEngineFormatVersionsForLanguage(a1);
  if (!v1)
    return 0;
  v2 = v1;
  ValueAtIndex = CFArrayGetValueAtIndex(v1, 0);
  CFRetain(ValueAtIndex);
  CFRelease(v2);
  return ValueAtIndex;
}

uint64_t VSCreateDirectory(const __CFURL *a1)
{
  uint64_t result;
  stat v2;
  UInt8 buffer[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(&v2, 0, sizeof(v2));
  result = CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1023);
  if ((_DWORD)result)
  {
    buffer[1023] = 0;
    mkdir((const char *)buffer, 0x1C0u);
    return stat((const char *)buffer, &v2) == 0;
  }
  return result;
}

uint64_t VSCreateURLAndDirectory(CFURLRef url, CFStringRef pathComponent, const __CFURL **a3)
{
  const __CFURL *v4;
  const __CFURL *v5;
  uint64_t v6;
  uint64_t v7;

  if (!url)
    return 0;
  v4 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], url, pathComponent, 1u);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = VSCreateDirectory(v4);
  v7 = v6;
  if (a3 && (_DWORD)v6)
  {
    *a3 = v5;
    return 1;
  }
  else
  {
    CFRelease(v5);
  }
  return v7;
}

uint64_t VSDirectoryExistsAtURL(uint64_t result, int a2, _BYTE *a3)
{
  int v5;
  stat v6;
  UInt8 buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (result)
  {
    memset(&v6, 0, sizeof(v6));
    result = CFURLGetFileSystemRepresentation((CFURLRef)result, 1u, buffer, 1024);
    if ((_DWORD)result)
    {
      if (stat((const char *)buffer, &v6))
      {
        if (a2 == 1)
        {
          v5 = mkdir((const char *)buffer, 0x1C0u);
          result = v5 == 0;
          if (a3)
          {
            if (!v5)
            {
              result = 1;
              *a3 = 1;
            }
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

uint64_t VSFileExistsAtURL(uint64_t a1)
{
  return VSDirectoryExistsAtURL(a1, 0, 0);
}

BOOL VSCreateTemporaryDirectory(const void *a1, CFStringRef theString, CFURLRef *a3)
{
  CFIndex v6;
  char *v7;
  const __CFAllocator *v8;
  const __CFAllocator *v9;
  const __CFURL *v10;
  const __CFURL *v11;
  char *v12;
  _BOOL8 v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = CFStringGetLength(theString) + 1025;
  v7 = (char *)v17 - ((MEMORY[0x1E0C80A78]() + 1040) & 0xFFFFFFFFFFFFFFF0);
  v8 = CFGetAllocator(a1);
  v9 = v8;
  if (a3)
    *a3 = 0;
  v10 = CFURLCreateCopyAppendingPathComponent(v8, (CFURLRef)a1, theString, 1u);
  if (!v10)
    return 0;
  v11 = v10;
  if (CFURLGetFileSystemRepresentation(v10, 1u, (UInt8 *)v7, v6))
  {
    v12 = mkdtemp(v7);
    v13 = v12 != 0;
    if (a3 && v12)
    {
      v14 = CFStringCreateWithFileSystemRepresentation(v9, v12);
      if (v14)
      {
        v15 = v14;
        v13 = 1;
        *a3 = CFURLCreateWithFileSystemPath(v9, v14, kCFURLPOSIXPathStyle, 1u);
        CFRelease(v15);
      }
      else
      {
        v13 = 1;
      }
    }
  }
  else
  {
    v13 = 0;
  }
  CFRelease(v11);
  return v13;
}

void VSCFURLDeleteDirectoryContents(uint64_t a1)
{
  const __CFArray *v1;
  const __CFArray *v2;
  CFRange v3;

  v1 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(a1, 0);
  if (v1)
  {
    v2 = v1;
    v3.length = CFArrayGetCount(v1);
    v3.location = 0;
    CFArrayApplyFunction(v2, v3, (CFArrayApplierFunction)_DeleteURL, 0);
    CFRelease(v2);
  }
}

id VSCopyContentsOfDirectoryAtURL(uint64_t a1, _QWORD *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1DF0E930C]();
  v18 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a1, MEMORY[0x1E0C9AA60], 0, &v18);
  if (a2)
    *a2 = v18;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "path"), "stringByStandardizingPath");
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v5);
  return v4;
}

void _DeleteURL(const __CFURL *a1)
{
  const __CFString *PathComponent;
  const __CFString *v3;

  if (CFURLHasDirectoryPath(a1))
  {
    PathComponent = CFURLCopyLastPathComponent(a1);
    if (PathComponent)
    {
      v3 = PathComponent;
      if (CFStringCompare(PathComponent, CFSTR("."), 0) == kCFCompareEqualTo
        || CFStringCompare(v3, CFSTR(".."), 0) == kCFCompareEqualTo)
      {
        VSCFURLDeleteDirectoryContents(a1);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a1, 0);
      }
      CFRelease(v3);
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a1, 0);
  }
}

uint64_t VSDeleteItemAtURL(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a1, a2);
}

uint64_t VSCreateDataFromContentsOfURL(uint64_t a1)
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", a1);
}

id VSCopyModificationDateForFileAtURL(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend((id)objc_msgSend(a1, "filePathURL"), "path");
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v1, 0);
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB2A88]);
}

uint64_t _VSRecognitionSessionKeywordIndexChangedNotificationHandler(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_keywordIndexChanged");
}

void sub_1DE17EE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE17F898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1DF0E94A4](a5);
  v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

__CFString *VSLoggingStringForUtterance(void *a1, int a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a1;
  if (objc_msgSend(v3, "length") && !objc_msgSend(v3, "isEqualToString:", CFSTR(" ")))
  {
    if (!a2)
    {
      v5 = CFSTR("<private>");
      goto LABEL_5;
    }
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\x1B"), CFSTR("\\e"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (__CFString *)v3;
  }
  v5 = v4;
LABEL_5:

  return v5;
}

unint64_t _AddAmbiguousKeywords(uint64_t a1, void *a2, void *a3)
{
  unint64_t result;

  result = objc_msgSend(a2, "count");
  if (result >= 2)
    return objc_msgSend(a3, "addObjectsFromArray:", a2);
  return result;
}

uint64_t _AddKnownKeywords(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addObject:", a2);
}

uint64_t _RecognitionPreparedCallBack(uint64_t result, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "_handleRecognitionPrepared:", result);
  return result;
}

uint64_t _RecognitionStartedCallBack(uint64_t result, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "_handleRecognitionStarted:", result);
  return result;
}

uint64_t _RecognitionCompletedCallBack(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
    return objc_msgSend(a4, "_handleRecognitionCompleted:withResults:error:", result, a2, a3);
  return result;
}

void _AddDataProviderToArrayFromInfo(uint64_t a1, CFStringRef theString, id *a3)
{
  void *v5;
  Class v6;
  objc_class *v7;
  id v8;
  id v9;
  CFURLRef v10;
  NSString *aClassName;

  v10 = 0;
  aClassName = 0;
  if (theString
    && a1
    && a3
    && VSRecognitionPluginStringCopyInfo(theString, &v10, (CFStringRef *)&aClassName))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", -[__CFURL path](v10, "path"));
    if (v5)
    {
      objc_msgSend(v5, "load");
      v6 = NSClassFromString(aClassName);
      if (v6)
      {
        v7 = v6;
        if (-[objc_class conformsToProtocol:](v6, "conformsToProtocol:", &unk_1F0444478))
        {
          if (-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_beginReportingChanges)&& -[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_stopReportingChanges))
          {
            v8 = objc_alloc_init(v7);
            v9 = *a3;
            if (!*a3)
            {
              v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              *a3 = v9;
            }
            objc_msgSend(v9, "setObject:forKey:", v8, a1, v10);

          }
        }
      }
    }

  }
}

id VSRecognitionModelDataProviderChanged(uint64_t a1, uint64_t a2)
{
  id result;

  result = +[VSCacheUpdateListener sharedListenerIfExists](VSCacheUpdateListener, "sharedListenerIfExists");
  if (result)
    return (id)objc_msgSend(result, "performUpdateForModelIdentifier:classIdentifier:", a1, a2);
  return result;
}

CFStringRef VSCreate4CCString(unsigned int a1)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  char __str;
  int v8;
  __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = bswap32(a1);
  v8 = v2;
  if ((v2 & 0x80) != 0)
  {
    if (!__maskrune((char)v2, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (char)v2 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  v3 = (__int16)v2 >> 8;
  if ((v2 & 0x8000) != 0)
  {
    if (!__maskrune(v3, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  v4 = v2 << 8 >> 24;
  if ((v2 & 0x800000) != 0)
  {
    if (!__maskrune(v4, 0x40000uLL))
      goto LABEL_17;
LABEL_13:
    v5 = v2 >> 24;
    if (v2 < 0)
    {
      if (!__maskrune(v5, 0x40000uLL))
        goto LABEL_17;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v5 + 60) & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    v9 = 39;
    __str = 39;
    return CFStringCreateWithCString(0, &__str, 0x600u);
  }
  if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v4 + 60) & 0x40000) != 0)
    goto LABEL_13;
LABEL_17:
  if (a1 + 199999 > 0x61A7E)
    snprintf(&__str, 0x10uLL, "0x%x");
  else
    snprintf(&__str, 0x10uLL, "%d");
  return CFStringCreateWithCString(0, &__str, 0x600u);
}

uint64_t VSRecognitionModelCopyResourceURLForLanguage(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFString *a5)
{
  uint64_t result;
  const void *v11;
  uint64_t v12;

  result = _VSRecognitionModelCopyResourceURLForLanguageString(a1, a2, a3, a4, (uint64_t)a5);
  if (!result)
  {
    result = (uint64_t)_VSCopyLanguageCodeFromLanguageIdentifier(a5);
    if (result)
    {
      v11 = (const void *)result;
      v12 = _VSRecognitionModelCopyResourceURLForLanguageString(a1, a2, a3, a4, result);
      CFRelease(v11);
      return v12;
    }
  }
  return result;
}

uint64_t _VSRecognitionModelCopyResourceURLForLanguageString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  uint64_t v10;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), a2, a5);
  v9 = (void *)objc_msgSend(a1, "pathForResource:ofType:inDirectory:", v8, a3, a4);
  if (objc_msgSend(v9, "length"))
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v9);
  else
    v10 = 0;

  return v10;
}

const __CFString *VSRecognitionModelCopyLanguageResourceURL(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFString *result;
  const __CFString *v9;
  uint64_t v10;

  result = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  if (result)
  {
    v9 = result;
    v10 = VSRecognitionModelCopyResourceURLForLanguage(a1, a2, a3, a4, result);
    CFRelease(v9);
    return (const __CFString *)v10;
  }
  return result;
}

uint64_t VSRecognitionModelCopyResourceURL(void *a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v6;
  const __CFString *v7;
  CFArrayRef v8;
  CFArrayRef v9;
  uint64_t v10;
  uint64_t v11;

  v6 = VSPreferencesCopySpokenLanguageIdentifierArray();
  if (v6)
  {
    v7 = v6;
    v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)objc_msgSend(a1, "localizations"), (CFArrayRef)v6);
    if (v8)
    {
      v9 = v8;
      if (-[__CFArray count](v8, "count"))
      {
        v10 = objc_msgSend(a1, "pathForResource:ofType:inDirectory:forLocalization:", a2, a3, 0, -[__CFArray objectAtIndex:](v9, "objectAtIndex:", 0));
        if (v10)
          v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v10);
      }
      else
      {
        v10 = 0;
      }

      CFRelease(v7);
      if (v10)
        return v10;
    }
    else
    {
      CFRelease(v7);
    }
  }
  v11 = objc_msgSend(a1, "pathForResource:ofType:inDirectory:", a2, a3, 0);
  if (v11)
    return objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v11);
  return 0;
}

void sub_1DE1879F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE1890F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DE18A4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE18D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE18D30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerUpdaterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("VSSpeechSynthesizer.m"), 47, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFAudioPowerUpdater");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFAudioPowerUpdaterClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("VSSpeechSynthesizer.m"), 48, CFSTR("Unable to find class %s"), "AFAudioPowerUpdater");

LABEL_8:
    __break(1u);
  }
  getAFAudioPowerUpdaterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__2614(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2615(uint64_t a1)
{

}

void soft_BYSetupAssistantNeedsToRun()
{
  void (*v0)(void);
  void *v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v7 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v3[3] = &unk_1EA8AFF40;
    v3[4] = &v4;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(v3);
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    v0();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_BYSetupAssistantNeedsToRun(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("VSPreferencesInterface.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1DE192E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("VSPreferencesInterface.m"), 23, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_1DE193414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE19407C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE19420C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE194330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE1943FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE19450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE19479C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE1948FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2992(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2993(uint64_t a1)
{

}

void sub_1DE1964AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE19A6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE19AFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE19B19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void remote_VSRecognitionPrepareOrBegin(mach_port_t a1, int a2, int a3, char *src, const char *a5, uint64_t a6, int a7, uint64_t a8, double a9, int a10, char a11, char a12, char a13, _BYTE *a14)
{
  uint64_t (*v18)(_QWORD, _QWORD, _QWORD);
  int v19;
  uint64_t v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  char *v27;
  mach_msg_size_t v28;
  mach_port_t reply_port;
  mach_msg_return_t v30;
  mach_msg_header_t rcv_name;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  _OWORD v42[131];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  memset(v42, 0, 432);
  v34 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v32 = 3;
  v33 = a2;
  v35 = a6;
  v36 = 16777472;
  v37 = a7;
  v38 = a8;
  v39 = 16777472;
  v40 = a10;
  v41 = *MEMORY[0x1E0C804E8];
  LODWORD(v42[0]) = a3;
  v18 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v19 = mig_strncpy_zerofill((char *)v42 + 12, src, 1024);
  else
    v19 = mig_strncpy((char *)v42 + 12, src, 1024);
  DWORD1(v42[0]) = 0;
  DWORD2(v42[0]) = v19;
  v20 = (v19 + 3) & 0xFFFFFFFC;
  v21 = v20 + 128;
  v22 = (char *)&rcv_name + v20;
  v23 = v22 - 1024;
  v24 = v22 + 100;
  if (v18)
    v25 = mig_strncpy_zerofill(v24, a5, 1024);
  else
    v25 = mig_strncpy(v24, a5, 1024);
  *((_DWORD *)v23 + 280) = v25;
  *((_DWORD *)v23 + 279) = 0;
  v26 = (v25 + 3) & 0xFFFFFFFC;
  v27 = &v23[v26];
  *(double *)&v23[v26 + 1124] = a9;
  *((_DWORD *)v27 + 283) = a7;
  *((_DWORD *)v27 + 284) = a10;
  v27[1140] = a11;
  v27[1143] = 0;
  *(_WORD *)&v23[v26 + 1141] = 0;
  v27[1144] = a12;
  v27[1147] = 0;
  *(_WORD *)&v23[v26 + 1145] = 0;
  v27[1148] = a13;
  v27[1151] = 0;
  v28 = v21 + v26;
  *(_WORD *)&v23[v26 + 1149] = 0;
  reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0xF54BE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    reply_port = rcv_name.msgh_local_port;
  }
  v30 = mach_msg(&rcv_name, 3, v28, 0x30u, reply_port, 0, 0);
  if ((v30 - 268435458) <= 0xE && ((1 << (v30 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
  }
  else if (v30)
  {
    mig_dealloc_reply_port(rcv_name.msgh_local_port);
  }
  else if (rcv_name.msgh_id != 1004834
         || (rcv_name.msgh_bits & 0x80000000) != 0
         || rcv_name.msgh_size != 40
         || rcv_name.msgh_remote_port
         || (_DWORD)v34)
  {
    mach_msg_destroy(&rcv_name);
  }
  else
  {
    *a14 = BYTE4(v34);
  }
}

void (*VoiceServicesClient_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 1004734)
    return _XPostNotification;
  else
    return 0;
}

void _XPostNotification(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1)
    goto LABEL_3;
  v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0x40 || v5 > 0x440)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1)
    goto LABEL_16;
  v6 = *(_DWORD *)(a1 + 56);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return;
  }
  v3 = -304;
  if (v5 - 64 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 64)
    goto LABEL_3;
  v8 = *(_DWORD *)(a1 + 40);
  if (v8 != *(_DWORD *)(a1 + v7 + 60))
  {
LABEL_16:
    v3 = -300;
    goto LABEL_3;
  }
  v9 = 1084;
  if (*(unsigned int *)(a1 + 4) < 0x43CuLL)
    v9 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 60), 0, v9 - 60))
    goto LABEL_2;
  client_VSPostNotification((const char *)(a1 + 60), *(const UInt8 **)(a1 + 28), v8);
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0C91EB8](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x1E0C91EC0](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1E0C91EF8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0C91F18](inAudioConverter);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
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

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1E0C97E00](alloc, maxLength);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x1E0C97E20](aStr, loc, attrName, effectiveRange);
}

CFTypeRef CFAttributedStringGetAttributeAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFTypeRef)MEMORY[0x1E0C97E28](aStr, loc, attrName, inRange.location, inRange.length, longestEffectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributesAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x1E0C97E38](aStr, loc, inRange.location, inRange.length, longestEffectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1E0C97E48](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x1E0C97E50](aStr);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C97E70](aStr, range.location, range.length, replacement);
}

void CFAttributedStringSetAttributes(CFMutableAttributedStringRef aStr, CFRange range, CFDictionaryRef replacement, Boolean clearOtherAttributes)
{
  MEMORY[0x1E0C97E80](aStr, range.location, range.length, replacement, clearOtherAttributes);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1E0C98088](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x1E0C98098](bundle, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x1E0C98850](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
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

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
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

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
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

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99398](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99688](stream, buffer, bufferLength);
}

uint64_t CPCreateMIGServerSourceWithContext()
{
  return MEMORY[0x1E0CFA258]();
}

uint64_t CPGetContextForCalloutCurrentMIGServerSource()
{
  return MEMORY[0x1E0CFA298]();
}

uint64_t MAMigrateAssets()
{
  return MEMORY[0x1E0D4DFA8]();
}

uint64_t MAStringForMACancelDownloadResult()
{
  return MEMORY[0x1E0D4DFF0]();
}

uint64_t MAStringForMADownloadResult()
{
  return MEMORY[0x1E0D4DFF8]();
}

uint64_t MAStringForMAOperationResult()
{
  return MEMORY[0x1E0D4E000]();
}

uint64_t MAStringForMAPurgeResult()
{
  return MEMORY[0x1E0D4E008]();
}

uint64_t MAStringForMAQueryResult()
{
  return MEMORY[0x1E0D4E010]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return MEMORY[0x1E0C9A3B0]();
}

uint64_t _CFRuntimeBridgeClasses()
{
  return MEMORY[0x1E0C9A490]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t Observable::remove_observer()
{
  return MEMORY[0x1E0DA7720]();
}

uint64_t Observable::on_event()
{
  return MEMORY[0x1E0DA7728]();
}

uint64_t NeuralTTSUtils::is_amx_available(NeuralTTSUtils *this)
{
  return MEMORY[0x1E0DA7738](this);
}

uint64_t NeuralTTSUtils::is_ane_available(NeuralTTSUtils *this)
{
  return MEMORY[0x1E0DA7740](this);
}

uint64_t NeuralTTSUtils::compile_ane_model(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7748](this, a2);
}

uint64_t NeuralTTSUtils::has_ota_ane_model(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7750](this, a2);
}

uint64_t NeuralTTSUtils::is_ane_only_platform(NeuralTTSUtils *this)
{
  return MEMORY[0x1E0DA7758](this);
}

uint64_t NeuralTTSUtils::is_ane_model_compiled(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7760](this, a2);
}

uint64_t NeuralTTSUtils::is_neural_voice_ready(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7768](this, a2);
}

uint64_t NeuralTTSUtils::is_neural_tts_platform(NeuralTTSUtils *this)
{
  return MEMORY[0x1E0DA7770](this);
}

uint64_t NeuralTTSUtils::should_use_neural_voice(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7780](this, a2);
}

uint64_t NeuralTTSUtils::has_compact_neural_fallback(NeuralTTSUtils *this, const char *a2)
{
  return MEMORY[0x1E0DA7790](this, a2);
}

uint64_t NeuralTTSUtils::check_thermal_critical_conditions(NeuralTTSUtils *this)
{
  return MEMORY[0x1E0DA7798](this);
}

uint64_t TTSSynthesizer::initialize()
{
  return MEMORY[0x1E0DA77A0]();
}

uint64_t TTSSynthesizer::get_event_bus(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA77A8](this);
}

uint64_t TTSSynthesizer::stop_synthesis(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA77B0](this);
}

uint64_t TTSSynthesizer::set_neural_cost()
{
  return MEMORY[0x1E0DA77B8]();
}

uint64_t TTSSynthesizer::unload_resource()
{
  return MEMORY[0x1E0DA77C8]();
}

uint64_t TTSSynthesizer::load_voice_resource()
{
  return MEMORY[0x1E0DA77D0]();
}

uint64_t TTSSynthesizer::set_global_property()
{
  return MEMORY[0x1E0DA77D8]();
}

uint64_t TTSSynthesizer::has_phatic_responses()
{
  return MEMORY[0x1E0DA77E0]();
}

uint64_t TTSSynthesizer::set_censor_plaintext(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA77E8](this);
}

uint64_t TTSSynthesizer::get_voice_description(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA77F0](this);
}

uint64_t TTSSynthesizer::get_engine_description(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA77F8](this);
}

uint64_t TTSSynthesizer::synthesize_text_with_markers_async()
{
  return MEMORY[0x1E0DA7800]();
}

uint64_t TTSSynthesizer::preheat(TTSSynthesizer *this)
{
  return MEMORY[0x1E0DA7808](this);
}

void TTSSynthesizer::TTSSynthesizer(TTSSynthesizer *this)
{
  MEMORY[0x1E0DA7810](this);
}

void TTSSynthesizer::~TTSSynthesizer(TTSSynthesizer *this)
{
  MEMORY[0x1E0DA7818](this);
}

uint64_t SiriTTS::TextToPhoneme::text_to_phoneme()
{
  return MEMORY[0x1E0DA7830]();
}

uint64_t SiriTTS::TextToPhoneme::TextToPhoneme()
{
  return MEMORY[0x1E0DA7838]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1EA8AE5C0(__p);
}

uint64_t operator delete()
{
  return off_1EA8AE5C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA8AE5D0(__sz);
}

uint64_t operator new()
{
  return off_1EA8AE5D8();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
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

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C840F8](a1, a2);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x1E0DE7C20](dest, src, copyHelper);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

