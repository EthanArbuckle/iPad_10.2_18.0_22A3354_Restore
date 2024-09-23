unint64_t IOReportStateGetResidency(const __CFDictionary *a1, int a2)
{
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  if (_getStateValues(a1, a2, &v3))
    return 0x8000000000000000;
  else
    return v4;
}

unint64_t IOReportStateGetInTransitions(const __CFDictionary *a1, int a2)
{
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  if (_getStateValues(a1, a2, v3))
    return 0x8000000000000000;
  else
    return *((_QWORD *)&v3[0] + 1);
}

__CFDictionary *IOReportCreateSamplesDelta(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCreateSamplesDelta_block_invoke;
  v4[3] = &__block_descriptor_tmp_2;
  v4[4] = a3;
  return compareAggregates(a1, a2, (uint64_t)v4);
}

__CFDictionary *compareAggregates(const __CFDictionary *a1, CFDictionaryRef theDict, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __CFDictionary *v10;

  v10 = 0;
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v4 = 0u;
  v5 = 0;
  v6 = a3;
  if (_iterate(theDict, a1, &v4, &v10))
    return 0;
  else
    return v10;
}

uint64_t IOReportIterate(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  v3 = a2;
  return _iterate(a1, 0, &v3, 0);
}

__CFDictionary *IOReportCreateSamples(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  __CFDictionary *SamplesRaw;
  const __CFData *v7;
  const __CFData *v8;

  if (a1 && a2)
  {
    if (_updateKernelBuffer(a1, a3)
      || (v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 32), *(_QWORD *)(a1 + 40), (CFAllocatorRef)*MEMORY[0x24BDBD258])) == 0)
    {
      SamplesRaw = 0;
      if (!a3)
        return SamplesRaw;
    }
    else
    {
      v8 = v7;
      SamplesRaw = IOReportCreateSamplesRaw(a2, v7, a3);
      CFRelease(v8);
      if (!a3)
        return SamplesRaw;
    }
  }
  else
  {
    if (!a3)
      return 0;
    SamplesRaw = 0;
    *a3 = createCFErr(-536870206, 0);
    if (!a3)
      return SamplesRaw;
  }
  if (!SamplesRaw)
  {
    if (!*a3)
    {
      SamplesRaw = 0;
      *a3 = createCFErr(-536870212, "unknown error");
      return SamplesRaw;
    }
    return 0;
  }
  return SamplesRaw;
}

uint64_t _updateKernelBuffer(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = IOConnectCallMethod(*(_DWORD *)(a1 + 16), 3u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  v4 = v3;
  if (a2 && (_DWORD)v3)
    *a2 = createCFErr((int)v3, "_updateKernelBuffer() failed");
  return v4;
}

__CFDictionary *IOReportCreateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, CFErrorRef *a3)
{
  __CFDictionary *v5;
  CFIndex v6;
  CFIndex Length;
  CFIndex v9;
  const UInt8 *BytePtr;
  uint64_t *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x4800000000;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = -536870206;
  if (!a1 || !theData)
  {
LABEL_5:
    if (!a3)
      goto LABEL_16;
    goto LABEL_13;
  }
  if (CFDataGetLength(theData) < 64)
  {
    v5 = 0;
    v6 = -536870206;
    goto LABEL_5;
  }
  Length = CFDataGetLength(theData);
  if (Length >= 0)
    v9 = Length;
  else
    v9 = Length + 63;
  BytePtr = CFDataGetBytePtr(theData);
  v11 = v15;
  v15[3] = (uint64_t)BytePtr;
  v11[4] = (uint64_t)&BytePtr[v9 & 0xFFFFFFFFFFFFFFC0];
  *((_DWORD *)v11 + 15) = 0;
  *((_DWORD *)v11 + 16) = 0;
  v11[5] = 0;
  v11[6] = 0;
  *((_BYTE *)v11 + 56) = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = __IOReportCreateSamplesRaw_block_invoke;
  v13[3] = &unk_24BF02188;
  v13[4] = &v14;
  v13[5] = a3;
  v5 = cloneAggregate(a1, (unint64_t)v13);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    IOReportIterateSamplesRaw_cold_1();
  v6 = -536870212;
  if (a3)
  {
LABEL_13:
    if (!v5 && !*a3)
      *a3 = createCFErr(v6, "couldn't create samples");
  }
LABEL_16:
  _Block_object_dispose(&v14, 8);
  return v5;
}

__CFDictionary *cloneAggregate(const __CFDictionary *a1, unint64_t a2)
{
  _OWORD v3[3];
  __int128 v4;
  uint64_t v5;
  __CFDictionary *v6;

  v6 = 0;
  v5 = 0;
  v3[2] = 0u;
  v4 = 0u;
  v3[0] = 0u;
  BYTE12(v4) = 1;
  v3[1] = a2;
  if ((_iterate(a1, 0, v3, &v6) & 1) != 0)
    return 0;
  else
    return v6;
}

const __CFString *IOReportChannelGetChannelName(const __CFDictionary *a1)
{
  const __CFString *Value;
  const void *ChDetail;
  const __CFString *v4;
  const void *v5;
  unint64_t v6;
  CFStringRef v7;
  CFStringRef v8;
  const __CFString *v9;

  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("ChannelName"));
  if (!Value)
  {
    ChDetail = _getChDetail(a1, 2u);
    v4 = (const __CFString *)_validateStr(ChDetail);
    if (v4)
    {
      Value = v4;
      CFDictionarySetValue(a1, CFSTR("ChannelName"), v4);
    }
    else
    {
      v5 = _getChDetail(a1, 0);
      v6 = _validateInt(v5);
      v7 = copyPrintableIDString(v6);
      v8 = v7;
      Value = CFSTR("<unknown>");
      if (v7)
        v9 = v7;
      else
        v9 = CFSTR("<unknown>");
      CFDictionarySetValue(a1, CFSTR("ChannelName"), v9);
      if (v8)
      {
        CFRelease(v8);
        return v8;
      }
    }
  }
  return Value;
}

const void *_validateStr(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

uint64_t _iterate(CFDictionaryRef theDict, const __CFDictionary *a2, _QWORD *a3, __CFDictionary **a4)
{
  unsigned int v8;
  unsigned int v9;
  __CFDictionary *Mutable;
  const __CFArray *v12;
  const __CFArray *v13;
  CFTypeID v14;
  const __CFArray *v15;
  const __CFArray *v16;
  CFTypeID v17;
  uint64_t Count;
  __CFArray *v19;
  CFIndex v20;
  const __CFDictionary *ChannelAtIndex;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  unint64_t v25;
  unint64_t v26;
  CFIndex v27;
  const __CFArray *v28;
  const __CFDictionary *v29;
  unint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  CFMutableDictionaryRef v35;
  unint64_t v36;
  CFIndex v37;
  const __CFArray *v38;
  unint64_t DriverID;
  unint64_t ChannelID;
  CFMutableArrayRef v41;
  const __CFArray *theArray;
  CFIndex v43;
  CFMutableDictionaryRef value;
  unint64_t v45;
  unint64_t v46;

  if (!theDict || !a2 && a3[3])
    goto LABEL_4;
  if (*((_OWORD *)a3 + 1) == 0)
  {
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
    {
LABEL_4:
      v8 = 0;
      v9 = 273;
      goto LABEL_5;
    }
  }
  v12 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("IOReportChannels"));
  if (v12)
  {
    v13 = v12;
    v14 = CFGetTypeID(v12);
    if (v14 != CFArrayGetTypeID())
    {
LABEL_17:
      v8 = 0;
LABEL_93:
      v9 = 273;
      goto LABEL_94;
    }
    if (a2)
    {
      v15 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("IOReportChannels"));
      if (!v15)
        goto LABEL_17;
      v16 = v15;
      v17 = CFGetTypeID(v15);
      if (v17 != CFArrayGetTypeID())
        goto LABEL_17;
    }
    else
    {
      v16 = 0;
    }
    theArray = v16;
    Count = CFArrayGetCount(v13);
    if (a3[2] || a3[3])
    {
      v19 = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
      if (!v19)
      {
        v9 = 273;
        v8 = 273;
        goto LABEL_94;
      }
    }
    else
    {
      v19 = 0;
    }
    if (Count >= 1)
    {
      v37 = 0;
      v38 = v13;
      v20 = 0;
      value = 0;
      v8 = 0;
      v41 = v19;
      while (1)
      {
        v43 = Count;
        ChannelAtIndex = (const __CFDictionary *)_getChannelAtIndex(v13, v20);
        if (!ChannelAtIndex)
        {
          v8 = 273;
          goto LABEL_85;
        }
        v22 = ChannelAtIndex;
        if (v19)
        {
          value = CFDictionaryCreateMutableCopy(0, 0, ChannelAtIndex);
          if (!value)
          {
            v35 = 0;
            v8 = 273;
            goto LABEL_86;
          }
        }
        v23 = theArray;
        if (theArray)
        {
          if (v20 >= CFArrayGetCount(theArray))
          {
            v23 = 0;
          }
          else
          {
            v45 = 0;
            v46 = 0;
            v24 = (const __CFDictionary *)_getChannelAtIndex(theArray, v20);
            if (!v24)
              goto LABEL_81;
            v23 = v24;
            if (getChannelType(v22, &v46))
              goto LABEL_81;
            ChannelID = IOReportChannelGetChannelID(v22);
            DriverID = IOReportChannelGetDriverID(v22);
            if (getChannelType(v23, &v45))
              goto LABEL_81;
            v25 = IOReportChannelGetChannelID(v23);
            v26 = IOReportChannelGetDriverID(v23);
            if (v45 != v46 || v25 != ChannelID || v26 != DriverID)
            {
              v36 = v26;
              v27 = v37;
              if (!v37)
                v27 = v20 + 1;
              v28 = theArray;
              v37 = v27;
              if (v27 < CFArrayGetCount(theArray))
              {
                while (1)
                {
                  v29 = (const __CFDictionary *)_getChannelAtIndex(v28, v27);
                  if (!v29)
                    break;
                  v23 = v29;
                  if (getChannelType(v29, &v45))
                    break;
                  v30 = IOReportChannelGetChannelID(v23);
                  if (v45 == v46 && v30 == ChannelID && v36 == DriverID)
                  {
                    v37 = v27 + 1;
                    goto LABEL_54;
                  }
                  ++v27;
                  v28 = theArray;
                  if (v27 >= CFArrayGetCount(theArray))
                    goto LABEL_53;
                }
LABEL_81:
                v8 = 273;
                v13 = v38;
LABEL_82:
                v19 = v41;
                goto LABEL_85;
              }
LABEL_53:
              v23 = 0;
            }
LABEL_54:
            v13 = v38;
          }
        }
        if (*a3)
          break;
        v33 = a3[1];
        if (!v33)
        {
          v34 = a3[2];
          if (v34)
          {
            v31 = (*(uint64_t (**)(uint64_t, const __CFDictionary *, CFMutableDictionaryRef))(v34 + 16))(v34, v22, value);
          }
          else
          {
            if (!a3[3])
              goto LABEL_98;
            if (!v23)
            {
              v19 = v41;
              if (!v41)
              {
                v32 = 0;
                goto LABEL_67;
              }
LABEL_62:
              CFArrayAppendValue(v19, value);
              v32 = 0;
LABEL_66:
              CFRelease(value);
              value = 0;
              goto LABEL_67;
            }
            if (cloneElements(value, v23, 1))
            {
LABEL_98:
              v8 = 273;
              goto LABEL_82;
            }
            v31 = (*(uint64_t (**)(void))(a3[3] + 16))();
          }
          goto LABEL_58;
        }
        v32 = (*(uint64_t (**)(uint64_t, const __CFDictionary *))(v33 + 16))(v33, v22);
        if (v32 == 16)
        {
          CFArrayRemoveValueAtIndex(v13, v20--);
          --v43;
          v19 = v41;
          if (v41)
            goto LABEL_66;
          goto LABEL_67;
        }
LABEL_59:
        v19 = v41;
        if ((v32 & 1) != 0)
        {
          v8 = v32;
          goto LABEL_85;
        }
        if (v41)
        {
          if (!v32)
            goto LABEL_62;
          goto LABEL_66;
        }
LABEL_67:
        v8 |= v32;
        ++v20;
        Count = v43;
        if (v20 >= v43)
          goto LABEL_79;
      }
      v31 = (*(uint64_t (**)(_QWORD, const __CFDictionary *))(*a3 + 16))(*a3, v22);
LABEL_58:
      v32 = v31;
      goto LABEL_59;
    }
    v8 = 0;
    value = 0;
LABEL_79:
    if (Mutable)
      CFDictionarySetValue(Mutable, CFSTR("IOReportChannels"), v19);
LABEL_85:
    v35 = value;
    if (v19)
LABEL_86:
      CFRelease(v19);
    if (v35)
      CFRelease(v35);
    if ((v8 & 1) != 0)
      goto LABEL_93;
    if (a3[1] && !CFArrayGetCount(v13))
      CFDictionaryRemoveValue(theDict, CFSTR("IOReportChannels"));
  }
  else
  {
    v8 = 0;
  }
  v8 |= _iterSubDictsForKey(theDict, CFSTR("IOReportDrivers"), Mutable, a2, (uint64_t)a3);
  if ((v8 & 1) != 0)
    goto LABEL_93;
  v8 |= _iterSubDictsForKey(theDict, CFSTR("IOReportChannelGroups"), Mutable, a2, (uint64_t)a3);
  if ((v8 & 1) != 0)
    goto LABEL_93;
  if (!Mutable)
  {
    v9 = v8;
    goto LABEL_5;
  }
  if (!a4)
    goto LABEL_93;
  *a4 = Mutable;
  v9 = v8;
LABEL_94:
  if (Mutable && (v9 & 1) != 0)
    CFRelease(Mutable);
LABEL_5:
  if ((v8 & 1) != 0)
    return v8;
  else
    return v9;
}

uint64_t getChannelType(const __CFDictionary *a1, unint64_t *a2)
{
  const void *ChDetail;
  unint64_t v4;
  uint64_t result;
  unint64_t v6;

  ChDetail = _getChDetail(a1, 1u);
  v4 = _validateInt(ChDetail);
  if (v4 == 0x8000000000000000)
    return 3758097084;
  v6 = v4;
  result = 0;
  *a2 = v6;
  return result;
}

unint64_t _validateInt(const void *a1)
{
  CFTypeID v2;
  unint64_t v3;
  uint64_t valuePtr;

  if (!a1)
    return 0x8000000000000000;
  v2 = CFGetTypeID(a1);
  v3 = 0x8000000000000000;
  if (v2 == CFNumberGetTypeID())
  {
    valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
      return valuePtr;
  }
  return v3;
}

