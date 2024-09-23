BOOL PCSServiceItemTypeIsManatee(_BOOL8 key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = (const void *)key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    if (CFEqual(*(CFTypeRef *)(v2 + 16), CFSTR("Raw")))
      return 0;
    return *(_BYTE *)(v2 + 74) != 0;
  }
  return key;
}

void sub_1A9509930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSServiceItemGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSServiceItemGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSServiceItemGetTypeID_sPCSServiceItemGetTypeIDSingleton;
  if (PCSServiceItemGetTypeID_sPCSServiceItemGetTypeIDOnce != -1)
    dispatch_once(&PCSServiceItemGetTypeID_sPCSServiceItemGetTypeIDOnce, block);
  return PCSServiceItemGetTypeID_sPCSServiceItemGetTypeIDSingleton;
}

void sub_1A950A290(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PCSPEMReaderGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __PCSPEMReaderGetTypeID_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = &PCSPEMReaderGetTypeID_sPCSPEMReaderGetTypeIDSingleton;
  if (PCSPEMReaderGetTypeID_sPCSPEMReaderGetTypeIDOnce != -1)
    dispatch_once(&PCSPEMReaderGetTypeID_sPCSPEMReaderGetTypeIDOnce, block);
  return PCSPEMReaderGetTypeID_sPCSPEMReaderGetTypeIDSingleton;
}

void PCSPEMReaderDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  v2 = (const void *)a1[2];
  if (v2)
  {
    a1[2] = 0;
    CFRelease(v2);
  }
  v3 = (const void *)a1[5];
  if (v3)
  {
    a1[5] = 0;
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4)
  {
    a1[6] = 0;
    CFRelease(v4);
  }
  v5 = (const void *)a1[7];
  if (v5)
  {
    a1[7] = 0;
    CFRelease(v5);
  }
  v6 = (const void *)a1[10];
  if (v6)
  {
    a1[10] = 0;
    CFRelease(v6);
  }
  v7 = (const void *)a1[2];
  if (v7)
  {
    a1[2] = 0;
    CFRelease(v7);
  }
  v8 = (const void *)a1[8];
  if (v8)
  {
    a1[8] = 0;
    CFRelease(v8);
  }
}

BOOL PCSPEMReaderCompare(const void *a1, const void *a2)
{
  CFTypeID v4;
  CFTypeID v5;

  v4 = CFGetTypeID(a1);
  if (v4 != PCSPEMReaderGetTypeID())
    return 0;
  v5 = CFGetTypeID(a2);
  return v5 == PCSPEMReaderGetTypeID() && a1 == a2;
}

CFStringRef PCSPEMReaderCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<PCSPEMReader@%p>"), a1);
}

_QWORD *PCSPEMReaderCreate(const void *a1)
{
  _QWORD *Instance;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;

  PCSPEMReaderGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  Instance[2] = CFRetain(a1);
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  Instance[3] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Instance[6] = CFDictionaryCreateMutable(0, 0, v3, MEMORY[0x1E0C9B3A0]);
  Instance[7] = CFDictionaryCreateMutable(0, 0, v3, v4);
  Instance[5] = 0;
  Instance[8] = CFDataCreateMutable(0, 0);
  Instance[9] = CFDataCreateMutable(0, 0);
  Instance[10] = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  Instance[12] = PEMStateBefore;
  return Instance;
}

uint64_t PEMStateBefore(uint64_t a1)
{
  const __CFData *Line;
  const __CFData *v3;
  const __CFData *v4;
  const __CFData *v5;
  CFIndex location;
  uint64_t result;
  CFIndex v8;
  const void *v9;
  const UInt8 *BytePtr;
  CFRange v11;
  CFRange v12;

  if (PEMStateBefore_onceToken != -1)
    dispatch_once(&PEMStateBefore_onceToken, &__block_literal_global);
  Line = (const __CFData *)getLine(a1);
  if (Line)
  {
    v3 = Line;
    v4 = (const __CFData *)PEMMarkerBegin;
    v11.length = CFDataGetLength(Line);
    v11.location = 0;
    if (CFDataFind(v3, v4, v11, 2uLL).location != -1)
    {
      v5 = (const __CFData *)PEMMarkerBeginEnd;
      v12.length = CFDataGetLength(v3);
      v12.location = 11;
      location = CFDataFind(v3, v5, v12, 0).location;
      if ((unint64_t)(location + 1) <= 1)
      {
        CFRelease(v3);
        result = 0;
        *(_QWORD *)(a1 + 96) = PEMStateError;
        return result;
      }
      v8 = location;
      v9 = *(const void **)(a1 + 40);
      if (v9)
      {
        *(_QWORD *)(a1 + 40) = 0;
        CFRelease(v9);
      }
      BytePtr = CFDataGetBytePtr(v3);
      *(_QWORD *)(a1 + 40) = CFStringCreateWithBytes(0, BytePtr + 11, v8 - 11, 0x8000100u, 0);
      *(_QWORD *)(a1 + 96) = PEMStateSearchHeaders;
    }
    CFRelease(v3);
    return 1;
  }
  else
  {
    result = 0;
    if (*(_BYTE *)(a1 + 89))
      *(_BYTE *)(a1 + 88) = 1;
  }
  return result;
}

void PCSPEMReaderAddParser(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), a2, a3);
}

void PCSPEMReaderSetParameter(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), a2, a3);
}

const void *PCSPEMReaderGetParameter(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
}

uint64_t PCSPEMReaderRun(uint64_t a1)
{
  CFIndex v2;
  UInt8 v4[1000];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    if (*(_BYTE *)(a1 + 89))
      goto LABEL_7;
    v2 = CFReadStreamRead(*(CFReadStreamRef *)(a1 + 16), v4, 1000);
    if (v2 < 0)
      return 0;
    if (v2)
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 64), v4, v2);
    else
      *(_BYTE *)(a1 + 89) = 1;
LABEL_7:
    while (((*(uint64_t (**)(uint64_t))(a1 + 96))(a1) & 1) != 0)
      ;
    if (*(_BYTE *)(a1 + 88))
      return 1;
  }
}

uint64_t PCSPEMReaderGetResult(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

CFIndex getLine(uint64_t a1)
{
  CFIndex result;
  const __CFData *v3;
  const __CFData *v4;
  CFIndex location;
  CFIndex Length;
  uint64_t v7;
  const UInt8 *BytePtr;
  int v9;
  _BOOL8 v10;
  CFDataRef v11;
  CFRange v12;
  CFRange v13;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    *(_QWORD *)(a1 + 32) = 0;
    return result;
  }
  if (!*(_BYTE *)(a1 + 89) || (result = CFDataGetLength(*(CFDataRef *)(a1 + 64))) != 0)
  {
    v3 = *(const __CFData **)(a1 + 64);
    v4 = (const __CFData *)PEMMarkerNewline;
    v13.length = CFDataGetLength(v3);
    v13.location = 0;
    location = CFDataFind(v3, v4, v13, 0).location;
    if (location == -1)
    {
      if (!*(_BYTE *)(a1 + 89))
        return 0;
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 64));
      v7 = 0;
    }
    else
    {
      Length = location;
      v7 = 1;
    }
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
    if (Length)
    {
      v9 = BytePtr[Length - 1];
      v10 = v9 == 13;
      if (v9 == 13)
        --Length;
    }
    else
    {
      v10 = 0;
    }
    v11 = CFDataCreate(0, BytePtr, Length);
    v12.length = v10 + v7 + Length;
    v12.location = 0;
    CFDataDeleteBytes(*(CFMutableDataRef *)(a1 + 64), v12);
    return (CFIndex)v11;
  }
  return result;
}

void PEMStateError()
{
  abort();
}

BOOL PEMStateSearchHeaders(uint64_t a1)
{
  const __CFData *Line;
  const __CFData *v3;
  const __CFData *v4;
  CFRange v5;
  const UInt8 *BytePtr;
  CFStringRef v7;
  CFIndex Length;
  CFStringRef v9;
  CFRange v11;

  Line = (const __CFData *)getLine(a1);
  v3 = Line;
  if (Line)
  {
    v4 = (const __CFData *)PEMMarkerHeader;
    v11.length = CFDataGetLength(Line);
    v11.location = 0;
    v5 = CFDataFind(v3, v4, v11, 0);
    if (v5.location == -1)
    {
      *(_QWORD *)(a1 + 96) = PEMStateInData;
      *(_QWORD *)(a1 + 32) = v3;
    }
    else
    {
      BytePtr = CFDataGetBytePtr(v3);
      v7 = CFStringCreateWithBytes(0, BytePtr, v5.location, 0x8000100u, 0);
      Length = CFDataGetLength(v3);
      v9 = CFStringCreateWithBytes(0, &BytePtr[v5.location + v5.length], Length - (v5.location + v5.length), 0x8000100u, 0);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), v7, v9);
      CFRelease(v7);
      CFRelease(v9);
      CFRelease(v3);
    }
  }
  return v3 != 0;
}

CFIndex PEMStateInData(uint64_t a1)
{
  CFIndex result;
  const __CFData *v3;
  const __CFData *v4;
  const __CFData *v5;
  CFIndex Length;
  const __CFData *v7;
  uint64_t v8;
  CFIndex v9;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  UInt8 *v12;
  CFIndex v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  __CFData *v21;
  const UInt8 *BytePtr;
  CFIndex v23;
  UInt8 buffer[4];
  CFRange v25;
  CFRange v26;

  result = getLine(a1);
  if (!result)
    return result;
  v3 = (const __CFData *)result;
  v4 = (const __CFData *)PEMMarkerEnd;
  v26.length = CFDataGetLength((CFDataRef)result);
  v26.location = 0;
  if (CFDataFind(v3, v4, v26, 2uLL).location != -1)
  {
    *(_QWORD *)(a1 + 96) = PEMStateDone;
    v5 = v3;
    goto LABEL_4;
  }
  Length = CFDataGetLength(v3);
  if ((Length & 3) != 0)
  {
    v7 = v3;
LABEL_7:
    CFRelease(v7);
    return 0;
  }
  v8 = Length;
  v9 = 3 * (Length / 4);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v9);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  if (v8 < 1)
    goto LABEL_30;
  v12 = MutableBytePtr;
  v13 = 0;
  v14 = 0;
  do
  {
    while (1)
    {
      v25.location = v13;
      v25.length = 4;
      CFDataGetBytes(v3, v25, buffer);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      do
      {
        v17 <<= 6;
        v18 = buffer[v15];
        if (v18 == 61)
        {
          ++v16;
        }
        else
        {
          if (v16 >= 1)
            goto LABEL_34;
          v17 += tokenDecode_base64_chars_inverted[v18];
        }
        ++v15;
      }
      while (v15 != 4);
      if (v16 >= 3)
LABEL_34:
        abort();
      v19 = v17 | (v16 << 24);
      if (v19 == -1)
        PEMStateInData_cold_1(Mutable);
      v20 = HIBYTE(v19);
      if ((_DWORD)v20)
      {
        if (v13 + 4 != v8)
        {
          printf("%d %d %d\n", HIBYTE(v19), v14, v8);
          abort();
        }
      }
      *v12 = BYTE2(v17);
      if (v19 >> 25)
      {
        ++v14;
        v13 = 4 * v14;
        ++v12;
        goto LABEL_28;
      }
      v12[1] = BYTE1(v17);
      if ((_DWORD)v20)
        break;
      v12[2] = v17;
      v12 += 3;
      ++v14;
      v13 = 4 * v14;
      if (4 * v14 >= v8)
        goto LABEL_30;
    }
    v12 += 2;
    ++v14;
    v13 = 4 * v14;
LABEL_28:
    ;
  }
  while (v13 < v8);
  CFDataSetLength(Mutable, v9 - v20);
LABEL_30:
  CFRelease(v3);
  if (!Mutable)
    return 0;
  if (!CFDataGetLength(Mutable))
  {
    v7 = Mutable;
    goto LABEL_7;
  }
  v21 = *(__CFData **)(a1 + 72);
  BytePtr = CFDataGetBytePtr(Mutable);
  v23 = CFDataGetLength(Mutable);
  CFDataAppendBytes(v21, BytePtr, v23);
  v5 = Mutable;
LABEL_4:
  CFRelease(v5);
  return 1;
}

uint64_t PEMStateDone(uint64_t a1)
{
  const void *Value;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), *(const void **)(a1 + 40));
  if (Value || (Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("ANY"))) != 0)
  {
    v3 = (const void *)((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))Value)(a1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    if (v3)
    {
      v4 = v3;
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 80), v3);
      CFRelease(v4);
    }
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    *(_QWORD *)(a1 + 40) = 0;
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 48);
  if (v6)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v6);
  }
  *(_QWORD *)(a1 + 48) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = *(const void **)(a1 + 72);
  if (v7)
  {
    *(_QWORD *)(a1 + 72) = 0;
    CFRelease(v7);
  }
  *(_QWORD *)(a1 + 72) = CFDataCreateMutable(0, 0);
  *(_QWORD *)(a1 + 96) = PEMStateBefore;
  return 1;
}

uint64_t PCSIdentityRollIdentity(uint64_t a1, CFTypeRef cf1, const void **a3)
{
  const void *v6;
  const void *v7;
  CFTypeRef Master;
  const void *v9;
  uint64_t v10;
  NSObject *v11;
  const void *v13;
  _BOOL4 IsManatee;
  NSObject *v15;
  _BOOL4 v16;
  char v17;
  _QWORD *Service;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  int v22;
  CFTypeRef v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (CFEqual(cf1, kPCSServiceMaster))
  {
    v6 = _PCSIdentitySetCopyCurrentIdentityInternal(a1, kPCSServiceMaster, a3);
    if (v6)
    {
      v7 = v6;
      Master = PCSIdentityCreateMaster((uint64_t)v6, a3);
      if (Master)
      {
        v9 = Master;
        if ((PCSIdentitySetAddIdentity(a1, (uint64_t)Master) & 1) == 0)
        {
LABEL_32:
          v10 = 0;
          goto LABEL_7;
        }
        goto LABEL_5;
      }
      goto LABEL_36;
    }
    return 0;
  }
  if (!CFEqual(cf1, kPCSServiceEscrow) && !CFEqual(cf1, kPCSServiceFDE))
  {
    v13 = _PCSIdentitySetCopyCurrentIdentityInternal(a1, kPCSServiceMaster, a3);
    if (v13)
    {
      v7 = v13;
      IsManatee = PCSServiceItemTypeIsManatee((_BOOL8)cf1);
      pcsLogObjForScope("keyRoll");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (IsManatee)
      {
        if (v16)
        {
          v22 = 138412290;
          v23 = cf1;
          _os_log_impl(&dword_1A9508000, v15, OS_LOG_TYPE_DEFAULT, "Asked to roll key for Manatee Service Identity %@", (uint8_t *)&v22, 0xCu);
        }
        v17 = 5;
      }
      else
      {
        if (v16)
        {
          v22 = 138412290;
          v23 = cf1;
          _os_log_impl(&dword_1A9508000, v15, OS_LOG_TYPE_DEFAULT, "Asked to roll key for Non-Manatee Service Identity %@", (uint8_t *)&v22, 0xCu);
        }
        v17 = 1;
      }

      Service = PCSIdentityCreateService((uint64_t)v7, v17, (const __CFNumber *)cf1, a3);
      if (Service)
      {
        v9 = Service;
        if ((PCSIdentitySetAddIdentityWithError(a1, (uint64_t)Service, a3) & 1) == 0)
        {
          pcsLogObjForScope("keyRoll");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:

            goto LABEL_32;
          }
          v22 = 138412290;
          v23 = cf1;
          v20 = "Failed to add new key for Service Identity %@";
LABEL_30:
          _os_log_impl(&dword_1A9508000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
          goto LABEL_31;
        }
LABEL_5:
        if ((PCSIdentitySetSetCurrentIdentity(a1, (uint64_t)v9) & 1) != 0)
        {
          v10 = 1;
LABEL_7:
          CFRelease(v9);
LABEL_8:
          CFRelease(v7);
          return v10;
        }
        pcsLogObjForScope("keyRoll");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v22 = 138412290;
        v23 = cf1;
        v20 = "Failed to set new key as current for Service Identity %@";
        goto LABEL_30;
      }
      pcsLogObjForScope("keyRoll");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = cf1;
        _os_log_impl(&dword_1A9508000, v21, OS_LOG_TYPE_DEFAULT, "Failed to create key for Service Identity %@", (uint8_t *)&v22, 0xCu);
      }

LABEL_36:
      v10 = 0;
      goto LABEL_8;
    }
    return 0;
  }
  pcsLogObjForScope("keyRoll");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = cf1;
    _os_log_impl(&dword_1A9508000, v11, OS_LOG_TYPE_DEFAULT, "Skipping Rolling Service Identity for %@", (uint8_t *)&v22, 0xCu);
  }

  return 1;
}

void PCSTapToRadar(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  CFUserNotificationRef v16;
  _QWORD block[5];
  _QWORD v18[4];
  _QWORD v19[4];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCS Triggering TTR: %@: %@", buf, 0x16u);
  }
  v7 = (void *)MEMORY[0x1AF415520]();
  if (_PCSIsInternalRelease() && !pendingTTREvent)
  {
    if ((a2 & 1) == 0)
    {
      v8 = (void *)CFPreferencesCopyAppValue((CFStringRef)kPCSNextTTRDate, (CFStringRef)kPCSPreferenceDomain);
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "compare:", v9);

        if (v10 != -1)
          goto LABEL_14;
      }
      else
      {

      }
    }
    v11 = (const __CFString *)kPCSNextTTRDate;
    v12 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    CFPreferencesSetAppValue(v11, v12, (CFStringRef)kPCSPreferenceDomain);
    CFPreferencesAppSynchronize((CFStringRef)kPCSPreferenceDomain);
    v13 = *MEMORY[0x1E0C9B830];
    v18[0] = *MEMORY[0x1E0C9B838];
    v18[1] = v13;
    v19[0] = CFSTR("Tap-To-Radar");
    v19[1] = CFSTR("Go away");
    v14 = *MEMORY[0x1E0C9B800];
    v18[2] = *MEMORY[0x1E0C9B810];
    v18[3] = v14;
    v19[2] = v5;
    v19[3] = CFSTR("PCS");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&pendingTTREvent, a3);
    *(_DWORD *)buf = 0;
    v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, (SInt32 *)buf, v15);
    if (v16)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __PCSTapToRadar_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
LABEL_14:
  objc_autoreleasePoolPop(v7);

}

void PCSTTRUserNotificationCallback(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    if (PCSTTRUserNotificationCallback_onceToken != -1)
      dispatch_once(&PCSTTRUserNotificationCallback_onceToken, &__block_literal_global_0);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v2 = (void *)getLSApplicationWorkspaceClass_softClass;
    v14 = getLSApplicationWorkspaceClass_softClass;
    if (!getLSApplicationWorkspaceClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getLSApplicationWorkspaceClass_block_invoke;
      v10[3] = &unk_1E553DCC0;
      v10[4] = &v11;
      __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v10);
      v2 = (void *)v12[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v11, 8);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)pendingTTREvent, "stringByAddingPercentEncodingWithAllowedCharacters:", PCSTTRUserNotificationCallback_queryComponent);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("tap-to-radar://new?Reproducibilty=Always&Title=LocalBackup%%20IdentityMissing&ComponentName=ProtectedCloudStorage&ComponentVersion=all&Reproducibility=Not%%20Applicable&ComponentID=574585&Classification=Crash/Hang/Data%%20Loss&Description=%@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "defaultWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:configuration:completionHandler:", v7, 0, &__block_literal_global_20);

      v9 = (void *)pendingTTREvent;
      pendingTTREvent = 0;

    }
  }
}

void sub_1A950BBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    MobileCoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileCoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getLSApplicationWorkspaceClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("LSApplicationWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL PCSManateeShareableIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PCSManateePrivateKey *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(PCSManateePrivateKey);
        v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(PCSManateePrivateKey);
        v18 = 8;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || !PCSManateePrivateKeyReadFrom((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFData *PCSFPCopyUnwrappedKey(uint64_t a1, const void *a2, const __CFData *a3, const void **a4)
{
  uint64_t v8;
  CFIndex Length;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFData *Value;
  CFIndex v18;
  __CFData *Mutable;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  CFIndex v24;
  char v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ccaes_ecb_decrypt_mode();
  v8 = ccecb_context_size();
  MEMORY[0x1E0C80A78](v8);
  Length = CFDataGetLength(a3);
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v10, v11, v12, v13, v14, v15, v16, v25);
  if (Length <= 23)
  {
    v24 = Length;
    v22 = CFSTR("wrapped data too small: %ld");
    goto LABEL_13;
  }
  if ((Length & 7) != 0)
  {
    v24 = Length;
    v22 = CFSTR("wrapped data invalid length: %ld");
    goto LABEL_13;
  }
  Value = *(const __CFData **)(a1 + 72);
  if (!Value)
  {
    _PCSError(a4, 25, CFSTR("can't unwrap object w/o masterkey"));
    goto LABEL_14;
  }
  if (a2)
  {
    if (CFEqual(a2, *(CFTypeRef *)(a1 + 80)))
    {
      Value = *(const __CFData **)(a1 + 72);
    }
    else
    {
      Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 112), a2);
      if (!Value)
      {
        _PCSError(a4, 11, CFSTR("Failed to find master key of id %@"), a2);
        goto LABEL_14;
      }
    }
  }
  if (!_PCSCreateDerivedKey(Value, 20, (int)&wrappingKeyLabel, 0x10uLL, (int)&v26, 0))
  {
LABEL_14:
    Mutable = 0;
    goto LABEL_16;
  }
  ccecb_init();
  v18 = ccwrap_unwrapped_size();
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v18);
  if (Mutable)
  {
    CFDataGetBytePtr(a3);
    CFDataGetMutableBytePtr(Mutable);
    v20 = ccwrap_auth_decrypt();
    if ((_DWORD)v20)
    {
      v21 = v20;
      CFRelease(Mutable);
      v24 = v21;
      v22 = CFSTR("auth decrypt failed (%d)");
LABEL_13:
      _PCSError(a4, 18, v22, v24);
      goto LABEL_14;
    }
    if (CFDataGetLength(Mutable))
      PCSFPCopyUnwrappedKey_cold_1();
  }
LABEL_16:
  ccecb_context_size();
  cc_clear();
  return Mutable;
}

__CFData *PCSFPCopyWrappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  __CFData *Mutable;
  uint64_t v16;
  uint64_t v17;
  char v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ccaes_ecb_encrypt_mode();
  v6 = ccecb_context_size();
  MEMORY[0x1E0C80A78](v6);
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v7, v8, v9, v10, v11, v12, v13, v19);
  if (!_PCSCreateDerivedKey(*(const __CFData **)(a1 + 72), 20, (int)&wrappingKeyLabel, 0x10uLL, (int)&v20, 0))
    goto LABEL_7;
  ccecb_init();
  CFDataGetLength(a2);
  v14 = ccwrap_wrapped_size();
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v14);
  CFDataGetLength(a2);
  CFDataGetBytePtr(a2);
  CFDataGetMutableBytePtr(Mutable);
  v16 = ccwrap_auth_encrypt();
  if ((_DWORD)v16)
  {
    v17 = v16;
    if (Mutable)
      CFRelease(Mutable);
    _PCSError(a3, 19, CFSTR("wrap failed (%d)"), v17);
LABEL_7:
    Mutable = 0;
    goto LABEL_9;
  }
  if (CFDataGetLength(Mutable))
    PCSFPCopyWrappedKey_cold_1();
LABEL_9:
  ccecb_context_size();
  cc_clear();
  return Mutable;
}

__CFData *PCSFPCopyEncryptedData(uint64_t a1, const __CFData *a2, const void *a3, const void **a4)
{
  uint64_t v8;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFData *v17;
  CFIndex v18;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  char v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = ccaes_gcm_encrypt_mode();
  MEMORY[0x1E0C80A78](v8);
  if (!a1)
  {
    _PCSError(a4, 128, CFSTR("EncryptedData sp argument NULL"));
    goto LABEL_15;
  }
  if (!a3 || (v9 = CFGetTypeID(a3), v9 != CFDataGetTypeID()))
  {
    _PCSError(a4, 126, CFSTR("EncryptedData plaintext argument not CFData"));
    goto LABEL_15;
  }
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v10, v11, v12, v13, v14, v15, v16, v22);
  v17 = *(const __CFData **)(a1 + 72);
  if (!v17)
  {
    _PCSError(a4, 25, CFSTR("can't encrypt object w/o masterkey"));
    goto LABEL_15;
  }
  if (!_PCSCreateDerivedKey(v17, 20, (int)&encryptionKeyLabel, 0x10uLL, (int)&v23, 0))
  {
LABEL_15:
    Mutable = 0;
    goto LABEL_10;
  }
  ccgcm_init();
  v18 = CFDataGetLength((CFDataRef)a3) + 30;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v18);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *MutableBytePtr = 3;
  *(_WORD *)(MutableBytePtr + 1) = *(_WORD *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 80));
  MutableBytePtr[3] = 2;
  *((_WORD *)MutableBytePtr + 2) = *((_WORD *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 80)) + 1);
  _PCSRandomData(0xCuLL, MutableBytePtr + 6);
  ccgcm_set_iv();
  ccgcm_aad();
  if (a2)
  {
    CFDataGetLength(a2);
    CFDataGetBytePtr(a2);
    ccgcm_aad();
  }
  CFDataGetLength((CFDataRef)a3);
  CFDataGetBytePtr((CFDataRef)a3);
  ccgcm_update();
  ccgcm_finalize();
LABEL_10:
  ccgcm_context_size();
  cc_clear();
  return Mutable;
}

__CFData *PCSFPCopyDecryptedData(uint64_t a1, const void *a2, const __CFData *a3, CFTypeRef cf, const void **a5)
{
  CFTypeID v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFData *Value;
  __CFData *v19;
  CFIndex Length;
  const __CFDictionary *v22;
  char v23;
  _QWORD context[10];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  if (!a1)
  {
    _PCSError(a5, 128, CFSTR("DecryptedData sp argument NULL"));
    goto LABEL_16;
  }
  if (!cf || (v10 = CFGetTypeID(cf), v10 != CFDataGetTypeID()))
  {
    _PCSError(a5, 126, CFSTR("DecryptedData cryptotext argument not CFData"));
    goto LABEL_16;
  }
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v11, v12, v13, v14, v15, v16, v17, v23);
  Value = *(const __CFData **)(a1 + 72);
  if (!Value)
  {
    _PCSError(a5, 25, CFSTR("can't decrypt object w/o masterkey"));
    goto LABEL_16;
  }
  if (!a2)
  {
LABEL_9:
    v19 = PCSFPCopyDecryptedDataWithKey(Value, a3, (const __CFData *)cf, a5);
    goto LABEL_10;
  }
  if (CFEqual(a2, *(CFTypeRef *)(a1 + 80)))
  {
    Value = *(const __CFData **)(a1 + 72);
    goto LABEL_9;
  }
  if (CFDataGetLength((CFDataRef)a2) > 4)
  {
    Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 112), a2);
    if (Value)
      goto LABEL_9;
    _PCSError(a5, 11, CFSTR("Failed to find master key of id %@"), a2);
LABEL_16:
    v19 = 0;
    goto LABEL_10;
  }
  v19 = PCSFPCopyDecryptedDataWithKey(*(const __CFData **)(a1 + 72), a3, (const __CFData *)cf, a5);
  v26[3] = (uint64_t)v19;
  if (!v19)
  {
    Length = CFDataGetLength((CFDataRef)a2);
    v22 = *(const __CFDictionary **)(a1 + 112);
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 0x40000000;
    context[2] = __PCSFPCopyDecryptedData_block_invoke;
    context[3] = &unk_1E553DD00;
    context[4] = &v25;
    context[5] = Length;
    context[6] = a2;
    context[7] = a5;
    context[8] = a3;
    context[9] = cf;
    CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)apply_block_2, context);
    v19 = (__CFData *)v26[3];
  }
LABEL_10:
  _Block_object_dispose(&v25, 8);
  return v19;
}

__CFData *PCSFPCopyDecryptedDataWithKey(const __CFData *a1, const __CFData *a2, const __CFData *a3, const void **a4)
{
  uint64_t v7;
  unint64_t Length;
  const UInt8 *BytePtr;
  const UInt8 *v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  __CFData *Mutable;
  unint64_t v15;
  CFIndex v16;
  const __CFString *v17;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  const void **v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = ccaes_gcm_decrypt_mode();
  MEMORY[0x1E0C80A78](v7);
  Length = CFDataGetLength(a3);
  if (_PCSCreateDerivedKey(a1, 20, (int)&encryptionKeyLabel, 0x10uLL, (int)&v24, 0))
  {
    ccgcm_init();
    BytePtr = CFDataGetBytePtr(a3);
    v10 = BytePtr;
    if ((uint64_t)Length >= 1)
    {
      v11 = *BytePtr;
      v22 = a4;
      a4 = 0;
      v12 = 12;
      switch(*BytePtr)
      {
        case 0u:
          if ((_PCSIsInternalRelease() & 1) != 0)
          {
            v11 = 0;
            a4 = 0;
            v12 = 8;
            goto LABEL_13;
          }
          a4 = v22;
          _PCSError(v22, 43, CFSTR("Version 0 encrypted data only support on internal releases"));
          break;
        case 1u:
          v11 = 0;
          a4 = 0;
          v12 = 12;
          goto LABEL_13;
        case 2u:
          goto LABEL_13;
        case 3u:
          if (Length <= 3)
            goto LABEL_39;
          a4 = (const void **)(BytePtr[3] + 1);
          v12 = 12;
          v11 = 2;
          goto LABEL_13;
        case 4u:
          if (Length <= 5)
          {
LABEL_39:
            v19 = CFSTR("Crypto text too short for header");
          }
          else
          {
            a4 = (const void **)(BytePtr[5] + 1);
            v12 = 12;
            v11 = 4;
LABEL_13:
            v15 = (unint64_t)a4 + (v11 | 1) + v12 + 12;
            if (Length >= v15)
            {
              v16 = CFDataGetLength(a3) - v15;
              Mutable = CFDataCreateMutable(0, 0);
              CFDataSetLength(Mutable, v16);
              if (Mutable)
              {
                v13 = malloc_type_malloc(v12, 0xA557CBD8uLL);
                if (v13)
                {
                  ccgcm_set_iv();
                  ccgcm_aad();
                  if (a2)
                  {
                    CFDataGetLength(a2);
                    CFDataGetBytePtr(a2);
                    ccgcm_aad();
                  }
                  CFDataGetLength(Mutable);
                  CFDataGetMutableBytePtr(Mutable);
                  ccgcm_update();
                  ccgcm_finalize();
                  if (!cc_cmp_safe())
                  {
                    ccgcm_context_size();
                    cc_clear();
                    v24 = 0;
                    v25 = 0;
                    free(v13);
                    return Mutable;
                  }
                  if (*v10 < 3u)
                  {
                    v20 = *v10;
                    v17 = CFSTR("Tag doesn't verify: version %d");
                  }
                  else
                  {
                    v20 = v10[1];
                    v21 = v10[2];
                    v17 = CFSTR("Tag doesn't verify: keyid: 0x%02x%02x");
                  }
                  a4 = v22;
                  _PCSError(v22, 21, v17, v20, v21);
LABEL_24:
                  ccgcm_context_size();
                  cc_clear();
                  v24 = 0;
                  v25 = 0;
                  if (v13)
                    free(v13);
                  if (Mutable)
                    CFRelease(Mutable);
                  if (!a4)
                    return 0;
                  goto LABEL_29;
                }
              }
              else
              {
                v13 = 0;
              }
              a4 = v22;
              goto LABEL_24;
            }
            v19 = CFSTR("Crypto text too short");
          }
          a4 = v22;
          _PCSError(v22, 20, v19);
          break;
        default:
          _PCSError(0, 43, CFSTR("Unsupported crypto data version: %u"), v11);
          break;
      }
LABEL_7:
      v13 = 0;
      Mutable = 0;
      goto LABEL_24;
    }
    if (BytePtr)
      goto LABEL_7;
  }
  v24 = 0;
  v25 = 0;
  if (a4)
  {
LABEL_29:
    if (!*a4)
      _PCSError(a4, -50, CFSTR("Failure with no CFError, made this one up."));
  }
  return 0;
}

CFDataRef PCSFPCopyTruncatedKeyIDFromEncryptedData(const void *a1, const void **a2)
{
  CFTypeID v4;
  CFIndex Length;
  unint64_t v6;
  const UInt8 *BytePtr;
  int v8;
  CFIndex v9;
  UInt8 *v10;
  CFDataRef result;
  UInt8 bytes[2];
  __int16 v13;

  if (!a1 || (v4 = CFGetTypeID(a1), v4 != CFDataGetTypeID()))
  {
    _PCSError(a2, 35, CFSTR("TruncatedKeyID is not data"));
    return 0;
  }
  Length = CFDataGetLength((CFDataRef)a1);
  if (Length >= 1)
  {
    v6 = Length;
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    v8 = *BytePtr;
    if ((v8 - 2) >= 2)
    {
      if (v8 != 4)
      {
        _PCSError(a2, 43, CFSTR("Unsupported crypto data version: %u"), *BytePtr);
        return 0;
      }
      if (v6 > 4)
      {
        v10 = (UInt8 *)(BytePtr + 1);
        v9 = 4;
LABEL_15:
        result = CFDataCreate(0, v10, v9);
        if (result)
          return result;
        _PCSErrorOOM(a2);
        return 0;
      }
    }
    else if (v6 > 3)
    {
      *(_WORD *)bytes = *(_WORD *)(BytePtr + 1);
      if (v8 != 3 || BytePtr[3] < 2u)
      {
        v9 = 2;
        goto LABEL_14;
      }
      if (v6 > 5)
      {
        v13 = *((_WORD *)BytePtr + 2);
        v9 = 4;
LABEL_14:
        v10 = bytes;
        goto LABEL_15;
      }
    }
    _PCSError(a2, 20, CFSTR("Crypto text too short"));
  }
  return 0;
}

uint64_t apply_block_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

char *PCSCFStringToCString(const __CFString *a1)
{
  const char *CStringPtr;
  CFIndex Length;
  CFIndex v5;
  void *v6;

  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
    return strdup(CStringPtr);
  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v6 = malloc_type_malloc(v5, 0x6A41BA48uLL);
  if (v6)
  {
    if (!CFStringGetCString(a1, (char *)v6, v5, 0x8000100u))
    {
      free(v6);
      return 0;
    }
  }
  return (char *)v6;
}

uint64_t _PCSIsInternalRelease()
{
  return os_variant_allows_internal_security_policies();
}

CFURLRef __PCSCopyLogFilePath(uint64_t a1)
{
  uint64_t v2;
  const __CFURL *v3;
  CFAbsoluteTime Current;
  CFDateRef v5;
  const __CFDate *v6;
  const __CFLocale *v7;
  __CFDateFormatter *v8;
  CFStringRef StringWithDate;
  CFStringRef v10;
  const __CFURL *v11;
  const __CFString *v12;
  const __CFString *v13;
  CFURLRef v14;

  v2 = CFCopyHomeDirectoryURLForUser();
  if (!v2)
  {
    v14 = 0;
    v11 = (const __CFURL *)&stru_1E55403F8;
    goto LABEL_17;
  }
  v3 = (const __CFURL *)v2;
  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = CFDateCreate(0, Current);
    if (!v5)
      goto LABEL_22;
    v6 = v5;
    v7 = CFLocaleCopyCurrent();
    v8 = CFDateFormatterCreate(0, v7, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFDateFormatterSetFormat(v8, CFSTR("yyyyMMddHHmmss"));
    StringWithDate = CFDateFormatterCreateStringWithDate(0, v8, v6);
    if (v7)
      CFRelease(v7);
    CFRelease(v6);
    if (v8)
      CFRelease(v8);
    if (!StringWithDate)
    {
LABEL_22:
      CFRelease(&stru_1E55403F8);
LABEL_23:
      v14 = 0;
      v11 = v3;
      goto LABEL_17;
    }
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("-%@-%@"), StringWithDate, a1);
    CFRelease(StringWithDate);
    if (!v10)
      goto LABEL_23;
  }
  else
  {
    v10 = &stru_1E55403F8;
  }
  v11 = CFURLCreateCopyAppendingPathComponent(0, v3, CFSTR("Library/Logs/CrashReporter/DiagnosticLogs"), 0);
  if (v11)
  {
    v12 = CFStringCreateWithFormat(0, 0, CFSTR("ProtectedCloudStorage%@.log"), v10);
    if (v12)
    {
      v13 = v12;
      v14 = CFURLCreateCopyAppendingPathComponent(0, v11, v12, 0);
      CFRelease(v13);
      if (!v10)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  v14 = 0;
  if (v10)
LABEL_15:
    CFRelease(v10);
LABEL_16:
  CFRelease(v3);
  if (v11)
LABEL_17:
    CFRelease(v11);
  return v14;
}

uint64_t PCSLogContextGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __PCSLogContextGetTypeID_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  block[4] = &PCSLogContextGetTypeID_sPCSLogContextGetTypeIDSingleton;
  if (PCSLogContextGetTypeID_sPCSLogContextGetTypeIDOnce != -1)
    dispatch_once(&PCSLogContextGetTypeID_sPCSLogContextGetTypeIDOnce, block);
  return PCSLogContextGetTypeID_sPCSLogContextGetTypeIDSingleton;
}

void PCSLogContextDestroy(uint64_t a1)
{
  int v2;
  const void *v3;

  os_release(*(void **)(a1 + 16));
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 != -1)
    close(v2);
  v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 24) = 0;
    CFRelease(v3);
  }
}

BOOL PCSLogContextCompare(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef PCSLogContextCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<PCSLogContext: %@>"), *(_QWORD *)(a1 + 24));
}

uint64_t PCSCreateLogContext(const void *a1, char *a2)
{
  uint64_t Instance;
  const __CFURL *v5;
  const __CFURL *v6;
  int v7;
  const char *v8;
  CFTypeRef v9;
  UInt8 buffer[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PCSLogContextGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1
      && os_variant_allows_internal_security_policies()
      && (v5 = __PCSCopyLogFilePath((uint64_t)a1)) != 0)
    {
      v6 = v5;
      if (CFURLGetFileSystemRepresentation(v5, 1u, buffer, 1024))
        v7 = open((const char *)buffer, 777, 420);
      else
        v7 = -1;
      CFRelease(v6);
    }
    else
    {
      v7 = -1;
    }
    *(_DWORD *)(Instance + 32) = v7;
    if (a2)
      a2 = PCSCFStringToCString((const __CFString *)a2);
    if (a2)
      v8 = a2;
    else
      v8 = "general";
    *(_QWORD *)(Instance + 16) = os_log_create("com.apple.ProtectedCloudStorage", v8);
    if (a1)
      v9 = CFRetain(a1);
    else
      v9 = 0;
    *(_QWORD *)(Instance + 24) = v9;
    free(a2);
  }
  return Instance;
}

uint64_t PCSLogGetOSLog(uint64_t a1)
{
  if (a1)
    return *(_QWORD *)(a1 + 16);
  else
    return MEMORY[0x1E0C81028];
}

void PCSMigrationLog(uint64_t a1, CFStringRef format, ...)
{
  CFStringRef v3;
  const __CFString *v4;
  NSObject *v5;
  char *v6;
  time_t v7;
  int v8;
  char *v9;
  stat buf;
  uint64_t v11;
  va_list va;

  va_start(va, format);
  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (a1)
  {
    v3 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
    if (v3)
    {
      v4 = v3;
      v5 = *(NSObject **)(a1 + 16);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        buf.st_dev = 138543362;
        *(_QWORD *)&buf.st_mode = v4;
        _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
      if (*(_DWORD *)(a1 + 32) == -1)
      {
        CFRelease(v4);
      }
      else
      {
        v6 = PCSCFStringToCString(v4);
        CFRelease(v4);
        memset(&buf, 0, sizeof(buf));
        if (!fstat(*(_DWORD *)(a1 + 32), &buf) && buf.st_size >= 50001)
          ftruncate(*(_DWORD *)(a1 + 32), 0);
        v7 = time(0);
        v8 = asprintf(&v9, "%ld - %s\n", v7, v6);
        if (v8 != -1)
          write(*(_DWORD *)(a1 + 32), v9, v8);
        free(v9);
        free(v6);
      }
    }
  }
}

const void *pcsLogObjForScope(const char *a1)
{
  char v2;
  const void *Value;
  CFAllocatorRef *v4;
  const __CFString *v5;
  const __CFDictionary *Mutable;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v9;
  __CFDictionary *v10;
  os_log_t v11;

  pthread_mutex_lock(&loggingMutex);
  v2 = loggingEnabled;
  pthread_mutex_unlock(&loggingMutex);
  if ((v2 & 1) != 0)
    return (const void *)MEMORY[0x1E0C81030];
  v4 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (a1)
    a1 = (const char *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, 0x600u);
  if (a1)
    v5 = (const __CFString *)a1;
  else
    v5 = CFSTR("logging");
  os_unfair_lock_lock_with_options();
  Mutable = (const __CFDictionary *)pcsLogObjForCFScope_scopeMap;
  if (!pcsLogObjForCFScope_scopeMap)
  {
    Mutable = CFDictionaryCreateMutable(*v4, 0, MEMORY[0x1E0C9AEB8], 0);
    pcsLogObjForCFScope_scopeMap = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, v5);
  if (!Value)
  {
    CFRetain(v5);
    Length = CFStringGetLength(v5);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v9 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xE17BA2BFuLL);
    if (!CFStringGetCString(v5, v9, MaximumSizeForEncoding, 0x8000100u))
      *v9 = 0;
    CFRelease(v5);
    v10 = (__CFDictionary *)pcsLogObjForCFScope_scopeMap;
    v11 = os_log_create("com.apple.ProtectedCloudStorage", v9);
    CFDictionaryAddValue(v10, v5, v11);
    free(v9);
    Value = CFDictionaryGetValue((CFDictionaryRef)pcsLogObjForCFScope_scopeMap, v5);
  }
  os_unfair_lock_unlock(&pcsLogObjForCFScope_lock);
  if (a1)
    CFRelease(a1);
  return Value;
}

void _PCSSecureBackupGetAccountInfoWithInfo(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v3 = _PCSSecureBackupSymbols;
  v4 = a2;
  getCloudServicesSymbol(v3, "SecureBackupGetAccountInfoWithInfo");
  ((void (*)(uint64_t, id))*_PCSSecureBackupSymbols)(a1, v4);

}

void getCloudServicesSymbol(_QWORD *a1, char *__symbol)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (initCloudServicesFramework_onceToken != -1)
    dispatch_once(&initCloudServicesFramework_onceToken, &__block_literal_global_65);
  if (!*a1)
  {
    v4 = dlsym((void *)cloudServices, __symbol);
    *a1 = v4;
    if (!v4)
      PCSAbort("symbol %s is missing", v5, v6, v7, v8, v9, v10, v11, (char)__symbol);
  }
}

void _PCSSecureBackupEnableWithInfo(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v3 = _PCSSecureBackupSymbols + 1;
  v4 = a2;
  getCloudServicesSymbol(v3, "SecureBackupEnableWithInfo");
  ((void (*)(uint64_t, id))_PCSSecureBackupSymbols[1])(a1, v4);

}

void _PCSSecureBackupRecoverWithInfo(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v3 = _PCSSecureBackupSymbols + 2;
  v4 = a2;
  getCloudServicesSymbol(v3, "SecureBackupRecoverWithInfo");
  ((void (*)(uint64_t, id))_PCSSecureBackupSymbols[2])(a1, v4);

}

void _PCSSecureBackupDisableWithInfo(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v3 = _PCSSecureBackupSymbols + 3;
  v4 = a2;
  getCloudServicesSymbol(v3, "SecureBackupDisableWithInfo");
  ((void (*)(uint64_t, id))_PCSSecureBackupSymbols[3])(a1, v4);

}

void _PCSSecureBackupUpdateMetadataWithInfo(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v3 = _PCSSecureBackupSymbols + 4;
  v4 = a2;
  getCloudServicesSymbol(v3, "SecureBackupUpdateMetadataWithInfo");
  ((void (*)(uint64_t, id))_PCSSecureBackupSymbols[4])(a1, v4);

}

uint64_t __PCSGetStingrayDeathMarker()
{
  if (__PCSGetStingrayDeathMarker_onceToken != -1)
    dispatch_once(&__PCSGetStingrayDeathMarker_onceToken, &__block_literal_global_1);
  return __PCSGetStingrayDeathMarker_deathMarker;
}

__CFData *_PCSStingrayCreateRandomKey(const void **a1)
{
  __CFData *Mutable;
  UInt8 *MutableBytePtr;

  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 32);
  if (Mutable)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    if (!MutableBytePtr || SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, MutableBytePtr))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  else
  {
    _PCSErrorOOM(a1);
  }
  return Mutable;
}

__CFData *_PCSStingrayCopyEncryptedData(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex v5;
  __CFData *Mutable;
  __CFData *v7;
  UInt8 *MutableBytePtr;

  v4 = ccaes_gcm_encrypt_mode();
  MEMORY[0x1E0C80A78](v4);
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  ccgcm_init();
  v5 = CFDataGetLength(a2) + 32;
  Mutable = CFDataCreateMutable(0, v5);
  v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, v5);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (!MutableBytePtr || SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, MutableBytePtr))
    {
      CFRelease(v7);
      v7 = 0;
    }
    else
    {
      ccgcm_set_iv();
      CFDataGetLength(a2);
      CFDataGetBytePtr(a2);
      ccgcm_update();
      CFDataGetLength(a2);
      ccgcm_finalize();
    }
  }
  ccgcm_context_size();
  cc_clear();
  return v7;
}

__CFData *_PCSStingrayCopyDecryptedData(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex Length;
  CFIndex v6;
  __CFData *v7;
  __CFData *Mutable;

  v4 = ccaes_gcm_decrypt_mode();
  MEMORY[0x1E0C80A78](v4);
  Length = CFDataGetLength(a2);
  v6 = Length - 32;
  if (Length < 32)
    return 0;
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  ccgcm_init();
  CFDataGetBytePtr(a2);
  ccgcm_set_iv();
  Mutable = CFDataCreateMutable(0, v6);
  v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, v6);
    CFDataGetMutableBytePtr(v7);
    ccgcm_update();
    ccgcm_finalize();
    if (cc_cmp_safe())
    {
      CFRelease(v7);
      v7 = 0;
    }
  }
  ccgcm_context_size();
  cc_clear();
  return v7;
}

intptr_t __PCS_WAITING_FOR_COM_APPLE_SDB(NSObject *a1)
{
  return dispatch_semaphore_wait(a1, 0xFFFFFFFFFFFFFFFFLL);
}

BOOL __PCSAccountHasStingrayIdentities(uint64_t a1, const __CFDictionary *a2, _QWORD *a3)
{
  dispatch_semaphore_t v6;
  NSObject *v7;
  __CFDictionary *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  const char *v12;
  _BOOL8 v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v6 = dispatch_semaphore_create(0);
  PCSLogGetOSLog(a1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "__PCSAccountHasStingrayIdentities", buf, 2u);
  }

  v8 = __PCSCreateSecureBackupContext(a2);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____PCSAccountHasStingrayIdentities_block_invoke;
  v15[3] = &unk_1E553DD48;
  v17 = &v19;
  v18 = &v23;
  v9 = v6;
  v16 = v9;
  _PCSSecureBackupGetAccountInfoWithInfo((uint64_t)v8, v15);
  __PCS_WAITING_FOR_COM_APPLE_SDB(v9);
  if (v8)
    CFRelease(v8);
  v10 = (const void *)v20[3];
  if (a3)
  {
    *a3 = v10;
  }
  else if (v10)
  {
    v20[3] = 0;
    CFRelease(v10);
  }
  PCSLogGetOSLog(a1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v24 + 24))
      v12 = "YES";
    else
      v12 = "NO";
    *(_DWORD *)buf = 136315138;
    v28 = v12;
    _os_log_impl(&dword_1A9508000, v11, OS_LOG_TYPE_DEFAULT, "PCSHasStingrayIdentities: %s", buf, 0xCu);
  }

  v13 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v13;
}

void sub_1A950E32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

__CFDictionary *__PCSCreateSecureBackupContext(const __CFDictionary *a1)
{
  __CFDictionary *Mutable;
  const void *v3;
  __CFString *v4;
  const void *Value;
  __CFString *v6;
  const void *v7;
  __CFString *v8;
  const void *v9;
  __CFString *v10;
  const void *v11;
  __CFString *v12;
  const void *v13;
  __CFString *v14;
  const void *v15;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v3 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, kPCSSecureBackupCFContainsiCloudIdentityKey[0], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(Mutable, CFSTR("SecureBackupExcludeiCDPRecords"), v3);
  v4 = kPCSSecureBackupCFAuthenticationDSID[0];
  Value = CFDictionaryGetValue(a1, kPCSSetupDSID[0]);
  if (Value)
    CFDictionarySetValue(Mutable, v4, Value);
  v6 = kPCSSecureBackupCFAuthenticationAppleID[0];
  v7 = CFDictionaryGetValue(a1, kPCSSetupUsername[0]);
  if (v7)
    CFDictionarySetValue(Mutable, v6, v7);
  v8 = kPCSSecureBackupCFAuthenticationPassword[0];
  v9 = CFDictionaryGetValue(a1, kPCSSetupPassword[0]);
  if (v9)
    CFDictionarySetValue(Mutable, v8, v9);
  v10 = kPCSSecureBackupCFAuthenticationAuthToken[0];
  v11 = CFDictionaryGetValue(a1, kPCSSetupAuthToken[0]);
  if (v11)
    CFDictionarySetValue(Mutable, v10, v11);
  v12 = kPCSSecureBackupCFAuthenticationEscrowProxyURL[0];
  v13 = CFDictionaryGetValue(a1, kPCSSetupEscrowURL[0]);
  if (v13)
    CFDictionarySetValue(Mutable, v12, v13);
  v14 = kPCSSecureBackupCFAuthenticationiCloudEnvironment[0];
  v15 = CFDictionaryGetValue(a1, kPCSSetupiCloudEnvironment[0]);
  if (v15)
    CFDictionarySetValue(Mutable, v14, v15);
  return Mutable;
}

BOOL __PCSStoreStingrayIdentity(uint64_t a1, const __CFDictionary *a2, const void *a3, uint64_t a4, const void *a5, _QWORD *a6, int a7, int a8)
{
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v14;
  __CFDictionary *v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  const void *v18;
  NSObject *v19;
  const char *v20;
  _BOOL8 v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, (int)a2, (int)a3, a4, (int)a5, (int)a6, a7, a8, kPCSSecureBackupCFiCloudIdentityPublicDataKey[0], a4);
  v14 = MutableForCFTypesWith;
  if (a5)
    CFDictionarySetValue(MutableForCFTypesWith, kPCSSecureBackupCFiCloudDataProtectionKey[0], a5);
  v15 = __PCSCreateSecureBackupContext(a2);
  CFDictionarySetValue(v15, kPCSSecureBackupCFiCloudIdentityDataKey[0], a3);
  v16 = dispatch_semaphore_create(0);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = ____PCSStoreStingrayIdentity_block_invoke;
  v23[3] = &unk_1E553DD70;
  v25 = &v32;
  v26 = &v28;
  v27 = a1;
  v17 = v16;
  v24 = v17;
  _PCSSecureBackupEnableWithInfo((uint64_t)v15, v23);
  if (v15)
    CFRelease(v15);
  if (v14)
    CFRelease(v14);
  __PCS_WAITING_FOR_COM_APPLE_SDB(v17);
  v18 = (const void *)v33[3];
  if (a6)
  {
    *a6 = v18;
  }
  else if (v18)
  {
    v33[3] = 0;
    CFRelease(v18);
  }
  PCSLogGetOSLog(a1);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v29 + 24))
      v20 = "YES";
    else
      v20 = "NO";
    *(_DWORD *)buf = 136446210;
    v37 = v20;
    _os_log_impl(&dword_1A9508000, v19, OS_LOG_TYPE_DEFAULT, "PCSStoreStingrayIdentity: %{public}s", buf, 0xCu);
  }

  v21 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v21;
}

void sub_1A950E818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

__CFDictionary *CFDictionaryCreateMutableForCFTypesWith(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  __CFDictionary *Mutable;
  const void *v11;
  const void **v12;
  const void **v14;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v14 = (const void **)&a10;
  v11 = key;
  if (key)
  {
    do
    {
      CFDictionarySetValue(Mutable, v11, *v14);
      v12 = v14 + 1;
      v14 += 2;
      v11 = *v12;
    }
    while (*v12);
  }
  return Mutable;
}

CFDataRef __PCSCopyHSMData(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFData *Value;
  const __CFData *v9;
  CFTypeID v10;
  CFDataRef Copy;
  NSObject *v12;
  uint64_t v13;
  _DWORD v15[2];
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFDictionary *)__PCSCopyStingray(a1, a2, a3);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFDictionaryGetTypeID())
    {
      Value = (const __CFData *)CFDictionaryGetValue(v6, kPCSSecureBackupCFiCloudIdentityDataKey[0]);
      if (Value)
      {
        v9 = Value;
        v10 = CFGetTypeID(Value);
        if (v10 == CFDataGetTypeID())
        {
          Copy = CFDataCreateCopy(0, v9);
LABEL_6:
          CFRelease(v6);
          goto LABEL_7;
        }
      }
      _PCSError((const void **)a3, 44, CFSTR("SecureBackup didn't return data key"));
    }
    Copy = 0;
    goto LABEL_6;
  }
  Copy = 0;
LABEL_7:
  PCSLogGetOSLog(a1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v13 = *a3;
    else
      v13 = 0;
    v15[0] = 67109378;
    v15[1] = Copy != 0;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_1A9508000, v12, OS_LOG_TYPE_DEFAULT, "PCSCopyHSMData: %{BOOL}d (error: %{public}@)", (uint8_t *)v15, 0x12u);
  }

  return Copy;
}

uint64_t __PCSCopyStingray(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  __CFDictionary *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = __PCSCreateSecureBackupContext(a2);
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____PCSCopyStingray_block_invoke;
  v13[3] = &unk_1E553DD48;
  v15 = &v21;
  v16 = &v17;
  v7 = v6;
  v14 = v7;
  _PCSSecureBackupRecoverWithInfo((uint64_t)v5, v13);
  CFRelease(v5);
  __PCS_WAITING_FOR_COM_APPLE_SDB(v7);
  v8 = (const void *)v22[3];
  if (a3)
  {
    *a3 = (uint64_t)v8;
  }
  else if (v8)
  {
    v22[3] = 0;
    CFRelease(v8);
  }
  PCSLogGetOSLog(a1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v10 = *a3;
    else
      v10 = 0;
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1A9508000, v9, OS_LOG_TYPE_DEFAULT, "PCSCopyStingray: error: %{public}@", buf, 0xCu);
  }

  v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_1A950ECDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __PCSCopyStingrayIdentity(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFData *Value;
  const __CFData *v9;
  CFTypeID v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  CFTypeID v16;
  const __CFData *v17;
  const __CFData *v18;
  CFTypeID v19;
  uint64_t Empty;
  const void *v21;
  const __CFDictionary *Service;
  uint64_t Copy;
  NSObject *v24;
  uint64_t v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFDictionary *)__PCSCopyStingray(a1, a2, a3);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFDictionaryGetTypeID())
    {
      Value = (const __CFData *)CFDictionaryGetValue(v6, kPCSSecureBackupCFiCloudIdentityDataKey[0]);
      if (Value && (v9 = Value, v10 = CFGetTypeID(Value), v10 == CFDataGetTypeID()))
      {
        v11 = (const __CFDictionary *)CFDictionaryGetValue(v6, kPCSSecureBackupCFStingrayMetadataKey[0]);
        if (!v11
          || (v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDictionaryGetTypeID())
          || (v14 = (const __CFDictionary *)CFDictionaryGetValue(v12, kPCSSecureBackupCFiCloudDataProtectionKey[0])) == 0
          || (v15 = v14, v16 = CFGetTypeID(v14), v16 != CFDictionaryGetTypeID())
          || (v17 = (const __CFData *)CFDictionaryGetValue(v15, kPCSMetadataEscrowedKeys[0])) == 0)
        {
          Copy = (uint64_t)CFDataCreateCopy(0, v9);
LABEL_17:
          CFRelease(v6);
          goto LABEL_18;
        }
        v18 = v17;
        v19 = CFGetTypeID(v17);
        if (v19 == CFDataGetTypeID())
        {
          Empty = _PCSIdentityCreateEmpty((const void **)a3);
          if (Empty)
          {
            v21 = (const void *)Empty;
            if (_PCSIdentityAddFromExternalForm(Empty, 0, v9, (const void **)a3)
              && (Service = PCSIdentityGetService((uint64_t)v21, kPCSServiceEscrow, 0, (const void **)a3)) != 0)
            {
              Copy = PCSBackupCopyRecoveredKeysetWithIdentity((int)Service, v18, (const void **)a3);
            }
            else
            {
              Copy = 0;
            }
            CFRelease(v21);
            goto LABEL_17;
          }
        }
      }
      else
      {
        _PCSError((const void **)a3, 44, CFSTR("SecureBackup didn't return data key"));
      }
    }
    Copy = 0;
    goto LABEL_17;
  }
  Copy = 0;
LABEL_18:
  PCSLogGetOSLog(a1);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v25 = *a3;
    else
      v25 = 0;
    v27 = 138543618;
    v28 = Copy;
    v29 = 2114;
    v30 = v25;
    _os_log_impl(&dword_1A9508000, v24, OS_LOG_TYPE_DEFAULT, "PCSCopyStingrayIdentity: %{public}@ (error: %{public}@)", (uint8_t *)&v27, 0x16u);
  }

  return Copy;
}

uint64_t __PCSCopyStingrayInfo(uint64_t a1, const __CFDictionary *a2, _QWORD *a3)
{
  dispatch_semaphore_t v6;
  NSObject *v7;
  __CFDictionary *v8;
  NSObject *v9;
  const void *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v6 = dispatch_semaphore_create(0);
  PCSLogGetOSLog(a1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "__PCSCopyStingrayInfo", buf, 2u);
  }

  v8 = __PCSCreateSecureBackupContext(a2);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ____PCSCopyStingrayInfo_block_invoke;
  v14[3] = &unk_1E553DD48;
  v16 = &v22;
  v17 = &v18;
  v9 = v6;
  v15 = v9;
  _PCSSecureBackupGetAccountInfoWithInfo((uint64_t)v8, v14);
  __PCS_WAITING_FOR_COM_APPLE_SDB(v9);
  if (v8)
    CFRelease(v8);
  v10 = (const void *)v23[3];
  if (a3)
  {
    *a3 = v10;
  }
  else if (v10)
  {
    v23[3] = 0;
    CFRelease(v10);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    if (v19[3])
      v11 = "YES";
    else
      v11 = "NO";
    *(_DWORD *)buf = 136315138;
    v27 = v11;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSCopyStingrayInfo: %s", buf, 0xCu);
  }
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

void sub_1A950F16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL __PCSDisableStingrayIdentity(uint64_t a1, const __CFDictionary *a2, _QWORD *a3)
{
  dispatch_semaphore_t v6;
  NSObject *v7;
  __CFDictionary *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const void *v13;
  _BOOL8 v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v6 = dispatch_semaphore_create(0);
  PCSLogGetOSLog(a1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "__PCSDisableStingrayIdentity", buf, 2u);
  }

  v8 = __PCSCreateSecureBackupContext(a2);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ____PCSDisableStingrayIdentity_block_invoke;
  v16[3] = &unk_1E553DD98;
  v18 = &v20;
  v19 = &v24;
  v9 = v6;
  v17 = v9;
  _PCSSecureBackupDisableWithInfo((uint64_t)v8, v16);
  __PCS_WAITING_FOR_COM_APPLE_SDB(v9);
  if (v8)
    CFRelease(v8);
  PCSLogGetOSLog(a1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v25 + 24))
      v11 = "YES";
    else
      v11 = "NO";
    v12 = v21[3];
    *(_DWORD *)buf = 136446466;
    v29 = v11;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1A9508000, v10, OS_LOG_TYPE_DEFAULT, "__PCSDisableStingrayIdentity: %{public}s: %{public}@", buf, 0x16u);
  }

  v13 = (const void *)v21[3];
  if (a3)
  {
    *a3 = v13;
  }
  else if (v13)
  {
    v21[3] = 0;
    CFRelease(v13);
  }
  v14 = *((_BYTE *)v25 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_1A950F430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void *__initCloudServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CloudServices.framework/CloudServices", 1);
  cloudServices = (uint64_t)result;
  return result;
}

uint64_t _PCSMakeDigest(uint64_t a1, const __CFData *a2, const __CFData *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  unsigned int *v12;
  size_t v13;
  void *v14;
  void *v15;
  size_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v19 - v10;
  ccdigest_init();
  CFDataGetLength(a2);
  CFDataGetBytePtr(a2);
  ccdigest_update();
  if (a3)
  {
    CFDataGetLength(a3);
    CFDataGetBytePtr(a3);
    ccdigest_update();
  }
  v21 = bswap32(*(_DWORD *)(a4 + 4));
  ccdigest_update();
  v21 = bswap32(*(_DWORD *)a4);
  ccdigest_update();
  v12 = *(unsigned int **)(a4 + 80);
  if (v12)
    v21 = bswap32(*v12);
  else
    v21 = 0;
  ccdigest_update();
  v21 = bswap32(*(_DWORD *)(a4 + 8));
  ccdigest_update();
  ccdigest_update();
  if (*(_QWORD *)(a4 + 104))
  {
    v13 = length_PCSAttributes();
    v14 = malloc_type_malloc(v13, 0x7AC0D2F6uLL);
    if (!v14)
      goto LABEL_18;
    v15 = v14;
    if (encode_PCSAttributes())
      goto LABEL_17;
    if (v20 != v13)
      goto LABEL_18;
    ccdigest_update();
    free(v15);
  }
  if (*(_QWORD *)(a4 + 96))
  {
    v16 = length_PCSSPKeyList();
    v17 = malloc_type_malloc(v16, 0xBA5927C6uLL);
    if (!v17)
      goto LABEL_18;
    v15 = v17;
    if (!encode_PCSSPKeyList())
    {
      if (v20 == v16)
      {
        ccdigest_update();
        free(v15);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v11, a5);
      }
LABEL_18:
      abort();
    }
LABEL_17:
    free(v15);
    goto LABEL_18;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v11, a5);
}

uint64_t PCSFPCopyPublicObjectSigningKey(const __CFData *a1, const void **a2)
{
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  if (!decode_PCSShareProtection() && CFDataGetLength(a1))
    _PCSError(a2, 16, CFSTR("Did not parse all exported PCS object"));
  free_PCSShareProtection();
  free_PCSObjectSignature();
  return 0;
}

BOOL PCSFPValidateShare(const __CFData *a1, int a2, const void **a3)
{
  uint64_t *v6;
  CFIndex v7;
  __CFData *Mutable;
  __CFData *v9;
  const __CFData *v10;
  _BOOL8 v11;
  _OWORD v13[2];
  __int128 v14;
  int v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  *(_OWORD *)v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  if (decode_PCSShareProtection())
    goto LABEL_22;
  if (CFDataGetLength(a1))
  {
    _PCSError(a3, 16, CFSTR("Did not parse all exported PCS object"));
LABEL_22:
    v11 = 0;
    goto LABEL_19;
  }
  if (!*((_QWORD *)&v21 + 1))
    goto LABEL_22;
  if (decode_PCSObjectSignature())
    goto LABEL_22;
  if (*(_QWORD *)(*((_QWORD *)&v21 + 1) + 16))
    goto LABEL_22;
  v6 = (uint64_t *)ccsha256_di();
  v7 = length_PCSSignedShareProtection();
  Mutable = CFDataCreateMutable(0, v7);
  if (!Mutable)
    goto LABEL_22;
  v9 = Mutable;
  CFDataSetLength(Mutable, v7);
  CFDataGetMutableBytePtr(v9);
  if (encode_PCSSignedShareProtection())
  {
    CFRelease(v9);
    goto LABEL_22;
  }
  if (v7)
    asn1_abort();
  if ((_QWORD)v21)
    v10 = CFDataCreate(0, *(const UInt8 **)(v21 + 8), *(_QWORD *)v21);
  else
    v10 = 0;
  _PCSMakeDigest((uint64_t)v6, v9, v10, (uint64_t)v13, (uint64_t)v25);
  v11 = (_PCSVerifyHash(a2, v15[2], *v6, (uint64_t)v25, (uint64_t)&v14 + 8, a3) & 1) != 0
     || *((_QWORD *)&v17 + 1)
     && (_PCSVerifyHash(a2, *(_DWORD *)(*((_QWORD *)&v17 + 1) + 16), *v6, (uint64_t)v25, *((uint64_t *)&v17 + 1), a3) & 1) != 0;
  CFRelease(v9);
  if (v10)
    CFRelease(v10);
LABEL_19:
  free_PCSShareProtection();
  free_PCSObjectSignature();
  return v11;
}

uint64_t _PCSPostHaveCredentials()
{
  return notify_post((const char *)kPCSNotificationHaveCredentialsString);
}

uint64_t PCSMeasureRelativeNanoTime()
{
  uint64_t v0;
  uint64_t v1;
  mach_timebase_info info;

  v0 = mach_absolute_time();
  v1 = PCSMeasureRelativeNanoTime_factor;
  if (!PCSMeasureRelativeNanoTime_factor)
  {
    info = 0;
    mach_timebase_info(&info);
    v1 = info.numer / info.denom;
    PCSMeasureRelativeNanoTime_factor = v1;
  }
  return v1 * v0;
}

const __CFString *_PCSYESNO(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

uint64_t PCSKeyGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSKeyGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSKeyGetTypeID_sPCSKeyGetTypeIDSingleton;
  if (PCSKeyGetTypeID_sPCSKeyGetTypeIDOnce != -1)
    dispatch_once(&PCSKeyGetTypeID_sPCSKeyGetTypeIDOnce, block);
  return PCSKeyGetTypeID_sPCSKeyGetTypeIDSingleton;
}

void PCSKeyDestroy(uint64_t a1)
{
  void *v2;
  void **v3;
  const void *v4;

  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
  {
    free(*(void **)(a1 + 40));
    *(_QWORD *)(a1 + 40) = 0;
    v3 = (void **)(a1 + 48);
LABEL_6:
    v2 = *v3;
    goto LABEL_7;
  }
  v3 = (void **)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    if (!v2)
      goto LABEL_8;
    cc_clear();
    goto LABEL_6;
  }
LABEL_7:
  free(v2);
  *v3 = 0;
LABEL_8:
  if (*(_QWORD *)(a1 + 16))
  {
    free_PCSPublicKeyInfo();
    free(*(void **)(a1 + 16));
  }
  v4 = *(const void **)(a1 + 24);
  if (v4)
  {
    *(_QWORD *)(a1 + 24) = 0;
    CFRelease(v4);
  }
}

BOOL PCSKeyCompare(const void *a1, const void *a2)
{
  CFTypeID v4;
  CFTypeID v5;

  v4 = CFGetTypeID(a1);
  if (v4 != PCSKeyGetTypeID())
    return 0;
  v5 = CFGetTypeID(a2);
  return v5 == PCSKeyGetTypeID() && a1 == a2;
}

CFStringRef PCSKeyCopyDescription(uint64_t a1)
{
  const __CFData *v2;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v5;
  CFStringRef v6;

  v2 = PCSKeyCopyExportedPublicKey(a1);
  BytePtr = CFDataGetBytePtr(v2);
  Length = CFDataGetLength(v2);
  v5 = _PCSCreateBase64((uint64_t)BytePtr, Length, 0);
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("<PCSKey@%p keyid: %@>"), a1, v5);
  if (v2)
    CFRelease(v2);
  if (v5)
    CFRelease(v5);
  return v6;
}

uint64_t PCSIdentityGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSIdentityGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSIdentityGetTypeID_sPCSIdentityGetTypeIDSingleton;
  if (PCSIdentityGetTypeID_sPCSIdentityGetTypeIDOnce != -1)
    dispatch_once(&PCSIdentityGetTypeID_sPCSIdentityGetTypeIDOnce, block);
  return PCSIdentityGetTypeID_sPCSIdentityGetTypeIDSingleton;
}

void PCSIdentityDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  v2 = (const void *)a1[4];
  if (v2)
  {
    a1[4] = 0;
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  if (v3)
  {
    a1[2] = 0;
    CFRelease(v3);
  }
  v4 = (const void *)a1[3];
  if (v4)
  {
    a1[3] = 0;
    CFRelease(v4);
  }
  v5 = (const void *)a1[8];
  if (v5)
  {
    a1[8] = 0;
    CFRelease(v5);
  }
  v6 = (const void *)a1[9];
  if (v6)
  {
    a1[9] = 0;
    CFRelease(v6);
  }
  v7 = (const void *)a1[6];
  if (v7)
  {
    a1[6] = 0;
    CFRelease(v7);
  }
  v8 = (const void *)a1[10];
  if (v8)
  {
    a1[10] = 0;
    CFRelease(v8);
  }
}

uint64_t PCSIdentityCompare(_QWORD *a1, _QWORD *a2)
{
  CFTypeID v4;
  CFTypeID v5;

  v4 = CFGetTypeID(a1);
  if (v4 != PCSIdentityGetTypeID())
    return 0;
  v5 = CFGetTypeID(a2);
  if (v5 != PCSIdentityGetTypeID())
    return 0;
  if (a1 == a2)
    return 1;
  return CFEqual(*(CFTypeRef *)(a1[2] + 24), *(CFTypeRef *)(a2[2] + 24));
}

CFStringRef PCSIdentityCopyDescription(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  int *v6;
  int v7;
  uint64_t NameByIndex;
  const void *v9;
  uint64_t PublicKey;
  const __CFString *v11;
  CFStringRef v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
    v4 = *(const __CFString **)(a1 + 24);
  else
    v4 = &stru_1E55403F8;
  if (v3)
    v5 = CFSTR("name: ");
  else
    v5 = &stru_1E55403F8;
  if (v2 && (v6 = *(int **)(v2 + 16)) != 0)
    v7 = *v6;
  else
    v7 = 0;
  NameByIndex = PCSServiceItemGetNameByIndex(v7);
  _PCSIdentityCopyBAT(a1);
  v9 = (const void *)objc_claimAutoreleasedReturnValue();
  PublicKey = PCSIdentityGetPublicKey(a1);
  v11 = CFSTR("pubkey");
  if (PublicKey)
    v11 = (const __CFString *)PublicKey;
  v12 = CFStringCreateWithFormat(0, 0, CFSTR("<PCSIdentity %@%@ pubkey: %@ service: %@ BAT: %@ %@>"), v5, v4, v11, NameByIndex, v9, &stru_1E55403F8);
  if (v9)
    CFRelease(v9);
  return v12;
}

CFDataRef PCSIdentityCopyCircleFingerPrint(uint64_t a1, const void **a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFDataRef v8;

  if (!PCSIdentityWithAttributesCheck(a1, a2))
    return 0;
  v4 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 24);
  v5 = *v4;
  if (!(_DWORD)v5)
  {
LABEL_6:
    _PCSError(a2, 83, CFSTR("old-identity2"));
    return 0;
  }
  v6 = 0;
  v7 = 24 * v5;
  while (*(_DWORD *)(*((_QWORD *)v4 + 1) + v6) != 6)
  {
    v6 += 24;
    if (v7 == v6)
      goto LABEL_6;
  }
  if (decode_PCSManateeCircleFingerPrint())
  {
    _PCSError(a2, 83, CFSTR("invalid-Circle-FingerPrint"));
    return 0;
  }
  if (*(_QWORD *)(*((_QWORD *)v4 + 1) + v6 + 8))
    v8 = 0;
  else
    v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  free_PCSManateeCircleFingerPrint();
  return v8;
}

uint64_t PCSIdentityWithAttributesCheck(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 && (v3 = *(_QWORD *)(v2 + 16)) != 0)
  {
    if (*(_QWORD *)(v3 + 24))
      return 1;
    if (*(_DWORD *)(v3 + 4) == 1)
      _PCSError(a2, 83, CFSTR("old-identity"));
    else
      _PCSError(a2, 83, CFSTR("service"));
  }
  else
  {
    _PCSError(a2, 83, CFSTR("raw-identity"));
  }
  return 0;
}

uint64_t PCSIdentityGetCreationTime(uint64_t a1, const void **a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = PCSIdentityCopyBuildAndTime(a1, a2);
  if (!v2)
    return -1;
  v3 = v2;
  v4 = *((_QWORD *)v2 + 1);
  free_PCSBuildAndTime();
  free(v3);
  return v4;
}

void *PCSIdentityCopyBuildAndTime(uint64_t a1, const void **a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;

  if (PCSIdentityWithAttributesCheck(a1, a2))
  {
    v4 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 24);
    v5 = *v4;
    if ((_DWORD)v5)
    {
      v6 = 0;
      v7 = 24 * v5;
      v8 = CFSTR("old-identity2");
      while (*(_DWORD *)(*((_QWORD *)v4 + 1) + v6) != 1)
      {
        v6 += 24;
        if (v7 == v6)
          goto LABEL_10;
      }
      v9 = malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
      if (!decode_PCSBuildAndTime())
        return v9;
      v8 = CFSTR("invalid-BAT");
LABEL_10:
      _PCSError(a2, 83, v8);
    }
    else
    {
      _PCSError(a2, 83, CFSTR("old-identity2"));
    }
  }
  return 0;
}

__CFString *_PCSIdentityCopyBAT(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  __CFString *v3;
  const void *v5;
  tm v6;
  const void *v7;
  char v8[30];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v1 = PCSIdentityCopyBuildAndTime(a1, &v7);
  if (v1)
  {
    v2 = v1;
    memset(&v6, 0, sizeof(v6));
    gmtime_r((const time_t *)v1 + 1, &v6);
    strftime(v8, 0x1EuLL, "%Y%m%d%H%M%S", &v6);
    v3 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%s;%s"), v8, *v2);
    free_PCSBuildAndTime();
    free(v2);
    return v3;
  }
  else
  {
    v5 = v7;
    if (v7)
    {
      v7 = 0;
      CFRelease(v5);
    }
    return (__CFString *)0;
  }
}

const __CFData *PCSIdentityWebSafePublicKeyID(uint64_t a1)
{
  uint64_t v1;
  __CFData *v2;
  const __CFData *v3;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 16);
    if (v1)
      v2 = _PCSKeyCopyExportedPublicKey(v1);
    else
      v2 = 0;
    v3 = _PCSCopyWebSafePublicKey(v2);
    if (v2)
      CFRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

__CFData *PCSIdentityCopyExportedPublicKey(uint64_t a1)
{
  __CFData *result;

  result = *(__CFData **)(a1 + 16);
  if (result)
    return _PCSKeyCopyExportedPublicKey((uint64_t)result);
  return result;
}

const __CFData *_PCSCopyWebSafePublicKey(const __CFData *a1)
{
  const __CFData *v1;
  CFDataRef v2;
  void *v3;
  void *v4;
  UInt8 bytes[32];
  uint64_t v7;

  v1 = a1;
  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    ccsha256_di();
    CFDataGetLength(v1);
    CFDataGetBytePtr(v1);
    ccdigest();
    v2 = CFDataCreateWithBytesNoCopy(0, bytes, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v3 = (void *)MEMORY[0x1AF415520]();
    -[__CFData base64EncodedStringWithOptions:](v2, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (const __CFData *)objc_msgSend(v4, "mutableCopy");

    -[__CFData replaceOccurrencesOfString:withString:options:range:](v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, -[__CFData length](v1, "length"));
    -[__CFData replaceOccurrencesOfString:withString:options:range:](v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, -[__CFData length](v1, "length"));
    -[__CFData replaceOccurrencesOfString:withString:options:range:](v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_1E55403F8, 0, 0, -[__CFData length](v1, "length"));
    objc_autoreleasePoolPop(v3);
    if (v2)
      CFRelease(v2);
  }
  return v1;
}

void _PCSIdentitySetPersistentReference(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;

  v3 = a2;
  v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v4);
  }
  *(_QWORD *)(a1 + 48) = v3;
}

id _PCSIdentityGetPersistentReference(uint64_t a1)
{
  return *(id *)(a1 + 48);
}

void _PCSIdentityCheckPCSAttributes(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AB0]);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AA8]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AB8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        *(_BYTE *)(a1 + 56) = 1;
    }
    else
    {

    }
  }

}

uint64_t _PCSIdentityHavePCSCKKSAttributes(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t _PCSIdentityGetCachedCurrentBit(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t PCSPublicIdentityGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSPublicIdentityGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSPublicIdentityGetTypeID_sPCSPublicIdentityGetTypeIDSingleton;
  if (PCSPublicIdentityGetTypeID_sPCSPublicIdentityGetTypeIDOnce != -1)
    dispatch_once(&PCSPublicIdentityGetTypeID_sPCSPublicIdentityGetTypeIDOnce, block);
  return PCSPublicIdentityGetTypeID_sPCSPublicIdentityGetTypeIDSingleton;
}

void PCSPublicIdentityDestroy(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = 0;
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 16);
  if (v3)
  {
    *(_QWORD *)(a1 + 16) = 0;
    CFRelease(v3);
  }
}

uint64_t PCSPublicIdentityCompare(const void *a1, const void *a2)
{
  CFTypeID v4;
  CFTypeID v5;
  const void *PublicID;
  const void *v7;

  v4 = CFGetTypeID(a1);
  if (v4 != PCSPublicIdentityGetTypeID())
    return 0;
  v5 = CFGetTypeID(a2);
  if (v5 != PCSPublicIdentityGetTypeID())
    return 0;
  if (a1 == a2)
    return 1;
  PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)a1);
  v7 = (const void *)PCSPublicIdentityGetPublicID((uint64_t)a2);
  return CFEqual(PublicID, v7);
}

CFStringRef PCSPublicIdentityCopyDescription(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t PublicID;
  const __CFString *v6;
  uint64_t v7;
  const char *v8;
  const __CFData *v9;
  CFStringRef v10;

  v2 = *(_QWORD *)(a1 + 24);
  if (v2 && (v3 = *(unsigned int **)(v2 + 16)) != 0)
    v4 = *v3;
  else
    v4 = 0;
  PublicID = PCSPublicIdentityGetPublicID(a1);
  if (PublicID)
    v6 = (const __CFString *)PublicID;
  else
    v6 = CFSTR("pubkey");
  v7 = *(_QWORD *)(a1 + 24);
  v8 = "";
  if (v7 && (*(_BYTE *)(v7 + 32) & 4) != 0)
    v8 = " div";
  v9 = PCSPublicIdentityCopyWebSafePublicKeyID(a1);
  v10 = CFStringCreateWithFormat(0, 0, CFSTR("<PCSPublicIdentity@%p pubkey: %@ (%@) service: %d%s>"), a1, v6, v9, v4, v8);
  if (v9)
    CFRelease(v9);
  return v10;
}

uint64_t _PCSIdentityGetKey(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t _PCSPublicIdentityGetKey(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

BOOL _PCSFillOctetString(CFIndex *a1, CFDataRef theData)
{
  size_t Length;
  void *v5;
  const UInt8 *BytePtr;
  size_t v7;

  Length = CFDataGetLength(theData);
  v5 = malloc_type_malloc(Length, 0xE44AEB6AuLL);
  a1[1] = (CFIndex)v5;
  if (v5)
  {
    BytePtr = CFDataGetBytePtr(theData);
    v7 = CFDataGetLength(theData);
    memcpy(v5, BytePtr, v7);
    *a1 = CFDataGetLength(theData);
  }
  return v5 != 0;
}

void PCSAbort(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  PCSAbortv(a1, &a9);
}

void PCSAbortv(char *a1, va_list a2)
{
  char *v3;

  v3 = 0;
  if (vasprintf(&v3, a1, a2) >= 1 && v3 != 0)
    syslog(3, "PCSAbort: %s", v3);
  abort();
}

void PCSAbortCF(CFStringRef format, ...)
{
  const __CFString *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, format);
  v1 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  v2 = PCSCFStringToCString(v1);
  PCSAbort("%s", v3, v4, v5, v6, v7, v8, v9, v2);
}

CFStringRef _PCSCreateBase64(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v6;
  const char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  char *v13;
  char v14;
  char v15;
  uint64_t v16;
  CFStringRef v17;

  if (a3)
    v6 = ((4 * a2 / 3 + 67) >> 6) + 1;
  else
    v6 = 0;
  v7 = (const char *)malloc_type_malloc(v6 + 4 * a2 / 3 + 5, 0xAEFC5D1CuLL);
  v8 = (char *)v7;
  v9 = 0;
  if (a2)
  {
    v10 = 0;
    do
    {
      v11 = *(unsigned __int8 *)(a1 + v10) << 8;
      if (v10 + 1 < a2)
        v11 |= *(unsigned __int8 *)(a1 + v10 + 1);
      v12 = (v11 << 8);
      if (v10 + 2 < a2)
        v12 = v12 | *(unsigned __int8 *)(a1 + v10 + 2);
      v10 += 3;
      v13 = (char *)&v7[v9];
      *v13 = _PCSCreateBase64_base64_chars[(unint64_t)v12 >> 18];
      v13[1] = _PCSCreateBase64_base64_chars[(v12 >> 12) & 0x3F];
      if (v10 <= a2 + 1)
        v14 = _PCSCreateBase64_base64_chars[(v12 >> 6) & 0x3F];
      else
        v14 = 61;
      v7[v9 + 2] = v14;
      if (v10 <= a2)
        v15 = _PCSCreateBase64_base64_chars[v12 & 0x3F];
      else
        v15 = 61;
      v7[v9 + 3] = v15;
      v16 = v9 + 4;
      if ((v10 & 0xF) != 0 || !a3)
      {
        v9 += 4;
      }
      else
      {
        v9 += 5;
        v7[v16] = 10;
      }
    }
    while (v10 < a2);
    if ((v10 & 0xF) != 0 && a3)
      v7[v9++] = 10;
  }
  v7[v9] = 0;
  v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, 0x600u);
  free(v8);
  return v17;
}

CFStringRef __PCSCreateExportPEM(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v6;
  CFStringRef v7;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v6 = _PCSCreateBase64((uint64_t)BytePtr, Length, 1);
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("-----BEGIN %@-----\n%@-----END %@-----"), a1, v6, a1);
  if (v6)
    CFRelease(v6);
  return v7;
}

uint64_t __PCSCreateWithPEM(const __CFData *a1)
{
  CFDataGetBytePtr(a1);
  return 0;
}

uint64_t PCSIdentityGetServiceName(uint64_t a1)
{
  uint64_t v1;
  int *v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(int **)(v1 + 16)) != 0)
    return PCSServiceItemGetNameByIndex(*v2);
  else
    return PCSServiceItemGetNameByIndex(0);
}

uint64_t PCSIdentityGetServiceID(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(unsigned int **)(v1 + 16)) != 0)
    return *v2;
  else
    return 0;
}

uint64_t PCSIdentityGetServiceViewHint(uint64_t a1)
{
  uint64_t v1;
  int *v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(int **)(v1 + 16)) != 0)
    return PCSServiceItemGetViewHintByIndex(*v2);
  else
    return PCSServiceItemGetViewHintByIndex(0);
}

__CFString *PCSIdentityGetServiceAccessGroup(uint64_t a1)
{
  uint64_t v1;
  int *v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(int **)(v1 + 16)) != 0)
    return PCSServiceItemGetAccessGroupByIndex(*v2);
  else
    return PCSServiceItemGetAccessGroupByIndex(0);
}

uint64_t _PCSSignAlgToDI(unsigned __int16 a1, const void **a2)
{
  if (a1 == 2)
    return ccsha512_di();
  if (a1 == 1)
    return ccsha256_di();
  _PCSError(a2, 29, CFSTR("Unsupported signature type: %d"), a1);
  return 0;
}

CFTypeRef PCSKeyCreateWithPCSSPKey(unsigned int *a1, const void **a2)
{
  int v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t Instance;
  const void *PublicWithData;
  char v9;
  CFTypeRef v10;
  const __CFData *v11;
  uint64_t v12;
  _QWORD v14[3];

  v3 = *a1;
  if (*a1 > 8)
    goto LABEL_20;
  if (((1 << v3) & 0xB) == 0)
  {
    if (((1 << v3) & 0x180) != 0)
    {
      v5 = ccec_diversified_cp();
      if (v5)
      {
        v6 = (_QWORD *)v5;
        PCSKeyGetTypeID();
        Instance = _CFRuntimeCreateInstance();
        PublicWithData = (const void *)Instance;
        if (*a1 == 8)
          v9 = 6;
        else
          v9 = 4;
        *(_BYTE *)(Instance + 32) = v9 | *(_BYTE *)(Instance + 32) & 0xF8;
        if (!_PCSKeyAllocateDiversizedKey(v6, Instance)
          || ccec_der_import_diversified_pub())
        {
          v10 = 0;
LABEL_18:
          CFRelease(PublicWithData);
          return v10;
        }
LABEL_17:
        v10 = CFRetain(PublicWithData);
        goto LABEL_18;
      }
      return 0;
    }
    if (v3 == 2)
    {
      memset(v14, 0, sizeof(v14));
      v12 = decode_PCSPrivateKey();
      if ((_DWORD)v12)
      {
        _PCSErrorASN1(a2, (uint64_t)"decode PCSPrivateKey", v12);
      }
      else
      {
        PublicWithData = (const void *)PCSKeyCreate((uint64_t)v14, 0, a2);
        free_PCSPrivateKey();
        if (PublicWithData)
          goto LABEL_17;
      }
      return 0;
    }
LABEL_20:
    _PCSError(a2, 72, CFSTR("unsupported keytype: %d"), *a1);
    return 0;
  }
  v11 = CFDataCreateWithBytesNoCopy(0, *((const UInt8 **)a1 + 3), *((_QWORD *)a1 + 2), (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v10 = v11;
  if (v11)
  {
    PublicWithData = (const void *)PCSKeyCreatePublicWithData(v11, a2);
    CFRelease(v10);
    if (PublicWithData)
      goto LABEL_17;
    return 0;
  }
  return v10;
}

uint64_t PCSKeyCreate(uint64_t a1, int a2, const void **a3)
{
  uint64_t Instance;
  uint64_t v6;
  void *v7;
  BOOL v9;

  v9 = 0;
  if (a2 && !*(_QWORD *)(a1 + 16))
    return 0;
  PCSKeyGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v6 = Instance;
  if (!Instance)
  {
    _PCSErrorOOM(a3);
    return v6;
  }
  *(_QWORD *)(Instance + 24) = 0;
  *(_BYTE *)(Instance + 32) = *(_BYTE *)(Instance + 32) & 0xFA | 1;
  v7 = CopyPrivKeyFromOctetString(a1, 0, &v9);
  *(_QWORD *)(v6 + 40) = v7;
  *(_BYTE *)(v6 + 32) = *(_BYTE *)(v6 + 32) & 0xFD | (2 * v9);
  if (!v7
    || *(_QWORD *)(a1 + 16)
    && (*(_QWORD *)(v6 + 16) = malloc_type_malloc(0x30uLL, 0x10A0040698877B7uLL), copy_PCSPublicKeyInfo())
    || !SetKeyID(v6))
  {
    _PCSErrorOOM(a3);
    CFRelease((CFTypeRef)v6);
    return 0;
  }
  return v6;
}

uint64_t PCSKeyCreatePublicWithData(const __CFData *a1, const void **a2)
{
  uint64_t Instance;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  const UInt8 *BytePtr;
  CFIndex Length;
  void *v10;
  BOOL v12;
  int v13;

  v13 = 0;
  PCSKeyGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v5 = Instance;
  if (!Instance)
  {
    _PCSErrorOOM(a2);
    return v5;
  }
  *(_BYTE *)(Instance + 32) &= ~1u;
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  v6 = (_QWORD *)ccec_diversified_cp();
  if (v6)
  {
    *(_BYTE *)(v5 + 32) |= 4u;
    if (!_PCSKeyAllocateDiversizedKey(v6, v5))
      goto LABEL_10;
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    if (ccec_der_import_diversified_pub())
      goto LABEL_10;
    v7 = (v13 >> 1) & 2 | *(_BYTE *)(v5 + 32) & 0xFD;
  }
  else
  {
    v12 = 0;
    *(_BYTE *)(v5 + 32) &= ~4u;
    BytePtr = CFDataGetBytePtr(a1);
    Length = CFDataGetLength(a1);
    v10 = CopyPublicKeyFromData((uint64_t)BytePtr, Length, &v12, a2);
    *(_QWORD *)(v5 + 40) = v10;
    if (!v10)
    {
LABEL_10:
      _PCSErrorOOM(a2);
      CFRelease((CFTypeRef)v5);
      return 0;
    }
    LOBYTE(v7) = *(_BYTE *)(v5 + 32) & 0xFD | (2 * v12);
  }
  *(_BYTE *)(v5 + 32) = v7;
  if (!SetKeyID(v5))
    goto LABEL_10;
  return v5;
}

uint64_t ccec_diversified_cp()
{
  uint64_t result;

  ccder_decode_constructed_tl();
  result = ccder_decode_tl();
  if (result)
  {
    result = ccder_decode_tl();
    if (result)
    {
      if (ccec_x963_import_pub_size())
        return ccec_get_cp();
      result = ccec_compact_import_pub_size();
      if (result)
        return ccec_get_cp();
    }
  }
  return result;
}

uint64_t _PCSKeyAllocateDiversizedKey(_QWORD *a1, uint64_t a2)
{
  void *v4;
  size_t v5;
  uint64_t v6;
  void *v7;

  if ((*(_BYTE *)(a2 + 32) & 4) == 0)
    _PCSKeyAllocateDiversizedKey_cold_1();
  v4 = malloc_type_calloc(1uLL, 24 * *a1 + 16, 0x49403F27uLL);
  *(_QWORD *)(a2 + 40) = v4;
  if (!v4)
    return 0;
  v5 = 24 * *a1 + 16;
  v6 = 1;
  v7 = malloc_type_calloc(1uLL, v5, 0x9D58ACF5uLL);
  *(_QWORD *)(a2 + 48) = v7;
  if (!v7)
    return 0;
  return v6;
}

void *CopyPublicKeyFromData(uint64_t a1, uint64_t a2, BOOL *a3, const void **a4)
{
  uint64_t v6;
  void *v7;
  _QWORD *cp;

  v6 = ccec_x963_import_pub_size();
  v7 = (void *)v6;
  if (v6 || (v7 = (void *)ccec_compact_import_pub_size()) != 0)
  {
    if (!ccec_keysize_is_supported())
    {
      _PCSError(a4, 32, CFSTR("Key size %zd unsupported"), v7);
      return 0;
    }
    cp = (_QWORD *)ccec_get_cp();
    v7 = malloc_type_calloc(1uLL, 24 * *cp + 16, 0x630BA6B1uLL);
    if (v7)
    {
      if (v6)
      {
        if (ccec_import_pub())
        {
          _PCSError(a4, 33, CFSTR("Failed to import public key"));
LABEL_15:
          free(v7);
          return 0;
        }
      }
      else if (ccec_compact_import_pub())
      {
        _PCSError(a4, 33, CFSTR("Failed to import compact public key"));
        goto LABEL_15;
      }
      if (a3)
        *a3 = v6 == 0;
    }
    else
    {
      _PCSErrorOOM(a4);
    }
  }
  return v7;
}

BOOL SetKeyID(uint64_t a1)
{
  char v2;
  __CFData *v3;
  unint64_t v4;
  CFIndex v5;
  __CFData *Mutable;
  CFIndex v7;
  CFIndex v8;
  UInt8 *MutableBytePtr;
  __int128 v11;
  int v12;

  if (*(_QWORD *)(a1 + 24))
    SetKeyID_cold_1();
  v2 = *(_BYTE *)(a1 + 32);
  if ((v2 & 4) != 0)
  {
    v7 = ccec_der_export_diversified_pub_size();
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v7);
    if (!Mutable)
      goto LABEL_17;
    CFDataGetMutableBytePtr(Mutable);
    if (!ccec_der_export_diversified_pub())
    {
      v3 = 0;
LABEL_14:
      CFRelease(Mutable);
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  v3 = *(__CFData **)(a1 + 40);
  if (v3)
  {
    v4 = cczp_bitlen() + 7;
    if ((v2 & 2) == 0)
    {
      v5 = (v4 >> 2) | 1;
      Mutable = CFDataCreateMutable(0, 0);
      CFDataSetLength(Mutable, v5);
      if (Mutable)
      {
        CFDataGetMutableBytePtr(Mutable);
        ccec_export_pub();
        goto LABEL_12;
      }
LABEL_17:
      v3 = 0;
      goto LABEL_15;
    }
    v8 = v4 >> 3;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v8);
    if (!Mutable)
      goto LABEL_17;
    CFDataGetMutableBytePtr(Mutable);
    ccec_compact_export();
LABEL_12:
    ccsha256_di();
    CFDataGetLength(Mutable);
    CFDataGetBytePtr(Mutable);
    ccdigest();
    v3 = CFDataCreateMutable(0, 0);
    CFDataSetLength(v3, 20);
    if (v3)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v3);
      *(_OWORD *)MutableBytePtr = v11;
      *((_DWORD *)MutableBytePtr + 4) = v12;
    }
    goto LABEL_14;
  }
LABEL_15:
  *(_QWORD *)(a1 + 24) = v3;
  return v3 != 0;
}

CFTypeRef _PCSKeyCreateKeyIDFromData(const __CFData *a1)
{
  uint64_t PublicWithData;
  const void *v2;
  const void *v3;
  CFTypeRef v4;

  PublicWithData = PCSKeyCreatePublicWithData(a1, 0);
  if (!PublicWithData)
    return 0;
  v2 = (const void *)PublicWithData;
  v3 = *(const void **)(PublicWithData + 24);
  if (v3)
    v4 = CFRetain(v3);
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

__CFData *_PCSKeyCopyExportedPublicKey(uint64_t a1)
{
  char v1;
  unint64_t v2;
  CFIndex v3;
  __CFData *Mutable;
  CFIndex v5;
  CFIndex v6;

  if (!a1 || !*(_QWORD *)(a1 + 40))
    return 0;
  v1 = *(_BYTE *)(a1 + 32);
  if ((v1 & 4) != 0)
  {
    v5 = ccec_der_export_diversified_pub_size();
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v5);
    if (!Mutable)
      return Mutable;
    CFDataGetMutableBytePtr(Mutable);
    if (ccec_der_export_diversified_pub())
      return Mutable;
    CFRelease(Mutable);
    return 0;
  }
  v2 = cczp_bitlen() + 7;
  if ((v1 & 2) != 0)
  {
    v6 = v2 >> 3;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v6);
    if (Mutable)
    {
      CFDataGetMutableBytePtr(Mutable);
      ccec_compact_export();
    }
  }
  else
  {
    v3 = (v2 >> 2) | 1;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v3);
    CFDataGetMutableBytePtr(Mutable);
    ccec_export_pub();
  }
  return Mutable;
}

__CFData *_PCSKeyCopyExportedPrivateKey(uint64_t a1)
{
  uint64_t v1;
  CFIndex v2;
  __CFData *Mutable;
  CFIndex v4;

  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    return 0;
  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    v4 = ((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v4);
    if (Mutable)
    {
      CFDataGetMutableBytePtr(Mutable);
      ccec_compact_export();
    }
  }
  else
  {
    v1 = ccec_der_export_priv_size();
    if (!v1)
      return 0;
    v2 = v1;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v2);
    CFDataGetMutableBytePtr(Mutable);
    if (ccec_der_export_priv() && Mutable)
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

#error "1A95118F4: call analysis failed (funcsize=109)"

uint64_t PCSIdentityCopyPublicKeyInfo(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && *(_QWORD *)(v1 + 16))
    return PCSCreateExportedPublicKeyInfo();
  else
    return 0;
}

uint64_t PCSCreateExportedPublicKeyInfo()
{
  CFIndex v0;
  __CFData *Mutable;
  __CFData *v2;
  uint64_t v4;

  v0 = length_PCSPublicKeyInfo();
  Mutable = CFDataCreateMutable(0, v0);
  if (!Mutable)
    return 0;
  v2 = Mutable;
  CFDataSetLength(Mutable, v0);
  CFDataGetMutableBytePtr(v2);
  if (encode_PCSPublicKeyInfo())
  {
    CFRelease(v2);
    return 0;
  }
  if (!v0)
    return (uint64_t)v2;
  v4 = asn1_abort();
  return PCSIdentityCreateWithExportedPrivateKey(v4);
}

CFTypeRef PCSIdentityCreateWithExportedPrivateKey(const __CFData *a1, const void **a2)
{
  uint64_t v4;
  CFTypeRef v5;
  PCSManateeShareableIdentity *v6;
  void *v7;
  PCSManateeShareableIdentity *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  const __CFData *v14;
  void *v15;
  const __CFData *v16;
  _QWORD *v17;
  void *v18;
  const __CFData *v19;
  void *v20;
  const __CFData *v21;
  _QWORD *v22;
  __int128 v24;
  __int128 v25;

  v24 = 0u;
  v25 = 0u;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v4 = decode_PCSPrivateKeyV2();
  if ((_DWORD)v4)
  {
    _PCSErrorASN1(a2, (uint64_t)"decode PCSPrivateKeyV2", v4);
    return 0;
  }
  if ((_DWORD)v24 == 2)
  {
    v6 = [PCSManateeShareableIdentity alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (_QWORD)v25, *((_QWORD *)&v24 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PCSManateeShareableIdentity initWithData:](v6, "initWithData:", v7);

    if (v8)
    {
      if (-[PCSManateeShareableIdentity hasEncryptionPrivateKey](v8, "hasEncryptionPrivateKey")
        && (-[PCSManateeShareableIdentity encryptionPrivateKey](v8, "encryptionPrivateKey"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "hasPrivateKey"),
            v9,
            v10))
      {
        if (-[PCSManateeShareableIdentity hasSigningPrivateKey](v8, "hasSigningPrivateKey"))
        {
          -[PCSManateeShareableIdentity signingPrivateKey](v8, "signingPrivateKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasPrivateKey");

          if (v12)
          {
            -[PCSManateeShareableIdentity encryptionPrivateKey](v8, "encryptionPrivateKey");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "privateKey");
            v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
            -[PCSManateeShareableIdentity encryptionPrivateKey](v8, "encryptionPrivateKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "publicKeyInfo");
            v16 = (const __CFData *)objc_claimAutoreleasedReturnValue();
            v17 = _PCSIdentityCreateFromRawWithPublic(v14, v16, 0, a2);

            if (v17)
            {
              -[PCSManateeShareableIdentity signingPrivateKey](v8, "signingPrivateKey");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "privateKey");
              v19 = (const __CFData *)objc_claimAutoreleasedReturnValue();
              -[PCSManateeShareableIdentity signingPrivateKey](v8, "signingPrivateKey");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "publicKeyInfo");
              v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
              v22 = _PCSIdentityCreateFromRawWithPublic(v19, v21, 0, a2);

              if (v22)
              {
                _PCSIdentitySetSigningIdentity((uint64_t)v17, v22);
                v5 = CFRetain(v17);
                CFRelease(v17);
                v17 = v22;
              }
              else
              {
                v5 = 0;
              }
              CFRelease(v17);
            }
            else
            {
              v5 = 0;
            }

            goto LABEL_19;
          }
        }
        _PCSError(a2, 139, CFSTR("missing signing key"));
      }
      else
      {
        _PCSError(a2, 139, CFSTR("missing encryption key"));
      }
    }
    else
    {
      _PCSError(a2, 139, CFSTR("failed to deserialize PCSManateeShareableIdentity"));
    }

    goto LABEL_18;
  }
  if ((_DWORD)v24 != 1)
  {
    _PCSError(a2, 8, CFSTR("unexpected choice type for PCSPrivateKeyV2: %d"), v24, 0);
LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  v5 = PCSIdentityCreateWithPrivateKeyV1((uint64_t)&v24 + 8, 0, a2);
LABEL_19:
  free_PCSPrivateKeyV2();
  return v5;
}

_QWORD *PCSIdentityCreateWithKeychainAttributes(const __CFDictionary *a1, const void **a2)
{
  const __CFData *Value;
  const __CFData *v5;
  CFTypeID v6;
  _QWORD *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  CFTypeID v10;
  _QWORD *v11;
  int valuePtr;

  Value = (const __CFData *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD70D8]);
  if (!Value)
    return 0;
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 != CFDataGetTypeID())
    return 0;
  v7 = PCSIdentityCreateWithExportedPrivateKey(v5, a2);
  if (v7)
  {
    v8 = (const __CFNumber *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6BC8]);
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue(v9, kCFNumberIntType, &valuePtr))
        {
          if ((valuePtr & 0x10000) != 0)
            v11 = (_QWORD *)MEMORY[0x1E0C9AE50];
          else
            v11 = (_QWORD *)MEMORY[0x1E0C9AE40];
          v7[11] = *v11;
        }
      }
    }
  }
  return v7;
}

CFTypeRef PCSIdentityCreateWithPrivateKeyV1(uint64_t a1, int a2, const void **a3)
{
  uint64_t Empty;
  _QWORD *v7;
  uint64_t v8;
  CFTypeRef v9;

  Empty = _PCSIdentityCreateEmpty(a3);
  if (!Empty)
    return 0;
  v7 = (_QWORD *)Empty;
  v8 = PCSKeyCreate(a1, a2, a3);
  v7[2] = v8;
  if (v8)
    v9 = CFRetain(v7);
  else
    v9 = 0;
  CFRelease(v7);
  return v9;
}

uint64_t _PCSIdentityCreateEmpty(const void **a1)
{
  uint64_t Instance;

  PCSIdentityGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    _PCSErrorOOM(a1);
  return Instance;
}

CFTypeRef PCSIdentityCreateDiversifiedIdentityOptions(uint64_t a1, const __CFData *a2, const __CFDictionary *cf, const void **a4)
{
  uint64_t v4;
  unsigned int v5;
  CFTypeID v9;
  int v10;
  const __CFBoolean *Value;
  const __CFBoolean *v12;
  CFTypeID v13;
  _QWORD *v14;
  uint64_t Instance;
  const void *v16;
  char v17;
  size_t v18;
  void *v19;
  CFTypeRef v20;
  CFTypeRef v21;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = *(unsigned __int8 *)(v4 + 32);
    if ((v5 & 1) != 0)
    {
      if (cf && (v9 = CFGetTypeID(cf), v9 == CFDictionaryGetTypeID()))
      {
        v10 = (v5 >> 1) & 1;
        Value = (const __CFBoolean *)CFDictionaryGetValue(cf, (const void *)kPCSKeyDiversifiedCompact);
        if (Value)
        {
          v12 = Value;
          v13 = CFGetTypeID(Value);
          if (v13 == CFBooleanGetTypeID())
            v10 = CFBooleanGetValue(v12) != 0;
        }
      }
      else
      {
        v10 = v5 & 2;
      }
      v14 = **(_QWORD ***)(v4 + 40);
      PCSKeyGetTypeID();
      Instance = _CFRuntimeCreateInstance();
      if (Instance)
      {
        v16 = (const void *)Instance;
        v17 = v10 ? 6 : 4;
        *(_BYTE *)(Instance + 32) = *(_BYTE *)(Instance + 32) & 0xF8 | v17;
        *(_QWORD *)(Instance + 40) = 0;
        *(_QWORD *)(Instance + 48) = 0;
        v18 = ccec_diversify_min_entropy_len();
        v19 = malloc_type_malloc(v18, 0x8B7C2EC2uLL);
        if (!v19
          || (ccsha256_di(), CFDataGetLength(a2), CFDataGetBytePtr(a2), cchkdf())
          || !_PCSKeyAllocateDiversizedKey(v14, (uint64_t)v16)
          || (ccDRBGGetRngState(), ccec_diversify_pub()))
        {
          v20 = 0;
        }
        else
        {
          v20 = CFRetain(v16);
        }
        CFRelease(v16);
        free(v19);
        if (v20)
        {
          v21 = _PCSPublicIdentityCreateWithKey(v20, a4);
          CFRelease(v20);
          return v21;
        }
      }
      _PCSErrorOOM(a4);
    }
  }
  return 0;
}

CFTypeRef _PCSPublicIdentityCreateWithKey(const void *a1, const void **a2)
{
  _QWORD *Instance;
  const void *v5;
  CFTypeRef v6;

  if (a1)
  {
    PCSPublicIdentityGetTypeID();
    Instance = (_QWORD *)_CFRuntimeCreateInstance();
    if (Instance)
    {
      v5 = Instance;
      Instance[2] = 0;
      Instance[4] = 0;
      Instance[5] = 0;
      Instance[3] = CFRetain(a1);
      v6 = CFRetain(v5);
      CFRelease(v5);
      return v6;
    }
    _PCSErrorOOM(a2);
  }
  return 0;
}

CFTypeRef PCSIdentityCreateDiversifiedIdentityFromPublicIdentityOptions(uint64_t a1, const __CFData *a2, const __CFDictionary *cf, const void **a4)
{
  uint64_t v4;
  _QWORD **v6;
  unsigned int v9;
  CFTypeID v10;
  int v11;
  const __CFBoolean *Value;
  const __CFBoolean *v13;
  CFTypeID v14;
  _QWORD *v15;
  size_t v16;
  uint64_t Instance;
  void **v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFTypeRef v24;
  CFTypeRef v25;

  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    return 0;
  v6 = *(_QWORD ***)(v4 + 40);
  if (v6)
  {
    v9 = *(unsigned __int8 *)(v4 + 32);
    if (cf && (v10 = CFGetTypeID(cf), v10 == CFDictionaryGetTypeID()))
    {
      v11 = (v9 >> 1) & 1;
      Value = (const __CFBoolean *)CFDictionaryGetValue(cf, (const void *)kPCSKeyDiversifiedCompact);
      if (Value)
      {
        v13 = Value;
        v14 = CFGetTypeID(Value);
        if (v14 == CFBooleanGetTypeID())
          v11 = CFBooleanGetValue(v13) != 0;
      }
    }
    else
    {
      v11 = v9 & 2;
    }
    v15 = *v6;
    if (*v6)
    {
      v16 = ccec_diversify_min_entropy_len();
      PCSKeyGetTypeID();
      Instance = _CFRuntimeCreateInstance();
      if (Instance)
      {
        v18 = (void **)Instance;
        if (v11)
          v19 = 6;
        else
          v19 = 4;
        *(_BYTE *)(Instance + 32) = *(_BYTE *)(Instance + 32) & 0xF8 | v19;
        *(_QWORD *)(Instance + 40) = 0;
        *(_QWORD *)(Instance + 48) = 0;
        v20 = malloc_type_malloc(v16, 0x1F2E8491uLL);
        if (v20)
        {
          v21 = v20;
          ccsha256_di();
          CFDataGetLength(a2);
          CFDataGetBytePtr(a2);
          if (cchkdf())
            goto LABEL_28;
          if (!_PCSKeyAllocateDiversizedKey(v15, (uint64_t)v18))
            goto LABEL_28;
          ccDRBGGetRngState();
          if (ccec_diversify_pub())
            goto LABEL_28;
          if ((v9 & 4) == 0)
          {
            v22 = 0;
LABEL_23:
            v24 = CFRetain(v18);
            goto LABEL_24;
          }
          free(v18[6]);
          v18[6] = 0;
          v23 = malloc_type_calloc(1uLL, 24 * *v15 + 16, 0x58982055uLL);
          v18[6] = v23;
          if (!v23)
          {
LABEL_28:
            v24 = 0;
            v22 = 0;
          }
          else
          {
            v22 = malloc_type_calloc(1uLL, 24 * *v15 + 16, 0x14161DD0uLL);
            if (v22)
            {
              ccDRBGGetRngState();
              if (!ccec_diversify_pub())
                goto LABEL_23;
            }
            v24 = 0;
          }
LABEL_24:
          CFRelease(v18);
          memset_s(v21, v16, 0, v16);
          free(v21);
          if (v22)
            cc_clear();
          free(v22);
          if (v24)
          {
            v25 = _PCSPublicIdentityCreateWithKey(v24, a4);
            CFRelease(v24);
            return v25;
          }
          goto LABEL_30;
        }
        CFRelease(v18);
      }
    }
  }
LABEL_30:
  _PCSErrorOOM(a4);
  return 0;
}

uint64_t PCSPublicIdentityGetPublicKey(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 24) + 40);
}

uint64_t PCSIdentityGetPrivateKey(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
}

uint64_t _PCSIdentityGetSigningIdentity(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  __CFData *v5;
  const __CFData *v6;

  if (!*(_QWORD *)(a1 + 80))
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 && (v3 = *(int **)(v2 + 16)) != 0)
      v4 = *v3;
    else
      v4 = 0;
    if (PCSServiceItemAllowSyntheticManateeSharing(v4))
    {
      v5 = _PCSKeyCopyExportedPrivateKey(*(_QWORD *)(a1 + 16));
      v6 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"SyntheticManateeSharing", 23, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      *(_QWORD *)(a1 + 80) = PCSDeriveIdentity(v5, 0, v6);
      if (v5)
        CFRelease(v5);
      CFRelease(v6);
    }
  }
  return *(_QWORD *)(a1 + 80);
}

CFTypeRef PCSDeriveIdentity(const __CFData *a1, int a2, const __CFData *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t Instance;
  uint64_t v13;
  _DWORD *v14;
  CFTypeRef v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    ccsha512_di();
    v5 = ccec_cp_521();
  }
  else if (a2 == 1)
  {
    ccsha256_di();
    v5 = MEMORY[0x1AF415040]();
  }
  else
  {
    if (a2)
      return 0;
    ccsha256_di();
    v5 = MEMORY[0x1AF415034]();
  }
  v6 = (_QWORD *)v5;
  v7 = cczp_bitlen();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v18 - ((v8 + 23) & 0x3FFFFFFFFFFFFFF0);
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  CFDataGetLength(a3);
  CFDataGetBytePtr(a3);
  if (cchkdf() || (PCSIdentityGetTypeID(), (v10 = _CFRuntimeCreateInstance()) == 0))
  {
    v15 = 0;
  }
  else
  {
    v11 = (uint64_t *)v10;
    PCSKeyGetTypeID();
    Instance = _CFRuntimeCreateInstance();
    v11[2] = Instance;
    if (Instance
      && (*(_QWORD *)(v11[2] + 40) = malloc_type_calloc(1uLL, (32 * *v6) | 0x10, 0x8217433FuLL)) != 0
      && (ccDRBGGetRngState(), !ccec_generate_key_deterministic())
      && (*(_BYTE *)(v11[2] + 32) |= 1u, *(_BYTE *)(v11[2] + 32) &= ~2u, SetKeyID(v11[2]))
      && (v14 = _PCSSignKey(v11[2], *(_QWORD *)(v11[2] + 40), (*(unsigned __int8 *)(v11[2] + 32) >> 1) & 1, 0, 0, v13, 0), (*(_QWORD *)(v11[2] + 16) = v14) != 0))
    {
      v15 = CFRetain(v11);
    }
    else
    {
      v15 = 0;
    }
    CFRelease(v11);
  }
  v16 = cczp_bitlen();
  bzero(v9, (unint64_t)(v16 + 7) >> 3);
  return v15;
}

void _PCSIdentitySetSigningIdentity(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 80);
  if (v3 != cf)
  {
    if (v3)
    {
      *(_QWORD *)(a1 + 80) = 0;
      CFRelease(v3);
    }
    if (cf)
      CFRetain(cf);
    *(_QWORD *)(a1 + 80) = cf;
  }
}

CFDataRef PCSPublicIdentityCopyExportedPublicKey(uint64_t a1)
{
  CFDataRef result;

  result = *(CFDataRef *)(a1 + 24);
  if (result)
    return PCSKeyCopyExportedPublicKey((uint64_t)result);
  return result;
}

CFDataRef PCSKeyCopyExportedPublicKey(uint64_t a1)
{
  uint64_t v1;
  CFIndex v2;
  char v4;
  unint64_t v5;
  CFIndex v6;
  __CFData *Mutable;
  CFIndex v8;
  CFIndex v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
      return CFDataCreate(0, *(const UInt8 **)(v1 + 16), v2);
  }
  v4 = *(_BYTE *)(a1 + 32);
  if ((v4 & 4) != 0)
  {
    v8 = ccec_der_export_diversified_pub_size();
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v8);
    if (Mutable)
    {
      CFDataGetMutableBytePtr(Mutable);
      if (!ccec_der_export_diversified_pub())
      {
        CFRelease(Mutable);
        return 0;
      }
    }
  }
  else
  {
    v5 = cczp_bitlen() + 7;
    if ((v4 & 2) != 0)
    {
      v9 = v5 >> 3;
      Mutable = CFDataCreateMutable(0, 0);
      CFDataSetLength(Mutable, v9);
      if (Mutable)
      {
        CFDataGetMutableBytePtr(Mutable);
        ccec_compact_export();
      }
    }
    else
    {
      v6 = (v5 >> 2) | 1;
      Mutable = CFDataCreateMutable(0, 0);
      CFDataSetLength(Mutable, v6);
      if (Mutable)
      {
        CFDataGetMutableBytePtr(Mutable);
        ccec_export_pub();
      }
    }
  }
  return Mutable;
}

_QWORD *PCSPublicIdentityCreateWithPublicKeyInfo(const __CFData *a1, const void **a2)
{
  uint64_t v4;
  _QWORD *Instance;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v4 = decode_PCSPublicKeyInfo();
  if ((_DWORD)v4)
  {
    _PCSErrorASN1(a2, (uint64_t)"PCSPublicKeyInfo", v4);
LABEL_7:
    Instance = 0;
    goto LABEL_4;
  }
  PCSPublicIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v6 = PCSKeyCreateWithPKI((uint64_t)v8, a2);
    Instance[3] = v6;
    if (!v6)
    {
      CFRelease(Instance);
      goto LABEL_7;
    }
  }
LABEL_4:
  free_PCSPublicKeyInfo();
  return Instance;
}

uint64_t PCSKeyCreateWithPKI(uint64_t a1, const void **a2)
{
  unsigned int v3;
  int v4;
  const __CFData *v5;
  const __CFData *v6;
  uint64_t PublicWithData;
  uint64_t v8;
  _QWORD *v9;
  uint64_t Instance;

  v3 = *(_DWORD *)(a1 + 4);
  if (v3 > 8)
    goto LABEL_13;
  v4 = 1 << v3;
  if ((v4 & 0xB) != 0)
  {
    v5 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 16), *(_QWORD *)(a1 + 8), (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    if (v5)
    {
      v6 = v5;
      PublicWithData = PCSKeyCreatePublicWithData(v5, a2);
      CFRelease(v6);
      goto LABEL_11;
    }
LABEL_13:
    _PCSErrorOOM(a2);
    return 0;
  }
  if ((v4 & 0x180) == 0)
    goto LABEL_13;
  v8 = ccec_diversified_cp();
  if (!v8)
    goto LABEL_13;
  v9 = (_QWORD *)v8;
  PCSKeyGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    goto LABEL_13;
  PublicWithData = Instance;
  *(_BYTE *)(Instance + 32) = *(_BYTE *)(Instance + 32) & 0xF8 | 4;
  if (!_PCSKeyAllocateDiversizedKey(v9, Instance))
    goto LABEL_15;
  if (ccec_der_import_diversified_pub())
    goto LABEL_15;
  *(_BYTE *)(PublicWithData + 32) &= ~2u;
  if (!SetKeyID(PublicWithData))
    goto LABEL_15;
LABEL_11:
  *(_QWORD *)(PublicWithData + 16) = malloc_type_malloc(0x30uLL, 0x10A0040698877B7uLL);
  if (copy_PCSPublicKeyInfo())
  {
LABEL_15:
    _PCSErrorOOM(a2);
    CFRelease((CFTypeRef)PublicWithData);
    return 0;
  }
  return PublicWithData;
}

uint64_t PCSPublicIdentityCopyPublicKeyInfo(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 && *(_QWORD *)(v1 + 16))
    return PCSCreateExportedPublicKeyInfo();
  else
    return 0;
}

uint64_t __PCSIdentitySetGetPrivateKey(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v3;
  void *v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  if (!*(_QWORD *)(v3 + 16))
    goto LABEL_6;
  v7 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040698877B7uLL);
  a2[2] = v7;
  if (v7 && !copy_PCSPublicKeyInfo())
  {
    v3 = *(_QWORD *)(a1 + 16);
LABEL_6:
    if ((CopyOctetStringFromPrivKey((*(unsigned __int8 *)(v3 + 32) >> 1) & 1, 0, *(_QWORD *)(v3 + 40), (uint64_t)a2) & 1) != 0)
      return 1;
    _PCSError(a3, 42, CFSTR("failed to export full key"));
    goto LABEL_10;
  }
  _PCSErrorOOM(a3);
LABEL_10:
  free_PCSPrivateKey();
  return 0;
}

uint64_t CopyOctetStringFromPrivKey(int a1, int a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  void *v11;

  if (a2 == 1 || !a1)
  {
    v9 = ccec_der_export_priv_size();
    if (v9)
    {
      v10 = v9;
      v11 = malloc_type_malloc(v9, 0x28742640uLL);
      *(_QWORD *)(a4 + 8) = v11;
      if (v11)
      {
        *(_QWORD *)a4 = v10;
        if (!ccec_der_export_priv())
          return 1;
        free(*(void **)(a4 + 8));
      }
    }
    return 0;
  }
  v5 = (unint64_t)(cczp_bitlen() + 7) >> 2;
  v6 = v5 & 0x3FFFFFFFFFFFFFFELL;
  if ((v5 & 0x3FFFFFFFFFFFFFFELL) == 0)
    return 0;
  v7 = malloc_type_malloc(v5 & 0x3FFFFFFFFFFFFFFELL, 0x7BCE64E9uLL);
  *(_QWORD *)(a4 + 8) = v7;
  if (!v7)
    return 0;
  *(_QWORD *)a4 = v6;
  v8 = 1;
  ccec_compact_export();
  return v8;
}

BOOL __PCSFillCurrentsKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const __CFData *v4;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(const __CFData **)(v3 + 24);
  *(_DWORD *)a2 = **(_DWORD **)(v3 + 16);
  return _PCSFillOctetString((CFIndex *)(a2 + 8), v4);
}

CFDataRef PCSIdentityCopyExternalForm(uint64_t a1, uint64_t a2, const void **a3)
{
  const __CFString *v6;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v9;
  uint64_t *v10;
  _DWORD *v11;
  const __CFDictionary *v12;
  size_t v13;
  CFIndex *v14;
  uint64_t v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  int v18;
  CFIndex v19;
  __CFData *Mutable;
  __CFData *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  CFIndex v26;
  __CFData *v27;
  CFDataRef ExternalRepresentation;
  CFDataRef result;
  const __CFString *v30;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD context[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v41 = 0;
  v42 = &v41;
  v43 = 0x6010000000;
  v44 = &unk_1A95609B5;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (!a1)
  {
    _PCSError(a3, 125, CFSTR("PCSIdentityCopyExternalForm: identity missing"));
    goto LABEL_29;
  }
  v47 = 0uLL;
  v48 = 0uLL;
  v45 = 0uLL;
  v46 = 0uLL;
  v6 = *(const __CFString **)(a1 + 24);
  if (v6)
  {
    CFRetain(*(CFTypeRef *)(a1 + 24));
    Length = CFStringGetLength(v6);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v9 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xE17BA2BFuLL);
    if (!CFStringGetCString(v6, v9, MaximumSizeForEncoding, 0x8000100u))
      *v9 = 0;
    CFRelease(v6);
    v10 = v42;
  }
  else
  {
    v9 = strdup("");
    v10 = &v41;
  }
  v10[4] = (uint64_t)v9;
  if (*(_DWORD *)(a1 + 40))
  {
    v11 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
    v42[10] = (uint64_t)v11;
    if (!v11)
    {
      _PCSErrorOOM(a3);
      goto LABEL_29;
    }
    *v11 = *(_DWORD *)(a1 + 40);
  }
  v12 = *(const __CFDictionary **)(a1 + 64);
  if (v12)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16))
    {
      v13 = CFDictionaryGetCount(v12) + 1;
      v14 = (CFIndex *)malloc_type_calloc(v13, 0x18uLL, 0x10800404ACF7207uLL);
      v42[8] = (uint64_t)v14;
      v15 = *(_QWORD *)(a1 + 16);
      *(_DWORD *)v14 = **(_DWORD **)(v15 + 16);
      _PCSFillOctetString(v14 + 1, *(CFDataRef *)(v15 + 24));
      *((_DWORD *)v38 + 6) = 1;
      v16 = *(const __CFDictionary **)(a1 + 64);
      if (v16)
      {
        context[0] = MEMORY[0x1E0C809B0];
        context[1] = 3221225472;
        context[2] = __PCSIdentityCopyExternalForm_block_invoke;
        context[3] = &unk_1E553DDE0;
        context[4] = &v41;
        context[5] = &v37;
        context[6] = v13;
        CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)apply_block_2_0, context);
        if (v13 != *((_DWORD *)v38 + 6))
          __assert_rtn("PCSIdentityCopyExternalForm", "CloudIdentity.m", 2309, "n == count");
      }
    }
  }
  if (!AddPCSKey((uint64_t)(v42 + 4), *(_QWORD *)(a1 + 16), a3))
    goto LABEL_29;
  v17 = *(const __CFDictionary **)(a1 + 72);
  if (v17)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16))
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __PCSIdentityCopyExternalForm_block_invoke_2;
      v31[3] = &unk_1E553DE08;
      v31[4] = &v32;
      v31[5] = &v41;
      v31[6] = a1;
      v31[7] = a3;
      CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)apply_block_2_0, v31);
      v18 = *((unsigned __int8 *)v33 + 24);
      _Block_object_dispose(&v32, 8);
      if (v18)
        goto LABEL_29;
    }
  }
  v32 = 0;
  v19 = length_PCSKeySet();
  Mutable = CFDataCreateMutable(0, v19);
  v21 = Mutable;
  if (!Mutable)
    goto LABEL_27;
  CFDataSetLength(Mutable, v19);
  CFDataGetMutableBytePtr(v21);
  v22 = encode_PCSKeySet();
  if ((_DWORD)v22)
  {
LABEL_20:
    CFRelease(v21);
LABEL_28:
    _PCSError(a3, 7, CFSTR("PCSKeySet encode error: %d"), v22);
LABEL_29:
    ExternalRepresentation = 0;
LABEL_30:
    free_PCSKeySet();
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    return ExternalRepresentation;
  }
  if (v19 != v32)
    goto LABEL_44;
  v23 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
  v42[9] = (uint64_t)v23;
  if (!v23)
    goto LABEL_38;
  v24 = malloc_type_malloc(0x20uLL, 0xB390598FuLL);
  *(_QWORD *)(v42[9] + 8) = v24;
  v25 = (_QWORD *)v42[9];
  if (!v25[1])
  {
    _PCSErrorOOM(a3);
    goto LABEL_38;
  }
  *v25 = 32;
  ccsha256_di();
  CFDataGetLength(v21);
  CFDataGetBytePtr(v21);
  ccdigest();
  CFRelease(v21);
  v32 = 0;
  v26 = length_PCSKeySet();
  v27 = CFDataCreateMutable(0, v26);
  v21 = v27;
  if (!v27)
  {
LABEL_27:
    v22 = 12;
    goto LABEL_28;
  }
  CFDataSetLength(v27, v26);
  CFDataGetMutableBytePtr(v21);
  v22 = encode_PCSKeySet();
  if ((_DWORD)v22)
    goto LABEL_20;
  if (v26 == v32)
  {
    if ((_DWORD)a2 == 1)
    {
      v30 = __PCSCreateExportPEM(kPCSPEMIdentityCollection, v21);
      if (v30)
      {
        ExternalRepresentation = CFStringCreateExternalRepresentation(0, v30, 0x8000100u, 0);
        CFRelease(v30);
        goto LABEL_39;
      }
    }
    else
    {
      if (!(_DWORD)a2)
      {
        CFRetain(v21);
        ExternalRepresentation = v21;
LABEL_39:
        CFRelease(v21);
        goto LABEL_30;
      }
      _PCSError(a3, 7, CFSTR("Invalid format: %d"), a2);
    }
LABEL_38:
    ExternalRepresentation = 0;
    goto LABEL_39;
  }
LABEL_44:
  result = (CFDataRef)asn1_abort();
  __break(1u);
  return result;
}

void sub_1A9513380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t AddPCSKey(uint64_t a1, uint64_t a2, const void **a3)
{
  unsigned int v4;
  int v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = *(unsigned __int8 *)(a2 + 32);
  if ((v4 & 1) != 0)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)(a2 + 16);
    if ((CopyOctetStringFromPrivKey((v4 >> 1) & 1, 0, *(_QWORD *)(a2 + 40), (uint64_t)&v8) & 1) != 0)
    {
      v6 = add_PCSPrivateKeys((unsigned int *)(a1 + 8));
      free(v9);
      if (!v6)
        return 1;
      _PCSErrorOOM(a3);
    }
    else
    {
      _PCSError(a3, 42, CFSTR("failed to export full key"));
    }
  }
  else
  {
    _PCSError(a3, 40, CFSTR("Identity not a full identity"));
  }
  return 0;
}

BOOL _PCSIdentityAddFromExternalForm(uint64_t a1, int a2, CFDataRef theData, const void **a4)
{
  uint64_t v8;
  const void *v9;
  CFStringRef v10;
  uint64_t v11;
  const __CFDictionary *Mutable;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *Empty;
  uint64_t v17;
  CFDataRef v18;
  CFDataRef v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const __CFAllocator *v23;
  uint64_t v24;
  CFDataRef v25;
  CFNumberRef v26;
  uint64_t v28;
  const UInt8 **v29;
  CFDataRef v30;
  CFTypeRef *Value;
  _QWORD context[6];
  char v33;
  uint64_t v34;
  char *cStr[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  UInt8 bytes[8];
  UInt8 *v40;
  uint64_t v41;
  const void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 16))
    abort();
  v34 = 0;
  *(_OWORD *)cStr = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v8 = decode_PCSKeySet();
  if ((_DWORD)v8)
  {
    _PCSError(a4, 8, CFSTR("failed to decode PCSKeySet: %d"), v8);
    goto LABEL_65;
  }
  if (!VerifyChecksum((uint64_t)cStr, a4))
    goto LABEL_65;
  if ((_QWORD)v38)
    *(_DWORD *)(a1 + 40) = *(_DWORD *)v38;
  v9 = *(const void **)(a1 + 24);
  if (v9)
  {
    *(_QWORD *)(a1 + 24) = 0;
    CFRelease(v9);
  }
  v10 = CFStringCreateWithCString(0, cStr[0], 0x8000100u);
  *(_QWORD *)(a1 + 24) = v10;
  if (!v10)
  {
    free_PCSKeySet();
    _PCSErrorOOM(a4);
    return 0;
  }
  if (!*(_QWORD *)(a1 + 16) && !DWORD2(v36) && LODWORD(cStr[1]) == 1)
  {
    *(_QWORD *)(a1 + 16) = PCSKeyCreate(v36, 0, a4);
    free_PCSKeySet();
    return *(_QWORD *)(a1 + 16) != 0;
  }
  if (!*(_QWORD *)(a1 + 72))
    *(_QWORD *)(a1 + 72) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!*(_QWORD *)(a1 + 64))
    *(_QWORD *)(a1 + 64) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
LABEL_65:
    v11 = 0;
    goto LABEL_51;
  }
  if (!LODWORD(cStr[1]))
  {
LABEL_34:
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_35;
    v28 = DWORD2(v36);
    if (!DWORD2(v36))
      goto LABEL_35;
    v29 = (const UInt8 **)(v37 + 16);
    while (*((_DWORD *)v29 - 4) != 1)
    {
      v29 += 3;
      if (!--v28)
        goto LABEL_35;
    }
    v30 = CFDataCreate(0, *v29, (CFIndex)*(v29 - 1));
    Value = (CFTypeRef *)CFDictionaryGetValue(Mutable, v30);
    if (Value)
    {
      *(_QWORD *)(a1 + 16) = CFRetain(Value[2]);
      CFDictionaryRemoveValue(Mutable, v30);
      CFRelease(v30);
LABEL_35:
      CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)AddKeysApplier, *(void **)(a1 + 72));
      v20 = DWORD2(v36);
      if (DWORD2(v36))
      {
        v21 = 0;
        v22 = 0;
        v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
        do
        {
          v24 = v37 + v21;
          if (*(_DWORD *)(v37 + v21) != 1)
          {
            v25 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(v24 + 16), *(_QWORD *)(v24 + 8), v23);
            *(_QWORD *)bytes = 0;
            v40 = bytes;
            v41 = 0x2020000000;
            v42 = 0;
            v42 = CFDictionaryGetValue(Mutable, v25);
            if (*((_QWORD *)v40 + 3)
              || (context[0] = MEMORY[0x1E0C809B0],
                  context[1] = 3221225472,
                  context[2] = ___PCSIdentityAddFromExternalForm_block_invoke,
                  context[3] = &unk_1E553DE30,
                  context[4] = bytes,
                  context[5] = v24,
                  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)apply_block_2_0, context),
                  *((_QWORD *)v40 + 3)))
            {
              if (v25)
                CFRelease(v25);
              v26 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)v24);
              if (v26)
              {
                CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), v26, *((const void **)v40 + 3));
                CFRelease(v26);
              }
            }
            else if (v25)
            {
              CFRelease(v25);
            }
            _Block_object_dispose(bytes, 8);
            v20 = DWORD2(v36);
          }
          ++v22;
          v21 += 24;
        }
        while (v22 < v20);
      }
      v11 = 1;
      goto LABEL_50;
    }
    free_PCSKeySet();
    CFRelease(v30);
    CFRelease(Mutable);
    _PCSError(a4, 11, CFSTR("Master key is missing"));
    return 0;
  }
  v13 = 0;
  v14 = 0;
  while (1)
  {
    v33 = 0;
    if (!a2)
      break;
    if (!_PCSValidateKey((_QWORD *)(v36 + v13), &v33, 0, 0, a4))
      goto LABEL_63;
    if (!v33)
      break;
LABEL_33:
    ++v14;
    v13 += 24;
    if (v14 >= LODWORD(cStr[1]))
      goto LABEL_34;
  }
  v15 = v36;
  Empty = (_QWORD *)_PCSIdentityCreateEmpty(a4);
  if (!Empty)
    goto LABEL_63;
  v17 = PCSKeyCreate(v15 + v13, 1, a4);
  Empty[2] = v17;
  if (!v17)
    goto LABEL_62;
  CFDictionarySetValue(Mutable, *(const void **)(v17 + 24), Empty);
  if (!*(_QWORD *)(Empty[2] + 16))
  {
LABEL_32:
    CFRelease(Empty);
    goto LABEL_33;
  }
  ccsha256_di();
  ccdigest();
  v18 = CFDataCreate(0, bytes, 20);
  v19 = v18;
  if (v18)
  {
    if (!CFEqual(v18, *(CFTypeRef *)(Empty[2] + 24)))
      CFDictionarySetValue(Mutable, v19, Empty);
    CFRelease(v19);
    goto LABEL_32;
  }
  _PCSErrorOOM(a4);
LABEL_62:
  CFRelease(Empty);
LABEL_63:
  v11 = 0;
LABEL_50:
  CFRelease(Mutable);
LABEL_51:
  free_PCSKeySet();
  return v11;
}

void sub_1A9513ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t VerifyChecksum(uint64_t a1, const void **a2)
{
  uint64_t *v2;
  CFIndex v5;
  __CFData *Mutable;
  __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const void **v11;
  CFIndex v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = *(uint64_t **)(a1 + 40);
  if (v2)
  {
    if (*v2 != 32)
    {
      v23 = *v2;
      v10 = CFSTR("checksum wrong length %d");
      goto LABEL_21;
    }
    *(_QWORD *)(a1 + 40) = 0;
    v5 = length_PCSKeySet();
    Mutable = CFDataCreateMutable(0, v5);
    if (!Mutable)
    {
      v9 = 12;
      goto LABEL_7;
    }
    v7 = Mutable;
    CFDataSetLength(Mutable, v5);
    CFDataGetMutableBytePtr(v7);
    v8 = encode_PCSKeySet();
    if ((_DWORD)v8)
    {
      v9 = v8;
      CFRelease(v7);
LABEL_7:
      *(_QWORD *)(a1 + 40) = v2;
      v23 = v9;
      v10 = CFSTR("PCSKeySet encode error: %d");
      v11 = a2;
      v12 = 7;
LABEL_8:
      _PCSError(v11, v12, v10, v23);
      return 0;
    }
    if (v5)
    {
      v22 = asn1_abort();
      return _PCSValidateKey(v22);
    }
    *(_QWORD *)(a1 + 40) = v2;
    ccsha256_di();
    CFDataGetLength(v7);
    CFDataGetBytePtr(v7);
    ccdigest();
    CFRelease(v7);
    v14 = (uint64_t *)v2[1];
    v15 = *v14;
    v16 = v14[1];
    v18 = v14[2];
    v17 = v14[3];
    if (v15)
      v19 = 0;
    else
      v19 = v24 == v16;
    if (!v19 || v25 != v18 || v26 != v17)
    {
      v10 = CFSTR("checksum wrong");
LABEL_21:
      v11 = a2;
      v12 = 9;
      goto LABEL_8;
    }
  }
  return 1;
}

BOOL _PCSValidateKey(_QWORD *a1, _BYTE *a2, const __CFDictionary *a3, __CFString *a4, const void **a5)
{
  CFStringRef v10;
  CFStringRef v11;
  const __CFData *v12;
  const __CFData *v13;
  const __CFData *KeyIDFromData;
  const __CFData *v15;
  char *BytePtr;
  CFIndex Length;
  CFStringRef v18;
  CFStringRef v19;
  uint64_t v20;
  const void *v21;
  _BOOL8 v22;

  v10 = _PCSCreateHexString(*(char **)(a1[2] + 16), *(_QWORD *)(a1[2] + 8));
  if (!v10)
  {
    _PCSErrorOOM(a5);
    return 0;
  }
  v11 = v10;
  v12 = CFDataCreate(0, *(const UInt8 **)(a1[2] + 16), *(_QWORD *)(a1[2] + 8));
  if (!v12)
  {
    _PCSErrorOOM(a5);
    CFRelease(v11);
    return 0;
  }
  v13 = v12;
  KeyIDFromData = (const __CFData *)_PCSKeyCreateKeyIDFromData(v12);
  v15 = KeyIDFromData;
  if (!KeyIDFromData)
  {
    _PCSErrorOOM(a5);
    v21 = 0;
    v19 = 0;
LABEL_24:
    v22 = 0;
    goto LABEL_12;
  }
  BytePtr = (char *)CFDataGetBytePtr(KeyIDFromData);
  Length = CFDataGetLength(v15);
  v18 = _PCSCreateHexString(BytePtr, Length);
  v19 = v18;
  if (!v18)
  {
    _PCSErrorOOM(a5);
    v21 = 0;
    goto LABEL_24;
  }
  OptionallyAppend(a4, CFSTR("Key: %d %@ - %@ (priv key size %d)\n"), *(unsigned int *)a1[2], v11, v18, *a1);
  if (a3 && a4)
  {
    if (CFDictionaryGetValue(a3, v19))
      CFStringAppendFormat(a4, 0, CFSTR("\tWARNING: key is duplicated\n"));
    CFDictionarySetValue(a3, v19, v11);
  }
  v20 = PCSKeyCreate((uint64_t)a1, 1, a5);
  v21 = (const void *)v20;
  if (!v20)
    goto LABEL_24;
  v22 = _PCSValidatePCSKey(v20, v13, a2, a4);
LABEL_12:
  CFRelease(v13);
  CFRelease(v11);
  if (v15)
    CFRelease(v15);
  if (v19)
    CFRelease(v19);
  if (v21)
    CFRelease(v21);
  return v22;
}

void AddKeysApplier(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

CFStringRef _PCSCreateHexString(char *a1, uint64_t a2)
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  char *v6;
  char v7;

  v2 = a2;
  v4 = (const char *)malloc_type_calloc(1uLL, (2 * a2) | 1, 0x27894678uLL);
  v5 = v4;
  if (v2)
  {
    v6 = (char *)v4;
    do
    {
      *v6 = a0123456789abcd[(unint64_t)*a1 >> 4];
      v7 = *a1++;
      v5 = v6 + 2;
      v6[1] = a0123456789abcd[v7 & 0xF];
      v6 += 2;
      --v2;
    }
    while (v2);
  }
  *v5 = 0;
  return CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
}

BOOL _PCSIdentityValidate(uint64_t a1, _BYTE *a2, __CFString *a3)
{
  uint64_t v6;
  uint64_t v7;
  CFDataRef v8;
  _BOOL8 v9;

  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
    return _PCSValidatePCSKey(v6, 0, a2, a3);
  v7 = *(_QWORD *)(v6 + 16);
  if (!v7)
    return _PCSValidatePCSKey(v6, 0, a2, a3);
  v8 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(v7 + 16), *(_QWORD *)(v7 + 8), (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v9 = _PCSValidatePCSKey(*(_QWORD *)(a1 + 16), v8, a2, a3);
  if (v8)
    CFRelease(v8);
  return v9;
}

BOOL _PCSValidatePCSKey(uint64_t a1, const void *a2, _BYTE *a3, __CFString *a4)
{
  __CFData *v8;
  const __CFData *v9;
  _BOOL4 v10;
  __CFData *Mutable;
  const __SecRandom *v12;
  size_t v13;
  UInt8 *MutableBytePtr;
  __CFData *v15;
  __CFData *v16;
  __CFData *v17;
  __CFData *v18;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD **v21;
  _QWORD **v22;
  const UInt8 *v23;
  CFIndex v24;
  _QWORD **v25;
  _QWORD **v26;
  int v27;
  _BOOL8 v28;
  __int16 v30;

  if (a3)
    *a3 = 0;
  v8 = _PCSKeyCopyExportedPublicKey(a1);
  if (!v8)
  {
    v28 = 0;
    LOBYTE(v10) = 0;
    if (!a3)
      return v28;
    goto LABEL_28;
  }
  v9 = v8;
  if (!a2 || CFEqual(v8, a2))
    goto LABEL_6;
  OptionallyAppend(a4, CFSTR("\tWARNING: public key and private does doesn't agree on what the public key is\n"));
  v30 = 0;
  BytePtr = CFDataGetBytePtr(v9);
  Length = CFDataGetLength(v9);
  v21 = (_QWORD **)CopyPublicKeyFromData((uint64_t)BytePtr, Length, (BOOL *)&v30 + 1, 0);
  if (!v21)
  {
    OptionallyAppend(a4, CFSTR("\tWARNING: public key is not a public key\n"));
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v22 = v21;
  v23 = CFDataGetBytePtr((CFDataRef)a2);
  v24 = CFDataGetLength((CFDataRef)a2);
  v25 = (_QWORD **)CopyPublicKeyFromData((uint64_t)v23, v24, (BOOL *)&v30, 0);
  if (v25)
  {
    v26 = v25;
    if (HIBYTE(v30) != v30)
      OptionallyAppend(a4, CFSTR("\tWARNING: public keys are of different compact-ness\n"));
    if (**v22 == **v26)
    {
      v27 = ccn_cmp();
      v10 = v27 != 0;
      if (v27)
        OptionallyAppend(a4, CFSTR("\tERROR: public keys are just different, all is lost\n"));
      else
        OptionallyAppend(a4, CFSTR("\tGOOD: public keys have same X, will probably work anyway\n"));
    }
    else
    {
      v10 = 0;
      OptionallyAppend(a4, CFSTR("\tWARNING: public keys are of differnt N\n"));
    }
    free(v22);
    free(v26);
  }
  else
  {
    OptionallyAppend(a4, CFSTR("\tWARNING: key data is not a public key\n"));
    free(v22);
    v10 = 1;
  }
LABEL_7:
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 16);
  v12 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v13 = CFDataGetLength(Mutable);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  if (!SecRandomCopyBytes(v12, v13, MutableBytePtr))
  {
    v15 = _PCSKeyCopyWrappedKey(a1, Mutable, 0);
    if (v15)
    {
      v16 = v15;
      v17 = _PCSKeyCopyUnwrappedData(a1, v15, 0);
      if (v17)
      {
        v18 = v17;
        if (!CFEqual(v17, Mutable))
        {
          OptionallyAppend(a4, CFSTR("\tERROR: failed to unwrap with private key"));
          v10 = 1;
        }
        CFRelease(v18);
      }
      else
      {
        OptionallyAppend(a4, CFSTR("\tERROR: failed to unwrap with private key"));
        v10 = 1;
      }
      CFRelease(v16);
      if (!Mutable)
        goto LABEL_26;
    }
    else
    {
      OptionallyAppend(a4, CFSTR("\tERROR: failed to wrap with private key"));
      v10 = 1;
      if (!Mutable)
        goto LABEL_26;
    }
    CFRelease(Mutable);
LABEL_26:
    v28 = !v10;
    goto LABEL_27;
  }
  if (Mutable)
    CFRelease(Mutable);
  v28 = 0;
LABEL_27:
  CFRelease(v9);
  if (a3)
LABEL_28:
    *a3 = v10;
  return v28;
}

void OptionallyAppend(__CFString *a1, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  if (a1)
    CFStringAppendFormatAndArguments(a1, 0, format, va);
}

__CFString *PCSIdentityCopyDiagnostic(const __CFData *a1, int a2, _BYTE *a3, const void **a4)
{
  CFIndex v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  _DWORD *v14;
  char v15;
  unint64_t v16;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v18;
  CFMutableStringRef v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  char *v24;
  uint64_t v25;
  CFStringRef v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  CFStringRef v34;
  unint64_t v35;
  uint64_t i;
  uint64_t j;
  _QWORD v39[3];
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = PCSServiceItemsCount();
  v39[2] = v39;
  v9 = v8 + 1;
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (_DWORD *)((char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v10);
  v14 = (_DWORD *)((char *)v39 - v13);
  if ((v15 & 1) == 0)
  {
    bzero(v12, 4 * v8 + 4);
    bzero(v14, 4 * v8 + 4);
  }
  if (a2)
    v16 = 7;
  else
    v16 = v8;
  if (v16 > v9)
    abort();
  v40 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  *a3 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable || (v18 = Mutable, (v19 = CFStringCreateMutable(0, 0)) == 0))
  {
    _PCSErrorOOM(a4);
    *a3 = 1;
    free_PCSKeySet();
    return 0;
  }
  v20 = v19;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v21 = decode_PCSKeySet();
  if ((_DWORD)v21)
  {
    _PCSError(a4, 8, CFSTR("failed to decode PCSKeySet: %d"), v21);
    goto LABEL_52;
  }
  v22 = v40;
  if (v22 != CFDataGetLength(a1))
  {
    _PCSError(a4, 8, CFSTR("PCSKeySet not the full buffer"));
    goto LABEL_52;
  }
  if (!VerifyChecksum((uint64_t)&v41, a4))
  {
LABEL_52:
    *a3 = 1;
    free_PCSKeySet();
    CFRelease(v20);
    return 0;
  }
  CFStringAppendFormat(v20, 0, CFSTR("Name: %s\n"), (_QWORD)v41);
  if (*((_QWORD *)&v43 + 1))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  CFStringAppendFormat(v20, 0, CFSTR("Checksum: %@\n"), v23);
  if (*((_QWORD *)&v43 + 1))
  {
    v25 = **((_QWORD **)&v43 + 1);
    v24 = *(char **)(*((_QWORD *)&v43 + 1) + 8);
  }
  else
  {
    v39[1] = ccsha256_di();
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    ccdigest();
    v24 = &v45;
    v25 = 32;
  }
  v26 = _PCSCreateHexString(v24, v25);
  CFStringAppendFormat(v20, 0, CFSTR("ksID: %@\n"), v26);
  if (v26)
    CFRelease(v26);
  CFStringAppendFormat(v20, 0, CFSTR("Keys %u:\n"), DWORD2(v41));
  CFStringAppendFormat(v20, 0, CFSTR("Key bag:\n"));
  if (DWORD2(v41))
  {
    v27 = 0;
    v28 = 0;
    v29 = v42;
    while (_PCSValidateKey((_QWORD *)(v29 + v27), a3, v18, v20, a4))
    {
      v29 = v42;
      v30 = **(unsigned int **)(v42 + v27 + 16);
      if (v9 > v30)
        ++v12[v30];
      ++v28;
      v27 += 24;
      if (v28 >= DWORD2(v41))
        goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_26:
  CFStringAppendFormat(v20, 0, CFSTR("Current keys:\n"));
  if (DWORD2(v42))
  {
    v31 = 0;
    v32 = 0;
    v33 = v43;
    do
    {
      v34 = _PCSCreateHexString(*(char **)(v33 + v31 + 16), *(_QWORD *)(v33 + v31 + 8));
      CFStringAppendFormat(v20, 0, CFSTR("keys service: %d data: %@\n"), *(unsigned int *)(v43 + v31), v34);
      if (v34)
        CFRelease(v34);
      v33 = v43;
      v35 = *(unsigned int *)(v43 + v31);
      if (v9 > v35)
        ++v14[v35];
      ++v32;
      v31 += 24;
    }
    while (v32 < DWORD2(v42));
  }
  free_PCSKeySet();
  if (v16)
  {
    for (i = 0; i != v16; ++i)
    {
      if (i)
      {
        if (!v12[i])
          CFStringAppendFormat(v20, 0, CFSTR("expected service not found service %d\n"), i);
      }
      else if (*v12)
      {
        CFStringAppendFormat(v20, 0, CFSTR("unepexcted service 0"));
      }
    }
    for (j = 0; j != v16; ++j)
    {
      if (j)
      {
        if (v14[j] != 1)
          CFStringAppendFormat(v20, 0, CFSTR("current service found %u of service %d\n"), v14[j], j);
      }
      else if (*v14)
      {
        CFStringAppendFormat(v20, 0, CFSTR("unexpected service 0\n"));
      }
    }
  }
  return v20;
}

uint64_t PCSIdentityIsPartial(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 40) >> 1) & 1;
  return result;
}

uint64_t PCSIdentityGetPublicKey(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;

  if (!*(_QWORD *)(a1 + 32))
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 16);
      if (v4)
      {
        *(_QWORD *)(a1 + 32) = _PCSCreateBase64(*(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 8), 0);
      }
      else
      {
        v5 = _PCSKeyCopyExportedPublicKey(v3);
        if (v5)
        {
          v6 = v5;
          BytePtr = CFDataGetBytePtr(v5);
          Length = CFDataGetLength(v6);
          *(_QWORD *)(a1 + 32) = _PCSCreateBase64((uint64_t)BytePtr, Length, 0);
          CFRelease(v6);
        }
      }
    }
  }
  return *(_QWORD *)(a1 + 32);
}

uint64_t PCSTestCDPStatus(uint64_t result)
{
  fakeCdpOnForTest = result;
  return result;
}

uint64_t PCSIdentityGetCDPStatus(uint64_t a1, uint64_t a2, const void **a3)
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  unsigned int v14;
  id v15;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    if (+[PCSUtilities deviceNeedsCompanion](PCSUtilities, "deviceNeedsCompanion"))
    {
      if (PCSIdentitySetCompanionCircleMember(a1, a3))
        return 0;
      else
        return 30;
    }
    else
    {
      v5 = fakeCdpOnForTest;
      if (fakeCdpOnForTest == 99)
      {
        v7 = (void *)MEMORY[0x1AF415520]();
        _PCSIdentitySetGetAltDSIDorPCSAccountsModel(a1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
          objc_msgSend(v9, "setAltDSID:", v8);
          objc_msgSend(v9, "setContext:", *MEMORY[0x1E0CD5C90]);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v9);
          v11 = objc_alloc_init(MEMORY[0x1E0CD5C80]);
          objc_msgSend(v11, "setUseCachedAccountStatus:", 1);
          v15 = 0;
          v12 = objc_msgSend(v10, "fetchCliqueStatus:error:", v11, &v15);
          v13 = v15;
          if (v12 == 2)
            v14 = 10;
          else
            v14 = 30;
          if (v12)
            v5 = v14;
          else
            v5 = 0;

        }
        else
        {
          _PCSError(a3, 90, CFSTR("cannot determine altDSID"));
          v5 = 30;
        }

        objc_autoreleasePoolPop(v7);
      }
    }
  }
  else
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
    return 30;
  }
  return v5;
}

uint64_t PCSCurrentPersonaMatchesDSIDFromSet(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *DSID;
  uint64_t v8;

  v2 = (void *)_PCSIdentitySetCopyPersonaIdentifier(a1);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userPersonaUniqueString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v2 || !v5 || (objc_msgSend(v2, "isEqualToString:", v5) & 1) == 0)
  {
    DSID = (void *)_PCSIdentitySetGetDSID(a1);
    if (!PCSCurrentPersonaMatchesDSID(DSID))
    {
      v8 = 0;
      goto LABEL_8;
    }
    _PCSIdentitySetSetPersonaIdentifier(a1, (uint64_t)v6);
  }
  v8 = 1;
LABEL_8:

  return v8;
}

uint64_t PCSIdentityGetServiceStatus(uint64_t a1, uint64_t a2, const void **a3)
{
  const void *v6;
  uint64_t v7;
  const __CFString *v9;
  const void **v10;
  CFIndex v11;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    v9 = CFSTR("Current persona does not match chosen dsid");
    v10 = a3;
    v11 = 152;
LABEL_7:
    _PCSError(v10, v11, v9);
    return 30;
  }
  if (!a1)
  {
    v9 = CFSTR("No Identity Set Specified");
LABEL_11:
    v10 = a3;
    v11 = 83;
    goto LABEL_7;
  }
  if (!a2)
  {
    v9 = CFSTR("No Service Specified");
    goto LABEL_11;
  }
  v6 = PCSIdentitySetCopyCurrentIdentityWithError(a1, a2, 0);
  if (!v6)
    return PCSIdentityGetCDPStatus(a1, v7, a3);
  CFRelease(v6);
  return 0;
}

_QWORD *PCSIdentityCopyPublicIdentity(uint64_t a1)
{
  _QWORD *Instance;
  uint64_t v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;

  if (!a1)
    return 0;
  PCSPublicIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  if (v3)
  {
    v4 = PCSKeyCreateWithPKI(v3, 0);
    Instance[3] = v4;
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v5 = PCSKeyCopyExportedPublicKey(*(_QWORD *)(a1 + 16));
    if (v5)
    {
      v6 = v5;
      Instance[3] = PCSKeyCreatePublicWithData(v5, 0);
      CFRelease(v6);
      if (!Instance[3])
        goto LABEL_9;
    }
    else if (Instance)
    {
LABEL_9:
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

_QWORD *PCSIdentityCreateFromRaw(const __CFData *a1, int a2, const void **a3)
{
  return _PCSIdentityCreateFromRawWithPublic(a1, 0, a2, a3);
}

_QWORD *_PCSIdentityCreateFromRawWithPublic(const __CFData *a1, const __CFData *a2, int a3, const void **a4)
{
  _QWORD *Empty;
  uint64_t Instance;
  uint64_t v10;
  void *v11;
  BOOL v13;
  _QWORD v14[2];

  Empty = (_QWORD *)_PCSIdentityCreateEmpty(0);
  if (Empty)
  {
    v13 = 0;
    v14[1] = CFDataGetBytePtr(a1);
    v14[0] = CFDataGetLength(a1);
    PCSKeyGetTypeID();
    Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      v10 = Instance;
      *(_BYTE *)(Instance + 32) = *(_BYTE *)(Instance + 32) & 0xFA | 1;
      v11 = CopyPrivKeyFromOctetString((uint64_t)v14, a3, &v13);
      *(_QWORD *)(v10 + 40) = v11;
      if (v11)
      {
        *(_BYTE *)(v10 + 32) = *(_BYTE *)(v10 + 32) & 0xFD | (2 * v13);
        if (a2)
        {
          *(_QWORD *)(v10 + 16) = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040698877B7uLL);
          CFDataGetBytePtr(a2);
          CFDataGetLength(a2);
          if (decode_PCSPublicKeyInfo())
          {
            free(*(void **)(v10 + 16));
            *(_QWORD *)(v10 + 16) = 0;
          }
        }
        if (SetKeyID(v10))
        {
          Empty[2] = v10;
          return Empty;
        }
      }
      _PCSErrorOOM(a4);
      CFRelease((CFTypeRef)v10);
    }
    else
    {
      _PCSErrorOOM(a4);
    }
    Empty[2] = 0;
    CFRelease(Empty);
    return 0;
  }
  return Empty;
}

CFDataRef PCSIdentityCreateExportedRawCompact(uint64_t a1, const void **a2)
{
  uint64_t v3;
  CFDataRef v4;
  UInt8 *v6;
  CFIndex v7;
  UInt8 *v8;

  v3 = *(_QWORD *)(a1 + 16);
  if ((*(_BYTE *)(v3 + 32) & 1) == 0)
  {
    _PCSError(a2, 40, CFSTR("Identity not a full identity"));
    return 0;
  }
  if ((*(_BYTE *)(v3 + 32) & 2) == 0)
  {
    _PCSError(a2, 41, CFSTR("Identity not a compact identity"));
    return 0;
  }
  v7 = 0;
  v8 = 0;
  if ((CopyOctetStringFromPrivKey(1, 1, *(_QWORD *)(v3 + 40), (uint64_t)&v7) & 1) == 0)
  {
    _PCSErrorOOM(a2);
    return 0;
  }
  v6 = v8;
  v4 = CFDataCreate(0, v8, v7);
  cc_clear();
  free(v6);
  if (!v4)
    _PCSErrorOOM(a2);
  return v4;
}

_QWORD *PCSIdentityCreateRandomCompactRaw(const void **a1)
{
  _QWORD *Empty;
  uint64_t RandomFullKey;

  Empty = (_QWORD *)_PCSIdentityCreateEmpty(a1);
  if (Empty)
  {
    RandomFullKey = PCSKeyCreateRandomFullKey(1);
    Empty[2] = RandomFullKey;
    if (!RandomFullKey)
    {
      _PCSErrorOOM(a1);
      CFRelease(Empty);
      return 0;
    }
  }
  return Empty;
}

uint64_t PCSKeyCreateRandomFullKey(int a1)
{
  uint64_t Instance;
  _QWORD *v3;
  char v4;
  void *v5;
  void *v6;

  PCSKeyGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v3 = (_QWORD *)MEMORY[0x1AF415034]();
    if (a1)
      v4 = 3;
    else
      v4 = 1;
    *(_BYTE *)(Instance + 32) = v4 | *(_BYTE *)(Instance + 32) & 0xF8;
    v5 = malloc_type_calloc(1uLL, (32 * *v3) | 0x10, 0xDF38EDBuLL);
    if (!v5)
      goto LABEL_9;
    v6 = v5;
    ccDRBGGetRngState();
    if (a1)
    {
      if (ccec_compact_generate_key())
      {
LABEL_8:
        free(v6);
LABEL_9:
        *(_QWORD *)(Instance + 40) = 0;
LABEL_12:
        CFRelease((CFTypeRef)Instance);
        return 0;
      }
    }
    else if (ccec_generate_key_fips())
    {
      goto LABEL_8;
    }
    *(_QWORD *)(Instance + 40) = v6;
    if (!SetKeyID(Instance))
      goto LABEL_12;
  }
  return Instance;
}

CFNumberRef PCSIdentityCopyServiceNumber(uint64_t a1)
{
  uint64_t v1;
  int valuePtr;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v1 = *(_QWORD *)(v1 + 16);
    if (v1)
      LODWORD(v1) = *(_DWORD *)v1;
  }
  valuePtr = v1;
  return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
}

CFTypeRef PCSIdentityCopyCurrentKeyFingerprint(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1 + 16) + 24));
}

BOOL PCSIdentityCheckWrappable(uint64_t a1, const void **a2)
{
  __CFData *Mutable;
  const __SecRandom *v5;
  size_t Length;
  UInt8 *MutableBytePtr;
  uint64_t v8;
  __CFData *v9;
  uint64_t v10;
  __CFData *v11;
  __CFData *v12;
  _BOOL8 v13;

  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 16);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  Length = CFDataGetLength(Mutable);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  if (SecRandomCopyBytes(v5, Length, MutableBytePtr) || (v8 = *(_QWORD *)(a1 + 16)) == 0)
  {
    v12 = 0;
    v9 = 0;
    goto LABEL_10;
  }
  v9 = _PCSKeyCopyWrappedKey(v8, Mutable, a2);
  if (!v9 || (v10 = *(_QWORD *)(a1 + 16)) == 0)
  {
    v12 = 0;
LABEL_10:
    v13 = 0;
    if (!Mutable)
      goto LABEL_12;
    goto LABEL_11;
  }
  v11 = _PCSKeyCopyUnwrappedData(v10, v9, a2);
  v12 = v11;
  if (!v11)
    goto LABEL_10;
  v13 = CFEqual(v11, Mutable) != 0;
  if (Mutable)
LABEL_11:
    CFRelease(Mutable);
LABEL_12:
  if (v9)
    CFRelease(v9);
  if (v12)
    CFRelease(v12);
  return v13;
}

__CFData *PCSIdentityCopyWrappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  __CFData *result;

  result = *(__CFData **)(a1 + 16);
  if (result)
    return _PCSKeyCopyWrappedKey((uint64_t)result, a2, a3);
  return result;
}

__CFData *_PCSIdentityCopyUnwappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  __CFData *result;

  result = *(__CFData **)(a1 + 16);
  if (result)
    return _PCSKeyCopyUnwrappedData((uint64_t)result, a2, a3);
  return result;
}

uint64_t PCSIdentityCheckValidPublicKey(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  __CFData *v7;
  __CFData *v8;
  CFDataRef v9;
  CFDataRef v10;
  uint64_t v11;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD **v21;
  const UInt8 *v22;
  CFIndex v23;
  _QWORD **v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  char v34;
  __int16 v35;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 16);
    v6 = v3;
    v35 = 0;
    if (v5)
    {
      if (*(_QWORD *)(v5 + 16))
      {
        v7 = _PCSKeyCopyExportedPublicKey(v5);
        if (v7)
        {
          v8 = v7;
          v9 = CFDataCreate(0, *(const UInt8 **)(*(_QWORD *)(v5 + 16) + 16), *(_QWORD *)(*(_QWORD *)(v5 + 16) + 8));
          if (v9)
          {
            v10 = v9;
            if (CFEqual(v8, v9))
            {
              v11 = 1;
LABEL_22:
              CFRelease(v8);
              CFRelease(v10);
LABEL_23:

              goto LABEL_24;
            }
            BytePtr = CFDataGetBytePtr(v8);
            Length = CFDataGetLength(v8);
            v14 = (_QWORD **)CopyPublicKeyFromData((uint64_t)BytePtr, Length, (BOOL *)&v35 + 1, 0);
            if (v14)
            {
              v21 = v14;
              v22 = CFDataGetBytePtr(v10);
              v23 = CFDataGetLength(v10);
              v24 = (_QWORD **)CopyPublicKeyFromData((uint64_t)v22, v23, (BOOL *)&v35, 0);
              if (v24)
              {
                v31 = v24;
                if (HIBYTE(v35) == v35)
                {
                  if (**v21 == **v24)
                  {
                    if (!ccn_cmp())
                    {
                      v11 = 1;
                      goto LABEL_21;
                    }
                    v32 = CFSTR("Different X between the keys, all is lost");
                  }
                  else
                  {
                    v32 = CFSTR("Different n of the keys");
                  }
                }
                else
                {
                  v32 = CFSTR("Different compactness");
                }
                InvalidPublicKey(v6, v32, v25, v26, v27, v28, v29, v30, v34);
                v11 = 0;
LABEL_21:
                free(v21);
                free(v31);
                goto LABEL_22;
              }
              InvalidPublicKey(v6, CFSTR("Failed to parse the PKI from the public key"), v25, v26, v27, v28, v29, v30, v34);
              free(v21);
            }
            else
            {
              InvalidPublicKey(v6, CFSTR("Failed to parse the exported public key"), v15, v16, v17, v18, v19, v20, v34);
            }
            v11 = 0;
            goto LABEL_22;
          }
          CFRelease(v8);
        }
      }
    }
    v11 = 0;
    goto LABEL_23;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

uint64_t PCSPublicIdentityGetPublicID(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = *(_QWORD *)(a1 + 24);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 16);
      if (v4)
      {
        *(_QWORD *)(a1 + 16) = _PCSCreateBase64(*(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 8), 0);
      }
      else
      {
        v5 = PCSKeyCopyExportedPublicKey(v3);
        if (v5)
        {
          v6 = v5;
          BytePtr = CFDataGetBytePtr(v5);
          Length = CFDataGetLength(v6);
          *(_QWORD *)(a1 + 16) = _PCSCreateBase64((uint64_t)BytePtr, Length, 0);
          CFRelease(v6);
        }
      }
    }
  }
  return *(_QWORD *)(a1 + 16);
}

_QWORD *PCSPublicIdentityCreateFromKeyData(const __CFData *a1, const void **a2)
{
  _QWORD *Instance;
  uint64_t PublicWithData;

  PCSPublicIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    PublicWithData = PCSKeyCreatePublicWithData(a1, a2);
    Instance[3] = PublicWithData;
    if (!PublicWithData)
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

BOOL _PCSPublicIdentityIsDiversified(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 24);
    if (v1)
    {
      if ((*(_BYTE *)(v1 + 32) & 4) != 0)
        return 1;
    }
  }
  return result;
}

CFTypeRef _PCSPublicIdentityCreateWithPCSSPKey(unsigned int *a1, const void **a2)
{
  CFTypeRef v3;
  const void *v4;
  CFTypeRef v5;

  if (!a1)
    return 0;
  v3 = PCSKeyCreateWithPCSSPKey(a1, a2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = _PCSPublicIdentityCreateWithKey(v3, a2);
  CFRelease(v4);
  return v5;
}

uint64_t _PCSPublicIdentityExportPCSSPKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const __CFData *v11;
  const __CFData *v12;
  uint64_t v13;
  char v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;

  v9 = *(_QWORD *)(a1 + 24);
  if (!v9 || (v11 = PCSKeyCopyExportedPublicKey(v9)) == 0)
    PCSAbort("failed to get public identity:keydata != NULL", a2, a3, a4, a5, a6, a7, a8, v25);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 24);
  if (v13)
  {
    v14 = *(_BYTE *)(v13 + 32);
    if ((v14 & 1) != 0)
      v15 = 2;
    else
      v15 = 3;
    if ((v14 & 2) != 0)
      v16 = 8;
    else
      v16 = 7;
    if ((v14 & 4) != 0)
      LODWORD(v13) = v16;
    else
      LODWORD(v13) = v15;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = 0;
  if (!_PCSFillOctetString((CFIndex *)(a2 + 16), v11))
    PCSAbort("failed to allocate keydata:_PCSFillOctetString(&data->keyData, keydata)", v17, v18, v19, v20, v21, v22, v23, v25);
  CFRelease(v12);
  return 1;
}

CFDataRef PCSPublicIdentityCopyPublicKey(uint64_t a1)
{
  CFDataRef result;

  result = *(CFDataRef *)(a1 + 24);
  if (result)
    return PCSKeyCopyExportedPublicKey((uint64_t)result);
  return result;
}

uint64_t _PCSExportRandomPCSSPKey(uint64_t a1)
{
  const void *RandomFullKey;
  const __CFData *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  RandomFullKey = (const void *)PCSKeyCreateRandomFullKey(0);
  v3 = PCSKeyCopyExportedPublicKey((uint64_t)RandomFullKey);
  *(_DWORD *)a1 = 3;
  *(_QWORD *)(a1 + 8) = 0;
  if (!_PCSFillOctetString((CFIndex *)(a1 + 16), v3))
    PCSAbort("failed to allocate keydata:_PCSFillOctetString(&data->keyData, keydata)", v4, v5, v6, v7, v8, v9, v10, v12);
  if (v3)
    CFRelease(v3);
  if (RandomFullKey)
    CFRelease(RandomFullKey);
  return 1;
}

const __CFData *PCSPublicIdentityCopyWebSafePublicKeyID(uint64_t a1)
{
  uint64_t v1;
  const __CFData *v2;
  const __CFData *v3;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    v2 = PCSKeyCopyExportedPublicKey(v1);
    v3 = _PCSCopyWebSafePublicKey(v2);
    if (v2)
      CFRelease(v2);
    return v3;
  }
  return _PCSCopyWebSafePublicKey(0);
}

uint64_t PCSPublicIdentityGetServiceName(uint64_t a1)
{
  uint64_t v1;
  int *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 && (v2 = *(int **)(v1 + 16)) != 0)
    return PCSServiceItemGetNameByIndex(*v2);
  else
    return PCSServiceItemGetNameByIndex(0);
}

uint64_t PCSPublicIdentityGetServiceID(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 && (v2 = *(unsigned int **)(v1 + 16)) != 0)
    return *v2;
  else
    return 0;
}

const void *PCSPublicIdentityGetService(uint64_t a1, const __CFNumber *key, void *a3, const void **a4)
{
  const void *Value;
  int IndexByName;
  const void *NumberByIndex;
  uint64_t TypeID;

  if (!a3)
  {
    IndexByName = PCSServiceItemGetIndexByName(key);
    if (IndexByName)
    {
      NumberByIndex = (const void *)PCSServiceItemGetNumberByIndex(IndexByName);
      if (NumberByIndex)
      {
        Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), NumberByIndex);
        if (!Value)
          return Value;
        goto LABEL_7;
      }
    }
    else
    {
      _PCSError(a4, 2, CFSTR("unknown service key: %@"), key);
    }
    return 0;
  }
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a3);
  if (!Value)
  {
    _PCSError(a4, 2, CFSTR("no such keyid: %@"), a3);
    return Value;
  }
LABEL_7:
  TypeID = PCSPublicIdentityGetTypeID();
  if (TypeID != CFGetTypeID(Value))
    PCSPublicIdentityGetService_cold_1();
  return Value;
}

CFTypeRef PCSPublicIdentityCopyCurrentKeyFingerprint(uint64_t a1)
{
  return CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1 + 24) + 24));
}

__CFData *PCSPublicServiceIdentityCopyWrappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  __CFData *result;

  result = *(__CFData **)(a1 + 24);
  if (result)
    return _PCSKeyCopyWrappedKey((uint64_t)result, a2, a3);
  return result;
}

__CFData *_PCSKeyCopyWrappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v6;
  __CFData *v7;

  v6 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FC8;
  v7 = _CopyECPGPWrappedData(a1, a2, a3);
  qword_1ECED4FD0 += PCSMeasureRelativeNanoTime() - v6;
  return v7;
}

__CFData *_PCSKeyCopyUnwrappedData(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v7;
  __CFData *v8;

  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    v7 = PCSMeasureRelativeNanoTime();
    ++qword_1ECED4FD8;
    v8 = _CopyECPGPUnwrappedData(a1, a2, a3);
    qword_1ECED4FE0 += PCSMeasureRelativeNanoTime() - v7;
    return v8;
  }
  else
  {
    _PCSError(a3, 40, CFSTR("Identity not a full identity"));
    return 0;
  }
}

__CFData *PCSServiceIdentityCopyUnwrappedKey(uint64_t a1, const __CFData *a2, const void **a3)
{
  __CFData *result;

  result = *(__CFData **)(a1 + 16);
  if (result)
    return _PCSKeyCopyUnwrappedData((uint64_t)result, a2, a3);
  return result;
}

uint64_t _PCSSignHash(uint64_t a1, const __CFData *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  size_t v11;
  uint64_t v12;
  int v13;

  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    return 0;
  result = _PCSSignAlgToDI(a3, 0);
  if (!result)
    return result;
  if (*(_QWORD *)result != a4)
    return 0;
  *(_DWORD *)(a6 + 16) = a3;
  v11 = (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  *(_QWORD *)(a6 + 24) = v11;
  *(_QWORD *)(a6 + 32) = malloc_type_malloc(v11, 0xC110CBD4uLL);
  v12 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FE8;
  ccDRBGGetRngState();
  v13 = ccec_sign();
  qword_1ECED4FF0 += PCSMeasureRelativeNanoTime() - v12;
  if (v13)
    return 0;
  if (!a2)
    return 1;
  result = _PCSFillOctetString((CFIndex *)a6, a2);
  if ((_DWORD)result)
    return 1;
  return result;
}

_DWORD *_PCSSignKey(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void **a7)
{
  _DWORD *v12;
  _DWORD *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  size_t v17;
  void *v18;
  const __CFData *v19;
  void *v20;
  const __CFData *v21;
  CFIndex Length;
  const UInt8 *BytePtr;

  v12 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040698877B7uLL);
  v13 = v12;
  if (!v12)
  {
    _PCSErrorOOM(a7);
    return v13;
  }
  *v12 = a4;
  if (a5)
  {
    v14 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
    *((_QWORD *)v13 + 3) = v14;
    if (!v14 || copy_PCSAttributes())
      goto LABEL_16;
  }
  v13[1] = 1;
  v15 = cczp_bitlen() + 7;
  if (a3)
  {
    *((_QWORD *)v13 + 1) = v15 >> 3;
    v16 = malloc_type_malloc(v15 >> 3, 0x375F95ABuLL);
    *((_QWORD *)v13 + 2) = v16;
    if (v16)
    {
      ccec_compact_export();
      goto LABEL_11;
    }
LABEL_16:
    _PCSErrorOOM(a7);
LABEL_21:
    free_PCSPublicKeyInfo();
    free(v13);
    return 0;
  }
  v17 = (v15 >> 2) | 1;
  *((_QWORD *)v13 + 1) = v17;
  v18 = malloc_type_malloc(v17, 0xFCBFB0BAuLL);
  *((_QWORD *)v13 + 2) = v18;
  if (!v18)
    goto LABEL_16;
  ccec_export_pub();
LABEL_11:
  v19 = (const __CFData *)PCSCreateExportedPublicKeyInfo();
  v20 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040EC46ECBEuLL);
  *((_QWORD *)v13 + 4) = v20;
  if (!v20)
  {
    _PCSErrorOOM(a7);
    goto LABEL_19;
  }
  v21 = *(const __CFData **)(a1 + 24);
  Length = CFDataGetLength(v19);
  BytePtr = CFDataGetBytePtr(v19);
  if ((signData(a1, v21, 1u, Length, (uint64_t)BytePtr, *((_QWORD *)v13 + 4)) & 1) == 0)
  {
    _PCSError(a7, 16, CFSTR("Signing of service key failed"));
LABEL_19:
    if (v19)
      CFRelease(v19);
    goto LABEL_21;
  }
  if (v19)
    CFRelease(v19);
  return v13;
}

uint64_t signData(uint64_t a1, const __CFData *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = _PCSSignAlgToDI(a3, 0);
  if (result)
  {
    v11 = result;
    ((void (*)(void))MEMORY[0x1E0C80A78])();
    v13 = (char *)v17 - v12;
    ccdigest_init();
    v14 = ccdigest_update();
    if (a3 >= 0x10000)
    {
      v17[1] = bswap32(a3);
      v14 = ccdigest_update();
    }
    MEMORY[0x1E0C80A78](v14);
    v16 = (char *)v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, char *, char *))(v11 + 56))(v11, v13, v16);
    return _PCSSignHash(a1, a2, a3, *(_QWORD *)v11, (uint64_t)v16, a6);
  }
  return result;
}

_QWORD *_PCSVerifyHash(int a1, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6)
{
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;

  result = (_QWORD *)_PCSSignAlgToDI(a2, 0);
  if (result)
  {
    if (*result == a3)
    {
      v9 = PCSMeasureRelativeNanoTime();
      ++qword_1ECED4FF8;
      v10 = ccec_verify();
      qword_1ECED5000 += PCSMeasureRelativeNanoTime() - v9;
      _PCSError(a6, 31, CFSTR("Verification failed, ret=%d, %svalid"), v10, "!");
    }
    return 0;
  }
  return result;
}

uint64_t PCSIdentityIsNewManatee(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  _QWORD *i;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  v3 = *(unsigned int **)(v2 + 24);
  if (!v3)
    return 0;
  v4 = *v3;
  if (!(_DWORD)v4)
    return 0;
  for (i = (_QWORD *)(*((_QWORD *)v3 + 1) + 8); *((_DWORD *)i - 2) != 3 || !*i; i += 3)
  {
    if (!--v4)
      return 0;
  }
  return 1;
}

BOOL PCSIdentityIsFullManatee(uint64_t a1)
{
  _BOOL8 ManateeFlags;
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  ManateeFlags = _PCSIdentityGetManateeFlags(a1, v3);
  if (ManateeFlags)
    free_PCSManateeFlags();
  return ManateeFlags;
}

BOOL _PCSIdentityGetManateeFlags(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t i;

  *a2 = 0;
  a2[1] = 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0;
  v4 = *(unsigned int **)(v3 + 24);
  if (!v4)
    return 0;
  v5 = *v4;
  if (!(_DWORD)v5)
    return 0;
  for (i = *((_QWORD *)v4 + 1) + 16; *(_DWORD *)(i - 16) != 3; i += 24)
  {
    if (!--v5)
      return 0;
  }
  return *(_QWORD *)(i - 8) && decode_PCSManateeFlags() == 0;
}

BOOL _PCSIdentityIsManatee(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  uint64_t NameByIndex;
  _BOOL8 result;

  result = 1;
  if (!PCSIdentityIsFullManatee(a1))
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 && (v3 = *(int **)(v2 + 16)) != 0)
      v4 = *v3;
    else
      v4 = 0;
    NameByIndex = PCSServiceItemGetNameByIndex(v4);
    if (!NameByIndex || !PCSServiceItemTypeIsManatee(NameByIndex))
      return 0;
  }
  return result;
}

BOOL _PCSIdentityRequireManateeSigning(uint64_t a1)
{
  _BOOL8 result;
  uint64_t v3;
  int *v4;
  int v5;
  const void *NameByIndex;
  const void *v7;

  result = _PCSIdentityIsManatee(a1);
  if (result)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3 && (v4 = *(int **)(v3 + 16)) != 0)
      v5 = *v4;
    else
      v5 = 0;
    NameByIndex = (const void *)PCSServiceItemGetNameByIndex(v5);
    result = 1;
    if (NameByIndex)
    {
      v7 = NameByIndex;
      if (CFEqual(NameByIndex, (CFTypeRef)kPCSWalletPaymentServices2)
        || CFEqual(v7, (CFTypeRef)kPCSCoreIDVServiceMessages))
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t _PCSIdentitySupportsServerSigning(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  const void *NameByIndex;

  if (result)
  {
    v1 = result;
    result = _PCSIdentityIsManatee(result);
    if ((_DWORD)result)
    {
      v2 = *(_QWORD *)(v1 + 16);
      if (v2 && (v3 = *(int **)(v2 + 16)) != 0)
        v4 = *v3;
      else
        v4 = 0;
      NameByIndex = (const void *)PCSServiceItemGetNameByIndex(v4);
      return NameByIndex && CFEqual(NameByIndex, (CFTypeRef)kPCSEnergyKitAmiLimitedPeers);
    }
  }
  return result;
}

uint64_t _PCSIdentityIsShareableManatee(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  if (!_PCSIdentityGetManateeFlags(a1, v3))
    return 0;
  v1 = v3[0] & 1;
  free_PCSManateeFlags();
  return v1;
}

uint64_t _PCSIdentityIsTooRolled(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(int **)(v1 + 16)) != 0)
    v3 = *v2;
  else
    v3 = 0;
  result = PCSServiceItemGetNameByIndex(v3);
  if (result)
  {
    v5 = result;
    _PCSServiceItemsGetTooRolledServiceTypes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    return v7;
  }
  return result;
}

const void *PCSIdentityCreateFromData(const __CFData *a1, const void **a2)
{
  uint64_t Empty;
  const void *v5;

  Empty = _PCSIdentityCreateEmpty(a2);
  v5 = (const void *)Empty;
  if (Empty && !_PCSIdentityAddFromExternalForm(Empty, 0, a1, a2))
  {
    CFRelease(v5);
    return 0;
  }
  return v5;
}

const __CFDictionary *PCSIdentityCopyExportedPrivateKey(uint64_t a1, const void **a2)
{
  uint64_t SigningIdentity;
  uint64_t v5;
  void *v6;
  __CFData *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CFIndex v11;
  __CFData *Mutable;
  __CFData *v13;
  void *v14;
  __CFData *v15;
  uint64_t v16;
  void *v17;
  PCSManateeShareableIdentity *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFData *v22;
  CFIndex v23;
  __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  const __CFNumber *v29;
  void *v30;
  const void **v31;
  CFIndex v32;
  void *v33;
  uint64_t v34;

  if (!_PCSIdentityIsShareableManatee(a1))
  {
    v32 = 0;
    v33 = 0;
    v10 = *(_QWORD *)(a1 + 16);
    v34 = *(_QWORD *)(v10 + 16);
    if ((CopyOctetStringFromPrivKey((*(unsigned __int8 *)(v10 + 32) >> 1) & 1, 0, *(_QWORD *)(v10 + 40), (uint64_t)&v32) & 1) != 0)
    {
      v11 = length_PCSPrivateKey();
      Mutable = CFDataCreateMutable(0, v11);
      if (Mutable)
      {
        v13 = Mutable;
        CFDataSetLength(Mutable, v11);
        CFDataGetMutableBytePtr(v13);
        if (!encode_PCSPrivateKey())
        {
          if (v11)
            goto LABEL_34;
          free(v33);
          return v13;
        }
        CFRelease(v13);
      }
      free(v33);
    }
    else
    {
      _PCSError(a2, 42, CFSTR("failed to export full key"));
    }
    return 0;
  }
  SigningIdentity = _PCSIdentityGetSigningIdentity(a1);
  if (!SigningIdentity)
  {
    _PCSError(a2, 144, CFSTR("identity has no signing identity"));
    return 0;
  }
  v5 = SigningIdentity;
  v6 = (void *)objc_opt_new();
  v7 = _PCSKeyCopyExportedPrivateKey(*(_QWORD *)(a1 + 16));
  objc_msgSend(v6, "setPrivateKey:", v7);

  v8 = *(_QWORD *)(a1 + 16);
  if (v8 && *(_QWORD *)(v8 + 16))
    v9 = (void *)PCSCreateExportedPublicKeyInfo();
  else
    v9 = 0;
  objc_msgSend(v6, "setPublicKeyInfo:", v9);

  v14 = (void *)objc_opt_new();
  v15 = _PCSKeyCopyExportedPrivateKey(*(_QWORD *)(v5 + 16));
  objc_msgSend(v14, "setPrivateKey:", v15);

  v16 = *(_QWORD *)(v5 + 16);
  if (v16 && *(_QWORD *)(v16 + 16))
    v17 = (void *)PCSCreateExportedPublicKeyInfo();
  else
    v17 = 0;
  objc_msgSend(v14, "setPublicKeyInfo:", v17);

  v18 = objc_alloc_init(PCSManateeShareableIdentity);
  -[PCSManateeShareableIdentity setEncryptionPrivateKey:](v18, "setEncryptionPrivateKey:", v6);
  -[PCSManateeShareableIdentity setSigningPrivateKey:](v18, "setSigningPrivateKey:", v14);
  -[PCSManateeShareableIdentity encryptionPrivateKey](v18, "encryptionPrivateKey");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        -[PCSManateeShareableIdentity signingPrivateKey](v18, "signingPrivateKey"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        !v21))
  {
    _PCSError(a2, 143, CFSTR("failed to create PCSManateeShareableIdentity data"));
LABEL_29:
    v13 = 0;
LABEL_30:

    return v13;
  }
  v32 = 0;
  v33 = 0;
  -[PCSManateeShareableIdentity data](v18, "data");
  v22 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  _PCSFillOctetString(&v32, v22);

  v23 = length_PCSPrivateKeyProtoBuf();
  v24 = CFDataCreateMutable(0, v23);
  if (!v24)
  {
    v26 = 12;
    goto LABEL_28;
  }
  v13 = v24;
  CFDataSetLength(v24, v23);
  CFDataGetMutableBytePtr(v13);
  v25 = encode_PCSPrivateKeyProtoBuf();
  if ((_DWORD)v25)
  {
    v26 = v25;
    CFRelease(v13);
LABEL_28:
    free(v33);
    _PCSErrorASN1(a2, (uint64_t)"Failed to encode PCSPrivateKeyProtoBuf", v26);
    goto LABEL_29;
  }
  if (!v23)
  {
    free(v33);
    goto LABEL_30;
  }
LABEL_34:
  v28 = asn1_abort();
  return PCSIdentityGetService(v28, v29, v30, v31);
}

const __CFDictionary *PCSIdentityGetService(uint64_t a1, const __CFNumber *key, void *a3, const void **a4)
{
  unsigned int IndexByName;

  if (a3)
    return (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a3);
  IndexByName = PCSServiceItemGetIndexByName(key);
  if (IndexByName)
    return _PCSIdentityGetServiceWithID(a1, IndexByName, a4);
  else
    return 0;
}

const __CFDictionary *_PCSIdentityGetServiceWithID(uint64_t a1, unsigned int a2, const void **a3)
{
  uint64_t NumberByIndex;
  const void *v7;
  const __CFDictionary *result;

  NumberByIndex = PCSServiceItemGetNumberByIndex(a2);
  if (!NumberByIndex)
  {
    _PCSError(a3, 30, CFSTR("Service ID 0 not acceptable"));
    return 0;
  }
  v7 = (const void *)NumberByIndex;
  result = *(const __CFDictionary **)(a1 + 64);
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, v7);
    if (!result)
    {
      _PCSError(a3, 2, CFSTR("No such service identity %lu"), a2);
      return 0;
    }
  }
  return result;
}

_QWORD *PCSIdentityCreateService(uint64_t a1, char a2, const __CFNumber *key, const void **a4)
{
  int IndexByName;
  int v9;
  uint64_t NumberByIndex;
  const void *v11;
  int v12;
  _QWORD *Instance;
  _BOOL4 IsShareableManatee;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  _DWORD *v18;
  size_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *RandomCompactRaw;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  void *v33;

  v27[0] = 0;
  v27[1] = 0;
  IndexByName = PCSServiceItemGetIndexByName(key);
  if (!IndexByName)
    return 0;
  v9 = IndexByName;
  NumberByIndex = PCSServiceItemGetNumberByIndex(IndexByName);
  if (!NumberByIndex)
    return 0;
  v11 = (const void *)NumberByIndex;
  v12 = a2 & 1;
  PCSIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  Instance[2] = PCSKeyCreateRandomFullKey(v12);
  if (PCSServiceItemTypeIsManatee((_BOOL8)key))
    a2 |= 4u;
  IsShareableManatee = PCSServiceItemTypeIsShareableManatee(key);
  v16 = 0;
  if (IsShareableManatee)
    v17 = a2 | 8;
  else
    v17 = a2;
  if ((v17 & 4) == 0)
    goto LABEL_9;
  v30 = 0;
  v31 = 3;
  v28 = 0;
  v29 = 0;
  if ((v17 & 8) != 0)
    LODWORD(v29) = 1;
  v19 = length_PCSManateeFlags();
  v32 = v19;
  v20 = malloc_type_malloc(v19, 0xE2C6AD4BuLL);
  v33 = v20;
  if (!v20)
  {
    v23 = 12;
    goto LABEL_19;
  }
  v21 = v20;
  v22 = encode_PCSManateeFlags();
  if ((_DWORD)v22)
  {
    v23 = v22;
    free(v21);
    v33 = 0;
LABEL_19:
    _PCSErrorASN1(a4, (uint64_t)"ManateeFlags", v23);
    v24 = 0;
LABEL_20:
    free(v24);
    goto LABEL_21;
  }
  if (v28 != v19)
    abort();
  if (add_PCSAttributes((unsigned int *)v27))
  {
    _PCSErrorOOM(a4);
    v24 = v33;
    goto LABEL_20;
  }
  free(v33);
  v16 = v27;
  PCSIdentityAddBuildAndCreationTime((unsigned int *)v27);
  if ((v17 & 8) != 0)
  {
    RandomCompactRaw = PCSIdentityCreateRandomCompactRaw(a4);
    Instance[10] = RandomCompactRaw;
    if (!RandomCompactRaw)
      goto LABEL_21;
    v16 = v27;
  }
LABEL_9:
  v18 = _PCSSignKey(*(_QWORD *)(a1 + 16), *(_QWORD *)(Instance[2] + 40), v12, v9, (uint64_t)v16, v15, a4);
  *(_QWORD *)(Instance[2] + 16) = v18;
  if (!v18)
  {
LABEL_21:
    free_PCSAttributes();
    CFRelease(Instance);
    return 0;
  }
  if ((v17 & 2) != 0)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), v11, Instance);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), *(const void **)(Instance[2] + 24), Instance);
  }
  free_PCSAttributes();
  return Instance;
}

BOOL PCSIdentityAddBuildAndCreationTime(unsigned int *a1)
{
  const __CFString *ClientInfo;
  char *v3;
  size_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  ClientInfo = (const __CFString *)PCSSupportGetClientInfo();
  if (ClientInfo)
    v3 = PCSCFStringToCString(ClientInfo);
  else
    v3 = 0;
  time(0);
  v4 = length_PCSBuildAndTime();
  v5 = malloc_type_malloc(v4, 0x308D4D43uLL);
  v9 = v5;
  if (v5)
  {
    v6 = v5;
    if (encode_PCSBuildAndTime())
    {
      free(v6);
      v5 = 0;
      v7 = 0;
    }
    else
    {
      if (v4)
        abort();
      v7 = add_PCSAttributes(a1) == 0;
      v5 = v9;
    }
  }
  else
  {
    v7 = 0;
  }
  free(v5);
  if (v3)
    free(v3);
  return v7;
}

CFTypeRef PCSIdentityCreateMaster(uint64_t a1, const void **a2)
{
  uint64_t Instance;
  uint64_t *v5;
  uint64_t RandomFullKey;
  uint64_t v7;
  uint64_t v8;
  CFDataRef v9;
  const __CFData *v10;
  CFDataRef v11;
  const __CFData *v12;
  __CFData *Mutable;
  __CFData *v14;
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v17;
  CFIndex v18;
  const __CFData *Signature;
  const __CFData *v20;
  int v21;
  CFTypeRef v22;
  __CFData *v24;
  _QWORD v25[2];
  uint64_t v26;
  CFIndex v27;
  const UInt8 *v28;

  v25[0] = 0;
  v25[1] = 0;
  PCSIdentityGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    _PCSErrorOOM(a2);
    v22 = 0;
    goto LABEL_12;
  }
  v5 = (uint64_t *)Instance;
  RandomFullKey = PCSKeyCreateRandomFullKey(1);
  v5[2] = RandomFullKey;
  if (!RandomFullKey)
  {
    _PCSErrorOOM(a2);
    goto LABEL_20;
  }
  if (!PCSIdentityAddBuildAndCreationTime((unsigned int *)v25))
  {
LABEL_20:
    v22 = 0;
    goto LABEL_11;
  }
  if (a1)
  {
    v8 = v5[2];
    v26 = 0;
    v9 = PCSKeyCopyExportedPublicKey(*(_QWORD *)(a1 + 16));
    if (!v9)
      goto LABEL_20;
    v10 = v9;
    v11 = PCSKeyCopyExportedPublicKey(v8);
    if (v11)
    {
      v12 = v11;
      Mutable = CFDataCreateMutable(0, 0);
      if (Mutable)
      {
        v14 = Mutable;
        CFDataAppendBytes(Mutable, (const UInt8 *)"PCSForwardMasterCertification", 30);
        BytePtr = CFDataGetBytePtr(v10);
        Length = CFDataGetLength(v10);
        CFDataAppendBytes(v14, BytePtr, Length);
        v17 = CFDataGetBytePtr(v12);
        v18 = CFDataGetLength(v12);
        CFDataAppendBytes(v14, v17, v18);
        CFRelease(v10);
        CFRelease(v12);
        Signature = (const __CFData *)PCSIdentityCreateSignature(a1, 0, v14, a2);
        if (Signature)
        {
          v20 = Signature;
          LODWORD(v26) = 2;
          v28 = CFDataGetBytePtr(Signature);
          v27 = CFDataGetLength(v20);
          v21 = add_PCSAttributes((unsigned int *)v25);
          CFRelease(v20);
          CFRelease(v14);
          if (!v21)
            goto LABEL_10;
          goto LABEL_20;
        }
        v24 = v14;
LABEL_19:
        CFRelease(v24);
        goto LABEL_20;
      }
      CFRelease(v10);
    }
    else
    {
      v12 = v10;
    }
    v24 = v12;
    goto LABEL_19;
  }
LABEL_10:
  *(_QWORD *)(v5[2] + 16) = _PCSSignKey(v5[2], *(_QWORD *)(v5[2] + 40), 1, 1, (uint64_t)v25, v7, a2);
  v22 = CFRetain(v5);
LABEL_11:
  CFRelease(v5);
LABEL_12:
  free_PCSAttributes();
  return v22;
}

uint64_t PCSIdentityGetKeyID(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 24);
}

CFDataRef PCSIdentityCopySignatureKeyID(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 && (v2 = *(_QWORD *)(v1 + 16)) != 0 && (v3 = *(_QWORD *)(v2 + 32)) != 0)
    return CFDataCreate(0, *(const UInt8 **)(v3 + 8), *(_QWORD *)v3);
  else
    return 0;
}

CFDataRef PCSIdentityMasterCopyParentKeyID(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v6;
  const UInt8 **v7;
  CFDataRef result;
  const __CFData *v9;
  const __CFData *v10;
  CFDataRef v11;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0;
  if (*(_DWORD *)(v3 + 4) != 1)
    return 0;
  v4 = *(unsigned int **)(v3 + 24);
  if (!v4)
    return 0;
  v6 = *v4;
  if (!(_DWORD)v6)
  {
LABEL_9:
    result = CFDataCreate(0, 0, 0);
    if (result)
      return result;
    goto LABEL_14;
  }
  v7 = (const UInt8 **)(*((_QWORD *)v4 + 1) + 16);
  while (*((_DWORD *)v7 - 4) != 2)
  {
    v7 += 3;
    if (!--v6)
      goto LABEL_9;
  }
  v9 = CFDataCreateWithBytesNoCopy(0, *v7, (CFIndex)*(v7 - 1), (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v9)
  {
LABEL_14:
    _PCSErrorOOM(a2);
    return 0;
  }
  v10 = v9;
  v11 = PCSSignatureCopyKeyID(v9, 0, a2);
  CFRelease(v10);
  return v11;
}

CFDataRef PCSSignatureCopyKeyID(const __CFData *a1, _BYTE *a2, const void **a3)
{
  uint64_t v6;
  CFDataRef v7;

  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v6 = decode_PCSSignature();
  if ((_DWORD)v6)
  {
    _PCSError(a3, 16, CFSTR("Failed to decode signature: %d"), v6);
LABEL_9:
    v7 = 0;
    goto LABEL_6;
  }
  if (CFDataGetLength(a1))
  {
    _PCSError(a3, 16, CFSTR("Did not parse all signature"));
    goto LABEL_9;
  }
  v7 = CFDataCreate(0, 0, 0);
  if (v7)
  {
    if (a2)
      *a2 = 0;
  }
  else
  {
    _PCSErrorOOM(a3);
  }
LABEL_6:
  free_PCSSignature();
  return v7;
}

const void *PCSIdentityCreatePEMParser(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  return PCSIdentityCreateFromData(a3, 0);
}

uint64_t PCSPublicIdentityCreatePEMParser(int a1, int a2, CFDataRef theData)
{
  uint64_t v4;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v4 = decode_PCSUserPublicKeys();
  if ((_DWORD)v4)
    _PCSError(0, 8, CFSTR("Failed to decode PCSUserPublicKeys: %d"), v4);
  free_PCSUserPublicKeys();
  return 0;
}

uint64_t __PCSIdentityCreateWithNameEmpty(uint64_t a1, CFTypeRef cf, const __CFNumber *key)
{
  int IndexByName;
  const __CFString *v7;
  uint64_t v8;
  uint64_t Instance;
  uint64_t v10;
  CFDataRef ExternalRepresentation;
  uint64_t KeyFromRandomData;
  uint64_t v13;

  if (!cf)
    return 0;
  if (key)
  {
    IndexByName = PCSServiceItemGetIndexByName(key);
    v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@-%@"), cf, key);
  }
  else
  {
    v7 = (const __CFString *)CFRetain(cf);
    IndexByName = 1;
  }
  PCSIdentityGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (a1)
    v10 = a1;
  else
    v10 = Instance;
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, v7, 0x8000100u, 0);
  KeyFromRandomData = PCSKeyCreateKeyFromRandomData(ExternalRepresentation, "love");
  *(_QWORD *)(v8 + 16) = KeyFromRandomData;
  *(_QWORD *)(*(_QWORD *)(v8 + 16) + 16) = _PCSSignKey(*(_QWORD *)(v10 + 16), *(_QWORD *)(KeyFromRandomData + 40), (*(unsigned __int8 *)(KeyFromRandomData + 32) >> 1) & 1, IndexByName, 0, v13, 0);
  CFRelease(ExternalRepresentation);
  CFRelease(v7);
  return v8;
}

uint64_t __PCSIdentityCreateWithName(const __CFString *a1)
{
  const __CFString *v1;
  uint64_t Empty;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;
  CFDataRef ExternalRepresentation;
  uint64_t KeyFromRandomData;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;

  if (a1)
    v1 = a1;
  else
    v1 = CFSTR("<unnamed>");
  Empty = _PCSIdentityCreateEmpty(0);
  CFRetain(v1);
  *(_QWORD *)(Empty + 24) = v1;
  PCSKeyGetTypeID();
  *(_QWORD *)(Empty + 16) = _CFRuntimeCreateInstance();
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  *(_QWORD *)(Empty + 64) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  *(_QWORD *)(Empty + 72) = CFDictionaryCreateMutable(0, 0, v3, v4);
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, v1, 0x8000100u, 0);
  KeyFromRandomData = PCSKeyCreateKeyFromRandomData(ExternalRepresentation, "love");
  *(_QWORD *)(Empty + 16) = KeyFromRandomData;
  if (KeyFromRandomData
    && (v8 = _PCSSignKey(KeyFromRandomData, *(_QWORD *)(KeyFromRandomData + 40), 0, 1, 0, v7, 0),
        v9 = *(_QWORD *)(Empty + 16),
        (*(_QWORD *)(v9 + 16) = v8) != 0))
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(Empty + 72), *(const void **)(v9 + 24), (const void *)Empty);
    CFRelease(ExternalRepresentation);
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("Bladerunner"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("Hyperion"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("Liverpool"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("Escrow"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("FDE"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("PianoMover"));
    addNameService(Empty, v1, (const __CFNumber *)CFSTR("Sharing"));
  }
  else
  {
    CFRelease((CFTypeRef)Empty);
    if (ExternalRepresentation)
      CFRelease(ExternalRepresentation);
    return 0;
  }
  return Empty;
}

void addNameService(uint64_t a1, const void *a2, const __CFNumber *key)
{
  int IndexByName;
  uint64_t NumberByIndex;
  const void *v8;
  _QWORD *v9;

  IndexByName = PCSServiceItemGetIndexByName(key);
  if (!IndexByName)
    addNameService_cold_1();
  NumberByIndex = PCSServiceItemGetNumberByIndex(IndexByName);
  if (!NumberByIndex)
    addNameService_cold_2();
  v8 = (const void *)NumberByIndex;
  v9 = (_QWORD *)__PCSIdentityCreateWithNameEmpty(a1, a2, key);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), *(const void **)(v9[2] + 24), v9);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), v8, v9);
  CFRelease(v9);
}

uint64_t *__PCSPublicIdentityCreateWithName(const __CFString *a1)
{
  uint64_t *Instance;
  CFDataRef ExternalRepresentation;
  uint64_t KeyFromRandomData;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  __CFDictionary *Mutable;
  uint64_t v8;

  PCSPublicIdentityGetTypeID();
  Instance = (uint64_t *)_CFRuntimeCreateInstance();
  PCSKeyGetTypeID();
  Instance[3] = _CFRuntimeCreateInstance();
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, a1, 0x8000100u, 0);
  KeyFromRandomData = PCSKeyCreateKeyFromRandomData(ExternalRepresentation, "love");
  Instance[3] = KeyFromRandomData;
  if (!KeyFromRandomData)
  {
    if (ExternalRepresentation)
      CFRelease(ExternalRepresentation);
    ExternalRepresentation = (CFDataRef)Instance;
    Instance = 0;
    goto LABEL_3;
  }
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Instance[4] = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Mutable = CFDictionaryCreateMutable(0, 0, v5, v6);
  Instance[5] = (uint64_t)Mutable;
  CFDictionarySetValue(Mutable, *(const void **)(Instance[3] + 24), Instance);
  *(_QWORD *)(Instance[3] + 16) = _PCSSignKey(Instance[3], *(_QWORD *)(Instance[3] + 40), 0, 1, 0, v8, 0);
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("Bladerunner"));
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("Hyperion"));
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("Liverpool"));
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("Escrow"));
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("FDE"));
  addPublicNameService((uint64_t)Instance, (uint64_t)a1, (const __CFNumber *)CFSTR("PianoMover"));
  *(_BYTE *)(Instance[3] + 32) &= ~1u;
  if (ExternalRepresentation)
LABEL_3:
    CFRelease(ExternalRepresentation);
  return Instance;
}

void addPublicNameService(uint64_t a1, uint64_t a2, const __CFNumber *key)
{
  int IndexByName;
  int v7;
  uint64_t NumberByIndex;
  const void *v9;
  const __CFString *v10;
  _QWORD *Instance;
  CFDataRef ExternalRepresentation;
  uint64_t KeyFromRandomData;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;

  IndexByName = PCSServiceItemGetIndexByName(key);
  if (!IndexByName)
    addPublicNameService_cold_1();
  v7 = IndexByName;
  NumberByIndex = PCSServiceItemGetNumberByIndex(IndexByName);
  if (!NumberByIndex)
    addPublicNameService_cold_2();
  v9 = (const void *)NumberByIndex;
  v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@-%@"), a2, key);
  PCSPublicIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, v10, 0x8000100u, 0);
  KeyFromRandomData = PCSKeyCreateKeyFromRandomData(ExternalRepresentation, "love");
  Instance[3] = KeyFromRandomData;
  *(_BYTE *)(KeyFromRandomData + 32) &= ~1u;
  CFRelease(ExternalRepresentation);
  CFRelease(v10);
  v15 = _PCSSignKey(*(_QWORD *)(a1 + 24), *(_QWORD *)(Instance[3] + 40), 0, v7, 0, v14, 0);
  v16 = Instance[3];
  *(_QWORD *)(v16 + 16) = v15;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(v16 + 24), Instance);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v9, Instance);
  CFRelease(Instance);
}

uint64_t PCSGetPublicIdentitites()
{
  if (PCSGetPublicIdentitites_onceToken != -1)
    dispatch_once(&PCSGetPublicIdentitites_onceToken, &__block_literal_global_2);
  return PCSGetPublicIdentitites_dict;
}

CFTypeRef PCSIdentityCollectionSetup(const void *a1, const void **a2)
{
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeRef IdentityFromSet;
  const void *v10;
  int v12;
  CFTypeRef v13;
  __int16 v14;
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSIdentityCollectionSetup", (uint8_t *)&v12, 2u);
  }
  if (a1
    && (Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kPCSSetupRecoverMode)) != 0
    && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID())
    && CFBooleanGetValue(v5))
  {
    v7 = PCSIdentityRecoverFDE(a1, a2);
  }
  else
  {
    v7 = PCSIdentitySetup(a1, a2);
  }
  v8 = v7;
  if (v7)
  {
    if ((PCSCurrentPersonaMatchesDSIDFromSet((uint64_t)v7) & 1) == 0)
    {
      _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
      IdentityFromSet = 0;
LABEL_19:
      CFRelease(v8);
      return IdentityFromSet;
    }
    IdentityFromSet = CreateIdentityFromSet((uint64_t)v8, a2);
  }
  else
  {
    IdentityFromSet = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v10 = *a2;
    else
      v10 = 0;
    v12 = 138412546;
    v13 = IdentityFromSet;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSIdentityCollectionSetup: return %@ error: %@", (uint8_t *)&v12, 0x16u);
  }
  if (v8)
    goto LABEL_19;
  return IdentityFromSet;
}

CFTypeRef CreateIdentityFromSet(uint64_t a1, const void **a2)
{
  _QWORD *v4;
  _QWORD *v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  const __CFDictionary *v8;
  CFTypeRef v9;
  _QWORD v11[6];

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
    return 0;
  }
  v4 = _PCSIdentitySetCopyCurrentIdentityInternal(a1, kPCSServiceMaster, a2);
  if (!v4)
    return 0;
  v5 = v4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5[9] = Mutable;
  if (Mutable
    && (v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), (v5[8] = v7) != 0)
    && (v8 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(a1, 0)) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __CreateIdentityFromSet_block_invoke;
    v11[3] = &__block_descriptor_48_e15_v24__0r_v8r_v16l;
    v11[4] = a1;
    v11[5] = v5;
    CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)apply_block_2_0, v11);
    v9 = CFRetain(v5);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

CFTypeRef PCSIdentityCollectionCopyCurrent(const __CFDictionary *a1, const void **a2)
{
  __CFDictionary *v4;
  __CFDictionary *MutableCopy;
  const void **v6;
  const void **v7;
  CFTypeRef IdentityFromSet;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const void **Classic;
  CFTypeRef v15;
  int v17;
  CFTypeRef v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSIdentityCollectionCopyCurrent", (uint8_t *)&v17, 2u);
  }
  if (a1)
  {
    if (CFDictionaryGetValue(a1, kPCSSetupDSID[0]))
    {
      v4 = 0;
      goto LABEL_9;
    }
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  v4 = MutableCopy;
  CFDictionarySetValue(MutableCopy, kPCSSetupDSID[0], kPCSSetupDSIDAny[0]);
  a1 = v4;
LABEL_9:
  v6 = (const void **)PCSIdentitySetCreate(a1, 0, a2);
  if (!v6)
    goto LABEL_22;
  v7 = v6;
  if ((PCSCurrentPersonaMatchesDSIDFromSet((uint64_t)v6) & 1) != 0)
  {
    IdentityFromSet = CreateIdentityFromSet((uint64_t)v7, a2);
    if (IdentityFromSet)
      goto LABEL_14;
    CFRelease(v7);
    Classic = PCSIdentitySetCreateClassic(a1, 0, a2, v9, v10, v11, v12, v13);
    if (Classic)
    {
      v7 = Classic;
      IdentityFromSet = CreateIdentityFromSet((uint64_t)Classic, a2);
LABEL_14:
      v15 = IdentityFromSet;
      CFRelease(v7);
      if (!v4)
        goto LABEL_16;
      goto LABEL_15;
    }
LABEL_22:
    v15 = 0;
    if (!v4)
    {
LABEL_16:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSIdentityCollectionCopyCurrent: return %@", (uint8_t *)&v17, 0xCu);
      }
      return v15;
    }
LABEL_15:
    CFRelease(v4);
    goto LABEL_16;
  }
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  CFRelease(v7);
  if (v4)
    CFRelease(v4);
  return 0;
}

uint64_t PCSIdentityCollectionDestroy(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  const void *v7;
  void *Value;
  void *v9;
  CFTypeID v10;
  CFTypeID v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFDictionary *v15;
  NSObject *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v32;
  uint64_t v33;
  __int16 v34;
  __CFDictionary *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = (const void *)PCSCreateLogContext(CFSTR("Destroy"), 0);
  if (!a2)
    goto LABEL_11;
  Value = (void *)CFDictionaryGetValue(a2, kPCSSetupDSID[0]);
  v9 = Value;
  if (!Value)
    goto LABEL_12;
  if (!CFEqual(Value, kPCSSetupDSIDAny[0]) && (v10 = CFGetTypeID(v9), v10 == CFStringGetTypeID()))
  {
    v11 = CFGetTypeID(v9);
    if (v11 == CFStringGetTypeID()
      && (!kPCSSetupDSIDAny[0] || !CFEqual(v9, kPCSSetupDSIDAny[0]))
      && !PCSCurrentPersonaMatchesDSID(v9))
    {
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = kPCSErrorDomain;
        v36 = *MEMORY[0x1E0CB2D50];
        v37[0] = CFSTR("Current persona does not match chosen dsid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 152, v14);
        *(_QWORD *)a4 = objc_claimAutoreleasedReturnValue();

        return 0;
      }
      return a4;
    }
  }
  else
  {
LABEL_11:
    v9 = 0;
  }
LABEL_12:
  v15 = _PCSCopyPIIClearedOptions(a2);
  PCSLogGetOSLog((uint64_t)v7);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138543618;
    v33 = a1;
    v34 = 2114;
    v35 = v15;
    _os_log_impl(&dword_1A9508000, v16, OS_LOG_TYPE_DEFAULT, "PCSIdentityCollectionDestroy: %{public}@ options: %{public}@", (uint8_t *)&v32, 0x16u);
  }

  if (__PCSDeleteFromKeychain((CFErrorRef *)a4, v17, v18, v19, v20, v21, v22, v23)
    && __PCSDeleteFromKeychainICDP(v9, (CFErrorRef *)a4, v24, v25, v26, v27, v28, v29)
    && __PCSDeleteKeyfile(v9, (const void **)a4))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kPCSNotificationRemovedCredentials, 0, 0, 0);
    a4 = 1;
    if (!v7)
      goto LABEL_19;
    goto LABEL_18;
  }
  a4 = 0;
  if (v7)
LABEL_18:
    CFRelease(v7);
LABEL_19:
  if (v15)
    CFRelease(v15);
  return a4;
}

BOOL PCSCurrentPersonaMatchesDSID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (PCSSupportsPersonaMultiuser())
  {
    if (v1)
    {
      v2 = (void *)MEMORY[0x1AF415520]();
      +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSCurrentPersonaMatchesDSID: account is nil", buf, 2u);
        }
        v13 = 1;
        goto LABEL_33;
      }
      +[PCSAccountsModel defaultAccountsModel](PCSAccountsModel, "defaultAccountsModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "store");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v5, "aa_appleAccounts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v7)
      {
        v24 = v2;
        v8 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v10, "aa_personID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v1, "isEqualToString:", v11);

            if (v12)
            {
              v7 = v10;
              goto LABEL_19;
            }
          }
          v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          if (v7)
            continue;
          break;
        }
LABEL_19:
        v2 = v24;
      }

      objc_msgSend(v3, "aa_personID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v1);

      if ((v15 & 1) != 0)
      {
        v13 = 1;
LABEL_32:

LABEL_33:
        objc_autoreleasePoolPop(v2);
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "personaIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "generateAndRestorePersonaContextWithPersonaUniqueString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v18 == 0;
      v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138412290;
          v30 = v18;
          v20 = MEMORY[0x1E0C81028];
          v21 = "generateAndRestorePersonaContextWithPersonaUniqueString failed with: %@";
          v22 = 12;
LABEL_30:
          _os_log_impl(&dword_1A9508000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        }
      }
      else if (v19)
      {
        *(_WORD *)buf = 0;
        v20 = MEMORY[0x1E0C81028];
        v21 = "generateAndRestorePersonaContextWithPersonaUniqueString succeeded!";
        v22 = 2;
        goto LABEL_30;
      }

      goto LABEL_32;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSCurrentPersonaMatchesDSID: dsid is nil", buf, 2u);
    }
  }
  v13 = 1;
LABEL_34:

  return v13;
}

__CFData *PCSFDECopyUnwrappedDataWithSet(uint64_t a1, const __CFData *a2, const void **a3)
{
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  uint64_t *v8;
  uint64_t *v9;
  __CFData *v10;
  _QWORD context[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    v6 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(a1, 0);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    if (!v6)
      goto LABEL_8;
    v7 = v6;
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSFDECopyUnwrappedDataWithSet_block_invoke;
    context[3] = &unk_1E553DE90;
    context[4] = &v13;
    CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)apply_block_2_0, context);
    CFRelease(v7);
    v8 = v14;
    v9 = (uint64_t *)v14[3];
    if (v9)
    {
      if (v9[2])
      {
        v10 = _PCSKeyCopyUnwrappedData(v9[2], a2, a3);
        v8 = v14;
        v9 = (uint64_t *)v14[3];
        if (!v9)
          goto LABEL_11;
      }
      else
      {
        v10 = 0;
      }
      v8[3] = 0;
      CFRelease(v9);
    }
    else
    {
LABEL_8:
      _PCSError(a3, 27, CFSTR("Failed to copy FDE identity"));
      v10 = 0;
    }
LABEL_11:
    _Block_object_dispose(&v13, 8);
    return v10;
  }
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

void sub_1A9518488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFData *PCSCopyUnwrappedDataForFDEWithIdentity(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v6;
  _DWORD *v7;
  const __CFDictionary *ServiceWithID;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v7 = *(_DWORD **)(v6 + 16);
    if (v7)
    {
      if (*v7 == 6)
        return _PCSKeyCopyUnwrappedData(v6, a2, a3);
    }
  }
  ServiceWithID = _PCSIdentityGetServiceWithID(a1, 6u, a3);
  if (ServiceWithID)
  {
    v6 = *((_QWORD *)ServiceWithID + 2);
    if (v6)
      return _PCSKeyCopyUnwrappedData(v6, a2, a3);
  }
  else
  {
    _PCSError(a3, 27, CFSTR("Failed to copy FDE identity"));
  }
  return 0;
}

__CFData *PCSCopyWrappedDataWithFDEWithIdentity(const __CFDictionary *ServiceWithID, const __CFData *a2, const void **a3)
{
  uint64_t v5;
  _DWORD *v6;
  _QWORD *v7;
  const void *v8;
  uint64_t v9;
  __CFData *v10;

  v5 = *((_QWORD *)ServiceWithID + 2);
  if (!v5 || (v6 = *(_DWORD **)(v5 + 16)) == 0 || *v6 != 6)
  {
    ServiceWithID = _PCSIdentityGetServiceWithID((uint64_t)ServiceWithID, 6u, a3);
    if (!ServiceWithID)
    {
      _PCSError(a3, 27, CFSTR("Failed to copy FDE identity"));
      return 0;
    }
  }
  v7 = PCSIdentityCopyPublicIdentity((uint64_t)ServiceWithID);
  if (!v7)
  {
    _PCSError(a3, 5, CFSTR("Failed to copy public FDE identity"));
    return 0;
  }
  v8 = v7;
  v9 = v7[3];
  if (v9)
    v10 = _PCSKeyCopyWrappedKey(v9, a2, a3);
  else
    v10 = 0;
  CFRelease(v8);
  return v10;
}

uint64_t PCSIdentityCreateSignature(uint64_t a1, int a2, const __CFData *a3, const void **a4)
{
  _BOOL4 v8;
  uint64_t v9;
  const __CFData *v10;
  const __CFData *v11;
  uint64_t v12;
  unsigned int v13;
  CFIndex Length;
  const UInt8 *BytePtr;
  CFIndex v16;
  __CFData *Mutable;
  __CFData *v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  CFDataRef v23;
  _OWORD v24[2];
  uint64_t v25;

  v8 = (unsigned __int16)a2 == 0;
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  v9 = *(_QWORD *)(a1 + 16);
  if ((a2 & 0x10000) != 0)
  {
    if (!v9)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v10 = _PCSKeyCopyExportedPublicKey(v9);
  }
  else
  {
    v10 = (const __CFData *)CFRetain(*(CFTypeRef *)(v9 + 24));
  }
  v11 = v10;
LABEL_6:
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12 || (*(_BYTE *)(v12 + 32) & 1) == 0)
  {
    _PCSError(a4, 16, CFSTR("no key to sign with"));
    goto LABEL_14;
  }
  v13 = v8 | a2;
  Length = CFDataGetLength(a3);
  BytePtr = CFDataGetBytePtr(a3);
  if ((signData(v12, v11, v13, Length, (uint64_t)BytePtr, (uint64_t)v24) & 1) == 0)
  {
    _PCSError(a4, 16, CFSTR("Signing of service key failed"));
    goto LABEL_14;
  }
  v16 = length_PCSSignature();
  Mutable = CFDataCreateMutable(0, v16);
  if (!Mutable)
  {
    v20 = 12;
    goto LABEL_13;
  }
  v18 = Mutable;
  CFDataSetLength(Mutable, v16);
  CFDataGetMutableBytePtr(v18);
  v19 = encode_PCSSignature();
  if ((_DWORD)v19)
  {
    v20 = v19;
    CFRelease(v18);
LABEL_13:
    _PCSError(a4, 16, CFSTR("Failed encoding signature: %d"), v20);
LABEL_14:
    v18 = 0;
    goto LABEL_16;
  }
  if (v16)
  {
    v22 = asn1_abort();
    return PCSValidateSignature(v22, v23);
  }
LABEL_16:
  if (v11)
    CFRelease(v11);
  free_PCSSignature();
  return (uint64_t)v18;
}

uint64_t PCSValidateSignature(uint64_t *a1, CFDataRef theData, const __CFData *a3, const void **a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;

  v12 = 0;
  memset(v11, 0, sizeof(v11));
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v8 = decode_PCSSignature();
  if ((_DWORD)v8)
  {
    _PCSError(a4, 16, CFSTR("Failed to decode signature: %d"), v8);
LABEL_7:
    v9 = 0;
    goto LABEL_4;
  }
  if (CFDataGetLength(theData))
  {
    _PCSError(a4, 16, CFSTR("Did not parse all signature"));
    goto LABEL_7;
  }
  v9 = _PCSValidateSignature(a1, v11, a3, a4);
LABEL_4:
  free_PCSSignature();
  return v9;
}

uint64_t _PCSValidateSignature(uint64_t *a1, _QWORD *a2, const __CFData *a3, const void **a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *PublicWithData;
  uint64_t v11;
  const __CFData *v12;
  const __CFData *v13;
  CFTypeID v14;
  uint64_t v15;
  const void *v16;
  CFTypeID v17;
  uint64_t v18;
  CFTypeID v19;
  const __CFData *v20;
  const __CFData *v21;
  const void *v22;
  const UInt8 *BytePtr;
  unint64_t v24;
  CFStringRef v25;
  const UInt8 *v26;
  CFIndex v27;
  CFStringRef v28;
  void *v29;
  void *v30;
  CFIndex Length;
  CFTypeID v33;

  v8 = _PCSSignAlgToDI(*((_DWORD *)a2 + 4), a4);
  if (!v8)
    return 0;
  v9 = v8;
  if (a1)
  {
    PublicWithData = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)a2 + 18) & 1) == 0)
  {
    _PCSError(a4, 27, CFSTR("No signer and signature doesn't use public key"));
    return 0;
  }
  v12 = CFDataCreate(0, (const UInt8 *)a2[1], *a2);
  if (!v12)
  {
    _PCSErrorOOM(a4);
    return 0;
  }
  v13 = v12;
  PublicWithData = (uint64_t *)PCSKeyCreatePublicWithData(v12, a4);
  CFRelease(v13);
  a1 = PublicWithData;
  if (!PublicWithData)
    return 0;
LABEL_9:
  v14 = CFGetTypeID(a1);
  if (v14 == PCSKeyGetTypeID())
  {
    if ((a1[4] & 4) == 0)
    {
      v15 = a1[5];
      if ((*((_BYTE *)a2 + 18) & 1) == 0)
      {
        v16 = (const void *)a1[3];
LABEL_21:
        v20 = (const __CFData *)CFRetain(v16);
        goto LABEL_24;
      }
      v18 = (uint64_t)a1;
      goto LABEL_23;
    }
    goto LABEL_45;
  }
  v17 = CFGetTypeID(a1);
  if (v17 == PCSIdentityGetTypeID())
  {
    v18 = a1[2];
    v15 = *(_QWORD *)(v18 + 40);
    if ((*((_BYTE *)a2 + 18) & 1) != 0)
    {
LABEL_23:
      v20 = _PCSKeyCopyExportedPublicKey(v18);
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  v19 = CFGetTypeID(a1);
  if (v19 != PCSPublicIdentityGetTypeID())
  {
    v33 = CFGetTypeID(a1);
    _PCSError(a4, 30, CFSTR("Unsupported signer: %@ (ID: %lu)"), a1, v33);
    goto LABEL_41;
  }
  v18 = a1[3];
  if (!v18 || (*(_BYTE *)(v18 + 32) & 4) != 0)
  {
LABEL_45:
    _PCSError(a4, 30, CFSTR("Unsupported signer: %@)"), a1);
LABEL_41:
    v11 = 0;
    if (!PublicWithData)
      return v11;
    goto LABEL_38;
  }
  v15 = *(_QWORD *)(v18 + 40);
  if ((*((_BYTE *)a2 + 18) & 1) == 0)
  {
LABEL_20:
    v16 = *(const void **)(v18 + 24);
    goto LABEL_21;
  }
  v20 = PCSKeyCopyExportedPublicKey(v18);
LABEL_24:
  v21 = v20;
  if (CFDataGetLength(v20) != *a2)
  {
    Length = CFDataGetLength(v21);
    _PCSError(a4, 155, CFSTR("Unsupported length of signerID %d vs %d"), Length, *a2);
    goto LABEL_30;
  }
  v22 = (const void *)a2[1];
  BytePtr = CFDataGetBytePtr(v21);
  v24 = *a2;
  if (memcmp(v22, BytePtr, *a2))
  {
    v25 = _PCSCreateBase64(a2[1], v24, 0);
    v26 = CFDataGetBytePtr(v21);
    v27 = CFDataGetLength(v21);
    v28 = _PCSCreateBase64((uint64_t)v26, v27, 0);
    _PCSError(a4, 154, CFSTR("signerID of signature %@ doesn't match signer: %@"), v25, v28);
    if (v28)
      CFRelease(v28);
    if (v25)
      CFRelease(v25);
LABEL_30:
    v11 = 0;
    if (!v21)
      goto LABEL_37;
LABEL_36:
    CFRelease(v21);
    goto LABEL_37;
  }
  v29 = malloc_type_calloc(1uLL, *(_QWORD *)(v9 + 8) + *(_QWORD *)(v9 + 16) + 12, 0xD86B7772uLL);
  if (!v29)
  {
    _PCSErrorOOM(a4);
    goto LABEL_30;
  }
  v30 = v29;
  ccdigest_init();
  CFDataGetLength(a3);
  CFDataGetBytePtr(a3);
  ccdigest_update();
  if (*((_DWORD *)a2 + 4) >= 0x10000u)
    ccdigest_update();
  v11 = ccec_verify_di(v15, v9, (uint64_t)v30, a2[3], a2[4], a4);
  free(v30);
  if (v21)
    goto LABEL_36;
LABEL_37:
  if (PublicWithData)
LABEL_38:
    CFRelease(PublicWithData);
  return v11;
}

uint64_t *PCSValidateSignatureGetSigner(const __CFDictionary *a1, CFDataRef theData, const __CFData *a3, const void **a4)
{
  uint64_t v8;
  CFDataRef v9;
  CFDataRef v10;
  uint64_t *Value;
  uint64_t *v12;
  uint64_t *v13;
  _OWORD v15[2];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v8 = decode_PCSSignature();
  if ((_DWORD)v8)
  {
    _PCSError(a4, 16, CFSTR("Failed to decode signature: %d"), v8);
LABEL_14:
    free_PCSSignature();
    return 0;
  }
  if (CFDataGetLength(theData))
  {
    _PCSError(a4, 16, CFSTR("Did not parse all signature"));
    goto LABEL_14;
  }
  v9 = CFDataCreate(0, *((const UInt8 **)&v15[0] + 1), *(CFIndex *)&v15[0]);
  if (!v9)
  {
    _PCSErrorOOM(a4);
    goto LABEL_14;
  }
  v10 = v9;
  Value = (uint64_t *)CFDictionaryGetValue(a1, v9);
  if (Value)
  {
    v12 = Value;
    if (_PCSValidateSignature(Value, v15, a3, a4))
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    _PCSError(a4, 28, CFSTR("Can't find signature for signer: %@"), v10);
    v13 = 0;
  }
  free_PCSSignature();
  CFRelease(v10);
  return v13;
}

CFTypeRef PCSValidateSignatureWithSet(uint64_t a1, CFDataRef theData, const __CFData *a3, const void **a4)
{
  uint64_t v8;
  CFDataRef v9;
  CFDataRef v10;
  void *v11;
  CFTypeRef v12;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v8 = decode_PCSSignature();
  if ((_DWORD)v8)
  {
    _PCSError(a4, 16, CFSTR("Failed to decode signature: %d"), v8);
    goto LABEL_12;
  }
  if (CFDataGetLength(theData))
  {
    _PCSError(a4, 16, CFSTR("Did not parse all signature"));
    goto LABEL_12;
  }
  v9 = CFDataCreate(0, 0, 0);
  if (!v9 || (v10 = v9, v11 = (void *)PCSIdentitySetCopyIdentityByKeyID(a1, (uint64_t)v9), CFRelease(v10), !v11))
  {
    _PCSErrorOOM(a4);
LABEL_12:
    free_PCSSignature();
    return 0;
  }
  if (PCSValidateSignature((uint64_t *)v11, theData, a3, a4))
    v12 = CFRetain(v11);
  else
    v12 = 0;
  free_PCSSignature();
  CFRelease(v11);
  return v12;
}

CFDictionaryRef PCSIdentitySetCopyPublishableIdentities(uint64_t a1, CFDictionaryRef Copy, const void **a3)
{
  const void *v6;
  const void *v7;
  CFTypeID v8;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v10;
  CFMutableArrayRef v11;
  CFMutableArrayRef v12;
  _QWORD v14[6];
  CFRange v15;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
    return 0;
  }
  if (!Copy)
    return Copy;
  v6 = (const void *)PCSIdentitySetCopyOrderedIdentities(a1, (uint64_t)Copy);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CFGetTypeID(v6);
  if (v8 != CFArrayGetTypeID()
    || !CFArrayGetCount((CFArrayRef)v7)
    || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) == 0)
  {
    CFRelease(v7);
    return 0;
  }
  v10 = Mutable;
  v11 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v12 = v11;
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __PCSIdentitySetCopyPublishableIdentities_block_invoke;
    v14[3] = &__block_descriptor_48_e10_v16__0r_v8l;
    v14[4] = Copy;
    v14[5] = v11;
    v15.length = CFArrayGetCount((CFArrayRef)v7);
    v15.location = 0;
    CFArrayApplyFunction((CFArrayRef)v7, v15, (CFArrayApplierFunction)apply_block_1, v14);
    CFDictionarySetValue(v10, kPCSSecureBackupCFKeyRegistryPublicIdentities[0], v12);
    Copy = CFDictionaryCreateCopy(0, v10);
  }
  else
  {
    Copy = 0;
  }
  CFRelease(v7);
  CFRelease(v10);
  if (v12)
    CFRelease(v12);
  return Copy;
}

__CFData *_CopyECPGPWrappedData(uint64_t a1, CFDataRef theData, const void **a3)
{
  char v5;
  CFIndex v6;
  __CFData *Mutable;
  uint64_t v8;
  const char *v10;

  if (!theData)
  {
    _PCSError(a3, 12, CFSTR("input data to key wrapping missing"));
    return 0;
  }
  v5 = *(_BYTE *)(a1 + 32);
  CFDataGetLength(theData);
  v6 = ccec_rfc6637_wrap_key_size();
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v6);
  if ((v5 & 4) == 0)
  {
    if (Mutable)
    {
      CFDataGetMutableBytePtr(Mutable);
      CFDataGetLength(theData);
      CFDataGetBytePtr(theData);
      v10 = (const char *)ccDRBGGetRngState();
      v8 = ccec_rfc6637_wrap_key();
      goto LABEL_7;
    }
LABEL_10:
    _PCSErrorOOM(a3);
    return Mutable;
  }
  if (!Mutable)
    goto LABEL_10;
  CFDataGetMutableBytePtr(Mutable);
  CFDataGetLength(theData);
  CFDataGetBytePtr(theData);
  ccDRBGGetRngState();
  v10 = "fingerprint";
  v8 = ccec_rfc6637_wrap_key_diversified();
LABEL_7:
  if ((_DWORD)v8)
  {
    _PCSError(a3, 12, CFSTR("wrap failed with %d"), v8, v10);
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

__CFData *_CopyECPGPUnwrappedData(uint64_t a1, CFDataRef theData, const void **a3)
{
  CFIndex v6;
  CFIndex v7;
  __CFData *Mutable;
  uint64_t v9;
  const UInt8 *BytePtr;
  CFIndex length;

  v6 = CFDataGetLength(theData);
  length = v6;
  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    return 0;
  v7 = v6;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v7);
  if (Mutable)
  {
    CFDataGetMutableBytePtr(Mutable);
    CFDataGetLength(theData);
    BytePtr = CFDataGetBytePtr(theData);
    v9 = ccec_rfc6637_unwrap_key();
    if ((_DWORD)v9)
      _PCSError(a3, 13, CFSTR("unwrap failed with %d"), v9, BytePtr, length);
    CFRelease(Mutable);
    return 0;
  }
  _PCSErrorOOM(a3);
  return Mutable;
}

void *CopyPrivKeyFromOctetString(uint64_t a1, int a2, BOOL *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _QWORD *cp;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  *a3 = 0;
  if (a2 || !ccec_compact_import_priv_size())
  {
    if (ccec_der_import_priv_keytype())
    {
      *a3 = a2 == 1;
      ccec_cp_192();
      MEMORY[0x1AF415028]();
      MEMORY[0x1AF415034]();
      MEMORY[0x1AF415040]();
      ccec_cp_521();
      v5 = (_QWORD *)ccec_curve_for_length_lookup();
      if (!v5)
        return 0;
      v6 = v5;
      v7 = malloc_type_malloc((32 * *v5) | 0x10, 0xCD1E3E26uLL);
      v8 = v7;
      if (!v7)
        return v8;
      *v7 = v6;
      if (!ccn_read_uint())
      {
        v9 = *a3;
        v10 = (uint64_t)v6;
LABEL_19:
        if (generate_publickey(v10, v9))
          return v8;
      }
    }
    else
    {
      ccec_cp_192();
      MEMORY[0x1AF415028]();
      MEMORY[0x1AF415034]();
      MEMORY[0x1AF415040]();
      ccec_cp_521();
      v12 = (_QWORD *)ccec_curve_for_length_lookup();
      if (!v12)
        return 0;
      v13 = v12;
      v14 = malloc_type_malloc((32 * *v12) | 0x10, 0xA3D60663uLL);
      v8 = v14;
      if (!v14)
        return v8;
      *v14 = v13;
      if (!ccec_der_import_priv())
      {
        if (a2 == 1)
        {
          *a3 = 1;
          ccec_compact_transform_key();
        }
        ccDRBGGetRngState();
        if ((ccec_pairwise_consistency_check() & 1) != 0)
          return v8;
        v9 = *a3;
        v10 = (uint64_t)v13;
        goto LABEL_19;
      }
    }
LABEL_21:
    free(v8);
    return 0;
  }
  if (!ccec_keysize_is_supported())
    return 0;
  cp = (_QWORD *)ccec_get_cp();
  v8 = malloc_type_malloc((32 * *cp) | 0x10, 0x76C8A2BEuLL);
  if (v8)
  {
    if (!ccec_compact_import_priv())
    {
      *a3 = 1;
      return v8;
    }
    goto LABEL_21;
  }
  return v8;
}

BOOL generate_publickey(uint64_t a1, int a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL8 v7;
  BOOL v8;

  v3 = (unint64_t)(cczp_bitlen() + 7) >> 3;
  v4 = MEMORY[0x1AF414F98](v3, 0, 0);
  v5 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v5);
  ccn_write_uint_padded();
  if (ccder_encode_eckey())
  {
    v6 = ccec_der_import_priv();
    v7 = v6 == 0;
    if (v6)
      v8 = 1;
    else
      v8 = a2 == 0;
    if (!v8)
    {
      ccec_compact_transform_key();
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }
  cc_clear();
  cc_clear();
  return v7;
}

uint64_t apply_block_2_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void InvalidPublicKey(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  void (**v10)(id, CFStringRef);
  CFStringRef v11;
  CFStringRef v12;
  uint8_t buf[4];
  CFStringRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a2, &a9);
  v12 = v11;
  if (v10 && v11)
    v10[2](v10, v11);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSKeyCheckForInvalidPublicKey: %@", buf, 0xCu);
  }
  if (v12)
    CFRelease(v12);

}

_QWORD *_PCSPublicIdentityCreateFromPKI(uint64_t a1)
{
  _QWORD *Instance;
  uint64_t v3;
  const CFDictionaryKeyCallBacks *v4;
  const CFDictionaryValueCallBacks *v5;

  PCSPublicIdentityGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v3 = PCSKeyCreateWithPKI(a1, 0);
    Instance[3] = v3;
    if (v3)
    {
      if (*(_DWORD *)(*(_QWORD *)(v3 + 16) + 4) == 1)
      {
        v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
        v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
        Instance[5] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        Instance[4] = CFDictionaryCreateMutable(0, 0, v4, v5);
      }
    }
    else
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

uint64_t ccec_digest_and_verify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  char *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)v13 - v10;
  ccdigest_init();
  ccdigest_update();
  return ccec_verify_di(a1, a2, (uint64_t)v11, a5, a6, 0);
}

uint64_t ccec_verify_di(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HIBYTE(v16) = 0;
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(uint64_t, uint64_t, char *))(v8 + 56))(v8, v9, (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FF8;
  v11 = ccec_verify();
  qword_1ECED5000 += PCSMeasureRelativeNanoTime() - v10;
  if ((_DWORD)v11)
    v12 = 1;
  else
    v12 = HIBYTE(v16) == 0;
  v13 = !v12;
  if (v12)
  {
    if (HIBYTE(v16))
      v15 = "";
    else
      v15 = "!";
    _PCSError(a6, 31, CFSTR("Verification failed, ret=%d, %svalid"), v11, v15);
  }
  return v13;
}

uint64_t apply_block_1(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_1A951B0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id *location,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v41 - 248), 8);
  objc_destroyWeak((id *)(v41 - 216));
  _Unwind_Resume(a1);
}

void sub_1A951B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFData *PCSCloudKitShareTokenCopyEncryptedData(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex v5;
  __CFData *Mutable;
  __CFData *v7;
  UInt8 *MutableBytePtr;

  v4 = ccaes_gcm_encrypt_mode();
  MEMORY[0x1E0C80A78](v4);
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  ccgcm_init();
  v5 = CFDataGetLength(a2) + 32;
  Mutable = CFDataCreateMutable(0, v5);
  v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, v5);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (!MutableBytePtr || SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, MutableBytePtr))
    {
      CFRelease(v7);
      v7 = 0;
    }
    else
    {
      ccgcm_set_iv();
      CFDataGetLength(a2);
      CFDataGetBytePtr(a2);
      ccgcm_update();
      CFDataGetLength(a2);
      ccgcm_finalize();
    }
  }
  ccgcm_context_size();
  cc_clear();
  return v7;
}

__CFData *PCSCloudKitShareTokenCopyDecryptedData(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex Length;
  CFIndex v6;
  __CFData *v7;
  __CFData *Mutable;

  v4 = ccaes_gcm_decrypt_mode();
  MEMORY[0x1E0C80A78](v4);
  Length = CFDataGetLength(a2);
  v6 = Length - 32;
  if (Length < 32)
    return 0;
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  ccgcm_init();
  CFDataGetBytePtr(a2);
  ccgcm_set_iv();
  Mutable = CFDataCreateMutable(0, v6);
  v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, v6);
    CFDataGetMutableBytePtr(v7);
    ccgcm_update();
    ccgcm_finalize();
    if (cc_cmp_safe())
    {
      CFRelease(v7);
      v7 = 0;
    }
  }
  ccgcm_context_size();
  cc_clear();
  return v7;
}

BOOL PCSDaemonKeyRollIsPending(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  const void *CurrentCreationTime;
  void *v19;
  uint8_t v21[16];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1AF415520]();
  if (PCSServiceItemCanRoll(a2))
  {
    if (commonUserDefaults_once != -1)
      dispatch_once(&commonUserDefaults_once, &__block_literal_global_3);
    v5 = (void *)commonUserDefaults_defaults;
    if (commonUserDefaults_defaults)
    {
      v6 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = kPCSErrorDomain;
      v22[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get ProtectedCloudKeyStorage defaults"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v21 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 134, v11);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (void *)commonUserDefaults_defaults;
    }
    v12 = v5;
    v13 = v6;
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", kPCSPendingRollEpoch);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "compare:", v14),
            v15,
            v16 != -1)
        && (objc_msgSend(v14, "timeIntervalSinceNow"), fabs(v17) <= 2419200.0)
        && (CurrentCreationTime = PCSIdentitySetGetCurrentCreationTime(a1, a2, 0)) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(uint64_t)CurrentCreationTime);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v14, "compare:", v19) != -1;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v13;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSDaemonKeyRollIsPending error: %@", v21, 0xCu);
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

void __commonUserDefaults_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v1 = objc_msgSend(v0, "initWithSuiteName:", kPCSSettingsSuiteName);
  v2 = (void *)commonUserDefaults_defaults;
  commonUserDefaults_defaults = v1;

}

BOOL PCSSupportsPersonaMultiuser()
{
  if (gPCSSupportsPersonaMultiuserStatus)
    return gPCSSupportsPersonaMultiuserStatus == 1;
  if (PCSSupportsPersonaMultiuser_onceToken != -1)
    dispatch_once(&PCSSupportsPersonaMultiuser_onceToken, &__block_literal_global_4);
  return PCSSupportsPersonaMultiuser_ffPCSSupportsPersonaMultiuserStatus != 0;
}

void PCSSetSupportsPersonaMultiuser(int a1)
{
  int v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
    v2 = 1;
  else
    v2 = 2;
  gPCSSupportsPersonaMultiuserStatus = v2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = "disabled";
    if (a1)
      v3 = "enabled";
    v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSSupportsMultiuser overriden to %s", (uint8_t *)&v4, 0xCu);
  }
}

void PCSClearSupportsPersonaMultiuserOverride()
{
  uint8_t v0[16];

  gPCSSupportsPersonaMultiuserStatus = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSSupportsMultiuser override removed", v0, 2u);
  }
}

BOOL __PCSStoreIniCloudKeychain(int a1, int a2, const void **a3)
{
  const void *v4;
  __CFDictionary *MutableForCFTypesWith;
  const __CFDictionary *v6;
  uint64_t v7;

  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, a2, (int)kPCSDefaultKeychainGroup[0], *MEMORY[0x1E0CD6B50], *MEMORY[0x1E0CD70D8], *MEMORY[0x1E0CD69C0], *MEMORY[0x1E0CD6B78], (int)CFSTR("PCS-MasterKey"), (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v6 = MutableForCFTypesWith;
  if (MutableForCFTypesWith)
  {
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], v4);
    v7 = PCSMeasureRelativeNanoTime();
    ++PCSMeasure;
    SecItemAdd(v6, 0);
    qword_1ECED4F90 += PCSMeasureRelativeNanoTime() - v7;
    CFRelease(v6);
  }
  else
  {
    _PCSErrorOOM(a3);
  }
  return v6 != 0;
}

BOOL __PCSUpdateIniCloudKeychain(uint64_t a1, int a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  const void *v10;
  __CFDictionary *MutableForCFTypesWith;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  const __CFDictionary *v19;
  __CFDictionary *v20;
  uint64_t v21;

  v10 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)kPCSDefaultKeychainGroup[0], a2, *MEMORY[0x1E0CD6B50], *MEMORY[0x1E0CD69C0], *MEMORY[0x1E0CD6B78], (int)CFSTR("PCS-MasterKey"), a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v19 = MutableForCFTypesWith;
  if (MutableForCFTypesWith)
  {
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], v10);
    v20 = CFDictionaryCreateMutableForCFTypesWith((int)MutableForCFTypesWith, v12, v13, v14, v15, v16, v17, v18, (void *)*MEMORY[0x1E0CD70D8], a1);
    v21 = PCSMeasureRelativeNanoTime();
    ++qword_1ECED4F98;
    SecItemUpdate(v19, v20);
    qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v21;
    CFRelease(v19);
    if (v20)
      CFRelease(v20);
  }
  else
  {
    _PCSErrorOOM(a3);
  }
  return v19 != 0;
}

CFTypeRef __PCSCopyFromiCloudKeychain(const void *a1, const void **a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  const void *v10;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v12;
  uint64_t v13;
  OSStatus v14;
  CFTypeID v15;
  CFTypeRef v16;
  CFTypeRef v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFTypeRef result;

  result = 0;
  v10 = (const void *)*MEMORY[0x1E0C9AE50];
  v26 = *MEMORY[0x1E0CD6F40];
  v24 = *MEMORY[0x1E0C9AE50];
  v25 = *MEMORY[0x1E0CD6F30];
  v22 = kPCSAccount[0];
  v23 = *MEMORY[0x1E0CD7018];
  v20 = kPCSiCloudServiceName;
  v21 = *MEMORY[0x1E0CD68F8];
  v19 = *MEMORY[0x1E0CD6B40];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)a1, (int)a2, a3, a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!MutableForCFTypesWith)
  {
    _PCSErrorOOM(a2);
    return 0;
  }
  v12 = MutableForCFTypesWith;
  if (a1)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], a1);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v12, (const void *)*MEMORY[0x1E0CD6B80], v10);
  v13 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v14 = SecItemCopyMatching(v12, &result);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v13;
  if (v14)
  {
    PCSSecError(v14, (CFErrorRef *)a2, CFSTR("SecItem failed to %@ %@"), CFSTR("fetch"), kPCSiCloudServiceName, v19, v20, v21, v22, v23, v24, v25, v26, 0);
  }
  else if (result)
  {
    v15 = CFGetTypeID(result);
    if (v15 == CFDataGetTypeID())
    {
      v16 = CFRetain(result);
      goto LABEL_10;
    }
  }
  v16 = 0;
LABEL_10:
  CFRelease(v12);
  v17 = result;
  if (result)
  {
    result = 0;
    CFRelease(v17);
  }
  return v16;
}

uint64_t __PCSStoreInKeychain(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  CFDictionaryRef v14;
  const __CFDictionary *v15;
  __CFString *v16;
  uint64_t v17;
  OSStatus v18;
  __CFDictionary *MutableCopy;
  __CFDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFDictionaryRef v29;
  const __CFDictionary *v30;
  uint64_t v31;
  OSStatus v32;
  uint64_t v33;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v50;
  CFErrorRef *v51;

  v9 = (const void *)*MEMORY[0x1E0CD6C98];
  v10 = *MEMORY[0x1E0CD6CA8];
  v11 = *MEMORY[0x1E0CD68F8];
  v12 = (const void *)*MEMORY[0x1E0CD68A0];
  v13 = (const void *)*MEMORY[0x1E0CD6898];
  v48 = *MEMORY[0x1E0CD70D8];
  v45 = kPCSDefaultKeychainGroup[0];
  v46 = *MEMORY[0x1E0CD69B0];
  v43 = *MEMORY[0x1E0C9AE50];
  v44 = *MEMORY[0x1E0CD6898];
  v41 = *MEMORY[0x1E0CD68B0];
  v42 = *MEMORY[0x1E0CD70A8];
  v38 = kPCSAccount[0];
  v40 = *MEMORY[0x1E0CD68A0];
  v36 = kPCSServiceName[0];
  v37 = *MEMORY[0x1E0CD68F8];
  v35 = *MEMORY[0x1E0CD6B58];
  v14 = CFDictionaryCreateForCFTypes(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, *MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CA8]);
  if (!v14)
  {
    _PCSErrorOOM(a3);
    return 0;
  }
  v15 = v14;
  v50 = v10;
  v51 = (CFErrorRef *)a3;
  v16 = kPCSServiceName[0];
  v17 = PCSMeasureRelativeNanoTime();
  ++PCSMeasure;
  v18 = SecItemAdd(v15, 0);
  qword_1ECED4F90 += PCSMeasureRelativeNanoTime() - v17;
  if (v18 != -25299)
  {
    PCSSecError(v18, v51, CFSTR("SecItem failed to %@ %@"), CFSTR("add"), v16, v35, v36, v37, v38, v40, v41, v42, v43, v44, v45, v46, a2, v48, a1,
      0,
      v50);
    goto LABEL_8;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v15);
  if (!MutableCopy)
  {
LABEL_13:
    _PCSErrorOOM((const void **)v51);
    goto LABEL_14;
  }
  v20 = MutableCopy;
  CFDictionaryRemoveValue(MutableCopy, v9);
  CFDictionaryRemoveValue(v20, v12);
  CFDictionaryRemoveValue(v20, v13);
  v39 = kPCSAccount[0];
  v29 = CFDictionaryCreateForCFTypes(v21, v22, v23, v24, v25, v26, v27, v28, (uint64_t)v9, v50);
  if (!v29)
  {
    CFRelease(v20);
    goto LABEL_13;
  }
  v30 = v29;
  v31 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4F98;
  v32 = SecItemUpdate(v30, v20);
  qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v31;
  CFRelease(v20);
  CFRelease(v30);
  if (v32)
  {
    PCSSecError(v32, v51, CFSTR("Failed to update: %@: item: %@ query: %@"), v16, v15, 0, v16, v11, v39, 0);
LABEL_14:
    v33 = 0;
    goto LABEL_9;
  }
LABEL_8:
  _PCSPostHaveCredentials();
  v33 = 1;
LABEL_9:
  CFRelease(v15);
  return v33;
}

CFDictionaryRef CFDictionaryCreateForCFTypes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unint64_t v10;
  uint64_t *v11;
  const void **v12;
  const void **v13;
  const void **v14;
  const void *v15;
  const void **v16;
  const void **v17;
  unint64_t v18;
  uint64_t *v19;
  const void *v20;
  CFDictionaryRef v21;
  uint64_t *v23;
  uint64_t *v24;

  v23 = &a10;
  v10 = 0;
  if (a9)
  {
    do
    {
      v10 += 2;
      v11 = v23;
      v23 += 2;
    }
    while (v11[1]);
  }
  v24 = &a9;
  v12 = (const void **)malloc_type_calloc(v10 >> 1, 8uLL, 0xC0040B8AA526DuLL);
  v13 = (const void **)malloc_type_calloc(v10 >> 1, 8uLL, 0xC0040B8AA526DuLL);
  v14 = v13;
  if (v10)
  {
    v15 = (const void *)*MEMORY[0x1E0C9B0D0];
    v16 = v12;
    v17 = v13;
    v18 = v10 >> 1;
    do
    {
      v19 = v24;
      *v16++ = (const void *)*v24;
      v24 += 2;
      v20 = (const void *)v19[1];
      if (!v20)
        v20 = v15;
      *v17++ = v20;
      --v18;
    }
    while (v18);
  }
  v21 = CFDictionaryCreate(0, v12, v13, v10 >> 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  free(v12);
  free(v14);
  return v21;
}

CFTypeRef __PCSCopyFromKeychain(uint64_t a1, const __CFString *a2, const __CFString *a3, const void **a4, int a5, int a6, int a7, int a8)
{
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v13;
  uint64_t v14;
  OSStatus v15;
  CFTypeID v16;
  const void *Value;
  const void *v18;
  CFTypeID v19;
  uint64_t v20;
  const __CFData *v21;
  const __CFData *v22;
  CFTypeID v23;
  const __CFString *v24;
  CFTypeID v25;
  CFTypeID v26;
  CFComparisonResult v27;
  void *key;
  const void *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFDictionary *v44;
  const __CFDictionary *v45;
  CFTypeRef v46;
  CFTypeRef v47;
  uint64_t v49;
  uint64_t v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CFTypeRef result;

  result = 0;
  v60 = *MEMORY[0x1E0CD6F40];
  v58 = *MEMORY[0x1E0C9AE50];
  v59 = *MEMORY[0x1E0CD6F30];
  v56 = *MEMORY[0x1E0C9AE50];
  v57 = *MEMORY[0x1E0CD7020];
  v54 = *MEMORY[0x1E0C9AE50];
  v55 = *MEMORY[0x1E0CD7010];
  v52 = kPCSAccount[0];
  v53 = *MEMORY[0x1E0CD7018];
  v51 = *MEMORY[0x1E0CD68F8];
  v49 = *MEMORY[0x1E0CD6B58];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(*MEMORY[0x1E0CD6F40], (int)a2, (int)a3, (int)a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CA8]);
  if (!MutableForCFTypesWith)
  {
    _PCSErrorOOM(a4);
    goto LABEL_26;
  }
  v13 = MutableForCFTypesWith;
  v14 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v15 = SecItemCopyMatching(v13, &result);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v14;
  if (!v15)
  {
    CFRelease(v13);
    if (!result)
      return 0;
    v16 = CFGetTypeID(result);
    if (v16 != CFDictionaryGetTypeID())
      goto LABEL_26;
    Value = CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0CD70D8]);
    if (!Value)
      goto LABEL_26;
    v18 = Value;
    v19 = CFGetTypeID(Value);
    if (v19 != CFDataGetTypeID())
      goto LABEL_26;
    v20 = *MEMORY[0x1E0CD69B0];
    v21 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0CD69B0]);
    if (v21)
    {
      v22 = v21;
      v23 = CFGetTypeID(v21);
      if (v23 == CFDataGetTypeID())
      {
        v24 = CFStringCreateFromExternalRepresentation(0, v22, 0x8000100u);
        if (!v24)
          goto LABEL_26;
LABEL_13:
        if (CFStringFind(v24, CFSTR("@"), 0).location == -1)
        {
          if (a3 && CFStringCompare(a3, v24, 0))
          {
            PCSSecError(0, (CFErrorRef *)a4, CFSTR("The item we where looking for %@ was not found, instead we found %@"), a3, v22);
LABEL_25:
            CFRelease(v24);
LABEL_26:
            v46 = 0;
            goto LABEL_31;
          }
        }
        else if (a2)
        {
          v26 = CFGetTypeID(a2);
          if (v26 == CFStringGetTypeID())
          {
            v27 = CFStringCompare(v24, a2, 0);
            v13 = 0;
            if (!a3 || v27)
              goto LABEL_28;
            key = (void *)*MEMORY[0x1E0CD70E0];
            v29 = CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0CD70E0]);
            if (v29)
            {
              v13 = CFDictionaryCreateMutableForCFTypesWith((int)v29, v30, v31, v32, v33, v34, v35, v36, key, (uint64_t)v29);
              v44 = CFDictionaryCreateForCFTypes((uint64_t)v13, v37, v38, v39, v40, v41, v42, v43, v20, (uint64_t)a3);
              if (!v44)
              {
                _PCSErrorOOM(a4);
                v46 = 0;
LABEL_29:
                CFRelease(v24);
                if (!v13)
                  goto LABEL_31;
                goto LABEL_30;
              }
              v45 = v44;
              SecItemUpdate(v13, v44);
              CFRelease(v45);
LABEL_28:
              v46 = CFRetain(v18);
              goto LABEL_29;
            }
            goto LABEL_25;
          }
        }
        v13 = 0;
        goto LABEL_28;
      }
      v25 = CFGetTypeID(v22);
      if (v25 == CFStringGetTypeID())
      {
        v24 = (const __CFString *)CFRetain(v22);
        if (v24)
          goto LABEL_13;
      }
    }
    v46 = CFRetain(v18);
    goto LABEL_31;
  }
  PCSSecError(v15, (CFErrorRef *)a4, CFSTR("SecItem failed to %@ %@"), CFSTR("fetch"), a1, v49, a1, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, 0);
  v46 = 0;
LABEL_30:
  CFRelease(v13);
LABEL_31:
  v47 = result;
  if (result)
  {
    result = 0;
    CFRelease(v47);
  }
  return v46;
}

uint64_t _PCSSecItemDeleteIfPresent(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;

  v2 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FA8;
  v3 = off_1ECED3FF8(a1);
  qword_1ECED4FB0 += PCSMeasureRelativeNanoTime() - v2;
  if (v3 == -25300)
    return 0;
  else
    return v3;
}

BOOL __PCSDeleteFromKeychain(CFErrorRef *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v10;
  int v11;
  _BOOL8 v12;

  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)a1, a2, a3, a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CA8]);
  if (MutableForCFTypesWith)
  {
    v10 = MutableForCFTypesWith;
    v11 = _PCSSecItemDeleteIfPresent((uint64_t)MutableForCFTypesWith);
    v12 = PCSSecError(v11, a1, CFSTR("SecItem failed to delete on private identity"));
    CFRelease(v10);
    return v12;
  }
  else
  {
    _PCSErrorOOM((const void **)a1);
    return 0;
  }
}

BOOL __PCSDeleteFromKeychainICDP(const void *a1, CFErrorRef *a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  unint64_t v9;
  BOOL v10;
  const void *v11;
  uint64_t v12;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v14;
  int v15;
  _BOOL4 v16;
  void *v18;
  void *key;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];

  v9 = 0;
  v10 = 0;
  v23[3] = *MEMORY[0x1E0C80C00];
  v23[0] = kPCSServiceName[0];
  v23[1] = kPCSiCloudServiceMarkerName[0];
  v23[2] = kPCSiCloudServiceName;
  v22 = (void *)*MEMORY[0x1E0CD6C98];
  v21 = *MEMORY[0x1E0CD6CB8];
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  key = (void *)*MEMORY[0x1E0CD6B50];
  v18 = (void *)*MEMORY[0x1E0CD6B80];
  do
  {
    v12 = v23[v9];
    MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)a1, (int)a2, a3, a4, a5, a6, a7, a8, v22, v21);
    if (!MutableForCFTypesWith)
      break;
    v14 = MutableForCFTypesWith;
    if (a1)
      CFDictionarySetValue(MutableForCFTypesWith, key, a1);
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(v14, v18, v11);
    v15 = _PCSSecItemDeleteIfPresent((uint64_t)v14);
    v16 = PCSSecError(v15, a2, CFSTR("SecItem failed to delete iCDP %@ domain"), v12);
    CFRelease(v14);
    if (!v16)
      break;
    v10 = v9++ > 1;
  }
  while (v9 != 3);
  return v10;
}

void sub_1A951DE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A951DFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUMUserManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_1E553DCC0;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A951E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A951E350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A951E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A951E808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A951EA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  AccountsLibrary();
  result = objc_getClass("ACAccountStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACAccountStoreClass_block_invoke_cold_1();
  getACAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccountsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccountsLibraryCore_frameworkLibrary)
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AccountsLibraryCore_frameworkLibrary;
  if (!AccountsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getUMUserManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PCSShareProtectionGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSShareProtectionGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSShareProtectionGetTypeID_sPCSShareProtectionGetTypeIDSingleton;
  if (PCSShareProtectionGetTypeID_sPCSShareProtectionGetTypeIDOnce != -1)
    dispatch_once(&PCSShareProtectionGetTypeID_sPCSShareProtectionGetTypeIDOnce, block);
  return PCSShareProtectionGetTypeID_sPCSShareProtectionGetTypeIDSingleton;
}

uint64_t PCSShareProtectionDestroy(uint64_t a1)
{
  __CFData *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  __CFData *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  uint64_t result;

  v2 = *(__CFData **)(a1 + 72);
  if (v2)
  {
    CFDataGetLength(*(CFDataRef *)(a1 + 72));
    CFDataGetMutableBytePtr(v2);
    cc_clear();
    v3 = *(const void **)(a1 + 72);
    if (v3)
    {
      *(_QWORD *)(a1 + 72) = 0;
      CFRelease(v3);
    }
  }
  v4 = *(const void **)(a1 + 80);
  if (v4)
  {
    *(_QWORD *)(a1 + 80) = 0;
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 112);
  if (v5)
  {
    *(_QWORD *)(a1 + 112) = 0;
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 88);
  if (v6)
  {
    *(_QWORD *)(a1 + 88) = 0;
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 96);
  if (v7)
  {
    *(_QWORD *)(a1 + 96) = 0;
    CFRelease(v7);
  }
  v8 = *(const void **)(a1 + 104);
  if (v8)
  {
    *(_QWORD *)(a1 + 104) = 0;
    CFRelease(v8);
  }
  v9 = *(__CFData **)(a1 + 64);
  if (v9)
  {
    CFDataGetLength(*(CFDataRef *)(a1 + 64));
    CFDataGetMutableBytePtr(v9);
    cc_clear();
    v10 = *(const void **)(a1 + 64);
    if (v10)
    {
      *(_QWORD *)(a1 + 64) = 0;
      CFRelease(v10);
    }
  }
  v11 = *(const void **)(a1 + 16);
  if (v11)
  {
    *(_QWORD *)(a1 + 16) = 0;
    CFRelease(v11);
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
  {
    *(_QWORD *)(a1 + 40) = 0;
    CFRelease(v12);
  }
  v13 = *(const void **)(a1 + 48);
  if (v13)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v13);
  }
  v14 = *(const void **)(a1 + 56);
  if (v14)
  {
    *(_QWORD *)(a1 + 56) = 0;
    CFRelease(v14);
  }
  v15 = *(const void **)(a1 + 176);
  if (v15)
  {
    *(_QWORD *)(a1 + 176) = 0;
    CFRelease(v15);
  }
  v16 = *(const void **)(a1 + 184);
  if (v16)
  {
    *(_QWORD *)(a1 + 184) = 0;
    CFRelease(v16);
  }
  v17 = *(const void **)(a1 + 144);
  if (v17)
  {
    *(_QWORD *)(a1 + 144) = 0;
    CFRelease(v17);
  }
  v18 = *(const void **)(a1 + 152);
  if (v18)
  {
    *(_QWORD *)(a1 + 152) = 0;
    CFRelease(v18);
  }
  v19 = *(const void **)(a1 + 160);
  if (v19)
  {
    *(_QWORD *)(a1 + 160) = 0;
    CFRelease(v19);
  }
  v20 = *(const void **)(a1 + 168);
  if (v20)
  {
    *(_QWORD *)(a1 + 168) = 0;
    CFRelease(v20);
  }
  v21 = *(const void **)(a1 + 24);
  if (v21)
  {
    *(_QWORD *)(a1 + 24) = 0;
    CFRelease(v21);
  }
  v22 = *(const void **)(a1 + 32);
  if (v22)
  {
    *(_QWORD *)(a1 + 32) = 0;
    CFRelease(v22);
  }
  v23 = *(const void **)(a1 + 192);
  if (v23)
  {
    *(_QWORD *)(a1 + 192) = 0;
    CFRelease(v23);
  }
  result = free_PCSAttributes();
  *(_BYTE *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  return result;
}

uint64_t PCSShareProtectionCompare(CFTypeRef *a1, CFTypeRef *a2)
{
  CFTypeID v4;
  CFTypeID v5;

  v4 = CFGetTypeID(a1);
  if (v4 == PCSShareProtectionGetTypeID() && (v5 = CFGetTypeID(a2), v5 == PCSShareProtectionGetTypeID()))
    return CFEqual(a1[9], a2[9]);
  else
    return 0;
}

CFStringRef PCSShareProtectionCopyDescription(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFData *v3;
  char *BytePtr;
  CFIndex Length;
  CFStringRef v6;
  _BOOL4 v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  CFStringRef v15;

  v2 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(*(_QWORD *)(a1 + 16), 0);
  v3 = *(const __CFData **)(a1 + 80);
  if (v3)
  {
    BytePtr = (char *)CFDataGetBytePtr(v3);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 80));
    v6 = _PCSCreateHexString(BytePtr, Length);
  }
  else
  {
    v6 = CFSTR("<no-masterkey>");
  }
  v7 = CFDictionaryGetCount(v2) != 0;
  v8 = _PCSYESNO(v7);
  v9 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40)) != 0;
  v10 = _PCSYESNO(v9);
  v11 = _PCSYESNO(*(unsigned __int8 *)(a1 + 208));
  v12 = _PCSYESNO(*(_DWORD *)(a1 + 204) == 3);
  v13 = _PCSYESNO(*(_DWORD *)(a1 + 204) == 0);
  v14 = _PCSYESNO(*(_BYTE *)(a1 + 209) == 0);
  v15 = CFStringCreateWithFormat(0, 0, CFSTR("<PCSShareProtection@%p: [ MasterKey ID: %@ PCSKey: %@ PCSPublic: %@ validated: %@ version2: %@ light: %@ readwrite: %@] >"), a1, v6, v8, v10, v11, v12, v13, v14);
  if (v6)
    CFRelease(v6);
  if (v2)
    CFRelease(v2);
  return v15;
}

uint64_t ShareEntryGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ShareEntryGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &ShareEntryGetTypeID_sShareEntryGetTypeIDSingleton;
  if (ShareEntryGetTypeID_sShareEntryGetTypeIDOnce != -1)
    dispatch_once(&ShareEntryGetTypeID_sShareEntryGetTypeIDOnce, block);
  return ShareEntryGetTypeID_sShareEntryGetTypeIDSingleton;
}

void ShareEntryDestroy(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = 0;
    CFRelease(v2);
  }
}

uint64_t ShareEntryCompare(uint64_t a1, uint64_t a2)
{
  CFTypeID v4;
  CFTypeID v5;
  uint64_t result;

  v4 = CFGetTypeID((CFTypeRef)a1);
  if (v4 != ShareEntryGetTypeID())
    return 0;
  v5 = CFGetTypeID((CFTypeRef)a2);
  if (v5 != ShareEntryGetTypeID())
    return 0;
  result = CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
  if ((_DWORD)result)
    return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
  return result;
}

CFStringRef ShareEntryCopyDescription(uint64_t a1)
{
  uint64_t PublicID;

  PublicID = PCSPublicIdentityGetPublicID(*(_QWORD *)(a1 + 16));
  return CFStringCreateWithFormat(0, 0, CFSTR("<ShareEntry: %p: identity %@ flags: 0x%08x>"), a1, PublicID, *(unsigned int *)(a1 + 24));
}

uint64_t _PCSRandomData(size_t count, void *bytes)
{
  uint64_t result;

  result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], count, bytes);
  if ((_DWORD)result)
    abort();
  return result;
}

BOOL _PCSCreateDerivedKey(const __CFData *a1, int a2, int a3, unint64_t a4, int a5, const void **a6)
{
  if (a4 >= 0x41)
  {
    _PCSError(a6, 17, CFSTR("Derivation to sizes larger than %d not supported (%d requested)"), 64, a4);
  }
  else
  {
    ccsha256_di();
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    ccnistkdf_ctr_hmac();
  }
  return a4 < 0x41;
}

CFTypeRef PCSShareProtectionCreate(const void **a1)
{
  return PCSFPCreate((void *)kPCSFPTypeClassic, 0, a1);
}

CFTypeRef PCSFPCreate(void *a1, void *a2, const void **a3)
{
  id v5;
  id v6;
  _QWORD *Empty;
  uint64_t v8;
  __CFData *RandomKey;
  __CFData *v10;
  const __CFData *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const void *v19;
  const void *SigningIdentity;
  const void *v21;
  id v22;
  void *v23;
  BOOL v24;
  _DWORD *v25;
  int v26;
  __CFData *KeyIDFromKey;
  CFTypeRef v28;
  const void *v29;

  v5 = a1;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (Empty = __PCSShareProtectionCreateEmpty(a3)) == 0)
  {
    v28 = 0;
    goto LABEL_31;
  }
  v8 = (uint64_t)Empty;
  RandomKey = CreateRandomKey();
  if (!RandomKey)
  {
    v28 = 0;
    goto LABEL_30;
  }
  v10 = RandomKey;
  *(_BYTE *)(v8 + 208) = 1;
  if (objc_msgSend(v5, "isEqualToString:", kPCSFPTypeClassic))
  {
    *(_DWORD *)(v8 + 204) = 2;
    v11 = (const __CFData *)CFRetain(v10);
    *(_QWORD *)(v8 + 72) = v11;
    generateObjectKey((_QWORD *)v8, v11, 0);
  }
  else if (objc_msgSend(v5, "isEqualToString:", kPCSFPTypeShare))
  {
    *(_DWORD *)(v8 + 204) = 3;
    *(_WORD *)(v8 + 209) = 0;
    *(_BYTE *)(v8 + 213) = 0;
    generateOtherKeysFromRWMasterKey(v8, v10, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", kPCSFPTypeLight))
    {
      v28 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)(v8 + 204) = 0;
    generateObjectKey((_QWORD *)v8, v10, 0);
    *(_QWORD *)(v8 + 72) = CFRetain(v10);
  }
  *(_QWORD *)(v8 + 176) = PCFPOptionCopyIdentity(v6);
  v18 = PCFPOptionCopyIdentity(v6);
  if (v18)
  {
    v19 = v18;
    SigningIdentity = (const void *)_PCSIdentityGetSigningIdentity((uint64_t)v18);
    v21 = SigningIdentity;
    if (SigningIdentity)
      CFRetain(SigningIdentity);
    CFRelease(v19);
  }
  else
  {
    v21 = 0;
  }
  *(_QWORD *)(v8 + 184) = v21;
  v22 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", kPCSFPService);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = (objc_opt_isKindOfClass() & 1) != 0 && PCSServiceItemRequireAuthorship((_BOOL8)v23);

  }
  else
  {
    v24 = 0;
  }

  *(_BYTE *)(v8 + 214) = v24;
  objc_msgSend(v22, "objectForKeyedSubscript:", kPCSFPZoneObject);
  v25 = (_DWORD *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = v25[50];
    if (v26)
      *(_DWORD *)(v8 + 200) = v26;
  }
  KeyIDFromKey = CreateKeyIDFromKey(*(const __CFData **)(v8 + 72));
  *(_QWORD *)(v8 + 80) = KeyIDFromKey;
  if (!KeyIDFromKey)
  {
    v28 = 0;
    v29 = (const void *)v8;
    v8 = (uint64_t)v10;
    goto LABEL_29;
  }
  v28 = CFRetain((CFTypeRef)v8);
LABEL_28:
  v29 = v10;
LABEL_29:
  CFRelease(v29);
LABEL_30:
  CFRelease((CFTypeRef)v8);
LABEL_31:

  return v28;
}

CFTypeRef PCSFPCreateLight(const void **a1)
{
  return PCSFPCreate((void *)kPCSFPTypeLight, 0, a1);
}

CFTypeRef PCSFPCreateShare(const void **a1)
{
  return PCSFPCreate((void *)kPCSFPTypeShare, 0, a1);
}

_QWORD *__PCSShareProtectionCreateEmpty(const void **a1)
{
  uint64_t Instance;
  _QWORD *v3;
  CFMutableDictionaryRef Mutable;
  CFTypeRef v5;
  CFMutableDictionaryRef v6;

  PCSShareProtectionGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v3 = (_QWORD *)Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 216) = 1192348414;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v3[14] = Mutable;
    if (!Mutable
      || (v5 = PCSIdentitySetCreateMutable(a1), (v3[2] = v5) == 0)
      || (v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), (v3[5] = v6) == 0))
    {
      CFRelease(v3);
      return 0;
    }
  }
  return v3;
}

__CFData *CreateRandomKey()
{
  __CFData *Mutable;
  size_t Length;
  UInt8 *MutableBytePtr;

  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 16);
  if (Mutable)
  {
    Length = CFDataGetLength(Mutable);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    _PCSRandomData(Length, MutableBytePtr);
  }
  return Mutable;
}

CFDataRef generateObjectKey(_QWORD *a1, const __CFData *a2, int a3)
{
  const void *v6;
  const void *v7;
  CFDataRef result;

  v6 = (const void *)a1[13];
  if (v6)
  {
    a1[13] = 0;
    CFRelease(v6);
  }
  if (a3)
  {
    getObjectKey((uint64_t)a1);
    a1[13] = a1[11];
    a1[11] = 0;
  }
  else
  {
    v7 = (const void *)a1[11];
    if (v7)
    {
      a1[11] = 0;
      CFRelease(v7);
    }
  }
  result = CFDataCreateCopy(0, a2);
  a1[12] = result;
  return result;
}

BOOL generateOtherKeysFromRWMasterKey(uint64_t a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v10;
  const void *v11;
  const void *v12;
  const __CFData *MutableCopy;
  CFIndex Length;
  __CFData *Mutable;
  const __CFData *v16;
  CFIndex v17;
  int MutableBytePtr;
  _BOOL8 result;
  char v20;

  if (*(_DWORD *)(a1 + 204) != 3)
    PCSAbort("getting other key when not version2 ?:sp->version == VERSION2", (uint64_t)theData, a3, a4, a5, a6, a7, a8, v20);
  if (*(_BYTE *)(a1 + 210))
    PCSAbort("getting other key when not version2 ?:!sp->flags.rolled", (uint64_t)theData, a3, a4, a5, a6, a7, a8, v20);
  v10 = *(const void **)(a1 + 64);
  if (v10)
  {
    *(_QWORD *)(a1 + 64) = 0;
    CFRelease(v10);
  }
  v11 = *(const void **)(a1 + 80);
  if (v11)
  {
    *(_QWORD *)(a1 + 80) = 0;
    CFRelease(v11);
  }
  v12 = *(const void **)(a1 + 72);
  if (v12)
  {
    *(_QWORD *)(a1 + 72) = 0;
    CFRelease(v12);
  }
  MutableCopy = CFDataCreateMutableCopy(0, 0, theData);
  *(_QWORD *)(a1 + 64) = MutableCopy;
  if (!MutableCopy)
    goto LABEL_14;
  generateObjectKey((_QWORD *)a1, MutableCopy, 1);
  Length = CFDataGetLength(theData);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, Length);
  *(_QWORD *)(a1 + 72) = Mutable;
  v16 = *(const __CFData **)(a1 + 64);
  v17 = CFDataGetLength(Mutable);
  MutableBytePtr = CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a1 + 72));
  result = _PCSCreateDerivedKey(v16, 20, (int)&MasterROKeyInputData, v17, MutableBytePtr, 0);
  if (!result)
LABEL_14:
    abort();
  *(_DWORD *)(a1 + 204) = 3;
  return result;
}

_QWORD *PCFPOptionCopyIdentity(void *a1)
{
  id v1;
  void *v2;
  CFTypeID v3;
  _QWORD *v4;
  void *v5;
  CFTypeID v6;
  void *v7;
  CFTypeID v8;
  _QWORD *v9;
  CFTypeRef v10;
  CFTypeID v11;
  uint64_t v12;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  objc_msgSend(v1, "objectForKeyedSubscript:", kPCSFPIdentity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = CFGetTypeID(v2);
    if (v3 == PCSIdentityGetTypeID())
    {
      v4 = CFRetain(v2);
LABEL_18:
      v9 = v4;
      goto LABEL_20;
    }
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", kPCSFPIdentitySet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (v6 = CFGetTypeID(v5), v6 != PCSIdentitySetGetTypeID()))
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", kPCSFPZoneObject);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_20;
    v11 = CFGetTypeID(v9);
    if (v11 == PCSShareProtectionGetTypeID())
    {
      v12 = v9[2];
      if (v12)
      {
        v4 = PCSIdentitySetCopyCurrentIdentityWithError(v12, kPCSServiceRaw, 0);
        goto LABEL_18;
      }
    }
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", kPCSFPService);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_19;
  v8 = CFGetTypeID(v7);
  if (v8 != CFStringGetTypeID())
    goto LABEL_19;
  cf = 0;
  v9 = PCSIdentitySetCopyCurrentIdentityWithError((uint64_t)v5, (uint64_t)v7, &cf);
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = cf;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCFPOptionCopyIdentity(kPCSFPIdentitySet) but failed to find identity: %@", buf, 0xCu);
  }
  v10 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v10);
  }
LABEL_20:

  return v9;
}

__CFData *CreateKeyIDFromKey(const __CFData *a1)
{
  CFIndex *v2;
  CFIndex v3;
  __CFData *Mutable;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (CFIndex *)ccsha256_di();
  if (!_PCSCreateDerivedKey(a1, 20, (int)&MasterKeyIDLabel, 0x10uLL, (int)&v6, 0))
    return 0;
  v3 = *v2;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v3);
  if (Mutable)
  {
    CFDataGetMutableBytePtr(Mutable);
    cchmac();
  }
  return Mutable;
}

uint64_t MarkForCounterSigning(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *SigningIdentity;
  const void *v9;
  int v10;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *(_QWORD *)(a2 + 16);
      if (result)
      {
        result = (uint64_t)PCSIdentitySetCopyCurrentIdentityWithError(result, kPCSServiceRaw, 0);
        if (result)
        {
          v5 = result;
          v6 = *(const void **)(a1 + 176);
          if (v6)
          {
            *(_QWORD *)(a1 + 176) = 0;
            CFRelease(v6);
          }
          v7 = *(const void **)(a1 + 184);
          if (v7)
          {
            *(_QWORD *)(a1 + 184) = 0;
            CFRelease(v7);
          }
          *(_QWORD *)(a1 + 176) = v5;
          SigningIdentity = (const void *)_PCSIdentityGetSigningIdentity(v5);
          v9 = SigningIdentity;
          if (SigningIdentity)
            CFRetain(SigningIdentity);
          *(_QWORD *)(a1 + 184) = v9;
          result = 1;
          *(_BYTE *)(a1 + 214) = 1;
          v10 = *(_DWORD *)(a2 + 200);
          if (v10)
            *(_DWORD *)(a1 + 200) = v10;
        }
      }
    }
  }
  return result;
}

const void *PCSFPCopyCurrentPrivateKey(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 16)) != 0)
    return PCSIdentitySetCopyCurrentIdentityWithError(v1, kPCSServiceRaw, 0);
  else
    return 0;
}

CFTypeRef PCSFPCopyObject(CFTypeRef cf)
{
  CFTypeRef v1;
  CFTypeID v2;
  _QWORD *Empty;
  _QWORD *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  CFMutableDictionaryRef MutableCopy;
  const __CFArray *v13;
  CFMutableArrayRef v14;
  const __CFDictionary *v15;
  CFMutableDictionaryRef v16;
  const __CFData *v17;
  CFMutableDataRef v18;
  const __CFData *v19;
  CFMutableDataRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  CFMutableDictionaryRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *SigningIdentity;
  const void *v34;

  v1 = cf;
  if (cf)
  {
    v2 = CFGetTypeID(cf);
    if (v2 == PCSShareProtectionGetTypeID() && (Empty = __PCSShareProtectionCreateEmpty(0)) != 0)
    {
      v4 = Empty;
      v5 = (const void *)Empty[2];
      if (v5)
      {
        v4[2] = 0;
        CFRelease(v5);
      }
      v6 = PCSIdentitySetCopySet(*((_QWORD *)v1 + 2), 0);
      v4[2] = v6;
      if (!v6)
        goto LABEL_52;
      v7 = *((_QWORD *)v1 + 3);
      if (v7)
      {
        v8 = PCSIdentitySetCopySet(v7, 0);
        v4[3] = v8;
        if (!v8)
          goto LABEL_52;
      }
      v9 = *((_QWORD *)v1 + 4);
      if (v9)
      {
        v10 = PCSIdentitySetCopySet(v9, 0);
        v4[4] = v10;
        if (!v10)
          goto LABEL_52;
      }
      v11 = (const void *)v4[5];
      if (v11)
      {
        v4[5] = 0;
        CFRelease(v11);
      }
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)v1 + 5));
      v4[5] = MutableCopy;
      if (!MutableCopy)
        goto LABEL_52;
      v13 = (const __CFArray *)*((_QWORD *)v1 + 6);
      if (v13)
      {
        v14 = CFArrayCreateMutableCopy(0, 0, v13);
        v4[6] = v14;
        if (!v14)
          goto LABEL_52;
      }
      v15 = (const __CFDictionary *)*((_QWORD *)v1 + 7);
      if (v15)
      {
        v16 = CFDictionaryCreateMutableCopy(0, 0, v15);
        v4[7] = v16;
        if (!v16)
          goto LABEL_52;
      }
      v17 = (const __CFData *)*((_QWORD *)v1 + 8);
      if (v17)
        v18 = CFDataCreateMutableCopy(0, 0, v17);
      else
        v18 = 0;
      v4[8] = v18;
      v19 = (const __CFData *)*((_QWORD *)v1 + 9);
      if (v19)
        v20 = CFDataCreateMutableCopy(0, 0, v19);
      else
        v20 = 0;
      v4[9] = v20;
      v21 = *((_QWORD *)v1 + 10);
      if (v21)
        CFRetain(*((CFTypeRef *)v1 + 10));
      v4[10] = v21;
      v22 = *((_QWORD *)v1 + 11);
      if (v22)
        CFRetain(*((CFTypeRef *)v1 + 11));
      v4[11] = v22;
      v23 = *((_QWORD *)v1 + 12);
      if (v23)
        CFRetain(*((CFTypeRef *)v1 + 12));
      v4[12] = v23;
      v24 = *((_QWORD *)v1 + 13);
      if (v24)
        CFRetain(*((CFTypeRef *)v1 + 13));
      if (((v4[13] = v24, (v25 = (const void *)v4[14]) == 0)
         || (v4[14] = 0,
             CFRelease(v25),
             v26 = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)v1 + 14)),
             (v4[14] = v26) != 0))
        && (v4[15] = *((_QWORD *)v1 + 15), !copy_PCSAttributes()))
      {
        v27 = *((_QWORD *)v1 + 18);
        if (v27)
          CFRetain(*((CFTypeRef *)v1 + 18));
        v4[18] = v27;
        v28 = *((_QWORD *)v1 + 19);
        if (v28)
          CFRetain(*((CFTypeRef *)v1 + 19));
        v4[19] = v28;
        v29 = *((_QWORD *)v1 + 20);
        if (v29)
          CFRetain(*((CFTypeRef *)v1 + 20));
        v4[20] = v29;
        v30 = *((_QWORD *)v1 + 21);
        if (v30)
          CFRetain(*((CFTypeRef *)v1 + 21));
        v4[21] = v30;
        v31 = *((_QWORD *)v1 + 22);
        if (v31)
          CFRetain(*((CFTypeRef *)v1 + 22));
        v4[22] = v31;
        v32 = *((_QWORD *)v1 + 22);
        if (v32)
        {
          SigningIdentity = (const void *)_PCSIdentityGetSigningIdentity(v32);
          v34 = SigningIdentity;
          if (SigningIdentity)
            CFRetain(SigningIdentity);
        }
        else
        {
          v34 = 0;
        }
        v4[23] = v34;
        *((_DWORD *)v4 + 51) = *((_DWORD *)v1 + 51);
        *((_DWORD *)v4 + 52) = *((_DWORD *)v1 + 52);
        *((_WORD *)v4 + 106) = *((_WORD *)v1 + 106);
        *((_BYTE *)v4 + 214) = *((_BYTE *)v1 + 214);
        v1 = CFRetain(v4);
      }
      else
      {
LABEL_52:
        v1 = 0;
      }
      CFRelease(v4);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL PCSFPIsReadWrite(uint64_t a1)
{
  return *(_DWORD *)(a1 + 204) != 3 || *(_BYTE *)(a1 + 209) == 0;
}

BOOL PCSFPSupportFeature(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    return (*(_DWORD *)(a1 + 204) & 0xFFFFFFFE) == 2;
  }
  else
  {
    if (a2 != 1)
      return 0;
    if (*(_DWORD *)(a1 + 204) != 3)
      return 1;
    return *(_BYTE *)(a1 + 209) == 0;
  }
}

BOOL PCSFPIsLight(uint64_t a1)
{
  return *(_DWORD *)(a1 + 204) == 0;
}

uint64_t PCSFPGetUnwrapPublicIdentity(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

uint64_t PCSFPStatus(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    return 24;
  if (!*(_QWORD *)(a1 + 72))
    return 11;
  if (!*(_QWORD *)(a1 + 80))
    return 23;
  if (*(_QWORD *)(a1 + 16))
    return 0;
  return 11;
}

CFDataRef PCSFPCreateUniqueID(uint64_t a1)
{
  const __CFDictionary *v2;
  __CFArray *Mutable;
  uint64_t v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  CFIndex Count;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v14;
  char *v15;
  CFIndex v16;
  uint64_t v17;
  CFDataRef v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD context[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFRange v28;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v2 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(*(_QWORD *)(a1 + 16), 0);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v24[3] = (uint64_t)Mutable;
  CFArrayAppendValue(Mutable, *(const void **)(a1 + 72));
  v4 = MEMORY[0x1E0C809B0];
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __PCSFPCreateUniqueID_block_invoke;
  context[3] = &unk_1E553DE90;
  context[4] = &v23;
  CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)apply_block_2_1, context);
  v5 = *(const __CFDictionary **)(a1 + 40);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __PCSFPCreateUniqueID_block_invoke_2;
  v21[3] = &unk_1E553DE90;
  v21[4] = &v23;
  CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)apply_block_2_1, v21);
  v6 = *(const __CFDictionary **)(a1 + 112);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __PCSFPCreateUniqueID_block_invoke_3;
  v20[3] = &unk_1E553DE90;
  v20[4] = &v23;
  CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)apply_block_2_1, v20);
  if (v2)
    CFRelease(v2);
  v7 = (const __CFArray *)v24[3];
  v28.length = CFArrayGetCount(v7);
  v28.location = 0;
  CFArraySortValues(v7, v28, (CFComparatorFunction)ArraySortCompare, 0);
  v8 = ccsha256_di();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v20 - v9;
  ccdigest_init();
  Count = CFArrayGetCount((CFArrayRef)v24[3]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v24[3], i);
      v14 = CFGetTypeID(ValueAtIndex);
      if (v14 == CFStringGetTypeID())
      {
        v15 = PCSCFStringToCString(ValueAtIndex);
        strlen(v15);
        ccdigest_update();
        free(v15);
      }
      else
      {
        CFDataGetLength((CFDataRef)ValueAtIndex);
        CFDataGetBytePtr((CFDataRef)ValueAtIndex);
        ccdigest_update();
      }
    }
  }
  CFRelease((CFTypeRef)v24[3]);
  v16 = *(_QWORD *)v8;
  MEMORY[0x1E0C80A78](v17);
  (*(void (**)(uint64_t, char *, char *))(v8 + 56))(v8, v10, (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = CFDataCreate(0, (const UInt8 *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  _Block_object_dispose(&v23, 8);
  return v18;
}

void sub_1A9520B88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

CFComparisonResult ArraySortCompare(const __CFString *a1, const __CFString *a2)
{
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeID v15;
  unint64_t Length;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  const UInt8 *BytePtr;
  const UInt8 *v21;
  int v22;
  uint64_t v23;
  char v24;

  v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    v5 = CFGetTypeID(a2);
    if (v5 == CFStringGetTypeID())
      return CFStringCompare(a1, a2, 0);
    return 1;
  }
  v7 = CFGetTypeID(a1);
  if (v7 != CFDataGetTypeID())
    PCSAbort("unknown type in array", v8, v9, v10, v11, v12, v13, v14, v24);
  v15 = CFGetTypeID(a2);
  if (v15 != CFDataGetTypeID())
    return -1;
  Length = CFDataGetLength((CFDataRef)a1);
  v17 = CFDataGetLength((CFDataRef)a2);
  v18 = v17;
  if (Length >= v17)
    v19 = v17;
  else
    v19 = Length;
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  v21 = CFDataGetBytePtr((CFDataRef)a2);
  v22 = memcmp(BytePtr, v21, v19);
  if (v22 > 0 || !v22 && Length > v18)
    return 1;
  LODWORD(v23) = v22 == 0;
  if (Length >= v18)
    LODWORD(v23) = 0;
  if (v22 < 0)
    v23 = 1;
  else
    v23 = v23;
  return v23 << 63 >> 63;
}

CFStringRef PCSFPCreatePEMData(CFDataRef theData)
{
  return __PCSCreateExportPEM((uint64_t)CFSTR("PCS SHARE PROTECTION"), theData);
}

__CFString *PCSFPCopyDiagnostic(uint64_t a1)
{
  const __CFDictionary *v2;
  __CFString *Mutable;
  const __CFData *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v7;
  CFStringRef v8;
  const __CFData *v9;
  char *v10;
  CFIndex v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFArray *v23;
  _QWORD *v24;
  uint64_t v25;
  const __CFData *v26;
  const __CFData *v27;
  const UInt8 *v28;
  CFIndex v29;
  CFStringRef v30;
  uint64_t v31;
  const __CFData *v32;
  const __CFData *v33;
  const UInt8 *v34;
  CFIndex v35;
  CFStringRef v36;
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[6];
  _QWORD context[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  CFRange v46;

  v2 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(*(_QWORD *)(a1 + 16), 0);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
    goto LABEL_35;
  v4 = *(const __CFData **)(a1 + 72);
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(v4);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 72));
    v7 = _PCSCreateBase64((uint64_t)BytePtr, Length, 0);
    v8 = v7;
    if (!v7)
      goto LABEL_35;
    CFStringAppendFormat(Mutable, 0, CFSTR("Masterkey: %@\n"), v7);
    CFRelease(v8);
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("Masterkey: ---- NO MASTERKEY available----\n"));
  }
  v9 = *(const __CFData **)(a1 + 80);
  if (!v9)
  {
LABEL_9:
    v14 = _PCSYESNO(*(unsigned __int8 *)(a1 + 208));
    CFStringAppendFormat(Mutable, 0, CFSTR("Validated: %@\n"), v14);
    v15 = *(_DWORD *)(a1 + 204) != 3 || *(_BYTE *)(a1 + 209) == 0;
    v16 = _PCSYESNO(v15);
    CFStringAppendFormat(Mutable, 0, CFSTR("ReadWrite: %@\n"), v16);
    v17 = _PCSYESNO((*(_DWORD *)(a1 + 204) & 0xFFFFFFFE) == 2);
    CFStringAppendFormat(Mutable, 0, CFSTR("Expose zone key: %@\n"), v17);
    v18 = _PCSYESNO(*(_DWORD *)(a1 + 204) == 3);
    CFStringAppendFormat(Mutable, 0, CFSTR("Version2: %@\n"), v18);
    v19 = _PCSYESNO(*(_DWORD *)(a1 + 204) == 0);
    CFStringAppendFormat(Mutable, 0, CFSTR("Light: %@\n"), v19);
    *((_DWORD *)v43 + 6) = 0;
    v20 = MEMORY[0x1E0C809B0];
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSFPCopyDiagnostic_block_invoke;
    context[3] = &unk_1E553DE30;
    context[4] = &v42;
    context[5] = Mutable;
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)apply_block_2_1, context);
    *((_DWORD *)v43 + 6) = 0;
    v21 = *(const __CFDictionary **)(a1 + 40);
    v40[0] = v20;
    v40[1] = 3221225472;
    v40[2] = __PCSFPCopyDiagnostic_block_invoke_2;
    v40[3] = &unk_1E553DE30;
    v40[4] = &v42;
    v40[5] = Mutable;
    CFDictionaryApplyFunction(v21, (CFDictionaryApplierFunction)apply_block_2_1, v40);
    v22 = *(const __CFDictionary **)(a1 + 112);
    if (v22)
    {
      *((_DWORD *)v43 + 6) = 0;
      v39[0] = v20;
      v39[1] = 3221225472;
      v39[2] = __PCSFPCopyDiagnostic_block_invoke_3;
      v39[3] = &unk_1E553DE30;
      v39[4] = &v42;
      v39[5] = Mutable;
      CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)apply_block_2_1, v39);
    }
    v23 = *(const __CFArray **)(a1 + 48);
    if (v23)
    {
      *((_DWORD *)v43 + 6) = 0;
      v38[0] = v20;
      v38[1] = 3221225472;
      v38[2] = __PCSFPCopyDiagnostic_block_invoke_4;
      v38[3] = &unk_1E553E030;
      v38[4] = &v42;
      v38[5] = Mutable;
      v24 = v38;
      v46.length = CFArrayGetCount(v23);
      v46.location = 0;
      CFArrayApplyFunction(v23, v46, (CFArrayApplierFunction)apply_block_1_0, v24);

    }
    if (v2)
      CFRelease(v2);
    CFStringAppendFormat(Mutable, 0, CFSTR("Top Level Service ID: %u\n"), *(unsigned int *)(a1 + 200));
    v25 = *(_QWORD *)(a1 + 168);
    if (v25)
    {
      v26 = PCSPublicIdentityCopyPublicKey(v25);
      v27 = v26;
      if (v26)
      {
        v28 = CFDataGetBytePtr(v26);
        v29 = CFDataGetLength(v27);
        v30 = _PCSCreateBase64((uint64_t)v28, v29, 0);
      }
      else
      {
        v30 = 0;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("Validation identity: %@\n"), v30);
      if (v30)
        CFRelease(v30);
      if (v27)
        CFRelease(v27);
    }
    v31 = *(_QWORD *)(a1 + 160);
    if (v31)
    {
      v32 = PCSPublicIdentityCopyPublicKey(v31);
      v33 = v32;
      if (v32)
      {
        v34 = CFDataGetBytePtr(v32);
        v35 = CFDataGetLength(v33);
        v36 = _PCSCreateBase64((uint64_t)v34, v35, 0);
      }
      else
      {
        v36 = 0;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("Owner identity: %@\n"), v36);
      if (v36)
        CFRelease(v36);
      if (v33)
        CFRelease(v33);
    }
    goto LABEL_34;
  }
  v10 = (char *)CFDataGetBytePtr(v9);
  v11 = CFDataGetLength(*(CFDataRef *)(a1 + 80));
  v12 = _PCSCreateHexString(v10, v11);
  v13 = v12;
  if (v12)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("MasterkeyID: %@\n"), v12);
    CFRelease(v13);
    goto LABEL_9;
  }
LABEL_35:
  if (v2)
    CFRelease(v2);
  if (Mutable)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
LABEL_34:
  _Block_object_dispose(&v42, 8);
  return Mutable;
}

void sub_1A95211A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFData *_PCSFPCopyExportedWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int v11;
  size_t Count;
  size_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  const __CFDictionary *v18;
  const __CFArray *v19;
  size_t v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  size_t v24;
  void *v25;
  void *v26;
  const __CFDictionary *v27;
  void *v28;
  CFIndex v29;
  __CFData *Mutable;
  __CFData *v31;
  __CFData *v32;
  void *v33;
  void *v34;
  _DWORD *v35;
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
  uint64_t v47;
  uint64_t v48;
  CFIndex v49;
  __CFData *v50;
  __CFData *v51;
  const __CFData *v52;
  __CFData *v53;
  unsigned int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int *v63;
  CFIndex v64;
  __CFData *v65;
  int v66;
  _DWORD *v67;
  int v68;
  __CFData *LightPCSObject;
  void *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  CFIndex *v76;
  CFIndex v77;
  __CFData *v78;
  __CFData *v79;
  const __CFData *v80;
  __CFData *v81;
  const __CFArray *v82;
  CFIndex v83;
  CFIndex v84;
  const __CFData *ValueAtIndex;
  void *v86;
  CFIndex v87;
  __CFData *v88;
  const __CFArray *v89;
  __CFData *result;
  uint64_t v91;
  char *v92;
  char v93;
  const __CFArray *theArray;
  _QWORD *v95;
  __int128 v96;
  void *v97[2];
  __int128 v98;
  void *v99;
  _QWORD v100[6];
  _QWORD v101[8];
  _QWORD context[9];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  CFRange v124;

  v114 = 0;
  v115 = &v114;
  v116 = 0x7810000000;
  v117 = &unk_1A95609B5;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x3810000000;
  v110 = &unk_1A95609B5;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  if (*(_DWORD *)(a1 + 216) != 1192348414)
  {
    v92 = "PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive";
    goto LABEL_132;
  }
  v10 = a3;
  v11 = a2;
  if ((a2 | a3) == 1 && !a4)
  {
    _PCSError(a5, 141, CFSTR("cannot sign or request PPPCS signature without a public identity"));
    goto LABEL_136;
  }
  if (!*(_DWORD *)(a1 + 204))
  {
    LightPCSObject = _CreateLightPCSObject(a1, a5);
LABEL_121:
    _Block_object_dispose(&v103, 8);
    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v114, 8);
    return LightPCSObject;
  }
  v123 = 0;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v118 = 0u;
  v112 = 0;
  v113 = 0;
  v111 = 0;
  if (!*(_QWORD *)(a1 + 72))
  {
    _PCSError(a5, 25, CFSTR("can't export object w/o masterkey"));
LABEL_136:
    LightPCSObject = 0;
    v95 = 0;
    v70 = 0;
LABEL_117:
    free_PCSEncryptedKeys();
    free_PCSShareProtection();
    if (v95)
    {
      free_PCSSPKeyList();
      free(v95);
    }
    if (v70)
    {
      free_PCSSignature();
      free(v70);
    }
    goto LABEL_121;
  }
  if (*(_BYTE *)(a1 + 209))
  {
    _PCSError(a5, 48, CFSTR("share is readonly for unwrapping identity"));
    goto LABEL_136;
  }
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40));
  v14 = Count;
  if (!Count)
    goto LABEL_136;
  v15 = malloc_type_calloc(Count, 0x38uLL, 0x109004004F1B07DuLL);
  v16 = v115;
  v115[6] = (uint64_t)v15;
  if (!v15)
    goto LABEL_136;
  *((_DWORD *)v16 + 10) = v14;
  *((_DWORD *)v104 + 6) = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = *(const __CFDictionary **)(a1 + 40);
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = ___PCSFPCopyExportedWithOptions_block_invoke;
  context[3] = &unk_1E553E058;
  context[6] = a1;
  context[7] = a5;
  context[4] = &v114;
  context[5] = &v103;
  context[8] = v14;
  CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)apply_block_2_1, context);
  if (v14 != *((_DWORD *)v104 + 6))
  {
    v92 = "wrong number of PublicKeys:n == count";
    goto LABEL_132;
  }
  if (*(_DWORD *)(a1 + 204) != 3)
    *(_DWORD *)(a1 + 204) = 2;
  v19 = (const __CFArray *)PCSIdentitySetCopyOrderedIdentities(*(_QWORD *)(a1 + 16), kPCSServiceRaw);
  theArray = v19;
  if (!v19 || (v20 = CFArrayGetCount(v19)) == 0)
  {
    v95 = 0;
    goto LABEL_19;
  }
  v95 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
  if (!v95)
  {
    _PCSErrorOOM(a5);
    LightPCSObject = 0;
    v95 = 0;
    goto LABEL_147;
  }
  v95[1] = malloc_type_calloc(v20, 0x20uLL, 0x1090040863882BEuLL);
  v21 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
  v108[6] = (uint64_t)v21;
  if (!v21 || (v22 = malloc_type_calloc(v20, 0x20uLL, 0x1090040863882BEuLL), (*(_QWORD *)(v108[6] + 8) = v22) == 0))
  {
    _PCSErrorOOM(a5);
    LightPCSObject = 0;
LABEL_147:
    v70 = 0;
    v32 = 0;
    v51 = 0;
    v89 = theArray;
    goto LABEL_112;
  }
  *((_DWORD *)v104 + 6) = 0;
  v101[0] = v17;
  v101[1] = 3221225472;
  v101[2] = ___PCSFPCopyExportedWithOptions_block_invoke_2;
  v101[3] = &unk_1E553E080;
  v101[4] = &v107;
  v101[5] = &v103;
  v101[6] = v95;
  v101[7] = v20;
  v23 = v101;
  v124.length = CFArrayGetCount(theArray);
  v124.location = 0;
  CFArrayApplyFunction(theArray, v124, (CFArrayApplierFunction)apply_block_1_0, v23);

LABEL_19:
  v24 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 112));
  if (v24)
  {
    v25 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
    v108[4] = (uint64_t)v25;
    v26 = malloc_type_calloc(v24, 0x10uLL, 0x108004057E67DB5uLL);
    *(_QWORD *)(v108[4] + 8) = v26;
    *((_DWORD *)v104 + 6) = 0;
    v27 = *(const __CFDictionary **)(a1 + 112);
    v100[0] = v17;
    v100[1] = 3221225472;
    v100[2] = ___PCSFPCopyExportedWithOptions_block_invoke_3;
    v100[3] = &unk_1E553E0A8;
    v100[4] = &v107;
    v100[5] = &v103;
    CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)apply_block_2_1, v100);
    if (v24 != *((_DWORD *)v104 + 6))
      __assert_rtn("_PCSFPCopyExportedWithOptions", "PCSShareProtection.m", 1746, "n == count");
  }
  v28 = malloc_type_calloc(1uLL, 0x20uLL, 0x1090040863882BEuLL);
  v108[5] = (uint64_t)v28;
  if (!v28)
    goto LABEL_134;
  *(_QWORD *)&v96 = 0;
  v29 = length_PCSEncryptedKeys();
  Mutable = CFDataCreateMutable(0, v29);
  v31 = Mutable;
  if (!Mutable)
    goto LABEL_134;
  CFDataSetLength(Mutable, v29);
  CFDataGetMutableBytePtr(v31);
  if (encode_PCSEncryptedKeys())
  {
    CFRelease(v31);
LABEL_134:
    v51 = 0;
    v32 = 0;
    goto LABEL_63;
  }
  if (v29 == (_QWORD)v96)
  {
    v32 = PCSFPCopyEncryptedData(a1, 0, v31, a5);
    CFRelease(v31);
    if (!v32)
      goto LABEL_62;
    v33 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
    v115[12] = (uint64_t)v33;
    if (!v33
      || (v34 = malloc_type_malloc(4uLL, 0x28CD1F66uLL),
          *(_QWORD *)(v115[12] + 8) = v34,
          (v35 = *(_DWORD **)(v115[12] + 8)) == 0))
    {
      _PCSErrorOOM(a5);
      goto LABEL_62;
    }
    *v35 = *(_DWORD *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 80));
    *(_QWORD *)v115[12] = 4;
    if (v10)
    {
      if (!a4)
      {
        _PCSError(a5, 141, CFSTR("cannot request PPPCS signature without a public identity"));
        goto LABEL_62;
      }
      v99 = 0;
      *(_OWORD *)v97 = 0u;
      v98 = xmmword_1A9553E08;
      v96 = 0u;
      if ((_PCSPublicIdentityExportPCSSPKey(a4, (uint64_t)&v96, v36, v37, v38, v39, v40, v41) & 1) == 0)
        PCSAbort("failed to fill manatee sharee PCSSPKey:_PCSPublicIdentityExportPCSSPKey(shareeSignatureIdentity, &expectedPublicKey)", v42, v43, v44, v45, v46, v47, v48, v93);
      if (_PCSFPMustEncryptManateeSharingAttributes(a1))
      {
        v49 = length_PCSSPKey();
        v50 = CFDataCreateMutable(0, v49);
        v51 = v50;
        if (!v50)
          goto LABEL_62;
        CFDataSetLength(v50, v49);
        CFDataGetMutableBytePtr(v51);
        if (encode_PCSSPKey())
        {
LABEL_144:
          CFRelease(v51);
          goto LABEL_62;
        }
        if (v49)
          goto LABEL_157;
        v52 = CFDataCreate(0, (const UInt8 *)"PCSSignatureKeyIDEncryption", 27);
        v53 = PCSFPCopyEncryptedData(a1, v52, v51, a5);
        if (v52)
          CFRelease(v52);
        CFRelease(v51);
        if (!v53)
          goto LABEL_62;
        LODWORD(v98) = 11;
        FillOctetString((CFIndex *)&v98 + 1, v53);
        CFRelease(v53);
      }
      else
      {
        *((_QWORD *)&v98 + 1) = length_PCSSPKey();
        v99 = malloc_type_malloc(*((size_t *)&v98 + 1), 0x1B535954uLL);
        if (!v99)
          goto LABEL_62;
        if (encode_PCSSPKey())
          goto LABEL_61;
      }
      v54 = (unsigned int *)v115[7];
      if (!v54)
      {
        v54 = (unsigned int *)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
        v115[7] = (uint64_t)v54;
      }
      PCSReplaceOrUpdateAttribute(v54, v98, (uint64_t)&v98 + 8);
      free_PCSSPKey();
      free_PCSTypeValue();
    }
    v55 = *(_QWORD *)(a1 + 160);
    if (!v55)
      goto LABEL_49;
    v99 = 0;
    *(_OWORD *)v97 = 0u;
    v98 = xmmword_1A9553E20;
    v96 = 0u;
    if ((_PCSPublicIdentityExportPCSSPKey(v55, (uint64_t)&v96, v36, v37, v38, v39, v40, v41) & 1) == 0)
      PCSAbort("failed to fill ownerIdentity PCSSPKey:_PCSPublicIdentityExportPCSSPKey(sp->ownerIdentity, &ownerPublicKey)", v56, v57, v58, v59, v60, v61, v62, v93);
    *((_QWORD *)&v98 + 1) = length_PCSSPKey();
    v99 = malloc_type_malloc(*((size_t *)&v98 + 1), 0xFD5715B8uLL);
    if (!v99)
      goto LABEL_62;
    if (!encode_PCSSPKey())
    {
      v63 = (unsigned int *)v115[7];
      if (!v63)
      {
        v63 = (unsigned int *)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
        v115[7] = (uint64_t)v63;
      }
      PCSReplaceOrUpdateAttribute(v63, v98, (uint64_t)&v98 + 8);
      free_PCSSPKey();
      free_PCSTypeValue();
LABEL_49:
      *(_QWORD *)&v96 = 0;
      v64 = length_PCSSignedShareProtection();
      v65 = CFDataCreateMutable(0, v64);
      v51 = v65;
      if (v65)
      {
        CFDataSetLength(v65, v64);
        CFDataGetMutableBytePtr(v51);
        if (!encode_PCSSignedShareProtection())
        {
          if (v64 != (_QWORD)v96)
            goto LABEL_157;
          v66 = *(_DWORD *)(a1 + 204);
          if (v66 == 2)
          {
            if (getObjectKey(a1))
            {
              v67 = malloc_type_calloc(1uLL, 0x20uLL, 0x1090040863882BEuLL);
              v115[9] = (uint64_t)v67;
              if (v67)
              {
                v68 = 5;
                goto LABEL_68;
              }
LABEL_139:
              _PCSErrorOOM(a5);
              goto LABEL_63;
            }
            v92 = "no ObjectKey, yet public keys:getObjectKey(sp)";
          }
          else
          {
            if (v66 != 3)
            {
LABEL_69:
              v71 = v115;
              v72 = v115[9];
              if (v72)
                v73 = v72 + 16;
              else
                v73 = 0;
              if (!*(_BYTE *)(a1 + 214) || !*(_QWORD *)(a1 + 176))
                goto LABEL_76;
              if (!v72)
              {
                _PCSError(a5, 89, CFSTR("can't do authorship w/o selfSign"));
                goto LABEL_63;
              }
              v74 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040EC46ECBEuLL);
              v71 = v115;
              v115[13] = (uint64_t)v74;
              if (v74)
              {
LABEL_76:
                if (!v11)
                {
                  v70 = 0;
LABEL_82:
                  if (!CreateSignature(a1, v51, v32, v95, (_DWORD *)(a1 + 128), (size_t *)v71 + 10, v73, v71[13], (uint64_t)v70, a5))goto LABEL_64;
                  v76 = (CFIndex *)malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
                  v115[8] = (uint64_t)v76;
                  if (!v76)
                  {
LABEL_137:
                    _PCSErrorOOM(a5);
                    goto LABEL_64;
                  }
                  FillOctetString(v76, v32);
                  if (*(_DWORD *)(a1 + 204) <= 2u && !*(_BYTE *)(a1 + 214) && (v115[7] || v115[13] || v115[14]))
                    goto LABEL_64;
                  if (!v11)
                    goto LABEL_100;
                  if (!v70)
                    goto LABEL_64;
                  v97[0] = 0;
                  v96 = xmmword_1A9553E38;
                  if (!_PCSFPMustEncryptManateeSharingAttributes(a1))
                  {
                    *(_QWORD *)&v98 = 0;
                    *((_QWORD *)&v96 + 1) = length_PCSSignature();
                    v97[0] = malloc_type_malloc(*((size_t *)&v96 + 1), 0xA0C2FE83uLL);
                    if (v97[0])
                    {
                      v91 = encode_PCSSignature();
                      if (!(_DWORD)v91)
                      {
LABEL_99:
                        add_PCSAttributes((unsigned int *)v115[14]);
                        free_PCSTypeValue();
LABEL_100:
                        if (_PCSIdentitySupportsServerSigning(*(_QWORD *)(a1 + 176)))
                        {
                          v82 = *(const __CFArray **)(a1 + 192);
                          if (v82)
                          {
                            v83 = CFArrayGetCount(v82);
                            if (v83 >= 1)
                            {
                              v84 = 0;
                              do
                              {
                                ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 192), v84);
                                v97[0] = 0;
                                v96 = xmmword_1A9553E50;
                                if (!v115[14])
                                {
                                  v86 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
                                  v115[14] = (uint64_t)v86;
                                  if (!v86)
                                    goto LABEL_137;
                                }
                                FillOctetString((CFIndex *)&v96 + 1, ValueAtIndex);
                                add_PCSAttributes((unsigned int *)v115[14]);
                                free_PCSTypeValue();
                              }
                              while (v83 != ++v84);
                            }
                          }
                        }
                        *(_QWORD *)&v96 = 0;
                        v87 = length_PCSShareProtection();
                        v88 = CFDataCreateMutable(0, v87);
                        LightPCSObject = v88;
                        if (v88)
                        {
                          CFDataSetLength(v88, v87);
                          CFDataGetMutableBytePtr(LightPCSObject);
                          if (encode_PCSShareProtection())
                          {
                            CFRelease(LightPCSObject);
                            goto LABEL_64;
                          }
                          if (v87 == (_QWORD)v96)
                          {
                            *(_BYTE *)(a1 + 210) = 0;
LABEL_111:
                            v89 = theArray;
                            if (!theArray)
                            {
LABEL_113:
                              if (v32)
                                CFRelease(v32);
                              if (v51)
                                CFRelease(v51);
                              goto LABEL_117;
                            }
LABEL_112:
                            CFRelease(v89);
                            goto LABEL_113;
                          }
                          goto LABEL_157;
                        }
LABEL_64:
                        LightPCSObject = 0;
                        goto LABEL_111;
                      }
                      free(v97[0]);
                      v97[0] = 0;
                    }
                    else
                    {
                      v91 = 12;
                    }
                    _PCSErrorASN1(a5, (uint64_t)"encode PCSSignature", v91);
                    goto LABEL_64;
                  }
                  *(_QWORD *)&v98 = 0;
                  v77 = length_PCSSignature();
                  v78 = CFDataCreateMutable(0, v77);
                  v79 = v78;
                  if (!v78)
                    goto LABEL_64;
                  CFDataSetLength(v78, v77);
                  CFDataGetMutableBytePtr(v79);
                  if (encode_PCSSignature())
                  {
                    CFRelease(v79);
                    goto LABEL_64;
                  }
                  if (v77 == (_QWORD)v98)
                  {
                    v80 = CFDataCreate(0, (const UInt8 *)"PCSSignatureEncryption", 22);
                    v81 = PCSFPCopyEncryptedData(a1, v80, v79, a5);
                    if (v80)
                      CFRelease(v80);
                    CFRelease(v79);
                    if (!v81)
                      goto LABEL_64;
                    LODWORD(v96) = 10;
                    FillOctetString((CFIndex *)&v96 + 1, v81);
                    CFRelease(v81);
                    goto LABEL_99;
                  }
LABEL_157:
                  result = (__CFData *)asn1_abort();
                  goto LABEL_158;
                }
                if (!*(_QWORD *)(a1 + 184))
                {
                  _PCSError(a5, 142, CFSTR("can't do pppcs signing without a signing key"));
                  goto LABEL_63;
                }
                v70 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040EC46ECBEuLL);
                if (v70)
                {
                  v71 = v115;
                  if (!v115[14])
                  {
                    v75 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
                    v71 = v115;
                    v115[14] = (uint64_t)v75;
                  }
                  goto LABEL_82;
                }
              }
              goto LABEL_139;
            }
            if (*(_BYTE *)(a1 + 209))
            {
              v92 = "version 2 but read only:!sp->flags.readonly";
            }
            else
            {
              if (getObjectKey(a1))
              {
                v67 = malloc_type_calloc(1uLL, 0x20uLL, 0x1090040863882BEuLL);
                v115[9] = (uint64_t)v67;
                if (v67)
                {
                  v68 = 4;
LABEL_68:
                  *v67 = v68;
                  goto LABEL_69;
                }
                goto LABEL_139;
              }
              v92 = "no ObjectKey, yet version2:getObjectKey(sp)";
            }
          }
LABEL_132:
          PCSAbort(v92, a2, a3, a4, (uint64_t)a5, a6, a7, a8, v93);
        }
        goto LABEL_144;
      }
LABEL_62:
      v51 = 0;
LABEL_63:
      v70 = 0;
      goto LABEL_64;
    }
LABEL_61:
    free(v99);
    goto LABEL_62;
  }
  result = (__CFData *)asn1_abort();
LABEL_158:
  __break(1u);
  return result;
}

void sub_1A952238C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  uint64_t v50;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 224), 8);
  _Unwind_Resume(a1);
}

CFDataRef _CreateLightPCSObject(uint64_t a1, const void **a2)
{
  CFDataRef Copy;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFData *PublicKey;
  unint64_t v13;
  size_t v14;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  uint64_t v17;
  int v18;
  const UInt8 *BytePtr;
  rsize_t v20;
  uint64_t v21;
  _BYTE v23[16];
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = 0;
  if (*(_DWORD *)(a1 + 204))
  {
    _PCSError(a2, 64, CFSTR("Not a light object"));
    return 0;
  }
  if (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40)) != 1)
  {
    _PCSError(a2, 65, CFSTR("More than one share object"));
    return 0;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), 0, (const void **)values);
  v5 = MEMORY[0x1AF415034]();
  v6 = ccsha256_di();
  ccaes_ecb_encrypt_mode();
  v7 = (unint64_t)(cczp_bitlen() + 7) >> 3;
  CFDataGetLength(*(CFDataRef *)(a1 + 72));
  v8 = ccwrap_wrapped_size();
  v29 = &v24;
  v9 = MEMORY[0x1E0C80A78](v8);
  v30 = v23;
  MEMORY[0x1E0C80A78](v9);
  v10 = ccecb_context_size();
  v11 = MEMORY[0x1E0C80A78](v10);
  MEMORY[0x1E0C80A78](v11);
  v31 = &v23[-((v7 + 15) & 0x3FFFFFFFFFFFFFF0)];
  PublicKey = (const __CFData *)PCSPublicIdentityGetPublicKey(*((_QWORD *)values[0] + 2));
  if (PublicKey)
  {
    v27 = v8;
    v28 = v6;
    v26 = v7 + 1;
    v13 = v7 + 1 + v8;
    v14 = v13 + 2;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v13 + 2);
    if (!Mutable
      || (v25 = v13,
          MutableBytePtr = CFDataGetMutableBytePtr(Mutable),
          bzero(MutableBytePtr, v14),
          *MutableBytePtr = -1,
          ccDRBGGetRngState(),
          ccec_generate_key_fips())
      || (v33 = v7, ccDRBGGetRngState(), ccecdh_compute_shared_secret()))
    {
      PublicKey = 0;
    }
    else
    {
      PublicKey = PCSPublicIdentityCopyExportedPublicKey(*((_QWORD *)values[0] + 2));
      if (PublicKey && v7 == (unint64_t)(cczp_bitlen() + 7) >> 3)
      {
        v24 = v5;
        ccec_compact_export();
        CFDataGetLength(PublicKey);
        CFDataGetBytePtr(PublicKey);
        if (cchkdf())
          goto LABEL_22;
        ccecb_init();
        v17 = v27;
        v32 = v27;
        CFDataGetLength(*(CFDataRef *)(a1 + 72));
        CFDataGetBytePtr(*(CFDataRef *)(a1 + 72));
        v18 = ccwrap_auth_encrypt();
        ccecb_context_size();
        cc_clear();
        if (v18)
        {
LABEL_22:
          Copy = 0;
        }
        else
        {
          if (v32 != v17)
            _CreateLightPCSObject_cold_1();
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 80));
          *(_WORD *)&MutableBytePtr[v25] = *(_WORD *)BytePtr;
          Copy = CFDataCreateCopy(0, Mutable);
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
    Mutable = 0;
  }
  Copy = 0;
LABEL_16:
  cc_clear();
  if (PublicKey)
    CFRelease(PublicKey);
  v20 = (unint64_t)(cczp_bitlen() + 7) >> 3;
  v21 = cczp_bitlen();
  memset_s(v31, v20, 0, (unint64_t)(v21 + 7) >> 3);
  memset_s(v30, 0x10uLL, 0, 0x10uLL);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

BOOL FillOctetString(CFIndex *a1, CFDataRef theData)
{
  size_t Length;
  void *v5;
  const UInt8 *BytePtr;
  size_t v7;

  Length = CFDataGetLength(theData);
  v5 = malloc_type_malloc(Length, 0x2408A2FBuLL);
  a1[1] = (CFIndex)v5;
  if (v5)
  {
    BytePtr = CFDataGetBytePtr(theData);
    v7 = CFDataGetLength(theData);
    memcpy(v5, BytePtr, v7);
    *a1 = CFDataGetLength(theData);
  }
  return v5 != 0;
}

BOOL _PCSFPMustEncryptManateeSharingAttributes(uint64_t a1)
{
  uint64_t v2;
  int ServiceID;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 176);
  if (v2)
  {
    ServiceID = PCSIdentityGetServiceID(v2);
    if (!ServiceID)
      return 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 160);
    if (!v4)
      return 0;
    ServiceID = PCSPublicIdentityGetServiceID(v4);
    if (!ServiceID)
      return 0;
  }
  return PCSServiceItemAnonymousSharingByIndex(ServiceID);
}

unsigned int *PCSReplaceOrUpdateAttribute(unsigned int *result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *result;
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = *((_QWORD *)result + 1);
    v6 = 24 * v3;
    while (*(_DWORD *)(v5 + v4) != a2)
    {
      v4 += 24;
      if (v6 == v4)
        goto LABEL_5;
    }
    free(*(void **)(v5 + v4 + 16));
    return (unsigned int *)der_copy_octet_string();
  }
  else
  {
LABEL_5:
    if (*(_QWORD *)(a3 + 8))
      return (unsigned int *)add_PCSAttributes(result);
  }
  return result;
}

uint64_t getObjectKey(uint64_t a1)
{
  uint64_t result;
  const void *v3;

  result = *(_QWORD *)(a1 + 88);
  if (!result)
  {
    result = *(_QWORD *)(a1 + 96);
    if (result)
    {
      result = PCSKeyCreateKeyFromRandomData(result, "full master key");
      *(_QWORD *)(a1 + 88) = result;
      v3 = *(const void **)(a1 + 96);
      if (v3)
      {
        *(_QWORD *)(a1 + 96) = 0;
        CFRelease(v3);
        return *(_QWORD *)(a1 + 88);
      }
    }
  }
  return result;
}

BOOL CreateSignature(uint64_t a1, const __CFData *a2, const __CFData *a3, _DWORD *a4, _DWORD *a5, size_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, const void **a10)
{
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t ObjectKey;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFData *v28;
  __CFData *v29;
  unsigned int v30;
  int v31;
  _DWORD *v32;
  void *v33;
  size_t v34;
  void *v35;
  __CFData *v36;
  _BOOL8 Hmac;
  uint64_t Key;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[8];
  const void **v44;
  size_t *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _OWORD v49[5];
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  memset(v49, 0, sizeof(v49));
  if (!a7)
  {
    v36 = 0;
LABEL_30:
    Hmac = makeHmac(a1, a2, a3, a7, a6);
LABEL_31:
    if (!v36)
    {
LABEL_33:
      free_PCSObjectSignature();
      return Hmac;
    }
LABEL_32:
    CFRelease(v36);
    goto LABEL_33;
  }
  v45 = a6;
  v46 = a8;
  v16 = (uint64_t *)ccsha256_di();
  v47 = v43;
  MEMORY[0x1E0C80A78](v16);
  v18 = &v43[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v48 = 0;
  ObjectKey = getObjectKey(a1);
  if ((*(_DWORD *)(a1 + 204) & 0xFFFFFFFE) != 2)
    PCSAbort("unexpected version:sp->version == VERSION2 || sp->version == VERSION1_5", v20, v21, v22, v23, v24, v25, v26, v43[0]);
  v27 = ObjectKey;
  if (!ObjectKey)
    PCSAbort("no object key:objectKey", v20, v21, v22, v23, v24, v25, v26, v43[0]);
  v28 = _PCSKeyCopyExportedPublicKey(ObjectKey);
  if (v28)
  {
    v29 = v28;
    v44 = a10;
    DWORD2(v49[0]) = 1;
    FillOctetString((CFIndex *)&v49[1] + 1, v28);
    CFRelease(v29);
    if (a4)
    {
      if (*a4)
      {
        *(_QWORD *)&v51 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
        if (!(_QWORD)v51 || copy_PCSSPKeyList())
          goto LABEL_50;
      }
    }
    if (a5)
    {
      if (*a5)
      {
        *((_QWORD *)&v51 + 1) = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
        if (!*((_QWORD *)&v51 + 1) || copy_PCSAttributes())
          goto LABEL_50;
      }
    }
    v30 = *(_DWORD *)(a1 + 124);
    v31 = *(_DWORD *)(a1 + 120) + 1;
    *(_DWORD *)(a1 + 120) = v31;
    *(_QWORD *)&v49[0] = __PAIR64__(v30, v31);
    if (*(_BYTE *)(a1 + 214))
      DWORD1(v49[0]) = v30 | 3;
    if (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 112)))
    {
      v32 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
      *(_QWORD *)&v50 = v32;
      if (!v32)
        goto LABEL_50;
      *v32 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 112));
    }
    _PCSMakeDigest((uint64_t)v16, a2, a3, (uint64_t)v49, (uint64_t)v18);
    if (_PCSSignHash(v27, 0, 1, *v16, (uint64_t)v18, (uint64_t)&v49[2] + 8))
    {
      if (!*(_QWORD *)(a1 + 104))
        goto LABEL_22;
      v33 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040EC46ECBEuLL);
      *((_QWORD *)&v50 + 1) = v33;
      if (v33)
      {
        if (!_PCSSignHash(*(_QWORD *)(a1 + 104), 0, 1, *v16, (uint64_t)v18, (uint64_t)v33))
        {
LABEL_26:
          v36 = 0;
LABEL_27:
          Hmac = 0;
          goto LABEL_31;
        }
LABEL_22:
        v34 = length_PCSObjectSignature();
        *(_QWORD *)a7 = v34;
        v35 = malloc_type_malloc(v34, 0xF3205574uLL);
        *(_QWORD *)(a7 + 8) = v35;
        if (!v35)
        {
LABEL_25:
          free_PCSObjectSignature();
          goto LABEL_26;
        }
        if (encode_PCSObjectSignature())
        {
          free(*(void **)(a7 + 8));
          *(_QWORD *)(a7 + 8) = 0;
          goto LABEL_25;
        }
        free_PCSObjectSignature();
        if (*(_QWORD *)a7 != v48)
          abort();
        if (v46)
        {
          Key = _PCSIdentityGetKey(*(_QWORD *)(a1 + 176));
          if (!Key)
            goto LABEL_26;
          v40 = Key;
          v36 = _PCSKeyCopyExportedPublicKey(Key);
          if (!v36)
            goto LABEL_52;
          if (!_PCSSignHash(v40, v36, 1, *v16, (uint64_t)v18, v46))
            goto LABEL_49;
        }
        else
        {
          v36 = 0;
        }
        if (!a9)
        {
LABEL_48:
          a6 = v45;
          goto LABEL_30;
        }
        v41 = _PCSIdentityGetKey(*(_QWORD *)(a1 + 184));
        if (!v41)
        {
          _PCSError(v44, 142, CFSTR("PCSShareProtection missing signing identity; cannot generate pppcs signature"));
          goto LABEL_27;
        }
        v42 = v41;
        if (v36)
          CFRelease(v36);
        v36 = _PCSKeyCopyExportedPublicKey(v42);
        if (v36)
        {
          if (!_PCSSignHash(v42, v36, 1, *v16, (uint64_t)v18, a9))
          {
LABEL_49:
            Hmac = 0;
            goto LABEL_32;
          }
          goto LABEL_48;
        }
LABEL_52:
        _PCSErrorOOM(v44);
        goto LABEL_27;
      }
LABEL_50:
      _PCSErrorOOM(v44);
      goto LABEL_26;
    }
  }
  return 0;
}

__CFData *PCSFPCopyExported(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _PCSFPCopyExportedWithOptions(a1, 0, 0, 0, a2, a6, a7, a8);
}

_DWORD *PCSFPCreateWithExported(const void *a1, uint64_t a2, const void **a3)
{
  CFTypeRef Mutable;
  const void *v7;
  _DWORD *v8;

  if (!a2)
  {
    _PCSError(a3, 27, CFSTR("PCSFPCreateWithExported need an identity"));
    return 0;
  }
  Mutable = PCSIdentitySetCreateMutable(a3);
  if (!Mutable)
    return 0;
  v7 = Mutable;
  if (PCSIdentitySetAddIdentity((uint64_t)Mutable, a2))
    v8 = CreateWithExportedInternal(a1, (uint64_t)v7, 0, 0, 0, 0, 0, a3);
  else
    v8 = 0;
  CFRelease(v7);
  return v8;
}

_DWORD *CreateWithExportedInternal(const void *a1, uint64_t a2, void *a3, int a4, char a5, void *a6, void *a7, const void **a8)
{
  id v12;
  CFTypeID v13;
  CFMutableArrayRef Mutable;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  _QWORD *Empty;
  const UInt8 *BytePtr;
  const __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  int *v27;
  int v28;
  CFTypeRef v29;
  const void *v30;
  const void *v31;
  const void *PublicID;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  const __CFData *v41;
  int v42;
  const void *v43;
  const void *v44;
  const void *SigningIdentity;
  const void *v46;
  const void *v47;
  _QWORD *v48;
  int ServiceID;
  uint64_t ServiceName;
  const void *v51;
  const void *v52;
  const void *v53;
  uint64_t v54;
  const __CFData *v55;
  __CFData *v56;
  uint64_t v57;
  CFDataRef v58;
  __CFData *v59;
  _DWORD *v60;
  CFIndex v61;
  __CFData *v62;
  CFDataRef v63;
  uint64_t v64;
  unsigned int *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFData *v69;
  const __CFData *v70;
  _QWORD *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t i;
  uint64_t v75;
  unint64_t v76;
  CFDataRef v77;
  CFIndex Length;
  const UInt8 *v79;
  CFDataRef v80;
  uint64_t *v81;
  const void *v82;
  __CFData *KeyIDFromKey;
  __CFData *v84;
  const __CFData *v85;
  uint64_t v86;
  _DWORD *v87;
  uint64_t v88;
  unint64_t v89;
  const __CFAllocator *v90;
  const __CFData *v91;
  const void *v92;
  _DWORD *v93;
  uint64_t v94;
  unint64_t v95;
  const __CFData *v96;
  __CFData *v97;
  __CFData *v98;
  _QWORD *v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const __CFData *v107;
  CFTypeRef v108;
  const __CFData *v109;
  CFTypeRef v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _Unwind_Exception *v119;
  char v120;
  void *v121;
  const __CFAllocator *bytesDeallocator;
  void *v124;
  id v125;
  __CFArray *theArray;
  __int128 context;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[9];
  int v137;
  uint64_t v138;
  _DWORD *v139;
  uint64_t v140;
  _DWORD *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  unsigned int *v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;

  v12 = a6;
  v125 = a7;
  v138 = 0;
  v139 = 0;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0;
  v140 = 0;
  v141 = 0;
  if (!a1 || (v13 = CFGetTypeID(a1), v13 != CFDataGetTypeID()) || CFDataGetLength((CFDataRef)a1) < 1)
  {
    v124 = v12;
    v17 = 0;
    v58 = 0;
    v59 = 0;
    Mutable = 0;
LABEL_181:
    v60 = 0;
    goto LABEL_157;
  }
  if (*CFDataGetBytePtr((CFDataRef)a1) == 255)
  {
    v148 = 0;
    v149 = &v148;
    v150 = 0x2020000000;
    v151 = 0;
    Empty = __PCSShareProtectionCreateEmpty(a8);
    v149[3] = (uint64_t)Empty;
    if (Empty)
    {
      if (CFDataGetLength((CFDataRef)a1) >= 4)
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)a1);
        if (*BytePtr == 255)
        {
          if (a2)
          {
            v21 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(a2, 0);
            *(_QWORD *)&context = MEMORY[0x1E0C809B0];
            *((_QWORD *)&context + 1) = 3221225472;
            *(_QWORD *)&v130 = __CreateLightObject_block_invoke;
            *((_QWORD *)&v130 + 1) = &unk_1E553E1F8;
            *(_QWORD *)&v131 = &v148;
            *((_QWORD *)&v131 + 1) = a1;
            *(_QWORD *)&v132 = BytePtr;
            CFDictionaryApplyFunction(v21, (CFDictionaryApplierFunction)apply_block_2_1, &context);
            v22 = v149[3];
            if (*(_QWORD *)(v22 + 72))
            {
              *(_BYTE *)(v22 + 208) = 1;
LABEL_107:
              *(_DWORD *)(v22 + 204) = 0;
              v60 = CFRetain((CFTypeRef)v22);
              goto LABEL_108;
            }
            noMatchingIdentity(a2, 0, a8);
            v60 = 0;
LABEL_108:
            v82 = (const void *)v149[3];
            if (v82)
            {
              v149[3] = 0;
              CFRelease(v82);
            }
            if (v21)
              CFRelease(v21);
            _Block_object_dispose(&v148, 8);
            if (v60)
              goto LABEL_166;
            goto LABEL_5;
          }
          Length = CFDataGetLength((CFDataRef)a1);
          v79 = CFDataGetBytePtr((CFDataRef)a1);
          v80 = CFDataCreate(0, &v79[Length - 2], 2);
          v81 = v149;
          *(_QWORD *)(v149[3] + 80) = v80;
          v22 = v81[3];
          if (*(_QWORD *)(v22 + 80))
          {
            v21 = 0;
            goto LABEL_107;
          }
          _PCSErrorOOM(a8);
        }
      }
    }
    v21 = 0;
    v60 = 0;
    goto LABEL_108;
  }
LABEL_5:
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v124 = v12;
  if (!Mutable)
  {
    _PCSErrorOOM(a8);
LABEL_179:
    v17 = 0;
    goto LABEL_180;
  }
  CFDataGetBytePtr((CFDataRef)a1);
  CFDataGetLength((CFDataRef)a1);
  v15 = decode_PCSShareProtection();
  if ((_DWORD)v15)
  {
    _PCSErrorASN1(a8, (uint64_t)"decode PCSShareProtection", v15);
    goto LABEL_179;
  }
  v121 = a3;
  v16 = __PCSShareProtectionCreateEmpty(0);
  v17 = (uint64_t)v16;
  if (!v16)
    goto LABEL_180;
  if (*((_QWORD *)&v144 + 1))
  {
    if (**((_DWORD **)&v144 + 1) == 4)
    {
      v18 = 3;
    }
    else
    {
      if (**((_DWORD **)&v144 + 1) != 5)
        goto LABEL_21;
      v18 = 2;
    }
  }
  else
  {
    v18 = 1;
  }
  *((_DWORD *)v16 + 51) = v18;
LABEL_21:
  theArray = Mutable;
  if (DWORD2(v142))
  {
    v23 = 0;
    v24 = 0;
    bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    do
    {
      v25 = v143;
      v26 = (_DWORD *)(v143 + v23);
      v27 = *(int **)(v143 + v23 + 48);
      if (v27)
        v28 = *v27;
      else
        v28 = 0;
      v29 = _PCSPublicIdentityCreateWithPCSSPKey((unsigned int *)(v143 + v23), a8);
      *(_QWORD *)&context = 0;
      *((_QWORD *)&context + 1) = &context;
      v130 = 0x2020000000uLL;
      v148 = 0;
      v149 = &v148;
      v150 = 0x2020000000;
      v151 = 0;
      if (!v29)
        goto LABEL_169;
      v30 = v29;
      CFArrayAppendValue(theArray, v29);
      v31 = (const void *)ShareEntryCreate(v30, v28);
      PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)v30);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v17 + 40), PublicID, v31);
      if (v31)
        CFRelease(v31);
      if (a2 && !*(_QWORD *)(v17 + 72))
      {
        if ((*v26 - 7) < 2
          || (_PCSPublicIdentityIsDiversified((uint64_t)v30) | ((v28 & 4) >> 2)) == 1)
        {
          v39 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(a2, 0);
          v40 = v39;
          if (!v39)
          {
            _PCSError(a8, 27, CFSTR("diversified keys needs a non empty set"));
LABEL_169:
            _Block_object_dispose(&v148, 8);
            _Block_object_dispose(&context, 8);
LABEL_71:
            v58 = 0;
            v59 = 0;
            goto LABEL_72;
          }
          v136[0] = MEMORY[0x1E0C809B0];
          v136[1] = 3221225472;
          v136[2] = __CreateWithExportedInternal_block_invoke;
          v136[3] = &unk_1E553E1D0;
          v136[4] = &context;
          v136[5] = &v148;
          v136[6] = v25 + v23;
          v137 = v28;
          v136[7] = v17;
          v136[8] = PublicID;
          CFDictionaryApplyFunction(v39, (CFDictionaryApplierFunction)apply_block_2_1, v136);
          CFRelease(v40);
        }
        else
        {
          v54 = PCSIdentitySetCopyIdentity(a2, (uint64_t)PublicID);
          v149[3] = v54;
          if (v54)
          {
            v55 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(v25 + v23 + 40), *(_QWORD *)(v25 + v23 + 32), bytesDeallocator);
            v56 = _PCSIdentityCopyUnwappedKey(v149[3], v55, a8);
            *(_QWORD *)(*((_QWORD *)&context + 1) + 24) = v56;
            if (v55)
              CFRelease(v55);
          }
          else if (v125)
          {
            objc_msgSend(v125, "addObject:", PublicID);
          }
        }
      }
      v41 = *(const __CFData **)(*((_QWORD *)&context + 1) + 24);
      if (v41)
      {
        v42 = *(_DWORD *)(v17 + 204);
        if (v42 != 3 || (v28 & 1) != 0)
        {
          if (v42 == 3)
          {
            *(_BYTE *)(v17 + 209) = 1;
            *(_QWORD *)(v17 + 72) = v41;
          }
          else
          {
            *(_QWORD *)(v17 + 72) = v41;
            generateObjectKey((_QWORD *)v17, v41, 0);
          }
        }
        else
        {
          generateOtherKeysFromRWMasterKey(v17, v41, v33, v34, v35, v36, v37, v38);
          CFRelease(*(CFTypeRef *)(*((_QWORD *)&context + 1) + 24));
        }
        v43 = *(const void **)(v17 + 176);
        if (v43)
        {
          *(_QWORD *)(v17 + 176) = 0;
          CFRelease(v43);
        }
        *(_QWORD *)(v17 + 176) = CFRetain((CFTypeRef)v149[3]);
        v44 = *(const void **)(v17 + 184);
        if (v44)
        {
          *(_QWORD *)(v17 + 184) = 0;
          CFRelease(v44);
        }
        SigningIdentity = (const void *)_PCSIdentityGetSigningIdentity(v149[3]);
        v46 = SigningIdentity;
        if (SigningIdentity)
          CFRetain(SigningIdentity);
        *(_QWORD *)(v17 + 184) = v46;
        v47 = *(const void **)(v17 + 144);
        if (v47)
        {
          *(_QWORD *)(v17 + 144) = 0;
          CFRelease(v47);
        }
        v48 = PCSIdentityCopyPublicIdentity(v149[3]);
        *(_QWORD *)(v17 + 144) = v48;
        if (!v48)
        {
          _PCSErrorOOM(a8);
          goto LABEL_169;
        }
        ServiceID = a4;
        if (!a4)
          ServiceID = PCSIdentityGetServiceID(*(_QWORD *)(v17 + 176));
        *(_DWORD *)(v17 + 200) = ServiceID;
        ServiceName = PCSIdentityGetServiceName(v149[3]);
        v51 = _PCSIdentitySetCopyCurrentIdentityInternal(a2, ServiceName, 0);
        v52 = v51;
        if (v51)
        {
          if (!CFEqual(v51, (CFTypeRef)v149[3]))
          {
            *(_BYTE *)(v17 + 211) = 1;
            PCSIdentitySetRepairCurrentIdentity(a2, ServiceName, (uint64_t)v52, 0);
          }
          CFRelease(v52);
        }
        if ((v28 & 2) != 0)
          *(_BYTE *)(v17 + 213) = 1;
      }
      v53 = (const void *)v149[3];
      if (v53)
      {
        v149[3] = 0;
        CFRelease(v53);
      }
      CFRelease(v30);
      _Block_object_dispose(&v148, 8);
      _Block_object_dispose(&context, 8);
      ++v24;
      v23 += 56;
    }
    while (v24 < DWORD2(v142));
  }
  v57 = *(_QWORD *)(v17 + 72);
  if (a2 && !v57)
  {
    noMatchingIdentity(a2, v17, a8);
    goto LABEL_71;
  }
  Mutable = theArray;
  if (!v57)
  {
    if (!(_QWORD)v146
      || (v63 = CFDataCreate(0, *(const UInt8 **)(v146 + 8), *(_QWORD *)v146), (*(_QWORD *)(v17 + 80) = v63) != 0))
    {
      if (*((_QWORD *)&v144 + 1))
      {
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        context = 0u;
        v64 = decode_PCSObjectSignature();
        if ((_DWORD)v64)
        {
          _PCSErrorASN1(a8, (uint64_t)"decode PCSObjectSignature", v64);
          goto LABEL_71;
        }
        *(_QWORD *)(v17 + 48) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        v65 = (unsigned int *)v135;
        if ((_QWORD)v135)
        {
          v66 = 0;
          v67 = -1;
          do
          {
            if (++v67 >= (unint64_t)*v65)
              break;
            v68 = *((_QWORD *)v65 + 1);
            if (*(_DWORD *)(v68 + v66) != 3)
              goto LABEL_71;
            v69 = CFDataCreate(0, *(const UInt8 **)(v68 + v66 + 24), *(_QWORD *)(v68 + v66 + 16));
            if (!v69)
              goto LABEL_175;
            v70 = v69;
            v71 = PCSPublicIdentityCreateFromKeyData(v69, a8);
            CFRelease(v70);
            if (!v71)
              goto LABEL_176;
            v66 += 32;
            CFArrayAppendValue(*(CFMutableArrayRef *)(v17 + 48), v71);
            CFRelease(v71);
            v65 = (unsigned int *)v135;
          }
          while ((_QWORD)v135);
        }
        if (*((_QWORD *)&v135 + 1))
        {
          if (copy_PCSAttributes())
          {
LABEL_175:
            _PCSErrorOOM(a8);
LABEL_176:
            free_PCSObjectSignature();
            goto LABEL_71;
          }
          v72 = *((_QWORD *)&v135 + 1);
          v73 = **((_DWORD **)&v135 + 1);
          if ((_DWORD)v73)
          {
            for (i = 0; i < v73; ++i)
            {
              if (*(_DWORD *)(*(_QWORD *)(v72 + 8) + 24 * i) == 5)
              {
                v148 = 0;
                v149 = 0;
                if (decode_PCSMasterKeyIDs())
                  goto LABEL_175;
                if ((_DWORD)v148)
                {
                  v75 = 0;
                  v76 = 0;
                  do
                  {
                    v77 = CFDataCreate(0, (const UInt8 *)v149[v75 + 1], v149[v75]);
                    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(v17 + 112), v77, v77);
                    if (v77)
                      CFRelease(v77);
                    ++v76;
                    v75 += 2;
                  }
                  while (v76 < v148);
                }
                free_PCSMasterKeyIDs();
                v72 = *((_QWORD *)&v135 + 1);
                v73 = **((_DWORD **)&v135 + 1);
              }
            }
          }
        }
        free_PCSObjectSignature();
      }
      v58 = 0;
      v59 = 0;
      goto LABEL_138;
    }
    _PCSErrorOOM(a8);
    goto LABEL_180;
  }
  *(_QWORD *)&context = 0;
  v61 = length_PCSSignedShareProtection();
  v62 = CFDataCreateMutable(0, v61);
  if (!v62)
  {
LABEL_180:
    v58 = 0;
    v59 = 0;
    goto LABEL_181;
  }
  v59 = v62;
  CFDataSetLength(v62, v61);
  CFDataGetMutableBytePtr(v59);
  if (encode_PCSSignedShareProtection())
  {
    CFRelease(v59);
    goto LABEL_180;
  }
  if (v61 != (_QWORD)context)
  {
    v119 = (_Unwind_Exception *)asn1_abort();
    _Block_object_dispose(&v148, 8);
    _Block_object_dispose(&context, 8);
    _Unwind_Resume(v119);
  }
  if ((_QWORD)v144)
    v58 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(v144 + 8), *(_QWORD *)v144, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  else
    v58 = 0;
  KeyIDFromKey = CreateKeyIDFromKey(*(const __CFData **)(v17 + 72));
  *(_QWORD *)(v17 + 80) = KeyIDFromKey;
  if (!KeyIDFromKey)
    goto LABEL_72;
  if ((_QWORD)v144)
  {
    v84 = PCSFPCopyDecryptedData(v17, 0, 0, v58, a8);
    if (!v84)
      goto LABEL_72;
    v85 = v84;
    CFDataGetBytePtr(v84);
    CFDataGetLength(v85);
    v86 = decode_PCSEncryptedKeys();
    CFRelease(v85);
    if ((_DWORD)v86)
    {
      _PCSErrorASN1(a8, (uint64_t)"decode PCSEncryptedKeys", v86);
      goto LABEL_72;
    }
    v87 = v141;
    if (v141 && *v141)
    {
      v88 = 0;
      v89 = 0;
      v90 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
      do
      {
        v91 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(*((_QWORD *)v87 + 1) + v88 + 24), *(_QWORD *)(*((_QWORD *)v87 + 1) + v88 + 16), v90);
        v92 = PCSIdentityCreateFromData(v91, 0);
        if (v91)
          CFRelease(v91);
        if (!v92)
          goto LABEL_72;
        PCSIdentitySetAddIdentity(*(_QWORD *)(v17 + 16), (uint64_t)v92);
        CFRelease(v92);
        ++v89;
        v87 = v141;
        v88 += 32;
      }
      while (v89 < *v141);
    }
    v93 = v139;
    if (v139 && *v139)
    {
      v94 = 0;
      v95 = 0;
      do
      {
        v96 = CFDataCreate(0, *(const UInt8 **)(*((_QWORD *)v93 + 1) + v94 + 8), *(_QWORD *)(*((_QWORD *)v93 + 1) + v94));
        v97 = CreateKeyIDFromKey(v96);
        if (!v97)
        {
          if (v96)
            CFRelease(v96);
          goto LABEL_72;
        }
        v98 = v97;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v17 + 112), v97, v96);
        CFRelease(v98);
        if (v96)
          CFRelease(v96);
        ++v95;
        v93 = v139;
        v94 += 16;
      }
      while (v95 < *v139);
    }
  }
  if ((*(_DWORD *)(v17 + 204) & 0xFFFFFFFE) == 2)
    v99 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 16);
  else
    v99 = 0;
  Mutable = theArray;
  if (!ValidateSignature(v17, v59, v58, &v145, v99, theArray, *((CFIndex *)&v146 + 1), *((unsigned int **)&v143 + 1), v147, a5 ^ 1u, v121, v124, a8))goto LABEL_181;
  *(_BYTE *)(v17 + 208) = 1;
LABEL_138:
  v100 = *(unsigned int *)(v17 + 128);
  if (!(_DWORD)v100)
  {
LABEL_156:
    v60 = CFRetain((CFTypeRef)v17);
    Mutable = theArray;
    if (v60[54] != 1192348414)
      PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(spret)->alive == pcsfpTruelyAlive", v111, v112, v113, v114, v115, v116, v117, v120);
    goto LABEL_157;
  }
  v101 = 0;
  v102 = 0;
  while (1)
  {
    v103 = *(_QWORD *)(v17 + 136);
    if (*(_DWORD *)(v103 + v101) != 4)
      goto LABEL_155;
    v104 = v103 + v101;
    context = 0u;
    v130 = 0u;
    v148 = 0;
    v105 = decode_PCSObjectChaining();
    if ((_DWORD)v105)
      break;
    if (v148 != *(_QWORD *)(v104 + 8))
      abort();
    if ((_QWORD)v130 && *(_QWORD *)v130)
    {
      v106 = *(_DWORD *)(v17 + 204) <= 2u ? 72 : 64;
      v107 = *(const __CFData **)(v17 + v106);
      if (v107)
      {
        v108 = ProcessChainKeys(v107, v130, a8);
        *(_QWORD *)(v17 + 24) = v108;
        if (!v108)
          goto LABEL_171;
      }
    }
    if (*((_QWORD *)&v130 + 1))
    {
      if (**((_QWORD **)&v130 + 1))
      {
        v109 = *(const __CFData **)(v17 + 72);
        if (v109)
        {
          v110 = ProcessChainKeys(v109, *((uint64_t *)&v130 + 1), a8);
          *(_QWORD *)(v17 + 32) = v110;
          if (!v110)
            goto LABEL_171;
        }
      }
    }
    free_PCSObjectChaining();
    v100 = *(unsigned int *)(v17 + 128);
LABEL_155:
    ++v102;
    v101 += 24;
    if (v102 >= v100)
      goto LABEL_156;
  }
  _PCSErrorASN1(a8, (uint64_t)"decode PCSObjectChaining", v105);
LABEL_171:
  free_PCSObjectChaining();
LABEL_72:
  v60 = 0;
  Mutable = theArray;
LABEL_157:
  free_PCSEncryptedKeys();
  free_PCSShareProtection();
  if (Mutable)
    CFRelease(Mutable);
  if (v59)
    CFRelease(v59);
  if (v58)
    CFRelease(v58);
  if (v17)
    CFRelease((CFTypeRef)v17);
  v12 = v124;
LABEL_166:

  return v60;
}

_DWORD *PCSFPCopyRecoverPCS(const void *a1, const void **a2)
{
  return CreateWithExportedInternal(a1, 0, 0, 0, 0, 0, 0, a2);
}

_DWORD *PCSObjectCreateFromExportedWithIdentities(uint64_t a1, const void *a2, const void **a3)
{
  return PCSObjectCreateFromExportedWithIdentitiesAndOptions(a1, (int)a2, a2, a3);
}

_DWORD *PCSObjectCreateFromExportedWithIdentitiesAndOptions(uint64_t a1, int a2, const void *a3, const void **a4)
{
  uint64_t v4;
  uint64_t v5;

  if (a1)
    return CreateWithExportedInternal(a3, a1, 0, 0, 0, 0, 0, a4);
  _PCSError(a4, 27, CFSTR("PCSFPCreateWithExported need an identity"), v4, v5);
  return 0;
}

void PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync(const void *a1, void *a2, const void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  dispatch_block_t v10;
  const void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  const void *v15;
  const void *v16;
  const void *v17;

  v7 = a2;
  v8 = a4;
  if (a1 && a3)
  {
    if (PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_once != -1)
      dispatch_once(&PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_once, &__block_literal_global_6);
    CFRetain(a1);
    CFRetain(a3);
    v9 = PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_2;
    block[3] = &unk_1E553E0F8;
    v15 = a1;
    v16 = a3;
    v13 = v7;
    v14 = v8;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);

  }
  else
  {
    v17 = 0;
    _PCSError(&v17, 27, CFSTR("identities and data required"));
    (*((void (**)(id, _QWORD, const void *))v8 + 2))(v8, 0, v17);
    v11 = v17;
    if (v17)
    {
      v17 = 0;
      CFRelease(v11);
    }
  }

}

_DWORD *PCSObjectCreateFromExportedWithKeyedPCS(uint64_t a1, const void *a2, const void **a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
    return CreateWithExportedInternal(a2, v3, *(void **)(a1 + 168), *(_DWORD *)(a1 + 200), 0, 0, 0, a3);
  else
    return 0;
}

_DWORD *PCSObjectCreateFromExportedWithKeyedPCSAndOptions(uint64_t a1, uint64_t a2, const void *a3, const void **a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
    return CreateWithExportedInternal(a3, v4, *(void **)(a1 + 168), *(_DWORD *)(a1 + 200), 0, 0, 0, a4);
  else
    return 0;
}

_DWORD *PCSObjectCreateFromExportedWithKeyedPCSAndOptionsWithTrusts(uint64_t a1, uint64_t a2, const void *a3, void *a4, const void **a5)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
    return CreateWithExportedInternal(a3, v5, *(void **)(a1 + 168), *(_DWORD *)(a1 + 200), 0, a4, 0, a5);
  else
    return 0;
}

CFMutableArrayRef PCSFPCopyKeyIDs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFMutableArrayRef Mutable;
  uint64_t v10;
  char v12;
  _QWORD v13[5];

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v12);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v10 = *(_QWORD *)(a1 + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __PCSFPCopyKeyIDs_block_invoke;
  v13[3] = &__block_descriptor_40_e21_v16__0____CFString__8l;
  v13[4] = Mutable;
  PCSIdentitySetEnumeratePublicKeys(v10, v13);
  return Mutable;
}

uint64_t PCSFPCopyPublicIdentities(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  uint64_t v10;
  char v12;
  _QWORD context[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  CFMutableArrayRef Mutable;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  Mutable = 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v2, v3, v4, v5, v6, v7, v8, v12);
  v9 = *(const __CFDictionary **)(a1 + 40);
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __PCSFPCopyPublicIdentities_block_invoke;
  context[3] = &unk_1E553DE90;
  context[4] = &v14;
  CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)apply_block_2_1, context);
  v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v10;
}

void sub_1A9524810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PCSFPEnumeratePublicIdentities(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  id v12;
  char v13;
  _QWORD context[4];
  id v15;

  v3 = a2;
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", v4, v5, v6, v7, v8, v9, v10, v13);
  v11 = *(const __CFDictionary **)(a1 + 40);
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = ___PCSFPEnumeratePublicIdentities_block_invoke;
  context[3] = &unk_1E553E140;
  v15 = v3;
  v12 = v3;
  CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)apply_block_2_1, context);

}

uint64_t PCSFPAddPublicIdentityWithShareFlags(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v11;
  uint64_t result;
  const void *v13;
  __CFDictionary *v14;
  const void *PublicID;
  char v16;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v16);
  if (!a2)
    return 0;
  v9 = a3;
  v11 = *(_DWORD *)(a1 + 204);
  if (v11)
  {
    if (v11 == 3 && *(_BYTE *)(a1 + 209))
      return 0;
  }
  else if (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40)) > 0)
  {
    return 0;
  }
  result = ShareEntryCreate(a2, v9);
  if (result)
  {
    v13 = (const void *)result;
    v14 = *(__CFDictionary **)(a1 + 40);
    PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)a2);
    CFDictionarySetValue(v14, PublicID, v13);
    CFRelease(v13);
    return 1;
  }
  return result;
}

uint64_t ShareEntryCreate(const void *a1, int a2)
{
  uint64_t Instance;

  ShareEntryGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = CFRetain(a1);
    *(_DWORD *)(Instance + 24) = a2;
  }
  return Instance;
}

BOOL PCSFPAddCurrentIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v12;
  _QWORD *v13;
  const void *v14;
  uint64_t v15;
  _BOOL8 v16;
  const void *v17;
  __CFDictionary *v18;
  const void *PublicID;
  char v21;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v21);
  v8 = a4;
  v12 = *(_DWORD *)(a1 + 204);
  if (v12)
  {
    if (v12 == 3 && *(_BYTE *)(a1 + 209))
      return 0;
  }
  else if (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40)) > 0)
  {
    return 0;
  }
  v13 = PCSIdentitySetCopyCurrentPublicIdentityWithError(a2, a3, 0);
  if (!v13)
    return 0;
  v14 = v13;
  v15 = ShareEntryCreate(v13, v8);
  v16 = v15 != 0;
  if (v15)
  {
    v17 = (const void *)v15;
    v18 = *(__CFDictionary **)(a1 + 40);
    PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)v14);
    CFDictionarySetValue(v18, PublicID, v17);
    CFRelease(v17);
  }
  CFRelease(v14);
  return v16;
}

uint64_t PCSFPAddEncryptedSharePCS(int a1, CFDataRef theData, uint64_t a3, const void **a4)
{
  uint64_t v6;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v6 = decode_PCSShareProtection();
  if ((_DWORD)v6)
    _PCSErrorASN1(a4, (uint64_t)"decode PCSShareProtection", v6);
  else
    CFDataGetLength(theData);
  free_PCSShareProtection();
  free_PCSObjectSignature();
  return 0;
}

uint64_t PCSFPAddPublicIdentity(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PCSFPAddPublicIdentityWithShareFlags(a1, a2, 0, a4, a5, a6, a7, a8);
}

uint64_t PCSFPRemovePublicIdentity(uint64_t a1, uint64_t a2)
{
  __CFDictionary *v3;
  const void *PublicID;

  if (*(_DWORD *)(a1 + 204) == 3 && *(_BYTE *)(a1 + 209))
    return 0;
  v3 = *(__CFDictionary **)(a1 + 40);
  PublicID = (const void *)PCSPublicIdentityGetPublicID(a2);
  CFDictionaryRemoveValue(v3, PublicID);
  return 1;
}

uint64_t PCSFPAddSharePCSWithFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  const void *v11;
  const void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v21;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v21);
  if (!*(_QWORD *)(a1 + 72) || *(_DWORD *)(a1 + 204) == 3 && *(_BYTE *)(a1 + 209))
    return 0;
  v11 = PCSIdentitySetCopyCurrentIdentityWithError(*(_QWORD *)(a2 + 16), kPCSServiceRaw, 0);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = PCSIdentityCopyPublicIdentity((uint64_t)v11);
  if (v13)
  {
    v19 = v13;
    v10 = PCSFPAddPublicIdentityWithShareFlags(a1, v13, a3, v14, v15, v16, v17, v18);
    CFRelease(v12);
    v12 = v19;
  }
  else
  {
    v10 = 0;
  }
  CFRelease(v12);
  return v10;
}

uint64_t PCSFPAddSharePCS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PCSFPAddSharePCSWithFlags(a1, a2, 0, a4, a5, a6, a7, a8);
}

uint64_t PCSFPRemoveSharePCS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  const void *v10;
  char v11;
  _QWORD context[5];

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v11);
  if (!*(_QWORD *)(a1 + 72) || *(_DWORD *)(a1 + 204) == 3 && *(_BYTE *)(a1 + 209))
    return 0;
  result = PCSIdentitySetCopyIdentities(*(_QWORD *)(a2 + 16), 0);
  if (result)
  {
    v10 = (const void *)result;
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSFPRemoveSharePCS_block_invoke;
    context[3] = &__block_descriptor_40_e15_v24__0r_v8r_v16l;
    context[4] = a1;
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)apply_block_2_1, context);
    CFRelease(v10);
    return 1;
  }
  return result;
}

_QWORD *PCSFPCreatePrivateKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *RandomCompactRaw;
  const void *v10;
  char v12;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v12);
  if (!*(_QWORD *)(a1 + 72) || !*(_QWORD *)(a1 + 16))
    return 0;
  RandomCompactRaw = PCSIdentityCreateRandomCompactRaw(0);
  if (RandomCompactRaw)
  {
    if (!PCSIdentitySetSetCurrentIdentity(*(_QWORD *)(a1 + 16), (uint64_t)RandomCompactRaw))
    {
      v10 = RandomCompactRaw;
      RandomCompactRaw = 0;
      goto LABEL_8;
    }
    v10 = *(const void **)(a1 + 48);
    if (v10)
    {
      *(_QWORD *)(a1 + 48) = 0;
LABEL_8:
      CFRelease(v10);
    }
  }
  return RandomCompactRaw;
}

uint64_t PCSFPAddPrivateKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const void *v11;
  char v13;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v13);
  if (!*(_QWORD *)(a1 + 72))
    return 0;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    return 0;
  v11 = *(const void **)(a1 + 48);
  if (v11)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v11);
    v9 = *(_QWORD *)(a1 + 16);
  }
  return PCSIdentitySetAddIdentity(v9, a2);
}

uint64_t PCSFPSetCurrentPrivateKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const void *v11;
  char v13;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v13);
  if (!*(_QWORD *)(a1 + 72))
    return 0;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    return 0;
  v11 = *(const void **)(a1 + 48);
  if (v11)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v11);
    v9 = *(_QWORD *)(a1 + 16);
  }
  return PCSIdentitySetSetCurrentIdentity(v9, a2);
}

uint64_t PCSFPCopyPrivateKey(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1 && a2 && (v2 = *(_QWORD *)(a1 + 16)) != 0)
    return PCSIdentitySetCopyIdentity(v2, a2);
  else
    return 0;
}

uint64_t PCSFPRemovePrivateKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return 0;
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v5);
    v4 = *(_QWORD *)(a1 + 16);
  }
  return PCSIdentitySetRemoveIdentity(v4, a2);
}

uint64_t PCSFPGetChainingKeyset(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 32;
  if (a2)
    v2 = 24;
  return *(_QWORD *)(a1 + v2);
}

const void *PCSFPChainingCreateIdentity(uint64_t a1, int a2, const void **a3)
{
  uint64_t v6;
  uint64_t v7;
  const void *RandomCompactRaw;

  v6 = 32;
  if (a2)
    v6 = 24;
  v7 = *(_QWORD *)(a1 + v6);
  if (!v7 || (RandomCompactRaw = PCSIdentitySetCopyCurrentIdentityWithError(v7, kPCSServiceRaw, 0)) == 0)
  {
    RandomCompactRaw = PCSIdentityCreateRandomCompactRaw(a3);
    if (RandomCompactRaw && (PCSFPChainingSetCurrentIdentity(a1, a2, (uint64_t)RandomCompactRaw, a3) & 1) == 0)
    {
      CFRelease(RandomCompactRaw);
      return 0;
    }
  }
  return RandomCompactRaw;
}

const void *PCSFPChainingCopyCurrentIdentity(uint64_t a1, int a2)
{
  uint64_t v2;
  const void *result;

  v2 = 32;
  if (a2)
    v2 = 24;
  result = *(const void **)(a1 + v2);
  if (result)
    return PCSIdentitySetCopyCurrentIdentityWithError((uint64_t)result, kPCSServiceRaw, 0);
  return result;
}

uint64_t PCSFPChainingSetCurrentIdentity(uint64_t a1, int a2, uint64_t a3, const void **a4)
{
  CFTypeRef v7;

  v7 = PCSFPGetChainingSet(a1, a2);
  if (v7 && PCSIdentitySetSetCurrentIdentity((uint64_t)v7, a3))
    return regenFPChainingAttribute(a1, a4);
  else
    return 0;
}

uint64_t PCSFPChainingAddIdentity(uint64_t a1, int a2, uint64_t a3, const void **a4)
{
  CFTypeRef v7;

  v7 = PCSFPGetChainingSet(a1, a2);
  if (v7 && PCSIdentitySetAddIdentity((uint64_t)v7, a3))
    regenFPChainingAttribute(a1, a4);
  return 0;
}

CFTypeRef PCSFPGetChainingSet(uint64_t a1, int a2)
{
  CFTypeRef result;

  if (a2)
  {
    result = *(CFTypeRef *)(a1 + 24);
    if (!result)
    {
      result = PCSIdentitySetCreateMutable(0);
      *(_QWORD *)(a1 + 24) = result;
    }
  }
  else
  {
    result = *(CFTypeRef *)(a1 + 32);
    if (!result)
    {
      result = PCSIdentitySetCreateMutable(0);
      *(_QWORD *)(a1 + 32) = result;
    }
  }
  return result;
}

uint64_t regenFPChainingAttribute(uint64_t a1, const void **a2)
{
  uint64_t v4;
  uint64_t v5;
  const __CFData *v6;
  const __CFArray *v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;

  v16 = 0;
  v17 = 0;
  v18 = 0u;
  v19 = 0u;
  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
  {
    v5 = 72;
    if (*(_DWORD *)(a1 + 204) > 2u)
      v5 = 64;
    v6 = *(const __CFData **)(a1 + v5);
    if (!v6)
      goto LABEL_17;
    v7 = (const __CFArray *)PCSIdentitySetCopyOrderedIdentities(v4, kPCSServiceRaw);
    if (!v7 || !fillChainingKeys(v6, v7, (CFIndex **)&v19, &v18, a2))
      goto LABEL_18;
    CFRelease(v7);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v7 = (const __CFArray *)PCSIdentitySetCopyOrderedIdentities(v8, kPCSServiceRaw);
    if (!v7
      || !fillChainingKeys(*(const __CFData **)(a1 + 72), v7, (CFIndex **)&v19 + 1, (_QWORD *)&v18 + 1, a2))
    {
      goto LABEL_18;
    }
    CFRelease(v7);
  }
  v9 = length_PCSObjectChaining();
  v16 = v9;
  v10 = malloc_type_malloc(v9, 0x99FFC367uLL);
  v17 = v10;
  if (!v10)
  {
    v13 = 12;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = encode_PCSObjectChaining();
  if ((_DWORD)v12)
  {
    v13 = v12;
    free(v11);
    v17 = 0;
LABEL_16:
    _PCSErrorASN1(a2, (uint64_t)"encode PCSObjectChaining", v13);
LABEL_17:
    v7 = 0;
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if (v9)
    abort();
  PCSReplaceOrUpdateAttribute((unsigned int *)(a1 + 128), 4, (uint64_t)&v16);
  v7 = 0;
  v14 = 1;
LABEL_19:
  free_PCSObjectChaining();
  if (v17)
    free(v17);
  if (v7)
    CFRelease(v7);
  return v14;
}

uint64_t PCSFPChainingRemoveIdentity(uint64_t a1, int a2, uint64_t a3, const void **a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = 32;
  if (a2)
    v5 = 24;
  v6 = *(_QWORD *)(a1 + v5);
  if (v6 && PCSIdentitySetRemoveIdentity(v6, a3))
    return regenFPChainingAttribute(a1, a4);
  else
    return 0;
}

uint64_t PCSShareProtectionAddPCSKey(uint64_t a1, uint64_t a2)
{
  PCSIdentitySetAddIdentity(*(_QWORD *)(a1 + 16), a2);
  return 1;
}

uint64_t PCSShareProtectionDeletePCSKey(uint64_t a1, uint64_t a2)
{
  return PCSIdentitySetRemoveIdentity(*(_QWORD *)(a1 + 16), a2);
}

BOOL PCSShareProtectionAddKeyWithAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;

  v8 = PCSFPCreatePrivateKey(a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  if (v8)
    CFRelease(v8);
  return v9 != 0;
}

uint64_t PCSShareProtectionCopyKeys(uint64_t a1, uint64_t a2)
{
  return PCSIdentitySetCopyIdentities(*(_QWORD *)(a1 + 16), a2);
}

CFArrayRef PCSShareProtectionCopyPublicKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFDictionary *v9;
  char v11;
  _QWORD context[5];

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v11);
  if (!*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)(a1 + 48) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v9 = (const __CFDictionary *)PCSIdentitySetCopyIdentities(*(_QWORD *)(a1 + 16), 0);
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSShareProtectionCopyPublicKeys_block_invoke;
    context[3] = &__block_descriptor_40_e15_v24__0r_v8r_v16l;
    context[4] = a1;
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)apply_block_2_1, context);
    if (v9)
      CFRelease(v9);
  }
  return CFArrayCreateCopy(0, *(CFArrayRef *)(a1 + 48));
}

CFDataRef PCSFPCreateDerivedDataFromMasterKey(uint64_t a1, const __CFData *a2, const __CFData *a3, size_t a4)
{
  const __CFData *v8;
  const __CFData *v9;
  size_t Length;
  const __CFData *v11;
  CFDataRef v12;

  v8 = CFDataCreate(0, (const UInt8 *)"DerivedDataFromMasterKey", 24);
  v9 = *(const __CFData **)(a1 + 72);
  Length = CFDataGetLength(v9);
  v11 = deriveHKDF(v9, 0, v8, Length);
  if (v8)
    CFRelease(v8);
  if (!v11)
    return 0;
  v12 = deriveHKDF(v11, a2, a3, a4);
  CFRelease(v11);
  return v12;
}

CFDataRef deriveHKDF(const __CFData *a1, CFDataRef theData, const __CFData *a3, size_t a4)
{
  uint64_t Hkdf;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFDataRef v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!a3)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }
LABEL_5:
  Hkdf = CCKDFParametersCreateHkdf();
  if ((_DWORD)Hkdf)
  {
    v9 = Hkdf;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      deriveHKDF_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  else
  {
    v18 = malloc_type_malloc(a4, 0x9FDB79C2uLL);
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    v19 = CCDeriveKey();
    if ((_DWORD)v19)
    {
      v20 = v19;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        deriveHKDF_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
      free(v18);
      v17 = 0;
    }
    else
    {
      v17 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v18, a4, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
    }
    CCKDFParametersDestroy();
  }
  return v17;
}

uint64_t PCSFPGetCurrentMasterKeyID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(_QWORD *)(a1 + 80);
}

uint64_t PCSFPGetCurrentMasterKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  char v11;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v11);
  v9 = *(_DWORD *)(a1 + 200);
  if (v9 && PCSServiceItemAllowKeyExportByIndex(v9))
    return *(_QWORD *)(a1 + 72);
  else
    return 0;
}

const void *PCSFPGetMasterKeyForKeyID(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *Value;
  int v11;
  const __CFData *v12;
  const __CFDictionary *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  CFRange v20;

  Value = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 216) != 1192348414)
      PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v15[0]);
    v11 = *(_DWORD *)(a1 + 200);
    if (v11 && PCSServiceItemAllowKeyExportByIndex(v11))
    {
      if (CFEqual(a2, *(CFTypeRef *)(a1 + 80)))
        goto LABEL_7;
      if (CFDataGetLength((CFDataRef)a2) > 4)
      {
        Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 112), a2);
        goto LABEL_13;
      }
      v12 = *(const __CFData **)(a1 + 80);
      v20.length = CFDataGetLength(v12);
      v20.location = 0;
      if (!(unint64_t)CFDataFind(v12, (CFDataRef)a2, v20, 2uLL).location)
      {
LABEL_7:
        Value = *(const void **)(a1 + 72);
LABEL_13:
        v17[3] = (uint64_t)Value;
        goto LABEL_14;
      }
      v13 = *(const __CFDictionary **)(a1 + 112);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __PCSFPGetMasterKeyForKeyID_block_invoke;
      v15[3] = &unk_1E553DE30;
      v15[4] = &v16;
      v15[5] = a2;
      CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)apply_block_2_1, v15);
      Value = (const void *)v17[3];
    }
    else
    {
      Value = 0;
    }
  }
LABEL_14:
  _Block_object_dispose(&v16, 8);
  return Value;
}

void sub_1A9525A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFArray *PCSFPCopyAvailableMasterKeyIDs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFArray *Mutable;
  __CFArray *v10;
  char v12;

  if (!a1)
    return 0;
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, v12);
  if (!*(_QWORD *)(a1 + 80))
  {
    syslog(3, "PCSShareProtection %p have a NULL master key");
    return 0;
  }
  if (!*(_QWORD *)(a1 + 112))
  {
    syslog(3, "PCSShareProtection %p have a NULL oldMasterKeys");
    return 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v10 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *(const void **)(a1 + 80));
    CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 112), (CFDictionaryApplierFunction)addKeyToArray, v10);
  }
  return v10;
}

void addKeyToArray(void *value, int a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, value);
}

const void *PCSFPSetOwnerIdentity(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  CFTypeID v5;
  const void *result;
  CFTypeID v7;

  v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    *(_QWORD *)(a1 + 160) = 0;
    CFRelease(v4);
  }
  v5 = CFGetTypeID(cf);
  if (v5 == PCSIdentityGetTypeID())
  {
    result = PCSIdentityCopyPublicIdentity((uint64_t)cf);
    cf = result;
  }
  else
  {
    v7 = CFGetTypeID(cf);
    result = (const void *)PCSPublicIdentityGetTypeID();
    if ((const void *)v7 != result)
      return result;
    if (cf)
      result = CFRetain(cf);
  }
  *(_QWORD *)(a1 + 160) = cf;
  return result;
}

uint64_t PCSFPGetOwnerIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(_QWORD *)(a1 + 160);
}

_DWORD *PCSFPSetAuthorshipIdentity(_DWORD *result, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  const void *v10;
  char v11;

  if (result[54] != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", (uint64_t)cf, a3, a4, a5, a6, a7, a8, v11);
  if (cf)
  {
    v9 = result;
    v10 = (const void *)*((_QWORD *)result + 22);
    if (v10)
    {
      v9[22] = 0;
      CFRelease(v10);
    }
    result = CFRetain(cf);
    v9[22] = cf;
  }
  return result;
}

uint64_t PCSFPGetAuthorshipIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(_QWORD *)(a1 + 176);
}

uint64_t PCSFPRollMasterKey(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;
  __CFData *RandomKey;
  __CFData *v12;
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
  CFMutableDataRef MutableCopy;
  __CFData *KeyIDFromKey;
  const void *v25;
  const __CFData *v26;
  const __CFDictionary *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  _QWORD context[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v32);
  v9 = a2;
  if (*(_DWORD *)(a1 + 204) == 3 && *(_BYTE *)(a1 + 209))
  {
    _PCSError(a3, 48, CFSTR("Share is a readonly share"));
    return 0;
  }
  if (*(_BYTE *)(a1 + 210))
  {
    _PCSError(a3, 49, CFSTR("Share is rolled w/o export"));
    return 0;
  }
  if ((unint64_t)CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 112)) >> 31)
  {
    _PCSError(a3, 136, CFSTR("Share master key rolled too much"));
    return 0;
  }
  if ((v9 & 1) == 0)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 112), *(const void **)(a1 + 80), *(const void **)(a1 + 72));
  RandomKey = 0;
  v12 = 0;
  v13 = MEMORY[0x1E0C809B0];
  while (1)
  {
    if (RandomKey)
      CFRelease(RandomKey);
    RandomKey = CreateRandomKey();
    if (!RandomKey)
      break;
    v21 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(a1 + 204) == 3)
    {
      if (!v21)
        PCSAbort("read write master key NULL in version 2 key:sp->readwriteMasterKey", v14, v15, v16, v17, v18, v19, v20, (char)a3);
      generateOtherKeysFromRWMasterKey(a1, RandomKey, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      if (v21)
        PCSAbort("read write master key not NULL in version 1 key:sp->readwriteMasterKey == NULL", v14, v15, v16, v17, v18, v19, v20, (char)a3);
      v22 = *(const void **)(a1 + 72);
      if (v22)
      {
        *(_QWORD *)(a1 + 72) = 0;
        CFRelease(v22);
      }
      MutableCopy = CFDataCreateMutableCopy(0, 0, RandomKey);
      *(_QWORD *)(a1 + 72) = MutableCopy;
      if (!MutableCopy)
        break;
      generateObjectKey((_QWORD *)a1, RandomKey, 1);
    }
    KeyIDFromKey = CreateKeyIDFromKey(*(const __CFData **)(a1 + 72));
    if (!KeyIDFromKey)
    {
      _PCSErrorOOM(a3);
      v30 = 0;
      goto LABEL_29;
    }
    v12 = KeyIDFromKey;
    v25 = *(const void **)(a1 + 80);
    if (v25)
    {
      *(_QWORD *)(a1 + 80) = 0;
      CFRelease(v25);
    }
    v26 = (const __CFData *)CFRetain(v12);
    *(_QWORD *)(a1 + 80) = v26;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    if ((unint64_t)CFDataGetLength(v26) >= 4)
    {
      v27 = *(const __CFDictionary **)(a1 + 112);
      context[0] = v13;
      context[1] = 3221225472;
      context[2] = ___PCSFPMasterKeyIDHintConflict_block_invoke;
      context[3] = &unk_1E553E1F8;
      context[4] = &v34;
      context[5] = 4;
      context[6] = v26;
      CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)apply_block_2_1, context);
    }
    v28 = *((unsigned __int8 *)v35 + 24);
    _Block_object_dispose(&v34, 8);
    if (!v28)
    {
      v29 = 1;
      *(_BYTE *)(a1 + 210) = 1;
      PCSFPUpdateMasterKeyIDAttribute(a1);
LABEL_27:
      CFRelease(v12);
      v30 = v29;
      goto LABEL_28;
    }
  }
  _PCSErrorOOM(a3);
  v29 = 0;
  v30 = 0;
  if (v12)
    goto LABEL_27;
LABEL_28:
  if (!RandomKey)
    return v30;
LABEL_29:
  CFRelease(RandomKey);
  return v30;
}

void sub_1A9525F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PCSFPUpdateMasterKeyIDAttribute(uint64_t a1)
{
  unsigned int Count;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  char *v13;
  char v14;
  _QWORD context[5];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  size_t v24;
  void *v25;

  v24 = 0;
  v25 = 0;
  v23 = 0uLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18 = 0;
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 112));
  LODWORD(v23) = Count;
  *((_QWORD *)&v23 + 1) = malloc_type_calloc(Count, 0x10uLL, 0x108004057E67DB5uLL);
  if (*((_QWORD *)&v23 + 1))
  {
    v3 = *(const __CFDictionary **)(a1 + 112);
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSFPUpdateMasterKeyIDAttribute_block_invoke;
    context[3] = &unk_1E553E248;
    v16 = v23;
    context[4] = &v19;
    v17 = 4;
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)apply_block_2_1, context);
    if (*((_DWORD *)v20 + 6) != Count)
    {
      v13 = "old master key length incorrect:n == ids.len";
      goto LABEL_10;
    }
    v11 = length_PCSMasterKeyIDs();
    v24 = v11;
    v12 = malloc_type_malloc(v11, 0xF7C6A72CuLL);
    v25 = v12;
    if (v12)
    {
      if (encode_PCSMasterKeyIDs())
      {
        free(v12);
        v25 = 0;
        goto LABEL_8;
      }
      if (v11 == v18)
      {
        PCSReplaceOrUpdateAttribute((unsigned int *)(a1 + 128), 5, (uint64_t)&v24);
        goto LABEL_8;
      }
      v13 = "asn1 encoding failure:data.length == length";
LABEL_10:
      PCSAbort(v13, v4, v5, v6, v7, v8, v9, v10, v14);
    }
  }
LABEL_8:
  free(*((void **)&v23 + 1));
  free(v25);
  _Block_object_dispose(&v19, 8);
}

void sub_1A9526138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSFPRemoveMasterKey(uint64_t a1, CFDataRef theData, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Length;
  int64_t v12;
  const __CFArray *Mutable;
  const __CFDictionary *v15;
  CFIndex Count;
  const UInt8 *BytePtr;
  const UInt8 *v18;
  CFIndex v19;
  size_t v20;
  __CFDictionary *v21;
  const void *ValueAtIndex;
  char v23;
  _QWORD context[7];

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", (uint64_t)theData, (uint64_t)a3, a4, a5, a6, a7, a8, v23);
  Length = CFDataGetLength(theData);
  v12 = Length;
  if (Length == 4 || Length == 32)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 112), theData))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 112), theData);
LABEL_6:
      PCSFPUpdateMasterKeyIDAttribute(a1);
      return 1;
    }
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v15 = *(const __CFDictionary **)(a1 + 112);
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSFPRemoveMasterKey_block_invoke;
    context[3] = &__block_descriptor_56_e15_v24__0r_v8r_v16l;
    context[4] = theData;
    context[5] = v12;
    context[6] = Mutable;
    CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)apply_block_2_1, context);
    Count = CFArrayGetCount(Mutable);
    if (Count == 1)
    {
      v21 = *(__CFDictionary **)(a1 + 112);
      ValueAtIndex = CFArrayGetValueAtIndex(Mutable, 0);
      CFDictionaryRemoveValue(v21, ValueAtIndex);
      if (Mutable)
        CFRelease(Mutable);
      goto LABEL_6;
    }
    if (Count)
    {
      _PCSError(a3, 163, CFSTR("Multiple matching master keys found"));
    }
    else if (*(_QWORD *)(a1 + 80)
           && ((BytePtr = CFDataGetBytePtr(theData),
                v18 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 80)),
                v19 = CFDataGetLength(*(CFDataRef *)(a1 + 80)),
                v12 >= v19)
             ? (v20 = v19)
             : (v20 = v12),
               !memcmp(BytePtr, v18, v20)))
    {
      _PCSError(a3, 162, CFSTR("Cannot remove current master key"));
    }
    else
    {
      _PCSError(a3, 25, CFSTR("No matching master key found"));
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    _PCSError(a3, 32, CFSTR("Invalid key ID length"));
  }
  return 0;
}

uint64_t PCSFPShouldRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(unsigned __int8 *)(a1 + 211);
}

uint64_t _PCSFPSetShouldRoll(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(result + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  *(_BYTE *)(result + 211) = a2;
  return result;
}

uint64_t PCSNeedsRollAndCounterSign(const __CFData *a1, const void **a2)
{
  uint64_t v4;

  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v4 = decode_PCSShareProtection();
  if ((_DWORD)v4)
    _PCSErrorASN1(a2, (uint64_t)"decode PCSShareProtection", v4);
  free_PCSShareProtection();
  return 0;
}

uint64_t PCSFPIsOutOfNetwork(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(unsigned __int8 *)(a1 + 213);
}

uint64_t PCSFPShouldUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(unsigned __int8 *)(a1 + 212);
}

uint64_t PCSFPGetAuthorIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, a3, a4, a5, a6, a7, a8, vars0);
  return *(_QWORD *)(a1 + 152);
}

uint64_t PCSFPUpdateZoneKey(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _PCSFPUpdateIdentityKey(a1, *(_QWORD *)(a2 + 16), a3, a4, a5, a6, a7, a8);
}

uint64_t _PCSFPUpdateIdentityKey(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  int v11;
  uint64_t v12;
  __CFDictionary *ServiceName;
  const __CFDictionary *v14;
  _QWORD *v15;
  uint64_t PublicID;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *SigningIdentity;
  const void *v31;
  const void *v32;
  _QWORD v33[6];
  uint8_t buf[4];
  const void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 216) != 1192348414)
LABEL_45:
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v33[0]);
  v9 = (const void *)a2;
  if (!a2)
  {
LABEL_55:
    v15 = 0;
    v14 = 0;
    goto LABEL_56;
  }
  v11 = *(_DWORD *)(a1 + 204);
  if (v11 == 3)
  {
    if (*(_BYTE *)(a1 + 209))
    {
      _PCSError(a3, 48, CFSTR("RO object can't upgrade key"));
LABEL_54:
      v9 = 0;
      goto LABEL_55;
    }
  }
  else if (!v11)
  {
    _PCSError(a3, 65, CFSTR("Light object can't upgrade key"));
    goto LABEL_54;
  }
  if (!*(_BYTE *)(a1 + 211))
  {
    _PCSError(a3, 49, CFSTR("Rolling not required, refusing to roll"));
    goto LABEL_54;
  }
  v12 = *(_QWORD *)(a1 + 176);
  if (!v12)
  {
    _PCSError(a3, 94, CFSTR("Wrap identity not known"));
    goto LABEL_54;
  }
  ServiceName = (__CFDictionary *)PCSIdentityGetServiceName(v12);
  if (!ServiceName)
  {
    _PCSError(a3, 94, CFSTR("Wrap identity service type is not known"));
    v9 = 0;
    v15 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v14 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)v9, 0);
  if (!v14)
  {
    _PCSErrorOOM(a3);
    v9 = 0;
    v15 = 0;
    goto LABEL_56;
  }
  v15 = PCSIdentitySetCopyCurrentPublicIdentityWithError((uint64_t)v9, (uint64_t)ServiceName, a3);
  if (!v15)
  {
    v9 = 0;
    goto LABEL_56;
  }
  v9 = PCSIdentitySetCopyCurrentIdentityWithError((uint64_t)v9, (uint64_t)ServiceName, a3);
  if (!v9)
  {
LABEL_56:
    ServiceName = 0;
    goto LABEL_18;
  }
  PublicID = PCSPublicIdentityGetPublicID((uint64_t)v15);
  if (!PublicID)
  {
    _PCSError(a3, 60, CFSTR("Failed to get rolling identity"));
    goto LABEL_56;
  }
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    goto LABEL_45;
  v17 = PublicID;
  v18 = *(const void **)(a1 + 152);
  if (v18 && CFEqual(v18, v15))
  {
    _PCSError(a3, 96, CFSTR("Asked to roll, but we're already using that service identity"));
    ServiceName = 0;
    *(_BYTE *)(a1 + 211) = 0;
  }
  else
  {
    ServiceName = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
    if (ServiceName)
    {
      v24 = ShareEntryCreate(v15, 0);
      if (v24)
      {
        v25 = (const void *)v24;
        v26 = (const void *)PCSPublicIdentityGetPublicID((uint64_t)v15);
        CFDictionarySetValue(ServiceName, v26, v25);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = ___PCSFPUpdateIdentityKey_block_invoke;
        v33[3] = &__block_descriptor_48_e15_v24__0r_v8r_v16l;
        v33[4] = v17;
        v33[5] = ServiceName;
        CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)apply_block_2_1, v33);
        v27 = *(const void **)(a1 + 40);
        if (v27)
        {
          *(_QWORD *)(a1 + 40) = 0;
          CFRelease(v27);
        }
        *(_QWORD *)(a1 + 40) = CFRetain(ServiceName);
        *(_BYTE *)(a1 + 211) = 0;
        v28 = *(const void **)(a1 + 176);
        if (v28)
        {
          *(_QWORD *)(a1 + 176) = 0;
          CFRelease(v28);
        }
        *(_QWORD *)(a1 + 176) = CFRetain(v9);
        v29 = *(const void **)(a1 + 184);
        if (v29)
        {
          *(_QWORD *)(a1 + 184) = 0;
          CFRelease(v29);
        }
        SigningIdentity = (const void *)_PCSIdentityGetSigningIdentity((uint64_t)v9);
        v31 = SigningIdentity;
        if (SigningIdentity)
          CFRetain(SigningIdentity);
        *(_QWORD *)(a1 + 184) = v31;
        v32 = *(const void **)(a1 + 152);
        if (v32)
        {
          *(_QWORD *)(a1 + 152) = 0;
          CFRelease(v32);
        }
        *(_QWORD *)(a1 + 152) = CFRetain(v15);
        CFRelease(v25);
        v21 = 1;
        goto LABEL_43;
      }
    }
    _PCSErrorOOM(a3);
  }
LABEL_18:
  if (*a3)
  {
    pcsLogObjForScope("fprollKeys");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *a3;
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      _os_log_impl(&dword_1A9508000, v19, OS_LOG_TYPE_DEFAULT, "Not rolling zone key %@", buf, 0xCu);
    }

  }
  v21 = 0;
  v22 = 0;
  if (!ServiceName)
  {
    if (!v14)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_43:
  CFRelease(ServiceName);
  v22 = v21;
  if (v14)
LABEL_24:
    CFRelease(v14);
LABEL_25:
  if (v15)
    CFRelease(v15);
  if (v9)
    CFRelease(v9);
  return v22;
}

uint64_t PCSFPUpdateIdentityAndRollZoneKey(uint64_t a1, uint64_t a2, const void **a3)
{
  uint64_t ServiceName;
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
  _QWORD *v19;
  const void *v20;
  NSObject *v21;
  NSObject *v23;
  const void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ServiceName = PCSIdentityGetServiceName(*(_QWORD *)(a1 + 176));
  if ((_PCSFPUpdateIdentityKey(a1, a2, a3, v7, v8, v9, v10, v11) & 1) == 0)
  {
    pcsLogObjForScope("fpkeyRoll");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *a3;
      v25 = 138412546;
      v26 = a1;
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_1A9508000, v23, OS_LOG_TYPE_DEFAULT, "FP Failed Roll for zone %@ %@", (uint8_t *)&v25, 0x16u);
    }

    return 0;
  }
  v19 = PCSFPCreatePrivateKey(a1, v12, v13, v14, v15, v16, v17, v18);
  if (!v19)
  {
    _PCSErrorOOM(a3);
    return 0;
  }
  v20 = v19;
  pcsLogObjForScope("fpkeyRoll");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = ServiceName;
    _os_log_impl(&dword_1A9508000, v21, OS_LOG_TYPE_DEFAULT, "FP Rolled for Zone %@", (uint8_t *)&v25, 0xCu);
  }

  CFRelease(v20);
  return 1;
}

void sub_1A9526CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t apply_block_2_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t apply_block_1_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

BOOL makeHmac(uint64_t a1, const __CFData *a2, const __CFData *a3, uint64_t a4, size_t *a5)
{
  uint64_t v10;
  size_t v11;
  _BOOL8 v12;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = ccsha256_di();
  v11 = *(_QWORD *)MEMORY[0x1E0C80A78](v10);
  *a5 = v11;
  a5[1] = (size_t)malloc_type_malloc(v11, 0xDD2D803EuLL);
  v12 = _PCSCreateDerivedKey(*(const __CFData **)(a1 + 72), 20, (int)&hmacLabel, 0x10uLL, (int)&v14, 0);
  if (v12)
  {
    cchmac_init();
    CFDataGetLength(a2);
    CFDataGetBytePtr(a2);
    cchmac_update();
    if (a3)
    {
      CFDataGetLength(a3);
      CFDataGetBytePtr(a3);
      cchmac_update();
    }
    if (a4)
      cchmac_update();
    cchmac_final();
  }
  return v12;
}

void noMatchingIdentity(uint64_t a1, uint64_t a2, const void **a3)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  CFMutableArrayRef v8;
  const __CFArray *v9;
  CFStringRef v10;
  CFStringRef v11;
  CFMutableArrayRef v12;
  const __CFArray *v13;
  CFStringRef v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  _QWORD v20[5];

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v7 = Mutable;
    v8 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (!v8)
    {
      CFRelease(v7);
      return;
    }
    v9 = v8;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __noMatchingIdentity_block_invoke;
    v20[3] = &__block_descriptor_40_e21_v16__0____CFString__8l;
    v20[4] = v8;
    PCSIdentitySetEnumeratePublicKeys(a1, v20);
    v10 = CFStringCreateByCombiningStrings(0, v9, CFSTR(", "));
    if (v10)
    {
      v11 = v10;
      CFDictionarySetValue(v7, (const void *)kPCSErrorSetIdentities, v9);
      CFRelease(v9);
      v12 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      if (!v12)
      {
        v15 = 0;
        goto LABEL_10;
      }
      v13 = v12;
      if (a2)
        CFDictionaryApplyFunction(*(CFDictionaryRef *)(a2 + 40), (CFDictionaryApplierFunction)addKeyToArray, v12);
      else
        CFArrayAppendValue(v12, CFSTR("light-object"));
      v14 = CFStringCreateByCombiningStrings(0, v13, CFSTR(", "));
      if (v14)
      {
        v15 = v14;
        CFDictionarySetValue(v7, (const void *)kPCSErrorObjectIdentities, v13);
        CFRelease(v13);
        _PCSErrorUserInfo(0, a3, 73, v7, CFSTR("PCS object didn't contain any of the identities [%@], it contained [%@]"), v16, v17, v18, (char)v11);
LABEL_10:
        CFRelease(v7);
        CFRelease(v11);
        if (!v15)
          return;
        v19 = v15;
        goto LABEL_12;
      }
      CFRelease(v13);
      CFRelease(v7);
      v19 = v11;
    }
    else
    {
      CFRelease(v9);
      v19 = v7;
    }
LABEL_12:
    CFRelease(v19);
  }
}

uint64_t ValidateSignature(uint64_t a1, const __CFData *a2, const __CFData *a3, _QWORD *a4, _QWORD *a5, const __CFAllocator *a6, CFIndex a7, unsigned int *a8, unsigned int *a9, char a10, void *a11, void *a12, const void **a13)
{
  unsigned int *v17;
  id v18;
  uint64_t ServiceID;
  BOOL IsManatee;
  _BOOL4 v21;
  _BOOL4 v22;
  const __CFData *v23;
  const void **v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ObjectKey;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  const __CFAllocator *v50;
  _QWORD *v51;
  void *v52;
  __CFArray *Mutable;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const __CFData *v60;
  void *v61;
  int PublicWithData;
  unsigned __int16 v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t i;
  uint64_t v71;
  CFTypeRef v72;
  CFTypeRef v73;
  uint64_t v74;
  uint64_t *v75;
  id v76;
  int Key;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  const __CFData *v81;
  const void **v82;
  const void *v83;
  uint64_t v84;
  int v85;
  CFIndex Count;
  CFIndex v87;
  CFIndex v88;
  const void *ValueAtIndex;
  uint64_t v90;
  int v91;
  __CFData *v92;
  const __CFData *v93;
  const UInt8 *BytePtr;
  CFTypeRef v95;
  const void *v96;
  unsigned int *v97;
  CFStringRef v98;
  CFStringRef v99;
  const void *v100;
  unint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  int v105;
  BOOL v106;
  CFIndex v107;
  const UInt8 *v108;
  const void **v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  const void **v113;
  uint64_t v114;
  CFDataRef v115;
  CFDataRef v116;
  const __CFData *v117;
  uint64_t v118;
  const __CFData *v119;
  __CFData *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  CFDataRef v124;
  CFDataRef v125;
  const __CFData *v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  __CFData *v130;
  __CFData *v131;
  void *v132;
  void *v133;
  id v134;
  unsigned __int16 v135;
  uint64_t v136;
  int v137;
  void *v138;
  int v139;
  unint64_t v140;
  unint64_t v141;
  const void **v142;
  unint64_t v143;
  unint64_t v144;
  _QWORD *v145;
  char v147[8];
  const UInt8 *v148;
  unsigned int *v149;
  CFIndex v150;
  unsigned int *v151;
  _QWORD *v152;
  char *v153;
  _QWORD *v154;
  uint64_t v155;
  CFAllocatorRef v156;
  const void **v157;
  id v158;
  const __CFData *v159;
  const __CFData *v160;
  uint64_t *v161;
  char *v162;
  uint64_t v163;
  id v164;
  _QWORD *v165;
  size_t v166;
  void *v167;
  uint64_t v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _BYTE v183[128];
  uint64_t v184;

  v156 = a6;
  v154 = a4;
  v159 = a2;
  v160 = a3;
  v17 = a9;
  v184 = *MEMORY[0x1E0C80C00];
  v18 = a12;
  ServiceID = *(_QWORD *)(a1 + 176);
  if (!ServiceID)
  {
    v21 = 0;
    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v25 = a7;
    v22 = a7 == 0;
    v176 = 0u;
    goto LABEL_10;
  }
  IsManatee = _PCSIdentityIsManatee(ServiceID);
  v21 = _PCSIdentityRequireManateeSigning(*(_QWORD *)(a1 + 176));
  ServiceID = *(_QWORD *)(a1 + 176);
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v22 = a7 == 0;
  v182 = 0u;
  if (!ServiceID)
  {
    v25 = a7;
LABEL_10:
    v23 = v160;
    if (!a5)
      goto LABEL_69;
    goto LABEL_11;
  }
  v23 = v160;
  if (a7 || !IsManatee)
  {
    v25 = a7;
    if (!a5)
    {
LABEL_69:
      if (!v22)
      {
        _PCSError(a13, 16, CFSTR("Author signature exists, but no self signature"));
        goto LABEL_75;
      }
      v24 = a13;
      if (!v21)
      {
LABEL_76:
        v165 = 0;
        v157 = 0;
        goto LABEL_165;
      }
      if (!ServiceID)
        goto LABEL_73;
      goto LABEL_72;
    }
LABEL_11:
    a7 = v25;
    goto LABEL_12;
  }
  v22 = 1;
  *(_BYTE *)(a1 + 212) = 1;
  if (!a5)
  {
    v24 = a13;
    if (!v21)
      goto LABEL_76;
LABEL_72:
    ServiceID = PCSIdentityGetServiceID(ServiceID);
LABEL_73:
    _PCSError(v24, 16, CFSTR("Author signature or server signature required for service: %d"), ServiceID);
    goto LABEL_75;
  }
LABEL_12:
  LODWORD(v155) = v22;
  v175 = 0;
  v26 = decode_PCSObjectSignature();
  if ((_DWORD)v26)
  {
    _PCSErrorASN1(a13, (uint64_t)"decode PCSObjectSignature", v26);
    goto LABEL_75;
  }
  if (*a5 != v175)
  {
    _PCSError(a13, 16, CFSTR("Signature of wrong length"));
    goto LABEL_75;
  }
  if (*((_QWORD *)&v182 + 1) && copy_PCSAttributes())
  {
    _PCSErrorOOM(a13);
    goto LABEL_75;
  }
  v27 = _PCSSignAlgToDI(WORD4(v179), a13);
  if (!v27)
  {
LABEL_75:
    free_PCSObjectSignature();
    v80 = 0;
    goto LABEL_185;
  }
  v28 = (uint64_t *)v27;
  v153 = v147;
  v29 = MEMORY[0x1E0C80A78](v27);
  v162 = &v147[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  _PCSMakeDigest(v29, v159, v23, (uint64_t)&v176, (uint64_t)v162);
  if (!*(_BYTE *)(a1 + 209))
  {
    ObjectKey = getObjectKey(a1);
    if (!ObjectKey)
    {
      _PCSError(a13, 48, CFSTR("No verification key"));
LABEL_66:
      v165 = 0;
      goto LABEL_67;
    }
    if ((*(_DWORD *)(a1 + 204) & 0xFFFFFFFE) != 2)
      PCSAbort("self sign but not version 1.5 or 2:sp->version == VERSION2 || sp->version == VERSION1_5", v39, v40, v41, v42, v43, v44, v45, v147[0]);
    if (!_PCSVerifyHash(ObjectKey, WORD4(v179), *v28, (uint64_t)v162, (uint64_t)&v178 + 8, a13))
    {
      v81 = 0;
      v165 = 0;
      v82 = 0;
      goto LABEL_162;
    }
  }
  v106 = (BYTE4(v176) & 3) == 0;
  *(_BYTE *)(a1 + 214) = (BYTE4(v176) & 3) != 0;
  if (v106)
    v46 = 0;
  else
    v46 = v155;
  v163 = a1;
  v151 = a8;
  v152 = a5;
  if (v46 != 1)
  {
    v150 = a7;
    v161 = v28;
    v165 = 0;
    v24 = a13;
    if (!a8)
      goto LABEL_58;
    goto LABEL_50;
  }
  if (!a9 || (_PCSIdentitySupportsServerSigning(*(_QWORD *)(a1 + 176)) & 1) == 0)
  {
    v79 = *(_QWORD *)(a1 + 176);
    if (v79)
      v79 = PCSIdentityGetServiceID(v79);
    _PCSError(a13, 16, CFSTR("Author signature or server signature required for service: %d"), v79);
    goto LABEL_66;
  }
  v150 = a7;
  v161 = v28;
  v157 = a13;
  v158 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v164 = (id)objc_claimAutoreleasedReturnValue();
  v165 = malloc_type_calloc(*a9, 0x28uLL, 0x1080040EC46ECBEuLL);
  v47 = *a9;
  if ((_DWORD)v47)
  {
    v48 = 0;
    v49 = 0;
    v50 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v51 = v165;
    do
    {
      if (*(_DWORD *)(*((_QWORD *)a9 + 1) + v48) == 12)
      {
        *(_QWORD *)&v169 = 0;
        if (!decode_PCSSignature())
        {
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v51[1], *v51);
          Mutable = *(__CFArray **)(a1 + 192);
          if (Mutable
            || (Mutable = CFArrayCreateMutable(v50, 0, MEMORY[0x1E0C9B378]), (*(_QWORD *)(a1 + 192) = Mutable) != 0))
          {
            CFArrayAppendValue(Mutable, v52);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v49);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "setObject:forKeyedSubscript:", v54, v52);

          a1 = v163;
        }
        v47 = *a9;
      }
      ++v49;
      v51 += 5;
      v48 += 24;
    }
    while (v49 < v47);
  }
  v149 = a9;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  objc_msgSend(v164, "allKeys");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v171, v183, 16);
  v18 = v158;
  if (!v56)
    goto LABEL_46;
  v57 = v56;
  v58 = *(_QWORD *)v172;
LABEL_39:
  v59 = 0;
  while (1)
  {
    if (*(_QWORD *)v172 != v58)
      objc_enumerationMutation(v55);
    v60 = *(const __CFData **)(*((_QWORD *)&v171 + 1) + 8 * v59);
    objc_msgSend(v164, "objectForKey:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TrustEvaluator validatePublicKey:trustRefs:](TrustEvaluator, "validatePublicKey:trustRefs:", v60, v18))
    {
      PublicWithData = PCSKeyCreatePublicWithData(v60, 0);
      v63 = WORD4(v179);
      v64 = *v161;
      v65 = objc_msgSend(v61, "intValue");
      v66 = v64;
      v18 = v158;
      if ((_PCSVerifyHash(PublicWithData, v63, v66, (uint64_t)v162, (uint64_t)&v165[5 * v65], v157) & 1) != 0)
        break;
    }

    if (v57 == ++v59)
    {
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v171, v183, 16);
      if (!v57)
      {
LABEL_46:

        v67 = *(_QWORD *)(v163 + 176);
        if (v67)
          v67 = PCSIdentityGetServiceID(v67);
        _PCSError(v157, 161, CFSTR("Unable to find a valid server signature for service: %d"), v67);

        v17 = v149;
        goto LABEL_67;
      }
      goto LABEL_39;
    }
  }

  v17 = v149;
  v24 = v157;
  a1 = v163;
  a8 = v151;
  a5 = v152;
  if (v151)
  {
LABEL_50:
    v68 = *a8;
    if ((_DWORD)v68)
    {
      v69 = 0;
      for (i = 0; i < v68; ++i)
      {
        if (*(_DWORD *)(*((_QWORD *)a8 + 1) + v69) == 9)
        {
          v169 = 0u;
          v170 = 0u;
          v168 = 0;
          v71 = decode_PCSSPKey();
          if ((_DWORD)v71)
          {
            _PCSErrorASN1(v24, (uint64_t)"decode PCSSPKey", v71);
            goto LABEL_67;
          }
          v72 = _PCSPublicIdentityCreateWithPCSSPKey((unsigned int *)&v169, v24);
          v73 = v72;
          *(_QWORD *)(a1 + 160) = v72;
          if (v72)
            CFRetain(v72);
          *(_QWORD *)(a1 + 168) = v73;
          free_PCSSPKey();
          v68 = *a8;
        }
        v69 += 24;
      }
    }
  }
LABEL_58:
  v164 = a11;
  v74 = v150;
  if ((v155 & 1) != 0)
    goto LABEL_106;
  v75 = v161;
  v76 = v164;
  if (v164 && *(_BYTE *)(a1 + 214))
  {
    *(_QWORD *)&v169 = 0;
    Key = _PCSPublicIdentityGetKey((uint64_t)v164);
    if ((_PCSVerifyHash(Key, WORD4(v179), *v75, (uint64_t)v162, v74, (const void **)&v169) & 1) != 0)
    {
      v78 = (void *)CFRetain(v76);
      goto LABEL_88;
    }
    v83 = (const void *)v169;
    if ((_QWORD)v169)
    {
      *(_QWORD *)&v169 = 0;
      CFRelease(v83);
    }
  }
  if (*(_DWORD *)(a1 + 204) != 2)
  {
    Count = CFArrayGetCount(v156);
    if (Count < 1)
    {
LABEL_104:
      if (!*(_QWORD *)(a1 + 152))
      {
        _PCSError(v24, 54, CFSTR("Couldn't find validation identity."));
        if (!*(_QWORD *)(a1 + 152))
          goto LABEL_67;
      }
    }
    else
    {
      v87 = Count;
      v88 = 0;
      while (!*(_QWORD *)(a1 + 152))
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v156, v88);
        *(_QWORD *)&v169 = 0;
        v90 = _PCSPublicIdentityGetKey((uint64_t)ValueAtIndex);
        v91 = v90;
        v92 = _PCSKeyCopyExportedPublicKey(v90);
        v93 = v92;
        if (v92)
        {
          if (CFDataGetLength(v92) == *(_QWORD *)v74)
          {
            BytePtr = CFDataGetBytePtr(v93);
            if (!memcmp(BytePtr, *(const void **)(v74 + 8), *(_QWORD *)v74)
              && (!*(_BYTE *)(v163 + 214)
               || _PCSVerifyHash(v91, WORD4(v179), *v161, (uint64_t)v162, v74, (const void **)&v169)))
            {
              v95 = CFRetain(ValueAtIndex);
              *(_QWORD *)(v163 + 152) = v95;
            }
          }
        }
        v96 = (const void *)v169;
        if ((_QWORD)v169)
        {
          *(_QWORD *)&v169 = 0;
          CFRelease(v96);
        }
        a5 = v152;
        if (v93)
          CFRelease(v93);
        ++v88;
        a1 = v163;
        if (v87 == v88)
          goto LABEL_104;
      }
    }
    goto LABEL_106;
  }
  v84 = *(_QWORD *)(a1 + 176);
  if (!v84)
    PCSAbort("identity missing:sp->identity", v31, v32, v33, v34, v35, v36, v37, v147[0]);
  if (*(_BYTE *)(a1 + 214))
  {
    v85 = _PCSIdentityGetKey(v84);
    if (!_PCSVerifyHash(v85, WORD4(v179), *v75, (uint64_t)v162, v74, v24))
      goto LABEL_67;
    v84 = *(_QWORD *)(a1 + 176);
  }
  v78 = PCSIdentityCopyPublicIdentity(v84);
LABEL_88:
  *(_QWORD *)(a1 + 152) = v78;
  if (!v78)
    goto LABEL_67;
LABEL_106:
  if (v164)
    *(_QWORD *)(a1 + 168) = CFRetain(v164);
  *(_QWORD *)(a1 + 120) = v176;
  v23 = v160;
  v97 = v151;
  if ((_QWORD)v182 && *(_DWORD *)v182)
  {
    v98 = _PCSCreateBase64(*(_QWORD *)(*(_QWORD *)(v182 + 8) + 24), *(_QWORD *)(*(_QWORD *)(v182 + 8) + 16), 0);
    if (!v98)
    {
      _PCSErrorOOM(v24);
      goto LABEL_67;
    }
    v99 = v98;
    v100 = (const void *)PCSIdentitySetCopyIdentity(*(_QWORD *)(a1 + 16), (uint64_t)v98);
    CFRelease(v99);
    if (v100)
    {
      PCSIdentitySetSetCurrentIdentity(*(_QWORD *)(a1 + 16), (uint64_t)v100);
      CFRelease(v100);
      goto LABEL_113;
    }
LABEL_67:
    v80 = 0;
    v81 = 0;
    goto LABEL_176;
  }
LABEL_113:
  v157 = 0;
  if (!v97 || !a10)
  {
LABEL_165:
    v166 = 0;
    v167 = 0;
    if (makeHmac(a1, v159, v23, (uint64_t)a5, &v166))
    {
      if (*v154 == v166)
      {
        v138 = v167;
        v139 = cc_cmp_safe();
        free(v138);
        if (!v139)
        {
          v81 = 0;
          v80 = 1;
          goto LABEL_169;
        }
        _PCSError(v24, 38, CFSTR("HMAC doesn't match"));
      }
      else
      {
        free(v167);
      }
    }
    v81 = 0;
    v80 = 0;
LABEL_169:
    v82 = v157;
    if (!v157)
      goto LABEL_176;
    goto LABEL_170;
  }
  v101 = *v97;
  if (!(_DWORD)v101)
  {
    v157 = 0;
    goto LABEL_165;
  }
  v102 = 0;
  v157 = 0;
  v164 = 0;
  v103 = 0;
  v156 = (CFAllocatorRef)*MEMORY[0x1E0C9AE20];
  while (1)
  {
    v104 = *((_QWORD *)v97 + 1) + 24 * v102;
    v105 = *(_DWORD *)v104;
    v106 = *(_DWORD *)v104 == 11 || v105 == 8;
    if (!v106)
      goto LABEL_158;
    if (!v17)
    {
      _PCSError(v24, 140, CFSTR("require pppcs signature, but no unsigned attributes are present"));
LABEL_198:
      v81 = 0;
      goto LABEL_161;
    }
    if ((v103 & 1) == 0)
      break;
    v103 = 1;
LABEL_158:
    if (++v102 >= v101)
    {

      goto LABEL_165;
    }
  }
  v107 = *(_QWORD *)(v104 + 8);
  v108 = *(const UInt8 **)(v104 + 16);
  v155 = v102;
  if (v164)
  {
LABEL_143:
    if (v105 == 11)
    {
      v124 = CFDataCreateWithBytesNoCopy(0, v108, v107, v156);
      if (!v124)
        goto LABEL_198;
      v125 = v124;
      v126 = CFDataCreate(0, (const UInt8 *)"PCSSignatureKeyIDEncryption", 27);
      v81 = PCSFPCopyDecryptedData(a1, 0, v126, v125, v24);
      if (v126)
        CFRelease(v126);
      CFRelease(v125);
      if (!v81)
        goto LABEL_161;
      CFDataGetBytePtr(v81);
      CFDataGetLength(v81);
    }
    else
    {
      v81 = 0;
    }
    v169 = 0u;
    v170 = 0u;
    v168 = 0;
    v127 = decode_PCSSPKey();
    if (v81)
      CFRelease(v81);
    if ((_DWORD)v127)
    {
      _PCSErrorASN1(v24, (uint64_t)"decode PCSSPKey", v127);
      goto LABEL_198;
    }
    v81 = (const __CFData *)_PCSPublicIdentityCreateWithPCSSPKey((unsigned int *)&v169, v24);
    free_PCSSPKey();
    if (!v81)
      goto LABEL_198;
    v128 = _PCSPublicIdentityGetKey((uint64_t)v81);
    v129 = v128;
    v130 = _PCSKeyCopyExportedPublicKey(v128);
    if (!v130)
      goto LABEL_161;
    v131 = v130;
    objc_msgSend(v164, "objectForKey:", v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v132)
    {
      _PCSError(v24, 140, CFSTR("did not find pppcs signature for key: %@"), v131);

      goto LABEL_161;
    }
    v133 = v132;
    v134 = v18;
    v135 = WORD4(v179);
    v136 = *v161;
    v137 = objc_msgSend(v132, "intValue");
    if (!_PCSVerifyHash(v129, v135, v136, (uint64_t)v162, (uint64_t)&v157[5 * v137], v24))
    {

      v18 = v134;
      goto LABEL_161;
    }
    CFRelease(v81);

    v97 = v151;
    a5 = v152;
    v101 = *v151;
    v103 = 1;
    v18 = v134;
    a1 = v163;
    v23 = v160;
    v102 = v155;
    goto LABEL_158;
  }
  LODWORD(v149) = v105;
  v150 = v107;
  v109 = (const void **)malloc_type_calloc(*v17, 0x28uLL, 0x1080040EC46ECBEuLL);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v164 = (id)objc_claimAutoreleasedReturnValue();
  v110 = *v17;
  v157 = v109;
  if (!(_DWORD)v110)
  {
LABEL_142:
    v107 = v150;
    v105 = (int)v149;
    goto LABEL_143;
  }
  v148 = v108;
  v158 = v18;
  v111 = 0;
  v112 = 0;
  v113 = v109;
  while (1)
  {
    v114 = *((_QWORD *)v17 + 1) + v111;
    if (*(_DWORD *)v114 == 7)
    {
      v120 = 0;
      goto LABEL_136;
    }
    if (*(_DWORD *)v114 == 10)
      break;
LABEL_140:
    ++v112;
    v113 += 5;
    v111 += 24;
    if (v112 >= v110)
    {
      v18 = v158;
      v108 = v148;
      goto LABEL_142;
    }
  }
  v115 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(v114 + 16), *(_QWORD *)(v114 + 8), v156);
  if (!v115)
    goto LABEL_188;
  v116 = v115;
  v117 = CFDataCreate(0, (const UInt8 *)"PCSSignatureEncryption", 22);
  v118 = a1;
  v119 = v117;
  v120 = PCSFPCopyDecryptedData(v118, 0, v117, v116, v24);
  if (v119)
    CFRelease(v119);
  CFRelease(v116);
  if (!v120)
    goto LABEL_188;
  CFDataGetBytePtr(v120);
  CFDataGetLength(v120);
  a1 = v163;
LABEL_136:
  *(_QWORD *)&v169 = 0;
  v121 = decode_PCSSignature();
  if (v120)
    CFRelease(v120);
  if (!(_DWORD)v121)
  {
    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v113[1], *v113);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v112);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setObject:forKeyedSubscript:", v123, v122);

    v110 = *v17;
    goto LABEL_140;
  }
  _PCSErrorASN1(v24, (uint64_t)"decode PCSSignature", v121);
LABEL_188:
  v81 = 0;
  v18 = v158;
LABEL_161:

  v82 = v157;
LABEL_162:
  v80 = 0;
  if (v82)
  {
LABEL_170:
    v140 = *v17;
    if ((_DWORD)v140)
    {
      v141 = 0;
      v142 = v82;
      do
      {
        if (v142[3])
        {
          free_PCSSignature();
          v140 = *v17;
        }
        ++v141;
        v142 += 5;
      }
      while (v141 < v140);
    }
    free(v82);
  }
LABEL_176:
  if (v165)
  {
    v143 = *v17;
    if ((_DWORD)v143)
    {
      v144 = 0;
      v145 = v165;
      do
      {
        if (v145[3])
        {
          free_PCSSignature();
          v143 = *v17;
        }
        ++v144;
        v145 += 5;
      }
      while (v144 < v143);
    }
    free(v165);
  }
  free_PCSObjectSignature();
  if (v81)
    CFRelease(v81);
LABEL_185:

  return v80;
}

void __noMatchingIdentity_block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

CFTypeRef ProcessChainKeys(const __CFData *a1, uint64_t a2, const void **a3)
{
  const __CFData *v5;
  const __CFData *v6;
  __CFData *v7;
  const __CFData *v8;
  uint64_t v9;
  CFTypeRef Mutable;
  const void *v11;
  CFTypeRef v12;

  v5 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a2 + 8), *(_QWORD *)a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v5)
  {
    v12 = 0;
    goto LABEL_8;
  }
  v6 = v5;
  v7 = PCSCloudKitShareTokenCopyDecryptedData(a1, v5);
  if (!v7)
  {
    v12 = 0;
    v8 = v6;
    goto LABEL_7;
  }
  v8 = v7;
  CFDataGetBytePtr(v7);
  CFDataGetLength(v8);
  v9 = decode_PCSSPKeyList();
  if ((_DWORD)v9)
  {
    _PCSErrorASN1(a3, (uint64_t)"decode PCSSPKeyList", v9);
    goto LABEL_12;
  }
  Mutable = PCSIdentitySetCreateMutable(a3);
  if (!Mutable)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = Mutable;
  v12 = CFRetain(Mutable);
  CFRelease(v11);
LABEL_6:
  CFRelease(v6);
LABEL_7:
  CFRelease(v8);
LABEL_8:
  free_PCSSPKeyList();
  return v12;
}

uint64_t fillChainingKeys(const __CFData *a1, const __CFArray *a2, CFIndex **a3, _QWORD *a4, const void **a5)
{
  _QWORD *v10;
  CFIndex v11;
  __CFData *Mutable;
  __CFData *v13;
  uint64_t v14;
  uint64_t v15;
  __CFData *v16;
  CFIndex *v17;
  void *v18;
  uint64_t v19;
  uint64_t result;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  CFRange v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3010000000;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3010000000;
  v22[4] = 0;
  v22[5] = 0;
  v22[3] = &unk_1A95609B5;
  v23[4] = 0;
  v23[5] = 0;
  v23[3] = &unk_1A95609B5;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __fillChainingKeys_block_invoke;
  v21[3] = &unk_1E553E220;
  v21[4] = v23;
  v21[5] = v22;
  v10 = v21;
  v24.length = CFArrayGetCount(a2);
  v24.location = 0;
  CFArrayApplyFunction(a2, v24, (CFArrayApplierFunction)apply_block_1_0, v10);

  v11 = length_PCSSPKeyList();
  Mutable = CFDataCreateMutable(0, v11);
  v13 = Mutable;
  if (!Mutable)
  {
    v14 = 12;
    goto LABEL_5;
  }
  CFDataSetLength(Mutable, v11);
  CFDataGetMutableBytePtr(v13);
  v14 = encode_PCSSPKeyList();
  if ((_DWORD)v14)
  {
    CFRelease(v13);
LABEL_5:
    _PCSErrorASN1(a5, (uint64_t)"encode PCSSPKeyList", v14);
    v15 = 0;
LABEL_15:
    free_PCSSPKeyList();
    free_PCSSPKeyList();
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v23, 8);
    return v15;
  }
  if (!v11)
  {
    v16 = PCSCloudKitShareTokenCopyEncryptedData(a1, v13);
    if (!v16)
    {
      v15 = 0;
      goto LABEL_14;
    }
    v17 = (CFIndex *)malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
    *a3 = v17;
    if (v17)
    {
      if (FillOctetString(v17, v16))
      {
        v18 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
        *a4 = v18;
        if (v18)
        {
          v19 = copy_PCSSPKeyList();
          if (!(_DWORD)v19)
          {
            v15 = 1;
LABEL_13:
            CFRelease(v16);
LABEL_14:
            CFRelease(v13);
            goto LABEL_15;
          }
          _PCSErrorASN1(a5, (uint64_t)"copy PCSSPKeyList", v19);
        }
      }
    }
    v15 = 0;
    goto LABEL_13;
  }
  result = asn1_abort();
  __break(1u);
  return result;
}

void sub_1A9528CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __fillChainingKeys_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFData *v4;
  __CFData *v5;
  const __CFData *v6;
  __int128 v8;

  v8 = 0u;
  v4 = PCSIdentityCopyExportedPublicKey(a2);
  if (v4)
  {
    v5 = v4;
    if (!FillOctetString((CFIndex *)&v8, v4)
      || add_PCSSPKeyList((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
    {
LABEL_7:
      CFRelease(v5);
      return free_PCSSPKey();
    }
    CFRelease(v5);
    free_PCSSPKey();
    v6 = PCSIdentityCopyExportedPrivateKey(a2, 0);
    if (v6)
    {
      v5 = v6;
      if (FillOctetString((CFIndex *)&v8, v6))
        add_PCSSPKeyList((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
      goto LABEL_7;
    }
  }
  return free_PCSSPKey();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t PCSKeyRollingEnabled()
{
  return allow_rolling;
}

BOOL PCSManateeKeyRollingEnabled()
{
  BOOL v0;

  if (allow_rolling)
    v0 = allow_manatee_rolling == 0;
  else
    v0 = 1;
  return !v0;
}

BOOL PCSMasterKeyRollingEnabled()
{
  BOOL v0;

  if (allow_rolling)
    v0 = allow_masterkey_rolling == 0;
  else
    v0 = 1;
  return !v0;
}

BOOL PCSAllServiceKeyRollingEnabled()
{
  BOOL v0;

  if (allow_rolling)
    v0 = allow_allserviceidentity_rolling == 0;
  else
    v0 = 1;
  return !v0;
}

uint64_t PCSSetKeyRollingFlags(uint64_t result, char a2, char a3, char a4)
{
  allow_rolling = result;
  allow_manatee_rolling = a2;
  allow_masterkey_rolling = a3;
  allow_allserviceidentity_rolling = a4;
  return result;
}

uint64_t PCSIdentitySetRollManateeServices(uint64_t a1, int a2, _BYTE *a3, const void **a4)
{
  BOOL v8;
  _QWORD v10[7];
  int v11;
  _QWORD v12[3];
  time_t v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v13 = time(0);
  if (a3)
    *a3 = 0;
  if (allow_rolling)
    v8 = allow_manatee_rolling == 0;
  else
    v8 = 1;
  if (v8)
  {
    _PCSError(a4, 98, CFSTR("Identity rolling disabled"));
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __PCSIdentitySetRollManateeServices_block_invoke;
    v10[3] = &unk_1E553E298;
    v11 = a2;
    v10[4] = v12;
    v10[5] = a1;
    v10[6] = a3;
    PCSServiceItemsInfoIteration(v10);
  }
  _Block_object_dispose(v12, 8);
  return 1;
}

void sub_1A95290EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEnvelopedKeyMaterialReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

CFTypeRef PCSIdentitySetCreateNamed(const void *a1, const void **a2)
{
  CFTypeRef Mutable;
  const void *v5;
  const void *v6;
  const void *v7;
  CFTypeRef v8;

  Mutable = PCSIdentitySetCreateMutable(a2);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  if (addNamedServiceToSet((uint64_t)Mutable, 0, a1, 0)
    && (v6 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v5, kPCSServiceMaster, a2)) != 0)
  {
    v7 = v6;
    if (addNamedServiceToSet((uint64_t)v5, (uint64_t)v6, a1, (const __CFNumber *)CFSTR("Bladerunner"))
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, (const __CFNumber *)CFSTR("Hyperion"))
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, (const __CFNumber *)CFSTR("Liverpool"))
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceEscrow)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServicePianoMover)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceBackup)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceNotes)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceNews)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceFDE)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceSharing)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceKeyboardServices)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceActivities)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceGaming)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceiAD)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceBulkMail)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceBTPairing)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceBTAnnouncement)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceTTYCallHistory)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceContinuity)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceSafari)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSServiceCloudKitApple)
      && addNamedServiceToSet((uint64_t)v5, (uint64_t)v7, a1, kPCSHealthSync2))
    {
      v8 = CFRetain(v5);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
    v7 = v5;
  }
  CFRelease(v7);
  return v8;
}

BOOL addNamedServiceToSet(uint64_t a1, uint64_t a2, CFTypeRef cf, const __CFNumber *key)
{
  const void *v5;

  v5 = (const void *)__PCSIdentityCreateWithNameEmpty(a2, cf, key);
  if (v5)
  {
    PCSIdentitySetAddIdentity(a1, (uint64_t)v5);
    CFRelease(v5);
  }
  return v5 != 0;
}

void sub_1A952B53C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A952B5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A952B81C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A952B890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A952BA34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A952BBE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 _PCSUpdateKeychainForwardTable(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __n128 result;

  xmmword_1EEAEF300 = xmmword_1ECED4000;
  unk_1EEAEF310 = *(_OWORD *)&off_1ECED4010;
  qword_1EEAEF320 = (uint64_t)off_1ECED4020;
  savedPCSKeychainForwardTable = _PCSKeychainForwardTable;
  *(_OWORD *)algn_1EEAEF2F0 = *(_OWORD *)&qword_1ECED3FF0;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = *(_OWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 16);
  off_1ECED4020 = *(_UNKNOWN **)(a1 + 64);
  xmmword_1ECED4000 = v2;
  *(_OWORD *)&off_1ECED4010 = v1;
  *(_OWORD *)&qword_1ECED3FF0 = v3;
  result = *(__n128 *)a1;
  _PCSKeychainForwardTable = *(_OWORD *)a1;
  return result;
}

double _PCSResetKeychainForwardTable()
{
  double result;

  xmmword_1ECED4000 = xmmword_1EEAEF300;
  *(_OWORD *)&off_1ECED4010 = unk_1EEAEF310;
  off_1ECED4020 = (_UNKNOWN *)qword_1EEAEF320;
  result = *(double *)algn_1EEAEF2F0;
  _PCSKeychainForwardTable = savedPCSKeychainForwardTable;
  *(_OWORD *)&qword_1ECED3FF0 = *(_OWORD *)algn_1EEAEF2F0;
  return result;
}

uint64_t PCSIdentitySetCopyIdentity(uint64_t a1, uint64_t a2)
{
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return PCSIdentitySetCopyIdentityWithError(a1, a2, 0);
  else
    return 0;
}

uint64_t PCSIdentitySetCopyIdentityWithError(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 8))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetCopyIdentityByKeyID(uint64_t a1, uint64_t a2)
{
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 16))(a1, a2);
  else
    return 0;
}

const void *PCSIdentitySetCopyCurrentIdentityWithError(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v3;
  const void *v4;
  const void *v5;

  PCSIdentitySetCopyCurrentIdentityPointer(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)objc_msgSend(v3, "identity");
  v5 = v4;
  if (v4)
    CFRetain(v4);

  return v5;
}

id PCSIdentitySetCopyCurrentIdentityPointer(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v6;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
LABEL_8:
    v6 = 0;
    return v6;
  }
  if (!a2)
  {
    a2 = *(_QWORD *)(a1 + 32);
    if (!a2)
      goto LABEL_6;
  }
  if (!PCSServiceItemTypeIsManatee(a2) || CFEqual(**(CFTypeRef **)(a1 + 16), CFSTR("Memory")))
    goto LABEL_6;
  if (PCSIdentityGetCDPStatus(a1, a2, a3))
  {
    _PCSError(a3, 130, CFSTR("Manatee is not available"));
    goto LABEL_8;
  }
  if (PCSDaemonKeyRollIsPending(a1, a2))
  {
    _PCSError(a3, 135, CFSTR("Cannot retrieve the current identity for %@ while a keyroll is pending"), a2);
    goto LABEL_8;
  }
LABEL_6:
  __PCSIdentitySetCopyCurrentIdentityPointerInternal(a1, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

id __PCSIdentitySetCopyCurrentIdentityPointerInternal(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v6;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    if (!a2)
      a2 = *(_QWORD *)(a1 + 32);
    (*(void (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 24))(a1, a2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
    v6 = 0;
  }
  return v6;
}

const void *_PCSIdentitySetCopyCurrentIdentityInternal(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v3;
  const void *v4;
  const void *v5;

  __PCSIdentitySetCopyCurrentIdentityPointerInternal(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)objc_msgSend(v3, "identity");
  v5 = v4;
  if (v4)
    CFRetain(v4);

  return v5;
}

_QWORD *PCSIdentitySetCopyCurrentPublicIdentityWithError(uint64_t a1, uint64_t a2, const void **a3)
{
  const void *v6;
  const void *v7;
  _QWORD *v8;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    v6 = PCSIdentitySetCopyCurrentIdentityWithError(a1, a2, a3);
    if (v6)
    {
      v7 = v6;
      v8 = PCSIdentityCopyPublicIdentity((uint64_t)v6);
      CFRelease(v7);
      return v8;
    }
  }
  else
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  }
  return 0;
}

uint64_t PCSIdentitySetAddIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  CFTypeRef v5;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return 0;
  cf = 0;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(a1 + 16) + 40))(a1, a2, &cf);
  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = cf;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSIdentitySetAddIdentity failed with: %@", buf, 0xCu);
  }
  v5 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v5);
  }
  return v4;
}

uint64_t PCSIdentitySetAddIdentityWithError(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 40))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetRemoveIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 48))(a1, a2);
  return result;
}

uint64_t PCSIdentitySetSetCurrentIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 56))(a1, a2, 0);
  return result;
}

uint64_t PCSIdentitySetSetCurrentIdentityWithError(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 56))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetUnsetCurrentIdentity(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 64))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t _PCSIdentitySetIsCurrentIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 32))(a1, a2, 0);
  return result;
}

uint64_t _PCSIdentitySetIsCurrentIdentityPreferCache(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 32))(a1, a2, 1);
  return result;
}

uint64_t PCSIdentitySetEnumerateIdentities(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, id))(*(_QWORD *)(a1 + 16) + 72))(a1, a2, v5);
  else
    v6 = 0;

  return v6;
}

uint64_t PCSIdentitySetCopyIdentities(uint64_t a1, uint64_t a2)
{
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 80))(a1, a2);
  else
    return 0;
}

uint64_t PCSIdentitySetCopyOrderedIdentities(uint64_t a1, uint64_t a2)
{
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 88))(a1, a2);
  else
    return 0;
}

void PCSIdentitySetEnumeratePublicKeys(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
    (*(void (**)(uint64_t, id))(*(_QWORD *)(a1 + 16) + 96))(a1, v3);

}

void PCSIdentitySetRepairCurrentIdentity(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v7)(id, _QWORD, CFTypeRef);
  CFTypeRef v8;
  CFTypeRef cf;

  v7 = a4;
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void (**)(id, _QWORD, CFTypeRef)))(*(_QWORD *)(a1 + 16) + 104))(a1, a2, a3, v7);
  }
  else if (v7)
  {
    cf = 0;
    _PCSError(&cf, 152, CFSTR("Current persona does not match chosen dsid"));
    v7[2](v7, 0, cf);
    v8 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v8);
    }
  }

}

uint64_t PCSIdentitySetIsICDP(uint64_t a1, const void **a2)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 112))(a1, a2);
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetCompanionCircleMember(uint64_t a1, const void **a2)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 176))(a1, a2);
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetEnableCompanionCircleMember(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 184))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetIsICDPNetwork(uint64_t a1, const void **a2)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return PCSIdentitySetIsICDPNetworkWithOptions(a1, 0, a2);
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetIsICDPNetworkWithOptions(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 120))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetEnableICDP(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 128))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetIsPlesio(uint64_t a1, const void **a2)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 136))(a1, a2);
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetSetPlesio(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 144))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetIsWalrus(uint64_t a1, const void **a2)
{
  return PCSIdentitySetIsWalrusWithForceFetch(a1, 0, a2);
}

uint64_t PCSIdentitySetIsWalrusWithForceFetch(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 152))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetSetWalrus(uint64_t a1, uint64_t a2, const void **a3)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 160))(a1, a2, a3);
  _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetCopySet(uint64_t a1, const void **a2)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, const void **))(*(_QWORD *)(a1 + 16) + 168))(a1, a2);
  _PCSError(a2, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

BOOL _PCSRunningInUnitTests()
{
  return CFEqual(kPCSServiceName[0], CFSTR("ProtectedCloudStorage")) == 0;
}

CFComparisonResult _PCSIdentityComparePublicKey(uint64_t a1, uint64_t a2)
{
  const __CFString *PublicKey;
  const __CFString *v4;

  PublicKey = (const __CFString *)PCSIdentityGetPublicKey(a1);
  v4 = (const __CFString *)PCSIdentityGetPublicKey(a2);
  return CFStringCompare(PublicKey, v4, 0);
}

uint64_t PCSIdentitySetCreateExternalForm(uint64_t a1, uint64_t a2, char a3, const __CFArray *a4, const void **a5)
{
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a2) & 1) != 0)
    return PCSIdentitySetCreateExternalFormWithName(a1, a2, 0, a3, a4, a5);
  _PCSError(a5, 152, CFSTR("Current persona does not match chosen dsid"));
  return 0;
}

uint64_t PCSIdentitySetCreateExternalFormWithName(uint64_t a1, uint64_t a2, const __CFString *a3, char a4, const __CFArray *a5, const void **a6)
{
  const __CFDictionary *Mutable;
  char *v13;
  __CFData *v14;
  const __CFDictionary *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  int64_t Count;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  const void *ValueAtIndex;
  _DWORD *v28;
  CFIndex v29;
  __CFData *v30;
  __CFData *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  CFIndex v37;
  __CFData *v38;
  int v39;
  uint64_t result;
  _QWORD v41[6];
  _QWORD v42[5];
  _QWORD v43[10];
  _QWORD context[7];
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CFRange v58;
  CFRange v59;
  CFRange v60;
  CFRange v61;
  CFRange v62;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a2) & 1) == 0)
  {
    _PCSError(a6, 152, CFSTR("Current persona does not match chosen dsid"));
    return 0;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x6010000000;
  v53 = &unk_1A95609B5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    _PCSErrorOOM(a6);
    v14 = 0;
LABEL_53:
    free_PCSKeySet();
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    return (uint64_t)v14;
  }
  if (!a2)
  {
    _PCSError(a6, 125, CFSTR("%s: identity missing"), "CFDataRef PCSIdentitySetCreateExternalFormWithName(PCSLogContextRef, PCSIdentitySetRef, CFStringRef, BOOL, CFArrayRef, CFErrorRef *)");
LABEL_42:
    v14 = 0;
    v16 = 0;
    v15 = 0;
LABEL_43:
    v17 = 0;
    goto LABEL_44;
  }
  if (a3)
    v13 = PCSCFStringToCString(a3);
  else
    v13 = strdup("ks");
  v51[4] = (uint64_t)v13;
  if (!PCSCurrentPersonaMatchesDSIDFromSet(a2))
    goto LABEL_42;
  v15 = (const __CFDictionary *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a2 + 16) + 80))(a2, 0);
  if (!v15)
  {
LABEL_56:
    v14 = 0;
    v16 = 0;
    goto LABEL_43;
  }
  v16 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!v16)
  {
    _PCSErrorOOM(a6);
    goto LABEL_56;
  }
  v17 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!v17)
  {
    _PCSErrorOOM(a6);
    v14 = 0;
    goto LABEL_43;
  }
  v18 = MEMORY[0x1E0C809B0];
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __PCSIdentitySetCreateExternalFormWithName_block_invoke;
  context[3] = &__block_descriptor_57_e15_v24__0r_v8r_v16l;
  v45 = a4;
  context[4] = a5;
  context[5] = a1;
  context[6] = v16;
  CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)apply_block_2_2, context);
  v58.length = CFArrayGetCount(v16);
  v58.location = 0;
  CFArraySortValues(v16, v58, (CFComparatorFunction)_PCSIdentityComparePublicKey, 0);
  v43[0] = v18;
  v43[1] = 3221225472;
  v43[2] = __PCSIdentitySetCreateExternalFormWithName_block_invoke_34;
  v43[3] = &unk_1E553E330;
  v43[4] = &v46;
  v43[5] = &v50;
  v43[6] = a6;
  v43[7] = a2;
  v43[8] = v17;
  v43[9] = Mutable;
  v19 = v43;
  v59.length = CFArrayGetCount(v16);
  v59.location = 0;
  CFArrayApplyFunction(v16, v59, (CFArrayApplierFunction)apply_block_1_1, v19);

  v42[0] = v18;
  v42[1] = 3221225472;
  v42[2] = __PCSIdentitySetCreateExternalFormWithName_block_invoke_2;
  v42[3] = &__block_descriptor_40_e10_v16__0r_v8l;
  v42[4] = Mutable;
  v20 = v42;
  v60.length = CFArrayGetCount(v17);
  v60.location = 0;
  CFArrayApplyFunction(v17, v60, (CFArrayApplierFunction)apply_block_1_1, v20);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v41[0] = v18;
    v41[1] = 3221225472;
    v41[2] = __PCSIdentitySetCreateExternalFormWithName_block_invoke_3;
    v41[3] = &__block_descriptor_48_e15_v24__0r_v8r_v16l;
    v41[4] = v17;
    v41[5] = a2;
    CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)apply_block_2_2, v41);
  }
  v61.length = CFArrayGetCount(v16);
  v61.location = 0;
  CFArraySortValues(v16, v61, (CFComparatorFunction)PCSIdentityCompareServiceNumber, 0);
  Count = CFArrayGetCount(v17);
  v22 = malloc_type_calloc(Count, 0x18uLL, 0x10800404ACF7207uLL);
  v23 = v51;
  v51[8] = (uint64_t)v22;
  if (Count >= 1)
  {
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = v23[8];
      ValueAtIndex = CFArrayGetValueAtIndex(v17, v25);
      __PCSFillCurrentsKey((uint64_t)ValueAtIndex, v26 + v24);
      ++v25;
      v23 = v51;
      *((_DWORD *)v51 + 14) = v25;
      v24 += 24;
    }
    while (Count != v25);
  }
  v28 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v51[10] = (uint64_t)v28;
  if (!v28)
  {
    _PCSErrorOOM(a6);
    goto LABEL_37;
  }
  *v28 = 5;
  if (a5)
  {
    *(_DWORD *)v51[10] |= 2u;
    if (CFArrayGetCount(a5) == 1)
    {
      v62.location = 0;
      v62.length = 1;
      if (CFArrayContainsValue(a5, v62, kPCSServiceFDE))
        *(_DWORD *)v51[10] |= 8u;
    }
  }
  v29 = length_PCSKeySet();
  v30 = CFDataCreateMutable(0, v29);
  v31 = v30;
  if (!v30)
    goto LABEL_35;
  CFDataSetLength(v30, v29);
  CFDataGetMutableBytePtr(v31);
  v32 = encode_PCSKeySet();
  *((_DWORD *)v47 + 6) = v32;
  if (v32)
  {
    CFRelease(v31);
    v33 = *((unsigned int *)v47 + 6);
    if ((_DWORD)v33)
      goto LABEL_36;
    v31 = 0;
  }
  else if (v29)
  {
    goto LABEL_61;
  }
  v34 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
  v51[9] = (uint64_t)v34;
  if (!v34)
  {
LABEL_60:
    v14 = 0;
    goto LABEL_45;
  }
  v35 = malloc_type_malloc(0x20uLL, 0x40DE3AC1uLL);
  *(_QWORD *)(v51[9] + 8) = v35;
  v36 = (_QWORD *)v51[9];
  if (!v36[1])
  {
    _PCSErrorOOM(a6);
    goto LABEL_60;
  }
  *v36 = 32;
  ccsha256_di();
  CFDataGetLength(v31);
  CFDataGetBytePtr(v31);
  ccdigest();
  if (v31)
    CFRelease(v31);
  v37 = length_PCSKeySet();
  v38 = CFDataCreateMutable(0, v37);
  v14 = v38;
  if (!v38)
  {
LABEL_35:
    v33 = 12;
    *((_DWORD *)v47 + 6) = 12;
    goto LABEL_36;
  }
  CFDataSetLength(v38, v37);
  CFDataGetMutableBytePtr(v14);
  v39 = encode_PCSKeySet();
  *((_DWORD *)v47 + 6) = v39;
  if (v39)
  {
    CFRelease(v14);
    v33 = *((unsigned int *)v47 + 6);
    if (!(_DWORD)v33)
    {
LABEL_37:
      v14 = 0;
LABEL_44:
      v31 = 0;
      goto LABEL_45;
    }
LABEL_36:
    _PCSError(a6, 7, CFSTR("PCSKeySet encode error: %d"), v33);
    goto LABEL_37;
  }
  if (!v37)
  {
    CFRetain(v14);
    v31 = v14;
LABEL_45:
    CFRelease(Mutable);
    if (v16)
      CFRelease(v16);
    if (v15)
      CFRelease(v15);
    if (v17)
      CFRelease(v17);
    if (v31)
      CFRelease(v31);
    goto LABEL_53;
  }
LABEL_61:
  result = asn1_abort();
  __break(1u);
  return result;
}

void sub_1A952D2F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t PCSIdentityCompareServiceNumber(uint64_t a1, uint64_t a2)
{
  unsigned int ServiceID;
  unsigned int v4;
  uint64_t v5;

  ServiceID = PCSIdentityGetServiceID(a1);
  v4 = PCSIdentityGetServiceID(a2);
  if (ServiceID >= v4)
    v5 = 0;
  else
    v5 = -1;
  if (ServiceID > v4)
    return 1;
  else
    return v5;
}

const void *PCSIdentitySetCreateFromExternalForm(const __CFDictionary *a1, const __CFData *a2, uint64_t a3, const void **a4)
{
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  uint64_t v13;
  CFTypeRef Mutable;
  const void *v15;
  const void *v16;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a1, kPCSSetupForceValidateKey[0]);
    if (Value)
    {
      v8 = Value;
      v9 = CFGetTypeID(Value);
      if (v9 == CFBooleanGetTypeID())
        CFBooleanGetValue(v8);
    }
    v10 = (const __CFBoolean *)CFDictionaryGetValue(a1, kPCSSetupDontImportManatee[0]);
    if (v10)
    {
      v11 = v10;
      v12 = CFGetTypeID(v10);
      if (v12 == CFBooleanGetTypeID())
        CFBooleanGetValue(v11);
    }
  }
  if (!a2)
  {
    _PCSError(a4, 126, CFSTR("%s: data missing"), "PCSIdentitySetRef PCSIdentitySetCreateFromExternalForm(CFDictionaryRef, CFDataRef, uint32_t *, CFErrorRef *)");
    goto LABEL_15;
  }
  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  v13 = decode_PCSKeySet();
  if ((_DWORD)v13)
  {
    _PCSError(a4, 8, CFSTR("PCSKeySet decode error: %d"), v13);
    goto LABEL_15;
  }
  Mutable = PCSIdentitySetCreateMutable(a4);
  if (!Mutable)
  {
LABEL_15:
    free_PCSKeySet();
    return 0;
  }
  v15 = Mutable;
  CFRetain(Mutable);
  v16 = v15;
  free_PCSKeySet();
  CFRelease(v15);
  return v16;
}

CFTypeRef PCSIdentitySetCreateMutable(const void **a1)
{
  _QWORD *Instance;
  _QWORD *v3;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  CFTypeRef v7;

  PCSIdentitySetGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v3 = Instance;
    _PCSIdentitySetInitialize(Instance);
    v3[2] = &PCSIdentitySetMemory;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v3[7] = Mutable;
    if (Mutable
      && (v5 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), (v3[8] = v5) != 0)
      && (v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), (v3[9] = v6) != 0))
    {
      *((_BYTE *)v3 + 88) = 0;
      v7 = CFRetain(v3);
    }
    else
    {
      _PCSErrorOOM(a1);
      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    _PCSErrorOOM(a1);
    return 0;
  }
  return v7;
}

uint64_t PCSIdentitySetGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSIdentitySetGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSIdentitySetGetTypeID_sPCSIdentitySetGetTypeIDSingleton;
  if (PCSIdentitySetGetTypeID_sPCSIdentitySetGetTypeIDOnce != -1)
    dispatch_once(&PCSIdentitySetGetTypeID_sPCSIdentitySetGetTypeIDOnce, block);
  return PCSIdentitySetGetTypeID_sPCSIdentitySetGetTypeIDSingleton;
}

void PCSIdentitySetDestroy(_QWORD *a1)
{
  void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  v2 = (void *)a1[3];
  a1[3] = 0;

  v3 = (const void *)a1[4];
  if (v3)
  {
    a1[4] = 0;
    CFRelease(v3);
  }
  v4 = (const void *)a1[5];
  if (v4)
  {
    a1[5] = 0;
    CFRelease(v4);
  }
  v5 = (const void *)a1[6];
  if (v5)
  {
    a1[6] = 0;
    CFRelease(v5);
  }
  v6 = (const void *)a1[9];
  if (v6)
  {
    a1[9] = 0;
    CFRelease(v6);
  }
  v7 = (const void *)a1[7];
  if (v7)
  {
    a1[7] = 0;
    CFRelease(v7);
  }
  v8 = (const void *)a1[8];
  if (v8)
  {
    a1[8] = 0;
    CFRelease(v8);
  }
  v9 = (const void *)a1[10];
  if (v9)
  {
    a1[10] = 0;
    CFRelease(v9);
  }
}

BOOL PCSIdentitySetCompare(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef PCSIdentitySetCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<PCSIdentitySet:%p>"), a1);
}

void _PCSIdentitySetInitialize(_QWORD *a1)
{
  dispatch_queue_t v2;
  void *v3;
  char __str[64];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x40uLL, "PCSIdentitySet.%p", a1);
  v2 = dispatch_queue_create(__str, 0);
  v3 = (void *)a1[3];
  a1[3] = v2;

}

const void **PCSIdentitySetCreateClassic(CFDictionaryRef theDict, const void *a2, const void **a3, int a4, int a5, int a6, int a7, int a8)
{
  const void **v8;
  __CFString *Value;
  __CFString *v12;
  CFTypeID v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const __CFData *v18;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v8 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  if (!theDict)
    goto LABEL_5;
  Value = (__CFString *)CFDictionaryGetValue(theDict, kPCSSetupDSID[0]);
  v12 = Value;
  if (!Value)
    goto LABEL_6;
  v13 = CFGetTypeID(Value);
  if (v13 != CFStringGetTypeID())
  {
    _PCSError(v8, 47, CFSTR("DSID not a string"));
    return 0;
  }
  if (!CFEqual(v12, kPCSSetupDSIDAny[0]))
  {
LABEL_6:
    if (PCSCurrentPersonaMatchesDSID(v12))
      goto LABEL_7;
    if (!v8)
      return v8;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = kPCSErrorDomain;
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 152, v22);
    *v8 = (const void *)objc_claimAutoreleasedReturnValue();

    return 0;
  }
LABEL_5:
  v12 = 0;
LABEL_7:
  v18 = (const __CFData *)__PCSCopyFromiCloudKeychain(v12, 0, (int)a3, a4, a5, a6, a7, a8);
  if (!v18)
  {
    v18 = (const __CFData *)__PCSCopyFromKeychain((uint64_t)kPCSServiceName[0], 0, v12, v8, v14, v15, v16, v17);
    if (!v18)
      return 0;
  }
  v8 = (const void **)PCSIdentitySetCreateFromExternalForm(theDict, v18, 0, v8);
  if (v8)
  {
    if (a2)
      CFRetain(a2);
    v8[4] = a2;
  }
  CFRelease(v18);
  return v8;
}

BOOL _PCSKeychainAmendCKKSEntry(uint64_t a1, __CFDictionary *a2)
{
  __CFData *v4;
  __CFData *v5;
  uint64_t v6;
  _BOOL8 v7;
  const void *v8;
  CFNumberRef v9;

  v4 = PCSIdentityCopyExportedPublicKey(a1);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = PCSIdentityCopyPublicKeyInfo(a1);
  v7 = v6 != 0;
  if (v6)
  {
    v8 = (const void *)v6;
    v9 = PCSIdentityCopyServiceNumber(a1);
    if (v9)
    {
      CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E0CD6AB0], v5);
      CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E0CD6AA8], v8);
      CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E0CD6AB8], v9);
    }
    CFRelease(v5);
    CFRelease(v8);
    if (!v9)
      return 0;
  }
  else
  {
    v9 = v5;
  }
  CFRelease(v9);
  return v7;
}

CFTypeRef _PCSIdentityCopyKeychainAttributes(uint64_t a1)
{
  uint64_t ServiceName;
  __CFString *v3;
  const __CFString *PublicKey;
  CFStringRef v5;
  CFStringRef v6;
  const __CFDictionary *v7;
  const void *v8;
  int AccessGroupByName;
  CFNumberRef v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  __CFDictionary *MutableForCFTypesWith;
  const void *ServiceViewHint;
  CFTypeRef v20;
  CFNumberRef v22;
  uint64_t v23;
  void *key;
  CFNumberRef v25;
  CFStringRef v26;
  const void *v27;
  CFRange v28;

  v27 = 0;
  ServiceName = PCSIdentityGetServiceName(a1);
  if (!ServiceName)
    return 0;
  v3 = (__CFString *)ServiceName;
  v25 = IdentityCopyServiceNumber(a1, 0);
  if (!v25)
    return 0;
  PublicKey = (const __CFString *)PCSIdentityGetPublicKey(a1);
  if (!PublicKey
    || (v28.location = 0, v28.length = 8, (v5 = CFStringCreateWithSubstring(0, PublicKey, v28)) == 0))
  {
    v22 = v25;
LABEL_20:
    CFRelease(v22);
    return 0;
  }
  v6 = v5;
  if (!PCSIdentityGetKeyID(a1) || (v26 = CFStringCreateWithFormat(0, 0, CFSTR("PCS %@ - %@"), v3, v6)) == 0)
  {
    CFRelease(v25);
    v22 = (CFNumberRef)v6;
    goto LABEL_20;
  }
  v7 = PCSIdentityCopyExportedPrivateKey(a1, &v27);
  if (v7)
  {
    key = (void *)*MEMORY[0x1E0CD6C98];
    v23 = *MEMORY[0x1E0CD6CB8];
    PCSServiceItemGetAccessClassByName(v3);
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
    AccessGroupByName = PCSServiceItemGetAccessGroupByName(v3);
    v10 = v25;
    MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(AccessGroupByName, v11, v12, v13, v14, v15, v16, v17, key, v23);
    ServiceViewHint = (const void *)PCSIdentityGetServiceViewHint(a1);
    if (ServiceViewHint)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B78], ServiceViewHint);
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], v8);
    _PCSKeychainAmendCKKSEntry(a1, MutableForCFTypesWith);
    v20 = CFRetain(MutableForCFTypesWith);
  }
  else
  {
    MutableForCFTypesWith = 0;
    v20 = 0;
    v10 = v25;
  }
  CFRelease(v10);
  CFRelease(v26);
  CFRelease(v6);
  if (v7)
    CFRelease(v7);
  if (MutableForCFTypesWith)
    CFRelease(MutableForCFTypesWith);
  return v20;
}

CFNumberRef IdentityCopyServiceNumber(uint64_t a1, int a2)
{
  int ServiceID;
  int valuePtr;

  ServiceID = PCSIdentityGetServiceID(a1);
  if (!ServiceID)
    return 0;
  valuePtr = ServiceID | a2;
  return CFNumberCreate(0, kCFNumberIntType, &valuePtr);
}

id _PCSIdentitySetGetAltDSIDorPCSAccountsModel(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;

  v2 = *(id *)(a1 + 48);
  if (!v2)
  {
    v3 = *(id *)(a1 + 40);
    if (v3)
    {
      v4 = v3;
      +[PCSAccountsModel altDSIDForDSID:](PCSAccountsModel, "altDSIDForDSID:", v3);
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

uint64_t _PCSIdentitySetGetAltDSID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t _PCSIdentitySetGetDSID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t PCSIdentityCreateFromPersistentReference(void *a1, void *a2)
{
  return PCSIdentityCreateFromPersistentReferenceAndGetSHA1(a1, a2, 0);
}

uint64_t PCSIdentityCreateFromPersistentReferenceAndGetSHA1(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD *v23;
  CFTypeRef v25;
  id v26;
  CFTypeRef cf;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  CFTypeRef v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  cf = 0;
  v26 = 0;
  v7 = *MEMORY[0x1E0CD7018];
  v32[0] = *MEMORY[0x1E0CD7010];
  v32[1] = v7;
  v33[0] = MEMORY[0x1E0C9AAB0];
  v33[1] = MEMORY[0x1E0C9AAB0];
  v32[2] = *MEMORY[0x1E0CD70E0];
  v33[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3)
    *a3 = 0;
  v10 = _PCSKeychainForwardTable(v8, &v26);
  if (!v10)
  {
    v13 = v26;
    if (a3)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B38]);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v6)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v6);

      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v18 = MEMORY[0x1E0C81028];
          v19 = "invalid identity: incorrect dsid";
          goto LABEL_22;
        }
LABEL_23:
        v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", kPCSAccount[0]);

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E0C81028];
        v19 = "invalid identity: incorrect acct";
LABEL_22:
        _os_log_impl(&dword_1A9508000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B40]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", kPCSServiceName[0]);

    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E0C81028];
        v19 = "invalid identity: incorrect sdmn";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = PCSIdentityCreateWithKeychainAttributes((const __CFDictionary *)v13, &cf);
      if (v23)
      {
        v12 = (uint64_t)v23;
        _PCSIdentitySetPersistentReference((uint64_t)v23, v5);
        _PCSIdentityCheckPCSAttributes(v12, v13);
LABEL_33:

        goto LABEL_24;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v5;
        v30 = 2112;
        v31 = cf;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to parse identity item: %@: %@", buf, 0x16u);
      }
      v25 = cf;
      if (cf)
      {
        cf = 0;
        CFRelease(v25);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "invalid identity: no data", buf, 2u);
    }
    v12 = 0;
    goto LABEL_33;
  }
  v11 = v10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v5;
    v30 = 1024;
    LODWORD(v31) = v11;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to fetch item: %@: %d", buf, 0x12u);
  }
  v12 = 0;
LABEL_25:

  return v12;
}

CFTypeRef PCSIdentitySetCreateKeychain(const __CFDictionary *a1, const void *a2, const void **a3)
{
  _QWORD *Instance;
  _QWORD *v7;
  const void *Value;
  const void *v9;
  CFTypeID v10;
  const void *v11;
  const void *v12;
  CFTypeID v13;
  CFTypeRef v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    _PCSError(a3, 47, CFSTR("Options parameter missing"));
    return 0;
  }
  PCSIdentitySetGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    _PCSErrorOOM(a3);
    return 0;
  }
  v7 = Instance;
  _PCSIdentitySetInitialize(Instance);
  v7[2] = &PCSIdentitySetKeychain;
  Value = CFDictionaryGetValue(a1, kPCSSetupDSID[0]);
  if (Value && (v9 = Value, v10 = CFGetTypeID(Value), v10 == CFStringGetTypeID()))
  {
    v11 = CFDictionaryGetValue(a1, kPCSSetupAltDSID[0]);
    v12 = v11;
    if (!v11 || (v13 = CFGetTypeID(v11), v13 == CFStringGetTypeID()))
    {
      if (kPCSSetupDSIDAny[0] && CFEqual(v9, kPCSSetupDSIDAny[0]))
      {
        v7[5] = 0;
LABEL_13:
        if (a2)
          CFRetain(a2);
        v7[4] = a2;
        v14 = CFRetain(v7);
        goto LABEL_16;
      }
      CFRetain(v9);
      v7[5] = v9;
      if (v12)
        CFRetain(v12);
      v7[6] = v12;
      if ((PCSCurrentPersonaMatchesDSIDFromSet((uint64_t)v7) & 1) != 0)
        goto LABEL_13;
      if (a3)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = kPCSErrorDomain;
        v19 = *MEMORY[0x1E0CB2D50];
        v20[0] = CFSTR("Current persona does not match chosen dsid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 152, v17);
        *a3 = (const void *)objc_claimAutoreleasedReturnValue();

      }
      CFRelease(v7);
      return 0;
    }
    _PCSError(a3, 47, CFSTR("altDSID not a string"));
  }
  else
  {
    _PCSError(a3, 47, CFSTR("DSID not a string"));
  }
  v14 = 0;
LABEL_16:
  CFRelease(v7);
  return v14;
}

__CFDictionary *_PCSCopyPIIClearedOptions(CFDictionaryRef theDict)
{
  __CFDictionary *MutableCopy;
  __CFDictionary *v2;

  if (!theDict)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  v2 = MutableCopy;
  if (MutableCopy)
  {
    _PCSHideKeyValue(MutableCopy, kPCSSetupAuthToken[0]);
    _PCSHideKeyValue(v2, kPCSSetupDSID[0]);
    _PCSHideKeyValue(v2, kPCSSetupAltDSID[0]);
    _PCSHideKeyValue(v2, kPCSSetupPassword[0]);
    _PCSHideKeyValue(v2, kPCSSetupUsername[0]);
    _PCSHideKeyValue(v2, kPCSSetupHSMContent[0]);
    _PCSHideKeyValue(v2, kPCSSetupHSMMetaData[0]);
  }
  return v2;
}

void _PCSHideKeyValue(__CFDictionary *a1, const void *a2)
{
  if (CFDictionaryGetValue(a1, a2))
    CFDictionarySetValue(a1, a2, CFSTR("<<VALUE>>"));
}

CFTypeRef PCSIdentitySetCreate(const __CFDictionary *a1, const void *a2, const void **a3)
{
  const void *Value;
  __CFDictionary *v7;
  NSObject *v8;
  int v10;
  const void *v11;
  __int16 v12;
  __CFDictionary *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, kPCSSetupLogContext[0]);
    v7 = _PCSCopyPIIClearedOptions(a1);
    PCSLogGetOSLog((uint64_t)Value);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = a2;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1A9508000, v8, OS_LOG_TYPE_DEFAULT, "PCSIdentitySetCreate: %{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
    }

    if (v7)
      CFRelease(v7);
  }
  return PCSIdentitySetCreateKeychain(a1, a2, a3);
}

uint64_t PCSIdentitySetCopyService(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  return v1;
}

void _PCSIdentitySetSetService(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    *(_QWORD *)(a1 + 32) = 0;
    CFRelease(v4);
  }
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 32) = cf;
}

const void *PCSIdentitySetGetCurrentCreationTime(uint64_t a1, uint64_t a2, const void **a3)
{
  const void *result;
  const void *v5;
  uint64_t CreationTime;

  result = _PCSIdentitySetCopyCurrentIdentityInternal(a1, a2, a3);
  if (result)
  {
    v5 = result;
    CreationTime = PCSIdentityGetCreationTime((uint64_t)result, a3);
    CFRelease(v5);
    return (const void *)CreationTime;
  }
  return result;
}

uint64_t _PCSIdentitySetCopyPersonaIdentifier(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___PCSIdentitySetCopyPersonaIdentifier_block_invoke;
  v4[3] = &unk_1E553E378;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _PCSIdentitySetSetPersonaIdentifier(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *(NSObject **)(a1 + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___PCSIdentitySetSetPersonaIdentifier_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a2;
  dispatch_sync(v2, v3);
}

uint64_t apply_block_2_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t apply_block_1_1(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

CFTypeRef MemoryCopyIdentity(uint64_t a1, const void *a2, const void **a3)
{
  const void *Value;
  const void *v7;
  const __CFNumber *v8;
  unsigned int IndexByName;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
    if (Value)
    {
      v7 = Value;
      v8 = *(const __CFNumber **)(a1 + 32);
      if (!v8)
        return CFRetain(v7);
      IndexByName = PCSServiceItemGetIndexByName(v8);
      if (IndexByName == PCSIdentityGetServiceID((uint64_t)v7))
        return CFRetain(v7);
    }
    else
    {
      _PCSError(a3, 27, CFSTR("service %@ not found"), a2);
    }
  }
  else
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
  }
  return 0;
}

const void *MemoryCopyByKeyID(uint64_t a1, const void *a2)
{
  const void *Value;
  const void *v5;

  if (!PCSCurrentPersonaMatchesDSIDFromSet(a1))
    return 0;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  v5 = Value;
  if (Value)
    CFRetain(Value);
  return v5;
}

PCSCurrentIdentity *MemoryCopyCurrentIdentity(uint64_t a1, const void *a2, const void **a3)
{
  PCSCurrentIdentity *NumberByName;
  const void *Value;
  const __CFString *v8;
  const void **v9;
  CFIndex v10;
  const void *v12;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    v8 = CFSTR("Current persona does not match chosen dsid");
    v9 = a3;
    v10 = 152;
LABEL_8:
    _PCSError(v9, v10, v8, v12);
    NumberByName = 0;
    return NumberByName;
  }
  if (!a2)
  {
    a2 = *(const void **)(a1 + 32);
    if (!a2)
    {
      v8 = CFSTR("service missing");
LABEL_12:
      v9 = a3;
      v10 = 27;
      goto LABEL_8;
    }
  }
  NumberByName = (PCSCurrentIdentity *)PCSServiceItemGetNumberByName(a2);
  if (NumberByName)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), NumberByName);
    if (Value)
    {
      NumberByName = -[PCSCurrentIdentity initWithIdentity:currentItemPointerModificationTime:]([PCSCurrentIdentity alloc], "initWithIdentity:currentItemPointerModificationTime:", Value, 0);
      return NumberByName;
    }
    v12 = a2;
    v8 = CFSTR("Identity of service type %@ missing in memory keyset");
    goto LABEL_12;
  }
  return NumberByName;
}

BOOL MemoryIsCurrentIdentity(uint64_t a1, const void *a2)
{
  CFNumberRef v4;
  CFNumberRef v5;
  const void *Value;
  _BOOL8 v7;

  v4 = PCSIdentityCopyServiceNumber((uint64_t)a2);
  if (!v4)
    return 0;
  v5 = v4;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), v4);
  if (Value)
    v7 = CFEqual(Value, a2) != 0;
  else
    v7 = 0;
  CFRelease(v5);
  return v7;
}

uint64_t MemoryAddIdentity(uint64_t a1, const void *a2, const void **a3)
{
  __CFDictionary *v7;
  const void *PublicKey;
  __CFDictionary *v9;
  const void *KeyID;
  CFNumberRef v11;
  CFNumberRef v12;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
    return 0;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    _PCSError(a3, 107, CFSTR("Memory set readonly"));
    return 0;
  }
  v7 = *(__CFDictionary **)(a1 + 56);
  PublicKey = (const void *)PCSIdentityGetPublicKey((uint64_t)a2);
  CFDictionarySetValue(v7, PublicKey, a2);
  v9 = *(__CFDictionary **)(a1 + 64);
  KeyID = (const void *)PCSIdentityGetKeyID((uint64_t)a2);
  CFDictionarySetValue(v9, KeyID, a2);
  v11 = PCSIdentityCopyServiceNumber((uint64_t)a2);
  if (v11)
  {
    v12 = v11;
    if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), v11))
    {
      if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
        (*(void (**)(uint64_t, const void *, _QWORD))(*(_QWORD *)(a1 + 16) + 56))(a1, a2, 0);
    }
    CFRelease(v12);
  }
  return 1;
}

uint64_t MemoryRemoveIdentity(uint64_t a1, const void *a2)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  __CFDictionary *v7;
  const void *KeyID;

  result = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 88))
    {
      return 0;
    }
    else
    {
      result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
      if (result)
      {
        v5 = result;
        v6 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 32))(a1, result, 0);
        result = 0;
        if ((v6 & 1) == 0)
        {
          v7 = *(__CFDictionary **)(a1 + 64);
          KeyID = (const void *)PCSIdentityGetKeyID(v5);
          CFDictionaryRemoveValue(v7, KeyID);
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 56), a2);
          return 1;
        }
      }
    }
  }
  return result;
}

CFNumberRef MemorySetCurrentIdentity(uint64_t a1, const void *a2, const void **a3)
{
  CFNumberRef result;
  const void *v7;
  __CFDictionary *v8;
  const void *PublicKey;
  __CFDictionary *v10;
  const void *KeyID;

  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
  {
    _PCSError(a3, 152, CFSTR("Current persona does not match chosen dsid"));
    return 0;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    _PCSError(a3, 107, CFSTR("Memory set readonly"));
    return 0;
  }
  result = PCSIdentityCopyServiceNumber((uint64_t)a2);
  if (result)
  {
    v7 = result;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), result, a2);
    v8 = *(__CFDictionary **)(a1 + 56);
    PublicKey = (const void *)PCSIdentityGetPublicKey((uint64_t)a2);
    CFDictionarySetValue(v8, PublicKey, a2);
    v10 = *(__CFDictionary **)(a1 + 64);
    KeyID = (const void *)PCSIdentityGetKeyID((uint64_t)a2);
    CFDictionarySetValue(v10, KeyID, a2);
    CFRelease(v7);
    return (CFNumberRef)1;
  }
  return result;
}

uint64_t MemoryUnsetCurrentIdentity(uint64_t a1, void *key)
{
  const void *NumberByName;

  NumberByName = PCSServiceItemGetNumberByName(key);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 72), NumberByName);
  return 1;
}

uint64_t MemoryEnumerateIdentities(uint64_t a1, const void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  const void *Value;
  CFTypeID v8;
  const __CFDictionary *v9;
  _QWORD v11[4];
  id v12;
  const void *v13;

  v5 = a3;
  v6 = PCSCurrentPersonaMatchesDSIDFromSet(a1);
  if ((_DWORD)v6)
  {
    Value = *(const void **)(a1 + 32);
    if (a2)
    {
      v8 = CFGetTypeID(a2);
      if (v8 == CFDictionaryGetTypeID() && !Value)
        Value = CFDictionaryGetValue((CFDictionaryRef)a2, kPCSSetupService[0]);
    }
    v9 = *(const __CFDictionary **)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MemoryEnumerateIdentities_block_invoke;
    v11[3] = &unk_1E553E3C0;
    v13 = Value;
    v12 = v5;
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)apply_block_2_2, v11);

  }
  return v6;
}

CFMutableDictionaryRef MemoryCopyIdentities(uint64_t a1, const void *a2)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  _QWORD v7[5];

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = Mutable;
  if (Mutable)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __MemoryCopyIdentities_block_invoke;
    v7[3] = &__block_descriptor_40_e27_v16__0___PCSIdentityData__8l;
    v7[4] = Mutable;
    if ((MemoryEnumerateIdentities(a1, a2, v7) & 1) == 0)
    {
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

CFArrayRef MemoryCopyOrderedIdentities(uint64_t a1, const void *a2)
{
  __CFArray *Mutable;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  id v10;
  CFRange v11;
  CFArrayRef Copy;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  const void *v17;
  __CFArray *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0
    && (Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378])) != 0)
  {
    MemoryCopyCurrentIdentity(a1, a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (v7 = objc_msgSend(v5, "identity"), _PCSIdentityValidate(v7, (_BYTE *)v20 + 24, 0))
      && !*((_BYTE *)v20 + 24))
    {
      CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v6, "identity"));
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    v9 = *(const __CFDictionary **)(a1 + 56);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __MemoryCopyOrderedIdentities_block_invoke;
    v14[3] = &unk_1E553E408;
    v17 = a2;
    v10 = v6;
    v15 = v10;
    v16 = &v19;
    v18 = Mutable;
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)apply_block_2_2, v14);
    v11.length = CFArrayGetCount(Mutable) - v8;
    if (v11.length >= 2)
    {
      v11.location = v8;
      CFArraySortValues(Mutable, v11, (CFComparatorFunction)_PCSIdentityComparePublicKey, 0);
    }
    Copy = CFArrayCreateCopy(0, Mutable);
    CFRelease(Mutable);

  }
  else
  {
    Copy = 0;
  }
  _Block_object_dispose(&v19, 8);
  return Copy;
}

void sub_1A952F83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MemoryEnumeratePublicKeys(uint64_t a1, void *a2)
{
  id v3;
  const __CFDictionary *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  if (PCSCurrentPersonaMatchesDSIDFromSet(a1))
  {
    v4 = *(const __CFDictionary **)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __MemoryEnumeratePublicKeys_block_invoke;
    v5[3] = &unk_1E553E3C0;
    v7 = a1;
    v6 = v3;
    CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)apply_block_2_2, v5);

  }
}

uint64_t MemoryRepairCurrentIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 1, 0);
  return result;
}

uint64_t MemoryIsICDP(int a1, const void **a2)
{
  _PCSError(a2, 61, CFSTR("Memory is not for iCDP"));
  return 0;
}

uint64_t MemoryIsICDPNetwork(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory is not for iCDP"));
  return 0;
}

uint64_t MemorySetICDP(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory is not for iCDP"));
  return 0;
}

uint64_t MemoryIsPlesio(int a1, const void **a2)
{
  _PCSError(a2, 61, CFSTR("Memory is not for Plesio"));
  return 0;
}

uint64_t MemorySetPlesio(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory is not for Plesio"));
  return 0;
}

uint64_t MemoryIsWalrus(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory sets do not support Walrus"));
  return 0;
}

uint64_t MemorySetWalrus(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory sets do not support Walrus"));
  return 0;
}

CFTypeRef MemoryCopySet(CFDictionaryRef *a1, const void **a2)
{
  _QWORD *Instance;
  _QWORD *v5;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v7;
  CFMutableDictionaryRef v8;
  CFTypeRef v9;

  PCSIdentitySetGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    v5 = Instance;
    _PCSIdentitySetInitialize(Instance);
    v5[2] = &PCSIdentitySetMemory;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1[7]);
    v5[7] = MutableCopy;
    if (MutableCopy
      && (v7 = CFDictionaryCreateMutableCopy(0, 0, a1[8]), (v5[8] = v7) != 0)
      && (v8 = CFDictionaryCreateMutableCopy(0, 0, a1[9]), (v5[9] = v8) != 0))
    {
      *((_BYTE *)v5 + 88) = 0;
      v9 = CFRetain(v5);
    }
    else
    {
      _PCSErrorOOM(a2);
      v9 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    _PCSErrorOOM(a2);
    return 0;
  }
  return v9;
}

uint64_t MemoryIsCircleMember(int a1, const void **a2)
{
  _PCSError(a2, 61, CFSTR("Memory is not for circle state"));
  return 0;
}

uint64_t MemorySetCircleMember(int a1, int a2, const void **a3)
{
  _PCSError(a3, 61, CFSTR("Memory is not for circle state"));
  return 0;
}

CFTypeRef KeychainCopyIdentity(uint64_t a1, uint64_t a2, CFErrorRef *a3, int a4, int a5, int a6, int a7, int a8)
{
  const void *v11;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID v17;
  CFIndex Count;
  CFIndex v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  CFIndex v22;
  const void *v23;
  const void *v24;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  CFTypeID v27;
  const void *v28;
  char v29;
  const __CFDictionary *v30;
  _QWORD *v31;
  const void *v32;
  const __CFDictionary *v33;
  const __CFNumber *v34;
  unsigned int IndexByName;
  CFTypeRef v36;
  CFTypeRef v37;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef v49;

  v49 = 0;
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  v48 = *MEMORY[0x1E0C9AE50];
  v46 = *MEMORY[0x1E0C9AE50];
  v47 = *MEMORY[0x1E0CD7010];
  v44 = *MEMORY[0x1E0CD6F38];
  v45 = *MEMORY[0x1E0CD7018];
  v43 = *MEMORY[0x1E0CD6F30];
  v40 = kPCSServiceName[0];
  v41 = *MEMORY[0x1E0CD68F8];
  v39 = *MEMORY[0x1E0CD6B40];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, a2, (int)a3, a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!MutableForCFTypesWith)
    return 0;
  v13 = MutableForCFTypesWith;
  v14 = *(const void **)(a1 + 40);
  if (v14)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v14);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD6B80], v11);
  v15 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v16 = _PCSKeychainForwardTable(v13, &v49);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v15;
  if ((_DWORD)v16)
  {
    PCSSecError(v16, a3, CFSTR("Failed to find identity %@ in keychain: %d"), a2, v16, v39, v40, v41, a2, v43, v44, v45, v46, v47, v48, 0);
  }
  else if (v49)
  {
    v17 = CFGetTypeID(v49);
    if (v17 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)v49);
      if (Count >= 1)
      {
        v19 = Count;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = (const void *)*MEMORY[0x1E0CD70D8];
        v24 = (const void *)*MEMORY[0x1E0CD6B78];
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v49, v22);
          Value = CFDictionaryGetValue(ValueAtIndex, v23);
          if (Value)
          {
            v27 = CFGetTypeID(Value);
            if (v27 == CFDataGetTypeID())
            {
              v28 = CFDictionaryGetValue(ValueAtIndex, v24);
              v29 = IsViewHintPreferred((uint64_t)v28);
              if (v20)
                v30 = v20;
              else
                v30 = ValueAtIndex;
              if ((v29 & 1) != 0)
                v21 = ValueAtIndex;
              else
                v20 = v30;
            }
          }
          ++v22;
        }
        while (v19 != v22);
        if (v21)
        {
          v31 = PCSIdentityCreateWithKeychainAttributes(v21, 0);
          v32 = v31;
          v33 = v21;
LABEL_24:
          UpdateCKKSIdentity((uint64_t)v31, v33);
          if (v32
            && ((v34 = *(const __CFNumber **)(a1 + 32)) == 0
             || (IndexByName = PCSServiceItemGetIndexByName(v34),
                 IndexByName == PCSIdentityGetServiceID((uint64_t)v32))))
          {
            v36 = CFRetain(v32);
          }
          else
          {
            v36 = 0;
          }
          goto LABEL_32;
        }
        if (v20)
        {
          v31 = PCSIdentityCreateWithKeychainAttributes(v20, 0);
          v32 = v31;
          v33 = v20;
          goto LABEL_24;
        }
      }
    }
  }
  v36 = 0;
  v32 = 0;
LABEL_32:
  CFRelease(v13);
  v37 = v49;
  if (v49)
  {
    v49 = 0;
    CFRelease(v37);
  }
  if (v32)
    CFRelease(v32);
  return v36;
}

_QWORD *KeychainCopyByKeyID(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  const void *v9;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v11;
  const void *v12;
  uint64_t v13;
  int v14;
  CFTypeID v15;
  CFIndex Count;
  CFIndex v17;
  const __CFDictionary *v18;
  CFIndex v19;
  const __CFDictionary *v20;
  const void *v21;
  const void *v22;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  CFTypeID v25;
  const void *v26;
  char v27;
  const __CFDictionary *v28;
  _QWORD *v29;
  _QWORD *v30;
  const __CFDictionary *v31;
  CFTypeRef v32;
  CFTypeRef v34;

  v34 = 0;
  v9 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, a2, a3, a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!MutableForCFTypesWith)
    return 0;
  v11 = MutableForCFTypesWith;
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v12);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v11, (const void *)*MEMORY[0x1E0CD6B80], v9);
  v13 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v14 = _PCSKeychainForwardTable(v11, &v34);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v13;
  if (!v14)
  {
    if (v34)
    {
      v15 = CFGetTypeID(v34);
      if (v15 == CFArrayGetTypeID())
      {
        Count = CFArrayGetCount((CFArrayRef)v34);
        if (Count >= 1)
        {
          v17 = Count;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v21 = (const void *)*MEMORY[0x1E0CD70D8];
          v22 = (const void *)*MEMORY[0x1E0CD6B78];
          do
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v34, v19);
            Value = CFDictionaryGetValue(ValueAtIndex, v21);
            if (Value)
            {
              v25 = CFGetTypeID(Value);
              if (v25 == CFDataGetTypeID())
              {
                v26 = CFDictionaryGetValue(ValueAtIndex, v22);
                v27 = IsViewHintPreferred((uint64_t)v26);
                if (v18)
                  v28 = v18;
                else
                  v28 = ValueAtIndex;
                if ((v27 & 1) != 0)
                  v20 = ValueAtIndex;
                else
                  v18 = v28;
              }
            }
            ++v19;
          }
          while (v17 != v19);
          if (v20)
          {
            v29 = PCSIdentityCreateWithKeychainAttributes(v20, 0);
            v30 = v29;
            v31 = v20;
LABEL_24:
            UpdateCKKSIdentity((uint64_t)v29, v31);
            goto LABEL_26;
          }
          if (v18)
          {
            v29 = PCSIdentityCreateWithKeychainAttributes(v18, 0);
            v30 = v29;
            v31 = v18;
            goto LABEL_24;
          }
        }
      }
    }
  }
  v30 = 0;
LABEL_26:
  CFRelease(v11);
  v32 = v34;
  if (v34)
  {
    v34 = 0;
    CFRelease(v32);
  }
  return v30;
}

id KeychainCopyCurrentIdentity(uint64_t a1, __CFString *key, const void **a3)
{
  NSObject *v6;
  void *v7;
  dispatch_queue_t v9;
  dispatch_semaphore_t v10;
  void *v11;
  __CFString *AccessGroupByName;
  const __CFString *CKKSViewByName;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  int v19;
  uint64_t *v20;
  CFErrorDomain Domain;
  const void *v22;
  id v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  const void *v28;
  CFTypeRef v29;
  char IsWalrus;
  char v31;
  CFTypeRef v32;
  const void *v33;
  CFTypeRef cf;
  _QWORD block[6];
  _QWORD v36[4];
  NSObject *v37;
  NSObject *v38;
  _QWORD *v39;
  uint64_t *v40;
  uint8_t *v41;
  __CFString *v42;
  uint64_t v43;
  _QWORD v44[3];
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  if (key
    && *(_QWORD *)(a1 + 40)
    && (PCSServiceItemTypeIsManatee((_BOOL8)key) || _os_feature_enabled_impl())
    && CFEqual(kPCSServiceName[0], CFSTR("ProtectedCloudStorage")))
  {
    if (PCSSupportsPersonaMultiuser())
    {
      pcsLogObjForScope("ckks");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9508000, v6, OS_LOG_TYPE_DEFAULT, "KeychainCopyCurrentIdentity: ATVSupportsMU enabled", buf, 2u);
      }

      goto LABEL_15;
    }
    if (!_PCSIsMultiDevice(0))
    {
LABEL_15:
      if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        v51 = buf;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__0;
        v54 = __Block_byref_object_dispose__0;
        v55 = 0;
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x2020000000;
        v45 = 0;
        v9 = dispatch_queue_create("KeychainCopyCurrentIdentity", 0);
        v10 = dispatch_semaphore_create(0);
        v11 = off_1ECED4020;
        AccessGroupByName = PCSServiceItemGetAccessGroupByName(key);
        CKKSViewByName = PCSServiceItemGetCKKSViewByName(key);
        v14 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __KeychainCopyCurrentIdentity_block_invoke;
        v36[3] = &unk_1E553E458;
        v15 = v9;
        v37 = v15;
        v39 = v44;
        v42 = key;
        v43 = a1;
        v40 = &v46;
        v41 = buf;
        v16 = v10;
        v38 = v16;
        ((void (*)(__CFString *, __CFString *, const __CFString *, _QWORD, _QWORD *))v11)(AccessGroupByName, key, CKKSViewByName, 0, v36);
        v17 = dispatch_time(0, 1000000000 * (_QWORD)*(&xmmword_1ECED4000 + 1));
        if (dispatch_semaphore_wait(v16, v17))
        {
          pcsLogObjForScope("ckks");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(cf) = 0;
            _os_log_impl(&dword_1A9508000, v18, OS_LOG_TYPE_DEFAULT, "Failed to fetch identity from security within timeout", (uint8_t *)&cf, 2u);
          }

          block[0] = v14;
          block[1] = 3221225472;
          block[2] = __KeychainCopyCurrentIdentity_block_invoke_101;
          block[3] = &unk_1E553DEF8;
          block[4] = v44;
          block[5] = &v46;
          dispatch_sync(v15, block);
        }
        v19 = _os_feature_enabled_impl();
        v20 = v47;
        if (v19)
        {
          if (v47[3])
          {
            if (!PCSServiceItemTypeIsManatee((_BOOL8)key))
            {
              Domain = CFErrorGetDomain((CFErrorRef)v47[3]);
              if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0CD5CA0]))
              {
                if (CFErrorGetCode((CFErrorRef)v47[3]) == 61)
                {
                  v22 = (const void *)v47[3];
                  if (!v22)
                  {
LABEL_27:
                    KeychainCopyXIdentityWithCount(a1, (const __CFNumber *)key, 0, a3);
                    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:
                    v7 = v23;

                    _Block_object_dispose(v44, 8);
                    _Block_object_dispose(&v46, 8);
                    _Block_object_dispose(buf, 8);

                    return v7;
                  }
LABEL_26:
                  v47[3] = 0;
                  CFRelease(v22);
                  goto LABEL_27;
                }
              }
            }
          }
          cf = 0;
          if (!*((_QWORD *)v51 + 5))
          {
            if (PCSServiceItemTypeIsManatee((_BOOL8)key))
            {
              v29 = cf;
            }
            else
            {
              IsWalrus = KeychainIsWalrus(a1, 0, &cf);
              v29 = cf;
              if (cf)
                v31 = 1;
              else
                v31 = IsWalrus;
              if ((v31 & 1) == 0)
              {
                v33 = (const void *)v47[3];
                if (v33)
                {
                  v47[3] = 0;
                  CFRelease(v33);
                }
                goto LABEL_27;
              }
            }
            if (v29)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                KeychainCopyCurrentIdentity_cold_1((uint64_t *)&cf);
              v32 = cf;
              if (cf)
              {
                cf = 0;
                CFRelease(v32);
              }
            }
          }
          if (!*((_QWORD *)v51 + 5) && (CFEqual(key, kPCSServiceMaster) || CFEqual(key, kPCSServiceFDE)))
          {
            v22 = (const void *)v47[3];
            if (!v22)
              goto LABEL_27;
            goto LABEL_26;
          }
          v20 = v47;
        }
        v28 = (const void *)v20[3];
        if (v28)
        {
          if (a3)
          {
            *a3 = v28;
          }
          else
          {
            v20[3] = 0;
            CFRelease(v28);
          }
        }
        v23 = *((id *)v51 + 5);
        goto LABEL_43;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = kPCSErrorDomain;
      v56 = *MEMORY[0x1E0CB2D50];
      v57[0] = CFSTR("dsid does not match current persona's account dsid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 146, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
        *a3 = v27;

      goto LABEL_33;
    }
    if (PCSServiceItemTypeIsManatee((_BOOL8)key))
    {
      _PCSError(a3, 145, CFSTR("No CKKS on multiuser device"));
LABEL_33:
      v7 = 0;
      return v7;
    }
  }
  KeychainCopyXIdentityWithCount(a1, (const __CFNumber *)key, 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

void sub_1A95308E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t KeychainIsCurrentIdentity(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t CachedCurrentBit;
  const void *v6;
  uint64_t v7;
  void *key;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v18;
  const void *v19;
  uint64_t v20;
  int v21;
  CFTypeID v22;
  const __CFNumber *Value;
  const __CFNumber *v24;
  CFTypeID v25;
  CFDictionaryRef v26;
  int PublicKey;
  int valuePtr;
  CFDictionaryRef v30;

  v30 = 0;
  valuePtr = 0;
  if ((a3 & 1) != 0)
  {
    CachedCurrentBit = _PCSIdentityGetCachedCurrentBit(a2);
    v6 = (const void *)*MEMORY[0x1E0C9AE50];
    v7 = CachedCurrentBit == *MEMORY[0x1E0C9AE50];
    if (CachedCurrentBit)
      return v7;
  }
  else
  {
    v6 = (const void *)*MEMORY[0x1E0C9AE50];
  }
  key = (void *)*MEMORY[0x1E0CD6C98];
  v9 = *MEMORY[0x1E0CD6CB8];
  PublicKey = PCSIdentityGetPublicKey(a2);
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(PublicKey, v10, v11, v12, v13, v14, v15, v16, key, v9);
  if (!MutableForCFTypesWith)
    return 0;
  v18 = MutableForCFTypesWith;
  v19 = *(const void **)(a1 + 40);
  if (v19)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v19);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E0CD6B80], v6);
  v20 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v21 = _PCSKeychainForwardTable(v18, &v30);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v20;
  if (!v21
    && v30
    && (v22 = CFGetTypeID(v30), v22 == CFDictionaryGetTypeID())
    && (Value = (const __CFNumber *)CFDictionaryGetValue(v30, (const void *)*MEMORY[0x1E0CD6BC8])) != 0
    && (v24 = Value, v25 = CFGetTypeID(Value), v25 == CFNumberGetTypeID())
    && CFNumberGetValue(v24, kCFNumberSInt32Type, &valuePtr))
  {
    v7 = BYTE2(valuePtr) & 1;
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v18);
  v26 = v30;
  if (v30)
  {
    v30 = 0;
    CFRelease(v26);
  }
  return v7;
}

BOOL KeychainAddIdentity(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  __CFDictionary *v4;
  __CFDictionary *v5;
  uint64_t v6;
  int v7;
  _BOOL8 v8;
  CFTypeRef v9;
  CFTypeRef cf;

  cf = 0;
  if (!*(_QWORD *)(a1 + 40))
    return 0;
  v4 = (__CFDictionary *)_PCSIdentityCopyKeychainAttributes(a2);
  if (!v4)
    return 0;
  v5 = v4;
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD7028], (const void *)*MEMORY[0x1E0C9AE50]);
  v6 = PCSMeasureRelativeNanoTime();
  ++PCSMeasure;
  v7 = (*(&_PCSKeychainForwardTable + 1))(v5, &cf);
  qword_1ECED4F90 += PCSMeasureRelativeNanoTime() - v6;
  v8 = v7 == 0;
  if (v7)
    PCSSecError(v7, a3, CFSTR("SecItemAdd"));
  CFRelease(v5);
  v9 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v9);
  }
  return v8;
}

BOOL KeychainRemoveIdentity(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v9;
  uint64_t v10;
  int v11;
  _BOOL8 v12;

  if (!*(_QWORD *)(a1 + 40))
    return 0;
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, a2, a3, a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!MutableForCFTypesWith)
    return 0;
  v9 = MutableForCFTypesWith;
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
  v10 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FA8;
  v11 = off_1ECED3FF8(v9);
  qword_1ECED4FB0 += PCSMeasureRelativeNanoTime() - v10;
  v12 = v11 == 0;
  CFRelease(v9);
  return v12;
}

uint64_t KeychainSetCurrentIdentity(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  CFNumberRef v6;
  CFNumberRef v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFDictionary *MutableForCFTypesWith;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFDictionary *v27;
  CFDictionaryRef v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  __CFDictionary *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  void *key;
  int PublicKey;
  CFErrorRef *v52;
  uint64_t v53;

  v6 = IdentityCopyServiceNumber(a2, 0);
  v7 = IdentityCopyServiceNumber(a2, 0x10000);
  v15 = v7;
  if (!*(_QWORD *)(a1 + 40))
  {
    v28 = 0;
    v27 = 0;
LABEL_29:
    v48 = 0;
    goto LABEL_18;
  }
  v16 = (void *)*MEMORY[0x1E0CD6C98];
  v17 = *MEMORY[0x1E0CD6CB8];
  v18 = *MEMORY[0x1E0CD6BC8];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v7, v8, v9, v10, v11, v12, v13, v14, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v27 = MutableForCFTypesWith;
  if (!MutableForCFTypesWith)
  {
    v28 = 0;
    goto LABEL_29;
  }
  v52 = a3;
  v53 = (uint64_t)v15;
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
  v28 = CFDictionaryCreateForCFTypes((uint64_t)MutableForCFTypesWith, v20, v21, v22, v23, v24, v25, v26, v18, (uint64_t)v6);
  v29 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4F98;
  v30 = qword_1ECED3FF0(v27, v28);
  qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v29;
  if (v30 != -25300 && v30)
  {
    PCSSecError(v30, v52, CFSTR("Failed to remove current on attributes"), key);
    goto LABEL_16;
  }
  CFRelease(v27);
  if (v28)
    CFRelease(v28);
  PublicKey = PCSIdentityGetPublicKey(a2);
  v38 = CFDictionaryCreateMutableForCFTypesWith(PublicKey, v31, v32, v33, v34, v35, v36, v37, v16, v17);
  v27 = v38;
  v15 = (const void *)v53;
  if (v38)
  {
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(v38, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    v28 = CFDictionaryCreateForCFTypes((uint64_t)v38, v39, v40, v41, v42, v43, v44, v45, v18, v53);
    if (v28)
    {
      v46 = PCSMeasureRelativeNanoTime();
      ++qword_1ECED4F98;
      v47 = qword_1ECED3FF0(v27, v28);
      qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v46;
      if (!v47)
      {
        v48 = 1;
LABEL_17:
        v15 = (const void *)v53;
        goto LABEL_18;
      }
      PCSSecError(v47, v52, CFSTR("Failed to mark %@ as current"), a2);
LABEL_16:
      v48 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v28 = 0;
  }
  v48 = 0;
LABEL_18:
  if (v6)
    CFRelease(v6);
  if (v15)
    CFRelease(v15);
  if (v27)
    CFRelease(v27);
  if (v28)
    CFRelease(v28);
  return v48;
}

uint64_t KeychainUnsetCurrentIdentity(uint64_t a1, const __CFNumber *key, CFErrorRef *a3)
{
  CFNumberRef v4;
  CFNumberRef v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  __CFDictionary *MutableForCFTypesWith;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  CFDictionaryRef v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unsigned int valuePtr;

  if (!*(_QWORD *)(a1 + 40))
    return 0;
  valuePtr = PCSServiceItemGetIndexByName(key);
  if (!valuePtr)
    return 0;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  valuePtr |= 0x10000u;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v6 = *MEMORY[0x1E0CD6BC8];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v5, v7, v8, v9, v10, v11, v12, v13, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v22 = MutableForCFTypesWith;
  if (MutableForCFTypesWith)
  {
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    v23 = CFDictionaryCreateForCFTypes((uint64_t)MutableForCFTypesWith, v15, v16, v17, v18, v19, v20, v21, v6, (uint64_t)v4);
    if (v23)
    {
      v24 = PCSMeasureRelativeNanoTime();
      ++qword_1ECED4F98;
      v25 = qword_1ECED3FF0(v22, v23);
      qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v24;
      v26 = 1;
      if (v25 == -25300 || !v25)
        goto LABEL_11;
      PCSSecError(v25, a3, CFSTR("Failed to remove current on attributes"));
    }
  }
  else
  {
    v23 = 0;
  }
  v26 = 0;
LABEL_11:
  if (v4)
    CFRelease(v4);
  if (v5)
    CFRelease(v5);
  if (v22)
    CFRelease(v22);
  if (v23)
    CFRelease(v23);
  return v26;
}

uint64_t KeychainEnumerateIdentities(uint64_t a1, const void *a2, void *a3)
{
  id TypeID;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  const void *v14;
  CFTypeID v15;
  const void *v16;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v18;
  const void *v19;
  CFTypeID v20;
  CFNumberRef v21;
  CFNumberRef v22;
  const void *v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  uint64_t v28;
  unsigned int valuePtr;

  TypeID = a3;
  v13 = TypeID;
  if (!a1)
    goto LABEL_20;
  v14 = *(const void **)(a1 + 32);
  if (a2)
  {
    v15 = CFGetTypeID(a2);
    TypeID = (id)CFDictionaryGetTypeID();
    if ((id)v15 == TypeID && !v14)
    {
      TypeID = (id)CFDictionaryGetValue((CFDictionaryRef)a2, kPCSSetupService[0]);
      v14 = TypeID;
    }
  }
  v16 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)TypeID, v6, v7, v8, v9, v10, v11, v12, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!MutableForCFTypesWith)
  {
LABEL_20:
    v28 = 0;
    goto LABEL_19;
  }
  v18 = MutableForCFTypesWith;
  v19 = *(const void **)(a1 + 40);
  if (v19)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v19);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E0CD6B80], v16);
  if (v14)
  {
    v20 = CFGetTypeID(v14);
    if (v20 == CFStringGetTypeID())
    {
      valuePtr = PCSServiceItemGetIndexByName((const __CFNumber *)v14);
      v21 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (!v21)
        goto LABEL_21;
      v22 = v21;
      v23 = (const void *)*MEMORY[0x1E0CD6BC8];
      CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E0CD6BC8], v21);
      CFRelease(v22);
      processQuery((uint64_t)v18, v13);
      valuePtr += 0x10000;
      v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (!v24
        || (v25 = v24,
            CFDictionarySetValue(v18, v23, v24),
            CFRelease(v25),
            processQuery((uint64_t)v18, v13),
            valuePtr += 0x10000,
            (v26 = CFNumberCreate(0, kCFNumberIntType, &valuePtr)) == 0))
      {
LABEL_21:
        v28 = 0;
        goto LABEL_18;
      }
      v27 = v26;
      CFDictionarySetValue(v18, v23, v26);
      CFRelease(v27);
    }
  }
  processQuery((uint64_t)v18, v13);
  v28 = 1;
LABEL_18:
  CFRelease(v18);
LABEL_19:

  return v28;
}

CFMutableDictionaryRef KeychainCopyIdentities(uint64_t a1, const void *a2)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  _QWORD v7[5];

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = Mutable;
  if (Mutable)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __KeychainCopyIdentities_block_invoke;
    v7[3] = &__block_descriptor_40_e27_v16__0___PCSIdentityData__8l;
    v7[4] = Mutable;
    if ((KeychainEnumerateIdentities(a1, a2, v7) & 1) == 0)
    {
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

CFArrayRef KeychainCopyOrderedIdentities(uint64_t a1, __CFString *a2)
{
  CFMutableArrayRef Mutable;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  __CFArray *v12;
  __CFDictionary *MutableForCFTypesWith;
  CFArrayRef Copy;
  void *v15;
  void *v16;
  const void *v17;
  const void *v18;
  const __CFDictionary *v19;
  CFIndex Count;
  _QWORD context[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  CFRange v27;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v12 = Mutable;
  if (!Mutable)
  {
    Copy = 0;
    v15 = 0;
    goto LABEL_20;
  }
  if (a2)
  {
    MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)Mutable, v5, v6, v7, v8, v9, v10, v11, kPCSSetupService[0], (uint64_t)a2);
    if (!MutableForCFTypesWith)
    {
      Copy = 0;
      v15 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    MutableForCFTypesWith = 0;
  }
  KeychainCopyCurrentIdentity(a1, a2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  if (v16 && (v17 = (const void *)objc_msgSend(v16, "identity"), (v18 = v17) != 0))
  {
    CFRetain(v17);
    v19 = KeychainCopyIdentities(a1, MutableForCFTypesWith);
    if (v19)
    {
      if (_PCSIdentityValidate((uint64_t)v18, (_BYTE *)v24 + 24, 0) && !*((_BYTE *)v24 + 24))
        CFArrayAppendValue(v12, v18);
      context[0] = MEMORY[0x1E0C809B0];
      context[1] = 3221225472;
      context[2] = __KeychainCopyOrderedIdentities_block_invoke;
      context[3] = &unk_1E553E1F8;
      context[4] = &v23;
      context[5] = v18;
      context[6] = v12;
      CFDictionaryApplyFunction(v19, (CFDictionaryApplierFunction)apply_block_2_2, context);
      Count = CFArrayGetCount(v12);
      if (Count >= 2)
      {
        v27.length = Count - 1;
        v27.location = 1;
        CFArraySortValues(v12, v27, (CFComparatorFunction)_PCSIdentityComparePublicKey, 0);
      }
      Copy = CFArrayCreateCopy(0, v12);
    }
    else
    {
      Copy = 0;
    }
    CFRelease(v18);
    if (v19)
      CFRelease(v19);
    if (!MutableForCFTypesWith)
      goto LABEL_19;
  }
  else
  {
    Copy = 0;
    if (!MutableForCFTypesWith)
      goto LABEL_19;
  }
  CFRelease(MutableForCFTypesWith);
LABEL_19:
  CFRelease(v12);
LABEL_20:
  _Block_object_dispose(&v23, 8);

  return Copy;
}

void sub_1A953176C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void KeychainEnumeratePublicKeys(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v13;
  const void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  const void *v17;
  CFTypeID v18;
  const __CFNumber *IndexByName;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  __CFDictionary *v23;

  v3 = a2;
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v3, v5, v6, v7, v8, v9, v10, v11, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v13 = MutableForCFTypesWith;
  v14 = *(const void **)(a1 + 40);
  if (v14)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v14);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD6B80], v4);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __KeychainEnumeratePublicKeys_block_invoke;
  v21[3] = &unk_1E553E4A8;
  v23 = v13;
  v15 = v3;
  v22 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF4156AC](v21);
  v17 = *(const void **)(a1 + 32);
  if (v17 && (v18 = CFGetTypeID(v17), v18 == CFStringGetTypeID()))
  {
    IndexByName = PCSServiceItemGetIndexByName(*(const __CFNumber **)(a1 + 32));
    ((void (**)(_QWORD, const __CFNumber *))v16)[2](v16, IndexByName);
    v16[2](v16, IndexByName | 0x10000);
    v20 = IndexByName | 0x20000;
  }
  else
  {
    v20 = 0;
  }
  v16[2](v16, v20);
  if (v13)
    CFRelease(v13);

}

void KeychainRepairCurrentIdentity(const void *a1, const void *a2, const void *a3, void *a4)
{
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  _QWORD v9[4];
  void (**v10)(id, uint64_t, _QWORD);
  const void *v11;
  const void *v12;
  const void *v13;

  v7 = a4;
  if (PCSServiceItemTypeIsManatee((_BOOL8)a2))
  {
    if (v7)
      v7[2](v7, 1, 0);
  }
  else
  {
    CFRetain(a1);
    CFRetain(a2);
    CFRetain(a3);
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __KeychainRepairCurrentIdentity_block_invoke;
    v9[3] = &unk_1E553E4D0;
    v11 = a1;
    v12 = a2;
    v13 = a3;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

uint64_t KeychainIsICDP(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  int v9;

  v9 = 0;
  return KeychainGetSecurityDomainStatus(a1, kPCSiCloudServiceMarkerName[0], &v9, a2, a5, a6, a7, a8);
}

uint64_t KeychainIsICDPNetwork(uint64_t a1, const __CFDictionary *a2, const void **a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  uint64_t SecurityDomainStatus;
  __CFDictionary *v12;
  CFTypeID v13;
  const __CFDictionary *MutableCopy;
  const __CFDictionary *v15;
  void *v17;
  __CFString *v18;
  void *v19;
  int v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  SecurityDomainStatus = KeychainGetSecurityDomainStatus(a1, kPCSiCloudServiceMarkerName[0], &v20, a3, a5, a6, a7, a8);
  v12 = 0;
  if ((SecurityDomainStatus & 1) == 0 && v20 == -25300)
  {
    if (a2 && (v13 = CFGetTypeID(a2), v13 == CFDictionaryGetTypeID()))
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a2);
    else
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v12 = MutableCopy;
    if (!CFDictionaryGetValue(MutableCopy, kPCSSetupDSID[0]) && *(_QWORD *)(a1 + 40))
    {
      if ((PCSCurrentPersonaMatchesDSIDFromSet(a1) & 1) == 0)
      {
        if (a3)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = kPCSErrorDomain;
          v23 = *MEMORY[0x1E0CB2D50];
          v24[0] = CFSTR("Current persona does not match chosen dsid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 152, v19);
          *a3 = (const void *)objc_claimAutoreleasedReturnValue();

        }
        SecurityDomainStatus = 0;
        if (v12)
          goto LABEL_17;
        return SecurityDomainStatus;
      }
      CFDictionarySetValue(v12, kPCSSetupDSID[0], *(const void **)(a1 + 40));
    }
    v15 = (const __CFDictionary *)__PCSCopyStingrayInfo(0, v12, a3);
    if (v12)
      CFRelease(v12);
    if (v15)
    {
      SecurityDomainStatus = (uint64_t)_PCSIsiCDPEnabled(v15, 1);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = SecurityDomainStatus;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PCSIsiCDPEnabled: status: %d", buf, 8u);
      }
      v12 = v15;
    }
    else
    {
      v12 = 0;
      SecurityDomainStatus = 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = SecurityDomainStatus;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "KeychainIsICDPNetwork: status: %d", buf, 8u);
  }
  if (v12)
LABEL_17:
    CFRelease(v12);
  return SecurityDomainStatus;
}

uint64_t KeychainSetICDP(uint64_t a1, int a2, CFErrorRef *a3)
{
  void *v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _PCSIdentitySetGetAltDSIDorPCSAccountsModel(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
    objc_msgSend(v7, "setAltDSID:", v6);
    v12 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0CD5C68], "setCDPEnabled:error:", v7, &v12);
    v9 = v12;
    if ((v8 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "setting Octagon CDP failed: %@", buf, 0xCu);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to determine altDSID, not setting Octagon CDP", buf, 2u);
  }
  v10 = KeychainSetSecurityDomainStatus(a1, kPCSiCloudServiceMarkerName[0], a2, a3);

  return v10;
}

uint64_t KeychainIsPlesio(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v15;

  v15 = 0;
  if ((KeychainGetSecurityDomainStatus(a1, kPCSPlesioMarkerNewName[0], &v15, a2, a5, a6, a7, a8) & 1) != 0)
    return 1;
  else
    return KeychainGetSecurityDomainStatus(a1, kPCSPlesioMarkerName[0], &v15, a2, v10, v11, v12, v13);
}

uint64_t KeychainSetPlesio(uint64_t a1, int a2, CFErrorRef *a3)
{
  KeychainSetSecurityDomainStatus(a1, kPCSPlesioMarkerName[0], a2, a3);
  return KeychainSetSecurityDomainStatus(a1, kPCSPlesioMarkerNewName[0], a2, a3);
}

uint64_t KeychainIsWalrus(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  id v23;
  _QWORD block[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  if (KeychainIsWalrus_once != -1)
    dispatch_once(&KeychainIsWalrus_once, &__block_literal_global_9);
  v6 = (void *)MEMORY[0x1AF415520]();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  if (objc_opt_class())
  {
    _PCSIdentitySetGetAltDSIDorPCSAccountsModel(a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) == 0)
      {
        v9 = KeychainIsWalrus_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __KeychainIsWalrus_block_invoke_144;
        block[3] = &unk_1E553DFC0;
        v26 = &v27;
        v25 = v7;
        dispatch_sync(v9, block);
        v10 = (void *)v28[5];
        if (v10)
        {
          objc_msgSend(v10, "walrus");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "enabled");

          v13 = 0;
          v14 = 0;
LABEL_16:

          goto LABEL_17;
        }

      }
      v14 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
      objc_msgSend(v14, "setAltDSID:", v8);
      objc_msgSend(v14, "setContext:", *MEMORY[0x1E0CD5C90]);
      v23 = 0;
      objc_msgSend(MEMORY[0x1E0CD5C68], "fetchAccountWideSettingsDefaultWithForceFetch:configuration:error:", a2, v14, &v23);
      v15 = objc_claimAutoreleasedReturnValue();
      v13 = v23;
      v16 = (void *)v28[5];
      v28[5] = v15;

      if (v28[5])
      {
        v17 = KeychainIsWalrus_queue;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __KeychainIsWalrus_block_invoke_2_145;
        v20[3] = &unk_1E553DF98;
        v21 = v8;
        v22 = &v27;
        dispatch_barrier_async(v17, v20);
        objc_msgSend((id)v28[5], "walrus");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v18, "enabled");

      }
      else
      {
        v12 = 0;
        if (a3 && v13)
        {
          v13 = v13;
          v12 = 0;
          *a3 = v13;
        }
      }
      goto LABEL_16;
    }
    _PCSError(a3, 90, CFSTR("altDSID not available"));
    v13 = 0;
    v14 = 0;
    v12 = 0;
    goto LABEL_16;
  }
  _PCSError(a3, 15, CFSTR("OctagonTrust not available"));
  v13 = 0;
  v14 = 0;
  v12 = 0;
LABEL_17:
  _Block_object_dispose(&v27, 8);

  objc_autoreleasePoolPop(v6);
  return v12;
}

void sub_1A9532228(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t KeychainSetWalrus(uint64_t a1, uint64_t a2, const void **a3)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v16;

  if (objc_opt_class())
  {
    _PCSIdentitySetGetAltDSIDorPCSAccountsModel(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
      objc_msgSend(v7, "setAltDSID:", v6);
      objc_msgSend(v7, "setContext:", *MEMORY[0x1E0CD5C90]);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v7);
      v9 = objc_alloc_init(MEMORY[0x1E0D65080]);
      v10 = objc_alloc_init(MEMORY[0x1E0D65088]);
      objc_msgSend(v9, "setWalrus:", v10);

      objc_msgSend(v9, "walrus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEnabled:", a2);

      v16 = 0;
      v12 = objc_msgSend(v8, "setAccountSetting:error:", v9, &v16);
      v13 = v16;
      v14 = v13;
      if (a3 && (v12 & 1) == 0)
      {
        v14 = v13;
        v12 = 0;
        *a3 = v14;
      }
    }
    else
    {
      _PCSError(a3, 90, CFSTR("altDSID not available"));
      v14 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v12 = 0;
    }

  }
  else
  {
    _PCSError(a3, 15, CFSTR("OctagonTrust not available"));
    return 0;
  }
  return v12;
}

uint64_t KeychainSetCopySet(int a1, const void **a2)
{
  _PCSError(a2, 95, CFSTR("Keychain can't be copied"));
  return 0;
}

uint64_t KeychainIsCircleMember()
{
  return 0;
}

uint64_t KeychainSetCircleMember()
{
  return 0;
}

uint64_t IsViewHintPreferred(uint64_t result)
{
  const void *v1;

  if (result)
  {
    v1 = (const void *)result;
    if (CFEqual((CFTypeRef)result, (CFTypeRef)*MEMORY[0x1E0CD6BD8]))
      return 1;
    if (CFEqual(v1, (CFTypeRef)*MEMORY[0x1E0CD6BE8]))
      return 1;
    if (CFEqual(v1, (CFTypeRef)*MEMORY[0x1E0CD6BF8]))
      return 1;
    if (CFEqual(v1, (CFTypeRef)*MEMORY[0x1E0CD6BD0]))
      return 1;
    result = CFEqual(v1, (CFTypeRef)*MEMORY[0x1E0CD6BF0]);
    if ((_DWORD)result)
      return 1;
  }
  return result;
}

void UpdateCKKSIdentity(uint64_t a1, CFDictionaryRef theDict)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  __CFDictionary *MutableForCFTypesWith;
  CFMutableDictionaryRef Mutable;
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1 && theDict && !CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CD6AB8]))
  {
    MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(0, v4, v5, v6, v7, v8, v9, v10, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (_PCSKeychainAmendCKKSEntry(a1, Mutable))
    {
      CopyValueValue(theDict, MutableForCFTypesWith, (void *)*MEMORY[0x1E0CD6B78]);
      CopyValueValue(theDict, MutableForCFTypesWith, (void *)*MEMORY[0x1E0CD6B40]);
      CopyValueValue(theDict, MutableForCFTypesWith, (void *)*MEMORY[0x1E0CD68F8]);
      CopyValueValue(theDict, MutableForCFTypesWith, (void *)*MEMORY[0x1E0CD6BC8]);
      CopyValueValue(theDict, MutableForCFTypesWith, (void *)*MEMORY[0x1E0CD6B50]);
      v13 = qword_1ECED3FF0(MutableForCFTypesWith, Mutable);
      if (MutableForCFTypesWith)
        CFRelease(MutableForCFTypesWith);
      if (Mutable)
        CFRelease(Mutable);
      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v15 = a1;
          v16 = 1024;
          v17 = v13;
          _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to update identity %@ to set CKKS PCS public attributes: %d", buf, 0x12u);
        }
      }
    }
    else
    {
      if (MutableForCFTypesWith)
        CFRelease(MutableForCFTypesWith);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
}

void CopyValueValue(const __CFDictionary *a1, __CFDictionary *a2, void *key)
{
  const void *Value;

  Value = CFDictionaryGetValue(a1, key);
  if (Value)
    CFDictionarySetValue(a2, key, Value);
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

PCSCurrentIdentity *KeychainCopyXIdentityWithCount(uint64_t a1, const __CFNumber *key, CFIndex *a3, const void **a4)
{
  const __CFNumber *v6;
  unsigned int IndexByName;
  CFNumberRef v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  CFNumberRef v17;
  const void *v18;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v20;
  const void *v21;
  uint64_t v22;
  int v23;
  CFTypeID v24;
  CFIndex Count;
  CFIndex v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  CFIndex v29;
  const void *v30;
  const void *v31;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v33;
  CFTypeID v34;
  const void *Value;
  CFTypeID v36;
  const void *v37;
  _QWORD *v38;
  const void *v39;
  const __CFDictionary *v40;
  PCSCurrentIdentity *v41;
  const __CFArray *v42;
  const __CFArray *v43;
  const void **v45;
  int valuePtr;
  const __CFArray *v47;

  v6 = key;
  v47 = 0;
  valuePtr = 0;
  if (!key)
  {
    v6 = *(const __CFNumber **)(a1 + 32);
    if (!v6)
    {
      _PCSError(a4, 27, CFSTR("service missing"));
      goto LABEL_36;
    }
  }
  IndexByName = PCSServiceItemGetIndexByName(v6);
  valuePtr = IndexByName;
  if (!IndexByName)
  {
LABEL_36:
    v41 = 0;
    v20 = 0;
    v17 = 0;
    goto LABEL_41;
  }
  valuePtr = IndexByName | 0x10000;
  v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v17 = v9;
  if (!v9)
  {
    _PCSErrorOOM(a4);
    v41 = 0;
    v20 = 0;
    goto LABEL_41;
  }
  v18 = (const void *)*MEMORY[0x1E0C9AE50];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v9, v10, v11, v12, v13, v14, v15, v16, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v20 = MutableForCFTypesWith;
  if (MutableForCFTypesWith)
  {
    v21 = *(const void **)(a1 + 40);
    if (v21)
      CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v21);
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CD6B80], v18);
    v22 = PCSMeasureRelativeNanoTime();
    ++qword_1ECED4FB8;
    v23 = _PCSKeychainForwardTable(v20, &v47);
    qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v22;
    if (v23)
    {
      PCSSecError(v23, (CFErrorRef *)a4, CFSTR("Failed finding service %@"), v6);
    }
    else if (v47 && (v24 = CFGetTypeID(v47), v24 == CFArrayGetTypeID()))
    {
      Count = CFArrayGetCount(v47);
      v26 = Count;
      if (a3)
        *a3 = Count;
      if (Count >= 1)
      {
        v45 = a4;
        v27 = 0;
        v28 = 0;
        v29 = 0;
        v30 = (const void *)*MEMORY[0x1E0CD70D8];
        v31 = (const void *)*MEMORY[0x1E0CD6B78];
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v47, v29);
          if (ValueAtIndex)
          {
            v33 = ValueAtIndex;
            v34 = CFGetTypeID(ValueAtIndex);
            if (v34 == CFDictionaryGetTypeID())
            {
              Value = CFDictionaryGetValue(v33, v30);
              if (Value)
              {
                v36 = CFGetTypeID(Value);
                if (v36 == CFDataGetTypeID())
                {
                  v37 = CFDictionaryGetValue(v33, v31);
                  if (IsViewHintPreferred((uint64_t)v37)
                    && (!v28 || IdentityAttributesCompare(v33, v28) == kCFCompareGreaterThan))
                  {
                    v28 = v33;
                  }
                  else if (!v27 || IdentityAttributesCompare(v33, v27) == kCFCompareGreaterThan)
                  {
                    v27 = v33;
                  }
                }
              }
            }
          }
          ++v29;
        }
        while (v26 != v29);
        if (v28)
        {
          v38 = PCSIdentityCreateWithKeychainAttributes(v28, v45);
          v39 = v38;
          v40 = v28;
          goto LABEL_33;
        }
        if (v27)
        {
          v38 = PCSIdentityCreateWithKeychainAttributes(v27, v45);
          v39 = v38;
          v40 = v27;
LABEL_33:
          UpdateCKKSIdentity((uint64_t)v38, v40);
          if (v39)
          {
            v41 = -[PCSCurrentIdentity initWithIdentity:currentItemPointerModificationTime:]([PCSCurrentIdentity alloc], "initWithIdentity:currentItemPointerModificationTime:", v39, 0);
            CFRelease(v39);
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      _PCSError(a4, 21, CFSTR("return data not array"));
    }
  }
  v41 = 0;
LABEL_41:
  v42 = v47;
  if (v47)
  {
    v47 = 0;
    CFRelease(v42);
  }
  if (v20)
    CFRelease(v20);
  v43 = v47;
  if (v47)
  {
    v47 = 0;
    CFRelease(v43);
  }
  if (v17)
    CFRelease(v17);
  return v41;
}

CFComparisonResult IdentityAttributesCompare(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const void *v4;
  const void *Value;
  const void *v6;
  const void *v7;
  CFTypeID v8;
  BOOL v9;
  CFTypeID v10;
  CFComparisonResult result;
  const void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  CFTypeID v16;
  BOOL v17;
  CFTypeID v18;

  v4 = (const void *)*MEMORY[0x1E0CD6990];
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6990]);
  v6 = CFDictionaryGetValue(a2, v4);
  if (!Value
    || ((v7 = v6, v8 = CFGetTypeID(Value), v8 == CFDateGetTypeID()) ? (v9 = v7 == 0) : (v9 = 1),
        v9
     || (v10 = CFGetTypeID(v7), v10 != CFDateGetTypeID())
     || (result = CFDateCompare((CFDateRef)Value, (CFDateRef)v7, 0)) == kCFCompareEqualTo))
  {
    v12 = (const void *)*MEMORY[0x1E0CD68F8];
    v13 = (const __CFString *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD68F8]);
    v14 = (const __CFString *)CFDictionaryGetValue(a2, v12);
    if (v13
      && ((v15 = v14, v16 = CFGetTypeID(v13), v16 == CFStringGetTypeID()) ? (v17 = v15 == 0) : (v17 = 1),
          !v17 && (v18 = CFGetTypeID(v15), v18 == CFStringGetTypeID())))
    {
      return CFStringCompare(v13, v15, 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void processQuery(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CFTypeRef v5;
  CFTypeID v6;
  const __CFArray *v7;
  CFTypeRef v8;
  _QWORD v9[4];
  id v10;
  CFTypeRef cf;
  CFRange v12;

  v3 = a2;
  cf = 0;
  v4 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  LODWORD(a1) = _PCSKeychainForwardTable(a1, &cf);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v4;
  if ((_DWORD)a1)
    goto LABEL_2;
  if (!cf)
    goto LABEL_10;
  v6 = CFGetTypeID(cf);
  if (v6 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)cf))
  {
    v7 = (const __CFArray *)cf;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __processQuery_block_invoke;
    v9[3] = &unk_1E553E480;
    v10 = v3;
    v12.length = CFArrayGetCount(v7);
    v12.location = 0;
    CFArrayApplyFunction(v7, v12, (CFArrayApplierFunction)apply_block_1_1, v9);
    v8 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v8);
    }

  }
  else
  {
LABEL_2:
    v5 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v5);
    }
  }
LABEL_10:

}

void __processQuery_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID v5;
  _QWORD *v6;
  const void *v7;
  const void *v8;
  uint8_t buf[4];
  const void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CD70D8]);
  v8 = 0;
  if (Value)
  {
    v5 = CFGetTypeID(Value);
    if (v5 == CFDataGetTypeID())
    {
      v6 = PCSIdentityCreateWithKeychainAttributes(theDict, &v8);
      if (v6)
      {
        v7 = v6;
        UpdateCKKSIdentity((uint64_t)v6, theDict);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:
        CFRelease(v7);
        return;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to parse identity from keychain: %@", buf, 0xCu);
      }
      v7 = v8;
      if (v8)
      {
        v8 = 0;
        goto LABEL_9;
      }
    }
  }
}

uint64_t KeychainGetSecurityDomainStatus(uint64_t a1, const __CFString *a2, int *a3, const void **a4, int a5, int a6, int a7, int a8)
{
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  __CFDictionary *v26;
  const void *v27;
  uint64_t v28;
  const __CFString *v29;
  int v30;
  uint64_t v31;
  CFTypeID v32;
  CFDataRef v33;
  CFDataRef v34;
  uint64_t v35;
  const char *v36;
  CFTypeRef v37;
  __CFString *v39;
  CFTypeRef v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  __CFDictionary *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  __CFDictionary *v55;
  __CFDictionary *v56;
  __CFDictionary *v57;
  int v58;
  void *key;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  __CFString *v66;
  uint64_t v67;
  __CFString *v68;
  uint64_t v69;
  __CFString *v70;
  uint64_t v71;
  __CFString *v72;
  uint64_t v73;
  __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  CFTypeRef v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  void *v86;
  CFTypeRef v88;
  uint8_t buf[4];
  const __CFString *v90;
  __int16 v91;
  const char *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v88 = 0;
  v10 = *MEMORY[0x1E0CD68F8];
  v11 = (__CFString *)*MEMORY[0x1E0C9AE50];
  v12 = *MEMORY[0x1E0CD6F30];
  v13 = (__CFString *)*MEMORY[0x1E0CD6F40];
  v68 = (__CFString *)*MEMORY[0x1E0CD6F40];
  v69 = 0;
  v66 = (__CFString *)*MEMORY[0x1E0C9AE50];
  v67 = *MEMORY[0x1E0CD6F30];
  v85 = *MEMORY[0x1E0CD7018];
  v64 = kPCSAccount[0];
  v65 = *MEMORY[0x1E0CD7018];
  v63 = *MEMORY[0x1E0CD68F8];
  v61 = *MEMORY[0x1E0CD6B40];
  v62 = a2;
  v82 = *MEMORY[0x1E0CD6B40];
  v83 = *MEMORY[0x1E0CD6CB8];
  v86 = (void *)*MEMORY[0x1E0CD6C98];
  MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(a1, (int)a2, (int)a3, (int)a4, a5, a6, a7, a8, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  v15 = MutableForCFTypesWith;
  v16 = *(const void **)(a1 + 40);
  if (v16)
    CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B50], v16);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0CD6B80], v11);
  v17 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  *a3 = _PCSKeychainForwardTable(v15, &v88);
  v18 = PCSMeasureRelativeNanoTime();
  qword_1ECED4FC0 += v18 - v17;
  if (*a3 != -25300)
    goto LABEL_13;
  if (v15)
    CFRelease(v15);
  v68 = v13;
  v69 = 0;
  v66 = v11;
  v67 = v12;
  v64 = kPCSAccount[0];
  v65 = v85;
  v63 = v10;
  v61 = *MEMORY[0x1E0CD6B58];
  v62 = a2;
  v80 = *MEMORY[0x1E0CD6B58];
  v81 = *MEMORY[0x1E0CD6CA8];
  v26 = CFDictionaryCreateMutableForCFTypesWith(v18, v19, v20, v21, v22, v23, v24, v25, v86, *MEMORY[0x1E0CD6CA8]);
  v15 = v26;
  v27 = *(const void **)(a1 + 40);
  if (v27)
    CFDictionarySetValue(v26, (const void *)*MEMORY[0x1E0CD69B0], v27);
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0CD6B80], v11);
  v28 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  *a3 = _PCSKeychainForwardTable(v15, &v88);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v28;
  if (*a3)
    goto LABEL_13;
  v39 = *(__CFString **)(a1 + 40);
  if (!v39)
    goto LABEL_13;
  v40 = v88;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "upgradeServiceMarker", buf, 2u);
  }
  v78 = v40;
  v79 = 0;
  v76 = CFSTR("PCS-MasterKey");
  v77 = *MEMORY[0x1E0CD70D8];
  v74 = v39;
  v75 = *MEMORY[0x1E0CD6B78];
  v72 = kPCSDefaultKeychainGroup[0];
  v73 = *MEMORY[0x1E0CD6B50];
  v70 = v11;
  v71 = *MEMORY[0x1E0CD6898];
  v68 = (__CFString *)*MEMORY[0x1E0CD68A8];
  v69 = *MEMORY[0x1E0CD70A8];
  v66 = kPCSAccount[0];
  v67 = *MEMORY[0x1E0CD68A0];
  v64 = kPCSiCloudServiceMarkerName[0];
  v65 = v10;
  v63 = v82;
  v61 = *MEMORY[0x1E0CD6A90];
  v62 = CFSTR("PCS iCloud Data Protection");
  v47 = CFDictionaryCreateMutableForCFTypesWith((int)CFSTR("PCS-MasterKey"), *MEMORY[0x1E0CD70D8], v41, v42, v43, v44, v45, v46, v86, v83);
  if (v47)
  {
    v55 = v47;
    if (PCSUseSyncKeychain)
      CFDictionarySetValue(v47, (const void *)*MEMORY[0x1E0CD6B80], v11);
    v72 = v13;
    v73 = 0;
    v70 = v11;
    v71 = v12;
    v68 = v11;
    v69 = v85;
    v66 = v39;
    v67 = *MEMORY[0x1E0CD69C0];
    v64 = kPCSAccount[0];
    v65 = *MEMORY[0x1E0CD69B0];
    v62 = kPCSiCloudServiceMarkerName[0];
    v63 = v10;
    v61 = v80;
    v56 = CFDictionaryCreateMutableForCFTypesWith((int)v47, v48, v49, v50, v51, v52, v53, v54, v86, v81);
    if (v56)
    {
      v57 = v56;
      v29 = a2;
      if (PCSUseSyncKeychain)
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x1E0CD6B80], v11);
      v58 = (*(&_PCSKeychainForwardTable + 1))(v55, 0);
      if (!v58 || v58 == -25299)
        off_1ECED3FF8(v57);
      CFRelease(v55);
    }
    else
    {
      v57 = v55;
      v29 = a2;
    }
    CFRelease(v57);
  }
  else
  {
LABEL_13:
    v29 = a2;
  }
  if (!CFEqual(v29, kPCSPlesioMarkerName[0])
    && !CFEqual(v29, kPCSPlesioMarkerNewName[0])
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v30 = *a3;
    *(_DWORD *)buf = 138412546;
    v90 = v29;
    v91 = 1024;
    LODWORD(v92) = v30;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "KeychainGetStatus(%@): keychain: %d", buf, 0x12u);
  }
  v31 = *a3;
  if ((_DWORD)v31)
  {
    if ((_DWORD)v31 != -25300)
      _PCSError(a4, 50, CFSTR("Marker (%@) return unexpected error code: %d"), v29, v31, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74,
        v75,
        v76,
        v77,
        v78,
        v79);
    goto LABEL_54;
  }
  if (!v88 || (v32 = CFGetTypeID(v88), v32 != CFDataGetTypeID()))
  {
    _PCSError(a4, 50, CFSTR("Failed getting iCDP data"), key, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74,
      v75,
      v76,
      v77,
      v78,
      v79);
LABEL_54:
    v34 = 0;
    goto LABEL_25;
  }
  v33 = CFDataCreate(0, (const UInt8 *)iCloudDataProtection, 21);
  v34 = v33;
  if (v33)
  {
    if (CFEqual(v33, v88))
    {
      v35 = 1;
      goto LABEL_26;
    }
    _PCSError(a4, 50, CFSTR("Entry in iCDP not iCDP!"));
  }
  else
  {
    _PCSErrorOOM(a4);
  }
LABEL_25:
  v35 = 0;
LABEL_26:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v36 = "off";
    if ((_DWORD)v35)
      v36 = "on";
    *(_DWORD *)buf = 138412546;
    v90 = v29;
    v91 = 2080;
    v92 = v36;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "KeychainGetStatus(%@): status: %s", buf, 0x16u);
  }
  if (v15)
    CFRelease(v15);
  v37 = v88;
  if (v88)
  {
    v88 = 0;
    CFRelease(v37);
  }
  if (v34)
    CFRelease(v34);
  return v35;
}

uint64_t KeychainSetSecurityDomainStatus(uint64_t a1, CFTypeRef cf1, int a3, CFErrorRef *a4)
{
  CFErrorRef v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  const char *v17;
  CFDataRef v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  const void *v24;
  void *v25;
  uint64_t v26;
  const void *v27;
  void *key;
  __CFDictionary *v29;
  __CFDictionary *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  __CFDictionary *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  __CFDictionary *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  __CFDictionary *MutableForCFTypesWith;
  __CFDictionary *v57;
  uint64_t v58;
  int v59;
  __CFDictionary *v60;
  const void **v62;
  uint64_t v63;
  uint8_t buf[4];
  CFTypeRef v65;
  __int16 v66;
  _QWORD v67[4];

  *(_QWORD *)((char *)&v67[2] + 2) = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v8 = *a4;
    if (*a4)
    {
      *a4 = 0;
      CFRelease(v8);
    }
  }
  if (!*(_QWORD *)(a1 + 40))
    return 0;
  v9 = CFEqual(cf1, kPCSPlesioMarkerName[0]);
  if (!v9)
  {
    v9 = CFEqual(cf1, kPCSPlesioMarkerNewName[0]);
    if (!v9)
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        v17 = "off";
        if (a3)
          v17 = "on";
        *(_DWORD *)buf = 138412546;
        v65 = cf1;
        v66 = 2080;
        v67[0] = v17;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "KeychainSetICDP: setting %@ status to %s", buf, 0x16u);
      }
    }
  }
  if (!a3)
  {
    MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(v9, v10, v11, v12, v13, v14, v15, v16, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
    if (MutableForCFTypesWith)
    {
      v57 = MutableForCFTypesWith;
      if (PCSUseSyncKeychain)
        CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
      v58 = PCSMeasureRelativeNanoTime();
      ++qword_1ECED4FA8;
      v59 = off_1ECED3FF8(v57);
      qword_1ECED4FB0 += PCSMeasureRelativeNanoTime() - v58;
      v53 = 1;
      if (v59 != -25300 && v59)
      {
        PCSSecError(v59, a4, CFSTR("Failed to delete: %@"), cf1);
        v53 = 0;
      }
      v60 = v57;
      goto LABEL_36;
    }
    goto LABEL_38;
  }
  v18 = CFDataCreate(0, (const UInt8 *)iCloudDataProtection, 21);
  if (!v18)
  {
LABEL_38:
    _PCSErrorOOM((const void **)a4);
    return 0;
  }
  v24 = v18;
  v62 = (const void **)a4;
  v25 = (void *)*MEMORY[0x1E0CD6C98];
  v26 = *MEMORY[0x1E0CD6CB8];
  v27 = (const void *)*MEMORY[0x1E0C9AE50];
  key = (void *)*MEMORY[0x1E0CD70D8];
  v29 = CFDictionaryCreateMutableForCFTypesWith((int)CFSTR("PCS-MasterKey"), *MEMORY[0x1E0CD68F8], *MEMORY[0x1E0CD6B50], v19, v20, v21, v22, v23, (void *)*MEMORY[0x1E0CD6C98], *MEMORY[0x1E0CD6CB8]);
  if (!v29)
  {
LABEL_39:
    _PCSErrorOOM(v62);
    CFRelease(v24);
    return 0;
  }
  v30 = v29;
  v31 = v26;
  v63 = (uint64_t)v24;
  v32 = v25;
  if (PCSUseSyncKeychain)
    CFDictionarySetValue(v29, (const void *)*MEMORY[0x1E0CD6B80], v27);
  v33 = PCSMeasureRelativeNanoTime();
  ++PCSMeasure;
  v34 = (*(&_PCSKeychainForwardTable + 1))(v30, 0);
  qword_1ECED4F90 += PCSMeasureRelativeNanoTime() - v33;
  if (v34 == -25299)
  {
    v35 = v32;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v65 = cf1;
      v66 = 1024;
      LODWORD(v67[0]) = -25299;
      WORD2(v67[0]) = 2112;
      *(_QWORD *)((char *)v67 + 6) = v30;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "KeychainSetSecurityDomainStatus(%@): failed to store keychain with %d: %@", buf, 0x1Cu);
    }
    CFRelease(v30);
    v24 = (const void *)v63;
    v44 = CFDictionaryCreateMutableForCFTypesWith(v36, v37, v38, v39, v40, v41, v42, v43, key, v63);
    if (v44)
    {
      v30 = v44;
      v52 = CFDictionaryCreateMutableForCFTypesWith((int)v44, v45, v46, v47, v48, v49, v50, v51, v35, v31);
      v53 = (uint64_t)v52;
      if (v52)
      {
        if (PCSUseSyncKeychain)
          CFDictionarySetValue(v52, (const void *)*MEMORY[0x1E0CD6B80], v27);
        v54 = PCSMeasureRelativeNanoTime();
        ++qword_1ECED4F98;
        v55 = qword_1ECED3FF0(v53, v30);
        qword_1ECED4FA0 += PCSMeasureRelativeNanoTime() - v54;
        CFRelease((CFTypeRef)v53);
        if (v55)
        {
          PCSSecError(v55, (CFErrorRef *)v62, CFSTR("Failed to update: %@"), cf1);
          v53 = 0;
        }
        else
        {
          v53 = 1;
        }
      }
      else
      {
        _PCSErrorOOM(v62);
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  if (v34)
  {
    PCSSecError(v34, (CFErrorRef *)v62, CFSTR("Failed to add: %@"), cf1);
    v53 = 0;
  }
  else
  {
    v53 = 1;
  }
  v24 = (const void *)v63;
LABEL_35:
  CFRelease(v24);
  v60 = v30;
LABEL_36:
  CFRelease(v60);
  return v53;
}

uint64_t _PCSIsMultiDevice(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___PCSIsMultiDevice_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_PCSIsMultiDevice_onceToken != -1)
    dispatch_once(&_PCSIsMultiDevice_onceToken, block);
  return _PCSIsMultiDevice_deviceModeIsMultiUser;
}

const __CFDictionary *_PCSIsiCDPEnabled(const __CFDictionary *a1, int a2)
{
  const __CFDictionary *result;
  const __CFDictionary *v5;
  const void *Value;
  __CFString **v7;
  CFTypeID v8;

  result = GetiCDPMetadata(a1);
  if (result)
  {
    v5 = result;
    if ((_PCSIsiCDPIsWalrus(a1) & 1) != 0 || _PCSIsiCDPIsPlesio(a1))
    {
      Value = (const void *)*MEMORY[0x1E0C9AE50];
      if (!*MEMORY[0x1E0C9AE50])
        return 0;
    }
    else
    {
      if (a2)
        v7 = kPCSMetadataiCDPArmed;
      else
        v7 = kPCSMetadataiCDP;
      Value = CFDictionaryGetValue(v5, *v7);
      if (!Value)
        return 0;
    }
    v8 = CFGetTypeID(Value);
    if (v8 != CFBooleanGetTypeID())
      return 0;
    return (const __CFDictionary *)(CFBooleanGetValue((CFBooleanRef)Value) != 0);
  }
  return result;
}

const __CFDictionary *GetiCDPMetadata(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFDictionary *v2;
  CFTypeID v3;

  result = GetHSMClientMetaData(a1);
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, kPCSSecureBackupCFiCloudDataProtectionKey[0]);
    if (result)
    {
      v2 = result;
      v3 = CFGetTypeID(result);
      if (v3 == CFDictionaryGetTypeID())
        return v2;
      else
        return 0;
    }
  }
  return result;
}

const __CFDictionary *_PCSIsiCDPIsWalrus(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;

  result = GetiCDPMetadata(a1);
  if (result)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(result, kPCSMetadataiCDPWalrus[0]);
    result = 0;
    if (Value)
    {
      v3 = Value;
      v4 = CFGetTypeID(Value);
      if (v4 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue(v3))
          return (const __CFDictionary *)1;
      }
    }
  }
  return result;
}

const __CFDictionary *_PCSIsiCDPIsPlesio(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;

  result = GetiCDPMetadata(a1);
  if (result)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(result, kPCSMetadataiCDPDrop[0]);
    result = 0;
    if (Value)
    {
      v3 = Value;
      v4 = CFGetTypeID(Value);
      if (v4 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue(v3))
          return (const __CFDictionary *)1;
      }
    }
  }
  return result;
}

id _PCSMessagesBackupPath(uint64_t a1)
{
  return LocalStorageCreatePath(a1, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup"), CFSTR("messages"));
}

id LocalStorageCreatePath(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@/%@-%@.%@"), v7, kPCSServiceName[0], a1, v6);

  return v9;
}

uint64_t PCSIdentitySynchronizeKeys(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&synchronizeKeys, CFSTR("SynchronizeKeys"), cf, a2);
}

uint64_t PCSIdentityMigrateEngineExecute(uint64_t a1, const void *a2, CFTypeRef cf, const void **a4)
{
  void *v5;
  void *v6;
  uint64_t v7;

  PCSIdentityMigrateEngineCreate(a1, a2, 1, cf, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = PCSIdentityMigrateEngineRun(v5, (uint64_t *)a4);
  else
    v7 = 0;

  return v7;
}

uint64_t PCSIdentityMigrateToiCDP(void *a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  v3 = PCSAccountMigrateToiCDP(0, a1, &v7);
  v4 = v7;
  v5 = v4;
  if (a2 && v4)
    *a2 = v4;

  return v3;
}

uint64_t _PCSIdentityMigrateToiCDP(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&migrateiCDP, CFSTR("MigrateiCDP"), cf, a2);
}

uint64_t PCSIdentityMigrateCloseDoor(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&migrateCloseDoor, CFSTR("CloseDoor"), cf, a2);
}

uint64_t PCSIdentityMigrateDropStingray(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&migrateDropHSM, CFSTR("MigrateDropHSM"), cf, a2);
}

uint64_t PCSIdentityMigrateRestoreHSM(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&migrateRestoreHSM, CFSTR("MigrateRestoreHSM"), cf, a2);
}

uint64_t _PCSIdentityMigrateEnableWalrus(const void *a1, const void **a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)os_transaction_create();
  +[PCSLockManager manager](PCSLockManager, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.protectedcloudstorage.migrateenablewalrus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockAssertion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "holdAssertion"))
  {
    v8 = PCSIdentityMigrateEngineExecute((uint64_t)&migrateEnableWalrus, CFSTR("MigrateEnableWalrus"), a1, a2);
    objc_msgSend(v7, "dropAssertion");
  }
  else
  {
    PCSMigrationLog(0, CFSTR("Failed to get lock assertion, failing migration step"));
    _PCSError(a2, 151, CFSTR("Failed to get lock assertion"));
    v8 = 0;
  }

  return v8;
}

uint64_t _PCSIdentityMigrateDisableWalrus(const void *a1, const void **a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)os_transaction_create();
  +[PCSLockManager manager](PCSLockManager, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.protectedcloudstorage.migratedisablewalrus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockAssertion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "holdAssertion"))
  {
    v8 = PCSIdentityMigrateEngineExecute((uint64_t)&migrateDisableWalrus, CFSTR("MigrateDisableWalrus"), a1, a2);
    objc_msgSend(v7, "dropAssertion");
  }
  else
  {
    PCSMigrationLog(0, CFSTR("Failed to get lock assertion, failing migration step"));
    _PCSError(a2, 151, CFSTR("Failed to get lock assertion"));
    v8 = 0;
  }

  return v8;
}

CFTypeRef PCSIdentitySetup(CFTypeRef cf, const void **a2)
{
  void *v3;
  void *v4;
  CFTypeRef v5;

  PCSIdentityMigrateEngineCreate((uint64_t)&setupIdentities, CFSTR("SetupIdentities"), 1, cf, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && PCSIdentityMigrateEngineRun(v3, (uint64_t *)a2) && objc_msgSend(v4, "set"))
    v5 = CFRetain((CFTypeRef)objc_msgSend(v4, "set"));
  else
    v5 = 0;

  return v5;
}

PCSMigrationState *PCSIdentityMigrateEngineCreate(uint64_t a1, const void *a2, int a3, CFTypeRef cf, const void **a5)
{
  CFTypeID v10;
  __CFString *Value;
  __CFString *v12;
  CFTypeID v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  PCSMigrationState *v17;
  PCSMigrationState *v18;
  const __CFDictionary *v19;
  __CFDictionary *v20;
  PCSMigrationState *v21;

  if (!cf || (v10 = CFGetTypeID(cf), v10 != CFDictionaryGetTypeID()))
  {
    _PCSError(a5, 127, CFSTR("Missing options dictionary"));
    goto LABEL_20;
  }
  Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, kPCSSetupLogFacility[0]);
  if (Value)
  {
    v12 = Value;
    v13 = CFGetTypeID(Value);
    if (v13 != CFStringGetTypeID())
    {
      _PCSError(a5, 126, CFSTR("Log facility not a string"));
LABEL_20:
      v18 = 0;
      goto LABEL_18;
    }
  }
  else if (a3)
  {
    v12 = CFSTR("PCSMigration");
  }
  else
  {
    v12 = CFSTR("PCSMisc");
  }
  if (a3)
    v14 = a2;
  else
    v14 = 0;
  v15 = PCSCreateLogContext(v14, (char *)v12);
  if (!v15)
    goto LABEL_20;
  v16 = (const void *)v15;
  v17 = objc_alloc_init(PCSMigrationState);
  v18 = v17;
  if (v17)
  {
    -[PCSMigrationState setFirstStep:](v17, "setFirstStep:", a1);
    -[PCSMigrationState setCurrentStep:](v18, "setCurrentStep:", a1);
    -[PCSMigrationState setOptions:](v18, "setOptions:", CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)cf));
    -[PCSMigrationState setLog:](v18, "setLog:", CFRetain(v16));
    -[PCSMigrationState setType:](v18, "setType:", CFRetain(a2));
    -[PCSMigrationState setNewIdentity:](v18, "setNewIdentity:", 0);
    -[PCSMigrationState setModified:](v18, "setModified:", 0);
    v19 = -[PCSMigrationState options](v18, "options");
    if (!CFDictionaryGetValue(v19, kPCSSetupLogContext[0]))
    {
      v20 = -[PCSMigrationState options](v18, "options");
      CFDictionarySetValue(v20, kPCSSetupLogContext[0], v16);
    }
    v21 = v18;
  }
  CFRelease(v16);
LABEL_18:

  return v18;
}

uint64_t PCSIdentityMigrateEngineRun(void *a1, uint64_t *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint32_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  char v20;
  uint64_t v21;
  void *v23;
  void *v24;
  os_activity_scope_state_s state;

  v3 = a1;
  v24 = (void *)MEMORY[0x1AF415520]();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v23 = (void *)os_transaction_create();
  PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("%@ start"), objc_msgSend(v3, "type"));
  v4 = _os_activity_create(&dword_1A9508000, "PCSMigrationEngine", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = v4;
  if (v4)
    os_activity_scope_enter(v4, &state);
  while (*(_QWORD *)(objc_msgSend(v3, "currentStep") + 8))
  {
    if ((objc_msgSend(v3, "done") & 1) != 0)
      break;
    v6 = objc_msgSend(v3, "currentStep");
    objc_msgSend(v3, "setCurrentStep:", objc_msgSend(v3, "currentStep") + 16);
    v7 = objc_msgSend(v3, "log");
    v8 = objc_msgSend(v3, "type");
    v9 = *(_QWORD *)v6;
    if (objc_msgSend(v3, "modified"))
      v10 = " (modified)";
    else
      v10 = "";
    PCSMigrationLog(v7, CFSTR("  running %@ step %@%s"), v8, v9, v10);
    if (!(*(unsigned int (**)(id, uint64_t *))(v6 + 8))(v3, a2))
      goto LABEL_16;
    if (objc_msgSend(v3, "restart"))
    {
      if (objc_msgSend(v3, "restartCounter") > 4)
        goto LABEL_16;
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("  starting migration to the begining: %u"), objc_msgSend(v3, "restartCounter"));
      objc_msgSend(v3, "setRestart:", 0);
      objc_msgSend(v3, "setCurrentStep:", objc_msgSend(v3, "firstStep"));
      objc_msgSend(v3, "setRestartCounter:", objc_msgSend(v3, "restartCounter") + 1);
      objc_msgSend(v3, "softReset");
      v11 = arc4random_uniform(2 * objc_msgSend(v3, "restartCounter") + 10);
      sleep(v11 + 5);
    }
  }
  if (*(_QWORD *)(objc_msgSend(v3, "currentStep") + 8) && !objc_msgSend(v3, "done"))
LABEL_16:
    v12 = 0;
  else
    v12 = 1;
  v13 = (const __CFDictionary *)objc_msgSend(v3, "options");
  CFDictionaryGetValue(v13, kPCSSetupStatistics[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "numberIdentityMissing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("numberIdentityMissing"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "modified"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("modified"));

    if (objc_msgSend(v3, "missingFromRegistry"))
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v3, "missingFromRegistry"), CFSTR("missingFromRegistry"));
    if (objc_msgSend(v3, "brokenEncryptedMetadatakeys"))
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("brokenEncryptedMetadatakeys"));
  }
  v17 = objc_msgSend(v3, "log");
  v18 = objc_msgSend(v3, "type");
  v19 = CFSTR("failed");
  if ((_DWORD)v12)
    v19 = CFSTR("success");
  if (a2)
    v20 = v12;
  else
    v20 = 1;
  if ((v20 & 1) != 0)
    v21 = 0;
  else
    v21 = *a2;
  PCSMigrationLog(v17, CFSTR("%@ complete: %@ (error: %@)"), v18, v19, v21);
  if (v5)
    os_activity_scope_leave(&state);

  objc_autoreleasePoolPop(v24);
  return v12;
}

CFTypeRef PCSIdentityLegacySetup(CFTypeRef cf, const void **a2)
{
  void *v3;
  const void *v4;
  CFTypeRef v5;

  PCSIdentityMigrateEngineCreate((uint64_t)&legacySetupIdentities, CFSTR("LegacySetupIdentities"), 1, cf, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  if (GetLegacyServiceArray_onceToken != -1)
    dispatch_once(&GetLegacyServiceArray_onceToken, &__block_literal_global_743);
  objc_msgSend(v3, "setLimitLocalStoring:", GetLegacyServiceArray_array);
  v4 = (const void *)objc_msgSend(v3, "limitLocalStoring");
  if (v4)
    CFRetain(v4);
  if (PCSIdentityMigrateEngineRun(v3, (uint64_t *)a2) && objc_msgSend(v3, "set"))
    v5 = CFRetain((CFTypeRef)objc_msgSend(v3, "set"));
  else
LABEL_9:
    v5 = 0;

  return v5;
}

uint64_t PCSIdentitySetValidate(const void *a1, CFTypeRef cf, uint64_t a3, const void **a4)
{
  CFTypeID v8;
  int v9;
  void *v10;
  const __CFDictionary *v11;
  const void *Value;
  CFTypeID v13;
  int v14;
  int v15;
  CFErrorDomain Domain;
  const void *v17;

  v9 = cf
    && (v8 = CFGetTypeID(cf), v8 == CFDictionaryGetTypeID())
    && CFDictionaryGetValue((CFDictionaryRef)cf, kPCSSetupForceLogging[0]) != 0;
  if (!a3)
  {
    _PCSError(a4, 123, CFSTR("needPassword param missing"));
    v10 = 0;
    goto LABEL_20;
  }
  *(_BYTE *)a3 = 0;
  PCSIdentityMigrateEngineCreate((uint64_t)&validateKeys, CFSTR("ValidateCredentials"), v9, cf, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_21;
  objc_msgSend(v10, "setSet:", CFRetain(a1));
  if (!a1)
    goto LABEL_21;
  v11 = (const __CFDictionary *)objc_msgSend(v10, "options");
  Value = CFDictionaryGetValue(v11, kPCSSetupForceValidateKey[0]);
  if (!Value || (v13 = CFGetTypeID(Value), v13 != CFBooleanGetTypeID()))
    objc_msgSend(v10, "setRequireIdentityInHSM:", 1);
  v14 = PCSIdentityMigrateEngineRun(v10, (uint64_t *)a4);
  v15 = v14;
  if (a4)
  {
    if ((v14 & 1) == 0)
    {
      if (*a4)
      {
        Domain = CFErrorGetDomain((CFErrorRef)*a4);
        if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0CB32E8]))
        {
          PCSMigrationLog(objc_msgSend(v10, "log"), CFSTR("PCS skipping validation failure since error is network issue: %@"), *a4);
          v17 = *a4;
          if (*a4)
          {
            *a4 = 0;
            CFRelease(v17);
          }
          objc_msgSend(v10, "setNeedPassword:", 0);
          goto LABEL_19;
        }
      }
    }
  }
  if (!v15)
  {
LABEL_21:
    a3 = 0;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)a3 = objc_msgSend(v10, "needPassword");
  a3 = 1;
LABEL_20:

  return a3;
}

BOOL PCSIdentityHaveiCloudIdentityLocally(void *a1)
{
  id v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  _BOOL8 v10;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "isEqualToString:", kPCSSetupDSIDAny[0]) & 1) == 0 && PCSCurrentPersonaMatchesDSID(v2))
  {
    v9 = (void *)__PCSCopyFromiCloudKeychain(v2, 0, v3, v4, v5, v6, v7, v8);
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t PCSIdentityMigrateRestoreLocalBackup(CFTypeRef cf, const void **a2)
{
  return PCSIdentityMigrateEngineExecute((uint64_t)&restoreLocalBackup, CFSTR("MigrateRestoreLocalBackup"), cf, a2);
}

BOOL PCSIdentityiCDPSignOut(const void *a1, const void **a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  if (a1)
  {
    __PCSDeleteFromKeychainICDP(a1, 0, a3, a4, a5, a6, a7, a8);
    __PCSDeleteKeyfile(a1, 0);
  }
  else
  {
    _PCSError(a2, 121, CFSTR("iCDPSignOut missing DSID"));
  }
  return a1 != 0;
}

uint64_t __PCSDeleteKeyfile(const void *a1, const void **a2)
{
  CFTypeID v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  const __CFString *v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _BYTE v55[128];
  _BYTE v56[128];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = CFGetTypeID(a1);
    if (v4 != CFStringGetTypeID())
    {
      _PCSErrorContext(0, a2, 121, CFSTR("Missing parameter: dsid"));
      return 0;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v54[0] = CFSTR("backup");
    v54[1] = CFSTR("witness");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v41;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v5);
          LocalStorageCreatePath((uint64_t)a1, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup"), *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeItemAtPath:error:", v10, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
      }
      while (v7);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v52 = CFSTR("messages");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          LocalStorageCreatePath((uint64_t)a1, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup"), *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeItemAtPath:error:", v17, 0);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v14);
    }

  }
  else
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v57[0] = CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup");
    v57[1] = CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v19)
    {
      v20 = v19;
      v35 = *(_QWORD *)v49;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v21);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", v22, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v45;
            do
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v45 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v29);
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup"), "stringByAppendingPathComponent:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "removeItemAtPath:error:", v32, 0);

                ++v29;
              }
              while (v27 != v29);
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v27);
          }

          ++v21;
        }
        while (v21 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v20);
    }

  }
  return 1;
}

CFTypeRef PCSIdentityRecoverFDE(CFTypeRef cf, const void **a2)
{
  void *v4;
  void *v5;
  CFTypeRef v6;
  const void *Value;
  const void *v8;
  CFTypeID v9;

  PCSIdentityMigrateEngineCreate((uint64_t)&recoverFDE, CFSTR("RecoveryFDE"), 1, cf, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !PCSIdentityMigrateEngineRun(v4, (uint64_t *)a2))
  {
    v6 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "set"))
  {
    v6 = CFRetain((CFTypeRef)objc_msgSend(v5, "set"));
    if (!cf)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
    if (!cf)
      goto LABEL_10;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)cf, kPCSSetupService[0]);
  if (Value)
  {
    v8 = Value;
    v9 = CFGetTypeID(Value);
    if (v9 == CFStringGetTypeID())
      _PCSIdentitySetSetService(objc_msgSend(v5, "set"), v8);
  }
LABEL_10:

  return v6;
}

uint64_t PCSIdentityiCDPWalrus(uint64_t a1, uint64_t a2, const void **a3)
{
  return PCSIdentitySetIsWalrusWithForceFetch(a1, 0, a3);
}

const __CFDictionary *PCSIdentityiCDPPlesio(uint64_t a1, int a2, const __CFDictionary *a3, const void **a4)
{
  const __CFDictionary *result;
  const __CFDictionary *v5;
  const __CFDictionary *v6;

  if (!a2)
    return (const __CFDictionary *)PCSIdentitySetIsPlesio(a1, a4);
  result = (const __CFDictionary *)__PCSCopyStingrayInfo(0, a3, a4);
  if (result)
  {
    v5 = result;
    v6 = _PCSIsiCDPIsPlesio(result);
    CFRelease(v5);
    return v6;
  }
  return result;
}

const __CFDictionary *GetHSMClientMetaData(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFDictionary *v2;
  CFTypeID v3;
  const __CFDictionary *v4;
  CFTypeID v5;

  result = (const __CFDictionary *)CFDictionaryGetValue(a1, kPCSSecureBackupCFStingrayMetadataKey[0]);
  if (result)
  {
    v2 = result;
    v3 = CFGetTypeID(result);
    if (v3 == CFDictionaryGetTypeID())
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(v2, kPCSSecureBackupCFClientMetadataKey[0]);
      if (result)
      {
        v4 = result;
        v5 = CFGetTypeID(result);
        if (v5 == CFDictionaryGetTypeID())
          return v4;
        else
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t PCSEngineLogStatus(void *a1)
{
  id v1;
  CFTypeRef v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeRef v7;
  CFTypeRef v8;
  unsigned int IsICDP;
  CFTypeRef v10;
  uint64_t v11;
  __CFDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  CFTypeRef v17;
  CFTypeRef cf;

  v1 = a1;
  cf = 0;
  v2 = PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v1, "options"), 0, &cf);
  v3 = v2;
  if (v2)
  {
    v4 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v2, kPCSServiceMaster, &cf);
    v5 = objc_msgSend(v1, "log");
    if (v4)
    {
      PCSMigrationLog(v5, CFSTR("Master identity: %@"), v4);
    }
    else
    {
      PCSMigrationLog(v5, CFSTR("Failed getting master key: %@"), cf);
      v8 = cf;
      if (cf)
      {
        cf = 0;
        CFRelease(v8);
      }
    }
    IsICDP = PCSIdentitySetIsICDP((uint64_t)v3, &cf);
    v10 = cf;
    v11 = objc_msgSend(v1, "log");
    if (v10)
      PCSMigrationLog(v11, CFSTR("Failed getting iCDPState: %@"), cf);
    else
      PCSMigrationLog(v11, CFSTR("Local iCDP status is %d"), IsICDP);
  }
  else
  {
    v6 = objc_msgSend(v1, "log");
    PCSMigrationLog(v6, CFSTR("No local credential store: %@"), cf);
    v7 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v7);
    }
    v4 = 0;
  }
  v12 = _PCSCopyPIIClearedOptions((CFDictionaryRef)objc_msgSend(v1, "options"));
  PCSMigrationLog(objc_msgSend(v1, "log"), CFSTR("PCS%@ options: %@"), objc_msgSend(v1, "type"), v12);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentPersona");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v1, "log");
  objc_msgSend(v14, "userPersonaUniqueString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PCSMigrationLog(v15, CFSTR("Current persona: %@"), v16);

  if (v12)
    CFRelease(v12);
  v17 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v17);
  }
  if (v3)
    CFRelease(v3);
  if (v4)
    CFRelease(v4);

  return 1;
}

uint64_t PCSEnginePreCheckKeychain(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  CFTypeID v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSSetupStingray[0]);
  if (Value)
  {
    v6 = Value;
    v7 = CFGetTypeID(Value);
    if (v7 == CFBooleanGetTypeID() && !CFBooleanGetValue(v6))
    {
      v13 = 1;
      goto LABEL_11;
    }
  }
  v8 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v9 = (void *)CFDictionaryGetValue(v8, kPCSSetupDSID[0]);
  if (!v9 || (v10 = v9, v11 = CFGetTypeID(v9), v11 != CFStringGetTypeID()))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 121, CFSTR("Missing parameter: dsid"));
    goto LABEL_9;
  }
  v12 = PCSCurrentPersonaMatchesDSID(v10);
  v13 = 1;
  if (a2 && !v12)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = kPCSErrorDomain;
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 152, v16);
    *a2 = (const void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v13 = 0;
  }
LABEL_11:

  return v13;
}

BOOL PCSEngineFetchMetaData(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  objc_msgSend(v3, "clearMetadata");
  objc_msgSend(v3, "setMetadata:", __PCSCopyStingrayInfo(objc_msgSend(v3, "log"), (const __CFDictionary *)objc_msgSend(v3, "options"), a2));
  v4 = objc_msgSend(v3, "metadata");

  return v4 != 0;
}

uint64_t PCSEnginePrepareMetaData(void *a1)
{
  id v1;
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  _BOOL8 v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  CFTypeID v11;
  _BOOL8 v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  CFTypeID v15;
  _BOOL8 v16;
  const __CFBoolean *v17;
  const __CFBoolean *v18;
  CFTypeID v19;
  _BOOL8 v20;

  v1 = a1;
  v2 = CaptureMetadata(v1, (const __CFDictionary *)objc_msgSend(v1, "metadata"));
  if ((_DWORD)v2)
  {
    v3 = GetiCDPMetadata((const __CFDictionary *)objc_msgSend(v1, "metadata"));
    if (v3)
    {
      v4 = v3;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v3, kPCSMetadataiCDP[0]);
      v8 = Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFBooleanGetTypeID()) && CFBooleanGetValue(v6) != 0;
      objc_msgSend(v1, "setICDPHSM:", v8);
      v9 = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSMetadataiCDPArmed[0]);
      v12 = v9 && (v10 = v9, v11 = CFGetTypeID(v9), v11 == CFBooleanGetTypeID()) && CFBooleanGetValue(v10) != 0;
      objc_msgSend(v1, "setICDPHSMArmed:", v12);
      v13 = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSMetadataiCDPWalrus[0]);
      v16 = v13 && (v14 = v13, v15 = CFGetTypeID(v13), v15 == CFBooleanGetTypeID()) && CFBooleanGetValue(v14) != 0;
      objc_msgSend(v1, "setICDPHSMWalrus:", v16);
      v17 = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSMetadataiCDPDrop[0]);
      v20 = v17 && (v18 = v17, v19 = CFGetTypeID(v17), v19 == CFBooleanGetTypeID()) && CFBooleanGetValue(v18) != 0;
      objc_msgSend(v1, "setICDPHSMPlesio:", v20);
    }
    PCSMigrationLog(objc_msgSend(v1, "log"), CFSTR("Stingray iCDP status is armed %d icdp %d walrus %d plesio %d"), objc_msgSend(v1, "iCDPHSMArmed"), objc_msgSend(v1, "iCDPHSM"), objc_msgSend(v1, "iCDPHSMWalrus"), objc_msgSend(v1, "iCDPHSMPlesio"));
  }

  return v2;
}

uint64_t PCSEngineCheckForceUpdate(void *a1)
{
  id v1;
  const __CFDictionary *v2;
  const __CFBoolean *Value;
  const __CFBoolean *v4;
  CFTypeID v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;

  v1 = a1;
  v2 = (const __CFDictionary *)objc_msgSend(v1, "options");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v2, kPCSSetupForceUpdate[0]);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v4))
        objc_msgSend(v1, "setModified:", 1);
    }
  }
  if (objc_msgSend(v1, "metadata"))
  {
    v6 = (const __CFDictionary *)objc_msgSend(v1, "metadata");
    v7 = (const __CFDictionary *)CFDictionaryGetValue(v6, kPCSSecureBackupCFStingrayMetadataKey[0]);
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      if (v9 == CFDictionaryGetTypeID())
      {
        if ((objc_msgSend(v1, "iCDPHSMWalrus") & 1) == 0 && (objc_msgSend(v1, "iCDPHSMPlesio") & 1) == 0)
        {
          v10 = (const __CFBoolean *)CFDictionaryGetValue(v8, kPCSSecureBackupCFTriggerUpdate[0]);
          if (v10)
          {
            v11 = v10;
            v12 = CFGetTypeID(v10);
            if (v12 == CFBooleanGetTypeID())
              objc_msgSend(v1, "setTriggerUpdate:", CFBooleanGetValue(v11) != 0);
          }
        }
        if (objc_msgSend(v1, "triggerUpdate"))
          objc_msgSend(v1, "setModified:", 1);
      }
    }
  }

  return 1;
}

uint64_t PCSEngineDifferentOnDroppedKeys(void *a1)
{
  id v1;

  v1 = a1;
  if ((objc_msgSend(v1, "iCDPHSMWalrus") & 1) != 0 || objc_msgSend(v1, "iCDPHSMPlesio"))
  {
    if (PCSEngineHaveSyncEnoughToCreateIdentities(v1, 0))
      objc_msgSend(v1, "setCurrentStep:", &validationInNoTouchHSMContent);
    else
      objc_msgSend(v1, "setDone:", 1);
  }

  return 1;
}

uint64_t PCSEngineEnsureClassicContent(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFString *Value;
  const __CFDictionary *v6;
  const void *v7;
  const __CFDictionary *v8;
  __CFString *v9;
  _BOOL4 v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFDictionary *v16;
  const __CFBoolean *v17;
  const __CFBoolean *v18;
  CFTypeID v19;
  BOOL v20;
  CFTypeID v21;
  uint64_t v22;
  CFErrorDomain Domain;
  const void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  CFTypeRef v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const void *valuePtr;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = (const __CFString *)CFDictionaryGetValue(v4, kPCSSetupUsername[0]);
  v6 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v7 = CFDictionaryGetValue(v6, kPCSSetupPassword[0]);
  v8 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v9 = (__CFString *)CFDictionaryGetValue(v8, kPCSSetupDSID[0]);
  v10 = PCSCurrentPersonaMatchesDSID(v9);
  if (a2 && !v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = kPCSErrorDomain;
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 152, v13);
    *a2 = (const void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    v14 = 0;
    goto LABEL_5;
  }
  if (!objc_msgSend(v3, "metadata"))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 126, CFSTR("Metadata missing"));
    goto LABEL_21;
  }
  v16 = (const __CFDictionary *)objc_msgSend(v3, "metadata");
  v17 = (const __CFBoolean *)CFDictionaryGetValue(v16, kPCSSecureBackupCFContainsiCloudIdentityKey[0]);
  v18 = v17;
  if (v17)
  {
    v19 = CFGetTypeID(v17);
    if (v19 == CFBooleanGetTypeID())
    {
      v20 = CFBooleanGetValue(v18) == 0;
    }
    else
    {
      v21 = CFGetTypeID(v18);
      if (v21 != CFNumberGetTypeID())
      {
        LODWORD(v18) = 0;
        goto LABEL_18;
      }
      LODWORD(valuePtr) = 0;
      if (CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr))
        v20 = (_DWORD)valuePtr == 0;
      else
        v20 = 1;
    }
    LODWORD(v18) = !v20;
  }
LABEL_18:
  if (objc_msgSend(v3, "iCDP") && (v18 & 1) == 0)
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 58, CFSTR("iCDP enabled and no stingray content"));
    goto LABEL_21;
  }
  if (((objc_msgSend(v3, "requireIdentityInHSM") ^ 1 | v18) & 1) == 0)
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 58, CFSTR("No writing allowed"));
    v14 = 1;
    objc_msgSend(v3, "setNeedPassword:", 1);
    objc_msgSend(v3, "setDone:", 1);
    goto LABEL_5;
  }
  if (!(_DWORD)v18)
  {
    if (!v7)
    {
      _PCSErrorContext(objc_msgSend(v3, "log"), a2, 123, CFSTR("Need password to push identities"));
      goto LABEL_21;
    }
    objc_msgSend(v3, "setClassicContent:", __PCSCopyFromiCloudKeychain(v9, 0, v25, v26, v27, v28, v29, v30));
    v35 = objc_msgSend(v3, "classicContent");
    if (!v35)
      objc_msgSend(v3, "setClassicContent:", __PCSCopyFromKeychain((uint64_t)kPCSServiceName[0], Value, v9, 0, v41, v42, v43, v44));
    if (!objc_msgSend(v3, "classicContent"))
    {
      v14 = 1;
      objc_msgSend(v3, "setNewIdentity:", 1);
      goto LABEL_5;
    }
    PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Detected missing/lost escrow data, will attempt to restore."));
    objc_msgSend(v3, "setEscrowMissing:", 1);
    goto LABEL_43;
  }
  objc_msgSend(v3, "setClassicContent:", __PCSCopyFromiCloudKeychain(v9, 0, v25, v26, v27, v28, v29, v30));
  v35 = objc_msgSend(v3, "classicContent");
  if (!v35)
    objc_msgSend(v3, "setClassicContent:", __PCSCopyFromKeychain((uint64_t)kPCSServiceName[0], Value, v9, 0, v31, v32, v33, v34));
  if (objc_msgSend(v3, "classicContent"))
  {
    PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("No need to use escorw proxy at this point"));
    valuePtr = 0;
    if (!checkData(objc_msgSend(v3, "log"), (CFDictionaryRef)objc_msgSend(v3, "metadata"), (const __CFData *)objc_msgSend(v3, "classicContent"), &valuePtr))
    {
      v40 = objc_msgSend(v3, "log");
      PCSMigrationLog(v40, CFSTR("Merge required: %@"), valuePtr);
      CFRelease(valuePtr);
      objc_msgSend(v3, "setEscrowMergeNeeded:", objc_msgSend(v3, "classicContent"));
      objc_msgSend(v3, "setClassicContent:", __PCSCopyHSMData(objc_msgSend(v3, "log"), (const __CFDictionary *)objc_msgSend(v3, "options"), (uint64_t *)a2));
      if (!objc_msgSend(v3, "classicContent"))
      {
        PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("PCSCopyStingrayData failed"));
        goto LABEL_21;
      }
    }
LABEL_43:
    if (v35)
    {
      v45 = __PCSCopyFromKeychain((uint64_t)kPCSServiceName[0], Value, v9, 0, v36, v37, v38, v39);
      if (v45)
      {
        v46 = v45;
        if (!CFEqual(v45, (CFTypeRef)objc_msgSend(v3, "classicContent")))
          PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("sync and non sync keychain doesn't match!"));
        CFRelease(v46);
      }
      goto LABEL_53;
    }
LABEL_52:
    if (!__PCSStoreIniCloudKeychain(objc_msgSend(v3, "classicContent"), (int)v9, a2))
      goto LABEL_21;
LABEL_53:
    v14 = 1;
    goto LABEL_5;
  }
  v47 = objc_msgSend(v3, "log");
  if (!v9)
  {
    _PCSErrorContext(v47, a2, 121, CFSTR("DSID not provided for sign-in"));
    goto LABEL_21;
  }
  objc_msgSend(v3, "setClassicContent:", __PCSCopyHSMData(v47, (const __CFDictionary *)objc_msgSend(v3, "options"), (uint64_t *)a2));
  v48 = objc_msgSend(v3, "classicContent");
  v49 = objc_msgSend(v3, "log");
  if (!v48)
  {
    PCSMigrationLog(v49, CFSTR("PCSCopyStingrayData failed"));
    goto LABEL_21;
  }
  if (checkData(v49, (CFDictionaryRef)objc_msgSend(v3, "metadata"), (const __CFData *)objc_msgSend(v3, "classicContent"), a2))
  {
    v50 = objc_msgSend(v3, "classicContent");
    if (__PCSStoreInKeychain(v50, (uint64_t)v9, a2, v51, v52, v53, v54, v55))
      goto LABEL_52;
  }
LABEL_21:
  v22 = objc_msgSend(v3, "classicContent");
  v14 = 0;
  if (a2 && !v22)
  {
    if (!*a2)
      goto LABEL_4;
    if (CFErrorGetCode((CFErrorRef)*a2) != 33)
      goto LABEL_4;
    Domain = CFErrorGetDomain((CFErrorRef)*a2);
    if (!CFEqual(Domain, kPCSSecureBackupErrorDomain))
      goto LABEL_4;
    PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Congestion event at read happen restarting state machine"));
    v24 = *a2;
    if (*a2)
    {
      *a2 = 0;
      CFRelease(v24);
    }
    v14 = 1;
    objc_msgSend(v3, "setRestart:", 1);
  }
LABEL_5:

  return v14;
}

uint64_t PCSEngineExtractKeys(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const __CFData *Value;
  const __CFData *v10;
  CFTypeID v11;
  uint64_t v12;
  CFTypeRef v13;
  uint64_t v14;
  const void *v15;
  const __CFDictionary *v16;
  id *v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  id v21;
  const void *v22;
  const void *v23;
  const void *v25;
  const void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD context[4];
  id v30;
  _QWORD v31[4];
  id v32;
  int v33;

  v3 = a1;
  if (!objc_msgSend(v3, "metadata"))
  {
    v25 = *a2;
    if (*a2)
    {
      *a2 = 0;
      CFRelease(v25);
    }
    goto LABEL_53;
  }
  if (objc_msgSend(v3, "newIdentity"))
  {
    objc_msgSend(v3, "clearSet");
    objc_msgSend(v3, "setSet:", PCSIdentitySetCreateMutable(a2));
    if (objc_msgSend(v3, "set"))
    {
      v4 = 1;
      goto LABEL_46;
    }
    _PCSErrorOOM(a2);
LABEL_53:
    v4 = 0;
    goto LABEL_46;
  }
  v33 = 0;
  if (!objc_msgSend(v3, "classicContent"))
  {
    v26 = *a2;
    if (*a2)
    {
      *a2 = 0;
      CFRelease(v26);
    }
    v15 = 0;
    v10 = 0;
    v13 = 0;
    v6 = 0;
    goto LABEL_62;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)objc_msgSend(v3, "options"));
  v6 = MutableCopy;
  if (!MutableCopy)
  {
    _PCSErrorOOM(a2);
    goto LABEL_61;
  }
  CFDictionarySetValue(MutableCopy, kPCSSetupDontImportManatee[0], (const void *)*MEMORY[0x1E0C9AE50]);
  objc_msgSend(v3, "setSet:", PCSIdentitySetCreateFromExternalForm(v6, (const __CFData *)objc_msgSend(v3, "classicContent"), (uint64_t)&v33, a2));
  if (!objc_msgSend(v3, "set"))
  {
LABEL_61:
    v15 = 0;
    v10 = 0;
    v13 = 0;
    goto LABEL_62;
  }
  v7 = objc_msgSend(v3, "set");
  objc_msgSend(v3, "setEscrowIdentity:", _PCSIdentitySetCopyCurrentIdentityInternal(v7, kPCSServiceEscrow, 0));
  v8 = GetiCDPMetadata((const __CFDictionary *)objc_msgSend(v3, "metadata"));
  if (!v8)
  {
    if (objc_msgSend(v3, "escrowIdentity"))
    {
      v15 = 0;
      v10 = 0;
      v13 = 0;
      v16 = 0;
      goto LABEL_30;
    }
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 57, CFSTR("No escrow identity, even with only classic keys"));
    goto LABEL_61;
  }
  Value = (const __CFData *)CFDictionaryGetValue(v8, kPCSMetadataEscrowedKeys[0]);
  v10 = Value;
  if (Value)
  {
    v11 = CFGetTypeID(Value);
    if (v11 == CFDataGetTypeID())
    {
      if (objc_msgSend(v3, "escrowIdentity"))
      {
        v12 = PCSBackupCopyRecoveredKeysetWithIdentity(objc_msgSend(v3, "escrowIdentity"), v10, a2);
        if (!v12)
        {
          v18 = objc_msgSend(v3, "log");
          if (a2)
          {
            PCSMigrationLog(v18, CFSTR("Encrypted metadata keys failure: %@"), *a2);
            v19 = *a2;
            if (*a2)
            {
              *a2 = 0;
              CFRelease(v19);
            }
          }
          else
          {
            PCSMigrationLog(v18, CFSTR("Encrypted metadata keys failure: %@"), 0);
          }
          v20 = objc_msgSend(v3, "escrowIdentity");
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __PCSEngineExtractKeys_block_invoke;
          v31[3] = &unk_1E553E568;
          v17 = &v32;
          v21 = v3;
          v32 = v21;
          PCSIdentityCheckValidPublicKey(v20, v31);
          objc_msgSend(v21, "setBrokenEncryptedMetadatakeys:", 1);
          objc_msgSend(v21, "setModified:", 1);
          v15 = 0;
          v10 = 0;
          v13 = 0;
          v16 = 0;
          goto LABEL_26;
        }
        v10 = (const __CFData *)v12;
        v13 = CFRetain((CFTypeRef)objc_msgSend(v3, "set"));
        objc_msgSend(v3, "clearSet");
        objc_msgSend(v3, "setSet:", PCSIdentitySetCreateFromExternalForm(v6, v10, 0, a2));
        if (objc_msgSend(v3, "set"))
        {
          v14 = objc_msgSend(v3, "set");
          v15 = _PCSIdentitySetCopyCurrentIdentityInternal(v14, kPCSServiceEscrow, a2);
          if (!v15 || !CFEqual(v15, (CFTypeRef)objc_msgSend(v3, "escrowIdentity")))
          {
            PCSIdentitySetSetCurrentIdentity(objc_msgSend(v3, "set"), objc_msgSend(v3, "escrowIdentity"));
            objc_msgSend(v3, "setModified:", 1);
          }
          v16 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)v13, 0);
          context[0] = MEMORY[0x1E0C809B0];
          context[1] = 3221225472;
          context[2] = __PCSEngineExtractKeys_block_invoke_2;
          context[3] = &unk_1E553E590;
          v17 = &v30;
          v30 = v3;
          CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)apply_block_2_3, context);
LABEL_26:

          goto LABEL_27;
        }
        v15 = 0;
LABEL_62:
        v16 = 0;
        goto LABEL_48;
      }
      _PCSErrorContext(objc_msgSend(v3, "log"), a2, 57, CFSTR("Have escrowed keys, but no escrow identity"));
    }
    else
    {
      _PCSErrorContext(objc_msgSend(v3, "log"), a2, 57, CFSTR("Escrowed keys not CFData"));
    }
    goto LABEL_61;
  }
  v15 = 0;
  v13 = 0;
  v16 = 0;
LABEL_27:
  if ((_PCSIsiCDPIsWalrus((const __CFDictionary *)objc_msgSend(v3, "metadata")) & 1) == 0
    && (_PCSIsiCDPIsPlesio((const __CFDictionary *)objc_msgSend(v3, "metadata")) & 1) == 0
    && !objc_msgSend(v3, "escrowIdentity"))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 57, CFSTR("No escrow identity, even with iCDP data"));
    goto LABEL_48;
  }
LABEL_30:
  if ((v33 & 8) != 0 && (objc_msgSend(v3, "iCDPHSMWalrus") & 1) == 0 && (objc_msgSend(v3, "iCDPHSMPlesio") & 1) == 0)
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 68, CFSTR("Keyset was a dropped keyset, metadata was not"));
    goto LABEL_48;
  }
  if (!objc_msgSend(v3, "escrowMergeNeeded"))
    goto LABEL_36;
  v22 = PCSIdentitySetCreateFromExternalForm(0, (const __CFData *)objc_msgSend(v3, "escrowMergeNeeded"), 0, a2);
  if (!v22)
  {
LABEL_48:
    v4 = 0;
    if (!v16)
      goto LABEL_38;
    goto LABEL_37;
  }
  v23 = v22;
  v16 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)v22, 0);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __PCSEngineExtractKeys_block_invoke_3;
  v27[3] = &unk_1E553E590;
  v28 = v3;
  CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)apply_block_2_3, v27);
  CFRelease(v23);

LABEL_36:
  v4 = 1;
  if (v16)
LABEL_37:
    CFRelease(v16);
LABEL_38:
  if (v6)
    CFRelease(v6);
  if (v13)
    CFRelease(v13);
  if (v10)
    CFRelease(v10);
  if (v15)
    CFRelease(v15);
LABEL_46:

  return v4;
}

uint64_t PCSEngineSynchronizeiCDP(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFBoolean *Value;
  const __CFBoolean *v7;
  CFTypeID v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  CFTypeID v11;
  const void *v12;
  CFTypeRef v13;
  int IsICDP;
  int v15;
  uint64_t v16;
  const __CFString *v17;

  v3 = a1;
  v4 = GetiCDPMetadata((const __CFDictionary *)objc_msgSend(v3, "metadata"));
  if (v4)
  {
    v5 = v4;
    Value = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSMetadataiCDP[0]);
    if (Value)
    {
      v7 = Value;
      v8 = CFGetTypeID(Value);
      if (v8 == CFBooleanGetTypeID())
        objc_msgSend(v3, "setICDPHSM:", CFBooleanGetValue(v7) != 0);
    }
    v9 = (const __CFBoolean *)CFDictionaryGetValue(v5, kPCSMetadataiCDPArmed[0]);
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == CFBooleanGetTypeID())
        objc_msgSend(v3, "setICDPHSMArmed:", CFBooleanGetValue(v10) != 0);
    }
  }
  if ((objc_msgSend(v3, "newIdentity") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2);
    v12 = v13;
    if (v13)
    {
      IsICDP = PCSIdentitySetIsICDP((uint64_t)v13, 0);
      goto LABEL_13;
    }
  }
  IsICDP = 0;
LABEL_13:
  objc_msgSend(v3, "setICDP:", objc_msgSend(v3, "iCDPHSM"));
  v15 = objc_msgSend(v3, "iCDPHSMArmed");
  if (IsICDP)
  {
    if ((v15 & 1) == 0)
    {
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("iCDP state mismatching, using the most restrictive (local)"));
      objc_msgSend(v3, "setModified:", 1);
      objc_msgSend(v3, "setICDP:", 0);
    }
    objc_msgSend(v3, "setICDPArmed:", 1);
  }
  else if (v15)
  {
    PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("iCDP state mismatching, using the most restrictive (remote)"));
    objc_msgSend(v3, "setICDPArmed:", 1);
    objc_msgSend(v3, "setModified:", 1);
  }
  v16 = objc_msgSend(v3, "log");
  v17 = _PCSYESNO(objc_msgSend(v3, "iCDPArmed"));
  PCSMigrationLog(v16, CFSTR("   iCDP state is (%@)"), v17);
  if (v12)
    CFRelease(v12);

  return 1;
}

uint64_t PCSEngineOverrideiCDP(void *a1, uint64_t *a2)
{
  id v3;
  const __CFDictionary *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!objc_msgSend(v3, "iCDP") || (objc_msgSend(v3, "iCDPArmed") & 1) == 0)
  {
    v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
    CFDictionaryGetValue(v4, kPCSSetupDSID[0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PCSAccountsModel altDSIDForDSID:](PCSAccountsModel, "altDSIDForDSID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "log");
    if (v6)
    {
      PCSMigrationLog(v7, CFSTR("No iCDP, now checking Octagon CDP status"));
      v8 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
      objc_msgSend(v8, "setAltDSID:", v6);
      v9 = PCSCurrentPersonaMatchesDSID(v5);
      if (a2)
        v10 = v9;
      else
        v10 = 1;
      if ((v10 & 1) != 0)
      {
        v18 = 0;
        v11 = objc_msgSend(MEMORY[0x1E0CD5C68], "getCDPStatus:error:", v8, &v18);
        v12 = v18;
        switch(v11)
        {
          case 2:
            PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Octagon CDP is enabled, overriding iCDP value"));
            objc_msgSend(v3, "setICDP:", 1);
            objc_msgSend(v3, "setICDPArmed:", 1);
            objc_msgSend(v3, "setModified:", 1);
            break;
          case 1:
            PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Octagon CDP is disabled"));
            break;
          case 0:
            PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Unable to check Octagon CDP status: %@"), v12);
            break;
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = kPCSErrorDomain;
        v19 = *MEMORY[0x1E0CB2D50];
        v20[0] = CFSTR("Current persona does not match chosen dsid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 152, v15);
        *a2 = objc_claimAutoreleasedReturnValue();

        v12 = 0;
      }

      if (!v10)
      {
        v16 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      PCSMigrationLog(v7, CFSTR("Unable to determine altDSID, skipping Octagon CDP check"));

    }
  }
  v16 = 1;
LABEL_19:

  return v16;
}

uint64_t PCSEngineSynchronizeWithLocalstore(void *a1, const void **a2)
{
  id v3;
  const __CFArray *CFArrayOfNames;
  CFTypeRef v5;
  const void *v6;
  CFMutableSetRef Mutable;
  CFMutableSetRef v8;
  uint64_t v9;
  id v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFBoolean *Value;
  const __CFBoolean *v14;
  CFTypeID v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  const void *v20;
  _QWORD v21[4];
  id v22;
  CFMutableSetRef v23;
  const void *v24;
  _QWORD context[4];
  id v26;
  CFMutableSetRef v27;
  CFRange v28;
  CFRange v29;

  v3 = a1;
  CFArrayOfNames = (const __CFArray *)PCSServiceItemsGetCFArrayOfNames();
  v5 = PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2);
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  if (!Mutable)
  {
    CFRelease(v6);
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v8 = Mutable;
  v9 = MEMORY[0x1E0C809B0];
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __PCSEngineSynchronizeWithLocalstore_block_invoke;
  context[3] = &unk_1E553E5B8;
  v10 = v3;
  v26 = v10;
  v27 = v8;
  v28.length = CFArrayGetCount(CFArrayOfNames);
  v28.location = 0;
  CFArrayApplyFunction(CFArrayOfNames, v28, (CFArrayApplierFunction)apply_block_1_2, context);
  v11 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)v6, 0);
  if (v11)
  {
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __PCSEngineSynchronizeWithLocalstore_block_invoke_2;
    v21[3] = &unk_1E553E5E0;
    v22 = v10;
    v23 = v8;
    v24 = v6;
    CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)apply_block_2_3, v21);

  }
  v12 = (const __CFDictionary *)objc_msgSend(v10, "options");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v12, kPCSSetupPreferLocalKeyPreference[0]);
  if (Value)
  {
    v14 = Value;
    v15 = CFGetTypeID(Value);
    if (v15 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v14))
      {
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __PCSEngineSynchronizeWithLocalstore_block_invoke_3;
        v18[3] = &unk_1E553E5B8;
        v20 = v6;
        v19 = v10;
        v29.length = CFArrayGetCount(CFArrayOfNames);
        v29.location = 0;
        CFArrayApplyFunction(CFArrayOfNames, v29, (CFArrayApplierFunction)apply_block_1_2, v18);

      }
    }
  }
  CFRelease(v6);
  if (v11)
    CFRelease(v11);
  CFRelease(v8);

  v16 = 1;
LABEL_14:

  return v16;
}

uint64_t PCSEngineSynchronizeLocalKeyFile(void *a1, const void **a2)
{
  id v3;
  CFTypeRef v4;
  CFTypeRef cf;

  cf = 0;
  v3 = a1;
  SynchronizeLocalKeyFile(v3, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup"), CFSTR("backup"), &cf);
  SynchronizeLocalKeyFile(v3, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup"), CFSTR("messages"), a2);

  v4 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v4);
  }
  return 1;
}

uint64_t PCSEngineStepValidateRegistry(void *a1)
{
  id v1;
  const __CFArray *CFArrayOfNames;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  BOOL v10;
  const __CFDictionary *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD context[4];
  id v17;
  id v18;
  BOOL v19;
  CFRange v20;

  v1 = a1;
  CFArrayOfNames = (const __CFArray *)PCSServiceItemsGetCFArrayOfNames();
  _PCSServiceItemsGetTooRolledServiceTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "iCDPHSMWalrus") & 1) != 0 || objc_msgSend(v1, "iCDPHSMPlesio"))
  {
    PCSMigrationLog(objc_msgSend(v1, "log"), CFSTR("  Skipping registry validation"));
  }
  else
  {
    v4 = objc_msgSend(v1, "oldRegistry");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      v6 = (const __CFDictionary *)objc_msgSend(v1, "options");
      Value = (const __CFBoolean *)CFDictionaryGetValue(v6, kPCSSetupRegistryCleanup[0]);
      v10 = Value && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID()) && CFBooleanGetValue(v8) != 0;
      v11 = (const __CFDictionary *)objc_msgSend(v1, "oldRegistry");
      context[0] = v5;
      context[1] = 3221225472;
      context[2] = __PCSEngineStepValidateRegistry_block_invoke;
      context[3] = &unk_1E553E630;
      v17 = v3;
      v18 = v1;
      v19 = v10;
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)apply_block_2_3, context);

    }
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __PCSEngineStepValidateRegistry_block_invoke_2;
    v13[3] = &unk_1E553E658;
    v14 = v3;
    v15 = v1;
    v20.length = CFArrayGetCount(CFArrayOfNames);
    v20.location = 0;
    CFArrayApplyFunction(CFArrayOfNames, v20, (CFArrayApplierFunction)apply_block_1_2, v13);

  }
  return 1;
}

BOOL PCSEngineAddMissingFromRegistry(void *a1, const void **a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  BOOL v7;
  const __CFArray *v8;
  CFTypeRef Master;
  const void *v10;
  const __CFArray *v11;
  const void *v12;
  CFIndex FirstIndexOfValue;
  CFIndex i;
  CFIndex Count;
  CFIndex v16;
  CFIndex v17;
  const void *ValueAtIndex;
  const __CFString *v19;
  const __CFArray *v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  _BOOL4 v24;
  int v25;
  const void **v27;
  CFTypeRef cf;
  unsigned __int8 v29;
  CFRange v30;
  CFRange v31;
  CFRange v32;
  CFRange v33;

  v3 = a1;
  _PCSServiceItemsGetTooRolledServiceTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  if (objc_msgSend(v3, "missingFromRegistry"))
  {
    v5 = objc_msgSend(v3, "set");
    v6 = _PCSIdentitySetCopyCurrentIdentityInternal(v5, kPCSServiceMaster, 0);
    if (v6
      || (v8 = (const __CFArray *)objc_msgSend(v3, "missingFromRegistry"),
          v30.length = CFArrayGetCount((CFArrayRef)objc_msgSend(v3, "missingFromRegistry")),
          v30.location = 0,
          !CFArrayContainsValue(v8, v30, kPCSServiceMaster)))
    {
      cf = v6;
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("   master identity NOT missing from registry, refusing to add one"));
    }
    else
    {
      Master = PCSIdentityCreateMaster(0, a2);
      if (!Master)
      {
        v7 = 0;
        goto LABEL_35;
      }
      v10 = Master;
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("   master identity missing from registry, adding one"));
      if (!PCSIdentitySetAddIdentity(objc_msgSend(v3, "set"), (uint64_t)v10)
        || !PCSIdentitySetSetCurrentIdentity(objc_msgSend(v3, "set"), (uint64_t)v10))
      {
        v7 = 0;
LABEL_34:
        CFRelease(v10);
        goto LABEL_35;
      }
      cf = v10;
      objc_msgSend(v3, "setModified:", 1);
    }
    v11 = (const __CFArray *)objc_msgSend(v3, "missingFromRegistry");
    v12 = (const void *)kPCSServiceMaster;
    v31.length = CFArrayGetCount(v11);
    v31.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v11, v31, v12);
    if (FirstIndexOfValue != -1)
    {
      for (i = FirstIndexOfValue; i != -1; i = CFArrayGetFirstIndexOfValue(v11, v32, v12))
      {
        CFArrayRemoveValueAtIndex(v11, i);
        v32.length = CFArrayGetCount(v11);
        v32.location = 0;
      }
    }
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v3, "missingFromRegistry"));
    if (Count >= 1)
    {
      v16 = Count;
      v27 = a2;
      v7 = 0;
      v17 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v3, "missingFromRegistry"), v17);
        v19 = CFSTR("   not creating Manatee service: %@");
        if (PCSServiceItemTypeIsManatee((_BOOL8)ValueAtIndex)
          || (v19 = CFSTR("   not creating tooRolled service: %@"),
              (objc_msgSend(v4, "containsObject:", ValueAtIndex) & 1) != 0))
        {
          PCSMigrationLog(objc_msgSend(v3, "log"), v19, ValueAtIndex);
        }
        else if (!objc_msgSend(v3, "limitLocalStoring")
               || (v20 = (const __CFArray *)objc_msgSend(v3, "limitLocalStoring"),
                   v33.length = CFArrayGetCount((CFArrayRef)objc_msgSend(v3, "limitLocalStoring")),
                   v33.location = 0,
                   CFArrayContainsValue(v20, v33, ValueAtIndex)))
        {
          if (CFEqual(ValueAtIndex, kPCSServiceEscrow))
          {
            if (objc_msgSend(v3, "newIdentity"))
            {
              if (!AddService(v3, (uint64_t)cf, kPCSServiceEscrow, v27))
                goto LABEL_33;
              v21 = objc_msgSend(v3, "set");
              objc_msgSend(v3, "setEscrowIdentity:", _PCSIdentitySetCopyCurrentIdentityInternal(v21, kPCSServiceEscrow, v27));
              if (!objc_msgSend(v3, "escrowIdentity"))
                goto LABEL_33;
            }
          }
          else
          {
            v22 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(v3, "set"), (uint64_t)ValueAtIndex, 0);
            if (!v22
              || (v23 = v22, v24 = _PCSIdentityValidate((uint64_t)v22, &v29, 0), v25 = v29, CFRelease(v23), !v24)
              || v25)
            {
              if ((AddService(v3, (uint64_t)cf, ValueAtIndex, v27) & 1) == 0)
                goto LABEL_33;
            }
          }
        }
        v7 = ++v17 >= v16;
        if (v16 == v17)
          goto LABEL_33;
      }
    }
    v7 = 1;
LABEL_33:
    v10 = cf;
    if (cf)
      goto LABEL_34;
  }
  else
  {
    v7 = 1;
  }
LABEL_35:

  return v7;
}

uint64_t PCSEngineStepValidateLooseLeaves(void *a1, const void **a2)
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  const __CFDictionary *Value;
  uint64_t v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v12;
  const __CFArray *CFArrayOfNames;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  const void *ValueAtIndex;
  uint64_t v19;
  const __CFArray *v20;
  const __CFDictionary *Mutable;
  const __CFArray *v22;
  const __CFArray *v23;
  uint64_t v24;
  CFTypeID v25;
  BOOL v26;
  CFMutableArrayRef v27;
  CFMutableArrayRef v28;
  uint64_t v29;
  id v30;
  __CFDictionary *v31;
  const void **v33;
  CFTypeRef cf;
  void *v35;
  __CFDictionary *theDict;
  _QWORD v37[4];
  id v38;
  CFMutableArrayRef v39;
  _QWORD v40[4];
  id v41;
  const __CFDictionary *v42;
  CFMutableArrayRef v43;
  _QWORD context[4];
  id v45;
  CFTypeRef v46;
  const void *v47;
  const __CFDictionary *v48;
  CFRange v49;
  CFRange v50;

  v3 = a1;
  _PCSServiceItemsGetTooRolledServiceTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "stableMetadata"))
  {
    objc_msgSend(v3, "setStableMetadata:", CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]));
    if (!objc_msgSend(v3, "stableMetadata"))
      goto LABEL_44;
  }
  v5 = (const __CFDictionary *)objc_msgSend(v3, "stableMetadata");
  Value = (const __CFDictionary *)CFDictionaryGetValue(v5, kPCSSecureBackupCFStableLooseLeaves[0]);
  if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) != 0 || objc_msgSend(v3, "iCDPHSMPlesio"))
  {
    v7 = objc_msgSend(v3, "log");
    if (Value)
    {
      PCSMigrationLog(v7, CFSTR("  Removing loose leaves"));
      v8 = (__CFDictionary *)objc_msgSend(v3, "stableMetadata");
      CFDictionaryRemoveValue(v8, kPCSSecureBackupCFStableLooseLeaves[0]);
      objc_msgSend(v3, "setModified:", 1);
    }
    else
    {
      PCSMigrationLog(v7, CFSTR("  Skipping validation of loose leaves"));
    }
    v9 = (const __CFDictionary *)objc_msgSend(v3, "metadata");
    if (CFDictionaryGetValue(v9, kPCSSecureBackupCFiCloudIdentityPublicDataKey[0]))
      objc_msgSend(v3, "setModified:", 1);
    goto LABEL_41;
  }
  if (!objc_msgSend(v3, "escrowIdentity"))
    goto LABEL_41;
  if (Value && (v10 = CFGetTypeID(Value), v10 == CFDictionaryGetTypeID()))
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v12 = MutableCopy;
  if (!MutableCopy)
  {
LABEL_44:
    _PCSErrorOOM(a2);
    goto LABEL_41;
  }
  v33 = a2;
  CFArrayOfNames = (const __CFArray *)PCSServiceItemsGetCFArrayOfNames();
  cf = PCSIdentitySetCreateMutable(0);
  Count = CFArrayGetCount(CFArrayOfNames);
  if (Count < 1)
  {
LABEL_34:
    v31 = (__CFDictionary *)objc_msgSend(v3, "stableMetadata");
    CFDictionarySetValue(v31, kPCSSecureBackupCFStableLooseLeaves[0], v12);
    v20 = 0;
    Mutable = 0;
    goto LABEL_35;
  }
  v15 = Count;
  v16 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v35 = v4;
  theDict = v12;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(CFArrayOfNames, v16);
    if (!PCSServiceItemTypeIsManatee((_BOOL8)ValueAtIndex))
      break;
LABEL_21:
    CFDictionaryRemoveValue(v12, ValueAtIndex);
LABEL_22:
    if (v15 == ++v16)
      goto LABEL_34;
  }
  if (objc_msgSend(v4, "containsObject:", ValueAtIndex))
  {
    PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Skipping too rolled identity for loose leaves: %@"), ValueAtIndex);
    goto LABEL_21;
  }
  v19 = PCSIdentitySetCopyOrderedIdentities(objc_msgSend(v3, "set"), (uint64_t)ValueAtIndex);
  if (!v19)
    goto LABEL_22;
  v20 = (const __CFArray *)v19;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    _PCSErrorOOM(v33);
    goto LABEL_35;
  }
  v22 = (const __CFArray *)CFDictionaryGetValue(v12, ValueAtIndex);
  if (v22)
  {
    v23 = v22;
    v24 = v17;
    v25 = CFGetTypeID(v22);
    v26 = v25 == CFArrayGetTypeID();
    v17 = v24;
    v12 = theDict;
    if (v26)
    {
      context[0] = v17;
      context[1] = 3221225472;
      context[2] = __PCSEngineStepValidateLooseLeaves_block_invoke;
      context[3] = &unk_1E553E680;
      v45 = v3;
      v46 = cf;
      v47 = ValueAtIndex;
      v48 = Mutable;
      v49.length = CFArrayGetCount(v23);
      v49.location = 0;
      CFArrayApplyFunction(v23, v49, (CFArrayApplierFunction)apply_block_1_2, context);

    }
  }
  v27 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (v27)
  {
    v28 = v27;
    v40[0] = v17;
    v40[1] = 3221225472;
    v40[2] = __PCSEngineStepValidateLooseLeaves_block_invoke_2;
    v40[3] = &unk_1E553E6A8;
    v42 = Mutable;
    v43 = v27;
    v29 = v17;
    v30 = v3;
    v41 = v30;
    v50.length = CFArrayGetCount(v20);
    v50.location = 0;
    CFArrayApplyFunction(v20, v50, (CFArrayApplierFunction)apply_block_1_2, v40);
    if (CFArrayGetCount(v28))
    {
      v37[0] = v29;
      v37[1] = 3221225472;
      v37[2] = __PCSEngineStepValidateLooseLeaves_block_invoke_3;
      v37[3] = &unk_1E553E6D0;
      v39 = v28;
      v38 = v30;
      CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)apply_block_2_3, v37);
      CFDictionarySetValue(theDict, ValueAtIndex, v28);

    }
    CFRelease(Mutable);
    CFRelease(v20);
    CFRelease(v28);

    v17 = v29;
    v4 = v35;
    v12 = theDict;
    goto LABEL_22;
  }
  _PCSErrorOOM(v33);
  v4 = v35;
LABEL_35:
  if (cf)
    CFRelease(cf);
  CFRelease(v12);
  if (Mutable)
    CFRelease(Mutable);
  if (v20)
    CFRelease(v20);
LABEL_41:

  return 1;
}

uint64_t PCSEngineStoreHSM(void *a1, const void **a2)
{
  id v3;
  const void *v4;
  const __CFData *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *ClientInfo;
  uint64_t v10;
  const void *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFString *key;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  const void *v24;
  uint64_t v25;
  __CFString **v26;
  __CFDictionary *v27;
  __CFString *v28;
  const void *PublicKey;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  char v38;
  char v39;
  id v40;
  const __CFArray *CFArrayOfNames;
  void *v42;
  __CFString *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  __CFDictionary *MutableForCFTypesWith;
  const __CFDictionary *v52;
  const void *v53;
  const __CFDictionary *v54;
  const void *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  CFMutableDictionaryRef MutableCopy;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  id v68;
  NSObject *v69;
  void *v70;
  CFErrorDomain Domain;
  const void *v72;
  uint64_t v73;
  CFMutableDictionaryRef v75;
  id v76;
  id v77;
  CFTypeRef v78;
  int v79;
  const __CFArray *theArray;
  __CFData *value;
  CFTypeRef ExternalForm;
  CFTypeRef v83;
  CFTypeRef cf;
  dispatch_semaphore_t v85;
  _QWORD v86[4];
  id v87;
  NSObject *v88;
  uint64_t *v89;
  const void **v90;
  _QWORD v91[4];
  id v92;
  NSObject *v93;
  uint64_t *v94;
  const void **v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  _QWORD v100[4];
  id v101;
  id v102;
  CFMutableDictionaryRef v103;
  _QWORD context[4];
  id v105;
  CFMutableDictionaryRef v106;
  CFRange v107;
  CFRange v108;

  v3 = a1;
  v96 = 0;
  v97 = &v96;
  v98 = 0x2020000000;
  v99 = 0;
  v85 = dispatch_semaphore_create(0);
  if (objc_msgSend(v3, "newIdentity") && (objc_msgSend(v3, "dropHSM") & 1) != 0)
    goto LABEL_116;
  if (objc_msgSend(v3, "newIdentity"))
  {
    if (GetClassicServiceArray_onceToken != -1)
      dispatch_once(&GetClassicServiceArray_onceToken, &__block_literal_global_11);
    objc_msgSend(v3, "setNewHSMContent:", PCSIdentitySetCreateExternalForm(objc_msgSend(v3, "log"), objc_msgSend(v3, "set"), 1, (const __CFArray *)GetClassicServiceArray_array, a2));
    if (!objc_msgSend(v3, "newHSMContent"))
      goto LABEL_116;
    objc_msgSend(v3, "setModified:", 1);
  }
  if (objc_msgSend(v3, "restoreHSM"))
  {
    if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) != 0 || (objc_msgSend(v3, "iCDPHSMPlesio") & 1) != 0)
    {
      _PCSError(a2, 69, CFSTR("Asked to restore HSM content, but flag in HSM doesn't match"));
      goto LABEL_116;
    }
    objc_msgSend(v3, "setNewHSMContent:", PCSStateCopyKeychainClassicIdentities(v3, 1, a2));
    if (!objc_msgSend(v3, "newHSMContent"))
      goto LABEL_116;
    objc_msgSend(v3, "setModified:", 1);
  }
  if (objc_msgSend(v3, "dropHSM"))
  {
    if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) == 0 && (objc_msgSend(v3, "iCDPHSMPlesio") & 1) == 0)
    {
      _PCSError(a2, 69, CFSTR("Asked to drop HSM content, but flag in HSM already set"));
      goto LABEL_116;
    }
    if (GetDroppedServiceArray_onceToken != -1)
      dispatch_once(&GetDroppedServiceArray_onceToken, &__block_literal_global_565);
    objc_msgSend(v3, "setNewHSMContent:", PCSIdentitySetCreateExternalForm(objc_msgSend(v3, "log"), objc_msgSend(v3, "set"), 1, (const __CFArray *)GetDroppedServiceArray_array, a2));
    if (!objc_msgSend(v3, "newHSMContent"))
      goto LABEL_116;
    objc_msgSend(v3, "setModified:", 1);
  }
  if (objc_msgSend(v3, "escrowMissing"))
  {
    objc_msgSend(v3, "setNewHSMContent:", CFRetain((CFTypeRef)objc_msgSend(v3, "classicContent")));
    objc_msgSend(v3, "setModified:", 1);
  }
  if (objc_msgSend(v3, "escrowMergeNeeded"))
  {
    objc_msgSend(v3, "setNewHSMContent:", 0);
    objc_msgSend(v3, "setModified:", 1);
  }
  if (objc_msgSend(v3, "newHSMContent") && (objc_msgSend(v3, "dropHSM") & 1) == 0)
  {
    v4 = (const void *)objc_msgSend(v3, "newHSMContent");
  }
  else
  {
    if (!objc_msgSend(v3, "escrowMergeNeeded"))
    {
      v5 = (const __CFData *)PCSStateCopyKeychainClassicIdentities(v3, 0, a2);
      if (!v5)
        goto LABEL_116;
      goto LABEL_31;
    }
    v4 = (const void *)objc_msgSend(v3, "classicContent");
  }
  v5 = (const __CFData *)CFRetain(v4);
LABEL_31:
  v6 = PCSIdentitySetCreateFromExternalForm(0, v5, 0, a2);
  if (v5)
    CFRelease(v5);
  if (v6)
  {
    v7 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v6, kPCSServiceEscrow, a2);
    v8 = v7;
    if (!v7)
    {
      _PCSError(a2, 70, CFSTR("Escrow identity not in escrowed set"));
LABEL_115:
      CFRelease(v6);
      goto LABEL_116;
    }
    if (!PCSIdentityCheckWrappable((uint64_t)v7, a2))
    {
      v13 = 0;
      v12 = 0;
      MutableForCFTypesWith = 0;
      value = 0;
      ExternalForm = 0;
      v83 = 0;
      cf = 0;
      goto LABEL_101;
    }
    if (!objc_msgSend(v3, "modified"))
    {
      ExternalForm = 0;
      v83 = 0;
      cf = 0;
      value = 0;
      v12 = 0;
      v13 = 0;
LABEL_72:
      if (objc_msgSend(v3, "newIdentity", ClientInfo))
      {
        v43 = kPCSSecureBackupCFContainsiCloudIdentityKey[0];
        v79 = objc_msgSend(v3, "newHSMContent");
        MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith(v79, v44, v45, v46, v47, v48, v49, v50, v43, *MEMORY[0x1E0C9AE50]);
        applyOptions(v3, MutableForCFTypesWith);
        if (objc_msgSend(v3, "metadata"))
        {
          v52 = (const __CFDictionary *)objc_msgSend(v3, "metadata");
          v53 = CFDictionaryGetValue(v52, kPCSSecureBackupCFStingrayMetadataHashKey[0]);
          if (v53)
            CFDictionarySetValue(MutableForCFTypesWith, kPCSSecureBackupCFStingrayMetadataHashKey[0], v53);
          else
            PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("MetadataHashKey missing"));
        }
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __PCSEngineStoreHSM_block_invoke;
        v91[3] = &unk_1E553E6F8;
        v92 = v3;
        v94 = &v96;
        v95 = a2;
        v64 = v85;
        v93 = v64;
        _PCSSecureBackupEnableWithInfo((uint64_t)MutableForCFTypesWith, v91);
        __PCS_WAITING_FOR_COM_APPLE_SDB(v64);

      }
      else if (objc_msgSend(v3, "modified"))
      {
        v54 = (const __CFDictionary *)objc_msgSend(v3, "metadata");
        v55 = CFDictionaryGetValue(v54, kPCSSecureBackupCFStingrayMetadataHashKey[0]);
        MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v55, v56, v57, v58, v59, v60, v61, v62, kPCSSecureBackupCFContainsiCloudIdentityKey[0], *MEMORY[0x1E0C9AE50]);
        if (MutableForCFTypesWith)
        {
          applyOptions(v3, MutableForCFTypesWith);
          if (objc_msgSend(v3, "newHSMContent"))
          {
            PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("New HSM content (update)"));
            CFDictionarySetValue(MutableForCFTypesWith, kPCSSecureBackupCFiCloudIdentityDataKey[0], (const void *)objc_msgSend(v3, "newHSMContent"));
          }
          if (v55)
          {
            CFDictionarySetValue(MutableForCFTypesWith, kPCSSecureBackupCFStingrayMetadataHashKey[0], v55);
          }
          else
          {
            v65 = objc_msgSend(v3, "log");
            v66 = objc_msgSend(v3, "newHSMContent");
            v67 = "with content, this will not end well";
            if (!v66)
              v67 = "no content";
            PCSMigrationLog(v65, CFSTR("MetadataHashKey missing: %s"), v67);
          }
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __PCSEngineStoreHSM_block_invoke_2;
          v86[3] = &unk_1E553E6F8;
          v68 = v3;
          v87 = v68;
          v89 = &v96;
          v90 = a2;
          v69 = v85;
          v88 = v69;
          v70 = (void *)MEMORY[0x1AF4156AC](v86);
          if (objc_msgSend(v68, "newHSMContent"))
            _PCSSecureBackupEnableWithInfo((uint64_t)MutableForCFTypesWith, v70);
          else
            _PCSSecureBackupUpdateMetadataWithInfo((uint64_t)MutableForCFTypesWith, v70);
          __PCS_WAITING_FOR_COM_APPLE_SDB(v69);
          if (a2)
          {
            if (!*((_BYTE *)v97 + 24) && CFErrorGetCode((CFErrorRef)*a2) == 22)
            {
              Domain = CFErrorGetDomain((CFErrorRef)*a2);
              if (CFEqual(Domain, kPCSCloudServicesErrorDomain[0]))
              {
                PCSMigrationLog(objc_msgSend(v68, "log"), CFSTR("Congestion event happen restarting state machine: %@"), *a2);
                v72 = *a2;
                if (*a2)
                {
                  *a2 = 0;
                  CFRelease(v72);
                }
                objc_msgSend(v68, "setRestart:", 1);
                *((_BYTE *)v97 + 24) = 1;
              }
            }
          }

        }
        else
        {
          _PCSErrorOOM(a2);
        }
      }
      else
      {
        MutableForCFTypesWith = 0;
        *((_BYTE *)v97 + 24) = 1;
      }
      goto LABEL_101;
    }
    v10 = objc_msgSend(v3, "set");
    v11 = _PCSIdentitySetCopyCurrentIdentityInternal(v10, kPCSServiceBladerunner, 0);
    cf = v11;
    if (v11)
      v83 = (CFTypeRef)PCSIdentityCopyPublicKeyInfo((uint64_t)v11);
    else
      v83 = 0;
    key = kPCSMetadataiCDP[0];
    v15 = objc_msgSend(v3, "iCDP");
    v16 = objc_msgSend(v3, "iCDPArmed");
    v24 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v15)
      v25 = *MEMORY[0x1E0C9AE50];
    else
      v25 = *MEMORY[0x1E0C9AE40];
    v12 = CFDictionaryCreateMutableForCFTypesWith(v16, v17, v18, v19, v20, v21, v22, v23, key, v25);
    if (v12)
    {
      if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) != 0)
      {
        v26 = kPCSMetadataiCDPWalrus;
LABEL_49:
        CFDictionarySetValue(v12, *v26, v24);
        value = 0;
        ExternalForm = 0;
LABEL_55:
        if (objc_msgSend(v3, "stableMetadata")
          || (objc_msgSend(v3, "setStableMetadata:", CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])), objc_msgSend(v3, "stableMetadata")))
        {
          v27 = (__CFDictionary *)objc_msgSend(v3, "stableMetadata");
          v28 = kPCSSecureBackupCFStableEscrowKey[0];
          PublicKey = (const void *)PCSIdentityGetPublicKey((uint64_t)v8);
          CFDictionarySetValue(v27, v28, PublicKey);
          v13 = CFDictionaryCreateMutableForCFTypesWith(v30, v31, v32, v33, v34, v35, v36, v37, kPCSSecureBackupCFiCloudDataProtectionKey[0], (uint64_t)v12);
          if (v13)
          {
            if (objc_msgSend(v3, "stableMetadata"))
              CFDictionarySetValue(v13, kPCSSecureBackupCFStableMetadataKey[0], (const void *)objc_msgSend(v3, "stableMetadata"));
            if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) == 0)
            {
              v38 = objc_msgSend(v3, "iCDPHSMPlesio");
              v39 = v83 ? v38 : 1;
              if ((v39 & 1) == 0)
                CFDictionarySetValue(v13, kPCSSecureBackupCFiCloudIdentityPublicDataKey[0], v83);
            }
            v40 = v3;
            CFArrayOfNames = (const __CFArray *)PCSServiceItemsGetCFArrayOfNames();
            _PCSServiceItemsGetTooRolledServiceTypes();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v40, "iCDPHSMWalrus") & 1) != 0 || objc_msgSend(v40, "iCDPHSMPlesio"))
            {
              PCSMigrationLog(objc_msgSend(v40, "log"), CFSTR("  Skipping registry creation"));
            }
            else
            {
              if (objc_msgSend(v40, "oldRegistry"))
                MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)objc_msgSend(v40, "oldRegistry"));
              else
                MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              v75 = MutableCopy;
              if (MutableCopy)
              {
                if (objc_msgSend(v40, "removeFromRegistry"))
                {
                  theArray = (const __CFArray *)objc_msgSend(v40, "removeFromRegistry");
                  context[0] = MEMORY[0x1E0C809B0];
                  context[1] = 3221225472;
                  context[2] = __CreateKeyRegistry_block_invoke;
                  context[3] = &unk_1E553E5B8;
                  v105 = v40;
                  v106 = v75;
                  v107.length = CFArrayGetCount(theArray);
                  v107.location = 0;
                  CFArrayApplyFunction(theArray, v107, (CFArrayApplierFunction)apply_block_1_2, context);

                }
                v100[0] = MEMORY[0x1E0C809B0];
                v100[1] = 3221225472;
                v100[2] = __CreateKeyRegistry_block_invoke_2;
                v100[3] = &unk_1E553E768;
                v103 = v75;
                v76 = v42;
                v101 = v76;
                v77 = v40;
                v102 = v77;
                v108.length = CFArrayGetCount(CFArrayOfNames);
                v108.location = 0;
                CFArrayApplyFunction(CFArrayOfNames, v108, (CFArrayApplierFunction)apply_block_1_2, v100);
                v78 = CFRetain(v75);

                CFRelease(v75);
                if (v78)
                {
                  CFDictionarySetValue(v13, kPCSSecureBackupCFSecureBackupKeyRegistry[0], v78);
                  CFRelease(v78);
                }
                goto LABEL_70;
              }
            }

LABEL_70:
            ClientInfo = (const void *)PCSSupportGetClientInfo();
            if (ClientInfo)
              CFDictionarySetValue(v13, kPCSSecureBackupCFVersionMetadataKey[0], ClientInfo);
            goto LABEL_72;
          }
          _PCSErrorOOM(a2);
        }
        v13 = 0;
        MutableForCFTypesWith = 0;
LABEL_101:
        CFRelease(v8);
        if (v13)
          CFRelease(v13);
        if (v12)
          CFRelease(v12);
        if (MutableForCFTypesWith)
          CFRelease(MutableForCFTypesWith);
        if (value)
          CFRelease(value);
        if (cf)
          CFRelease(cf);
        if (v83)
          CFRelease(v83);
        if (ExternalForm)
          CFRelease(ExternalForm);
        goto LABEL_115;
      }
      if (objc_msgSend(v3, "iCDPHSMPlesio"))
      {
        v26 = kPCSMetadataiCDPDrop;
        goto LABEL_49;
      }
      if (objc_msgSend(v3, "escrowIdentity") && !CFEqual((CFTypeRef)objc_msgSend(v3, "escrowIdentity"), v8))
      {
        _PCSError(a2, 71, CFSTR("Escrow identity not same"));
      }
      else
      {
        ExternalForm = (CFTypeRef)PCSIdentitySetCreateExternalForm(objc_msgSend(v3, "log"), objc_msgSend(v3, "set"), 1, 0, a2);
        if (ExternalForm)
        {
          value = PCSBackupCreateEscrowedKeysetWithIdentity((uint64_t)v8, (const __CFData *)ExternalForm, 0, a2);
          if (!value)
          {
            v13 = 0;
            MutableForCFTypesWith = 0;
            value = 0;
            goto LABEL_101;
          }
          CFDictionarySetValue(v12, kPCSMetadataEscrowedKeys[0], value);
          goto LABEL_55;
        }
      }
      v13 = 0;
    }
    else
    {
      _PCSErrorOOM(a2);
      v13 = 0;
      v12 = 0;
    }
    MutableForCFTypesWith = 0;
    value = 0;
    ExternalForm = 0;
    goto LABEL_101;
  }
LABEL_116:
  v73 = *((unsigned __int8 *)v97 + 24);

  _Block_object_dispose(&v96, 8);
  return v73;
}

void sub_1A95392C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEngineStoreLocal(void *a1, const void **a2)
{
  id v3;
  CFTypeRef v4;
  const void *v5;
  uint64_t v6;
  id v7;
  const __CFDictionary *v8;
  void *Value;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  void *v17;
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
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  const void *v37;

  v3 = a1;
  v4 = PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "set");
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __PCSEngineStoreLocal_block_invoke;
    v35 = &unk_1E553E790;
    v7 = v3;
    v36 = v7;
    v37 = v5;
    PCSIdentitySetEnumerateIdentities(v6, 0, &v32);
    if (objc_msgSend(v7, "newHSMContent", v32, v33, v34, v35)
      && (objc_msgSend(v7, "dropHSM") & 1) == 0
      && (objc_msgSend(v7, "restoreHSM") & 1) == 0)
    {
      v8 = (const __CFDictionary *)objc_msgSend(v7, "options");
      Value = (void *)CFDictionaryGetValue(v8, kPCSSetupDSID[0]);
      if (!PCSCurrentPersonaMatchesDSID(Value))
        goto LABEL_15;
      v10 = objc_msgSend(v7, "newHSMContent");
      if (!__PCSStoreInKeychain(v10, (uint64_t)Value, a2, v11, v12, v13, v14, v15)
        || !__PCSStoreIniCloudKeychain(objc_msgSend(v7, "newHSMContent"), (int)Value, a2))
      {
        goto LABEL_18;
      }
    }
    if (!objc_msgSend(v7, "escrowMergeNeeded"))
    {
LABEL_12:
      objc_msgSend(v7, "clearSet");
      objc_msgSend(v7, "setSet:", CFRetain(v5));
      v30 = 1;
LABEL_13:
      CFRelease(v5);
LABEL_16:

      goto LABEL_17;
    }
    v16 = (const __CFDictionary *)objc_msgSend(v7, "options");
    v17 = (void *)CFDictionaryGetValue(v16, kPCSSetupDSID[0]);
    if (PCSCurrentPersonaMatchesDSID(v17))
    {
      v18 = objc_msgSend(v7, "classicContent");
      if (__PCSStoreInKeychain(v18, (uint64_t)v17, a2, v19, v20, v21, v22, v23))
      {
        v24 = objc_msgSend(v7, "classicContent");
        if (__PCSUpdateIniCloudKeychain(v24, (int)v17, a2, v25, v26, v27, v28, v29))
          goto LABEL_12;
      }
LABEL_18:
      v30 = 0;
      goto LABEL_13;
    }
LABEL_15:
    _PCSError(a2, 152, CFSTR("current persona does not match dsid"));
    v30 = 0;
    goto LABEL_16;
  }
  v30 = 0;
LABEL_17:

  return v30;
}

uint64_t PCSEngineStoreLocalKeyfile(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  void *Value;
  void *v6;
  CFTypeID v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!objc_msgSend(v3, "modified"))
    goto LABEL_16;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = (void *)CFDictionaryGetValue(v4, kPCSSetupDSID[0]);
  if (!Value || (v6 = Value, v7 = CFGetTypeID(Value), v7 != CFStringGetTypeID()))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 121, CFSTR("Missing parameter: dsid"));
    goto LABEL_9;
  }
  if (!CFEqual(v6, kPCSSetupDSIDAny[0]))
  {
    v8 = PCSCurrentPersonaMatchesDSID(v6);
    if (a2 && !v8)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = kPCSErrorDomain;
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("Current persona does not match chosen dsid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 152, v11);
      *a2 = (const void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    if (!StoreLocalKeyfile(v3, (uint64_t)v6, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup"), CFSTR("backup"), 0, 0x20000000, a2))goto LABEL_9;
    LocalStorageCreatePath((uint64_t)v6, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/LocalBackup"), CFSTR("witness"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_9;
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v14, 0, 4, 0);

    +[PCSMobileBackup defaultMobileBackup](PCSMobileBackup, "defaultMobileBackup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isBackupEnabled"))
    {
      v22 = kPCSMessages3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      StoreLocalKeyfile(v3, (uint64_t)v6, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup"), CFSTR("messages"), v18, 0x40000000, 0);

    }
    else
    {
      LocalStorageCreatePath((uint64_t)v6, CFSTR("/var/mobile/Library/Application Support/com.apple.ProtectedCloudStorage/Backup"), CFSTR("messages"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeItemAtPath:error:", v19, 0);

    }
LABEL_16:
    v12 = 1;
    goto LABEL_17;
  }
LABEL_9:
  v12 = 0;
LABEL_17:

  return v12;
}

uint64_t PCSEngineStoreiCDPStatus(void *a1, const void **a2)
{
  return _PCSEngineStoreiCDPStatus(a1, 0, a2);
}

uint64_t PCSEngineAddMissingCurrentPointers(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  void *Value;
  void *v6;
  CFTypeID v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!_PCSRunningInUnitTests())
  {
    if ((objc_msgSend(v3, "iCDP") & 1) != 0)
    {
      v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
      Value = (void *)CFDictionaryGetValue(v4, kPCSSetupDSID[0]);
      if (!Value || (v6 = Value, v7 = CFGetTypeID(Value), v7 != CFStringGetTypeID()))
      {
        _PCSErrorContext(objc_msgSend(v3, "log"), a2, 121, CFSTR("Missing parameter: dsid"));
        goto LABEL_11;
      }
      v8 = PCSCurrentPersonaMatchesDSID(v6);
      if (a2 && !v8)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = kPCSErrorDomain;
        v17 = *MEMORY[0x1E0CB2D50];
        v18[0] = CFSTR("Current persona does not match chosen dsid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 152, v11);
        *a2 = (const void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        v12 = 0;
        goto LABEL_12;
      }
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __PCSEngineAddMissingCurrentPointers_block_invoke;
      v14[3] = &unk_1E553E808;
      v16 = v6;
      v15 = v3;
      PCSServiceItemsGetEachName(v14);

    }
    else
    {
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("CDP not enabled, skipping AddMissingCurrentPointers"));
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

uint64_t CaptureMetadata(void *a1, const __CFDictionary *a2)
{
  id v3;
  const __CFDictionary *HSMClientMetaData;
  const __CFDictionary *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFDictionary *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  const __CFDictionary *v11;
  const void *v12;
  uint64_t v13;

  v3 = a1;
  HSMClientMetaData = GetHSMClientMetaData(a2);
  if (HSMClientMetaData)
  {
    v5 = HSMClientMetaData;
    Value = (const __CFDictionary *)CFDictionaryGetValue(HSMClientMetaData, kPCSSecureBackupCFStableMetadataKey[0]);
    if (Value)
    {
      v7 = Value;
      v8 = CFGetTypeID(Value);
      if (v8 != CFDictionaryGetTypeID()
        || (objc_msgSend(v3, "clearStableMetadata"),
            objc_msgSend(v3, "setStableMetadata:", CFDictionaryCreateMutableCopy(0, 0, v7)),
            !objc_msgSend(v3, "stableMetadata")))
      {
        v13 = 0;
        goto LABEL_10;
      }
    }
    objc_msgSend(v3, "clearOldRegistry");
    objc_msgSend(v3, "setOldRegistry:", CFDictionaryGetValue(v5, kPCSSecureBackupCFSecureBackupKeyRegistry[0]));
    if (objc_msgSend(v3, "oldRegistry"))
    {
      CFRetain((CFTypeRef)objc_msgSend(v3, "oldRegistry"));
      v9 = (const __CFDictionary *)objc_msgSend(v3, "options");
      CFDictionaryGetValue(v9, kPCSSetupCallbackKeyRegistry[0]);
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (const __CFDictionary *)objc_msgSend(v3, "options");
        v12 = CFDictionaryGetValue(v11, kPCSSetupDSID[0]);
        ((void (**)(_QWORD, const void *, uint64_t))v10)[2](v10, v12, objc_msgSend(v3, "oldRegistry"));
      }

    }
  }
  v13 = 1;
LABEL_10:

  return v13;
}

uint64_t PCSEngineHaveSyncEnoughToCreateIdentities(void *a1, const void **a2)
{
  id v3;
  CFTypeRef v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *PublicKey;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CFTypeID v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  CFTypeID v14;
  const __CFArray *v15;
  const __CFArray *v16;
  CFTypeID v17;
  CFIndex Count;
  CFIndex v19;
  BOOL v20;
  uint64_t v21;
  const __CFData *ValueAtIndex;
  const __CFData *v23;
  CFTypeID v24;
  _QWORD *v25;
  const void *v26;
  const void *PublicID;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;

  v3 = a1;
  if (!objc_msgSend(v3, "set"))
  {
    objc_msgSend(v3, "setSet:", PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2));
    if (!objc_msgSend(v3, "set"))
    {
      v7 = 0;
      v4 = 0;
      goto LABEL_38;
    }
  }
  v4 = PCSStateCopyKeychainClassicIdentities(v3, 0, a2);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_38;
  }
  v5 = objc_msgSend(v3, "set");
  v6 = _PCSIdentitySetCopyCurrentIdentityInternal(v5, kPCSServiceMaster, a2);
  v7 = v6;
  if (!v6)
  {
LABEL_38:
    v28 = 0;
    PublicKey = 0;
    goto LABEL_27;
  }
  PublicKey = (const void *)PCSIdentityGetPublicKey((uint64_t)v6);
  if (PublicKey)
  {
    if (objc_msgSend(v3, "oldRegistry"))
    {
      v9 = (const __CFDictionary *)objc_msgSend(v3, "oldRegistry");
      if (!v9)
        goto LABEL_25;
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 != CFDictionaryGetTypeID())
        goto LABEL_25;
      Value = (const __CFDictionary *)CFDictionaryGetValue(v10, kPCSServiceMaster);
      if (Value
        && (v13 = Value, v14 = CFGetTypeID(Value), v14 == CFDictionaryGetTypeID())
        && (v15 = (const __CFArray *)CFDictionaryGetValue(v13, kPCSSecureBackupCFKeyRegistryPublicIdentities[0])) != 0
        && (v16 = v15, v17 = CFGetTypeID(v15), v17 == CFArrayGetTypeID())
        && (Count = CFArrayGetCount(v16), Count >= 1))
      {
        v19 = Count;
        v20 = 0;
        v21 = 1;
        do
        {
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v16, v21 - 1);
          if (ValueAtIndex)
          {
            v23 = ValueAtIndex;
            v24 = CFGetTypeID(ValueAtIndex);
            if (v24 == CFDataGetTypeID())
            {
              v25 = PCSPublicIdentityCreateWithPublicKeyInfo(v23, 0);
              if (v25)
              {
                v26 = v25;
                PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)v25);
                if (PublicID)
                  v20 = CFEqual(PublicID, PublicKey) != 0;
                CFRelease(v26);
              }
            }
          }
          if (v21 >= v19)
            break;
          ++v21;
        }
        while (!v20);
      }
      else
      {
LABEL_25:
        v20 = 0;
      }
      v28 = v20;
    }
    else
    {
      v28 = 1;
    }
  }
  else
  {
    v28 = 0;
  }
LABEL_27:
  v29 = objc_msgSend(v3, "log");
  v30 = _PCSYESNO(v28);
  if (objc_msgSend(v3, "oldRegistry"))
    v31 = CFSTR("Registry");
  else
    v31 = CFSTR("First modern");
  v32 = _PCSYESNO(v4 != 0);
  PCSMigrationLog(v29, CFSTR("EnoughToUpdate: %@ though %@ (master %@, content %@)"), v30, v31, PublicKey, v32);
  if (v4)
    CFRelease(v4);
  if (v7)
    CFRelease(v7);

  return v28;
}

CFTypeRef PCSStateCopyKeychainClassicIdentities(void *a1, int a2, const void **a3)
{
  id v5;
  const __CFDictionary *v6;
  __CFString *Value;
  const __CFDictionary *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFTypeID v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  CFTypeRef v18;
  int v19;
  int v20;
  int v21;
  int v22;
  CFTypeRef v23;
  _BOOL4 v24;
  CFErrorRef v25;
  CFErrorRef v26;
  int v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  dispatch_semaphore_t v32;
  NSObject *v33;
  dispatch_time_t v34;
  BOOL v35;
  uint64_t *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  const void *v41;
  const void *v42;
  uint64_t ExternalForm;
  uint64_t v44;
  const void *v45;
  CFTypeRef Master;
  const __CFArray *v47;
  CFIndex v48;
  const void *ValueAtIndex;
  const void *v50;
  CFErrorRef v52;
  CFErrorRef err;
  _QWORD v54[4];
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;

  v5 = a1;
  v6 = (const __CFDictionary *)objc_msgSend(v5, "options");
  Value = (__CFString *)CFDictionaryGetValue(v6, kPCSSetupDSID[0]);
  v8 = (const __CFDictionary *)objc_msgSend(v5, "options");
  v9 = (const __CFString *)CFDictionaryGetValue(v8, kPCSSetupUsername[0]);
  v52 = 0;
  err = 0;
  if (!Value || (v10 = v9, v11 = CFGetTypeID(Value), v11 != CFStringGetTypeID()))
  {
    _PCSError(a3, 3, CFSTR("DSID not a string"), v52);
    goto LABEL_9;
  }
  if (!PCSCurrentPersonaMatchesDSID(Value))
  {
    _PCSError(a3, 152, CFSTR("current persona does not match dsid"), v52);
    goto LABEL_9;
  }
  v18 = __PCSCopyFromiCloudKeychain(Value, (const void **)&err, v12, v13, v14, v15, v16, v17);
  v23 = __PCSCopyFromKeychain((uint64_t)kPCSServiceName[0], v10, Value, (const void **)&v52, v19, v20, v21, v22);
  v24 = 0;
  v25 = err;
  if (err && v52)
  {
    v24 = CFErrorGetCode(err) == -25300 && CFErrorGetCode(v52) == -25300;
    v25 = err;
  }
  if (v25)
  {
    err = 0;
    CFRelease(v25);
  }
  v26 = v52;
  if (v52)
  {
    v52 = 0;
    CFRelease(v26);
  }
  if (v18 && v23)
  {
    if (CFEqual(v18, v23))
    {
      CFRelease(v23);
      v23 = 0;
      goto LABEL_20;
    }
    _PCSError(a3, 74, CFSTR("local and iCKC not the same PCS keys"));
    CFRelease(v23);
    CFRelease(v18);
LABEL_9:
    v18 = 0;
    goto LABEL_71;
  }
LABEL_20:
  if (v18)
    v27 = 1;
  else
    v27 = v24;
  if (a2 && v27)
  {
    v28 = v5;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v58 = 0;
    objc_msgSend(MEMORY[0x1E0CD5C10], "controlObject:", &v58);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v58;
    v31 = v30;
    if (!v29)
    {
      if (a3)
        *a3 = v30;

      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v63, 8);
      goto LABEL_65;
    }
    v32 = dispatch_semaphore_create(0);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __PCSFetchCKKSWithTimeout_block_invoke;
    v54[3] = &unk_1E553E518;
    v56 = &v63;
    v57 = &v59;
    v33 = v32;
    v55 = v33;
    objc_msgSend(v29, "rpcFetchAndProcessChangesIfNoRecentFetch:reply:", CFSTR("ProtectedCloudStorage"), v54);
    v34 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v33, v34))
    {
      _PCSError(a3, 99, CFSTR("rpcFetchAndProcessChanges timed out"));
      v35 = 0;
    }
    else
    {
      v36 = v60;
      if (a3)
      {
        v37 = (const void *)v60[3];
        if (v37)
        {
          *a3 = CFRetain(v37);
          v36 = v60;
        }
      }
      v38 = (const void *)v36[3];
      if (v38)
      {
        v36[3] = 0;
        CFRelease(v38);
      }
      v35 = *((_BYTE *)v64 + 24) != 0;
    }

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    if (v35)
    {
      if (v18)
      {
        v39 = PCSIdentitySetCreateFromExternalForm(0, (const __CFData *)v18, 0, a3);
        if (!v39)
          goto LABEL_65;
        v40 = v39;
        v41 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v39, kPCSServiceMaster, 0);
        v42 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v40, kPCSServiceEscrow, 0);
        CFRelease(v40);
        if (v41 && v42)
        {
          CFRelease(v41);
          CFRelease(v42);
          ExternalForm = (uint64_t)CFRetain(v18);
LABEL_66:

          if (v23)
            CFRelease(v23);
          if (v18)
            CFRelease(v18);
          v18 = (CFTypeRef)ExternalForm;
          goto LABEL_71;
        }
        if (v41)
          CFRelease(v41);
        if (v42)
          CFRelease(v42);
      }
      v44 = objc_msgSend(v28, "set", v52);
      v45 = _PCSIdentitySetCopyCurrentIdentityInternal(v44, kPCSServiceMaster, 0);
      if (v45)
        goto LABEL_54;
      Master = PCSIdentityCreateMaster(0, a3);
      if (Master)
      {
        v45 = Master;
        if (!PCSIdentitySetAddIdentityWithError(objc_msgSend(v28, "set"), (uint64_t)Master, a3)
          || !PCSIdentitySetSetCurrentIdentityWithError(objc_msgSend(v28, "set"), (uint64_t)v45, a3))
        {
          ExternalForm = 0;
LABEL_64:
          CFRelease(v45);
          goto LABEL_66;
        }
LABEL_54:
        if (GetClassicServiceArray_onceToken != -1)
          dispatch_once(&GetClassicServiceArray_onceToken, &__block_literal_global_11);
        v47 = (const __CFArray *)GetClassicServiceArray_array;
        if (CFArrayGetCount((CFArrayRef)GetClassicServiceArray_array) < 1)
        {
LABEL_63:
          ExternalForm = PCSIdentitySetCreateExternalForm(objc_msgSend(v28, "log"), objc_msgSend(v28, "set"), 1, v47, a3);
          goto LABEL_64;
        }
        v48 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v47, v48);
          if (!CFEqual(ValueAtIndex, kPCSServiceMaster))
          {
            v50 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(v28, "set"), (uint64_t)ValueAtIndex, 0);
            if (v50)
            {
              CFRelease(v50);
            }
            else if ((AddService(v28, (uint64_t)v45, ValueAtIndex, a3) & 1) == 0)
            {
              ExternalForm = 0;
              goto LABEL_64;
            }
          }
          if (++v48 >= CFArrayGetCount(v47))
            goto LABEL_63;
        }
      }
    }
LABEL_65:
    ExternalForm = 0;
    goto LABEL_66;
  }
  if (!v18)
  {
    v18 = v23;
    if (!v23)
      _PCSError(a3, 74, CFSTR("no PCS keys in keychain!"));
  }
LABEL_71:

  return v18;
}

void sub_1A953A314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

const void *isArray(const void *result)
{
  CFTypeID v1;

  if (result)
  {
    v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFArrayGetTypeID());
  }
  return result;
}

uint64_t AddService(void *a1, uint64_t a2, const void *a3, const void **a4)
{
  id v7;
  unsigned int FlagsByName;
  const void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD *Service;

  v7 = a1;
  FlagsByName = PCSServiceItemGetFlagsByName(a3);
  if (CFEqual(a3, kPCSServiceMaster))
  {
    _PCSErrorContext(objc_msgSend(v7, "log"), a4, 54, CFSTR("Can't add master to set %@"), objc_msgSend(v7, "set"));
    goto LABEL_15;
  }
  v9 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(v7, "set"), (uint64_t)a3, 0);
  if (!v9)
  {
    v12 = objc_msgSend(v7, "log");
    v13 = _PCSYESNO(1);
    v14 = _PCSYESNO(0);
    v15 = _PCSYESNO((FlagsByName >> 2) & 1);
    PCSMigrationLog(v12, CFSTR("   service %@ identity missing: %@ invalid: %@, manatee: %@. adding one"), a3, v13, v14, v15);
    goto LABEL_7;
  }
  v10 = v9;
  if ((PCSIdentityCheckValidPublicKey((uint64_t)v9, 0) & 1) == 0)
  {
    v16 = objc_msgSend(v7, "log");
    v17 = _PCSYESNO(0);
    v18 = _PCSYESNO(1);
    v19 = _PCSYESNO((FlagsByName >> 2) & 1);
    PCSMigrationLog(v16, CFSTR("   service %@ identity missing: %@ invalid: %@, manatee: %@. adding one"), a3, v17, v18, v19);
    CFRelease(v10);
LABEL_7:
    Service = PCSIdentityCreateService(a2, FlagsByName | 1, (const __CFNumber *)a3, a4);
    if (Service)
    {
      v10 = Service;
      if (PCSIdentitySetAddIdentity(objc_msgSend(v7, "set"), (uint64_t)Service)
        && PCSIdentitySetSetCurrentIdentity(objc_msgSend(v7, "set"), (uint64_t)v10))
      {
        v11 = 1;
        objc_msgSend(v7, "setModified:", 1);
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_11;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 1;
LABEL_11:
  CFRelease(v10);
LABEL_12:

  return v11;
}

uint64_t PCSEngineValidateStepEnsureServicesHaveCurrentSet(void *a1)
{
  id v1;
  const __CFArray *CFArrayOfNames;
  _QWORD context[4];
  id v5;
  CFRange v6;

  v1 = a1;
  CFArrayOfNames = (const __CFArray *)PCSServiceItemsGetCFArrayOfNames();
  if (objc_msgSend(v1, "set"))
  {
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSEngineValidateStepEnsureServicesHaveCurrentSet_block_invoke;
    context[3] = &unk_1E553E540;
    v5 = v1;
    v6.length = CFArrayGetCount(CFArrayOfNames);
    v6.location = 0;
    CFArrayApplyFunction(CFArrayOfNames, v6, (CFArrayApplierFunction)apply_block_1_2, context);

  }
  return 1;
}

uint64_t PCSEngineStepValidateEscrowedKeys(void *a1)
{
  id v1;
  uint64_t v2;
  const void *v3;
  const void *v4;
  const __CFDictionary *v5;
  const __CFData *Value;
  const __CFData *v7;
  CFTypeID v8;
  const void *v9;

  v1 = a1;
  if ((objc_msgSend(v1, "iCDPHSMWalrus") & 1) == 0 && (objc_msgSend(v1, "iCDPHSMPlesio") & 1) == 0)
  {
    v2 = objc_msgSend(v1, "set");
    v3 = _PCSIdentitySetCopyCurrentIdentityInternal(v2, kPCSServiceEscrow, 0);
    if (v3)
    {
      v4 = v3;
      if ((PCSIdentityCheckValidPublicKey((uint64_t)v3, 0) & 1) == 0)
      {
        v5 = GetiCDPMetadata((const __CFDictionary *)objc_msgSend(v1, "metadata"));
        if (v5)
        {
          Value = (const __CFData *)CFDictionaryGetValue(v5, kPCSMetadataEscrowedKeys[0]);
          if (Value)
          {
            v7 = Value;
            v8 = CFGetTypeID(Value);
            if (v8 == CFDataGetTypeID())
            {
              v9 = (const void *)PCSBackupCopyRecoveredKeysetWithIdentity((int)v4, v7, 0);
              if (v9)
                CFRelease(v9);
              else
                objc_msgSend(v1, "setModified:", 1);
            }
          }
        }
      }
      CFRelease(v4);
    }
  }

  return 1;
}

BOOL IsLocalStoringService(void *a1, const void *a2)
{
  id v3;
  const __CFArray *v4;
  _BOOL8 v5;
  CFRange v7;

  v3 = a1;
  if (!objc_msgSend(v3, "limitLocalStoring"))
    IsLocalStoringService_cold_1();
  v4 = (const __CFArray *)objc_msgSend(v3, "limitLocalStoring");
  v7.length = CFArrayGetCount((CFArrayRef)objc_msgSend(v3, "limitLocalStoring"));
  v7.location = 0;
  v5 = CFArrayContainsValue(v4, v7, a2) != 0;

  return v5;
}

uint64_t apply_block_1_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

BOOL checkData(uint64_t a1, CFDictionaryRef theDict, const __CFData *a3, const void **a4)
{
  const __CFDictionary *Value;
  const __CFDictionary *v8;
  CFTypeID v9;
  const void *v10;
  const void *v11;
  CFTypeID v12;
  __CFData *Mutable;
  int v14;
  _BOOL8 v15;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("SecureBackupStingrayMetadata"));
  if (!Value || (v8 = Value, v9 = CFGetTypeID(Value), v9 != CFDictionaryGetTypeID()))
  {
    _PCSErrorContext(a1, a4, 126, CFSTR("Metadata missing"));
    return 0;
  }
  v10 = CFDictionaryGetValue(v8, CFSTR("BackupKeybagDigest"));
  if (!v10 || (v11 = v10, v12 = CFGetTypeID(v10), v12 != CFDataGetTypeID()))
  {
    _PCSErrorContext(a1, a4, 126, CFSTR("KeybagDigest missing"));
    return 0;
  }
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 20);
  if (!Mutable)
  {
    _PCSErrorOOM(a4);
    return 0;
  }
  ccsha1_di();
  CFDataGetLength(a3);
  CFDataGetBytePtr(a3);
  CFDataGetMutableBytePtr(Mutable);
  ccdigest();
  v14 = CFEqual(Mutable, v11);
  v15 = v14 != 0;
  if (!v14)
    _PCSErrorContext(a1, a4, 129, CFSTR("Keybag hash mismatch"));
  CFRelease(Mutable);
  return v15;
}

uint64_t apply_block_2_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void SynchronizeLocalKeyFile(void *a1, void *a2, void *a3, const void **a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  const __CFDictionary *v14;
  void *Value;
  void *v16;
  CFTypeID v17;
  BOOL v18;
  char v19;
  void *v20;
  const __CFData *v21;
  id v22;
  const void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  const __CFDictionary *v27;
  const void *v28;
  uint64_t v29;
  const void *v30;
  const void *v31;
  const void *v32;
  _QWORD context[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  id v40[2];

  v40[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  _PCSServiceItemsGetTooRolledServiceTypes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  v38 = 0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = (const __CFDictionary *)objc_msgSend(v11, "options");
  Value = (void *)CFDictionaryGetValue(v14, kPCSSetupDSID[0]);
  v16 = Value;
  if (!Value || (v17 = CFGetTypeID(Value), v17 != CFStringGetTypeID()))
  {
    _PCSErrorContext(objc_msgSend(v11, "log"), a4, 121, CFSTR("Missing parameter: dsid"));
    goto LABEL_13;
  }
  v18 = PCSCurrentPersonaMatchesDSID(v16);
  if (a4)
    v19 = v18;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = kPCSErrorDomain;
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 152, v26);
    *a4 = (const void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v21 = 0;
    v20 = 0;
LABEL_14:
    v22 = 0;
LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  if (kPCSSetupDSIDAny[0] && CFEqual(v16, kPCSSetupDSIDAny[0]))
    goto LABEL_13;
  LocalStorageCreatePath((uint64_t)v16, v12, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v21 = 0;
    goto LABEL_14;
  }
  v40[0] = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v20, 0, v40);
  v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v22 = v40[0];
  if (v21)
  {
    v23 = PCSIdentitySetCreateFromExternalForm(0, v21, 0, a4);
    goto LABEL_16;
  }
  PCSMigrationLog(objc_msgSend(v11, "log"), CFSTR("Failed reading local backup: %@: %@"), v12, v22);
  if (!a4)
  {
    v21 = 0;
    goto LABEL_15;
  }
  v32 = *a4;
  if (*a4)
  {
    *a4 = 0;
    CFRelease(v32);
  }
  v22 = v22;
  v21 = 0;
  v23 = 0;
  *a4 = v22;
LABEL_16:

  if (v23)
  {
    v27 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)v23, 0);
    if (v27)
    {
      context[0] = MEMORY[0x1E0C809B0];
      context[1] = 3221225472;
      context[2] = __SynchronizeLocalKeyFile_block_invoke;
      context[3] = &unk_1E553E608;
      v34 = v11;
      v35 = v10;
      v36 = v37;
      CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)apply_block_2_3, context);
      CFRelease(v23);
      CFRelease(v27);
      if (a4)
      {
        v28 = *a4;
        if (*a4)
        {
          *a4 = 0;
          CFRelease(v28);
        }
      }

    }
    else
    {
      CFRelease(v23);
    }
  }
  else
  {
    v29 = objc_msgSend(v11, "log");
    if (a4)
      v30 = *a4;
    else
      v30 = 0;
    PCSMigrationLog(v29, CFSTR(" open local storage failed: %@"), v30);
    if (a4)
    {
      v31 = *a4;
      if (*a4)
      {
        *a4 = 0;
        CFRelease(v31);
      }
    }
  }
  _Block_object_dispose(v37, 8);

}

void sub_1A953B1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
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

BOOL PCSEngineIgnoreService(const void *a1)
{
  return CFEqual(a1, kPCSServiceFDE) || CFEqual(a1, kPCSServiceEscrow) != 0;
}

void AddLeaf(__CFArray *a1, uint64_t a2, uint64_t a3)
{
  const void *EscrowedKeyWithIdentity;
  const void *v5;

  EscrowedKeyWithIdentity = (const void *)PCSBackupCreateEscrowedKeyWithIdentity(a2, a3, 0);
  if (EscrowedKeyWithIdentity)
  {
    v5 = EscrowedKeyWithIdentity;
    CFArrayAppendValue(a1, EscrowedKeyWithIdentity);
    CFRelease(v5);
  }
}

void applyOptions(void *a1, __CFDictionary *a2)
{
  id v3;
  const __CFDictionary *v4;
  const void *Value;
  const __CFDictionary *v6;
  const void *v7;
  const __CFDictionary *v8;
  const void *v9;
  const __CFDictionary *v10;
  const void *v11;
  const __CFDictionary *v12;
  const void *v13;
  const __CFDictionary *v14;
  void *v15;

  v3 = a1;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = CFDictionaryGetValue(v4, kPCSSetupUsername[0]);
  v6 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v7 = CFDictionaryGetValue(v6, kPCSSetupPassword[0]);
  v8 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v9 = CFDictionaryGetValue(v8, kPCSSetupAuthToken[0]);
  v10 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v11 = CFDictionaryGetValue(v10, kPCSSetupEscrowURL[0]);
  v12 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v13 = CFDictionaryGetValue(v12, kPCSSetupiCloudEnvironment[0]);
  v14 = (const __CFDictionary *)objc_msgSend(v3, "options");

  v15 = (void *)CFDictionaryGetValue(v14, kPCSSetupDSID[0]);
  if (Value)
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationAppleID[0], Value);
  if (v7)
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationPassword[0], v7);
  if (v9)
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationAuthToken[0], v9);
  if (v11)
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationEscrowProxyURL[0], v11);
  if (v15)
  {
    if (!PCSCurrentPersonaMatchesDSID(v15))
      return;
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationDSID[0], v15);
  }
  if (v13)
    CFDictionarySetValue(a2, kPCSSecureBackupCFAuthenticationiCloudEnvironment[0], v13);
}

void sub_1A953C020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL StoreLocalKeyfile(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, const void **a7)
{
  id v13;
  id v14;
  const __CFArray *v15;
  void *ExternalForm;
  void *v17;
  void *v18;
  _BOOL8 v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  ExternalForm = (void *)PCSIdentitySetCreateExternalForm(0, objc_msgSend(a1, "set"), 0, v15, a7);

  if (ExternalForm)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

    LocalStorageCreatePath(a2, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 != 0;
    if (v18)
      objc_msgSend(ExternalForm, "writeToFile:options:error:", v18, a6, 0);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t _PCSEngineStoreiCDPStatus(void *a1, char a2, const void **a3)
{
  id v5;
  CFTypeRef v6;
  const void *v7;
  int v8;
  int v9;
  CFTypeRef v10;
  uint64_t v11;
  CFTypeRef v12;
  uint64_t v13;
  CFErrorDomain Domain;
  CFIndex Code;
  uint64_t v16;
  CFTypeRef v17;
  int v18;
  unsigned int IsICDP;
  unsigned int v20;
  unsigned int v21;
  unsigned int IsPlesio;
  CFTypeRef v23;
  uint64_t v25;
  CFTypeRef v26;
  uint64_t v27;
  CFTypeRef cf;
  CFTypeRef v29;

  v5 = a1;
  cf = 0;
  v29 = 0;
  v6 = PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v5, "options"), 0, a3);
  if (!v6)
  {
    v13 = 0;
    goto LABEL_28;
  }
  v7 = v6;
  v8 = objc_msgSend(v5, "iCDPArmed");
  if (v8 != PCSIdentitySetIsICDP((uint64_t)v7, 0))
  {
    PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Updating iCDP"));
    if (!PCSIdentitySetEnableICDP((uint64_t)v7, objc_msgSend(v5, "iCDPArmed"), a3))
      goto LABEL_10;
  }
  v9 = PCSIdentitySetIsWalrusWithForceFetch((uint64_t)v7, 1, &cf);
  v10 = cf;
  if (cf)
  {
    if ((a2 & 1) != 0
      || ((Domain = CFErrorGetDomain((CFErrorRef)cf),
           Code = CFErrorGetCode((CFErrorRef)cf),
           !CFEqual(Domain, kPCSErrorDomain))
       || Code != 90)
      && (!CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E0CD5CA0]) || Code != 29))
    {
      if (a3)
        *a3 = CFRetain(cf);
      v11 = objc_msgSend(v5, "log");
      PCSMigrationLog(v11, CFSTR("Failed getting Walrus state: %@"), cf);
      v12 = cf;
      if (cf)
      {
        cf = 0;
        CFRelease(v12);
      }
      goto LABEL_10;
    }
    v16 = objc_msgSend(v5, "log");
    PCSMigrationLog(v16, CFSTR("Will not update W: %@"), cf);
    v17 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v17);
    }
  }
  else if (v9 != objc_msgSend(v5, "iCDPHSMWalrus"))
  {
    PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Updating Walrus"));
    if (!PCSIdentitySetSetWalrus((uint64_t)v7, objc_msgSend(v5, "iCDPHSMWalrus"), a3))
      goto LABEL_10;
  }
  v18 = objc_msgSend(v5, "iCDPPlesio");
  if (v18 == PCSIdentitySetIsPlesio((uint64_t)v7, 0)
    || (PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Updating Plesio")),
        PCSIdentitySetSetPlesio((uint64_t)v7, objc_msgSend(v5, "iCDPPlesio"), a3)))
  {
    IsICDP = PCSIdentitySetIsICDP((uint64_t)v7, &v29);
    if (!v29)
    {
      v20 = IsICDP;
      if (v10)
      {
        v21 = 0;
      }
      else
      {
        v21 = PCSIdentitySetIsWalrusWithForceFetch((uint64_t)v7, 0, &cf);
        if (cf)
        {
          v25 = objc_msgSend(v5, "log");
          PCSMigrationLog(v25, CFSTR("Failed getting Walrus state after set: %@"), cf);
          v26 = cf;
          if (cf)
          {
            cf = 0;
            CFRelease(v26);
          }
        }
      }
      IsPlesio = PCSIdentitySetIsPlesio((uint64_t)v7, a3);
      PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Just stored status: %d (iCDPArmed), checked afterward, it was: %d"), objc_msgSend(v5, "iCDPArmed"), v20);
      PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Just stored status: %d (Walrus), checked afterward, it was: %d"), objc_msgSend(v5, "iCDPHSMWalrus"), v21);
      PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Just stored status: %d (Plesio), checked afterward, it was: %d"), objc_msgSend(v5, "iCDPPlesio"), IsPlesio);
      v13 = 1;
      goto LABEL_26;
    }
    v27 = objc_msgSend(v5, "log");
    PCSMigrationLog(v27, CFSTR("Failed getting iCDPState: %@"), v29);
  }
LABEL_10:
  v13 = 0;
LABEL_26:
  CFRelease(v7);
  v23 = v29;
  if (v29)
  {
    v29 = 0;
    CFRelease(v23);
  }
LABEL_28:

  return v13;
}

void sub_1A953CCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEnginePreCheckHSMWrite(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  const void *v9;
  const __CFDictionary *v10;
  const void *v11;
  const void *v12;
  CFTypeID v13;
  CFTypeID v14;
  uint64_t v15;

  v3 = a1;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSSetupStingray[0]);
  if (Value)
  {
    v6 = Value;
    v7 = CFGetTypeID(Value);
    if (v7 == CFBooleanGetTypeID() && !CFBooleanGetValue(v6))
      goto LABEL_8;
  }
  v8 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v9 = CFDictionaryGetValue(v8, kPCSSetupUsername[0]);
  v10 = (const __CFDictionary *)objc_msgSend(v3, "options");
  v11 = CFDictionaryGetValue(v10, kPCSSetupPassword[0]);
  if (!v9 || (v12 = v11, v13 = CFGetTypeID(v9), v13 != CFStringGetTypeID()))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 122, CFSTR("Missing parameter: username"));
LABEL_12:
    v15 = 0;
    goto LABEL_9;
  }
  if (!v12 || (v14 = CFGetTypeID(v12), v14 != CFStringGetTypeID()))
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 123, CFSTR("Missing parameter: password"));
    goto LABEL_12;
  }
LABEL_8:
  v15 = 1;
LABEL_9:

  return v15;
}

uint64_t PCSEngineEvaluateOctagon(void *a1, _QWORD *a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  const __CFDictionary *v12;
  void *v13;
  const __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  id v38;
  id v39;
  int v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  _QWORD *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v3 = a1;
  if (!CaptureMetadata(v3, (const __CFDictionary *)objc_msgSend(v3, "metadata")))
    goto LABEL_42;
  v4 = GetiCDPMetadata((const __CFDictionary *)objc_msgSend(v3, "metadata"));
  if (!v4)
    goto LABEL_42;
  Value = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSMetadataiCDPWalrus[0]);
  v8 = Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFBooleanGetTypeID()) && CFBooleanGetValue(v6) != 0;
  v9 = v3;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v10 = (void *)getAKAccountManagerClass_softClass;
  v54 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __getAKAccountManagerClass_block_invoke;
    v50[3] = &unk_1E553DCC0;
    v50[4] = &v51;
    __getAKAccountManagerClass_block_invoke((uint64_t)v50);
    v10 = (void *)v52[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v51, 8);
  v12 = (const __CFDictionary *)objc_msgSend(v9, "options");
  CFDictionaryGetValue(v12, kPCSSetupDSID[0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (const __CFDictionary *)objc_msgSend(v9, "options");
  CFDictionaryGetValue(v14, kPCSSetupAltDSID[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (+[PCSAccountsModel altDSIDForDSID:](PCSAccountsModel, "altDSIDForDSID:", v13),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v11, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "authKitAccountWithAltDSID:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "securityLevelForAccount:", v17) != 4)
    {

LABEL_37:
      PCSMigrationLog(objc_msgSend(v9, "log"), CFSTR("Evaluated and equalized account state"));
      goto LABEL_42;
    }
    v43 = v8;
    v44 = a2;
    v45 = v13;
    v18 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
    objc_msgSend(v18, "setAltDSID:", v15);
    objc_msgSend(v18, "setContext:", *MEMORY[0x1E0CD5C90]);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v18);
    v20 = objc_alloc_init(MEMORY[0x1E0CD5C80]);
    v21 = 1;
    objc_msgSend(v20, "setUseCachedAccountStatus:", 1);
    v49 = 0;
    v47 = v19;
    v22 = objc_msgSend(v19, "fetchCliqueStatus:error:", v20, &v49);
    v46 = v49;
    if (v22)
      goto LABEL_36;
    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CD5C68], "fetchAccountWideSettings:error:", v18, &v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v48;
    v41 = v24;
    v42 = v23;
    if (v23)
    {
      v39 = v9;
      v38 = v47;
      v25 = v23;
      if (objc_msgSend(v25, "hasWalrus"))
      {
        objc_msgSend(v25, "walrus");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v26, "enabled");

        if (!v43)
        {
          if (v37)
          {
            objc_msgSend(v39, "setICDPHSMWalrus:", 1);
            objc_msgSend(v39, "setModified:", 1);
          }
          goto LABEL_34;
        }
        if ((v37 & 1) == 0)
        {
          v28 = v38;
          v27 = v39;
LABEL_31:
          PCSEngineFixOctagonW(v27, v28, 1);
        }
LABEL_34:
        v33 = v42;

        v21 = 1;
LABEL_35:

LABEL_36:
        if ((v21 & 1) != 0)
          goto LABEL_37;
        goto LABEL_38;
      }
      if (!v43 || (objc_msgSend(v25, "hasWalrus") & 1) != 0)
        goto LABEL_34;
    }
    else
    {
      v29 = v24;
      if (objc_msgSend(v24, "code") == 53)
      {
        objc_msgSend(v29, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD5CA0]);

        if ((v43 | v40 ^ 1) != 1)
        {
          v21 = 0;
          v33 = v18;
          v18 = v20;
          v20 = v47;
          v47 = v29;
          a2 = v44;
          goto LABEL_35;
        }
      }
      a2 = v44;
      if (v44 && v46)
        *v44 = v46;
      v31 = v9;
      v32 = v47;
      if (!v43)
        goto LABEL_34;
    }
    v27 = v9;
    v28 = v47;
    goto LABEL_31;
  }

LABEL_38:
  v34 = objc_msgSend(v9, "log");
  if (a2)
    v35 = *a2;
  else
    v35 = 0;
  PCSMigrationLog(v34, CFSTR("Unable to evaluate and equalize account state: %@"), v35);
LABEL_42:

  return 1;
}

void sub_1A953D514(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEngineFailOnDroppedKeys(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if ((_PCSIsiCDPIsWalrus((const __CFDictionary *)objc_msgSend(v3, "metadata")) & 1) != 0
    || _PCSIsiCDPIsPlesio((const __CFDictionary *)objc_msgSend(v3, "metadata")))
  {
    _PCSError(a2, 159, CFSTR("Keys dropped from HSM"));
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

uint64_t PCSEngineStepEnableiCDP(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setModified:", 1);
  objc_msgSend(v1, "setICDP:", objc_msgSend(v1, "iCDPHSM"));
  objc_msgSend(v1, "setICDPArmed:", 1);
  objc_msgSend(v1, "setICDPHSMWalrus:", 0);
  objc_msgSend(v1, "setICDPHSMPlesio:", 0);

  return 1;
}

uint64_t PCSEngineNotifyKeyChanges(void *a1)
{
  id v1;

  v1 = a1;
  if ((objc_msgSend(v1, "modified") & 1) != 0 || objc_msgSend(v1, "newIdentity"))
  {
    notify_post("com.apple.ProtectedCloudStorage.updatedKeys");
    _PCSPostHaveCredentials();
  }

  return 1;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAccountManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getAKAccountManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAccountManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PCSEngineFixOctagonW(void *a1, void *a2, uint64_t a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;

  v5 = a1;
  v6 = (objc_class *)MEMORY[0x1E0D65080];
  v7 = a2;
  v8 = objc_alloc_init(v6);
  v9 = objc_alloc_init(MEMORY[0x1E0D65088]);
  objc_msgSend(v9, "setEnabled:", a3);
  objc_msgSend(v8, "setWalrus:", v9);
  v14 = 0;
  v10 = objc_msgSend(v7, "setAccountSetting:error:", v8, &v14);

  v11 = v14;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (!v13)
    PCSMigrationLog(objc_msgSend(v5, "log"), CFSTR("Failed to set account setting :%@"), v11);

}

uint64_t PCSEngineStepEnableiCDPIfArmed(void *a1, const void **a2)
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(v3, "newIdentity");
  if (v4)
  {
    _PCSError(a2, 62, CFSTR("can't close door with new identity"));
  }
  else
  {
    objc_msgSend(v3, "setModified:", 1);
    if (objc_msgSend(v3, "iCDPHSMArmed"))
    {
      objc_msgSend(v3, "setICDPArmed:", objc_msgSend(v3, "iCDPHSMArmed"));
      v5 = objc_msgSend(v3, "iCDPHSMArmed");
    }
    else
    {
      objc_msgSend(v3, "setICDPArmed:", objc_msgSend(v3, "iCDPHSM"));
      v5 = objc_msgSend(v3, "iCDPHSM");
    }
    objc_msgSend(v3, "setICDP:", v5);
    objc_msgSend(v3, "setICDPHSMWalrus:", 0);
    objc_msgSend(v3, "setICDPHSMPlesio:", 0);
  }

  return v4 ^ 1u;
}

uint64_t PCSEngineStepDropStingray(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setModified:", 1);
  objc_msgSend(v1, "setDropHSM:", 1);
  objc_msgSend(v1, "setICDP:", 1);
  objc_msgSend(v1, "setICDPArmed:", 1);
  objc_msgSend(v1, "setICDPPlesio:", 1);
  objc_msgSend(v1, "setICDPHSMPlesio:", 1);

  return 1;
}

uint64_t PCSEngineFailOnNotDroppedKeys(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) != 0 || (objc_msgSend(v3, "iCDPHSMPlesio") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    _PCSError(a2, 160, CFSTR("Keys was NOT dropped from HSM"));
    v4 = 0;
  }

  return v4;
}

BOOL PCSEngineIgnoreKeysInHSM(void *a1, const void **a2)
{
  id v3;
  CFTypeRef Keychain;
  _BOOL8 v5;

  v3 = a1;
  objc_msgSend(v3, "clearSet");
  objc_msgSend(v3, "setSet:", PCSIdentitySetCreateMutable(a2));
  if (objc_msgSend(v3, "set"))
  {
    Keychain = PCSIdentitySetCreateKeychain((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2);
    v5 = Keychain != 0;
    if (Keychain)
    {
      CFRelease(Keychain);
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t PCSEngineStepUndropStingray(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setModified:", 1);
  objc_msgSend(v1, "setRestoreHSM:", 1);
  objc_msgSend(v1, "setICDP:", 1);
  objc_msgSend(v1, "setICDPArmed:", 1);
  objc_msgSend(v1, "setICDPHSMPlesio:", 0);

  return 1;
}

uint64_t PCSEngineUnsetCurrentItems(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  void (*v11)(const __CFString *, id, const __CFString *, _QWORD *);
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  const void **v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v3 = a1;
  if (_os_feature_enabled_impl())
  {
    v4 = (uint64_t)PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v3, "options"), 0, a2);
    if (v4)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      _PCSServiceItemsGetNoRollStingrayServiceTypes();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __PCSEngineUnsetCurrentItems_block_invoke;
      v18[3] = &unk_1E553E848;
      v8 = v5;
      v19 = v8;
      v20 = v3;
      v22 = &v28;
      v23 = v4;
      v9 = v6;
      v21 = v9;
      PCSServiceItemsGetEachName(v18);
      if (*((_BYTE *)v29 + 24))
      {
        _PCSError(a2, 4, CFSTR("Failed to make one or more current identities non-current"));
      }
      else if (_PCSRunningInUnitTests())
      {
        *((_BYTE *)v25 + 24) = 1;
      }
      else
      {
        v10 = dispatch_semaphore_create(0);
        v11 = (void (*)(const __CFString *, id, const __CFString *, _QWORD *))off_1ECED4018;
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __PCSEngineUnsetCurrentItems_block_invoke_2;
        v14[3] = &unk_1E553E870;
        v16 = &v24;
        v17 = a2;
        v12 = v10;
        v15 = v12;
        v11(CFSTR("com.apple.ProtectedCloudStorage"), v9, CFSTR("ProtectedCloudStorage"), v14);
        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

      }
      CFRelease((CFTypeRef)v4);
      v4 = *((_BYTE *)v25 + 24) != 0;

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void sub_1A953DCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEngineStepEnableWalrus(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setModified:", 1);
  objc_msgSend(v1, "setDropHSM:", 1);
  objc_msgSend(v1, "setICDP:", 1);
  objc_msgSend(v1, "setICDPArmed:", 1);
  objc_msgSend(v1, "setICDPHSMWalrus:", 1);

  return 1;
}

uint64_t PCSEngineStoreiCDPStatusRequireW(void *a1, const void **a2)
{
  return _PCSEngineStoreiCDPStatus(a1, 1, a2);
}

uint64_t PCSEngineAddMissingCurrentPointersWithFFCheck(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  if ((_os_feature_enabled_impl() & 1) != 0)
    v4 = 1;
  else
    v4 = PCSEngineAddMissingCurrentPointers(v3, a2);

  return v4;
}

uint64_t PCSEngineStepInitiateKeyRolling(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFDictionary *v6;
  void *Value;
  void *v8;
  CFTypeID v9;
  BOOL v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, const __CFNumber *);
  void *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  _QWORD v49[3];
  _QWORD v50[3];
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!_os_feature_enabled_impl())
  {
    +[PCSAnalytics logger](PCSAnalytics, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logSuccessForEvent:", CFSTR("PCSEventInitiateKeyRolling"));
    objc_msgSend(v3, "setModified:", 1);
    v6 = (const __CFDictionary *)objc_msgSend(v3, "options");
    Value = (void *)CFDictionaryGetValue(v6, kPCSSetupDSID[0]);
    if (Value && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID()))
    {
      v10 = PCSCurrentPersonaMatchesDSID(v8);
      if (!a2 || v10)
      {
        _PCSServiceItemsGetNoRollStingrayServiceTypes();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v46 = &v45;
        v47 = 0x2020000000;
        v48 = 0;
        v41 = 0;
        v42 = &v41;
        v43 = 0x2020000000;
        v44 = 0;
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 0;
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = __PCSEngineStepInitiateKeyRolling_block_invoke;
        v30 = &unk_1E553E898;
        v16 = v15;
        v31 = v16;
        v17 = v3;
        v35 = &v41;
        v36 = v8;
        v32 = v17;
        v33 = &v45;
        v34 = &v37;
        PCSServiceItemsGetEachName(&v27);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%u"), CFSTR("PCSEventMarkForKeyRolling"), *((unsigned int *)v46 + 6));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (*((_DWORD *)v42 + 6) || *((_DWORD *)v38 + 6))
        {
          v19 = objc_msgSend(v17, "log");
          PCSMigrationLog(v19, CFSTR("While marking identities for rolling: %u marked, %u failed to find, %u failed to mark"), *((unsigned int *)v46 + 6), *((unsigned int *)v42 + 6), *((unsigned int *)v38 + 6), v27, v28, v29, v30, v31);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kPCSErrorDomain, 158, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = CFSTR("markedToRoll");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v46 + 6));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = v21;
          v49[1] = CFSTR("failedToMark");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v42 + 6));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v50[1] = v22;
          v49[2] = CFSTR("notFoundToMark");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v38 + 6));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v50[2] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "logRecoverableError:forEvent:withAttributes:", v20, v18, v24);

        }
        else
        {
          objc_msgSend(v5, "logSuccessForEvent:", v18);
        }
        v25 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v26, kPCSSettingStingrayRoll);

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v45, 8);

        v4 = 1;
        goto LABEL_10;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = kPCSErrorDomain;
      v51 = *MEMORY[0x1E0CB2D50];
      v52[0] = CFSTR("Current persona does not match chosen dsid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 152, v13);
      *a2 = (const void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _PCSErrorContext(objc_msgSend(v3, "log"), a2, 121, CFSTR("Missing parameter: dsid"));
    }
    v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Feature enabled, skipping"));
  v4 = 1;
LABEL_11:

  return v4;
}

void sub_1A953E218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSEngineStepDisableWalrus(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setModified:", 1);
  objc_msgSend(v1, "setRestoreHSM:", 1);
  objc_msgSend(v1, "setICDP:", 1);
  objc_msgSend(v1, "setICDPArmed:", 1);
  objc_msgSend(v1, "setICDPHSMWalrus:", 0);

  return 1;
}

uint64_t PCSEngineValidateiCDP(void *a1, const void **a2)
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1;
  if (objc_msgSend(v3, "metadata"))
  {
    if (_PCSIsiCDPEnabled((const __CFDictionary *)objc_msgSend(v3, "metadata"), 1))
    {
      objc_msgSend(v3, "setICDP:", 1);
      objc_msgSend(v3, "setICDPArmed:", 1);
      objc_msgSend(v3, "setICDPPlesio:", _PCSIsiCDPIsPlesio((const __CFDictionary *)objc_msgSend(v3, "metadata")));
      if (!_PCSEngineStoreiCDPStatus(v3, 0, a2))
      {
        v6 = 0;
        goto LABEL_14;
      }
    }
    if ((objc_msgSend(v3, "triggerUpdate") & 1) == 0)
    {
      PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Checking for ValidateiCDP migration"));
      if (_PCSIsiCDPIsWalrus((const __CFDictionary *)objc_msgSend(v3, "metadata")))
      {
        PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Using Walrus account"));
      }
      else
      {
        if (!_PCSIsiCDPIsPlesio((const __CFDictionary *)objc_msgSend(v3, "metadata")))
        {
          v4 = _PCSIsiCDPEnabled((const __CFDictionary *)objc_msgSend(v3, "metadata"), 0);
          v5 = objc_msgSend(v3, "log");
          if (v4)
            PCSMigrationLog(v5, CFSTR("Using iCDP account"));
          else
            PCSMigrationLog(v5, CFSTR("Using SA account"));
          goto LABEL_13;
        }
        PCSMigrationLog(objc_msgSend(v3, "log"), CFSTR("Using Plesio account"));
      }
      PCSEngineDifferentOnDroppedKeys(v3);
    }
  }
LABEL_13:
  v6 = 1;
LABEL_14:

  return v6;
}

BOOL PCSEngineExitOnDroppedKeys(void *a1, const void **a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a1;
  if ((objc_msgSend(v3, "iCDPHSMWalrus") & 1) != 0 || objc_msgSend(v3, "iCDPHSMPlesio"))
  {
    v4 = v3;
    v5 = 1;
    objc_msgSend(v4, "setDone:", 1);
    if (!objc_msgSend(v4, "set"))
    {
      objc_msgSend(v4, "setSet:", PCSIdentitySetCreate((const __CFDictionary *)objc_msgSend(v4, "options"), 0, a2));
      v5 = objc_msgSend(v4, "set") != 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t PCSEngineDifferentOniCDP(void *a1)
{
  id v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  CFTypeRef v5;
  uint64_t v7;
  CFTypeRef cf;

  v1 = a1;
  cf = 0;
  if (objc_msgSend(v1, "iCDPHSM") && (objc_msgSend(v1, "triggerUpdate") & 1) == 0)
  {
    if (PCSEngineHaveSyncEnoughToCreateIdentities(v1, &cf))
    {
      objc_msgSend(v1, "setCurrentStep:", &validationInNoTouchHSMContent);
    }
    else
    {
      v7 = objc_msgSend(v1, "log");
      PCSMigrationLog(v7, CFSTR("DifferentOniCDP: not enough in sync: %@"), cf);
      objc_msgSend(v1, "setDone:", 1);
    }
  }
  else
  {
    v2 = objc_msgSend(v1, "log");
    v3 = _PCSYESNO(objc_msgSend(v1, "iCDPHSM"));
    v4 = _PCSYESNO(objc_msgSend(v1, "triggerUpdate"));
    PCSMigrationLog(v2, CFSTR("DifferentOniCDP: %@ triggerUpdate: %@"), v3, v4);
  }
  v5 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v5);
  }

  return 1;
}

BOOL PCSEngineCreateEmptyKeyset(void *a1, const void **a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  objc_msgSend(v3, "clearSet");
  objc_msgSend(v3, "setSet:", PCSIdentitySetCreateMutable(a2));
  v4 = objc_msgSend(v3, "set");

  return v4 != 0;
}

uint64_t PCSEnginePreCheckHSMRead(void *a1, const void **a2)
{
  id v3;
  const __CFDictionary *v4;
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  const void *v9;
  CFTypeID v10;
  uint64_t v11;

  v3 = a1;
  v4 = (const __CFDictionary *)objc_msgSend(v3, "options");
  Value = (const __CFBoolean *)CFDictionaryGetValue(v4, kPCSSetupStingray[0]);
  if (Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFBooleanGetTypeID()) && !CFBooleanGetValue(v6)
    || (v8 = (const __CFDictionary *)objc_msgSend(v3, "options"),
        (v9 = CFDictionaryGetValue(v8, kPCSSetupUsername[0])) != 0)
    && (v10 = CFGetTypeID(v9), v10 == CFStringGetTypeID()))
  {
    v11 = 1;
  }
  else
  {
    _PCSErrorContext(objc_msgSend(v3, "log"), a2, 122, CFSTR("Missing parameter: username"));
    v11 = 0;
  }

  return v11;
}

BOOL PCSEngineForceRecover(void *a1, uint64_t *a2)
{
  id v3;
  uint64_t v4;

  v3 = a1;
  objc_msgSend(v3, "setClassicContent:", __PCSCopyHSMData(objc_msgSend(v3, "log"), (const __CFDictionary *)objc_msgSend(v3, "options"), a2));
  v4 = objc_msgSend(v3, "classicContent");

  return v4 != 0;
}

void PCSCacheCurrentIdentitiesForServices(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  __CFString *v11;
  __CFString *AccessGroupByName;
  const __CFString *CKKSViewByName;
  BOOL v14;
  void *v15;
  const void *v16;
  const void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[PCSCKKSOutOfBandFetchCache cache](PCSCKKSOutOfBandFetchCache, "cache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __PCSCacheCurrentIdentitiesForServices_block_invoke;
    v24[3] = &unk_1E553E9D0;
    v24[4] = &v31;
    v24[5] = &v25;
    objc_msgSend(v4, "getCurrentIdentities:result:", a1, v24);

    if (objc_msgSend((id)v26[5], "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = (id)v26[5];
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v21;
        v9 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v6);
            v11 = *(__CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
            AccessGroupByName = PCSServiceItemGetAccessGroupByName(v11);
            CKKSViewByName = PCSServiceItemGetCKKSViewByName(v11);
            if (AccessGroupByName)
              v14 = CKKSViewByName == 0;
            else
              v14 = 1;
            if (v14)
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                PCSCacheCurrentIdentitiesForServices_cold_1((uint8_t *)v35, (uint64_t)v11, (const void **)((char *)v35 + 4));
            }
            else
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C18]), "initWithIdentifier:accessGroup:zoneID:", v11, AccessGroupByName, CKKSViewByName);
              objc_msgSend(v5, "addObject:", v15);

            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
        }
        while (v7);
      }

      if (!v32[3])
        v32[3] = (uint64_t)PCSIdentitySetCreateMutable(0);
      v19 = v18;
      SecItemFetchCurrentItemOutOfBand();

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v18 + 2))(v18, v32[3], 0);
      v17 = (const void *)v32[3];
      if (v17)
      {
        v32[3] = 0;
        CFRelease(v17);
      }
    }
  }
  else
  {
    v35[0] = 0;
    _PCSError(v35, 164, CFSTR("feature disabled"));
    (*((void (**)(id, _QWORD, const void *))v18 + 2))(v18, 0, v35[0]);
    v16 = v35[0];
    if (v35[0])
    {
      v35[0] = 0;
      CFRelease(v16);
    }
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void sub_1A953FC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void PCSCacheCurrentIdentitiesForDefaultServices(void *a1)
{
  PCSCacheCurrentIdentitiesForDefaultServicesForceFetch(0, a1);
}

void PCSCacheCurrentIdentitiesForDefaultServicesForceFetch(uint64_t a1, void *a2)
{
  id v3;
  __CFSet *Mutable;

  v3 = a2;
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  CFSetAddValue(Mutable, CFSTR("com.apple.homekit"));
  CFSetAddValue(Mutable, CFSTR("com.apple.siri.data"));
  PCSCacheCurrentIdentitiesForServices((uint64_t)Mutable, a1, v3);

  if (Mutable)
    CFRelease(Mutable);
}

void _PCSCKKSOutOfBandFetchIdentities(void *a1, void *a2, uint64_t a3, void *a4)
{
  const __CFNumber *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __CFString *AccessGroupByName;
  const __CFString *CKKSViewByName;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void (**v21)(id, uint64_t, _QWORD);
  id v22;
  id v23;
  unsigned int IndexByName;
  void (**v25)(id, uint64_t, _QWORD);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t v41[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v6 = a2;
  v21 = a4;
  IndexByName = PCSServiceItemGetIndexByName(v6);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  +[PCSCKKSOutOfBandFetchCache cache](PCSCKKSOutOfBandFetchCache, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = ___PCSCKKSOutOfBandFetchIdentities_block_invoke;
  v30[3] = &unk_1E553E9D0;
  v30[4] = &v37;
  v30[5] = &v31;
  objc_msgSend(v7, "getPCSIdentities:forServiceID:result:", v22, IndexByName, v30);

  v8 = v38[3];
  if (v8)
  {
    v21[2](v21, v8, 0);
    v9 = (const void *)v38[3];
    if (v9)
    {
      v38[3] = 0;
      CFRelease(v9);
    }
  }
  else if (objc_msgSend((id)v32[5], "count"))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = (id)v32[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          AccessGroupByName = PCSServiceItemGetAccessGroupByName((__CFString *)v6);
          CKKSViewByName = PCSServiceItemGetCKKSViewByName(v6);
          if (AccessGroupByName && (v17 = CKKSViewByName) != 0)
          {
            v18 = objc_alloc(MEMORY[0x1E0CD5C20]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IndexByName);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v18, "initWithServiceNumber:accessGroup:publicKey:zoneID:", v19, AccessGroupByName, v14, v17);

            objc_msgSend(v23, "addObject:", v20);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            PCSCacheCurrentIdentitiesForServices_cold_1(v41, (uint64_t)v6, &v42);
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
      }
      while (v11);
    }

    v25 = v21;
    SecItemFetchPCSIdentityOutOfBand();

  }
  else
  {
    v21[2](v21, 0, 0);
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void sub_1A9540368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void PCSServiceItemDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  if (a1)
  {
    v2 = (const void *)a1[2];
    if (v2)
    {
      a1[2] = 0;
      CFRelease(v2);
    }
    v3 = (const void *)a1[5];
    if (v3)
    {
      a1[5] = 0;
      CFRelease(v3);
    }
    v4 = (const void *)a1[6];
    if (v4)
    {
      a1[6] = 0;
      CFRelease(v4);
    }
    v5 = (const void *)a1[4];
    if (v5)
    {
      a1[4] = 0;
      CFRelease(v5);
    }
    v6 = (const void *)a1[7];
    if (v6)
    {
      a1[7] = 0;
      CFRelease(v6);
    }
    v7 = (const void *)a1[8];
    if (v7)
    {
      a1[8] = 0;
      CFRelease(v7);
    }
    v8 = (const void *)a1[11];
    if (v8)
    {
      a1[11] = 0;
      CFRelease(v8);
    }
  }
}

uint64_t PCSServiceItemCompare(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const void *v5;
  const void *v6;
  BOOL v7;
  const void *v8;
  const void *v9;

  result = 0;
  if (a1 && a2)
  {
    v5 = *(const void **)(a1 + 16);
    v6 = *(const void **)(a2 + 16);
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (v5 != v6)
        return 0;
    }
    else
    {
      result = CFEqual(v5, v6);
      if (!(_DWORD)result)
        return result;
    }
    v8 = *(const void **)(a1 + 40);
    v9 = *(const void **)(a2 + 40);
    if (v8 && v9)
      return CFEqual(v8, v9) != 0;
    else
      return v8 == v9;
  }
  return result;
}

CFHashCode PCSServiceItemHash(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 16));
}

CFStringRef PCSServiceItemCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  CFStringRef v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFStringRef v15;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("SI@%p"), a1);
  v4 = CFSTR("NA");
  v5 = *(const __CFString **)(a1 + 40);
  if (!v5)
    v5 = CFSTR("NA");
  v6 = *(const __CFString **)(a1 + 48);
  v7 = *(const __CFString **)(a1 + 56);
  if (!v6)
    v6 = CFSTR("NA");
  if (!v7)
    v7 = CFSTR("NA");
  if (*(_QWORD *)(a1 + 64))
    v4 = *(const __CFString **)(a1 + 64);
  v8 = 89;
  if (!*(_BYTE *)(a1 + 79))
    v8 = 121;
  if (*(_BYTE *)(a1 + 78))
    v9 = 75;
  else
    v9 = 107;
  v10 = 69;
  if (!*(_BYTE *)(a1 + 77))
    v10 = 101;
  v11 = 65;
  if (!*(_BYTE *)(a1 + 76))
    v11 = 97;
  v12 = 77;
  if (!*(_BYTE *)(a1 + 74))
    v12 = 109;
  v13 = 82;
  if (!*(_BYTE *)(a1 + 73))
    v13 = 114;
  v14 = 55;
  if (!*(_BYTE *)(a1 + 72))
    v14 = 45;
  v15 = CFStringCreateWithFormat(v2, 0, CFSTR("<%@: [name/oldName: %@/%@] [viewHint: %@] [class: %@] [keyDescription: %@] [number: %@] [%c%c%c%c%c%c%c] %08d %08x [accessGroup: %@]"), v3, *(_QWORD *)(a1 + 16), v5, v6, v7, v4, *(_QWORD *)(a1 + 32), v14, v13, v12, v11, v10, v9, v8, *(unsigned int *)(a1 + 28), *(unsigned int *)(a1 + 80),
          *(_QWORD *)(a1 + 88));
  if (v3)
    CFRelease(v3);
  return v15;
}

CFIndex PCSServiceItemsCount()
{
  if (PCSServiceItemsInit_once != -1)
    dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
  return CFDictionaryGetCount((CFDictionaryRef)PCSServiceItemsInit_localServiceItems);
}

void PCSServiceItemsInfoIteration(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemsInfoIteration_block_invoke;
  v3[3] = &unk_1E553EA48;
  v4 = v1;
  v2 = v1;
  PCSServiceItemsIterate(v3);

}

void PCSServiceItemsIterate(void *a1)
{
  id v1;
  const __CFDictionary *v2;
  id v3;
  _QWORD context[4];
  id v5;

  v1 = a1;
  if (PCSServiceItemsInit_once != -1)
    dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
  v2 = (const __CFDictionary *)PCSServiceItemsInit_localServiceItems;
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __PCSServiceItemsIterate_block_invoke;
  context[3] = &unk_1E553E140;
  v5 = v1;
  v3 = v1;
  CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)apply_block_2_4, context);

}

void PCSServiceItemsGetEachName(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemsGetEachName_block_invoke;
  v3[3] = &unk_1E553EA48;
  v4 = v1;
  v2 = v1;
  PCSServiceItemsIterate(v3);

}

uint64_t PCSServiceItemsGetCFArrayOfNames()
{
  if (PCSServiceItemsGetCFArrayOfNames_once != -1)
    dispatch_once(&PCSServiceItemsGetCFArrayOfNames_once, &__block_literal_global_13);
  return PCSServiceItemsGetCFArrayOfNames_array;
}

uint64_t PCSServiceItemsGetCFArraySortedByIndex()
{
  if (PCSServiceItemsGetCFArraySortedByIndex_once != -1)
    dispatch_once(&PCSServiceItemsGetCFArraySortedByIndex_once, &__block_literal_global_41);
  return PCSServiceItemsGetCFArraySortedByIndex_array;
}

uint64_t compareServiceItemIndex(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  _BOOL8 v5;

  v2 = *(_DWORD *)(a1 + 24);
  v3 = *(_DWORD *)(a2 + 24);
  v4 = v2 < v3;
  v5 = v2 != v3;
  if (v4)
    return -1;
  else
    return v5;
}

void PCSServiceItemsGetInfoSortedByIndex(void *a1)
{
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex i;
  _QWORD *ValueAtIndex;
  id v6;

  v6 = a1;
  if (PCSServiceItemsGetCFArraySortedByIndex_once != -1)
    dispatch_once(&PCSServiceItemsGetCFArraySortedByIndex_once, &__block_literal_global_41);
  v1 = (const __CFArray *)PCSServiceItemsGetCFArraySortedByIndex_array;
  Count = CFArrayGetCount((CFArrayRef)PCSServiceItemsGetCFArraySortedByIndex_array);
  if (Count >= 1)
  {
    v3 = Count;
    for (i = 0; i != v3; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v1, i);
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, *((unsigned int *)ValueAtIndex + 6), ValueAtIndex[2], *((unsigned __int8 *)ValueAtIndex + 74), *((unsigned __int8 *)ValueAtIndex + 73), *((unsigned int *)ValueAtIndex + 7), ValueAtIndex[7], ValueAtIndex[6]);
    }
  }

}

BOOL PCSServiceItemTypeIsShareableManatee(void *key)
{
  uint64_t v2;
  _BOOL8 result;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  const void *Value;

  if (!key)
  {
    v2 = 0;
    goto LABEL_10;
  }
  if (PCSServiceItemsInit_once != -1)
    dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  Value = 0;
  Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, key);
  v2 = v6[3];
  if (v2)
  {
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __PCSServiceItemGetByName_block_invoke;
    v4[3] = &unk_1E553EB78;
    v4[4] = &v5;
    v4[5] = key;
    PCSServiceItemsIterate(v4);
    v2 = v6[3];
    _Block_object_dispose(&v5, 8);
    if (!v2)
      goto LABEL_10;
  }
  if (CFEqual(*(CFTypeRef *)(v2 + 16), CFSTR("Raw")))
    return 0;
LABEL_10:
  result = PCSServiceItemTypeIsManatee((_BOOL8)key);
  if ((_DWORD)result)
    return *(_BYTE *)(v2 + 75) != 0;
  return result;
}

void sub_1A9540E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PCSServiceItemCanRoll(_BOOL8 key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = (const void *)key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    if (CFEqual(*(CFTypeRef *)(v2 + 16), CFSTR("Raw")))
      return 0;
    return *(_BYTE *)(v2 + 73) != 0;
  }
  return key;
}

void sub_1A9540FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PCSServiceItemRequireAuthorship(_BOOL8 key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = (const void *)key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return *(_BYTE *)(v2 + 76) != 0;
  }
  return key;
}

void sub_1A95410CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *PCSServiceItemGetFlagsByName(const void *key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return (const void *)*(unsigned int *)(v2 + 80);
  }
  return key;
}

void sub_1A95411E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *PCSServiceItemGetNumberByName(const void *key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return *(const void **)(v2 + 32);
  }
  return key;
}

void sub_1A95412F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFNumber *PCSServiceItemGetIndexByName(const __CFNumber *key)
{
  const __CFNumber *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    key = *(const __CFNumber **)(v2 + 32);
    if (key)
    {
      LODWORD(v3[0]) = 0;
      CFNumberGetValue(key, kCFNumberSInt32Type, v3);
      return (const __CFNumber *)LODWORD(v3[0]);
    }
  }
  return key;
}

void sub_1A9541420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *PCSServiceItemGetRollIntervalByName(const void *key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return (const void *)*(unsigned int *)(v2 + 28);
  }
  return key;
}

void sub_1A9541534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *PCSServiceItemGetViewHintByName(const void *key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return *(const void **)(v2 + 48);
  }
  return key;
}

void sub_1A9541648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *PCSServiceItemGetCKKSViewByName(const void *a1)
{
  const __CFString *ViewHintByName;
  const __CFString *v2;

  ViewHintByName = (const __CFString *)PCSServiceItemGetViewHintByName(a1);
  v2 = ViewHintByName;
  if (ViewHintByName && CFStringHasPrefix(ViewHintByName, CFSTR("PCS-")))
    return CFSTR("ProtectedCloudStorage");
  return v2;
}

const void *PCSServiceItemGetAccessClassByName(const void *key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return *(const void **)(v2 + 56);
  }
  return key;
}

void sub_1A95417A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PCSServiceItemEscrowManateeIdentityByName(_BOOL8 key)
{
  const void *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = (const void *)key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    return *(_BYTE *)(v2 + 77) != 0;
  }
  return key;
}

void sub_1A95418BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PCSServiceItemAllowKeyExportByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1 && !*(_BYTE *)(v1 + 74) && *(_BYTE *)(v1 + 78) != 0;
}

void sub_1A954197C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PCSServiceItemAnonymousSharingByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1 && *(_BYTE *)(v1 + 79) != 0;
}

void sub_1A9541A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSServiceItemGetNameByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  if (v1)
    return *(_QWORD *)(v1 + 16);
  else
    return 0;
}

void sub_1A9541AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSServiceItemGetViewHintByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  if (v1)
    return *(_QWORD *)(v1 + 48);
  else
    return 0;
}

void sub_1A9541B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PCSServiceItemGetAccessGroupByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  if (!v1)
    return 0;
  if (*(_QWORD *)(v1 + 88))
    return *(__CFString **)(v1 + 88);
  return kPCSDefaultKeychainGroup[0];
}

void sub_1A9541C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSServiceItemGetNumberByIndex(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  if (v1)
    return *(_QWORD *)(v1 + 32);
  else
    return 0;
}

void sub_1A9541D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PCSServiceItemGetAccessGroupByName(__CFString *key)
{
  __CFString *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const void *Value;

  if (key)
  {
    v1 = key;
    if (PCSServiceItemsInit_once != -1)
      dispatch_once(&PCSServiceItemsInit_once, &__block_literal_global_60);
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    Value = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)PCSServiceItemsInit_localServiceItems, v1);
    v2 = v5[3];
    if (v2)
    {
      _Block_object_dispose(&v4, 8);
    }
    else
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __PCSServiceItemGetByName_block_invoke;
      v3[3] = &unk_1E553EB78;
      v3[4] = &v4;
      v3[5] = v1;
      PCSServiceItemsIterate(v3);
      v2 = v5[3];
      _Block_object_dispose(&v4, 8);
      if (!v2)
        return 0;
    }
    if (*(_QWORD *)(v2 + 88))
      return *(__CFString **)(v2 + 88);
    else
      return kPCSDefaultKeychainGroup[0];
  }
  return key;
}

void sub_1A9541E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFIndex PCSServiceItemsCountByFlags(int a1)
{
  CFIndex v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __PCSServiceItemsCountByFlags_block_invoke;
    v3[3] = &unk_1E553EAF0;
    v4 = a1;
    v3[4] = &v5;
    PCSServiceItemsIterate(v3);
    v1 = v6[3];
  }
  else
  {
    v1 = PCSServiceItemsCount() - 1;
  }
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_1A9541EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PCSServiceItemsGetTooRolledServiceTypes()
{
  if (_PCSServiceItemsGetTooRolledServiceTypes_onceToken != -1)
    dispatch_once(&_PCSServiceItemsGetTooRolledServiceTypes_onceToken, &__block_literal_global_49);
  return (id)_PCSServiceItemsGetTooRolledServiceTypes_tooRolled;
}

id _PCSServiceItemsGetNoRollStingrayServiceTypes()
{
  if (_PCSServiceItemsGetNoRollStingrayServiceTypes_once != -1)
    dispatch_once(&_PCSServiceItemsGetNoRollStingrayServiceTypes_once, &__block_literal_global_53);
  return (id)_PCSServiceItemsGetNoRollStingrayServiceTypes_noRoll;
}

BOOL PCSServiceItemAllowSyntheticManateeSharing(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PCSServiceItemGetByIndex_block_invoke;
  v3[3] = &unk_1E553EAF0;
  v4 = a1;
  v3[4] = &v5;
  PCSServiceItemsIterate(v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1 && *(_BYTE *)(v1 + 74) && *(_BYTE *)(v1 + 75) == 0;
}

void sub_1A9542274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t apply_block_2_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t PCSBackupCreateEscrowedKeyWithIdentity(uint64_t a1, uint64_t a2, const void **a3)
{
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  __CFData *v8;
  __CFData *v9;
  const __CFData *EscrowedCommon;
  __CFData *v11;
  __CFData *v12;
  __CFData *v13;
  CFIndex v14;
  __CFData *Mutable;
  __CFData *v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  int v21;
  CFDataRef v22;
  const void **v23;
  _OWORD v24[5];

  memset(v24, 0, sizeof(v24));
  v6 = PCSIdentityCopyExportedPrivateKey(a2, a3);
  if (!v6)
    goto LABEL_18;
  v7 = v6;
  v8 = PCSIdentityCopyExportedPublicKey(a2);
  if (!v8)
  {
    _PCSErrorOOM(a3);
    CFRelease(v7);
    goto LABEL_18;
  }
  v9 = v8;
  EscrowedCommon = (const __CFData *)BackupCreateEscrowedCommon(v7, v8, (uint64_t)v24, a3);
  CFRelease(v7);
  CFRelease(v9);
  if (!EscrowedCommon)
  {
LABEL_18:
    free_PCSBackupEscrow();
    return 0;
  }
  v11 = PCSIdentityCopyWrappedKey(a1, EscrowedCommon, a3);
  if (!v11)
  {
    free_PCSBackupEscrow();
    CFRelease(EscrowedCommon);
    return 0;
  }
  v12 = v11;
  _PCSFillOctetString((CFIndex *)v24, v11);
  LODWORD(v24[3]) = 2;
  v13 = PCSIdentityCopyExportedPublicKey(a1);
  if (!_PCSFillOctetString((CFIndex *)&v24[3] + 1, v13))
  {
    _PCSErrorOOM(a3);
    goto LABEL_11;
  }
  v14 = length_PCSBackupEscrow();
  Mutable = CFDataCreateMutable(0, v14);
  if (!Mutable)
  {
    v18 = 12;
    goto LABEL_10;
  }
  v16 = Mutable;
  CFDataSetLength(Mutable, v14);
  CFDataGetMutableBytePtr(v16);
  v17 = encode_PCSBackupEscrow();
  if ((_DWORD)v17)
  {
    v18 = v17;
    CFRelease(v16);
LABEL_10:
    _PCSErrorASN1(a3, (uint64_t)"encode PCSBackupEscrow", v18);
LABEL_11:
    v16 = 0;
LABEL_13:
    free_PCSBackupEscrow();
    if (v13)
      CFRelease(v13);
    CFRelease(EscrowedCommon);
    CFRelease(v12);
    return (uint64_t)v16;
  }
  if (!v14)
    goto LABEL_13;
  v20 = asn1_abort();
  return PCSBackupCopyRecoveredKeyWithIdentitySet(v20, v21, v22, v23);
}

uint64_t PCSBackupCopyRecoveredKeyWithIdentitySet(int a1, int a2, CFDataRef theData, const void **a4)
{
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const void **v9;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v6 = decode_PCSBackupEscrow();
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = "decode PCSBackupEscrow";
    v9 = a4;
LABEL_6:
    _PCSErrorASN1(v9, (uint64_t)v8, v7);
    goto LABEL_7;
  }
  if (CFDataGetLength(theData))
  {
    v8 = "size PCSBackupEscrow";
    v9 = a4;
    v7 = 1859794442;
    goto LABEL_6;
  }
  _PCSError(a4, 57, CFSTR("wrong type: %d"), 0);
LABEL_7:
  free_PCSBackupEscrow();
  return 0;
}

__CFData *PCSBackupCreateEscrowedKeysetWithIdentity(uint64_t a1, const __CFData *a2, int a3, const void **a4)
{
  const __CFData *EscrowedCommon;
  const __CFData *v8;
  __CFData *v9;
  __CFData *v10;
  const __CFData *v11;
  const __CFData *v12;
  const void *Signature;
  CFIndex *v14;
  _BOOL4 v15;
  __CFData *v16;
  CFIndex v17;
  __CFData *Mutable;
  __CFData *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFData *v23;
  const __CFData *v24;
  uint64_t v25;
  const void **v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  EscrowedCommon = (const __CFData *)BackupCreateEscrowedCommon(a2, 0, (uint64_t)&v27, a4);
  if (!EscrowedCommon)
  {
    free_PCSBackupEscrow();
    return 0;
  }
  v8 = EscrowedCommon;
  v9 = PCSIdentityCopyWrappedKey(a1, EscrowedCommon, a4);
  if (!v9)
  {
    free_PCSBackupEscrow();
    CFRelease(v8);
    return 0;
  }
  v10 = v9;
  if (!_PCSFillOctetString((CFIndex *)&v27, v9))
    goto LABEL_26;
  if (!a3)
    goto LABEL_9;
  v11 = CFDataCreateWithBytesNoCopy(0, *((const UInt8 **)&v28 + 1), v28, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v11)
    goto LABEL_26;
  v12 = v11;
  Signature = (const void *)PCSIdentityCreateSignature(a1, 0, v11, a4);
  CFRelease(v12);
  if (!Signature)
  {
LABEL_27:
    free_PCSBackupEscrow();
    v19 = 0;
LABEL_19:
    CFRelease(v8);
    CFRelease(v10);
    return v19;
  }
  v14 = (CFIndex *)malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
  *((_QWORD *)&v31 + 1) = v14;
  if (!v14)
  {
    CFRelease(Signature);
    goto LABEL_26;
  }
  v15 = _PCSFillOctetString(v14, (CFDataRef)Signature);
  CFRelease(Signature);
  if (!v15)
  {
LABEL_26:
    _PCSErrorOOM(a4);
    goto LABEL_27;
  }
LABEL_9:
  LODWORD(v30) = 3;
  v16 = PCSIdentityCopyExportedPublicKey(a1);
  if (!_PCSFillOctetString((CFIndex *)&v30 + 1, v16))
  {
    _PCSErrorOOM(a4);
    goto LABEL_15;
  }
  v17 = length_PCSBackupEscrow();
  Mutable = CFDataCreateMutable(0, v17);
  if (!Mutable)
  {
    v21 = 12;
    goto LABEL_14;
  }
  v19 = Mutable;
  CFDataSetLength(Mutable, v17);
  CFDataGetMutableBytePtr(v19);
  v20 = encode_PCSBackupEscrow();
  if ((_DWORD)v20)
  {
    v21 = v20;
    CFRelease(v19);
LABEL_14:
    _PCSErrorASN1(a4, (uint64_t)"encode PCSBackupEscrow", v21);
LABEL_15:
    v19 = 0;
    goto LABEL_17;
  }
  if (!v17)
  {
LABEL_17:
    free_PCSBackupEscrow();
    if (v16)
      CFRelease(v16);
    goto LABEL_19;
  }
  v23 = (const __CFData *)asn1_abort();
  return (__CFData *)BackupCreateEscrowedCommon(v23, v24, v25, v26);
}

CFTypeRef BackupCreateEscrowedCommon(const __CFData *a1, const __CFData *a2, uint64_t a3, const void **a4)
{
  __CFData *RandomKey;
  __CFData *v9;
  __CFData *v10;
  __CFData *v11;
  CFTypeRef v12;

  RandomKey = _PCSStingrayCreateRandomKey(a4);
  if (!RandomKey)
    return 0;
  v9 = RandomKey;
  v10 = _PCSStingrayCopyEncryptedData(RandomKey, a1);
  if (v10)
  {
    v11 = v10;
    if (_PCSFillOctetString((CFIndex *)(a3 + 16), v10) && (!a2 || _PCSFillOctetString((CFIndex *)(a3 + 32), a2)))
    {
      v12 = CFRetain(v9);
    }
    else
    {
      _PCSErrorOOM(a4);
      v12 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    _PCSErrorOOM(a4);
    v12 = 0;
  }
  CFRelease(v9);
  return v12;
}

uint64_t PCSBackupCopyRecoveredKeysetWithIdentity(int a1, CFDataRef theData, const void **a3)
{
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  const void **v9;

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v5 = decode_PCSBackupEscrow();
  if ((_DWORD)v5)
  {
    v7 = v5;
    v8 = "decode PCSBackupEscrow";
    v9 = a3;
LABEL_6:
    _PCSErrorASN1(v9, (uint64_t)v8, v7);
    goto LABEL_7;
  }
  if (CFDataGetLength(theData))
  {
    v8 = "size PCSBackupEscrow";
    v9 = a3;
    v7 = 1859794442;
    goto LABEL_6;
  }
  _PCSError(a3, 57, CFSTR("wrong type: %d"), 0);
LABEL_7:
  free_PCSBackupEscrow();
  return 0;
}

void _PCSSyncingSetupInterface(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = _PCSSyncingSetupInterface_onceToken;
  v2 = a1;
  v5 = v2;
  if (v1 != -1)
  {
    dispatch_once(&_PCSSyncingSetupInterface_onceToken, &__block_literal_global_14);
    v2 = v5;
  }
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_errClasses, sel_getAllClients_, 1, 1);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_errClasses, sel_syncKeys_withReply_, 1, 1);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_errClasses, sel_triggerDaily_withReply_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_triggerSyncingWithEscrowProxy_dsid_publicKeys_accountIdentifier_settingsKeyExpirationDate_settingsKeyIdentifier_complete_, 1, 1);

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_errClasses, sel_triggerSyncingWithEscrowProxy_dsid_publicKeys_accountIdentifier_settingsKeyExpirationDate_settingsKeyIdentifier_complete_, 2, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_createIdentity_dsid_roll_sync_forceSync_complete_, 1, 1);

  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_errClasses, sel_createIdentity_dsid_roll_sync_forceSync_complete_, 2, 1);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", _PCSSyncingSetupInterface_statsClasses, sel_fetchStats_, 0, 1);

}

void PCSKeySyncingGetAllClients(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSKeySyncingGetAllClients_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllClients:", v3);

}

id connectionPCSKeySyncing()
{
  if (connectionPCSKeySyncing_onceToken != -1)
    dispatch_once(&connectionPCSKeySyncing_onceToken, &__block_literal_global_105);
  return (id)connectionPCSKeySyncing_connection;
}

void PCSKeySyncingSyncKeys(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = a1;
  connectionPCSKeySyncing();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __PCSKeySyncingSyncKeys_block_invoke;
  v8[3] = &unk_1E553EBC8;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncKeys:withReply:", v4, v6);

}

void PCSKeySyncingTriggerDaily()
{
  void *v0;
  dispatch_semaphore_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  connectionPCSKeySyncing();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = dispatch_semaphore_create(0);
  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PCSKeySyncingTriggerDaily_block_invoke;
  v9[3] = &unk_1E553EBF0;
  v3 = v1;
  v10 = v3;
  objc_msgSend(v0, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __PCSKeySyncingTriggerDaily_block_invoke_2;
  v7[3] = &unk_1E553EC18;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "triggerDaily:withReply:", MEMORY[0x1E0C9AA70], v7);

  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);

}

void PCSSyncKeyRegistryWithServiceName(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = kPCSSetupService[0];
  v8[0] = a1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PCSSyncKeyRegistryWithOptions(v6, v4);
}

void PCSSyncKeyRegistryWithOptions(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(id, _QWORD, void *);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  void (**v42)(id, _QWORD, void *);
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  connectionPCSKeySyncing();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", kPCSSetupService[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", kPCSSetupDSID[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!PCSCurrentPersonaMatchesDSID(v7))
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = kPCSErrorDomain;
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = CFSTR("Current persona does not match chosen dsid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 152, v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v26);
      goto LABEL_18;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", kPCSSetupPublicKeys[0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", kPCSSetupMTTCallback[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
  }
  +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v37 = v9;
  if (v7 || (objc_msgSend(v10, "aa_personID"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = v7;
    v35 = v11;
    v36 = v3;
    objc_msgSend(v11, "identifier");
    v34 = objc_claimAutoreleasedReturnValue();
    v44 = 0;
    +[PCSAccountsModel settingsKeyForKey:error:](PCSAccountsModel, "settingsKeyForKey:error:", CFSTR("nextRegistrySync"), &v44);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v44;
    v14 = v13;
    v15 = (void *)v12;
    if ((!v12 || v13) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v14;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
    v32 = v14;
    v43 = 0;
    +[PCSAccountsModel settingsKeyForKey:error:](PCSAccountsModel, "settingsKeyForKey:error:", CFSTR("registrySyncIdentifier"), &v43);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v43;
    v18 = v17;
    v19 = (void *)v16;
    if ((!v16 || v17) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v18;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
    v20 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __PCSSyncKeyRegistryWithOptions_block_invoke;
    v40[3] = &unk_1E553EC40;
    v41 = v9;
    v42 = v4;
    v38[0] = v20;
    v38[1] = 3221225472;
    v38[2] = __PCSSyncKeyRegistryWithOptions_block_invoke_2;
    v38[3] = &unk_1E553EBC8;
    v39 = (id)MEMORY[0x1AF4156AC](v40);
    v21 = v39;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v38);
    v22 = v5;
    v23 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v34;
    objc_msgSend(v24, "triggerSyncingWithEscrowProxy:dsid:publicKeys:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:", v6, v33, v8, v34, v15, v19, v21);

    v4 = v23;
    v5 = v22;

    v7 = v33;
    v11 = v35;
    v3 = v36;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = kPCSErrorDomain;
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("unable to determine DSID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 66, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, 0, v25);
    v7 = 0;
  }

  v26 = v37;
LABEL_18:

}

void PCSAccountOldSetupIdentities(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a1;
  connectionPCSKeySyncing();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_92);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupIdentitiesForAccount:withParameters:optional:", v6, v5, a3);

}

uint64_t PCSAccountMigrateToiCDP(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a1;
  v6 = a2;
  connectionPCSKeySyncing();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PCSAccountMigrateToiCDP_block_invoke;
  v14[3] = &unk_1E553EC88;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __PCSAccountMigrateToiCDP_block_invoke_2;
  v13[3] = &unk_1E553ECB0;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "migrateToiCDPForAccount:withParameters:complete:", v5, v6, v13);

  if (a3)
  {
    v10 = (void *)v16[5];
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  v11 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void sub_1A9543D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

BOOL PCSAccountEnableWalrus(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a1;
  v6 = a2;
  connectionPCSKeySyncing();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PCSAccountEnableWalrus_block_invoke;
  v14[3] = &unk_1E553EC88;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __PCSAccountEnableWalrus_block_invoke_2;
  v13[3] = &unk_1E553ECB0;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "enableWalrusForAccount:withParameters:complete:", v5, v6, v13);

  if (*((_BYTE *)v22 + 24))
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (a3)
    {
      v11 = (void *)v16[5];
      if (v11)
      {
        *a3 = objc_retainAutorelease(v11);
        v10 = *((_BYTE *)v22 + 24) != 0;
      }
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void sub_1A9543F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

BOOL PCSAccountDisableWalrus(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a1;
  v6 = a2;
  connectionPCSKeySyncing();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PCSAccountDisableWalrus_block_invoke;
  v14[3] = &unk_1E553EC88;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __PCSAccountDisableWalrus_block_invoke_2;
  v13[3] = &unk_1E553ECB0;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "disableWalrusForAccount:withParameters:complete:", v5, v6, v13);

  if (*((_BYTE *)v22 + 24))
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (a3)
    {
      v11 = (void *)v16[5];
      if (v11)
      {
        *a3 = objc_retainAutorelease(v11);
        v10 = *((_BYTE *)v22 + 24) != 0;
      }
    }
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void sub_1A95440F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void PCSTriggerWatchSyncing(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSTriggerWatchSyncing_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerWatchSyncing:", v3);

}

void PCSBackupCheckUserRegistry(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = a1;
  connectionPCSKeySyncing();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __PCSBackupCheckUserRegistry_block_invoke;
  v8[3] = &unk_1E553EBC8;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerUserRegistryCheck:withReply:", v4, v6);

}

void PCSBackupRestoreMobileBackup(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  CFTypeRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  CFTypeRef cf;

  v3 = a2;
  +[PCSAccountsModel accountForCurrentPersona](PCSAccountsModel, "accountForCurrentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    connectionPCSKeySyncing();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __PCSBackupRestoreMobileBackup_block_invoke;
    v13 = &unk_1E553EBC8;
    v7 = v3;
    v14 = v7;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "restoreMobileBackup:dsid:withReply:", a1, v5, v7, v10, v11, v12, v13);

  }
  else
  {
    cf = 0;
    _PCSError(&cf, 66, CFSTR("unable to determine DSID"));
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, CFTypeRef))v3 + 2))(v3, 0, 0, 0, cf);
    v9 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v9);
    }
  }

}

void PCSMobileBackupStatusXPC(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSMobileBackupStatusXPC_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileBackupStatus:", v3);

}

void PCSBackupRegistryMobileBackupRecords(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSBackupRegistryMobileBackupRecords_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileBackupRecordIDsWithReply:", v3);

}

void PCSBackupLocalDBMobileBackupRecords(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSBackupLocalDBMobileBackupRecords_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDBBackupRecordIDsWithReply:", v3);

}

void PCSIdentitySetCreateManatee(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFDictionary *v12;
  NSObject *v13;
  void *v14;
  id v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(id, _QWORD, void *);
  os_activity_scope_state_s state;
  uint64_t v39;
  const __CFString *v40;
  _BYTE buf[12];
  __int16 v42;
  __CFDictionary *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A9508000, "PCSIdentitySetCreateManatee", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  connectionPCSKeySyncing();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a2)
  {
    v31 = (void *)v9;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", kPCSSetupLogContext[0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = _PCSCopyPIIClearedOptions((CFDictionaryRef)v6);
      PCSLogGetOSLog((uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = a2;
        v42 = 2114;
        v43 = v12;
        _os_log_impl(&dword_1A9508000, v13, OS_LOG_TYPE_DEFAULT, "PCSIdentitySetCreateManatee: %{public}@ %{public}@", buf, 0x16u);
      }

      if (v12)
        CFRelease(v12);
      objc_msgSend(v6, "objectForKeyedSubscript:", kPCSSetupDSID[0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      if (!PCSCurrentPersonaMatchesDSID(v15))
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = kPCSErrorDomain;
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = CFSTR("Current persona does not match chosen dsid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 152, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v24);

LABEL_23:
        v10 = v31;
        goto LABEL_24;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", kPCSSetupRollIdentity[0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = objc_msgSend(v20, "BOOLValue");
      else
        v19 = 0;
      objc_msgSend(v6, "objectForKeyedSubscript:", kPCSSetupSyncIdentity[0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = objc_msgSend(v25, "BOOLValue");
      else
        v18 = 0;
      objc_msgSend(v6, "objectForKeyedSubscript:", kPCSSetupMTTCallback[0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
    }
    v26 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __PCSIdentitySetCreateManatee_block_invoke;
    v34[3] = &unk_1E553ECD8;
    v27 = v15;
    v35 = v27;
    v28 = v17;
    v36 = v28;
    v37 = v7;
    v32[0] = v26;
    v32[1] = 3221225472;
    v32[2] = __PCSIdentitySetCreateManatee_block_invoke_2;
    v32[3] = &unk_1E553EBC8;
    v29 = (id)MEMORY[0x1AF4156AC](v34);
    v33 = v29;
    objc_msgSend(v31, "remoteObjectProxyWithErrorHandler:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createIdentity:dsid:roll:sync:forceSync:complete:", a2, v27, v19, v18, 0, v29);

    goto LABEL_23;
  }
  *(_QWORD *)buf = 0;
  _PCSError((const void **)buf, 124, CFSTR("No ServiceName Specified"));
  v7[2](v7, 0, *(void **)buf);
  v16 = *(const void **)buf;
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)buf = 0;
    CFRelease(v16);
  }
LABEL_24:

  os_activity_scope_leave(&state);
}

void sub_1A9544B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t PCSReportManateeStatus(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 11;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PCSReportManateeStatus_block_invoke;
  v10[3] = &unk_1E553EC88;
  v10[4] = &v11;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __PCSReportManateeStatus_block_invoke_2;
  v9[3] = &unk_1E553ED00;
  v9[4] = &v11;
  objc_msgSend(v4, "manateeStatus:complete:", v1, v9);

  pcsLogObjForScope("ManateeStatus");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *((_DWORD *)v12 + 6);
    *(_DWORD *)buf = 67109120;
    v16 = v6;
    _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "PCSReportManateeStatus: %d", buf, 8u);
  }

  v7 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v7;
}

void sub_1A9544DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PCSReportKeyRollPending(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_101);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PCSReportKeyRollPending_block_invoke_2;
  v6[3] = &unk_1E553ED28;
  v6[4] = &v7;
  objc_msgSend(v3, "keyRollPending:complete:", v1, v6);

  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_1A9544EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PCSGetHealthSummary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectionPCSKeySyncing();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PCSGetHealthSummary_block_invoke;
  v5[3] = &unk_1E553EBC8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHealthSummary:", v3);

}

void *__initCloudKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 1);
  cloudKit = (uint64_t)result;
  return result;
}

void __connectionPCSKeySyncing_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEAF67C8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _PCSSyncingSetupInterface(v0);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.protectedcloudstorage.protectedcloudkeysyncing"), 4096);
  v2 = (void *)connectionPCSKeySyncing_connection;
  connectionPCSKeySyncing_connection = v1;

  if (connectionPCSKeySyncing_connection)
  {
    objc_msgSend((id)connectionPCSKeySyncing_connection, "setRemoteObjectInterface:", v0);
    objc_msgSend((id)connectionPCSKeySyncing_connection, "setInvalidationHandler:", &__block_literal_global_151);
    objc_msgSend((id)connectionPCSKeySyncing_connection, "resume");
    objc_msgSend((id)connectionPCSKeySyncing_connection, "setInterruptionHandler:", &__block_literal_global_153);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no server connection", v3, 2u);
  }

}

void __connectionPCSKeySyncing_block_invoke_150()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "pcs xpc connection handle invalid", v0, 2u);
  }
}

void __connectionPCSKeySyncing_block_invoke_152()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "server connection rejected us", v0, 2u);
  }
}

uint64_t PCSSupportGetClientInfo()
{
  if (PCSSupportGetClientInfo_onceToken != -1)
    dispatch_once(&PCSSupportGetClientInfo_onceToken, &__block_literal_global_15);
  return PCSSupportGetClientInfo_clientInfo;
}

void sub_1A95454EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A9546F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __operationQueueForService_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PCSCKKS.operationQueueForService", v0);
  v2 = (void *)operationQueueForService_queue;
  operationQueueForService_queue = (uint64_t)v1;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
  v4 = (void *)operationQueueForService_serviceQueueMap;
  operationQueueForService_serviceQueueMap = v3;

}

void __operationQueueForService_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)operationQueueForService_serviceQueueMap, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMaxConcurrentOperationCount:", 1);
    objc_msgSend((id)operationQueueForService_serviceQueueMap, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

void PCSGetBoundaryKey(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __PCSGetBoundaryKey_block_invoke;
  v8[3] = &unk_1E553EE68;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

}

id AssignedPreferred(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = *MEMORY[0x1E0CD6990];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();
    v9 = v3;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "earlierDate:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v9 = v4;
      else
        v9 = v3;
    }
  }
  v12 = v9;

  return v12;
}

uint64_t _PCSAppSpecificAccount(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), kPCSAccountBoundaryKey[0], a1);
}

void PCSGetAppBoundaryKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSGetAppBoundaryKey_block_invoke;
  block[3] = &unk_1E553EE90;
  v14 = v5;
  v15 = v7;
  v13 = v6;
  v9 = v5;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, block);

}

void PCSDeleteBoundaryKey(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", kPCSSetupDSID[0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (PCSCurrentPersonaMatchesDSID(v1))
  {
    v2 = (void *)MEMORY[0x1E0C99E08];
    v3 = *MEMORY[0x1E0CD6CB8];
    v4 = *MEMORY[0x1E0CD68F8];
    v8[0] = *MEMORY[0x1E0CD6C98];
    v8[1] = v4;
    v9[0] = v3;
    v9[1] = kPCSAccountBoundaryKey[0];
    v5 = *MEMORY[0x1E0CD6898];
    v8[2] = *MEMORY[0x1E0CD6B80];
    v8[3] = v5;
    v9[2] = *MEMORY[0x1E0C9AE50];
    v9[3] = kPCSDefaultKeychainGroup[0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0CD6B50]);
    off_1ECED3FF8(v7);

  }
}

void PCSDeleteAppBoundaryKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "objectForKeyedSubscript:", kPCSSetupDSID[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PCSCurrentPersonaMatchesDSID(v4))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), kPCSAccountBoundaryKey[0], v3);
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = *MEMORY[0x1E0CD6CB8];
    v8 = *MEMORY[0x1E0CD68F8];
    v14[0] = *MEMORY[0x1E0CD6C98];
    v14[1] = v8;
    v9 = *MEMORY[0x1E0CD6898];
    v14[2] = *MEMORY[0x1E0CD6B80];
    v14[3] = v9;
    v15[0] = v7;
    v15[1] = v5;
    v15[2] = *MEMORY[0x1E0C9AE50];
    v15[3] = v3;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v5;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD6B50]);
    off_1ECED3FF8(v13);

  }
}

CFIndex _PCSError(const void **a1, CFIndex a2, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  _PCSErrorVA(0, a1, a2, 0, format, va);
  return a2;
}

CFIndex _PCSErrorVA(uint64_t a1, const void **a2, CFIndex a3, const __CFDictionary *a4, CFStringRef format, va_list arguments)
{
  CFStringRef v10;
  os_log_type_t v12;
  NSObject *v13;
  __CFDictionary *MutableCopy;
  __CFDictionary *v15;
  const void *v16;
  _DWORD v18[2];
  __int16 v19;
  CFStringRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  if (a3 == 21 || a3 == 73)
    v12 = OS_LOG_TYPE_DEBUG;
  else
    v12 = OS_LOG_TYPE_DEFAULT;
  if (do_error_as_log)
  {
    PCSLogGetOSLog(a1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, v12))
    {
      v18[0] = 67109378;
      v18[1] = a3;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1A9508000, v13, v12, "PCSError: %d : %{public}@", (uint8_t *)v18, 0x12u);
    }

  }
  if (a2)
  {
    if (a4)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a4);
    else
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v15 = MutableCopy;
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E0C9AFB0], v10);
    v16 = *a2;
    if (*a2)
    {
      CFDictionaryAddValue(v15, (const void *)*MEMORY[0x1E0C9B000], *a2);
      CFRelease(v16);
    }
    *a2 = CFErrorCreate(0, kPCSErrorDomain, a3, v15);
    if (v15)
      CFRelease(v15);
  }
  if (v10)
    CFRelease(v10);
  return a3;
}

CFIndex _PCSErrorContext(uint64_t a1, const void **a2, CFIndex a3, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  _PCSErrorVA(a1, a2, a3, 0, format, va);
  return a3;
}

CFIndex _PCSErrorUserInfo(uint64_t a1, const void **a2, CFIndex a3, const __CFDictionary *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _PCSErrorVA(a1, a2, a3, a4, a5, &a9);
  return a3;
}

uint64_t _PCSErrorASN1(const void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = (int)a3;
  _PCSError(a1, (int)a3, CFSTR("Failed to %s: %d"), a2, a3);
  return v3;
}

CFIndex _PCSErrorOOM(const void **a1)
{
  return _PCSError(a1, 14, CFSTR("out of memory"));
}

id PCSErrorCreate(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  if (do_error_as_log && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSErrorCreate: %@", buf, 0xCu);
  }
  v17 = *MEMORY[0x1E0CB2D50];
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", kPCSErrorDomain, a1, v13);

  return v15;
}

BOOL PCSSecError(int a1, CFErrorRef *a2, CFStringRef format, ...)
{
  CFErrorRef v5;
  va_list va;

  va_start(va, format);
  if (a1 && a2)
  {
    v5 = *a2;
    *a2 = 0;
    PCSSecCFCreateErrorWithFormatAndArguments(a1, (const __CFString *)*MEMORY[0x1E0C9AFC8], (const __CFString *)v5, a2, 0, format, va);
  }
  return a1 == 0;
}

uint64_t PCSSecCFCreateErrorWithFormatAndArguments(CFIndex a1, const __CFString *a2, const __CFString *a3, CFErrorRef *a4, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  CFStringRef v9;
  CFStringRef v12;
  void *v13;
  CFIndex v14;
  void *userInfoValues[2];
  void *userInfoKeys[3];

  userInfoKeys[2] = *(void **)MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (*a4)
    {
      if (a3 && *a4 != (CFErrorRef)a3)
      {
        v9 = a3;
LABEL_11:
        CFRelease(v9);
      }
    }
    else
    {
      v12 = CFStringCreateWithFormatAndArguments(0, formatOptions, format, arguments);
      v13 = (void *)*MEMORY[0x1E0C9B000];
      userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFB0];
      userInfoKeys[1] = v13;
      userInfoValues[0] = (void *)v12;
      userInfoValues[1] = (void *)a3;
      if (a3)
        v14 = 2;
      else
        v14 = 1;
      *a4 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, a1, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v14);
      if (v12)
      {
        v9 = v12;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void PCSRestoreCKBackup()
{
  dispatch_semaphore_t v0;
  NSObject *v1;
  _QWORD v2[4];
  dispatch_semaphore_t v3;

  v0 = dispatch_semaphore_create(0);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __PCSRestoreCKBackup_block_invoke;
  v2[3] = &unk_1E553EEB8;
  v3 = v0;
  v1 = v0;
  PCSRestoreCKBackupWithCompletion(0, v2);
  dispatch_semaphore_wait(v1, 0xFFFFFFFFFFFFFFFFLL);

}

uint64_t PCSRestoreCKBackupWithCompletion(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint8_t *v9;
  char v10;
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSRestoreCKBackupWithCompletion", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __PCSRestoreCKBackupWithCompletion_block_invoke;
  v7[3] = &unk_1E553EEE0;
  v10 = a1;
  v9 = buf;
  v4 = v3;
  v8 = v4;
  PCSBackupRestoreMobileBackup(a1, v7);
  v5 = v12[24];

  _Block_object_dispose(buf, 8);
  return v5;
}

void sub_1A954A304(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t PCSMobileBackupStatus(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v2 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSMobileBackupStatus", buf, 2u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PCSMobileBackupStatus_block_invoke;
  v6[3] = &unk_1E553EF08;
  v8 = &v11;
  v9 = a1;
  v3 = v2;
  v7 = v3;
  PCSMobileBackupStatusXPC(v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v4;
}

void sub_1A954A614(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

__CFData *PCSCopyWrappedKey(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex Length;
  CFIndex v6;
  __CFData *Mutable;

  ccaes_ecb_encrypt_mode();
  v4 = ccecb_context_size();
  MEMORY[0x1E0C80A78](v4);
  Length = CFDataGetLength(a1);
  if (Length != 32 && Length != 16)
    goto LABEL_7;
  CFDataGetBytePtr(a1);
  ccecb_init();
  CFDataGetLength(a2);
  v6 = ccwrap_wrapped_size();
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v6);
  if (a1)
  {
    CFDataGetBytePtr(a2);
    CFDataGetMutableBytePtr(Mutable);
    if (ccwrap_auth_encrypt())
    {
      if (Mutable)
      {
        CFRelease(Mutable);
LABEL_7:
        Mutable = 0;
      }
    }
    else if (CFDataGetLength(Mutable))
    {
      PCSCopyWrappedKey_cold_1();
    }
  }
  ccecb_context_size();
  cc_clear();
  return Mutable;
}

__CFData *PCSCopyUnwrappedKey(const __CFData *a1, const __CFData *a2)
{
  uint64_t v4;
  CFIndex Length;
  CFIndex v6;
  __CFData *Mutable;

  ccaes_ecb_decrypt_mode();
  v4 = ccecb_context_size();
  MEMORY[0x1E0C80A78](v4);
  Length = CFDataGetLength(a1);
  if (CFDataGetLength(a2) < 8 || Length != 32 && Length != 16)
    goto LABEL_7;
  CFDataGetLength(a1);
  CFDataGetBytePtr(a1);
  ccecb_init();
  CFDataGetLength(a2);
  v6 = ccwrap_unwrapped_size();
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v6);
  if (Mutable)
  {
    CFDataGetLength(a2);
    CFDataGetBytePtr(a2);
    CFDataGetMutableBytePtr(Mutable);
    if (ccwrap_auth_decrypt())
    {
      CFRelease(Mutable);
LABEL_7:
      Mutable = 0;
      goto LABEL_9;
    }
    if (CFDataGetLength(Mutable))
      PCSCopyUnwrappedKey_cold_1();
  }
LABEL_9:
  ccecb_context_size();
  cc_clear();
  return Mutable;
}

CFTypeRef PCSMMCSCopyEncryptedData(const __CFData *a1, const __CFData *a2, const __CFData *a3)
{
  uint64_t v6;
  uint64_t v7;
  __CFData *Mutable;
  __CFData *v9;
  UInt8 *MutableBytePtr;
  CFTypeRef v11;
  UInt8 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = ccaes_siv_encrypt_mode();
  v13 = 0;
  MEMORY[0x1E0C80A78](v6);
  if (PCSMMCSGetDerivedSIVKey(a1, (char *)&v13)
    && (ccsiv_init(), CFDataGetLength(a3),
                      v7 = ccsiv_ciphertext_size(),
                      (Mutable = CFDataCreateMutable(0, 0)) != 0))
  {
    v9 = Mutable;
    CFDataSetLength(Mutable, v7 + 17);
    MutableBytePtr = CFDataGetMutableBytePtr(v9);
    *MutableBytePtr = v13;
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, MutableBytePtr + 1)
      || (ccsiv_set_nonce(), CFDataGetMutableBytePtr(v9), ccsiv_aad())
      || a2 && (CFDataGetLength(a2), CFDataGetBytePtr(a2), ccsiv_aad())
      || (CFDataGetLength(a3), CFDataGetBytePtr(a3), ccsiv_crypt()))
    {
      v11 = 0;
    }
    else
    {
      v11 = CFRetain(v9);
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  cc_clear();
  return v11;
}

BOOL PCSMMCSGetDerivedSIVKey(const __CFData *a1, char *a2)
{
  CFIndex Length;
  char v5;

  Length = CFDataGetLength(a1);
  if (Length == 16)
  {
    v5 = 3;
    goto LABEL_5;
  }
  if (Length == 32)
  {
    v5 = 4;
LABEL_5:
    *a2 = v5;
    ccsha256_di();
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    return cchkdf() == 0;
  }
  return 0;
}

CFTypeRef PCSMMCSCopyDecryptedData(const __CFData *a1, const __CFData *a2, const __CFData *a3)
{
  uint64_t v6;
  CFIndex v7;
  __CFData *Mutable;
  __CFData *v9;
  const UInt8 *BytePtr;
  CFTypeRef v11;
  unsigned __int8 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = ccaes_siv_decrypt_mode();
  v13 = 0;
  MEMORY[0x1E0C80A78](v6);
  if (CFDataGetLength(a3) >= 18
    && PCSMMCSGetDerivedSIVKey(a1, (char *)&v13)
    && (ccsiv_init(), CFDataGetLength(a3), v7 = ccsiv_plaintext_size(), (Mutable = CFDataCreateMutable(0, 0)) != 0))
  {
    v9 = Mutable;
    CFDataSetLength(Mutable, v7);
    BytePtr = CFDataGetBytePtr(a3);
    if (*BytePtr != v13
      || (ccsiv_set_nonce(), ccsiv_aad())
      || a2 && (CFDataGetLength(a2), CFDataGetBytePtr(a2), ccsiv_aad())
      || (CFDataGetMutableBytePtr(v9), ccsiv_crypt()))
    {
      v11 = 0;
    }
    else
    {
      v11 = CFRetain(v9);
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  cc_clear();
  return v11;
}

uint64_t PCSKeyEnvelopeGetTypeID()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PCSKeyEnvelopeGetTypeID_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &PCSKeyEnvelopeGetTypeID_sPCSKeyEnvelopeGetTypeIDSingleton;
  if (PCSKeyEnvelopeGetTypeID_sPCSKeyEnvelopeGetTypeIDOnce != -1)
    dispatch_once(&PCSKeyEnvelopeGetTypeID_sPCSKeyEnvelopeGetTypeIDOnce, block);
  return PCSKeyEnvelopeGetTypeID_sPCSKeyEnvelopeGetTypeIDSingleton;
}

void PCSKeyEnvelopeDestroy(uint64_t a1)
{
  const void *v2;
  const void *v3;

  if (a1)
  {
    v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      *(_QWORD *)(a1 + 16) = 0;
      CFRelease(v2);
    }
    v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      *(_QWORD *)(a1 + 24) = 0;
      CFRelease(v3);
    }
  }
}

CFStringRef PCSKeyEnvelopeCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  CFStringRef v3;
  CFStringRef v4;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("KE@%p"), a1);
  v4 = CFStringCreateWithFormat(v2, 0, CFSTR("<%@: [envelope: %@] [associatedData: %@]"), v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if (v3)
    CFRelease(v3);
  return v4;
}

uint64_t PCSKeyEnvelopeGetEnvelope(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

_QWORD *PCSKeyEnvelopeCreateWithValues(uint64_t a1, const __CFData *a2, const __CFData *a3, const void **a4)
{
  _QWORD *Instance;
  CFDataRef Copy;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  PCSKeyEnvelopeGetTypeID();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  Instance[3] = CFDataCreateCopy(0, a2);
  Copy = CFDataCreateCopy(0, a3);
  Instance[2] = Copy;
  if (Instance[3])
    v15 = Copy == 0;
  else
    v15 = 1;
  if (v15)
  {
    _PCSError(a4, 150, CFSTR("%s: could not create the key envelope"), "PCSKeyEnvelopeRef  _Nonnull PCSKeyEnvelopeCreateWithValues(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    CFRelease(Instance);
    v22 = _PCSKEExtractSeed(a1, 0, a4, v16, v17, v18, v19, v20);
    Instance = 0;
    v21 = 0;
    if (!v22)
      return v21;
  }
  else
  {
    v22 = _PCSKEExtractSeed(a1, (uint64_t)Instance, a4, v10, v11, v12, v13, v14);
    if (!v22)
    {
      v21 = 0;
      goto LABEL_11;
    }
  }
  v21 = Instance;
  Instance = (_QWORD *)v22;
LABEL_11:
  CFRelease(Instance);
  return v21;
}

uint64_t _PCSKEExtractSeed(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v11;
  CFTypeID v12;
  const void *v13;
  CFTypeID v14;
  uint64_t v15;
  PCSEnvelopedKeyMaterial *v16;
  void *v17;
  PCSEnvelopedKeyMaterial *v18;
  void *v19;
  uint64_t v20;
  PCSEnvelopedKeyMaterial *v21;
  id v22;
  const UInt8 *v23;
  void *v24;
  CFIndex v25;
  const __CFData *v26;
  const __CFData *v27;
  uint64_t v28;
  __CFString *v29;
  __CFData *v30;
  const __CFDictionary *v31;
  uint64_t v32;
  const __CFString *v34;
  char v35;
  _QWORD context[4];
  PCSEnvelopedKeyMaterial *v37;
  uint64_t *v38;
  const void **v39;
  const __CFData *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (!a1)
  {
    _PCSError(a3, 128, CFSTR("%s: sp argument NULL"), "CFDataRef _PCSKEExtractSeed(PCSShareProtectionRef, PCSKeyEnvelopeRef, CFErrorRef *)");
LABEL_34:
    v21 = 0;
    goto LABEL_27;
  }
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v35);
  if (!*(_QWORD *)(a1 + 72))
  {
    _PCSError(a3, 25, CFSTR("%s: cannot decrypt envelope without master key"), "CFDataRef _PCSKEExtractSeed(PCSShareProtectionRef, PCSKeyEnvelopeRef, CFErrorRef *)");
    goto LABEL_34;
  }
  v11 = *(const void **)(a2 + 24);
  if (!v11 || (v12 = CFGetTypeID(v11), v12 != CFDataGetTypeID()))
  {
    v34 = CFSTR("%s: keyEnvelope->context argument not CFData");
LABEL_33:
    _PCSError(a3, 126, v34, "CFDataRef _PCSKEExtractSeed(PCSShareProtectionRef, PCSKeyEnvelopeRef, CFErrorRef *)");
    goto LABEL_34;
  }
  v13 = *(const void **)(a2 + 16);
  if (!v13 || (v14 = CFGetTypeID(v13), v14 != CFDataGetTypeID()))
  {
    v34 = CFSTR("%s: keyEnvelope->envelope argument not CFData");
    goto LABEL_33;
  }
  v15 = *(_QWORD *)(a2 + 16);
  v16 = [PCSEnvelopedKeyMaterial alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PCSEnvelopedKeyMaterial initWithData:](v16, "initWithData:", v17);

  if (v18)
  {
    if (-[PCSEnvelopedKeyMaterial version](v18, "version") == 1)
    {
      -[PCSEnvelopedKeyMaterial encryptedSeed](v18, "encryptedSeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20 == 48)
      {
        v21 = v18;
        goto LABEL_16;
      }
      _PCSError(a3, 13, CFSTR("%s: invalid ciphertext length"), "PCSEnvelopedKeyMaterial *_PCSKEDeserializeEnvelope(CFDataRef, CFErrorRef *)");
    }
    else
    {
      _PCSError(a3, 13, CFSTR("%s: invalid version"), "PCSEnvelopedKeyMaterial *_PCSKEDeserializeEnvelope(CFDataRef, CFErrorRef *)");
    }
  }
  else
  {
    _PCSError(a3, 13, CFSTR("%s: could not initWithData"), "PCSEnvelopedKeyMaterial *_PCSKEDeserializeEnvelope(CFDataRef, CFErrorRef *)");
  }
  v21 = 0;
LABEL_16:

  if (v21)
  {
    -[PCSEnvelopedKeyMaterial encryptedSeed](v21, "encryptedSeed");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const UInt8 *)objc_msgSend(v22, "bytes");
    -[PCSEnvelopedKeyMaterial encryptedSeed](v21, "encryptedSeed");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");
    v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v23, v25, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);

    if (v26)
    {
      v27 = *(const __CFData **)(a1 + 72);
      v28 = -[PCSEnvelopedKeyMaterial version](v21, "version");
      if ((_DWORD)v28)
      {
        if ((_DWORD)v28 == 1)
        {
          v29 = CFSTR("HKDF_SIV_GCM_HMAC_256");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v29 = CFSTR("UNKNOWN");
      }
      v30 = _PCSKEExtractSeedWithMasterKey(v27, v26, v29, *(const __CFData **)(a2 + 24), a3);
      v43[3] = (uint64_t)v30;

      if (!v43[3] && -[PCSEnvelopedKeyMaterial hasMasterKeyId](v21, "hasMasterKeyId"))
      {
        v31 = *(const __CFDictionary **)(a1 + 112);
        context[0] = MEMORY[0x1E0C809B0];
        context[1] = 3221225472;
        context[2] = ___PCSKEExtractSeed_block_invoke;
        context[3] = &unk_1E553EF58;
        v38 = &v42;
        v37 = v21;
        v39 = a3;
        v40 = v26;
        v41 = a2;
        CFDictionaryApplyFunction(v31, (CFDictionaryApplierFunction)apply_block_2_5, context);

      }
      CFRelease(v26);
    }
    else
    {
      _PCSError(a3, 150, CFSTR("%s: could not allocate the encrypted seed"), "CFDataRef _PCSKEExtractSeed(PCSShareProtectionRef, PCSKeyEnvelopeRef, CFErrorRef *)");
    }
  }
LABEL_27:
  v32 = v43[3];

  _Block_object_dispose(&v42, 8);
  return v32;
}

void sub_1A954C168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *PCSKeyEnvelopeCreate(uint64_t a1, CFTypeRef cf, const void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID v11;
  __CFData *v12;
  const __CFData *v13;
  __CFData *Mutable;
  size_t Length;
  UInt8 *MutableBytePtr;
  CFIndex v17;
  __CFData *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFData *v22;
  _QWORD *v23;
  char v25;
  const UInt8 *BytePtr;
  UInt8 *v27;
  const __CFData *v28;
  const void **v29;

  if (!a1)
  {
    _PCSError(a3, 128, CFSTR("%s: sp argument NULL"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  if (*(_DWORD *)(a1 + 216) != 1192348414)
    PCSAbort("PCSShareProtectionObject no longer alive (overrelease):(sp)->alive == pcsfpTruelyAlive", (uint64_t)cf, (uint64_t)a3, a4, a5, a6, a7, a8, v25);
  if (!*(_QWORD *)(a1 + 72))
  {
    _PCSError(a3, 25, CFSTR("%s: cannot generate envelope without master key"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  if (!cf || (v11 = CFGetTypeID(cf), v11 != CFDataGetTypeID()))
  {
    _PCSError(a3, 126, CFSTR("%s: keykeyEnvelopeAssociatedData argument not CFData"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  v12 = _PCSKEAesSivKeyFromMasterKey(*(const __CFData **)(a1 + 72), CFSTR("HKDF_SIV_GCM_HMAC_256"), (const __CFData *)cf, a3);
  if (!v12)
    return 0;
  v13 = v12;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 32);
  if (Mutable)
  {
    Length = CFDataGetLength(Mutable);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    _PCSRandomData(Length, MutableBytePtr);
    ccaes_siv_encrypt_mode();
    CFDataGetLength(Mutable);
    v17 = ccsiv_ciphertext_size();
    v18 = CFDataCreateMutable(0, 0);
    CFDataSetLength(v18, v17);
    if (v18)
    {
      v29 = a3;
      CFDataGetLength(v13);
      v28 = v13;
      CFDataGetBytePtr(v13);
      CFDataGetLength((CFDataRef)cf);
      CFDataGetBytePtr((CFDataRef)cf);
      CFDataGetLength(Mutable);
      BytePtr = CFDataGetBytePtr(Mutable);
      v27 = CFDataGetMutableBytePtr(v18);
      if (ccsiv_one_shot())
      {
        CFRelease(v18);
        _PCSError(a3, 12, CFSTR("%s: Wrapping with AES-SIV failed"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)", v27);
        v23 = 0;
      }
      else
      {
        v19 = (void *)objc_opt_new();
        if ((objc_msgSend(CFSTR("HKDF_SIV_GCM_HMAC_256"), "isEqualToString:", CFSTR("UNKNOWN"), BytePtr, v27) & 1) != 0)
          v20 = 0;
        else
          v20 = objc_msgSend(CFSTR("HKDF_SIV_GCM_HMAC_256"), "isEqualToString:", CFSTR("HKDF_SIV_GCM_HMAC_256"));
        objc_msgSend(v19, "setVersion:", v20);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", CFDataGetBytePtr(*(CFDataRef *)(a1 + 80)), 4);
        objc_msgSend(v19, "setMasterKeyId:", v21);

        objc_msgSend(v19, "setEncryptedSeed:", v18);
        objc_msgSend(v19, "data");
        v22 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v23 = PCSKeyEnvelopeCreateWithValues(a1, (const __CFData *)cf, v22, v29);

      }
      v13 = v28;
    }
    else
    {
      _PCSError(a3, 150, CFSTR("%s: could not allocate the encrypted seed"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
      v23 = 0;
    }
    CFRelease(Mutable);
  }
  else
  {
    _PCSError(a3, 150, CFSTR("%s: could not allocate the seed"), "PCSKeyEnvelopeRef  _Nullable PCSKeyEnvelopeCreate(PCSShareProtectionRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    v23 = 0;
  }
  CFRelease(v13);
  return v23;
}

__CFData *_PCSKEAesSivKeyFromMasterKey(const __CFData *a1, void *a2, const __CFData *a3, const void **a4)
{
  void *v7;
  uint64_t v8;
  CFIndex v9;
  __CFData *Mutable;
  UInt8 *v11;
  id v12;
  UInt8 *MutableBytePtr;
  UInt8 *v14;
  const UInt8 *BytePtr;
  size_t Length;
  __CFData *v17;

  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = v8 + CFDataGetLength(a3) + 69;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v9);
  if (Mutable)
  {
    qmemcpy(CFDataGetMutableBytePtr(Mutable), "com.apple.ProtectedCloudStorage.PCSKeyEnvelope.AesSivKeyFromMasterKey", 69);
    v11 = CFDataGetMutableBytePtr(Mutable) + 69;
    v12 = objc_retainAutorelease(v7);
    memcpy(v11, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v14 = &MutableBytePtr[objc_msgSend(v12, "length") + 69];
    BytePtr = CFDataGetBytePtr(a3);
    Length = CFDataGetLength(a3);
    memcpy(v14, BytePtr, Length);
    v17 = CFDataCreateMutable(0, 0);
    CFDataSetLength(v17, 64);
    if (v17)
    {
      ccsha256_di();
      CFDataGetLength(a1);
      CFDataGetBytePtr(a1);
      CFDataGetLength(Mutable);
      CFDataGetBytePtr(Mutable);
      CFDataGetLength(v17);
      CFDataGetMutableBytePtr(v17);
      if (cchkdf())
      {
        CFRelease(v17);
        _PCSError(a4, 147, CFSTR("%s: HKDF failed"), "CFMutableDataRef _PCSKEAesSivKeyFromMasterKey(CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
        v17 = 0;
      }
    }
    else
    {
      _PCSError(a4, 150, CFSTR("%s: could not allocate the key"), "CFMutableDataRef _PCSKEAesSivKeyFromMasterKey(CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
    }
    CFRelease(Mutable);
  }
  else
  {
    _PCSError(a4, 150, CFSTR("%s: could not allocate the context"), "CFMutableDataRef _PCSKEAesSivKeyFromMasterKey(CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
    v17 = 0;
  }

  return v17;
}

__CFData *PCSKeyEnvelopeEncrypt(uint64_t a1, uint64_t a2, const __CFData *a3, CFTypeRef cf, const void **a5)
{
  CFTypeID v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFData *v16;
  const __CFData *v17;
  __CFData *v18;
  const __CFData *v19;
  CFIndex v20;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  UInt8 *v24;
  UInt8 *v25;

  if (!cf || (v10 = CFGetTypeID(cf), v10 != CFDataGetTypeID()))
  {
    _PCSError(a5, 126, CFSTR("%s: associatedData argument not CFData"), "CFDataRef  _Nullable PCSKeyEnvelopeEncrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  v16 = (const __CFData *)_PCSKEExtractSeed(a1, a2, a5, v11, v12, v13, v14, v15);
  if (!v16)
    return 0;
  v17 = v16;
  v18 = _PCSKEKeyFromSeed(v16, 68, (int)"com.apple.ProtectedCloudStorage.PCSKeyEnvelope.EncryptionKeyFromSeed", a5);
  if (!v18)
  {
    CFRelease(v17);
    return 0;
  }
  v19 = v18;
  v20 = CFDataGetLength(a3) + 28;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, v20);
  if (Mutable)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v24 = MutableBytePtr + 12;
    v25 = MutableBytePtr + 28;
    _PCSRandomData(0xCuLL, MutableBytePtr);
    ccaes_gcm_encrypt_mode();
    CFDataGetLength(v19);
    CFDataGetBytePtr(v19);
    CFDataGetLength((CFDataRef)cf);
    CFDataGetBytePtr((CFDataRef)cf);
    CFDataGetLength(a3);
    CFDataGetBytePtr(a3);
    if (ccgcm_one_shot())
    {
      CFRelease(Mutable);
      _PCSError(a5, 92, CFSTR("%s: AES-GCM failed"), "CFDataRef  _Nullable PCSKeyEnvelopeEncrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)", v25, 16, v24);
      Mutable = 0;
    }
  }
  else
  {
    _PCSError(a5, 150, CFSTR("%s: could not allocate the ciphertext"), "CFDataRef  _Nullable PCSKeyEnvelopeEncrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
  }
  CFRelease(v17);
  CFRelease(v19);
  return Mutable;
}

__CFData *_PCSKEKeyFromSeed(const __CFData *a1, int a2, int a3, const void **a4)
{
  __CFData *Mutable;
  CFIndex Length;
  int MutableBytePtr;

  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 32);
  if (Mutable)
  {
    Length = CFDataGetLength(Mutable);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    if (!_PCSCreateDerivedKey(a1, a2, a3, Length, MutableBytePtr, a4))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  else
  {
    _PCSError(a4, 150, CFSTR("%s: could not allocate the key"), "CFDataRef _PCSKEKeyFromSeed(CFDataRef, CFIndex, size_t, const char *const, CFErrorRef *)");
  }
  return Mutable;
}

__CFData *PCSKeyEnvelopeDecrypt(uint64_t a1, uint64_t a2, const __CFData *a3, CFTypeRef cf, const void **a5)
{
  CFTypeID v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFData *Mutable;
  const __CFData *v17;
  const __CFData *v18;
  __CFData *v19;
  const __CFData *v20;
  CFIndex v21;
  const UInt8 *v22;
  CFIndex Length;
  UInt8 *MutableBytePtr;
  const void **v26;

  if (!cf || (v10 = CFGetTypeID(cf), v10 != CFDataGetTypeID()))
  {
    _PCSError(a5, 126, CFSTR("%s: associatedData argument not CFData"), "CFDataRef  _Nullable PCSKeyEnvelopeDecrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  if ((unint64_t)CFDataGetLength(a3) <= 0x1B)
  {
    Length = CFDataGetLength(a3);
    _PCSError(a5, 20, CFSTR("%s: encryptedData too short (length %u)"), "CFDataRef  _Nullable PCSKeyEnvelopeDecrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)", Length);
    return 0;
  }
  v17 = (const __CFData *)_PCSKEExtractSeed(a1, a2, a5, v11, v12, v13, v14, v15);
  if (!v17)
    return 0;
  v18 = v17;
  v19 = _PCSKEKeyFromSeed(v17, 68, (int)"com.apple.ProtectedCloudStorage.PCSKeyEnvelope.EncryptionKeyFromSeed", a5);
  if (v19)
  {
    v20 = v19;
    v21 = CFDataGetLength(a3) - 28;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v21);
    if (Mutable)
    {
      v26 = a5;
      v22 = CFDataGetBytePtr(a3) + 12;
      ccaes_gcm_decrypt_mode();
      CFDataGetLength(v20);
      CFDataGetBytePtr(v20);
      CFDataGetLength((CFDataRef)cf);
      CFDataGetBytePtr((CFDataRef)cf);
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      if (ccgcm_one_shot())
      {
        CFRelease(Mutable);
        _PCSError(v26, 149, CFSTR("%s: AES-GCM failed"), "CFDataRef  _Nullable PCSKeyEnvelopeDecrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)", MutableBytePtr, 16, v22);
        Mutable = 0;
      }
    }
    else
    {
      _PCSError(a5, 150, CFSTR("%s: could not allocate data"), "CFDataRef  _Nullable PCSKeyEnvelopeDecrypt(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    }
    CFRelease(v20);
  }
  else
  {
    Mutable = 0;
  }
  CFRelease(v18);
  return Mutable;
}

__CFData *PCSKeyEnvelopeAuthenticate(uint64_t a1, uint64_t a2, CFTypeRef cf, const void **a4)
{
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *v14;
  const __CFData *v15;
  __CFData *v16;
  const __CFData *v17;
  __CFData *Mutable;

  if (!cf || (v8 = CFGetTypeID(cf), v8 != CFDataGetTypeID()))
  {
    _PCSError(a4, 126, CFSTR("%s: data argument not CFData"), "CFDataRef  _Nonnull PCSKeyEnvelopeAuthenticate(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    return 0;
  }
  v14 = (const __CFData *)_PCSKEExtractSeed(a1, a2, a4, v9, v10, v11, v12, v13);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = _PCSKEKeyFromSeed(v14, 72, (int)"com.apple.ProtectedCloudStorage.PCSKeyEnvelope.AuthenticationKeyFromSeed", a4);
  if (v16)
  {
    v17 = v16;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, 32);
    if (Mutable)
    {
      ccsha256_di();
      CFDataGetLength(v17);
      CFDataGetBytePtr(v17);
      CFDataGetLength((CFDataRef)cf);
      CFDataGetBytePtr((CFDataRef)cf);
      CFDataGetMutableBytePtr(Mutable);
      cchmac();
    }
    else
    {
      _PCSError(a4, 150, CFSTR("%s: could not allocate the tag"), "CFDataRef  _Nonnull PCSKeyEnvelopeAuthenticate(PCSShareProtectionRef _Nonnull, PCSKeyEnvelopeRef _Nonnull, CFDataRef _Nonnull, CFErrorRef * _Nullable)");
    }
    CFRelease(v17);
  }
  else
  {
    Mutable = 0;
  }
  CFRelease(v15);
  return Mutable;
}

uint64_t PCSKeyEnvelopeVerify(uint64_t a1, uint64_t a2, const void *a3, CFTypeRef cf, const void **a5)
{
  __CFData *v6;
  __CFData *v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  v6 = PCSKeyEnvelopeAuthenticate(a1, a2, cf, a5);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CFEqual(v6, a3);
  v9 = (uint64_t *)MEMORY[0x1E0C9AE40];
  if (v8)
    v9 = (uint64_t *)MEMORY[0x1E0C9AE50];
  v10 = *v9;
  CFRelease(v7);
  return v10;
}

__CFData *_PCSKEExtractSeedWithMasterKey(const __CFData *a1, const __CFData *a2, void *a3, const __CFData *a4, const void **a5)
{
  id v9;
  __CFData *v10;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;

  v9 = a3;
  ccaes_siv_decrypt_mode();
  v10 = _PCSKEAesSivKeyFromMasterKey(a1, v9, a4, a5);

  if (!v10)
  {
    _PCSError(a5, 150, CFSTR("%s: could not allocate the decryption key"), "CFDataRef _PCSKEExtractSeedWithMasterKey(CFDataRef, CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
    return 0;
  }
  CFDataGetLength(a2);
  if (ccsiv_plaintext_size() != 32)
  {
    _PCSError(a5, 20, CFSTR("%s: ciphertext is too short to recover the key material"), "CFDataRef _PCSKEExtractSeedWithMasterKey(CFDataRef, CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
LABEL_11:
    Mutable = 0;
    goto LABEL_5;
  }
  Mutable = CFDataCreateMutable(0, 0);
  CFDataSetLength(Mutable, 32);
  if (!Mutable)
  {
    _PCSError(a5, 150, CFSTR("%s: could not allocate the seed"), "CFDataRef _PCSKEExtractSeedWithMasterKey(CFDataRef, CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)");
    goto LABEL_5;
  }
  CFDataGetLength(v10);
  CFDataGetBytePtr(v10);
  CFDataGetLength(a4);
  CFDataGetBytePtr(a4);
  CFDataGetLength(a2);
  CFDataGetBytePtr(a2);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  if (ccsiv_one_shot())
  {
    CFRelease(Mutable);
    _PCSError(a5, 13, CFSTR("%s: Unwrapping with AES-SIV failed"), "CFDataRef _PCSKEExtractSeedWithMasterKey(CFDataRef, CFDataRef, const NSString *__strong, CFDataRef, CFErrorRef *)", MutableBytePtr);
    goto LABEL_11;
  }
LABEL_5:
  CFRelease(v10);
  return Mutable;
}

uint64_t apply_block_2_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

BOOL PCSManateeShareInvitationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A954E200(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E404(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E4E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E63C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E708(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E88C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954E910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954EAD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954EC04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954ECDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954EE08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954F0C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954F1F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954F2B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A954F3F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL PCSManateePrivateKeyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t free_PCSTypeValue()
{
  return _asn1_free_top();
}

uint64_t decode_PCSAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSAttributes()
{
  return _asn1_encode();
}

uint64_t length_PCSAttributes()
{
  return _asn1_length();
}

uint64_t free_PCSAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_PCSAttributes()
{
  return _asn1_copy_top();
}

uint64_t add_PCSAttributes(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0x1FFCFC4FuLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t decode_PCSSignature()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSSignature()
{
  return _asn1_encode();
}

uint64_t length_PCSSignature()
{
  return _asn1_length();
}

uint64_t free_PCSSignature()
{
  return _asn1_free_top();
}

uint64_t copy_PCSSignature()
{
  return _asn1_copy_top();
}

uint64_t decode_PCSBuildAndTime()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSBuildAndTime()
{
  return _asn1_encode();
}

uint64_t length_PCSBuildAndTime()
{
  return _asn1_length();
}

uint64_t free_PCSBuildAndTime()
{
  return _asn1_free_top();
}

uint64_t decode_PCSMasterKeyIDs()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSMasterKeyIDs()
{
  return _asn1_encode();
}

uint64_t length_PCSMasterKeyIDs()
{
  return _asn1_length();
}

uint64_t free_PCSMasterKeyIDs()
{
  return _asn1_free_top();
}

uint64_t decode_PCSManateeCircleFingerPrint()
{
  return _asn1_decode_top();
}

uint64_t free_PCSManateeCircleFingerPrint()
{
  return _asn1_free_top();
}

uint64_t decode_PCSManateeFlags()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSManateeFlags()
{
  return _asn1_encode();
}

uint64_t length_PCSManateeFlags()
{
  return _asn1_length();
}

uint64_t free_PCSManateeFlags()
{
  return _asn1_free_top();
}

uint64_t encode_SignedAttributes()
{
  return _asn1_encode();
}

uint64_t length_SignedAttributes()
{
  return _asn1_length();
}

uint64_t decode_PCSPublicKeyInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSPublicKeyInfo()
{
  return _asn1_encode();
}

uint64_t length_PCSPublicKeyInfo()
{
  return _asn1_length();
}

uint64_t free_PCSPublicKeyInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PCSPublicKeyInfo()
{
  return _asn1_copy_top();
}

uint64_t decode_PCSUserPublicKeys()
{
  return _asn1_decode_top();
}

uint64_t free_PCSUserPublicKeys()
{
  return _asn1_free_top();
}

uint64_t decode_PCSPrivateKey()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSPrivateKey()
{
  return _asn1_encode();
}

uint64_t length_PCSPrivateKey()
{
  return _asn1_length();
}

uint64_t free_PCSPrivateKey()
{
  return _asn1_free_top();
}

uint64_t add_PCSPrivateKeys(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 24 * *a1 + 24, 0xA6356485uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t encode_PCSPrivateKeyProtoBuf()
{
  return _asn1_encode();
}

uint64_t length_PCSPrivateKeyProtoBuf()
{
  return _asn1_length();
}

uint64_t decode_PCSPrivateKeyV2()
{
  return _asn1_decode_top();
}

uint64_t free_PCSPrivateKeyV2()
{
  return _asn1_free_top();
}

uint64_t decode_PCSKeySet()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSKeySet()
{
  return _asn1_encode();
}

uint64_t length_PCSKeySet()
{
  return _asn1_length();
}

uint64_t free_PCSKeySet()
{
  return _asn1_free_top();
}

uint64_t decode_PCSBackupEscrow()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSBackupEscrow()
{
  return _asn1_encode();
}

uint64_t length_PCSBackupEscrow()
{
  return _asn1_length();
}

uint64_t free_PCSBackupEscrow()
{
  return _asn1_free_top();
}

uint64_t decode_PCSSPKey()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSSPKey()
{
  return _asn1_encode();
}

uint64_t length_PCSSPKey()
{
  return _asn1_length();
}

uint64_t free_PCSSPKey()
{
  return _asn1_free_top();
}

uint64_t decode_PCSSPKeyList()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSSPKeyList()
{
  return _asn1_encode();
}

uint64_t length_PCSSPKeyList()
{
  return _asn1_length();
}

uint64_t free_PCSSPKeyList()
{
  return _asn1_free_top();
}

uint64_t copy_PCSSPKeyList()
{
  return _asn1_copy_top();
}

uint64_t add_PCSSPKeyList(unsigned int *a1)
{
  void *v2;
  uint64_t result;

  v2 = malloc_type_realloc(*((void **)a1 + 1), 32 * *a1 + 32, 0xB8F3E3C4uLL);
  if (!v2)
    return 12;
  *((_QWORD *)a1 + 1) = v2;
  result = _asn1_copy_top();
  if (!(_DWORD)result)
    ++*a1;
  return result;
}

uint64_t decode_PCSEncryptedKeys()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSEncryptedKeys()
{
  return _asn1_encode();
}

uint64_t length_PCSEncryptedKeys()
{
  return _asn1_length();
}

uint64_t free_PCSEncryptedKeys()
{
  return _asn1_free_top();
}

uint64_t encode_PCSSignedShareProtection()
{
  return _asn1_encode();
}

uint64_t length_PCSSignedShareProtection()
{
  return _asn1_length();
}

uint64_t decode_PCSObjectSignature()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSObjectSignature()
{
  return _asn1_encode();
}

uint64_t length_PCSObjectSignature()
{
  return _asn1_length();
}

uint64_t free_PCSObjectSignature()
{
  return _asn1_free_top();
}

uint64_t decode_PCSShareProtection()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSShareProtection()
{
  return _asn1_encode();
}

uint64_t length_PCSShareProtection()
{
  return _asn1_length();
}

uint64_t free_PCSShareProtection()
{
  return _asn1_free_top();
}

uint64_t decode_PCSObjectChaining()
{
  return _asn1_decode_top();
}

uint64_t encode_PCSObjectChaining()
{
  return _asn1_encode();
}

uint64_t length_PCSObjectChaining()
{
  return _asn1_length();
}

uint64_t free_PCSObjectChaining()
{
  return _asn1_free_top();
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x1E0CBBAB8];
  v4 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], path);
  v5 = (task_port_t *)MEMORY[0x1E0C83DA0];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1E0C83DA0], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  input[2] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

void PEMStateInData_cold_1(const void *a1)
{
  if (a1)
    CFRelease(a1);
  abort();
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  PCSFPCopyUnwrappedKey_cold_1(v0);
}

void PCSFPCopyUnwrappedKey_cold_1()
{
  __assert_rtn("PCSFPCopyUnwrappedKey", "PCSEncryption.c", 85, "obytes == (size_t)CFDataGetLength(unwrappedKey)");
}

void PCSFPCopyWrappedKey_cold_1()
{
  __assert_rtn("PCSFPCopyWrappedKey", "PCSEncryption.c", 120, "obytes == (size_t)CFDataGetLength(wrappedKey)");
}

void _PCSKeyAllocateDiversizedKey_cold_1()
{
  __assert_rtn("_PCSKeyAllocateDiversizedKey", "CloudIdentity.m", 772, "key->flags.diversified");
}

void SetKeyID_cold_1()
{
  __assert_rtn("SetKeyID", "CloudIdentity.m", 1140, "key->keyid == NULL");
}

void PCSPublicIdentityGetService_cold_1()
{
  __assert_rtn("PCSPublicIdentityGetService", "CloudIdentity.m", 3448, "PCSPublicIdentityGetTypeID() == CFGetTypeID(si)");
}

void addNameService_cold_1()
{
  __assert_rtn("addNameService", "CloudIdentity.m", 4506, "serviceID");
}

void addNameService_cold_2()
{
  __assert_rtn("addNameService", "CloudIdentity.m", 4509, "serv");
}

void addPublicNameService_cold_1()
{
  __assert_rtn("addPublicNameService", "CloudIdentity.m", 4591, "serviceID");
}

void addPublicNameService_cold_2()
{
  __assert_rtn("addPublicNameService", "CloudIdentity.m", 4594, "serv");
}

void __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getUMUserManagerClass_block_invoke_cold_1(v0);
}

void __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  _CreateLightPCSObject_cold_1(v0);
}

void _CreateLightPCSObject_cold_1()
{
  __assert_rtn("_CreateLightPCSObject", "PCSShareProtection.m", 1568, "obytes == wrappedKeySize");
}

void deriveHKDF_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "CCDeriveKey failed: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void deriveHKDF_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "CCKDFParametersCreateHkdf failed: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void KeychainCopyCurrentIdentity_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get W state: %@", (uint8_t *)&v2, 0xCu);
}

void IsLocalStoringService_cold_1()
{
  __assert_rtn("IsLocalStoringService", "Migration.m", 690, "state.limitLocalStoring");
}

void __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint8_t *v0;
  uint64_t v1;
  _QWORD *v2;

  v0 = (uint8_t *)abort_report_np();
  PCSCacheCurrentIdentitiesForServices_cold_1(v0, v1, v2);
}

void PCSCacheCurrentIdentitiesForServices_cold_1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1A9508000, MEMORY[0x1E0C81028], (uint64_t)a3, "Unable to determine accessgroup and/or viewhint for service %@", a1);
}

void PCSCopyWrappedKey_cold_1()
{
  __assert_rtn("PCSCopyWrappedKey", "KeyWrapper.c", 43, "obytes == (size_t)CFDataGetLength(wrappedKey)");
}

void PCSCopyUnwrappedKey_cold_1()
{
  __assert_rtn("PCSCopyUnwrappedKey", "KeyWrapper.c", 74, "obytes == (size_t)CFDataGetLength(unwrappedKey)");
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1E0C80120]();
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1E0C80228]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1E0C80230]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
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

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
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

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
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

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x1E0C983D0](theData, range.location, range.length);
}

CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x1E0C983D8](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
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

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
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

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
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

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  MEMORY[0x1E0C98EF8](theString, formatOptions, format, arguments);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
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

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
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

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForDirectoryURL(CFAllocatorRef alloc, CFURLRef directoryURL, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1E0C99450](alloc, directoryURL, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1E0C99468](enumerator, url, error);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

uint64_t SecItemFetchCurrentItemAcrossAllDevices()
{
  return MEMORY[0x1E0CD62B0]();
}

uint64_t SecItemFetchCurrentItemOutOfBand()
{
  return MEMORY[0x1E0CD62B8]();
}

uint64_t SecItemFetchPCSIdentityOutOfBand()
{
  return MEMORY[0x1E0CD62C0]();
}

uint64_t SecItemSetCurrentItemAcrossAllDevices()
{
  return MEMORY[0x1E0CD62C8]();
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x1E0DE5870]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x1E0DE5878]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x1E0DE5880]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x1E0DE5888]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x1E0DE5890]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t asn1_abort()
{
  return MEMORY[0x1E0DE5898]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x1E0C81860]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C81870]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1E0C818A0]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1E0C818A8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t ccaes_siv_decrypt_mode()
{
  return MEMORY[0x1E0C818C0]();
}

uint64_t ccaes_siv_encrypt_mode()
{
  return MEMORY[0x1E0C818C8]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1E0C81A58]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1E0C81AA8]();
}

uint64_t ccder_encode_eckey()
{
  return MEMORY[0x1E0C81AD0]();
}

uint64_t ccder_encode_eckey_size()
{
  return MEMORY[0x1E0C81AD8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C81BD8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C81BE0]();
}

uint64_t ccec_compact_export()
{
  return MEMORY[0x1E0C81BF0]();
}

uint64_t ccec_compact_generate_key()
{
  return MEMORY[0x1E0C81C00]();
}

uint64_t ccec_compact_import_priv()
{
  return MEMORY[0x1E0C81C08]();
}

uint64_t ccec_compact_import_priv_size()
{
  return MEMORY[0x1E0C81C10]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1E0C81C18]();
}

uint64_t ccec_compact_import_pub_size()
{
  return MEMORY[0x1E0C81C20]();
}

uint64_t ccec_compact_transform_key()
{
  return MEMORY[0x1E0C81C28]();
}

uint64_t ccec_cp_192()
{
  return MEMORY[0x1E0C81C50]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1E0C81C58]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_curve_for_length_lookup()
{
  return MEMORY[0x1E0C81C78]();
}

uint64_t ccec_der_export_diversified_pub()
{
  return MEMORY[0x1E0C81C80]();
}

uint64_t ccec_der_export_diversified_pub_size()
{
  return MEMORY[0x1E0C81C88]();
}

uint64_t ccec_der_export_priv()
{
  return MEMORY[0x1E0C81C90]();
}

uint64_t ccec_der_export_priv_size()
{
  return MEMORY[0x1E0C81C98]();
}

uint64_t ccec_der_import_diversified_pub()
{
  return MEMORY[0x1E0C81CA0]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x1E0C81CA8]();
}

uint64_t ccec_der_import_priv_keytype()
{
  return MEMORY[0x1E0C81CB0]();
}

uint64_t ccec_diversify_min_entropy_len()
{
  return MEMORY[0x1E0C81CB8]();
}

uint64_t ccec_diversify_pub()
{
  return MEMORY[0x1E0C81CC8]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1E0C81CD8]();
}

uint64_t ccec_generate_key_deterministic()
{
  return MEMORY[0x1E0C81CF8]();
}

uint64_t ccec_generate_key_fips()
{
  return MEMORY[0x1E0C81D00]();
}

uint64_t ccec_generate_key_legacy()
{
  return MEMORY[0x1E0C81D08]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1E0C81D18]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C81D28]();
}

uint64_t ccec_pairwise_consistency_check()
{
  return MEMORY[0x1E0C81D38]();
}

uint64_t ccec_rfc6637_unwrap_key()
{
  return MEMORY[0x1E0C81D68]();
}

uint64_t ccec_rfc6637_wrap_key()
{
  return MEMORY[0x1E0C81D80]();
}

uint64_t ccec_rfc6637_wrap_key_diversified()
{
  return MEMORY[0x1E0C81D88]();
}

uint64_t ccec_rfc6637_wrap_key_size()
{
  return MEMORY[0x1E0C81D90]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1E0C81DA8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C81E00]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1E0C81E08]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1E0C81E10]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81E20]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1E0C81EC0]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1E0C81EC8]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C81ED0]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1E0C81EE8]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1E0C81EF8]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1E0C81F08]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C81F10]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1E0C82090]();
}

uint64_t cchmac()
{
  return MEMORY[0x1E0C820A8]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1E0C820B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1E0C820B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1E0C820C0]();
}

uint64_t ccn_cmp()
{
  return MEMORY[0x1E0C82210]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C82220]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1E0C82258]();
}

uint64_t ccnistkdf_ctr_hmac()
{
  return MEMORY[0x1E0C82278]();
}

uint64_t ccrng_pbkdf2_prng_init()
{
  return MEMORY[0x1E0C822B0]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t ccsiv_aad()
{
  return MEMORY[0x1E0C82400]();
}

uint64_t ccsiv_ciphertext_size()
{
  return MEMORY[0x1E0C82408]();
}

uint64_t ccsiv_crypt()
{
  return MEMORY[0x1E0C82410]();
}

uint64_t ccsiv_init()
{
  return MEMORY[0x1E0C82418]();
}

uint64_t ccsiv_one_shot()
{
  return MEMORY[0x1E0C82420]();
}

uint64_t ccsiv_plaintext_size()
{
  return MEMORY[0x1E0C82428]();
}

uint64_t ccsiv_set_nonce()
{
  return MEMORY[0x1E0C82430]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1E0C825A0]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1E0C825A8]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1E0C825B0]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1E0C825B8]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t der_copy_octet_string()
{
  return MEMORY[0x1E0DE58B0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int glob(const char *a1, int a2, int (__cdecl *a3)(const char *, int), glob_t *a4)
{
  return MEMORY[0x1E0C83848](a1, *(_QWORD *)&a2, a3, a4);
}

void globfree(glob_t *a1)
{
  MEMORY[0x1E0C83850](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
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

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1E0C84980]();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

