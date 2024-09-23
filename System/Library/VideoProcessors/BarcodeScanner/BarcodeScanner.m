uint64_t sbp_bcs_setProperty(uint64_t a1, const void *a2, const __CFArray *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  CFTypeID TypeID;
  CFIndex v8;
  int v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *ValueAtIndex;
  _BOOL4 v14;
  CFTypeID v15;
  CGSize v16;
  CFTypeID v17;
  int Value;
  uint64_t result;
  int v20;
  int v21;
  CFNumberRef v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  CGSize size;
  CFTypeID v27;
  Boolean v28;
  CGSize v29;
  CGPoint v30;
  CGRect rect;
  CGRect v32;
  CGRect v33;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16))
    return FigSignalErrorAt();
  v6 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10498]))
  {
    if (a3)
    {
      TypeID = CFArrayGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        if (*(_QWORD *)(v6 + 1016))
        {
          if (CFArrayGetCount(a3) < 1)
          {
            v14 = 0;
          }
          else
          {
            v8 = 0;
            v9 = 0;
            v10 = (const void *)*MEMORY[0x24BE7BE08];
            v11 = (const void *)*MEMORY[0x24BE7BE80];
            v12 = (const void *)*MEMORY[0x24BE7BE48];
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex(a3, v8);
              if (CFEqual(ValueAtIndex, v10) || CFEqual(ValueAtIndex, v11) || CFEqual(ValueAtIndex, v12))
                v9 = 1;
              ++v8;
            }
            while (CFArrayGetCount(a3) > v8);
            v14 = v9 != 0;
          }
          MEMORY[0x22E316610](*(_QWORD *)(v6 + 1064));
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 1016), (const void *)*MEMORY[0x24BE7BDA0], a3);
          MEMORY[0x22E31661C](*(_QWORD *)(v6 + 1064));
          if (*(_BYTE *)(v6 + 112))
            v20 = 1;
          else
            v20 = v14;
          if (v20)
            v21 = 10;
          else
            v21 = 0;
          LODWORD(rect.origin.x) = v21;
          v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &rect);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 1016), (const void *)*MEMORY[0x24BE7BD90], v22);
          if (v22)
            CFRelease(v22);
        }
        return 0;
      }
    }
    return FigSignalErrorAt();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10470]))
  {
    if (a3)
    {
      v15 = CFDictionaryGetTypeID();
      if (v15 == CFGetTypeID(a3))
      {
        v16 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
        v30 = (CGPoint)*MEMORY[0x24BDBF090];
        rect.origin = (CGPoint)*MEMORY[0x24BDBF090];
        v29 = v16;
        rect.size = v16;
        if (!CGRectMakeWithDictionaryRepresentation(a3, &rect))
          return FigSignalErrorAt();
        v32.origin.x = 0.0;
        v32.origin.y = 0.0;
        v32.size.width = 1.0;
        v32.size.height = 1.0;
        if (CGRectIntersectsRect(rect, v32))
        {
          v33.origin.x = 0.0;
          v33.origin.y = 0.0;
          v33.size.width = 1.0;
          v33.size.height = 1.0;
          rect = CGRectIntersection(rect, v33);
        }
        else
        {
          rect.origin = v30;
          rect.size = v29;
        }
        MEMORY[0x22E316610](*(_QWORD *)(v6 + 1064));
        size = rect.size;
        *(CGPoint *)(v6 + 1032) = rect.origin;
        *(CGSize *)(v6 + 1048) = size;
        MEMORY[0x22E31661C](*(_QWORD *)(v6 + 1064));
        return 0;
      }
    }
    return FigSignalErrorAt();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10480]))
  {
    v17 = CFGetTypeID(a3);
    if (v17 == CFBooleanGetTypeID())
    {
      Value = CFBooleanGetValue(a3);
      result = 0;
      *(_BYTE *)(v6 + 1209) = Value;
      *(_BYTE *)(v6 + 58) = Value == 0;
      return result;
    }
    return FigSignalErrorAt();
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10488]))
  {
    result = *(_QWORD *)(v6 + 1024);
    if (!result)
      return result;
    if (*(_QWORD *)(v6 + 1016))
      MRCContextPreflightForDecoderUsingOptions();
  }
  else
  {
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10490]))
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10478]))
        return 4294954512;
      v27 = CFGetTypeID(a3);
      if (v27 == CFBooleanGetTypeID())
      {
        v28 = CFBooleanGetValue(a3);
        result = 0;
        *(_BYTE *)(v6 + 112) = v28;
        return result;
      }
      return FigSignalErrorAt();
    }
    v23 = MEMORY[0x24BDC0D40];
    v24 = *MEMORY[0x24BDC0D40];
    *(_OWORD *)(v6 + 1076) = *MEMORY[0x24BDC0D40];
    v25 = *(_QWORD *)(v23 + 16);
    *(_QWORD *)(v6 + 1092) = v25;
    *(_OWORD *)(v6 + 1100) = v24;
    *(_QWORD *)(v6 + 1116) = v25;
    *(_QWORD *)(v6 + 160) = 0;
    clearBarcodes();
  }
  return 0;
}

uint64_t sbp_bcs_setOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16))
    return FigSignalErrorAt();
  *(_QWORD *)DerivedStorage = a2;
  *(_QWORD *)(DerivedStorage + 8) = a3;
  return 0;
}

uint64_t FigSampleBufferProcessorCreateForBarcodeScanner(uint64_t a1, const __CFDictionary *a2, CFTypeRef *a3)
{
  const __CFAllocator *v5;
  uint64_t v6;
  uint64_t DerivedStorage;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  const void *v11;
  dispatch_group_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *Value;
  const __CFBoolean *v18;
  const void *v19;
  const __CFArray *v20;
  char *v21;
  int v22;
  char **v23;
  __int128 v24;
  uint64_t v25;
  const char *v26;
  int v27;
  const char *v28;
  int v29;
  int v30;
  const __CFArray *v31;
  uint64_t i;
  const char *CStringPtrAndBufferToFree;
  CFStringRef v34;
  VTSessionRef *v36;
  uint64_t v37;
  const void *v38;
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
  void *v55;
  __CFArray *theArray;
  __int128 v57;
  uint64_t v58;
  int v59;
  int valuePtr;
  CFTypeRef cf;
  void *v62;
  char *__stringp;
  void *values;
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
  char *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  char buffer[1024];
  uint64_t v98;
  CFRange v99;

  v98 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  valuePtr = 13;
  if (!a3)
    return FigSignalErrorAt();
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  FigSampleBufferProcessorGetClassID();
  v6 = CMDerivedObjectCreate();
  if ((_DWORD)v6)
  {
    v37 = v6;
    fig_log_get_emitter();
LABEL_56:
    FigDebugAssert3();
    goto LABEL_57;
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_QWORD *)(DerivedStorage + 1016) = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BD88], v8);
  if (v8)
    CFRelease(v8);
  v59 = 5000;
  v9 = CFNumberCreate(v5, kCFNumberSInt32Type, &v59);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BD98], v9);
  if (v9)
    CFRelease(v9);
  v58 = 196608;
  v10 = CFNumberCreate(v5, kCFNumberCFIndexType, &v58);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BD78], v10);
  if (v10)
    CFRelease(v10);
  v11 = (const void *)MRCContextCreateWithOptions();
  *(_QWORD *)(DerivedStorage + 1024) = v11;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BD80], v11);
  *(_OWORD *)(DerivedStorage + 1032) = 0u;
  *(_QWORD *)(DerivedStorage + 1048) = 0x3FF0000000000000;
  *(_QWORD *)(DerivedStorage + 1056) = 0x3FF0000000000000;
  *(_QWORD *)(DerivedStorage + 1064) = FigSimpleMutexCreate();
  *(_DWORD *)(DerivedStorage + 1200) = 0;
  *(_QWORD *)(DerivedStorage + 992) = FigSimpleMutexCreate();
  v12 = dispatch_group_create();
  *(_QWORD *)(DerivedStorage + 1008) = v12;
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v37 = 4294954516;
LABEL_57:
    if (cf)
      CFRelease(cf);
    return v37;
  }
  v13 = MEMORY[0x24BDC0D88];
  v14 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)(DerivedStorage + 1172) = *MEMORY[0x24BDC0D88];
  v15 = *(_QWORD *)(v13 + 16);
  *(_QWORD *)(DerivedStorage + 1188) = v15;
  *(_OWORD *)(DerivedStorage + 1148) = v14;
  *(_QWORD *)(DerivedStorage + 1164) = v15;
  *(_OWORD *)(DerivedStorage + 1124) = v14;
  *(_QWORD *)(DerivedStorage + 1140) = v15;
  *(_OWORD *)(DerivedStorage + 964) = v14;
  *(_QWORD *)(DerivedStorage + 980) = v15;
  v16 = MEMORY[0x24BDC0D40];
  *(_OWORD *)(DerivedStorage + 1076) = *MEMORY[0x24BDC0D40];
  *(_QWORD *)(DerivedStorage + 1092) = *(_QWORD *)(v16 + 16);
  *(_DWORD *)(DerivedStorage + 1204) = 1061158912;
  *(_BYTE *)(DerivedStorage + 1208) = 0;
  *(_DWORD *)(DerivedStorage + 168) = 0;
  *(_QWORD *)(DerivedStorage + 184) = 0;
  *(_BYTE *)(DerivedStorage + 112) = 0;
  *(_BYTE *)(DerivedStorage + 58) = 1;
  if (a2)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BDDCF80]);
    v18 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("DrawDebugInfo"));
    v19 = (const void *)*MEMORY[0x24BE10498];
    v20 = (const __CFArray *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE10498]);
    if (Value && CFStringGetCString(Value, buffer, 1024, 0))
    {
      v38 = v19;
      v96 = 0;
      v95 = 0u;
      v94 = 0u;
      v93 = 0u;
      v92 = 0u;
      v91 = 0u;
      v90 = 0u;
      v89 = 0u;
      v88 = 0u;
      v87 = 0u;
      v86 = 0u;
      v85 = 0u;
      v84 = 0u;
      v83 = 0u;
      v82 = 0u;
      __stringp = buffer;
      theArray = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
      v21 = strsep(&__stringp, " \t");
      v81 = v21;
      if (v21)
      {
        v22 = 0;
        v23 = &v81;
        do
        {
          if (*v21)
          {
            ++v22;
            if (++v23 >= (char **)buffer)
              break;
          }
          v21 = strsep(&__stringp, " \t");
          *v23 = v21;
        }
        while (v21);
        if (v22 >= 1)
        {
          v55 = (void *)*MEMORY[0x24BE7BE50];
          v54 = *MEMORY[0x24BE7BE58];
          v53 = *MEMORY[0x24BE7BE88];
          v52 = *MEMORY[0x24BE7BE18];
          v51 = *MEMORY[0x24BE7BE28];
          v50 = *MEMORY[0x24BE7BE20];
          v49 = *MEMORY[0x24BE7BE30];
          v48 = *MEMORY[0x24BE7BE38];
          v47 = *MEMORY[0x24BE7BE10];
          v46 = *MEMORY[0x24BE7BE40];
          v45 = *MEMORY[0x24BE7BE60];
          v43 = *MEMORY[0x24BE7BE70];
          v44 = *MEMORY[0x24BE7BE68];
          v42 = *MEMORY[0x24BE7BE48];
          v41 = *MEMORY[0x24BE7BE80];
          v39 = *MEMORY[0x24BE7BE78];
          v40 = *MEMORY[0x24BE7BE08];
          v24 = v22;
          do
          {
            v57 = v24;
            v25 = SDWORD1(v24);
            v26 = (&v81)[SDWORD1(v24)];
            v27 = strcmp(v26, "-pixelFormat");
            if ((_DWORD)v57 == 1 || v27)
            {
              if (!strcmp(v26, "-drawDebugInfo"))
              {
                *(_BYTE *)(DerivedStorage + 48) = 1;
LABEL_37:
                *((_QWORD *)&v24 + 1) = *((_QWORD *)&v57 + 1);
                *(int32x2_t *)&v24 = vadd_s32(*(int32x2_t *)&v57, (int32x2_t)0x1FFFFFFFFLL);
                continue;
              }
              if (!strcmp(v26, "-list"))
              {
                values = v55;
                v65 = v54;
                v66 = v53;
                v67 = v52;
                v68 = v51;
                v69 = v50;
                v70 = v49;
                v71 = v48;
                v72 = v47;
                v73 = v46;
                v74 = v45;
                v75 = v44;
                v76 = v43;
                v77 = v42;
                v78 = v41;
                v79 = v40;
                v80 = v39;
                puts("Symbologies usable with -symbology:");
                for (i = 0; i != 136; i += 8)
                {
                  v62 = 0;
                  CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
                  printf("\t%s\n", CStringPtrAndBufferToFree);
                  free(v62);
                }
                goto LABEL_37;
              }
              if (strcmp(v26, "-symbology"))
              {
                if (strcmp(v26, "-allSymbologies"))
                {
LABEL_55:
                  fig_log_get_emitter();
                  v37 = 4294954514;
                  goto LABEL_56;
                }
                values = v55;
                v65 = v54;
                v66 = v53;
                v67 = v52;
                v68 = v51;
                v69 = v50;
                v70 = v49;
                v71 = v48;
                v72 = v47;
                v73 = v46;
                v74 = v45;
                v75 = v44;
                v76 = v43;
                v77 = v42;
                v78 = v41;
                v79 = v40;
                v80 = v39;
                v31 = CFArrayCreate(v5, (const void **)&values, 17, MEMORY[0x24BDBD690]);
                v99.length = CFArrayGetCount(v31);
                v99.location = 0;
                CFArrayAppendArray(theArray, v31, v99);
                if (v31)
                  CFRelease(v31);
                goto LABEL_37;
              }
              v34 = CFStringCreateWithCString(v5, (&v81)[v25 + 1], 0x8000100u);
              CFArrayAppendValue(theArray, v34);
              if (v34)
                CFRelease(v34);
            }
            else
            {
              v28 = (&v81)[v25 + 1];
              if (!strcmp(v28, "420v"))
              {
                v30 = 875704438;
              }
              else
              {
                v29 = strcmp(v28, "420f");
                v30 = 875704422;
                if (v29)
                  goto LABEL_55;
              }
              *(_DWORD *)(DerivedStorage + 1200) = v30;
            }
            *((_QWORD *)&v24 + 1) = *((_QWORD *)&v57 + 1);
            *(int32x2_t *)&v24 = vadd_s32(*(int32x2_t *)&v57, (int32x2_t)0x2FFFFFFFELL);
          }
          while ((int)v24 > 0);
        }
      }
      v19 = v38;
      if (theArray)
      {
        if (CFArrayGetCount(theArray) >= 1 && *(_QWORD *)(DerivedStorage + 1016))
        {
          MEMORY[0x22E316610](*(_QWORD *)(DerivedStorage + 1064));
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BDA0], theArray);
          MEMORY[0x22E31661C](*(_QWORD *)(DerivedStorage + 1064));
        }
        CFRelease(theArray);
      }
    }
    if (v18)
      *(_BYTE *)(DerivedStorage + 48) = CFBooleanGetValue(v18);
    if (v20)
      sbp_bcs_setProperty((uint64_t)cf, v19, v20);
  }
  v36 = (VTSessionRef *)(DerivedStorage + 40);
  v37 = VTPixelTransferSessionCreate(v5, (VTPixelTransferSessionRef *)(DerivedStorage + 40));
  if ((_DWORD)v37)
  {
    fig_log_get_emitter();
    goto LABEL_56;
  }
  VTSessionSetProperty(*v36, (CFStringRef)*MEMORY[0x24BDF9670], (CFTypeRef)*MEMORY[0x24BDBD270]);
  VTSessionSetProperty(*v36, (CFStringRef)*MEMORY[0x24BDF9658], (CFTypeRef)*MEMORY[0x24BDF94A0]);
  *a3 = cf;
  return v37;
}