const void *_getChDetail(const __CFDictionary *a1, unsigned int a2)
{
  const __CFArray *Value;
  const __CFArray *v4;
  CFTypeID v5;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("LegendChannel"));
  if (Value && (v4 = Value, v5 = CFGetTypeID(Value), v5 == CFArrayGetTypeID()) && CFArrayGetCount(v4) > a2)
    return CFArrayGetValueAtIndex(v4, a2);
  else
    return 0;
}

const void *_getChannelAtIndex(const __CFArray *a1, CFIndex a2)
{
  const void *ValueAtIndex;
  CFTypeID v5;

  if (CFArrayGetCount(a1) <= a2)
    return 0;
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  v5 = CFGetTypeID(ValueAtIndex);
  if (v5 == CFDictionaryGetTypeID())
    return ValueAtIndex;
  else
    return 0;
}

unint64_t IOReportChannelGetChannelID(const __CFDictionary *a1)
{
  const void *ChDetail;

  ChDetail = _getChDetail(a1, 0);
  return _validateInt(ChDetail);
}

unint64_t IOReportChannelGetDriverID(const __CFDictionary *a1)
{
  const void *Value;

  Value = CFDictionaryGetValue(a1, CFSTR("DriverID"));
  return _validateInt(Value);
}

uint64_t cloneElements(__CFDictionary *a1, CFDictionaryRef theDict, char a3)
{
  uint64_t v3;
  const __CFData *Value;
  CFMutableDataRef MutableCopy;
  CFMutableDataRef v8;
  int Format;
  UInt8 *RawElements;
  UInt8 *v11;
  UInt8 *v12;
  unint64_t v14;
  unsigned __int16 v15;

  v3 = 3758097084;
  v14 = 0x8000000000000000;
  if (a1)
  {
    if (theDict)
    {
      Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("RawElements"));
      if (Value)
      {
        MutableCopy = CFDataCreateMutableCopy(0, 0, Value);
        if (MutableCopy)
        {
          v8 = MutableCopy;
          v15 = 0;
          CFDictionarySetValue(a1, CFSTR("RawElements"), MutableCopy);
          v3 = 0;
          if ((a3 & 1) != 0)
          {
            Format = IOReportChannelGetFormat(a1);
            RawElements = getRawElements(a1, &v15, Format);
            v3 = 3758097084;
            if (RawElements)
            {
              if (v15)
              {
                v11 = RawElements;
                v12 = &RawElements[64 * (unint64_t)v15];
                do
                {
                  memset_pattern8(v11 + 32, &v14, 0x20uLL);
                  v11 += 64;
                }
                while (v11 < v12);
              }
              v3 = 0;
            }
          }
          CFRelease(v8);
        }
      }
    }
  }
  return v3;
}

uint64_t _compareSamples(const __CFDictionary *a1, const __CFDictionary *a2, const __CFDictionary *a3, CFErrorRef *a4)
{
  uint64_t v8;
  int Format;
  int v10;
  const char *v11;
  uint64_t v12;
  unint64_t IntegerValue;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  UInt8 *RawElements;
  UInt8 *v18;
  UInt8 *v19;
  int v20;
  UInt8 *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  UInt8 *v26;
  UInt8 *v27;
  int v28;
  UInt8 *v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  UInt8 *v34;
  UInt8 *v35;
  UInt8 *v36;
  int v37;
  unint64_t v38;
  char *v39;
  uint64_t i;
  unint64_t ValueAtIndex;
  unint64_t v42;
  unint64_t v43;
  unsigned __int16 v45;
  __int128 v46;
  __int128 v47;
  unsigned __int16 v48;

  v8 = 3758097084;
  Format = IOReportChannelGetFormat(a1);
  v10 = IOReportChannelGetFormat(a2);
  v11 = 0;
  v12 = 3758097090;
  if (Format && v10)
  {
    if (Format == v10)
    {
      switch(Format)
      {
        case 1:
          IntegerValue = IOReportSimpleGetIntegerValue(a1, 0);
          if (IntegerValue != 0x8000000000000000)
          {
            v14 = IntegerValue;
            v15 = IOReportSimpleGetIntegerValue(a2, 0);
            if (v15 != 0x8000000000000000)
            {
              v16 = v15;
              LOWORD(v46) = 0;
              RawElements = getRawElements(a3, &v46, 1);
              if (RawElements)
              {
                if ((unsigned __int16)v46 == 1)
                {
                  v8 = 0;
                  *((_QWORD *)RawElements + 4) = v16 - v14;
                }
              }
            }
          }
          v11 = 0;
          v12 = v8;
          goto LABEL_64;
        case 2:
          v48 = 0;
          v45 = 0;
          v18 = getRawElements(a3, &v48, 2);
          if (!v18)
            goto LABEL_62;
          v19 = v18;
          v20 = v48;
          if (IOReportStateGetCount(a3) != v20)
            goto LABEL_62;
          v21 = getRawElements(a2, &v45, 2);
          if (!v21 || v45 != v48)
            goto LABEL_62;
          memcpy(v19, v21, (unint64_t)v45 << 6);
          if (!v48)
            goto LABEL_61;
          v22 = 0;
          v23 = v19 + 48;
          do
          {
            v46 = 0u;
            v47 = 0u;
            v12 = 1;
            if (_getStateValues(a1, v22, &v46))
              break;
            v24 = *((_QWORD *)&v46 + 1);
            if (*((_QWORD *)&v46 + 1) == 0x8000000000000000)
              break;
            v46 = 0u;
            v47 = 0u;
            v12 = 1;
            if (_getStateValues(a2, v22, &v46))
              break;
            if (*((_QWORD *)&v46 + 1) == 0x8000000000000000)
              break;
            *(v23 - 1) = *((_QWORD *)&v46 + 1) - v24;
            v46 = 0u;
            v47 = 0u;
            v12 = 1;
            if (_getStateValues(a1, v22, &v46))
              break;
            v25 = v47;
            if ((_QWORD)v47 == 0x8000000000000000)
              break;
            v46 = 0u;
            v47 = 0u;
            v12 = 1;
            if (_getStateValues(a2, v22, &v46))
              break;
            if ((_QWORD)v47 == 0x8000000000000000)
              break;
            v12 = 0;
            *v23 = v47 - v25;
            v23 += 8;
            ++v22;
          }
          while (v22 < v48);
          goto LABEL_63;
        case 3:
          v48 = 0;
          v45 = 0;
          v26 = getRawElements(a3, &v48, 3);
          if (!v26)
            goto LABEL_62;
          v27 = v26;
          v28 = v48;
          if (IOReportHistogramGetBucketCount(a3) != v28)
            goto LABEL_62;
          v29 = getRawElements(a2, &v45, 3);
          if (!v29 || v45 != v48)
            goto LABEL_62;
          memcpy(v27, v29, (unint64_t)v45 << 6);
          if (!v48)
            goto LABEL_61;
          v30 = 0;
          v31 = v27 + 56;
          break;
        case 4:
          LOWORD(v46) = 0;
          v48 = 0;
          v34 = getRawElements(a3, &v46, 4);
          if (v34 && (v35 = v34, (v36 = getRawElements(a2, &v48, 4)) != 0) && v48 == (unsigned __int16)v46)
          {
            memcpy(v35, v36, (unint64_t)v48 << 6);
            if ((_WORD)v46)
            {
              v37 = 0;
              v38 = 0;
              v39 = (char *)(v35 + 32);
              do
              {
                for (i = 0; i != 4; ++i)
                {
                  ValueAtIndex = IOReportArrayGetValueAtIndex(a1, v37 + (int)i);
                  v42 = IOReportArrayGetValueAtIndex(a2, v37 + (int)i);
                  v43 = v42 - ValueAtIndex;
                  if (v42 == 0x8000000000000000)
                    v43 = ValueAtIndex;
                  if (ValueAtIndex == 0x8000000000000000)
                    v43 = v42;
                  *(_QWORD *)&v39[8 * i] = v43;
                }
                ++v38;
                v39 += 64;
                v37 += 4;
              }
              while (v38 < (unsigned __int16)v46);
            }
LABEL_61:
            v12 = 0;
          }
          else
          {
LABEL_62:
            v12 = 1;
          }
          goto LABEL_63;
        default:
          v12 = 3758097126;
          v11 = "unknown report format";
          goto LABEL_64;
      }
      do
      {
        v46 = 0u;
        v47 = 0u;
        v12 = 1;
        if (_getHistogramValues(a1, v30, &v46))
          break;
        v32 = v46;
        if ((_QWORD)v46 == 0x8000000000000000)
          break;
        v46 = 0u;
        v47 = 0u;
        v12 = 1;
        if (_getHistogramValues(a2, v30, &v46) || (_QWORD)v46 == 0x8000000000000000)
          break;
        v33 = v46 - v32;
        *(v31 - 3) = v46 - v32;
        if (v33)
        {
          v46 = 0u;
          v47 = 0u;
          v12 = 1;
          if (_getHistogramValues(a2, v30, &v46) || *((_QWORD *)&v47 + 1) == 0x8000000000000000)
            break;
          *v31 = *((_QWORD *)&v47 + 1);
          if (v32)
          {
            v46 = 0u;
            v47 = 0u;
            v12 = 1;
            if (_getHistogramValues(a1, v30, &v46) || *((_QWORD *)&v47 + 1) == 0x8000000000000000)
              break;
            *v31 -= *((_QWORD *)&v47 + 1);
          }
        }
        else
        {
          *v31 = 0x8000000000000000;
        }
        v12 = 0;
        ++v30;
        v31 += 8;
      }
      while (v30 < v48);
LABEL_63:
      v11 = 0;
    }
    else
    {
      v12 = 3758097090;
      v11 = "mismatched formats";
    }
  }
LABEL_64:
  if (a4 && (_DWORD)v12)
    *a4 = createCFErr((int)v12, v11);
  return v12;
}

uint64_t IOReportChannelGetFormat(const __CFDictionary *a1)
{
  int ChannelType;
  unsigned __int8 v2;
  unint64_t v4;

  v4 = 0;
  ChannelType = getChannelType(a1, &v4);
  v2 = v4;
  if (ChannelType)
    return 0;
  return v2;
}

unint64_t IOReportSimpleGetIntegerValue(const __CFDictionary *a1, unint64_t *a2)
{
  UInt8 *RawElements;
  unint64_t v5;
  __int16 v7;

  v7 = 0;
  if (!a1)
    return 0x8000000000000000;
  RawElements = getRawElements(a1, &v7, 1);
  v5 = 0x8000000000000000;
  if (RawElements)
  {
    if (v7 == 1 && RawElements[16] == 1)
    {
      v5 = *((_QWORD *)RawElements + 4);
      if (a2)
        *a2 = IOReportChannelGetUnit(a1);
    }
  }
  return v5;
}

UInt8 *getRawElements(const __CFDictionary *a1, _WORD *a2, int a3)
{
  UInt8 *v3;
  const __CFData *Value;
  const __CFData *v7;
  CFTypeID v8;
  UInt8 *MutableBytePtr;

  v3 = 0;
  if (a1 && a2)
  {
    Value = (const __CFData *)CFDictionaryGetValue(a1, CFSTR("RawElements"));
    if (Value
      && (v7 = Value, v8 = CFGetTypeID(Value), v8 == CFDataGetTypeID())
      && (unint64_t)CFDataGetLength(v7) >= 0x40
      && (MutableBytePtr = CFDataGetMutableBytePtr(v7), MutableBytePtr[16] == a3))
    {
      v3 = MutableBytePtr;
      *a2 = (unint64_t)CFDataGetLength(v7) >> 6;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t _visitSample(const __CFDictionary *a1, const __CFDictionary *a2, int a3, unint64_t *a4, CFErrorRef *a5)
{
  unint64_t DriverID;
  unint64_t ChannelID;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t result;
  __CFData *Mutable;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  DriverID = IOReportChannelGetDriverID(a1);
  ChannelID = IOReportChannelGetChannelID(a1);
  v12 = a4[2];
  if (!v12)
  {
    v12 = *a4;
    a4[2] = *a4;
  }
  a4[3] = v12;
  *((_BYTE *)a4 + 32) = 0;
  ++*((_DWORD *)a4 + 10);
  v13 = a4[1];
  if (v12 >= v13)
    return 16;
  v14 = 0;
  v15 = *((_DWORD *)a4 + 9);
  while (1)
  {
    v16 = *(unsigned __int16 *)(v12 + 20);
    if (*(_WORD *)(v12 + 20))
    {
      if (*(_QWORD *)v12 == DriverID && *(_QWORD *)(v12 + 8) == ChannelID)
        break;
    }
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = *(unsigned __int16 *)(v12 + 20);
    v12 += v17 << 6;
    a4[2] = v12;
    if (v12 == v13)
    {
      v12 = *a4;
      a4[2] = *a4;
      v14 = 1;
      *((_BYTE *)a4 + 32) = 1;
      v18 = a4 + 3;
    }
    else if (v14)
    {
      v18 = a4 + 3;
    }
    else
    {
      v18 = a4 + 1;
    }
    ++v15;
    if (v12 >= *v18)
    {
      *((_DWORD *)a4 + 9) = v15;
      return 16;
    }
  }
  *((_DWORD *)a4 + 9) = v15 + 1;
  if (!IOReportChannelGetFormat(a1))
    setChannelType(a2, (const void *)(v12 + 16));
  if (v12 + (v16 << 6) > a4[1])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      _visitSample_cold_1(a1);
      if (a5)
      {
LABEL_25:
        if (!*a5)
          *a5 = createCFErr(-536870212, "absurd element count");
      }
    }
    else if (a5)
    {
      goto LABEL_25;
    }
    a4[2] = 0;
    return 273;
  }
  if (a3)
  {
    Mutable = CFDataCreateMutable(0, v16 << 6);
    CFDataAppendBytes(Mutable, (const UInt8 *)v12, v16 << 6);
  }
  else
  {
    Mutable = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v12, v16 << 6, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  }
  CFDictionarySetValue(a2, CFSTR("RawElements"), Mutable);
  CFRelease(Mutable);
  v22 = a4[1];
  v21 = a4[2];
  if (*(unsigned __int16 *)(v21 + 20) <= 1u)
    v23 = 1;
  else
    v23 = *(unsigned __int16 *)(v21 + 20);
  v24 = v21 + (v23 << 6);
  a4[2] = v24;
  result = 0;
  if (v24 == v22)
  {
    a4[2] = *a4;
    *((_BYTE *)a4 + 32) = 1;
  }
  return result;
}

uint64_t _iterSubDictsForKey(CFDictionaryRef theDict, void *key, __CFDictionary *a3, const __CFDictionary *a4, uint64_t a5)
{
  uint64_t v10;
  __int128 v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  CFTypeID v14;
  CFIndex v15;
  int v16;
  uint64_t v17;
  CFArrayRef v18;
  CFIndex Count;
  unint64_t v20;
  const void *ValueAtIndex;
  _OWORD v23[2];
  CFArrayRef theArray;
  void *value;
  __int128 v26;
  uint64_t v27;

  v26 = *(_OWORD *)(a5 + 48);
  v10 = *(_QWORD *)(a5 + 64);
  v11 = *(_OWORD *)(a5 + 16);
  v23[0] = *(_OWORD *)a5;
  v23[1] = v11;
  theArray = 0;
  value = 0;
  v27 = v10;
  *(_QWORD *)&v26 = 0;
  LODWORD(v27) = *(_DWORD *)(a5 + 64) + 2;
  if (*(_BYTE *)(a5 + 60))
    DWORD2(v26) = 0;
  v12 = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
  if (v12)
  {
    v13 = v12;
    v14 = CFGetTypeID(v12);
    if (v14 == CFDictionaryGetTypeID()
      && (!a3 || (value = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
      && (!a4 || (*(_QWORD *)&v26 = CFDictionaryGetValue(a4, key), (_QWORD)v26))
      && (!*(_QWORD *)(a5 + 8)
       || (v15 = CFDictionaryGetCount(v13), (theArray = CFArrayCreateMutable(0, v15, MEMORY[0x24BDBD690])) != 0)))
    {
      if (*(_BYTE *)(a5 + 60))
        v16 = 0;
      else
        v16 = 273;
      DWORD2(v26) = v16;
      CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_iterSubDicts, v23);
      v17 = DWORD2(v26);
      v18 = theArray;
      if ((BYTE8(v26) & 1) == 0)
      {
        if (theArray)
        {
          Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            v20 = Count + 1;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex(theArray, v20 - 2);
              CFDictionaryRemoveValue(v13, ValueAtIndex);
              --v20;
            }
            while (v20 > 1);
          }
        }
        if (a3)
        {
          CFDictionarySetValue(a3, key, value);
        }
        else if (*(_QWORD *)(a5 + 8) && !CFDictionaryGetCount(v13))
        {
          CFDictionaryRemoveValue(theDict, key);
        }
        v17 = DWORD2(v26);
        v18 = theArray;
      }
      if (v18)
        CFRelease(v18);
    }
    else
    {
      v17 = 273;
    }
  }
  else
  {
    v17 = 0;
  }
  if (value)
    CFRelease(value);
  return v17;
}

uint64_t _getStateValues(const __CFDictionary *a1, int a2, _OWORD *a3)
{
  uint64_t v3;
  UInt8 *RawElements;
  UInt8 *v8;
  int v9;
  UInt8 *v10;
  __int128 v11;
  unsigned __int16 v13;
  unint64_t v14;

  v3 = 3758097084;
  v13 = 0;
  if (a1)
  {
    RawElements = getRawElements(a1, &v13, 2);
    if (RawElements)
    {
      v8 = RawElements;
      v9 = v13;
      v14 = 0;
      if (!getChannelType(a1, &v14)
        && v14 == 2
        && (a2 & 0x80000000) == 0
        && WORD2(v14) == v9
        && v13 >= a2)
      {
        v3 = 0;
        v10 = &v8[64 * (unint64_t)a2];
        v11 = *((_OWORD *)v10 + 3);
        *a3 = *((_OWORD *)v10 + 2);
        a3[1] = v11;
      }
    }
  }
  return v3;
}

unint64_t IOReportArrayGetValueAtIndex(const __CFDictionary *a1, unsigned int a2)
{
  UInt8 *RawElements;
  uint64_t v4;
  UInt8 *v5;
  __int128 v6;
  _OWORD v8[2];
  unsigned __int16 v9;

  if ((a2 & 0x80000000) != 0)
    return 0x8000000000000000;
  v9 = 0;
  if (!a1)
    return 0x8000000000000000;
  RawElements = getRawElements(a1, &v9, 4);
  if (!RawElements)
    return 0x8000000000000000;
  v4 = a2 >> 2;
  if (v4 >= v9)
    return 0x8000000000000000;
  v5 = &RawElements[64 * v4];
  v6 = *((_OWORD *)v5 + 3);
  v8[0] = *((_OWORD *)v5 + 2);
  v8[1] = v6;
  return *((_QWORD *)v8 + (a2 & 3));
}

uint64_t IOReportStateGetCount(const __CFDictionary *a1)
{
  int ChannelType;
  uint64_t result;
  unint64_t v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = 0;
  ChannelType = getChannelType(a1, &v3);
  result = 0xFFFFFFFFLL;
  if (!ChannelType && v3 == 2)
    return WORD2(v3);
  return result;
}

CFErrorRef createCFErr(CFIndex a1, const char *a2)
{
  void *v3;
  CFIndex v4;
  CFErrorRef v5;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDBD3A8];
  userInfoValues = 0;
  userInfoKeys[0] = v3;
  if (a2)
  {
    userInfoValues = (void *)CFStringCreateWithCString(0, a2, 0x600u);
    if (!userInfoValues)
      return 0;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = CFErrorCreateWithUserInfoKeysAndValues(0, (CFErrorDomain)*MEMORY[0x24BDBD380], a1, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, v4);
  if (userInfoValues)
    CFRelease(userInfoValues);
  return v5;
}

void iorErrLog(int a1, const __CFString *a2, CFErrorRef err)
{
  const __CFString *v4;
  CFStringRef v5;
  CFStringRef v6;
  CFStringRef v7;

  if (a1 < 0)
  {
    if (a2)
      v4 = a2;
    else
      v4 = CFSTR("<unknown> function");
    if (!err)
    {
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@: %s"), v4, "<unknown> error");
      goto LABEL_12;
    }
    v5 = CFErrorCopyFailureReason(err);
    if (v5)
    {
      v6 = v5;
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@: %@"), v4, v5);
    }
    else
    {
      v6 = CFErrorCopyDescription(err);
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@: %@"), v4, v6);
      if (!v6)
        goto LABEL_12;
    }
    CFRelease(v6);
LABEL_12:
    if (v7)
    {
      CFShow(v7);
      CFRelease(v7);
    }
  }
}

CFStringRef copyPrintableIDString(unint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char cStr[8];
  char v10;
  uint64_t v11;

  v2 = 0;
  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  *(_QWORD *)cStr = 0;
  v3 = 8;
  v4 = MEMORY[0x24BDAC740];
LABEL_2:
  v5 = 8 * v3 - 8;
  while (v3 >= 1)
  {
    --v3;
    v6 = a1 >> (v5 & 0xF8);
    v5 -= 8;
    if ((_BYTE)v6)
    {
      v7 = v6;
      if ((char)v6 < 0)
      {
        if (!__maskrune((char)v6, 0x40000uLL))
          return 0;
      }
      else if ((*(_DWORD *)(v4 + 4 * (char)v6 + 60) & 0x40000) == 0)
      {
        return 0;
      }
      cStr[v2++] = v7;
      goto LABEL_2;
    }
  }
  if ((_DWORD)v2 && (cStr[v2] = 0, !v3))
    return CFStringCreateWithCString(0, cStr, 0x8000100u);
  else
    return 0;
}