uint64_t sbp_bcs_invalidate()
{
  uint64_t DerivedStorage;
  _QWORD *v1;
  __CVPixelBufferPool *v2;
  OpaqueVTPixelTransferSession *v3;
  const void *v4;
  NSObject *v5;
  __CFDictionary *v6;
  const void *v7;
  const void *v8;
  uint64_t i;
  _QWORD *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_QWORD *)DerivedStorage = 0;
  if (!*(_BYTE *)(DerivedStorage + 16))
  {
    v1 = (_QWORD *)DerivedStorage;
    *(_BYTE *)(DerivedStorage + 16) = 1;
    v2 = *(__CVPixelBufferPool **)(DerivedStorage + 24);
    if (v2)
    {
      CVPixelBufferPoolRelease(v2);
      v1[3] = 0;
    }
    if (v1[4])
    {
      FigFormatDescriptionRelease();
      v1[4] = 0;
    }
    v3 = (OpaqueVTPixelTransferSession *)v1[5];
    if (v3)
    {
      VTPixelTransferSessionInvalidate(v3);
      v4 = (const void *)v1[5];
      if (v4)
      {
        CFRelease(v4);
        v1[5] = 0;
      }
    }
    v5 = v1[126];
    if (v5)
    {
      dispatch_release(v5);
      v1[126] = 0;
    }
    v6 = (__CFDictionary *)v1[127];
    if (v6)
    {
      CFDictionaryRemoveAllValues(v6);
      v7 = (const void *)v1[127];
      if (v7)
        CFRelease(v7);
      v1[127] = 0;
    }
    v8 = (const void *)v1[128];
    if (v8)
    {
      CFRelease(v8);
      v1[128] = 0;
    }
    for (i = 0; i != 96; i += 24)
    {
      v10 = &v1[i];
      v11 = (const void *)v1[i + 41];
      if (v11)
      {
        CFRelease(v11);
        v10[41] = 0;
      }
      v12 = (const void *)v10[42];
      if (v12)
      {
        CFRelease(v12);
        v10[42] = 0;
      }
      v13 = (const void *)v1[i + 43];
      if (v13)
      {
        CFRelease(v13);
        v1[i + 43] = 0;
      }
    }
    v14 = (const void *)v1[23];
    if (v14)
    {
      CFRelease(v14);
      v1[23] = 0;
    }
  }
  return 0;
}

uint64_t sbp_bcs_finalize()
{
  uint64_t DerivedStorage;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  sbp_bcs_invalidate();
  if (*(_QWORD *)(DerivedStorage + 992))
  {
    FigSimpleMutexDestroy();
    *(_QWORD *)(DerivedStorage + 992) = 0;
  }
  result = *(_QWORD *)(DerivedStorage + 1064);
  if (result)
  {
    result = FigSimpleMutexDestroy();
    *(_QWORD *)(DerivedStorage + 1064) = 0;
  }
  return result;
}

__CFString *sbp_bcs_copyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  if (*(_BYTE *)(CMBaseObjectGetDerivedStorage() + 16))
    return 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<FigSampleBufferProcessor_BarcodeScanner %p>"), a1);
  return Mutable;
}

uint64_t sbp_bcs_copyProperty(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage;
  uint64_t result;
  uint64_t v8;
  __CFDictionary *Mutable;
  __CFDictionary *IOSurfacePropertiesDictionary;
  __CFArray *v11;
  int v12;
  CFNumberRef v13;
  CFNumberRef v14;
  const __CFNumber *Value;
  const void *PixelBufferCacheModeArray;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v18;
  __CFDictionary *v19;
  int v20;
  int valuePtr;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16) || !a4)
    return FigSignalErrorAt();
  v8 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDDCF88]))
  {
    Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(0);
    v11 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    valuePtr = 875704438;
    v12 = *(_DWORD *)(v8 + 1200);
    if (v12 == 875704438 || !v12)
    {
      v13 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v11, v13);
      CFRelease(v13);
      v12 = *(_DWORD *)(v8 + 1200);
    }
    valuePtr = 875704422;
    if (v12 == 875704422 || !v12)
    {
      v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v11, v14);
      CFRelease(v14);
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v11);
    CFRelease(v11);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
    Value = (const __CFNumber *)CFDictionaryGetValue(IOSurfacePropertiesDictionary, (const void *)*MEMORY[0x24BDD8E40]);
    if (Value)
    {
      v20 = 0;
      CFNumberGetValue(Value, kCFNumberSInt32Type, &v20);
      PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC55F0], PixelBufferCacheModeArray);
      CFRelease(PixelBufferCacheModeArray);
    }
    CFRelease(IOSurfacePropertiesDictionary);
    goto LABEL_14;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10470]))
  {
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(v8 + 1032));
    if (DictionaryRepresentation)
    {
      v18 = DictionaryRepresentation;
      result = 0;
      *a4 = v18;
      return result;
    }
    return 4294954510;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE10498]))
    return 4294954512;
  v19 = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v8 + 1016), (const void *)*MEMORY[0x24BE7BDA0]);
  if (v19)
  {
    Mutable = v19;
    CFRetain(v19);
LABEL_14:
    result = 0;
    *a4 = Mutable;
    return result;
  }
  Mutable = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
    goto LABEL_14;
  return 4294954510;
}

__CFDictionary *createIOSurfacePropertiesDictionary(int a1)
{
  const __CFDictionary *IOSurfacePropertiesDictionary;
  int v3;
  __CFDictionary *MutableCopy;
  CFNumberRef v5;
  int valuePtr;

  IOSurfacePropertiesDictionary = (const __CFDictionary *)FigCreateIOSurfacePropertiesDictionary();
  if (a1)
    v3 = 1024;
  else
    v3 = 1280;
  valuePtr = v3;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, IOSurfacePropertiesDictionary);
  CFRelease(IOSurfacePropertiesDictionary);
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDD8E40], v5);
  CFRelease(v5);
  return MutableCopy;
}

uint64_t sbp_bcs_processSampleBuffer(void *a1, opaqueCMSampleBuffer *a2)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  const __CFDictionary *v7;
  CMTimeEpoch epoch;
  int v9;
  uint64_t v10;
  __CVBuffer *ImageBuffer;
  const void **v12;
  __CVPixelBufferPool *v13;
  __CVPixelBufferPool **v14;
  CFAllocatorRef *v15;
  const opaqueCMFormatDescription *v16;
  uint64_t v17;
  __CVBuffer *v18;
  OSType PixelFormatType;
  size_t Width;
  uint64_t v21;
  CVImageBufferRef v22;
  __CVBuffer *v23;
  __CFDictionary *v24;
  const __CFNumber *v26;
  int v27;
  __CFDictionary *Mutable;
  __CFArray *v29;
  CFNumberRef v30;
  const __CFAllocator *v31;
  CFNumberRef v32;
  CFNumberRef v33;
  __CFDictionary *IOSurfacePropertiesDictionary;
  const __CFNumber *Value;
  const void *PixelBufferCacheModeArray;
  unsigned int v37;
  CFNumberRef v38;
  unsigned int v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  __CFDictionary *v43;
  CFNumberRef v44;
  CVReturn v45;
  __CVPixelBufferPool *v46;
  uint64_t a_low;
  size_t v48;
  CVPixelBufferRef *v49;
  CVPixelBufferRef *v50;
  unint64_t v51;
  CVReturn PixelBuffer;
  uint64_t v53;
  const __CFBoolean *v54;
  const __CFBoolean *v55;
  CFTypeID v56;
  const __CFBoolean *v57;
  CFTypeID v58;
  const __CFBoolean *v59;
  const __CFBoolean *v60;
  CFTypeID v61;
  char v62;
  size_t Height;
  size_t v64;
  uint64_t v65;
  const __CFString *v66;
  const __CFDictionary *v67;
  __int128 v68;
  const __CFBoolean *v69;
  const __CFBoolean *v70;
  CFTypeID v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  const __CFNumber *v76;
  const __CFNumber *v77;
  const __CFNumber *v78;
  uint64_t v79;
  const __CFBoolean *v80;
  const __CFBoolean *v81;
  CFTypeID v82;
  uint64_t v83;
  uint64_t v84;
  __CVBuffer *v85;
  uint64_t v86;
  int v87;
  int v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  int v93;
  __CVBuffer *v94;
  uint64_t v95;
  int v96;
  int v97;
  int v98;
  int v99;
  __CVBuffer *v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  _OWORD *v110;
  CGFloat v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  uint64_t v120;
  uint64_t v121;
  int *v122;
  int v123;
  uint64_t v124;
  float64x2_t v125;
  float64x2_t v126;
  uint64_t v130;
  uint64_t v131;
  double v132;
  double v133;
  double v134;
  double v136;
  __int128 v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  double *v145;
  uint64_t i;
  double v147;
  double v148;
  uint64_t v149;
  double v150;
  double v151;
  double *v152;
  char v153;
  char v154;
  char v155;
  __CVBuffer *v156;
  uint64_t v157;
  int v158;
  int v159;
  const __CFAllocator *v160;
  CFIndex Count;
  CFMutableDictionaryRef MutableCopy;
  CFMutableArrayRef v163;
  CGFloat v164;
  const __CFDictionary *v165;
  const __CFDictionary *v169;
  CGFloat x;
  CGFloat y;
  double v172;
  double v173;
  CGFloat v174;
  CGFloat MidY;
  CGFloat MidX;
  CGFloat v177;
  uint64_t v178;
  BOOL v179;
  int v180;
  double *v181;
  uint64_t v182;
  _BYTE *v183;
  int v184;
  float v185;
  float v186;
  double *v187;
  float v188;
  float v189;
  double v190;
  double v191;
  double v192;
  double v193;
  CGFloat v194;
  double v195;
  float v196;
  float v197;
  float v198;
  float v199;
  _BOOL4 v200;
  _BOOL4 v201;
  double v202;
  double v203;
  double v204;
  double v205;
  CGFloat v206;
  CGFloat v207;
  CGFloat v208;
  CGFloat v209;
  int v210;
  float v211;
  CGFloat v212;
  CGFloat v213;
  CGFloat v214;
  CGFloat v215;
  double v216;
  double v217;
  float v218;
  float v219;
  CGFloat v220;
  CFArrayRef v221;
  uint64_t j;
  const void *v223;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v225;
  CFDictionaryRef v226;
  CGFloat v227;
  BOOL v228;
  BOOL v229;
  const void *v230;
  const __CFDictionary *v231;
  const void *v232;
  __CFDictionary *v233;
  uint64_t v234;
  __CVBuffer *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t SampleTimingInfoArray;
  const __CFAllocator *v239;
  int v240;
  uint64_t v241;
  NSObject *v242;
  NSObject *global_queue;
  CGFloat a;
  BOOL v245;
  uint64_t v246;
  __CFDictionary *v247;
  const __CFString *v248;
  CGFloat v249;
  CGFloat v250;
  CGFloat v251;
  CGFloat v252;
  opaqueCMSampleBuffer *v253;
  void *key;
  uint64_t v255;
  __CFArray *theArray;
  const __CFArray *v257;
  CFDictionaryRef v258;
  void *v259;
  double v260;
  double v261;
  const __CFDictionary *theDict;
  double theDicta;
  char v264;
  __int128 v265;
  double v266;
  BOOL v267;
  __int128 v268;
  double v269;
  char v270;
  CGSize v271;
  __int128 v272;
  double v273;
  CVPixelBufferRef pixelBufferOut;
  CGAffineTransform v275;
  CGRect v276;
  CGRect rect;
  __int128 v278;
  CGFloat v279;
  CGAffineTransform rhs;
  CGAffineTransform lhs;
  CGAffineTransform time2;
  CMSampleTimingInfo valuePtr;
  void *values[2];
  __int128 v285;
  CGAffineTransform v286;
  CGAffineTransform t1;
  uint64_t v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;

  v288 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pixelBufferOut = 0;
  if (*(_BYTE *)(DerivedStorage + 16))
    return FigSignalErrorAt();
  v6 = DerivedStorage;
  v7 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10820], 0);
  if (v7)
  {
    CMTimeMakeFromDictionary(&valuePtr.duration, v7);
    *(_OWORD *)(v6 + 64) = *(_OWORD *)&valuePtr.duration.value;
    epoch = valuePtr.duration.epoch;
  }
  else
  {
    memset(&valuePtr, 0, sizeof(valuePtr));
    CMSampleBufferGetSampleTimingInfoArray(a2, 1, &valuePtr, 0);
    *(_OWORD *)(v6 + 64) = *(_OWORD *)&valuePtr.presentationTimeStamp.value;
    epoch = valuePtr.presentationTimeStamp.epoch;
  }
  *(_QWORD *)(v6 + 80) = epoch;
  v9 = *(unsigned __int8 *)(v6 + 48);
  v10 = CMBaseObjectGetDerivedStorage();
  ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  v12 = (const void **)MEMORY[0x24BE10870];
  v255 = v6;
  v253 = a2;
  v259 = a1;
  if (v9)
  {
    v14 = (__CVPixelBufferPool **)(v10 + 24);
    v13 = *(__CVPixelBufferPool **)(v10 + 24);
    v15 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
    if (v13
      || (CMSampleBufferGetFormatDescription(a2),
          v16 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain(),
          *(_QWORD *)(v10 + 32) = v16,
          valuePtr.duration.value = (CMTimeValue)CMVideoFormatDescriptionGetDimensions(v16),
          (v13 = *(__CVPixelBufferPool **)(v10 + 24)) != 0))
    {
LABEL_9:
      v17 = CVPixelBufferPoolCreatePixelBuffer(*v15, v13, &pixelBufferOut);
      if ((_DWORD)v17
        || (v17 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v10 + 40), ImageBuffer, pixelBufferOut), (_DWORD)v17))
      {
        v21 = v17;
        fig_log_get_emitter();
        FigDebugAssert3();
        CMSampleBufferGetImageBuffer(a2);
        goto LABEL_327;
      }
      v18 = pixelBufferOut;
      if (!pixelBufferOut)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v18 = pixelBufferOut;
      }
      PixelFormatType = CVPixelBufferGetPixelFormatType(v18);
      Width = CVPixelBufferGetWidth(v18);
      if ((Width & 0xF) == 0
        && ((PixelFormatType & 0xFFFFFFEF) == 0x34323066
         || PixelFormatType == 2033463856
         || PixelFormatType == 1714696752)
        && CVPixelBufferGetBytesPerRowOfPlane(v18, 0) == Width)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a2);
        goto LABEL_68;
      }
      FigSignalErrorAt();