uint64_t IOReportGetChannelCount(const __CFDictionary *a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __IOReportGetChannelCount_block_invoke;
  v3[3] = &unk_24BF020D8;
  v3[4] = &v4;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8 = v3;
  if (_iterate(a1, 0, &v8, 0))
    v1 = 0xFFFFFFFFLL;
  else
    v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t IOReportPrune(const __CFDictionary *a1, uint64_t a2)
{
  _QWORD v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  v3[0] = 0;
  v4 = 0u;
  v3[1] = a2;
  return _iterate(a1, 0, v3, 0);
}

uint64_t updateAggregate(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  v3 = a2;
  return _iterate(a1, 0, &v3, 0);
}

void _iterSubDicts(CFTypeRef cf, const void *a2, uint64_t a3)
{
  CFTypeID v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  uint64_t v9;
  int v10;
  __CFDictionary *v11;

  if (!*(_BYTE *)(a3 + 60) || (*(_BYTE *)(a3 + 56) & 1) == 0)
  {
    if (cf)
    {
      if (a2)
      {
        v6 = CFGetTypeID(cf);
        if (v6 == CFStringGetTypeID())
        {
          v7 = CFGetTypeID(a2);
          if (v7 == CFDictionaryGetTypeID())
          {
            v8 = *(const __CFDictionary **)(a3 + 48);
            if (v8)
              CFDictionaryGetValue(v8, cf);
            v9 = *(_QWORD *)(a3 + 40);
            v10 = _iterate((CFDictionaryRef)a2);
            if (*(_BYTE *)(a3 + 60))
              v10 |= *(_DWORD *)(a3 + 56);
            *(_DWORD *)(a3 + 56) = v10;
            if ((v10 & 1) == 0)
            {
              if (v9)
              {
                *(_DWORD *)(a3 + 56) = 273;
              }
              else
              {
                v11 = *(__CFDictionary **)(a3 + 40);
                if (v11)
                {
                  CFDictionarySetValue(v11, cf, 0);
                }
                else if (*(_QWORD *)(a3 + 32))
                {
                  if (!CFDictionaryGetCount((CFDictionaryRef)a2))
                    CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 32), cf);
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t IOReportCreateSubscription(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, uint64_t a4, CFErrorRef *a5)
{
  unsigned int v6;
  void *v7;
  kern_return_t v8;
  const char *v9;
  unsigned int ChannelCount;
  size_t v13;
  _DWORD *v14;
  uint64_t Instance;
  uint64_t v16;
  const __CFDictionary *v17;
  io_service_t MatchingService;
  io_object_t v19;
  unsigned int *v20;
  io_connect_t v21;
  const char *v22;
  uint64_t result;
  kern_return_t v24;
  kern_return_t v25;
  uint32_t outputCnt;
  io_connect_t connect[2];
  uint64_t v28;
  uint64_t (*v29)(uint64_t, const __CFDictionary *);
  void *v30;
  uint64_t *v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  LOBYTE(v6) = 0;
  v7 = 0;
  outputCnt = 1;
  v8 = -536870206;
  v9 = "bad arguments";
  if (a2 && a3)
  {
    ChannelCount = IOReportGetChannelCount(a2);
    v8 = -536870206;
    if ((ChannelCount & 0x80000000) != 0)
    {
      v7 = 0;
      LOBYTE(v6) = 0;
      v9 = "iteration error";
      goto LABEL_20;
    }
    v6 = ChannelCount;
    if (!ChannelCount)
    {
      v7 = 0;
      v9 = "no channels";
      goto LABEL_20;
    }
    v8 = -536870211;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2000000000;
    v36 = 0;
    if (ChannelCount <= 0x555554D)
    {
      v13 = 24 * ChannelCount + 8;
      v14 = malloc_type_malloc(v13, 0xB42E60BFuLL);
      if (v14)
      {
        v7 = v14;
        *v14 = v6;
        *(_QWORD *)connect = MEMORY[0x24BDAC760];
        v28 = 0x40000000;
        v29 = ___createInterestList_block_invoke;
        v30 = &unk_24BF021D8;
        v31 = &v33;
        v32 = v14;
        if (!IOReportIterate(a2, (uint64_t)connect) && *((_DWORD *)v34 + 6) == v6)
        {
          _Block_object_dispose(&v33, 8);
          if (IOReportCreateSubscription_cfOnce != -1)
            dispatch_once(&IOReportCreateSubscription_cfOnce, &__block_literal_global);
          Instance = _CFRuntimeCreateInstance();
          if (!Instance)
          {
            LOBYTE(v6) = 0;
            v9 = 0;
            goto LABEL_20;
          }
          v16 = Instance;
          connect[0] = 0;
          v17 = IOServiceMatching("IOReportHub");
          if (v17)
          {
            MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v17);
            v19 = MatchingService;
            if (MatchingService)
            {
              v20 = (unsigned int *)MEMORY[0x24BDAEC58];
              v8 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, connect);
              v21 = connect[0];
              if (v8)
              {
                v22 = "Could not open IOReportHub";
              }
              else
              {
                v8 = IOConnectCallScalarMethod(connect[0], 0, 0, 0, 0, 0);
                v21 = connect[0];
                if (!v8)
                {
                  *(_DWORD *)(v16 + 16) = connect[0];
                  IOObjectRelease(v19);
                  v24 = IOConnectCallMethod(*(_DWORD *)(v16 + 16), 2u, 0, 0, v7, v13, (uint64_t *)(v16 + 24), &outputCnt, 0, 0);
                  if (v24)
                  {
                    v8 = v24;
                    LOBYTE(v6) = 0;
                    v9 = "kIOReportUserClientConfigureInterests failed";
                  }
                  else
                  {
                    v25 = MEMORY[0x20BCF2AC4](*(unsigned int *)(v16 + 16), *(unsigned int *)(v16 + 24), *v20, v16 + 32, v16 + 40, 1);
                    if (!v25)
                    {
                      *a3 = cloneAggregate(a2, (unint64_t)&__block_literal_global_9);
LABEL_24:
                      free(v7);
                      return v16;
                    }
                    v8 = v25;
                    LOBYTE(v6) = 0;
                    v9 = "IOConnectMapMemory() failed";
                  }
                  goto LABEL_38;
                }
                v22 = "kIOReportUserClientOpen failed";
              }
              if (v21)
                IOServiceClose(v21);
            }
            else
            {
              v22 = 0;
              v8 = -536870160;
            }
          }
          else
          {
            v19 = 0;
            v22 = 0;
          }
          if (a5)
            *a5 = createCFErr(v8, v22);
          if (v19)
            IOObjectRelease(v19);
          v9 = 0;
          LOBYTE(v6) = 1;
LABEL_38:
          CFRelease((CFTypeRef)v16);
          goto LABEL_20;
        }
        free(v7);
      }
    }
    _Block_object_dispose(&v33, 8);
    v7 = 0;
    LOBYTE(v6) = 0;
    v9 = "createInterestList() failed";
  }
LABEL_20:
  if (a5)
  {
    if ((v6 & 1) == 0)
      *a5 = createCFErr(v8, v9);
  }
  v16 = 0;
  result = 0;
  if (v7)
    goto LABEL_24;
  return result;
}

uint64_t IOReportIterateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, CFErrorRef *a3, uint64_t a4)
{
  CFIndex v5;
  CFIndex Length;
  CFIndex v10;
  const UInt8 *BytePtr;
  uint64_t *v12;
  int updated;
  uint64_t v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v5 = -536870206;
  v17 = 0;
  v18 = &v17;
  v19 = 0x4800000000;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (!a1 || !theData || CFDataGetLength(theData) < 64)
    goto LABEL_10;
  Length = CFDataGetLength(theData);
  if (Length >= 0)
    v10 = Length;
  else
    v10 = Length + 63;
  BytePtr = CFDataGetBytePtr(theData);
  v12 = v18;
  v18[3] = (uint64_t)BytePtr;
  v12[4] = (uint64_t)&BytePtr[v10 & 0xFFFFFFFFFFFFFFC0];
  *((_DWORD *)v12 + 15) = 0;
  *((_DWORD *)v12 + 16) = 0;
  v12[5] = 0;
  v12[6] = 0;
  *((_BYTE *)v12 + 56) = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 0x40000000;
  v16[2] = __IOReportIterateSamplesRaw_block_invoke;
  v16[3] = &unk_24BF02160;
  v16[5] = &v17;
  v16[6] = a3;
  v16[4] = a4;
  updated = updateAggregate(a1, (uint64_t)v16);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    IOReportIterateSamplesRaw_cold_1();
    if (updated)
      goto LABEL_9;
LABEL_16:
    v14 = 0;
    goto LABEL_14;
  }
  if (!updated)
    goto LABEL_16;
LABEL_9:
  v5 = -536870212;
LABEL_10:
  if (a3 && !*a3)
    *a3 = createCFErr(v5, "couldn't iterate samples");
  v14 = 1;
LABEL_14:
  _Block_object_dispose(&v17, 8);
  return v14;
}

CFDataRef IOReportCreateNewRawSamplesBuffer(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1 && a2)
  {
    if (!_updateKernelBuffer(a1, a3))
      return CFDataCreate(0, *(const UInt8 **)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if (a3)
  {
    *a3 = createCFErr(-536870206, 0);
  }
  return 0;
}

uint64_t IOReportIterateNewSamples(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3, uint64_t a4)
{
  const __CFData *v8;
  const __CFData *v9;
  uint64_t v10;

  if (a1 && a2)
  {
    if (!_updateKernelBuffer(a1, a3))
    {
      v8 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 32), *(_QWORD *)(a1 + 40), (CFAllocatorRef)*MEMORY[0x24BDBD258]);
      if (v8)
      {
        v9 = v8;
        v10 = IOReportIterateSamplesRaw(a2, v8, a3, a4);
        CFRelease(v9);
        return v10;
      }
    }
  }
  else if (a3)
  {
    *a3 = createCFErr(-536870206, 0);
  }
  return 1;
}

BOOL IOReportUpdateSamplesRaw(const __CFDictionary *a1, CFDataRef theData, uint64_t a3)
{
  int *v3;
  _BOOL8 v7;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v3 = &v16;
  v15 = 0x2000000000;
  v16 = -536870212;
  if (!a1 || !theData)
    goto LABEL_5;
  if (CFDataGetLength(theData) <= 63)
  {
    v3 = (int *)(v14 + 3);
LABEL_5:
    v7 = 0;
    *v3 = -536870206;
    goto LABEL_9;
  }
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v10 = Length + 63;
  v12[0] = MEMORY[0x24BDAC760];
  if (Length >= 0)
    v10 = Length;
  v12[1] = 0x40000000;
  v12[2] = __IOReportUpdateSamplesRaw_block_invoke;
  v12[3] = &unk_24BF021B0;
  v12[6] = &BytePtr[v10 & 0xFFFFFFFFFFFFFFC0];
  v12[7] = a3;
  v12[4] = &v13;
  v12[5] = BytePtr;
  v7 = updateAggregate(a1, (uint64_t)v12) == 0;
LABEL_9:
  _Block_object_dispose(&v13, 8);
  return v7;
}

BOOL IOReportUpdateSamples(const __CFDictionary *a1, uint64_t a2, CFErrorRef *a3)
{
  _BOOL8 updated;
  const __CFData *v7;
  const __CFData *v8;

  if (a1 && a2)
  {
    if (_updateKernelBuffer(a2, a3)
      || (v7 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a2 + 32), *(_QWORD *)(a2 + 40), (CFAllocatorRef)*MEMORY[0x24BDBD258])) == 0)
    {
      updated = 0;
      if (!a3)
        return updated;
    }
    else
    {
      v8 = v7;
      updated = IOReportUpdateSamplesRaw(a1, v7, (uint64_t)a3);
      CFRelease(v8);
      if (!a3)
        return updated;
    }
  }
  else
  {
    if (!a3)
      return 0;
    updated = 0;
    *a3 = createCFErr(-536870206, 0);
    if (!a3)
      return updated;
  }
  if (!updated)
  {
    if (!*a3)
    {
      updated = 0;
      *a3 = createCFErr(-536870212, "unknown error");
      return updated;
    }
    return 0;
  }
  return updated;
}

uint64_t ___createInterestList_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  unint64_t DriverID;
  unint64_t ChannelID;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  DriverID = IOReportChannelGetDriverID(a2);
  ChannelID = IOReportChannelGetChannelID(a2);
  result = 1;
  if (DriverID != 0x8000000000000000 && ChannelID != 0x8000000000000000)
  {
    v8 = 0;
    result = getChannelType(a2, &v8);
    if ((_DWORD)result)
    {
      return 1;
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 40) + 8;
      *(_QWORD *)(v7 + 24 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = DriverID;
      *(_QWORD *)(v7 + 24 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8) = ChannelID;
      *(_QWORD *)(v7 + 24 * (int)(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++ + 16) = v8;
    }
  }
  return result;
}

uint64_t _deallocSubscription(uint64_t a1)
{
  uint64_t result;

  MEMORY[0x20BCF2AD0](*(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 24), *MEMORY[0x24BDAEC58], *(_QWORD *)(a1 + 32));
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
    return IOServiceClose(result);
  return result;
}

const void *OUTLINED_FUNCTION_3()
{
  const __CFDictionary *v0;

  return IOReportChannelGetGroup(v0);
}

const __CFString *OUTLINED_FUNCTION_4()
{
  const __CFDictionary *v0;

  return IOReportChannelGetChannelName(v0);
}

const void *OUTLINED_FUNCTION_5()
{
  const __CFDictionary *v0;

  return IOReportChannelGetSubGroup(v0);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

const __CFDictionary *OUTLINED_FUNCTION_11@<X0>(const __CFDictionary *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return IOReportChannelGetDriverName(result);
}

const void *OUTLINED_FUNCTION_13()
{
  const __CFDictionary *v0;

  return IOReportChannelGetSubGroup(v0);
}

const void *OUTLINED_FUNCTION_14()
{
  const __CFDictionary *v0;

  return IOReportChannelGetGroup(v0);
}

const __CFString *OUTLINED_FUNCTION_15()
{
  const __CFDictionary *v0;

  return IOReportChannelGetChannelName(v0);
}

__CFDictionary *IOReportCopyChannelsForDrivers(const void *a1, int a2, CFErrorRef *a3)
{
  int v5;
  __CFDictionary *Aggregate;
  __CFDictionary *v7;
  _BOOL4 v8;
  int v9;
  const char *v10;
  _QWORD v12[6];

  v5 = -536870211;
  Aggregate = IOReportCreateAggregate(a2);
  if (Aggregate)
  {
    v7 = Aggregate;
    v8 = a1 == 0;
    if (a1)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 0x40000000;
      v12[2] = __IOReportCopyChannelsForDrivers_block_invoke;
      v12[3] = &__block_descriptor_tmp_1;
      v12[4] = a3;
      v12[5] = Aggregate;
      v9 = _iterateMatches(a1, (uint64_t)v12);
      if (!v9)
        return v7;
      v5 = v9;
      v10 = 0;
    }
    else
    {
      v5 = -536870206;
      v10 = "no matching dict";
    }
    CFRelease(v7);
  }
  else
  {
    v8 = 1;
    v10 = "couldn't make dict";
  }
  v7 = 0;
  if (a3 && v8)
  {
    v7 = 0;
    *a3 = createCFErr(v5, v10);
  }
  return v7;
}

__CFDictionary *IOReportCreateAggregate(int a1)
{
  __CFDictionary *Mutable;
  CFNumberRef v2;
  CFNumberRef v3;
  int valuePtr;

  valuePtr = a1;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v2 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v2)
    {
      v3 = v2;
      CFDictionarySetValue(Mutable, CFSTR("QueryOpts"), v2);
    }
    else
    {
      v3 = Mutable;
      Mutable = 0;
    }
    CFRelease(v3);
  }
  return Mutable;
}

uint64_t _iterateMatches(const void *a1, uint64_t a2)
{
  uint64_t MatchingServices;
  uint64_t v6;
  io_object_t v7;
  io_iterator_t existing;

  existing = 0;
  CFRetain(a1);
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], (CFDictionaryRef)a1, &existing);
  if (!(_DWORD)MatchingServices)
  {
    if (IOIteratorIsValid(existing))
    {
      while (IOIteratorIsValid(existing))
      {
        while (1)
        {
          v6 = IOIteratorNext(existing);
          if (!(_DWORD)v6)
            break;
          v7 = v6;
          MatchingServices = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v6);
          IOObjectRelease(v7);
          if ((_DWORD)MatchingServices)
            goto LABEL_2;
        }
        MatchingServices = 0;
        if (IOIteratorIsValid(existing))
          goto LABEL_2;
      }
      MatchingServices = 3758097131;
    }
    else
    {
      MatchingServices = 0;
    }
  }
LABEL_2:
  if (existing)
    IOObjectRelease(existing);
  return MatchingServices;
}

__CFDictionary *IOReportCopyChannelsForDriver(uint64_t a1, int a2, CFErrorRef *a3)
{
  return _IOReportCopyChannelsForDriver(a1, a2, 0, a3);
}

uint64_t IOReportMergeChannels(const __CFDictionary *a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  BOOL v4;
  uint64_t v5;
  unsigned int AggregateOpts;
  _QWORD v10[6];
  unsigned int v11;

  v4 = 0;
  v5 = 273;
  if (a2 != a1 && a1 && a2)
  {
    AggregateOpts = _getAggregateOpts(a1);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = __IOReportMergeChannels_block_invoke;
    v10[3] = &__block_descriptor_tmp_27;
    v11 = AggregateOpts;
    v10[4] = a1;
    v10[5] = a3;
    v5 = IOReportIterate(a2, (uint64_t)v10);
    v4 = (_DWORD)v5 != 0;
  }
  if (a3 && (_DWORD)v5 && !v4)
    *a3 = createCFErr(-536870206, "bad argument");
  return v5;
}

__CFDictionary *IOReportCopyChannelsInCategories(__int16 a1, int a2, CFErrorRef *a3)
{
  _QWORD v4[4];
  __int16 v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsInCategories_block_invoke;
  v4[3] = &__block_descriptor_tmp_4;
  v5 = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

__CFDictionary *IOReportCopyFilteredChannels(int a1, CFErrorRef *a2, uint64_t a3)
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  __CFDictionary *Aggregate;
  __CFDictionary *v9;
  const char *v10;
  __CFDictionary *v11;
  _QWORD v13[7];
  int v14;
  void *values;
  void *keys;

  keys = CFSTR("IOReportLegendPublic");
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, MEMORY[0x24BDBD270], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!values)
  {
    v7 = 0;
    v10 = "prop create failed";
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  keys = CFSTR("IOPropertyMatch");
  v7 = CFDictionaryCreate(v6, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v7)
  {
    v10 = "dict create failed";
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  Aggregate = IOReportCreateAggregate(a1);
  if (!Aggregate)
  {
    v10 = "couldn't make dict";
    if (!a2)
    {
LABEL_10:
      v9 = 0;
      v11 = 0;
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_9:
    *a2 = createCFErr(-536870211, v10);
    goto LABEL_10;
  }
  v9 = Aggregate;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = __IOReportCopyFilteredChannels_block_invoke;
  v13[3] = &unk_24BF02320;
  v14 = a1;
  v13[4] = a3;
  v13[5] = Aggregate;
  v13[6] = a2;
  if (_iterateMatches(v7, (uint64_t)v13))
  {
    CFRelease(v9);
    v9 = 0;
  }
LABEL_11:
  CFRelease(v7);
  v11 = v9;
LABEL_12:
  if (values)
    CFRelease(values);
  return v11;
}

uint64_t IOReportChannelGetCategories(const __CFDictionary *a1)
{
  int ChannelType;
  unsigned __int16 v2;
  unint64_t v4;

  v4 = 0;
  ChannelType = getChannelType(a1, &v4);
  v2 = WORD1(v4);
  if (ChannelType)
    return (unsigned __int16)-1;
  return v2;
}

__CFDictionary *IOReportCopyChannelsOfFormat(char a1, int a2, CFErrorRef *a3)
{
  _QWORD v4[4];
  char v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsOfFormat_block_invoke;
  v4[3] = &__block_descriptor_tmp_5;
  v5 = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

__CFDictionary *IOReportCopyChannelsInGroup(uint64_t a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  __CFDictionary *result;
  CFErrorRef CFErr;
  _QWORD v7[6];

  if (a1 | a2)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 0x40000000;
    v7[2] = __IOReportCopyChannelsInGroup_block_invoke;
    v7[3] = &__block_descriptor_tmp_7;
    v7[4] = a1;
    v7[5] = a2;
    return IOReportCopyFilteredChannels(a3, a4, (uint64_t)v7);
  }
  else if (a4)
  {
    CFErr = createCFErr(-536870206, "no group or subgroup!");
    result = 0;
    *a4 = CFErr;
  }
  else
  {
    return 0;
  }
  return result;
}

const void *IOReportChannelGetGroup(const __CFDictionary *a1)
{
  const void *Value;

  Value = CFDictionaryGetValue(a1, CFSTR("IOReportGroupName"));
  return _validateStr(Value);
}

const void *IOReportChannelGetSubGroup(const __CFDictionary *a1)
{
  const void *Value;

  Value = CFDictionaryGetValue(a1, CFSTR("IOReportSubGroupName"));
  return _validateStr(Value);
}

uint64_t IOReportSelectChannelsInGroup(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  _QWORD *v5;
  uint64_t result;
  const char *v7;
  CFIndex v8;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[5];

  if (a2 && !a3)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 0x40000000;
    v11[2] = __IOReportSelectChannelsInGroup_block_invoke;
    v11[3] = &__block_descriptor_tmp_8_0;
    v11[4] = a2;
    v5 = v11;
    goto LABEL_10;
  }
  if (!a2 && a3)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = __IOReportSelectChannelsInGroup_block_invoke_2;
    v10[3] = &__block_descriptor_tmp_9;
    v10[4] = a3;
    v5 = v10;
    goto LABEL_10;
  }
  if (a2 && a3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __IOReportSelectChannelsInGroup_block_invoke_3;
    v9[3] = &__block_descriptor_tmp_10;
    v9[4] = a2;
    v9[5] = a3;
    v5 = v9;
LABEL_10:
    result = IOReportPrune(a1, (uint64_t)v5);
    if ((result & 1) == 0)
      return result;
    if (a4)
    {
      v7 = "channel pruning failed";
      v8 = -536870212;
LABEL_15:
      *a4 = createCFErr(v8, v7);
      return 1;
    }
    return 1;
  }
  if (a4)
  {
    v8 = -536870206;
    v7 = "no group or subgroup!";
    goto LABEL_15;
  }
  return 1;
}

__CFDictionary *IOReportCopyChannelsWithUnit(uint64_t a1, int a2, CFErrorRef *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __IOReportCopyChannelsWithUnit_block_invoke;
  v4[3] = &__block_descriptor_tmp_12;
  v4[4] = a1;
  return IOReportCopyFilteredChannels(a2, a3, (uint64_t)v4);
}

unint64_t IOReportChannelGetUnit(const __CFDictionary *a1)
{
  const __CFDictionary *ChannelConfigDict;
  const void *Value;

  if (!a1)
    return 0x8000000000000000;
  ChannelConfigDict = (const __CFDictionary *)_getChannelConfigDict(a1);
  if (!ChannelConfigDict)
    return 0x8000000000000000;
  Value = CFDictionaryGetValue(ChannelConfigDict, CFSTR("IOReportChannelUnit"));
  return _validateInt(Value);
}

uint64_t IOReportAddChannelDescription(const __CFDictionary *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, const void *a6, const void *a7, const void *a8, const void *a9, CFErrorRef *a10)
{
  uint64_t v15;
  __CFArray *LegendChannel;
  __CFArray *v17;
  __CFDictionary *Channel;
  __CFDictionary *v19;
  char AggregateOpts;

  v15 = 3758097084;
  LegendChannel = _createLegendChannel(a4, a5, a6, a10);
  if (LegendChannel)
  {
    v17 = LegendChannel;
    Channel = _createChannel(a2, a3, LegendChannel, a7, a8, a9, a10);
    if (Channel)
    {
      v19 = Channel;
      AggregateOpts = _getAggregateOpts(a1);
      v15 = _addChannel(a1, v19, AggregateOpts, a10);
      CFRelease(v19);
    }
    CFRelease(v17);
  }
  return v15;
}

__CFArray *_createLegendChannel(uint64_t a1, uint64_t a2, const void *a3, CFErrorRef *a4)
{
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  uint64_t v13;
  uint64_t valuePtr;

  v13 = a2;
  valuePtr = a1;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v7 = Mutable;
    v8 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v8)
    {
      v9 = v8;
      CFArraySetValueAtIndex(v7, 0, v8);
      CFRelease(v9);
      v10 = CFNumberCreate(0, kCFNumberLongLongType, &v13);
      if (v10)
      {
        v11 = v10;
        CFArraySetValueAtIndex(v7, 1, v10);
        CFRelease(v11);
        if (a3)
          CFArraySetValueAtIndex(v7, 2, a3);
        return v7;
      }
    }
    CFRelease(v7);
  }
  v7 = 0;
  if (a4)
    *a4 = createCFErr(-536870211, "couldn't create channel legend");
  return v7;
}

__CFDictionary *_createChannel(uint64_t a1, const void *a2, CFArrayRef theArray, const void *a4, const void *a5, const void *a6, CFErrorRef *a7)
{
  CFNumberRef v13;
  const void *ValueAtIndex;
  const void *v15;
  unint64_t v16;
  __CFDictionary *v17;
  __CFDictionary *result;
  __CFDictionary *Mutable;
  uint64_t valuePtr;

  valuePtr = a1;
  if (CFArrayGetCount(theArray) < 2)
    goto LABEL_2;
  ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
  v15 = CFArrayGetValueAtIndex(theArray, 1);
  v16 = _validateInt(ValueAtIndex);
  v13 = 0;
  if (v16 != 0x8000000000000000)
  {
    if (_validateInt(v15) == 0x8000000000000000)
    {
LABEL_2:
      v13 = 0;
      goto LABEL_4;
    }
    v13 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v13)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v17 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("DriverID"), v13);
        CFDictionarySetValue(v17, CFSTR("DriverName"), a2);
        CFDictionarySetValue(v17, CFSTR("LegendChannel"), theArray);
        if (a4)
          CFDictionarySetValue(v17, CFSTR("IOReportGroupName"), a4);
        if (a5)
          CFDictionarySetValue(v17, CFSTR("IOReportSubGroupName"), a5);
        if (a6)
          CFDictionarySetValue(v17, CFSTR("IOReportChannelInfo"), a6);
        goto LABEL_7;
      }
    }
  }
LABEL_4:
  if (a7)
    *a7 = createCFErr(-536870212, "couldn't create channel");
  v17 = 0;
  result = 0;
  if (v13)
  {
LABEL_7:
    CFRelease(v13);
    return v17;
  }
  return result;
}

uint64_t _addChannel(const __CFDictionary *a1, const void *a2, char a3, CFErrorRef *a4)
{
  uint64_t v5;
  const __CFDictionary *v8;
  CFTypeID v9;
  CFTypeID v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const __CFDictionary *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const __CFDictionary *v18;
  __CFArray *v19;
  __CFArray *v20;
  CFTypeID v21;
  CFMutableDictionaryRef AddDict;
  const __CFDictionary *v23;
  const void *Value;
  CFMutableArrayRef Mutable;

  v5 = 3758097090;
  if (!a1)
    goto LABEL_19;
  if (!a2)
    goto LABEL_19;
  v8 = a1;
  v9 = CFGetTypeID(a1);
  v5 = 3758097090;
  if (v9 != CFDictionaryGetTypeID())
    goto LABEL_19;
  v10 = CFGetTypeID(a2);
  if (v10 != CFDictionaryGetTypeID())
    goto LABEL_19;
  if ((a3 & 1) != 0)
  {
    AddDict = _findAddDict(v8, CFSTR("IOReportDrivers"));
    if (!AddDict)
      goto LABEL_18;
    v23 = AddDict;
    Value = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("DriverName"));
    if (!Value)
      goto LABEL_18;
    v8 = _findAddDict(v23, Value);
    if (!v8)
      goto LABEL_18;
  }
  if ((a3 & 2) != 0)
  {
    v11 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("IOReportGroupName"));
    v12 = _validateStr(v11);
    if (v12)
    {
      v13 = v12;
      v14 = _findAddDict(v8, CFSTR("IOReportChannelGroups"));
      if (!v14)
        goto LABEL_18;
      v8 = _findAddDict(v14, v13);
      v15 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("IOReportSubGroupName"));
      v16 = _validateStr(v15);
      if (v16)
      {
        v17 = v16;
        v18 = _findAddDict(v8, CFSTR("IOReportChannelGroups"));
        if (v18)
        {
          v8 = _findAddDict(v18, v17);
          goto LABEL_12;
        }
LABEL_18:
        v5 = 3758097084;
        goto LABEL_19;
      }
    }
  }
LABEL_12:
  v19 = (__CFArray *)CFDictionaryGetValue(v8, CFSTR("IOReportChannels"));
  if (v19)
  {
    v20 = v19;
    v21 = CFGetTypeID(v19);
    v5 = 3758097084;
    if (v21 != CFArrayGetTypeID())
      goto LABEL_19;
LABEL_24:
    CFArrayAppendValue(v20, a2);
    return 0;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v5 = 3758097084;
  if (Mutable)
  {
    v20 = Mutable;
    CFDictionarySetValue(v8, CFSTR("IOReportChannels"), Mutable);
    CFRelease(v20);
    goto LABEL_24;
  }
LABEL_19:
  if (a4)
    *a4 = createCFErr((int)v5, "_addChannel() failed");
  return v5;
}

const __CFNumber *_getAggregateOpts(const __CFDictionary *a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  CFTypeID v3;
  unsigned int valuePtr;

  result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("QueryOpts"));
  if (result)
  {
    v2 = result;
    v3 = CFGetTypeID(result);
    if (v3 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue(v2, kCFNumberIntType, &valuePtr))
        return (const __CFNumber *)valuePtr;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFDictionary *IOReportCreateUnitInfo(uint64_t a1)
{
  __CFDictionary *Mutable;
  CFNumberRef v2;
  CFNumberRef v3;
  uint64_t valuePtr;

  valuePtr = a1;
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v2 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v2)
    {
      v3 = v2;
      CFDictionarySetValue(Mutable, CFSTR("IOReportChannelUnit"), v2);
    }
    else
    {
      v3 = Mutable;
      Mutable = 0;
    }
    CFRelease(v3);
  }
  return Mutable;
}

CFStringRef IOReportCopyDriverName(uint64_t a1)
{
  kern_return_t RegistryEntryID;
  CFStringRef result;
  uint64_t entryID;
  _OWORD v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(v5, 0, sizeof(v5));
  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a1, &entryID);
  result = 0;
  if (!RegistryEntryID)
  {
    if (MEMORY[0x20BCF2B18](a1, v5))
      return 0;
    else
      return CFStringCreateWithFormat(0, 0, CFSTR("%s <id %#llx>"), v5, entryID);
  }
  return result;
}

CFStringRef IOReportCopyCurrentProcessName()
{
  const char *v0;
  uint64_t v1;

  v0 = getprogname();
  v1 = getpid();
  return CFStringCreateWithFormat(0, 0, CFSTR("%s <pid %d>"), v0, v1);
}

__CFDictionary *IOReportCopyChannelsWithID(const void *a1, uint64_t a2, CFErrorRef *a3)
{
  __CFDictionary *Aggregate;
  __CFDictionary *v7;
  _QWORD v9[7];

  if (!a1)
    return 0;
  Aggregate = IOReportCreateAggregate(0);
  if (Aggregate)
  {
    v7 = Aggregate;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __IOReportCopyChannelsWithID_block_invoke;
    v9[3] = &__block_descriptor_tmp_18;
    v9[4] = a2;
    v9[5] = a3;
    v9[6] = Aggregate;
    if (_iterateMatches(a1, (uint64_t)v9))
    {
      CFRelease(v7);
      return 0;
    }
  }
  else
  {
    if (!a3)
      return 0;
    v7 = 0;
    *a3 = createCFErr(-536870211, "couldn't make dict");
  }
  return v7;
}

__CFDictionary *_createDriverChannel(uint64_t a1, const __CFArray *a2, const void *a3, const void *a4, const void *a5, uint64_t a6, CFErrorRef *a7)
{
  kern_return_t RegistryEntryID;
  __CFDictionary *v15;
  CFStringRef v16;
  CFStringRef v17;
  __CFDictionary *Channel;
  int v19;
  uint64_t entryID;

  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a1, &entryID);
  if (RegistryEntryID)
  {
    if (a7)
    {
      v15 = 0;
      *a7 = createCFErr(RegistryEntryID, "error extracting driver info");
      return v15;
    }
    return 0;
  }
  v16 = IOReportCopyDriverName(a1);
  if (!v16)
    return 0;
  v17 = v16;
  Channel = _createChannel(entryID, v16, a2, a3, a4, a5, a7);
  v15 = Channel;
  if (a6)
  {
    if (Channel)
    {
      v19 = (*(uint64_t (**)(uint64_t, __CFDictionary *))(a6 + 16))(a6, Channel);
      if (v19)
      {
        if (a7 && v19 != 16)
          *a7 = createCFErr(5, "channel filter returned an error");
        CFRelease(v15);
        v15 = 0;
      }
    }
  }
  CFRelease(v17);
  return v15;
}

__CFDictionary *_IOReportCopyChannelsForDriver(uint64_t a1, int a2, uint64_t a3, CFErrorRef *a4)
{
  int64_t v5;
  __CFDictionary *Aggregate;
  __CFDictionary *v10;
  CFTypeRef CFProperty;
  CFTypeRef v12;
  const void *v13;
  CFTypeID v14;
  CFErrorRef *v15;
  CFIndex v16;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v18;
  CFTypeID v19;
  const void *Value;
  const void *v21;
  CFTypeID v22;
  const void *v23;
  const void *v24;
  CFTypeID v25;
  const void *v26;
  const void *v27;
  CFTypeID v28;
  const __CFArray *v29;
  const __CFArray *v30;
  CFTypeID v31;
  CFIndex v32;
  const __CFArray *v33;
  const __CFArray *v34;
  CFTypeID v35;
  __CFDictionary *DriverChannel;
  __CFDictionary *v37;
  int v38;
  const char *v39;
  uint64_t v41;
  CFIndex v42;
  char v43;
  CFErrorRef *v44;
  uint64_t v45;
  const void *v46;
  uint64_t v47;

  v5 = 0xE00002C200000000;
  if (!(_DWORD)a1 || !IOObjectGetUserRetainCount(a1))
  {
    v13 = 0;
    v39 = "invalid driver";
    goto LABEL_39;
  }
  Aggregate = IOReportCreateAggregate(a2);
  if (!Aggregate)
  {
    v13 = 0;
    v5 = 0xE00002BD00000000;
    v39 = "could not allocate collection";
    goto LABEL_39;
  }
  v10 = Aggregate;
  CFProperty = IORegistryEntryCreateCFProperty(a1, CFSTR("IOReportLegendPublic"), 0, 0);
  if (!CFProperty)
    return v10;
  CFRelease(CFProperty);
  v12 = IORegistryEntryCreateCFProperty(a1, CFSTR("IOReportLegend"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v13 = v12;
  if (!v12)
  {
    v39 = "no legend";
    v41 = 0x2F000000000;
LABEL_51:
    v5 = v41 & 0xFFFFFFFFFFFFLL | 0xE000000000000000;
    CFRelease(v10);
LABEL_39:
    if (a4 && !*a4)
    {
      v10 = 0;
      *a4 = createCFErr(v5 >> 32, v39);
      if (!v13)
        return v10;
      goto LABEL_43;
    }
    v10 = 0;
    goto LABEL_42;
  }
  v14 = CFGetTypeID(v12);
  if (v14 != CFArrayGetTypeID())
  {
    CFRelease(v13);
    v13 = 0;
    v39 = "bad legend";
    v41 = 0x2C900000000;
    goto LABEL_51;
  }
  v47 = 0;
  if (a4)
    v15 = a4;
  else
    v15 = (CFErrorRef *)&v47;
  if (CFArrayGetCount((CFArrayRef)v13) < 1)
    goto LABEL_43;
  v43 = a2;
  v44 = v15;
  v45 = a3;
  v16 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v13, v16);
    if (!ValueAtIndex)
      break;
    v18 = ValueAtIndex;
    v19 = CFGetTypeID(ValueAtIndex);
    if (v19 != CFDictionaryGetTypeID())
      break;
    Value = CFDictionaryGetValue(v18, CFSTR("IOReportGroupName"));
    if (!Value || (v21 = Value, v22 = CFGetTypeID(Value), v22 != CFStringGetTypeID()))
      v21 = 0;
    v23 = CFDictionaryGetValue(v18, CFSTR("IOReportSubGroupName"));
    v24 = v23;
    if (v23)
    {
      v25 = CFGetTypeID(v23);
      if (v25 == CFStringGetTypeID())
      {
        if (!v21)
          break;
      }
      else
      {
        v24 = 0;
      }
    }
    v26 = CFDictionaryGetValue(v18, CFSTR("IOReportChannelInfo"));
    if (!v26 || (v27 = v26, v28 = CFGetTypeID(v26), v28 != CFDictionaryGetTypeID()))
      v27 = 0;
    v29 = (const __CFArray *)CFDictionaryGetValue(v18, CFSTR("IOReportChannels"));
    if (!v29)
      break;
    v30 = v29;
    v31 = CFGetTypeID(v29);
    if (v31 != CFArrayGetTypeID())
      break;
    v46 = v21;
    v42 = v16;
    if (CFArrayGetCount(v30) >= 1)
    {
      v32 = 0;
      do
      {
        v33 = (const __CFArray *)CFArrayGetValueAtIndex(v30, v32);
        if (!v33)
          break;
        v34 = v33;
        v35 = CFGetTypeID(v33);
        if (v35 != CFArrayGetTypeID())
          break;
        DriverChannel = _createDriverChannel(a1, v34, v46, v24, v27, v45, v44);
        if (DriverChannel)
        {
          v37 = DriverChannel;
          v38 = _addChannel(v10, DriverChannel, v43, v44);
          CFRelease(v37);
          if (v38)
            goto LABEL_50;
        }
        else if (*v44)
        {
LABEL_50:
          v39 = 0;
          v41 = 0x2BC00000000;
          goto LABEL_51;
        }
      }
      while (++v32 < CFArrayGetCount(v30));
    }
    v16 = v42 + 1;
  }
  while (v42 + 1 < CFArrayGetCount((CFArrayRef)v13));
LABEL_42:
  if (v13)
LABEL_43:
    CFRelease(v13);
  return v10;
}