LABEL_15:
      v21 = FigSignalErrorAt();
      v22 = CMSampleBufferGetImageBuffer(a2);
      if (!(_DWORD)v21)
      {
        ImageBuffer = v22;
        goto LABEL_68;
      }
LABEL_327:
      fig_log_get_emitter();
LABEL_331:
      FigDebugAssert3();
      goto LABEL_196;
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    LODWORD(lhs.a) = CMFormatDescriptionGetMediaSubType(v16);
    *(_QWORD *)&time2.a = 3;
    LODWORD(rhs.a) = 0;
    LODWORD(t1.a) = 0;
    LODWORD(v286.a) = 64;
    LODWORD(v275.a) = 64;
    v29 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v30 = CFNumberCreate(0, kCFNumberSInt32Type, &lhs);
    CFArrayAppendValue(v29, v30);
    CFRelease(v30);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v29);
    CFRelease(v29);
    v31 = *v15;
    v32 = CFNumberCreate(v31, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v32);
    CFRelease(v32);
    v33 = CFNumberCreate(v31, kCFNumberSInt32Type, (char *)&valuePtr.duration.value + 4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v33);
    CFRelease(v33);
    IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(1);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
    Value = (const __CFNumber *)CFDictionaryGetValue(IOSurfacePropertiesDictionary, (const void *)*MEMORY[0x24BDD8E40]);
    if (Value)
    {
      LODWORD(rect.origin.x) = 0;
      CFNumberGetValue(Value, kCFNumberSInt32Type, &rect);
      PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray();
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC55F0], PixelBufferCacheModeArray);
      CFRelease(PixelBufferCacheModeArray);
    }
    CFRelease(IOSurfacePropertiesDictionary);
    v37 = (LODWORD(valuePtr.duration.value) + 15) & 0xFFFFFFF0;
    LODWORD(rhs.a) = v37 - LODWORD(valuePtr.duration.value);
    if (v37 != LODWORD(valuePtr.duration.value))
    {
      v38 = CFNumberCreate(v31, kCFNumberSInt32Type, &rhs);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5628], v38);
      CFRelease(v38);
    }
    v39 = (HIDWORD(valuePtr.duration.value) + 15) & 0xFFFFFFF0;
    LODWORD(t1.a) = v39 - HIDWORD(valuePtr.duration.value);
    if (v39 != HIDWORD(valuePtr.duration.value))
    {
      v40 = CFNumberCreate(v31, kCFNumberSInt32Type, &t1);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5610], v40);
      CFRelease(v40);
    }
    v41 = CFNumberCreate(v31, kCFNumberSInt32Type, &v286);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56C8], v41);
    CFRelease(v41);
    v42 = CFNumberCreate(v31, kCFNumberSInt32Type, &v275);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], v42);
    CFRelease(v42);
    v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v44 = CFNumberCreate(0, kCFNumberCFIndexType, &time2);
    CFDictionaryAddValue(v43, (const void *)*MEMORY[0x24BDC56F0], v44);
    CFRelease(v44);
    v45 = CVPixelBufferPoolCreate(v31, v43, Mutable, (CVPixelBufferPoolRef *)(v10 + 24));
    if (Mutable)
      CFRelease(Mutable);
    if (v43)
      CFRelease(v43);
    if (v45)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      a2 = v253;
      goto LABEL_15;
    }
    if (SLODWORD(time2.a) < 1)
    {
      PixelBuffer = 0;
    }
    else
    {
      v46 = *v14;
      a_low = LODWORD(time2.a);
      v48 = 8 * LODWORD(time2.a);
      v49 = (CVPixelBufferRef *)malloc_type_malloc(v48, 0x2004093837F09uLL);
      if (v49)
      {
        v50 = v49;
        bzero(v49, v48);
        v51 = 0;
        while (1)
        {
          PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v31, v46, &v50[v51 / 8]);
          if (PixelBuffer)
            break;
          v51 += 8;
          if (v48 == v51)
            goto LABEL_50;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_50:
        v53 = 0;
        a1 = v259;
        a2 = v253;
        v15 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
        do
          CVPixelBufferRelease(v50[v53++]);
        while (a_low != v53);
        free(v50);
        v6 = v255;
        goto LABEL_323;
      }
      PixelBuffer = -12786;
    }
    a1 = v259;
    a2 = v253;
    v15 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
LABEL_323:
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Configuration: BarcodeScanner Output Pool: (%d x %d)\n", LODWORD(valuePtr.duration.value), HIDWORD(valuePtr.duration.value));
    if (PixelBuffer)
      goto LABEL_15;
    v13 = *v14;
    goto LABEL_9;
  }
  if (*(_BYTE *)(v10 + 58))
  {
    v23 = (__CVBuffer *)CMGetAttachment(a2, CFSTR("PreviewBuffer"), 0);
    if (v23)
    {
      v24 = (__CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10818], 0);
      CFDictionaryRemoveValue(v24, *v12);
    }
  }
  else
  {
    v23 = 0;
  }
  if (ImageBuffer)
    _ZF = v23 == 0;
  else
    _ZF = 0;
  if (!_ZF)
    ImageBuffer = v23;
  pixelBufferOut = CVPixelBufferRetain(ImageBuffer);
  if (!*(_BYTE *)(v6 + 49))
  {
    *(_BYTE *)(v6 + 49) = 1;
    LODWORD(valuePtr.duration.value) = 0;
    v26 = (const __CFNumber *)CMGetAttachment(ImageBuffer, CFSTR("RotationDegrees"), 0);
    if (v26)
    {
      CFNumberGetValue(v26, kCFNumberIntType, &valuePtr);
      v27 = valuePtr.duration.value;
    }
    else
    {
      v27 = 0;
    }
    *(_DWORD *)(v6 + 52) = v27;
    v54 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, CFSTR("MirroredHorizontal"), 0);
    if (!v54 || (v55 = v54, v56 = CFGetTypeID(v54), v56 != CFBooleanGetTypeID()))
    {
      v57 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, CFSTR("Mirrored"), 0);
      if (!v57)
      {
LABEL_61:
        *(_BYTE *)(v6 + 56) = (_BYTE)v57;
        v59 = (const __CFBoolean *)CMGetAttachment(ImageBuffer, CFSTR("MirroredVertical"), 0);
        if (v59)
        {
          v60 = v59;
          v61 = CFGetTypeID(v59);
          if (v61 == CFBooleanGetTypeID())
            LOBYTE(v59) = CFBooleanGetValue(v60);
          else
            LOBYTE(v59) = 0;
        }
        *(_BYTE *)(v6 + 57) = (_BYTE)v59;
        if (*(_DWORD *)(v6 + 52) == 180 && CMGetAttachment(ImageBuffer, CFSTR("Mirrored"), 0))
        {
          v62 = *(_BYTE *)(v6 + 56);
          *(_BYTE *)(v6 + 56) = *(_BYTE *)(v6 + 57);
          *(_BYTE *)(v6 + 57) = v62;
        }
        goto LABEL_68;
      }
      v55 = v57;
      v58 = CFGetTypeID(v57);
      if (v58 != CFBooleanGetTypeID())
      {
        LOBYTE(v57) = 0;
        goto LABEL_61;
      }
    }
    LOBYTE(v57) = CFBooleanGetValue(v55);
    goto LABEL_61;
  }