__CFDictionary *IOReportCopyAllChannels(int a1, CFErrorRef *a2)
{
  return IOReportCopyFilteredChannels(a1, a2, 0);
}

uint64_t setChannelType(const __CFDictionary *a1, const void *a2)
{
  uint64_t v3;
  __CFArray *Value;
  __CFArray *v5;
  CFTypeID v6;
  CFNumberRef v7;
  CFNumberRef v8;

  v3 = 3758097084;
  Value = (__CFArray *)CFDictionaryGetValue(a1, CFSTR("LegendChannel"));
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFArrayGetTypeID())
    {
      v7 = CFNumberCreate(0, kCFNumberLongLongType, a2);
      if (v7)
      {
        v8 = v7;
        CFArraySetValueAtIndex(v5, 1, v7);
        CFRelease(v8);
        return 0;
      }
    }
  }
  return v3;
}

const __CFDictionary *getChannelConfig(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  CFTypeID v2;

  if (result)
  {
    result = (const __CFDictionary *)_getChannelConfigDict(result);
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("IOReportChannelConfig"));
      if (result)
      {
        v1 = result;
        v2 = CFGetTypeID(result);
        if (v2 == CFDataGetTypeID())
          return v1;
        else
          return 0;
      }
    }
  }
  return result;
}

const void *_getChannelConfigDict(const __CFDictionary *a1)
{
  const void *result;
  const void *v2;
  CFTypeID v3;

  result = CFDictionaryGetValue(a1, CFSTR("IOReportChannelInfo"));
  if (result)
  {
    v2 = result;
    v3 = CFGetTypeID(result);
    if (v3 == CFDictionaryGetTypeID())
      return v2;
    else
      return 0;
  }
  return result;
}

const __CFDictionary *IOReportChannelCopyDescription(const __CFDictionary *result, uint64_t a2, const char *a3)
{
  const __CFDictionary *v4;
  const void *Value;
  const void *ChDetail;
  unint64_t v7;
  int ChannelType;
  const __CFString *ChannelName;
  const void *UnitLabel;
  const void *v11;
  const __CFString *v12;
  const void *v13;
  const __CFString *v14;
  const char *v15;
  const __CFString *v16;
  const __CFString *v17;
  unint64_t v18;

  if (result)
  {
    v4 = result;
    v18 = 0;
    Value = CFDictionaryGetValue(result, CFSTR("DriverName"));
    ChDetail = _getChDetail(v4, 0);
    v7 = _validateInt(ChDetail);
    ChannelType = getChannelType(v4, &v18);
    result = 0;
    if (!ChannelType)
    {
      ChannelName = IOReportChannelGetChannelName(v4);
      UnitLabel = IOReportChannelGetUnitLabel(v4);
      v11 = CFDictionaryGetValue(v4, CFSTR("IOReportGroupName"));
      v12 = (const __CFString *)_validateStr(v11);
      v13 = CFDictionaryGetValue(v4, CFSTR("IOReportSubGroupName"));
      v14 = (const __CFString *)_validateStr(v13);
      v15 = "";
      if (a3)
        v15 = a3;
      v16 = CFSTR("(none)");
      if (v12)
        v17 = v12;
      else
        v17 = CFSTR("(none)");
      if (v14)
        v16 = v14;
      return (const __CFDictionary *)CFStringCreateWithFormat(0, 0, CFSTR("%s%@ %@ < %#llx (%@) | G/g %@/%@ | cat %#04x | format %#04x | elts %u >\n"), v15, Value, ChannelName, v7, UnitLabel, v17, v16, WORD1(v18), v18, WORD2(v18));
    }
  }
  return result;
}

const __CFDictionary *IOReportChannelGetDriverName(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("DriverName"));
  return result;
}

const void *IOReportChannelGetUnitLabel(const __CFDictionary *a1)
{
  const void *Value;
  unint64_t Unit;

  Value = CFDictionaryGetValue(a1, CFSTR("UnitLabel"));
  if (!Value)
  {
    Unit = IOReportChannelGetUnit(a1);
    if (Unit == 0x8000000000000000)
    {
      return 0;
    }
    else
    {
      Value = copyUnitLabel(Unit);
      if (Value)
      {
        CFDictionarySetValue(a1, CFSTR("UnitLabel"), Value);
        CFRelease(Value);
      }
    }
  }
  return Value;
}

CFStringRef copyUnitLabel(unint64_t a1)
{
  uint64_t v3;
  const char *v4;
  unint64_t v5;
  int v6;

  v6 = 0;
  if (a1 == 0x8000000000000000)
    return 0;
  v3 = a1 & 0xFFFFFFFFFFFFFFLL;
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x8BFFFFFFFFFFLL)
  {
    if ((a1 & 0xFFFFFFFFFFFFFFLL) > 0x7BFFFFFFFFLL)
    {
      if ((a1 & 0xFFFFFFFFFFFFFFLL) > 0x87FFFFFFFFLL)
      {
        if (v3 == 0x8800000000 || v3 == 0x8B00000000 || v3 == 0x890000000000)
          goto LABEL_52;
      }
      else if (v3 == 0x7C00000000 || v3 == 0x8200000000 || v3 == 0x8500000000)
      {
        goto LABEL_52;
      }
LABEL_53:
      v5 = HIBYTE(a1);
      v4 = "";
      switch(HIBYTE(a1))
      {
        case 0u:
          return CFStringCreateWithFormat(0, 0, CFSTR("%s%s"), &v6, v4);
        case 1u:
          v4 = "s";
          break;
        case 2u:
          v4 = "W";
          break;
        case 3u:
          v4 = "J";
          break;
        case 4u:
          v4 = "A";
          break;
        case 5u:
          v4 = "V";
          break;
        case 6u:
          v4 = "F";
          break;
        case 7u:
          v4 = "H";
          break;
        case 8u:
          v4 = "Hz";
          break;
        case 9u:
          if (!v3)
            v4 = "b";
          if (v3 == 0x820000000000)
            v4 = "B";
          break;
        case 0xAu:
          v4 = "C";
          break;
        default:
          if ((_DWORD)v5 == 100)
          {
            v4 = "events";
          }
          else if ((_DWORD)v5 == 101)
          {
            v4 = "packets";
          }
          else
          {
            v4 = "??";
          }
          break;
      }
      return CFStringCreateWithFormat(0, 0, CFSTR("%s%s"), &v6, v4);
    }
    if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x7600000000)
    {
      if (v3 == 0x7300000000 || v3 == 0x7600000000)
        goto LABEL_52;
      goto LABEL_53;
    }
    if (v3 == 0x7600000001)
      goto LABEL_44;
    if (v3 != 0x7900000000)
    {
      if (v3 != 0x7980000018)
        goto LABEL_53;
LABEL_44:
      __strlcat_chk();
      v4 = "ticks";
      return CFStringCreateWithFormat(0, 0, CFSTR("%s%s"), &v6, v4);
    }
LABEL_52:
    __strlcat_chk();
    goto LABEL_53;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x9CFFFFFFFFFFLL)
  {
    if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0x8C0000000007)
    {
      if (v3 == 0x8C0000000000 || v3 == 0x8C0000000004)
        goto LABEL_52;
    }
    else if (v3 == 0x8C0000000008 || v3 == 0x930000000000 || v3 == 0x960000000000)
    {
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFLL) <= 0xA9FFFFFFFFFFLL)
  {
    if (v3 == 0x9D0000000000 || v3 == 0xA00000000000 || v3 == 0xA70000000000)
      goto LABEL_52;
    goto LABEL_53;
  }
  switch(v3)
  {
    case 0xAA0000000000:
      goto LABEL_52;
    case 0x1000000000000:
      v4 = "hwticks?";
      break;
    case 0x2000000000000:
      v4 = "hwpage?";
      break;
    default:
      goto LABEL_53;
  }
  return CFStringCreateWithFormat(0, 0, CFSTR("%s%s"), &v6, v4);
}

CFMutableDictionaryRef _findAddDict(const __CFDictionary *a1, const void *a2)
{
  __CFDictionary *Value;
  CFMutableDictionaryRef Mutable;
  CFTypeID v6;

  Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    Mutable = Value;
    v6 = CFGetTypeID(Value);
    if (v6 != CFDictionaryGetTypeID())
      return 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      CFDictionarySetValue(a1, a2, Mutable);
      CFRelease(Mutable);
    }
  }
  return Mutable;
}

uint64_t IOReportHistogramGetBucketCount(const __CFDictionary *a1)
{
  int ChannelType;
  uint64_t result;
  unint64_t v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = 0;
  ChannelType = getChannelType(a1, &v3);
  result = 0xFFFFFFFFLL;
  if (!ChannelType && v3 == 3)
    return WORD2(v3);
  return result;
}

unint64_t IOReportHistogramGetBucketHits(const __CFDictionary *a1, int a2)
{
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  if (_getHistogramValues(a1, a2, v3))
    return 0x8000000000000000;
  else
    return *(_QWORD *)&v3[0];
}

uint64_t _getHistogramValues(const __CFDictionary *a1, int a2, _OWORD *a3)
{
  uint64_t v3;
  UInt8 *RawElements;
  UInt8 *v8;
  int v9;
  UInt8 *v10;
  __int128 v11;
  unsigned __int16 v13;
  unint64_t v14;

  v3 = 3758097084;
  v13 = 0;
  if (a1)
  {
    RawElements = getRawElements(a1, &v13, 3);
    if (RawElements)
    {
      v8 = RawElements;
      v9 = v13;
      v14 = 0;
      if (!getChannelType(a1, &v14) && v14 == 3 && WORD2(v14) == v9 && v13 >= a2)
      {
        v3 = 0;
        v10 = &v8[64 * (uint64_t)a2];
        v11 = *((_OWORD *)v10 + 3);
        *a3 = *((_OWORD *)v10 + 2);
        a3[1] = v11;
      }
    }
  }
  return v3;
}

unint64_t IOReportHistogramGetBucketMinValue(const __CFDictionary *a1, int a2)
{
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  if (_getHistogramValues(a1, a2, v3))
    return 0x8000000000000000;
  else
    return *((_QWORD *)&v3[0] + 1);
}

unint64_t IOReportHistogramGetBucketMaxValue(const __CFDictionary *a1, int a2)
{
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  if (_getHistogramValues(a1, a2, &v3))
    return 0x8000000000000000;
  else
    return v4;
}

unint64_t IOReportHistogramGetBucketSum(const __CFDictionary *a1, int a2)
{
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  if (_getHistogramValues(a1, a2, &v3))
    return 0x8000000000000000;
  else
    return *((_QWORD *)&v4 + 1);
}

unint64_t IOReportHistogramGetMinValue(const __CFDictionary *a1)
{
  int BucketCount;
  int v3;
  int v4;
  __int128 v6;
  __int128 v7;

  BucketCount = IOReportHistogramGetBucketCount(a1);
  if (BucketCount < 1)
    return 0x8000000000000000;
  v3 = BucketCount;
  v4 = 0;
  while (1)
  {
    v6 = 0u;
    v7 = 0u;
    if (_getHistogramValues(a1, v4, &v6) || (_QWORD)v6)
      break;
    if (v3 == ++v4)
      return 0x8000000000000000;
  }
  v6 = 0u;
  v7 = 0u;
  if (_getHistogramValues(a1, v4, &v6))
    return 0x8000000000000000;
  else
    return *((_QWORD *)&v6 + 1);
}

unint64_t IOReportHistogramGetMaxValue(const __CFDictionary *a1)
{
  int BucketCount;
  __int128 v4;
  __int128 v5;

  BucketCount = IOReportHistogramGetBucketCount(a1);
  do
  {
    if (!BucketCount)
      return 0x8000000000000000;
    --BucketCount;
    v4 = 0u;
    v5 = 0u;
  }
  while (!_getHistogramValues(a1, BucketCount, &v4) && !(_QWORD)v4);
  v4 = 0u;
  v5 = 0u;
  if (_getHistogramValues(a1, BucketCount, &v4))
    return 0x8000000000000000;
  else
    return v5;
}

uint64_t IOReportHistogramGetBucketBounds(const __CFDictionary *a1, int a2, _QWORD *a3, void *a4)
{
  uint64_t v4;
  const __CFArray *Value;
  const __CFArray *v10;
  CFTypeID v11;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  const __CFData *ChannelConfig;
  const __CFData *v19;
  unint64_t Length;
  unint64_t v21;
  unint64_t v22;
  const UInt8 *BytePtr;
  const UInt8 *v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  const UInt8 *v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  CFNumberRef v34;
  CFNumberRef v35;
  uint64_t v37;
  const UInt8 *v38;
  uint64_t v39;
  const __CFAllocator *allocator;
  const UInt8 *v41;
  _DWORD *v42;
  _DWORD *v43;
  __CFArray *theArray;
  unint64_t valuePtr;
  CFIndex capacity;

  v4 = 3758097084;
  if (!a1)
    return v4;
  if (!CFDictionaryContainsKey(a1, CFSTR("ProcessedChannelConfig")))
  {
    valuePtr = 0;
    capacity = 0;
    if (getChannelType(a1, (unint64_t *)&capacity))
      return v4;
    if (capacity != 3)
      return v4;
    ChannelConfig = getChannelConfig(a1);
    if (!ChannelConfig)
      return v4;
    v19 = ChannelConfig;
    Length = CFDataGetLength(ChannelConfig);
    v21 = Length >> 4;
    if (!(Length >> 4))
      return v4;
    v22 = Length;
    BytePtr = CFDataGetBytePtr(v19);
    if (!BytePtr)
      return v4;
    v24 = BytePtr;
    theArray = CFArrayCreateMutable(0, WORD2(capacity), MEMORY[0x24BDBD690]);
    if (!theArray)
      return v4;
    if ((int)v21 >= 1)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v37 = (v22 >> 4);
      v38 = v24;
      while (1)
      {
        v39 = v25;
        v28 = &v24[16 * v25];
        v43 = v28 + 12;
        if (*((int *)v28 + 3) >= 1)
          break;
        v32 = v26;
LABEL_38:
        v24 = v38;
        v25 = v39 + 1;
        v26 = v32;
        if (v39 + 1 == v37)
          goto LABEL_39;
      }
      v29 = 0;
      v41 = v28;
      v42 = v28 + 4;
      v30 = -1;
      while (v27 < WORD2(capacity))
      {
        if (*v42)
        {
          v31 = v30;
          v32 = 1;
          do
            v32 *= *(unsigned int *)v41;
          while (!__CFADD__(v31++, 1));
        }
        else
        {
          v32 = (*(_DWORD *)v41 + *(_DWORD *)v41 * v29);
        }
        valuePtr = v32;
        if (v26 >= v32)
          break;
        v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
        if (!v34)
          break;
        v35 = v34;
        ++v27;
        CFArrayAppendValue(theArray, v34);
        CFRelease(v35);
        ++v29;
        --v30;
        v26 = v32;
        if (v29 >= *v43)
          goto LABEL_38;
      }
      CFRelease(theArray);
      return v4;
    }
LABEL_39:
    CFDictionarySetValue(a1, CFSTR("ProcessedChannelConfig"), theArray);
    CFRelease(theArray);
  }
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("ProcessedChannelConfig"));
  if (Value)
  {
    v10 = Value;
    v11 = CFGetTypeID(Value);
    if (v11 == CFArrayGetTypeID() && CFArrayGetCount(v10) >= a2)
    {
      if (a4)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v10, a2);
        if (!ValueAtIndex)
          return v4;
        v13 = ValueAtIndex;
        v14 = CFGetTypeID(ValueAtIndex);
        if (v14 != CFNumberGetTypeID())
          return v4;
        CFNumberGetValue(v13, kCFNumberLongLongType, a4);
      }
      if (!a3)
        return 0;
      if (!a2)
      {
        v4 = 0;
        *a3 = 0;
        return v4;
      }
      v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v10, a2 - 1);
      if (v15)
      {
        v16 = v15;
        v17 = CFGetTypeID(v15);
        if (v17 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v16, kCFNumberLongLongType, a3);
          return 0;
        }
      }
    }
  }
  return v4;
}

unint64_t IOReportStateGetIDForIndex(const __CFDictionary *a1, int a2)
{
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  if (_getStateValues(a1, a2, v3))
    return 0x8000000000000000;
  else
    return *(_QWORD *)&v3[0];
}

uint64_t IOReportStateGetIndexForID(const __CFDictionary *a1, uint64_t a2)
{
  int Count;
  uint64_t v5;
  int StateValues;
  unint64_t v7;
  _OWORD v9[2];

  Count = IOReportStateGetCount(a1);
  if ((Count & 0x80000000) == 0)
  {
    LODWORD(v5) = Count;
    while ((_DWORD)v5)
    {
      v5 = (v5 - 1);
      memset(v9, 0, sizeof(v9));
      StateValues = _getStateValues(a1, v5, v9);
      v7 = *(_QWORD *)&v9[0];
      if (StateValues)
        v7 = 0x8000000000000000;
      if (v7 == a2)
        return v5;
    }
  }
  return 0xFFFFFFFFLL;
}

__CFArray *IOReportStateGetNameForIndex(const __CFDictionary *a1, unsigned int a2)
{
  __CFArray *Value;
  __CFArray *v5;
  CFTypeID v6;
  __CFArray *result;
  __CFArray *v8;
  CFTypeID v9;
  unsigned int Count;
  unsigned int v11;
  int v12;
  CFStringRef v13;
  CFStringRef v14;
  _OWORD v15[2];

  Value = (__CFArray *)CFDictionaryGetValue(a1, CFSTR("StateNames"));
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 != CFArrayGetTypeID() || (a2 & 0x80000000) != 0)
      return 0;
  }
  else
  {
    Count = IOReportStateGetCount(a1);
    if ((Count & 0x80000000) != 0)
      return 0;
    v11 = Count;
    result = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
    if (!result)
      return result;
    v5 = result;
    if (v11)
    {
      v12 = 0;
      while (1)
      {
        memset(v15, 0, sizeof(v15));
        if (_getStateValues(a1, v12, v15))
          break;
        if (*(_QWORD *)&v15[0] == 0x8000000000000000)
          break;
        v13 = copyPrintableIDString(*(unint64_t *)&v15[0]);
        if (!v13)
          break;
        v14 = v13;
        CFArrayAppendValue(v5, v13);
        CFRelease(v14);
        if (v11 == ++v12)
          goto LABEL_17;
      }
      CFRelease(v5);
      return 0;
    }
LABEL_17:
    CFDictionarySetValue(a1, CFSTR("StateNames"), v5);
    CFRelease(v5);
    if ((a2 & 0x80000000) != 0)
      return 0;
  }
  if (CFArrayGetCount(v5) <= a2)
    return 0;
  result = (__CFArray *)CFArrayGetValueAtIndex(v5, a2);
  if (result)
  {
    v8 = result;
    v9 = CFGetTypeID(result);
    if (v9 == CFStringGetTypeID())
      return v8;
    else
      return 0;
  }
  return result;
}

double IOReportStateGetDutyCycle(const __CFDictionary *a1, int a2)
{
  int v4;
  unint64_t v5;
  int v6;
  __int128 v8;
  __int128 v9;
  unint64_t v10;

  if (!a1)
    return NAN;
  v8 = 0u;
  v9 = 0u;
  v10 = 0;
  if (!getChannelType(a1, &v10) && v10 == 2)
  {
    v4 = WORD2(v10);
    if (WORD2(v10))
    {
      v5 = 0;
      v6 = 0;
      while (!_getStateValues(a1, v6, &v8))
      {
        v5 += v9;
        if (v4 == ++v6)
        {
          if (v5 && !_getStateValues(a1, a2, &v8))
            return (double)(unint64_t)v9 / (double)v5;
          return NAN;
        }
      }
    }
  }
  return NAN;
}

uint64_t IOReportStateGetCurrent(const __CFDictionary *a1)
{
  UInt8 *RawElements;
  UInt8 *v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t *v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unsigned __int16 v12;
  unint64_t v13;

  v12 = 0;
  if (!a1)
    return 0xFFFFFFFFLL;
  RawElements = getRawElements(a1, &v12, 2);
  if (!RawElements)
    return 0xFFFFFFFFLL;
  v3 = RawElements;
  v4 = v12;
  v13 = 0;
  if (getChannelType(a1, &v13) || v13 != 2 || WORD2(v13) != v4 || !v12)
    return 0xFFFFFFFFLL;
  v5 = 0;
  v6 = 0;
  v7 = (unint64_t *)(v3 + 24);
  LODWORD(result) = -1;
  do
  {
    v10 = *v7;
    v7 += 8;
    v9 = v10;
    v11 = v10 > v6;
    if (v10 <= v6)
      result = result;
    else
      result = v5;
    if (v11)
      v6 = v9;
    ++v5;
  }
  while (v12 != v5);
  return result;
}

CFMutableDictionaryRef IOReportSampleCreateDelta(CFDictionaryRef theDict, const __CFDictionary *a2, CFErrorRef *a3)
{
  CFMutableDictionaryRef MutableCopy;

  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  if (_compareSamples(theDict, a2, MutableCopy, a3))
  {
    CFRelease(MutableCopy);
    return 0;
  }
  return MutableCopy;
}