LABEL_68:
  if (!*(_QWORD *)(v6 + 184))
  {
    Height = CVPixelBufferGetHeight(ImageBuffer);
    v64 = Height <= CVPixelBufferGetWidth(ImageBuffer)
        ? CVPixelBufferGetWidth(ImageBuffer)
        : CVPixelBufferGetHeight(ImageBuffer);
    if (v64 > 0x4FF || *(_DWORD *)(v6 + 168))
    {
      v65 = ensurePyramidArray(ImageBuffer, (int *)(v6 + 176), (OSType *)(v6 + 172), (CFMutableArrayRef *)(v6 + 184));
      if ((_DWORD)v65)
      {
        v21 = v65;
        fig_log_get_emitter();
        goto LABEL_331;
      }
    }
  }
  v66 = (const __CFString *)*MEMORY[0x24BE10818];
  v67 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10818], 0);
  if (!v67 && !*(_BYTE *)(v6 + 48))
  {
    if (ImageBuffer)
      CFRelease(ImageBuffer);
    return FigSignalErrorAt();
  }
  theDict = v67;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    v68 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)(v6 + 120) = *MEMORY[0x24BDBF090];
    *(_OWORD *)(v6 + 136) = v68;
  }
  v248 = v66;
  v69 = (const __CFBoolean *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10840], 0);
  if (v69
    && (v70 = v69, v71 = CFGetTypeID(v69), v71 == CFBooleanGetTypeID())
    && CFBooleanGetValue(v70)
    && ((v72 = CMBaseObjectGetDerivedStorage(), v73 = v72, *(_BYTE *)(v72 + 112))
     || !dispatch_group_wait(*(dispatch_group_t *)(v72 + 1008), 0)))
  {
    *(_QWORD *)(v73 + 1000) = CVPixelBufferRetain(ImageBuffer);
    *(_OWORD *)(v73 + 1148) = *(_OWORD *)(v73 + 64);
    *(_QWORD *)(v73 + 1164) = *(_QWORD *)(v73 + 80);
    if (*(_BYTE *)(v73 + 112))
    {
      detectBarcodesInFrame((uint64_t)a1);
    }
    else
    {
      v242 = *(NSObject **)(v73 + 1008);
      global_queue = dispatch_get_global_queue(2, 0);
      dispatch_group_async_f(v242, global_queue, a1, (dispatch_function_t)detectBarcodesInFrame);
    }
    v74 = 0;
  }
  else
  {
    v74 = 1;
  }
  v75 = CMBaseObjectGetDerivedStorage();
  v76 = (const __CFNumber *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10848], 0);
  v77 = (const __CFNumber *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10850], 0);
  if (v76)
  {
    v78 = v77;
    if (v77)
    {
      CFNumberGetValue(v76, kCFNumberFloatType, (void *)(v75 + 152));
      CFNumberGetValue(v78, kCFNumberFloatType, (void *)(v75 + 156));
      *(float32x2_t *)(v75 + 160) = vadd_f32(*(float32x2_t *)(v75 + 152), *(float32x2_t *)(v75 + 160));
      *(_OWORD *)(v75 + 1124) = *(_OWORD *)(v75 + 64);
      *(_QWORD *)(v75 + 1140) = *(_QWORD *)(v75 + 80);
    }
  }
  v79 = CMBaseObjectGetDerivedStorage();
  v80 = (const __CFBoolean *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE10858], 0);
  if (!v80 || (v81 = v80, v82 = CFGetTypeID(v80), v82 != CFBooleanGetTypeID()) || CFBooleanGetValue(v81))
  {
    if ((*(_BYTE *)(v79 + 1088) & 1) != 0)
      goto LABEL_99;
    *(_OWORD *)(v79 + 1076) = *(_OWORD *)(v79 + 64);
    *(_QWORD *)(v79 + 1092) = *(_QWORD *)(v79 + 80);
    v83 = v79 + 1100;
    v84 = MEMORY[0x24BDC0D40];
    goto LABEL_98;
  }
  v241 = MEMORY[0x24BDC0D40];
  *(_OWORD *)(v79 + 1076) = *MEMORY[0x24BDC0D40];
  *(_QWORD *)(v79 + 1092) = *(_QWORD *)(v241 + 16);
  *(_QWORD *)(v79 + 160) = 0;
  if (!*(_BYTE *)(v79 + 112))
    goto LABEL_297;
  v83 = v79 + 1100;
  v84 = v79 + 64;
  if ((*(_BYTE *)(v79 + 1112) & 1) == 0)
  {
LABEL_98:
    *(_OWORD *)v83 = *(_OWORD *)v84;
    *(_QWORD *)(v83 + 16) = *(_QWORD *)(v84 + 16);
    goto LABEL_99;
  }
  *(_OWORD *)&time2.a = *(_OWORD *)v84;
  time2.c = *(CGFloat *)(v79 + 80);
  *(_OWORD *)&lhs.a = *(_OWORD *)v83;
  lhs.c = *(CGFloat *)(v79 + 1116);
  CMTimeSubtract(&valuePtr.duration, (CMTime *)&time2, (CMTime *)&lhs);
  CMTimeMake((CMTime *)&time2, 300, 1000);
  if (CMTimeCompare(&valuePtr.duration, (CMTime *)&time2) >= 1)
LABEL_297:
    clearBarcodes();
LABEL_99:
  if (!*(_BYTE *)(v6 + 48))
    goto LABEL_120;
  v85 = pixelBufferOut;
  v86 = CMBaseObjectGetDerivedStorage();
  v87 = CVPixelBufferGetWidth(v85);
  v88 = CVPixelBufferGetHeight(v85);
  v89 = CVPixelBufferLockBaseAddress(v85, 0);
  if ((_DWORD)v89)
  {
LABEL_330:
    v21 = v89;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    v6 = v255;
    goto LABEL_331;
  }
  *(_OWORD *)&valuePtr.duration.value = *(_OWORD *)(v86 + 1124);
  valuePtr.duration.epoch = *(_QWORD *)(v86 + 1140);
  *(_OWORD *)&time2.a = *(_OWORD *)(v86 + 64);
  time2.c = *(CGFloat *)(v86 + 80);
  if (CMTimeCompare(&valuePtr.duration, (CMTime *)&time2))
  {
    FigDrawLumaRectangle(v85, v87 / 10, v88 / 10, 8 * v87 / 10, 8 * v88 / 10, 20);
    FigDrawLumaRectangle(v85, v87 / 10 - 2, v88 / 10 - 2, 8 * v87 / 10 + 4, 8 * v88 / 10 + 4, 240);
    if (v87 >= 0)
      v90 = v87;
    else
      v90 = v87 + 1;
    v91 = (v90 >> 1) - 10;
    if (v88 >= 0)
      v92 = v88;
    else
      v92 = v88 + 1;
    v93 = (v92 >> 1) - 10;
    FigDrawLumaRectangle(v85, v91, v93, 20, 20, 255);
    FigDrawLumaRectangle(v85, (int)(float)(*(float *)(v86 + 152) + (float)v91), (int)(float)(*(float *)(v86 + 156) + (float)v93), 20, 20, 0);
  }
  CVPixelBufferUnlockBaseAddress(v85, 0);
  if ((v74 & 1) == 0)
  {
    v94 = pixelBufferOut;
    v95 = CMBaseObjectGetDerivedStorage();
    v96 = CVPixelBufferGetWidth(v94);
    v97 = CVPixelBufferGetHeight(v94);
    v89 = CVPixelBufferLockBaseAddress(v94, 0);
    if (!(_DWORD)v89)
    {
      v294.origin.x = 0.0;
      v294.origin.y = 0.0;
      v294.size.width = 1.0;
      v294.size.height = 1.0;
      if (CGRectEqualToRect(*(CGRect *)(v95 + 1032), v294))
      {
        if (v97 >= 0)
          v98 = v97;
        else
          v98 = v97 + 1;
        FigDraw420Line(v94, 0, v98 >> 1, v96 - 1, v98 >> 1, 224, 38, 201);
        if (v96 >= 0)
          v99 = v96;
        else
          v99 = v96 + 1;
        FigDraw420Line(v94, v99 >> 1, 0, v99 >> 1, v97 - 1, 224, 38, 201);
      }
      CVPixelBufferUnlockBaseAddress(v94, 0);
      goto LABEL_120;
    }
    goto LABEL_330;
  }
LABEL_120:
  v100 = pixelBufferOut;
  v101 = CMBaseObjectGetDerivedStorage();
  v102 = CVPixelBufferGetWidth(v100);
  CVPixelBufferGetHeight(v100);
  MEMORY[0x22E316610](*(_QWORD *)(v101 + 992));
  v103 = 0;
  v104 = 0;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  *(_DWORD *)(v101 + 960) = 0;
  v108 = v101 + 988;
  do
  {
    if (*(_DWORD *)(v108 + v103 - 636))
    {
      *(_DWORD *)(v101 + 960) = ++v104;
      v107 = 1;
    }
    v109 = *(unsigned __int8 *)(v108 + v105);
    v106 |= v109;
    *((_BYTE *)&t1.a + v105++) = v109;
    v103 += 192;
  }
  while (v105 != 4);
  v270 = v74;
  if (v107)
  {
    v110 = (_OWORD *)(v101 + 64);
    *(_OWORD *)(v101 + 1172) = *(_OWORD *)(v101 + 64);
    *(_QWORD *)(v101 + 1188) = *(_QWORD *)(v101 + 80);
    v111 = transformInterestRect(*(CGFloat *)(v101 + 1032), *(CGFloat *)(v101 + 1040), *(CGFloat *)(v101 + 1048), *(CGFloat *)(v101 + 1056), (uint64_t)a1, v102);
    v112 = 0;
    v116 = (double)(int)v111;
    v117 = (double)(int)(v111 + v113);
    v118 = (double)(int)v114;
    v119 = (double)(int)(v114 + v115);
    v120 = v101 + 264;
    v121 = v101 + 272;
    do
    {
      v122 = (int *)(v101 + 192 * v112 + 352);
      v123 = *v122;
      if (*(_BYTE *)(v101 + v112 + 988))
      {
        if (v123)
        {
          v124 = 0;
          v125 = vcvtq_f64_f32(*(float32x2_t *)(v101 + 160));
          do
          {
            v126 = vsubq_f64(*(float64x2_t *)(v120 + v124), v125);
            *(float64x2_t *)(v120 + v124) = v126;
            if (v126.f64[0] < v116 || v126.f64[0] > v117 || v126.f64[1] < v118 || v126.f64[1] > v119)
              *v122 = 0;
            v124 += 16;
          }
          while (v124 != 64);
          v130 = v101 + 192 * v112 + 192;
          *(_OWORD *)(v130 + 164) = *v110;
          *(_QWORD *)(v130 + 180) = *(_QWORD *)(v101 + 80);
          *(_BYTE *)(v101 + v112 + 988) = 0;
        }
      }
      else if (v123)
      {
        v131 = 0;
        v132 = *(float *)(v101 + 152);
        v133 = *(float *)(v101 + 156);
        do
        {
          v134 = *(double *)(v120 + v131) - v132;
          *(double *)(v120 + v131) = v134;
          if (v134 < v116 || v134 > v117)
            *v122 = 0;
          v136 = *(double *)(v121 + v131) - v133;
          *(double *)(v121 + v131) = v136;
          if (v136 < v118 || v136 > v119)
            *v122 = 0;
          v131 += 16;
        }
        while (v131 != 64);
        memset(&valuePtr, 0, 24);
        if (*(_BYTE *)(v101 + 112))
          CMTimeMake(&valuePtr.duration, 650, 1000);
        else
          CMTimeMakeWithSeconds(&valuePtr.duration, 1.25, 1000);
        if (*v122)
        {
          *(_OWORD *)&lhs.a = *v110;
          lhs.c = *(CGFloat *)(v101 + 80);
          v138 = *(_OWORD *)(v101 + 192 * v112 + 356);
          rhs.c = *(CGFloat *)(v101 + 192 * v112 + 372);
          *(_OWORD *)&rhs.a = v138;
          CMTimeSubtract((CMTime *)&time2, (CMTime *)&lhs, (CMTime *)&rhs);
          *(_OWORD *)&lhs.a = *(_OWORD *)&valuePtr.duration.value;
          *(_QWORD *)&lhs.c = valuePtr.duration.epoch;
          if (CMTimeCompare((CMTime *)&time2, (CMTime *)&lhs) >= 1)
            *v122 = 0;
        }
      }
      ++v112;
      v120 += 192;
      v121 += 192;
    }
    while (v112 != 4);
    v139 = 0;
    while (1)
    {
      v140 = *(_DWORD *)(v101 + 352 + v139);
      if (v140)
        break;
      v139 += 192;
      if (v139 == 768)
      {
        v267 = v140 == 0;
        v264 = 0;
        goto LABEL_168;
      }
    }
    v267 = 0;
    v264 = 1;
  }
  else
  {
    v264 = 0;
    v267 = 1;
  }
LABEL_168:
  if (*(_BYTE *)(v101 + 48))
  {
    v141 = 0;
    v142 = 272;
    do
    {
      if (*(_DWORD *)(v101 + 192 * v141 + 352))
      {
        v143 = *((unsigned __int8 *)&t1.a + v141);
        v144 = CMBaseObjectGetDerivedStorage();
        if (CVPixelBufferLockBaseAddress(v100, 0))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        else
        {
          if (*(_DWORD *)(v144 + 192 * v141 + 352))
          {
            v145 = (double *)(v144 + v142);
            for (i = 1; i != 5; ++i)
            {
              v147 = *(v145 - 1);
              v148 = *v145;
              v149 = v144 + 192 * v141 + 16 * (i & 3);
              v150 = *(double *)(v149 + 264);
              v151 = *(double *)(v149 + 272);
              FigDraw420Line(v100, (int)v147, (int)*v145, (int)v150, (int)v151, 0, 0, 0);
              FigDraw420Line(v100, (int)(v147 + 1.0), (int)(v148 + 1.0), (int)(v150 + 1.0), (int)(v151 + 1.0), 255, 0, 0);
              v145 += 2;
            }
            if (v143)
            {
              v152 = (double *)(v144 + 192 * v141);
              FigDrawLumaRectangle(v100, (int)(v152[33] + -5.0), (int)(v152[34] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[35] + -5.0), (int)(v152[36] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[37] + -5.0), (int)(v152[38] + -5.0), 10, 10, 20);
              FigDrawLumaRectangle(v100, (int)(v152[39] + -5.0), (int)(v152[40] + -5.0), 10, 10, 20);
            }
          }
          CVPixelBufferUnlockBaseAddress(v100, 0);
        }
      }
      ++v141;
      v142 += 192;
    }
    while (v141 != 4);
  }
  v153 = v267;
  if (!*(_BYTE *)(v101 + 1196))
    v153 = 0;
  if (v106)
    v154 = 1;
  else
    v154 = v153;
  *(_BYTE *)(v101 + 1196) = v264;
  MEMORY[0x22E31661C](*(_QWORD *)(v101 + 992));
  v6 = v255;
  if ((v270 & 1) == 0)
    *(_QWORD *)(v255 + 160) = 0;
  if (*(_BYTE *)(v255 + 112))
    v155 = v154;
  else
    v155 = 1;
  if ((v155 & 1) == 0)
  {
    v21 = 0;
    *(_OWORD *)(v255 + 88) = *(_OWORD *)(v255 + 64);
    *(_QWORD *)(v255 + 104) = *(_QWORD *)(v255 + 80);
LABEL_196:
    ++*(_DWORD *)(v6 + 60);
    goto LABEL_318;
  }
  v156 = pixelBufferOut;
  v157 = CMBaseObjectGetDerivedStorage();
  v158 = CVPixelBufferGetWidth(v156);
  v159 = CVPixelBufferGetHeight(v156);
  if (!theDict)
  {
    v160 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    goto LABEL_198;
  }
  v160 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (*(_BYTE *)(v157 + 1209))
  {
LABEL_198:
    MutableCopy = CFDictionaryCreateMutable(v160, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    goto LABEL_199;
  }
  Count = CFDictionaryGetCount(theDict);
  MutableCopy = CFDictionaryCreateMutableCopy(v160, Count + 1, theDict);
LABEL_199:
  v247 = MutableCopy;
  memset(&valuePtr, 0, sizeof(valuePtr));
  v163 = CFArrayCreateMutable(v160, 4, MEMORY[0x24BDBD690]);
  if (CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0))
  {
    v278 = *MEMORY[0x24BDC0D40];
    v164 = *(double *)(MEMORY[0x24BDC0D40] + 16);
  }
  else
  {
    v278 = *(_OWORD *)&valuePtr.presentationTimeStamp.value;
    v164 = *(double *)&valuePtr.presentationTimeStamp.epoch;
  }
  v279 = v164;
  *(_OWORD *)&time2.a = v278;
  time2.c = v164;
  v258 = CMTimeCopyAsDictionary((CMTime *)&time2, v160);
  memset(&rect, 0, sizeof(rect));
  v165 = (const __CFDictionary *)CMGetAttachment(v253, (CFStringRef)*MEMORY[0x24BE10828], 0);
  __asm { FMOV            V0.2D, #1.0 }
  if (v165)
  {
    v271 = _Q0;
    CGRectMakeWithDictionaryRepresentation(v165, &rect);
    _Q0 = v271;
  }
  else
  {
    rect.origin.x = 0.0;
    rect.origin.y = 0.0;
    rect.size = _Q0;
  }
  theArray = v163;
  v276.origin.x = 0.0;
  v276.origin.y = 0.0;
  v276.size = _Q0;
  v169 = (const __CFDictionary *)CMGetAttachment(v253, (CFStringRef)*MEMORY[0x24BE10830], 0);
  if (v169)
    CGRectMakeWithDictionaryRepresentation(v169, &v276);
  x = v276.origin.x;
  y = v276.origin.y;
  v172 = v276.size.width;
  v173 = v276.size.height;
  v272 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v275.a = *MEMORY[0x24BDBD8B8];
  v268 = *(_OWORD *)&v275.a;
  *(_OWORD *)&v275.c = v272;
  *(_OWORD *)&v275.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v265 = *(_OWORD *)&v275.tx;
  v289.origin.x = 0.0;
  v289.origin.y = 0.0;
  v289.size.width = 1.0;
  v289.size.height = 1.0;
  v174 = -CGRectGetMidX(v289);
  v290.origin.x = 0.0;
  v290.origin.y = 0.0;
  v290.size.width = 1.0;
  v290.size.height = 1.0;
  MidY = CGRectGetMidY(v290);
  CGAffineTransformMakeTranslation(&time2, v174, -MidY);
  *(_OWORD *)&lhs.a = v268;
  *(_OWORD *)&lhs.c = v272;
  *(_OWORD *)&lhs.tx = v265;
  CGAffineTransformConcat(&v275, &lhs, &time2);
  CGAffineTransformMakeScale(&rhs, 1.0 / v172, 1.0 / v173);
  t1 = v275;
  CGAffineTransformConcat(&lhs, &t1, &rhs);
  v275 = lhs;
  v291.origin.x = x;
  v291.origin.y = y;
  v291.size.width = v172;
  v291.size.height = v173;
  MidX = CGRectGetMidX(v291);
  v292.origin.x = x;
  v292.origin.y = y;
  v292.size.width = v172;
  v292.size.height = v173;
  v177 = CGRectGetMidY(v292);
  CGAffineTransformMakeTranslation(&t1, MidX, v177);
  v286 = v275;
  CGAffineTransformConcat(&lhs, &v286, &t1);
  v275 = lhs;
  MEMORY[0x22E316610](*(_QWORD *)(v157 + 992));
  v178 = 0;
  v273 = *MEMORY[0x24BDBEFB0];
  v269 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v158)
    v179 = v159 == 0;
  else
    v179 = 1;
  v260 = (double)(2 * v159);
  v261 = (double)(2 * v158);
  theDicta = (double)v159;
  v266 = (double)v158;
  v180 = !v179;
  v252 = *MEMORY[0x24BE10468];
  v251 = *MEMORY[0x24BE10458];
  v250 = *MEMORY[0x24BE10448];
  v249 = *MEMORY[0x24BE10450];
  v181 = (double *)(v157 + 272);
  key = (void *)*MEMORY[0x24BE7BDD0];
  do
  {
    if (!*(_DWORD *)(v157 + 192 * v178 + 352) || *(_BYTE *)(v157 + v178 + 988))
      goto LABEL_279;
    v182 = 0;
    memset(&t1, 0, 32);
    memset(&v286, 0, 32);
    *(_OWORD *)values = 0u;
    v285 = 0u;
    v183 = (_BYTE *)(v157 + 192 * v178 + 256);
    v184 = 1;
    v185 = 0.0;
    v186 = 1.0;
    v187 = v181;
    v188 = 1.0;
    v189 = 0.0;
    do
    {
      if (!v180)
      {
        v194 = v273;
        v195 = v269;
        goto LABEL_241;
      }
      if (*(_BYTE *)(v157 + 1208))
      {
        v190 = *(v187 - 1);
        if (*v183)
        {
          v191 = (v190 + *(v187 - 10)) / v261;
          v192 = *v187 + *(v187 - 9);
          v193 = v260;
          goto LABEL_224;
        }
      }
      else
      {
        v190 = *(v187 - 1);
      }
      v193 = theDicta;
      v191 = v190 / v266;
      v192 = *v187;
LABEL_224:
      v196 = v191;
      v197 = v192 / v193;
      v198 = (v196 - rect.origin.x) / rect.size.width;
      v199 = (v197 - rect.origin.y) / rect.size.height;
      v200 = v198 >= 0.0;
      if (v199 < 0.0)
        v200 = 0;
      if (v198 > 1.0)
        v200 = 0;
      v201 = v199 <= 1.0 && v200;
      v202 = v198;
      v203 = v199;
      if (*(_BYTE *)(v157 + 56))
      {
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        v204 = time2.tx + time2.c * v203 + time2.a * v202;
        v205 = time2.ty + time2.d * v203 + time2.b * v202;
        v206 = -1.0;
        v207 = 1.0;
LABEL_235:
        CGAffineTransformMakeScale(&lhs, v206, v207);
        v208 = lhs.tx + v205 * lhs.c + lhs.a * v204;
        v209 = lhs.ty + v205 * lhs.d + lhs.b * v204;
        CGAffineTransformMakeTranslation(&rhs, 0.5, 0.5);
        v202 = rhs.tx + v209 * rhs.c + rhs.a * v208;
        v203 = rhs.ty + v209 * rhs.d + rhs.b * v208;
        goto LABEL_236;
      }
      if (*(_BYTE *)(v157 + 57))
      {
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        v204 = time2.tx + time2.c * v203 + time2.a * v202;
        v205 = time2.ty + time2.d * v203 + time2.b * v202;
        v206 = 1.0;
        v207 = -1.0;
        goto LABEL_235;
      }
LABEL_236:
      v210 = *(_DWORD *)(v157 + 52);
      if (v210)
      {
        v211 = (double)-v210 * 3.14159265 / 180.0;
        CGAffineTransformMakeTranslation(&time2, -0.5, -0.5);
        v212 = time2.tx + v203 * time2.c + time2.a * v202;
        v213 = time2.ty + v203 * time2.d + time2.b * v202;
        CGAffineTransformMakeRotation(&lhs, v211);
        v214 = lhs.tx + v213 * lhs.c + lhs.a * v212;
        v215 = lhs.ty + v213 * lhs.d + lhs.b * v212;
        CGAffineTransformMakeTranslation(&rhs, 0.5, 0.5);
        v202 = rhs.tx + v215 * rhs.c + rhs.a * v214;
        v203 = rhs.ty + v215 * rhs.d + rhs.b * v214;
      }
      v184 &= v201;
      v194 = v275.tx + v203 * v275.c + v275.a * v202;
      v195 = v275.ty + v203 * v275.d + v275.b * v202;
      v216 = *(double *)(v157 + 136);
      if (v216 != 0.0)
      {
        v217 = *(double *)(v157 + 144);
        if (v217 != 0.0)
        {
          v218 = 1.0 / v216;
          v219 = 1.0 / v217;
          v220 = v195 * 0.0 + v218 * v194 + (1.0 - v218) * 0.5;
          v195 = (1.0 - v219) * 0.5 + v195 * v219 + v194 * 0.0;
          v194 = v220;
        }
      }
LABEL_241:
      if (v194 < v186)
        v186 = v194;
      if (v194 > v185)
        v185 = v194;
      if (v195 < v188)
        v188 = v195;
      if (v195 > v189)
        v189 = v195;
      values[v182++] = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v194);
      v187 += 2;
    }
    while (v182 != 4);
    *v183 = 0;
    v221 = CFArrayCreate(v160, (const void **)values, 4, MEMORY[0x24BDBD690]);
    for (j = 0; j != 4; ++j)
    {
      v223 = values[j];
      if (v223)
        CFRelease(v223);
    }
    v293.origin.x = v186;
    v293.origin.y = v188;
    v293.size.width = (float)(v185 - v186);
    v293.size.height = (float)(v189 - v188);
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v293);
    v225 = DictionaryRepresentation;
    v226 = 0;
    v227 = *(double *)(v157 + 192 * v178 + 344);
    if (v258)
    {
      v228 = !DictionaryRepresentation || v221 == 0;
      v229 = v228 || *(_QWORD *)&v227 == 0;
      if (!v229 && ((v184 ^ 1) & 1) == 0)
      {
        t1.a = v252;
        t1.b = v251;
        t1.c = v250;
        t1.d = v249;
        *(_QWORD *)&v286.a = v258;
        *(_QWORD *)&v286.b = DictionaryRepresentation;
        *(_QWORD *)&v286.c = v221;
        v286.d = v227;
        v226 = CFDictionaryCreate(v160, (const void **)&t1, (const void **)&v286, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      }
    }
    if (*(_BYTE *)(v157 + 48))
    {
      v257 = v221;
      v230 = (const void *)MRCDescriptorCreateWithAttributes();
      v231 = (const __CFDictionary *)MRCDescriptorCopyAttributes();
      v232 = (const void *)MRCDescriptorDecodePayload();
      CFDictionaryGetValue(v231, key);
      if (v230)
        CFRelease(v230);
      if (v231)
        CFRelease(v231);
      v221 = v257;
      if (v232)
        CFRelease(v232);
    }
    if (v226)
      CFArrayAppendValue(theArray, v226);
    if (v225)
      CFRelease(v225);
    if (v221)
      CFRelease(v221);
    if (v226)
      CFRelease(v226);
LABEL_279:
    ++v178;
    v181 += 24;
  }
  while (v178 != 4);
  MEMORY[0x22E31661C](*(_QWORD *)(v157 + 992));
  v233 = v247;
  CFDictionaryAddValue(v247, (const void *)*MEMORY[0x24BE10460], theArray);
  if (theArray)
    CFRelease(theArray);
  v234 = v255;
  if (v258)
    CFRelease(v258);
  v235 = pixelBufferOut;
  if (!pixelBufferOut)
    goto LABEL_315;
  v236 = CMBaseObjectGetDerivedStorage();
  memset(&valuePtr, 0, sizeof(valuePtr));
  if (!*(_QWORD *)v236)
    goto LABEL_314;
  v237 = v236;
  lhs.a = 0.0;
  if (!*(_BYTE *)(v236 + 48))
  {
    if (!*(_BYTE *)(v236 + 1209))
    {
      *(_QWORD *)&lhs.a = v253;
      goto LABEL_304;
    }
    SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0);
    if (!(_DWORD)SampleTimingInfoArray)
    {
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 1u, 0, 0, 0, 0, 1, &valuePtr, 0, 0, (CMSampleBufferRef *)&lhs);
      goto LABEL_304;
    }
    goto LABEL_335;
  }
  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v253, 1, &valuePtr, 0);
  if ((_DWORD)SampleTimingInfoArray)
  {
LABEL_335:
    v21 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    FigDebugAssert3();
    v234 = v255;
    v233 = v247;
    goto LABEL_316;
  }
  time2.a = 0.0;
  v239 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v235, (CMVideoFormatDescriptionRef *)&time2)|| (v240 = 1, CMSampleBufferCreateForImageBuffer(v239, v235, 1u, 0, 0, *(CMVideoFormatDescriptionRef *)&time2.a, &valuePtr, (CMSampleBufferRef *)&lhs)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v240 = 0;
  }
  if (*(_QWORD *)&time2.a)
    CFRelease(*(CFTypeRef *)&time2.a);
  if (v240)
    CMPropagateAttachments(v253, *(CMAttachmentBearerRef *)&lhs.a);