__CFString *IOReportSampleCopyDescription(const __CFDictionary *a1, char a2, const char *a3)
{
  const char *v5;
  CFMutableStringRef Mutable;
  __CFString *v7;
  int Format;
  UInt8 *RawElements;
  const __CFString *ChannelName;
  const __CFString *v11;
  const char *CStringPtr;
  void *v13;
  void *v14;
  const char *v15;
  const void *UnitLabel;
  const void *v17;
  uint64_t v18;
  unint64_t v19;
  UInt8 *v20;
  CFStringRef v21;
  __CFArray *NameForIndex;
  const __CFString *v23;
  void *v24;
  int StateValues;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t Unit;
  double v30;
  double DutyCycle;
  __CFString *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int HistogramValues;
  unint64_t v37;
  CFMutableStringRef v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  unint64_t IntegerValue;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int16 v56;
  __int128 v57;
  __int128 v58;
  char buffer[8];
  uint64_t v60;
  int v61;
  char __str[16];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v56 = 0;
  strcpy(__str, "<unknown>");
  v5 = "";
  if (a3)
    v5 = a3;
  v53 = v5;
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    v13 = 0;
    v14 = 0;
    if ((a2 & 1) == 0)
    {
LABEL_64:
      v7 = 0;
      goto LABEL_65;
    }
    goto LABEL_9;
  }
  v7 = Mutable;
  Format = IOReportChannelGetFormat(a1);
  RawElements = getRawElements(a1, &v56, Format);
  ChannelName = IOReportChannelGetChannelName(a1);
  if (!ChannelName)
  {
    v13 = 0;
    goto LABEL_14;
  }
  v11 = ChannelName;
  CStringPtr = CFStringGetCStringPtr(ChannelName, 0x8000100u);
  if (!CStringPtr)
  {
    v13 = _copyUTF8Chars(v11);
    if (v13)
    {
LABEL_16:
      v14 = v13;
      if (!RawElements)
        goto LABEL_63;
      goto LABEL_17;
    }
LABEL_14:
    if (RawElements)
    {
      v13 = __str;
      snprintf(__str, 0xAuLL, "%#llx", *((_QWORD *)RawElements + 1));
      v14 = 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v13 = (void *)CStringPtr;
  v14 = 0;
  if (!RawElements)
  {
LABEL_63:
    CFRelease(v7);
    if ((a2 & 1) == 0)
      goto LABEL_64;
LABEL_9:
    v15 = "???";
    if (v13)
      v15 = (const char *)v13;
    v7 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%s%32s =  %s \n"), v53, v15, "error");
    goto LABEL_65;
  }
LABEL_17:
  UnitLabel = IOReportChannelGetUnitLabel(a1);
  if (v56)
  {
    v17 = UnitLabel;
    v52 = v14;
    v51 = a2;
    v18 = 0;
    v19 = 0;
    v20 = RawElements + 32;
    while (2)
    {
      v54 = 0;
      v55 = 0;
      *(_QWORD *)buffer = 0;
      v60 = 0;
      v61 = 0;
      switch(IOReportChannelGetFormat(a1))
      {
        case 1u:
          IntegerValue = IOReportSimpleGetIntegerValue(a1, 0);
          v21 = CFStringCreateWithFormat(0, 0, CFSTR("%s%32s = { %12lld %@ }\n"), v53, v13, IntegerValue, v17, v44, v45, v46, v47, v48);
          goto LABEL_58;
        case 2u:
          NameForIndex = IOReportStateGetNameForIndex(a1, v19);
          if (!NameForIndex
            || (v23 = (const __CFString *)NameForIndex,
                (v24 = (void *)CFStringGetCStringPtr((CFStringRef)NameForIndex, 0x8000100u)) == 0)
            && (v24 = buffer, !CFStringGetCString(v23, buffer, 20, 0x8000100u)))
          {
            v57 = 0u;
            v58 = 0u;
            StateValues = _getStateValues(a1, v19, &v57);
            v26 = v57;
            if (StateValues)
              v26 = 0x8000000000000000;
            v24 = buffer;
            snprintf(buffer, 0x14uLL, "%#llx", v26);
          }
          v57 = 0u;
          v58 = 0u;
          if (_getStateValues(a1, v19, &v57))
            v27 = 0x8000000000000000;
          else
            v27 = *((_QWORD *)&v57 + 1);
          v57 = 0u;
          v58 = 0u;
          if (_getStateValues(a1, v19, &v57))
            v28 = 0x8000000000000000;
          else
            v28 = v58;
          Unit = IOReportChannelGetUnit(a1);
          v30 = IOReportScaleValue(v28, Unit, 0x100000000000000uLL);
          DutyCycle = IOReportStateGetDutyCycle(a1, v19);
          v32 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%s%20s[%8s] = { # %-8llu %9.3e %s / %4.1f%% }\n"), v53, v13, v24, v27, *(_QWORD *)&v30, "s", DutyCycle * 100.0);
          goto LABEL_55;
        case 3u:
          if (IOReportHistogramGetBucketBounds(a1, v19, &v55, &v54))
            goto LABEL_62;
          v57 = 0u;
          v58 = 0u;
          if (_getHistogramValues(a1, v19, &v57))
            v33 = 0x8000000000000000;
          else
            v33 = v57;
          if (v33)
          {
            if (v33 == 0x8000000000000000)
              goto LABEL_62;
            v49 = v54;
            v50 = v55;
            v57 = 0u;
            v58 = 0u;
            if (_getHistogramValues(a1, v19, &v57))
              v34 = 0x8000000000000000;
            else
              v34 = *((_QWORD *)&v57 + 1);
            v57 = 0u;
            v58 = 0u;
            if (_getHistogramValues(a1, v19, &v57))
              v35 = 0x8000000000000000;
            else
              v35 = v58;
            v57 = 0u;
            v58 = 0u;
            HistogramValues = _getHistogramValues(a1, v19, &v57);
            v37 = *((_QWORD *)&v58 + 1);
            if (HistogramValues)
              v37 = 0x8000000000000000;
            v21 = CFStringCreateWithFormat(0, 0, CFSTR("%s%20s[%12lld - %12lld %@] = { m %12lld; M %12lld; s %12lld; # %12llu }\n"),
                    v53,
                    v13,
                    v50,
                    v49,
                    v17,
                    v34,
                    v35,
                    v37,
                    v33);
          }
          else
          {
            v21 = CFStringCreateWithFormat(0, 0, CFSTR("%s%20s[%12lld - %12lld %@] = { <no hits>; # 0 }\n"),
                    v53,
                    v13,
                    v55,
                    v54,
                    v17,
                    v45,
                    v46,
                    v47,
                    v48);
          }
LABEL_58:
          v32 = (__CFString *)v21;
          if (v21)
            goto LABEL_59;
          goto LABEL_62;
        case 4u:
          v38 = CFStringCreateMutable(0, 0);
          if (!v38)
            goto LABEL_62;
          v32 = v38;
          v39 = 0;
          break;
        default:
          goto LABEL_62;
      }
      do
      {
        if (*(_QWORD *)&v20[8 * v39] != 0x8000000000000000)
        {
          v40 = CFStringCreateWithFormat(0, 0, CFSTR("%s%28s[%4d] = { %12lld %@ }\n"), v53, v13, v18 + v39, *(_QWORD *)&v20[8 * v39], v17);
          if (!v40)
          {
            CFRelease(v32);
LABEL_62:
            a2 = v51;
            v14 = v52;
            goto LABEL_63;
          }
          v41 = v40;
          CFStringAppend(v32, v40);
          CFRelease(v41);
        }
        ++v39;
      }
      while (v39 != 4);
LABEL_55:
      if (!v32)
        goto LABEL_62;
LABEL_59:
      CFStringAppend(v7, v32);
      CFRelease(v32);
      ++v19;
      v18 += 4;
      v20 += 64;
      if (v19 < v56)
        continue;
      break;
    }
    v14 = v52;
  }
LABEL_65:
  if (v14)
    free(v14);
  return v7;
}

void *_copyUTF8Chars(const __CFString *a1)
{
  CFIndex Length;
  size_t MaximumSizeForEncoding;
  CFIndex v4;
  void *v5;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (!MaximumSizeForEncoding)
    return 0;
  v4 = MaximumSizeForEncoding;
  v5 = malloc_type_malloc(MaximumSizeForEncoding, 0x68F1A396uLL);
  if (v5 && !CFStringGetCString(a1, (char *)v5, v4, 0x8000100u))
  {
    free(v5);
    return 0;
  }
  return v5;
}

double IOReportScaleValue(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11[7];

  if (HIBYTE(a2) != HIBYTE(a3))
    return NAN;
  v11[5] = v3;
  v11[6] = v4;
  v10 = 0;
  v11[0] = 0;
  if (getFactorsFromScale(a2 & 0xFFFFFFFFFFFFFFLL, v11, (uint64_t *)&v10))
    return NAN;
  v7 = v10;
  v8 = v11[0];
  if (getFactorsFromScale(a3 & 0xFFFFFFFFFFFFFFLL, v11, (uint64_t *)&v10))
    return NAN;
  else
    return (double)a1 * (double)v8 / (double)v7 / (double)(unint64_t)v11[0] * (double)v10;
}

uint64_t IOReportWriteStringUTF8(int a1, CFStringRef theString)
{
  const char *CStringPtr;
  const char *v5;
  char *v6;
  uint64_t v7;
  size_t v8;
  ssize_t v9;
  unsigned int v10;
  int v11;

  if (!theString)
    return 3758097090;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    v5 = CStringPtr;
    v6 = 0;
  }
  else
  {
    v5 = (const char *)_copyUTF8Chars(theString);
    v6 = (char *)v5;
    if (!v5)
      return 3758097085;
  }
  v8 = strlen(v5);
  v9 = write(a1, v5, v8);
  v10 = -536870169;
  if (v9 == v8)
    v11 = 0;
  else
    v11 = -536870212;
  if (v9 >= v8)
    v10 = v11;
  if (v9 >= 0)
    v7 = v10;
  else
    v7 = 3758097098;
  if (v6)
    free(v6);
  return v7;
}

uint64_t getFactorsFromScale(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  if ((a1 & 0xFF000000000000) != 0)
    return 3758097090;
  v4 = a1 & 0x7FFFFFFF;
  if ((a1 & 0x80000000) != 0)
    v4 = 1;
  v5 = a1 & 0x7FFFFFFF;
  if ((a1 & 0x7FFFFFFF) != 0)
    v6 = v4;
  else
    v6 = 1;
  if ((a1 & 0x80000000) == 0 || v5 == 0)
    v5 = 1;
  if (BYTE4(a1))
  {
    v8 = (char)(BYTE4(a1) - 127);
    if (SBYTE4(a1) > -2)
    {
      v10 = 1;
      if (BYTE4(a1) != 127)
      {
        do
          v10 *= 10;
        while (!__CFADD__(v8++, 1));
      }
      v5 *= v10;
    }
    else
    {
      v9 = 1;
      do
      {
        v9 *= 10;
        --v8;
      }
      while (v8);
      v6 *= v9;
    }
  }
  v3 = 0;
  v12 = v5 << (127 - BYTE5(a1));
  v13 = v6 << (BYTE5(a1) - 127);
  if (SBYTE5(a1) <= -2)
    v12 = v5;
  else
    v13 = v6;
  if (BYTE5(a1))
  {
    v6 = v13;
    v5 = v12;
  }
  *a2 = v6;
  *a3 = v5;
  return v3;
}

const __CFDictionary *IOReportCreateSamplesProcessed(CFDictionaryRef theDict, CFErrorRef *a2)
{
  const __CFDictionary *MutableCopy;
  const __CFDictionary *v4;
  int v5;
  int v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  v4 = MutableCopy;
  if (MutableCopy)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 0x40000000;
    v8[2] = ___processSamples_block_invoke;
    v8[3] = &unk_24BF02388;
    v8[4] = &v9;
    v5 = IOReportIterate(MutableCopy, (uint64_t)v8);
    v6 = v5;
    if (a2 && v5)
    {
      *a2 = createCFErr(v5, (const char *)v10[3]);
      _Block_object_dispose(&v9, 8);
LABEL_6:
      CFRelease(v4);
      return 0;
    }
    _Block_object_dispose(&v9, 8);
    if (v6)
      goto LABEL_6;
  }
  return v4;
}

uint64_t ___processSamples_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  const __CFString *ChannelName;
  int Format;
  unint64_t IntegerValue;
  uint64_t v7;
  uint64_t v8;
  int BucketCount;
  const __CFAllocator *v10;
  CFMutableArrayRef Mutable;
  __CFArray *v12;
  uint64_t v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  unint64_t BucketHits;
  unint64_t BucketMinValue;
  unint64_t BucketMaxValue;
  unint64_t BucketSum;
  const __CFString *v20;
  int Count;
  const __CFAllocator *v22;
  CFMutableArrayRef v23;
  int v24;
  const CFDictionaryValueCallBacks *v25;
  CFMutableDictionaryRef v26;
  __CFDictionary *v27;
  unint64_t v28;
  double DutyCycle;
  unint64_t Residency;
  unint64_t IDForIndex;
  CFStringRef v32;
  CFStringRef v33;
  uint64_t v35;
  uint64_t v36;

  ChannelName = IOReportChannelGetChannelName(a2);
  CFDictionaryAddValue(a2, CFSTR("ChannelName"), ChannelName);
  Format = IOReportChannelGetFormat(a2);
  if (Format == 3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = "error processing histogram report sample";
    BucketCount = IOReportHistogramGetBucketCount(a2);
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v12 = Mutable;
      v35 = 0;
      v36 = 0;
      CFDictionaryAddValue(a2, CFSTR("Format"), CFSTR("HistogramReport"));
      if (BucketCount >= 1)
      {
        v13 = 0;
        do
        {
          v14 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!v14)
            goto LABEL_26;
          v15 = v14;
          _add_uint64_val(v14, CFSTR("BucketIndex"), v13);
          IOReportHistogramGetBucketBounds(a2, v13, &v36, &v35);
          _add_uint64_val(v15, CFSTR("LowBound"), v36);
          _add_uint64_val(v15, CFSTR("HighBound"), v35);
          BucketHits = IOReportHistogramGetBucketHits(a2, v13);
          _add_uint64_val(v15, CFSTR("BucketHits"), BucketHits);
          BucketMinValue = IOReportHistogramGetBucketMinValue(a2, v13);
          _add_uint64_val(v15, CFSTR("BucketMin"), BucketMinValue);
          BucketMaxValue = IOReportHistogramGetBucketMaxValue(a2, v13);
          _add_uint64_val(v15, CFSTR("BucketMax"), BucketMaxValue);
          BucketSum = IOReportHistogramGetBucketSum(a2, v13);
          _add_uint64_val(v15, CFSTR("BucketSum"), BucketSum);
          CFArrayAppendValue(v12, v15);
          CFRelease(v15);
        }
        while (BucketCount != ++v13);
      }
      if (CFArrayGetCount(v12))
      {
        v20 = CFSTR("HistogramReport");
LABEL_22:
        CFDictionaryAddValue(a2, v20, v12);
      }
LABEL_23:
      _processUnit(a2);
      _cleanup_sample(a2);
      v8 = 0;
LABEL_27:
      CFRelease(v12);
      return v8;
    }
    return 1;
  }
  if (Format == 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = "error processing state report sample";
    Count = IOReportStateGetCount(a2);
    v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v23 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (v23)
    {
      v12 = v23;
      CFDictionaryAddValue(a2, CFSTR("Format"), CFSTR("StateReport"));
      if (Count >= 1)
      {
        v24 = 0;
        v25 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
        while (1)
        {
          v26 = CFDictionaryCreateMutable(v22, 0, MEMORY[0x24BDBD6A0], v25);
          if (!v26)
            break;
          v27 = v26;
          v28 = IOReportStateGetInTransitions(a2, v24);
          _add_uint64_val(v27, CFSTR("InTransitions"), v28);
          DutyCycle = IOReportStateGetDutyCycle(a2, v24);
          _add_double_val(v27, CFSTR("DutyCycle"), DutyCycle);
          Residency = IOReportStateGetResidency(a2, v24);
          _add_uint64_val(v27, CFSTR("Residency"), Residency);
          IDForIndex = IOReportStateGetIDForIndex(a2, v24);
          _add_uint64_val(v27, CFSTR("StateID"), IDForIndex);
          v32 = copyPrintableIDString(IDForIndex);
          if (v32)
          {
            v33 = v32;
            CFDictionaryAddValue(v27, CFSTR("StateName"), v32);
            CFRelease(v33);
          }
          CFArrayAppendValue(v12, v27);
          CFRelease(v27);
          if (Count == ++v24)
            goto LABEL_20;
        }
LABEL_26:
        v8 = 1;
        goto LABEL_27;
      }
LABEL_20:
      if (CFArrayGetCount(v12))
      {
        v20 = CFSTR("StateReport");
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    return 1;
  }
  if (Format != 1)
    return 16;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = "error processing simple report sample";
  IntegerValue = IOReportSimpleGetIntegerValue(a2, 0);
  if (IntegerValue == 0x8000000000000000)
    return 1;
  v7 = IntegerValue;
  CFDictionaryAddValue(a2, CFSTR("Format"), CFSTR("SimpleReport"));
  _add_uint64_val(a2, CFSTR("SimpleReport"), v7);
  _processUnit(a2);
  _cleanup_sample(a2);
  return 0;
}

void _processUnit(const __CFDictionary *a1)
{
  unint64_t Unit;
  unint64_t v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  const void *UnitLabel;
  CFStringRef v7;
  CFStringRef v8;
  unint64_t v9;
  unint64_t v10;

  Unit = IOReportChannelGetUnit(a1);
  if ((Unit & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v3 = Unit;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v5 = Mutable;
      UnitLabel = IOReportChannelGetUnitLabel(a1);
      if (UnitLabel)
        CFDictionaryAddValue(v5, CFSTR("UnitLabel"), UnitLabel);
      v9 = 0;
      v10 = 0;
      if (!getFactorsFromScale(v3 & 0xFFFFFFFFFFFFFFLL, (uint64_t *)&v10, (uint64_t *)&v9))
        _add_double_val(v5, CFSTR("UnitScale"), (double)v10 / (double)v9);
      v7 = copyUnitLabel(v3 & 0xFF00000000000000);
      if (v7)
      {
        v8 = v7;
        CFDictionaryAddValue(v5, CFSTR("BaseUnitLabel"), v7);
        CFRelease(v8);
      }
      CFDictionaryAddValue(a1, CFSTR("Unit"), v5);
      CFDictionaryAddValue(a1, CFSTR("Units"), v5);
      CFRelease(v5);
    }
  }
}

void _cleanup_sample(__CFDictionary *a1)
{
  CFDictionaryRemoveValue(a1, CFSTR("IOReportChannelInfo"));
  CFDictionaryRemoveValue(a1, CFSTR("DriverID"));
  CFDictionaryRemoveValue(a1, CFSTR("LegendChannel"));
  CFDictionaryRemoveValue(a1, CFSTR("ProcessedChannelConfig"));
  CFDictionaryRemoveValue(a1, CFSTR("RawElements"));
}

void _add_uint64_val(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongLongType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void _add_double_val(__CFDictionary *a1, const void *a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  double valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void IOReportIterateSamplesRaw_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_206347000, MEMORY[0x24BDACB70], v0, "iterated %d channels with %d iterations", v1, v2, v3, v4, v5);
}

void _visitSample_cold_1(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  IOReportChannelGetDriverName(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_206347000, MEMORY[0x24BDACB70], v1, "absurd element count! nelems=%d, %@ -- %@ -- %@ -- %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
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

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x24BDBBD18](theData, range.location, range.length, newBytes, newLength);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE78](err);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

uint32_t IOObjectGetUserRetainCount(io_object_t object)
{
  return MEMORY[0x24BDD86E8](*(_QWORD *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
  MEMORY[0x24BDAEEC0](__b, __pattern8, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