LABEL_304:
  a = lhs.a;
  if (v247)
  {
    CMSetAttachment(*(CMAttachmentBearerRef *)&lhs.a, v248, v247, 1u);
    a = lhs.a;
  }
  v234 = v255;
  if (a != 0.0)
  {
    if (*(_BYTE *)(v237 + 1209))
      v245 = 0;
    else
      v245 = *(_BYTE *)(v237 + 48) == 0;
    v246 = CMBaseObjectGetDerivedStorage();
    if (*(_QWORD *)v246)
      (*(void (**)(_QWORD, _QWORD, CGFloat))v246)(*(_QWORD *)(v246 + 8), 0, COERCE_CGFLOAT(*(_QWORD *)&a));
    if (!v245)
      CFRelease(*(CFTypeRef *)&a);
  }
LABEL_314:
  CFRelease(pixelBufferOut);
  pixelBufferOut = 0;
LABEL_315:
  v21 = 0;
  *(_OWORD *)(v234 + 88) = *(_OWORD *)(v234 + 64);
  *(_QWORD *)(v234 + 104) = *(_QWORD *)(v234 + 80);
LABEL_316:
  ++*(_DWORD *)(v234 + 60);
  if (v233)
    CFRelease(v233);
LABEL_318:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  return v21;
}

uint64_t sbp_bcs_finishPendingProcessing()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16))
    return FigSignalErrorAt();
  dispatch_group_wait(*(dispatch_group_t *)(DerivedStorage + 1008), 0xFFFFFFFFFFFFFFFFLL);
  return 0;
}

uint64_t sbp_bcs_purgeResources()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16))
    return FigSignalErrorAt();
  if (*(_QWORD *)(DerivedStorage + 1024))
    MRCContextPurge();
  return 0;
}

uint64_t ensurePyramidArray(CVPixelBufferRef pixelBuffer, int *a2, OSType *a3, CFMutableArrayRef *a4)
{
  uint64_t v4;
  CFMutableArrayRef *v7;
  OSType *v8;
  CFMutableArrayRef Mutable;
  OSType v10;
  int v11;
  int v12;
  int Width;
  OSType PixelFormatType;
  OSType v15;
  float v16;
  signed int v17;
  signed int v18;
  unint64_t v22;
  const void *v23;
  const __CFAllocator *v24;
  float v25;
  unsigned int v26;
  __CFDictionary *v28;
  __CFDictionary *IOSurfacePropertiesDictionary;
  float v30;
  float v31;
  signed int v32;
  signed int v33;
  BOOL v36;
  int v38;
  CFMutableArrayRef *v39;
  OSType *v40;
  int Height;
  const void *v42;
  const void *v43;
  CVPixelBufferRef pixelBufferOut;

  v4 = 4294954516;
  if (a3)
  {
    if (a2)
    {
      if (pixelBuffer)
      {
        v7 = a4;
        if (a4)
        {
          v8 = a3;
          Mutable = *a4;
          v10 = *a3;
          v11 = *a2;
          v12 = a2[1];
          Width = CVPixelBufferGetWidth(pixelBuffer);
          Height = CVPixelBufferGetHeight(pixelBuffer);
          PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
          v15 = PixelFormatType;
          if (Mutable)
          {
            if (v11 == Width && v12 == Height && v10 == PixelFormatType)
            {
              v15 = v10;
              Width = v11;
              Height = v12;
LABEL_46:
              v4 = 0;
              *v7 = Mutable;
              *v8 = v15;
              *a2 = Width;
              a2[1] = Height;
              return v4;
            }
            CFRelease(Mutable);
          }
          Mutable = CFArrayCreateMutable(0, 1, MEMORY[0x24BDBD690]);
          v16 = (float)Width;
          v17 = ((int)(float)((float)((float)Height * 0.5) + 0.5) + 15) & 0xFFFFFFF0;
          v18 = ((int)(float)((float)((float)Width * 0.5) + 0.5) + 15) & 0xFFFFFFF0;
          if (v18 < 1 || v17 < 1 || v18 >= Width || v17 >= Height)
            goto LABEL_46;
          v38 = Width;
          v39 = v7;
          v40 = v8;
          v22 = 0;
          v23 = (const void *)*MEMORY[0x24BDC5668];
          v43 = (const void *)*MEMORY[0x24BDC5688];
          v42 = (const void *)*MEMORY[0x24BDBD270];
          v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v25 = 2.0;
          while (1)
          {
            if (v18 >= v17)
              v26 = v17;
            else
              v26 = v18;
            if (v26 < 0x140 || v22 > 1)
            {
LABEL_45:
              v7 = v39;
              v8 = v40;
              Width = v38;
              goto LABEL_46;
            }
            pixelBufferOut = 0;
            v28 = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(0);
            CFDictionaryAddValue(v28, v23, IOSurfacePropertiesDictionary);
            CFRelease(IOSurfacePropertiesDictionary);
            if (FigCapturePlatformIOSurfaceWiringAssertionEnabled())
              CFDictionaryAddValue(v28, v43, v42);
            v4 = CVPixelBufferCreate(v24, v18, v17, v15, v28, &pixelBufferOut);
            CFRelease(v28);
            if ((_DWORD)v4)
              break;
            CFArrayInsertValueAtIndex(Mutable, v22, pixelBufferOut);
            if (pixelBufferOut)
            {
              CFRelease(pixelBufferOut);
              pixelBufferOut = 0;
            }
            v25 = v25 + v25;
            ++v22;
            v30 = (float)((float)Height / v25) + 0.5;
            v31 = (float)(v16 / v25) + 0.5;
            v32 = ((int)v30 + 15) & 0xFFFFFFF0;
            v33 = ((int)v31 + 15) & 0xFFFFFFF0;
            v36 = v33 >= 1 && v32 >= 1 && v33 < v18 && v32 < v17;
            v18 = ((int)v31 + 15) & 0xFFFFFFF0;
            v17 = ((int)v30 + 15) & 0xFFFFFFF0;
            if (!v36)
              goto LABEL_45;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
  return v4;
}

void detectBarcodesInFrame(uint64_t a1)
{
  uint64_t DerivedStorage;
  size_t Width;
  size_t Height;
  float v5;
  __CVBuffer *v6;
  _BOOL4 IsEmpty;
  float v8;
  float v9;
  int v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  char v20;
  OpaqueVTPixelTransferSession *v21;
  const __CFArray *v22;
  CFIndex v23;
  __CVBuffer *v24;
  __CVBuffer *ValueAtIndex;
  const void *v26;
  void *v27;
  CFArrayRef v28;
  CFArrayRef v29;
  const __CFAllocator *v30;
  float *v31;
  __CFArray *v32;
  char v33;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v35;
  CFDictionaryRef v36;
  const __CFDictionary *v37;
  uint64_t v38;
  const void *v39;
  const void *v40;
  int DescriptorCount;
  void **v42;
  uint64_t v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  uint64_t v48;
  int v49;
  const __CFDictionary *v50;
  const void *Value;
  const __CFNumber *v52;
  const void *v53;
  int Count;
  unsigned int v55;
  CFIndex v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v65;
  const __CFDictionary *v66;
  const __CFArray *v67;
  const void *v68;
  const void *v69;
  const void *v70;
  CFIndex v71;
  CGPoint *v72;
  const __CFDictionary *v73;
  uint64_t v74;
  double v75;
  double v76;
  const double *v77;
  float64x2_t v78;
  uint64_t v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  float v86;
  double v87;
  const void *v88;
  const void *v89;
  int *v91;
  int v92;
  CFIndex v93;
  int v94;
  const __CFDictionary *v95;
  const __CFArray *v96;
  const void *v97;
  CFIndex v98;
  CGPoint *v99;
  const __CFDictionary *v100;
  float v101;
  void *v102;
  float v103;
  int v104;
  int v105;
  uint64_t v106;
  CFIndex v107;
  float v108;
  float v109;
  int v110;
  float *v111;
  float v112;
  float v113;
  const __CFDictionary *v114;
  const __CFArray *v115;
  const void *v116;
  CFIndex v117;
  CGPoint *v118;
  const __CFDictionary *v119;
  const void *v120;
  const __CFArray *v121;
  _BOOL4 v122;
  unsigned int v123;
  float64x2_t v124;
  const void *v125;
  uint64_t v126;
  int v127;
  int v128;
  BOOL v129;
  void *v130;
  const void *v131;
  CFDictionaryRef cf;
  void *v133;
  void *v134;
  int v135;
  uint64_t v136;
  void *v137;
  void *key;
  unint64_t keya;
  __CFArray *theArray;
  CMTime time2;
  CFTypeRef v142;
  _BYTE time1[32];
  __int128 v144;
  __int128 v145;
  void *values[2];
  void *keys[4];
  float64x2x2_t v148;
  CGRect v149;

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v142 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 1000));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 1000));
  v5 = *(float *)(DerivedStorage + 1204);
  v6 = *(__CVBuffer **)(DerivedStorage + 1000);
  *(_QWORD *)(DerivedStorage + 1000) = 0;
  MEMORY[0x22E316610](*(_QWORD *)(DerivedStorage + 1064));
  IsEmpty = CGRectIsEmpty(*(CGRect *)(DerivedStorage + 1032));
  if (IsEmpty)
    goto LABEL_21;
  v8 = (float)Width;
  v9 = (float)Height;
  v10 = (int)(float)Width;
  v135 = (int)(float)Height;
  v11 = transformInterestRect(*(CGFloat *)(DerivedStorage + 1032), *(CGFloat *)(DerivedStorage + 1040), *(CGFloat *)(DerivedStorage + 1048), *(CGFloat *)(DerivedStorage + 1056), a1, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  MEMORY[0x22E31661C](*(_QWORD *)(DerivedStorage + 1064));
  v18 = v15 <= v17 ? v17 : v15;
  v19 = v18;
  if (v19 >= 1280.0 || *(_DWORD *)(DerivedStorage + 168))
  {
    if (ensurePyramidArray(v6, (int *)(DerivedStorage + 176), (OSType *)(DerivedStorage + 172), (CFMutableArrayRef *)(DerivedStorage + 184)))
    {
      v20 = 1;
    }
    else
    {
      v21 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 40);
      v20 = 1;
      if (v21)
      {
        if (v6)
        {
          v22 = *(const __CFArray **)(DerivedStorage + 184);
          if (v22)
          {
            if (CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 184)) >= 1)
            {
              v127 = v10;
              v23 = 0;
              v24 = v6;
              while (1)
              {
                ValueAtIndex = (__CVBuffer *)CFArrayGetValueAtIndex(v22, v23);
                if (VTPixelTransferSessionTransferImage(v21, v24, ValueAtIndex))
                  break;
                ++v23;
                v24 = ValueAtIndex;
                if (CFArrayGetCount(v22) <= v23)
                  goto LABEL_16;
              }
              fig_log_get_emitter();
              FigDebugAssert3();
LABEL_16:
              v20 = 1;
              v10 = v127;
            }
          }
        }
      }
    }
  }
  else
  {
    v20 = 0;
  }
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 1016), (const void *)*MEMORY[0x24BE7BDA0]))
  {
LABEL_21:
    v31 = 0;
    v32 = 0;
    v33 = 1;
    goto LABEL_44;
  }
  v26 = (const void *)MRCDecoderCreateWithOptions();
  v27 = (void *)*MEMORY[0x24BE7BDF8];
  keys[0] = *(void **)MEMORY[0x24BE7BDF0];
  keys[1] = v27;
  if ((v20 & 1) != 0)
  {
    v28 = 0;
    v29 = *(CFArrayRef *)(DerivedStorage + 184);
    v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  }
  else
  {
    v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v28 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD690]);
    v29 = v28;
  }
  v149.origin.x = v11;
  v149.origin.y = v13;
  v149.size.width = v15;
  v149.size.height = v17;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v149);
  values[0] = v29;
  values[1] = DictionaryRepresentation;
  v35 = CFDictionaryCreate(v30, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (DictionaryRepresentation)
  {
    v36 = DictionaryRepresentation;
    v37 = v35;
    CFRelease(v36);
    v35 = v37;
  }
  cf = v35;
  v38 = MRCSampleCreateWithCVPixelBufferAndAttributes();
  v39 = (const void *)v38;
  v129 = v38 == 0;
  if (v26 && v38)
  {
    v33 = 1;
    v136 = MRCDecoderDecodeSample();
    if (!v136 || v142)
    {
      v31 = 0;
      v32 = 0;
      goto LABEL_35;
    }
    CVPixelBufferRelease(v6);
    MEMORY[0x22E316610](*(_QWORD *)(DerivedStorage + 992));
    *(_DWORD *)(DerivedStorage + 988) = 0;
    *(_OWORD *)time1 = *(_OWORD *)(DerivedStorage + 964);
    *(_QWORD *)&time1[16] = *(_QWORD *)(DerivedStorage + 980);
    time2 = *(CMTime *)(DerivedStorage + 1148);
    if (CMTimeCompare((CMTime *)time1, &time2) > 0)
    {
      v31 = 0;
      v6 = 0;
      v32 = 0;
      v33 = 0;
LABEL_35:
      v40 = (const void *)v136;
      goto LABEL_36;
    }
    v126 = a1;
    v122 = IsEmpty;
    DescriptorCount = MRCDecoderResultGetDescriptorCount();
    theArray = CFArrayCreateMutable(v30, 4, MEMORY[0x24BDBD690]);
    v42 = (void **)MEMORY[0x24BE7BDD0];
    v131 = v39;
    v128 = v10;
    v120 = v26;
    v121 = v28;
    if (DescriptorCount >= 1)
    {
      v43 = 0;
      v44 = (const void *)*MEMORY[0x24BE7BDD0];
      v45 = (const void *)*MEMORY[0x24BE7BE08];
      v46 = (const void *)*MEMORY[0x24BE7BE80];
      v47 = (const void *)*MEMORY[0x24BE7BE48];
      key = (void *)*MEMORY[0x24BE7BDB8];
      v48 = DescriptorCount;
      v49 = -1;
      while (1)
      {
        MRCDecoderResultGetDescriptorAtIndex();
        v50 = (const __CFDictionary *)MRCDescriptorCopyAttributes();
        Value = CFDictionaryGetValue(v50, v44);
        if (!CFEqual(Value, v45) && !CFEqual(Value, v46) && !CFEqual(Value, v47))
          break;
        CFArrayAppendValue(theArray, v50);
        if (v50)
          goto LABEL_61;
LABEL_62:
        if (v48 == ++v43)
        {
          v26 = v120;
          v28 = v121;
          v39 = v131;
          v42 = (void **)MEMORY[0x24BE7BDD0];
          if (v49 != -1)
          {
            MRCDecoderResultGetDescriptorAtIndex();
            v53 = (const void *)MRCDescriptorCopyAttributes();
            CFArrayAppendValue(theArray, v53);
            if (v53)
              CFRelease(v53);
          }
          goto LABEL_71;
        }
      }
      v52 = (const __CFNumber *)CFDictionaryGetValue(v50, key);
      *(_DWORD *)time1 = 0;
      CFNumberGetValue(v52, kCFNumberFloat32Type, time1);
      if (*(float *)time1 > v5)
      {
        v5 = *(float *)time1;
        v49 = v43;
      }
      if (!v50)
        goto LABEL_62;
LABEL_61:
      CFRelease(v50);
      goto LABEL_62;
    }
LABEL_71:
    v32 = theArray;
    if (theArray && (Count = CFArrayGetCount(theArray), v55 = Count, Count >= 1))
    {
      v137 = malloc_type_malloc(4 * Count, 0x100004052888210uLL);
      bzero(v137, 4 * v55);
      v56 = 0;
      v134 = (void *)*MEMORY[0x24BE7BDC0];
      v130 = (void *)*MEMORY[0x24BE7BDC8];
      v133 = *v42;
      v57 = *MEMORY[0x24BDBEFB0];
      v58 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v59 = (float)((float)(v8 + v9) * 0.5);
      v60 = v59 / 40.0;
      keya = v55;
      v123 = v55;
      __asm { FMOV            V2.2D, #0.25 }
      v65 = v59 / 10.0;
      v124 = _Q2;
      do
      {
        v66 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v56);
        v67 = (const __CFArray *)CFDictionaryGetValue(v66, v134);
        v68 = CFDictionaryGetValue(v66, v130);
        v69 = CFDictionaryGetValue(v66, v133);
        if (v68 && (v70 = v69) != 0 && v67)
        {
          v71 = 0;
          *(_OWORD *)time1 = *MEMORY[0x24BDBEFB0];
          *(_OWORD *)&time1[16] = *(_OWORD *)time1;
          v144 = *(_OWORD *)time1;
          v145 = *(_OWORD *)time1;
          v72 = (CGPoint *)time1;
          do
          {
            v73 = (const __CFDictionary *)CFArrayGetValueAtIndex(v67, v71);
            CGPointMakeWithDictionaryRepresentation(v73, v72);
            ++v71;
            ++v72;
          }
          while (v71 != 4);
          v74 = 0;
          v75 = v58;
          v76 = v57;
          do
          {
            v77 = (const double *)&time1[v74];
            v148 = vld2q_f64(v77);
            v78 = vmulq_f64(v148.val[0], v124);
            v148.val[0] = vmulq_f64(v148.val[1], v124);
            v75 = v75 + v148.val[0].f64[0] + v148.val[0].f64[1];
            v76 = v76 + v78.f64[0] + v78.f64[1];
            v74 += 32;
          }
          while (v74 != 64);
          v79 = 0;
          v80 = v76 - *(float *)(DerivedStorage + 160);
          v81 = v75 - *(float *)(DerivedStorage + 164);
          v82 = DerivedStorage;
          v39 = v131;
          while (1)
          {
            if (*(_DWORD *)(DerivedStorage + 192 * v79 + 352) && !*(_BYTE *)(DerivedStorage + v79 + 988))
            {
              v83 = 0;
              v84 = v58;
              v85 = v57;
              do
              {
                v85 = v85 + *(double *)(v82 + v83 + 264);
                v84 = v84 + *(double *)(v82 + v83 + 272);
                v83 += 16;
              }
              while (v83 != 64);
              v86 = (v81 - v84 * 0.25) * (v81 - v84 * 0.25) + (v80 - v85 * 0.25) * (v80 - v85 * 0.25);
              v87 = sqrtf(v86);
              if (v60 > v87)
                break;
              v88 = *(const void **)(DerivedStorage + 192 * v79 + 328);
              if (v88)
              {
                if (CFEqual(v68, v88))
                {
                  v89 = *(const void **)(DerivedStorage + 192 * v79 + 336);
                  if (v89)
                  {
                    if (CFEqual(v70, v89))
                    {
                      _ZF = *(int *)(DerivedStorage + 960) < 2 && v123 == 1;
                      if (_ZF || v65 > v87)
                        break;
                    }
                  }
                }
              }
            }
            ++v79;
            v82 += 192;
            if (v79 == 4)
            {
              v79 = 0;
              v91 = (int *)(DerivedStorage + 352);
              while (1)
              {
                v92 = *v91;
                v91 += 48;
                if (!v92)
                  goto LABEL_98;
                if (++v79 == 4)
                  goto LABEL_102;
              }
            }
          }
LABEL_98:
          *((_DWORD *)v137 + v56) = -1082130432;
          copyBarcodeToStorage(v126, v79, 1, (uint64_t)time1, v70, v68, v66);
          *(float *)(DerivedStorage + 192 * v79 + 380) = computeBarcodePriority(v70, (uint64_t)time1, v128, v135);
          *(_BYTE *)(DerivedStorage + v79 + 988) = 1;
        }
        else
        {
          *((_DWORD *)v137 + v56) = -1082130432;
        }
LABEL_102:
        ++v56;
      }
      while (v56 != keya);
      v93 = 0;
      v94 = 1;
      IsEmpty = v122;
      v32 = theArray;
      do
      {
        if (*((float *)v137 + v93) != -1.0)
        {
          v95 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v93);
          v96 = (const __CFArray *)CFDictionaryGetValue(v95, v134);
          v97 = CFDictionaryGetValue(v95, v133);
          v98 = 0;
          v99 = (CGPoint *)time1;
          do
          {
            v100 = (const __CFDictionary *)CFArrayGetValueAtIndex(v96, v98);
            CGPointMakeWithDictionaryRepresentation(v100, v99);
            ++v98;
            ++v99;
          }
          while (v98 != 4);
          v101 = computeBarcodePriority(v97, (uint64_t)time1, v128, v135);
          v94 = 0;
          *((float *)v137 + v93) = v101;
          v39 = v131;
        }
        ++v93;
      }
      while (v93 != keya);
      if (v94)
      {
        v6 = 0;
        v26 = v120;
        v28 = v121;
        v40 = (const void *)v136;
        v31 = (float *)v137;
      }
      else
      {
        v102 = 0;
        v103 = 5.0;
        v104 = -1;
        v105 = -1;
        v31 = (float *)v137;
        while (1)
        {
          do
          {
            if (v31[(_QWORD)v102] >= 0.0 && v31[(_QWORD)v102] < v103)
            {
              v104 = (int)v102;
              v105 = (int)v102;
              v103 = v31[(_QWORD)v102];
            }
            v102 = (char *)v102 + 1;
          }
          while (v102 != (void *)keya);
          if (v105 == -1)
            break;
          v106 = 0;
          v107 = v104;
          v108 = v31[v104];
          v109 = 5.0;
          v110 = -1;
          v111 = (float *)(DerivedStorage + 380);
          do
          {
            v112 = *v111;
            v111 += 48;
            v113 = v112;
            if (v112 < v109 && v112 < v108)
            {
              v109 = v113;
              v110 = v106;
            }
            ++v106;
          }
          while (v106 != 4);
          if (v110 != -1)
          {
            v114 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v107);
            v115 = (const __CFArray *)CFDictionaryGetValue(v114, v134);
            v125 = CFDictionaryGetValue(v114, v130);
            v116 = CFDictionaryGetValue(v114, v133);
            v117 = 0;
            v118 = (CGPoint *)time1;
            do
            {
              v119 = (const __CFDictionary *)CFArrayGetValueAtIndex(v115, v117);
              CGPointMakeWithDictionaryRepresentation(v119, v118);
              ++v117;
              ++v118;
            }
            while (v117 != 4);
            copyBarcodeToStorage(v126, v110, 0, (uint64_t)time1, v116, v125, v114);
            *(float *)(DerivedStorage + 192 * v110 + 380) = computeBarcodePriority(v116, (uint64_t)time1, v128, v135);
            *(_BYTE *)(DerivedStorage + v110 + 988) = 1;
            v39 = v131;
            v31 = (float *)v137;
          }
          v102 = 0;
          v31[v107] = -1.0;
          v103 = 5.0;
          v104 = -1;
          v105 = -1;
        }
        v6 = 0;
        IsEmpty = v122;
        v26 = v120;
        v28 = v121;
        v40 = (const void *)v136;
        v32 = theArray;
      }
    }
    else
    {
      v6 = 0;
      v31 = 0;
      IsEmpty = v122;
      v40 = (const void *)v136;
    }
  }
  else
  {
    v40 = 0;
    v32 = 0;
    v31 = 0;
  }
  if (!v26)
  {
    v33 = 1;
    if (!v28)
      goto LABEL_38;
    goto LABEL_37;
  }
  v33 = v129;
LABEL_36:
  CFRelease(v26);
  if (v28)
LABEL_37:
    CFRelease(v28);
LABEL_38:
  if (cf)
    CFRelease(cf);
  if (v39)
    CFRelease(v39);
  if (v40)
    CFRelease(v40);
LABEL_44:
  if (v142)
    CFRelease(v142);
  if (v32)
    CFRelease(v32);
  if ((v33 & 1) == 0)
    MEMORY[0x22E31661C](*(_QWORD *)(DerivedStorage + 992));
  if (IsEmpty)
    MEMORY[0x22E31661C](*(_QWORD *)(DerivedStorage + 1064));
  CVPixelBufferRelease(v6);
  free(v31);
}

CGFloat transformInterestRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  uint64_t DerivedStorage;
  int v12;
  float v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  float v34;
  float v35;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v12 = *(_DWORD *)(DerivedStorage + 52);
  if (v12)
  {
    v13 = (double)v12 * 3.14159265 / 180.0;
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v40.origin.x = a1;
    v40.origin.y = a2;
    v40.size.width = a3;
    v40.size.height = a4;
    v41 = CGRectApplyAffineTransform(v40, &v39);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    CGAffineTransformMakeRotation(&v38, v13);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v43 = CGRectApplyAffineTransform(v42, &v38);
    v18 = v43.origin.x;
    v19 = v43.origin.y;
    v20 = v43.size.width;
    v21 = v43.size.height;
    CGAffineTransformMakeTranslation(&v37, 0.5, 0.5);
    v44.origin.x = v18;
    v44.origin.y = v19;
    v44.size.width = v20;
    v44.size.height = v21;
    v45 = CGRectApplyAffineTransform(v44, &v37);
    a1 = v45.origin.x;
    a2 = v45.origin.y;
    a3 = v45.size.width;
    a4 = v45.size.height;
  }
  if (*(_BYTE *)(DerivedStorage + 56))
  {
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v46.origin.x = a1;
    v46.origin.y = a2;
    v46.size.width = a3;
    v46.size.height = a4;
    v47 = CGRectApplyAffineTransform(v46, &v39);
    v22 = v47.origin.x;
    v23 = v47.origin.y;
    v24 = v47.size.width;
    v25 = v47.size.height;
    v26 = -1.0;
    v27 = 1.0;
LABEL_7:
    CGAffineTransformMakeScale(&v38, v26, v27);
    v50.origin.x = v22;
    v50.origin.y = v23;
    v50.size.width = v24;
    v50.size.height = v25;
    v51 = CGRectApplyAffineTransform(v50, &v38);
    v28 = v51.origin.x;
    v29 = v51.origin.y;
    v30 = v51.size.width;
    v31 = v51.size.height;
    CGAffineTransformMakeTranslation(&v37, 0.5, 0.5);
    v52.origin.x = v28;
    v52.origin.y = v29;
    v52.size.width = v30;
    v52.size.height = v31;
    v53 = CGRectApplyAffineTransform(v52, &v37);
    a1 = v53.origin.x;
    a2 = v53.origin.y;
    a3 = v53.size.width;
    a4 = v53.size.height;
    goto LABEL_8;
  }
  if (*(_BYTE *)(DerivedStorage + 57))
  {
    CGAffineTransformMakeTranslation(&v39, -0.5, -0.5);
    v48.origin.x = a1;
    v48.origin.y = a2;
    v48.size.width = a3;
    v48.size.height = a4;
    v49 = CGRectApplyAffineTransform(v48, &v39);
    v22 = v49.origin.x;
    v23 = v49.origin.y;
    v24 = v49.size.width;
    v25 = v49.size.height;
    v26 = 1.0;
    v27 = -1.0;
    goto LABEL_7;
  }
LABEL_8:
  v32 = *(double *)(DerivedStorage + 136);
  if (v32 != 0.0)
  {
    v33 = *(double *)(DerivedStorage + 144);
    if (v33 != 0.0)
    {
      v34 = v32;
      v35 = v33;
      v39.b = 0.0;
      v39.c = 0.0;
      v39.a = v34;
      v39.d = v35;
      v39.tx = (1.0 - v34) * 0.5;
      v39.ty = (1.0 - v35) * 0.5;
      v54.origin.x = a1;
      v54.origin.y = a2;
      v54.size.width = a3;
      v54.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v54, &v39);
    }
  }
  return a1 * (double)a6;
}

CFTypeRef copyBarcodeToStorage(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, const void *a6, const void *a7)
{
  uint64_t DerivedStorage;
  uint64_t v14;
  uint64_t i;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  const void *v24;
  _QWORD *v25;
  CFTypeRef v26;
  CFTypeRef v27;
  CFTypeRef result;
  int v29;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v14 = DerivedStorage;
  if (a3 && *(_DWORD *)(DerivedStorage + 192 * a2 + 352))
  {
    for (i = 0; i != 64; i += 16)
      *(_OWORD *)(DerivedStorage + 192 * a2 + i + 192) = *(_OWORD *)(DerivedStorage + 192 * a2 + i + 264);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
  v18 = DerivedStorage + 192 * a2;
  *(_BYTE *)(v18 + 256) = v16;
  do
  {
    *(_OWORD *)(v18 + 264 + v17) = *(_OWORD *)(a4 + v17);
    v17 += 16;
  }
  while (v17 != 64);
  v19 = DerivedStorage + 192 * a2;
  v20 = *(const void **)(v19 + 328);
  if (v20)
    CFRelease(v20);
  v21 = v14 + 192 * a2;
  v22 = *(const void **)(v21 + 336);
  if (v22)
    CFRelease(v22);
  v23 = v14 + 192 * a2;
  v24 = *(const void **)(v23 + 344);
  if (v24)
    CFRelease(v24);
  v25 = (_QWORD *)(v19 + 328);
  if (a6)
    v26 = CFRetain(a6);
  else
    v26 = 0;
  *v25 = v26;
  if (a5)
    v27 = CFRetain(a5);
  else
    v27 = 0;
  *(_QWORD *)(v21 + 336) = v27;
  if (a7)
    result = CFRetain(a7);
  else
    result = 0;
  *(_QWORD *)(v23 + 344) = result;
  v29 = *(_DWORD *)(v14 + 1072) + 1;
  *(_DWORD *)(v14 + 1072) = v29;
  *(_DWORD *)(v14 + 192 * a2 + 352) = v29;
  return result;
}

float computeBarcodePriority(const void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8;
  int v10;
  int64x2_t v11;
  float64x2_t v12;
  float32x2_t v17;
  float64x2_t v19;
  float64x2_t v20;
  int8x8_t v21;
  float32x2_t v23;

  if (!CFEqual(a1, (CFTypeRef)*MEMORY[0x24BE7BE08])
    && !CFEqual(a1, (CFTypeRef)*MEMORY[0x24BE7BE80])
    && !CFEqual(a1, (CFTypeRef)*MEMORY[0x24BE7BE48]))
  {
    return 3.0;
  }
  v8 = 0;
  if (a3)
    _ZF = a4 == 0;
  else
    _ZF = 1;
  v10 = !_ZF;
  v11.i64[0] = a3;
  v11.i64[1] = a4;
  v12 = vcvtq_f64_s64(v11);
  __asm { FMOV            V1.2S, #1.0 }
  v17 = 0;
  __asm { FMOV            V4.2D, #0.25 }
  v19 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  do
  {
    v20 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
    if (v10)
      v20 = vdivq_f64(*(float64x2_t *)(a2 + v8), v12);
    v21 = (int8x8_t)vcvt_f32_f64(v20);
    _D1 = (float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(vcvtq_f64_f32(_D1), v20)), v21, (int8x8_t)_D1);
    v17 = (float32x2_t)vbsl_s8((int8x8_t)vmovn_s64(vcgtq_f64(v20, vcvtq_f64_f32(v17))), v21, (int8x8_t)v17);
    v19 = vaddq_f64(v19, vmulq_f64(v20, _Q4));
    v8 += 16;
  }
  while (v8 != 64);
  __asm { FMOV            V0.2D, #-0.5 }
  *(float32x2_t *)&_Q0.f64[0] = vcvt_f32_f64(vaddq_f64(v19, _Q0));
  v23 = vsub_f32(v17, _D1);
  return 1.0
       - sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&_Q0.f64[0], *(float32x2_t *)&_Q0.f64[0])))
       + vmul_lane_f32(v23, v23, 1).f32[0];
}

void clearBarcodes()
{
  uint64_t DerivedStorage;
  uint64_t i;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  MEMORY[0x22E316610](*(_QWORD *)(DerivedStorage + 992));
  for (i = 0; i != 768; i += 192)
    *(_DWORD *)(DerivedStorage + 352 + i) = 0;
  if ((*(_BYTE *)(DerivedStorage + 76) & 1) != 0)
  {
    *(_OWORD *)(DerivedStorage + 964) = *(_OWORD *)(DerivedStorage + 64);
    *(_QWORD *)(DerivedStorage + 980) = *(_QWORD *)(DerivedStorage + 80);
  }
  JUMPOUT(0x22E31661CLL);
}

size_t FigDraw420Color(__CVBuffer *a1, int a2, int a3, char a4, char a5, char a6)
{
  OSType PixelFormatType;
  size_t result;
  size_t v13;
  size_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v22 = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  result = CVPixelBufferGetPlaneCount(a1);
  v13 = result;
  if (result)
  {
    v14 = 0;
    do
    {
      *(&v24 + v14) = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(a1, v14);
      result = CVPixelBufferGetBytesPerRowOfPlane(a1, v14);
      *((_DWORD *)&v22 + v14++) = result;
    }
    while (v13 != v14);
  }
  if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
  {
    if (v13 != 2)
      return result;
    v19 = HIDWORD(v22);
    v17 = v25;
    *(_BYTE *)(v24 + a2 + (int)v22 * (uint64_t)a3) = a4;
    v20 = v19 * (uint64_t)(a3 >> 1);
    *(_BYTE *)(v17 + (a2 & 0xFFFFFFFFFFFFFFFELL) + v20) = a5;
    v18 = v20 + (a2 | 1);
    goto LABEL_11;
  }
  if (PixelFormatType == 2033463856 && v13 == 3)
  {
    v15 = HIDWORD(v22);
    v16 = v25;
    *(_BYTE *)(v24 + a2 + (int)v22 * (uint64_t)a3) = a4;
    *(_BYTE *)(v16 + v15 * (a3 >> 1) + (a2 >> 1)) = a5;
    v17 = v26;
    v18 = v23 * (a3 >> 1) + (a2 >> 1);
LABEL_11:
    *(_BYTE *)(v17 + v18) = a6;
  }
  return result;
}

uint64_t FigDraw420Line(__CVBuffer *a1, int a2, int a3, int a4, int a5, char a6, char a7, char a8)
{
  int WidthOfPlane;
  int HeightOfPlane;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  float v26;
  float v27;
  int v28;
  int v29;

  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  if (!a1
    || (a3 | a2) < 0
    || WidthOfPlane <= a2
    || (a5 | a4) < 0
    || HeightOfPlane <= a3
    || WidthOfPlane <= a4
    || HeightOfPlane <= a5)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (a2 >= a4)
      v18 = a4;
    else
      v18 = a2;
    v19 = v18 & ~(v18 >> 31);
    if (a2 <= a4)
      v20 = a4;
    else
      v20 = a2;
    if (v20 >= WidthOfPlane)
      v20 = WidthOfPlane - 1;
    if (a3 >= a5)
      v21 = a5;
    else
      v21 = a3;
    if (a3 <= a5)
      v22 = a5;
    else
      v22 = a3;
    if (v22 >= HeightOfPlane)
      v22 = HeightOfPlane - 1;
    if (a5 == a3)
    {
      if (v20 >= v19)
      {
        v23 = v20 + 1;
        do
          FigDraw420Color(a1, v19++, a3, a6, a7, a8);
        while (v23 != v19);
      }
    }
    else
    {
      v24 = v21 & ~(v21 >> 31);
      if (a4 == a2)
      {
        if (v22 >= v24)
        {
          v25 = v22 + 1;
          do
            FigDraw420Color(a1, a2, v24++, a6, a7, a8);
          while (v25 != v24);
        }
      }
      else
      {
        v26 = (float)(a5 - a3) / (float)(a4 - a2);
        v27 = (float)((float)(a5 + a3) - (float)(v26 * (float)(a4 + a2))) * 0.5;
        if (v22 - v24 <= v20 - v19)
        {
          if (v20 >= v19)
          {
            v29 = v20 + 1;
            do
            {
              FigDraw420Color(a1, v19, (int)((float)(v27 + (float)(v26 * (float)v19)) + 0.5), a6, a7, a8);
              ++v19;
            }
            while (v29 != v19);
          }
        }
        else if (v22 >= v24)
        {
          v28 = v22 + 1;
          do
          {
            FigDraw420Color(a1, (int)((float)((float)((float)v24 - v27) / v26) + 0.5), v24, a6, a7, a8);
            ++v24;
          }
          while (v28 != v24);
        }
      }
    }
    return 0;
  }
}

uint64_t FigDrawLumaRectangle(__CVBuffer *a1, int a2, int a3, int a4, int a5, int a6)
{
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  int WidthOfPlane;
  int HeightOfPlane;
  int v16;
  int v17;
  size_t v18;
  int v19;
  int v20;
  int v21;
  char *v22;
  int v23;
  char *v24;
  int v25;

  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  if (!a1
    || (a3 | a2) < 0
    || (v16 = WidthOfPlane - a2, WidthOfPlane <= a2)
    || a5 < 1
    || a4 < 1
    || (v17 = HeightOfPlane, HeightOfPlane <= a3))
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (v16 >= a4)
      v16 = a4;
    v18 = v16;
    memset(&BaseAddressOfPlane[BytesPerRowOfPlane * a3 + a2], a6, v16);
    v19 = a5 + a3;
    if (v19 <= v17)
      memset(&BaseAddressOfPlane[BytesPerRowOfPlane * (v19 - 1) + a2], a6, v18);
    v20 = a3 + 1;
    if (v19 >= v17)
      v21 = v17;
    else
      v21 = v19;
    if (v20 < v21)
    {
      v22 = &BaseAddressOfPlane[a2 + BytesPerRowOfPlane * v20];
      v23 = ~a3 + v21;
      do
      {
        *v22 = a6;
        v22 += BytesPerRowOfPlane;
        --v23;
      }
      while (v23);
      if (a4 + a2 <= WidthOfPlane)
      {
        v24 = &BaseAddressOfPlane[a2 - 1 + BytesPerRowOfPlane * v20 + a4];
        v25 = ~a3 + v21;
        do
        {
          *v24 = a6;
          v24 += BytesPerRowOfPlane;
          --v25;
        }
        while (v25);
      }
    }
    return 0;
  }
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
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

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x24BDBEFA8](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x24BDC0258](source, destination);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0290](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x24BDC0348](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x24BDC06C8]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x24BDC0790]();
}

uint64_t FigCapturePlatformIOSurfaceWiringAssertionEnabled()
{
  return MEMORY[0x24BE10390]();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x24BDF8FB0]();
}

uint64_t FigCreatePixelBufferCacheModeArray()
{
  return MEMORY[0x24BDF8FC0]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x24BDC07F8]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x24BDC08A8]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x24BDDCE08]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x24BDC09E0]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x24BDC09F8]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x24BDC0A00]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x24BDC0A08]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x24BDC0A10]();
}

uint64_t MRCContextCreateWithOptions()
{
  return MEMORY[0x24BE7BD50]();
}

uint64_t MRCContextPreflightForDecoderUsingOptions()
{
  return MEMORY[0x24BE7BD58]();
}

uint64_t MRCContextPurge()
{
  return MEMORY[0x24BE7BD60]();
}

uint64_t MRCDecoderCreateWithOptions()
{
  return MEMORY[0x24BE7BD68]();
}

uint64_t MRCDecoderDecodeSample()
{
  return MEMORY[0x24BE7BD70]();
}

uint64_t MRCDecoderResultGetDescriptorAtIndex()
{
  return MEMORY[0x24BE7BDA8]();
}

uint64_t MRCDecoderResultGetDescriptorCount()
{
  return MEMORY[0x24BE7BDB0]();
}

uint64_t MRCDescriptorCopyAttributes()
{
  return MEMORY[0x24BE7BDD8]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x24BE7BDE0]();
}

uint64_t MRCDescriptorDecodePayload()
{
  return MEMORY[0x24BE7BDE8]();
}

uint64_t MRCSampleCreateWithCVPixelBufferAndAttributes()
{
  return MEMORY[0x24BE7BE00]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADDC0](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x24BDC0B30]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

